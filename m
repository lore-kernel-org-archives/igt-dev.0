Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B795FF531C7
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 20:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A00110E031;
	Mon, 13 Apr 2026 20:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIy2G7yh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B45E10E031
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 20:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776110430; x=1807646430;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FKU+iYA6qe73JVr92rXxI8yMp6UVmnbbDk+UgnfCEoY=;
 b=bIy2G7yhZrCVgvDJ7Z8FW8cqeULdG3xNwSK4E8x0Yn6CkuVenazhHBpH
 VIbQp3AyWzOFj4qi8TppW1BVQ6oWpwbpe/qUAeBrKmAgVbQm2bVDipGxb
 RCoFPAes1FLU1NmmsoJMJY9hQ9HzX8zAgZSwDIBPAEuJTtD7/XVXZNHgt
 c7htF7K02gMSGatx2ykqO82II8jqi2HiYO+Vgv0fGYTNCAyd/DX3b4NJM
 0EzuPICgpjJN6PrT1iO1MwGOSPB06Xog9q5pRHB4+ReZHM3KJVZcwShGy
 y3S9/napu3SWzeZMras0Dlxz/LqKn3ZNEkCPJ3oKaL45mZyd98CESXbci A==;
X-CSE-ConnectionGUID: MXW0tuKtRTucg7SBA8jhdQ==
X-CSE-MsgGUID: 8NdGxgQ3RxOPydsil3NUCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87357132"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="87357132"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:00:30 -0700
X-CSE-ConnectionGUID: RNvYAWA7Sm2xSrTbHVh+bg==
X-CSE-MsgGUID: vZECTAD7TTiKzGHksvxqsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="234860951"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:00:30 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/3] lib/kms: Avoid local iterator variable in
 for_each_output()
Date: Mon, 13 Apr 2026 23:00:19 +0300
Message-ID: <20260413200021.29485-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260413200021.29485-1-ville.syrjala@linux.intel.com>
References: <20260413200021.29485-1-ville.syrjala@linux.intel.com>
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

Rewrite for_each_output() into a form where we don't need the
extra iterator variable. This will allow nested use of the
iterator.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9a3fa980d89d..57824b82f5f9 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -689,9 +689,10 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
  *
  * This for loop iterates over all outputs.
  */
-#define for_each_output(display, output)		\
-	for (int i__ = 0;  assert(igt_can_fail()), i__ < (display)->n_outputs; i__++)	\
-		for_each_if (((output) = (&(display)->outputs[i__])))
+#define for_each_output(display, output) \
+	for ((output) = &(display)->outputs[0]; \
+	     (output) < &(display)->outputs[(display)->n_outputs]; \
+	     (output)++)
 
 /**
  * for_each_connected_output:
-- 
2.52.0

