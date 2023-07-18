require('./bootstrap');

require('alpinejs');
import Vue from 'vue';

Vue.component('posts-index' ,require('./Components/Posts/Index.vue').default);


const app = new Vue({
    el: '#app'
});
