Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817C1C25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C372B10E654;
	Fri, 31 May 2024 14:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqHtptNq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A2710E654
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165513; x=1748701513;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=K4i10eOy5lw66QsNb3KMA1Q7UMvHA4LgSlrcb2/Z5fI=;
 b=LqHtptNqJ0OavBJmB6EKAwpMzdFKBYoQEsFi/4/WYk+Nk0D04KiAz9mb
 5lcYtIP+MkW/JXb82+nNM++lqv2YezLG2ewGb9IJ/SUSDPArKXqJyMNlR
 gdLN2p+lH+UQwVlELdSJNvL/g+c42vslZ3zl1CgQ9tu1N45LtTN1Uvs/L
 2oqwgAce2TES8vZqmmeqYkEn3NRe+qF1vIObw3kc3FAYKWpGbNjKG0wrE
 8RJacIRkD3K+J1ARt5qJ0W9a7ZJWEhSDLiwZ7GoPJHGbdXWgUIv3GXqT+
 f8fP4h79F0ermgiBFx8O7PsL3klMNVBua9D/AaQs67uvs+9JBtcmuQcyE Q==;
X-CSE-ConnectionGUID: eKAGaknJQvmNTDSkC0eT6g==
X-CSE-MsgGUID: zXfTnQJmQqqzX7p1kMhkhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113763"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113763"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:49 -0700
X-CSE-ConnectionGUID: CGaw/yYCQJm697sg9vgLEg==
X-CSE-MsgGUID: 5f+X6DA5S5G4k6ufd+/4kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160944"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:46 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 19/20] tools/intel_vbt_decode: Declare min/max version
 for child dev handles
Date: Fri, 31 May 2024 17:23:53 +0300
Message-ID: <20240531142354.16528-20-ville.syrjala@linux.intel.com>
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

Some of the device handles are only valid for certain BDB versions,
and even worse, some of them conflict between two versions. Declare
the version dependency for each problematic device handle so that
the decoding can output the correct string for a given BDB version.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 44 ++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index dcfa3a5db90f..b0c30ffcbc0a 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -797,27 +797,45 @@ static void dump_child_device_type_bits(uint16_t type)
 }
 
 static const struct {
-	unsigned char handle;
+	uint16_t handle;
+	uint16_t min_ver, max_ver;
 	const char *name;
 } child_device_handles[] = {
-	{ DEVICE_HANDLE_CRT, "CRT" },
-	{ DEVICE_HANDLE_EFP1, "EFP1" },
-	{ DEVICE_HANDLE_EFP2, "EFP2" },
-	{ DEVICE_HANDLE_EFP3, "EFP3" },
-	{ DEVICE_HANDLE_EFP4, "EFP4" },
-	{ DEVICE_HANDLE_LFP1, "LFP1" },
-	{ DEVICE_HANDLE_LFP2, "LFP2" },
+	{ .handle = DEVICE_HANDLE_CRT,  .name = "CRT",  .max_ver = 216, },
+	{ .handle = DEVICE_HANDLE_TV,   .name = "TV",   .max_ver = 214, },
+	{ .handle = DEVICE_HANDLE_EFP1, .name = "EFP1",                 },
+	{ .handle = DEVICE_HANDLE_EFP2, .name = "EFP2",                 },
+	{ .handle = DEVICE_HANDLE_EFP3, .name = "EFP3",                 },
+	{ .handle = DEVICE_HANDLE_EFP4, .name = "EFP4",                 },
+	{ .handle = DEVICE_HANDLE_EFP5, .name = "EFP5", .min_ver = 215, },
+	{ .handle = DEVICE_HANDLE_EFP6, .name = "EFP6", .min_ver = 217, },
+	{ .handle = DEVICE_HANDLE_EFP7, .name = "EFP7", .min_ver = 217, },
+	{ .handle = DEVICE_HANDLE_EFP8, .name = "EFP8", .min_ver = 217, },
+	{ .handle = DEVICE_HANDLE_LFP1, .name = "LFP1",                 },
+	{ .handle = DEVICE_HANDLE_LFP2, .name = "LFP2",                 },
 };
 static const int num_child_device_handles =
 	sizeof(child_device_handles) / sizeof(child_device_handles[0]);
 
-static const char *child_device_handle(unsigned char handle)
+static const char *child_device_handle(struct context *context,
+				       uint16_t handle)
 {
 	int i;
 
-	for (i = 0; i < num_child_device_handles; i++)
-		if (child_device_handles[i].handle == handle)
-			return child_device_handles[i].name;
+	for (i = 0; i < num_child_device_handles; i++) {
+		if (!(child_device_handles[i].handle & handle))
+			continue;
+
+		if (child_device_handles[i].min_ver &&
+		    context->bdb->version < child_device_handles[i].min_ver)
+			continue;
+
+		if (child_device_handles[i].max_ver &&
+		    context->bdb->version > child_device_handles[i].max_ver)
+			continue;
+
+		return child_device_handles[i].name;
+	}
 
 	return "unknown";
 }
@@ -1006,7 +1024,7 @@ static void dump_child_device(struct context *context,
 
 	printf("\tChild device info:\n");
 	printf("\t\tDevice handle: 0x%04x (%s)\n", child->handle,
-	       child_device_handle(child->handle));
+	       child_device_handle(context, child->handle));
 	printf("\t\tDevice type: 0x%04x (%s)\n", child->device_type,
 	       child_device_type(child->device_type));
 	dump_child_device_type_bits(child->device_type);
-- 
2.44.1

