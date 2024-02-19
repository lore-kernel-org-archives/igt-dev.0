Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ED3C48BC3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 16:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2E510E3A3;
	Mon, 19 Feb 2024 16:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZnVrkYW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD4910E3A3
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 16:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708359841; x=1739895841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ul6Bdiqyn71LfPDeyrarE+EPn4MLox2gBttc05xnioM=;
 b=GZnVrkYWPH51yA8uRWcGZJ3hqNv2W8qB+fLTa/Z6/o3TssU48GzYqSwV
 3VejssdXX/hiaKiC2CKmWUmuMNoHQAxLAzuRgsG8iVLrcnGdgx5bTz3hr
 BR1fYk0MLCmqxkmHaOkzqQPP5lFQ24uzqzxbvNkWR8yfRqXAN3cy51jA4
 rAAk4GIOYG8TYfJFan01pwCqBVOjojKdrpX7gdXqp8VanFj8rhwKorzzS
 eQGu4P6yICgFsoHWeT0XhM6cvWEVEfIgzGHFeKigM+zsTR3p+nVy/1uRE
 vAOKvwpCGlOKtSn2WLBib7PSeWWiriuIMdwww5384yIDWYkgy4BgqjNd2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="12994792"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="12994792"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 08:24:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4439337"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 08:24:00 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/3] extend psr2_sf test for pr_sf
Date: Mon, 19 Feb 2024 22:03:30 +0530
Message-Id: <20240219163333.2339647-1-kunal1.joshi@intel.com>
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

kmd series [1] adds supports for panel replay selective fetch,
modify lib and kms_psr2_sf to extend kms_psr2_sf tests to validate
panel replay selective fetch as well.

[1] https://patchwork.freedesktop.org/patch/575163/?series=128193&rev=3

Kunal Joshi (3):
  lib/igt_psr: modify library to support multiple PSR/PR outputs
  lib/igt_psr: add support for PR selective update
  tests/intel/kms_psr2_sf: extend tests for panel replay sf

 lib/igt_psr.c                          |  90 +++++++-----
 lib/igt_psr.h                          |  14 +-
 tests/intel/kms_dirtyfb.c              |   4 +-
 tests/intel/kms_fbcon_fbt.c            |   4 +-
 tests/intel/kms_frontbuffer_tracking.c |   4 +-
 tests/intel/kms_pm_dc.c                |   6 +-
 tests/intel/kms_psr.c                  |   4 +-
 tests/intel/kms_psr2_sf.c              | 196 ++++++++++++++++++-------
 tests/intel/kms_psr2_su.c              |   2 +-
 tests/intel/kms_psr_stress_test.c      |   4 +-
 tests/kms_async_flips.c                |   4 +-
 tests/kms_cursor_legacy.c              |   4 +-
 12 files changed, 215 insertions(+), 121 deletions(-)

-- 
2.25.1

