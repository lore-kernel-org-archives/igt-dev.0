Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77768CCF9EA
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 14:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFAA10E4BE;
	Mon, 27 Oct 2025 14:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BiJMjHJW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE92810E4BE
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 14:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761576190; x=1793112190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nNKaHZFxJCmZZAfU81TafStUFHeaGayQJk8pCG0iHgA=;
 b=BiJMjHJWynSGBGW1TBL3dCRJBnnwqhZ/bDiKTZhCpLidE9nQWMOVoTTf
 eK5DCD//xRC7jus3zhp6COo1y2+ilk7vmVc/pUZtKi47eJ9kjBw3JWwEX
 oGgnt5067IOXOfAi/TBJwF1a0mCV7D2reKkRotbqHTZ/wGIr/3ks+3cCP
 o4GmqlTMin+pSaJMmJKp0++ouzlHl1DcmysbKQ4lfQNysXwp+P5DhbRoQ
 g5f7zJoGjLmo1RH5QtgvIi6Ybdk2lpZ3IXPEq48VdEYB5mNsYxtWlwuS3
 YuKqud0qm3WUpcxJNCfLNoXxC/Qb2kvYT3VHxnH09ErMADsqWyJSTIg2V w==;
X-CSE-ConnectionGUID: e54u3Xh+R1eEx9MCrC/Dcg==
X-CSE-MsgGUID: QTgLZICfSwC1Qh7sTynQhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67299863"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="67299863"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 07:43:10 -0700
X-CSE-ConnectionGUID: 1Xrwr7bbQMiyNNCDR86ySQ==
X-CSE-MsgGUID: YdMSF5d/RjyRqO2aALaIrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184683899"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 07:43:07 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,v7,3/3] HAX: Add xe_survivability tests to fast feedback list
Date: Mon, 27 Oct 2025 20:08:47 +0530
Message-ID: <20251027143846.3149322-8-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027143846.3149322-5-sk.anirban@intel.com>
References: <20251027143846.3149322-5-sk.anirban@intel.com>
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
index 5f27baafb..d18a44610 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -187,6 +187,8 @@ igt@xe_sysfs_scheduler@job_timeout_ms-invalid
 igt@xe_sysfs_scheduler@job_timeout_ms-min-max
 igt@xe_survivability@i2c-functionality
 igt@xe_survivability@runtime-survivability
+igt@xe_survivability@i2c-functionality
+igt@xe_survivability@runtime-survivability
 #igt@xe_vm@bind-once
 #igt@xe_vm@scratch
 igt@xe_vm@shared-pte-page
-- 
2.43.0

