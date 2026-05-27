Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA166CD5BD5
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 13:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E07F896E9;
	Wed, 27 May 2026 13:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hlQe2H0s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298C2896E9
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 13:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779888585; x=1811424585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hZ4eWgakG/edU3jYsY7+H0cD7vXcBaA7W/Kz58zYTSA=;
 b=hlQe2H0slQGdRr59CwhOaUytCdk+gTsJDPE8LvD7TIx57QXm/TRTRq5p
 G04I4pNNfB5Dft2gUjaNlM0STB8RI7sJ6HAA/afI0QYDkRRv7XzL6wbhI
 IUgCBu+n63xVk8XuLCImk+kmWY5hB+6iv92whGoyOJYQ56s2BigN6qzcJ
 mKeJZpkjlGykTv4ipEinnSa0N/CHSDkAhAoqJY58rs2e8KVvcbYMEvfY1
 V3MRcyg9cFAuMxEsOtMztG529D2ueJF8Jmz4HnW6V8vNDDt+dC7PQQnHy
 J7BUVoORHCz4gHUG6KfnjqeXGiRnjk7vMGYfrATSNi91Nr85o4MPsc7hp g==;
X-CSE-ConnectionGUID: VOtwDgQzQK6D25ywon9+MA==
X-CSE-MsgGUID: ddz+lCeMRA+0dpaDHuWmGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80567409"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80567409"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 06:29:44 -0700
X-CSE-ConnectionGUID: R7CLVj9oRdug8XmU+ow6Yg==
X-CSE-MsgGUID: XCnOiDVrS+KFF8JMMbKsfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="242079798"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 06:29:42 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com, Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 0/3] Fix 2-display test for MST shared-link BW
Date: Wed, 27 May 2026 19:21:05 +0530
Message-ID: <20260527135109.3291120-1-sowmiya.s@intel.com>
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

On MST hubs / daisy-chain setups two display streams
share one DP link; a joint atomic commit can be rejected
by the driver if the combined mode bandwidth exceeds the
link capacity. The driver therefore adjusts per-pipe
settings (for example reducing pipe bpp and enabling
dithering) when both streams are committed together,
so tests must pick a mode combination the driver will accept.

Sowmiya S (1):
  tests/intel/kms_pipe_stress: fit display modes to MST link budget
  lib/igt_kms: Add MST bandwidth-fitting support and helpers
  tests/kms_plane_multiple: Fix 2-display test for MST shared-link BW

 lib/igt_kms.c                 | 37 +++++++++++++++
 lib/igt_kms.h                 |  2 +
 tests/intel/kms_pipe_stress.c | 51 +++++++++++++++++++++
 tests/kms_plane_multiple.c    | 85 +++++++++++++++++++++++++++++------
 4 files changed, 161 insertions(+), 14 deletions(-)

-- 
2.48.1

