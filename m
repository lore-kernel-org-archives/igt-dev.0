Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0ACCFA473
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 05:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302A210E7E8;
	Fri, 21 Nov 2025 05:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FrExqkZ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E855410E7E8
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 05:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763702366; x=1795238366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a9bJ5Uh+tGSoTlbexumpb9vRTt8eOvD8sFduwfBIB/k=;
 b=FrExqkZ3EoFNL/0JlMU1uJflM9IzLvCr4RuFyTqdyj7O1KOwceL+mTe7
 o2mTcCq0Q3W43ye5RIfbyBIhpABXIL1ioASVkthI7ZRkqfOo7H2KfuhYF
 Fr+ovd+zc485AGGTZDFI+WQ4+i/0uyNEYMPYgqvwOXUf8o2C4zXr3QT+a
 q2W04u69qh8OYQO5fyQHeZw/A7l8HflQShdZBpfTYCTxYfCCwK+PInOVp
 mI/muschNW+klXnWr6wzByChIRSNxIrceva9AYp/4VTld7rqAzILFsRzu
 R4Z4+wd+Z9oDXXAVLypm2M7ilVPxK2nCm/Z8WlEnVjmU+7Eilhw+PJ3a9 w==;
X-CSE-ConnectionGUID: e2inVdhjS2akWWcVaUjqWw==
X-CSE-MsgGUID: yHg/UtnBQvOgBVd5Faut/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69647258"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="69647258"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:19:26 -0800
X-CSE-ConnectionGUID: flU3pPa+SU6r87h3mT1KUQ==
X-CSE-MsgGUID: xTg06NEMTV6XxQ+uJCQStQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="190813123"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa006.jf.intel.com with ESMTP; 20 Nov 2025 21:19:24 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v5 4/4] tools/intel_gpu_frequency: Allow regular users
 to use get operation
Date: Fri, 21 Nov 2025 10:31:54 +0530
Message-Id: <20251121050154.1533992-5-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121050154.1533992-1-s.sebinraj@intel.com>
References: <20251121050154.1533992-1-s.sebinraj@intel.com>
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

Using get by non-root user was not possible as it
ends up with an assert. Changes had been added to
grant access for the same. To note here, in case
of get / read operation file should only be opened
in "r" mode.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 tools/intel_gpu_frequency.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 73793d5b8..d9858d78f 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -119,7 +119,7 @@ get_sysfs_path(int fd, int gt_id, const char *which)
 }
 
 static void
-initialize_freq_info(struct freq_info *freq_info, int fd, int gt_id)
+initialize_freq_info(struct freq_info *freq_info, int fd, int gt_id, bool read)
 {
 	/* Always close existing file handle and reopen for correct GT */
 	if (freq_info->filp) {
@@ -137,7 +137,11 @@ initialize_freq_info(struct freq_info *freq_info, int fd, int gt_id)
 	}
 	assert(freq_info->path);
 
-	freq_info->filp = fopen(freq_info->path, freq_info->mode);
+	if (read != false)
+		freq_info->filp = fopen(freq_info->path, "r");
+	else
+		freq_info->filp = fopen(freq_info->path, freq_info->mode);
+
 	if (!freq_info->filp)
 		fprintf(stderr, "Failed to open %s\n", freq_info->path);
 	assert(freq_info->filp);
@@ -155,7 +159,7 @@ static void wait_freq_settle(void)
 
 static void set_frequency(struct freq_info *freq_info, int val, int fd, int gt_id)
 {
-	initialize_freq_info(freq_info, fd, gt_id);
+	initialize_freq_info(freq_info, fd, gt_id, false);
 	rewind(freq_info->filp);
 	assert(fprintf(freq_info->filp, "%d", val) > 0);
 
@@ -166,7 +170,7 @@ static int get_frequency(struct freq_info *freq_info, int fd, int gt_id)
 {
 	int val;
 
-	initialize_freq_info(freq_info, fd, gt_id);
+	initialize_freq_info(freq_info, fd, gt_id, true);
 	rewind(freq_info->filp);
 	assert(fscanf(freq_info->filp, "%d", &val)==1);
 
-- 
2.43.0

