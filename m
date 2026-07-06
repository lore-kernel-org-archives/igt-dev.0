Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857BDC43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 06:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D4110E2F3;
	Mon,  6 Jul 2026 06:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rpzrf7Hv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C1C10E2F3
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 06:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783319244; x=1814855244;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q5TVuIY49BqcLseMFh6Mw/ax3Svw33EMuL5DVqtrgek=;
 b=Rpzrf7Hvu357SsSyMq56kOQLYn0CeuAPYfnZ6Z7rzn3KO7C9LXBbNnZc
 Mx+EnuSV7AGEZTOAkg06Q5IWG1Ie5JRgMTevV7vIQICkeJ3QQ/58n72zx
 Gu/tMPNJ7ONPulAGclU7P61ymg0YkLb4iHLEVPFBkvUJFnp0t2JQfqeob
 zHeEoGpAsArHtHGB/M5qBlzcRKLzSZtjmilVQlrKpSEPtMb22bCYDhuFH
 wsWH/4btgK8DpbH/h0QUlf8rqYdg17TZJV0xrHP9m80zTvuLDzq84X9Sf
 Xfve3WfROpoIGlU2H8XttxfVeDB7nQFxajUU+xtXAC6FgyW6pDS6VOHA7 g==;
X-CSE-ConnectionGUID: NFRZyrZrSpm3SACGDqfyCg==
X-CSE-MsgGUID: Z+T+a6FxQ8mQU1p0KQWGxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94303442"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="94303442"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 23:27:24 -0700
X-CSE-ConnectionGUID: riR80BCqRcCRKsQImolEBQ==
X-CSE-MsgGUID: 4VFdpGfjTg2i0hbLIGAYkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="250267057"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 23:27:22 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 0/3] tests/intel/kms_pipe_stress: fix plane setup and
 cursor handling
Date: Mon,  6 Jul 2026 12:20:06 +0530
Message-ID: <20260706065019.416906-1-sowmiya.s@intel.com>
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
2.51.0

