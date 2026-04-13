Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C22EBFD36
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 10:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E0710E32A;
	Mon, 13 Apr 2026 10:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wt9wKH74";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1351810E32A
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 10:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776076167; x=1807612167;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gm9Mp8tPyOnNuWLgELgaCvs1/jNVQGjrZdbip13fUDU=;
 b=Wt9wKH74u2146mH62wxFGYZftsJdW1OvsJdKN7cEd3nKV9UNZF92R5UF
 yJiuCZwHpvkuIJcGN8IYAEs1oohF2SViWOTcQ9/3VKqrTt4NiK9xedRys
 ujCOKYnBNlb3zVcvYA6PF4c0COys9FQXyIQ8Rkep8ASpD2yyeNOgQogUW
 j2g4EsR3HTW9TQ/Pd9nDlaLu3uwiAhwujC9K9Mc2rLZwttDDEzkCRJy/Q
 Prw8P/puD8999QTfWaDdEk5PbslOvcivqMkhFV+4FTyLdo+Wl+vppCgVW
 44U58EQ1uNipMPgux3MPyZ9E4KOpzctGXk6ew8aF+P8W4dqGPupY+sPqn Q==;
X-CSE-ConnectionGUID: 7mSRjTHCRTyF8n2NFQ79Vw==
X-CSE-MsgGUID: mLTz/1FeQNOBIqqyFHUE6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="102466566"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="102466566"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 03:29:26 -0700
X-CSE-ConnectionGUID: 9rzLdaqHT0mC0XImVSV3Uw==
X-CSE-MsgGUID: lls2vztfQ7iT85PzjWkitw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="253144383"
Received: from tmistat.igk.intel.com ([10.91.34.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 03:29:25 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t] intel-ci: Block SR-IOV tests on i915
Date: Mon, 13 Apr 2026 11:20:13 +0000
Message-ID: <20260413112013.102762-1-jakub1.kolakowski@intel.com>
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

SR-IOV isn't supported on i915 - block SR-IOV tests from execution with
i915 driver.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel-ci/i915.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index 1068e2e15..3a54853f1 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -207,3 +207,7 @@ igt@kms_color_pipeline@plane-lut3d-green-only
 igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
 igt@kms_flip_scaled_crc@.*linear-reflect-x
 ##################################################################
+# SR-IOV: not supported in i915
+##################################################################
+igt@.*sriov.*
+##################################################################
-- 
2.43.0

