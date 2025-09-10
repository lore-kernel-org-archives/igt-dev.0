Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499A0CA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 19:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED32910E9C4;
	Wed, 10 Sep 2025 19:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V13cyQzL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A6A10E9C4
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757532093; x=1789068093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TK+GAFt3OR1y8ULwvF5hvKfprcdsL7pcAmvlnMNQrJY=;
 b=V13cyQzLJKUOy4AAtYQH0PafzpxiV1zWFHYnvyTTkfhh24Cp9oWcmZC/
 LIs+4bQK+rNxQgy6jboaNlu7l37+yrTFO1oiqkW2ATJK77UAPVvJO057M
 tItO1uK7CLVERha+SZn/7RSDta4MzcGm61MAp0Kc7+g36EF1A23dY/T6m
 0LsGNQntKg3ctlzwn0zKgalSfWuGCjMm/qL9907C+6LVeEq94x8f/jp0e
 KzPgFVmEXKYEGSCZQvRnnbGfO58J/l4lPHl0BbelGqukwKPWV4RiKdzxM
 5JFceP+gXenAMcaMVfUqr2WUGt7G/oD9RxFjOrWZLReGAbDuZO9cGQvWT Q==;
X-CSE-ConnectionGUID: mzIhelXATiK3thMkqIx/3A==
X-CSE-MsgGUID: BeARONLCRKqPIRRf+rz0Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63489614"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="63489614"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 12:21:33 -0700
X-CSE-ConnectionGUID: iwHtdHdeQL6OtA68WYI9kg==
X-CSE-MsgGUID: DQs0BRCNT1u0DFCbivO29w==
X-ExtLoop1: 1
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 12:21:30 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,v4,3/3] HAX: Add xe_survivability tests to fast feedback list
Date: Thu, 11 Sep 2025 00:50:29 +0530
Message-ID: <20250910192031.1908588-8-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910192031.1908588-5-sk.anirban@intel.com>
References: <20250910192031.1908588-5-sk.anirban@intel.com>
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

Add xe_survivability to xe-fast-feedback

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 017e3ba2a..5f27baafb 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -185,6 +185,8 @@ igt@xe_sysfs_scheduler@timeslice_duration_us-invalid
 igt@xe_sysfs_scheduler@timeslice_duration_us-min-max
 igt@xe_sysfs_scheduler@job_timeout_ms-invalid
 igt@xe_sysfs_scheduler@job_timeout_ms-min-max
+igt@xe_survivability@i2c-functionality
+igt@xe_survivability@runtime-survivability
 #igt@xe_vm@bind-once
 #igt@xe_vm@scratch
 igt@xe_vm@shared-pte-page
-- 
2.43.0

