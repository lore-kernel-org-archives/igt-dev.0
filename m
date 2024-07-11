Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03E1C3DA45
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 13:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7342210EA98;
	Thu, 11 Jul 2024 13:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmV0KP+z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2373910EA9B
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 13:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720706347; x=1752242347;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2pQFK93kbEqVZQXQssicf9ZXCnXC0jTgdQ6FinAiFmU=;
 b=lmV0KP+zYY42JOGxviKDemPqdG21UozrAEynBnMV4GlaqI4fWhgDkA8f
 ZZSauWIdJTWBAsgNEd7/pLxH9pL11Dk3+edkBAy8jBjoShiNAeg1+lVjt
 75bTyeCav4MjBK4HpgNrC6zzpBj1eZAZujTQfIsLaG8mF6RO/fQIeCFfh
 ldsbd2BtLlRsBJpvOzEcu2AsMyIDEruCS+i4xp8oV5xOoHFUc7Vl4zBDI
 KETst1ll1oYEFsGVmQ/5fZwJSqJtDRu+ik9qHRnVg3l66akfD+uWNrL/r
 VPXKmzyv+qi1JCcTlyl+uQFUIKG2uKxGobD+gNEMUhPQFVCLozijJgq9j A==;
X-CSE-ConnectionGUID: 5/VX+/SFS7GJZ/8OCAwsMw==
X-CSE-MsgGUID: zlJGjIp5RGmZtXCBQiJGvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="20997157"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="20997157"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 06:59:05 -0700
X-CSE-ConnectionGUID: oOufwm7KSX+D0oLxLjCInA==
X-CSE-MsgGUID: E2G/DMadTz+sdRUSCnMQPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="53389432"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.84.149])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 06:59:03 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Subject: [PATCH v2 i-g-t 0/2] Refactor sriov_basic test and blocklisting
Date: Thu, 11 Jul 2024 15:58:56 +0200
Message-Id: <20240711135858.975304-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

This patch series improves SR-IOV testing within the intel-ci environment.
The first patch blocklists sriov_basic tests identified as overly stressful
or time-consuming to be executed with all dynamic subtests at once.
However, these dynamic subtests can still be executed via testlists
(refer to the BAT example below).
The second patch extracts a specific subtest to simplify blocklist
management.

Included in the blocklist to prevent simultaneous execution of all
dynamic subtests:
  igt@sriov_basic@enable-vfs-autoprobe-on
  igt@sriov_basic@enable-vfs-bind-unbind-each
  igt@sriov_basic@bind-unbind-vf

Tests retained for execution:

BAT:
  igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
  igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1

FULL:
  igt@sriov_basic@enable-vfs-autoprobe-off
  igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all

v2: - updated blocklist, corrected line lengths
    - improved description (Jonathan)

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>

Marcin Bernatowicz (2):
  tests/intel-ci/xe.blocklist: Blocklist SR-IOV stress tests
  tests/sriov_basic: Extract enable-vfs-bind-unbind-each-numvfs-all
    subtest

 tests/intel-ci/xe.blocklist.txt |  7 +++++++
 tests/sriov_basic.c             | 16 ++++++++++++----
 2 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.31.1

