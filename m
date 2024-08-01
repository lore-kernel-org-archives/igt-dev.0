Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDB6C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 19:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18A410E094;
	Thu,  1 Aug 2024 19:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkkAlEYO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C118010E06C
 for <IGT-Dev@lists.freedesktop.org>; Thu,  1 Aug 2024 19:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722541891; x=1754077891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F3xvYBlpqbWykehldJwI5S0j4A7rUH5VHvW6qIKgvHs=;
 b=OkkAlEYOK1W0RARfPbTHDa0/2zhPlpj5wu/Y3XqJtM+eqLDi07x9Hj/S
 ZBxSwrOa1gHWKl0rzGahWj7tPh66ulcOL7WPTk/ihpy5yBteh18slv76L
 iRQ4xas8+I5vvb2DrX7M4sfS5vbW8js8OyalV/sqF3KZPNiM9MY83ZYnA
 FLwIBIa1kHKZPvosyIl6xkkolWd0njfWTY4U+cvJIQl7tTQCvTE9zFrsN
 HJtw3mlapj1KGj01WsPC6kkXv7ogfKc+oZqSQxaCemGgCJmao6h+kEbQd
 mfhk7ffJez7ptLupVWl/osjfkmJiQ9crItsltecqR5B5XaZAVHKiafs2C w==;
X-CSE-ConnectionGUID: eK5kWZJHSdeG5RI9ZY2INw==
X-CSE-MsgGUID: eV/gL2UIQSSsZ0Kh56WjEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31181958"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="31181958"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 12:51:31 -0700
X-CSE-ConnectionGUID: swWFk2yETiGsKlaVVAUUWQ==
X-CSE-MsgGUID: 9Wah5qTzTAq2Y9WAFH0/gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="60182925"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 01 Aug 2024 12:51:30 -0700
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/*_query: Add support for new hwconfig
 table entry
Date: Thu,  1 Aug 2024 12:51:29 -0700
Message-ID: <20240801195129.3667206-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801195129.3667206-1-John.C.Harrison@Intel.com>
References: <20240801195129.3667206-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

A new enum value has been added to the hardware config table. So
update the tests accordingly.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 lib/intel_hwconfig_types.h | 1 +
 tests/intel/i915_query.c   | 1 +
 tests/intel/xe_query.c     | 3 ++-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/intel_hwconfig_types.h b/lib/intel_hwconfig_types.h
index d5db217afba2..0e6ce5b17084 100644
--- a/lib/intel_hwconfig_types.h
+++ b/lib/intel_hwconfig_types.h
@@ -96,6 +96,7 @@ enum intel_hwconfig {
 	INTEL_HWCONFIG_MAX_TASK_URB_ENTRIES,			/* 78 */
 	INTEL_HWCONFIG_MIN_MESH_URB_ENTRIES,			/* 79 */
 	INTEL_HWCONFIG_MAX_MESH_URB_ENTRIES,			/* 80 */
+	INTEL_HWCONFIG_MAX_GSC,					/* 81 */
 	__INTEL_HWCONFIG_KEY_LIMIT
 };
 
diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
index 4d706d62b286..54dbb193a50e 100644
--- a/tests/intel/i915_query.c
+++ b/tests/intel/i915_query.c
@@ -1339,6 +1339,7 @@ static const char * const hwconfig_keys[] = {
 	[INTEL_HWCONFIG_MAX_TASK_URB_ENTRIES] = "Max Task URB Entries",
 	[INTEL_HWCONFIG_MIN_MESH_URB_ENTRIES] = "Min Mesh URB Entries",
 	[INTEL_HWCONFIG_MAX_MESH_URB_ENTRIES] = "Max Mesh URB Entries",
+	[INTEL_HWCONFIG_MAX_GSC] = "MaxGSC",
 };
 
 static const char * const hwconfig_memtypes[] = {
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 6ebf5e4b6d71..ddb2e76e5dd6 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -50,7 +50,7 @@ void dump_hex_debug(void *buffer, int len)
 /* Please reflect intel_hwconfig_types.h changes below
  * static_asserti_value + get_hwconfig_name
  *   Thanks :-) */
-static_assert(INTEL_HWCONFIG_MAX_MESH_URB_ENTRIES+1 == __INTEL_HWCONFIG_KEY_LIMIT, "");
+static_assert(INTEL_HWCONFIG_MAX_GSC + 1 == __INTEL_HWCONFIG_KEY_LIMIT, "");
 
 #define CASE_STRINGIFY(A) case INTEL_HWCONFIG_##A: return #A;
 const char* get_hwconfig_name(int param)
@@ -136,6 +136,7 @@ const char* get_hwconfig_name(int param)
 	CASE_STRINGIFY(MAX_TASK_URB_ENTRIES);
 	CASE_STRINGIFY(MIN_MESH_URB_ENTRIES);
 	CASE_STRINGIFY(MAX_MESH_URB_ENTRIES);
+	CASE_STRINGIFY(MAX_GSC);
 	}
 	igt_assert_lt(param, __INTEL_HWCONFIG_KEY_LIMIT);
 	igt_assert(!"Missing config table enum");
-- 
2.45.2

