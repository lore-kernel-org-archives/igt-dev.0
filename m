Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BF3C44501
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BBB10E5AB;
	Mon, 13 Jul 2026 09:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RORffJ7A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF62310E5B3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783932968; x=1815468968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sNk5gyW7NtDuP8aZmUge3QvnRJUgwp5GmIK9ZIXjcxM=;
 b=RORffJ7ADfxLIksVxSgT2D1B0NDEcZ1oIoy1j9Are/EsYCk2Rdq50/+9
 yTq8FaP4a7cr34Y/dHHlcX602wiXAq/7nsFduTG6b/Dnoeto0MEkJR2ZS
 4b2kcppiDjkrFPy6nKZumWtNFZATJzSQOMol9mKLjgsRTob1yakm+EUMQ
 ZaNPm9m9EafwX95xOZ5C69zkL86ZmD+EVmNP0ygAnNC2z0QGHmHoZMaty
 TlLvdpgufOQnPBacX4KLujOYn0/wfGNq/aIj3HATnKFX9rzdybeaYIHMc
 zzxNZ/6zifbnpo9GZeOWS0Wz1U6ntPfWWlI+f4whRMSxsBgZ0fjlurGtv w==;
X-CSE-ConnectionGUID: MPqwj7y5TXaN6RC6EhOr5w==
X-CSE-MsgGUID: I5cDehk9Sjyz41h9Vevneg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87081319"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87081319"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:56:08 -0700
X-CSE-ConnectionGUID: nwywImkdSLaQugP5BjOzhw==
X-CSE-MsgGUID: CVSxv3X3RLefHc4LUTG1yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260385846"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 01:56:06 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 02/16] lib/igt_kms: s/pipe/crtc/
Date: Mon, 13 Jul 2026 10:55:01 +0200
Message-ID: <20260713085515.463575-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260713085515.463575-1-michal.grzelak@intel.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
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
---
 lib/igt_kms.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 521a03c01d..c89aa95c84 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -773,7 +773,7 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
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

