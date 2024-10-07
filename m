Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFF7CED243
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 22:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C6510E009;
	Mon,  7 Oct 2024 22:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aY5i+/08";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AD410E009
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 22:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728339231; x=1759875231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0T9NEcPRKakRRsac2MlWe3kmAgNyppJ77S9EAdhMskk=;
 b=aY5i+/08T4WiMRaj7OLvM7xmWfCRJHqsGasNtePgGc+8zqlCLbllg9lS
 HaOwOtvN2jaLJ2hrj2dPfw7sWgmrQIEwHjNv4Vm+wnt1BXC4ri+62u2qy
 uSqX2yvclCmvZrGXaXDCC89wiwThAaxpZpsK2cD+pJCUYlPS513sgnLBc
 mz0aFKcZABTCTzVvImurlVubSLQTcI0m49Tvn1iF0xojkTrkZ+d4OPz1F
 VRRmaJ+Rub0wYQKYoghsRXLk2EaNJFKfi30NW81SLOEoBamDKbEF3qq6P
 zXXhERYeFGSMFmtIWOlNxHtzRP/x1C46uYzcpa6CPEvnfFWlFL8FhGTPa g==;
X-CSE-ConnectionGUID: br1q25pKTuqYLzzOltWbrg==
X-CSE-MsgGUID: cEz1ZF5OReGkgLGAWpz+Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31294110"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="31294110"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 15:13:51 -0700
X-CSE-ConnectionGUID: IIUM5UobTxGvA2n4Gzi5lw==
X-CSE-MsgGUID: kbuuld8PRi65y/oL5F/L1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="79600211"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa003.fm.intel.com with ESMTP; 07 Oct 2024 15:13:51 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v2 0/1] xe_exec_capture: Add xe_exec_capture test
Date: Mon,  7 Oct 2024 15:13:47 -0700
Message-Id: <20241007221348.3559076-1-zhanjun.dong@intel.com>
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

Test with GuC reset, check if devcoredump register dump is within the
range.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Changes from prior revs:
 v2:-  Fix CI.build error
       Add multiple GPU card support

Zhanjun Dong (1):
  xe_exec_capture: Add xe_exec_capture test

 tests/intel/xe_exec_capture.c | 227 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 2 files changed, 228 insertions(+)
 create mode 100644 tests/intel/xe_exec_capture.c

-- 
2.34.1

