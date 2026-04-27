Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847B2FF8860
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 13:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D1F10E743;
	Mon, 27 Apr 2026 13:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgKJScFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0867B10E743
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777294849; x=1808830849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IATyMFNG4J1lvm1QKgQb4gSODhpe/fOqLVnTXrz0zUQ=;
 b=NgKJScFxKID3SoY8byO51lO5RIUKF16lS3P8YXXaVeEHeL67IrMh0mbj
 OE5P/CAd8Xh03ugJDgqWll0COjAcqhtgWSvrgMZISFpfYpegyhpiCNsF2
 ihl93jW6fTgSSn26aG09hFFvrdiGUPstfwSLXDpyfpT9p4wNmtnDV6Nem
 ozt8jBTFHQSvS5MWG4eO9nUSHdiVMQX9NNMbZbEbGDPq1IPF1ybJSNrBn
 Ou35xYMN2TM0PIoUpDfH9wCRC0TXYrkcjb1YUD5QV2cUA9U4cdczoDiMT
 +E6T9kk1Oa7MF0pHYyAA07K2SvneGiOFt6Hk3LN3r0MLbZMIoL8dmTAWn Q==;
X-CSE-ConnectionGUID: +BRZN4pKTiuut0sTvhZhkQ==
X-CSE-MsgGUID: zhwfn4OtTcKAuY1yqTcc9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77339178"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="77339178"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:00:49 -0700
X-CSE-ConnectionGUID: VpjPJD5xSTaRZfL51GwGGA==
X-CSE-MsgGUID: ADlTa7DjSgy5gifLylX3aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="237597675"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:00:46 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 0/8] intel_vbt_decode: Sync intel_vbt_defs.h with latest
 changes
Date: Mon, 27 Apr 2026 18:15:59 +0530
Message-ID: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
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
 - Dediated External port, Dynamic Port over TC:
 - 203c7904f2d8 ("drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc")

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

Rev5:
 - Use the script shared by Jani [1], to synchronize the intel_vbt_defs.h
   instead of hand rolled version. (Ville, Jani).
 - Add the commit that introduced `dedicated_external` and
   `dyn_port_over_tc`.
 - Add macros required by the intel_vbt_defs.h in
   include/linux_scaffolding.h and include this in intel_vbt_decode.c
 - Dump the `dedicated_external` and `dyn_port_over_tc` in
   intel_vbt_decode.c.

[1] https://lore.kernel.org/igt-dev/da72e919b7cbd787e793f0141697f7c37957f998@intel.com/

Rev6:
 - Add BIT_U64 in patch#1. (Karthik)
 - Fix styling issue and format specifier in patch#6 (Karthik)

Ankit Nautiyal (8):
  include/linux_scaffold: Add BIT_U{8,16,32} macros
  tools/intel_vbt_decode.c: Include linux_scaffold.h
  tools/intel_vbt_defs: sync intel_vbt_defs.h with kernel commit
    4d33c77cf2c3
  tools/intel_vbt_defs: sync intel_vbt_defs.h with kernel commit
    203c7904f2d8
  tools/intel_vbt_defs: sync intel_vbt_defs.h with kernel commit
    1b85a9b04681
  tools/intel_vbt_decode: dump eDP data rate override field
  tools/intel_vbt_decode: dump eDP joiner enable field
  tools/intel_vbt_decode: Dump dedicated_external and dyn_port_over_tc
    fields

 include/linux_scaffold.h |  5 ++++
 tools/intel_vbt_decode.c | 53 +++++++++++++++++++++++++++++++++++-----
 tools/intel_vbt_defs.h   | 22 ++++++++++++++++-
 3 files changed, 73 insertions(+), 7 deletions(-)

-- 
2.45.2

