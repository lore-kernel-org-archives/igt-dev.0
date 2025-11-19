Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E47CF58F5
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 21:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9332C10E690;
	Wed, 19 Nov 2025 21:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4OISwen";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF8610E690
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 21:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763586161; x=1795122161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k/cC43mCL8Iv+80LDnCD4L2SMzXkw6Rp+AfAGdv/e6g=;
 b=f4OISwen0rsn8fdwHsq3SSpCIC/s8Mw5veDBZma49QqXSYIyLjR36vHZ
 +vu4+KJd4fVG6jXXVz1p04brtZjzq4f52/90x+BNPP/cFBY4Owz3rqOJG
 YOo1DnDiWNVpaOWdfm0Q6qYOHaCkNbN5L7KnHso9/R25GIIGpIh/UikEh
 I3hul8PkzMsVoAY4Nm2HTSzWK90BkNxl+hqNq3NhEnF460xaSbBhcfIFi
 x+n1dDo0z8WXztXW6HVWKDB2T6QXty4z4PiK3OYng9kYyxIENUIPc8oO4
 wUBRQQYW6fROAUjINdAP08L5Pw9aKwT/aIqF0Rxdh1lBRKSXYYHGxexKD w==;
X-CSE-ConnectionGUID: 2HR+a5HySA6Ce1Vc/mW48Q==
X-CSE-MsgGUID: bMdfsIaITROiN1hT/1yx1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68249385"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="68249385"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 13:02:41 -0800
X-CSE-ConnectionGUID: iFdzKVhxSCaOyNq1H/MLLg==
X-CSE-MsgGUID: ukRsHDXLTLauT+9JIIfXBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="222099809"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2025 13:02:38 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v3 0/3] tools/intel_gpu_frequency: Add multi-GT support
 and Xe driver compatibility
Date: Thu, 20 Nov 2025 02:15:27 +0530
Message-Id: <20251119204530.1357940-1-s.sebinraj@intel.com>
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
errors, prior to this changes.

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

S Sebinraj (3):
  tools/intel_gpu_frequency: Add support for get, set in order &
    vice-versa
  tools/intel_gpu_frequency: Add multi-GT support
  tools/intel_gpu_frequency: Add Xe driver support

 lib/drmtest.c               |   2 +-
 man/intel_gpu_frequency.rst |  34 +++-
 tools/intel_gpu_frequency.c | 363 +++++++++++++++++++++++++++++-------
 3 files changed, 321 insertions(+), 78 deletions(-)

-- 
2.43.0

