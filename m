Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB12C47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 08:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2F010F20E;
	Fri, 22 Mar 2024 08:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fr9Dnk6A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE5B10F20E
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711095665; x=1742631665;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i3Q0W+0yqLnzpdxrnR9BTPIyFXXA7/uG8obhEOseJAo=;
 b=fr9Dnk6ATAGY/d4GTWzEXqm/xt46ctxKo8ZxkNOU+KU6Qpw9158XdiA/
 2C8h5IUrr4eM6C8SvJSuGGjO1LOJR5Y9esJEkmZ1tfCNiho2X+Fva72Y0
 RdMO7dSTrPr3n5srjeMoLsTRtoYMjhGHSsLe7/wh8cHgNFHx73CE3NDh/
 DKz5mJqmY+XB4YSREshtFk/u7OPgvYi5xGQhLrB9/M5srDNLieycBC64o
 gR3oEY8bS5gjA6GVvi2RD0vBYJk+k6FyfQ+s/7wofyyKpS1loQKCTwaYB
 Ac0D5La61EIIlTVfzgVzCkv4/5IGTJ/KdtXtHf9X3BXePwnVz5Uw6IKQn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6023686"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="6023686"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 01:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="45935448"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 01:21:01 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_dsc: Use high resolution mode for
 output format subtests
Date: Fri, 22 Mar 2024 13:44:42 +0530
Message-Id: <20240322081442.4120318-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
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

Currently, we are not using the highest resolution mode for output formats
other than RGB. For testing other formats we force an output format, and
try the mode from list of modes.
Lets call get_highres_mode before using the modes, so that we try modes
that are sorted in descending order of resolution. This is to ensure we
try with higher resolution mode and use DSC with that mode.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/intel/kms_dsc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index b5c0fa6ab925..9b48caf762f1 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -184,10 +184,10 @@ static void update_display(data_t *data, uint32_t test_type)
 	igt_skip_on(!igt_plane_has_format_mod(primary, data->plane_format,
 		    DRM_FORMAT_MOD_LINEAR));
 
+	mode = get_highres_mode(output);
+
 	do {
-		if (data->output_format == DSC_FORMAT_RGB)
-			mode = get_highres_mode(output);
-		else
+		if (data->output_format != DSC_FORMAT_RGB && index > 0)
 			mode = get_next_mode(output, index++);
 
 		if (mode == NULL)
-- 
2.40.1

