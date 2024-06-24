Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAF1C2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 18:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82C310E265;
	Mon, 24 Jun 2024 18:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FnGvjeVG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B3810E265
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 18:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719252407; x=1750788407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c+xrHk83f/vauflNai1cMdFfVkHSHygHk2U1ug7zTDg=;
 b=FnGvjeVGCICrgoA7vuCVWuQrdjqhOlNi5m92XWIVL6uLD0UVenjSAvjx
 kD2ciSc7XV7teYK2J8lyevVCv4cl7jJdxjym6doGSnZ6AtI4AeEtB+KqQ
 xRyIzDahk6mBGCy45rFu8VdIyEtdiMKcDSNzEa6ht1IgyXBLzZ0msWj0j
 mixh7/FHWepGexxGcqKCfxFjHom3OM+4N6QhN+K0hMtc+iUlc1mqVUJy5
 YVrbh073UdqlkIvxsV7E1cSN5lWc7pRu9Xy+ZkT5ZBpanCXLIa2fBSNGh
 Gucl0CY2hsJBVwI+LTabOjZgni+LJfbPvt3HfbsRjyI/ClV346BFvqQJ/ w==;
X-CSE-ConnectionGUID: 1AYo44+dQoyOEyfJUYfigw==
X-CSE-MsgGUID: QNsvkvftRjGGZvKsNsm5sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="15930171"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="15930171"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 11:06:46 -0700
X-CSE-ConnectionGUID: x8Xr/oMMR4O+vU7E4rGSeQ==
X-CSE-MsgGUID: d7DJqzHaRe+wsvYuCG32Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="80919388"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 11:06:45 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, kamil.konieczny@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] Early Transport Support
Date: Mon, 24 Jun 2024 23:45:31 +0530
Message-Id: <20240624181533.1600552-1-jeevan.b@intel.com>
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

Add early trasport helper and checks to validate early trasport support
on the supported display.

Jeevan B (2):
  lib/igt_psr: Added library functions for early trasport
  tests/intel/kms_psr2_sf: Add checks for early transport

 lib/igt_psr.c             | 19 +++++++++++++++++++
 lib/igt_psr.h             |  3 +++
 tests/intel/kms_psr2_sf.c | 18 +++++++++++++++++-
 3 files changed, 39 insertions(+), 1 deletion(-)

-- 
2.25.1

