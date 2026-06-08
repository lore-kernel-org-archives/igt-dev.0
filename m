Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C4CCD8C9F
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 16:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70D610F6B6;
	Mon,  8 Jun 2026 16:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nAykvY5b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8FF10F6BA
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 16:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780935447; x=1812471447;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3e6V9Az9GPG8VPM31lSr6dvnFWXya4VpQhfqmAi1dRw=;
 b=nAykvY5bpEiXKIRbXD48Ws87k1TDhr0tNt5ntwItuHwqHxebGAS6mgaT
 i+AXBSn1FcK1J2gb8bW9St9g6akAocAWeSlHMk7MDqTzhflES796DToVG
 SqI4QaqMIKdyxRWauQz7l7Krx3t5xpLCAct4fLJFU5MAsU0FlqMmTvzhh
 6lRWy3XUYiP0OGsb9H/9CX5IQ27EeiD4D0yyNbFwITlVH191OV/VZzNGx
 Aus9+79oSfJgNhj0ARryEZzWyrYvF0jiF74Y8yCW3OauqFWnsCJTk45Dh
 QTFSD5fHcyVyFYn2YhAWQVezEo1V02PODdWqRmR3upgz8F6JkjrUudMmf w==;
X-CSE-ConnectionGUID: 6uipprqiSTyTpG4BQkXvGg==
X-CSE-MsgGUID: Gq2p2PPNTGy963XY5RSTgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="80702933"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80702933"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:17:27 -0700
X-CSE-ConnectionGUID: dfZDwq5ARmSDTmmIDU1FOw==
X-CSE-MsgGUID: PVSO+ddZRcmJB8nVSD/lZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="242631710"
Received: from rknop-desk.igk.intel.com (HELO rknop-desk.ger.corp.intel.com)
 ([172.28.178.99])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:17:25 -0700
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t] docs/reference: Build generated XMLs by default,
 depend on testlists
Date: Mon,  8 Jun 2026 18:17:07 +0200
Message-ID: <20260608161712.988575-1-ryszard.knop@intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

The gnome.gtkdoc target does not correctly declare dependencies on its
content_files (see mesonbuild/meson#2831 for more info), which prevents
the declared custom targets from running. Until recently this caused the
specified sections to be missing, but the overall build/install was OK.

Warnings like `element include: XInclude error : could not load [X].xml,
and no fallback was found` were generated but not printed in build logs,
because the gtkdoc binaries were invoked in a wrapper which prints the
output only if the executed binary returns a non-zero code.

Newer libxslt/libxml2 versions dislike missing XIncludes and fail the
build. Fixing these generated sections fixes the build on newer distros.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 docs/reference/igt-gpu-tools/meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/igt-gpu-tools/meson.build
index 8d70a49b8918..2c65155b7f21 100644
--- a/docs/reference/igt-gpu-tools/meson.build
+++ b/docs/reference/igt-gpu-tools/meson.build
@@ -56,13 +56,16 @@ configure_file(input: 'version.xml.in',
 foreach group : test_groups
 	programs_xml = 'igt_test_programs_' + group + '_programs.xml'
 	generated_docs += custom_target(programs_xml,
+		      build_by_default : true,
 		      output : programs_xml,
+		      depends : test_list_target,
 		      command : [ gen_programs, '@OUTPUT@', group, test_list_target ])
 
 	description_xml = 'igt_test_programs_' + group + '_description.xml'
 	generated_docs += custom_target(description_xml,
+		      build_by_default : true,
 		      output : description_xml,
-		      depends : test_executables,
+		      depends : test_executables + test_list_target,
 		      command : [ gen_description, '@OUTPUT@', group, test_list_target ])
 endforeach
 
-- 
2.54.0

