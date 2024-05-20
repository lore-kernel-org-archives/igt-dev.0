Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EBEC04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 09:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A6C10E32F;
	Mon, 20 May 2024 09:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fRomWjBI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C329E10E577
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 09:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716197731; x=1747733731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IPutFw100BhyeIpSvzqWBU9JTNOpfAOjR+KaUytIy5Q=;
 b=fRomWjBI5j6usMNY9PITLMeANIZk7o68N0OmCuVy23dTGKygYi+3QFv3
 i/ppSgyUzFjwADJpWQ1SHlOeywChKp9w1w8nejoAb8FbvVmJ9VXYlAkCP
 maKuHnFEXLiIIg/TdsEl2u3s3KhXauDB5Rz70RyqI6jH7wvLWwJAiVkqE
 LX7v8P5qkZ1PqyzKo9nDlT0LYJgppmh9HrMDmIMJjhexEPGAKPXXOrkUy
 usb5yLcpXNbTJvpb7lqvg0vVEcyUlJuowCHse4xW8n71fNUgvM3tphBrL
 NYevbda+tk5kaaMvEJEshhJvKL8KF9+u7GfOsY8QJLC27iJqxsFby/7CV A==;
X-CSE-ConnectionGUID: bmwxJzzMRMW7tA1hJzGnIQ==
X-CSE-MsgGUID: zjblnXROQB+E8Hxm6k0S4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="23729026"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="23729026"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 02:35:31 -0700
X-CSE-ConnectionGUID: 5EPjjOLzTKWG1HnsVLy+rg==
X-CSE-MsgGUID: ro6LeD3QTf+RtzhXoXlfjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="32333462"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 02:35:29 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_psr: Added library functions for early
 trasport
Date: Mon, 20 May 2024 15:16:19 +0530
Message-Id: <20240520094620.3713972-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240520094620.3713972-1-jeevan.b@intel.com>
References: <20240520094620.3713972-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_psr.c | 13 +++++++++++++
 lib/igt_psr.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 6008b73a6..8dc6b9b78 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -53,6 +53,16 @@ bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
 	return strstr(buf, "PSR2 selective fetch: enabled");
 }
 
+bool psr2_early_transport_check(int debugfs_fd)
+{
+	char buf[PSR_STATUS_MAX_LEN];
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
+				sizeof(buf));
+
+	return strstr(buf, "PSR2 Early Transport: enabled");
+}
+
 static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
 	char debugfs_file[128] = {0};
@@ -249,6 +259,9 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
 	case PR_MODE:
 		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = no");
+	case ET_MODE:
+		return strstr(buf, "Sink support: yes [0x04]") ||
+			     (strstr(line, "PSR = yes") && strstr(line, "Early Transport = yes"));
 	case PR_MODE_SEL_FETCH:
 		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = yes");
 	default:
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index e8595fd8c..23f4dd35b 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -37,6 +37,7 @@ enum psr_mode {
 	PSR_MODE_2_SEL_FETCH,
 	PR_MODE,
 	PR_MODE_SEL_FETCH,
+	ET_MODE,
 	PSR_DISABLED,
 };
 
@@ -47,6 +48,7 @@ enum fbc_mode {
 
 bool psr_disabled_check(int debugfs_fd);
 bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
+bool psr2_early_transport_check(int debugfs_fd);
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
-- 
2.25.1

