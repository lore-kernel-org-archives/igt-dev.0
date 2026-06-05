Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025C0CD6E6B
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 07:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED1611A4DD;
	Fri,  5 Jun 2026 07:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDE5qe33";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D1911A4DC
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 07:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780643568; x=1812179568;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JBraLovTorC/GWRWO1ata05D+pLiitYFgBN6RfeYsJs=;
 b=YDE5qe33AYW54ZfyDy3V0Y4fkQNpzQ2UUaNBx/7j38iPX+gH8hVZQmcZ
 kpJfOxZslBtUau8SpZ1sNCYwMqkkAM7jhzJRVcXgG/uh84WZ10dDYNduF
 Ou2gUwXrhkffS9SOmBjre9XBQZWzcUzW7gOj1bE7Uw8GTx3FbCW9OhPKc
 2BRTijlXiUsEUlKMHAE06MtV56O6B+prh+Oc5Ez+mBLQhKrOocY4A9Jpv
 sf+q/Xm0Ej3jxlBdyW9juXJnWelXJqll9aHePgMXQbREfPOSCFXFhJraM
 HAvgZlmsqL8FGSXwrZGxwewOw0GuMtPfw2DAZQwf2pAGM8QeI/BfGMLKP Q==;
X-CSE-ConnectionGUID: U8s8ugdjQhS1jS9ze8UeWw==
X-CSE-MsgGUID: DTD5SbDtQ82MHbfDynm8dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85328298"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="85328298"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 00:12:48 -0700
X-CSE-ConnectionGUID: HHc48IW8TZqaWlammPiK2g==
X-CSE-MsgGUID: PVqqXZv6TgO0utZyPdEoIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="240318992"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa006.fm.intel.com with ESMTP; 05 Jun 2026 00:12:47 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 0/2] DC5 DPMS/PSR suspend/resume validation test
Date: Fri,  5 Jun 2026 12:32:32 +0530
Message-ID: <20260605070235.42439-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
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

This test validates dc5 dpms/psr before and after suspend/resume cycle.

Mohammed Thasleem (2):
  tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resume validation test
  tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume validation test

 tests/intel/kms_pm_dc.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

-- 
2.43.0

