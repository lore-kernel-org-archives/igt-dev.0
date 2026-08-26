Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37F9C61DC2
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 08:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7951410EC49;
	Wed, 26 Aug 2026 08:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YeE+rI3K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6D810EBF2
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 08:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787733459; x=1819269459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aLdQgHD97SrA6sv/m3OLDRC/kC/EEgIP/9V0QkGogps=;
 b=YeE+rI3K8qBRyE+QHa315lzmh9gGS/m3pMTlNYIONOq3IYLniZFMb16X
 D2isA0/rrDcnuHfTsV5BE93vSHhyqxvrhT3X65b/8yWQ9MVXel6gPl54I
 qJRPXXV4fl5tbSH//97K4UlpARfUKg8BhC2f/j22C8RYw9YxxI4gCOUtt
 uETUWMATEVcQO/DPAD+HhgkWVkGWiZ03a+RGUXe6loqLhLhog5tnxbd/F
 PxokZOmaL+kCBOV9PsWomInTZi+2UH0z2kLunwUKkGjdCd1OvZT6oIwZc
 MAtQgTB25RPoLgYcJADt7cHifuz9PTN5aItffRo7e5G37qK4tkVV/vh5p A==;
X-CSE-ConnectionGUID: n2rl4/q7TLSC9sYp+sposw==
X-CSE-MsgGUID: CshfurXgTN+A4iyOuGSgaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88088443"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88088443"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 01:37:38 -0700
X-CSE-ConnectionGUID: wo196YmRRuyQFtUPsod0bA==
X-CSE-MsgGUID: rLQPodsmS3GEQOqFDs1ycg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="266940018"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 01:37:37 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	piotr.piorkowski@intel.com
Subject: [PATCH v1 1/3] lib/igt_sriov_device: Add helper to get SR-IOV
 function name
Date: Wed, 26 Aug 2026 10:37:28 +0200
Message-ID: <20260826083730.2750-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826083730.2750-1-lukasz.laguna@intel.com>
References: <20260826083730.2750-1-lukasz.laguna@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Introduce a helper to format SR-IOV function names. It returns "PF" for
physical function and "VF%u" for virtual functions.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/igt_sriov_device.c | 23 +++++++++++++++++++++++
 lib/igt_sriov_device.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 6c9fbdf70..392c80346 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -61,6 +61,29 @@ const char *igt_sriov_func_str(unsigned int vf_num)
 	return buf;
 }
 
+/**
+ * igt_sriov_function_name - Get SR-IOV function name
+ * @vf_num: VF number (1-based to identify single VF) or 0 for PF
+ * @buf: buffer
+ * @size: size of the buffer
+ *
+ * It formats the function name as "PF" when @vf_num is 0, or as "VF%u"
+ * when @vf_num is greater than 0.
+ *
+ * Return: formatted function name.
+ */
+const char *igt_sriov_function_name(unsigned int vf_num, char *buf, size_t size)
+{
+	int n;
+
+	n = vf_num ? snprintf(buf, size, "VF%u", vf_num) :
+		     snprintf(buf, size, "PF");
+
+	igt_assert(n >= 0 && (size_t)n < size);
+
+	return buf;
+}
+
 static bool __pf_attr_get_u32(int pf, const char *attr, uint32_t *value)
 {
 	int sysfs;
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index 4e4ba230a..a969d4172 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -36,6 +36,7 @@ bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset(int pf, unsigned int vf_num);
 bool intel_is_vf_device(int device);
 const char *igt_sriov_func_str(unsigned int vf_num);
+const char *igt_sriov_function_name(unsigned int vf_num, char *buf, size_t size);
 typedef void (*igt_sriov_exit_cleanup_fn)(int pf, int sig, void *user_data);
 void igt_sriov_install_exit_handler(int pf,
 				    igt_sriov_exit_cleanup_fn cleanup_fn,
-- 
2.43.0

