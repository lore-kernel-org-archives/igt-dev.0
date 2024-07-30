Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A538DC3DA70
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 16:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5136810E22E;
	Tue, 30 Jul 2024 16:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSuSzOUe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AE810E22E
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 16:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722358185; x=1753894185;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qFaB+GZcv/hhZLQXzwDvHMyz7bzU7OOaCK6jlGwLyW8=;
 b=GSuSzOUe2VJmMBuiea5/vrRhI9e9JEL6KId7n/AYScSV/ip0Qu6EIdSX
 JjMcrgEv8QvTULkj3LEC2zC7CeFlPeR+FLY+QtFkZnOTRNwZU+Qt4+3ip
 DMTZH1+YP7Qp7SZjM+Pz121tZvjpA60W8oa55zGpSHT4jINzqrrdl2YsE
 dLKSE+bQsLkfgsQTwraVXxj4dAsebel+tkeDJiCElVIzIqrurXTwLqUSR
 mu1vbltz+Dgn56tMSMLGETKZgKn3EwY/mmsN/2ZhTh7wxdt9qCpJzyYJd
 r1N4UlbjymEcrmTiCS+LIzHt2x846zVHKxqiso0NFEUQeOqINi6cZX8dR A==;
X-CSE-ConnectionGUID: Ni9Od6oAQPGAPelHSQqlew==
X-CSE-MsgGUID: 2mJ1ja5CS+2nFgKZJC0XWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31338875"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="31338875"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 09:42:43 -0700
X-CSE-ConnectionGUID: qqsiSBExR0qQYlk7jZw9iQ==
X-CSE-MsgGUID: WbCTLtFiSPGTWEGHrOHKRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="85038940"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.0.122])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 09:42:41 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t 0/3] Add sysfs attribute checks for gt_freq and
 pm_residency tests
Date: Tue, 30 Jul 2024 18:42:29 +0200
Message-Id: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
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

This patch series introduces necessary attribute checks to ensure that tests
are only executed when specific sysfs attributes are present. This prevents
test failures on Virtual Function (VF) devices where these attributes might
be missing.

Marcin Bernatowicz (3):
  lib/igt_sysfs: Add xe_sysfs_gt_has_attr to check attribute existence
  tests/intel/xe_gt_freq: Skip test if 'freq0' attribute is missing
  tests/intel/xe_pm_residency: Skip test if 'gtidle' attribute is
    missing

 lib/igt_sysfs.c               | 25 +++++++++++++++++++++++++
 lib/igt_sysfs.h               |  1 +
 tests/intel/xe_gt_freq.c      |  1 +
 tests/intel/xe_pm_residency.c |  2 ++
 4 files changed, 29 insertions(+)

-- 
2.31.1

