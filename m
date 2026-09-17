Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A217C88E72
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 14:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1EE10E02B;
	Thu, 17 Sep 2026 14:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yputp0jo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F24C10E02B
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 14:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789656824; x=1821192824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mtODiJapAyfTpdPfm3erhWj3h8IcqxESgDMGooevfWY=;
 b=Yputp0joWnKQaNl7pjH5P6VW9Ti5wXOWdAszauMsWp8CscItnN1+mCmy
 0WXWchHalz1p6CFd+8sPwi/BVHjoHDqXlbAgQXeDBsp/hYK0cV3Z197Ke
 lEs5k+md+IOtt/cO18Z8a9TAi3uWsxTQxkDVVwSb8n258eJGpXYho++/D
 tRSjboxSxq5812waFjmT71w4GTvo0++IaMWkurbOHcuCfXVXd4lz2gk+Z
 1UzZ9pRfajw0+rX4Nmu5zmonojB21zLelPGUgZ/6lcezgkeEaEHJKoDAf
 p/dAx4uQMAuy/sxArFX1MeBpFZ8QZoF92faJ/s/KhdtuWy5EztAkD45Yk A==;
X-CSE-ConnectionGUID: Tvd4DgTVRduVHvjBYAoYlQ==
X-CSE-MsgGUID: 0aMYto52RymO2+7C4Vt7Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89221047"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89221047"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 07:53:44 -0700
X-CSE-ConnectionGUID: zjqJxylRQH+quOUjSEWofg==
X-CSE-MsgGUID: 6JZTDA6oQXmL7ixhQ5e7Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270161076"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.74])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:53:43 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 2/2] HAX DO_NOT_MERGE: print path for opened data file
Date: Thu, 17 Sep 2026 16:53:31 +0200
Message-ID: <20260917145331.78274-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917145331.78274-1-kamil.konieczny@linux.intel.com>
References: <20260917145331.78274-1-kamil.konieczny@linux.intel.com>
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

When open of a data file succeeds, print its path.
Also add kms_3d@basic to fast-feedback testlist to make sure
this test runs on all configurations.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c                             | 2 ++
 tests/intel-ci/i915.fast-feedback.testlist | 1 +
 tests/intel-ci/xe.fast-feedback.testlist   | 1 +
 3 files changed, 4 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 9937cb559..ded56a0b6 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3417,6 +3417,8 @@ static FILE *__igt_fopen_data_file(const char *dir, const char *rel, const char
 
 	snprintf(path, ARRAY_SIZE(path), "%s/%s/%s", dir, rel, filename);
 	fp = fopen(path, "r");
+	if (fp)
+		igt_info("Opened data file: %s\n", path);
 
 	return fp;
 }
diff --git a/tests/intel-ci/i915.fast-feedback.testlist b/tests/intel-ci/i915.fast-feedback.testlist
index 5b33f29e4..961f3a834 100644
--- a/tests/intel-ci/i915.fast-feedback.testlist
+++ b/tests/intel-ci/i915.fast-feedback.testlist
@@ -55,6 +55,7 @@ igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
 igt@i915_pciid
 igt@intel_hwmon
+igt@kms_3d@basic
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index 59d1cff2e..64ca68594 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -9,6 +9,7 @@ igt@fbdev@write
 
 igt@core_debugfs@read-all-entries
 igt@core_sysfs@read-all-entries
+igt@kms_3d@basic
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-modifier-no-flag
-- 
2.55.0

