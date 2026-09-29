Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9F2C9832A
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 03:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E64910E148;
	Tue, 29 Sep 2026 03:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZVCI2D5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03C010E148
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 03:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790652980; x=1822188980;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hSSPOiAwYlkPqSOGR9daB9HhMf9kFsIPw0lplPvWGjA=;
 b=AZVCI2D5F6cyxOcNUW0OpGSKHIKn6udO7YprO6TDQCUD6bqBJYhFeAIF
 GcSwCwflegIk2j6h6/pnZNXyyxMCVk7ueQ1TTadBmXxVTyzxrDOSQqHnz
 rBsmiCN+VNnFCPVYmftfBiFpYxdwi1wEf/BrfWC6ywICdlixTt40CESSH
 eckDexbzRSynB2fUF1GQ9DgN8Se0ZlRWJGynk6dzg3uPIzE/GgF7kQ75C
 EVoEaNcyaN6GMgILsc9FZ+osGwZbu6vxdDXZM5WYOT+sbCVybxLVxlkSH
 kRcjH0WPr5dnfs1nkgdnWXHWUDNAY//N2e11tX/eBe1GlBLuWsBcSXV81 w==;
X-CSE-ConnectionGUID: rJZAfzhXReSCGKSxzsOsKg==
X-CSE-MsgGUID: TvC1BFiYQVaz0FCnpG9doA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="94076316"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="94076316"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 20:36:19 -0700
X-CSE-ConnectionGUID: zPOiB52iQFCw2gWts2KCdA==
X-CSE-MsgGUID: STv5BOfMRpOIyyBWKgM+wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="279967898"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 20:36:16 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v6 0/2] tests/intel/xe_survivability: update ignored dmesg
 regex
Date: Tue, 29 Sep 2026 08:53:54 +0530
Message-ID: <20260929032354.1971070-4-sk.anirban@intel.com>
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

The kernel now reports -ENOTRECOVERABLE when the device is wedged.
As runtime-survivability deliberately wedges the device, update
dmesg regex so igt_runner does not treat the expected error logs
as failures.

kernel implementation:
https://patchwork.freedesktop.org/series/168780/

Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Sk Anirban (2):
  tests/intel/xe_survivability: update ignored dmesg regex
  HAX intel-ci: Add xe_survivability to xe-fast-feedback

 tests/intel-ci/xe.fast-feedback.testlist |  1 +
 tests/intel/xe_survivability.c           | 13 ++++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.43.0

