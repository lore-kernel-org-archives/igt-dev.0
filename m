Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593BEC46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 10:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD0E10E9D7;
	Wed, 24 Jan 2024 10:24:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7138C10F271
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706091881; x=1737627881;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=egFa3isJs2eqI2XAhSfNDEwAs5saEc8CiEPmCvT9G4k=;
 b=JiLIKFYJ0Xpb5NOEkNtI7I6du2ApBySV+2E23jutN+lFMHjn12KZrR8q
 kBRbtHFisdOou+0nZ4E+MPIs+Cbcod9d1UzqF7/pklvm1DwKUGzp3f3uy
 7uPjZNEcJrJbo8TdMx+fW01g6UYbO2rruodMA/TWSpxi4+O6AgSg93QJz
 tO1ki1qyA82y2ST0WFRXuuo9PlNTcSdTSEyULp2OOCJPpTGiDxlaqu3Ta
 L21gZS4mpldPHZnRFFYJO/weELhf4jZ1AH3CKoGlQ5XTLn1F2wEMBa1R1
 1HDdLVmriS3N4Cl5RQtFkh9AYviKGiton5CClxT4OxzTGwi1WomJenKRb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401463945"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401463945"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 02:24:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905546514"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="905546514"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 02:24:38 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] check modparam before enabling psr mode
Date: Wed, 24 Jan 2024 16:04:08 +0530
Message-Id: <20240124103410.1259607-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

with i915.enable_psr modparam, one can enable required psr version

i915.enable_psr = 0 PSR_1 and PSR_2 tests should skip
i915.enable_psr = 1 PSR_1 tests should run but PSR_2 tests should skip
i915.enable_psr = 2 PSR_1 and PSR_2 tests should run

fix test to check modparam before enabling through psr_debug debugfs

Kunal Joshi (2):
  lib/igt_psr: add helper to check of given psr mode can be enabled
  tests/intel/kms_psr: enable given psr mode only after checking
    enable_psr modparam

 lib/igt_psr.c         | 20 ++++++++++++++++++++
 lib/igt_psr.h         |  1 +
 tests/intel/kms_psr.c | 12 ++++++++++++
 3 files changed, 33 insertions(+)

-- 
2.25.1

