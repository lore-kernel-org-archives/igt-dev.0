Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE7DFF8864
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 21:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A52310E027;
	Mon, 27 Apr 2026 21:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cR6DCjyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA20710E027
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 21:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777324835; x=1808860835;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jdzyyWDAVZ2suPVrLshFFoK9YdlqaNXYA2pb+x/eayE=;
 b=cR6DCjyjiZ5PlfuZrPRAGGDcjsUnaN8JJktfDoMkXWxhTFCLa/Nj3xlI
 yicSiCguiy5LRES5uQKsN6ZzWJYKAiBxHuHAjDrifFbqvvKEViFF/N4Ux
 doi7V5dMiyyoxKSrxBlnOlHMHuGYGT3wdMqlanpOj15Ij5w2zMXKzVQkm
 /OqrJGV+pD8nghJngHsPlEZy53mrMnnhLOtePnJ/SfXNP+YwbloCoHNhl
 EXaA/WUT4/pn4d2RnffNxqn3dlBEuElA7Yc7nrEJ4gw4jr8iUdYaFqJAc
 6z22XK6bK5RWkQUSZpNTGIUMBBVBRFU12Stsw0mD5lQ6SP2wBXKN4wcsk g==;
X-CSE-ConnectionGUID: uwVHOHb9TPqTEChvyFMrYQ==
X-CSE-MsgGUID: eLplS5HdRN2IVcW+gbp5iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78104253"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78104253"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 14:20:35 -0700
X-CSE-ConnectionGUID: 4dpq4b6TSWyVt0xHkgy9Rg==
X-CSE-MsgGUID: pZJdSUiSQBWA9518RXXBsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="234034913"
Received: from dut4344arlh.fm.intel.com ([10.105.10.102])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 14:20:36 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, niranjana.vishwanathapura@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t 0/4] Add test coverage for multi queue reset
Date: Mon, 27 Apr 2026 21:20:29 +0000
Message-ID: <20260427212034.18486-1-stuart.summers@intel.com>
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

Combine series [1] and [2] for final CI testing before
merge.

For [2], also adjust the author to me given the original
author is no longer available here as well as the fact that
the original patch is now quite different in this latest
iteration.

[1] also has a review already. Including that here since it
also relates to the multi queue reset - removing the unused
CANCEL parameter from the CM cases. This just more clearly
indicates why those flags aren't implemented for multi-queue
as well given they aren't used for non-multi-queue either.

[1]: https://patchwork.freedesktop.org/patch/716611/
[2]: https://patchwork.freedesktop.org/series/164653/

Stuart Summers (4):
  tests/intel/xe_exec_reset: Remove CANCEL logic for CM variants
  tests/intel/xe_exec_reset: Add a comment about return for syncobj wait
  tests/intel/xe_exec_reset: Add checks for hanging queue wait_ufence
    return
  tests/intel/xe_exec_reset: Add multi queue subtests

 lib/xe/xe_legacy.c          |  86 +++++++++++---
 tests/intel/xe_exec_reset.c | 223 ++++++++++++++++++++++++++++++++++--
 2 files changed, 284 insertions(+), 25 deletions(-)

-- 
2.43.0

