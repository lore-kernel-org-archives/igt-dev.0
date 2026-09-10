Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A026C79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 19:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E59D10E27F;
	Thu, 10 Sep 2026 19:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOBDSg1e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0402610E27F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 18:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789066754; x=1820602754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2uputFe4Kq46uFrrzU/yZE7NavfBfNUWmoYs8vyfb+c=;
 b=cOBDSg1esJLZltmkyrEVHvavfwOoINgSCSYkhjnAt8NeBWWaKUSSLAIs
 xSEnnbMjRROBO7PTz+M9UWJRurVmjOeJUrsfI2Fbs/ubVzYbGaNXrrE4X
 /2YpqYSq1SDjS5Kgtl8QhRDUpd5YIsd0gC1XONScfFrUY4IQ97OKV6w6l
 oyK2sn1ZE/C0WtiykOj341Zik9n1aaQAECyzGOUYb4HWIQcPDMXjKRKRW
 ryWeySAZzjczllraUfcoiYjRrQiSgwxbJGg6mIu3mNl6l2gUWjU7VzL89
 NhE0HcMcqy6iHQkY419XFL3+co+YLQq66CSQqS+T9IitgEZnwR9PbQCKQ Q==;
X-CSE-ConnectionGUID: 9jBvSD1cTuCa4cZ17SMNzg==
X-CSE-MsgGUID: hBMMbUU6SS+wQWf8Z9zBxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89400073"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89400073"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:59:13 -0700
X-CSE-ConnectionGUID: ebaRSfFvQNGiNVHqQMpUeA==
X-CSE-MsgGUID: cuCKkcynQJahgS8tyUbalQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="295199461"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 11:59:12 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 02/17] lib/igt_kms: s/pipe/crtc/
Date: Thu, 10 Sep 2026 20:58:47 +0200
Message-ID: <20260910185902.2728276-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260910185902.2728276-1-michal.grzelak@intel.com>
References: <20260910185902.2728276-1-michal.grzelak@intel.com>
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
index 27f8877a9f..b51196eaba 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -774,7 +774,7 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
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

