Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB60CD3439
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 15:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1736D10E27F;
	Thu,  7 May 2026 15:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GiZDjKJw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A62A10E27F
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 15:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778167025; x=1809703025;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=cyTjqVOIQjzBVbH0FD1QIsYc7X5pZEiIVRxkLDikZlM=;
 b=GiZDjKJwn0G3lm2iXz+jPhWookdk1TpqBobnGVxz5z+tjgcgVAFz5TAf
 6tP168eOluEuiJGWisd1Vkq/xD9dVDACrVtQCNXU8DeVVCQlPA4Xw545h
 rVLfeuoXb3hHHDvvrH/JRkaCzhNP6rXuDsdUbKMOfZYJ0rjS87BnfjExS
 REje2hoBObFZh972LVV0XlFu9/6w701svwo9nOHaruYFBRwGEUaP8uWsA
 96DbkupyWKwq5AzZXJVcBL7MjiAGgWRLlCg9N2+B7ExOA95gkZ2lZzfpv
 B7Uj3R04C2AcEWC3W8n8b9Xr5oNA8zscqH6Iz3W1GTqJNEm/oRecqSlgw g==;
X-CSE-ConnectionGUID: JfS2Yf6ESfi7vsxpNR5rwg==
X-CSE-MsgGUID: tjsM2+gpRcqDvmSh3vCpcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79020690"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79020690"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 08:17:05 -0700
X-CSE-ConnectionGUID: 7DS7aK5ETdCvRZn29KH5ww==
X-CSE-MsgGUID: RxFXccYbTEWONFCTZMAFBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="241469626"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 08:17:04 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 07 May 2026 17:15:40 +0200
Subject: [PATCH 1/2] scripts/generate_iga64_codes: add env variable to
 force asm rebuild
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-switch_asms_to_raw_strings-v1-1-487fa0f9ea2f@intel.com>
References: <20260507-switch_asms_to_raw_strings-v1-0-487fa0f9ea2f@intel.com>
In-Reply-To: <20260507-switch_asms_to_raw_strings-v1-0-487fa0f9ea2f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=cyTjqVOIQjzBVbH0FD1QIsYc7X5pZEiIVRxkLDikZlM=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBp/Kyl9zCAyfjhWKHtLUF70ZCubF7XClQ4AyecL
 BqoIlEUuNaJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCafyspQAKCRAjYrKT3hD9
 12UhDACgsDVADlQ2suTLups3Vnah0Z0Mne/ZsMrmAtWxSU2kPQ0+Eogo0ot6QgaabGGpur8uK2z
 RDWQC9OO+TutMa2JJihcFXxQNJlrFaRgxPwBSsd2k+PqTR1Mn6GKe1sCMZ0dgDO/IRx/CU7W2cU
 7lgZjLTz/aY7pAZxlPzYWdNAIx155HSSxcEgG2HKY2pkQenjDYAHr2dxBLJlr6eNy3VP33eTapm
 7tazp/UmTa/JUijPKefaOSy7BchOZHPiTvvLbmuoO11asK0lVuvp7BoE/aawtm78ydL1SlvRXv1
 wtr+3t7TPn8b0Y9NtQDLYwjPocZP+6hoZQE7Y5RQf8wOU5usBMNWGQyh9v1SMe7euDlEZhuOJX9
 JlkPsYs0Y/R202V3g/S8klY82VqYq6yY6qMwbfn477+tOsAEeAdUnurvvPpAVMOHUYD1QWs3rc3
 12AramdL7IiZY8k7McsW9fdMsoo50xR+ou8fJQjGJ5XZCAga9zp55XZ3A7YmlxNpYrnZg=
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

In some circumstances it is convenient to rebuild all iga64 asms.
With introduced env variable it will be possible to do it with command:
ninja -C build -t clean lib/libiga64_asms.a && FORCE_IGA64_REBUILD=1 ninja -C build

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 scripts/generate_iga64_codes | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
index 0a5fbef921e1..e3189d80041d 100755
--- a/scripts/generate_iga64_codes
+++ b/scripts/generate_iga64_codes
@@ -45,7 +45,7 @@ done < <(objcopy --dump-section .iga64_assembly=/dev/stdout $OBJ /dev/null)
 MD5_ASMS="$(md5sum <<< "$(< $IGT_SRCDIR/lib/iga64_macros.h) ${ASMS[@]}" | cut -b1-32)"
 MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/null)"
 
-if [ "$MD5_ASMS" = "$MD5_PRE" ]; then
+if [ "$MD5_ASMS" = "$MD5_PRE" -a "${FORCE_IGA64_REBUILD:-0}" = "0" ]; then
     echo "iga64 assemblies not changed, reusing pre-compiled file $INPUT."
     cp -p $INPUT $OUTPUT
     exit 0

-- 
2.54.0

