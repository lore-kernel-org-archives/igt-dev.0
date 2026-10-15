Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC2ACC6B34
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 06:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B09410E9F5;
	Thu, 15 Oct 2026 06:25:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBEF10E9F5
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 06:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792045478; x=1823581478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A3m+U+LioOjFSeT1dDf6rc1Q0P+4pyB/mTW+9jWxb+k=;
 b=g0J7nYQBwztvJoNHIlplnD/pa9IsvkhljI4TwOAPJP0t44QWuzDoAfjh
 HBzUlQ+jx2l3qAYr0VbOlAbBdwkEqWcLooQ8m0H9LUlxMoTJ4N88o+jHp
 60k+BA6nwVxelJNNkFKsRtTQ6cjazaX3nnuLqAQvFz4GAj8dxdcRsIi8T
 71DIILUAXPioPcACtvJhyAAEmRv0QpLNr5qdQeZ4bEh9uGhJmkA8XTz9v
 kCDuG4ZRqy14DDSzXf7l1hw626uIh4fjOu86FvjPd/0ht0H+tKnCYSY5s
 raAEt2O56LyQZeUnf6v+pRd4h0uZ45H+Wg7XJdmpod/qe7SgMZqmmWZmR w==;
X-CSE-ConnectionGUID: t89T1xAaRYO1f2Q8TO6HFQ==
X-CSE-MsgGUID: qchucINQT+mIi4oEA4w0/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="680118"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="680118"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 23:24:37 -0700
X-CSE-ConnectionGUID: K2eFUTT9QyGbyIFLtZhfvw==
X-CSE-MsgGUID: nHUJzo9UTby6d5Srfa3vQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1582589"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 23:24:35 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 0/2] lib/igt_hdcp: extract shared HDCP helpers from
 kms_content_protection
Date: Thu, 15 Oct 2026 11:54:03 +0530
Message-ID: <20261015062411.268693-1-sowmiya.s@intel.com>
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

tests/kms_content_protection.c duplicates nearly every HDCP primitive
(enable, disable, Link Integrity Check wait, sink capability probing,
force-HDCP1.4 toggling, DP-MST topology grouping, etc.) between its
single-output and DP-MST code paths. This series pulls that mechanism
out into a new shared library, lib/igt_hdcp.{c,h}, so it isn't
maintained as two near-identical copies, and so it's available to
future HDCP-related tests (e.g. a concurrency test exercising HDCP
alongside other dependent modules) instead of being re-implemented
from scratch.

The functions are parametrized over output arrays (count == 1 for the
single-output case, count == N for DP-MST) so both code paths share
the exact same primitives rather than near-duplicate copies.
Test-specific policy - retry loops, FB/plane handling, SRM firmware
writing, uevent-vs-poll waiting, and the subtest tables - stays in the
test file; only the HDCP mechanism itself moves to the library.

Patch 1 adds the library. It's purely additive and not used by any
test yet, so it doesn't change behavior on its own.

Patch 2 switches kms_content_protection.c over to the new library,
removing its duplicated local helpers. Each call site's original
behavior is preserved exactly, including places where the
single-output and DP-MST paths used to differ subtly (LIC retry
tolerance, which output's name appears in a failure message, and
which outputs get actively polled vs. spot-checked during disable).

Sowmiya S (2):
  lib/igt_hdcp: add shared HDCP helper library
  tests/kms_content_protection: use shared igt_hdcp library

 lib/igt_hdcp.c                 | 423 +++++++++++++++++++++++++++++++
 lib/igt_hdcp.h                 |  67 +++++
 lib/meson.build                |   1 +
 tests/kms_content_protection.c | 444 +++++++--------------------------
 4 files changed, 586 insertions(+), 349 deletions(-)
 create mode 100644 lib/igt_hdcp.c
 create mode 100644 lib/igt_hdcp.h

-- 
2.43.0

