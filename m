Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93D9C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 14:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2BA10EA0B;
	Fri, 14 Mar 2025 14:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7vPt4Tu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9195510EA0A
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741964374; x=1773500374;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=PVSYC0qG+B4O3ETt6Fzip8XQC2KeXmqhyHw5wVCjiUk=;
 b=R7vPt4TuMj5OjXjYJIDF9n5LY0P9lJOREmzTYvQLdUd87Iq/+8oKy1UK
 DX2CEGFgq/mNvQyJ9zgRrAh55MFDJKSWmV/0AsOLNginr+JuIaWR30XmB
 JwZbDtFye9LJNBoBfsKhcDR7D24oArzpePh1WYGmkv7zNqrqALiMziwjA
 dbccAi3cpO+s6Md7vURs917+WVUXoN4vSQR5eOFNNFjzRiu9vh/EFoTXT
 bFu44LEeFjpg3vEHzBEDkOPBicmX5tMQmK7reCCB9fiJ64Uh41LX0EFKy
 lfHtwTb5Pe9DcufvGfK2iY34bZzYBLSrFjywxJvyR6z16P4hUXs69G0tm g==;
X-CSE-ConnectionGUID: 9EjsyEDrRd22mEvMLjWBig==
X-CSE-MsgGUID: WTosemCcThCw+FvsvAtMjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43025090"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43025090"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 07:59:33 -0700
X-CSE-ConnectionGUID: 2cFgh90hQ5CC5gY294eU7A==
X-CSE-MsgGUID: f7EGSVanRTK6McYMNato0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126178704"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 07:59:32 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 14 Mar 2025 15:59:11 +0100
Subject: [PATCH 4/4] scripts/generate_iga64_codes: remove parenthesis
 around ARG macro body
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-iga64_misc-v1-4-b2d1337b808d@intel.com>
References: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
In-Reply-To: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1077;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=PVSYC0qG+B4O3ETt6Fzip8XQC2KeXmqhyHw5wVCjiUk=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBn1EROHqJanD159vH1ui0M+sowFk1QGWYyF0z7Ktvf
 JK4usk6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ9RETgAKCRAjYrKT3hD91+XKC/
 4oNZb/hgXcIJs5JVkY2eC/w2GGoz1AqKnFLvEdLlf8IOOt9Qmt/a8otjFKtNSang/jin3fwBAnNFra
 GPMfPoRQWnczOznymnFL8FvYW2O/lClA1H1hyau4tFCVhfHPbgnRaBcDISkN6tD7ttumhkRXoMl5fg
 Op/3xKb7GNzCnjgUByQ4QsSyG2SmPu9a7EVG2v0FZfzK/kuA9skDSvGUzMIVXP6KCgBSQAVaN4YfWX
 6TPhkYekvD6ZbsamEhJ3SEJqkNeOz+kdRwIWAqjxZWlrK+34Pei14rfMjGAiCu/K0csNX7xabQdElY
 EcK6+VPvKPMHzFkDdI7LSGknIUZpxSk7dAXao0Gq/RN0Th6fRD4IMUoslIbab57BaAsVa9RNnL3N/7
 jyzhgOcYftANLv7xRcLe7BKKbxfAvtGHggvSCE4FdshJ86cus/29Y/0tZPXemBnVze0BI/Guuo7G5G
 rf7Fcib4BNRPyVJooqhW39Gf5dHP5j9UtFsaOw8MH6F+U=
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

Parenthesis around macro body were added to follow C conventions.
For newer platforms they are not allowed in such context.
For iga64 they do not change anything and can be omited.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 scripts/generate_iga64_codes | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
index bfef0e5c2853..1675ffe639b3 100755
--- a/scripts/generate_iga64_codes
+++ b/scripts/generate_iga64_codes
@@ -92,7 +92,7 @@ EOF
 # Compiles assembly to binary representation sent to stdout.
 compile_iga64() {
     cmd="cpp -P - -o $WD/$asm_name.$gen_name.asm"
-    cmd+=" -DGEN_VER=$gen_ver -D'ARG(n)=($IGA64_ARG0 + (n))' -imacros $IGT_SRCDIR/lib/iga64_macros.h"
+    cmd+=" -DGEN_VER=$gen_ver -D'ARG(n)=$IGA64_ARG0 + n' -imacros $IGT_SRCDIR/lib/iga64_macros.h"
     eval "$cmd" <<<"$asm_body" || die "cpp error for $asm_name.$gen_name\ncmd: $cmd"
     cmd="iga64 -Xauto-deps -Wall -p=$gen_name"
     cmd+=" $WD/$asm_name.$gen_name.asm"

-- 
2.34.1

