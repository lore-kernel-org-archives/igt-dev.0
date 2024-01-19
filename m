Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8700C4725D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 11:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9642910E9E5;
	Fri, 19 Jan 2024 11:58:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6ECE10E9E7
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 11:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705665503; x=1737201503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0SBrNFfHK4tAaxcdEuGlNeI2Q7vXO/gbPUxfEFylnOw=;
 b=RSGCM1/6krk2RKmP0DfVSNkWY31AugFT32iDZ2NGE5Mu6fwGLjVqgk8z
 BR30V7YCa+SJWhG5+gBOkWuK8O0kC2BpAba61aELp1pK0tPRT6XI2Kdyb
 XstYRx4Q/jGnK3xm1fhvTNwgJxLlUMfzczme6wcHSA/lSRc1w4fg8EElE
 iXoh6Zi6NQYQ/vmgiUJQdZVst7ZrhOuKsxjos4ZzdNySxma7Iz4zMwCSF
 na1qsiMflm/mLkfEHq/D04nqHC+KyxOLzux41LVHyGNTkPSNaIYQM+AKH
 z9ilZTsoR21rOIsz+u9xSSo/HPksMi4iGCMwd+t6uBtt6mbeOz7zVwjbO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="465008185"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="465008185"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 03:58:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="788346445"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="788346445"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 03:58:21 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 2/4] lib/igt_pm: Add helper to get/set
 auto_suspenddelay_ms
Date: Fri, 19 Jan 2024 17:25:52 +0530
Message-Id: <20240119115554.1699060-3-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240119115554.1699060-1-anshuman.gupta@intel.com>
References: <20240119115554.1699060-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kamil.konieczny@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Sometimes we want to test pm igt test with an explicit auto
suspend delay, therefore adding helpers to get/set the pci_dev
auto_suspenddelay_ms.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_pm.c | 53 ++++++++++++++++++++++++++++++++++++++++------------
 lib/igt_pm.h |  2 ++
 2 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index c2d98fceb..d436c2c50 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1068,18 +1068,6 @@ static void igt_pm_write_power_attr(int fd, const char *val, int len)
 	igt_assert(strncmp(buf, val, len) == 0);
 }
 
-static int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
-{
-	char delay_str[64];
-	int delay, delay_fd;
-
-	delay_fd = igt_pm_get_power_attr_fd(pci_dev, "autosuspend_delay_ms");
-	if (igt_pm_read_power_attr(delay_fd, delay_str, 64, true))
-		igt_assert(sscanf(delay_str, "%d", &delay) > 0);
-
-	return delay;
-}
-
 static void
 igt_pm_setup_pci_dev_power_attrs(struct pci_device *pci_dev,
 				 struct igt_pm_pci_dev_pwrattr *pwrattr, int delay_ms)
@@ -1165,6 +1153,47 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs, i
 	pci_iterator_destroy(iter);
 }
 
+/**
+ * igt_pm_get_autosuspend_delay:
+ * @pci_dev: pci_dev.
+ * Get pci_dev autosuspend delay value from pci sysfs "autosuspend_delay_ms".
+ *
+ * Returns:
+ * autosuspend_delay_ms.
+ */
+int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
+{
+	char delay_str[64];
+	int delay, delay_fd;
+
+	delay_fd = igt_pm_get_power_attr_fd(pci_dev, "autosuspend_delay_ms");
+	if (igt_pm_read_power_attr(delay_fd, delay_str, 64, true))
+		igt_assert(sscanf(delay_str, "%d", &delay) > 0);
+
+	return delay;
+}
+
+/**
+ * igt_pm_set_autosuspend_delay:
+ * @pci_dev: pci_dev.
+ * @delay_ms: autosuspend delay in ms.
+ * Set pci_dev autosuspend delay value through pci sysfs "autosuspend_delay_ms".
+ */
+void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
+{
+	char delay_str[64];
+	int delay_fd;
+
+	delay_fd = igt_pm_get_power_attr_fd(pci_dev, "autosuspend_delay_ms");
+
+	if (delay_ms >= 0) {
+		int wc;
+
+		wc = snprintf(delay_str, 64, "%d\n", delay_ms);
+		igt_pm_write_power_attr(delay_fd, delay_str, wc);
+	}
+}
+
 /**
  * igt_pm_enable_pci_card_runtime_pm:
  * @root: root port pci_dev.
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 306a9eb46..8394315c6 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -77,6 +77,8 @@ int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev);
 bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev);
 enum igt_acpi_d_state
 igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev);
+int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev);
+void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms);
 void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
 				       struct pci_device *i915);
 void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value);
-- 
2.25.1

