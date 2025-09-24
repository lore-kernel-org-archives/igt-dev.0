Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1A2CAC5B0
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 11:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39C910E6F8;
	Wed, 24 Sep 2025 11:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0XGXYbE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAEA10E6F8
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 11:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758711975; x=1790247975;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SY8zKssO+lluDqfNDTnA4ecK75ZftEGWLOAjL2MG7jw=;
 b=c0XGXYbEkWiewazFEyvEJ1d3iDtBzm7j4wOV8waOqopXjZ2dCCH3jyVO
 LtuTy65sRuM99HvR4KPIHK2g5Ypp8soRlEzI23zqYSKk41PCvptRE+Vm8
 gKHmzwW+5lTE7q8mb96Sg9StU08DkzIM4z2hDEekCdda24FN0bWs2WvHZ
 6wSXxdmdCNzk1aWWnwWxIMRTynJyLDPrmsDeDoXZXme2mK0Jog+aPJjd9
 UacVL7XZPBj/WJoEpR65JgM9FWFeEzrzPihOw+GDe+lSIf3UI8i5LyqV0
 RzoH6Az+RhATzbT6CIy0Qp6nrMwUaMxT+hyplm+X6uefVXCBqo2hilIDP Q==;
X-CSE-ConnectionGUID: WCf2+oXoQfeQxNbzNbsWpw==
X-CSE-MsgGUID: Xl1vGVFdQfOadVkHEz5byA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72362618"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="72362618"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:06:14 -0700
X-CSE-ConnectionGUID: teX4H8xKQmmZR4M+UPyvHA==
X-CSE-MsgGUID: 9kElHXDPQS+a+psUq9MeRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="181299011"
Received: from unknown (HELO localhost) ([172.28.180.114])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:06:12 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t 0/2] benchmarks/gem_wsim: Thread failures and Xe batch
 verification
Date: Wed, 24 Sep 2025 13:06:05 +0200
Message-Id: <20250924110607.563913-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Propagate thread assertion failures to the exit status.
Add an opt-in post-sync verification for Xe spinner batches to catch
premature finishes (-V).

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Marcin Bernatowicz (2):
  benchmarks/gem_wsim: Fail on thread assertions
  benchmarks/gem_wsim: Verify Xe spinner batch completion

 benchmarks/gem_wsim.c | 44 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

-- 
2.31.1

