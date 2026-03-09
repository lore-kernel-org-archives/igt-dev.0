Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45609F3C26E
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 14:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC68810E15A;
	Mon,  9 Mar 2026 14:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLx+wlet";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4CB10E15A
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 14:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773066164; x=1804602164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W/9C5g2n29mg7ENcYYFAucOCFRUB5u9Q6dW1J0Bn4Ts=;
 b=LLx+wletn+8wYyp5LImoIy8wUbxCFf+/9RZ9vEdQlp3DT2EoaADMMLdp
 e0W/e+zue/QBpBfsBpCSr7Igu/nRA97o5Y5zCGsTqKmMaiEXokiUHHUhe
 AH1Pu2HU73+ucJUXU7RoiZH6QZL4dLJ12cg6xlD1wRWshIr08QY2tdtMY
 eZqjkKlBUka+bqL5gequ6bCOjYjKcXtYaS+JEE/HhNLYglw9o+YsiURpu
 jKx2GZEpAm2vO1qRblVS/0wcew75DICR05i46aCvUr0bpnsNjX4Sqs5OE
 +l1K3nycKKCkToFOaW9+bZZLtdcTMo/SCD8KRjO/0KzjXgQXfuN0x8MQ5 Q==;
X-CSE-ConnectionGUID: ZY4Kr3zASv+/Xr5MY4wWUg==
X-CSE-MsgGUID: kFvpa7ETQxW1verPuGKBrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84799127"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="84799127"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:43 -0700
X-CSE-ConnectionGUID: 2re01BHLSle9KtiTgFFbWg==
X-CSE-MsgGUID: Vp3G4NuRS2WCAsQdiUTFew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="218915074"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 10/10] tests/kms_debugfs: use CRTC indexes instead of
 pipes for fb tracking
Date: Mon,  9 Mar 2026 16:21:44 +0200
Message-ID: <7b0649218f36ca55c278af343de3170ae039e11d.1773066012.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773066012.git.jani.nikula@intel.com>
References: <cover.1773066012.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Store fbs in an array indexed by CRTC indexes rather than pipes, as
pipes are irrelevant for the test.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
index 2b0e9e6b1720..f398b54594a2 100644
--- a/tests/kms_debugfs.c
+++ b/tests/kms_debugfs.c
@@ -58,12 +58,12 @@ static void igt_display_all_on(igt_display_t *display)
 					      mode->hdisplay, mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
 					      DRM_FORMAT_MOD_LINEAR,
-					      &fb[crtc->pipe]);
+					      &fb[crtc->crtc_index]);
 
 			/* Set a valid fb as some debugfs like to
 			 * inspect it on a active pipe
 			 */
-			igt_plane_set_fb(primary, &fb[crtc->pipe]);
+			igt_plane_set_fb(primary, &fb[crtc->crtc_index]);
 			break;
 		}
 	}
-- 
2.47.3

