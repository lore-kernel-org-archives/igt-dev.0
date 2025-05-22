Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B5CC54E90
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 07:55:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2046510E11B;
	Thu, 22 May 2025 07:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WtqXLgVE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B01010EF57
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 07:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747900528; x=1779436528;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rZnSUlYhrGuWLzKRP2O8nYsEZ5I1wjUJrs4lHfTtm8A=;
 b=WtqXLgVEqi3y/xhQINxRVPO3QpI0CwyZR2zOF81KCDRE6IN83aSg5gof
 GOGyxjgU13/iI7St5yFfEAufiwS09EaRcdEBqRSF9SSb3jVGW9ZnAB44F
 r26QnehXqaDCkUMqVsKclW/CJeZ0oONCFA9wKanana4pxe1SFSmLBCSTe
 HVRCAZ+9XPTaTVXKb/+NDFXEcmurtpVz3HPJNYdJYA2i1YzOPBWfY/90c
 q4MjDEYpo6JkU6x/hcT+Rac/wq71bUWBYXptoKZC4SV4TD/1m6vL69J98
 UzgUJ2yyo8yeUjf+VFEv+UcD8o8mEalr+Yvi8fzAefhD2uMv8cYMEz107 g==;
X-CSE-ConnectionGUID: qDjuv41wQvieEfxOIBWRRA==
X-CSE-MsgGUID: nSY2eZFsQBKBIEMPiqra1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50051000"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="50051000"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 00:55:20 -0700
X-CSE-ConnectionGUID: u82s2w1oRF6NNAxopbDAQg==
X-CSE-MsgGUID: qHjIgocVRRee7pHFAKXFHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140888575"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 00:55:19 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v2 0/4] Simplify compute preemption tests
Date: Thu, 22 May 2025 09:55:11 +0200
Message-ID: <20250522075515.168920-1-zbigniew.kempczynski@intel.com>
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

I planned to rewrite threadgroup preemption test to use similar to wmtp
pattern, but at the moment I haven't succeeded. To make my further work
on this easier I simplified the code and logic of verification wmtp or
threadgroup preemption occurred. So threadgroup preemption still rely
on increment loop shader which is executed on large x-dimension. I hope
I'll find a way to rewrite it to use wmtp pattern where I release part
of threads triggering preemption when threadgroup will end with EOT.

v2: use ARRAY_SIZE() and simplify input/output data assignment

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Zbigniew Kempczyński (4):
  lib/intel_compute: move user-fence to allow async exec call
  lib/intel_compute: simplify compute-preempt subtests
  lib/intel_compute: calculate array size at compile time
  lib/intel_compute: refactor to remove code duplication

 lib/intel_compute.c | 395 ++++++++++++++++++--------------------------
 1 file changed, 161 insertions(+), 234 deletions(-)

-- 
2.43.0

