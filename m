Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DE3C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 16:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB38710E815;
	Wed, 21 Feb 2024 16:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1ki3yrs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824CD10E815
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 16:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708532548; x=1740068548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v9hwirFd3orRBWyctYW5UfpwD/KAGzZHnncCvkWilIw=;
 b=O1ki3yrs2zJpPZe6t6AyHf1SrDa45b7ZRhMKRUvCk8PtBzdrb/2x/HTX
 FyFgstOB7fl6DhuXaQW7IKozuGlRcPHLX8Fq3muasDDvrbtr+hAQ5IBuP
 JI/It0BNvXAzdqlUxLR+x2+orsEqYAeprjJdTPmYoANZEnmq+96K4mxn5
 QbtNUg/L6g8uWpi2KePPIrCKRXX79MBJfCdXTbFCXQJRIdismGq9ahL+q
 jQUbaoxa/oTFTg2ujjN06XWXpNyCuJt37Hm/ESwybKdF1a0WY+MVaKjYJ
 5OENcxtY+l1CpwJqJk6ryJ7ESJE2ODYB6rCjKTRUTXCuyvhF4mVJfpz6j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="6531402"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="6531402"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 08:22:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="827374017"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="827374017"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orsmga001-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 08:22:14 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC][PATCH i-g-t 0/3] Add new test to validate adaptive sharpness
 filter
Date: Wed, 21 Feb 2024 21:53:54 +0530
Message-Id: <20240221162357.394355-1-swati2.sharma@intel.com>
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

Swati Sharma (3):
  lib/igt_kms: Add sharpness strength property
  tests: Add 2160p image
  tests/kms_sharpness_filter: Add new test

 lib/igt_kms.c                |   4 +
 lib/igt_kms.h                |   1 +
 tests/2160p.png              | Bin 0 -> 13426944 bytes
 tests/kms_sharpness_filter.c | 666 +++++++++++++++++++++++++++++++++++
 tests/meson.build            |   1 +
 5 files changed, 672 insertions(+)
 create mode 100644 tests/2160p.png
 create mode 100644 tests/kms_sharpness_filter.c

-- 
2.25.1

