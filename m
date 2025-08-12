Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE24CA0EC4
	for <igt-dev@archiver.kernel.org>; Tue, 12 Aug 2025 13:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C112D10E3E4;
	Tue, 12 Aug 2025 13:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QB6y9Vi/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453A010E34C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Aug 2025 13:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755003717; x=1786539717;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lvkm/QvL33Ca41HesBRk5EsIZfqbECCmWOwmutdLckw=;
 b=QB6y9Vi/6bpFt9ReGdX0jSNM+SIc1bry4j7nFDrjlbvycKPKvuv/PoTH
 Ql3pFsUzLXm1ZbJttTbqqKvBRBDmH7vILr1uuG51VfsNAJsv/DRUx6zRn
 CyJV2HYAQg7Kq02AGoKpn7yIozhXp3mjIMln1aPeng9nVHjVJPuyv3sBp
 8mAFc95jwSLScyZs36wCdi9yzphj9xGcbMT+gZVc0/mhRYR+cnQfUXIVU
 PykAtePS70pe70+SNMuKMarvkwfkMlkP27YlhxVhjKo5M/CcnT3c/cJyQ
 cx58Clh0aOtGHBXLIAnlkAEFdoTRSKz2idl5rzGIQY/Awi0jA09z6TNYN g==;
X-CSE-ConnectionGUID: GhleS6HcRTyW7gd8GSXd2Q==
X-CSE-MsgGUID: dQ2EcZYQR22JrjCtjGD+xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="79849032"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="79849032"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 06:01:57 -0700
X-CSE-ConnectionGUID: X+1RQKjJTY6D+D06b5I79w==
X-CSE-MsgGUID: 2ZcQE2XLSEmulPnYEy+Kng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="170407082"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 06:01:55 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_vm: Extend coverage for bind with
 invalid flag
Date: Tue, 12 Aug 2025 15:01:40 +0200
Message-ID: <20250812130142.37988-1-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Hi,

currently invalid flags are only passed to a bind with a single
operation in the 'bind-flag-invalid' subtest. This series adds a
complementary subtest which performs an array-bind and reuses the
implemented test code for the single bind case.

The added subtest reveals a double-free bug in the Xe vm_bind_ioctl
implementation, for which I plan to send a follow-up fix on the Xe
mailing list.

Regards,
Christoph

Christoph Manszewski (2):
  tests/intel/xe_vm: Add bind-array-flag-invalid subtest
  tests/intel/xe_vm: Unify bind-flag-invalid and bind-array-flag-invalid
    test functions

 tests/intel/xe_vm.c | 118 ++++++++++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 48 deletions(-)

-- 
2.47.1

