Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAC6C6FD1F
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 18:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A2610E60E;
	Thu, 21 Mar 2024 18:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kk+DG6Lp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C53B10E60E
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 18:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711045068; x=1742581068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n25lJdv+ft/czj7F4i1z+31LEAY+isGkL8VkqTWGBfc=;
 b=kk+DG6LpJIx+SLDVXDcH94dshQ1uNUTqh0lu/bCUxGAdHvI+QHrLrhDP
 uT8ye6jP6dI4CKjBlp3ZoIXBWc+Gb4UPAZ30WCamJEpOAVeDYsYgEV4TN
 jTuy8w8qyX3UtmX7bQ0mB0Sq2SMP8+8wwpB422b+vw+pOKwZ7S0tpwMAE
 uPHe2fVSn7spD68eJTCGTdPkuqqBOsp3T8NQBu5OPwlwwFM8Qdul7tcMo
 U+FtjyZauh3WcS5dU2fQZBAm5TkzbibZ2iJBkq9ZfhoAPLvfkvjgM1YOR
 Id7DzgmeWNXzfVbBuOhqdcfEx+gzunNbFmmd3J5moNlvLOnQGLyd9v3AR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5894099"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5894099"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 11:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14512551"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 11:17:45 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/4] revamp big joiner test
Date: Thu, 21 Mar 2024 23:58:27 +0530
Message-Id: <20240321182831.1143175-1-kunal1.joshi@intel.com>
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

modify test to support multiple big joiner outputs
simultaneously, support for ignoring fused pipes and
addition of subtests for testing force joiner support for
which is added by below in kmd.

drm/i915: Add bigjoiner force enable option to debugfs

Kunal Joshi (4):
  lib/igt_kms: move bigjoiner_mode_found to lib
  tests/intel/kms_big_joiner: revamp bigjoiner
  lib/igt_kms: add helper to enable/disable force joiner
  tests/intel/kms_big_joiner: add tests for force joiner

 lib/igt_kms.c                |  79 ++++++
 lib/igt_kms.h                |   4 +
 tests/intel/kms_big_joiner.c | 486 ++++++++++++++++++++---------------
 3 files changed, 366 insertions(+), 203 deletions(-)

-- 
2.34.1

