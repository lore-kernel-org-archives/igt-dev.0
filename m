Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875D1CFA46E
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 05:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5FB10E058;
	Fri, 21 Nov 2025 05:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iijvb8Oc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419EB10E058
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 05:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763702358; x=1795238358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KZuDxdyJq7M8uYUJxJuiL1U0lFZwvCc7cuhNoBbkefk=;
 b=Iijvb8OcaTNxgOi0Y9492OmAI3ilT9aRQk/mPoYtis//N7MsGhyUWWZp
 MqN05LJ2zaJrWzJn2+V5QadX3Cngv+qrP2xW9wb8+be4s4sFByB+opket
 LzEjOwwyroyxT31RVAGqoxAVx+IN1YzdGktNnVWqFbJmgp4AdAZNfx7rd
 3gHAxtwD7eFzvtZAvst0I+9ogVMqP6zXxPR96u9OAyGG05cbC5si3rADv
 wGNPfZ93rQxVkq6fJzrklEBZPSD4MSWldsVXigRX8ZKdcxloqKHnhup55
 mDedbeMIopXzeFwQptxckpcpO9OEvcEvmmxvQcoyyRWfsx8rSAZUl+ojY g==;
X-CSE-ConnectionGUID: 81z4Oiv9TZmMbdq1p4jDYQ==
X-CSE-MsgGUID: mXVNzJmNSzibYE2e7Li/wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69647248"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="69647248"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:19:17 -0800
X-CSE-ConnectionGUID: OTdHBVpLTvuEqDoBChnTPw==
X-CSE-MsgGUID: l/KnQOt9TSyKQsnxH8BBaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="190813098"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa006.jf.intel.com with ESMTP; 20 Nov 2025 21:19:15 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v5 0/4] tools/intel_gpu_frequency: Add multi-GT support
 and Xe driver compatibility
Date: Fri, 21 Nov 2025 10:31:50 +0530
Message-Id: <20251121050154.1533992-1-s.sebinraj@intel.com>
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
- Add support for regular users to use get operations.

Driver-specific implementations:
- Frequency name mapping for Xe (RP1→rpe, RP0→rp0, RPn→rpn for Xe)

Usage examples:
  intel_gpu_frequency --get --gt 1     # Get GT1 frequencies
  intel_gpu_frequency --set 400 --gt 0 # Set GT0 frequency
  intel_gpu_frequency --list           # List available GTs

The tool now auto-detects i915 / Xe drivers and uses appropriate
interfaces.

S Sebinraj (4):
  tools/intel_gpu_frequency: Add support for get, set in order &
    vice-versa
  tools/intel_gpu_frequency: Add multi-GT support
  tools/intel_gpu_frequency: Add Xe driver support
  tools/intel_gpu_frequency: Allow regular users to use get operation

 lib/drmtest.c               |   2 +-
 man/intel_gpu_frequency.rst |  34 +++-
 tools/intel_gpu_frequency.c | 332 ++++++++++++++++++++++++++++++------
 3 files changed, 312 insertions(+), 56 deletions(-)

-- 
2.43.0

