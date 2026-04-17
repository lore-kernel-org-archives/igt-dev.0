Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65160F8E4B4
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 07:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AAA10E987;
	Fri, 17 Apr 2026 07:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eITcjBHl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA3210E988
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 07:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776410961; x=1807946961;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vqlcFCuJ+jc1pY+FdAR/9dv/JsOBn6vgjrUJm7MqaY0=;
 b=eITcjBHlruEYAKliVPNUnQ4Jv3ZDiZnPD+4yFF0mxwEDMD6jJFtknrT8
 b/QQmfoA6ZJp73BT10o1xLMfBh33VGUOcoDMUvqN7CnvtzK0qV6b00aL8
 nUUQ7iLsOgp46iwwtQTS1YTA68MXpzbkJGyYRi2xyXwmhgqy3C7kRJKd7
 EkCjNIOG4SwzCm65wIX21Qbk44zvWtCV0e6ZFwP/v7iooVtpyedAV+gzy
 5K3OkuC1Zser+jroZvzuZyZ9Kq0NEZciIdB9lhdwLfvJ4e+FFbP1qUDwg
 JL0BESP6b0xKAkKf6+moS6UabkFTJpqSsSEXPZCuB5tiRFrUbqC0dvdhz w==;
X-CSE-ConnectionGUID: mJ/v45oZTu2lxfM6cc530Q==
X-CSE-MsgGUID: VunjKaB+QAiUKYYAfGoD5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81021117"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81021117"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:29:21 -0700
X-CSE-ConnectionGUID: lxWgpRPaRV679iK0NhJR9Q==
X-CSE-MsgGUID: /sYRqwe3RICZLoslHOdL2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="268985249"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:29:20 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 0/4] intel_vbt_decode: Sync intel_vbt_defs.h with latest
 changes
Date: Fri, 17 Apr 2026 12:44:28 +0530
Message-ID: <20260417071432.2252380-1-ankit.k.nautiyal@intel.com>
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

Rev3:
 - Split patches for header sync. (Ville)

Rev4:
 - Use pipe_joiner_enable to match with kernel variable name. (Karthik)

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

