Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480C66E88B
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jun 2021 12:33:07 +0000 (UTC)
From: sai.krishna.kuchi@intel.com
Date: Tue, 29 Jun 2021 18:03:03 +0530
Message-Id: <20210629123303.1950-1-sai.krishna.kuchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_blits: Added description to all
 subtests
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

From: "Kuchi, Sai Krishna" <sai.krishna.kuchi@intel.com>

Cc:Melkaveri, Arjun<arjun.melkaveri@intel.com>
Cc:Gandi, Ramadevi<ramadevi.gandi@intel.com>

Signed-off-by: Kuchi, Sai Krishna<sai.krishna.kuchi@intel.com>
---
 tests/i915/gem_blits.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
index 21dcee68..46d8c434 100644
--- a/tests/i915/gem_blits.c
+++ b/tests/i915/gem_blits.c
@@ -735,6 +735,7 @@ igt_main
 		device.llc = gem_has_llc(device.fd);
 	}
 
+	igt_describe_f("Testing the basic linear tiling of blit");
 	igt_subtest("basic") {
 		struct buffer *src, *dst;
 		unsigned int x, y;
-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
