Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8DAD3F071
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 14:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9033010E6DF;
	Wed, 28 Jan 2026 14:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFfXZcK+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CED10E6DF
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 14:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769611412; x=1801147412;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BJR3NSZA9leQ25gsM10i+fUlJi0DvXP0inHtxi/U260=;
 b=AFfXZcK+5c7wh+NgllHWw5EJUrI3ZY8NM7bVXXRqNZnEZGKXHuP4COa5
 RB/KS6aILbJet42B7IIoXQ0+jOuQBEImWjgpmeGpTA6jLQ2bVJBlh0lSt
 KWlV8Rb+Ctm1PiavAsKdV4n7lbjNWzlToZsD3/nG7x3fEDv4PdXRpl7DS
 Wf0YsbvuG0qmTHsdoiw2W7bd4DeWCGKWTEM6uuQCw7d/4JmIFAewCxBV9
 el8mqSHTYXayv+sDT/KRl1BK3MTyvoJiwNjJud+jCzX6Ail81p/KLaBzQ
 Giz1xusli7pbIVqVW7psQAzVQmOiK7FmQ9UD60EQj38EFovOrGTUk2yNA Q==;
X-CSE-ConnectionGUID: aRj4l3ZBSOGvhgKZK1InvA==
X-CSE-MsgGUID: uVsKEiDWTGqRFM2rjP1oPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93482109"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="93482109"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:43:31 -0800
X-CSE-ConnectionGUID: f5vT9mAaTEetjI6UPeqKHA==
X-CSE-MsgGUID: JiQKmw3QQHqWHWPs2FrD5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207903712"
Received: from prudnick-desk.igk.intel.com ([10.91.34.80])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:43:30 -0800
From: Piotr Rudnicki <piotr.rudnicki@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com,
 Piotr Rudnicki <piotr.rudnicki@intel.com>
Subject: [PATCH i-g-t v3 0/2] xe_eudebug_online: Fix test_interrupt_other wait
 logic
Date: Wed, 28 Jan 2026 15:46:27 +0100
Message-ID: <20260128144626.452925-4-piotr.rudnicki@intel.com>
X-Mailer: git-send-email 2.43.0
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

Fix test_interrupt_other to wait for the correct client after reset instead
of the original debugee. Also improves cleanup handling when debugee has
already terminated.

V1 -> V2:
 - Split into separate library and test commits
 - Use wait_for_workload_start helper to verify second workload started
v2 -> V3:
 - Improved commit message

Piotr Rudnicki (2):
  lib/xe_eudebug: Add pipe validation and cleanup improvements
  tests/intel/xe_eudebug_online: test_interrupt_other wait fix

 lib/xe/xe_eudebug.c             | 16 +++++++++++-----
 tests/intel/xe_eudebug_online.c | 23 +++++++++++++++++++----
 2 files changed, 30 insertions(+), 9 deletions(-)

-- 
2.43.0

