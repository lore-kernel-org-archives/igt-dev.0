Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514BBC5DF89
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 12:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E685510E293;
	Fri, 21 Aug 2026 12:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdH77Vtu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6460F10E39F
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 12:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787316522; x=1818852522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/M7VnrQ8N2MqBt+PKsX4EQSbLGqfyR9SNjJdfrxo3fQ=;
 b=SdH77VtuIhqu3/5tC4X71PqeAapxHXesTrB9siby+of5PvCGE3Kdi3PJ
 +SAbcXlNvzNZvP3E8A8dvRt9acpKE5iHuSa9zZ+o3VkPYEvW5EVNLfGaz
 YSwKA7a6qoN6Ak+Nls/D7anAWLFxVwJuxgnrSpf5YN0HNISMRaHAhJVPl
 uDO+mYQTkc471hzS9AxAy5QT0b91GV8IsF+DqcGRUIp4qiCFV+uarTJOY
 EMBi2bbZ4ZivVQEZdHfKkK2Sx6+0Y3mviW7WeiEVw7c1/QO+38u1O9KaI
 Hd8SNaMbitHFc1rd2DBD3g7xcOuZur/FVp9/IkKFRTJAKnF0ElI76C/pU A==;
X-CSE-ConnectionGUID: bL9LmBM/SOqi/0XtGnRGpw==
X-CSE-MsgGUID: sMse/OssTT6AuLe0wYKUQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87632905"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87632905"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 05:48:41 -0700
X-CSE-ConnectionGUID: vaOALIlbT6erDG+wNXMcZw==
X-CSE-MsgGUID: J3MwrjoeS9mKxSymQmnRdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="291188339"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2026 05:48:40 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 02/17] lib/igt_kms: s/pipe/crtc/
Date: Fri, 21 Aug 2026 14:48:19 +0200
Message-ID: <20260821124834.1974029-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260821124834.1974029-1-michal.grzelak@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Refer to crtc instead of pipe.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_kms.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 8d4d148474..49bc9654ef 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -777,7 +777,7 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
  *
  * If you only need to test a single output for each pipe, use
  * for_each_crtc_with_single_output(), if you only need an
- * output for a single CRTC, use igt_get_single_output_for_pipe().
+ * output for a single CRTC, use igt_get_single_output_for_crtc().
  */
 #define for_each_crtc_with_valid_output(display, crtc, output) \
 	for ((output) = &(display)->outputs[0], (crtc) = &(display)->crtcs[0]; \
-- 
2.45.2

