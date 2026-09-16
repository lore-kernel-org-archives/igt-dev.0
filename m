Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A459BC88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 10:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A6A10E7B6;
	Wed, 16 Sep 2026 10:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bfx/p4gn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F46910E301
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 10:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789555108; x=1821091108;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1QUZO6EmPVOlI3PXrqWeb1JOSG1pD1nsJsFBj4HE15Q=;
 b=Bfx/p4gnVvtGtK+cnSuFpUB7wpx968uvaw7YqLmFIuSN1bZWoFxMx34n
 11VuGDRWPsO0K8Ry9o9KbA5foErJ+ao7c3mdTrSnDz5jfyFmOWzDh7vSN
 IXGpxQSF5UocUxzdIT8jR0Jup3nhPORS5zYunnNUdieg36FlcdJaSwCkM
 2QsN9zYbSzyNZBEALL6TD94jFZsgpEQnYXfpmAdWOXUALIW3YUxDzFUlx
 +zCm3G5nVI+VmTl8cJXI4lZKaRUQ1UloDq/OAUqRgKe6JMlpk9x8kroTS
 rf6KvJdDN8CuIEJSVPcCpxLifNM24aS5J/MkmSXM3BaGtEZq1INSMaLxM g==;
X-CSE-ConnectionGUID: foJXhxZqRsWJmakGuMPDLA==
X-CSE-MsgGUID: JuC2qHkSSFWHEQamanZjgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100525714"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100525714"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 03:38:28 -0700
X-CSE-ConnectionGUID: lO35URuaQyOQjJb7RNQyJA==
X-CSE-MsgGUID: rLe5dRlQQ9SdXqqGPh4BuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277052413"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.146])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 03:38:27 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH i-g-t v1 0/2] Bump debian version to bookworm
Date: Wed, 16 Sep 2026 12:38:18 +0200
Message-ID: <20260916103820.68008-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

Bullseye is EOL so bump up debian to bookworm. This is needed
when a rebuild of debian containers is done, which is the case
for a fix in second change.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>

Kamil Konieczny (2):
  Dockerfile: bump debian version
  gitlab-ci: Fix computing sum for debian image

 .gitlab-ci/pull-or-rebuild.sh   | 7 ++++++-
 Dockerfile.build-debian-arm64   | 2 +-
 Dockerfile.build-debian-armhf   | 2 +-
 Dockerfile.build-debian-minimal | 2 +-
 4 files changed, 9 insertions(+), 4 deletions(-)

-- 
2.55.0

