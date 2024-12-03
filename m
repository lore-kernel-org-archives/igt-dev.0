Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90481E74AD1
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 20:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408F110E164;
	Tue,  3 Dec 2024 20:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2C3Nheo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95C610E164
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 20:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733257562; x=1764793562;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VCBJLw5hBWIi0RuWWuvcvhv8Tdzzks8EcR91W9ez24U=;
 b=O2C3NheocsDIgC7x+nYsAooPXjHkiA5t+Dp3H+EZF6gORvSfOV2l5J59
 IP9gUbVsbDGoTXmQVWnwz73IS0hGoSBU9syXjDUvmjJO3gmTuJVzozgiK
 lwr8NA9NnEvAJW8wHrtIdljGod4ofKe0U8kaAkRaVJKuy9ZVN/h6wkQeR
 /TsVSzZ213hfMSsrDnMj2WKSqi8tpW4ggKRQJPtWUZZtAROD704CyKLA6
 RyfmA66s3O7CDntyHTVvKv0hpJj804y+CcQRgFqSQXNLoGL7MKY/1l8Re
 H3GmOICN6vfk0HLQ7CPj/E4KQZmi8eoxlgl4OdMpbcu3/5d7/zruPwWau A==;
X-CSE-ConnectionGUID: 3vB1Apy8T6KK4fVcDUOF+g==
X-CSE-MsgGUID: rQttegEAQ/WMGeaPaeElsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44890930"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="44890930"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 12:26:01 -0800
X-CSE-ConnectionGUID: hwP7FJhnQ62CariLQco31g==
X-CSE-MsgGUID: c3agY1BoSHOZIYIumk7/uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="130998692"
Received: from dut4066lnl.fm.intel.com ([10.105.8.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 12:26:01 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH] lib/xe/xe_gt: Guard against fopen failure in
 xe_gt_stats_get_count
Date: Tue,  3 Dec 2024 20:26:00 +0000
Message-ID: <20241203202600.56749-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

The function xe_gt_stats_get_count currently performs an fopen on the
/sys/kernel/debug/dri/0/gt*/stats directory without checking that the
fopen is successful.  This can cause a system crash when trying to
perform fgets on a NULL pointer on unsuccessful cases.

Check the results of fopen and guard against this.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3212
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/xe/xe_gt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index cee892af96..101b887a41 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -159,6 +159,8 @@ int xe_gt_stats_get_count(int fd, int gt, const char *stat)
 	sprintf(path, "/sys/kernel/debug/dri/0/gt%d/stats", gt);
 	f = fopen(path, "r");
 
+	igt_assert_f(f, "Failed to open /sys/kernel/debug/dri/0/gt%d/stats", gt);
+
 	while (fgets(tlb_path, sizeof(tlb_path), f)) {
 		if (strstr(tlb_path, stat) != NULL) {
 			sscanf(tlb_path, "%*[^:]: %d", &count);
-- 
2.43.0

