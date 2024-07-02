Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AC8C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A43510E705;
	Tue,  2 Jul 2024 23:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEKxSKpK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F3210E704
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962935; x=1751498935;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=y8pU4ps4Q/9wx/F5DWGtpcLhVEkh1/An3ZhQKJV+uuU=;
 b=eEKxSKpKwvd5jl5/hGImH3zQGkmVA0DQqFJCqsS2VnWPV4D41EQzOD7O
 nNJ/WKrVxomkRDWWmqaCRovrV28BZ9nRwNH8d+OSxoiU5jGdiMQ4AyUiy
 2qnBS1XwX1Kkg++TOipWJokMhSZiXIATOpXqAI5xOiNyvyVm0k3zKTh8v
 zXHGdQe4tpMUMMrJ/89+8Yv7Q72SQqRwqxkzTdaZmVBZby099aTLbC1B3
 npfBz5MId91bxNSHrjqoCYPVJdM/uZX7qgWP7zbFhbLbRdzlbuolTSQQW
 1pplJovq4lkxQbpbewASSrSj3m/3i9dfCa183JCZ4iSBsBNfEiZpc0Ygf w==;
X-CSE-ConnectionGUID: lfhCxwiUTjiTNgv/2YVmOg==
X-CSE-MsgGUID: ub4CKK1nTmuTpqbjW4N/JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559554"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559554"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:28:55 -0700
X-CSE-ConnectionGUID: vQ/4mgAWSq+1IBNiIlvlFw==
X-CSE-MsgGUID: QCrFoKtISpKom5mMTowGdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043799"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:28:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:28:51 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/37] lib/rendercopy: Use the proper compression format
 for 10bpc on dg2/lnl+
Date: Wed,  3 Jul 2024 02:27:52 +0300
Message-ID: <20240702232817.31147-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
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

Setup the dg2/lnl+ compression format correctly for 10bpc formats.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_gen9.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 4014100a23b5..b871a4b3dae1 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -150,7 +150,10 @@ static uint32_t lnl_compression_format(const struct intel_buf *buf)
 {
 	switch (buf->bpp) {
 	case 32:
-		return 0x2; /* CMF_R8_G8_B8_A8 */
+		if (buf->depth == 30)
+			return 0x3; /* CMF_R10_G10_B10_A2 */
+		else
+			return 0x2; /* CMF_R8_G8_B8_A8 */
 	default:
 		igt_assert(0);
 		return 0;
@@ -161,7 +164,10 @@ static uint32_t dg2_compression_format(const struct intel_buf *buf)
 {
 	switch (buf->bpp) {
 	case 32:
-		return 0x8;
+		if (buf->depth == 30)
+			return 0xc;
+		else
+			return 0x8;
 	default:
 		igt_assert(0);
 		return 0;
-- 
2.44.2

