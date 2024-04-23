Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCC1C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 08:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5E010F704;
	Tue, 23 Apr 2024 08:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cw0PWshy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFAB10F704
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 08:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713862660; x=1745398660;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NvDYcyBmzxMLyBjiRjYkkSdFQhuj8JgiQ3I4x2J5U5c=;
 b=Cw0PWshy8WteFhDlBH7skId1xRGxA6d7CBl8sYwRgiWm7x3GnheMvBnI
 RQ477tfXXZOdmBawe50pOqBmOnYpq18gnO2VdlE17P7yiMATkMmP3UUUB
 zpV4LdjRGdjJzkloMjsCbqV3AZSjbjL186md2z+Q4P8Xr73MGZdpufS4G
 Rk4tHj5TLCIobJufnROzUF90yLvYT0GxvRK0WVFmeTCW2F4DMGZvo+L0s
 2T03IyvEhxsCKTc1uERFYjHpLiXR0SaA5lAn4EmquOui/8KlFgePoScmE
 nKkSut9vpElFkPxpoVJJkffpVFiSGRwwGwNf5lCuZPuZKyaLDlhO88KCf Q==;
X-CSE-ConnectionGUID: FFkOeJkyT5WbYuZl7giYMA==
X-CSE-MsgGUID: jZ0273NISgGYg3slTAqBdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20835991"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20835991"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:57:40 -0700
X-CSE-ConnectionGUID: Xp8TP2znT8aAhkqtwv79DA==
X-CSE-MsgGUID: MVYtl0hKQQykgCU4Mnxhzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29102037"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:57:38 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: tvrtko.ursulin@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 i-g-t 0/6] benchmarks/gem_wsim: Extend engine selection
 syntax
Date: Tue, 23 Apr 2024 10:56:40 +0200
Message-Id: <20240423085646.6672-1-marcin.bernatowicz@linux.intel.com>
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

Introduces significant changes to the engine selection syntax:
- Dynamically generates the list of available physical engines.
- Identifies engines using [class:instance:gt] tuples.
- Allows specifying engine instance and gt as 
  `engine_class[<engine_instance>-<gt_id>]`.
- Adds support for compute engine class (CCS).
- Maintains 1-based engine instance ids for compatibility 
  with existing workload definitions.
- Enhances `w_step` with `engine_idx`
  and `request_idx` for throttling functionality
  (both populated during prepare workload phase).

Adds command line option (-l) to list physical engines.

v2: Split into multiple patches for easier review (Tvrtko)

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Marcin Bernatowicz (6):
  benchmarks/gem_wsim: Introduce intel_engines structure
  benchmarks/gem_wsim: Unify bond handling
  benchmarks/gem_wsim: Introduce engine_idx to streamline engine
    selection
  benchmarks/gem_wsim: Update request_idx in prepare phase
  benchmarks/gem_wsim: Extend engine selection syntax
  benchmarks/gem_wsim: Option to list physical engines

 benchmarks/gem_wsim.c | 835 +++++++++++++++++++++++-------------------
 1 file changed, 449 insertions(+), 386 deletions(-)

-- 
2.31.1

