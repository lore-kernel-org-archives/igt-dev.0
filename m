Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C9A606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g6WR0VOE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1092F10E2BD;
	Thu, 26 Nov 2026 07:48:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090E110E234
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 07:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795679215; x=1827215215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wVhYuMrTde5W2kKLfXN9/w0v730BRx29b3jTVS6vynw=;
 b=g6WR0VOEn2xekF2IXhrz2Zyxhwac1PFe+zdrXzXcRF5Oh8ILYosVBl8B
 Sqk0OCmR5YezOdbgmmPIPgue9z1qLNaK85Ih4axIxZ3pNDmzjbMd7Ybgo
 rH1X48YJA5hfhJIrrYIZfoMoP0Hd1HmQH+2Hv9NnJZMLR9N8eqDUtnTqz
 oos0+MAevoB+IoU9BJA88S1gOhYctVjz6opkCinhheHKkFwvYB3/ejNy6
 6K7AQtoxPpM/qHJNYBQ1mrmJXGSrfT4RGQDWw8V4qy1fQxZzvUCJ/a5qT
 B1rorYix6vhY0+XE/QiAGKWwFsrepb6Qu1sszvzQXYdg0BMU9f2jSMDua w==;
X-CSE-ConnectionGUID: Ik041SDQTrWK4/wQQjRrhQ==
X-CSE-MsgGUID: sq+uUZCYSWi79YX8JQWDDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4566201"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4566201"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:46:54 -0800
X-CSE-ConnectionGUID: zkNqJwuoSO2+4XNQjMXdOA==
X-CSE-MsgGUID: ZuKgY+utS3OdJBxiPnetrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="11991841"
Received: from hchegond-desk.jf.intel.com ([10.24.80.219])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:46:54 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, ravi.kishore.koppuravuri@intel.com,
 zbigniew.kempczynski@intel.com, maarten.lankhorst@intel.com,
 alexander.usyskin@intel.com, anshuman.gupta@intel.com,
 soham.purkait@intel.com, riana.tauro@intel.com, nishit.sharma@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH i-g-t 1/6] meson: Add IGSC as an IGT subproject
Date: Wed, 25 Nov 2026 23:46:41 -0800
Message-ID: <0cf75b63a9278f429f050b61ef127d64b2b82681.1795677252.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795677252.git.harish.chegondi@intel.com>
References: <cover.1795677252.git.harish.chegondi@intel.com>
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
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Intel Graphics System Controller Firmware Update Library
(IGSC FUL) is a low level library that exposes a required
API to perform a firmware update of an Intel discrete
graphics device. It uses a cross platform library metee
in order to access the GSC (mei) device.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 meson.build           | 9 +++++++++
 meson_options.txt     | 5 +++++
 subprojects/igsc.wrap | 5 +++++
 3 files changed, 19 insertions(+)
 create mode 100644 subprojects/igsc.wrap

diff --git a/meson.build b/meson.build
index eec131375..2f1e4f82a 100644
--- a/meson.build
+++ b/meson.build
@@ -153,6 +153,15 @@ libpci = dependency('libpci', required : true)
 libudev = dependency('libudev', required : true)
 glib = dependency('glib-2.0', required : true)
 
+igsc = dependency('igsc',
+		  required : get_option('igsc'),
+		  fallback : ['igsc', 'igsc_dep_static'],
+		  default_options : ['enable_cli=false'])
+if igsc.found()
+	config.set('HAVE_IGSC', 1)
+endif
+build_info += 'With igsc: @0@'.format(igsc.found())
+
 libtsi = cc.find_library('TSI', required : false)
 
 if libtsi.found()
diff --git a/meson_options.txt b/meson_options.txt
index fc824dda9..3eb98c1a4 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -57,6 +57,11 @@ option('libunwind',
        type : 'feature',
        description : 'Use libunwind')
 
+option('igsc',
+       type : 'feature',
+       value : 'auto',
+       description : 'Build tests/tools that use the Intel GSC firmware update library (igsc)')
+
 option('runner',
        type : 'feature',
        description : 'Build test runner')
diff --git a/subprojects/igsc.wrap b/subprojects/igsc.wrap
new file mode 100644
index 000000000..5443e035e
--- /dev/null
+++ b/subprojects/igsc.wrap
@@ -0,0 +1,5 @@
+[wrap-git]
+url = https://github.com/intel/igsc
+directory = igsc
+revision = V1.3.0
+depth = 1
-- 
2.43.0

