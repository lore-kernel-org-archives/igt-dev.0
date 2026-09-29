Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C30CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 10:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8908310E6CE;
	Tue, 29 Sep 2026 10:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RtQq5sII";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F95810EE40
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 10:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790679379; x=1822215379;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7YXGWXKJs3PVrKz1b8Pj+kr+HJMgJQhZ0BaciLMin30=;
 b=RtQq5sIIrlvdqHDhNmKpvwwg3sqtVaumTbWQ1AllLSowvx+Lw0u8Gld6
 5AnsZu9vh7Vk7jVCm2uzd+24Obk45XOE7+7llgci1vDgJaOkLK+/7Msmj
 wNNzL1B9WHTWHhruWn3wDj3TfA5Squ+1+CBDJSXeh3Ge1eeY9WI/zU+2O
 QSwPjc7vSrFq7sgzdpSRJXeOhTuGUnJz00vxsfioe6TEJHgg4+a2pns+G
 Vpxt1Pzbl1q4+F6tKp5r3tJcnQWP2SVisnFe7TQAPJtPU2L2b07GtwsWf
 kVgJ6VMwKDfWWzr9l5Kg3qyun+Vai6s0IYELe6z2its+0AzeW7HSmxBfr w==;
X-CSE-ConnectionGUID: fAsZqQMSRTSzsvho7iC+5A==
X-CSE-MsgGUID: HVcnU+UHTB2P0Cyv+ZHnxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101561845"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="101561845"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 03:56:19 -0700
X-CSE-ConnectionGUID: w1kz5Ht2RGyKAYBmqEPmDw==
X-CSE-MsgGUID: WO6AjUvGRCKcFrKvfnGRKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274870357"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 03:56:16 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ravi.kishore.koppuravuri@intel.com, raag.jadav@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t v1 0/3] tests/intel/xe_err_injection: Add Local
 Uncorrectable Error Injection Through LSC Storage
Date: Tue, 29 Sep 2026 16:25:43 +0530
Message-ID: <20260929105543.2400108-5-soham.purkait@intel.com>
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
 tests/intel/xe_err_injection.c | 1477 ++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |   53 ++
 tests/meson.build              |    1 +
 8 files changed, 2274 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 lib/igt_drm_netlink.c
 create mode 100644 lib/igt_drm_netlink.h
 create mode 100644 tests/intel/xe_cper.h
 create mode 100644 tests/intel/xe_err_injection.c
 create mode 100644 tests/intel/xe_err_injection.h

-- 
2.43.0

