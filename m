Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC51EF9014
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 13:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6750B10E1D6;
	Thu,  5 Mar 2026 13:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aYpwCN7M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EC310E1D6
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772718044; x=1804254044;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1hlViAat36SIQflcw6CuFACNtYSyOH3NMIGsuBP3cQE=;
 b=aYpwCN7MhlCjRoqO0nHGXtyY0DIWSgSj5eZJ7zU0Ofnpzr8eLDm8SDB1
 8Em5BiU5EfU4blkMRg8pFM2hw9KefBDhER5OD26nfLq0UaGbRCXHmQ0FL
 4yCv4VvbXpuNnt2Y1Wi692+xukGEtIzTPJGjSmh+rbolo2tONU83TB7fa
 lFWAm9s/aVTIomlCo8OXJF/3Q/kDRspQr5PGIJrV0o9ZmJV/ZLz1HqEc6
 wA+r7hOsWbgDbIzC0fPtni20mZH1vUvnArXVAT4CzBZKVGY6LxeRCJWfv
 Dlp7Gcq6eV8LUUlL7re1A6eBRQ1z5TmszNQCgCeVORUF2qCOfmc7H8vRp w==;
X-CSE-ConnectionGUID: 7Y2O+TqzR4GlcxVfhjl2Pg==
X-CSE-MsgGUID: 1JlawCoDR8OHNrV6PUzmtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="99270796"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="99270796"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:40:43 -0800
X-CSE-ConnectionGUID: IWaB7CkTTQWuUpikT4X8Qw==
X-CSE-MsgGUID: 0k5c29ZMRhWY36D19oJsjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="218818819"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:40:42 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/5] kms: A bit more cleanup around igt_kms
Date: Thu,  5 Mar 2026 15:40:33 +0200
Message-ID: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

Convert noveau_crc to dyanmic subtests to get rid of of
for_each_pipe_static(). And sprinkle some igt_skip()s to
a few "get a CRTC" helper functions to streamline the tests.

Ville Syrjälä (5):
  tests/nouveau_crc: Extract {setup,cleanup}_test()
  tests/nouveau_crc: Convert to dynamic subtests
  tests/nouveau_crc: Use igt_first_crtc() instead of igt_crtc_for_pipe()
  lib/kms: Make igt_first_crtc() skip if no CRTCs are around
  lib/kms: Make igt_first_crtc_with_single_output() skip if no
    CRTC/output can be found

 lib/igt_kms.c                |   4 +
 tests/intel/gem_exec_reloc.c |   1 -
 tests/kms_plane.c            |   1 -
 tests/kms_plane_scaling.c    |   1 -
 tests/nouveau_crc.c          | 197 ++++++++++++++++++++---------------
 5 files changed, 119 insertions(+), 85 deletions(-)

-- 
2.52.0

