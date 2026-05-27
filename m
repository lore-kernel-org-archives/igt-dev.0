Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BF6CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 06:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A34010E72D;
	Wed, 27 May 2026 06:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FDKshkk6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D21A10E72D
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 06:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779865085; x=1811401085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=43po+pwL+o4Nyi0COCwbHztEBu/WRzhvdh0G7X8OpGY=;
 b=FDKshkk6YiVUwL6oSNn7xnpZA3QvTaidVmzb4f4ctXGeojtdtcAROlHN
 A9Pa34N88K5Wnz73Sj5jVrVyBtwCMBLFOTx0pb3O1ASmEqZkAho2RT1Lh
 AEjEIS3dMH8GR1JhbHggjSpzSxJGRHjizZGpJUuBNEJ6GEM6xqfX3Hrhi
 bU1YEyHBIM3QPNaIrhWAqppEGLstRMiG/AMM8yWNC4MkJNewPr3aMKOYZ
 OwEKkeiw8vW6Qs9HpMcxoBzlZQdC7hqwmP4gzgQEahsDdAo7kt7sAchiU
 si3TG9+5N6Nkc+GU0AmE3nFY4lbpEVAG4eXub2bSIU04DIpp15RrRDveU g==;
X-CSE-ConnectionGUID: tqL0g9OiSkyopNFGd/gHUg==
X-CSE-MsgGUID: VROs+DQASbiJg8QuKhjGWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80874756"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80874756"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 23:58:04 -0700
X-CSE-ConnectionGUID: THHjELkSSXCOnQ8K+ffpbA==
X-CSE-MsgGUID: P+Pizt7jQ2aAAKDnnp85Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="235787312"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 23:58:02 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com, Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 0/3] tests/intel/kms_pipe_stress: fix plane setup and
 cursor handling
Date: Wed, 27 May 2026 12:49:35 +0530
Message-ID: <20260527071940.3285269-1-sowmiya.s@intel.com>
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

This series fixes three bugs in kms_pipe_stress that prevented overlay
and cursor planes from being exercised on Intel Xe2 hardware.

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

*** BLURB HERE ***

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
2.48.1

