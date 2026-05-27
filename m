Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BE0CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 20:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15C410EA10;
	Wed, 27 May 2026 20:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDUv2YAg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0437A10EA0F
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 20:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779915427; x=1811451427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lJ28J7ftcWUV+Li/d+XNvUpYGMYA9VwSh7XXbAdmzHU=;
 b=NDUv2YAgIWWtPOm97s8+aZZOPRSfE5vd9UnmLxqQPzFcUNjiMFYAJsq0
 lzf1nsOeA+dOYC7QYvmSaN4yWGTMsJvttA+XTwjk3F8gEtzMMrP6xbNTc
 ZJwEEJ9YmOvLt7j5vnGCyihBvGIQIv6vGotQZD1uOzCro2FHIaH5kjW3c
 u74h2xB9UEbnuCzd2iPcCH2WpXfGDHNmaxPmiJpYImGwk+fGOoanfG6Q2
 FLDNPbD6BlN4BVmBYFWbv1V9PEUbJCLAUffZcNs6E7XXXa+AFp+8w9hCR
 g5LxAhyQ5lpLWjCfFQns5M5H9waQWzeQsN2SA3znLpSW2o28ymc+RfegP w==;
X-CSE-ConnectionGUID: zzjK5UykRyOdz+6XQghd7w==
X-CSE-MsgGUID: t7aDjmAzTKKIRvcZaEcSeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80869682"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80869682"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:57:06 -0700
X-CSE-ConnectionGUID: J9FBfnhhR16Ghb7BDIiSDQ==
X-CSE-MsgGUID: GH3Q9Xk5SICq/lQZM1vRTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="244171201"
Received: from kpleskax-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.94.249.221])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:57:04 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 3/8] tests/intel/xe_sriov_scheduling: Make
 sysfs_get_job_timeout_ms take const eci
Date: Wed, 27 May 2026 22:56:36 +0200
Message-ID: <20260527205644.2801165-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
References: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
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

Mark the eci parameter as const since it is not modified by the function.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index f4e674fe2..f7cca95ae 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -531,7 +531,7 @@ struct job_sched_params {
 	struct vf_sched_params sched_params;
 };
 
-static uint32_t sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
+static uint32_t sysfs_get_job_timeout_ms(int fd, const struct drm_xe_engine_class_instance *eci)
 {
 	int engine_dir;
 	uint32_t ret;
-- 
2.43.0

