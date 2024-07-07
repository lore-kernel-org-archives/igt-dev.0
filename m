Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB106C30653
	for <igt-dev@archiver.kernel.org>; Sun,  7 Jul 2024 15:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB4410E14A;
	Sun,  7 Jul 2024 15:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTPzkMgU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093AE10E14A
 for <igt-dev@lists.freedesktop.org>; Sun,  7 Jul 2024 15:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720364690; x=1751900690;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p8uNBkIjDGtpBfnmqkGtbMnGy8tJCSVSSdubbCkKJSQ=;
 b=lTPzkMgUvPvQzL2ECgslKsrn6Fgtfe1r+Zh+4zrlYdKnROcCVe07PrKD
 wJZU4gGlUM5IhjbasSKeXwbgMk9auGZtO5wpIaE7TsZiZFTR5df8AtJt8
 eXi8oDhuGIi2V98NyJFmGlQzKfUWUeP0RXsyOWfIKW66+lmbcP4FMEv5U
 NC8JsgEjhrEXURNPoyjJL0WhddX8081p7HpEoo6cGwo5pob0Maz1jEK8X
 mUG+D2ApQeNQkiAST7UbTrZCeIeFKCA0uRyxkGYtJuUe7yhvHwMo4SF/z
 /mpp+B0lDBUa6JqCKcxPNY6D7zBj9yVn+94yPL+8+h0lv/oTVBKA55Yim A==;
X-CSE-ConnectionGUID: 7+dAH42aR4y/C1FTEIzj3w==
X-CSE-MsgGUID: RlZt78eeTrmTPkcS0bB6Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17703806"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; d="scan'208";a="17703806"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 08:04:49 -0700
X-CSE-ConnectionGUID: TVkZ1JjuQdKb4j5uo4/6Dw==
X-CSE-MsgGUID: zr77WwR5R/qTdpLOIiaYAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; d="scan'208";a="84817554"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 07 Jul 2024 08:04:47 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 0/2] Runtime alteration of debuglog level
Date: Sun,  7 Jul 2024 20:34:55 +0530
Message-Id: <20240707150457.715471-1-pranay.samala@intel.com>
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

In certain scenarios, tests may fail due to insufficient disk space, 
even though they fulfill all requirements.

To resolve this issue, adjust the debug log level before initiating 
the test. Rather than manually editing the debug log level each time, 
aim to dynamically adjust it.

This approach involves modifying the log level within the test using 
the debugfs entry, with an exit handler ensuring default settings are 
restored after testing.

Pranay Samala (2):
  lib/igt_sysfs: Implement dynamic adjustment of debug log level
  tests/kms_atomic_transition: Reducing debug loglevel dynamically

 lib/igt_sysfs.c               | 45 +++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h               |  3 +++
 tests/kms_atomic_transition.c |  4 ++++
 3 files changed, 52 insertions(+)

-- 
2.34.1

