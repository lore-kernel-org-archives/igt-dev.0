Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98259EF5863
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 04:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA3310E129;
	Mon, 23 Feb 2026 04:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/HJyEQV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C2A10E129
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 04:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771820668; x=1803356668;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SiF6P2xWIfHfGIhd7FG4JpChlWB3dDmbVyYkBNzRT00=;
 b=L/HJyEQV+f4z4gO9iUX2l0NvSVizzFGPfiRRpwdn+c35DITyyqdnLdGu
 dS81/dWYiYpkCiMDWa63wPxniKh9Q3fuALibu1NppS2D1ggqJum/NIkmc
 8ZGnLUoFWZdBBnUPCuqZMedU0OZ3hY034ICc6TbAJQRAjfSfpeYDOQi2M
 DRwE35+lf9FR6A+NQt+1b30nr4ageblhA/9h5rE0Gc7mefSP/at93M+p7
 TLS3FzyymjVtxZOUa6XFPm7T7LC359mzLPrUjeBhSsE5h2DzLpZpcirWZ
 Ak74HVxW4hgipcB0Gj5Yj1CglTsW/41rYZofNWzOJSCK62w7lOBM2c/4B w==;
X-CSE-ConnectionGUID: HiFcQWTMQq2sZWoOGXD5mQ==
X-CSE-MsgGUID: XmB1VcuLRn6px6RxLWv55w==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76673713"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76673713"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:24:28 -0800
X-CSE-ConnectionGUID: kSDuiYPiSniG+pCkZP1Ybw==
X-CSE-MsgGUID: XNRivz+rSTa3WowBreNw0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="212876783"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:24:26 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 0/2] intel_vbt_decode: Sync intel_vbt_defs.h with latest
 changes
Date: Mon, 23 Feb 2026 09:38:57 +0530
Message-ID: <20260223040859.1362813-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

Add VBT bits for:
 - eDP Data override:
   - 4d33c77cf2c3 ("drm/i915/vbt: Add eDP Data rate overrride field in VBT")
 - eDP Pipe Joiner Feature:
   - 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")

Note :
 - The commit:
   f3c65a8e9b09 ("drm/i915/vbt: split up DSI VBT defs to a separate file")
   only moved MIPI definitions to intel_dsi_vbt_defs.h which are already
   synced with definitions in IGT.

Rev2:
 - Use the commit ID which actually changes intel_vbt_defs.h (Kamil)

Ankit Nautiyal (2):
  tools/intel_vbt_decode: sync intel_vbt_defs.h with commit 4d33c77cf2c3
  tools/intel_vbt_decode: sync intel_vbt_defs.h with commit 1b85a9b04681

 tools/intel_vbt_decode.c | 40 ++++++++++++++++++++++++++++++++++++++++
 tools/intel_vbt_defs.h   | 19 +++++++++++++++++++
 2 files changed, 59 insertions(+)

-- 
2.45.2

