Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 14 Oct 2020 11:40:35 +0100
Message-Id: <20201014104038.2554985-7-chris@chris-wilson.co.uk>
In-Reply-To: <20201014104038.2554985-1-chris@chris-wilson.co.uk>
References: <20201014104038.2554985-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 07/10] i915/gem_userptr_blits: Test
 execution isolation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_userptr_blits.c | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 01498edad..6f2e89269 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -586,6 +586,40 @@ static int test_access_control(int fd)
 	return 0;
 }
 
+static void test_exec_isolation(int fd)
+{
+	igt_fork(child, 1) {
+		igt_spin_t *spin = igt_spin_new(fd, .flags = IGT_SPIN_USERPTR);
+		gem_execbuf(fd, &spin->execbuf);
+		igt_spin_free(fd, spin);
+	}
+
+	igt_set_timeout(10, "blocked!");
+	igt_until_timeout(2)
+		igt_spin_free(fd, igt_spin_new(fd, .flags = IGT_SPIN_USERPTR));
+	igt_reset_timeout();
+
+	igt_waitchildren();
+}
+
+static void test_unmap_isolation(int fd)
+{
+	igt_spin_t *spin = igt_spin_new(fd, .flags = IGT_SPIN_USERPTR);
+
+	igt_fork(child, 1) {
+		gem_execbuf(fd, &spin->execbuf);
+		munmap(spin->batch, 4096);
+	}
+	igt_waitchildren();
+
+	igt_spin_end(spin);
+	mprotect(spin->batch, 4096, PROT_READ);
+	igt_assert_eq(__gem_execbuf(fd, &spin->execbuf), -EFAULT);
+	mprotect(spin->batch, 4096, PROT_WRITE);
+
+	igt_spin_free(fd, spin);
+}
+
 static int test_invalid_null_pointer(int fd)
 {
 	uint32_t handle;
@@ -2388,6 +2422,12 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 	igt_subtest("access-control")
 		test_access_control(fd);
 
+	igt_subtest("exec-isolation")
+		test_exec_isolation(fd);
+
+	igt_subtest("unmap-isolation")
+		test_unmap_isolation(fd);
+
 	igt_fixture
 		free(can_mmap);
 }
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
