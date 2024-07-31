Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16E1C49EA1
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 03:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6439410E2DE;
	Wed, 31 Jul 2024 03:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPTHCNZv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBF410E123
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 03:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722396928; x=1753932928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nb4IOJ90j3uFyLLbRv8pGQ/AbJ4bqtvfjwj3hqiGyA8=;
 b=EPTHCNZvQolZDUIs8BC06xKaji66qIPo6hVYXhUUq/jScL4ObC26wIYJ
 YhrcD3Y2XUNJjGP+Un36XvyAf19AzhrJ9P0eIeVf8Nz8GWbm9Xw43NHrW
 EZe6toVwCYeuVwPsA4WLhbZHdexmTBOqiIZbQ9Xm6WlCh9+nC+09Xdjy/
 M/XrJU2YAiF9YACPWgpyPwELz4KKQ4rlYhGO2BKoDAPVWAEyDE/E22hhr
 1hScvnEqsO52tssRVrohaIivBPDo4hLNDKxSvf+bo85pbjxfaBoFH+8QT
 5n60riqrSrdGhJVdzTPiD1xFUllGf5TfR1rpPCEpEy/LY4aPxMwinB5lv w==;
X-CSE-ConnectionGUID: xvbdaHDnQyCqg19LexYVgQ==
X-CSE-MsgGUID: KHHseNVKSj6gLV+A+e8cFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30917874"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="30917874"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 20:35:27 -0700
X-CSE-ConnectionGUID: Fumqau39R6WvSyhvyg4Efg==
X-CSE-MsgGUID: h4LcRVr8TzOgkF8aLo0MIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="54538334"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 20:35:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/3] lib/xe_spin: Fix ending the loop
Date: Tue, 30 Jul 2024 20:35:04 -0700
Message-ID: <20240731033504.1426640-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731033504.1426640-1-lucas.demarchi@intel.com>
References: <20240731033504.1426640-1-lucas.demarchi@intel.com>
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

Less likely to be a problem with optimizations than the started
condition, but let's stay on the safe side. Comparing to igt_spin_end(),
that one uses a sync_write() to force a MI_BATCH_BUFFER_END in the
beginning of the loop that has a even stronger guarantee.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/xe/xe_spin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 43a7a43c2..f8b225125 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -183,7 +183,7 @@ void xe_spin_wait_started(struct xe_spin *spin)
 
 void xe_spin_end(struct xe_spin *spin)
 {
-	spin->end = 0;
+	WRITE_ONCE(spin->end, 0);
 }
 
 /**
-- 
2.43.0

