Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6C7C3ABD4
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 12:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D5510E3E4;
	Mon, 12 May 2025 12:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Exd/8FwJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AB010E3D8
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 12:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747054447; x=1778590447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3OPmahnsCKHe926RQDQx4Js/EbJgvzJckZQLjFtrRjU=;
 b=Exd/8FwJrxR/M4sLuJZWoBkxEWQ1gpU2VVnYYofTLSdef7QsMSURMjiy
 2sXeA1fL9VU2J0H6QtVbRXE4VW4yX+Z09RcBBADEV9/YCEZIj3BOqsupk
 xLrUhNpV5luvqjM+K97GdRjeE97SPuFBQwIfgQYb/2t4IPfPLhGbkuezN
 ckUq/6QGBu6b9bL+5OiKSwQzyDCF795f+3L0u2VJ1yDtK5D7Q/lRRj3c4
 TgrAnvpc4FTtGQbdPeK4fN3LUXA4RY9XMLz3QiIJu7mz3kYJJl94cX1W8
 1WiDBVCqBrIrg82RTQjaHUtTUT7vcrxIWb9nlyec4okAxXmgHx/n2wh4g A==;
X-CSE-ConnectionGUID: uQo7dU9WSO6Fp6m7Jk4rFg==
X-CSE-MsgGUID: CrIwXy8aQG6eCoMKmJbdmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48967558"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48967558"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:54:06 -0700
X-CSE-ConnectionGUID: MwizAkxCRJ2LC7CFOoPSyg==
X-CSE-MsgGUID: ZdO0xbIBTFa7lMmVLj7TGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137828355"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.35])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:54:04 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t v3 1/2] intel-ci/xe.blocklist: remove
 device_reset@unbind-reset-rebind
Date: Mon, 12 May 2025 14:53:54 +0200
Message-ID: <20250512125355.99620-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512125355.99620-1-kamil.konieczny@linux.intel.com>
References: <20250512125355.99620-1-kamil.konieczny@linux.intel.com>
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

Remove device_reset@unbind-reset-rebind as it should work for Xe.

v2: unblock only *-rebind subtests (Marcin)
v3: keep blocking .*cold.* subtests (Kamil)

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 7f4dbcd27..3cb10296d 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -37,7 +37,8 @@ igt@xe_live_ktest@xe_bo_shrink
 # Exclude all other non-Xe tests
 ##################################################################
 igt@debugfs.*
-igt@device_reset.*
+igt@device_reset@.*cold.*
+igt@device_reset@.*reset-bound
 igt@drm_read.*
 igt@dumb.*
 igt@prime_.*
-- 
2.49.0

