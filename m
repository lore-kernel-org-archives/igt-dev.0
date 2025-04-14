Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ED8C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 10:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC9510E53D;
	Mon, 14 Apr 2025 10:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDACEcjG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D07D10E53D
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 10:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744625856; x=1776161856;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z83wEjo9PBoAibUuCTVhLm2waYji975k+hxILBWn/vc=;
 b=PDACEcjG9HKjQFFdcqQUbw4GZDerzCPZ7y2ceYsDj3DeqowO6JqFROmv
 3Va6SaOrGj/QkaP+0+lxsdWnY9LBt5I+4vMguvjBAOS9p67UffvqYM6b4
 OUVj2UnyYi0N9IrOcVsevM3P7yMV5qph2gWl+F7KaeGiqMzjGTMrR84Ye
 ki48nh4F7H3WiTg8UnsfbD8DGAHZoeDHtFs2ubHS9WbM1LQwGQ6Gmi4rK
 3+HQyLBJQ6xswsVdi1JkeOcvznnWO+s5haN83KrvAEBfCkme9oIegOz0K
 lAmK2aVeRMTYWl38aRa2LPg3wDeuXxjf78goJWXaNumkp3k+XjIvzDh1e Q==;
X-CSE-ConnectionGUID: jAMeCz+hTcWSIyMajubCVQ==
X-CSE-MsgGUID: YmwMTrPlTneENkdY67LjDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45999977"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="45999977"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:17:36 -0700
X-CSE-ConnectionGUID: 3GPjV1F7T7Wvp7j5Blyb8A==
X-CSE-MsgGUID: OG/6+JvjQOq5yr1UAGxWIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134534126"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.186])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:17:34 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 0/1] tests/xe_eudebug_online: Calculate bb_size from
 shader
Date: Mon, 14 Apr 2025 12:17:13 +0200
Message-Id: <20250414101714.18581-1-dominik.karol.piatkowski@intel.com>
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

Right now, bb_size is retrieved from get_bb_size, which returns one of
two hardcoded values. This approach will fail, if shader turns out to be
big enough to not fit into bb. Fix it by always calculating bb_size from
shader.

v2: Improve bb size calculation (Zbigniew)

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (1):
  tests/xe_eudebug_online: Calculate bb_size from shader

 tests/intel/xe_eudebug_online.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
2.34.1

