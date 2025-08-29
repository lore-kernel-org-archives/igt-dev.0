Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA2BCA0FF9
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 10:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464E010EB78;
	Fri, 29 Aug 2025 10:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edVbe/YS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650C410EB7C
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 10:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756464057; x=1788000057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jhgCR7iLuk9dGxV4iY3E64lZP8GvrPYe9yzdT4hwfCU=;
 b=edVbe/YSp/3eHB/+n+VD8WwBD7fhmOYkh0jWC2LqygJhxrdypiTZ5ipx
 UJSmK3iDFSWt1gtyNFHEaRyRvLoVkC2vXpt/skUE/xhU5LpRUG/v9OtHh
 lPyHBPpCBRtMPaCBtHnlk+YiXL+44It0yrlcyu4Wljyg1TO4Aq9Ok6dlb
 1NfmgenIECiWJ2Tp5RXAAqonROFRNiHALDbrvB9LJv8OT72+Ajcw8wgPZ
 VvGgFSb91yNbHEIYsxjUFKRqRlE8n8N0YkEyy19rig3COvFHNntd8aiX2
 yya3EP+/XDriA1wXzTKJ/9gziD5TwKyphchCmbgG/C2Vq3nxthljMgpbx w==;
X-CSE-ConnectionGUID: QiQECXHATxe+SRYk6fOhoA==
X-CSE-MsgGUID: qtxVowVQR8mH1VU95Scxvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76200909"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="76200909"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 03:40:56 -0700
X-CSE-ConnectionGUID: iSWMdyTRQsKi7Jf8jYfWKQ==
X-CSE-MsgGUID: 8v5TL0GRRa+6siICcJfCAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169917660"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.112.195])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 03:40:54 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_sriov_flr: Skip non-MAIN GTs when
 reading provisioning data
Date: Fri, 29 Aug 2025 12:40:37 +0200
Message-Id: <20250829104037.649426-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250829104037.649426-1-marcin.bernatowicz@linux.intel.com>
References: <20250829104037.649426-1-marcin.bernatowicz@linux.intel.com>
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

Provisioning (GGTT and LMEM) is exposed only on MAIN GTs.
Non-MAIN GTs (e.g., MEDIA) do not provide provisioning data,
so attempting to read it there previously caused skips.

Restrict the GGTT and LMEM subtests to MAIN GTs only.

Suggested-by: Lukasz Laguna <lukasz.laguna@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 tests/intel/xe_sriov_flr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index fc08703c0..448b63521 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -596,8 +596,9 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
 {
 	struct ggtt_data *gdata = (struct ggtt_data *)data;
 
-	if (xe_is_media_gt(data->pf_fd, data->gt)) {
-		set_skip_reason(data, "GGTT unavailable on media GT\n");
+	if (!xe_is_main_gt(data->pf_fd, data->gt)) {
+		set_skip_reason(data, "GGTT provisioning not exposed on GT%d (non-MAIN)\n",
+				data->gt);
 		return;
 	}
 
@@ -813,6 +814,9 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
 	igt_assert(ldata->vf_lmem_size);
 
 	xe_for_each_gt(data->pf_fd, gt) {
+		if (!xe_is_main_gt(data->pf_fd, gt))
+			continue;
+
 		ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
 								  XE_SRIOV_SHARED_RES_LMEM,
 								  gt, &ranges, &nr_ranges);
-- 
2.31.1

