Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9FCFD530D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD2B10EA53;
	Fri, 27 Feb 2026 08:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXWVcLC4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E95310EA53
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179671; x=1803715671;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jhkZ2WNTYqbKfZUXUypYqdDaCLujqLlKcJQIM4rMjFM=;
 b=bXWVcLC4qF/dzSjS4/rTUoBxp2prWhXscFPEyguwhVvlm+ES/jeI8kqm
 tE96JYmJvuPnnaQDqQ3YjabZoE/XrLEJh8CuDDO8AjWaW13R8//b5iGbj
 ar6vRXLH3GEWQB84YET2UKbd1VxwhxqkqrLfz930HRDRzwVD+WVQ3i+Nl
 J2O11S3XjCqQB0IPhRb0CIKY/9bJ+rrdAUxEna5eNyd16rxsX0O23oagX
 G1HH+SYaXa6xY3B20MGjCvX875pfPDFzEQ9oMLVhziNkUkZFP9X0oOTH9
 AD+5M+jti1zZNm2dnrUIC0gx4Ka9Dw+Wr/1yr7Tlrh6hE2tavTFMXw+ez w==;
X-CSE-ConnectionGUID: oefqxEBnRpuTL5N6fDlGIA==
X-CSE-MsgGUID: gCHg5eC1R9OOksgD5rQL5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83893252"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="83893252"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:51 -0800
X-CSE-ConnectionGUID: zBYLCyWwQHOkmTmNQIWBPQ==
X-CSE-MsgGUID: serTheAgSl6NzFOm+iPcXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="214278242"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:50 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 13/17] lib/kms: Fix kmstest_get_vblank() docs
Date: Fri, 27 Feb 2026 10:06:49 +0200
Message-ID: <20260227080653.30389-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
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

Fix the incorrect docs for kmstest_get_vblank() return value.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 60f16efa9562..b3c44d9748d2 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2457,7 +2457,7 @@ int kmstest_get_crtc_idx(drmModeRes *res, uint32_t crtc_id)
  *
  * Blocks or request a signal when a specified vblank event occurs
  *
- * Returns 0 on success or non-zero unsigned integer otherwise
+ * Returns 0 on failure or the reply vblank sequence number otherwise
  */
 unsigned int kmstest_get_vblank(int fd, int crtc_index, unsigned int flags)
 {
-- 
2.52.0

