Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFBCCFC29F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 19:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BD710E037;
	Fri, 21 Nov 2025 19:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FrhOhTKY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F9D10E037
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 19:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763753760; x=1795289760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SKR8rlp6cZP9I+UyV0M7xRe7QrkjkXn9GUXiHnYioTw=;
 b=FrhOhTKY64IiWDeOH9sHcuaRf818eZ50vBIJxL2GqxFYSyJsPkZxszbj
 ag3yOLQ9v721Guqmxfpz0Kn6H7WKNX0aNagkPSOpkYsvTQa7XUHMJhVo1
 045Z2mZPFYH5MblJ3+cvlLGTYT70/w4pjWyYkmR1uBTtKUi6N7dSFvakx
 moYUOueU4lHWNgJ44ybz20TssB5CBX6GI2Ovwr1ZCF4Nq2fou4ylMbdKm
 84Y+so9pwcAZBtJtxqNihBVIYOuC1YWAN2c0dPvG8MyzWqzulnkiFLC2B
 A07U39qr9xWl7wIlw1xpnwIRFzKrn8PRjoXeGp2vYN/8KZbWkB7bGevQf Q==;
X-CSE-ConnectionGUID: m34qgPD9ShyZ6ZZHfo01Sw==
X-CSE-MsgGUID: 8BI7z+iLSoa7bKS6vNnfSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69720452"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="69720452"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:35:59 -0800
X-CSE-ConnectionGUID: S/lKttutT3m8Vpuy1SIlUQ==
X-CSE-MsgGUID: 3sS09elhQGWHwUqpZC5fMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="191657049"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.48])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:35:58 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, Xin Wang <x.wang@intel.com>
Subject: [PATCH i-g-t v2 3/3] tools/intel_gpu_frequency: Allow printing by
 regular user
Date: Fri, 21 Nov 2025 20:35:24 +0100
Message-ID: <20251121193539.195005-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121193539.195005-1-kamil.konieczny@linux.intel.com>
References: <20251121193539.195005-1-kamil.konieczny@linux.intel.com>
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
---
 tools/intel_gpu_frequency.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index af939dbe0..9fcf63f65 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -51,6 +51,7 @@ struct freq_info {
 	const char *mode;
 	FILE *filp;
 	char *path;
+	bool write;
 };
 
 static struct freq_info info[] = {
@@ -185,17 +186,39 @@ get_intel_card(void)
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
@@ -208,7 +231,7 @@ static void wait_freq_settle(void)
 
 static void set_frequency(struct freq_info *freq_info, int val)
 {
-	initialize_freq_info(freq_info);
+	initialize_write_info(freq_info);
 	rewind(freq_info->filp);
 	assert(fprintf(freq_info->filp, "%d", val) > 0);
 
@@ -219,7 +242,7 @@ static int get_frequency(struct freq_info *freq_info)
 {
 	int val;
 
-	initialize_freq_info(freq_info);
+	initialize_read_info(freq_info);
 	rewind(freq_info->filp);
 	assert(fscanf(freq_info->filp, "%d", &val)==1);
 
-- 
2.52.0

