Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6006BD1D88B
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 16:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC2E10E5B7;
	Tue, 15 Oct 2024 16:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBeOwFdy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B975F10E5B7
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 16:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729009532; x=1760545532;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Uedqnvy+KuzM5slmnXE1cYvFiCj4J9gp5J3ZLcHrJ3U=;
 b=YBeOwFdy3YyNXi127bfUskaGdQArXFeXzKIcFTNttEKkKb4W+vaniBX1
 u7QOF/UM2wma5MQvYiQp30re1Wo+qkLmN9IGRSICsp1CC3yWar7oN9TPM
 FqVrPp11bu0/yUazVsuXbyyhpFrwDhfMNwykwlDLQ6vjZ8ZtDgtkV3ZeH
 05TY7Es+J/5Vo+6XvIegT+6ZGInfW+KuAB4SQdduVc2mbiFyvIEmFXj9x
 rrjhI8UMIEwB6h/zDD6zi1jtP8hwJ1kFLPJczuLsNXRD4Fw4zdW7fMBHX
 pD1/eqCIyeIVdxTMRCq0mr1eliXd764Wyb4tv/3wx/2lhBt92Z0xSjvyD w==;
X-CSE-ConnectionGUID: AcThVaa2STSdQdrGwYxaaA==
X-CSE-MsgGUID: sOqNVLpHRdajba3KeOS9MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28616989"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="28616989"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 09:25:32 -0700
X-CSE-ConnectionGUID: fsF3xVpuSXKKRwsdT9M7pg==
X-CSE-MsgGUID: nDBClioHTfqF/oKY+1JxmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77962837"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 09:25:30 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, bhanuprakash.modem@intel.com,
 suraj.kandpal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 0/2] Move backlight read, write to lib
Date: Tue, 15 Oct 2024 21:53:34 +0530
Message-Id: <20241015162336.304730-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Move backlight read , write functions to library to re use across
other tests.

Santhosh Reddy Guddati (2):
  lib/igt_kms: Move backlight read, write to lib
  tests/intel/kms_pm_backlight: Refactor and use functions from lib

 lib/igt_kms.c                  | 60 ++++++++++++++++++++++++++
 lib/igt_kms.h                  | 13 ++++++
 tests/intel/kms_pm_backlight.c | 77 +++++-----------------------------
 3 files changed, 84 insertions(+), 66 deletions(-)

-- 
2.34.1

