Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA29D63920
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 10:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8500310E6DB;
	Wed, 20 Nov 2024 10:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NU2KY0A4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAAF10E6DB
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 10:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732098916; x=1763634916;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PFlxJJzWXdsJUPLsMtfeT7m4AcWKyn4UtiAvrFxrwv4=;
 b=NU2KY0A4o/G2BL0dxWXFsol/ZZ2iuARDR8Sbk8QYUbbfso4vE6h6SOl1
 mOpftzYVCXEfqNOf33DoQ3520Xz5x4DoQR5QabViaIlLpHOczbRzd3Efy
 F4ziuFDmCg0qwTXW2DyRf9dy3M5gVTex0n8ig2AA7hHjLjYLg5a1Ij+kf
 c9O42LVjYGPahRUjHjn9FRy9gnM71E9mDGjcAxO0Wkw4DPr2RoZ6d+Vlp
 JqrrFwKCn4Y5cTdoHypQNP9VZ59i/ZcqeirDEGiNFYXuvs9KTauR91kSx
 3UZoykCZXcQjW6JomvzyV0HLYiUEcntYEJa9zN8VzGljCfd/BlyGzzHOY g==;
X-CSE-ConnectionGUID: apXccTvYQQK36w01zBNAOA==
X-CSE-MsgGUID: CT5GnriVQJyt/RYCaFRqIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="36056298"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="36056298"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 02:35:15 -0800
X-CSE-ConnectionGUID: FucE31w1TPe5ynPQqgz2xg==
X-CSE-MsgGUID: MKc3sB42QHSzHnIQ/EDE/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="127410319"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.31])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 02:35:14 -0800
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 0/2] tests/syncobj_wait: Update
 invalid-wait-zero-handles test
Date: Wed, 20 Nov 2024 11:35:05 +0100
Message-ID: <20241120103507.7653-1-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

The behavior of DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT has been changed in [1]
to accept empty lists of syncobj handles, but the
invalid-wait-zero-handles test has not been updated to mirror this
change. Fix the assert to check against 0 instead of -EINVAL, and rename
the test to wait-zero-handles as this is no longer an invalid scenario.

This change mirrors [2] for the syncobj_wait test.

[1] https://patchwork.freedesktop.org/patch/554042/
[2] https://patchwork.freedesktop.org/patch/618483/

v2:
 - Update blocklist for XE in the HAX patch to make the test actually
   run.

Krzysztof Niemiec (2):
  HAX/DO_NOT_MERGE: Add wait-zero-handles to fast feedback list
  tests/syncobj_wait: Update invalid-wait-zero-handles test

 tests/intel-ci/fast-feedback.testlist    | 2 ++
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 tests/intel-ci/xe.blocklist.txt          | 1 -
 tests/syncobj_wait.c                     | 8 ++++----
 4 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.45.2

