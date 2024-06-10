Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C52C27C5E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 12:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D1910E439;
	Mon, 10 Jun 2024 12:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EsYTnilK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1216610E45C
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 12:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718020808; x=1749556808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pe0gMsQ6PxSxSwSgf7PZ/xjv0JzB5l7xOTsP+Lx+ff0=;
 b=EsYTnilKJ88xPptWbGigUu7mCkJUamHur+p6GV7q9m2Q5m2G7N2lmgEw
 +dnKiDDYpOmkZY1A8FUCoq4dPfJmntVbd7Hn4ECTr+SJQyZFOptH4lRCV
 +oPSbbd0Jl4vPPxmW8tI2DB0YWX0NimwjZs9JY7tQUXITnthg3AR2QcmC
 eP2jxLJaZ57nodJBbtk6zfuyrs0vSf58wiGPfJAukGpBFmfOXUa8H3Xdm
 i4ZlMMzbVo2OJv4xxGRP/j/QQo87nIYkmC7YfIofNL1PDGb9CyKtvU5uW
 WHKY8lLtybxOX+jJ0G9Ljwb77C7h1uoJXRB1OVSL7+L5FRw2VXT4E8I1P Q==;
X-CSE-ConnectionGUID: SjGimdx3QbGDjMhDjy/Tfg==
X-CSE-MsgGUID: 56nipgz0Sx2g3HIBnCWyjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14626158"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14626158"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:00:08 -0700
X-CSE-ConnectionGUID: wOW6Ki/5SiydWAnadArZSA==
X-CSE-MsgGUID: VPLL3WJrTIKkjt+cGm7T6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43472116"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.54])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:00:06 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v2 4/5] tests/kms_dirtyfb: populate modeinfo before
 feature support check
Date: Mon, 10 Jun 2024 14:59:40 +0300
Message-Id: <20240610115941.35279-5-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610115941.35279-1-vinod.govindapillai@intel.com>
References: <20240610115941.35279-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Drmmmodeinfo is required to identify if there are any FBC size
restrictions applicable to identify FBC is supported for the
required test. So update drmmodeinfo early for each vald output.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_dirtyfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 2a32fab56..c0eacda9b 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -180,8 +180,6 @@ static void prepare(data_t *data)
 {
 	igt_plane_t *primary;
 
-	data->mode = igt_output_get_mode(data->output);
-
 	igt_output_set_pipe(data->output, data->pipe);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
@@ -328,6 +326,8 @@ igt_main
 				for_each_valid_output_on_pipe(&data.display,
 							      data.pipe,
 							      data.output) {
+					data.mode = igt_output_get_mode(data.output);
+
 					if (!check_support(&data))
 						continue;
 
-- 
2.34.1

