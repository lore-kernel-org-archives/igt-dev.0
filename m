Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63ACC36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 07:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A1510EA58;
	Fri,  4 Apr 2025 07:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Om5EEoWM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4361D10EA65
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 07:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743751448; x=1775287448;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XynethViNn9BFfrQnUtkheSDr3HXsraqwegssijbP/8=;
 b=Om5EEoWM0cwTx9uByWx1FFbkpu6al2KFKk5NiLPtS+kDevMxKAwJO3Z+
 8Co1ge9Qil9i6ck1WFHc2NyJxDSWsHdDckU6E5QGh4zk2hvOb5LWHft2h
 eWtR3JiAOHbtzEbpL4JLfyYSBQT0fjNitV1/eJO/cPlM6mON4D/FcOwd4
 fVdb3AdoWlcxOMm87UCywrHaSW4MXZHCSOyMMzvbUzUOAls3k4ZXUhd6W
 24C9/UubWjnZOmLfonM3329rSKQA1iCVpmcpvJfedbcRh6MvMp0fveaOy
 OVQAHjur255WLSFYlHsriE0VLw1zcCNlrWfYFzXDwCNA4eb3yzm+31Aa1 A==;
X-CSE-ConnectionGUID: EDL9hVfMRfGDFVXwxeI7vg==
X-CSE-MsgGUID: VJGem+RWT4i7SOQd13g9yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45359298"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="45359298"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 00:24:08 -0700
X-CSE-ConnectionGUID: cvizIFk+QQ6EShlgtgmTBg==
X-CSE-MsgGUID: Ju4NWMLhReKbsLouCylhMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="132361867"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 00:24:06 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, juhapekka.heikkila@gmail.com,
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/3] Fix ctm-limited subtest
Date: Fri,  4 Apr 2025 12:59:27 +0530
Message-Id: <20250404072930.695363-1-swati2.sharma@intel.com>
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

Fix ctm-limited subtest

Swati Sharma (3):
  lib/igt_chamelium: Add chamelium_frame_match_or_dump_frame_pair()
  lib/igt_chamelium: Fix CRC calculation in compared_frames_dump()
  tests/chamelium/kms_chamelium_color: Fix ctm-limited-range subtest

 lib/igt_chamelium.c                   | 48 ++++++++++++++-
 lib/igt_chamelium.h                   |  5 ++
 tests/chamelium/kms_chamelium_color.c | 88 +++++++++++++--------------
 3 files changed, 93 insertions(+), 48 deletions(-)

-- 
2.25.1

