Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CDCC369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 20:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C5E10E127;
	Tue, 29 Apr 2025 20:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdRPITGB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAAF10E1B2
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 20:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745959270; x=1777495270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pQYtW9qkvnhEngHGNmZkZt7AvSzeubnPXxtiYgznjEM=;
 b=bdRPITGBiTp8OZa0KyWGD/z+SNl6VlgSJnjKaKuXdXNz7cCewtO31kig
 mgOo3X+pqZDE7Uln5GSQsM1hAhQ0vf/b5DCtt24zSQepHCgXU38EW1GkY
 VmkxL//Wxes3n2F0qZfqolzRupKu2l81pjQDfdw1j70mbDtVBBCM/Zq5L
 3MfqIQaHDyC5QGX+aSFVCyFMGoVu4p/D80IB6lVXrgZqIZeT9TiCeC46c
 FGI1zDMbaz0scboOOEQMPfam0iVAqm2/fpWPMWdIEkbbrCAaT7Ngy1WZU
 CZD/DzL3JwcN1GTKradkCzmX8cuaJJtWpPCywj0oBgqG3YZB1l1wPgjxH w==;
X-CSE-ConnectionGUID: vkozoAslRGW4wlRFPm0E0Q==
X-CSE-MsgGUID: 3Wmw0/yfRcOh35cXUids1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47484531"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="47484531"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:41:10 -0700
X-CSE-ConnectionGUID: jlIKfVKeRhK0RgG/FWZzfw==
X-CSE-MsgGUID: A9krYj0wR7apjKq9NZPEqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="133832047"
Received: from intel-s2600stb.iind.intel.com (HELO
 08ca91f16b80.iind.intel.com) ([10.66.234.77])
 by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2025 13:41:08 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, sapna1.singh@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com
Subject: [PATCH 2/5] Replace program_invocation_short_name with prog_name from
 command line
Date: Tue, 29 Apr 2025 20:39:57 +0000
Message-ID: <20250429204000.41537-3-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
References: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
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

program_invocation_short_name is global variable provided by glibc.

Inorder to get the igt built for Android(without glibc), replaced the
program_invocation_short_name with the prog_name.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 tools/gputop.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 43b01f566..ef868f670 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -335,7 +335,7 @@ struct gputop_args {
 	unsigned long delay_usec;
 };
 
-static void help(void)
+static void help(char* prog_name)
 {
 	printf("Usage:\n"
 	       "\t%s [options]\n\n"
@@ -343,7 +343,7 @@ static void help(void)
 	       "\t-h, --help                show this help\n"
 	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
 	       "\t-n, --iterations =NUMBER  number of executions\n"
-	       , program_invocation_short_name);
+	       , prog_name);
 }
 
 static int parse_args(int argc, char * const argv[], struct gputop_args *args)
@@ -384,7 +384,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 			}
 			break;
 		case 'h':
-			help();
+			help(argv[0]);
 			return 0;
 		default:
 			fprintf(stderr, "Unkonwn option '%c'.\n", c);
-- 
2.49.0

