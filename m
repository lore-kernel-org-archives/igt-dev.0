Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7461EC79FBB
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 20:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF9D10E2F9;
	Thu, 10 Sep 2026 20:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfQCweiY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188E410E2F9
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 20:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789071268; x=1820607268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2uputFe4Kq46uFrrzU/yZE7NavfBfNUWmoYs8vyfb+c=;
 b=gfQCweiYzjPka174SZqojuMy4/0x4e+z5vuwUWmjX8k4lW3boNb8gaBQ
 oHe/YDpSf2f+cvQrPB3WRwJhknjL2uX9Fau/UfGV9ZxMxPrKFPcmovtiE
 YEgxYclsie7F0ZJJOrnFoT/p9jHp3Q/623uwnMGJdLe0kZW5U0O4MyWuH
 6yxAhsVH6AhGWvnQoYQNBc7+azfCXCRB9x2DeSBqC1u9RfOB52tfWtIF7
 Ij1DJAh4lOFtonz7utyzkVub0toCFHYnH/pldk09zEgkZxpa19HjC9amr
 zGs5lgUy+nWyIhwd5YRsToeXGAokyA8GWeuuXuojEQvB08Q7J/scHoY/L A==;
X-CSE-ConnectionGUID: gvRMS7vMS3+VNLIvBpQBFg==
X-CSE-MsgGUID: HdlGviaoQZSOQwgoPOsa6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89657249"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89657249"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 13:14:28 -0700
X-CSE-ConnectionGUID: T/AH8+DSSzijkCUlo1RlSw==
X-CSE-MsgGUID: gNXbHRIOTrC7j5mXGQNmsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="309978176"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP; 10 Sep 2026 13:14:27 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 02/17] lib/igt_kms: s/pipe/crtc/
Date: Thu, 10 Sep 2026 22:13:58 +0200
Message-ID: <20260910201413.2730574-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260910201413.2730574-1-michal.grzelak@intel.com>
References: <20260910201413.2730574-1-michal.grzelak@intel.com>
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

