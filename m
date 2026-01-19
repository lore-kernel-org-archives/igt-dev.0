Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41B3C98315
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 04:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735D210E357;
	Mon, 19 Jan 2026 04:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3dV0epZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F30D10E360
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 04:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768798083; x=1800334083;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tfhmyX+dbARsx695uKdgBf2pFloK4u97mQ+VEd54rNU=;
 b=m3dV0epZrecGDs2T7VPd4grMWPnfhhm4fnQvrVYbfhR23qU4Pg5F4p2K
 tHWYV7C657FSteu4coKVLB/YmZPfFSEbhAmZJ+2cvxPXbHdG3ilpNzFpA
 2lCLfDnVLxdb440pZGac7j4E4O1kYa/o6gDrTarsqRyU8SVWb5wMeLaCH
 yE9jyvZos27f98zZq3qKaDCGY/YSjBFfcEn6G+2jSdXFst6uE/dwI/31Q
 CbCldrTqk8oTSm8wifbhMVkoj1zRLKNz/fGrXLsILYman4V3eP/lyOSbc
 TlTJ3nx6s0bqBBe1e9KhLB70Cj5r0OA656I7Y+EjgrMp16H4kuANrEiAd A==;
X-CSE-ConnectionGUID: 0hIqpo8gTIyjEHyrsz0Yfg==
X-CSE-MsgGUID: 3kufOwkHSAOKtp3hj85JpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87581729"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="87581729"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:03 -0800
X-CSE-ConnectionGUID: OKOm7mmUSEm5koOXPR1RyQ==
X-CSE-MsgGUID: ocUlfE81SYW4x6x8iI6tEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="210271061"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:01 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v6 0/8] Add writeback changes for intel-supported formats
Date: Mon, 19 Jan 2026 10:37:24 +0530
Message-ID: <20260119050732.110985-1-sowmiya.s@intel.com>
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

This series introduces validation for writeback functionality
across newly supported formats specific to Intel platforms.
existing functions with limited format support were retained
for compatibility. After validating new formats introduced by
the platform, additional format support was added to the
writeback test suite. Subtests leveraging common framebuffer
creation logic were consolidated and dynamic subtest generation
was implemented to efficiently handle format-specific variations.
Refactored existing test cases to improve efficiency. 
Add helper function to get the default format.

 lib/igt_fb.c          |  39 +++++++-
 lib/igt_fb.h          |   1 +
 tests/kms_writeback.c | 216 +++++++++++++++++++++++++-----------------
 3 files changed, 168 insertions(+), 88 deletions(-)

-- 
2.43.0

