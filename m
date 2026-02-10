Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B920EA8128
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 15:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0082B10E5B2;
	Tue, 10 Feb 2026 15:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNjyan6U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1D410E5AB
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 15:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770737074; x=1802273074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8PX4d9tG0AT7n7N/BwxTLyC9TaZ6MrOEhKvMQPNuP6M=;
 b=GNjyan6UHhv4oHBCs1itU0LeVzlmWDTcOe/Z2P6MdG043/U3+UT3fqFD
 tNSvlC+sXQk6DZUR/080KiH+10lyd0J3FH1pVLX3oKe/vGjx2AYpR994w
 VrBJc/yKtt6UTd5wUirp8kazpN6NISrGhyWah7L04/lStl6IQldqnf3yp
 UdcIEHahp6/vvTodJwnzfOHwlQDU7kl2MhCtg5d/+PXHCYXFWo5UE+vix
 ipGlRORehkSm883O+8onK9oEt5ZFgmSDxNmCmqS9R3A65FBmA/nBU59jS
 pOhNVIyZOlrCuIBbiHHSq0t+VJEKpCY6c5dm39FFmyHVXXXL9QPwqaxzA w==;
X-CSE-ConnectionGUID: jzClLzjmTH6Gr1X2WzIEQw==
X-CSE-MsgGUID: r0T37qPrSv2Sb+yHlfnWgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75491835"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75491835"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:33 -0800
X-CSE-ConnectionGUID: /wIKqIGzQ0WkHwqg59//NQ==
X-CSE-MsgGUID: qghF5SpvSLOV/O+zhngJxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211434625"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 04/11] lib/igt_kms: rename
 _kmstest_connector_config_find_encoder() pipe parameter to crtc_index
Date: Tue, 10 Feb 2026 17:23:45 +0200
Message-ID: <fb9fdcbf92f627af8c2eab205390e09ffbfff117.1770736961.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770736961.git.jani.nikula@intel.com>
References: <cover.1770736961.git.jani.nikula@intel.com>
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

It's a CRTC index instead of a pipe, so name it accordingly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0e0f4a99bb99..c4be889dc696 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2110,7 +2110,7 @@ _kmstest_connector_config_crtc_mask(int drm_fd,
 }
 
 static drmModeEncoder *
-_kmstest_connector_config_find_encoder(int drm_fd, drmModeConnector *connector, enum pipe pipe)
+_kmstest_connector_config_find_encoder(int drm_fd, drmModeConnector *connector, int crtc_index)
 {
 	int i;
 
@@ -2125,7 +2125,7 @@ _kmstest_connector_config_find_encoder(int drm_fd, drmModeConnector *connector,
 			continue;
 		}
 
-		if (encoder->possible_crtcs & (1 << pipe))
+		if (encoder->possible_crtcs & (1 << crtc_index))
 			return encoder;
 
 		drmModeFreeEncoder(encoder);
-- 
2.47.3

