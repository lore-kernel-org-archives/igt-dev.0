Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA306E41F
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 22:56:27 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Wed, 19 Feb 2020 00:56:15 +0200
Message-Id: <20200218225620.668212-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200218225620.668212-1-lionel.g.landwerlin@intel.com>
References: <20200218225620.668212-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/6] lib/intel_chipset: identify Elkhart
 Lake
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

v2: add codename (Chris)

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
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
index 4f96577d..208965d1 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -309,6 +309,12 @@ static const struct intel_device_info intel_icelake_info = {
 	.codename = "icelake"
 };
 
+static const struct intel_device_info intel_elkhartlake_info = {
+	.gen = BIT(10),
+	.is_elkhartlake = true,
+	.codename = "elkhartlake"
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
