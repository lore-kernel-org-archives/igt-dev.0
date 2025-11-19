Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D1ACF648D
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 23:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B55E10E283;
	Wed, 19 Nov 2025 23:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjkRXyJI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F285D10E27B
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 23:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763594343; x=1795130343;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5/aNtzjR5jSSWi3awIeNaddC+huQmjAf3UgSCMXeSg8=;
 b=SjkRXyJII80cSTPpS/Qz/SyrTyPjXU1OL+n/RcZBRGECyVEdfQLUj9cf
 0BYuky7YCiUYcoMhSSrSSmGdlVwc+SbgTjib1KGEw8AzJXAe0li6+j5Mc
 4wiYFYriinzJGOWXS/MEI9PcbVyLV/52PFJfCXPK/c+iANMJismdLM1k6
 JX97eKyxaAYHP5QkhqFx2ZXiA8jkkY8/DvBvh/eypd73C/hFajv58lJz2
 lDgaWDsBonZ7mYtkvwmXR3BFQT95+5UC894z0nqQfp/COJamQ/n055/rQ
 Is28efVJsDpoCvBSTk563UV3B3fyl03VadD5x+TXnzyx/4ugvUBUG/5Ke A==;
X-CSE-ConnectionGUID: 4qjPkcDCQFi00nQrOoFGdw==
X-CSE-MsgGUID: jGTH01/4TuiVMJB3C4w9cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68257793"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208,223";a="68257793"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 15:19:03 -0800
X-CSE-ConnectionGUID: hcmuwS4WQemMZUc0oSYkBQ==
X-CSE-MsgGUID: VdcSg0bPQqmMwnWP2TtAhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
 d="scan'208,223";a="195682866"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa004.jf.intel.com with ESMTP; 19 Nov 2025 15:19:02 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 0/2] Randomize PAT test subset
Date: Wed, 19 Nov 2025 23:18:58 +0000
Message-ID: <20251119231900.3797119-1-zongyao.bai@intel.com>
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

From Xe2 onwards, the PAT index has become large, making exhaustive
testing of all combinations impractical. This patch introduces a hybrid
testing approach to maintain comprehensive coverage. The PAT index test
list is constructed using a two-phase approach: Mandatory Entries and
Random Entries.

  v2:
     Modify patch tests/intel/xe_pat: switch PAT tests to igt_srandom()
     remove igt_srandom() because it is called in common_init().

Zongyao Bai (2):
  tests/intel/xe_pat: switch PAT tests to igt_srandom()
  tests/intel/xe_pat: randomize PAT test subset for xe2

 tests/intel/xe_pat.c | 134 +++++++++++++++++++++++++++++++++----------
 1 file changed, 103 insertions(+), 31 deletions(-)

-- 
2.43.0

