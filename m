Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD170D1712B
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 20:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6623310E592;
	Mon, 21 Oct 2024 20:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUGu6UCu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D341110E592
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 20:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729541286; x=1761077286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G2X+H0lvjj6zUoZc322s9wikEO8uUiLcDGtPX/ks8PY=;
 b=aUGu6UCuMRg68zAzYMBchRalgUf0Exv1lb8TCJuxWNK08FI7ihuzXEiV
 SBAT5NKe0VYxUXC1a7HbvrCTYnB4zK8k9wZ2KLqhVIiCOJec98Ap4qBNo
 3F31fj1Mq0oj5ulv+pH6vF54ZXj7UqPOCyKrxC4Ezx0atHni4YB2tWfUf
 gE2wGgjc2qm5nNkwfdQ7GehP40fUDXEVyA3G7YC4MjpKQSRCzAWriupXk
 9w+sAiAPip0EniCtTG/gX0FgT6PH+0xFgU5ZXp6ThmNdd46mYrYxOyFBx
 boYunK1jOvalMnswY8mXtHByml1dnmfvRFxKQoFs8bGKJ9lG1OLslhes8 w==;
X-CSE-ConnectionGUID: Q6cZmDQUSdWwLmohbVA8IA==
X-CSE-MsgGUID: 9Z7aiWirRfqEHYxvvInxpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51591269"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51591269"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:08:06 -0700
X-CSE-ConnectionGUID: LnipVv8HRKOXpQqFmLCD6w==
X-CSE-MsgGUID: qMtUNvVhTvmSsLAoWGhNIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79568726"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.1.47])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:08:02 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, narasimha.c.v@intel.com,
 piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 2/6] lib/igt_sriov_device: add helper for resetting
 SR-IOV device
Date: Mon, 21 Oct 2024 22:07:33 +0200
Message-Id: <20241021200737.941384-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241021200737.941384-1-marcin.bernatowicz@linux.intel.com>
References: <20241021200737.941384-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Reset is initiated by writing 1 to device's sysfs reset attribute.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 lib/igt_sriov_device.c | 51 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sriov_device.h |  2 ++
 2 files changed, 53 insertions(+)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index d20c74823..2b83cd43c 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -413,3 +413,54 @@ int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num)
 
 	return fd;
 }
+
+/**
+ * igt_sriov_device_reset_exists:
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based to identify single VF) or 0 for PF
+ *
+ * Check if reset attribute exists for a given SR-IOV device.
+ *
+ * Returns:
+ * True if reset attribute exists, false otherwise.
+ */
+bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num)
+{
+	int sysfs;
+	bool reset_exists;
+
+	sysfs = igt_sriov_device_sysfs_open(pf, vf_num);
+	if (sysfs < 0)
+		return false;
+
+	reset_exists = igt_sysfs_has_attr(sysfs, "reset");
+	close(sysfs);
+
+	return reset_exists;
+}
+
+/**
+ * igt_sriov_device_reset:
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based to identify single VF) or 0 for PF
+ *
+ * Trigger FLR on a given VF.
+ *
+ * Returns:
+ * True on success, false on failure.
+ */
+bool igt_sriov_device_reset(int pf, unsigned int vf_num)
+{
+	int sysfs;
+	bool ret;
+
+	sysfs = igt_sriov_device_sysfs_open(pf, vf_num);
+	if (sysfs < 0)
+		return false;
+
+	igt_debug("Initiating FLR on VF%d\n", vf_num);
+	ret = igt_sysfs_set(sysfs, "reset", "1");
+	close(sysfs);
+
+	return ret;
+}
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index dc95a4c78..4b63ceb22 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -31,6 +31,8 @@ bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
 void igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num);
 void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num);
 int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
+bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
+bool igt_sriov_device_reset(int pf, unsigned int vf_num);
 
 /**
  * for_each_sriov_vf - Helper for running code on each VF
-- 
2.31.1

