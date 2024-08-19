Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E990C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 19:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0523410E356;
	Mon, 19 Aug 2024 19:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2BB3gPR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA37A10E356
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 19:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724097374; x=1755633374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CvkpTZCxnW1qvaanbdhDo+K0cBZeBJTdfAJI++aI4Qo=;
 b=B2BB3gPRhAAi85z4Zps0t2jPjiOgHZwSyqIja6LDpbn/OVRglN0sc38I
 VGrCUSyniempErF27JHrXmTw+Xu7e7KAl8oONuVyW/FBY4iQjwQ5xr0Ge
 Z6o7UopESLKC9guLy3LzA2txNBKMszSYVh8y3bq7Gg7oU5A62GqBWROLR
 3iuyf3UoVtucJTpLtrrVsCsdc0caBuHegSq5A8QQoviEyDQtFSnbA0msq
 /xTeJdDp0jEY8wPlmwx2jc+efJXpHL4ykag4+gJOiRkwJJYZk9q1+MrD1
 5iStFsp8YEhS/PsNT0cxHAXpai9vjH+ba1f9osn0xw88cvKLk3isO2k7t w==;
X-CSE-ConnectionGUID: ZAe6fwRQQLGKt/Qpt+I+0w==
X-CSE-MsgGUID: cXgY2YjPT1ym6yBpc1g3qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22251048"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="22251048"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 12:56:14 -0700
X-CSE-ConnectionGUID: 4acdmZ6wS1eINjWinBK5bw==
X-CSE-MsgGUID: KOm0a+RQQ1i0TeaCCpCo7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="60315552"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 12:56:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/4] tools/intel-gfx-fw-info: Override kernel types
Date: Mon, 19 Aug 2024 12:55:59 -0700
Message-ID: <20240819195600.242767-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819195600.242767-1-lucas.demarchi@intel.com>
References: <20240819195600.242767-1-lucas.demarchi@intel.com>
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

Previously we were defining u32 type as part of the string we are
loading. However in order to use other types like u8 and u16 in upcoming
changes, it would be better to have them all defined in a single place.
We can't create a typedef like done with u32 because cstruct already
defines a few types for convenience. However it's very surprising it's
defining e.g. u8 as a 64-bit variable.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel-gfx-fw-info | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
index a2518aa0e..85f99b75a 100755
--- a/tools/intel-gfx-fw-info
+++ b/tools/intel-gfx-fw-info
@@ -23,8 +23,6 @@ import typing
 #          dumpstruct(): give it a name
 
 CDEF = """
-typedef uint32 u32;
-
 struct uc_css_header {
 	u32 module_type;
 	/*
@@ -120,6 +118,13 @@ class Fw(abc.ABC):
     @classmethod
     def create(cls, f):
         cparser = cstruct.cstruct()
+        # cstruct defines some "convenience types" that are not very convenient
+        # when parsing a kernel header - e.g. we don't want u16 to be parsed as
+        # uint128
+        cparser.typedefs["u8"] = "uint8_t";
+        cparser.typedefs["u16"] = "uint16_t";
+        cparser.typedefs["u32"] = "uint32_t";
+        cparser.typedefs["u64"] = "uint64_t";
         cparser.load(CDEF)
 
         magic = cparser.magic(f).data
-- 
2.43.0

