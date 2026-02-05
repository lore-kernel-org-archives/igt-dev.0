Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C08E91283
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 07:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A607B10E7D5;
	Thu,  5 Feb 2026 07:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgklmpmC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188EE10E7CD
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 07:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770275085; x=1801811085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=57SePXBoHaHkxdW0MQuXuFGzN7UKXOr71Oxf2vRTe58=;
 b=fgklmpmCJGo3yQ842EN8r7CTUBmnNsL6jQy0hvdkHatxGjmfLYWdWq7P
 8PFh4mIU3rU9VMOEdEZMPznneush2fiH4jSdY6t38fdAtpgCFOg2FqNxz
 peJTWCU66WQkUI75oAkBMwCwXuAWez8/70OVQFnbgJPNcf9MM0qI0SDsh
 R8INTUYqZsKccx1hCATNvZnq4+xv+xOoo4zcX0ay4S9SR9z4TqHVDUlpJ
 gyx3JS36BkO9nt2apzVdDEH+KVQcd6Ra4N9zZ8ClyVYarUVxMo/7Z02eq
 GuS9EVkEOdTR0Y0ehRbQbTYQiS4MvHq8XOhRDzXNUgrGitCwCF2Vu0cbR Q==;
X-CSE-ConnectionGUID: OgtwqnmVQLy1PifBcLqWBg==
X-CSE-MsgGUID: d2bTZOw8TQ6QS4Vj/i2yQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70486948"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70486948"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 23:04:44 -0800
X-CSE-ConnectionGUID: 4R3w82VXR/y61jNjRZkcYg==
X-CSE-MsgGUID: Briy5PQfSUaVzxaa9VcuSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210495565"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.51])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 23:04:43 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v3 0/3] Run PSR2 and PR tests on panel supporting both
Date: Thu,  5 Feb 2026 09:04:22 +0200
Message-ID: <20260205070425.300934-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Currently we are running only PR tests on panel supporting PSR2 and
PR. Running PSR2 tests as wel on such panel would provide us valuable
information. This patch set is addressing that.

Also some other improvements is made and code is simplified:

 - drop some complexity from fixture for detection of working PSR
 - instead of "not run" "fail" on setup where PSR is broken already
   before kms_psr2_sf testcase is executed.
 - drop et_flag from data_t and detect need for Early Transport check
   on fly.

v3:
  - use data->devid instead of intel_get_drm_devi
  - changed IS_ALDERLAKE_S to !IS_ALDERLAKE_P
v2: patch 2. rebased and commit message updated

Jouni Högander (3):
  tests/intel/kms_psr2_sf: Drop Early Transport flag from data_t
  tests/intel/kms_psr2_sf: Check pipe and output validity for Selective
    Fetch test
  tests/kms_psr2_sf: Allow testing of both PSR2 and Panel Replay if
    supported

 tests/intel/kms_psr2_sf.c | 239 +++++++++++++-------------------------
 1 file changed, 78 insertions(+), 161 deletions(-)

-- 
2.43.0

