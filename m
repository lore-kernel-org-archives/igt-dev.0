Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EB1C54798
	for <igt-dev@archiver.kernel.org>; Fri, 23 Feb 2024 04:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE578908B;
	Fri, 23 Feb 2024 04:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIdBrt7l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5191F10E09C
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2024 04:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708663710; x=1740199710;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wI9hKaHeM0wBZGKSUOTi5M4hX6uuxEmQE2NdQeer7ow=;
 b=jIdBrt7lc6pnzJruLWTFCxLEj7lD6lYlKOEbuX2xvu+vRe8nQVIZ0pqg
 iiBc0FSZZYbj7BhoXIYo3v02bTMOzpKX4ZcLsmQg9GNz2fS/k4nGHu5+9
 4My8sbse4XIi2wW4nodE9H2UC9Gifq0A+z2Uyf20+sDcjOci6NBu4mTKP
 B4Sap/zs4L5poYB/o+2fqvPC/s1QotKOdklygTy1/vjuxw8M0ZKL4usaJ
 RK92MZSeb6X+hFOdPLF0eS8s6YFbg3PzMy7BjjmTIF+UfYEfKSKGDVyxi
 7Y+XBxnnsHsA0XZbNQ5027EW8lX+p5UvdhCr8im1HLpQXFFi7sZVAFE+f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="25436414"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="25436414"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 20:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6165117"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 20:48:28 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC][PATCH i-g-t 0/2] Add new test to validate adaptive sharpness
 filter
Date: Fri, 23 Feb 2024 10:20:11 +0530
Message-Id: <20240223045013.398654-1-swati2.sharma@intel.com>
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

New test is added to validate adaptive sharpness filter on
LNL platform. Pipe scaler is repurposed to perform a portion
of this work. This means pipe scaling will be unavailable while
the sharpening function is being used. The other scaler can be
used for plane scaler.

This RFC is an attempt to validate adaptive sharpness solution
which helps in improving the image quality. For this new CRTC
property is added. The user can set this property with desired
sharpness strength value with 0-255. A value of 1 representing
minimum sharpening strength and 255 representing maximum
sharpness strength. A strength value of 0 means no sharpening or
sharpening feature disabled.

KMD: https://patchwork.freedesktop.org/series/129889/

Swati Sharma (2):
  lib/igt_kms: Add sharpness strength property
  tests/kms_sharpness_filter: Add new test

 lib/igt_kms.c                      |   4 +
 lib/igt_kms.h                      |   1 +
 tests/intel/kms_sharpness_filter.c | 666 +++++++++++++++++++++++++++++
 tests/meson.build                  |   1 +
 4 files changed, 672 insertions(+)
 create mode 100644 tests/intel/kms_sharpness_filter.c

-- 
2.25.1

