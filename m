Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6FCC54E55
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 16:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA5A112BEC;
	Tue,  5 Mar 2024 16:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEXoYT5h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FA7112BE8
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 16:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709655944; x=1741191944;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MEe9LGtkhRQVAC53ykUhmU3Xtaoi3AkN3OWgAR+sz70=;
 b=kEXoYT5hxTGqE7ZOTLewQJ60REHYbdT93Kb+FI0zcCZDfCmBPsYyI1L9
 Rg6nTMMaSNd7sEX7UlImNydY3Suox+8x4mMs9qR2m8mAUKEY0fS9VmbuW
 2RLx3dz8uK6i5uQ96GNqnk5jJ87ddYkw5ca7OgrAuPDy4iuyr4/DtHM38
 VyKSUHzthQo82iXj/VyJP8aQYSB9hAl7wWDtkEkErMjFdOOqHRkbNuSsW
 qWGkciDAeBZx0jIoJ2/3grom+rEem/l1MtEYWICUuYYJNgv2jA+5FBZ3I
 JJg6cP98QZv8BOr/Zl7/38Af0AvH3PxbF6Da698AlVp4R7i0bU2w7wm9T Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4079932"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4079932"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:25:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14010201"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 08:25:42 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/2] revamp big joiner test
Date: Tue,  5 Mar 2024 22:06:05 +0530
Message-Id: <20240305163607.688251-1-kunal1.joshi@intel.com>
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

big joiner outputs are statically assigned to pipe,
rewrite to assign dynamically

Kunal Joshi (2):
  lib/igt_kms: move bigjoiner_mode_found to lib
  tests/intel/kms_big_joiner: revamp kms_big_joiner

 lib/igt_kms.c                |  25 +++
 lib/igt_kms.h                |   2 +
 tests/intel/kms_big_joiner.c | 402 ++++++++++++++++-------------------
 3 files changed, 213 insertions(+), 216 deletions(-)

-- 
2.25.1

