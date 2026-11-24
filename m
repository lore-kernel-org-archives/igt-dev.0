Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036AB606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 04:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QYwbSyOT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD0110E198;
	Tue, 24 Nov 2026 04:48:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED25210E198
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 04:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795495630; x=1827031630;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KEmfE1iGyFyz4CQg/Xl8F0sMbMjQikpbiXQ132wxc5w=;
 b=QYwbSyOTvAyyNEdJFj8UQWYcNjxBY721FahJ9GlSRUba9b3e1k29gkwi
 038p4IBaTdKbjBr9k3V99FfawaRX7QkQA+1uzOB95j5SAkhtniH/5m7tz
 2LvzeBybPax9GfcK8E4wgq7WLQRMhO5TWt76EAMQ1KqsXMiplS4uLAeXs
 1DaswsEMKBziOReT/KGMx0219tco47oAnOHpYDsc/CCujqH/xhOTJ78Tv
 taRSNSzsJEJ8DijYGPrVlQV+0lSBGFsp88Hxz+OePXQo5uZPl1/XbcCSk
 ROvpnhbhgErf5d6psPrZDWxx2KvRXTTMqNYO0yREB6MpzF/JyXHPq3xKZ w==;
X-CSE-ConnectionGUID: 3ZI7Fe7eSI2hxvNmjtEA5w==
X-CSE-MsgGUID: 7P5Ae8tURmmh/+/BfNBCVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4193611"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4193611"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 20:47:09 -0800
X-CSE-ConnectionGUID: gnAdFOEbTZClSxOBkshlpQ==
X-CSE-MsgGUID: aNvvLqbESNaHFgZqgyeElQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11444943"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 20:47:08 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/4] RFC: Add intel_display module support to module
 load tests
Date: Tue, 24 Nov 2026 10:15:55 +0530
Message-ID: <20261124044559.897167-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Display can now be built as a separate intel-display.ko (intel_display)
instead of being part of i915/xe. This RFC makes IGT aware of it:

- Look up display module parameters in intel_display as a fallback.
- Unload intel_display together with the GPU driver and add helpers to
  control it explicitly.
- Add intel_display load/unload ordering subtests to i915_module_load
  and xe_module_load; they skip on kernels without the module.

Jeevan B (4):
  lib/igt_params: Fall back to intel_display module parameters
  lib/igt_kmod: Handle the dedicated intel_display module
  tests/intel/i915_module_load: Add intel_display module subtests
  tests/intel/xe_module_load: Add intel_display module subtests

 lib/igt_kmod.c                 | 209 ++++++++++++++++++++++++++++++++-
 lib/igt_kmod.h                 |   7 ++
 lib/igt_params.c               |  83 ++++++++++++-
 lib/igt_params.h               |   1 +
 tests/intel/i915_module_load.c | 108 +++++++++++++++++
 tests/intel/xe_module_load.c   | 100 ++++++++++++++++
 6 files changed, 497 insertions(+), 11 deletions(-)

-- 
2.43.0

