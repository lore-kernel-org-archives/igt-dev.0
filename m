Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85244C5321E
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 15:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328E410E229;
	Mon, 26 Aug 2024 15:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFD74yiF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F8810E229
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 15:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724686021; x=1756222021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O3/0LWkVQYvd9pZ40IUC/Ne/GbBJDLdQ4isk0Y3078I=;
 b=KFD74yiFHLKWFClmg4+v63y6N0ZpOobZy9POITNqrzIxk78YjRx7jr0j
 5BDTsh+vXVprjDHSamwWdezdl8JRnyCG0qZU6b4T7G9xf+/j7CuEKSnMd
 yi78jOer4OHtNBOH4yPNg2lQPWyyrypYxR+ndvG7fgIjhp7a92RX+nEkX
 QrqTKpB44xB7xRQ4bCG15h3fB2bpm48p4zC82CfsOeu8Aa53jpRgb8sK+
 WiOjf8a+zm5e7+E4jXWLlMFgcZVTy1fPTLZ+5SFD/+MYuqI1aRqnH6fg7
 nGpJU+fDpPBfyv2JeSfnfTGxWX8YXEwMKrJguhVRHHhCEgW1fS81ARtzE w==;
X-CSE-ConnectionGUID: udE5zdhVRx2WuU7a7fkSsw==
X-CSE-MsgGUID: a5iW7LZ+TQWFsoUnsOvWOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26013839"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="26013839"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:27:00 -0700
X-CSE-ConnectionGUID: ZIASpWP7Tkm5xQXchsYRRg==
X-CSE-MsgGUID: FyjVarOoSlqxSMIfS2MrqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="63074301"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:26:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 4/6] tools/intel-gfx-fw-info: Override kernel types
Date: Mon, 26 Aug 2024 08:26:54 -0700
Message-ID: <20240826152656.1306490-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826152656.1306490-1-lucas.demarchi@intel.com>
References: <20240826152656.1306490-1-lucas.demarchi@intel.com>
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

v2 (Gustavo):
- Use the cparser.add_type(..., replace=True) for overriding types

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel-gfx-fw-info | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
index a4b9414f2..8fcb2961a 100755
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
+        cparser.add_type("u8", "uint8_t", replace=True)
+        cparser.add_type("u16", "uint16_t", replace=True)
+        cparser.add_type("u32", "uint32_t", replace=True)
+        cparser.add_type("u64", "uint64_t", replace=True)
         cparser.load(CDEF)
 
         magic = cparser.magic(f).data
-- 
2.43.0

