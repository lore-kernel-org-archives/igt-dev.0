Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF68C43458
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 21:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635BD10E721;
	Tue, 14 Jul 2026 21:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZ/SojCr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C0510E0D1
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 21:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784063138; x=1815599138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S14juUbWOYiO/sFrFGIG7xy+3MlzRgqHBKv2idZKhhs=;
 b=IZ/SojCrVWMnDn7t1h7k1BYQzsEl1zsIDFWeKQbUAsdWS2DRikvNEl5y
 AB3ih1N+wqvL9fVeRx5YLDncHzCbUZufSucF2qVh3m1Mgf742Ifwadubp
 qatCGVUbTmn2KvlLjnyXdUx7PrEv8nGvaysslX2bTyXzDwL4BcfLj5Vl7
 AeARcPF7EScE/SgnINH0vUq5ZA0WrCH7feqUVxMaj/oNZxOZnk2wUCk2B
 25NxTH6TYbe2vTg3OZQoDdFDQy6AuWqZEf3fzF9b4Ce/l1gpaPMlukCcr
 lJDj9kF70/PE8H+padpGZC6NMAopF4kkX3WAVEZTnR8Za7XgpHzHdV0vp w==;
X-CSE-ConnectionGUID: /7eyRlrtShKttFFhGsNnvw==
X-CSE-MsgGUID: YlpV62vtTZOSOD3tG+G1+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88372436"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="88372436"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 14:05:38 -0700
X-CSE-ConnectionGUID: sxe7L027SBSrbNj2J1Ha9g==
X-CSE-MsgGUID: bZT1lqWOSgCmp6/9c/HPbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="280386247"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 14:05:35 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 1/2] tests/intel/xe_survivability: update ignored dmesg
 regex
Date: Wed, 15 Jul 2026 02:27:49 +0530
Message-ID: <20260714205747.119025-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714205747.119025-4-sk.anirban@intel.com>
References: <20260714205747.119025-4-sk.anirban@intel.com>
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

The kernel now reports -ENOTRECOVERABLE when the device is wedged.
As runtime-survivability deliberately wedges the device, update
dmesg regex so igt_runner does not treat the expected error logs
as failures.

v2: Keep older error codes (Kamil)
    Modify regex (Kamil)

kernel implementation:
https://patchwork.freedesktop.org/series/168780/

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_survivability.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index 74488bbea..e9d384fdf 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -43,9 +43,26 @@ static char bus_addr[NAME_MAX];
 static void ignore_wedged_in_dmesg(void)
 {
 	/* this is needed for igt_runner so it will ignore it */
-	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ECANCELED"
+	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable activity stats(-[0-9]*|: "
+				    "(-ECANCELED|-ENOTRECOVERABLE))"
+				    "|GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: "
+				    "(-ECANCELED|-ENOTRECOVERABLE)"
+				    "|GT[0-9A-Fa-f]*: GuC PC set param.[0-9]*.=[0-9]* failed: "
+				    "(-ECANCELED|-ENOTRECOVERABLE)"
+				    "|GT[0-9A-Fa-f]*: Failed to set power profile to [01]: "
+				    "(-ECANCELED|-ENOTRECOVERABLE)"
+				    "|GT[0-9A-Fa-f]*: failed to enable GuC opt-in features: "
+				    "(-ECANCELED|-ENOTRECOVERABLE)"
+				    "|GT[0-9A-Fa-f]*: Failed to push self configuration ."
+				    "(-ECANCELED|-ENOTRECOVERABLE)"
+				    "|GT[0-9A-Fa-f]*: Failed to set SLPC power profile: "
+				    "(-ECANCELED|-ENOTRECOVERABLE)"
+				    "|GT[0-9A-Fa-f]*: GuC PC query task state failed: "
+				    "(-ECANCELED|-ENOTRECOVERABLE)"
+				    "|GT[0-9A-Fa-f]*: GuC PC reset failed: "
+				    "(-ECANCELED|-ENOTRECOVERABLE)"
+				    "|GT[0-9A-Fa-f]*: reset failed .(-ECANCELED|-ENOTRECOVERABLE)"
 				    "|CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
-				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
 				    "|GT[0-9A-Fa-f]*: Failed to submit"
 				    "|Modules linked in:"
 				    "|__pfx___drm_");
-- 
2.43.0

