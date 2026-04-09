Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C2AE98FD6
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 09:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1639D10E2E9;
	Thu,  9 Apr 2026 09:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dc3dPNZ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B517110E2E9
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775727523; x=1807263523;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F059mkX3uvJ9ta9yoXZDLv0/rtucpfT6NIsrg6uAK3o=;
 b=Dc3dPNZ8wiPHEjGE4UcNZkIM9c9MXAE6t1x3kCo+bju1Vpb97nprtXp/
 8WLOj1FGu4XDExs30E+F89IlerAqdqxEHL277+espwPKwWzWnnfKsjGLI
 SjLbgOQqOtMHrdOQ1mAM74ZNreSqpXF8INaSrpvg9PijqKIbPTXw3NXGI
 hevThjh658+kcU2tbS6lhxppwCELwiW5WuUx3pXNxy9hhxCEk5PWxMh1Q
 E+80XomxiIDJBgcyPNCytSADt5njjgpYYRJBTwLig8k+04zjTMAtGLaIK
 umfFXo7zGwikPAponz4UkD/3AMUXWZZm/MFsrxsmlodPXnAW2OGmApgoz g==;
X-CSE-ConnectionGUID: yikovGvQTACkw+aRrD/8Kg==
X-CSE-MsgGUID: DmuepgDLTQeec9d1tRwArA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76798813"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="76798813"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 02:38:42 -0700
X-CSE-ConnectionGUID: PFeG83PmTrKGMgTYr2469w==
X-CSE-MsgGUID: Cc52BW/ASDiWmLEIr9c2uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="230391521"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 02:38:41 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/3] RFC: Add tests for atomic failure error reporting
Date: Thu,  9 Apr 2026 15:06:36 +0530
Message-ID: <20260409093639.27449-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

RFC IGT patch adding a test for DRM atomic failure error reporting.
This is related to and depends on the KMD series at
https://patchwork.freedesktop.org/series/152276/

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (3):
  DONT_MERGE: include/drm-uapi: Add atomic_ioctl error codes
  DONT_MERGE: include/drm-uapi: Add ERROR_REPORTING capability
  RFC: tests/kms_atomic_error_code: Add tests for atomic failure
    reporting

 include/drm-uapi/drm.h      |   8 ++
 include/drm-uapi/drm_mode.h |  60 ++++++++++++++
 tests/kms_atomic_error.c    | 156 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 4 files changed, 225 insertions(+)
 create mode 100644 tests/kms_atomic_error.c

-- 
2.43.0

