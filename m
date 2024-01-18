Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271EDC4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 10:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAED610E761;
	Thu, 18 Jan 2024 10:36:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB0B10E761
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 10:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705574207; x=1737110207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Wptuz7/4FXfvy+ToglEnhSAWHlq/8ULEVEllMq1m94=;
 b=LU6Xb+5g/vt7SC0Lo/IjHcPWmtEe4z2vpphQIyAQK9/7m3q66zRHZyCW
 tO1Ts2oTOLub8r+x0Dyzc0TYUxg44AsuXAwrQe5lkucL6lnzLZLdvNcUr
 2pt2fg7hAPod7ypjGsgzTrSDJ/wAqE6CLwKIGJ1q2IFID/KFSHpSm6diW
 /WDw51pBTxSd30fz6iYONWluw3DdI4KU7qqk0y4iSKvMTDjfp8ReJqSzd
 FTsvpHY441SCFCnaAaZvKrJ5+23FiDX0GywxHCztMEadSzIhpPASW54hV
 ScBV73jMMz+HCPTRVkb3SXClNydxFiRQbb0oXP9R9iR0RTRS2h5LrWRSl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13760994"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="13760994"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 02:36:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="369779"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 02:36:45 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] add support for choosing big joiner mode
Date: Thu, 18 Jan 2024 16:16:14 +0530
Message-Id: <20240118104616.988247-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

add support to choose big joiner mode with environment
variable, use default mode if no mode with big joiner
found.

Kunal Joshi (2):
  lib/igt_kms: move bigjoiner_mode_found to lib.
  lib/igt_kms: add support for choosing big joiner mode

 lib/igt_kms.c                | 38 +++++++++++++++++++++++++++++++++---
 lib/igt_kms.h                |  2 ++
 tests/intel/kms_big_joiner.c | 14 +------------
 3 files changed, 38 insertions(+), 16 deletions(-)

-- 
2.25.1

