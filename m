Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE1CCCA476
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 07:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB8810EB44;
	Fri, 10 Oct 2025 07:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CrU/HLGE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF52B10EB44
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 07:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760082114; x=1791618114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m5N3S3Ixe0MffR8xXsbAOgXjhLifXGvEKmdzaVQBZsU=;
 b=CrU/HLGEdfrg8omhRbToDe0+yil39Zo8gZBlWTOv04dSlPCYW+D+Jf7f
 TOUsWkEvCgJumS7y/S5nmoD67BHAfEG/BticAiibX1D+n4Dj5arCYl+NW
 wS329RYl3uM8yS42jHNwL4AsSXDWUvk0IsQTVvUWhmRdZrQAXXdzWVA+y
 uv3NYkhLHejtYp68lcptpaXiYbT8nDUTU8hJ+dGX0sb+fMgQ9SmxjI73m
 GK+rzcGEOFlgSnEkyLdJrkhhYISfs1eikR1fFjlLbDP7wzN715bqH8sB3
 17OsZOkm3R8NX9ims70lMqDj1B436jX44+niL8J80Vk+wZW3evAUHE2VR A==;
X-CSE-ConnectionGUID: gLd8sZyBSom+mMKS4dFNtA==
X-CSE-MsgGUID: pgK4YE2VSwiqij1Najc5tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62327515"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62327515"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 00:41:54 -0700
X-CSE-ConnectionGUID: CFxhmljPS66JsJyPOfaPnA==
X-CSE-MsgGUID: rTtbgn7TSlGvrx+4IvfQvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="181687406"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa010.fm.intel.com with ESMTP; 10 Oct 2025 00:41:52 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v5 2/2] tests/kms_concurrent: Fix for msg_queue failure
Date: Fri, 10 Oct 2025 13:00:09 +0530
Message-Id: <20251010073009.821335-3-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010073009.821335-1-s.sebinraj@intel.com>
References: <20251010073009.821335-1-s.sebinraj@intel.com>
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

Adds supports to check if the system supports SYSVIPC
and if not found it skips the test. This removes test
failures with msg_queue creation for systems that
don't support SYSVIPC.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 tests/kms_concurrent.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 4f16f8b89..35e7b4328 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -396,7 +396,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_require(data.display.is_atomic);
 		igt_display_require_output(&data.display);
 		if (is_intel_device(data.drm_fd))
-			intel_allocator_multiprocess_start();
+			igt_require_f(!intel_allocator_multiprocess_start(),
+						"Allocator failure, no SYSV IPC\n");
 	}
 
 	run_tests_for_pipe(&data);
-- 
2.43.0

