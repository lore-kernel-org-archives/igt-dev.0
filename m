Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2ADD64085
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 20:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9EA10EA37;
	Fri,  8 Nov 2024 20:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0xRKSU1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CBC10EA3C
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 20:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731097130; x=1762633130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kPKozPejA8OD9r0831nY5b5zKBV4tu8jkAUY8wv8BnE=;
 b=A0xRKSU1uqDtpd/zuYL4qGmo3OIR3GzBmnEgEAqTrNc1MetnJOnqtmUh
 E9WRXcbzJvInK6CHzL4zCK+dwvQe1pYTQgVgdCIKceSm5NZIgePXCJpqS
 ZaAiA/188xx2D11KfjkMFnER5y9wLDz7GPJjTsvexkpd8rhMqRYA2wH8T
 emikMb2H2NWOaDBA0+1HNdkPrd+DI/ENuMrHJrQHcGNdWNI6V+3CtLZne
 EJmaEe5+dcjoY+YaEABT802LT0tmi3lOkxsrIJf4rwWF8Uej6mDlmzGhi
 SwULgXg8dIka95DwQVRwdXKhAMQC1sbcFVEIPIoiMKEQ/FFNiRdFauNVd w==;
X-CSE-ConnectionGUID: wVqwipGdQ8GfPWKl8xh9OA==
X-CSE-MsgGUID: De8L5oPjQDCHsrGf7poVbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30390940"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="30390940"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:18:50 -0800
X-CSE-ConnectionGUID: L2mCOu7KTE6XMaHJKv4TUw==
X-CSE-MsgGUID: Bndlu4K2QiGxWCSC1of9Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85621326"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.135])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:18:49 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 1/4] tests/intel/xe_wedged: Ignore more dmesg warnings
Date: Fri,  8 Nov 2024 21:18:36 +0100
Message-ID: <20241108201839.119079-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
References: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
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

There are more warnings in dmesg which should be ignored,
one comes from driver, for example:

xe 0000:00:02.0: [drm] *ERROR* GT0: reset failed (-ECANCELED)
xe 0000:00:02.0: [drm] *ERROR* GT1: Failed to submit gsc proxy rq (-ETIME)

or from drm:

<4> [438.651441]  ? __pfx___drm_printfn_seq_file+0x10/0x10 [drm]
<4> [438.651476]  ? __pfx___drm_puts_seq_file+0x10/0x10 [drm]

or from kernel itself:

<4> [226.597358] Modules linked in:

so extend regex with them.

v2: move '|' to begin of strings for better reading (Jonathan)
  extend regex with two more, correct __pfx___ regex (Kamil)
  added r-b and correcting name in Cc

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2919
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_wedged.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 88e5d47f2..123ce6396 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -29,7 +29,11 @@
 static void ignore_wedged_in_dmesg(void)
 {
 	/* this is needed for igt_runner so it will ignore it */
-	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged");
+	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
+				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
+				    "|GT[0-9A-Fa-f]*: Failed to submit"
+				    "|Modules linked in:"
+				    "|__pfx___drm_.*drm");
 }
 
 static void force_wedged(int fd)
-- 
2.47.0

