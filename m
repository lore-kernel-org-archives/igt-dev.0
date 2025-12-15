Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC74D5B874
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 22:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45EA10E548;
	Mon, 15 Dec 2025 22:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNQLvbty";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5CC10E548
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 22:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765838207; x=1797374207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z7+vOuguKAq8c9CRFtJHZ8oxxt1Mu+E33DCsHmS3D9k=;
 b=XNQLvbtyF9IpT9goEvCjHDvG6xJ74vo/RuQZUYPccV8fLjFifHUuiEcy
 uyAU3FrJAxbiuhaIQen5X8O6DSIhppEmMXu9V51XYVNuGqpzmIZp7OPQt
 FM/lIW+7WzbLsXLrF2b6sn6LWEGsHGOm8h8sUbIQvYbJ+vCe9HeqwP4bs
 5K5rqUZiBRwTVjQiMu0t+pooeP1tqHRbAKrvTtr1o5FdNT8AMxtSYjC46
 g25vKgcJGEmWtarzS1ifNRhFIL5h0sHX/hupJLNIZsGzQXei1joSircqe
 BdxLSmFXN0EGXIHlkxhlusbqXVQM5sfO+K8c9ItcD0878lpHTLf/UC/zF w==;
X-CSE-ConnectionGUID: IMfTa/PxRz+NC2zICgRwkg==
X-CSE-MsgGUID: QHjlHPJFR6SCRgSOYziYDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78389414"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="78389414"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:36:42 -0800
X-CSE-ConnectionGUID: 37msliuCRs+q5bUfwP2J7Q==
X-CSE-MsgGUID: BADWDkzEQTO3drHIQBAzgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197740265"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.94])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:36:41 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v1 0/4] Various fixes for prime_udl test
Date: Mon, 15 Dec 2025 23:36:35 +0100
Message-ID: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

Refactor this test into proper opening fixup, then tests and
last closing fixup. Also fix few error checks and make sure
opened device is handled by i915 driver as there are now also
one handled by Xe.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Kamil Konieczny (4):
  tests/prime_udl: Fix opening
  tests/prime_udl: Create subtests
  tests/prime_udl: Fix error handling
  tests/prime_udl: Fix i915 device opening

 tests/prime_udl.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

-- 
2.52.0

