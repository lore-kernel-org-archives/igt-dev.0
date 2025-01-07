Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739B2E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 18:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E16689C69;
	Tue,  7 Jan 2025 18:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zv+ynRxf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1170A10E77B
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 18:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736275926; x=1767811926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kjodSzCEd6edz1MEbeO2Wnk6x3yKBCbgea7g3Av43iY=;
 b=Zv+ynRxfQPmc8a+nRaH7VMit7M1Krml+H/h/vzN0tc8q/zE+nC+LvBVC
 1OI5Pi9MXEIc1kso+GpNPzRPmD/7b4qtGW3tIJQJBbQJ6bkUseqQ49nO0
 jD3dD+LzZ/SdjpbnJPa6jPH0oJqNYRn0WVuwt9gH/oIXn7/e9fJdkPNIV
 +mTUOGLLJZLgHFKBR3BRw3qv7+uQ1JRQ+9veCG5IUl3Wz/c6HnsCMd5T4
 cX6g8YT8sa/T3R6KVfBpf3w4AAM4n+Q2QAsHQ5qhwkTLKdQQZW5hs5jGL
 fq+L++LxH7QWeqH3AsYmxihvsFwSsHhPlwbjaZNRoDay6ydY8YMq8Ch3N w==;
X-CSE-ConnectionGUID: F+/r3mGzT7GYGjCFOSUVNA==
X-CSE-MsgGUID: GfLA6ly0R46C1u3FAtLzjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="58942024"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="58942024"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 10:52:06 -0800
X-CSE-ConnectionGUID: wAY6l7CWT12OX3RqAVrmXA==
X-CSE-MsgGUID: KjPi0LNCRqWz688dJl/Agw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103706861"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 10:52:03 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/4] tests/intel/kms_dsc_helper: Add helper func()
Date: Wed,  8 Jan 2025 00:27:08 +0530
Message-Id: <20250107185709.116756-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107185709.116756-1-swati2.sharma@intel.com>
References: <20250107185709.116756-1-swati2.sharma@intel.com>
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

Add (big|ultra) joiner helper functions.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc_helper.c | 46 ++++++++++++++++++++++++++++++++++++
 tests/intel/kms_dsc_helper.h |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index cea4304e4..8543498a7 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -201,3 +201,49 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
 
 	return true;
 }
+
+bool check_bigjoiner_constraints(int disp_ver, int n_pipes, int drmfd, igt_output_t *output)
+{
+	if (!igt_is_bigjoiner_supported_by_source(drmfd))
+		return false;
+
+	if (n_pipes < 2) {
+		igt_info("Bigjoiner requires minimum 2 pipes\n");
+		return false;
+	}
+
+	if (igt_get_dsc_sink_max_slice_count(drmfd, output->name) < 4) {
+		igt_info("Output %s doesn't support minimum 4 slice count\n", igt_output_name(output));
+		return false;
+	}
+
+	if (!igt_has_force_joiner_debugfs(drmfd, output->name)) {
+		igt_info("Output %s doesn't support force_joiner debugfs\n", igt_output_name(output));
+		return false;
+	}
+
+	return true;
+}
+
+bool check_ultrajoiner_constraints(int disp_ver, int n_pipes, int drmfd, igt_output_t *output)
+{
+	if (!igt_is_ultrajoiner_supported_by_source(drmfd))
+		return false;
+
+	if (n_pipes < 4) {
+		igt_info("Ultrajoiner requires minimum 4 pipes\n");
+		return false;
+	}
+
+	if (igt_get_dsc_sink_max_slice_count(drmfd, output->name) < 8) {
+		igt_info("Output %s doesn't support minimum 8 slice count\n", igt_output_name(output));
+		return false;
+	}
+
+	if (!igt_has_force_joiner_debugfs(drmfd, output->name)) {
+		igt_info("Output %s doesn't support force_joiner debugfs\n", igt_output_name(output));
+		return false;
+	}
+
+	return true;
+}
diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
index 4dbd88fe7..a24696640 100644
--- a/tests/intel/kms_dsc_helper.h
+++ b/tests/intel/kms_dsc_helper.h
@@ -38,5 +38,7 @@ void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
 void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
 void restore_force_dsc_fractional_bpp_en(void);
 bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
+bool check_bigjoiner_constraints(int disp_ver, int n_pipes, int drmfd, igt_output_t *output);
+bool check_ultrajoiner_constraints(int disp_ver, int n_pipes, int drmfd, igt_output_t *output);
 
 #endif
-- 
2.25.1

