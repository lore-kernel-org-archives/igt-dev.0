Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8EEC54E66
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 05:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E5710F2D5;
	Fri, 15 Mar 2024 05:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uyhq0VNG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC3310E08C
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 05:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710479185; x=1742015185;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fQWYQp/NWa8U1oJA242qWTxjkieq8KSxEQtuty8RyuI=;
 b=Uyhq0VNGlTipSkESM5vZfXmXWdDVy1ylWX3tap5omzLoS733SPCPmq9E
 chXc1PNeiNaHsQcRhEduXvAW8OyvA5SDtVNAlKgRNIg14kXxga6dU7/0q
 4LblM+5G5bO+fL73oEeu5L94qzg/Wgb8pgUcg15kPfcBUjS5n0FijGtJW
 aLHZcERwHxWVoDFPe71cyu62rvAj77d9jUonxJGoQxU6oCw0g8hcCyLcK
 05Y5z+2H4k0VRpPpTwEbaA3EiGRmV9GUtt6Kh6gpxLZOokqUt5TbPQtlP
 TxPDZxxjty03uxPgo/UcttzHVoE+hKvpC8/8Y6mqXnylz8N1yO2mldQCw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16788379"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="16788379"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 22:06:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12582860"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa009.jf.intel.com with ESMTP; 14 Mar 2024 22:06:23 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 0/2] tests/intel/xe_pm: Tests to validate vm-bind
Date: Fri, 15 Mar 2024 10:35:34 +0530
Message-Id: <20240315050536.21319-1-sai.gowtham.ch@intel.com>
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

Test validates different vm bind operations with suspend and
resume.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (2):
  tests/intel/xe_pm: Test to validate vm bind functionality with suspend
    and resume
  tests/intel/xe_pm: Test to validate vm unbind all flag with suspend
    and resume

 tests/intel/xe_pm.c | 140 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 121 insertions(+), 19 deletions(-)

-- 
2.39.1

