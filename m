Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FB7C369A2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 17:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B725910E040;
	Mon, 14 Apr 2025 17:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gavac+RK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ED910E040
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 17:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744651421; x=1776187421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KJn1aYzZ6gQFdC7YawD1UISOO07gx9JwlXGTtK2Wm7U=;
 b=Gavac+RKLgo0TfJLzRLrr+2Lw4Y5qV9EBKa1T6Os1E6Ytmt9jVizB6Fx
 9IUFU8e/RMSDXyBYH7PRxzTBkAkou5g5GzlIxjZqgnyi6XxKUGHLdrNLI
 nfIzU6opPgIK4AkR1N78xkuKkYmBRfqKY8GbguFVBrjCPUWgaSvcUxrFj
 HOUD6MfJTnUx1VzMBU4suLVLMNszq2XXuzWOu1MNw8UjEvRNKk6fP7Y+e
 yljtED5z/G4blr8ARZJD6aAOYEOOvc77ono6qnSNmZwpyOWaibPM77Q7Z
 bgbnTHPpr+N26UHDRpjmxGQC6W8mpp3u8DDto5F+HSflMup7yOti8HxlP w==;
X-CSE-ConnectionGUID: yjj0IrsXTK6G3g5upIRiaw==
X-CSE-MsgGUID: 809Or7cOSq6LlvaWT/2E2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45269289"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="45269289"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 10:23:41 -0700
X-CSE-ConnectionGUID: MemIabTHSS6mihJim3B5SA==
X-CSE-MsgGUID: 5bdT3jUlQpKf9CztMF/PBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="129721147"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.251])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 10:23:39 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v5 0/2] rename drm_fdinfo into i915_fdinfo
Date: Mon, 14 Apr 2025 19:23:33 +0200
Message-ID: <20250414172336.59158-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

      This test opens i915 drm card and will not work for other drivers.
Hence rename it to avoid confusion.

See also discussion at
https://patchwork.freedesktop.org/series/139451/
i915/drm_fdinfo: Quiesce GPU prior to running some tests

v2: corrected Tvrtko e-mail and corrected xe.blocklist
v3: squashed patch 2 into 1, resulting in removing drm_fdinfo
  from xe.blocklist, added r-b (Lucas)
v4: corrected dependency for lib in meson.build (Kamil)
v5: drop sorting other tests in meson.build (Kamil)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Kamil Konieczny (2):
  tests/intel: rename drm_fdinfo into i915_fdinfo
  HAX/DO_NOT_MERGE: test drm/i915_fdinfo

 tests/intel-ci/fast-feedback.testlist |   56 ++
 tests/intel-ci/xe.blocklist.txt       |    1 -
 tests/intel/drm_fdinfo.c              |   68 +-
 tests/intel/i915_fdinfo.c             | 1112 +++++++++++++++++++++++++
 tests/meson.build                     |    6 +-
 5 files changed, 1223 insertions(+), 20 deletions(-)
 create mode 100644 tests/intel/i915_fdinfo.c

-- 
2.49.0

