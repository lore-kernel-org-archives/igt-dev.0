Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266F4C79F99
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 19:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B327B10E17B;
	Tue,  8 Sep 2026 19:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOgmmY10";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4ACE10ED35
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 19:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788894302; x=1820430302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gJ2hh2TAqORiTZUIanpcGlT5o0KOooOFHotS4lhyGAg=;
 b=WOgmmY10Rur5MTpUbvUo6hELr0XNuwgFvw5zCuCx4ZG5BAiWk+ZWRscC
 fuWLWCBMQOX63cou6QKiKP6Zjf2FhZ56mmRJHlbNh1SoPQARK0DdAziS1
 yMgjGoAMmE9z9mYNUZe8npeMkvM9GOw8JaKpt1wEz5PbcRODMLanyfsON
 ebd7GKzys3Y+vdx1x6bCi87if3amRwXZBydoxJrmpXEr+Iu/u0Lc7y6uQ
 aD+LUkbNjX1f7YWlwfSxaFZtKfx6SOIhtS1ClwaInOcZkrJgb9wfbp2+r
 2Q1iNBPWn/028GkmzfBXHTUaYpJ0wvOaL9DWHlgkpH+OmZNX4QbVRiugW w==;
X-CSE-ConnectionGUID: V9l1yg05R+KaJR1O4+stXA==
X-CSE-MsgGUID: XeUK+KuNS5Cbcpe6DE09HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106824609"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="106824609"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 12:05:02 -0700
X-CSE-ConnectionGUID: fpTLzIT+RPStsRvo6jVQTQ==
X-CSE-MsgGUID: YLPDms9oR5e8Z8pUTVDcOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="276324669"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 12:04:59 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3 2/2] HAX intel-ci: Add xe_survivability to xe-fast-feedback
Date: Wed,  9 Sep 2026 00:24:09 +0530
Message-ID: <20260908185406.1023993-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908185406.1023993-4-sk.anirban@intel.com>
References: <20260908185406.1023993-4-sk.anirban@intel.com>
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

Add runtime-survivability test to fast feedback list.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index 64587cce1..746a10e57 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -216,6 +216,7 @@ igt@xe_render_copy@render-square
 igt@xe_spin_batch@spin-basic
 igt@xe_spin_batch@spin-batch
 igt@xe_sriov_flr@flr-vf1-clear
+igt@xe_survivability@runtime-survivability
 igt@xe_sysfs_defaults@engine-defaults
 igt@xe_sysfs_scheduler@preempt_timeout_us-invalid
 igt@xe_sysfs_scheduler@preempt_timeout_us-min-max
-- 
2.43.0

