Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B984C31D97
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B7810E1C7;
	Tue,  2 Jul 2024 23:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbjXOSNg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6020A10E70A
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962938; x=1751498938;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MWTU00TQmU7GqwLlszgsntg0kuKLbALZdZmxttQ0rTU=;
 b=GbjXOSNgxaNwJF64Q/BwyGCvZgIoRYDQ0JcTPZxQD9AY1crEtNhEb1ia
 SvMrY64SlhKlZGitbbsq959h2EEYN5T+qkq4ZiH3SvJ5k5L3m7PqXNH8V
 mdq5gjj0QMSPfnr0t9UCYaA22UeRJVuTnjQUZb0Hairbpzt4n3BsEHtY5
 YxWBlEu+4vP6ALkn3vK41wBb6b0viVLViZnkqOeSY1O+fJaFNbbmwWqHG
 h6eFD6ID0AV35+nxfmOhEsjTX6AcGfy15N4uSDNWOEfU5Pe4+q8UhouP7
 w7ueXBqysx12zdY5x/qyBVwCVNUesncr3L/rux0r9g1PPU/8xoj6evKUu A==;
X-CSE-ConnectionGUID: cYeRXLA8TmG247+8343fMQ==
X-CSE-MsgGUID: 064Nf1RdTEyaeySFbevJOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559557"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559557"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:28:58 -0700
X-CSE-ConnectionGUID: Zdaqvb0BSMW3U++bf/EPbQ==
X-CSE-MsgGUID: BlWcA1aAQ+SWbmK01keW2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043811"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:28:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:28:54 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 13/37] lib/rendercopy: Use the proper compression format
 for 16bpc on dg2/lnl+
Date: Wed,  3 Jul 2024 02:27:53 +0300
Message-ID: <20240702232817.31147-14-ville.syrjala@linux.intel.com>
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

Setup the dg2/lnl+ compression format correctly for 16bpc formats.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_gen9.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index b871a4b3dae1..ae4bb2606125 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -149,6 +149,8 @@ static const uint32_t xe2_render_copy[][4] = {
 static uint32_t lnl_compression_format(const struct intel_buf *buf)
 {
 	switch (buf->bpp) {
+	case 64:
+		return 0x7; /* CMF_R16_G16_B16_A16 */
 	case 32:
 		if (buf->depth == 30)
 			return 0x3; /* CMF_R10_G10_B10_A2 */
@@ -163,6 +165,8 @@ static uint32_t lnl_compression_format(const struct intel_buf *buf)
 static uint32_t dg2_compression_format(const struct intel_buf *buf)
 {
 	switch (buf->bpp) {
+	case 64:
+		return 0x5;
 	case 32:
 		if (buf->depth == 30)
 			return 0xc;
-- 
2.44.2

