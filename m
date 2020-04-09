Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D806E21A
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2020 13:33:59 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu,  9 Apr 2020 16:33:55 +0300
Message-Id: <20200409133355.9606-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] CONTRIBUTING: Document guidelines for
 interface deprecation
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
---
 CONTRIBUTING.md | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 6d1294ad..2ab8a48f 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -30,6 +30,12 @@ The Code
   provided by the igt library. The semantic patch lib/igt.cocci can help with
   more automatic conversions.
 
+- Tests that use kernel interfaces (uapi, sysfs, or even debugfs) that
+  become deprecated in favour of new interfaces should have fallbacks
+  to the deprecated interfaces if the new stuff is not present in the
+  running kernel. The same IGT version can be used to test the tip of
+  development along with stable kernel releases that way.
+
 [igt-describe]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
 
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
