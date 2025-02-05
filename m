Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E952C02192
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 17:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9BE892AA;
	Wed,  5 Feb 2025 17:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PsgcDuqB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA5C892AA
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738775910; x=1770311910;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OvI6N4/S8Ikiv3dkFs0yIvqaj+tocory+PNwR9cADo4=;
 b=PsgcDuqBw822heDMkoUWW2UC20upR6yQ3XCtUcVTHacSEF5A57q+0yXV
 PGr7gvsMAm0LR4bphdR3sMIh0Eel7x+Jw4Zehl0H91PX4PizZZll7FL4F
 JzjP0SNs63or3O1eP1A6Y593aeODEFkKlFBQL7rpqEjb+mCziiL+8603T
 ki+YunzXsOYk4TmBaajOiyDvoYsh6ie5eBsvtriSI1R5m72wsrHayu4h0
 arqgjaaRwrCrUixXO7fDKLrIEJi7BUqT1+LRdLGdhJDK87NNQYSvWDWFy
 Vdyignao8JG2WPQj9CHhFPl8H7UugL1yZp4gfgJrFdMz65O5NBlX2fSg3 w==;
X-CSE-ConnectionGUID: p7zRlbH4RBC7pcxFmR9C1A==
X-CSE-MsgGUID: HtZRaJ6dRhiO3KzwCuEsYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43106649"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="43106649"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 09:18:30 -0800
X-CSE-ConnectionGUID: LduMIH73TKiJeVb3BpR2Zg==
X-CSE-MsgGUID: WIRoJcUCSrelfLVy28Nhbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="110755735"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.3.119])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 09:18:27 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v4 i-g-t 0/2] tests/intel/xe_sriov_flr: Add parallel FLR
 subtest for SR-IOV VFs
Date: Wed,  5 Feb 2025 18:18:17 +0100
Message-Id: <20250205171819.2485976-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce a new subtest flr-vfs-parallel to validate parallel FLR
execution on all VFs. This subtest ensures correct behavior during
simultaneous resets.

Introduce the flr-twice subtest, which initiates FLR twice in parallel 
on the same VF. This subtest covers a use case where two FLRs can occur
within a short time frame, such as when starting a QEMU VM with
a passed VF.

v2: Reintroduce condition to reinitialize test data only if more VFs
    remain to be tested (omitted when extracting execute_sequential_flr).
v3: Introduce threaded FLR initiation to achieve better parallelism
    by mitigating 100ms reset delays.(Lukasz)
v4: Use total_flrs variable instead of repeating num_vfs * num_flrs_per_vf
    (Lukasz)

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

Marcin Bernatowicz (2):
  tests/intel/xe_sriov_flr: Add parallel FLR subtest for SR-IOV VFs
  tests/intel/xe_sriov_flr: Add flr-twice subtest

 tests/intel/xe_sriov_flr.c | 230 +++++++++++++++++++++++++++++++++----
 1 file changed, 206 insertions(+), 24 deletions(-)

-- 
2.31.1

