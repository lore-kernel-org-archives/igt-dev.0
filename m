Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5D7C021B8
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 18:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F96C10E052;
	Tue,  4 Mar 2025 18:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJekXjI6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AB910E052
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 18:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741114616; x=1772650616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IUBCjAK+AaoAsnQ+O+HYuUi3S24zqH6w4RfbuH+fVvk=;
 b=eJekXjI6qI8qPzAC8Lj+msIQn/L2geOYEq5gvkJzlx3xW0W3GbesxD2k
 5dxhYMZjIUVEpHm0Jcvldt8nxkvwkeD4dVCp9bUhf//6FanCMUbS2t48S
 jvwSC7llUsfb7YtA80CSFJlKj3VvHq9r7G6aoCb8M+b2bGFzY6xgk2BYi
 I/AKaLF9uGFXtsRLvXlZTo8fSxgiuYGDPvaczQm2FEQU8ogq9qmqNCVnL
 S4cTiASz2iEyCDw8vAOGpb9Okqh3FNIg60bzaRZU63Y7Zfy6VF7JD8o+h
 0MCT/wE/Mc4WlWLgn2qXnY6usa/BU4Z7c1IJnOia7ighzXL8ErOanSJ8q Q==;
X-CSE-ConnectionGUID: IiZMROS2S5aZkB218cHNFg==
X-CSE-MsgGUID: +remj31QQEqtWTDIJ+Wi5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53453064"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="53453064"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 10:56:56 -0800
X-CSE-ConnectionGUID: wW0z1fjkSySub9FR630HEw==
X-CSE-MsgGUID: 40ND2ITFTdOwXYpnG7OG1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="118284180"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.17.221])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 10:56:54 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 0/2] tests/xe_drm_fdinfo: Check prerequisites for
 utilization tests
Date: Tue,  4 Mar 2025 19:56:38 +0100
Message-Id: <20250304185640.1333849-1-marcin.bernatowicz@linux.intel.com>
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

The first patch groups all utilization-related subtests under an
igt_subtest_group and adds a fixture to check for utilization data
availability before running them.

The second patch replaces igt_require with igt_assert in
basic_engine_utilization ensuring the test fails explicitly
when utilization data is missing.

Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Marcin Bernatowicz (2):
  tests/intel/xe_drm_fdinfo: Group utilization tests and skip when no
    utilization data
  tests/intel/xe_drm_fdinfo: Fail basic_engine_utilization if no
    utilization data

 tests/intel/xe_drm_fdinfo.c | 124 ++++++++++++++++++++----------------
 1 file changed, 68 insertions(+), 56 deletions(-)

-- 
2.31.1

