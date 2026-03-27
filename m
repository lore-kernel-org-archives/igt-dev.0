Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FF910ED663
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 12:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A2310EDE9;
	Fri, 27 Mar 2026 12:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YnSgBcKB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D68710EDE9
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774613714; x=1806149714;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mOJzEUgW1cnKb5MIRsCAyApqWV1/WAjSJETRgqr6ZpA=;
 b=YnSgBcKB56/APa6IFd/PX/OeQ6WJY8AOs/TyfmWJecheEMNTXnitDyIW
 beaVmGSzwVCcLxhmxvYrLitK+CMwqrGkT1+kVllwV5n15keyksh+VQQff
 tvjgxY2rGu/TsB2dwPiliQIKSQ+KpZpVTv5wJPtALt4Akj9CzhBDpnrA4
 /JDJogvewijQXkkvw3DLH0C/s5jyrQ2RHrnKMF7553Tm1LxUP+WkGRD4L
 1YoL3PGEsLLOvZvnTURr8z4zCOAnRYTSYx1vJVZbH9voyhWiurcsJvxCm
 AFGit2bV9H/HeSGXIiIqzbfwrNEJcfixgcl1/miokKAqBXY94C5H/IR83 w==;
X-CSE-ConnectionGUID: +2b7ancdS8mXSGPHXaguWw==
X-CSE-MsgGUID: xLDD4gpeTamb3xrpNCltOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75752677"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75752677"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 05:15:14 -0700
X-CSE-ConnectionGUID: Wl65SR+PQbGTjDL6PKtm/w==
X-CSE-MsgGUID: CD+Y8cIeQ6ejTDpjY1HhBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="255794137"
Received: from intel.igk.intel.com ([10.211.135.221])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 05:15:13 -0700
From: Piotr Rudnicki <piotr.rudnicki@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>
Subject: [PATCH i-g-t 0/2] xe/eudebug: Add dead-peer context logging
Date: Fri, 27 Mar 2026 13:10:40 +0100
Message-ID: <20260327121042.1133617-1-piotr.rudnicki@intel.com>
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

Improve dead-peer diagnostics and context propagation in xe/eudebug token
synchronization. Add event logging for timeout scenarios and refactor
the wait-done API to propagate debugger context for enhanced 
visibility.

Piotr Rudnicki (2):
  lib/xe/eudebug: add dead-peer context logging for token waits
  lib/xe/eudebug: pass debugger log into client wait-done path

 lib/xe/xe_eudebug.c | 108 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 97 insertions(+), 11 deletions(-)

-- 
2.43.0

