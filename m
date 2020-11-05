Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBA26E0DF
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2020 04:44:05 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Thu,  5 Nov 2020 10:13:15 +0530
Message-Id: <20201105044315.24370-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t]i915/gem_linear_blits: Added description to
 the subtest
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, sai.gowtham.ch@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: sai gowtham <sai.gowtham.ch@intel.com>

Added description to basic subtest.

Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_linear_blits.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
index cae42d52..9b9d8011 100644
--- a/tests/i915/gem_linear_blits.c
+++ b/tests/i915/gem_linear_blits.c
@@ -215,6 +215,8 @@ igt_main
 		count = (count + ncpus - 1) / ncpus;
 	}
 
+	igt_describe("This test is to check if the basics work when doing many blits,"
+		      "	with a working set larger than the aperture size");
 	igt_subtest("basic")
 		run_test(fd, 2);
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
