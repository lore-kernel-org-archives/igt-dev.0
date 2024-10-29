Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFFDD3A67A
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 18:23:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB31310E6C0;
	Tue, 29 Oct 2024 18:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKDlNv04";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2C710E6C0
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 18:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730226190; x=1761762190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kPKozPejA8OD9r0831nY5b5zKBV4tu8jkAUY8wv8BnE=;
 b=jKDlNv04nns5iZjlSkf5uKeQjrnIeYC1PwkC61SlHs/b68mMPlVQdW41
 tvNBc3cKfLF1uL0wNDMAVGAa0GMb/ZfJwgSmxZ7pkLfqqHo2zTadRUZyh
 c0EORNlQUixdHWm4sb98tKvxt6ZXpRQgwXb40PhlmeGtWN9USaIFcZUMQ
 5n4wJmq55+k4PmLP2F8dISU9X+4O2Yr8vRIUYiloPEPtUJefSL+ijXw1Q
 J9fJXs+13cFytc8rD+GsNJnx80oXjOridt2N19WZ1MRdlrQ5LtvTQHS1b
 h9Xk1LBOwrQjIX0x3LBCuw7viDFPVH0bSmig3k+wucY6Yh2LUlBqTH2n4 Q==;
X-CSE-ConnectionGUID: dW5jFJvgT0mVshaTqIpZkw==
X-CSE-MsgGUID: 0xGg4f5wQ0+jO4Hdc2vWgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="17524560"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="17524560"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 11:23:10 -0700
X-CSE-ConnectionGUID: yKoth2eJT6ejP/7ahIVkOw==
X-CSE-MsgGUID: QyvL83N7S+CEikv3reNw7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="86604361"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.27])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 11:23:08 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/intel/xe_wedged: Ignore more dmesg warnings
Date: Tue, 29 Oct 2024 19:22:58 +0100
Message-ID: <20241029182259.125117-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029182259.125117-1-kamil.konieczny@linux.intel.com>
References: <20241029182259.125117-1-kamil.konieczny@linux.intel.com>
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

