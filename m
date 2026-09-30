Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19B9CA5FC7
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 15:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CC410E3E2;
	Wed, 30 Sep 2026 15:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKIEQZdY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B1E10E234
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790782693; x=1822318693;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mWggDwgma+PZrPJUxmAAlV9CKWF8vLZZz+PHdEedmfU=;
 b=RKIEQZdYMAC2spj57VbvR3PrkPkbz2weFDcGGlmfyoi182gsVfOI/AgG
 ok0fsiRDK+7pfjgmn4/MFt6wgKRX/Z2PLZC/ggU+cxxf/owEfjonlxsv/
 h30mtoDxR57E5kB/DVU4Z7/L/iZrP50P8a8LhUxW6um/oSswuH/OT7H7k
 TeUBpa/6s/D2V8Mtu+rtgvulWjuibRCcCcBJp4BEeK+D4bsnIQTv1zoBC
 PtuPf0o9HpVwxz6D/pXBS1CZYh9jtRqSrYY06DMFSW1DJ0I10O4XyQnUW
 uct0knkcwW84HQIk7py/2destBx9bNBfkcs77B8m7f4yao+MzY1Tx12EY Q==;
X-CSE-ConnectionGUID: VEB5pTIqTO+dkQ5ue3sSaQ==
X-CSE-MsgGUID: 2CRZxWaMSmmO5j7JXzOlKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102198097"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="102198097"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:38:13 -0700
X-CSE-ConnectionGUID: Sx3eGDcTRt6fcz667KbKIA==
X-CSE-MsgGUID: HSEci4AYR4G5UAc2Jl29Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="279046833"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:38:10 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ravi.kishore.koppuravuri@intel.com, raag.jadav@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t v2 0/3] tests/intel/xe_err_injection: Add Local
 Uncorrectable Error Injection Through LSC Storage
Date: Wed, 30 Sep 2026 21:07:55 +0530
Message-ID: <20260930153755.2447513-5-soham.purkait@intel.com>
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

    Adds coverage for local uncorrectable unicast LSC (Load/Store Cache)
storage errors.

The test injects into the LSC storage array, drives a heavy LSC
workload on all compute engines to trigger the error, and verifies
recovery by capturing the xe_error_cper and xe_exec_queue_reset trace
events. It confirms the CPER record reports a local, uncorrectable,
non-fatal error and that the error counter increments. A post-recovery
workload run confirms the error counter stays stable.

Ravi Kishore Koppuravuri (2):
  From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com> DO
    NOT REVIEW. COMPILATION ONLY.
  From: Ravi Kishore Koppuravuri ravi.kishore.koppuravuri@intel.com DO
    NOT REVIEW. COMPILATION ONLY.

Soham Purkait (1):
  tests/intel/xe_err_injection: Add test for local Uncorrectable Error
    Injection through LSC Storage

 include/drm-uapi/drm_ras.h     |   67 ++
 lib/igt_drm_netlink.c          |  557 ++++++++++++
 lib/igt_drm_netlink.h          |   38 +
 lib/meson.build                |    9 +
 tests/intel/xe_cper.h          |   72 ++
 tests/intel/xe_err_injection.c | 1472 ++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |   53 ++
 tests/meson.build              |    1 +
 8 files changed, 2269 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 lib/igt_drm_netlink.c
 create mode 100644 lib/igt_drm_netlink.h
 create mode 100644 tests/intel/xe_cper.h
 create mode 100644 tests/intel/xe_err_injection.c
 create mode 100644 tests/intel/xe_err_injection.h

-- 
2.43.0

