Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD9CCA1009
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 12:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADF810E7F6;
	Wed,  3 Sep 2025 12:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgd4rVAl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CDD10E7F6
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 12:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756903520; x=1788439520;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/WSAGmu6DZ5VAbS0iLGsqVKFg5arTGUYq/p75544eaQ=;
 b=jgd4rVAlKAt2zJJgMGHWs+KVC0+8NGL0BQwda031i5LU3BZddzjCrp+p
 MPTgHKbSnOaBvWgWDwtNUNIKAe5hKQsCadXsk1+zQsntzvjQHIwGMnQHH
 HOpI4qVM1w+KcpxH0GFnZgGMc5KtR9mx8IGNu7H8noYfLShiu6R+DXmen
 DRXCO/0phywjfJEknRpcixJSB0sBlKihR76jlopO2y+5+0CKT1LmA1T6j
 KfjToE4hwxNhduwC0goAA4WgbGTMh+eRfbHN5WACmAK2rMwK8sSJS/W1E
 eArYYLVZQqNoucr8ZEYVdVnuCqUkmRyqj+qLpq9abLVBkRhBVYoXM6UzK g==;
X-CSE-ConnectionGUID: iTSJ6OVsRK+akiG+6kOghQ==
X-CSE-MsgGUID: Im7M0j+3RCy1dAmFSVVNrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="63032298"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; d="scan'208";a="63032298"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 05:45:20 -0700
X-CSE-ConnectionGUID: 6TqyhqlAQo+URaB7GvcxIQ==
X-CSE-MsgGUID: EeFNy+liTB+klJdpxKuAdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; d="scan'208";a="171143672"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 05:45:17 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 0/2] tests/intel/xe_survivability: Add new xe runtime
 survivability test
Date: Wed,  3 Sep 2025 18:14:52 +0530
Message-ID: <20250903124455.3616608-4-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add i2c adapter presence check in survivability mode to ensure
the Add-In Management Controller (AMC) can receive firmware updates
when the device is in survivability mode.

Check survivability mode to validate that CSC error injection correctly
triggers the survivability state transition.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Sk Anirban (2):
  tests/intel/xe_survivability: Add new xe_survivability test for i2c
    adapter
  tests/intel/xe_wedged: Add new test csc-wedged

 tests/intel/xe_survivability.c | 152 +++++++++++++++++++++++++++++++++
 tests/intel/xe_wedged.c        |  79 +++++++++++++++++
 tests/meson.build              |   1 +
 3 files changed, 232 insertions(+)
 create mode 100644 tests/intel/xe_survivability.c

-- 
2.43.0

