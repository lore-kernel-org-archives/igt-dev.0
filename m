Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEC5CCF9E0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 15:07:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804FA10EAB0;
	Fri, 24 Oct 2025 15:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5VlPhzq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A033F10EAB0
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761318472; x=1792854472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ia1B1TngEM7aBk3S0K6Hvgb8CuOvzyPqNs/6yac/+Gc=;
 b=E5VlPhzqed8hfoWafkGKQNhrcNuRTFVF1FCTpfOE/TeaEee4jpk54n7j
 9TIl6ArhypBiNaVPQemGJF3U1hL1uPhrZe40pTt6Zsbfwv53d27xCK0CX
 gwJDMHjRYx32xHnxHXYAoArw2za2xL9h8ODuNag3p0Hej0K+cxSA+8ERt
 2ZP9hAysh2P6ERqkRsopZcmMl7VDkTuaVa9HqhT6w7kZ44q7hkJ1QJt6O
 WVrh64weRfJXVLi1rjymRH1gjh4atvrlf6rogeILLqwI0aq+5QVc+K3yt
 xTBfn/0IS7CiMAOkuCu8fccJuOtCw84d38CSGxbIXS7vpqE21awuYAsZs Q==;
X-CSE-ConnectionGUID: xlp4m48bTka3wFMe88Wz6w==
X-CSE-MsgGUID: 9M75j0ZxSL+c/KCPZIJZgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88970171"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="88970171"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:07:51 -0700
X-CSE-ConnectionGUID: P63xqRC+SPiZlz6y0+3mcA==
X-CSE-MsgGUID: nCkhyHR/SO+yLGKeLEk0Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="183674339"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa010.jf.intel.com with ESMTP; 24 Oct 2025 08:07:49 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v8 2/3] tests/kms_concurrent: Fix for msg_queue failure
Date: Fri, 24 Oct 2025 20:24:10 +0530
Message-Id: <20251024145411.3500452-3-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024145411.3500452-1-s.sebinraj@intel.com>
References: <20251024145411.3500452-1-s.sebinraj@intel.com>
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

Adds supports to check if the system supports SYSVIPC
and if not found it skips the test. This removes test
failures with msg_queue creation for systems that
don't support SYSVIPC.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/kms_concurrent.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 4f16f8b89..3812290ba 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -396,7 +396,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_require(data.display.is_atomic);
 		igt_display_require_output(&data.display);
 		if (is_intel_device(data.drm_fd))
-			intel_allocator_multiprocess_start();
+			igt_require_f(intel_allocator_multiprocess_start(),
+				      "Allocator failure, no SYSV IPC\n");
 	}
 
 	run_tests_for_pipe(&data);
-- 
2.43.0

