Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C245FF43697
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 12:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7154D10E2A6;
	Fri, 17 Apr 2026 12:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXQm8KQO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C151510E2B9
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 12:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776429873; x=1807965873;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0aFwsg3afxrd5pObWmTitnp012qgUzf1PKAm7wA43+A=;
 b=mXQm8KQObbyiHuozl5dVI7GZ1+tYzl01UX3HjqFszwSxRlqzZBDDDE+j
 znhiqjmdt7BoF6BbD+q2+OqPf5ezAn3SPTZnIhUvGaInzCxUKQgAVR1r+
 mGjZOehfw9JJkC5ZPLcgEdI8cwEf3XYzLrWFuKDLt4758mkgnAE2LPMP6
 5KhkBqfseVG0wZ76864wmKU3kI2lCVcA689yPs1xG9s8xxMA+ytWNdFcc
 wssFtHsV/bq93HG3A0fCTJDYOT7UKeqgGR6JFWuS7Ie5Ho9eW1A2Y5nSz
 OJUZMjUMOnup3wyU7BKS4ukW82o/HycSxrSZXP1VoPx6/JCMS3Nx+3utN A==;
X-CSE-ConnectionGUID: quMluWoCRuK4R6zgAOIoUQ==
X-CSE-MsgGUID: Csg8PkyJS/qr7HO/LjBGiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88062637"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="88062637"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 05:44:33 -0700
X-CSE-ConnectionGUID: kNP+61MWTNqtVfXon5P/LQ==
X-CSE-MsgGUID: 6CWpqGOsSkqQdIIfnXvDMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="254248452"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.166])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 05:44:31 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 0/2] Add assert for pointers compare and fix armhf
 compilation
Date: Fri, 17 Apr 2026 14:44:14 +0200
Message-ID: <20260417124416.64731-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

Recent commits break amrhf compilation as could be seen on GitLab:

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/jobs/97703144

with errors:
../tests/intel/xe_madvise.c:201:35: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  201 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
      |                                   ^
../lib/igt_core.h:796:33: note: in definition of macro ‘igt_assert_cmpu64’
  796 |   uint64_t __n1 = (n1), __n2 = (n2); \
      |                                 ^~
../tests/intel/xe_madvise.c:201:2: note: in expansion of macro ‘igt_assert_eq_u64’
  201 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
      |  ^~~~~~~~~~~~~~~~~

This series introduces new macro for pointer comparision
and uses it for fixing compilation for armhf platform.

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Arvind Yadav <arvind.yadav@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  lib/igt_core: Create asserts for pointer comparision
  tests/intel/xe_madvise: Fix armhf compilation

 lib/igt_core.h           | 42 ++++++++++++++++++++++++++++++++++++++++
 tests/intel/xe_madvise.c |  4 ++--
 2 files changed, 44 insertions(+), 2 deletions(-)

-- 
2.53.0

