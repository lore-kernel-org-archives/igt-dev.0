Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664F9CA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 19:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF3E10E080;
	Wed, 10 Sep 2025 19:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7XZrAz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACDA10E080
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 19:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757532087; x=1789068087;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YO+hdjPwddth7fidfQnc6qcww4D+ci8D0fpANAXUOtk=;
 b=d7XZrAz86Wrp7dY3hVL/le+eX+WzpLNlKOCtZCqd4iq07by/IvKJNivY
 XRxVkfe5RaEdz203en7KOzw7YSDKrYAxuhHbu4EKWxI8cxoSllmOXr8Z0
 Lbow0MY3/atuaBEHGT/X+6i+Xwm9vqdHOr6u3GEOkNiz9bNi0VJl5aJuV
 yhzfsYPzk/Jl6/W/542guDMd+ZqVtFWouSgWrZfO91rSvsBPDOwMh9dga
 PusH9VQAlDpJ2DDW4LW/rVQDa3c027re7ppdLC64kKY7KtCmzYePCkByo
 zgw3py6wtgWcxrlfbe8rC/m53JF/iJaqugCQ4tCQB+qHQ9u+0MFpW4CS1 A==;
X-CSE-ConnectionGUID: DDogUPCETCCwfcOlsBTjgg==
X-CSE-MsgGUID: bnQLmPprQ6iYy6ONdlQckg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63489602"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="63489602"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 12:21:26 -0700
X-CSE-ConnectionGUID: 1o3WwT6XSfGoH4BXllXvIQ==
X-CSE-MsgGUID: PQ84/44gTOCD8lQOJE9tmQ==
X-ExtLoop1: 1
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 12:21:23 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v4,
 0/3] tests/intel/xe_survivability: Add xe_survivability test
Date: Thu, 11 Sep 2025 00:50:26 +0530
Message-ID: <20250910192031.1908588-5-sk.anirban@intel.com>
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

 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/xe_survivability.c           | 267 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 3 files changed, 270 insertions(+)
 create mode 100644 tests/intel/xe_survivability.c

-- 
2.43.0

