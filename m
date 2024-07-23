Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759B0C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jul 2024 04:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD2610E14B;
	Tue, 23 Jul 2024 04:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqOjqra8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886EF10E14B
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jul 2024 04:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721708310; x=1753244310;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PHNyWeRfmrRM4+J58Yt+Ziq18gmUwlEMAV7iF9g97oU=;
 b=eqOjqra8yn/uLR0bESKgVMpwC8pbsfPlOZ8IXEoc8T3gmsobfZ92YX6n
 PDqigWGmnhmWpa3pDwJRKuVzet8FA/pC6kpJWUjF6TanBRHobHarttnKs
 iV+bERRvmhYikvvQvQQyG6RarA8f9mb7R3ILRRlDLT0X6wHr7T7QEbBjN
 COIjyim/EQ0PxKVZ2C+gORLzP8B82niy+upd/L2LdkPK/gbvsPwd9/nSx
 pLA/6xtu8jm63SCmDTKVBcfOl66m7ycj2Z/5z0AevzJs8MdE7yRACZC1p
 QJJIfQPLpAHXzGWUS9ZLKu34hIOqEotsBEHLztQqiSjsq4KUZaorFFTcW A==;
X-CSE-ConnectionGUID: uokwshqFSMSKNykKTjHYrg==
X-CSE-MsgGUID: NtQARQavTk2F74/vvQh/rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30696913"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="30696913"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 21:18:29 -0700
X-CSE-ConnectionGUID: PTo8VgssSbK+2AAoqc7jsg==
X-CSE-MsgGUID: lDIrwOuYRziiTX06IYR3WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="89559740"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 21:18:27 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, animesh.manna@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] New test to validate link-off between active
 regions (LOBF)
Date: Tue, 23 Jul 2024 09:58:48 +0530
Message-Id: <20240723042850.2651902-1-jeevan.b@intel.com>
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

Add debugfs entry to validate LOBF status and create a new
test to validate.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  lib/igt_kms: Added library functions for LOBF status
  tests/kms_vrr: Add new test to validate LOBF

 lib/igt_kms.c   | 23 ++++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 80 insertions(+), 2 deletions(-)

-- 
2.25.1

