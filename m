Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B9B105F784
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 09:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DA810E04D;
	Fri, 13 Mar 2026 09:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+h4cZfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6F410E04D
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 09:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773394329; x=1804930329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Udwl22EreoHbrqb+/R+pQmY1fz4gIXOQCrrKuoQ61CA=;
 b=i+h4cZfl/0IXokRlbVF/cfXlZKOQWK8roXSt0lwxnjeeFnowoEugOkKp
 0QHyHBufzuRYNnpc6pAi5jFMdeJt02CAr3o20xEeOu83D7rtna3JjA4ZY
 FU1s8/iJIA+fI4ub16gQglfxOR2h2Vw1FOAGiZ0K31gMUdahOFJYebf3h
 EFhEzFl2i7qo3VFdyOBmtRcGn8uUipXHhf7XwIOvsVkKWXjVPSU1PtCqF
 W+HvYKOT/qMNKEGb3Z+8U7eEGYT7KQlNmpQC3p3H0xuTahQfsN2yNEgmE
 bNWIFVWmOQSvzwuunX73LP7Q7Z9sre/PNEoglthEAuZkJFzxYoSKjUGUU A==;
X-CSE-ConnectionGUID: wPsgq5uSSpWtkdQDNReujQ==
X-CSE-MsgGUID: rm7wLjpFSNyk/xLnAaGtBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74380899"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74380899"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:09 -0700
X-CSE-ConnectionGUID: AmZGTFhaRrekTtfiM8XR6A==
X-CSE-MsgGUID: +AOqS86ASbGZmcegg6h6og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="221061918"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.158])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 0/8] CRTC index vs. pipe fixes,
 drrs/fbc interface cleanups
Date: Fri, 13 Mar 2026 11:31:52 +0200
Message-ID: <cover.1773394225.git.jani.nikula@intel.com>
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

DRRS and FBC interface cleanups, along with a bunch of related CRTC
index and pipe usage confusion fixes.

Jani Nikula (8):
  lib/kms: add and use igt_crtc_debugfs_dir()
  lib/kms: add igt_crtc_for_crtc_index()
  lib/i915/drrs: convert the interface to igt_crtc_t
  Revert "lib/i915/intel_fbc: Add fbc supported check based on wa"
  lib/i915/fbc: make intel_fbc_max_plane_size() static
  lib/i915/fbc: pass display to intel_fbc_plane_size_supported()
  lib/i915/fbc: convert intel_fbc_{enable,disable}() into proper
    functions
  lib/i915/fbc: convert intel_fbc_supported_for_psr_mode() to
    igt_display_t*

 lib/i915/intel_drrs.c                  | 40 +++++++++--------
 lib/i915/intel_drrs.h                  | 10 +++--
 lib/i915/intel_fbc.c                   | 61 +++++++++++---------------
 lib/i915/intel_fbc.h                   | 11 ++---
 lib/igt_kms.c                          | 19 +++++++-
 lib/igt_kms.h                          |  3 ++
 tests/intel/kms_dirtyfb.c              | 16 +++----
 tests/intel/kms_fbc_dirty_rect.c       |  2 +-
 tests/intel/kms_frontbuffer_tracking.c | 16 +++----
 tests/intel/kms_psr.c                  |  4 +-
 tests/intel/kms_psr2_sf.c              |  4 +-
 tests/kms_flip.c                       |  8 +++-
 tests/kms_setmode.c                    |  2 +-
 tests/nouveau_crc.c                    |  4 +-
 14 files changed, 103 insertions(+), 97 deletions(-)

-- 
2.47.3

