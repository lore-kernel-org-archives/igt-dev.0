Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D97EEA84B
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 19:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7402310E784;
	Thu, 12 Feb 2026 19:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbKPpnmH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F2710E02D
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 19:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770923044; x=1802459044;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LWa7cgaCamtQ4JizpUrhRX4bAF0H+pXiLroNAWHc/2o=;
 b=gbKPpnmHdz41H3lfkGgXzVXFVwH0QZ6gP8uyA3/WP1UatwiDhGUm3q5s
 sD7p0vP9rQVJ3WuWl37h691cSRLNt8NldpizYQStung094QZxf2pPNRnw
 uC1SJGO3eQWXj+x624tpyjUuiTUMU/O9XF6YrMGwnESgrI6kHgO4iJFhh
 IJjXyQp0mP+fSvrp1pqzOnBWAh12qTgKoNAWAAfqQw1llB6tEGDc2XmSz
 MSLiW72bWbePJO4kT7fn6+TUnXqv2fvlaDjktfkyLYAtyUa6jqWmymwS5
 kOQ2KyTAMipY378UpviNv0HnQix61WATcxQdPC20zl3oJhKSFL7z6U/Ct g==;
X-CSE-ConnectionGUID: kx+Zt4AkRwyjVhNXqUxYag==
X-CSE-MsgGUID: fMj3cUM6SHGuSCXvNFi34A==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72008605"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72008605"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 11:03:52 -0800
X-CSE-ConnectionGUID: 1MOtQX1bS7+XOpIRKRvvfw==
X-CSE-MsgGUID: yQBQ5mo/Ri6OBe9Xlu5saw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="217230674"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 11:03:52 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, nishit.sharma@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: =?UTF-8?q?=5BPATCH=20i-g-t=200/2=5D=20test/intel/xe=5Fvm=3A=20Add=20overcommit=20and=20no=E2=80=91overcommit=20handling=20tests?=
Date: Thu, 12 Feb 2026 19:03:01 +0000
Message-ID: <20260212190305.804221-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
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

This series adds coverage to xe_vm test by adding over commit test in fault mode and
non fault mode.
Also added support to test the no overcommit flag (DRM_XE_VM_CREATE_NO_VM_OVERCOMMIT)

Sobin Thomas (2):
  tests/intel/xe_vm: overcommit tests for fault-mode and non-fault-mode
    VMs
  test/intel/xe_vm: Test to check no overcommit flag in fault mode

 include/drm-uapi/xe_drm.h |   1 +
 tests/intel/xe_vm.c       | 634 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 630 insertions(+), 5 deletions(-)

-- 
2.52.0

