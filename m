Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CEEC3065C
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCAE10E6F7;
	Tue,  2 Jul 2024 23:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2ZetZpR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BEE10E6F7
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719963003; x=1751499003;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=itTAwv83Ul77Fx0pFm8XA4HNvtmYEk1m1VURNkMnipI=;
 b=e2ZetZpRdDPvWcRoHVbSESDrRlbHOGKbLbezIACAUvt+zkyq65X4zWyu
 9mCzXFykiuhmk++xxZzYU/D2ZejLL+AXVD7TFt4WsVwpENhJXmUNRpp+S
 BC2v1d5jrzX5yKEhscWfpzbNgYhzS39sJXWihFN8zD4GKX9eWzLfH+RaJ
 oSqG1QFkix7n3ybr/A2MgVZ0bHZvolf6PUQIHx/TCaicEIqS65nkHiVuK
 7c4rNPE267sYzb1y/cdXhgU0U0LU17z5Eh3dXnmKI7hfM2slI/N+ntftn
 hC6HUJptdaj+/Z5YE14N3FPpkQw3okZfjAnTKbTB+LikcvqvE8HGQ6qj9 w==;
X-CSE-ConnectionGUID: T5fP7kTISlSuaVE5IARPgA==
X-CSE-MsgGUID: 7iPL0SppS4yrJjgc8Fnp8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559716"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559716"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:30:03 -0700
X-CSE-ConnectionGUID: G6JynbgpSqijIoSCylSo9g==
X-CSE-MsgGUID: XvwzGq7DRL2yQoekhfKA1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043946"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:30:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:59 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 37/37] tests/kms_ccs: Provide a hint as to what we're
 testing
Date: Wed,  3 Jul 2024 02:28:17 +0300
Message-ID: <20240702232817.31147-38-ville.syrjala@linux.intel.com>
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

Log the currently tested pixel format + modifier. Makes it
a bit easier to figure out what actually failed when it did.

TODO: would be nicer to also indicate if we actually test
      anything or just skip the whole thing, but that would
      require a bit of restructuring of the test...

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_ccs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 8d3932de093e..3ed270a84c50 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -944,6 +944,9 @@ static int test_ccs(data_t *data)
 	igt_crc_t crc, ref_crc;
 	enum test_fb_flags fb_flags = 0;
 
+	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT "\n",
+		 IGT_FORMAT_ARGS(data->format), IGT_MODIFIER_ARGS(data->ccs_modifier));
+
 	if (data->flags & TEST_CRC) {
 		data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
 						  IGT_PIPE_CRC_SOURCE_AUTO);
-- 
2.44.2

