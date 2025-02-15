Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D1CC021A6
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 01:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF0F10ED4B;
	Sat, 15 Feb 2025 01:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FpruYnJl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A24A10E4B3
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2025 01:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739581589; x=1771117589;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dBHlRjRaKHf1qIjpMhO1Dfz1SGMKi/2BKQ93Tfkqiz4=;
 b=FpruYnJlb/sTLCpmOjN+3g4lHICpb5sDUR6vDBgAmtsvEOUvBSQ4Crvd
 arrayM139jgHMLVy17PFkqpZkzyG52F290zfQd4yCWbEKLV4/agX9d/hj
 Q3mASZe8OL8KDQoSOtR1H6zOwwxNjRUiHLIqGmo4fC3itA0CkPbTsEDov
 Uf+tRJ9RfT93ZkMG1dCbSeanyXE+INtO/hCHsIrZ2NfM8TOnRdu+gxwq0
 K9Q/oIHNsmY1Tf3qxQpu0LqcPdGhoUg7SDiGNQR0Q7KVAhS7+aT7cD+ZE
 EdYOIeEH8U8+OtClO0OFGgZ4G080gY8s5GyshKiuqkqrru2y2WNZI/urq w==;
X-CSE-ConnectionGUID: R2tou91FRTySbPu9DJYQsA==
X-CSE-MsgGUID: dVeASAxaSV2bLBHWxXN9vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50555106"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="50555106"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:29 -0800
X-CSE-ConnectionGUID: 7hgbJ3HZSE+qq4DYVgTGHw==
X-CSE-MsgGUID: xSxfGgDVTJiI6QgLw6VNhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="118711232"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:28 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 00/13] Some refactor, rewrite and fixes for OA tests
Date: Fri, 14 Feb 2025 17:06:15 -0800
Message-Id: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
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

Some refactor, rewrite and fixes for OA tests. Added some tuning
parameters to control execution on slower platforms.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (13):
  tests/intel/xe_oa: Use static for global variables
  tests/intel/xe_oa: Drop unused macro
  tests/intel/xe_oa: Rename oa_exp_1_millisec to oa_exponent_default
  tests/intel/xe_oa: Use default exponent for some tests
  tests/intel/xe_oa: Use same render copy width and height across tests
  tests/intel/xe_oa: Rewrite the polling small buf test
  tests/intel/xe_oa: Simplify the buffer-fill test
  tests/intel/xe_oa: Use default buffer size for non-zero reason
  tests/intel/xe_oa: Test oa buffer sizes
  tests/intel/xe_oa: Rewrite enable-disable test
  tests/intel/xe_oa: Enable unprivileged-single-ctx-counters and fix it
  tests/intel/xe_oa: Fix mmio_trigger_reports testing
  tests/intel/xe_oa: Set boundaries for OA exponent test

 tests/intel/xe_oa.c | 571 ++++++++++++++++----------------------------
 1 file changed, 205 insertions(+), 366 deletions(-)

-- 
2.34.1

