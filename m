Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AADEC35FF6
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 14:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DAB10EA0A;
	Fri, 14 Mar 2025 14:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfVR0vYb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD05110EA04
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 14:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741964371; x=1773500371;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=8LmYE6CCpomZxpFys/fw28gc5yWaP2RDjTLD1gBfqmA=;
 b=YfVR0vYbfJDQzSOn1MQq4iS4uJcK3ObvvDbIKZr5endZhje5ihqbBFrQ
 xkWBlXDFWIhcpfrTtOlQk6dd1fBiwjwAjFp/JMBgYQmF5hrGnLV50GSEQ
 GgObfuf98AUoTFb/sBfP8RKUJGg0rlas38qrhK/WgZf1cyXLDCGNfjcKm
 J8C0JJnVzw/5rwO2G81j+yk+YzNIR9bAhsJPvp6ia+BUE8CGCgLrP/JXW
 S5uiXALaB6PQIbqfbx7C4QNMs5XKWmSrWpqaTUuSgJXUzz9rkdnQF99Gv
 0R5b969ad35Nhyhq1vlSfAGM6y8q+UwtFpNqneWzhwjFZB+rG8kwjnlKg A==;
X-CSE-ConnectionGUID: CZGwV6CbSYO/RXPucP6rYg==
X-CSE-MsgGUID: NjxpCQ2YRduM/6A6y20uaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43025081"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43025081"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 07:59:31 -0700
X-CSE-ConnectionGUID: U4b8xZW1SGyrMLw60cS8lA==
X-CSE-MsgGUID: 3K6jRzhjTH2OxgVQHn+MSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126178694"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 07:59:29 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 14 Mar 2025 15:59:09 +0100
Subject: [PATCH 2/4] scripts/generate_iga64_codes: make script less chatty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-iga64_misc-v1-2-b2d1337b808d@intel.com>
References: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
In-Reply-To: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=8LmYE6CCpomZxpFys/fw28gc5yWaP2RDjTLD1gBfqmA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBn1ERNPjqMd8R905bKdRDcINZKxdYAh4ok8pQvkpBc
 jp5tAA6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ9RETQAKCRAjYrKT3hD91804DA
 C032pmrLBtRV77NANvTFaAIE8+vEiomb+5NfE5IpHM9csSFeqkSRlFnI9IsI5Tb2xzXFzKJXFBdmsK
 5m/j0EPfrM2Vj+A4KFk26UgegT6ukveRvQhHzLyznpxxEgC7WBUftXMTwHtWxp6mkdnAClVfEHeboJ
 Ve19R6YZBq5nQhgSQg4RfeFgOU3aY3UfNlcoQDPqxgFjoQyIzOMvlvZ5TJY57tHmQ6Zr2dhRzDt6WE
 FlX9kJl9uVcs1zDo2asLvOgddSoRiYcEA+MoRPAPf4Fjz62+XDnSS2YNA0c0Lk7PTViW7NAUYO3m3N
 E7vkztzH/LCrb7EffzYGgQ/W441naDbfWLlZ2gx4xuuSn8XfvImBqf1iOsZZ/JISElNa5Z3WBp71uU
 P/B76qB9NH6IgpbNmWocHRFUuzzSiohsIq42XGx7sJXAtpA8kymlXVnakquabDCa9qANcsyVoofJ78
 fN69ujaoCecziHQsXbznL3ZSdA/7wYu44Ky5CvbNa7eqo=
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

Script generated three redundant lines per compilation.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 scripts/generate_iga64_codes | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
index 3f207e9ff1a8..16bdc6fd6d0f 100755
--- a/scripts/generate_iga64_codes
+++ b/scripts/generate_iga64_codes
@@ -96,7 +96,7 @@ compile_iga64() {
     eval "$cmd" <<<"$asm_body" || die "cpp error for $asm_name.$gen_name\ncmd: $cmd"
     cmd="iga64 -Xauto-deps -Wall -p=$gen_name"
     cmd+=" $WD/$asm_name.$gen_name.asm"
-    warn "$cmd"
+    [ -n "$SHOW_CMD" ] && warn "$cmd"
     eval "$cmd" || die "iga64 error for $asm_name.$gen_name\ncmd: $cmd"
 }
 
@@ -110,13 +110,12 @@ for asm in "${ASMS[@]}"; do
     for gen in $GEN_VERSIONS; do
         gen_ver="${gen%%:*}"
         gen_name="${gen#*:}"
-        warn "Generating $asm_code for platform $gen_name"
         # Verify generated code will not contain IGA64_ARGs.
         for d in $(IGA64_ARG0=0 compile_iga64 | hexdump -v -e '1/4 "0x%08x\n"'); do
             (( (d & IGA64_ARG_MASK) == IGA64_ARG0 )) || continue
             die "Assembly for $asm_name.$gen_name contains instruction which compiles to $d, conflicts with IGA64_ARG0/mask $IGA64_ARG0/$IGA64_ARG_MASK\ncmd: $cmd"
         done
-        compile_iga64 > "$WD/$asm_name.$gen_name.bin" || die "Cannot write to $WD/$asm_name.$gen_name.bin"
+        SHOW_CMD=1 compile_iga64 > "$WD/$asm_name.$gen_name.bin" || die "Cannot write to $WD/$asm_name.$gen_name.bin"
         code="$(hexdump -v -e '"\t\t" 4/4 "0x%08x, " "\n"' $WD/$asm_name.$gen_name.bin)"
         [ -z "$cur_code" ] && cur_code="$code"
         [ "$cur_code" != "$code" ] && {

-- 
2.34.1

