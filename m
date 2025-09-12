Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CC9CAC582
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 12:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D962710E1BD;
	Fri, 12 Sep 2025 12:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLos/qpA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857A510E1BD
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 12:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757680167; x=1789216167;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=16dEEVYsLFe+gl6j+y4XmwcgnW4Ph+FJx6hwPQasfII=;
 b=MLos/qpA3xA7h6I8qWAVGs0f8BsZc3Rh1C52w90F0Wr6em2ACkENofrV
 KL3VhJIhk3MW+QaW0AJB/zFbuH7i1LpSHMA77HU3aczytu6G9mcXEdygA
 LC0WTCVKGMPkRHyY7JC57F0UBweZ/9csj7bU+sC4pNLyE8DD4XlwDYYU0
 mqz0vUCMmzzF4WfQv5ThCMqVG7AArlXuAwVonIWDET+357shzHahVLgpL
 EvYxx6l0pZ8cYbrndJ//tUyO/7n7XVs4dNKogzgsvdFsIAReLU5XJDL3o
 U3YWoWvKbj9r7VBZC01glTaFsSYL0v++Sr57OoKaxIO+0yk23+XpGWavS A==;
X-CSE-ConnectionGUID: pVjHftBfS8yKGNLuFTe3RQ==
X-CSE-MsgGUID: P5py2jjfQPWInflZFJ1dEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="77635103"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="77635103"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 05:26:52 -0700
X-CSE-ConnectionGUID: xd/W5msITUmO0vjGFH4QpQ==
X-CSE-MsgGUID: KB52/o6qSVqN6ucbXGqRWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="177988903"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 05:26:44 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v5 0/3] tests/intel/xe_survivability: Add xe_survivability test
Date: Fri, 12 Sep 2025 17:55:39 +0530
Message-ID: <20250912122541.2238004-5-sk.anirban@intel.com>
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
 tests/intel/xe_survivability.c           | 260 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 3 files changed, 263 insertions(+)
 create mode 100644 tests/intel/xe_survivability.c

-- 
2.43.0

