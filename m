Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC7389803
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2020 07:39:52 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Tue, 10 Nov 2020 13:01:21 +0530
Message-Id: <20201110073121.192006-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] lib/i915: Identify Jasperlake
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
To: igt-dev@lists.freedesktop.org, hariom.pandey@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Recently we did split of EHL/JSL thus we need to indentify
Jasperlake.

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 lib/intel_device_info.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index e1132d9c..054b98c0 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -423,6 +423,7 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_ICL_11_IDS(&intel_icelake_info),
 
 	INTEL_EHL_IDS(&intel_elkhartlake_info),
+	INTEL_JSL_IDS(&intel_elkhartlake_info),
 
 	INTEL_TGL_12_GT1_IDS(&intel_tigerlake_gt1_info),
 	INTEL_TGL_12_GT2_IDS(&intel_tigerlake_gt2_info),
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
