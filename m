Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE50C27C5E
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0B110E695;
	Fri, 31 May 2024 14:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zo4QsQiu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124BD10E66A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165513; x=1748701513;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dNdaIJA9xWF3mk9X6K0jiPNOyC+s5p6qCaxupkZhT4w=;
 b=Zo4QsQiufnv3NIIv3JY0ajF8BrIGAKKZypFaOFkskorVEPHQOWSXbpJu
 MIKHAMs8toiaN9sul2LFkPq5BqBPCtJ4RBPEAjxOQDdYb1IISvaiV8FJb
 gT1J7TwBg2Hw/eHAERrm9h9WxJ0FGq1CdLJWvup+5xQTXtFsi/V8bgnql
 U+as29JlW2cgoJz8uhRwi8R4UPp92T8xz+ZYWjSY0EAMzzWPQZnXW00KA
 ikZ/2iagFAZF85No8G2ettkzg9kvuGolxhXw/6CvVyc6ndqEiK8NPoe6E
 R8TAPKeoYUpxIEDyS7jPUh6EV3PuAqEqUl8PiK2v7u7sgSu8z5cEOubwf g==;
X-CSE-ConnectionGUID: fXta11fER+OzFH01Z8Y0xQ==
X-CSE-MsgGUID: lhtxR0MyTNm7shW9fLvSOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113781"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113781"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:52 -0700
X-CSE-ConnectionGUID: VEomv9cyQaiv5kDoN9UasA==
X-CSE-MsgGUID: fZBm0kWdTned6TvcBSTFDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160954"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:49 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 20/20] tools/intel_vbt_decode: Decode device handle as a
 bitmask
Date: Fri, 31 May 2024 17:23:54 +0300
Message-ID: <20240531142354.16528-21-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
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

Some VBT blocks contain bitmasks of device handles (where multiple
bits can be set simultanously). Allow decoding such things by
having child_device_handle() take in the whole bitmask instead of
assuming just one bit.

We'll cheat a bit with a static buffer for the output string.
That should be fine given the simplicity of the tool.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index b0c30ffcbc0a..40c05fbadacb 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -820,9 +820,17 @@ static const int num_child_device_handles =
 static const char *child_device_handle(struct context *context,
 				       uint16_t handle)
 {
-	int i;
+	static char buffer[64];
+	size_t len = sizeof(buffer);
+	char *ptr = buffer;
+	bool first = true;
+
+	if (handle == 0)
+		return "none";
+
+	for (int i = 0; i < num_child_device_handles; i++) {
+		int r;
 
-	for (i = 0; i < num_child_device_handles; i++) {
 		if (!(child_device_handles[i].handle & handle))
 			continue;
 
@@ -834,10 +842,23 @@ static const char *child_device_handle(struct context *context,
 		    context->bdb->version > child_device_handles[i].max_ver)
 			continue;
 
-		return child_device_handles[i].name;
+		handle &= ~child_device_handles[i].handle;
+
+		r = snprintf(ptr, len, "%s%s", first ? "" : ",",
+			     child_device_handles[i].name);
+		if (r < 0 || r >= len)
+			break;
+
+		first = false;
+		ptr += r;
+		len -= r;
 	}
 
-	return "unknown";
+	if (handle)
+		snprintf(ptr, len, "%sunknown(0x%x)",
+			 first ? "" : ",", handle);
+
+	return buffer;
 }
 
 static const char *dvo_port_names[] = {
-- 
2.44.1

