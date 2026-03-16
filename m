Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71575F013CA
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 07:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0AE10E269;
	Mon, 16 Mar 2026 07:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QWSuli0y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DB610E49D
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 07:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773647952; x=1805183952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5c3Nfo8QTO/72/X0RgxLVia67uwXXGomhYkwr4O1m4M=;
 b=QWSuli0yFQQu85ECNYn2ETOuita+S4iLIVoRTgugGMEj4I8D223lzrDq
 Z2HzCYCHwDjFD/uVHlvNXIGBN8OpT4YDl33gzAye47JY8ayzyM7dMHsNS
 qfEOIec9IbChZKRLua//nY34CIDBJvYZm0qaSOpHiBSWV0NxtYCHhLN1r
 1+UzW9qnUhK3MbDnZvoMx9vBq8dgdSF5Q91PMhueF6zeQivtBwc2FjYcK
 ViE0f+vIprKuBSf+NTon4VcFoO912TzaOnlcMwnAb0QiMYB11su6sQd20
 tGKrEDU96SD0R7LwkFWimNqFFZ6C9oUuHBxGvaV5syj85kk96b7JrUVaf Q==;
X-CSE-ConnectionGUID: ALeOr702SDSg/uEnjUDxPg==
X-CSE-MsgGUID: taKaU/2LRZS8zzOfR3WBQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74541982"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="74541982"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:59:12 -0700
X-CSE-ConnectionGUID: Ug4UK1I3RfmphjipyELoXQ==
X-CSE-MsgGUID: /ipaxFS9S6S1Mu0rPXfM4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226826058"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:59:11 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com, kamil.konieczny@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v3 3/5] intel-ci: Add VGA chamelium exclusion to Xe blocklist
Date: Mon, 16 Mar 2026 13:26:09 +0530
Message-ID: <20260316075611.3333142-4-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260316075611.3333142-1-mohammed.bilal@intel.com>
References: <20260316075611.3333142-1-mohammed.bilal@intel.com>
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

Remove VGA-related subtests from the Xe chamelium testlist as Xe
driver does not support VGA connector types.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index edc5039a9..80a0ee904 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -128,3 +128,7 @@ igt@xe_exec_compute_mode@non-blocking
 ##################################################################
 igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
 ##################################################################
+# Remove VGA-related subtests from the Xe chamelium testlist as Xe
+# driver does not support VGA connector types.
+##################################################################
+igt@kms_chamelium.*@.*vga.*
-- 
2.48.1

