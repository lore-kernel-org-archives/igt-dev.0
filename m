Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B216C7115A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 14:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E126110E71A;
	Tue, 17 Jun 2025 14:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHC9CEhM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B8210E72C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 14:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750169185; x=1781705185;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=hNoycAxqm7k4DBgBHXbzFLipm426XG4ktd/Y5bujoow=;
 b=LHC9CEhMd6h8lYE0xh66sMG498fPV6kBarC5RwRUv839iV7brS4a9bne
 AJTTqqlNXVsD8uusosJXJjtI/dfiFKOmg37QDse6eqY/pYKx1iqiqV6Lv
 9Bw46VkFO/xR5HAW2cNVsB9gcStbe7gEWD9RG/DUQ9l3mqSPriCWbgyq5
 u7E+SvfXy1EE23fmmF8mUkjfF3xSqvx/px3TtTXqjsREbtitdC2iu1dPe
 6lhqoPUr8ucuvoGTtSFqlD8JIXCFaBr0HNW0L2jh7qaD+RyEJxwW/zLPO
 f89uZDrofgE4DiLIjn0Y8nOxpyuN2RX8lOv/sZfnDZwIxAsHysrnIy0Gg w==;
X-CSE-ConnectionGUID: QMWP4K6KRlKalQBWF0zVXQ==
X-CSE-MsgGUID: 5pDLSelKSUadj8X56nEDKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52431612"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52431612"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:06:24 -0700
X-CSE-ConnectionGUID: CWMcx2J/Sp+w5yFW2vDSWA==
X-CSE-MsgGUID: zmzLp4PCRu+dFUqoRwSlDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="172036324"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:06:23 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 17 Jun 2025 16:05:25 +0200
Subject: [PATCH 3/3] Dockerfile: bump fedora version to the newest one
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-bump_fedora_to_42-v1-3-d04e6a0455fd@intel.com>
References: <20250617-bump_fedora_to_42-v1-0-d04e6a0455fd@intel.com>
In-Reply-To: <20250617-bump_fedora_to_42-v1-0-d04e6a0455fd@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=846;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=hNoycAxqm7k4DBgBHXbzFLipm426XG4ktd/Y5bujoow=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoUXYtHseWNCq4/SBf+6s7tBN2nZxY06G2v1+CT
 WiX7dF1MIyJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaFF2LQAKCRAjYrKT3hD9
 12WuC/9nQEi6WQrkHULJuHXkahywowzw08UdsjzjnX4vu+O0a/A842t+lYTgfuYMTK/56lluyDz
 E3/N1JWeM8ccXPHSFk3a3zzAtVFXE0QllStvAhI4lykzQxPlVKX6YTly1gVIDzQS5hLwCKGlhzs
 /5w+/ItZy/h/X4kFMSbkrWjwfs1b/NpLQ6oM3rXtHDjctjzXrHixst9O2j3h5mMlY5SGb0oajq1
 6jUbrP0IITszH7r6mqsWtkOtMM3cDMtOX0GvcF8wo7NFeQbOjlTx2iE3olyPaTIlSd//zgxI+jJ
 UfRmPYbxMRktneY32u6QScAW9wApkwNWSBOCB9l7DKefbO5dw/B+pk2vSbILd34I8NZaoe1t5z0
 0zR/On+bVqGTjLIMM8Bbqm0xqnJcGUscUyxPyA8cYJePdijg08RzGbLl/U0P1lo8y6hWfdbFES7
 Rh/Bx+kczvoEm2azXnyAzJGsIntDfewCbxCxgs8NGoQGpe3oJ2uXYi6uJPmZnIf0HJxDA=
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

With fixed few issues in previos patches new fedora
can be used for build tests.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 Dockerfile.build-fedora | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index 588738ac423e0d274fa42dfa4043b44d4cb1bad7..9399c0a7dbabd2ee1d78993c7d2e245f957b2ea7 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -1,11 +1,12 @@
-FROM fedora:33
+FROM fedora:42
 
 RUN dnf install -y \
 	gcc flex bison libatomic meson ninja-build xdotool \
+	'pkgconfig(libcurl)' \
 	'pkgconfig(libdrm)' \
 	'pkgconfig(pciaccess)' \
 	'pkgconfig(libkmod)' \
-	'pkgconfig(libprocps)' \
+	'pkgconfig(libproc2)' \
 	'pkgconfig(libunwind)' \
 	'pkgconfig(libdw)' \
 	'pkgconfig(pixman-1)' \

-- 
2.43.0

