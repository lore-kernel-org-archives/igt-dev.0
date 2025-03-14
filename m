Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C06C35FF3
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 14:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447EF10EA09;
	Fri, 14 Mar 2025 14:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4mz3q0A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1040C10EA08
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 14:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741964372; x=1773500372;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=jEV32brGpNtd7rCTYHI+H6yRLQ9rhUu5LwyVhybhvcA=;
 b=U4mz3q0AURyPMtN2pH+yu1GZNJLvb8B+QA9sbpapEbUAwEpKtLw+WY0A
 VDuhz34m4SCRiPQ4yh+U3w/zYrVcQVw/BTqHrmRoYefVHuaIicXaYmOPI
 ZWZmDS7eFxhuuH+RhIatEWP4H6uyMXNhLuQNZXLrZEDceDQXsH2trsmA0
 2WkiqYFKyR6520W1vh2DKZo9mnIgIsNgcys8I6gHSyqm6WNat/O0koX0i
 KhQxbgjAcGOcmf1L1qB/8asKg6lNigFESP0VVtVgrvtNgEJNXAThzqJSj
 bYaN0nkUuzd4H+aOmjb6DKRknCAlxyzH6PO8gUyWMwwsnGnBOnjT/RghV A==;
X-CSE-ConnectionGUID: r1VO6aXHQsSobSK/5yKEMQ==
X-CSE-MsgGUID: QwWkpmL6SoCRiDGVrfwSBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43025089"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43025089"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 07:59:32 -0700
X-CSE-ConnectionGUID: PtMrqYYzSVGf0I0pbLh82g==
X-CSE-MsgGUID: aJz8VadmTwOgLU0usUDCCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126178699"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 07:59:31 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 14 Mar 2025 15:59:10 +0100
Subject: [PATCH 3/4] scripts/generate_iga64_codes: fix handling empty asms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-iga64_misc-v1-3-b2d1337b808d@intel.com>
References: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
In-Reply-To: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1336;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=jEV32brGpNtd7rCTYHI+H6yRLQ9rhUu5LwyVhybhvcA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBn1ERN+pcDlNx/pKcLqRXqAuMPn/6o8Y6wqLnDjXs9
 JXRzp82JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ9RETQAKCRAjYrKT3hD91xPVC/
 0UatwmuZCemIQlACdNog43vPOqkWDzcpRord9VeWtDioiTMGHNIZXPsD09T16U/f/Y8UTgXK0FaAJB
 eBfDFb9D4DdXPbo35gs/gu0632V19w20FXEAz7lSIefbaC1CDbW1iGr9sU2CNQwnbYivp9vYz7hf/G
 Mfnl4m9Eaw4jOA71FHi/hoUrKzuilOWzLLwhl9XCT9QtIPQ7Ch2Cdqob705G3tJpXLiGFP7unc+0k7
 TUO7VSnU98MWcu9C5GyIGKw9APqXa0rGTmVfA0y4HYuyJUPyr4/CS0U/p4nzyUVdxKosBmkWjdkX1J
 08TxM+V8gF+dczwy3EYLJ4FNijJCk9P8tbRZLgofG++5NTSUjeT8eeNZOpLRL0boUEdF1WFCU8ZJKZ
 d0E1e1YWQBAWfKFEqdrW6laa0BIGNfmtfPRxAq4VofdDReuC31WzCCVE/fDfMj1M6nQiRU4myL4c0l
 tLV4+l2YHe7yqGd9QPv6GYmtyP3Yy9TPLjNAu8KHOqiJE=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Script incorrectly handled empty asms in case of the newest
platforms.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 scripts/generate_iga64_codes | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
index 16bdc6fd6d0f..bfef0e5c2853 100755
--- a/scripts/generate_iga64_codes
+++ b/scripts/generate_iga64_codes
@@ -104,7 +104,7 @@ for asm in "${ASMS[@]}"; do
     asm_name="${asm%%:*}"
     asm_code="${asm_name/assembly/code}"
     asm_body="${asm#*:}"
-    cur_code=""
+    cur_code="NONE"
     cur_ver=""
     echo -e "\nstruct iga64_template const $asm_code[] = {" >>$OUTPUT
     for gen in $GEN_VERSIONS; do
@@ -117,7 +117,7 @@ for asm in "${ASMS[@]}"; do
         done
         SHOW_CMD=1 compile_iga64 > "$WD/$asm_name.$gen_name.bin" || die "Cannot write to $WD/$asm_name.$gen_name.bin"
         code="$(hexdump -v -e '"\t\t" 4/4 "0x%08x, " "\n"' $WD/$asm_name.$gen_name.bin)"
-        [ -z "$cur_code" ] && cur_code="$code"
+        [ "$cur_code" = "NONE" ] && cur_code="$code"
         [ "$cur_code" != "$code" ] && {
             echo -e "\t{ .gen_ver = $cur_ver, .size = $(dword_count "$cur_code"), .code = (const uint32_t []) {\n$cur_code\n\t}}," >>$OUTPUT
             cur_code="$code"

-- 
2.34.1

