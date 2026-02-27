Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CC9FD530E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB33310EA52;
	Fri, 27 Feb 2026 08:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSrbHA5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADA910EA52
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179664; x=1803715664;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lU+UpPNzNPZuc20YosGY0eWzyi9vTWbxFoaWXGll2hQ=;
 b=OSrbHA5Vj6GABX0VuMDu/wq1v8vDX4gLMNc2hIiTOJS6+zaHMdItrHbS
 MsgrbJxGg8CSZDt93Wy6VHxBW0Jg2ebHuiSNgO0LH9Uk1YePZE7g2rq4o
 MW7xG8XNptTpkR1fVdmZWBe1rW/TXK2oSc10eo5OWZcd07Csyqcd/bziE
 iXKO8t/zAGsOmsDBqJkKj14SIWi+CC+kapyj34GNYYPZn/QsYo2yt7K6g
 CtsgJ9lHsVTw95Bf5+HitpvOC1Z3kEJzVhcicDhOac7FyoX06q1/9K4Y5
 mHrUyXr055wd2opYeFSjWWsY9WzRTyLkMTYbqZzru91Z1vgadI1Iv6+lI A==;
X-CSE-ConnectionGUID: cw1ftJ3HRVuswVBbG1/s/Q==
X-CSE-MsgGUID: s+d3la89SDijLaVQXTjkkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84345967"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="84345967"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:44 -0800
X-CSE-ConnectionGUID: AotI57T5Tj6xHXbd/BNj5A==
X-CSE-MsgGUID: CbDBSSo8S4+skS+NCkRmeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="213723518"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:42 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/17] tests/kms_tiled_display: Remove mention of
 PIPE_NONE
Date: Fri, 27 Feb 2026 10:06:47 +0200
Message-ID: <20260227080653.30389-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Remove the redundant mention of PIPE_NONE from a comment.

Now the only place under tests/ that mentions PIPE_NONE
is kms_joiner*.c (which hasn't received any claenup so far).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_tiled_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 95e45ed416d1..7c10747090fb 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -221,7 +221,6 @@ static void setup_mode(data_t *data)
 	data_connector_t *conns = data->conns;
 
 	/*
-	 * The output is set to PIPE_NONE and then assigned a pipe.
 	 * This is done to ensure a complete modeset occures every
 	 * time the test is run.
 	 */
-- 
2.52.0

