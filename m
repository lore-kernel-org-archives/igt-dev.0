Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABC2D711CA
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 10:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE3610E8DA;
	Thu, 21 Nov 2024 10:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOarTdJ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36B810E8DA
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732185052; x=1763721052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CdQ/3H9bSH/KQigGflzr68/ga7EaBm87uCOOQlkR8AA=;
 b=TOarTdJ1GTYb4nUug4h3h5rQ2SfyuXhDWzY6Q+FTe0gR2CYmUC9VNL/K
 5Dz/JNyplnKeefcDa9AYpaQqexUhGj+1orgsvEf4ZC9atcgO4Yn8FzyQ5
 usHYfzqgHQ20hmVJ4YRVCL/txhmhQoGUe96TD5aLYCaAg/xSJTlHrAKZB
 3+HACn2V0OQgAdyHjhn08VDU1DKgUiyqYPO0ZfF0K933zAMYsGnRh2G60
 uHbkOlCCX8oa7WcyysjQGSAk/tdfqU+bIIm+dASuFQ391y9slUIaGFoX6
 iej0TmTvHcnVMpTp/zaCK5kzymtA525rN9WkXZC9jKTVBwXR9I0/3AdJP g==;
X-CSE-ConnectionGUID: JJPxB5RmQ+aV5V92QKEwGA==
X-CSE-MsgGUID: /UOEEmOaSySq3TTuM+Pzrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43685030"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="43685030"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 02:30:51 -0800
X-CSE-ConnectionGUID: 5ytDlxQ6QKeS/2PTDtUrZw==
X-CSE-MsgGUID: UYVCbhtyQkSmbhGFWC7USA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="90155542"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 02:30:50 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] lib/igt_kms: Add 6k resolution support for a single
 CRTC
Date: Thu, 21 Nov 2024 16:15:52 +0530
Message-Id: <20241121104554.65366-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

increase big_joiner limitation to 6k from 5k for display version
greater than 30.

Apart from lib following tests are modified:
tests/intel/kms_pm_lpsp.c
tests/kms_flip.c
tests/kms_setmode.c

v2: added bspec no. and split the patch.
v3: remove unrelated change.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  lib/igt_kms: Add 6k resolution support for a single CRTC
  Fix bigjoiner compatibility checks for connector modes

 lib/igt_kms.c             | 22 ++++++++++++++--------
 lib/igt_kms.h             |  5 +++--
 tests/intel/kms_pm_lpsp.c |  4 ++--
 tests/kms_flip.c          |  4 ++--
 tests/kms_setmode.c       |  4 ++--
 5 files changed, 23 insertions(+), 16 deletions(-)

-- 
2.25.1

