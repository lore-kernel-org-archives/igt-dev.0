Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EBFCDB471
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 20:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8269710EC7D;
	Tue, 23 Jun 2026 20:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eM6z7ZEN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A196610EC7D
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 20:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782244941; x=1813780941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JRbwjqeSeu5Lj6uMv72C+nHckWi7mkgWu6pPpd3CRBI=;
 b=eM6z7ZENppGpgjuUoMj97FTCc6FIsWaJfwNigZ/+WVJL57P4PQVBMlga
 wF5y7s4JNSSUPaw0U+bQVGmn0TkdrHVcS6PKbZGEWBTewosbGsG6Da/fo
 HN+u5N5jMjC6PxbHC50jkHedZwrsFXGIJ5ALJmrItFqAGdBfOKuKYljGj
 QOb2vBJEt2ghyx1WiKGwbYGPyjhB8DT1PB4OET2zhu8wQVkjCV/+WW+dD
 xzgUnxcZlZn2JmGg0T5o9KgL3D5rKbbe6iReZwQe2z4XqibaBduFL06TN
 ap67/7qD0KgF8531P9SnMbkQfamNCuGAxXmobeYHW0Y44Qq2dNcNd8cTx A==;
X-CSE-ConnectionGUID: 5TmkKETeT66hbM4QiQaXXw==
X-CSE-MsgGUID: dZtC3T3/RjqIIcqAH5UnNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="105792472"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="105792472"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 13:02:21 -0700
X-CSE-ConnectionGUID: HRQ+urtdTEKvqQE9VWj87w==
X-CSE-MsgGUID: DvSJ/RccScuqP+000drNnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="254700667"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.125])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 13:02:17 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel-ci: Remove dmabuf tests from i915 fast
 feedback
Date: Tue, 23 Jun 2026 22:01:52 +0200
Message-ID: <20260623200152.12996-4-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260623200152.12996-1-krzysztof.niemiec@intel.com>
References: <20260623200152.12996-1-krzysztof.niemiec@intel.com>
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

