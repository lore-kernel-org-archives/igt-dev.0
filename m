Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A34EEFB801
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E3F10E4E8;
	Tue, 24 Feb 2026 08:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SlMufxkn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DEE10E4E6
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771921686; x=1803457686;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jd2Lc9E0FBmi/I67tG/Gs+kjGbPBGaEL352svnKMDDc=;
 b=SlMufxkn9w88f35MGHQlJsceRccDsho0SBw899MPMJ6I0rs5jo2ZmxkH
 8NA4l4ljwGQohXkrZzEWb2liny2R7dgMHlpOBYjHAR28bcz9L+0ZyTYvJ
 7WOrKP/M0476bqSPD+urHBbCHucGm3iDbTasjwKl02Xpm7p6nf9G42Azp
 Z5h5kne/FovSIEE0sbN9Jmsf1cNJPHJT5gp5WH6BG4g/YjK34JYA0EvGs
 WgzwoK2jMmSpzK/DYaOi4VY2yZgHquPzi4MDc9GkgDQe3hGgRKluJrFkb
 K181Z3gl+ppx51MfBVQ8HIxSV0Ff1YCM1n3wzh67EwDMFK4NcTk1WYslz w==;
X-CSE-ConnectionGUID: JxbJo6FoRDmI6rRG/tUn6Q==
X-CSE-MsgGUID: S3B55JFZRE+rfm7DNESBlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72904057"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72904057"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:28:06 -0800
X-CSE-ConnectionGUID: wltM9OneR16M7h7BVrsrPw==
X-CSE-MsgGUID: UhU7VhkHS9GVw74iJqXVhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="214088064"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa010.fm.intel.com with ESMTP; 24 Feb 2026 00:28:04 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 2/5] lib/allocator: add canonicalize helper for 57 bit
Date: Tue, 24 Feb 2026 13:57:57 +0530
Message-ID: <20260224082800.1581935-3-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224082800.1581935-1-priyanka.dandamudi@intel.com>
References: <20260224082800.1581935-1-priyanka.dandamudi@intel.com>
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

From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

The efficient 64-bit mode introduced with XE3p requires a 57-bit
canonicalize for the ppgtt virtual address.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/intel_allocator.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
index 9cd83ea270..87c1453e91 100644
--- a/lib/intel_allocator.h
+++ b/lib/intel_allocator.h
@@ -219,12 +219,18 @@ void intel_allocator_bind(uint64_t allocator_handle,
 #define INTEL_ALLOCATOR_SIMPLE 2
 
 #define GEN8_GTT_ADDRESS_WIDTH 48
+#define XE3_PPGTT_ADDRESS_WIDTH 57
 
 static inline uint64_t CANONICAL(uint64_t offset)
 {
 	return sign_extend64(offset, GEN8_GTT_ADDRESS_WIDTH - 1);
 }
 
+static inline uint64_t CANONICAL_57B(uint64_t offset)
+{
+	return sign_extend64(offset, XE3_PPGTT_ADDRESS_WIDTH - 1);
+}
+
 #define DECANONICAL(offset) (offset & ((1ull << GEN8_GTT_ADDRESS_WIDTH) - 1))
 
 static inline uint64_t get_simple_ahnd(int fd, uint32_t ctx)
-- 
2.43.0

