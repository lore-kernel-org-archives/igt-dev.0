Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5BACCA472
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 10:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FE310E312;
	Wed,  1 Oct 2025 10:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyEXIfDN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E94F10E309
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 10:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759313941; x=1790849941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kPVlKrBSEPrv0pyC5Rxey02iOK2+S8Tms//7zX3FYSw=;
 b=cyEXIfDNJxYUA49bmosYPKG7iTxyeLEoykbhl1l/pKbNvAI0epXjLPlU
 rKinu3ad/JenS4unXxGNLqSr4K0rcbM0kkViLmag9XNMJy0dlxD8UEK17
 54hWdzol16gtPHbkrN026j2QGpWsMLhmKGf8+UQjoE4phRVc/pHvCAyYF
 MvHtljwlEkYamMd69NRwVcJ5xzM8P41TltsgAZiUVOgts8VXhP/OmgL/I
 +itGgNdlf/xsu77UISUNSBXxGZx+3onZ7plvKJaRpixX4REBtHskfh7xG
 Yw+HdLrG1YzLwjHMM+pTOVqn1AdebM9B15T9BH6xKuI/nF1IQFuuZiAs5 A==;
X-CSE-ConnectionGUID: pnzvOZUdRbi9kK4QcFAvOA==
X-CSE-MsgGUID: c1CI0mTfQqibatcNUVxU1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60798364"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="60798364"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 03:19:01 -0700
X-CSE-ConnectionGUID: YyGonWpYQ7aGg/q9xzxtbg==
X-CSE-MsgGUID: nsFc/65TQ9yWY0h9cg3BBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178036805"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 03:19:00 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t v4 1/4] lib/igt_sriov_device: Add helper to iterate over
 enabled VFs
Date: Wed,  1 Oct 2025 12:18:47 +0200
Message-Id: <20251001101850.25299-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251001101850.25299-1-lukasz.laguna@intel.com>
References: <20251001101850.25299-1-lukasz.laguna@intel.com>
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

Helper allows to iterate over enabled VFs.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 lib/igt_sriov_device.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index 912449086d..930e97982b 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -87,6 +87,18 @@ igt_sriov_random_vf_in_range(int pf_fd, unsigned int start, unsigned int end)
 	     ++__vf_num)
 #define for_each_sriov_num_vfs for_each_sriov_vf
 
+/**
+ * for_each_sriov_enabled_vf - Helper for running code on each enabled VF
+ * @__pf_fd: PF device file descriptor
+ * @__vf_num: VFs iterator
+ *
+ * For loop that iterates over all enabled VFs associated with given PF @__pf_fd.
+ */
+#define for_each_sriov_enabled_vf(__pf_fd, __vf_num) \
+	for (unsigned int __vf_num = 1, __enabled_vfs = igt_sriov_get_enabled_vfs(__pf_fd); \
+	     __vf_num <= __enabled_vfs; \
+	     ++__vf_num)
+
 /**
  * for_each_sriov_vf_in_range - Iterate over VFs in a specified range
  * @__pf_fd: PF device file descriptor
-- 
2.40.0

