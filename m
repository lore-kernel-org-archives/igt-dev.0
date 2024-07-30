Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF17C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 16:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B55C10E2C8;
	Tue, 30 Jul 2024 16:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMMDo69t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D29B10E22E
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722358186; x=1753894186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bfMCayIz9lyjroEMT4ylaA0OGgeAecARnIYoKV+HH9Y=;
 b=IMMDo69tkTtSaSqxjV2CLsh4YaTo0WntjiAgWvp5lVFtg7JVZ3s0GIn4
 eqU8evvt8THkNqVZl+F7qLXW/2iHL6JkIZtFHMsuFVTGsrpxtBHnSGsBS
 IW8nYC8gOrCTEZyFWgajqYVlJquf2aKREd+qM3oIh3q5WGaAC1fSM+Bm4
 tdcDsJT/aG/v5oDCdEQKEtrjx7YvdoaUhjqGcklfuqvU7bxPQGrxUaIIQ
 /CUGpwOuU9GlcYvWCbPWsZ/GOyN/r3szh6t5Acs1rIyABomXVYkD5DXBI
 He4qsJfrGwyBqADDsesEpbnmPqJVIF460RPj+6qS3rGQxlSAKvaghbmrd g==;
X-CSE-ConnectionGUID: HAhi9v33QMetWgp2WwjXhA==
X-CSE-MsgGUID: RuqXVQfLQNSKMkab0qceCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31338892"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="31338892"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 09:43:00 -0700
X-CSE-ConnectionGUID: e9Kj+3StRISi5Tl0db+Sdw==
X-CSE-MsgGUID: 39HRIm9hQ5OJzcnSKCR9/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="85038997"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.0.122])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 09:42:58 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe_pm_residency: Skip test if 'gtidle'
 attribute is missing
Date: Tue, 30 Jul 2024 18:42:32 +0200
Message-Id: <20240730164232.286232-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
References: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
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

Add an igt_require check for 'gtidle' attribute to skip residency
tests on VF devices where this attribute is not present, preventing
test failure.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_pm_residency.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 51735d887..dda4d56fe 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -317,7 +317,9 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+
 		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
+		igt_require(xe_sysfs_gt_has_attr(fd, 0, "gtidle"));
 	}
 
 	igt_describe("Validate GT C6 on idle");
-- 
2.31.1

