Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E053C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 15:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23D810ECB7;
	Fri,  7 Jun 2024 15:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/bNr8Xs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B62310ECB7
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 15:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717774596; x=1749310596;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JWShmza1hm+wk6rtWImgkihQfctxBqI8PaHjee3Q72s=;
 b=R/bNr8Xs1zqaTYX9O6XZk3MppBW5QoOgJc6uKj6A26oRvQNy/o7ItBbP
 8dg21/wa48/WnDgNvsKSep+m3doyb0RLq5CKFadLDPg87QJ0LjkB+mCLP
 ZkcgwVIoQvxNZQErqLInXgsN6jc+W66G2U2RxtzBEtFeFjGESeoENGLz+
 DK85+mv0he75VStP0ts2WbkQoztooAsFk9tmiXmFIKRApJDTW8ydnLyl0
 BOusSw4H7DcULmCeO2yxIaSdn0o1xG7TTGtukxuIruW88sO+DW4RAbaR0
 CcJ4ysstkrorl1CJj0Jut2W64/HuF63l6V6qDo8bw7BO+ohgnIfAyQJlf A==;
X-CSE-ConnectionGUID: nbXyJihcTK2bNXemNv+x9g==
X-CSE-MsgGUID: xGjm8FfFRsSti/cWRU/jhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14620060"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14620060"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:36:36 -0700
X-CSE-ConnectionGUID: e9UYgvu9QOSKGtdkWtWYsQ==
X-CSE-MsgGUID: IeQTqy9DQz2KVp5SDynKxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38805260"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:36:35 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v1 0/7] tests/core_hotunplug: Make it fail in subtests
Date: Fri,  7 Jun 2024 17:36:12 +0200
Message-ID: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
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

Test core_hotunplug has some checks outside of subtest which
will make it fail. Try to fail it in subtest context, not outside
in fixture. Add also some helpers in drmtest lib to print what
driver we are testing and make sure we reload the same, not some
other.

Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (7):
  lib/drmtest: add function for retriving chipset
  tests/core_hotunplug: set known chipset before tests
  tests/core_hotplug: Add checks to subtests
  lib/drmtest: Allow to get drm device name
  tests/core_hotunplug: Open the same driver
  tests/core_hotunplug: Fix device close
  tests/core_hotunplug: Skip if no render available

 lib/drmtest.c          |  35 ++++++++++-
 lib/drmtest.h          |   4 ++
 tests/core_hotunplug.c | 137 ++++++++++++++++++++++++++++-------------
 3 files changed, 132 insertions(+), 44 deletions(-)

-- 
2.43.0

