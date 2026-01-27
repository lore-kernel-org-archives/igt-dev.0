Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0A9D2F004
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 11:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1858F10E08D;
	Tue, 27 Jan 2026 11:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RyWb2bPr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC8E10E08D
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 11:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769514973; x=1801050973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qSJPRXTM93AKfrVgHn4xswT7ZA08+zcDlHK+QuiwxhQ=;
 b=RyWb2bPr0UCQ+m5L+Hu+Ztt9xaN8siul1by46P4/R1IGYmzdeRNbgH1C
 yUbSFqNHfac5mUGWKPHuIGXzr3jghpL6x31zmr/YKdvBFC6ci7ZAjGUob
 Nw5DCMvUXO8HOvDh96/FJ9NewT/JgF/kI/h7m5u7fAo1m8QaFpCp+6vcy
 hSe2t+Z5m2BhDswsxtnDbgAAE5NiAabVFOcBajuyU5PoHYLjN7yR9zJPZ
 nJK0rJeP5v0/PzcHSOJ0OSl57NF0VfVZwd3t+sp/4TrilEInw+aMrwaOm
 ufa2lVG/onD70RBJPkD6UU9EkM1zlI/FHnAL67tJJhUjazXhxbZ8bW9L9 A==;
X-CSE-ConnectionGUID: Aregbze0TM+2mLB3ZbmKdA==
X-CSE-MsgGUID: SPUiV6GkQfGqpzhKxHCwXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81011316"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="81011316"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:12 -0800
X-CSE-ConnectionGUID: T3wOet7yRISgQ2Jtr2W3mQ==
X-CSE-MsgGUID: BaddxNhIQZm2Smxjuu014g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208010841"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 0/8] lib/igt_kms: pipe vs CRTC index cleanups
Date: Tue, 27 Jan 2026 13:55:57 +0200
Message-ID: <cover.1769514879.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

Some manual CRTC index vs pipe cleanups to complement Ville's coccinelle
changes.

Superceeds [1].

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1768906414.git.jani.nikula@intel.com

Jani Nikula (8):
  lib/igt_kms: Drop the ioctl fallback for CRTC id to pipe mapping
  lib/igt_kms: Remove kmstest_pipe_to_index()
  tests/kms_setmode: drop redundant drmModeGetCrtc() call
  tests/kms_setmode: use CRTC index instead of pipe for
    intel_drrs_disable()
  tests/kms_setmode: use __intel_get_pipe_from_crtc_index() directly
  lib/igt_kms: Always return CRTC index from
    kmstest_get_pipe_from_crtc_id()
  lib/igt_debugfs: rename igt_debugfs_pipe_dir() to
    igt_debugfs_crtc_dir()
  lib/i915/drrs: switch the interface from pipe to CRTC index

 lib/i915/intel_drrs.c                  | 36 ++++++------
 lib/i915/intel_drrs.h                  |  8 +--
 lib/i915/intel_fbc.c                   |  4 +-
 lib/igt_debugfs.c                      | 10 ++--
 lib/igt_debugfs.h                      |  4 +-
 lib/igt_kms.c                          | 77 ++++++--------------------
 lib/igt_kms.h                          |  4 +-
 tests/intel/kms_fbcon_fbt.c            |  6 +-
 tests/intel/kms_frontbuffer_tracking.c |  2 +-
 tests/kms_async_flips.c                | 10 ++--
 tests/kms_setmode.c                    | 14 ++---
 tests/nouveau_crc.c                    |  2 +-
 12 files changed, 66 insertions(+), 111 deletions(-)

-- 
2.47.3

