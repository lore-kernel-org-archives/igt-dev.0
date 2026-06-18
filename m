Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D0DCD98ED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 14:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE3D10F153;
	Thu, 18 Jun 2026 14:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDGdvFYk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B264A10E7CC
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 14:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781791858; x=1813327858;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=slIGR5Nc3UIykWfgLwYejPh/STm6/fuvuxyAaD97dG0=;
 b=PDGdvFYkzCO62kVtvaHUvme0TRSTSjUo3T+6YLONlwVm4tNDwMXpGYHh
 svwnil4udFVkoAv/GNjXgsyE+9hPXhxxa6z517w4ujAn+tP5LWN9Yf4yW
 R8gPiTBA9yNTrWbfzYhtdqKw7NDwz9RMGMT7heARY2jTTEEn7WdCUmuHh
 T/8ir58kWHM2Glqj/vfXzYePNRdJY8zNvfEqw6FFug6iuHvEkGF1UDTUm
 wvpw6sDurPOCDnSwsxJfqeH1KL43Zq88WlQXoD1BG78MPE/atloICGtIK
 TE5kp1FmmoGbxxYwHN/P6UKM8HAmiw7tznPD6QAz5YFOsTGc2iRvjzmak Q==;
X-CSE-ConnectionGUID: X5Z1StdNTry2mD1XzyjbIg==
X-CSE-MsgGUID: EXcOsT+TR3KjWE6Yc+VFMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="105428821"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="105428821"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 07:09:58 -0700
X-CSE-ConnectionGUID: C4fFfDqYQQ6DqRhyZ0OOtw==
X-CSE-MsgGUID: LXNS7j8tQuS49VK3XNyGRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="248456236"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 07:09:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 0/5] igt: cleanups to random functions
Date: Thu, 18 Jun 2026 17:09:48 +0300
Message-ID: <cover.1781791747.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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


Jani Nikula (5):
  lib/kms: simplify igt_random_crtc()
  lib/rand: move static inlines to proper functions
  benchmarks/gem_exec_reloc: use hars_petruska_f54_1_random() from
    lib/rand
  benchmarks/gem_exec_trace: use hars_petruska_f54_1_random() from
    lib/rand
  tests/gem_exec_lut_handle: use hars_petruska_f54_1_random() from
    lib/rand

 benchmarks/gem_exec_reloc.c       | 15 ++++-----------
 benchmarks/gem_exec_trace.c       | 12 +++---------
 lib/igt_kms.c                     |  9 ++-------
 lib/igt_rand.c                    | 13 +++++++++++++
 lib/igt_rand.h                    | 13 ++-----------
 tests/intel/gem_exec_lut_handle.c | 14 ++++----------
 6 files changed, 28 insertions(+), 48 deletions(-)

-- 
2.47.3

