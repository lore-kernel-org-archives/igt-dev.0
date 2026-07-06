Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831EBC43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 06:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C5B10E75D;
	Mon,  6 Jul 2026 06:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LF9B0Xfa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1FD10E2F3
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 06:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783319251; x=1814855251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/dGp676I+fFwRv1OJoYFLN20euzNPc/NUGsUnXRdayc=;
 b=LF9B0XfaNbgf1pneoEiJWnj6NImJgnQSM8pRRzgPBsL4AHsfXheRzLzx
 43PqA/zQNocD1kZYVxUazHGMW27i9981dVouh4LCPk/ltNEEEUH7jyU0f
 k7anzVZGYK9ABpEA8pZR3BidW04GrSVlOs8uffj6AKvzqF2TyggWJbYR6
 REqlmLHcGL86nLVgVyWkf/yh/NlOK8pVryuxYXSCjF57dp77DOpvHHvUH
 lIY13z90Cqc1QIU6j/H0/tQAEtDIjQvGJjju4EJg88lKHj1Cz1F8oPJLd
 EKq2RScINXrHeE9r+yZcZEsSzzNIoJ9h+PMVJ1HnKKOxAeMqlp7E+lc1L w==;
X-CSE-ConnectionGUID: xvSLv5qMSfuvd+aI/nS2wQ==
X-CSE-MsgGUID: 3vN4B+ilSESCz+SGSd3Chw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94303450"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="94303450"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 23:27:30 -0700
X-CSE-ConnectionGUID: 3oMGsv/hQzqjaPquqhdLLA==
X-CSE-MsgGUID: BouexRgKTqu2OGbSKOjI1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="250267073"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 23:27:28 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Sowmiya S <sowmiya.s@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH i-g-t v3 3/3] tests/intel/kms_pipe_stress: use ARGB8888/LINEAR
 for cursor framebuffer
Date: Mon,  6 Jul 2026 12:20:09 +0530
Message-ID: <20260706065019.416906-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706065019.416906-1-sowmiya.s@intel.com>
References: <20260706065019.416906-1-sowmiya.s@intel.com>
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

Cursor planes on Intel hardware accept only
DRM_FORMAT_MOD_LINEAR, regardless of the overlay
format and modifier used by the test variant. Using
data->modifier (e.g. 4-tiled) caused -EINVAL on the
cursor commit.
Bspec: 69833

v2: Add bspec reference in commit message (Swati)
v3: Rebase to latest (Swati)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/intel/kms_pipe_stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index a84433b9d..5362fe9f3 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -736,8 +736,8 @@ static void create_framebuffers(struct data *data)
 		if (!data->cursor_fb[i].fb_id) {
 			igt_create_color_fb(data->drm_fd,
 					    cursor_width, cursor_height,
-					    data->format,
-					    data->modifier,
+					    DRM_FORMAT_ARGB8888,
+					    DRM_FORMAT_MOD_LINEAR,
 					    1.0, 0.0, 0.0,
 					    &data->cursor_fb[i]);
 		}
-- 
2.51.0

