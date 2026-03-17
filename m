Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80570FEDA14
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 19:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F2810E1B3;
	Tue, 17 Mar 2026 19:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eavh6lph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6562810E1B3
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 19:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773775817; x=1805311817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qPgFeouFudmKIb/tDXs+vCPBEDkmnfLJCKL4MnIxhcA=;
 b=eavh6lphvU0SDxSn4TxAX4FkwaOejsLrWa3G/ho35+nS2jMTvD+zyJUn
 L80uY/Jr03Ktpa7sZIKBsA3+gMeN5okM8DOp2OBdUwHtPT8WVFlbKTNm4
 nGpIbCuwbwD7l4MBCXrgsTDN43U7bLN4yQY4kLIvGrkr8YwRdCZ6PExDc
 T2MOGi1EDhxqpzxQgycAxCbVGQQvaXsQax9HUd/FdfTM+m1FAw8U+Urcz
 pXz+OIZ9krLyS1p/kEEx+M6CkWYGFo/A2Fd0ene4IuyMTeWl0yn7a9gZh
 buV5E2hhFw6dGGdWH2aC0kU+5Ku92WjeXJy7MokYT9m3cy70gqcfEehj9 A==;
X-CSE-ConnectionGUID: lscNCtF3QLWz8vRph1UKEg==
X-CSE-MsgGUID: 4UPAOGykSqWRl1xdPnFvtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86295643"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="86295643"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 12:30:16 -0700
X-CSE-ConnectionGUID: 8hjzUxDkQr6ET8rWMTAmXw==
X-CSE-MsgGUID: RcCIiO/6Tw2rm66k4toFAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="216681186"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 12:30:14 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] lib/igt_psr: Fix Early Transport status handling
Date: Wed, 18 Mar 2026 01:00:58 +0530
Message-ID: <20260317193058.722290-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226094251.3986123-1-ramanaidu.naladala@intel.com>
References: <20260226094251.3986123-1-ramanaidu.naladala@intel.com>
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

Switch PSR status reads to the connector‑specific debugfs path
to avoid ambiguity on dual eDP or multi‑output systems. This
ensures the Early Transport state is checked for the correct
connector.

Update the Early Transport debugfs handling in line with changes
introduced in KMD (commit c390bf07961b, "drm/i915/dp: Fix panel
replay when DSC is enabled").

v2: Addressed review comments. (jeevan)

Link: https://lore.kernel.org/all/20251015161934.262108-8-imre.deak@intel.com/

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_psr.c             | 8 +++++---
 lib/igt_psr.h             | 2 +-
 tests/intel/kms_psr2_sf.c | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 7e50c3dc6..09c34c97d 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -69,14 +69,16 @@ static bool psr_active_sink_check(int debugfs_fd, igt_output_t *output)
 /*
  * Checks if Early Transport is enabled in PSR status by reading the debugfs.
  */
-bool early_transport_check(int debugfs_fd)
+bool early_transport_check(int debugfs_fd, igt_output_t *output)
 {
 	char buf[PSR_STATUS_MAX_LEN];
+	char debugfs_file[128] = {0};
 
-	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
+	SET_DEBUGFS_PATH(output, debugfs_file);
+	igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
 				sizeof(buf));
 
-	return strstr(buf, "enabled (Early Transport)");
+	return strstr(buf, "Early Transport");
 }
 
 static bool sink_status_checks(void)
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 7639f8d46..53ab04483 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -49,7 +49,7 @@ enum fbc_mode {
 
 bool psr_disabled_check(int debugfs_fd);
 bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
-bool early_transport_check(int debugfs_fd);
+bool early_transport_check(int debugfs_fd, igt_output_t *output);
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 1cc57ad35..7503c7682 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -961,7 +961,7 @@ static void run(data_t *data)
 			     "FBC still disabled\n");
 
 	if (is_et_check_needed(data))
-		igt_assert_f(early_transport_check(data->debugfs_fd),
+		igt_assert_f(early_transport_check(data->debugfs_fd, data->output),
 			     "Early Transport Disabled\n");
 
 	data->screen_changes = 0;
-- 
2.43.0

