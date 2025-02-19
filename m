Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A80C021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 11:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D59110E263;
	Wed, 19 Feb 2025 11:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQ8ns7z2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E9D10E299
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 11:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739966010; x=1771502010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gchcyWMiG3VqVEITrvp51+Qq8AWz2vouCp21khrCw9E=;
 b=EQ8ns7z2JFyPn6kCu/AS4pl+Z3dqWzO568dsbgiktsLAeGSM+ENO6GPu
 jlnyrr0rhsEdiJ8HyxIui+3hTxDWpJZYK0hiNEYcfF/X1C1FhfQ3NfDFh
 xPb5eqoSMgOD/7GlZVX0TO/Pn0NSBm6SQjWD02iDTEqKqfikz2i4CUOaG
 HkwVer83hryvS+NPJzb8cJWe/VjdxCIEpvAi7MY7pZ61vPZFhDgTuJM4m
 d6rzkJ/OeJE1e4DJvBnTgP59xeBtmPrt37TSgLQ6W+cZ5IjOk08DAT5v0
 Xu3aFwZVRoa37UUZeZZAyxl6kUtukNThZCorx5DEbdtWCB5VwRFhtrTBZ w==;
X-CSE-ConnectionGUID: sf9vM0/qQuGzZaRVoqPqxw==
X-CSE-MsgGUID: q53QPDcSQhCe0HbV7wg1GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40556115"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40556115"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 03:53:30 -0800
X-CSE-ConnectionGUID: /ZTBMjbMRrOXXZ+/N8AvBQ==
X-CSE-MsgGUID: 5BgLt516Q4C+3JQu/NgxfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="137938413"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.136])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 03:53:26 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH i-g-t 0/2] Add VF detection and skip devcoredump checks on VFs
Date: Wed, 19 Feb 2025 12:53:12 +0100
Message-Id: <20250219115314.180382-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

This series introduces a helper function to detect whether a device is a
Virtual Function (VF) and updates the xe_exec_capture test to skip
devcoredump validation steps that are not applicable for VF devices.

The first patch adds intel_is_vf_device(), which reads the
VF_CAPABILITY_REGISTER to determine if a device is a VF.
The second patch integrates this check into xe_exec_capture,
ensuring that certain devcoredump checks are skipped on VFs.

These changes align with kernel updates introduced in:
Link: https://patchwork.freedesktop.org/patch/msgid/20241022010116.342240-2-zhanjun.dong@intel.com

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Cc: Zhanjun Dong <zhanjun.dong@intel.com>

Marcin Bernatowicz (2):
  lib/igt_sriov_device: Add intel_is_vf_device helper
  tests/xe_exec_capture: Skip checks on VF devices

 lib/igt_sriov_device.c        | 26 +++++++++++++++++++++++++
 lib/igt_sriov_device.h        |  1 +
 tests/intel/xe_exec_capture.c | 36 ++++++++++++++++++++++-------------
 3 files changed, 50 insertions(+), 13 deletions(-)

-- 
2.31.1

