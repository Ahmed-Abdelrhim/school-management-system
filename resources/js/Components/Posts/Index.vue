<template>
    <div>
        <table id="posts" >
            <thead>
            <tr>

                <th>ID</th>
                <th>Title</th>
                <th>Excerpt</th>
                <th>Description</th>
                <th>Min_To_Read</th>
                <!--                <th width="25%">Action</th>     -->
            </tr>
            </thead>
            <tbody>
            <tr v-for="post in posts">
                <td> {{ post.id }}</td>
                <td> {{ post.title }}</td>
                <td> {{ post.excerpt }}</td>
                <td> {{ post.description }}</td>
                <td> {{ post.min_to_read }}</td>
            </tr>
            </tbody>
        </table>

    </div>
</template>

<script>
export default {
    data() {
        return {
            posts: [],
        };
    },
    mounted() {
        axios.get('/api/get/users').then(response => {
            this.posts = response.data;
        });
    }
}
</script>
