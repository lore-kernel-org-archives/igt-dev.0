Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529ADC30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112A710E6F8;
	Tue,  2 Jul 2024 23:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnXRuyHq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222AD10E6F8
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962922; x=1751498922;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uOtgVRJZ6huhYwEMyzs6gDAwzn+M+w3ZDj++ypp4Tj4=;
 b=RnXRuyHqgDhhWuw3sUcK2FHWdfd82HqcR0ZFgFKbLjgUC+o34AcZyecf
 BAPjd6pHluqWzUX1YE0TunYZkQjpHuaCYEgtQFf+h44DeFMNbEUatGS4B
 a9mfaNZmOBHMCd87lDln8xhsfeRs+ZKspR4OPpayIS4axevTL9+hrY4vI
 bsszP8PwExM9r3px0nVHbajERYLIjvtLq9uxRC8j4P1udBnOEh3oBZ88z
 4Jyp58NBjrIPUgvLJSmthzRSRe+hhacDP+F+Ys3UuAdZkWlbZrzVqyP+x
 Ahtp6gPDySB2Y3o8SI543mdjQ374NYRoxq01lDUuX63yv0Uq1lV0Na3cV g==;
X-CSE-ConnectionGUID: Rk2exz5wQwi1V5WL9QAX7w==
X-CSE-MsgGUID: sU8DTdprRAmwy6SqWPevfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559514"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559514"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:28:41 -0700
X-CSE-ConnectionGUID: 9zbWbSzCQgqgy1aFxen9mQ==
X-CSE-MsgGUID: T4+sjralSRG7Tu4Wx6+bhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043774"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:28:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:28:38 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/37] lib/rendercopy: Don't skip clearcolor on flat CCS
Date: Wed,  3 Jul 2024 02:27:47 +0300
Message-ID: <20240702232817.31147-8-ville.syrjala@linux.intel.com>
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

We always need to tell the hardware about the clear
color buffer, otherwise if we sample from a fast cleared
buffer we get complete garbage.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_gen9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index f0757a8e6b78..57b64dad1b1d 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -249,7 +249,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset) >> 32;
 		}
 
-		if (fast_clear || (buf->cc.offset && !HAS_FLATCCS(ibb->devid))) {
+		if (buf->cc.offset) {
 			igt_assert(buf->compression == I915_COMPRESSION_RENDER);
 
 			ss->ss10.clearvalue_addr_enable = 1;
-- 
2.44.2

