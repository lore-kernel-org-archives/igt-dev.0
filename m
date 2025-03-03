Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C18C282C6
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 07:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62BF10E351;
	Mon,  3 Mar 2025 07:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckqLADlm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8FE10E351
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740988383; x=1772524383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LV4itwC83Sun3KvEtRvUTIUdmNyYO7Ap7LrvyvRJilM=;
 b=ckqLADlmjR8Hvt93YtGX7tbsSUXe1l1fosNtmThcgPBf30dj/87vtcdM
 hCiNIz4rZNsAVv54+xSFXR/6RR7voIIjCfIG2Jt7Vwbx6vhW2MtARX8/R
 yjWHL1HrRtMyCxa2oWc5cpCrX2yP0JY9RAudz9YOguFcxJpKZoWN8U8nW
 3UgXy1FvZwxGM4JThQUNKf0+InvFUKfP3+I5YNoZQttGbIa7JUawCCx/2
 WQnLNc4xXSU72nbLZIEQi0NeY0yB90GKI2wZlRJcqzJ57+4kh4e8ghUZX
 XP094ayRug6cRgt7jrnVhW22IG8vkD6LFT4Q+6w9YR13pr06pfOLs83V7 w==;
X-CSE-ConnectionGUID: XbFZwd0iRAiISgIn1+vC5g==
X-CSE-MsgGUID: 61irctZCScy/P/zZDg3Ydg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="29437958"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="29437958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 23:53:03 -0800
X-CSE-ConnectionGUID: HJeHW2Y9TgWVOhFAe35KFA==
X-CSE-MsgGUID: 1IGIBzj4QAK30iiKlqMT6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118838758"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 23:53:02 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_dp_link_training: fix assert for
 igt_find_all_mst_output_in_topology
Date: Mon,  3 Mar 2025 13:38:42 +0530
Message-Id: <20250303080842.3194642-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250303080842.3194642-1-kunal1.joshi@intel.com>
References: <20250303080842.3194642-1-kunal1.joshi@intel.com>
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

fix assert for igt_find_all_mst_output_in_topology
as it changed to int from bool

Fixes: 983ffca5ff96fd67c937691337f4488e28948aa7
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_dp_link_training.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index e218c9839..7ee2d17f5 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -95,7 +95,7 @@ static void assert_link_status_good(data_t *data, bool mst)
 	if (mst) {
 		igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd,
 								 &data->display, data->output,
-								 outputs, &count),
+								 outputs, &count) == 0,
 								 "Unable to find MST outputs\n");
 
 		for (i = 0; i < count; i++) {
@@ -194,7 +194,7 @@ static void do_modeset(data_t *data, bool mst)
 		igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd,
 								 &data->display,
 								 data->output, outs,
-								 &out_count),
+								 &out_count) == 0,
 								 "Unable to find MST outputs\n");
 	} else {
 		outs[0] = data->output;
-- 
2.43.0

