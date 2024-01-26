Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D21C48260
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jan 2024 12:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D04610F9FC;
	Fri, 26 Jan 2024 12:40:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F8610F9F9
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jan 2024 12:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706272828; x=1737808828;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=taKHSqZPQTASj1qGV50Odnebtf+3ORCgq0eynscOqHY=;
 b=P6iwnp7brAai4np1Buv3dBPbF48tGWXLluDY8uomUR4xzvOpt4pM2ntP
 XQcmhcf2ccT9qxqOPLCQP5h0qYAww+ZR0+BogXcHNu1MjRxuM9hFpHhgB
 1FRS4+4PWBZZWvUtAa0Ghe9E5bFEObzCd/JXo1aQBWZe5xEBE51L3i0b+
 CSwa3PC2mYAtGDiWijJkUUnqs9FzfsLAkAcBhE/6L1JnDS0cZ3+ZCYx4I
 E3Mv2pXm5n2i2ILRdtLoA44u73TVTVLyokVDwi2UO+uTOYwUdKcf/xd6u
 XtIzw4HM2njdHAP6VwZMtWeYqNXo5YFv12pettjBZXw7hEkjD42TPzJCR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2328909"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2328909"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:40:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="821121698"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="821121698"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:40:25 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0A000580E0F
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jan 2024 04:40:25 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rTLVO-0000000BKa9-3YJ7 for igt-dev@lists.freedesktop.org;
 Fri, 26 Jan 2024 13:40:22 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] testplan/meson.build: add a ninja PHONY target for
 Intel CI testlists
Date: Fri, 26 Jan 2024 13:37:28 +0100
Message-ID: <20240126124021.2700482-3-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126124021.2700482-1-mauro.chehab@linux.intel.com>
References: <20240126124021.2700482-1-mauro.chehab@linux.intel.com>
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Add custom phony targets to create testlists to be used by Intel-CI.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/testplan/meson.build | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 9e0c3aee06af..5560347f1337 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -1,5 +1,7 @@
 testplan_title = 'IGT test plans'
 
+intel_testlist_dir = 'intel-ci-tests'
+
 sphinx = find_program('sphinx-build', required: build_sphinx)
 rst2html = find_program('rst2html-3', 'rst2html', required : false)
 rst2pdf = find_program('rst2pdf', required: false)
@@ -44,6 +46,8 @@ else
 	    }
 endif
 
+testplans = []
+
 foreach testplan, fields: test_dict
 	rst = custom_target(testplan + '.rst',
 			    build_by_default : true,
@@ -53,6 +57,8 @@ foreach testplan, fields: test_dict
 			    output : testplan + '.rst'
 			   )
 
+	testplans += fields['input']
+
 	if rst2html.found()
 		custom_target(testplan + '.html',
 			      build_by_default : true,
@@ -63,6 +69,17 @@ foreach testplan, fields: test_dict
 	endif
 endforeach
 
+custom_target(intel_testlist_dir,
+	      build_by_default : true,
+	      build_always_stale : true,
+	      command : [ igt_doc_script, '--config', '@INPUT@', '--intelci-testlist', '@OUTPUT@' ],
+	      depends : doc_dependencies,
+	      input : testplans,
+	      output : intel_testlist_dir,
+	      install : true,
+	      install_dir : libexecdir
+	     )
+
 if sphinx.found()
 	if gen_rst_index.found()
 		sphinx_out_dir = meson.current_build_dir()+ '/indexed_html'
-- 
2.43.0

