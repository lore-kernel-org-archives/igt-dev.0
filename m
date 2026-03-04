Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023C6EB7ECA
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 11:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8521D10E9AF;
	Wed,  4 Mar 2026 11:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ASDiPgSm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4899710E9AF
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 11:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772622313; x=1804158313;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kEo7qL2IYie7kf9URMbvC6yQMJUW+dPwKkON7AFXWbE=;
 b=ASDiPgSmcxrsCwyG59bZDMwvKZacxg7rP2y2nk2wFO04cnolFHkeYGay
 +8i89w9TGhyLXy19iwbs7EMWj2F3xQjbVSR13FtedoXZ+vz2T38XMD1t6
 vJx4EBqWqH6IVsVQSx4iDmNdzxCo74nQaeOCxtMMf5QU8iLkZb+przTLv
 kHZZB4VwwEcQFWUsn6TBfeCXEuELPgaUdAK8QaIs17m1xZ18V2y9Fbs9F
 PkV1PS08Eg7AGJbvl4dO/UZpwpVILK1hjzo0fl/nIsJGdMC9af5vYt23J
 rez5g3vnq7quIY6D065419UEey9ziVOElaUVQE6dPsqMaA2M/ZQ8L0ySV w==;
X-CSE-ConnectionGUID: a9QrWMZUQkuo1rkoLdcEnw==
X-CSE-MsgGUID: nFLwbAK9TlKxbMFHT2s31w==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="72876892"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="72876892"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:05:13 -0800
X-CSE-ConnectionGUID: dPPqYVgPS+mWYtgiJVXSYA==
X-CSE-MsgGUID: n65VQmpXS8Oa5HDD58onig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="217546339"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:05:12 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v2 0/2] test/intel/xe_vm: Add overcommit and no‑overcommit handling tests
Date: Wed,  4 Mar 2026 11:04:58 +0000
Message-ID: <20260304110501.1193980-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series introduces support for No Overcommit flags in the xe_uapi
and adds IGT tests to validate overcommit behaviour across different
VM modes.

Patch 1 sync the drm-uapi/xe header with kernel.

Patch 2 increase coverage to xe_vm tests by adding tests for
 - Over-commit test in fault and non fault mode
 - No-Over-Commit tests in fault mode


Sobin Thomas (2):
  drm-uapi/xe: Add support for No Overcommit flag
  tests/intel/xe_vm: Add support for overcommit tests

 include/drm-uapi/xe_drm.h |   2 +
 tests/intel/xe_vm.c       | 517 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 519 insertions(+)

-- 
2.52.0

