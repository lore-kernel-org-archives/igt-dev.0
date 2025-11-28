Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E46CFD2F6
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 01:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C38510E109;
	Fri, 28 Nov 2025 01:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGjDDdfh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDF810E109
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 01:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764291776; x=1795827776;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/r1rkvWuY/J5wjg4iDo4MD4MN30S9QGVdNHiV/0sizQ=;
 b=iGjDDdfh2kFkAKNvRiNpz3ujQ5xOX38jGsBAu0GM8a6vt71hpf8+wFRl
 V9hPBMI6+pRtVa7Cz3s6MZWcYLTG2o3XbUP7h1+x+LDeUwhDhbG5RnWVQ
 9TmraGnwTm2CwmvzYcxkko0z3s7fazX+yM6OBJN6TY0/2Tq0y5u4XXsKz
 6TlBICNjfYfKgsnCD+nAbGln8bqy9yL7GaaNc0R8xdjOsi8TyPSXq1qLn
 PJ6sHzyb9OrWvFtTGl88V5h2t8jX4u+QwOWzA8sYABu8K+XEyVrFA/CxK
 bN/ru3sEnPWE69oQRMlSZpJGWodry8JLliDDXBieOn1G8jMztfEYwNWc9 w==;
X-CSE-ConnectionGUID: TirTY0CJSDmuZFXt9nJXmA==
X-CSE-MsgGUID: m42HZIa3TJOow8xs4kNB/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="53897930"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="53897930"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 17:02:55 -0800
X-CSE-ConnectionGUID: H7oPHpQxQ6eheUbw5z9LNg==
X-CSE-MsgGUID: mXYxmPXHRvS1QcsgaPzRng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="193439645"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.140])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 17:02:54 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/3] intel: Allocate batch buffers from system RAM
Date: Fri, 28 Nov 2025 03:02:48 +0200
Message-ID: <20251128010251.18988-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Allocate batch buffers from system RAM since that's the
normal thing to do, and is better for small BAR systems.

Ville Syrjälä (3):
  intel: Nuke blt_copy_batch::region
  intel/xe: Allocate batch buffers from system RAM
  intel/i915: Allocate batch buffers from system RAM

 benchmarks/gem_wsim.c           |  4 +---
 benchmarks/xe_blt.c             |  4 ++--
 benchmarks/xe_exec_ctx.c        |  6 +-----
 lib/igt_fb.c                    |  7 +++----
 lib/intel_batchbuffer.c         | 14 ++++++--------
 lib/intel_blt.c                 |  5 ++---
 lib/intel_blt.h                 |  3 +--
 lib/xe/xe_util.c                |  2 +-
 tests/intel/gem_ccs.c           | 18 +++++++++---------
 tests/intel/gem_exercise_blt.c  | 10 +++++-----
 tests/intel/gem_lmem_swapping.c |  4 ++--
 tests/intel/kms_ccs.c           |  2 +-
 tests/intel/xe_ccs.c            | 18 +++++++++---------
 tests/intel/xe_copy_basic.c     |  8 ++++----
 tests/intel/xe_evict_ccs.c      |  5 ++---
 tests/intel/xe_exercise_blt.c   | 10 +++++-----
 tests/intel/xe_pat.c            |  2 +-
 tests/intel/xe_peer2peer.c      |  8 ++++----
 tests/kms_prime.c               |  5 ++---
 tools/intel_tiling_detect.c     |  6 +++---
 20 files changed, 64 insertions(+), 77 deletions(-)

-- 
2.51.2

