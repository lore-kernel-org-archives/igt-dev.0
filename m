Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB660C54E67
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 19:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57007112477;
	Fri, 15 Mar 2024 19:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aqz/iXQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D7A112474
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 19:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710530128; x=1742066128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C94bsh9PlbMP1ZTSVIsINTNaIE/qDy213XL2OLGE4hk=;
 b=Aqz/iXQ+Pspz5cjNWuiUNH/q5cyiNyDb8hvdM6GTgr6HEUr3bo45nff0
 N/MRPrxnvGxvTmhV/9QTL0sn4xEh/kVHNmYT54YVLsWotd7XZdEf4PfxJ
 YqmRaFr8Sgq8D8fKfNts0SPKDT8W15GKm2SvChHxlmISFlAa/7kl5rwdM
 bqQiKuovOaGdpEKCRnFcyc3paVxmHauwRyw+DKJD532PYsysTATP1bY1m
 7u4tSpFnp0TKylp2kgjiTdLN6IAOAqnCATNRA9hPfA2HUtzcvSCK1GiJS
 ySD+M3t/C+93SBBZFgvfigF/ACcj+FPrIF8IqlgBuNx0CnEp/Xy4S8VjU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16064037"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="16064037"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 12:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="827780755"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="827780755"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 15 Mar 2024 12:15:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Mar 2024 21:15:22 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: [PATCH i-g-t 3/5] tests/kms_cursor_crc: Make require_cursor_size() a
 bit more sensible
Date: Fri, 15 Mar 2024 21:15:03 +0200
Message-ID: <20240315191505.27620-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
References: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Rename require_cursor_size() to cursor_size_supported() and
flip the return value so that mere mortals can undestand
what the code is doing.

Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_cursor_crc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index f747b919f45e..38b354972afd 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -676,7 +676,7 @@ static void test_cursor_opaque(data_t *data)
 	test_cursor_alpha(data);
 }
 
-static bool require_cursor_size(data_t *data, int w, int h)
+static bool cursor_size_supported(data_t *data, int w, int h)
 {
 	igt_fb_t primary_fb;
 	drmModeModeInfo *mode;
@@ -718,7 +718,7 @@ static bool require_cursor_size(data_t *data, int w, int h)
 	igt_remove_fb(data->drm_fd, &primary_fb);
 	igt_output_set_pipe(output, PIPE_NONE);
 
-	return !!ret;
+	return ret == 0;
 }
 
 static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int cursor_h)
@@ -875,7 +875,7 @@ static void run_size_tests(data_t *data, int w, int h)
 				if (!valid_pipe_output_combo(data))
 					continue;
 
-				if (require_cursor_size(data, w, h)) {
+				if (!cursor_size_supported(data, w, h)) {
 					igt_info("Cursor size %dx%d not supported by driver\n", w, h);
 					continue;
 				}
-- 
2.43.2

