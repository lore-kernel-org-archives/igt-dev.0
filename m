Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1326FA37
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 21:45:32 +0000 (UTC)
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date: Thu, 30 Jan 2020 13:44:55 -0800
Message-Id: <20200130214455.5948-2-vinay.belgaumkar@intel.com>
In-Reply-To: <20200130214455.5948-1-vinay.belgaumkar@intel.com>
References: <20200130214455.5948-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 i-g-t 2/2] tests/i915/gem_madvise: Use
 gem_mmap_offset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Update test to use mmap_offset which allows test execution
on platforms without aperture. Iterate the test for GTT and
WC mapping types.

Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_madvise.c | 114 ++++++++++++++++++++++++++-------------
 1 file changed, 76 insertions(+), 38 deletions(-)

diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
index 7162a5c3..ee38e023 100644
--- a/tests/i915/gem_madvise.c
+++ b/tests/i915/gem_madvise.c
@@ -51,62 +51,100 @@ static jmp_buf jmp;
 
 static void __attribute__((noreturn)) sigtrap(int sig)
 {
-	longjmp(jmp, sig);
+	siglongjmp(jmp, sig);
 }
 
+enum mode { GTT, WC };
+const char* modes[] = {[GTT] = "gtt", [WC] = "wc"};
+
 static void
 dontneed_before_mmap(void)
 {
-	int fd = drm_open_driver(DRIVER_INTEL);
+	int fd;
 	uint32_t handle;
 	char *ptr;
 
-	handle = gem_create(fd, OBJECT_SIZE);
-	gem_madvise(fd, handle, I915_MADV_DONTNEED);
-	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
-	close(fd);
-
-	signal(SIGSEGV, sigtrap);
-	signal(SIGBUS, sigtrap);
-	switch (setjmp(jmp)) {
-	case SIGBUS:
-		break;
-	case 0:
-		*ptr = 0;
-	default:
-		igt_assert(!"reached");
-		break;
+	for (unsigned mode = GTT; mode <= WC; mode++) {
+		igt_debug("Mapping mode: %s\n", modes[mode]);
+
+		fd = drm_open_driver(DRIVER_INTEL);
+		handle = gem_create(fd, OBJECT_SIZE);
+		gem_madvise(fd, handle, I915_MADV_DONTNEED);
+
+		switch (mode) {
+			case GTT:
+				ptr = __gem_mmap_offset(fd, handle, 0, OBJECT_SIZE,
+					PROT_READ | PROT_WRITE, I915_MMAP_OFFSET_GTT);
+				break;
+			case WC:
+				ptr = __gem_mmap_offset(fd, handle, 0, OBJECT_SIZE,
+					PROT_READ | PROT_WRITE, I915_MMAP_OFFSET_WC);
+				break;
+		}
+
+		close(fd);
+
+		signal(SIGSEGV, sigtrap);
+		signal(SIGBUS, sigtrap);
+		switch (sigsetjmp(jmp, SIGBUS | SIGSEGV)) {
+		case SIGBUS:
+			break;
+		case 0:
+			*ptr = 0;
+		default:
+			igt_assert(!"reached");
+			break;
+		}
+		munmap(ptr, OBJECT_SIZE);
+		signal(SIGBUS, SIG_DFL);
+		signal(SIGSEGV, SIG_DFL);
 	}
-	munmap(ptr, OBJECT_SIZE);
-	signal(SIGBUS, SIG_DFL);
-	signal(SIGSEGV, SIG_DFL);
 }
 
 static void
 dontneed_after_mmap(void)
 {
-	int fd = drm_open_driver(DRIVER_INTEL);
+	int fd;
 	uint32_t handle;
 	char *ptr;
 
-	handle = gem_create(fd, OBJECT_SIZE);
-	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
-	igt_assert(ptr);
-	gem_madvise(fd, handle, I915_MADV_DONTNEED);
-	close(fd);
-
-	signal(SIGBUS, sigtrap);
-	switch (setjmp(jmp)) {
-	case SIGBUS:
-		break;
-	case 0:
-		*ptr = 0;
-	default:
-		igt_assert(!"reached");
-		break;
+	for (unsigned mode = GTT; mode <= WC; mode++) {
+		igt_debug("Mapping mode: %s\n", modes[mode]);
+
+		fd = drm_open_driver(DRIVER_INTEL);
+		handle = gem_create(fd, OBJECT_SIZE);
+
+		switch (mode) {
+			case GTT:
+				ptr = __gem_mmap_offset(fd, handle, 0, OBJECT_SIZE,
+					PROT_READ | PROT_WRITE, I915_MMAP_OFFSET_GTT);
+				break;
+			case WC:
+				ptr = __gem_mmap_offset(fd, handle, 0, OBJECT_SIZE,
+					PROT_READ | PROT_WRITE, I915_MMAP_OFFSET_WC);
+				break;
+		}
+
+		igt_assert(ptr);
+		gem_madvise(fd, handle, I915_MADV_DONTNEED);
+		close(fd);
+
+		signal(SIGSEGV, sigtrap);
+		signal(SIGBUS, sigtrap);
+		switch (sigsetjmp(jmp, SIGBUS | SIGSEGV)) {
+		case SIGBUS:
+			break;
+		case 0:
+			*ptr = 0;
+		default:
+			igt_assert(!"reached");
+			break;
+		}
+		munmap(ptr, OBJECT_SIZE);
+		signal(SIGBUS, SIG_DFL);
+		signal(SIGSEGV, SIG_DFL);
 	}
-	munmap(ptr, OBJECT_SIZE);
-	signal(SIGBUS, SIG_DFL);
+
 }
 
 static void
-- 
2.22.0.245.g4d8ec15c66

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
