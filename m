Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 16 Jan 2020 11:13:26 +0100
Message-Id: <20200116101326.11710-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RESEND PATCH i-g-t] tests/prime_vgem: Give meaningful
 messages on SKIP
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Messages displayed on SKIPs introduced by commit 92caadb4e551
("tests/prime_vgem: Skip basic-read/write subtests if not supported")
don't inform clearly enough that those SKIPs are expected behavior.
Fix it.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Ewelina Musial <ewelina.musial@intel.com>
---
Assuming the R-b: from Ewelina is sufficient, can someone push this,
please?  I can't do that myself as I have no push permissions.

Thanks,
Janusz

 tests/prime_vgem.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 6595818c..3bdb2300 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -46,7 +46,8 @@ static void test_read(int vgem, int i915)
 	handle = prime_fd_to_handle(i915, dmabuf);
 	close(dmabuf);
 
-	igt_skip_on(__gem_read(i915, handle, 0, &i, sizeof(i)));
+	igt_skip_on_f(__gem_read(i915, handle, 0, &i, sizeof(i)),
+		      "PREAD from dma-buf not supported on this hardware\n");
 
 	ptr = vgem_mmap(vgem, &scratch, PROT_WRITE);
 	for (i = 0; i < 1024; i++)
@@ -83,7 +84,8 @@ static void test_fence_read(int i915, int vgem)
 	handle = prime_fd_to_handle(i915, dmabuf);
 	close(dmabuf);
 
-	igt_skip_on(__gem_read(i915, handle, 0, &i, sizeof(i)));
+	igt_skip_on_f(__gem_read(i915, handle, 0, &i, sizeof(i)),
+		      "PREAD from dma-buf not supported on this hardware\n");
 
 	igt_fork(child, 1) {
 		close(master[0]);
@@ -195,7 +197,8 @@ static void test_write(int vgem, int i915)
 	handle = prime_fd_to_handle(i915, dmabuf);
 	close(dmabuf);
 
-	igt_skip_on(__gem_write(i915, handle, 0, &i, sizeof(i)));
+	igt_skip_on_f(__gem_write(i915, handle, 0, &i, sizeof(i)),
+		      "PWRITE to dma-buf not supported on this hardware\n");
 
 	ptr = vgem_mmap(vgem, &scratch, PROT_READ);
 	gem_close(vgem, scratch.handle);
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
