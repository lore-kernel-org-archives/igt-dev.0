Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712F9FCC9B1
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 06:07:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2A810E31C;
	Wed, 11 Mar 2026 06:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emiZ9lCc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA3610E31C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 06:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773209252; x=1804745252;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5GOAL4RBnJodBL7ZDDt5/MdhH3olDYrBXKDGLXc4VDo=;
 b=emiZ9lCcSH+8+TxY04aQ6Eau9jxx/7Vx/7LgLJEtnAfvfcO+SofRAC2p
 iPTHXBTrVFD1Mr11l5sR3s6qFtYgGmiNos5PBFJelz2DFKx3V83aCkgkD
 2ezeh7xl6ZI69HLlwGyTvFnmQuH1gZYb8L8mEdqGqjPzA+1gOqAGsLeJl
 4xEMLXfQq9BDaNRQkkF8otQq43wcWLACExUkAeIM9+Nr9QfsV5YOMs3Lz
 ebL099ZVs0NnNkCTULdFcfcbfuBeNKOkDDeLxWWbT2SCh831ggK9oZCgh
 yWHgws98J90dAMNg37iFwrko4p7tweh70n65zjxkKQR7rm1ADGT/3paBP w==;
X-CSE-ConnectionGUID: yyA2LqXLQA2CXAEFfVGUnA==
X-CSE-MsgGUID: KeePHYqlTum/IVvQGovPkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74387751"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74387751"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:07:32 -0700
X-CSE-ConnectionGUID: rcWMs9rTQWijtZ6f9G7tug==
X-CSE-MsgGUID: EPuv9Io8SD+imw1h6ynN+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="216649879"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:07:32 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v4 i-g-t 0/2] test/intel/xe_vm: Add overcommit and no‑overcommit handling tests
Date: Wed, 11 Mar 2026 06:06:56 +0000
Message-ID: <20260311060701.2133206-1-sobin.thomas@intel.com>
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

IGT tests to validate overcommit behaviour across different VM modes.

Patch 1 sync the drm-uapi/xe header with kernel.

Patch 2 increase coverage to xe_vm tests by adding tests for
 - Over-commit test in fault and non fault mode
 - No-Over-Commit tests in fault mode


Sobin Thomas (2):
  drm-uapi/xe: sync with kernel header
  tests/intel/xe_vm: Add support for overcommit tests

 include/drm-uapi/xe_drm.h |  22 +-
 tests/intel/xe_vm.c       | 483 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 493 insertions(+), 12 deletions(-)

-- 
2.52.0

