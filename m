Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0C8C25B76
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 05:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9405210E2FC;
	Tue, 11 Jun 2024 05:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4eypmpS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8371610E2FC
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 05:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718082093; x=1749618093;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oWM1A/3IOiOng8e4yqZXtRywj4d+UTWYChYVfTKZqEM=;
 b=a4eypmpS3YmGIJaHvaT7UC0GlOnx38FTdQG0oUCkpSqSBLHmKgdJEH8D
 TlCah3qOZYd4HZ+vSeKnr9EucNgcSIaYl6MGMjbGJqGV49i4+SFdiujfY
 FDi0/lDGNfZ+IcmQsfOlcVhv1aVoqxpEk9hOKa6kXWzauCRFGoHUaGLvK
 0KUNy2SHel5uEMAEOJyOHyX5CJT1s5TQy3jfzp4Qo0d50Jm8epgsvkNNm
 lVYeYzHbHJQrZ/Lgu8JiyvA1ixE2e/tADf9qqfQjf0JHfvJz71z1Rk7IO
 F/MH9L+kxUskhcvAE8Q1vkTr7eIrjsUrj8Pm5fgvbkWrN/XW9DPYCcb5T Q==;
X-CSE-ConnectionGUID: IxlMdRZXRLCRnTyybzCNKA==
X-CSE-MsgGUID: 95Wsje6ZSGeWGOVkIhd6hA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14997476"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="14997476"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 22:01:32 -0700
X-CSE-ConnectionGUID: r3NSARrwQjqrcdFKum1Qaw==
X-CSE-MsgGUID: sAB/I3uFSju4p37GfZ6wOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39981149"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 22:01:32 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 0/8] IGT KMS Test cleanup
Date: Tue, 11 Jun 2024 10:23:40 +0530
Message-ID: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
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

Bhanuprakash Modem (5):
  tests/intel/kms_fence_pin_leak: Test cleanup
  tests/intel/kms_pwrite_crc: Test cleanup
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
 tests/intel/kms_pwrite_crc.c     |  11 +-
 tests/kms_hdmi_inject.c          |   6 +-
 tests/kms_properties.c           | 188 +++++++++++++++----------------
 tests/kms_tiled_display.c        | 129 ++++++++-------------
 tests/kms_tv_load_detect.c       |   1 +
 tests/kms_universal_plane.c      |  10 +-
 8 files changed, 164 insertions(+), 201 deletions(-)

-- 
2.43.2

