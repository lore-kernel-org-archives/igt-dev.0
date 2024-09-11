Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEAAEE0209
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 05:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F46310E967;
	Wed, 11 Sep 2024 05:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+4hMOVs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EAA10E967
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 05:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726033827; x=1757569827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z1sBc8+czXYDi5fOeiycnECyv+/IbMIwoGifTfpK5dw=;
 b=k+4hMOVsDM9gtOwhXQE54nSYerar3+EthdW/hvn9LENMiZicF+L8nDvA
 IqHL+iltuTXdZnHJpvXzVt+vNJrEwJ1raeIi/qJK9qD2aRlOP1mr87vJ2
 cTspN2wJQpJFhLvBRqMszD1Xtnq9GB8PksD/IemSZk4p+8m2RZRusrjgz
 d3Oq41E6DhVKc27KxBBx4LUXh17sszbKDldOEP2anBnG11jqNlPZ+MQAK
 IVCTtfwlMQ+ttUDCvh7GUC4ihS9yJrRtiryATXqgIEm9+/pbymEBiRMTi
 PsVOFSoswpeEs3WGDX/TYoAbH3dMdWgiziNvhrDn1sSrI7oBUE8ys6t6R w==;
X-CSE-ConnectionGUID: YoAlLuHNQYuTpKnpLaIoMA==
X-CSE-MsgGUID: 5KBv5HTTRTqfOIr3ZnGQlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="25009373"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="25009373"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:50:26 -0700
X-CSE-ConnectionGUID: Zj+ID0laREWiaTwZttpztw==
X-CSE-MsgGUID: +4zFJdHNSwqP2Yh26TmhEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67540680"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 jhogande-mobl1..) ([10.245.244.65])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:50:25 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 1/5] lib/igt_psr: Add mechanism to check sink status
 as well
Date: Wed, 11 Sep 2024 08:49:54 +0300
Message-Id: <20240911054958.1023925-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911054958.1023925-1-jouni.hogander@intel.com>
References: <20240911054958.1023925-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We have seen passing PSR testcases even though panel is not even aware of
PSR being used. This can happen because we currently not checking sink PSR
statuses at all. Also sink might have detected errors but our testcase
currently don't care about that.

Help the gap described above by adding new interface to check sink error
statuses. Also add sink status check to be part of psr_is_active check.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_psr.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_psr.h |  1 +
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index e3e7577eb..47517b5dc 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -52,6 +52,19 @@ bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
 
 	return strstr(buf, "PSR2 selective fetch: enabled");
 }
+static bool psr_active_sink_check(int debugfs_fd, igt_output_t *output)
+{
+	char debugfs_file[128] = {0};
+	char buf[PSR_STATUS_MAX_LEN];
+	int ret;
+
+	sprintf(debugfs_file, "%s/i915_psr_sink_status", output->name);
+	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
+				      sizeof(buf));
+	igt_assert_f(ret >= 1, "Failed to read sink status\n");
+
+	return strstr(buf, "0x2 [active, display from RFB]");
+}
 
 /*
  * Checks if Early Transport is enabled in PSR status by reading the debugfs.
@@ -72,6 +85,7 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 	char buf[PSR_STATUS_MAX_LEN];
 	drmModeConnector *c;
 	const char *state;
+	bool active;
 	int ret;
 
 	if (mode == PR_MODE || mode == PR_MODE_SEL_FETCH) {
@@ -100,7 +114,11 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 
 	igt_skip_on(strstr(buf, "PSR sink not reliable: yes"));
 
-	return strstr(buf, state);
+	active = strstr(buf, state);
+	if (active && output)
+		active = psr_active_sink_check(debugfs_fd, output);
+
+	return active;
 }
 
 /*
@@ -297,6 +315,38 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 	}
 }
 
+/**
+ * psr_sink_error_check
+ * Check and assert on PSR errors detected by panel
+ *
+ * Returns:
+ * None
+ */
+void psr_sink_error_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
+{
+	char *line;
+	char debugfs_file[128] = {0};
+	char buf[PSR_STATUS_MAX_LEN];
+	int ret;
+
+	sprintf(debugfs_file, "%s/i915_psr_sink_status", output->name);
+	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
+				      sizeof(buf));
+	igt_assert_f(ret >= 1, "Failed to read sink status\n");
+
+	line = strstr(buf, "error status: 0x0");
+
+	/*
+	 * On certain PSR1 panels we are seeing "PSR VSC SDP
+	 * uncorrectable error" bit set even it is applicable for PSR1
+	 * only
+	 */
+	if (!line && mode == PSR_MODE_1)
+		line = strstr(buf, "Sink PSR error status: 0x4");
+
+	igt_assert_f(line, "Sink detected PSR error(s):\n%s\n", buf);
+}
+
 #define PSR2_SU_BLOCK_STR_LOOKUP "PSR2 SU blocks:\n0\t"
 
 /* Return the the last or last but one su blocks */
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index a7ebd0739..7639f8d46 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -56,6 +56,7 @@ bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *outp
 bool psr_enable(int device, int debugfs_fd, enum psr_mode, igt_output_t *output);
 bool psr_disable(int device, int debugfs_fd, igt_output_t *output);
 bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output_t *output);
+void psr_sink_error_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
 void psr_print_debugfs(int debugfs_fd);
 enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output);
-- 
2.34.1

