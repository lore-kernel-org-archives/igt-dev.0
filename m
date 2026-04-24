Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D16FED3E2
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 15:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B40010F5EE;
	Fri, 24 Apr 2026 15:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VONNsloX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B796A10F5EE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 15:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777043656; x=1808579656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PpA2pHq+OpzGylzoRdfCFGkET4jCXGTO1dvkEKal1qY=;
 b=VONNsloXStz9kyvKHFiwcDwvE3UCRcOQNUjPiL9O3WyE6Enb40mfZAFz
 zV6VjwLYy5BVn9bkPB8HN1bcygkV3hsh8D5iGrt5yHwQeMTuEQAGtQrxD
 2XZ/x/uE/lLGNg4Ca4+YyK10ssbz7dWt2Y3hsYij1/5EiFGgjo8xy6rsQ
 cqN9Op+X4yN39RvGzpXPvQWgQyzUrKAnrWCTmXuddywNzxOx3xiJ2rfsD
 U48I60tVJwLDSYIoIlB3B8g3YV1yMzXNixItlQPsheyxSdF1VEIUpK+rk
 I/Pd2iH74MiAXFfl3kC1bC0jn3VevrjTNwGOa9FGsN7RGlX0JOuMX9wwX A==;
X-CSE-ConnectionGUID: yw31Dc8ETP2XpA9GwS3IeQ==
X-CSE-MsgGUID: +vOeWBLbQZi7cLUKi/w2Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="77728800"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="77728800"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 08:14:16 -0700
X-CSE-ConnectionGUID: lUXjozAaSM2GZJ3DIkcllg==
X-CSE-MsgGUID: 68y10ll8RYmgZ8K6ClYZLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="233271583"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.100])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 08:14:14 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t 3/3] lib/igt_kms: Fix cleanup in
 igt_display_reset_outputs()
Date: Fri, 24 Apr 2026 17:13:55 +0200
Message-ID: <20260424151355.129423-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260424151355.129423-1-kamil.konieczny@linux.intel.com>
References: <20260424151355.129423-1-kamil.konieczny@linux.intel.com>
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

After free of outputs, set their number to zero so in case of
unlikly event when drm resources become unavailable, returned
structure will retain correct info.

Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 33092fc85..51c3392fc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2913,6 +2913,7 @@ void igt_display_reset_outputs(igt_display_t *display)
 			free(config->connector_path);
 		}
 		free(display->outputs);
+		display->n_outputs = 0;
 	}
 
 	resources = drmModeGetResources(display->drm_fd);
-- 
2.54.0

