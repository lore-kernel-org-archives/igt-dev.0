Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52DDCCF9FF
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 09:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4DE10EAE7;
	Fri, 31 Oct 2025 09:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6qitpiq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FD310EAE7
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761903571; x=1793439571;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TwpGcy4wd/9YNRO7p72zovgQetgvods5CGFErI9bEpw=;
 b=F6qitpiq2rWQfu20RklA2iGI5jqFCQPdfAH200FMHu3jBwF+cH1nf/3U
 TzaRQC9CwxTgS9CgcodNLTqM4TZVC7VEEdwolMKretijzisJGFhhMzpv+
 I09HkmdcLf1Lz3fE1O/MYjr+VNKRKzXgUDFSsKdxWccugWpjF6Q8KFPer
 6qOgeavqb8rEDFZQ8lSR9arPpQ7T2lClZoHGSGn2YX8qfCBvAEscdlm2g
 2vDncPErr2VjcNVHtRdgoZ+18KzivIQEmvksgY/jXH/wBuwNZBW1M2Vkl
 SUO9zeJAH/2TYwMGdFVOVG+eRZ9sp00QtNs4wR+/s7aSPJha8wC7fXoRM A==;
X-CSE-ConnectionGUID: P31S9Mj7R96d/yWQitvNbA==
X-CSE-MsgGUID: d2R8NinGTHyScfHBgZM7Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="86686889"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="86686889"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 02:39:30 -0700
X-CSE-ConnectionGUID: 4iFxfe+QTEqjlTjXGwDaVQ==
X-CSE-MsgGUID: 6G3mp1l0TNefXCpVBcxUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186311832"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 02:39:26 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v9,
 0/3] tests/intel/xe_survivability: Add xe_survivability test
Date: Fri, 31 Oct 2025 15:04:51 +0530
Message-ID: <20251031093452.3842245-5-sk.anirban@intel.com>
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
 tests/intel/xe_survivability.c           | 267 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 3 files changed, 272 insertions(+)
 create mode 100644 tests/intel/xe_survivability.c

-- 
2.43.0

