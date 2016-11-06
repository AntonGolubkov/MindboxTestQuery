SELECT ProductId, COUNT(ProductId) AS Count
FROM Sales INNER JOIN
(
	SELECT CustomerId, MIN(DateCreated) AS DateCreated
	FROM Sales
	GROUP BY CustomerId
) AS FirstPurchases ON Sales.CustomerId = FirstPurchases.CustomerId AND Sales.DateCreated = FirstPurchases.DateCreated
GROUP BY ProductId
