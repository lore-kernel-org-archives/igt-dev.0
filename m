Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4C4F8E4A7
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 04:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EBF10E28E;
	Fri, 17 Apr 2026 04:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSm8LmQu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEEB10E28E
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 04:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776399920; x=1807935920;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bvghHCgcf3e8vWwtmzXrawV4ltwSTUAUNyPvWUxHnMU=;
 b=eSm8LmQuDd/den989aJKA5JxISpaMN6bsMK+Mmqqf9PWLhXxHriE1C5P
 S+6s0lHnrjimVec2JofHEBWcnx2Ol/Hk5iE2yh7w9EamsAp0dNxYBTbEB
 BsV405GFYp4cRb6vTCJxIiBYV/8lHZcHTjePsLeUvimz5JnqoCI363zsA
 9DSvF69OPuzAMuoz4KAoxZenictQLyJ8h28+mim1vNIAFItw3qz6w82R/
 /4mcUq9/1JitBJZhII7wRPkem/3dE61K+QE/TWd4iDofezykg8XFWBR1o
 lnk2rDJ3csxeGeFkBlFGhJqgS0YuyXohP6KgYtfZzRDCt6WXGQICPTD7Y g==;
X-CSE-ConnectionGUID: bWMQp7j7S7+F43Nkvj78+w==
X-CSE-MsgGUID: 8lkpszIvS9SSoJ/zIeaPvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81282678"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81282678"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 21:25:19 -0700
X-CSE-ConnectionGUID: yrGOSBU+QfOkHlf6KQ29bQ==
X-CSE-MsgGUID: 41qJA23IQUisotJGzG/IrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="229922442"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 21:25:18 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 0/4] intel_vbt_decode: Sync intel_vbt_defs.h with latest
 changes
Date: Fri, 17 Apr 2026 09:40:27 +0530
Message-ID: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
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

Ankit Nautiyal (4):
  tools/intel_vbt_decode: sync intel_vbt_defs.h with commit 1b85a9b04681
  tools/intel_vbt_decode: dump eDP joiner enable field
  tools/intel_vbt_decode: sync intel_vbt_defs.h with commit 4d33c77cf2c3
  tools/intel_vbt_decode: dump eDP data rate override field

 tools/intel_vbt_decode.c | 40 ++++++++++++++++++++++++++++++++++++++++
 tools/intel_vbt_defs.h   | 19 +++++++++++++++++++
 2 files changed, 59 insertions(+)

-- 
2.45.2

