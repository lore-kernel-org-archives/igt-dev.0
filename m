Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F311ACA101F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 01:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A554710E196;
	Thu, 11 Sep 2025 01:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1OgFFQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CA510E196
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 01:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757554581; x=1789090581;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dOue3ZpSm71Yrz1dTjYTlrJU8xiRyYszFfPWlWmNeqc=;
 b=b1OgFFQjul8UPf2n+xSTYlenb0TnASKT5YX3Lq9kqiKEAGgT+yCP8cib
 eWDBNrPB4+rZ/hJLXyqqNOEgB0b2gA/x7I4NVzoVoH0xgs+lenzb77mXC
 zvEtueLh2FODjsgTD3j2ycTiUA9pLcDRFDV/MCusOvJCMXh6o4Pq53iyV
 Bs5YBaVOBAzj5XD8oEmJqQhw9YX8mccOd7kigNVZVc0dsdUBmmvbaPiV/
 85Fy6x0ovs9hPE/FEq/moSEkfFuk+N8qsZsk28oVKLGrHWPLv1B6NA9nP
 OfXAnSKAEXe5rSeK/ImhkJ1oaf3mGJSJIYECHO0YhpeLgihcsRTQ+s+zr w==;
X-CSE-ConnectionGUID: RaBFkmIYQC6/eg/aPVSV2w==
X-CSE-MsgGUID: 9qmFHzBISHacfFsyFdH9Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="85322842"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="85322842"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 18:36:20 -0700
X-CSE-ConnectionGUID: X1IAO5JrT5ifTgPmrAFJeA==
X-CSE-MsgGUID: WkZGINM9R4SP1bsHuohOXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="173451217"
Received: from hchegond-ivm1.jf.intel.com ([10.88.27.163])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 18:36:20 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_eu_stall: Use the fastest sampling
 rate from the query IOCTL data
Date: Wed, 10 Sep 2025 18:36:13 -0700
Message-ID: <6701e36ca7746494aa9358448652be7fc819d51f.1757554496.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.51.0
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

Earlier commit 157b34af65168 ("tests/intel/xe_eu_stall: Use default sampling rate
from the query IOCTL data") used a mid sampling rate from those returned
from the query IOCTL, if the user doesn't pass a sampling rate. However, some
GPUs, sometimes, aren't generating any EU stall data with the mid sampling
rate with 100 iterations of GPGPU fill. So, Use the fastest sampling rate
from the query IOCTL data so that there is always some EU stall data
generated with GPGPU fill.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 tests/intel/xe_eu_stall.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index f09e525eb..f5c57a9b3 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -648,7 +648,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 {
 	bool blocking_read = true;
 	struct xe_device *xe_dev;
-	int drm_fd, idx;
+	int drm_fd;
 	uint32_t devid;
 	struct stat sb;
 
@@ -665,10 +665,8 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 		query_eu_stall_data = xe_dev->eu_stall;
 		igt_assert(query_eu_stall_data->num_sampling_rates > 0);
 		/* If the user doesn't pass a sampling rate, use a mid sampling rate */
-		if (p_rate == 0) {
-			idx = query_eu_stall_data->num_sampling_rates / 2;
-			p_rate = query_eu_stall_data->sampling_rates[idx];
-		}
+		if (p_rate == 0)
+			p_rate = query_eu_stall_data->sampling_rates[0];
 
 		if (output_file) {
 			output = fopen(output_file, "w");
-- 
2.51.0

