Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FADCCAC582
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 13:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7AC10EC5B;
	Fri, 12 Sep 2025 13:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMbXBsua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1A310EC58
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757685292; x=1789221292;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b9UPztoVafY0cWXipOqWMLoaKaCSotSM0N+wN1q0g48=;
 b=eMbXBsuagARJZz0bX4xv4xE5r9B+QoEnTII6PVCq8+STI2ICCtuMdGkj
 ojOEDUuL2nWSPh1E4WTsqyIFvsZ8wnWN0deUxEl6zAYiti8pqtAx99B//
 oe5WkP2+QfeDkgl61vgxUy99hMwa3Lo+HWlKi1fFRxwuRqNo22P7ktNE2
 KHZZQeV9NQW7GljAlLB1wZ+CL6sdTs9Ic+3WZFnW3vqrOH4TKLk2ojBT4
 9yPx01b0+zCTAggSblQ+IfN4Ua2e/3yKGf+1FiR82E3ezUFX2jdWvDKEn
 JWsD3t/ofLaFM86uZWUcmHo/2gBMB7sDRjc0J1hip/edIvkvQ2i2HbXvB A==;
X-CSE-ConnectionGUID: Og5ojFm4TRma1PRA0IS4vQ==
X-CSE-MsgGUID: 8R2TmMmXQNSLu9rRGhZqhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60093383"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60093383"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 06:54:51 -0700
X-CSE-ConnectionGUID: Vk/Dusc7Qe+6REbwxRgBvg==
X-CSE-MsgGUID: QqQRrAJqQAOrUtF8VUzQug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174750553"
Received: from pgurram-desk.iind.intel.com ([10.190.238.70])
 by fmviesa010.fm.intel.com with ESMTP; 12 Sep 2025 06:54:50 -0700
From: pravalika.gurram@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 himal.prasad.ghimiray@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v4 0/1] Add pat-index-madvise
Date: Fri, 12 Sep 2025 19:35:44 +0530
Message-Id: <20250912140545.1180542-1-pravalika.gurram@intel.com>
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

From: Pravalika Gurram <pravalika.gurram@intel.com>

Add pat-index-madvise test to verify setting different
pat_index values for multiple VMAs. This test uses
madvise to set various pat_index values and
verifies that different PAT values can be assigned
to multiple VMAs as expected.

Pravalika Gurram (1):
  tests/intel/xe_exec_system_allocator: Add pat-index-madvise

 lib/xe/xe_ioctl.c                      |  29 ++--
 lib/xe/xe_ioctl.h                      |   4 +-
 tests/intel/xe_exec_system_allocator.c | 182 +++++++++++++++++++++----
 3 files changed, 175 insertions(+), 40 deletions(-)

-- 
2.34.1

