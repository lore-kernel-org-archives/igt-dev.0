Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BE3D116F3
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 17:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872BD10E2BD;
	Mon,  1 Dec 2025 17:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/ntykft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E8010E2BD
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 17:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764610404; x=1796146404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8PUS7VGTRHuPvktlQHioEtaMNqvoXIysC7AcxowXLi0=;
 b=Z/ntykftNi4qrgQKrAlsUJQmWgJhC5hI+vNJ7ERE+wUYkSzpHZAVy21l
 hbP92G3XGCMVBNplZDV75CdYM6evH5zrH3i3hkfRgtm/GE24An1O+Ny5A
 prJdM6SETkO4+tc+4k9Rd07xYG2EO8N5HbkAeIlVkX4r9jmNY/EKHKrX9
 2U1db40MlJsit+Yn72R6RIBFjA2p28wGGlsLB+VIHg5uzbn5Z3EUcDgqW
 6/lqTfj3e/F4JevIE6vBZoHoY7mkRMu3hsSAJi9BnxLUG7oGrtDaW291T
 kK3Yr/EwWIztB4NezqJaW6UiJTP9mW09xHnelauTOvsylRKnrDVsgKyT+ Q==;
X-CSE-ConnectionGUID: 4G4NJG6QTvu2yAxsqAQGsQ==
X-CSE-MsgGUID: k1exj+t+TMueSWU4qMR7eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="89205486"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="89205486"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:33:24 -0800
X-CSE-ConnectionGUID: I6s25ScuR5u6ENogoNSehw==
X-CSE-MsgGUID: MhpUUrJIQQqbdbBNoH6PIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193248479"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:33:23 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, Xin Wang <x.wang@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v4 3/3] tools/intel_gpu_frequency: Allow printing by
 regular user
Date: Mon,  1 Dec 2025 18:33:03 +0100
Message-ID: <20251201173305.111564-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201173305.111564-1-kamil.konieczny@linux.intel.com>
References: <20251201173305.111564-1-kamil.konieczny@linux.intel.com>
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

Printing frequencies by non-root user is now not possible as it
ends up with an assert. However, reading corresponding sysfs as
non-priviliged user and printing frequencies is possible:

$ cd /sys/class/drm/card1/

$ ls -1 gt_*
gt_RP0_freq_mhz
gt_RP1_freq_mhz
gt_RPn_freq_mhz
gt_act_freq_mhz
gt_boost_freq_mhz
gt_cur_freq_mhz
gt_max_freq_mhz
gt_min_freq_mhz

$ cat gt_*
1300
350
100
0
1300
350
1300
100

Add such feature to this tool, with this:

$ ./intel_gpu_frequency
cur: 350 MHz
min: 100 MHz
RP1: 350 MHz
max: 1300 MHz

v2: split out card detection to simplify review, rewritten
  opening for write (Kamil)

Cc: S Sebinraj <s.sebinraj@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/intel_gpu_frequency.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 7a2ac89b9..6316c2e58 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -51,6 +51,7 @@ struct freq_info {
 	const char *mode;
 	FILE *filp;
 	char *path;
+	bool write;
 };
 
 static struct freq_info info[] = {
@@ -187,17 +188,39 @@ get_intel_card(void)
 }
 
 static void
-initialize_freq_info(struct freq_info *freq_info)
+initialize_read_info(struct freq_info *freq_info)
 {
 	if (freq_info->filp)
 		return;
 
 	freq_info->path = get_sysfs_path(freq_info->name);
 	assert(freq_info->path);
-	freq_info->filp = fopen(freq_info->path, freq_info->mode);
+	freq_info->filp = fopen(freq_info->path, "r");
 	assert(freq_info->filp);
 }
 
+static void
+initialize_write_info(struct freq_info *freq_info)
+{
+	if (freq_info->write)
+		return;
+
+	if (freq_info->filp)
+		fclose(freq_info->filp);
+	else
+		freq_info->path = get_sysfs_path(freq_info->name);
+
+	assert(freq_info->path);
+	freq_info->filp = fopen(freq_info->path, freq_info->mode);
+	if (!(freq_info->filp)) {
+		fprintf(stderr, "Cannot open file %s for write mode %s\nerror %d %s\n",
+			freq_info->path, freq_info->mode, errno, strerror(errno));
+		exit(EXIT_FAILURE);
+	}
+
+	freq_info->write = true;
+}
+
 static void wait_freq_settle(void)
 {
 	struct timespec ts;
@@ -210,7 +233,7 @@ static void wait_freq_settle(void)
 
 static void set_frequency(struct freq_info *freq_info, int val)
 {
-	initialize_freq_info(freq_info);
+	initialize_write_info(freq_info);
 	rewind(freq_info->filp);
 	assert(fprintf(freq_info->filp, "%d", val) > 0);
 
@@ -221,7 +244,7 @@ static int get_frequency(struct freq_info *freq_info)
 {
 	int val;
 
-	initialize_freq_info(freq_info);
+	initialize_read_info(freq_info);
 	rewind(freq_info->filp);
 	assert(fscanf(freq_info->filp, "%d", &val)==1);
 
-- 
2.52.0

