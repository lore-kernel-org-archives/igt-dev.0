Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17F7C2BA18
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 05:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C7F10E569;
	Tue, 18 Jun 2024 05:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnWB4dXn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEDA10E569
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 05:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718688235; x=1750224235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aLS44c/b7jFa6sUszbAr9ePcnlYT4Nlq02Kp1zYSAc4=;
 b=jnWB4dXnT1/utQNHYzX9AjapX/rFbP294yBYD6t1OuJRQVT4pXcuE8ah
 xlojV4fKTm02hORRdRl+6s3vBrC55oEeyuOHaJbr0Tif/+JMqXOK2t0YF
 7vI+YkLRToJUhO76iZB6fXPyj/KIgGZrTge2qTXnNcZqDdD8ETwciFM8/
 wbn5IOp/t3arWKm/T4sgGwwMiYEbLNCaSTrt6pVIchJb0IcZBEwillwkf
 2RO+tqZLSS1MAWnev2p2cmBjzKjge4WLDR2sAwbhWjZLbObhItDfiJ6W0
 8bnqiRFp9jqlrIGOb0bCnRe7+4q37ojDBsm0WYGujO45urYyjV+XdhDIS w==;
X-CSE-ConnectionGUID: 9jU5Z7++Rz+pna7sPbYOtg==
X-CSE-MsgGUID: JWPLuad/RLSjroFkw2V2Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26660075"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="26660075"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:23:55 -0700
X-CSE-ConnectionGUID: DWDV1x3kTragxSC7VycwkA==
X-CSE-MsgGUID: RFy8h3u8RX6LKl5i/Cghiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41525200"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.150])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:23:54 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 04/12] lib/intel_bufops: Add Tile4 in linear_to and
 to_linear helpers
Date: Tue, 18 Jun 2024 07:23:27 +0200
Message-Id: <20240618052335.152588-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618052335.152588-1-zbigniew.kempczynski@intel.com>
References: <20240618052335.152588-1-zbigniew.kempczynski@intel.com>
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

intel_buf_to_linear() and linear_to_intel_buf() allows easy tile/detile,
only thing they need is to select appropriate implementation. There's
missing switch for Tile4 so let's add it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_bufops.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 30ba2547dc..56e37d2da7 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -804,6 +804,10 @@ void intel_buf_to_linear(struct buf_ops *bops, struct intel_buf *buf,
 		igt_assert(bops->ys_to_linear);
 		bops->ys_to_linear(bops, buf, linear);
 		break;
+	case I915_TILING_4:
+		igt_assert(bops->tile4_to_linear);
+		bops->tile4_to_linear(bops, buf, linear);
+		break;
 	}
 
 	if (buf->compression)
@@ -836,6 +840,10 @@ void linear_to_intel_buf(struct buf_ops *bops, struct intel_buf *buf,
 		igt_assert(bops->linear_to_ys);
 		bops->linear_to_ys(bops, buf, linear);
 		break;
+	case I915_TILING_4:
+		igt_assert(bops->linear_to_tile4);
+		bops->linear_to_tile4(bops, buf, linear);
+		break;
 	}
 
 	if (buf->compression)
@@ -1942,6 +1950,10 @@ bool buf_ops_set_software_tiling(struct buf_ops *bops,
 		}
 		break;
 
+	case I915_TILING_4:
+		igt_debug("-> use SW on tiling 4\n");
+		break;
+
 	default:
 		igt_warn("Invalid tiling: %d\n", tiling);
 		was_changed = false;
-- 
2.34.1

