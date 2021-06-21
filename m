Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949D089E47
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 11:00:00 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 21 Jun 2021 12:59:21 +0200
Message-Id: <20210621105922.48408-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210621105922.48408-1-zbigniew.kempczynski@intel.com>
References: <20210621105922.48408-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: Beware implicit sign extension on
 large constants
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
Cc: Chris Wilson <chris.p.wilson@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

(gdb) p/x (long long unsigned int)(1 << 31)
$1 = 0xffffffff80000000
(gdb) p/x (long long unsigned int)(1u << 31)
$2 = 0x80000000

The impact of this is that the random address we were placing the spinner
at was always invalid on modern machines, causing the kernel to relocate
the spinners wherever and thus undergoing relocations.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
---
 lib/igt_dummyload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 82459e524..63b1fc73b 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -119,7 +119,7 @@ emit_recursive_batch(igt_spin_t *spin,
 	 */
 	addr = gem_aperture_size(fd) / 2;
 	if (addr >> 31)
-		addr = 1 << 31;
+		addr = 1u << 31;
 	addr += random() % addr / 2;
 	addr &= -4096;
 
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
