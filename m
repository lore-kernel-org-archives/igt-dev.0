Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E19CA0FED
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 19:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C0010E242;
	Tue, 26 Aug 2025 19:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkZvNONJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C674010E242
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 19:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756236365; x=1787772365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kyaPfjjqVCw2q4VDbEbLRmbBCgqImYa1hn+3XS0loaA=;
 b=lkZvNONJ6OSc5BayxZpq8afD+wMg3+FRHbtaphRc30RvOqmEYzmOdiR9
 KWiphQaxtNzJYqViNkhOleedrTZsxgQTKgjZr3PTEr44lj3kb8Zk5OVsJ
 nJ+/9IYepdoVHaajC5SjXYPHEm8hVBSgUNzIJeoCCaR3ItSb7ZbLbH4yS
 /9ImkPQD+Ox0lUaCKdQ/gb3YhFos6vDXBB/7GTX9s9a4ults2LfZy8lN7
 fssLzQu7N8MJ0weZMIG5F6wlAAIgG5vwnl+SUWI/S6Q9StoxUkZQU8ZlW
 tKuNpGEvbFciZiY0MihXH/5LW5hFDOPMnMFL5btMRVcRUCcCyzKmYoeq6 Q==;
X-CSE-ConnectionGUID: fH5tjEGISwGqdj1Km/VhcA==
X-CSE-MsgGUID: eyCZRqHYT3iZUTvErV6tcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69584451"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69584451"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 12:26:05 -0700
X-CSE-ConnectionGUID: LA8gJ0qzSj+8J13uCWdmFg==
X-CSE-MsgGUID: MKnfBNM6QBiLlhMc6JthAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169830119"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.85.180])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 12:26:03 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_sriov_flr: Skip media GTs when reading
 LMEM provisioning
Date: Tue, 26 Aug 2025 21:25:55 +0200
Message-Id: <20250826192555.465679-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

LMEM provisioning is exposed only on the primary GT.
Media GTs do not provide LMEM provisioning data,
so attempting to read it there caused the subtest to skip.
Restrict iteration to non-media GTs before reading LMEM provisioning.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 tests/intel/xe_sriov_flr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index fc08703c0..248dcf6fb 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -813,6 +813,9 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
 	igt_assert(ldata->vf_lmem_size);
 
 	xe_for_each_gt(data->pf_fd, gt) {
+		if (xe_is_media_gt(data->pf_fd, gt))
+			continue;
+
 		ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
 								  XE_SRIOV_SHARED_RES_LMEM,
 								  gt, &ranges, &nr_ranges);
-- 
2.31.1

