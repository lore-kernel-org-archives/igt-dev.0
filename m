Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9B6C25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 07:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDB710E0DA;
	Mon, 27 May 2024 07:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZulcVPTy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CE110E0DA
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 07:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716795239; x=1748331239;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6nZaT4+36WfQg2pgEdHHkIptdGeB7dH9e2NuziTnEI4=;
 b=ZulcVPTyL6ZOrwYkj35S6YtQ3YdqffLHw6oOaDEPEg+zNIAowNbtvePU
 vLe850W250ePec51nR+lEx5pzNm4KT+RGHy2947yUcNlOfvM807qi7p6n
 eu14QjCYqljAjD9cPB0ZJyYMG+t+aEweLxmXyFf4chT+3qrTHcbBD9VFv
 RXU8RH3ap6HTIYOP55XdBNHtU5SC8k6MLDcqBiC4XoNX3MpLlH6dhRlb0
 Cule/hyCnarucGGMICgNhHWc4KLcc5aR4zMmX4LwUVXptYWFD+4GFevPf
 dMsY8OoVX5uiDD4p3Eo9jJIr8/ZmQd3wzRY3ZRqcDq3gA4+B+I1o5n68K Q==;
X-CSE-ConnectionGUID: 8h0DJkL/Sd67QrWO/tlONg==
X-CSE-MsgGUID: seZ9mo4QSyCoXCHU8yn7Pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="23700397"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="23700397"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:33:59 -0700
X-CSE-ConnectionGUID: 3+2EOXLlRM6o5KswEA/31g==
X-CSE-MsgGUID: MbFiFp8fQk6Ls314zPhyUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34569699"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:33:57 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 00/12] Introduce intel_tiling_detect tool
Date: Mon, 27 May 2024 09:33:33 +0200
Message-Id: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

I'm going to verify all tilings we claim in intel-cmds-info as
if I'm not wrong we have Yf tiling instead Tile4 on early gen12
platforms (TGL, DG1).

For the above I need to verify are documentation and code correct
and if not fix it.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Zbigniew Kempczyński (12):
  lib/intel_bufops: Fix offset returned for Tile4
  lib/intel_bufops: Fix mapping/unmapping for i915 and xe
  lib/intel_bufops: Add linear-to-none copy path
  lib/intel_bufops: Add Tile4 in linear_to and to_linear helpers
  lib/intel_bufops: Add Yf tiling
  lib/intel_blt: Add Yf tiling in block-copy
  lib/intel_bufops: Add Ys tiling in linear_to and to_linear path
  lib/intel_bufops: Drop unnecessary Tile4 function assignment
  lib/intel_bufops: Preparation for adding software tiling for Tile64
  lib/intel_bufops: Drop Tile4 swizzling
  lib/intel_bufops: Don't disable x and y on platforms without swizzling
  tools/intel_tiling_detect: Introduce tiling detection tool

 lib/intel_blt.c             |   4 +
 lib/intel_bufops.c          | 146 +++++++-----
 lib/intel_cmds_info.h       |   1 +
 tools/intel_tiling_detect.c | 432 ++++++++++++++++++++++++++++++++++++
 tools/meson.build           |   1 +
 5 files changed, 528 insertions(+), 56 deletions(-)
 create mode 100644 tools/intel_tiling_detect.c

-- 
2.34.1

