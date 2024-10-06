export const createPatientPayload = (payload) => {
    return {
        first_name: payload.first_name, 
        last_name: payload.last_name,
        age: payload.age, 
        race: payload.race, 
        email: payload.email, 
        phone: JSON.stringify(payload.phone), 
        gender: payload.gender, 
    }
}

export const createInputDetailsPayload = (payload) => {
    return {
        disease: payload.disease, 
        sub_disease: payload.sub_disease,
        bio_markers: payload.bio_markers, 
        como: payload.como, 
        pathd: payload.pathd, 
        perf_stat: payload.perf_stat,
        age: payload.age,
        gender: payload.gender,
        race: payload.race
    }
} 

export const createInputOutputDetailMappingPayload = (patient, inputDetail) => {
  return {
        patient: {
            connect: {
                id: patient.id,
            }
        },
        input_detail: {
            connect: {
                id: inputDetail.id,
            }
        }
    }
} 