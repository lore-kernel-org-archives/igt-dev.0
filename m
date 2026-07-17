Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0109C4451B
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 21:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC3910F609;
	Fri, 17 Jul 2026 21:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kpXWIapW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7B110F606
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 21:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784322034; x=1815858034;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1GYMwhES4n0HIkx27J+g3jWx2O802TOZsVoSJMyN1oE=;
 b=kpXWIapWltuZpJyjFQk3odUgyBxiJ7eboyDuhG7s9MBBlVjYmxY6mjJw
 Cct6L/Cp2JWPpzc067qwgmuOIO5OQTzLnB36CS00VMwLoOCnRJ1NsZLEy
 1pHYXRc2IkynTnk2odzlICejefIxmRNuhqQs5rN4LStBvG0NsWNEkP4IO
 paHNkTz/ISCGOJxSLYIwFB6AyLJs1B7fkfsTtYJX923JKtvFifeTh+DbS
 rqViFS13MXIhLEZm93BowvzPHafgv55xfzvgOcEMVd7U4RuVJSSguyd9c
 VSm/xD0VJVgwFQzr/s1oB4g7fLWBSbh68IpRH26gVUQ+F7GaWfdhuWCRt g==;
X-CSE-ConnectionGUID: 7GRDoKxZSzO9AwWhI5B6PQ==
X-CSE-MsgGUID: F4vh1Q0dR5CYD3wSJR0qyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84774459"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; d="scan'208";a="84774459"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 14:00:34 -0700
X-CSE-ConnectionGUID: jJHEgUggQXS/eICNv60OVw==
X-CSE-MsgGUID: 2kvSpIbVQfWo3xG7j9SB9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; d="scan'208";a="261854702"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 14:00:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 1/4] tests/intel/xe_oa: Allow disabling load helper from
 command line
Date: Fri, 17 Jul 2026 14:00:29 -0700
Message-ID: <20260717210027.2008255-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717210027.2008255-6-umesh.nerlige.ramappa@intel.com>
References: <20260717210027.2008255-6-umesh.nerlige.ramappa@intel.com>
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

In some test runs, it is useful to assess behavior with and without load
helper.  Add a command line switch to disable the load helper if needed.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 68c7537d3888..e7e4f5601b61 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -1798,10 +1798,14 @@ static struct load_helper {
 	bool exit;
 	struct igt_helper_process igt_proc;
 	struct intel_buf src, dst;
+	bool disabled;
 } lh = { 0, };
 
 static void load_helper_signal_handler(int sig)
 {
+	if (lh.disabled)
+		return;
+
 	if (sig == SIGUSR2)
 		lh.load = lh.load == LOW ? HIGH : LOW;
 	else
@@ -1812,6 +1816,9 @@ static void load_helper_set_load(enum load load)
 {
 	igt_assert(lh.igt_proc.running);
 
+	if (lh.disabled)
+		return;
+
 	if (lh.load == load)
 		return;
 
@@ -1821,6 +1828,9 @@ static void load_helper_set_load(enum load load)
 
 static void load_helper_run(enum load load)
 {
+	if (lh.disabled)
+		return;
+
 	if (!render_copy)
 		return;
 
@@ -1856,6 +1866,9 @@ static void load_helper_run(enum load load)
 
 static void load_helper_stop(void)
 {
+	if (lh.disabled)
+		return;
+
 	if (!render_copy)
 		return;
 
@@ -1865,6 +1878,9 @@ static void load_helper_stop(void)
 
 static void load_helper_init(void)
 {
+	if (lh.disabled)
+		return;
+
 	if (!render_copy) {
 		igt_info("Running test without render_copy\n");
 		return;
@@ -1884,6 +1900,9 @@ static void load_helper_init(void)
 
 static void load_helper_fini(void)
 {
+	if (lh.disabled)
+		return;
+
 	if (!render_copy)
 		return;
 
@@ -4981,6 +5000,10 @@ static int opt_handler(int opt, int opt_index, void *data)
 		oa_trace = true;
 		igt_debug("Trace enabled\n");
 		break;
+	case 'd':
+		lh.disabled = true;
+		igt_info("Load helper disabled\n");
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -4989,15 +5012,17 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 static const char *help_str =  "  --trace		| -t\t\tEnable ftrace\n"
-			       "  --trace_buf_size_mb	| -b\t\tSet ftrace buffer size in MB (default = 1, min = 1, max = 20)\n";
+			       "  --trace_buf_size_mb	| -b\t\tSet ftrace buffer size in MB (default = 1, min = 1, max = 20)\n"
+			       "  --disable-load-helper | -d\t\tDisable load helper\n";
 
 static struct option long_options[] = {
 	{"trace", 0, 0, 't'},
 	{"trace_buf_size_mb", 0, 0, 'b'},
+	{"disable-load-helper", 0, 0, 'd'},
 	{ NULL, 0, 0, 0 }
 };
 
-int igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
+int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 {
 	const struct sync_section {
 		const char *name;
-- 
2.51.0

