Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E79C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 12:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCF610E23C;
	Thu,  3 Apr 2025 12:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YcyJo6rY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7281B10E238
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 12:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743685040; x=1775221040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1kXf70k+yPlneI7cDr9F6fn/nYaVBtD1Uax7KzE4BjI=;
 b=YcyJo6rYcetAeYiM0ejjoqzOkCQ5LnfNgzOxiiRUJrGDR8V+8nnbD4ch
 H2si3w/HCjLN5ZJsS8HUpb8wRurc4qamCE4v1tcIN2sSljg+tQ6N+4Mnw
 6H26GAWQmQrEBKwjuBa7u8ISHVEjxrSYJHHqpgdW0xvltVxPGbC2kBMzl
 WGIHBh12VBQyQFJHDpAhHtxOKRcpG/+kCWer22dXbtPAsKEi/GQf98pxT
 hce1wv7keZS22L27THvmnA2lw3ReeSpx6BbV2T38PBa3Hd9nenFvn2kGi
 ljA2n8K+H+k4E9ZhxB+CYppPgG24gXAHsmf2gaiNESYrq7jGgortMiUCq w==;
X-CSE-ConnectionGUID: OEv+VdQLTqyAWZlu+aJpLg==
X-CSE-MsgGUID: TbIeist7SqGC/KkvKOqoLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70459041"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="70459041"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 05:57:16 -0700
X-CSE-ConnectionGUID: hkg/RumDRRSdloLle1knRQ==
X-CSE-MsgGUID: yDmcMJv8Sc6GFGPO54XaZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="164231768"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 05:57:15 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/1] tests/xe_eudebug_online: Calculate bb_size from
 shader
Date: Thu,  3 Apr 2025 14:55:24 +0200
Message-Id: <20250403125525.31573-1-dominik.karol.piatkowski@intel.com>
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

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (1):
  tests/xe_eudebug_online: Calculate bb_size from shader

 tests/intel/xe_eudebug_online.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
2.34.1

