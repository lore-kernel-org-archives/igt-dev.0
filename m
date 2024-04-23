Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB63CC07E8E
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 03:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520EC10FA0A;
	Tue, 23 Apr 2024 03:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HDYxkGI8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D3710FA0A
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 03:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713843557; x=1745379557;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i8+qnlrDbHogQxuPa5rJxAiEx0ZaRqvBPOoEo/8mavg=;
 b=HDYxkGI8C/78eui3RKIdKUPWsi5IjMtsXD7v/YKSEheWwipB9S6kcvai
 Zcx9pCWS3/Eyd12sskYvO+cN6WxE73FGWUw9zJiIlLPJ32iengxW91MRt
 Ly5vM+4OROVPQftR0tqE9nhzVYUfBlDwonYLqnWSl8eRkVAqeCWFLx0KY
 VI55Z14eIgxNREcMWBZik8sdLp1eOCYaPTCe8HbCkviH201TResdJJ8Es
 SxEgbW3wuPLtyJJZY6dYJJzArj6R1kqrd132k2KLGyO8SkTgknkMsBhqo
 2e1Lz0Mmkx2pyUjJ053BY38lMDzRqF4CzhG1D47bznLNyLP1T9X5+w5Co A==;
X-CSE-ConnectionGUID: gD2+bZndQUO1mYvu59R5IA==
X-CSE-MsgGUID: 9ZkrgOjUTMCjOiAIx1iJvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="26925170"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="26925170"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 20:39:16 -0700
X-CSE-ConnectionGUID: YbhKFyCUQdyrIz068sot6A==
X-CSE-MsgGUID: yp/2G9ACRDCY7aAV4k1OcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24241509"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 20:39:17 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: zbigniew.kempczynski@intel.com
Cc: igt-dev@lists.freedesktop.org,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v6 0/2] Update compression check based on platform
Date: Tue, 23 Apr 2024 08:36:59 -0700
Message-ID: <cover.1713584014.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
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
Message-ID: <20240423153659.OdwzwkJasRx0f7Z3XJDioFSDeKY-wLG00b_c-rgMwkk@z>

In Xe2+ platforms, we need to run the xe_ccs test regardless of the status of
flat-ccs.
Check if the platform supports compression and has flat ccs enabled,
and if it doesn't, then update the check on compression
and proceed with the test.

Akshata Jahagirdar (2):
  lib/intel_blt: Add helper function to ensure platform has  flat-ccs
    enabled
  tests/xe_ccs: Update compression check based on flat-ccs  enablement

 lib/intel_blt.c      | 14 ++++++++++++++
 lib/intel_blt.h      |  1 +
 tests/intel/xe_ccs.c | 40 +++++++++++++++++++++++++++++++++-------
 3 files changed, 48 insertions(+), 7 deletions(-)

-- 
2.34.1

