Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5276FC2BB85
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 04:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE00310E25C;
	Thu, 20 Jun 2024 04:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LaQcjmBR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5A110E25C
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 04:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718857514; x=1750393514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2xP6XJwTXwzoCy4dkdPB4LXMXQCna96T7P2eN2tpkOY=;
 b=LaQcjmBRTARLyr2mga9bsiI37VsDiHcBqKzxpWTujIc2nE82PrERYoaS
 Ai7H1El6LtZux1BJoaW16m3mb02qqCapXILbhjZb/tt2LA5T8UZ1qos2k
 bvldm/ZUOtoOPh7K5Zk2lAx08KZ0DpRZXq6fhV215AaYg/elvci1eTA51
 jZBD4rLJ02B/B1w2c1flb+XngxaUkSa/fR3JZhC4czvIHkQGp3VU4uy7I
 bDMRNbRBlNge/k39SmUNkyAi/EWGH2hPgK7tEygWXNJ61kAKov3Qkhbr4
 6aEi5BtqQf1aQpWKntfdAeVlynrm5fF2PcjI8B5Ws7IIbV94yPz0hTo7M w==;
X-CSE-ConnectionGUID: d8Mcrho/SwuVpiNWjYoQlQ==
X-CSE-MsgGUID: ICQbJ8PTRgqn6P2Hq0I8OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19692106"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="19692106"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 21:25:14 -0700
X-CSE-ConnectionGUID: zJapw8cdSBa7wil3VKtKsg==
X-CSE-MsgGUID: 4wPwCRnWS3CGKSwNFXjhmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="72850648"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 21:25:12 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_psr: Added library functions for early
 trasport
Date: Thu, 20 Jun 2024 10:03:40 +0530
Message-Id: <20240620043341.1438736-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620043341.1438736-1-jeevan.b@intel.com>
References: <20240620043341.1438736-1-jeevan.b@intel.com>
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

Added helper functions to check sink support for early transport and
check early transport active check.

v2: Add early trasport for PR and PSR2.
v3: Fix check strings.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_psr.c | 14 ++++++++++++++
 lib/igt_psr.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 6008b73a6..c170d8ca8 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -53,6 +53,16 @@ bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
 	return strstr(buf, "PSR2 selective fetch: enabled");
 }
 
+bool early_transport_check(int debugfs_fd)
+{
+	char buf[PSR_STATUS_MAX_LEN];
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
+				sizeof(buf));
+
+	return strstr(buf, "enabled (Early Transport)");
+}
+
 static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
 	char debugfs_file[128] = {0};
@@ -247,10 +257,14 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 		       strstr(buf, "Sink support: yes [0x04]") ||
 		       (strstr(line, "PSR = yes") &&
 		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
+	case PSR_MODE_2_ET:
+		return strstr(buf, "Sink support: yes [0x04]");
 	case PR_MODE:
 		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = no");
 	case PR_MODE_SEL_FETCH:
 		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = yes");
+	case PR_MODE_SEL_FETCH_ET:
+		return strstr(line, "Panel Replay Selective Update = yes (Early Transport)");
 	default:
 		igt_assert_f(false, "Invalid psr mode\n");
 		return false;
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index e8595fd8c..a7ebd0739 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -35,8 +35,10 @@ enum psr_mode {
 	PSR_MODE_1,
 	PSR_MODE_2,
 	PSR_MODE_2_SEL_FETCH,
+	PSR_MODE_2_ET,
 	PR_MODE,
 	PR_MODE_SEL_FETCH,
+	PR_MODE_SEL_FETCH_ET,
 	PSR_DISABLED,
 };
 
@@ -47,6 +49,7 @@ enum fbc_mode {
 
 bool psr_disabled_check(int debugfs_fd);
 bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
+bool early_transport_check(int debugfs_fd);
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
-- 
2.25.1

