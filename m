Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C857AC02187
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 19:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9D610E211;
	Thu, 16 Jan 2025 19:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ep9v7HKN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0508610E211
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 19:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737055755; x=1768591755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EFZNe41OhgxfFuU3cWA8B8rclgfh3dizNOjeSVanSeM=;
 b=Ep9v7HKNfu09zVSn3iTKkSHzra+RN5QoZf+95rz+I/i1PjS/B6OWOC4z
 G6gjjkM0lMFx/biWMdV8gSxXH+OTyrKmbknLO2SIvFi9XKYpFk9OCm5dF
 Gs3QaXer7+ISeVMJzFXVir2xVtY1PN8RLA+xO0McLHoiif4sbHmIvwZLP
 XIG2FCb965AFS4aRvsvpzlJji4BRSJC+6+FKT5KxbLCYw07Xn+rswNLeU
 pLk3VWoRX7lmNUCchcWGCLk0XviSs6J/tOEwhGc+wEYAb7mKT5nn7Agtr
 TNDdoO8IRiFedEupYayzyRIpaVcESJL3hlC46AAIp6AFG4KWpsqycbY+v Q==;
X-CSE-ConnectionGUID: eTafBo6VQVGjiLHHmviOCA==
X-CSE-MsgGUID: Evq5+nsoSki+YzZaEFFhZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="47955173"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="47955173"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 11:29:15 -0800
X-CSE-ConnectionGUID: u2mfjkQVQiWmrdlCwpDf0w==
X-CSE-MsgGUID: YYMa245GTAGm5sxxmVGKfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105439366"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.125])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 11:29:12 -0800
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
Subject: [PATCH v3 i-g-t 0/2] tests/intel/xe_sriov_flr: Add parallel FLR
 subtest for SR-IOV VFs
Date: Thu, 16 Jan 2025 20:29:04 +0100
Message-Id: <20250116192906.636031-1-marcin.bernatowicz@linux.intel.com>
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

