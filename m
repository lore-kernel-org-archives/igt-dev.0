Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8A3C369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 10:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87188902A;
	Tue, 22 Apr 2025 10:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhvhhL7a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B35A891A3
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 10:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745319036; x=1776855036;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mAgVPcL/SUeHfOZ3+eh5u2LasFSukkpN2Pq6vo+1zK4=;
 b=YhvhhL7a78aZugi/QyN5I5ysmyLXhXBsr4N9qSRgPZh/S2GxE8TfdBGW
 OwU+iMvNaeUcSeQxbpezzV93D88uEjekpxLxtZzgLREjpx4oKjbHczUZj
 UwULgenqDhBBnKZb3cUkURhXQZ9tNaKyzOF4PSOdVhtTefR/jmoMbjL9/
 B4a1WMOLFyDJGRglLwlUy/P0DcWhG6Ak7Jen+dmw6ItwIPywLDjY9p4F4
 MZE6ShB9EGDlU7BxNgwxicT07rt4YexGSTVlPsuYaidmyQkI0I4xFhmJ7
 aJ6LiY/zxA/rqUD3ijGMOmouRzEL7gorkI7tHTEKtAuc+1j2jdCbW9kk2 g==;
X-CSE-ConnectionGUID: 3XbURgwUQBKZXPQrUNjM/g==
X-CSE-MsgGUID: hyHUA1zrQEyvhgI1veF6fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46971673"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="46971673"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:50:34 -0700
X-CSE-ConnectionGUID: 3JilNST8Qni1kmtnXPAjmQ==
X-CSE-MsgGUID: 1DIc7fqITWWZIoQ1CXgOAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="132932071"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:50:32 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 0/2] Async flips with tiled modifiers
Date: Tue, 22 Apr 2025 16:13:01 +0530
Message-Id: <20250422104303.2939858-1-santhosh.reddy.guddati@intel.com>
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

Async flips with linear modifiers combination is a corner and not practical to use,
update the existing subtests to use the tiled modifiers.

Santhosh Reddy Guddati (2):
  tests/kms_async_flips: Split subtest to handle linear buffers
    separately
  tests/kms_async_flips: Use tiling modifiers

 tests/kms_async_flips.c | 61 +++++++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 15 deletions(-)

-- 
2.34.1

