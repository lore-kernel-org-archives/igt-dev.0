Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F70C54E66
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 05:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B7C10F1F2;
	Fri, 15 Mar 2024 05:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6bFM6Uw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F0410F1F2
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 05:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710479127; x=1742015127;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TF1YRBep1ulG+CpUbmKg/jiHYi2BCKD2mp0Nf8B2vIs=;
 b=M6bFM6UwviMjCDHCDwGfKcXCDB+o5f7HIYu3EDZuf9suzq5iaVuFgq+C
 fw4dPv60BffD7icyXGML4ELePR8LGRY+nQIvAX0Sb8FUt/CVjsVUhn1Ed
 rFU6B0MZfypGQh4nBT2YOhsJ43z5TbqteWMJAanfNafPfjg/bSJPayZ5y
 NALYTQm+BxTQ1RhXM6UenSP7NmekqQrcWTmFTc8AGnZo0/VZArlJudrY+
 A13uXMW54qFcM3slrUbObCvnL3DeNKFHlXlyL8m4Q2qdUobFbji9GsQ97
 4fAOrCg2yKSQexnfikmhWwxV/j9V3PFEQXIBbgfXmisPEvL0YJ4BPZGyz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15884251"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="15884251"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 22:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="35679287"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by fmviesa002.fm.intel.com with ESMTP; 14 Mar 2024 22:05:24 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 0/2] tests/intel/xe_exec_compute_mode: Test to
Date: Fri, 15 Mar 2024 10:34:36 +0530
Message-Id: <20240315050438.21245-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test to validate LR mode flag by submitting workload for
30's.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (2):
  lib/xe/xe_spin: Add support to store/write ctx time stamps
  tests/intel/xe_exec_compute_mode: Test to validate LR mode

 lib/xe/xe_spin.c                   | 12 +++++
 lib/xe/xe_spin.h                   |  2 +
 tests/intel/xe_exec_compute_mode.c | 76 ++++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+)

-- 
2.39.1

