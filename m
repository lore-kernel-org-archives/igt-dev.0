Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8CED2D0E0
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 12:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DB710E282;
	Tue, 13 Jan 2026 12:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCcarQR5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED5410E282
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 12:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768305884; x=1799841884;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HQaDBDEPBLdtcPR0XEERKkt6aEj2RHbAU4afGJdhr3o=;
 b=XCcarQR5bIM8P3vyvih9ZukmeTrYTVP4E928uUd5SSpdX0pYA40Ja9AX
 EMi1NZTXfX3uMRFCp++ncyE2tYbsDpsDr2u4JnLosE9GmVuPOgXZgWWBD
 pegpAvqBlwCJZQxVKXQWeq7njR/jc2GAUB/V9k+oB022qitJ/3jnySFd1
 Faeu0U88VRd05q2yd1hT2jxIb+cZrB5HF9chJCVzrQnw/vAC8/Vx1Y/Un
 DVZErdKabgK+Fmb3JaE4qnyLnTojsjppicCTHnm9/4Dc04J0RZtayP2v9
 FheempL2KWOsIOOCbe6zzLSveCErxFNwJr34kHl5TeIv6hOaHifnE3aKx A==;
X-CSE-ConnectionGUID: BlyhvJp5SOWb8MF85M/Umw==
X-CSE-MsgGUID: +3N92aitT3SK60LUPG7Zdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69497649"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69497649"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:04:43 -0800
X-CSE-ConnectionGUID: BGQHUAE3SbW588NeUPFI/w==
X-CSE-MsgGUID: 8PDHGCpuQDiKIVH0jKsEHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="209421901"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.124.220.52])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:04:42 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/8] Some cleanups etc.
Date: Tue, 13 Jan 2026 14:04:31 +0200
Message-ID: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

A bunch of manual cleanups and tweaks. These came about while
doing the pipe->crtc conversions using coccinelle.

Ville Syrjälä (8):
  tests/kms_plane_cursor: s/or/rect/
  tests/intel/i915_pm_rpm: Nuke bogus NULL check
  tests/kms_rotation_crc: s/0/PIPE_A/
  lib/kms: Nuke pipe_select()
  lib/kms: Simplify kmstest_get_vbl_flag()
  tests/kms_async_flips: Use designated initializers in
    wait_for_vblank()
  tests/intel/kms_pipe_stress: Eliminate double display.drm_fd
    initialization
  lib/kms: Turn igt_pipe_connector_valid() into a function

 lib/igt_kms.c                 | 30 ++++++----------------
 lib/igt_kms.h                 |  8 +++---
 tests/intel/i915_pm_rpm.c     |  2 +-
 tests/intel/kms_pipe_stress.c |  4 +--
 tests/kms_async_flips.c       | 16 +++++-------
 tests/kms_plane_cursor.c      | 48 +++++++++++++++++------------------
 tests/kms_rotation_crc.c      |  6 ++---
 7 files changed, 49 insertions(+), 65 deletions(-)

-- 
2.51.2

