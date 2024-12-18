Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7E7E77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 12:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC8810E26C;
	Wed, 18 Dec 2024 12:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUtGBtqN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F32610E26C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734523292; x=1766059292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eFFoELOmicXp7eOlUYllQHMUNgtn/vRtAHegfe59JvI=;
 b=dUtGBtqNIY1b5RAAeJgS5jPQVvLdlzNGvUQpGlUbm0+2ZTH288R3wW1L
 RxV8UmtOyn3VFug4QfKckW78lvj9TS69cFc+D4FNv0XQmbxooIUo48CQU
 a29HYjykD4h9JpwNqo7+zOwJeoCq38uQE+fyuFMGJ7NJSRotJcpKgTqcU
 LAdcKVV/EuDU86vsml1w+GX51zHoVRgPuY2swtyksZEeAVnYofB3Nvaox
 290oisHyjDKQ1G9rPDmC8N2V2cXGlwj0Ot6g3+IvWSYu/lAYDw19talx3
 Q7qlUgkYmvgt7Xq/dV2k9uBNi0RkCGJ8dasMrGR8f1ueYXxvMBYTlDvrs w==;
X-CSE-ConnectionGUID: Fe63puRGRjG2oaxSSrST+Q==
X-CSE-MsgGUID: bb0o/AbXR4aRBn7fhQqoRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35143192"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35143192"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:01:32 -0800
X-CSE-ConnectionGUID: JmfPsdxZToC0Oa8H7CWNDA==
X-CSE-MsgGUID: 7Emk4nXMQiCC3cFMS1A99g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="98076252"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:01:23 -0800
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
Subject: [PATCH i-g-t 3/5] lib/xe/xe_sriov_provisioning: Add shared resource
 provisionability check
Date: Wed, 18 Dec 2024 13:00:54 +0100
Message-Id: <20241218120056.779962-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
References: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
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

Introduce a helper `xe_sriov_is_shared_res_provisionable` to determine
if a shared resource can be provisioned.

Add macros `xe_sriov_for_each_shared_res` and
`xe_sriov_for_each_provisionable_shared_res` to iterate over shared
resources and provisionable shared resources, respectively.

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
 lib/xe/xe_sriov_provisioning.c | 22 ++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 536121931..22035ffd8 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -9,6 +9,7 @@
 #include "intel_chipset.h"
 #include "linux_scaffold.h"
 #include "xe/xe_mmio.h"
+#include "xe/xe_query.h"
 #include "xe/xe_sriov_debugfs.h"
 #include "xe/xe_sriov_provisioning.h"
 
@@ -274,3 +275,24 @@ void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
 {
 	igt_fail_on(__xe_sriov_pf_set_shared_res_attr(pf, res, vf_num, gt_num, value));
 }
+
+/**
+ * xe_sriov_is_shared_res_provisionable - Check if a shared resource is provisionable
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @gt_num: GT number
+ *
+ * Determines whether a specified shared resource can be provisioned.
+ *
+ * Return: true if the shared resource is provisionable, false otherwise.
+ */
+bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res,
+					  unsigned int gt_num)
+{
+	if (res == XE_SRIOV_SHARED_RES_LMEM)
+		return xe_has_vram(pf) && !xe_is_media_gt(pf, gt_num);
+	else if (res == XE_SRIOV_SHARED_RES_GGTT)
+		return !xe_is_media_gt(pf, gt_num);
+
+	return true;
+}
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index 168b50394..b4300ec2e 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -27,6 +27,34 @@ enum xe_sriov_shared_res {
 	XE_SRIOV_SHARED_RES_LMEM,
 };
 
+/**
+ * XE_SRIOV_SHARED_RES_NUM - Number of shared resource types
+ */
+#define XE_SRIOV_SHARED_RES_NUM (XE_SRIOV_SHARED_RES_LMEM + 1)
+
+/**
+ * xe_sriov_for_each_shared_res - Iterate over all shared resource types
+ * @res: Loop counter variable of type `enum xe_sriov_shared_res`
+ *
+ * Iterates over each shared resource type defined in the `enum xe_sriov_shared_res`.
+ */
+#define xe_sriov_for_each_shared_res(res) \
+	for ((res) = 0; (res) < XE_SRIOV_SHARED_RES_NUM; (res)++)
+
+/**
+ * xe_sriov_for_each_provisionable_shared_res - Iterate over provisionable shared
+ * resource types
+ * @res: Loop counter variable of type `enum xe_sriov_shared_res`
+ * @pf: PF device file descriptor of type int
+ * @gt: GT number of type unsigned int
+ *
+ * Iterates over each provisionable shared resource type for the given PF device
+ * and GT number.
+ */
+#define xe_sriov_for_each_provisionable_shared_res(res, pf, gt) \
+	for ((res) = 0; (res) < XE_SRIOV_SHARED_RES_NUM; (res)++) \
+		for_if(xe_sriov_is_shared_res_provisionable((pf), (res), (gt)))
+
 /**
  * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
  * @vf_id: The ID of the VF
@@ -43,6 +71,7 @@ struct xe_sriov_provisioned_range {
 };
 
 const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
+bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res, unsigned int gt);
 int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
 					       struct xe_sriov_provisioned_range **ranges,
 					       unsigned int *nr_ranges);
-- 
2.31.1

