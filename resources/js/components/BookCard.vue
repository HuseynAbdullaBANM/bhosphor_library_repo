<template>
    <v-card
        class="d-flex flex-column pb-5"
        style="width: 90%; border-radius: 10px; height: 100%"
    >
        <v-img
            :src="data.image"
            :aspect-ratio="3 / 4"
            style="border-bottom: 1px solid grey"
        ></v-img>
        <v-card-title
            class="py-0 px-0 my-0 d-flex"
            style="word-break: break-word; line-height: 1.4rem; flex-grow: 1"
        >
            <v-card-title-text class="py-0 my-0 px-5 mt-2">
                {{ data.title }}
            </v-card-title-text> </v-card-title
        ><v-chip
            class="mx-5 mt-0 d-flex"
            color="#b5cfd8"
            style="color: white; width: fit-content"
            >{{ data.categories[0] }}</v-chip
        >
        <!-- <div class="d-flex flex-column px-5">
            <div class="d-flex" style="width: 100%">
                <div class="d-flex flex-column" style="width: 60%">
                    <p>Author: {{ data.author }}</p>
                    <p>Publisher: {{ data.publisher }}</p>
                </div>
                <div class="d-flex">
                    <v-card-actions>
                        <v-chip color="success">{{ data.status }}</v-chip>
                    </v-card-actions>
                </div>
            </div>
        </div> -->
        <div
            class="d-flex px-5 mt-2 flex-column"
            style="width: 100%; flex-grow: 1"
        >
            <p class="my-0 py-0">Author: {{ data.author }}</p>
            <p class="my-0 py-0">Publisher: {{ data.publisher }}</p>
        </div>
        <div class="d-flex px-5" style="width: 100%; flex-grow: 1">
            <div class="d-flex" style="">
                <v-chip
                    class="ml-auto"
                    :color="
                        data.status == 'BORROWED'
                            ? 'orange'
                            : data.status == 'LOST'
                            ? 'red'
                            : 'success'
                    "
                    style="width: fit-content; color: white; backgruond-transparency"
                    >{{ data.status }}</v-chip
                >
            </div>
        </div>
    </v-card>
</template>

<script>
import axios from "axios";
export default {
    props: {
        data: Object,
    },
    data() {
        return {
            loading: "true",
        };
    },
    methods: {
        // borrowBoook(id) {
        //     await axios.post("http://35.78.89.60:80borrow").then((res) => {
        //             if (res.status === 201) {
        //                 Vue.$toast.open({
        //                     message: "Book Returned.",
        //                     type: "success",
        //                     position: "top",
        //                 });
        //             }
        //         })
        // }
    },
};
</script>

<style></style>