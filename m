Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DB8C982F1
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 06:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1436810EBC7;
	Tue, 22 Sep 2026 06:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNLsdmUQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8E010E41C
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 06:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790059947; x=1821595947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2pGuRojFIQwRLMAHwoZOp74VU/9F8kl9t7j4RyP4+8s=;
 b=RNLsdmUQbUCk7jxamIM3KSDzEmZdfPmY2peNe9PzKZO0yTsuVghomM3O
 v3XbOk5NDaiPH4cb37JE3v5sv6gwzTNVlDLRxu8QK4yJB50f8gn6nHZp3
 lMjm6MTCKz65b/jMki9WFVHJh4yYRVSVXDFjf2TD80JkWbz9gneJPmJfK
 /iMUtKBVSyj2eKhpBuX1hhQrDXzBV6tTrj2WRaDok/wu35uag1ONyP8Iu
 2S7e8hIyqLE+AalJhNYeRzlLrxlJxeYScnEwNm8PleBGSU7B2yEWMxWM6
 ZKYUNQsY5fhfvMK1fGInuC+SAkWLdWNvxupcELIgpvPSPWo1tv0QRCKTP w==;
X-CSE-ConnectionGUID: ysawtz66RZ6vyL4dhF48Hw==
X-CSE-MsgGUID: 8ez2lCLJR8qwgRTkqdvUmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1137388"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1137388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 23:52:27 -0700
X-CSE-ConnectionGUID: +zlkqlEmTzS5CeQiLwNj2g==
X-CSE-MsgGUID: hca0uGecQJ+JxqTfK1kKPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="299239627"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 23:52:25 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
Subject: [PATCH v3 1/3] lib/igt_sriov_device: Add helpers to get SR-IOV
 function name
Date: Tue, 22 Sep 2026 08:52:09 +0200
Message-ID: <20260922065211.3004767-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922065211.3004767-1-lukasz.laguna@intel.com>
References: <20260922065211.3004767-1-lukasz.laguna@intel.com>
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

Introduce helpers to format SR-IOV function names in lowercase and
uppercase variants. They format PF as "pf" or "PF" and VFs as "vf%u" or
"VF%u" depending on the variant.

Keep igt_sriov_func_str() as a compatibility wrapper around the
lowercase, so existing callers continue to work while the code migrates
to the new API.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/igt_sriov_device.c | 53 +++++++++++++++++++++++++++++++++++++++---
 lib/igt_sriov_device.h |  2 ++
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 6c9fbdf70..de446aca1 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -54,13 +54,60 @@ const char *igt_sriov_func_str(unsigned int vf_num)
 {
 	static __thread char buf[16];
 
-	if (vf_num == 0)
-		return "pf";
+	return igt_sriov_function_name_lower(vf_num, buf, sizeof(buf));
+}
+
+static const char *sriov_function_name(unsigned int vf_num, bool uppercase,
+				       char *buf, size_t size)
+{
+	int ret;
+
+	igt_assert(buf && size);
+
+	if (vf_num)
+		ret = snprintf(buf, size, uppercase ? "VF%u" : "vf%u", vf_num);
+	else
+		ret = snprintf(buf, size, uppercase ? "PF" : "pf");
+
+	igt_assert(ret >= 0 && (size_t)ret < size);
 
-	snprintf(buf, sizeof(buf), "vf%u", vf_num);
 	return buf;
 }
 
+/**
+ * igt_sriov_function_name_lower - Get SR-IOV function name in lowercase
+ * @vf_num: VF number (1-based to identify single VF) or 0 for PF
+ * @buf: buffer
+ * @size: size of the buffer
+ *
+ * It formats the function name as "pf" when @vf_num is 0, or as "vf%u"
+ * when @vf_num is greater than 0.
+ *
+ * Return: formatted function name.
+ */
+const char *igt_sriov_function_name_lower(unsigned int vf_num, char *buf,
+					 size_t size)
+{
+	return sriov_function_name(vf_num, false, buf, size);
+}
+
+/**
+ * igt_sriov_function_name_upper - Get SR-IOV function name in uppercase
+ * @vf_num: VF number (1-based to identify single VF) or 0 for PF
+ * @buf: buffer
+ * @size: size of the buffer
+ *
+ * It formats the function name as "PF" when @vf_num is 0, or as "VF%u"
+ * when @vf_num is greater than 0.
+ *
+ * Return: formatted function name.
+ */
+const char *igt_sriov_function_name_upper(unsigned int vf_num, char *buf,
+					 size_t size)
+{
+	return sriov_function_name(vf_num, true, buf, size);
+}
+
 static bool __pf_attr_get_u32(int pf, const char *attr, uint32_t *value)
 {
 	int sysfs;
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index 4e4ba230a..0e94c521a 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -36,6 +36,8 @@ bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset(int pf, unsigned int vf_num);
 bool intel_is_vf_device(int device);
 const char *igt_sriov_func_str(unsigned int vf_num);
+const char *igt_sriov_function_name_lower(unsigned int vf_num, char *buf, size_t size);
+const char *igt_sriov_function_name_upper(unsigned int vf_num, char *buf, size_t size);
 typedef void (*igt_sriov_exit_cleanup_fn)(int pf, int sig, void *user_data);
 void igt_sriov_install_exit_handler(int pf,
 				    igt_sriov_exit_cleanup_fn cleanup_fn,
-- 
2.43.0

