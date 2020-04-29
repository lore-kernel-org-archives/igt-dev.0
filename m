Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EF26E9E4
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2020 06:17:46 +0000 (UTC)
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date: Wed, 29 Apr 2020 11:42:27 +0530
Message-Id: <20200429061227.20343-2-krishnaiah.bommu@intel.com>
In-Reply-To: <20200429061227.20343-1-krishnaiah.bommu@intel.com>
References: <20200429061227.20343-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/i915/gem_exec_reloc: free the
 spin in proper place
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
---
 tests/i915/gem_exec_reloc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index 4112e145..643ac4bf 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -453,6 +453,8 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
 
 		gem_execbuf(fd, &execbuf);
 
+		igt_spin_free(fd, spin);
+
 		if (after) {
 			char *wc;
 
@@ -479,8 +481,6 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
 			igt_assert_eq_u64(reloc.presumed_offset, offset);
 		igt_assert_eq_u64(obj.offset, offset);
 
-		igt_spin_free(fd, spin);
-
 		/* Simulate relocation */
 		if (flags & NORELOC) {
 			obj.offset += OBJSZ;
@@ -521,6 +521,8 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
 
 		gem_execbuf(fd, &execbuf);
 
+		igt_spin_free(fd, spin);
+
 		if (after) {
 			char *wc;
 
@@ -547,7 +549,6 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
 			igt_assert_eq_u64(reloc.presumed_offset, offset);
 		igt_assert_eq_u64(obj.offset, offset);
 
-		igt_spin_free(fd, spin);
 		if (trash)
 			gem_close(fd, trash);
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
