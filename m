Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F973C7115D
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 08:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B4610E0F6;
	Mon, 23 Jun 2025 08:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbHQsnjo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E356110E0F6
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 08:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750665920; x=1782201920;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wCxXiTIk08xMCgpw1f6dkVpx96IkLsCI7POiq6t0XE4=;
 b=hbHQsnjoO/DWyVbxbj8HnpfFvDUmcdFWcvEL+XXM0oAjZe8CznMxxvMh
 CodAc7eCw9NT6n/Mk5sJ7sDrpaMPk2icvQnBm6RuxWqEvKjeGgmPSEeY2
 f93gD3kQrbgkOulLEx0rLqc11YRictwyHcXWBC5Pe4wHUrLDWO9PW7n52
 jVkWoGVfUln4niVT/cDU9HhDIP+alpaO6vg96D4XBmvlznH8KPyXjgH/P
 A99VW8xXtyYAkk5IgN4yjQNKfEzYvs+DWskoT8BFOAlYXZ/ZYrOnIlT6d
 4GWGpLeglXdHWY02N90VEG/5oedrjaF3QyytQ3xKjvS2D4/iE6yq+49jE A==;
X-CSE-ConnectionGUID: JoRMj4lcRKWy8iMyuK+aSA==
X-CSE-MsgGUID: B97pR19QRPqiPkz7qyzhew==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="64293682"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="64293682"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 01:05:20 -0700
X-CSE-ConnectionGUID: 7Sy1tNY7QnOKWjNxDQTrdA==
X-CSE-MsgGUID: zium1gdlS/+Fb24kcAovzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="175131776"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 01:05:18 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] Revert "tests/intel-ci: Blocklist unsupported Xe
 scaling tests"
Date: Mon, 23 Jun 2025 13:35:14 +0530
Message-ID: <20250623080515.130665-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

This reverts a previous change that caused unexpected failures
in the adlp/dg2 xe test runs. These tests are expected to pass,
and the patch introduced regressions that need to be addressed
separately.

This reverts commit a0d787e069ce10aa444c54b7d1ffdf5894826c68.
---
 tests/intel-ci/xe.blocklist.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index dcdce8b20..ebe1ff006 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -82,8 +82,6 @@ igt@kms_pm_rpm@cursor.*
 ##################################################################
 igt@kms_atomic@plane-primary-overlay-mutable-zpos
 igt@kms_plane_scaling@.*downscale-factor-0-25.*
-igt@kms_plane_scaling@planes-downscale-factor-(0-25|0-5|0-75)
-igt@kms_plane_scaling@planes-upscale-.*downscale-.*
 igt@kms_prime@.*
 igt@kms_scaling_modes@scaling-mode-none
 igt@kms_writeback@writeback.*
-- 
2.43.0

