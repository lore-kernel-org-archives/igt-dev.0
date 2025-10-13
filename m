Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB126CCD185
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 19:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB8110E078;
	Mon, 13 Oct 2025 19:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWDUsWQA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF04310E078
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 19:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760385148; x=1791921148;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pghi9nhIcZZewyagLzPMZTOcRMymawG6hspaFb/jcpE=;
 b=mWDUsWQAZOQzVJIueXf8zvZpN+4KfAHrXpiZXDTr+rC6Pb3Xf3Hvb570
 E4oG6aFClpRBYNK2PWwXSP5VhNjgLkJuMNUsslTdVaky0On5OSL1BTUFj
 SrTmh9ZDRz8c98Mb8XzASPkbM6DAC/2wtAMUohsYTZbMGkM1wjoQ7BjDY
 3SLIBOanSuUpH84E1odybvOe34dC86A4rl3OHfslafdamX8zRk7/vLygK
 4ODwgN8SKY0aSeFR4f+AvQFWI+YMZMEk/COMuCZ2IkKmFVf4ra50KufKt
 7Yv64uEd/FgrEuvUW+WEECTum0NkZD/RdCB0vI6g4R97xJmCQmB/wtbYY w==;
X-CSE-ConnectionGUID: j3Hz7Mi3TG+VWj0sOi3s1g==
X-CSE-MsgGUID: dekHoiv6Riea96dRCH3UnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62633579"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="62633579"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 12:52:27 -0700
X-CSE-ConnectionGUID: L9k0kT8dRg+wBD8FvtMrkg==
X-CSE-MsgGUID: MVM1n9d/Qde3LlwuI8N/ew==
X-ExtLoop1: 1
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 12:52:24 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v6,
 0/3] tests/intel/xe_survivability: Add xe_survivability test
Date: Tue, 14 Oct 2025 01:19:02 +0530
Message-ID: <20251013194910.1065392-5-sk.anirban@intel.com>
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

This series creates a new xe_survivability.c test file with two subtests.
i2c-functionality validates i2c adapter preservation in survivability
mode for AMC firmware updates, and runtime-survivability tests CSC error
injection, device wedged state recovery, and post-recovery GPU
functionality validation.

Sk Anirban (3):
  tests/intel/xe_survivability: Add new xe_survivability test for i2c
    adapter
  tests/intel/xe_survivability: Add new test runtime survivability
  HAX: Add xe_survivability tests to fast feedback list

 tests/intel-ci/xe-fast-feedback.testlist |   4 +
 tests/intel/xe_survivability.c           | 243 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 3 files changed, 248 insertions(+)
 create mode 100644 tests/intel/xe_survivability.c

-- 
2.43.0

