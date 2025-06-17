Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE79C71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 06:45:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C7A10E387;
	Tue, 17 Jun 2025 06:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9NJzXsS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6182E10E387
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 06:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750142725; x=1781678725;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5PUb2GsXC5s0De+CV2/Xc6BaAy4uQo/QQtfVoOaLiUQ=;
 b=W9NJzXsSzN79VEbmWpUqUVV0EYhA826RwpsAEFax1fhOIdAqjSlrRKyQ
 pTNUArwmrRD5BZ/lKin9auQHQuvhz4QR972BlGp80i72xLthHY9j6c1ja
 babeVu1M4ctH7n7N05Ha0N7sUztoJqtlFs555EamRCtUIpXAxjwpKqvtp
 3hBlskjJD+QCtg+Zu3jxBUtuimvyJJor1GvQQ6ucHj34/9cfXPcntjo6E
 j9ct47F9TYmiRmKrzsd5USKiDyPSLlccShsVLOU8/JEsL2EjpoEygX+ND
 tt+qIzMy63TZyFPBIQktlA0Ao0fJzg367uzB8ylQWi3t3mdgKB3Y5VbOc w==;
X-CSE-ConnectionGUID: 8NKBi8kQTjCrxz176LqoWQ==
X-CSE-MsgGUID: DShvGhUYTfOXzz+1nR8AWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63335538"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="63335538"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 23:45:25 -0700
X-CSE-ConnectionGUID: D24pFo2MRsqJZl5G1fNoAQ==
X-CSE-MsgGUID: 9Uk4wGIfRy+jM53uYSje0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="149578111"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 23:45:23 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v9,
 0/3] tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency
Date: Tue, 17 Jun 2025 12:14:57 +0530
Message-ID: <20250617064456.3041238-5-sk.anirban@intel.com>
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

Leverage IGT spinner to trigger frequency scaling and
set RPS minimum frequency to RP0 for achieving peak frequency.
This method replaces the existing waitboost mechanism used
to reach maximum frequency.
Restrict the power consumption test to GT0 alone, since we're
evaluating the power usage for the entire GPU at once.

v4: Cosmetic changes (Riana)
v6: Fix frequency restoration (Riana)
v7: Fix variable scope (Riana)
v8: Fix signal handler (Kamil)

Sk Anirban (3):
  HAX: Add rc6-idle tests to fast feedback list
  tests/intel/pm_rc6_residency: Use sysfs to achieve peak frequency
  tests/intel/pm_rc6_residency: Ensure that SLPC is enabled for test
    rc6-idle

 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/intel/i915_pm_rc6_residency.c   | 119 +++++++++++++++++---------
 2 files changed, 81 insertions(+), 39 deletions(-)

-- 
2.43.0

