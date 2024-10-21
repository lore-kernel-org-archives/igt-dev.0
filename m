Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44918D0E6D3
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 09:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C6E10E45D;
	Mon, 21 Oct 2024 09:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFy8VAer";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F285610E456
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729501615; x=1761037615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hTWSKE6g1CxTO0Ywx+peglZaO/2Al3cfnZcxsIL5qW8=;
 b=FFy8VAerxQePoQ6a2/pgrws75ZWxZG/vY3cfTTW6k0sAYeZMt1GlafFJ
 i/7bd4zxhH6i5ylNfV56O/xuy0U5wwoy+R0akX/E3N+wY+ez9ZR6yJNTc
 l0NbhTyHe8FmQ1zs4HXB52j1F7z+P9ztTszy/9wRjRiLH7bQVUHsdlZst
 HECcR3xyB+0Set09NrU87Zl+6VQWRVeDtq6+QEiOgQSfG9WcubWsvexe8
 Zs61bOB+kMg1WzeYDq7bKmL31t4wIGnfiVhjzhrRoVQoBVIJHEmf8J59s
 J3jzCNxw2iAwHwGKK0nFURXSyrRV/N/9qiPVczT2Rcooa+4e5QfDey7gy A==;
X-CSE-ConnectionGUID: XyjOWAsmQzeTMrwKazZr+Q==
X-CSE-MsgGUID: /UqoYNEjRHuyVG/k7ortLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51522018"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51522018"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:06:55 -0700
X-CSE-ConnectionGUID: BhS8QWlAShSk92KJQdMXuw==
X-CSE-MsgGUID: aLO+VIlYTWimdd8QgCZa7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="79421254"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:06:53 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v3,
 0/2] tests/xe: Add tests to validate GT coarse power gating status
 and toggle coarse power gating states
Date: Mon, 21 Oct 2024 14:30:33 +0530
Message-Id: <20241021090035.2088446-1-sk.anirban@intel.com>
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

Implement test cpg-basic to validate coarse power gating status
after S3 cycle.
Add test cpg-gt-toggle to check if GT coarse power gating is up when
forcewake is acquired and down when released.

v2: Address cosmetic review comments (Riana)
    Fix suspend state (Riana)
    Add exit handler for test cpg-gt-toggle (Riana)

v3: Address cosmetic review comments (Riana)
    Fix commit message & test name (Konieczny)


Sk Anirban (2):
  tests/intel/xe_pm_residency: Add GT coarse power gating validation
  HAX: Add Coarse power gating tests to fast feedback list

 tests/intel-ci/xe-fast-feedback.testlist |  2 +
 tests/intel/xe_pm_residency.c            | 92 ++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

-- 
2.34.1

