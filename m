Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4912EF531F6
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E572010E072;
	Tue, 14 Apr 2026 07:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCXcEQE+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F87F10E072
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150886; x=1807686886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xI+cdCVH6+XX1p3avn/rVeo5CJiZAquPWohZnwPdfGw=;
 b=mCXcEQE+NsCmIJPsXa1TXqxIroL1YQoN48+jrupfv+l/GJqETbdFwEzg
 dqX9wGJ96mOgT2HZmxcR84vAJiN0lu9HY9x2P7uUuVgjWKj5Q+r0rxBoe
 ROt4r05b0Au6C8Cu8Fwpyr6ppTIHQQtOdMfRlGydnXIO7nctXrXHjwV2u
 8KGspaDl3+ATJ+7BC3U6TKVspGu9aM3jkXcr4qk1w0UPJexo7tAMur5MD
 LHbNPWBLH4LCJ+Z+FNXRcdH6k1jcHzv0E7cgGwNPIXYdwzhApaoyLGNob
 shXMzmI/nIFM0n13bsYFBuxxJ9EKawwHcyn+6K/3tAI9yJ4D9BviTJ1mS w==;
X-CSE-ConnectionGUID: iXgp5PsVSx6HWR9wja1VNA==
X-CSE-MsgGUID: urrh6jdwQgmekjjSB3pOEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="102555693"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="102555693"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:14:45 -0700
X-CSE-ConnectionGUID: OjCvUlAAQ3WHZZe73yjBkA==
X-CSE-MsgGUID: 5P42HBYQT3qxoo1P/Qdtgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234046671"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:14:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 00/16] igt: clean up typedef usage,
 use for_each_output() more
Date: Tue, 14 Apr 2026 10:14:20 +0300
Message-ID: <cover.1776150714.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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

This series spiraled into a few things:

- use typedefs like igt_foo_t more consistently instead of struct
  igt_foo
 
- rename the structs to have underscore prefix to discourage usage like
  struct _igt_foo

- convert open coded output loops to use for_each_output()

BR,
Jani.

Jani Nikula (16):
  tests: prefer igt_plane_t over struct igt_plane
  lib/kms: rename struct igt_plane to _igt_plane
  tests: prefer igt_display_t over struct igt_display
  lib/kms: rename struct igt_display to _igt_display
  lib/kms: rename struct igt_crtc to _igt_crtc
  lib/kms: drop struct igt_colorop definition
  tests/amdgpu/amd_abm: use for_each_output()
  tests/amdgpu/amd_hotplug: use for_each_output()
  tests/amdgpu/amd_subvp: use for_each_output()
  tests/amdgpu/amd_dp_dsc: use for_each_output()
  tests/amdgpu/amd_plane: use for_each_output()
  tests/kms_atomic_transition: use for_each_output()
  tests/kms_colorop: use for_each_output()
  tests/kms_content_protection: use for_each_output()
  tests/kms_getfb: use for_each_output()
  tests/kms_writeback: use for_each_output()

 lib/igt_kms.c                           |  2 +-
 lib/igt_kms.h                           | 16 ++++++++--------
 tests/amdgpu/amd_abm.c                  |  8 ++++----
 tests/amdgpu/amd_dp_dsc.c               | 10 ++++++----
 tests/amdgpu/amd_hotplug.c              |  8 +++++---
 tests/amdgpu/amd_plane.c                |  8 +++++---
 tests/amdgpu/amd_subvp.c                |  9 +++++----
 tests/intel/kms_dp_link_training.c      |  4 ++--
 tests/intel/kms_dp_linktrain_fallback.c | 12 ++++++------
 tests/kms_atomic_transition.c           |  6 +++---
 tests/kms_colorop.c                     |  6 ++----
 tests/kms_content_protection.c          |  6 +++---
 tests/kms_getfb.c                       | 13 +++++++------
 tests/kms_writeback.c                   | 10 ++++------
 14 files changed, 61 insertions(+), 57 deletions(-)

-- 
2.47.3

