Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B66EEE26C
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 22:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB3F10EC63;
	Thu, 12 Sep 2024 22:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mb9rRJy8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376FB10EC62
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 22:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726180211; x=1757716211;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1t/tuwXbsz4A8KLE7qS9PfcwAGfh2TgG71rEdt1uEWM=;
 b=mb9rRJy8AG1yfIRETJIhm+vFiUj01toapJTCGi5SH17JhZ7rTNRFtPeS
 lvQDah2gTIqSI/mlKLde2Xj08UukI4WOsSk0mjwCr4ckErxvJR+a0uOLi
 WU0oI4HxSPupV1Bw9VIEie0g3hCXOFnyf1LFG0db4ZwG1J6P3olPnN4u9
 ExM0BefDl/K+TUfKbrbDrI/GCLNDUrL+34fg5nZRnOB3V5lWGBpY1bPts
 BmJjuhNXWLS6OIqwHlK8slY0Ev2KtqLlcaOZB/QX+5AQ4n5phiR5Mgieu
 zeMtiIknF5PVNRlr6Sg4nk5lb9kxdz0Ey2eU86n7BsFWsaJnqavO4BW6j A==;
X-CSE-ConnectionGUID: bHeLLF6fTuqG3Idlh3DLZA==
X-CSE-MsgGUID: i9ITbCqoSc6oEsZ8+jPO5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="42577563"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="42577563"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 15:30:11 -0700
X-CSE-ConnectionGUID: WcEqq9K4Qv62uccPqoYlXw==
X-CSE-MsgGUID: hvGQP19cSQK2nvJizSrGEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="68633425"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 15:30:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 0/1] Fixup xe_dma_buf_sync to new KMD behavior 
Date: Thu, 12 Sep 2024 15:31:09 -0700
Message-Id: <20240912223110.1054974-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

External BOs will use BOOKKEEP slots [1] per expected behavior with user
space setting the read / write dependencies. Fixup xe_dma_buf_sync to
conform to this behavior.

Matt

[1] https://patchwork.freedesktop.org/series/138531/

Matthew Brost (1):
  tests/intel/xe_dma_buf_sync: Update dma-buf sync to use import read /
    write deps

 tests/intel/xe_dma_buf_sync.c | 137 +++++++++++++++++++---------------
 1 file changed, 76 insertions(+), 61 deletions(-)

-- 
2.34.1

