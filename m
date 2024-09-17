Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7771C36006
	for <igt-dev@archiver.kernel.org>; Tue, 17 Sep 2024 09:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D8C10E208;
	Tue, 17 Sep 2024 09:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPaRtMaq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2779210E212
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Sep 2024 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726566843; x=1758102843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n93FF3n0lRgvw5sql8hLtvEkhO8HnUVRAwzDQ466PZQ=;
 b=bPaRtMaqHIX4W947gjJVeZwJ3aMaxZqS07TXBjH31FM2GWiyHhOZImNx
 iv++t/qIhkjNddmjVJrBQq2PKDzJ9Qh6fvGH5whZevyHzymFFAMNJIC9n
 herrXlU101dPVXPd1EyasUeaUJilvyuFWAEw4YnOU92lDl2R83fKmDd31
 X2VQDAEXfk2hzqHrvcVSYkUY/FkFrBXJJIy85wgc22G+AYkmVIN+oueWq
 cFiIQUED+FPrhONep2awXlUUV11hr9XKmphYcjdLA2RsDJMfn05C7zetf
 X1150IDF+Co1BrM9mCYo00Y4LScPzAtYPc2x00kA65gG+/SMT0zLxedXd Q==;
X-CSE-ConnectionGUID: rmCp6V/vTw+ijyjjQQpF8w==
X-CSE-MsgGUID: ehu08AmhQHGOhV14w5YIuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="47923434"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="47923434"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 02:54:03 -0700
X-CSE-ConnectionGUID: hIGLZhMCRH2lpSrc9d/pvg==
X-CSE-MsgGUID: 8lYQmRPKROeGoDLdpPgsmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69012362"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 02:54:02 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 2/2] lib/igt_kms: Don't abort in lib helper
Date: Tue, 17 Sep 2024 15:14:22 +0530
Message-ID: <20240917094422.938032-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917094422.938032-1-bhanuprakash.modem@intel.com>
References: <20240917094422.938032-1-bhanuprakash.modem@intel.com>
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

Instead of aborting from lib helper, simply return the
status to the caller and let the caller to decide to
abort/skip.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9313e4c27..b40470c02 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6596,7 +6596,10 @@ bool intel_pipe_output_combo_valid(igt_display_t *display)
 		combo++;
 	}
 
-	igt_assert_f(combo, "At least one pipe/output combo needed.\n");
+	if (!combo) {
+		igt_info("At least one pipe/output combo needed.\n");
+		return false;
+	}
 
 	if (!is_intel_device(display->drm_fd))
 		return true;
-- 
2.43.0

