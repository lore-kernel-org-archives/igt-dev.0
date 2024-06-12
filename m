Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57367C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 10:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B400B10E81E;
	Wed, 12 Jun 2024 10:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MW94w2gG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D0510E813
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 10:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718189927; x=1749725927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z5gKRp7R4o037O5FQqySMN8SVW82FAR3XOCsiQD1sMc=;
 b=MW94w2gGNJ2HxZCodwpwNuK1NgVNl9BPCF98oz5BCSfNYXkEc8Kq1BNO
 zbv0BbAvMr4ZN0u5YO4poxxPZ6rdzfvKg8m8oAz5Ft+XWmVtjOSgiLwR6
 +Qp+02pYRU2L11MEjAXZaJKYmEL5h/fAdNNEAY/NfeK1lSFhEuzkNRuAH
 ovKdQXRVH71OyG+/SSJkoS4FannGsp5I2GpQ/EPJ7A8Vi9iIsmHvjX7Qo
 8BY2JTvrpK8qWyctRbJMtEhfqsxQPht17QdEJVN9Kxy15Ql6hmNfwhsfC
 MtfCa4k975+RPJmMzF9RnKJ/3szghutwe/BMoBgDAENS4bsydrZMjr1w2 w==;
X-CSE-ConnectionGUID: XZOupD/kQJ2jnBHc1QJw8w==
X-CSE-MsgGUID: u8he+P/pSIaNGDRlHlSSKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="12036469"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="12036469"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:58:47 -0700
X-CSE-ConnectionGUID: ufwc/a5IQrqPrViLTk2osQ==
X-CSE-MsgGUID: kD3ZNtV5RM+0LbiPS2NNxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="39867167"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:58:45 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_psr: Added library functions for early
 trasport
Date: Wed, 12 Jun 2024 16:36:44 +0530
Message-Id: <20240612110645.1110374-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240612110645.1110374-1-jeevan.b@intel.com>
References: <20240612110645.1110374-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_psr.c | 15 +++++++++++++++
 lib/igt_psr.h |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 6008b73a6..b1ca57201 100644
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
+	return strstr(buf, "(Early Transport)");
+}
+
 static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
 	char debugfs_file[128] = {0};
@@ -247,10 +257,15 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 		       strstr(buf, "Sink support: yes [0x04]") ||
 		       (strstr(line, "PSR = yes") &&
 		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
+	case PSR_MODE_2_ET:
+		return strstr(buf, "Sink support: yes [0x04]") &&
+		       (strstr(line, "PSR2 (Early Trasport)") || strstr(line, "[0x04]"));
 	case PR_MODE:
 		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = no");
 	case PR_MODE_SEL_FETCH:
 		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = yes");
+	case PR_MODE_SEL_FETCH_ET:
+		return strstr(line, "Panel Replay Selective Update enabled (Early Trasport)");
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

