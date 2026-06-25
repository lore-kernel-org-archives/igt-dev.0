Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EB1CDE000
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 19:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB55A10E260;
	Thu, 25 Jun 2026 19:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXtT1bku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AEB10E260
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 19:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782415740; x=1813951740;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sboU9l/g2hBf7gYZe4YcyKK2canPx2Q8S2LnirLCW34=;
 b=DXtT1bkujc+HXISaLotOGnv30ZjMbhzRFAiPbHschDz5RavWUknbjV6e
 fuJmlA29YAEY1Cb+BCiqamAGh3OPmK4WtHCLzYmqTOqreyGQb88exfVgx
 P/Qnf9e0aaoK6Oo/rKLui6gc301SIjWdkYsohj1lZ3D17PMNIApTU/hRa
 Vr2hxJi3IqSkCWQeBYx6FBCP4SDiIl/87ZiJoosSWEKtmR7e5nYbWU5YN
 xentAw/9l4ybyFqWYzeLyn+OZQuf+D68t7mNroc3tebjG3P050+jOQPYT
 ez1SePu0PyNn5atLsC9lyKTaGRgoLbEELdT4YWyUUWEaiKDJUuONcwi7q w==;
X-CSE-ConnectionGUID: ZpsS4vbHTgGZTw6BEPvRjw==
X-CSE-MsgGUID: A33PhgObT/GQahlUFpJaxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93859235"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="93859235"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:29:00 -0700
X-CSE-ConnectionGUID: mOC8iMGZS1eUAIKbJzEoQA==
X-CSE-MsgGUID: TTGlYBF6SmGvb8RL6FPGxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="252912522"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.210])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:28:57 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 0/3] Treat new/moved KUnit tests as such
Date: Thu, 25 Jun 2026 21:28:47 +0200
Message-ID: <20260625192850.56004-1-krzysztof.niemiec@intel.com>
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

There have been changes to two testsuites in the kernel, namely:

- dmabuf selftests have become KUnit tests,
- the DRM buddy allocator has been moved a level up and renamed to the
  GPU buddy allocator, and the corresponding tests followed.

This series handles both of these changes to make IGT reflect them.

v2:
 - Reordered the patches, so the fast feedback removal patch goes first
   (Kamil)
 - Don't explicitly describe the meson change in the gpu_buddy patch, as
   it's expected anyway (Kamil)
 - Use more explicit title for the gpu_buddy patch (Kamil)

Krzysztof Niemiec (3):
  tests/intel-ci: Remove dmabuf tests from i915 fast feedback
  tests/dmabuf: Port dmabuf tests to KUnit
  tests/gpu_buddy: Rename the KUnit buddy allocator test

 tests/dmabuf.c                             | 35 ++++++++++++----------
 tests/{drm_buddy.c => gpu_buddy.c}         |  4 +--
 tests/intel-ci/i915.fast-feedback.testlist |  1 -
 tests/meson.build                          |  2 +-
 4 files changed, 22 insertions(+), 20 deletions(-)
 rename tests/{drm_buddy.c => gpu_buddy.c} (51%)

-- 
2.45.2

