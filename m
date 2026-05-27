Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8BDCD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 06:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150F410E72D;
	Wed, 27 May 2026 06:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k72EBe7h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEDE10E72D
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 06:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779865086; x=1811401086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ItZs2LoBwoKVbFaUvJRtKld27V58jts4VsmfjmgJkDo=;
 b=k72EBe7hCY/5C5NKzmbnnxCgoKpZAaHFwH+LPvzYEGLLnrlirqqmTQlf
 Xa0WYEvNwDJmN4ONRuME/kCjTfwxNLsVrLX+CRfYgxIU6ee6U5+m8P35b
 8Rhl4A8RTOP5b07yDDup6Tk0uQXmGpZTiHPVKkP6MGICBDJ/aijza/FmX
 jdtbHdoQrsLcWeq0cYr+9pO/6xt4bBh3uQ/3SYXxt0+THuYm9da9e2kPk
 07oh22mHGcveTvcy9F0Hy0c8SwWRShhW0fqtQDPsZTXJvYDAMRorL3Na5
 Ch4EPqZCr0cpQUMiR+DmcdILIqw/o2DzmhblIzwI8xh8Htau0f7KnrOrG A==;
X-CSE-ConnectionGUID: 066MYa+UTaegrRJK7FJKdg==
X-CSE-MsgGUID: ofpgIMKuRr2So8aHmsNR4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80874757"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80874757"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 23:58:06 -0700
X-CSE-ConnectionGUID: jDlcbKOzTZOey24bX7UaHg==
X-CSE-MsgGUID: hFqTCL9UTrqDqDF0OBiW8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="235787325"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 23:58:04 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com, Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 1/3] tests/intel/kms_pipe_stress: fix inverted
 condition skipping plane setup
Date: Wed, 27 May 2026 12:49:36 +0530
Message-ID: <20260527071940.3285269-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527071940.3285269-1-sowmiya.s@intel.com>
References: <20260527071940.3285269-1-sowmiya.s@intel.com>
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

The condition after commit_mode() was "if (!ret) return ret;"
which returned immediately on success, skipping the entire plane
and cursor setup loop. Fix to "if (ret)" so the loop runs on
success and returns only on failure.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_pipe_stress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 36e3842c6..8724a674c 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -411,7 +411,7 @@ static int crtc_stress(struct data *data, igt_output_t *output,
 		ret = commit_mode(data, output,
 				  crtc, mode);
 
-		if (!ret)
+		if (ret)
 			return ret;
 
 		data->last_mode[crtc->pipe] = mode;
-- 
2.48.1

