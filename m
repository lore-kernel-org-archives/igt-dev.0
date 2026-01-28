Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B94BD46BE0
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 18:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34DD10E751;
	Wed, 28 Jan 2026 18:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYeLlSpL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4B810E752
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 18:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769623741; x=1801159741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fsPERt3MELUTPXdLoJhZy/qCXH0KgD9sjWjyqgomuko=;
 b=YYeLlSpLb90hoznwFZIeIOzoSW5ybaRGfbRokM+BocXYtL5aO2h1CaR3
 htyP29PXTR/RfEBcPZ0/szOZ0lcPC7uFTX9g+JIW74SQxhl/5/QCIaVc2
 43AWDDuesPw8d8Ke3gXbpWEn1xCxR/C4+KTIVHm8ncY4/zXjqdgsMtHQX
 1WdAZc0DTxqJzM44qBg817ceU732ckRwSYLmsDWgkFLqbLFiCZAW/x3Wv
 XQdloskgqEdTimSi9IEPzRge9mmEuKlaC8I0wftIG8IcR7V2ZssU6bWgR
 N51DOuV/yps7PNH935QGyiV65CSyeybG5qkL/yFqgS2BSD6uX51t6tFLI g==;
X-CSE-ConnectionGUID: PIXTn14zRayj4fq+vAV5cg==
X-CSE-MsgGUID: oB+Ikg+TTaatrj5ZDQaqLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70819906"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70819906"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:09:00 -0800
X-CSE-ConnectionGUID: /OBnrsiyS6GLqiucywBKhw==
X-CSE-MsgGUID: KoAGUY9SQnOlF1L3qTlWdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="231282841"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:08:59 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v3 i-g-t 05/10] lib/igt_sriov_device: Add helper for PF/VF
 sysfs path formatting
Date: Wed, 28 Jan 2026 19:08:11 +0100
Message-ID: <20260128180819.1373376-6-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
References: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
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
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
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

