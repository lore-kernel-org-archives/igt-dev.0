Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B7E108B8F7
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 11:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB46E10EAA6;
	Fri, 20 Mar 2026 11:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvFPfYUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377A510EAD1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 11:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774005917; x=1805541917;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gvv4P/KtyI+Hjj3si58WG9BxMX+C2H/VRIa/Owa9aJg=;
 b=WvFPfYUGL7FQulPwZiclRKkbg+jVbVM8X0GN/D//vdNIcORSVcHXu7y1
 f8SWbg8xLie+007q0rcr2Uuhkbtl59B2upnlSAAhw8U638XUqg+hbfBuN
 vW463OMvG8ulN4JeekPo/dLUz5kaNlrcdQRoar7NTw0QQBGJWfhy3RrvR
 tx3A1+GBsieT5A/mU98U4+4jdPNSULjUG8TDkCkAm7xaiHINaCCyNOnoP
 2vYRzkdbaYFDZ43rAN4iNalEZD7B2TZrMC5qL4r/4QsYrFuHJ+5pqW/61
 aOAwKi5q23Fwi3+FUbCPOfBqjPOLXOgQ8V0thQ6Oe469AEubopT9RYFbx g==;
X-CSE-ConnectionGUID: s7ctQUGWQg68OoSOBGZbHQ==
X-CSE-MsgGUID: DJ5SPKUZS6imNLwTeTXukQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="97705868"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="97705868"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:06 -0700
X-CSE-ConnectionGUID: GAXub5nPRsGsZNgfCmyPfQ==
X-CSE-MsgGUID: IswOd7LxQha+EDIJRsTCKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="253759084"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t 0/7] tests: lots of s/crtc->pipe/crtc->crtc_index/
Date: Fri, 20 Mar 2026 13:24:50 +0200
Message-ID: <cover.1774005763.git.jani.nikula@intel.com>
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

Do a bunch of s/crtc->pipe/crtc->crtc_index/ where the crtc->pipe isn't
actually needed or relevant, e.g. basically all of amdgpu tests.

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Hung <alex.hung@amd.com>

Jani Nikula (7):
  tests/amdgpu/amd_plane: s/crtc->pipe/crtc->crtc_index/
  tests/amdgpu/amd_dp_dsc: s/crtc->pipe/crtc->crtc_index/
  tests/amdgpu/amd_subvp: s/crtc->pipe/crtc->crtc_index/
  tests/amdgpu/amd_hotplug: s/crtc->pipe/crtc->crtc_index/
  tests/amdgpu/amd_multidisplay_modeset: s/crtc->pipe/crtc->crtc_index/
  tests/amdgpu/amd_vrr_range: s/crtc->pipe/crtc->crtc_index/
  tests/kms_atomic_transition: s/crtc->pipe/crtc->crtc_index/

 tests/amdgpu/amd_dp_dsc.c               | 142 ++++++++++++------------
 tests/amdgpu/amd_hotplug.c              |  52 +++++----
 tests/amdgpu/amd_multidisplay_modeset.c |  30 ++---
 tests/amdgpu/amd_plane.c                |  27 ++---
 tests/amdgpu/amd_subvp.c                |  16 +--
 tests/amdgpu/amd_vrr_range.c            |   4 +-
 tests/kms_atomic_transition.c           |  18 +--
 7 files changed, 144 insertions(+), 145 deletions(-)

-- 
2.47.3

