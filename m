Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AEFC79F99
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 19:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B3710ED35;
	Tue,  8 Sep 2026 19:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDgzHGET";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF4C10ED35
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 19:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788894296; x=1820430296;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wv6Dwnr52A0cOH9X1ZGwGamtCw+v4u2OcU/5skwlznA=;
 b=aDgzHGET77sWQqG+elcdcDCZEstH6/iRjIN7FY+Hq521qDCxpSPBfE7v
 VM9X4T2YejfS+6udbVPmQzGLXlmGnypg9ETA0YMA3EMk/cylVbOJrkTUh
 d0b7mxO43XDjcRjrF7rDCA8nD1Ybp9zVXX/zHV/TWS4NrCyccNF6k+tbp
 HR7aGWLtsrFpxGYBLTwGxQgZdh5zVIfHRMKi/c/9HL5VtgOCrtSCGJ4wk
 0YBr1a+f31bPGovA/aHYGwdGcIpmrzSvIG3TveGbfAwDmxHNG8xAjiwOY
 td7TUM2iowGHLtAo+yUdyI43mVftC09xpPg4zDnsrlGbErH+MSwI5/Qvo Q==;
X-CSE-ConnectionGUID: N6e4DSxCTTmZ/xFTvLixYw==
X-CSE-MsgGUID: qcjqSFh8RAK/TXqjMBd6wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106824602"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="106824602"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 12:04:56 -0700
X-CSE-ConnectionGUID: K9Fj+eCFTa2rJ9zik9JihA==
X-CSE-MsgGUID: U7TLiY4eRIG3l+mp3RCs9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="276324661"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 12:04:53 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3 0/2] tests/intel/xe_survivability: update ignored dmesg
 regex
Date: Wed,  9 Sep 2026 00:24:07 +0530
Message-ID: <20260908185406.1023993-4-sk.anirban@intel.com>
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

v2: Keep older error codes (Kamil)
    Modify regex (Kamil)
v3: Modify regex (Riana)
v4: Support sigid based logging (Riana)

kernel implementation:
https://patchwork.freedesktop.org/series/168780/

Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Sk Anirban (2):
  tests/intel/xe_survivability: update ignored dmesg regex
  HAX intel-ci: Add xe_survivability to xe-fast-feedback

 tests/intel-ci/xe.fast-feedback.testlist |  1 +
 tests/intel/xe_survivability.c           | 14 +++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.43.0

