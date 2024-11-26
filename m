Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAEAD6553E
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 18:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B38910E9A2;
	Tue, 26 Nov 2024 18:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEVXQ4Vq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0D310E9A4
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 18:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732644658; x=1764180658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qEb+Po/yR2KA14dyQK0VGNM6+3DtIYJUdBwArvBLMLM=;
 b=IEVXQ4Vqz8GRNArC9L2Rz9r2q183OjbJvPjN0H0C1EH76mkHir6sbIry
 5qeo2DO8UfXmi+FP72g9Hzp5hgx9I1Kq4MLl7laitWBQ6c4We5QKa9a2B
 zDmVqG0C7G2Y+mCP2tumbU+9QdWHLSTAaklQbQ/mm8OgWmjrPAyiW4Mtr
 70MjR4V0o21mEZZKLu5IykzroSKc6Quw7bCBzrr+qis881nfzzInonq6y
 HA37462vMn8gie5dH/X/77pV6qhzSGkgguhLaK08+cUYyaJKiNXDCGZXo
 CKKdmt0ROPuNnh/nNYThz8LSmfzet2y9ndkXjHeL3l2LmxpJ4kxmkEheO A==;
X-CSE-ConnectionGUID: 3qmPkO/mT3mslMipgU9cTw==
X-CSE-MsgGUID: dcNM7y2cTzClkFOQbTlxFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32952181"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32952181"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 10:10:58 -0800
X-CSE-ConnectionGUID: RlxQRtJDQqSUlwMALcUb2Q==
X-CSE-MsgGUID: daSSeqmyRNeGviAIfNQyeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91583196"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:10:56 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v4 1/4] tests/intel/xe_wedged: Ignore more dmesg warnings
Date: Tue, 26 Nov 2024 19:10:20 +0100
Message-Id: <20241126181024.1398259-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
References: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
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
v3: fix and simplify pfx___drm regex (Kamil)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2919
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_wedged.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 88e5d47f2..9a95a2455 100644
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
+				    "|__pfx___drm_");
 }
 
 static void force_wedged(int fd)
-- 
2.34.1

