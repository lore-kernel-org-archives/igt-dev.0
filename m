Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9A4E6E803
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 10:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD05410E31A;
	Tue,  3 Feb 2026 10:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODmAf/1v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C353A10E31A
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 10:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770115840; x=1801651840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XqkWLwBHW2FYldj6dorr0MfNDVH8XsvcEKTFjw+Btqw=;
 b=ODmAf/1v0ITsoY6b3zSKVK/6ho9137VMXiOuF+og2BMxnF9pfvr4nR6h
 AFM6uJ1oOjBcRevvtOIfqxEj9a6iq37GDbL/gT2MCYQ2XPn7BAst76/6E
 tCGdAWxT5tTaPuvTRdAfrIle+tFoNVMBe0CZylR4SNbZE9coudPRsCjV+
 k6U7eUwpS7FnuBkkKG1viDRev9eutmpKzgRgvShLVzKi+bUZ9xH9p6Xog
 2lG7bJZNwfqBsE6pNYZYiBRBA+S78Ccu5Tsn4I9oYJCzlHvnbdTRavSs/
 ML5ekoQ4LJuzB5vlDv36cchuppqxKoMcBaGOofl9csQr5CBXR9qj90uqh w==;
X-CSE-ConnectionGUID: fnfb15FATCOA23EGWYgBmQ==
X-CSE-MsgGUID: 8nlGd9BrRou9BM7olhksEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82708531"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="82708531"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 02:50:40 -0800
X-CSE-ConnectionGUID: xJqrR/NnQV+c5yBe7mlaUw==
X-CSE-MsgGUID: 6XRemfj0Th+bS0JXOqT3mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209105186"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 02:50:36 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 2/2] HAX: Add toggle-gt-c6 test to fast feedback list
Date: Tue,  3 Feb 2026 16:19:38 +0530
Message-ID: <20260203104935.3522757-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203104935.3522757-4-sk.anirban@intel.com>
References: <20260203104935.3522757-4-sk.anirban@intel.com>
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

Add toggle-gt-c6 test to fast feedback list.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index acff025fa..3480cf537 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -163,6 +163,7 @@ igt@xe_mmap@cpu-caching
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
+igt@xe_pm_residency@toggle-gt-c6
 igt@xe_pm_residency@gt-c6-on-idle
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
-- 
2.43.0

