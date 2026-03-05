Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE73EEF313
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 07:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D9B10E217;
	Thu,  5 Mar 2026 07:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPR76fgf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D546610E217
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 07:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772695440; x=1804231440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MqWjBCP403qBYkXmcUjZGtv29rxtet/hA3D7sjubEas=;
 b=RPR76fgf+/gwzQFIyswX8/ZDYKP8a+w4mEEp2MO3TwAu+6q+Ob3ENw6s
 5gi+gWfFMAAiqRPDF07Am2QSB3ZTpl7n8rJuBwzZwR8pt8DAaA1+5Z70o
 icDfrZlciwZvJHCTQq3xQXeVSnLPz/8StNeK0l71G3QnBLePVLmws1MAQ
 XqEANQqIzAkGJdwxPkA3Hu1yHwjPq5TXhBC5IF4zlH511ST8GitoNPCGn
 8G72CtT4/WEFiUqNZSWv9zjco+gp6rJwQDeaeEWV5LwlogOBQ+9QcWz25
 EbvK+t+51upetEhnwsQ/96zuBJEJ5Bwh76GFi7A9FhnLfCjKy5AhJGDfd w==;
X-CSE-ConnectionGUID: JOCx/TnCQp6fNuDUyFEB1w==
X-CSE-MsgGUID: dAplLGyvQx+GZfnv0PI8TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73743920"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="73743920"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 23:23:55 -0800
X-CSE-ConnectionGUID: 6DhykJMURnaYQDjG04VL0g==
X-CSE-MsgGUID: /7bxf1sfSBGWvKTZyO0SVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="218544147"
Received: from skishor1-nuc12snki73.iind.intel.com ([10.227.88.189])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 23:23:53 -0800
From: sumit kishore <sumit.kishore@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	sumit kishore <sumit.kishore@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_properties: Add skip on headless machines
Date: Thu,  5 Mar 2026 12:52:57 +0530
Message-ID: <20260305072257.233432-1-sumit.kishore@intel.com>
X-Mailer: git-send-email 2.43.0
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

Print debug messages for sub-tests which are expected to
skip on headless display systems.

Signed-off-by: sumit kishore <sumit.kishore@intel.com>
---
 tests/kms_properties.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 86d05c6d4..01f0d5867 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -73,6 +73,19 @@ struct additional_test {
 			  uint32_t prop_id, uint64_t prop_value, bool atomic);
 };
 
+static void is_headless_display(igt_display_t *display)
+{
+	igt_output_t *output;
+	bool display_connected = false;
+
+	for_each_connected_output(display, output) {
+		display_connected = true;
+		break;
+	}
+
+	igt_skip_on_f(!display_connected, "No active display connected, skipping sub-test\n");
+}
+
 static void prepare_pipe(igt_display_t *display, igt_crtc_t *crtc,
 			 igt_output_t *output, struct igt_fb *fb)
 {
@@ -377,6 +390,8 @@ static void plane_properties(igt_display_t *display, bool atomic)
 	igt_output_t *output;
 	igt_crtc_t *crtc;
 
+	is_headless_display(display);
+
 	for_each_crtc_with_single_output(display, crtc, output) {
 		igt_display_reset(display);
 
@@ -400,6 +415,8 @@ static void crtc_properties(igt_display_t *display, bool atomic)
 	igt_crtc_t *crtc;
 	igt_output_t *output;
 
+	is_headless_display(display);
+
 	for_each_crtc_with_single_output(display, crtc, output) {
 		igt_display_reset(display);
 
-- 
2.43.0

