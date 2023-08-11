Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD67F10E692
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 11:10:43 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Aug 2023 16:40:25 +0530
Message-Id: <20230811111026.1327273-2-anshuman.gupta@intel.com>
In-Reply-To: <20230811111026.1327273-1-anshuman.gupta@intel.com>
References: <20230811111026.1327273-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] lib/igt_pm: Remove pci_system_{init,
 cleanup}
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Anshuamn Gupta <anshuman.gupta@intel.com>

As xe_pm igt test fixture is calling igt_device_get_pci_device()
that makes igt core library to initialize libpciaccess
pci_system_init() and register a exit handler for its cleanup.
Therefore remove these unnecessary calls from igt_pm lib.

v2:
- Commit log improvements. [Rodrigo]

Signed-off-by: Anshuamn Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 704acf7d1..d1d7be9a1 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1140,9 +1140,6 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs, i
 	ret = pci_device_get_bridge_buses(pci_dev, &primary, &secondary, &subordinate);
 	igt_assert(!ret);
 
-	ret = pci_system_init();
-	igt_assert(!ret);
-
 	match.domain = pci_dev->domain;
 	match.bus = PCI_MATCH_ANY;
 	match.dev = PCI_MATCH_ANY;
@@ -1185,7 +1182,6 @@ void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
 		delay = igt_pm_get_autosuspend_delay(i915);
 
 	igt_pm_setup_pci_card_power_attrs(root, false, delay);
-	pci_system_cleanup();
 }
 
 /**
@@ -1289,7 +1285,6 @@ void igt_pm_restore_pci_card_runtime_pm(void)
 	}
 
 	memset(__pci_dev_pwrattr, 0, sizeof(__pci_dev_pwrattr));
-	pci_system_cleanup();
 }
 
 static void igt_pm_print_pci_dev_runtime_status(struct pci_device *pci_dev)
-- 
2.25.1
