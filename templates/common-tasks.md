# Common Tasks

This file documents repetitive tasks and their workflows for consistent implementation.

---

## [Task Name]

**Last performed**: [YYYY-MM-DD]

### Files to Modify

- [`/path/to/file1.ts`](file:///path/to/file1.ts) - [What changes here]
- [`/path/to/file2.ts`](file:///path/to/file2.ts) - [What changes here]
- [`/path/to/file3.ts`](file:///path/to/file3.ts) - [What changes here]
- [`/tests/something.test.ts`](file:///path/to/something.test.ts) - [Update tests]

### Steps

1. **[Step 1 title]**: [Detailed description of what to do]
2. **[Step 2 title]**: [Detailed description of what to do]
3. **[Step 3 title]**: [Detailed description of what to do]
4. **[Step 4 title]**: [Detailed description of what to do]

### Important Notes

- ⚠️ [Important consideration 1]
- ⚠️ [Important consideration 2]
- 💡 [Tip or gotcha]

### Example Implementation

```typescript
// Example code showing the pattern
export const exampleImplementation = {
  // ... code example
};
```

**Reference**: [Link to commit or PR where this was done]

---

## Example: Add New API Endpoint

**Last performed**: 2025-12-03

### Files to Modify

- [`/src/routes/api.ts`](file:///src/routes/api.ts) - Register new route
- [`/src/controllers/resource.controller.ts`](file:///src/controllers/resource.controller.ts) - Add controller method
- [`/src/services/resource.service.ts`](file:///src/services/resource.service.ts) - Add business logic
- [`/src/validators/resource.validator.ts`](file:///src/validators/resource.validator.ts) - Add validation schema
- [`/tests/api/resource.test.ts`](file:///tests/api/resource.test.ts) - Add tests

### Steps

1. **Add route**: Register endpoint in `api.ts` with HTTP method and path
2. **Create controller**: Add method to controller to handle request/response
3. **Implement service**: Add business logic in service layer
4. **Add validation**: Create schema in validator for input validation
5. **Write tests**: Add unit and integration tests covering happy path and errors
6. **Update docs**: Add endpoint to API documentation

### Important Notes

- ⚠️ Always add validation schema before implementing controller
- ⚠️ Follow RESTful conventions for HTTP methods and status codes
- ⚠️ Don't forget authentication middleware for protected endpoints
- 💡 Use existing endpoints as reference for consistent patterns

### Example Implementation

```typescript
// Route registration
router.post('/resources',
  authenticate,
  validate(resourceSchema),
  resourceController.create
);

// Controller method
async create(req: Request, res: Response) {
  const resource = await resourceService.create(req.body);
  res.status(201).json(resource);
}

// Service method
async create(data: ResourceInput): Promise<Resource> {
  return await db.resource.create({ data });
}
```

**Reference**: [Link to example PR]

---

_Add more tasks as they emerge by using "add task" command after completing repetitive work._
