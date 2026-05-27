Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D93DCD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 20:57:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315EE10EA0F;
	Wed, 27 May 2026 20:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6UZNYXM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972A510EA0F
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 20:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779915412; x=1811451412;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PzZUvIRXrzNPwTkConsQrTa8HSynulIdLD/7qClc8Oc=;
 b=S6UZNYXMYa5PX6TlI3ZVaIPhcN9m9cj8qJiQ65hx+cYGHbkxIhEvi7IE
 SMYVRT0o1O+BIzcgzJNdPWpUMtYt+JWlDFbJp310+lpSdG/K8rxtHTcox
 ajK9QXzqHiUfhDb/KtOg25IJgKzp39ps5nRhdXnBQcMFfyJXK6vu3WdZM
 VkVRE7YsiWKogg1dBBYlB7kSgrywsk3aBNYRc61z9FyCqvNxr5GuTv7j+
 mfbOoTUHGte3R3cVG4R+Jp4b8XLD+fq3YshDaLZFRhtgfJ6wS7vB29VRi
 xx+roF6KGYtHmA7/rwe3p/jY9IM6W3dYZnlSjD4kXK3YwbmEZeu7sxt5B w==;
X-CSE-ConnectionGUID: FAhIMEbHRuKUu5ezwZu47w==
X-CSE-MsgGUID: WKhedK4GSL61rBdehHMlnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84383417"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="84383417"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:56:52 -0700
X-CSE-ConnectionGUID: bcWrYn8bRdWMjazJQoNjPA==
X-CSE-MsgGUID: atG6nO2SR0ydaEtEs5Nkeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="239347202"
Received: from kpleskax-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.94.249.221])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:56:49 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/8] tests/intel/xe_sriov_scheduling: improve scheduling
 coverage
Date: Wed, 27 May 2026 22:56:33 +0200
Message-ID: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Improve SR-IOV scheduling test coverage by adding default-enabled
fair-scheduling validation, broadening equal-throughput and
nonpreempt-engine-resets scenarios across GTs and both LOW/NORMAL
priorities, and strengthening result confidence with PMU-based checks
using engine-active-ticks and engine-total-ticks.

This series also includes earlier preparatory changes: timestamp helper,
scheduling priority support, and a const-correct helper signature update.

Marcin Bernatowicz (8):
  tests/intel/xe_sriov_scheduling: Use timestamp helper
  tests/intel/xe_sriov_scheduling: Add scheduling priority support
  tests/intel/xe_sriov_scheduling: Make sysfs_get_job_timeout_ms take
    const eci
  tests/intel/xe_sriov_scheduling: Add PMU-based verification helpers
  tests/intel/xe_sriov_scheduling: Raise min exec quantum to 2ms
  tests/intel/xe_sriov_scheduling: Refactor throughput_ratio and
    nonpreempt-engine-resets test
  tests/intel/xe_sriov_scheduling: Remove unused log_sample_values
    helper
  tests/intel/xe_sriov_scheduling: Add default fair scheduling test

 tests/intel/xe_sriov_scheduling.c | 1035 ++++++++++++++++++++++++-----
 1 file changed, 859 insertions(+), 176 deletions(-)

-- 
2.43.0

