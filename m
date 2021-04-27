Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8056C6E8F8
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Apr 2021 05:41:12 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 27 Apr 2021 08:42:19 +0300
Message-Id: <20210427054219.21305-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Put edid_ar_svds where it's used
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

edid_ar_svds was hiding in igt_chamelium instead of igt_kms where it's
used, breaking IGT building when chamelium support was disabled.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_chamelium.h | 5 -----
 lib/igt_kms.c       | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index 019bdbfe..f40e848e 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -82,11 +82,6 @@ struct chamelium_infoframe {
 
 struct chamelium_edid;
 
-/* Set of Video Identification Codes advertised in the EDID */
-static const uint8_t edid_ar_svds[] = {
-	16, /* 1080p @ 60Hz, 16:9 */
-};
-
 /**
  * CHAMELIUM_MAX_PORTS: the maximum number of ports supported by igt_chamelium.
  *
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index df946a7d..47b829b0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -478,6 +478,11 @@ const struct edid *igt_kms_get_3d_edid(void)
 	return edid;
 }
 
+/* Set of Video Identification Codes advertised in the EDID */
+static const uint8_t edid_ar_svds[] = {
+	16, /* 1080p @ 60Hz, 16:9 */
+};
+
 /**
  * igt_kms_get_aspect_ratio_edid:
  *
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
