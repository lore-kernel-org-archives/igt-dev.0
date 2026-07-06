Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE94C43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 06:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE4310E2F3;
	Mon,  6 Jul 2026 06:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmOg6kS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A0810E2F3
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 06:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783319246; x=1814855246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jpYz5JBtKgLkwKkyjyieTBKY0tTXDQbfVB08T547kEI=;
 b=UmOg6kS+hg2t2uXZtdwDmXuHiewDgNqIFN+J06ljVvQAbuuePxEnTwTY
 /WgRIoBxnOZfLqg2SryJDqWyjzF5EnNsygdLq2eg6mHYUdi9CrOPKlGON
 OMyB7T4Kxg6Mrl2JcN76tFuwk2MLJ/UdVxdHl93uQezlax+JFOQdZ7Xgy
 ilSkv7NiS9eVCbYOw4Z0uEkuLywVAJsHohC+GfFdHOmZXqBnia7UBQelx
 IMme2uFYNDKj4KHgNSiHhdJnj/jUt+0KuDwO1QFptsM9RGUU3iiUTfiTM
 DrZikKagZqkSRzYDOxl/69VE/RbF5h0tE4Klw9STz7TZH2S3o3pWxFtWD Q==;
X-CSE-ConnectionGUID: omRYIxZPSD6zhaEk4p/w7A==
X-CSE-MsgGUID: UkrBn5OMT2OoI4dIKsCTwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94303443"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="94303443"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 23:27:26 -0700
X-CSE-ConnectionGUID: UdH9CxBGR1myck1dJ1h6hQ==
X-CSE-MsgGUID: jeS13N6fT52M21r5RtL63Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="250267061"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 23:27:24 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 1/3] tests/intel/kms_pipe_stress: fix inverted
 condition skipping plane setup
Date: Mon,  6 Jul 2026 12:20:07 +0530
Message-ID: <20260706065019.416906-2-sowmiya.s@intel.com>
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

The condition after commit_mode() was "if (!ret) return ret;"
which returned immediately on success, skipping the entire plane
and cursor setup loop. Fix to "if (ret)" so the loop runs on
success and returns only on failure.

v3: Rebase to latest (Swati)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
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
2.51.0

