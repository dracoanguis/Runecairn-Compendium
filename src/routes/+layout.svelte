<script>
	import { NavBrand, NavHamburger, NavLi, NavUl, Navbar } from 'flowbite-svelte';
import '../app.pcss';

	let menu = [
		{name: "Monsters", href: "/monsters"},
		{name: "Items", href: "/items"},
	]
</script>

<Navbar>
	<NavBrand href="/">
		<!-- # Try putting this in gandur-new -->
		<span class="self-center whitespace-nowrap text-4xl font-bold font-serif dark:text-white">Runecairn</span>
		<span class="self-end whitespace-nowrap text-lg font-semibold dark:text-white">Compendium</span>
	</NavBrand>
	<NavUl>
		{#each menu as {name, href}}
		<NavLi href={href}>{name}</NavLi>
		{/each}
	</NavUl>
</Navbar>

<slot></slot>
