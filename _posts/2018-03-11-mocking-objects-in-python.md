---
layout: post
summary: Mocking objects in Python
---

# Mock a class

```python
from unittest.mock import Mock

mock_class = Mock()
mock_class.function_name.return_value = 5
```

If the mock_class is passed has a argument when the function `function_name` is called it will return `5`.


# References
[https://www.youtube.com/watch?v=smPbDqGjFAI](Into to Python Mocks)
[https://www.youtube.com/watch?v=GYkGguhdqw0](Python Mocking)
[https://docs.python.org/3/library/unittest.mock.html](unittest Mock documentation)