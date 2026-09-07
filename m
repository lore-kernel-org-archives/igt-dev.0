Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B36AC79F89
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 12:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B044810E02A;
	Mon,  7 Sep 2026 12:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pcz2bwCx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1213C10E7EB
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 12:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788785230; x=1820321230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aLdQgHD97SrA6sv/m3OLDRC/kC/EEgIP/9V0QkGogps=;
 b=Pcz2bwCxUXY+Ye+pEhGDpM6d3F9XfBDrWtI/DrfPo7Edjov4/DTX1j7J
 K1YbRyBUBAEKhiMj8Dut4LLVeufzY73GOfOXxAMOX/bY1LAhiS1lRqzp/
 nBeeVm1y3TjxWcrcUc7MwaH+EHXFZaLaJUvtX/fNHld++nE+ZPz92NofG
 Lsjzjs00ZqYjHCiyh/I8zD00HdVvSEnNOGEQJu/JtNzE/UqFO7ByOBqih
 nmXnAYUdy8a5Lle8V9gTrLiQMOe+W7pjz48gPb/2NptzHeLQfDKnoeuEb
 5MS3biH3IkZLjGuJiAz+TZNnGevjgf6AXbIyNsRzKR+a2oMyva5ObZ5B7 g==;
X-CSE-ConnectionGUID: EdqJkhQ7RMGP5sxcx7k4tg==
X-CSE-MsgGUID: oFKcJOYQTZK917Ey5T1dPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="91697194"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="91697194"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:47:10 -0700
X-CSE-ConnectionGUID: 64AA1z4aQ2Ok7A9p8bfgmw==
X-CSE-MsgGUID: K+2nIWOsQqSi+jOTQPqDiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="272631596"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:47:09 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	piotr.piorkowski@intel.com
Subject: [PATCH v2 1/3] lib/igt_sriov_device: Add helper to get SR-IOV
 function name
Date: Mon,  7 Sep 2026 14:46:56 +0200
Message-ID: <20260907124658.613244-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907124658.613244-1-lukasz.laguna@intel.com>
References: <20260907124658.613244-1-lukasz.laguna@intel.com>
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

