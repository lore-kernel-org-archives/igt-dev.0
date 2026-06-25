Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F38CDE009
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 19:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174C110E267;
	Thu, 25 Jun 2026 19:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOC7SysI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBB710E260
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782415749; x=1813951749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u17G2HtngZ+aJG/yC8beDZiCgAK7QIAH+tFC+9Oi5Xc=;
 b=KOC7SysItc8tGGpTzpNvYNvOddHpm4HH59/rMK6DJJr85uFGvcFquUrv
 L4L2FXyFUmNEVKeOCL0sK4CIqo9X559tgodNleVODEzs7TIem2RVeXbUO
 rN1AIBILQLe0S+DKyJuztmtoq8bg1XErOgrOmmWNuFc/XFo5JEy+jN6rC
 Zj0PFB9noGeQSERBrdctjUskUnzwN44mtchnrec1jUWuRpCfmulA4aSXB
 yRUJGwDehSpSonC/O43OS8/rdngMU2BZEYldywq368v/QXV5pMFg4o4eh
 xlig0mAZQDbJR7b4XgSxrIpsc5GjGKto3wmJWCBtVrRD247904/VjF+Cc g==;
X-CSE-ConnectionGUID: oiW9V1W8SvSJqhI+1iN7mA==
X-CSE-MsgGUID: l3d0ZI5JRrKH2px8GU9nHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93859242"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="93859242"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:29:09 -0700
X-CSE-ConnectionGUID: 9xSR3PEzRrWWTkthgP/jaA==
X-CSE-MsgGUID: DwZYXnYJT/aVoPrHfW6iOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="252912610"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.210])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:29:06 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 1/3] tests/intel-ci: Remove dmabuf tests from i915
 fast feedback
Date: Thu, 25 Jun 2026 21:28:48 +0200
Message-ID: <20260625192850.56004-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260625192850.56004-1-krzysztof.niemiec@intel.com>
References: <20260625192850.56004-1-krzysztof.niemiec@intel.com>
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

Intel CI runs KUnit tests separately from regular tests. Remove the
dmabuf tests from the i915 fast feedback testlist, as they are now
KUnit tests, instead of selftests.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tests/intel-ci/i915.fast-feedback.testlist | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel-ci/i915.fast-feedback.testlist b/tests/intel-ci/i915.fast-feedback.testlist
index 2799bbaa5..5b33f29e4 100644
--- a/tests/intel-ci/i915.fast-feedback.testlist
+++ b/tests/intel-ci/i915.fast-feedback.testlist
@@ -168,4 +168,3 @@ igt@i915_pm_rpm@module-reload
 
 # Kernel selftests
 igt@i915_selftest@live
-igt@dmabuf@all-tests
-- 
2.45.2

