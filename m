Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 24 Jul 2020 18:06:46 +0100
Message-Id: <20200724170649.463842-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/i915: Identify Rocketlake
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

commit a048d54f58dd ("lib: Sync i915 PCI ids") added the ids for
Rocketlake, but no identification tables.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2217
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/intel_chipset.h     | 2 ++
 lib/intel_device_info.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 929fac530..aab823a17 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -73,6 +73,7 @@ struct intel_device_info {
 	bool is_icelake : 1;
 	bool is_elkhartlake : 1;
 	bool is_tigerlake : 1;
+	bool is_rocketlake : 1;
 	const char *codename;
 };
 
@@ -172,6 +173,7 @@ void intel_check_pch(void);
 #define IS_CANNONLAKE(devid)	(intel_get_device_info(devid)->is_cannonlake)
 #define IS_ICELAKE(devid)	(intel_get_device_info(devid)->is_icelake)
 #define IS_TIGERLAKE(devid)	(intel_get_device_info(devid)->is_tigerlake)
+#define IS_ROCKETLAKE(devid)	(intel_get_device_info(devid)->is_rocketlake)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->gen & (1u << ((x)-1)))
 #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->gen & -(1u << ((x)-1)))
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 21f7a9570..6c9ac388c 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -321,6 +321,12 @@ static const struct intel_device_info intel_tigerlake_info = {
 	.codename = "tigerlake"
 };
 
+static const struct intel_device_info intel_rocketlake_info = {
+	.gen = BIT(11),
+	.is_rocketlake = true,
+	.codename = "rocketlake"
+};
+
 static const struct pci_id_match intel_device_match[] = {
 	INTEL_I810_IDS(&intel_i810_info),
 	INTEL_I815_IDS(&intel_i815_info),
@@ -405,6 +411,7 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_EHL_IDS(&intel_elkhartlake_info),
 
 	INTEL_TGL_12_IDS(&intel_tigerlake_info),
+	INTEL_RKL_IDS(&intel_rocketlake_info),
 
 	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
 };
-- 
2.28.0.rc1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
