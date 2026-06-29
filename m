Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69466C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 09:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBFB10E066;
	Mon, 29 Jun 2026 09:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+2UKqiG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6CE10E066
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 09:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782723803; x=1814259803;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QFIM6qaFFepV6ARO3YUjCLTW++a81j+WHiWnuLGHefY=;
 b=U+2UKqiGQ1/oQCqNOau1PQRqpiJnYobRvepQq9v+OYOCKmFQEkLpcSzC
 GF3erBVZVNQcJw5V9x7UWWSZIBmpO8ZL9ZsuA8dowwmkwKOtC/HPqNnUX
 nqVjwJ2fmqefQiinW6MEFPPt5Vjwyjq+V5Iue2NINg5Pe5HTlh0lYOMcP
 OpDfY9yKo6usFYqiVK64fc8psPgr24AWsDwaKHB7HTSWhe5boGe05ntVk
 WOE5G7FqCjA0kL4TRueMZxa9PXfP3LFQDt/t0CVG9bw6WxZ9t4w2KolEG
 hOQFQiQB3zkKfFkb4mFpVwT5xLVhCFZoaPCLsDt8kxRCZMgmnb3HR4ZF8 Q==;
X-CSE-ConnectionGUID: zfB0MNNQSBuifAl3kXQ9VQ==
X-CSE-MsgGUID: qLLqVtBETEmp8O1Oxriqsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94793452"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="94793452"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:03:22 -0700
X-CSE-ConnectionGUID: gvyAqv6wR8G76cMjG//SHw==
X-CSE-MsgGUID: sS4ayIA/RRaRTPk1fdnGcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="281988767"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:03:21 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com, Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 0/3] Fix 2-display test for MST shared-link BW 
Date: Mon, 29 Jun 2026 14:56:08 +0530
Message-ID: <20260629092611.298235-1-sowmiya.s@intel.com>
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

Sowmiya S (3):
  lib/igt_kms: Add MST bandwidth-fitting support and helpers
  tests/kms_plane_multiple: Fix 2-display test for MST shared-link BW
  tests/intel/kms_pipe_stress: Fit display modes to MST link budget

 lib/igt_kms.c                 | 74 ++++++++++++++++++++++++++++++
 lib/igt_kms.h                 |  1 +
 tests/intel/kms_pipe_stress.c | 51 +++++++++++++++++++++
 tests/kms_plane_multiple.c    | 85 +++++++++++++++++++++++++++++------
 4 files changed, 197 insertions(+), 14 deletions(-)

-- 
2.51.0

