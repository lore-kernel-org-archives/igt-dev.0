Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C9CD2F7CF
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 09:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B1810EA9A;
	Fri,  5 Dec 2025 09:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VvE9YVeI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06F810EAB3
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 09:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764928252; x=1796464252;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HVG65U8M013qHWvS4fy4z2LYgm19xb+XN3ejIvKZJMo=;
 b=VvE9YVeIJZ7AhbvYoBEPZ9CinduyOEvJ55475hU4EjTomha/qaCZE4EM
 3K6Nd8uM0i3sYHixIbXvelv9ytnKGCIPPBPgF3juNQkUpN/kQzGdyMhAG
 gHouaEu5lHwV6odB/Tyyx09FMmRRyiNj6kXk0Le0X7DkxU512wHHGhKN7
 IWeE+rrEIGbd++H9zowig8XAgijpny7wCfDIb1wFgFa1rkVkPf6H7DS5m
 5Aa0Ko0DlKda3UWeE8hTT/I1jQufGA9b+uU2Xzx+oGTsngye6yAfZPhoB
 Gvb8xyuXXY7XL8U3t/7oK3Zwd+eB8OKfMeRsU6o0YYKcZmOExUylF+IV3 Q==;
X-CSE-ConnectionGUID: 0FVUzmDTQvCbbl35Ew9M9A==
X-CSE-MsgGUID: FeKTghswRAOb52Tv/iSiqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70809983"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="70809983"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 01:50:49 -0800
X-CSE-ConnectionGUID: JQ8AGGGmTNqtVoQV9g7jvQ==
X-CSE-MsgGUID: mMPKQ4VBTROGnQen5+V1JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="196052002"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa010.fm.intel.com with ESMTP; 05 Dec 2025 01:50:47 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, krzysztof.karas@intel.com, x.wang@intel.com,
 S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v6 0/3] tools/intel_gpu_frequency: Add multi-GT support
 and Xe driver compatibility
Date: Fri,  5 Dec 2025 15:01:27 +0530
Message-Id: <20251205093130.3428648-1-s.sebinraj@intel.com>
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

This patch enhances intel_gpu_frequency to support Intel GPUs with
multiple Graphics Technology (GT) units and adds compatibility with
both i915 and Xe drivers. This also includes the changes to use
get, set in order and vice-versa which was resulting in assertion
errors.

Key improvements:
- Add runtime GT detection using igt_sysfs_get_num_gt()
  and xe_number_gt()
- Auto-detect driver type (i915 vs Xe) using is_xe_device()
- New --gt/-t option to specify target GT (defaults to GT0)
- New --list/-l option to display available GTs
- Driver-agnostic frequency management with unified interface
- Add support for get, set inorder and vice-versa.

Driver-specific implementations:
- Frequency name mapping for Xe (RP1→rpe, RP0→rp0, RPn→rpn for Xe)

Usage examples:
  intel_gpu_frequency --get --gt 1     # Get GT1 frequencies
  intel_gpu_frequency --set 400 --gt 0 # Set GT0 frequency
  intel_gpu_frequency --list           # List available GTs

The tool now auto-detects i915 / Xe drivers and uses appropriate
interfaces.
---

Changes in v6:
- Remove the patch added for regular user read as it already updated
- Rebase code with latest changes in intel_gpu_frequency
- Remove bool argument in functions and re-design approach
- Revert the change made in drmtest in v4

Changes in v5:
- Add patch for regular user read

Changes in v4:
- Rebase the patch to fix Ci.build issue in v3

Changes in v3:
- Use --list as arg instead of --list-gts
- Change printing of frequencies to tabular
  and with additional informations

Changes in v2:
- Remove output from commit message
- Add support for simultaneous read and write 

---
S Sebinraj (3):
  tools/intel_gpu_frequency: Add support for get, set in order &
    vice-versa
  tools/intel_gpu_frequency: Add multi-GT support
  tools/intel_gpu_frequency: Add Xe driver support

 man/intel_gpu_frequency.rst |  34 +++-
 tools/intel_gpu_frequency.c | 360 +++++++++++++++++++++++++++++-------
 2 files changed, 318 insertions(+), 76 deletions(-)

-- 
2.43.0

