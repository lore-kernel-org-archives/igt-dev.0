Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73376E440
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2020 15:22:35 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Wed, 18 Nov 2020 20:55:26 +0530
Message-Id: <20201118152526.182506-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/prime_busy: Add all subtests
 description
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/prime_busy.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/prime_busy.c b/tests/prime_busy.c
index aec76393..25153e32 100644
--- a/tests/prime_busy.c
+++ b/tests/prime_busy.c
@@ -236,9 +236,17 @@ igt_main
 			gem_require_mmap_wc(fd);
 
 		for (const struct mode *m = modes; m->name; m++) {
+			igt_describe_f("Tests the polling for prime fences when buffer object "
+			       "is exported into a global dma-buf fd %s it's execution %s",
+			       (m->flags & HANG) ? "before" : m->name,
+			       (m->flags & HANG) ? "in hang allowed environment" : "");
 			igt_subtest_with_dynamic(m->name)
 				test_mode(fd, m->flags);
 
+			igt_describe_f("Tests the polling using non-zero timeout for prime fences when "
+			       "buffer object is exported into a global dma-buf fd %s it's execution %s",
+			       (m->flags & HANG) ? "before" : m->name,
+			       (m->flags & HANG) ? "in hang allowed environment" : "");
 			igt_subtest_with_dynamic_f("%s-wait", m->name)
 				test_mode(fd, m->flags | POLL);
 		}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
