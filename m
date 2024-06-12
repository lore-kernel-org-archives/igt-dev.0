Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB1AC27C75
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 07:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA2E10E7AB;
	Wed, 12 Jun 2024 07:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WyM+wQ7z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC7410E7A6
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 07:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718176285; x=1749712285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Oom9tDWRAJCuieD7xUMSJVqfiCIDFLtccY/Mclpx1Hs=;
 b=WyM+wQ7zK2unYX290RhI6TrIhdqazOrKwBkTze8lDjQ4WWlAkmRDnaZ8
 Lxr0XgOWuH9vvptlH1IqtIOnWqfc4lZQ3ve1h/hYeKJvGDtytuvgmdUgj
 WTfBMKhBf50uIJqHTx8dkPL44DpKPgWjH/73Mmh0roYK4/P3dBb+TY1NL
 UNzaNsMm+Gjmyp8WZ9M2wrO10cDLmVh3B2ZwNCT+FWZrFuuhgcSMqoX0i
 ZJ+kcf7mbwkKZsMoesUC7pD70+Hp1tIPdKaagRqVGk06Wnz4n95+VBpix
 qhwM8yYWVs6SOXTyRsZnaA78fy/F2vNSF29l6J7RVm/D+5yLDWh6Pf68y g==;
X-CSE-ConnectionGUID: j4A+PyaxRPSvUPVLGP19ew==
X-CSE-MsgGUID: Xv8fN+4nQjWptlsvAR0vNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15092487"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="15092487"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:11:25 -0700
X-CSE-ConnectionGUID: ruwFskgnTS675ansNBArUQ==
X-CSE-MsgGUID: 4glZkH82S+agbLh4sT5UIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="62868003"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:11:23 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [i-g-t V2 0/3] Move non-Intel tests to new directories
Date: Wed, 12 Jun 2024 12:33:32 +0530
Message-ID: <20240612070335.3758500-1-bhanuprakash.modem@intel.com>
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
 tests/intel-ci/blacklist.txt              | 10 ++++-----
 tests/intel-ci/xe.blocklist.txt           |  4 ++--
 tests/meson.build                         | 25 ++++-------------------
 tests/msm/meson.build                     | 16 +++++++++++++++
 tests/panfrost/meson.build                | 15 ++++++++++++++
 tests/{ => panfrost}/panfrost_gem_new.c   |  0
 tests/{ => panfrost}/panfrost_get_param.c |  0
 tests/{ => panfrost}/panfrost_prime.c     |  0
 tests/{ => panfrost}/panfrost_submit.c    |  0
 10 files changed, 58 insertions(+), 28 deletions(-)
 create mode 100644 tests/msm/meson.build
 create mode 100644 tests/panfrost/meson.build
 rename tests/{ => panfrost}/panfrost_gem_new.c (100%)
 rename tests/{ => panfrost}/panfrost_get_param.c (100%)
 rename tests/{ => panfrost}/panfrost_prime.c (100%)
 rename tests/{ => panfrost}/panfrost_submit.c (100%)

-- 
2.43.2

