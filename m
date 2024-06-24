Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8479C2BD05
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 09:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9B610E3C3;
	Mon, 24 Jun 2024 09:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bROok06i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15EC10E3C3
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719220258; x=1750756258;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c+xrHk83f/vauflNai1cMdFfVkHSHygHk2U1ug7zTDg=;
 b=bROok06i26O/DY9uoeRpJcGO+rzFUEVJ2aXfbTMrefn+rRajPPYJRGxO
 w52j0Xaey4W/Cf7GTIeG68fuvWTJ14jsmVNDAKkm6YKiTk0OMXMzO+gb2
 4EA7oke/0y2+MahFVavrP+3VGR0L06dAH9Sle+rKFys1wYmRqkFwR/uIy
 03SXqbcP9dMq0ZW6RMnFYfgK8/mg4Y/wAskAIyu98Rn97R2uMRES1ZpDK
 rEbC/eycLJnnfuPp3B//qCU/okhHL+9eMLKahxt5wKWwzu1go4QXFa9I2
 t4jV++laWiqyk50zPJ0hmk2KiT7rFntm6ZM05dLkg10NT7XD8/PPkO2qQ Q==;
X-CSE-ConnectionGUID: xRgZ6DVASOaK7p0o1lS6TQ==
X-CSE-MsgGUID: Plh9FktaQfCWDGmXBO3QJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="12209399"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="12209399"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 02:10:58 -0700
X-CSE-ConnectionGUID: BgP26uACSYWytfe194lx7g==
X-CSE-MsgGUID: OlSBZODYSd+BLO9eaNfMzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="47692134"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 02:10:57 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, kamil.konieczny@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] Early Transport Support
Date: Mon, 24 Jun 2024 14:49:41 +0530
Message-Id: <20240624091943.1583273-1-jeevan.b@intel.com>
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

Add early trasport helper and checks to validate early trasport support
on the supported display.

Jeevan B (2):
  lib/igt_psr: Added library functions for early trasport
  tests/intel/kms_psr2_sf: Add checks for early transport

 lib/igt_psr.c             | 19 +++++++++++++++++++
 lib/igt_psr.h             |  3 +++
 tests/intel/kms_psr2_sf.c | 18 +++++++++++++++++-
 3 files changed, 39 insertions(+), 1 deletion(-)

-- 
2.25.1

