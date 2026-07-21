Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C67C4452B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 19:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8253F10E3BF;
	Tue, 21 Jul 2026 19:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fT9KtduA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8E310E3AA
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 19:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784660439; x=1816196439;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=LptxazOePbeEl8pqiM/NcZVnYcnJ2kOYAbc7Wl+zxS8=;
 b=fT9KtduA8fTUXWajewThZYJszbibwgTLrFsT6MjvG4DzeeA9mJ2pxJfm
 gNiuYaV9IxoTataxzGhzCu0jQLp0NVN0HPua1U9Eb55JAUP2idOQIduA5
 W0i3ma1gOIoXb8lVVSxnI94U7dx7KjTFGCSQzOiBC0yhD9B4rJXr+dowT
 PCSheTL+fzBbamPFbso08xKThWuB0SYaejaUyoY7I9Aod0TTtBHhw+tOf
 itrR/wFgGLmsqbcG5ZcHgBNOgd8lZ7K7TzGlZiccb9JMkgDpia2b7xAMA
 39DPYfo6+kRWpQxeTcmSp+OSI5+djMbQFT6d57aWck2aup0owUxKqu6nO w==;
X-CSE-ConnectionGUID: M39OABZUS2iy6PD7knvkgg==
X-CSE-MsgGUID: xTVdSTL3STSEbiMZlLsPRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95637702"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95637702"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:39 -0700
X-CSE-ConnectionGUID: TWmHtcG9QViAr3Qh2t9HBQ==
X-CSE-MsgGUID: nFBtYmJnRSeQ924woRRRFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="258516584"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.232])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:37 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 21 Jul 2026 15:59:59 -0300
Subject: [PATCH i-g-t 06/10] tests/intel/xe_pat: Adapt pat_entry_is_wb() to
 Xe3p
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-wa_14026539277-v1-6-0c147eeefefa@intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
In-Reply-To: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Xe3p introduces a new device-cache policy called XA, which has the
longer name "WB Transient App".

Even though commit 4e59b8e7779b ("lib/intel_pat: use kernel debugfs as
authoritative PAT source for Xe") already gives a clue that XA is a
"write-back" cache policy type, pat_entry_is_wb() doesn't really
incorporate that information.  Add the necessary logic to
pat_entry_is_wb() so that it also considers XA starting with Xe3p.

Bspec: 71582
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 tests/intel/xe_pat.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 9dd4ffb69d11..bb2975b545e6 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -142,6 +142,13 @@ static bool pat_entry_is_uc(unsigned int gfx_ver, uint32_t pat)
 
 static bool pat_entry_is_wb(unsigned int gfx_ver, uint32_t pat)
 {
+	if (gfx_ver >= IP_VER(35, 0)) {
+		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
+
+		return l3 == L3_CACHE_POLICY_WB || l3 == L3_CACHE_POLICY_XD ||
+		       l3 == L3_CACHE_POLICY_XA;
+	}
+
 	if (gfx_ver >= IP_VER(20, 0)) {
 		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
 

-- 
2.55.0

