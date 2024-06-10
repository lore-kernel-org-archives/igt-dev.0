Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86713C27C5E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 08:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144D710E354;
	Mon, 10 Jun 2024 08:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFdjvd4E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B06810E354
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 08:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718006977; x=1749542977;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P3UyAk0fFVdxjLq3bm2A++957WiLeV8Jt9hbvOlXyds=;
 b=IFdjvd4EuzwyDGwvjS7n9HOHufnLF1boFsyIvKvrR/1k5U3kPLYz0I84
 fUA0npWBDWrJBMKngQrB7PJrdH0GCy60MKf7pWEVYxU7XCgc7fCLkByca
 6xJYLRDEgA8ySIShl5g2LbLeFUX1YHEkAZA0TlqugXkkDcpibIeynsvSx
 TUvOpmew0VzIav01cngnGkDx9LioLwimbBtfgJrGvVj7/S/fa6IElj1bS
 QN7ycu1+HJPJYnCp6LSej3eAOkSiqAI1gDZkBoz2iAP5TaoXb0HybAdOL
 ZRwCNDdrxkOdIQTTeVCeulSI6h5BDt2zOyOGUHeDCqX1F7bHRLO0WEjsj A==;
X-CSE-ConnectionGUID: xOeJDUHBSAmnizA2T4dQmg==
X-CSE-MsgGUID: WV6f+GZGSTSdUU5I8asSNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="18439418"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="18439418"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 01:09:36 -0700
X-CSE-ConnectionGUID: hIBwPhW3QyihIiExk7EQdg==
X-CSE-MsgGUID: UoScXmemQqCqIo3iYJXoUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39109781"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 01:09:35 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 0/3] IGT cleanup
Date: Mon, 10 Jun 2024 13:31:46 +0530
Message-ID: <20240610080150.3610871-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Move non-Intel tests to new directories and update blocklists.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Bhanuprakash Modem (3):
  tests/panfrost: Move Panfrost tests to new dir
  tests/msm: Move MSM tests to new dir
  tests/intel-ci: Update blocklists

 meson.build                               | 16 +++++++++++++++
 tests/intel-ci/blacklist.txt              | 12 +++++------
 tests/intel-ci/xe.blocklist.txt           | 12 +++++------
 tests/meson.build                         | 25 ++++-------------------
 tests/msm/meson.build                     | 16 +++++++++++++++
 tests/panfrost/meson.build                | 15 ++++++++++++++
 tests/{ => panfrost}/panfrost_gem_new.c   |  0
 tests/{ => panfrost}/panfrost_get_param.c |  0
 tests/{ => panfrost}/panfrost_prime.c     |  0
 tests/{ => panfrost}/panfrost_submit.c    |  0
 10 files changed, 63 insertions(+), 33 deletions(-)
 create mode 100644 tests/msm/meson.build
 create mode 100644 tests/panfrost/meson.build
 rename tests/{ => panfrost}/panfrost_gem_new.c (100%)
 rename tests/{ => panfrost}/panfrost_get_param.c (100%)
 rename tests/{ => panfrost}/panfrost_prime.c (100%)
 rename tests/{ => panfrost}/panfrost_submit.c (100%)

-- 
2.43.2

