Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B47CC021BE
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 04:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1658E10EA26;
	Thu, 27 Feb 2025 04:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ju6n60WC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7B710EA10
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 04:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740629974; x=1772165974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vKtZogpzwa5YJyKN6UdTOvhYHU2RKkj5qFD9Xy9vNi4=;
 b=ju6n60WCsPJ3QT9vBS8zNe6E4E6QmFwUQUROMN0I6zLEYtrD45ETK0Ri
 qg5fTYv/mnqxhftDK5YR0Jyw+JHonEE5TlZunzY7JG4sTjlJWhcYt+Qem
 UymnciwxWLvCp2mblb+8/ghwdCa+xVEbJF9zVUEtM/vM9Kp5S/muB1JiD
 Iy7Ueunbl+HSZfNJzJglp4XxyDDJHFKHO69HCCyEwNXhC7MEMORkvwUu6
 mry28t2Bhv20TguPTiYlHWajGiQGlOSRHIpfP3GO4wKMcijH8CHUUVoCz
 Pe/86H2d4MBQ5BxM9K+kuAtYkX0sjUnBbG9mRWe/vYJl7a1Sb7q2TiN54 w==;
X-CSE-ConnectionGUID: 34gORxbASfKr+dcw0aJZiA==
X-CSE-MsgGUID: K0WVKmoSSeyaEJCKwz/OHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44331555"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="44331555"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 20:19:34 -0800
X-CSE-ConnectionGUID: ufSI9VVCQWmotsN+awbebg==
X-CSE-MsgGUID: bKnm7fPbT6yoKLWiBwP3pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117396407"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 20:19:33 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 0/2] Support for IN_FORMATS_ASYNC plane property
Date: Thu, 27 Feb 2025 09:45:43 +0530
Message-Id: <20250227041545.2465720-1-santhosh.reddy.guddati@intel.com>
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

Use IN_FORMATS_ASYNC property to get list of async modifiers
and improve async flips test to add coverage for the supported modifiers
and formats

Santhosh Reddy Guddati (2):
  lib/igt_kms: Add support to retrieve async modifiers and formats
  tests/kms_async_flips: Use 'IN_FORMATS_ASYNC' property

 lib/igt_kms.c           | 57 ++++++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h           | 17 +++++++++++-
 tests/kms_async_flips.c | 26 +++++++++++--------
 3 files changed, 87 insertions(+), 13 deletions(-)

-- 
2.34.1

