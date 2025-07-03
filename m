Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E80C77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 06:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29EA10E149;
	Thu,  3 Jul 2025 06:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsFRX3+P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFE010E149
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 06:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751524237; x=1783060237;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RArjVit8OjDeVA1dRHay/N1wuX3TYzgefxDOL4JzVnI=;
 b=dsFRX3+P0+N5avmfXouzF+8L9olAbM9anT6IDlSRK/bO0jidx402kBjr
 anP0xubEgFqBHZQsft0mUfl/BAkWPHDtn4zBf3+t2pKfIWL3IMNnRSIn4
 rOui8202XKPSxGjwZfvS/7eMKIW4Xf8/q7poeyQFgJnKo7SBi0ymvNhx9
 +HXSBXEzPDKr5Bs2GpfZEgGCHTzilxgfo0pS/bZVAP8WxLHZHCZT4gDo4
 mykVnIxztSb+8U2mmd5kGe6MKCvR2gAMnn8YYO70kzXxk/EaIDAfS3VuA
 qGn+aLTrWTKMOmfV+WBSywejfSXJGcrAab0wLScVQ4ArrXAH6nky5vGMf A==;
X-CSE-ConnectionGUID: OyTTX4ohRemQJDEX2N/SiA==
X-CSE-MsgGUID: +2QouUkXSQ24E7R4YcSxwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64886362"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="64886362"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:30:36 -0700
X-CSE-ConnectionGUID: anwKRSeDRJqDZMFqrrzaDw==
X-CSE-MsgGUID: /HzsOSe2SQ6zTNIuR3pYJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="154635781"
Received: from savramon-mobl1 (HELO localhost) ([10.245.244.83])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:30:35 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 0/3] TG preemption detection improvements
Date: Thu,  3 Jul 2025 08:30:33 +0200
Message-ID: <20250703063032.553963-5-zbigniew.kempczynski@intel.com>
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

Series introduce improvements to TG preemption detection.

Zbigniew Kempczyński (3):
  lib/intel_mocs: fix wb mocs entry for MTL
  lib/intel_compute: use macros instead of binary data in post-sync op
  lib/intel_compute: use post-sync write to detect command level
    preemption

 lib/intel_compute.c | 57 ++++++++++++++++++++++++++++++++++-----------
 lib/intel_mocs.c    |  2 +-
 2 files changed, 44 insertions(+), 15 deletions(-)

-- 
2.43.0

