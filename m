Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F161CCDD1CD
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 16:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7C510E46A;
	Fri, 27 Sep 2024 16:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTtWw//3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275A410E46A
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727454794; x=1758990794;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2gT3O208dx4q5ilR6zvVJBC5b4up4ouW5+iGnomG9RE=;
 b=eTtWw//3zMe32RUdHEe/q49fLoysHIpyjLMHQUK2buCgxN5hANq/ygSI
 rmyRZnT5RyeGVKMsqnaoh2kR6XnGwy6jlZtdBml06sisUtSIn8nUlWG6B
 EBZV9eZ7PJH2JxxelRbIEnNKUO9QF3L9mkBFnbwjptB+ThzCAyQYO4jWa
 27IKzbWESquG3c8vohSpr/qcTZUPTr1TiA48umtrWV2MfUWi2lEXFhnlm
 IcoyKgTMXCgA+H2760NnKVBmD1lsRQoD6Vsvzn0/ilSLFaZmPdtIR0awN
 n3M2tPDBTs1aW2RAxPHu8UU7VUIAnV6H+XnwEwHnXW7+QMoy+ax5wvLOV Q==;
X-CSE-ConnectionGUID: pTC4MSwiSP+mu7Yt2E/Y5Q==
X-CSE-MsgGUID: gCcZxUUSQAGYfKKad3iRyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26738125"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="26738125"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 09:33:14 -0700
X-CSE-ConnectionGUID: yncNAR55QQa4nlozeLRlrA==
X-CSE-MsgGUID: Vag32aRIQyCc/qD+tKJyGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="72743814"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 27 Sep 2024 09:33:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 27 Sep 2024 19:33:10 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] tests: Shut gcc up abput _Atomic(uint64_t) alignment
Date: Fri, 27 Sep 2024 19:33:06 +0300
Message-ID: <20240927163307.10159-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927163307.10159-1-ville.syrjala@linux.intel.com>
References: <20240927163307.10159-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

x86-32 gcc keeps complaining about some alignment ABI change:
"note: the alignment of ‘_Atomic long long unsigned int’ fields changed in GCC 11.1"

State the alignment explicitly to make gcc shut up.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/dumb_buffer.c           | 2 +-
 tests/intel/gem_create.c      | 2 +-
 tests/intel/gem_mmap_offset.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index e1c18c70b09b..dd237467d3f6 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -242,7 +242,7 @@ static uint64_t get_npages(_Atomic(uint64_t) *global, uint64_t npages)
 }
 
 struct thread_clear {
-	_Atomic(uint64_t) max;
+	_Atomic(uint64_t) max __attribute__((aligned(8)));
 	uint64_t page_size;
 	int timeout;
 	int fd;
diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
index ca39a8b64a62..f0749d288dcf 100644
--- a/tests/intel/gem_create.c
+++ b/tests/intel/gem_create.c
@@ -206,7 +206,7 @@ static uint64_t get_npages(_Atomic(uint64_t) *global, uint64_t npages)
 }
 
 struct thread_clear {
-	_Atomic(uint64_t) max;
+	_Atomic(uint64_t) max __attribute__((aligned(8)));
 	struct drm_i915_gem_memory_class_instance region;
 	int timeout;
 	int i915;
diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
index c1a9811ff9d1..3f499abedbbb 100644
--- a/tests/intel/gem_mmap_offset.c
+++ b/tests/intel/gem_mmap_offset.c
@@ -716,7 +716,7 @@ static uint64_t get_npages(_Atomic(uint64_t) *global, uint64_t npages)
 }
 
 struct thread_clear {
-	_Atomic(uint64_t) max;
+	_Atomic(uint64_t) max __attribute__((aligned(8)));
 	struct drm_i915_gem_memory_class_instance region;
 	int timeout;
 	int i915;
-- 
2.45.2

