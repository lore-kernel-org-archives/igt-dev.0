Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD856E05A
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 14:22:00 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 17 Feb 2020 16:21:50 +0200
Message-Id: <20200217142155.501499-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200217142155.501499-1-lionel.g.landwerlin@intel.com>
References: <20200217142155.501499-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/6] lib/intel_chipset: identify Elkhart Lake
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

We'll need to identify this platform for performance tools.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/intel_chipset.h     | 1 +
 lib/intel_device_info.c | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 2bd57f4f..929fac53 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -71,6 +71,7 @@ struct intel_device_info {
 	bool is_cometlake : 1;
 	bool is_cannonlake : 1;
 	bool is_icelake : 1;
+	bool is_elkhartlake : 1;
 	bool is_tigerlake : 1;
 	const char *codename;
 };
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 4f96577d..07eeb7c5 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -309,6 +309,12 @@ static const struct intel_device_info intel_icelake_info = {
 	.codename = "icelake"
 };
 
+static const struct intel_device_info intel_elkhartlake_info = {
+	.gen = BIT(10),
+	.is_elkhartlake = true,
+	.codename = ""
+};
+
 static const struct intel_device_info intel_tigerlake_info = {
 	.gen = BIT(11),
 	.is_tigerlake = true,
@@ -394,7 +400,7 @@ static const struct pci_id_match intel_device_match[] = {
 
 	INTEL_ICL_11_IDS(&intel_icelake_info),
 
-	INTEL_EHL_IDS(&intel_icelake_info),
+	INTEL_EHL_IDS(&intel_elkhartlake_info),
 
 	INTEL_TGL_12_IDS(&intel_tigerlake_info),
 
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
