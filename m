Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E994C7115C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 14:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CC610E733;
	Wed, 25 Jun 2025 14:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQI+CrZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118A210E733
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 14:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750860089; x=1782396089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cAKjaCgrTQzQ08vNbrQ1ydfPvJJ1JasZSG/wVwAqfu4=;
 b=KQI+CrZ7EKblTK5/jGJjttsD3bvebw29+WY5qJ+xhn5JT72wZoDJR5BB
 rRCgHhDjbasgXHXpBWxDT3uD9MGF1ZeNlT5uRpepM6QB5KGO9Rey5JZPt
 aHTWO6jJOSIXb9TJjLy0cq8yzGn/sTzFeKB6Yhvu2PcBcQ4N0QEv2H9/C
 LKI89xMgzaGq2VYfCR+Fx4FBaEA1V9/jmpSE3qsadfJym88Y+AZmOkQCA
 jMtDc0NhRI6ZzLBL6JLswcP06a1cOH3ghwBm5mN9tIITM/5ooMFBGJkMt
 UaSldMXOezI236D4V0Rg0SB5FPbwAxraqN6lxdqEHzFUOUYjgLeQeNVRG Q==;
X-CSE-ConnectionGUID: KDM77pFmQLaLXt59iWKl6g==
X-CSE-MsgGUID: yK382uVaQFCp+nZD8+S+DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52247997"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="52247997"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:01:28 -0700
X-CSE-ConnectionGUID: l/UIieweTQSfRs2bo21mCg==
X-CSE-MsgGUID: S7LAoHCeSB6RVYhc8AdozA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="175872522"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:01:27 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_pmu: Add gt id check while selecting
 engines
Date: Wed, 25 Jun 2025 19:56:08 +0530
Message-ID: <20250625142608.2042599-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

In multi-tile cards like PVC, where engine class and instance numbers
are identical, gt id distinguishes between engines while selecting for
load execution or idling.

Check gt id while selecting engines.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 2ac4c7293..0e5a7360f 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -321,7 +321,8 @@ static void engine_activity_load_single(int fd, int num_engines,
 		flag[engine_idx] = TEST_IDLE;
 
 		if (eci_->engine_class == eci->engine_class &&
-		    eci_->engine_instance == eci->engine_instance)
+		    eci_->engine_instance == eci->engine_instance &&
+		    eci_->gt_id == eci->gt_id)
 			flag[engine_idx] = TEST_LOAD;
 
 		config = get_event_config(eci_->gt_id, eci_, "engine-active-ticks");
@@ -379,7 +380,8 @@ static void engine_activity_load_most(int fd, int num_engines, struct drm_xe_eng
 		flag[engine_idx] = TEST_LOAD;
 
 		if (eci_->engine_class == eci->engine_class &&
-		    eci_->engine_instance == eci->engine_instance) {
+		    eci_->engine_instance == eci->engine_instance &&
+		    eci_->gt_id == eci->gt_id) {
 			flag[engine_idx] = TEST_IDLE;
 			cork[engine_idx] = NULL;
 		} else {
-- 
2.47.1

