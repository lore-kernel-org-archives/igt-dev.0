Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE86606A321
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PKZfXKrO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2386E112277;
	Thu, 26 Nov 2026 10:00:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA0711225D
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 09:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687068; x=1827223068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zlKkogL+Q74Vb3ZOI9wbeuNOXxSvKzY7oIuYccfUUxY=;
 b=PKZfXKrO+yzfooEyqE7MYFgaMsWovihvFSh2jLBEUL4My8eI6xgI3B+B
 5uIwTeC/53fh+k+hVXNxXNHsmMTTKQaILqkXL9VP+Euq976jwpR+eVRDj
 4J6P4m+0YQx4KZeuMh4OfR7womFi/lxikZbI3evw9VyOB28UrkUJvt2ik
 VpflBYYPpYNRrWQda6C+KzUGnvLXb6ammIWLN3hPsowyQYtSjvzDNJUdM
 waYi6LpG1dnlOj0e3eDegcpYCqRd36IlcrkNZu/G0Q+XEd0t1NJZIcOo7
 6dbp7KuJ/w5+H/l9z0Dh3ugc04oOU/gFtlRiDTCJBnm67sMBV00UTzeAU A==;
X-CSE-ConnectionGUID: +YfHucwrSj+/KOqmld1UnQ==
X-CSE-MsgGUID: wgzzw+NCThKxaotC5JIXWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4475181"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4475181"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:37:19 -0800
X-CSE-ConnectionGUID: gs8e5vt2QEGas54GN1otTQ==
X-CSE-MsgGUID: RNoGR7/ETi2wCbUqP749+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12386902"
Received: from slindbla-desk.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.159])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:31:05 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com
Subject: [PATCH i-g-t 1/3] tests/kms_universal_plane: remove redundant
 is_intel_device() check
Date: Thu, 26 Nov 2026 10:48:19 +0200
Message-ID: <20261126093003.492469-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126093003.492469-1-luciano.coelho@intel.com>
References: <20261126093003.492469-1-luciano.coelho@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

cursor_leak_test_crtc() already calls igt_require_intel() at the
start, so the is_intel_device() check before the vblank wait is
always true.  Remove it.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/kms_universal_plane.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index ec2d070acddc..b01fb3d756f7 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -716,9 +716,7 @@ cursor_leak_test_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 	 * Therefore add 2 vblank wait to ensure that all cursor-related
 	 * framebuffers can be removed before counting the framebuffer.
 	 */
-	if (is_intel_device(display->drm_fd))
-		igt_wait_for_vblank_count(crtc,
-					  2);
+	igt_wait_for_vblank_count(crtc, 2);
 
 	/* We should be back to the same framebuffer count as when we started */
 	count2 = intel_gem_fb_count(data);
-- 
2.53.0

