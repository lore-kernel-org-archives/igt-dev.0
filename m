Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE17C54E90
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 19:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC7610E71C;
	Wed, 21 May 2025 19:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FUnOTrhc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6611410E71C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 19:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747857575; x=1779393575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yszRwv5scN13vByu36KkK1W3wPRntRrgJond8TFUrtI=;
 b=FUnOTrhcks/L8DU8/9290jtkS+CViL4lGOeH4FcCh703UgapDO8RK8qk
 9OD9AChEHjj6E1yyCPby3PfcrdiMLZzP6Kt/ZInBUuriG9xUjrVyQV2Nv
 7MREEMgsVxI/ZBiKRlV7G5+S5WGCQBm+wff5wCQDn2Nl0tpumPqrdbAKE
 ayoXrAhLinZVom4dCBKUUcfg8BqzHLz4XfTbY4roMcZXl8IJaGDxEq3SW
 tm+UMhywnnWY6/ust5j8ubhlNSuk9bsfPifT2ikYaHvoEbQFSHp92bPyT
 Ikz+Im4kvyIKYCZfVfIRufPkgT2LkF7owaVdZbEFNvub2YeFvhmusS9vh g==;
X-CSE-ConnectionGUID: NxinyWf6RBCaeW/ZL0evJQ==
X-CSE-MsgGUID: NN0hAb0QRmeTNbSp8VpbQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50011537"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="50011537"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 12:59:33 -0700
X-CSE-ConnectionGUID: dQeFQ3BPQ3yE7c1MOcd1ZA==
X-CSE-MsgGUID: z3HPcTDYTbG7ed1ZCObBMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="177388928"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 12:59:32 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/2] Simplify compute preemption tests
Date: Wed, 21 May 2025 21:59:23 +0200
Message-ID: <20250521195925.74357-1-zbigniew.kempczynski@intel.com>
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

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Zbigniew Kempczyński (2):
  lib/intel_compute: move user-fence to allow async exec call
  lib/intel_compute: simplify compute-preempt subtests

 lib/intel_compute.c | 229 ++++++++++++++++++--------------------------
 1 file changed, 93 insertions(+), 136 deletions(-)

-- 
2.43.0

