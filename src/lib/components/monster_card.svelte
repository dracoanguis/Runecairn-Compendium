<script lang="ts">
	import { Card } from "flowbite-svelte";

    export let monster: Monster;

</script>


<Card>
    <h5>{monster.Name}</h5>
</Card>