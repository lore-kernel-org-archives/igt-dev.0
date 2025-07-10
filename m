Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B70BC83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 04:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD9D10E164;
	Thu, 10 Jul 2025 04:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K11oFcX0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FCA10E164
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 04:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752122910; x=1783658910;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PH2wcp8UrWZIAdWtBiWCuhntoVr86hZqHARAby9doGk=;
 b=K11oFcX0F+SJ19pM8xEhuuwWjYRPnO55hgGgfBFOv/Xs3lEP9k57hpHn
 Ik50kZEzbSzsvsR07HVCPvkmyLORQqpupg/ApBGIqW9MpFTCks0c70Y/K
 UZ54J2r5Y6hF2gIO4iYWHloD/SF8igiFYBfQeBVv7I4cEgUpJBWEdVTPa
 36YqYcTH3GO+fpk+0ZDxQXfH91gyz4+whys8/SU7pkNceS2shHVDMEB/c
 b7NFauSmEJ47o2myFATmZgCBDu050LVF0k9oG+VM0Knd6VO2WGDQob54u
 Pt7fgELvSdAWL+Ta9oLOwnNZ/3YNVoOTYcPIYO3kFJsSm3tSPwcxZLux4 w==;
X-CSE-ConnectionGUID: YW3pD+RISQeJqhQqavHAbA==
X-CSE-MsgGUID: 31FabzCHRR+2LgqPT1jhHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54540139"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="54540139"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 21:48:29 -0700
X-CSE-ConnectionGUID: N1EYj1SYQhyjSB4TgDNyZQ==
X-CSE-MsgGUID: zftilW3PTISxk8ms5RRGIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="156446498"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 21:48:29 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v2 i-g-t 0/1] tests/intel/xe_copy : Add check for memset and
 memcpy tests.
Date: Thu, 10 Jul 2025 04:48:08 +0000
Message-Id: <20250710044809.1739631-1-sobin.thomas@intel.com>
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

Added checks for platforms with graphics_ver < 20 (e.g. PVC) in memcpy and memset for tests 
with extended parameters.

This update includes:

- Handling of tests for  PAGE_COPY mode (memcpy) and larger-sized writes (memset).
- On platforms with graphics_ver < 20, memset is limited to a maximum fill width of U18-1.
  and memcopy tests using page copy is skipped.
- Any values greater than 0x3FFFF will now be skipped for memset-linear to prevent overflows 
  or undefined behavior.


Sobin Thomas (1):
  tests/intel/xe_copy : Add check for memset and memcpy tests.

 tests/intel/xe_copy_basic.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.34.1

