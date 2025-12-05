Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A0AD2CDF0
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 00:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C293110E9EE;
	Fri,  5 Dec 2025 00:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mo+theoO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFB310E9E5
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 00:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764893135; x=1796429135;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kFdfzh8anaFwBuICfhdFapSxlvneohDnSrYnfrV6NKo=;
 b=mo+theoOOgUyBOMFLyZx+3yqn+XfrGdu1bdMBBtVWQ85G4ldUEqK4x1X
 sz/4EJkgi/wMFypaOPmLUGuCOw00vLdlNglBHvm84u7KTqLMCwRy4/6MJ
 nQ1C/uIfd41chh0E3x9wN2efMACTv48I6yd9d1B/+3AmwIw4vif2y8vPH
 /YhfqLlBZRQKP1fBv4hgpbvPvnOjPA6RrXe+q58MCCQ8gIk8LURrMfRnr
 yC08YJRLcK7bOkOitGvUOnvbkDzxHSl8fTlkT0rV9QJ1v0YC0ZBOMBNff
 Fc5oiCixxcHk2bo0oxmidMIv2sDhRQ9F0uJ45uxtSnpfIHPH1bSi7ZrAr A==;
X-CSE-ConnectionGUID: /caFU/gzSfGeO9kOKa+Hog==
X-CSE-MsgGUID: I7wMiE3zTAuCyF5NxPkZEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66820499"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="66820499"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 16:05:34 -0800
X-CSE-ConnectionGUID: a2l/rDFGQ7yO2vdPzEzy2g==
X-CSE-MsgGUID: Zkt7jQrzRW2/vMcQUgOKkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="194192909"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 16:05:33 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 i-g-t 0/4] OA: Run MMIO trigger tests on all OA units
Date: Thu,  4 Dec 2025 16:05:24 -0800
Message-ID: <20251205000528.720706-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

v2: Same as v1 except that Patch 1 now has a real kernel commit

Ashutosh Dixit (4):
  drm-uapi/xe: Sync with DRM_XE_OA_CAPS_OA_UNIT_GT_ID definition
  tests/intel/xe_oa: Return hwe from same gt from oa_unit_engine()
  tests/intel/xe_oa: Run mmio-trigger tests on all OA units
  tests/intel/xe_oa: Use separate oa unit variables for caps and
    iterator

 include/drm-uapi/xe_drm.h |  55 ++++++++++++++--
 tests/intel/xe_oa.c       | 135 +++++++++++++++++++++++++++++++-------
 2 files changed, 162 insertions(+), 28 deletions(-)

-- 
2.48.1

