Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3959EA4E07
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 14:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAEB10E4FF;
	Mon,  2 Mar 2026 14:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ip478q/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2559210E502
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 14:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772460091; x=1803996091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mqanBWTB+VJfyIbNsjLXsqYGHcd7hg6IKKCZ+f1mGvA=;
 b=Ip478q/VKWNPQP79/0hoVPG0yl9YDWkEtM9gbmjI1b73mbLSOd8pzbSu
 s+1W+5Ep2zAppf1u5cbkA1ZnYQAqoPgMSSRYxCKuJ8Tw//RyJv7AsKpO+
 mgYjbWBlUJKgXW03nkI0a6K0FOoDqlR3P5LmxfrgJQqkue4xcMtnl9h+s
 jOc4Ztnw4SKUiZZxWJPNGSRWddiDMIWYYBe+h1EFrSJJhjzH45NrDNl07
 5K9uZgKcRZVDLap1uYl2XtTK8ogbtXvIMFZeH5tE1jg29xYulCjYkmOUA
 We7+V74Qy8H7cpraCBduKphbsEA3s5fEbwFZsIurKOzaOq0KZErnpAk9y w==;
X-CSE-ConnectionGUID: +hdKbrBZSbOM0k75JOS6qg==
X-CSE-MsgGUID: wxx5e91vRiWR2+P8soui7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84170698"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="84170698"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:01:30 -0800
X-CSE-ConnectionGUID: x0BAw9xITxuFv2pKTnxK4A==
X-CSE-MsgGUID: 09HnC2mmQEOGLyMZb+pLUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="214126792"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:01:30 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v2 0/2] test/intel/xe_vm: Add overcommit and no‑overcommit handling tests
Date: Mon,  2 Mar 2026 14:00:08 +0000
Message-ID: <20260302140010.1009564-1-sobin.thomas@intel.com>
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

This series introduces support for No Overcommit flags in the xe_uapi
and adds IGT tests to validate overcommit behaviour across different
VM modes.

Patch 1 updates the drm-uapi/xe flags in IGT to align with the
kernel changes that introduced NO_VM_OVERCOMMIT.

Patch 2 increase coverage to xe_vm tests by adding tests for
 - Over-commit test in fault and non fault mode
 - No-Over-Commit tests in fault mode


Sobin Thomas (2):
  drm-uapi/xe: Add support for No Overcommit flag
  tests/intel/xe_vm: Add support for overcommit tests

 include/drm-uapi/xe_drm.h |   2 +
 tests/intel/xe_vm.c       | 517 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 519 insertions(+)

-- 
2.52.0

