Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB883CD6E60
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 16:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C0210F2D4;
	Tue,  2 Jun 2026 16:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nw0ZQCn7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980C910F2D4
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 16:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780416172; x=1811952172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AGn7Kvq/X3GwRLKvpju+yCdlfOpqxBFnTIDzpNzNRro=;
 b=Nw0ZQCn7gLCANN1ZoCtvZO3P77wh5v3Ye0orelqboNWCEZsRa14JFppx
 vIrZNTkENI+D0KK7skyerem7MWP4bAttUKWKYYc8QgrRaC4NUUkxGPgpe
 P8rfzIRMYO+DVXgAWFJULMG4BsHHuTtmSL074BXvipMMyhLjYlkWFig8W
 inT9rf1KLPFBmJr5Vezu56XKDrSrQ6z4wCo29h013KCaU4xat41hXGbWZ
 /vJfQ5IqvvT8DxSx88u/fQLdjdxPgGVL0jI7hqQUpB+/mqDj37gH/JlC6
 sNN8RAoJf8+FM7hjtC0LlR8rc3+2GM5uSRKuL0wLUC0YQwQsuljgRmehD g==;
X-CSE-ConnectionGUID: sKJsniulTv+j6mb3X8gnag==
X-CSE-MsgGUID: fxXyBMJITHyR7w9VEa/UFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80943546"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="80943546"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 09:02:48 -0700
X-CSE-ConnectionGUID: jTUCcLURR82OTBVQiHfRsw==
X-CSE-MsgGUID: mvfQOSNUQrOtEirRx/ukxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="244052573"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 09:02:47 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, chaitanya.kumar.borah@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 0/3] tests/intel/kms_pipe_stress: fix plane setup and
 cursor handling
Date: Tue,  2 Jun 2026 21:54:12 +0530
Message-ID: <20260602162422.3360253-1-sowmiya.s@intel.com>
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

      This series fixes three bugs in kms_pipe_stress that
prevented overlay and cursor planes from being exercised.

The root cause was an inverted condition that caused the plane setup
loop to be skipped entirely on every successful mode commit (patch 1).
Once that was fixed, two further issues became visible: the plane
source crop was not initialized correctly, causing the hardware
downscale limit to be exceeded when the destination size was reduced
(patch 2); and the cursor framebuffer was created with the overlay
format and modifier, which the cursor hardware does not support --
only ARGB8888 with a linear modifier is accepted (patch 3).

With these three fixes, both stress-xrgb8888-untiled and
stress-xrgb8888-4tiled subtests complete successfully on Nova Lake
with and without MST displays.

Sowmiya S (3):
  tests/intel/kms_pipe_stress: fix inverted condition skipping plane
    setup
  tests/intel/kms_pipe_stress: fix plane source crop and separate cursor
    loop
  tests/intel/kms_pipe_stress: use ARGB8888/LINEAR for cursor
    framebuffer

 tests/intel/kms_pipe_stress.c | 116 +++++++++++++++++++++-------------
 1 file changed, 71 insertions(+), 45 deletions(-)

-- 
2.43.0

