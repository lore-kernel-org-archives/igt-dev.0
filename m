Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5345CCE7AB8
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 07:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A2110E17F;
	Fri,  6 Sep 2024 07:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RaDCDwqk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874EB10E116
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725607978; x=1757143978;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KGOje3YJfCJOjdB91VxRM7iMbh4RgQyO8a0Ndx2K8e8=;
 b=RaDCDwqkwMvOMy3mDnxcdCoCSss65M/L4NdpD7fPhoKiuViBgd81QU59
 oENAZM54LpYFobrXQ9wSErOsgwoTsqMXYfKl8btV56V3jQyhTmgmS6M5E
 5Q4p8mvK3QoU4xDFLyjZhfTRSK1cfUMLM9kuaw9FlotBInOAS4v0QPWVc
 whp3EIRxhnrMIVowXFF5zSYt9Td3xKflIRpyTfnXkPYRIifdduDusIrXG
 469QaWIy8ytdzi1qMjBc+7n47A39EWm8flyzwZQ6Kzzds3+JQfL3qKLwq
 14CB9sGWDRE9cuiPJIRtiJH6s3lU0b96ACbZZZZF5vPawOIT25TV6OyaO A==;
X-CSE-ConnectionGUID: WxggTkx1Shq8tPgZmx/enQ==
X-CSE-MsgGUID: a1cl152JTSq9qrGqI2f8Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="23864910"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="23864910"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 00:32:20 -0700
X-CSE-ConnectionGUID: OjJ+F3bjTDyD4lWm5mu4BA==
X-CSE-MsgGUID: myhdVMk0SpOrwWR1KM+cOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="65528144"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 00:32:19 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t 0/1] validate async flips during suspend resume
Date: Fri,  6 Sep 2024 12:58:23 +0530
Message-Id: <20240906072824.509607-1-santhosh.reddy.guddati@intel.com>
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

*** BLURB HERE ***

Santhosh Reddy Guddati (1):
  tests/kms_async_flips: add async flips suspend resume tests

 tests/kms_async_flips.c | 53 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

-- 
2.34.1

