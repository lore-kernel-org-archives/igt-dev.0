Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97995C27C55
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 16:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0537F10E18B;
	Mon, 10 Jun 2024 16:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cY2RAGQp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1ABE10E18B
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 16:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037766; x=1749573766;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CJArEnYomi9bWubQoea6DD+1mD62bG0M2t37R/YJgQA=;
 b=cY2RAGQpJPH6SgoIYrQjtnXz2bclFT9lN6Dnu8DGJsTo1Eg1dxmZPgXh
 2fRtJXdVFm6FLWUOvfHXmVm0YTi1EruNzo/Ek605AGYEVAMKbtOOiFjsa
 eeGJ0L6nBkwi2OIiMqPdvKBwL+BtXB2kvPhP8BU7n55J+3TOB+h0eLsev
 OVfsAbqQGR3fuiuc81OxlA0Wbo11xRcKtzduO6+LyxH7azNe/Mn6lZeWu
 AGcBK1vpHDojuaAFtLXIIiAf7y/av+PaHe8p+FMPB+QU5eS9hzX2dnywX
 m/F+0C8MVsAmOPWdQOW6K4bGv3XBJ9Sm0ex9EEBpzqV6ODmB9m87lniCs w==;
X-CSE-ConnectionGUID: 0jU5VVNlSGmKQvYzNSvO8Q==
X-CSE-MsgGUID: rjb8FaZfQ6CUx8tqs/x2tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25819682"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25819682"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:46 -0700
X-CSE-ConnectionGUID: W3S8UgPpRWqguaHlajPwUw==
X-CSE-MsgGUID: RJ23IWULT9mH1hYW2gGagQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39681315"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:44 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 0/9] IGT KMS Test cleanup
Date: Mon, 10 Jun 2024 22:04:48 +0530
Message-ID: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Make sure the below points in IGT cleanup:

 - Sanitize the state before starting the subtest.
 - Clear the states before exiting the subtest.
 - Update existing libdrm APIs with IGT kms APIs.
 - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)

Bhanuprakash Modem (6):
  tests/intel/kms_fence_pin_leak: Test cleanup
  tests/intel/kms_pwrite_crc: Test cleanup
  tests/kms_dp_aux_dev: Test cleanup
  tests/kms_tiled_display: Test cleanup
  tests/kms_tv_load_detect: Test cleanup
  tests/kms_universal_plane: Test cleanup

Kunal Joshi (2):
  tests/intel/kms_pipe_b_c_ivb: Test cleanup
  tests/kms_hdmi_inject: Test cleanup

Mohammed Thasleem (1):
  tests/kms_properties: Create dynamic subtests

 tests/intel/kms_fence_pin_leak.c |  11 +-
 tests/intel/kms_pipe_b_c_ivb.c   |   9 +-
 tests/intel/kms_pwrite_crc.c     |  25 ++--
 tests/kms_dp_aux_dev.c           |  14 ++-
 tests/kms_hdmi_inject.c          |   6 +-
 tests/kms_properties.c           | 188 +++++++++++++++----------------
 tests/kms_tiled_display.c        | 129 ++++++++-------------
 tests/kms_tv_load_detect.c       |   1 +
 tests/kms_universal_plane.c      |  10 +-
 9 files changed, 182 insertions(+), 211 deletions(-)

-- 
2.43.2

