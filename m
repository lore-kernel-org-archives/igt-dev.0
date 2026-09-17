Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF7AC88E72
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 17:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C9510ED85;
	Thu, 17 Sep 2026 17:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fV9TVaJC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A5510F002
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789664738; x=1821200738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5Kp9CPPncm5wS/N3hUqMkwofG8A6uU/S+Zjb0Ht9+cI=;
 b=fV9TVaJCFtfKotKA+Lgbl/HZHIxXlhueQN8xF6Xl9HEaz6grG+EjcdDM
 p04jri+1iG2Y2ODFrEmDTza/7EQbqNNlFC0/70mj1AtE9vBNer87ENZxx
 JJKq0nsaLm0OP1S7hzcV0AlZZzhqpeuDDnDWZ5FtfgHwriuhUu96SnR1h
 N3A6GJCwgLbhepEqK8JBqXxecpPT/EgnSxEvC6ka6432IO5ajJRd48XUm
 Xgf/mYrD+mBNnhTkZhjFKbB0J4etUD5bQLJe0snWGhfEYeiDXILrE9Gud
 Xx2xBziTWR2xrWhe5Jyv5VN00PlBIesi0UcHtKb6ysTgOwunw5H3UxCO+ Q==;
X-CSE-ConnectionGUID: xVUshNG+R/irZFqeZqbl+A==
X-CSE-MsgGUID: mrK71AQkTESf1v6aFBykyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101457509"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101457509"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 10:05:38 -0700
X-CSE-ConnectionGUID: ZbTc6HRlT/SatIhtY8xLQQ==
X-CSE-MsgGUID: h2h0x/+lTJCMxWHzlBJJQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275857546"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.74])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 10:05:36 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v4 0/1] lib/igt_core: Make build reproducible
Date: Thu, 17 Sep 2026 19:05:31 +0200
Message-ID: <20260917170532.107916-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

  Remove build/data path from libigt.so.0 as this breaks
reproducibility, according to https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/190

Before this patch:

strings build/lib/libigt.so.0 | grep build/data
/home/user/igt/build/data

After applying this, it was not found.

v2: changed subject of patch, as I will not verified reproducibility,
  only addresed a build data path present in lib (Kamil)
  reworded description, added second HAX patch for testing (Kamil)

v3: reworded subject and description (Kamil)

v4: removed last HAX patch (Kamil)

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>


Kamil Konieczny (1):
  lib/igt_core: Create new way for finding PNG data files

 lib/igt_core.c  | 63 ++++++++++++++++++++++++++++++++++++-------------
 lib/igt_core.h  |  3 +--
 lib/meson.build |  1 -
 3 files changed, 47 insertions(+), 20 deletions(-)

-- 
2.55.0

