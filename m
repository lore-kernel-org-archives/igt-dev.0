Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B511CD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D020A10E33E;
	Mon,  2 Sep 2024 14:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDTpVdiV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAF410E33E
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287948; x=1756823948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RB98QgHaThcQiJjoFL2Hw0ONJgQoH+DBRol146dH0aA=;
 b=IDTpVdiVjIsAUIqJ9G5d/CIFp2ZZcw1ptXNPSQkG6ZFwdN2QCwzaRhly
 kUGoOKF9MDA3ozN4U/WuNAU1leLXIfl9rYVpCBRQmIKjW6jXQwAiWPUbl
 VYAJ9NmomwG+a2APnPE51Md6p91KT03ni49Sp45wyMbwFACk1AJ/H1MY5
 YKIHmbEmw+yoWCG7qGM6PbSHbCkYxc3vEW+SHw0NnwMVKvIBfIPY1REHE
 VLdKd0tz+gBDDtrXjok3ajQhNTQZP25rOXNvNT3SM7bRbYmXchT79NZjK
 5b3Wn8MRdGeyYE15bCM+fWv8CDXjDJAYfz2AHrKR7sjFHMx6f7KlYoJ0k A==;
X-CSE-ConnectionGUID: GramlcyUSgCoIPVrlK9dvQ==
X-CSE-MsgGUID: msx1kzC9R5CFasJTZmNw0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009538"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009538"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:39:08 -0700
X-CSE-ConnectionGUID: 8kZmvr3VQxmPdp352aHzTw==
X-CSE-MsgGUID: p8fCUOmmTAWZcpWcOCgS2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639525"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:39:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:39:05 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 23/23] tests/kms_ccs: Provide a hint as to what we're
 testing
Date: Mon,  2 Sep 2024 17:37:58 +0300
Message-ID: <20240902143758.21036-24-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_ccs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 6409ad605f0d..06f40e2c2175 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -913,6 +913,9 @@ static int test_ccs(data_t *data)
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

