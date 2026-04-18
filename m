Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BA4F99C73
	for <igt-dev@archiver.kernel.org>; Sat, 18 Apr 2026 10:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CBD10E32C;
	Sat, 18 Apr 2026 10:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJLRGSRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC1010E32B
 for <igt-dev@lists.freedesktop.org>; Sat, 18 Apr 2026 10:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776507988; x=1808043988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MghVPbqKGpxKmail7pEBcfFR4bjxuWBM9rt5haM2Fdk=;
 b=AJLRGSRzvnp2EkmTJUR0aS46LpS75qd3NQveG23R7JJgGKP5kjgt4+Nc
 h62KsCD0DiP29lWLl2LwC14q2IQlI+tkTbP1em82gxHnYLGAgWVB3QIOU
 8zSXsiSDSkkxRI5h03bgqf4PGglIVLAeWW3RoXSo+ZdkkgS47yKTM3DQI
 eeSlVbx6fHEbkm/HyRN6fwnS1MsTEXm/KBHRPimbczu7dktYT0jHinA5I
 h9czefOJVbePE/TEwJfAGmveADWKnTnmmYSFtYgojSJDHELDO+n/1U3Wp
 gqfPH5UWf6D1iK/Wa8ZB2tu/e5wPgU0Fjk68oO1p+SlfrUxaq0+J5ZKlm Q==;
X-CSE-ConnectionGUID: Ji7x8G9CSuq50+rddbmLOw==
X-CSE-MsgGUID: c4cJK+8xRwWklAC3JOLonw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="65040626"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; d="scan'208";a="65040626"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2026 03:26:27 -0700
X-CSE-ConnectionGUID: TNQzcXCMStGFpkSS5NPCkg==
X-CSE-MsgGUID: 1SG1pklWQl+z9Ql8MtHyFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; d="scan'208";a="231526748"
Received: from ddelane1-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.3.48])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2026 03:26:25 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_sriov_flr: VF driver mode option and
 xe_vfio_pci state restore
Date: Sat, 18 Apr 2026 12:26:19 +0200
Message-ID: <20260418102621.467394-1-marcin.bernatowicz@linux.intel.com>
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

Patch 1 replaces the boolean `--no-xe-vfio-pci` switch with an explicit
`--vf-driver=` mode selector (`xe-vfio-pci`, `xe`, `none`; default remains
`xe-vfio-pci`). This allows exercising the same FLR coverage with different
VF driver bindings, while keeping the binding/override logic centralized.

Patch 2 records whether `xe_vfio_pci` was loaded on entry and restores that
state in cleanup, so the test leaves the system as it found it.

Marcin Bernatowicz (2):
  tests/intel/xe_sriov_flr: Add vf-driver option
  tests/intel/xe_sriov_flr: Restore xe_vfio_pci module state

 tests/intel/xe_sriov_flr.c | 262 ++++++++++++++++++++++++++++++-------
 1 file changed, 212 insertions(+), 50 deletions(-)

-- 
2.43.0

