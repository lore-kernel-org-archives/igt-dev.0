Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2D7FED2C4
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 03:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B437110E106;
	Thu, 12 Mar 2026 03:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kw0Occr8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468C510E106
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 03:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773287234; x=1804823234;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k9CbTXXdL4rUo5l9B8V79cypCCfE/xLUa5ugR7hi3PE=;
 b=Kw0Occr8BB2FLK+z4TU73fp/UFW5ftxhiC2ztwXBx9z3KEUrJbqtptwD
 rI+zMplBQdJISwwzD7L8cjUkolPaK1WThx8m8bqK1l5UVychvnKGqtWy5
 AblaBQjcGCGMChfjmrdUDp3XSN4l4W8xhJTjE3SCgY0KoFQDAMTaSb4W2
 ICA7ZBKVL0dCIcTLK9nBUZmGbls5IfE+o7mhMG2by2FUhzmJ06YjiZv+a
 5lwQfN8NzhkHh2fJ1iBIlAtBsnErTPdsWgyN5N8yFgF74WSnOS/N1N9sU
 UXMps9mCp/oWRyF5yB7g8PuYIv4x0v8B3VhDAm93cgEezsGNVX/pBsC+3 g==;
X-CSE-ConnectionGUID: 5Fteq/96SHG1JiXJAa//Yw==
X-CSE-MsgGUID: FqPu3PpeSZqaDTnJKhQCEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="91749213"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="91749213"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 20:47:13 -0700
X-CSE-ConnectionGUID: l3peN2UDSo2HUW1RJj+LBw==
X-CSE-MsgGUID: 2goX++lbSqGuE6DRX1933g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="219952399"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.11])
 by orviesa010.jf.intel.com with ESMTP; 11 Mar 2026 20:47:12 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v2 0/2] Unify Batch Buffer Alignment and Introduce
 Aligned Buffer Mapping
Date: Thu, 12 Mar 2026 03:47:09 +0000
Message-Id: <20260312034711.637781-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nishit Sharma <nishit.sharma@intel.com>

This patch series refactors the SVM userptr copy test and batch buffer
setup in test suite to use a new aligned buffer mapping API.

The first patch introduces an interface for mapping buffer objects with
platform-required alignment, improving cross-platform compatibility and
simplifying batch buffer setup.

The second patch updates the SVM userptr copy test to leverage this API,
unifying batch buffer alignment logic and eliminating platform-specific
address assignment and conditional code paths.

ver2:
- Incorporated review comments (Kamil, Thomas Hellstrom)

Nishit Sharma (2):
  lib/xe: Introduce aligned buffer mapping
  tests/intel/xe_svm_usrptr_madvise: Unify batch buffer alignment

 lib/xe/xe_ioctl.c                   | 42 +++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h                   |  1 +
 tests/intel/xe_svm_usrptr_madvise.c | 11 ++++----
 3 files changed, 49 insertions(+), 5 deletions(-)

-- 
2.34.1

