const openFormBtn = document.getElementById('openFormBtn');
                    const formOverlay = document.getElementById('formOverlay');
                    openFormBtn.addEventListener('click', function() {
                        formOverlay.style.display = 'flex'; // Hiển thị overlay và form
                    });
                    formOverlay.addEventListener('click', function(event) {
                        if (event.target === formOverlay) {
                            formOverlay.style.display = 'none';
                        }
                    });