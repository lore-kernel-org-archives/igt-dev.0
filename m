Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B59BC71136
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 16:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0263010E1A3;
	Tue, 17 Jun 2025 16:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMNxbKvU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AA110E1A3
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750177468; x=1781713468;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+acsCkAJFpaj5OSrQl3OuKd8YzNwrtDMVe32BlcdS+Q=;
 b=RMNxbKvUEpI4k+GdjSnDkyMPOzMUY9aYhWUPJfHT66/hD1uQhjLDhslK
 sjKzUEw+Kuk9M4bXtK8IakgQN9UibHU4jTJ+8E0zq7JhIwMDC2OYHVs7W
 jr0xpzC5pdelzspuxxcoagvGOH+xdJge6vaBDNUJAHZnfHhrJgCxim79h
 QZuaalGPo6QKcLK6mM6J1bjcbPjE4PD9BbdbB7NXydLODbSV2EP5I8v3T
 bjHo6NOeoEE0loGGyx14WmcwO8777oug4uwsVv59ctMjjbi/qVQE+Qrnt
 OtHSOpxDyIvwPMsjLeTgBwcW5c9K7WzD6nWArSNrMDnhxjs9cjvH/x2Wx w==;
X-CSE-ConnectionGUID: F+EZ4riiRoGqGaZD4Z6LiA==
X-CSE-MsgGUID: NuFRIZZTRjGFdubC+U+M8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52224042"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52224042"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 09:24:28 -0700
X-CSE-ConnectionGUID: 6c4cg4P9RFimdYU2w+PHbQ==
X-CSE-MsgGUID: TVt8pyV4RDq5jCh9kTKHZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="179821070"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 09:24:26 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, uma.shankar@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 0/2] tests/kms_flip: Improve frame timing checks for
 high refresh rates
Date: Tue, 17 Jun 2025 21:53:50 +0530
Message-ID: <20250617162353.3348190-1-ramanaidu.naladala@intel.com>
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

This patch will improve the test timing checks.

Naladala Ramanaidu (2):
  tests/kms_flip: Default to tiled modifiers for stable flips on high
    refresh panels
  tests/kms_flip: Track and report unexpected events with pass rate
    metric

 tests/kms_flip.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

-- 
2.43.0

