Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EE8E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 19:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CACA10E325;
	Wed, 18 Dec 2024 19:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3szxi9n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A3C10E325
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 19:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734548670; x=1766084670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=++mbZXETXyD2C1TSF+imeRCZ4K96QUoPKgsP+XffhDo=;
 b=e3szxi9ntDLmLT0zYpqkKEaCZyQb4Z5din+0g9OB/4/5aE8Z9P4gZrHU
 rVEz9J9k7jVRU8GKno8kzdncGiJ9MMlyeeTSa6D4ACzScZd54RkiwFmlh
 HCf8OGM81G9tVF6C1KggaO0Kh8xowdpKZWCtpDpnR/0g4z9pAk3pHgRh6
 fdc1tT1kDnRJHkjF5Yo3KnvWr8JWmHHDGl1zQ7bDF/Mzpg5pRXcOJlRpQ
 BkztxOcy2vWheQSd39zh/sajpwb+j08B9OIP73um6pd54tFPyLbQejgvN
 f4hVgRU3oOkEamJfld+M61ylJHG9FkUIcdqjGkuKXnZc3gn83HF1ZquMn g==;
X-CSE-ConnectionGUID: a/cIW89zT7ubOka+gCeCCA==
X-CSE-MsgGUID: jC0RW8nLTW2BwjdDI/60Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38717108"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="38717108"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 11:04:29 -0800
X-CSE-ConnectionGUID: KsY5+rYhSlelXs+AmywIGA==
X-CSE-MsgGUID: IFUIoMAxRjmew/hL4gR1Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="102946709"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 11:04:29 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 0/2] core_getversion: Add raw-cards subtest
Date: Wed, 18 Dec 2024 20:04:16 +0100
Message-ID: <20241218190418.126565-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.1
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

Currently all subtests in core_getversion could load a driver
from a known list. This prevents checks what is actually loaded
on a system just after a boot, especially when one just want to check
what drivers are in /dev/dri/ if it is present.
With this new subtest one can get that info easily:

sudo ./core_getversion --r raw-cards
Starting subtest: raw-cards
0: simpledrm v1.0 0 DRM driver for simple-framebuffer platform devices
Tested 1 drm devices
Subtest raw-cards: SUCCESS (0.004s)

sudo ./core_getversion --r all-cards
Starting subtest: all-cards
Opened device: /dev/dri/card0
0: simpledrm v1.0 0 DRM driver for simple-framebuffer platform devices
1: xe v1.1 0 Intel Xe Graphics
Subtest all-cards: SUCCESS (3.440s)

sudo ./core_getversion --r raw-cards
Starting subtest: raw-cards
0: xe v1.1 0 Intel Xe Graphics
Tested 1 drm devices
Subtest raw-cards: SUCCESS (0.020s)

sudo ./core_getversion --r all-cards
Starting subtest: all-cards
Opened device: /dev/dri/card0
0: xe v1.1 0 Intel Xe Graphics
Subtest all-cards: SUCCESS (0.060s)

Kamil Konieczny (2):
  tests/core_getversion: fix driver closing
  tests/core_getversion: Added raw-cards subtest

 tests/core_getversion.c | 45 ++++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 9 deletions(-)

-- 
2.47.1

