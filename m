Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66476C54722
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 23:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83E210E54F;
	Tue, 20 Aug 2024 23:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoqpiY+9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BAB10E51B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 23:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724196582; x=1755732582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6J+wsUT9VLNZv5yGF18qK37/UXB7/AASujjoqeqwv7c=;
 b=aoqpiY+96DI+micFTdqX91A/vFUc8Da6JhdAcTF5EfAEu9AXNFnf+hax
 CmihrjMEKz3YT+bhocJFmfNXZXk5Z99+pcKbQUAPAa5v+WsbGpe6HpEey
 bzjIkAmhbou5O0WPnAVwr8cqmG/trQl/1jGqJY1SRXIL6ynn6ZwEuTv/Z
 fv5roNQP6ybEMGn9vvCV1/L2E2qkBJWHTuB5uO0ASuGHso7J4DcmEOYy3
 vWDWKaNbzv5SatzqW8ubUFpDBL9lX5MljoabtqdgEwjUf+Tuy6H09rpyG
 LYwDSomrj+6ZLWre/HTSqVz+8bdzoW8VzhL2Ak2hOnNQJgvDSFJxZqApm A==;
X-CSE-ConnectionGUID: eA+gBCJbREiWw2qaF7i9RA==
X-CSE-MsgGUID: 2pvZYer1SfOx6ioBhx26Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22339746"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="22339746"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 16:29:42 -0700
X-CSE-ConnectionGUID: F42DEuXmTnaPpoGXf+EcnA==
X-CSE-MsgGUID: 4pqjqK1ORGaFW6PFljdhxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="60599572"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 16:29:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 4/6] tools/intel-gfx-fw-info: Override kernel types
Date: Tue, 20 Aug 2024 16:29:26 -0700
Message-ID: <20240820232928.458248-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820232928.458248-1-lucas.demarchi@intel.com>
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
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
index 0f1da8bff..57d6f935b 100755
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
+        cparser.typedefs["u8"] = "uint8_t"
+        cparser.typedefs["u16"] = "uint16_t"
+        cparser.typedefs["u32"] = "uint32_t"
+        cparser.typedefs["u64"] = "uint64_t"
         cparser.load(CDEF)
 
         magic = cparser.magic(f).data
-- 
2.43.0

