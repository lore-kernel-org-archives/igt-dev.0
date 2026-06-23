Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155C5CDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 20:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DE610EC7D;
	Tue, 23 Jun 2026 20:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cy2thoFB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AED210EC7D
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 20:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782244926; x=1813780926;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+QzNc/0EtWQTXaldJNZsO0Q7QqkuK25ZfwCSiaBtUbw=;
 b=Cy2thoFBic3ezI1dygeLuvnXsKUJptOMUbYx+/OXTtgWGuDyVou5yn9+
 lWZQBQVvuVHTZ9XSA/6xk9jBWYaLBx64hKgjQGLGnqruoxQFK2+Mqa+SB
 ldc79nlDCl/l7n1HNhm7wjPEG2e9cNT1cLtN5XpffW7MIregidVvZj2aY
 yGlfIZUbaTSdsYRIzW8cEdLcjSC77p5t4cJmH8Vi/17iUJ6nP/CIiN0ZR
 LTo2Cdd4BhzUUf7sIwa16GXo/t+5Ypy8GXA/EMXRHto5/sHUUecQfTTab
 RaddKC3dLsmNsMBi50ciifBCDjNv95fMx5t4AHi65U1Z+CnQ8yWh6t9vS g==;
X-CSE-ConnectionGUID: QW0dhl4TQJWI48J/u9z/aw==
X-CSE-MsgGUID: qW8jB9yaQaKai4MSIK4P5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="105792444"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="105792444"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 13:02:03 -0700
X-CSE-ConnectionGUID: jqNmo82hRlWlCTeZrNY0Sw==
X-CSE-MsgGUID: lQLbmEFbSaCenP1+P1pmFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="254700520"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.125])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 13:01:59 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 0/3] Treat new/moved KUnit tests as such
Date: Tue, 23 Jun 2026 22:01:49 +0200
Message-ID: <20260623200152.12996-1-krzysztof.niemiec@intel.com>
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

Krzysztof Niemiec (3):
  tests/dmabuf: Port dmabuf tests to KUnit
  tests/gpu_buddy: Update buddy allocator tests
  tests/intel-ci: Remove dmabuf tests from i915 fast feedback

 tests/dmabuf.c                             | 35 ++++++++++++----------
 tests/{drm_buddy.c => gpu_buddy.c}         |  4 +--
 tests/intel-ci/i915.fast-feedback.testlist |  1 -
 tests/meson.build                          |  2 +-
 4 files changed, 22 insertions(+), 20 deletions(-)
 rename tests/{drm_buddy.c => gpu_buddy.c} (51%)

-- 
2.45.2

