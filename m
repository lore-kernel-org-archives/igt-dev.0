Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33033C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 14:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E507810E998;
	Thu,  1 Aug 2024 14:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8vq30Wf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFFF10E998
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 14:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722523157; x=1754059157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tRUTlFRlyEHm0BMpB0X3U72/BP+8rH8yaG4MQhXr9Lc=;
 b=l8vq30Wfppcpc3j/s4nsk6SWtwLzFo11Y+rc5lJdZpCnotx83Wmd2WVe
 4dlltcQ7Ag1TlFkUcXMFSAmI8j6xuQc0x1myKiauKA46ak5fTm3PkQdh1
 JR4+tmanlvgdqwKAz+pBPa0/r7RoRZXChh+sUo/uzKqZ6PKmQqUcukuxh
 u5lUkonEIw4uhLcK54qqxir0RUmvGf9U70rTOnm8uwkTr0rSHrlp5UIuP
 jAzw5W2gO3sl43DXBUHB7uZhu1E8nnzYbotGaL5GJrqfdP0/a8Lu3fwOk
 Pjd2lYZ41eUvlI7TaTI1Db876n3/ppVJ4Fry/gFLJ3kIfM19aoFPZesD5 A==;
X-CSE-ConnectionGUID: IK0SIso6SCmhGP/XYEyCVA==
X-CSE-MsgGUID: WE2Ab8pmSZC4YYY9Kl9eAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24343785"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="24343785"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 07:39:14 -0700
X-CSE-ConnectionGUID: fAR1wf18RP2oQBy256SYDw==
X-CSE-MsgGUID: bb0HEiR9TW+cykaL1E0IoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59872824"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 07:39:12 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, jonathan.cavitt@intel.com,
 lukasz.laguna@intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH v2 i-g-t 3/3] tests/intel/xe_pm_residency: Skip test if
 'gtidle' node is missing
Date: Thu,  1 Aug 2024 16:38:48 +0200
Message-Id: <20240801143848.509164-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240801143848.509164-1-marcin.bernatowicz@linux.intel.com>
References: <20240801143848.509164-1-marcin.bernatowicz@linux.intel.com>
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

Add an igt_require check for 'gtidle' node to skip residency
tests on VF devices where this node is not present, preventing
test failure.

v2: Use "node" instead of "attribute" for more accuracy

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_pm_residency.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 51735d887..9fec3b41a 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -317,7 +317,9 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+
 		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
+		igt_require(xe_sysfs_gt_has_node(fd, 0, "gtidle"));
 	}
 
 	igt_describe("Validate GT C6 on idle");
-- 
2.31.1

