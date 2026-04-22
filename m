Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A915F94CB2
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 03:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2FA10E261;
	Wed, 22 Apr 2026 03:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMzmHr1C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AC710E261
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 03:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776830306; x=1808366306;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vk99aRreKkUWFufyJPCGXFw2X/LmPj1DxjjIFRDkNK4=;
 b=MMzmHr1CKAIQEmLVxHpjDchFXgpF0Jtbf4UWniIRtXv7jIizBrZ2mFJR
 gsWjfdaAbuUWcNNmoGLfcQHqrKzdeJEpy55AYfmfKUE+yf62Y2Ew7x6dm
 EpXbcbQXE3+UTFH+Wo2klCfv4aqMyCFi4t+bMtzo2hSz1PbRp+R+yL16O
 +cI8qVWk9V7zipPXGR3ndcfyBRz/8E5NXmMrSRNdbgW8h8HrcUu2ZgARp
 XutJANl+ijoev9sMhVGRx/nA1E0okTYHeQyNGt+ScIXFBYXxdcrbF7kEc
 li6PfYxp835ZaqfdrVR9DFZV4b8G4+Ce01lhP90klsSba9ZnuZjPH8lR5 g==;
X-CSE-ConnectionGUID: nWKAKx9jRKekR/cONn/YQA==
X-CSE-MsgGUID: bAo20V5TTY2ytsrh8QugMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="95338476"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="95338476"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:26 -0700
X-CSE-ConnectionGUID: Kkg4GjSsTmK2C524vauO+w==
X-CSE-MsgGUID: dcKoQ/CIQ7qwzHMcOOHQfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="232151305"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:23 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 0/8] intel_vbt_decode: Sync intel_vbt_defs.h with latest
 changes
Date: Wed, 22 Apr 2026 09:13:27 +0530
Message-ID: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
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

 include/linux_scaffold.h |  4 +++
 tools/intel_vbt_decode.c | 53 +++++++++++++++++++++++++++++++++++-----
 tools/intel_vbt_defs.h   | 22 ++++++++++++++++-
 3 files changed, 72 insertions(+), 7 deletions(-)

-- 
2.45.2

