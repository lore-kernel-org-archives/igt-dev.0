Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271516E26F
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2020 09:09:55 +0000 (UTC)
From: Adam Miszczak <adam.miszczak@linux.intel.com>
Date: Wed, 12 Aug 2020 11:05:48 +0200
Message-Id: <20200812090548.4973-3-adam.miszczak@linux.intel.com>
In-Reply-To: <20200812090548.4973-1-adam.miszczak@linux.intel.com>
References: <20200812090548.4973-1-adam.miszczak@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/i915: Add DG1 platform definition
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/intel_chipset.h     | 2 ++
 lib/intel_device_info.c | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 18f860ca..51093091 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -74,6 +74,7 @@ struct intel_device_info {
 	bool is_elkhartlake : 1;
 	bool is_tigerlake : 1;
 	bool is_rocketlake : 1;
+	bool is_dg1 : 1;
 	const char *codename;
 };
 
@@ -173,6 +174,7 @@ void intel_check_pch(void);
 #define IS_ICELAKE(devid)	(intel_get_device_info(devid)->is_icelake)
 #define IS_TIGERLAKE(devid)	(intel_get_device_info(devid)->is_tigerlake)
 #define IS_ROCKETLAKE(devid)	(intel_get_device_info(devid)->is_rocketlake)
+#define IS_DG1(devid)		(intel_get_device_info(devid)->is_dg1)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->gen & (1u << ((x)-1)))
 #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->gen & -(1u << ((x)-1)))
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index e5720443..d5f70156 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -327,6 +327,12 @@ static const struct intel_device_info intel_rocketlake_info = {
 	.codename = "rocketlake"
 };
 
+static const struct intel_device_info intel_dg1_info = {
+	.gen = BIT(11),
+	.is_dg1 = true,
+	.codename = "dg1"
+};
+
 static const struct pci_id_match intel_device_match[] = {
 	INTEL_I810_IDS(&intel_i810_info),
 	INTEL_I815_IDS(&intel_i815_info),
@@ -413,6 +419,8 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_TGL_12_IDS(&intel_tigerlake_info),
 	INTEL_RKL_IDS(&intel_rocketlake_info),
 
+	INTEL_DG1_IDS(&intel_dg1_info),
+
 	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
 };
 
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
