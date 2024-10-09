Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD14CEDD85
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 11:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C46C10E111;
	Wed,  9 Oct 2024 11:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KuN3sCRt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0846010E111
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 11:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728473446; x=1760009446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Doph4/Jum7LvzulOahgyNYZttHZnFcyfl2q80ZO16Q=;
 b=KuN3sCRtqnpZJB47FmPI90rumoVI/4A2PuYnjEipnj62GNsiFK7ELLkf
 Oh8WRgi1o3C1wnqUWx99W3Qr4DipgdYqt+qJywePtgUgpw5fdT0wCA6B8
 5/gL6XQjDtBMlzUZiK91pqMN5/i77Hpwe9kpvRpI10gEV4b3D5prun/A0
 ebDCVgplLUODvTqWnrjj8zy2tbNpNCwlfhDLuUMfeJn6zuA3ORseGXJZ/
 NtNIq3h9kyQIi9GlN43hEdH0f10vyxtuWebUaZNCFA/+BxL18dTXwOWOG
 EL/3OZZK9Ry1em1UtTtuVzEsqOTavg2M4oKISi/rqY/jsDJ3+9E++t/VR w==;
X-CSE-ConnectionGUID: 12kyjvb5TbCHw4taUeys9g==
X-CSE-MsgGUID: kRgvgR+3QSm9W0BIL7hm9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="45286253"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="45286253"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:30:39 -0700
X-CSE-ConnectionGUID: gddSEu0QQvGhgDkLMYEDaQ==
X-CSE-MsgGUID: Y12CMYlMRvKPXe1swbpRpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="113699910"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.16.246])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:30:36 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH i-g-t 2/6] lib/igt_sriov_device: add helper for resetting
 SR-IOV device
Date: Wed,  9 Oct 2024 13:30:14 +0200
Message-Id: <20241009113018.741371-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
References: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
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

