Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CB8D5B16E
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 13:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6C510E49E;
	Mon, 15 Dec 2025 13:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtHT2myv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B076610E49E
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 13:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765804951; x=1797340951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Th26+hew3AZlfmVtYnR6m+3gcmyD8mH+A20246IXjrE=;
 b=YtHT2myvOzKene+pfKQGA9a79UuCo0hBlxQq792er0oguYXv8khgbXYC
 kiwpSwGpA75+Nzegl9lRy3uC1KpI7teY67LUl1PanhRNyqSaLbw6lpPi5
 FZXYVdXjCGbbn83GX4blY6ptDN49SWEa9toNm2prX82PAW+Ijk6h34mwB
 0jzaiz+y2/Ttbv18zb99+mF2F0eG+NE44Lc4T3zRXQrj2UjSZXIswDNXk
 GeR2qbfTc2SbpL2EmZR1xyiRlZBxnkObrSMtxGbF60uTVwvDEA9/j1Z5f
 Oq7uCoFIZSWDotlRS9MurA18w0pR+bHUvOEBuZ8MW755p2MzBf6qoxY6o A==;
X-CSE-ConnectionGUID: bkUaSSj+SMeka9HeE1MrZw==
X-CSE-MsgGUID: OuSK/Gu+TimsZhIkCuAuMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67587430"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67587430"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 05:22:31 -0800
X-CSE-ConnectionGUID: fad35UhbSoK40pgP1ZFR2Q==
X-CSE-MsgGUID: k3lz1GKIR3KeSAsilCOqwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="202632404"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 15 Dec 2025 05:22:28 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH i-g-t 1/1] tests/i915_pm_rps: Improve error reporting for
 sysfs write failures
Date: Mon, 15 Dec 2025 18:51:34 +0530
Message-ID: <20251215132132.1195570-4-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215132132.1195570-3-mallesh.koujalagi@intel.com>
References: <20251215132132.1195570-3-mallesh.koujalagi@intel.com>
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

Add detailed error logging when writing to RPS sysfs files fails.
This helps diagnose issues where frequency writes are rejected by
the kernel, particularly after events like GPU resets or during
frequency transistions.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 tests/intel/i915_pm_rps.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index f97a716be..02c807399 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -201,6 +201,15 @@ static void wait_freq_settle(int gt_id)
 	}
 }
 
+static const char *get_sysfs_filename(FILE *filp, int gt_id)
+{
+	for (int i = 0; i < NUMFREQ; i++) {
+		if (sysfs_files[gt_id][i].filp == filp)
+			return sysfs_files[gt_id][i].name;
+	}
+	return "unknown";
+}
+
 static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check, int gt_id)
 {
 	int ret, orig;
@@ -217,7 +226,10 @@ static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check, int
 	} else {
 		if (ret < 0) {
 			int freqs[NUMFREQ];
+			const char *filename = get_sysfs_filename(filp, gt_id);
 
+			igt_warn("GT%d: Failed to write rps_%s_freq_mhz with value %d, errno=%d (%s)\n",
+				 gt_id, filename, val, errno, strerror(errno));
 			read_freqs(freqs, gt_id);
 			dump(freqs, gt_id);
 		}
-- 
2.43.0

