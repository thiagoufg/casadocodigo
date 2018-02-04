package br.com.casadocodigo.loja.models;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class CarrinhoCompras {

	private Map<CarrinhoItem, Integer> itens = new HashMap<CarrinhoItem, Integer>();
	
	public void add(CarrinhoItem carrinhoItem) {
		itens.put(carrinhoItem, getQuantidade(carrinhoItem) + 1);
	}

	private int getQuantidade(CarrinhoItem carrinhoItem) {
		if(!itens.containsKey(carrinhoItem))
			itens.put(carrinhoItem, 0);
		return itens.get(carrinhoItem);
	}
	
	public int getQuantidade() {
		return itens.values().stream().reduce(0, (proximo, acumulador) -> proximo + acumulador);
	}

	
}
