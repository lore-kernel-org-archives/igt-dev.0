Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572B0CFD37F
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 10:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A8610E39F;
	Tue, 25 Nov 2025 10:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+aARsmI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8800410E3A6
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 10:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764066225; x=1795602225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OUKH/OObZsjPoh2iQ+DjJ2Ka2/01uwG3MmM38DE4igQ=;
 b=D+aARsmI6JButRzkrY//8Fy8c9hbVAJxMXJgqpQp5FWhurC88RESryyh
 2mi6lCc8RT37PX1rSJGy1V0MjIHw5Dr2mqnWhaj02SXvTpOpBnnrR/nc6
 bGY3yqHK4sfhwCC9f6G/cU6Ok/OA2YeAqnCh9drSAIGsFR1T7ViZE2dk0
 z5pYx0Ca6jV27LDPUG5NErwB/JRg2jYxPCGbA63Hms1cr99GfxErVdPlZ
 hGZtSA/zWhqBnbVToh/VYEoJQvVmNfUDL+LJX0hXO0gkMrpCZZMQfKD+C
 uY7kz0GhWXvZfwfTaD576VZRB6zXnoDqTg/7tiOe53STokRwPG68WBJiF g==;
X-CSE-ConnectionGUID: 6elTcQUHTruEIgw3WGO/fQ==
X-CSE-MsgGUID: zp8CTkqhR+y2ylud3EPV8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65968431"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65968431"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:45 -0800
X-CSE-ConnectionGUID: OZLSVtPSRe6Y4Y0k5ri3PQ==
X-CSE-MsgGUID: euGOhr4TTQOKMxMvrrSnQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="192235356"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.102])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:43 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v2 05/10] lib/igt_sriov_device: Add helper for PF/VF
 sysfs path formatting
Date: Tue, 25 Nov 2025 11:23:04 +0100
Message-ID: <20251125102312.43142-6-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
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

Add igt_sriov_func_str() — a small utility that returns "pf" for
function 0 and "vf%u" for any VF index. This helper allows callers
to build SR-IOV sysfs paths without duplicating PF/VF conditional
logic.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 lib/igt_sriov_device.c | 19 +++++++++++++++++++
 lib/igt_sriov_device.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index ffa996d6b..788ffbfa1 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -42,6 +42,25 @@ bool igt_sriov_is_pf(int device)
 	return value > 0;
 }
 
+/**
+ * igt_sriov_func_str - Return "pf" or "vf%u" label for a function number
+ * @vf_num: 0 for PF, >0 for VF index
+ *
+ * Helper for constructing SR-IOV sysfs paths.
+ *
+ * Returns: "pf" for @vf_num == 0, otherwise "vf%u".
+ */
+const char *igt_sriov_func_str(unsigned int vf_num)
+{
+	static __thread char buf[16];
+
+	if (vf_num == 0)
+		return "pf";
+
+	snprintf(buf, sizeof(buf), "vf%u", vf_num);
+	return buf;
+}
+
 static bool __pf_attr_get_u32(int pf, const char *attr, uint32_t *value)
 {
 	int sysfs;
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index 930e97982..84d29b1bb 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -34,6 +34,7 @@ int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset(int pf, unsigned int vf_num);
 bool intel_is_vf_device(int device);
+const char *igt_sriov_func_str(unsigned int vf_num);
 
 /**
  * __is_valid_range - Helper to check VF range is valid
-- 
2.43.0

