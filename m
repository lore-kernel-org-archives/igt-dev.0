Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0022FA1FC5
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 15:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8334910E032;
	Wed, 22 Apr 2026 15:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8RX64jP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742B510E032
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 15:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776872670; x=1808408670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M7bR2kADBF7cWKa+jLwpYdKXtO2HZ76u3y2/kOsJgLA=;
 b=J8RX64jPLnlntZJ+ZSjx5dFFUCNaBmxx3C9KGAZ7kFnubqByYUMV5T6B
 mc/qwrH7i7mRbA5XSY+1lOoUygjyAstAFCloGzolDfA9npIu3SvCOlC+I
 koGe93mxc+pJImIHP50b4zsCF9I5QV8FBe9ihyTmoV53F3QvFZuhAGJXP
 JuO5tEsdfpta/KTBetgYOeTobTL1yh7fH6TxGyNg8+8XTcM82oZdJHXpN
 f0cVGBWLijDJFWrmM7JCXTUK4jgOs5bzbJKxXYDqRftHoFBgmmmn/u2GM
 qp8kjqiD3s+yt3EwUONUUrDtENI5+YNfbOqmCtkVJNvOhNibSXJ40zaYG Q==;
X-CSE-ConnectionGUID: QaG3FnbXSNKYfuSb57jJ6g==
X-CSE-MsgGUID: w/D5oM34RzGwn6hFhNLrVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="76861088"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="76861088"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:44:30 -0700
X-CSE-ConnectionGUID: D0wzKVJ0Q3y9L1zW6B0xbA==
X-CSE-MsgGUID: /q6WVp5oRhirgjqqy/rwBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="234174327"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:44:28 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v2 0/5] Various fixes for prime_udl test
Date: Wed, 22 Apr 2026 17:44:18 +0200
Message-ID: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

  Refactor this test into proper opening fixup, then tests and
last closing fixup. Also fix few error checks and make sure
opened device is handled by i915 driver as there are now also
one handled by Xe.
  Move this test into intel/ folder and rename it.

v2: fix igt_simple_main() -> igt_main() in 2nd patch. (Kamil)
  Rename test and add documentation so it will build. (Karthik)

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Kamil Konieczny (5):
  tests/prime_udl: Fix opening
  tests/prime_udl: Create subtests
  tests/prime_udl: Fix error handling
  tests/prime_udl: Fix i915 device opening
  tests/prime_udl: Rename into i915_prime_udl

 tests/{prime_udl.c => intel/i915_prime_udl.c} | 57 ++++++++++++++-----
 tests/meson.build                             |  2 +-
 2 files changed, 43 insertions(+), 16 deletions(-)
 rename tests/{prime_udl.c => intel/i915_prime_udl.c} (70%)

-- 
2.54.0

