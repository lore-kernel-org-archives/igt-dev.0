Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B32C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 09:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C5F10E0C0;
	Tue, 25 Jun 2024 09:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJ+LUCje";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC0010E0C0
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719307024; x=1750843024;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vUi2dqy+wOdJzJBMb+J7SwhkRkKv1KlUadFoSKPrIC8=;
 b=LJ+LUCjezS68mFi6NHK1dRrgBHMSfzllpCdVG+Vt2sBRzvm/BWnBxi84
 GOinKTNVITK796Ehp01P2Ce32y2zDgjz9UVbTUZ9Gtr9e2vEBcxFnOmxm
 u3Mhs4i7ugagC0vQD6JdsMd/h6bjWKEIGGaJG38BloNqKoIAGgvn6euoq
 WPy/xEqRGE9P6kCPdvKTJNpt3VjM+0hTmBQB/m0i5U4vHd5Dt80zeITxK
 5yeN+0mUdApO+bB4HNQR7hXDewm5VbAeTXl74kDOjVuMEQwP5mG/gIbJ8
 gquRher6dYdoyC/Ror/bDTj4xxc+N8gI/wHxXio1mYYOFNoF+u4D/gN74 A==;
X-CSE-ConnectionGUID: UVE3oG8MRVe4/u2BqCXhxA==
X-CSE-MsgGUID: BH968LmKTcq9F+1KD4ybcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16456816"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="16456816"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 02:17:03 -0700
X-CSE-ConnectionGUID: L68BQzhFQbWhxQ4r4AMSpQ==
X-CSE-MsgGUID: tCYUj+kSTKOiOETvBDN3mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="48022790"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 02:17:02 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t] lib/rendercopy_gen9: Use AUX_NONE for platforms with
 unified compression
Date: Tue, 25 Jun 2024 11:16:50 +0200
Message-Id: <20240625091651.131301-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

For non-MSAA surfaces when unified compression is configured in PAT
auxiliary surfaces must be set to AUX_NONE. I haven't noticed this
on Xe2+ before as it setting was silently ignored by hardware but
setting to AUX_CCS_E is incorrect and may fail on newer platforms.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
---
 lib/rendercopy_gen9.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 726f1a087b..62a365f3c2 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -229,7 +229,10 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 	if (buf->compression == I915_COMPRESSION_MEDIA)
 		ss->ss7.tgl.media_compression = 1;
 	else if (buf->compression == I915_COMPRESSION_RENDER) {
-		ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
+		if (AT_LEAST_GEN(ibb->devid, 20))
+			ss->ss6.aux_mode = 0x0; /* AUX_NONE, unified compression */
+		else
+			ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
 
 		if (buf->ccs[0].stride) {
 
-- 
2.34.1

