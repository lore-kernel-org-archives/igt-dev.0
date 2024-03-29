Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F719CD1288
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 04:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380CD10EAA4;
	Fri, 29 Mar 2024 04:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IddxT4Qa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2691210EAA4
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 04:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711686727; x=1743222727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ja//E89G0soN7upqSuq15CxeqQD8cooRSEI+4DhYkcw=;
 b=IddxT4QaPZnXT6v/rCLIXpR6KXf/aJLzHv6o17UqWevDjg7CvgY0jlh7
 uSLSBU8GxZ55s8wkJCUD7+E4roX9n5+sCa9tiL+JLGRRRCnLmWIg2sNUX
 +0dFhsX/eUZiISxEuERoP4hQnqrcaiVrpbDJFS/mQsJ9ZSQaNGXsB6z0X
 f+IKN0cSehLxJF5lOc3pV4HAPDf9dJNMwlcHQ5l/FQe/z8HRsBj6WizrV
 gnV1gP9ZKbqnbNyPspcEirjrGlO0zVLuaLDbR0Pw3OWsWineNGQ16oW7s
 uhgCz00CZBbzIYot/IWTDsmuYOo2dgiFRRYa3dK/O+18c0Ozm5jZUBxv2 w==;
X-CSE-ConnectionGUID: NcclVfOATNe/ZhmtgUsL2Q==
X-CSE-MsgGUID: tHJEf3UpS/S35/92HJsXOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17501425"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17501425"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 21:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16829099"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 21:32:05 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com, Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v2 0/2] Update compression in config based on platform
Date: Fri, 29 Mar 2024 09:30:11 -0700
Message-Id: <cover.1711729399.git.akshata.jahagirdar@intel.com>
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

In Xe2+ platforms, we need to run the xe_ccs test regardless of the status of
flat-ccs.
Check if the platform supports compression and has flat ccs enabled, before
the execution if this test, and if it doesn't, then update to compression
disabled and proceed with the test.

Akshata Jahagirdar (2):
  lib/intel_blt: Add helper function to ensure platform supports
    compression
  tests/xe_ccs: Update compression in config based on platform

 lib/intel_blt.c      | 14 ++++++++++++++
 lib/intel_blt.h      |  1 +
 tests/intel/xe_ccs.c | 26 ++++++++++++++++++++++++--
 3 files changed, 39 insertions(+), 2 deletions(-)

-- 
2.34.1

