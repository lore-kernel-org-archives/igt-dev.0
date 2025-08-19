Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E79ECA0EE6
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 20:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D0B10E211;
	Tue, 19 Aug 2025 20:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGoLYr4C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789AE10E211
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 20:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755636068; x=1787172068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BOS0/cXrBX0Exx7VnSoVdcMgaORjqdA8HETCycGhtaw=;
 b=RGoLYr4CTYcUR32O5h47R1Av8A2LdFV+jWAK35528L6PlhY98kKA9IAH
 TXpZBj8xiO5ePNDCrUAXUJidC5iq/3FxmJXaPRtHHKL3OW7FwMQp99lgV
 HHl98RV3qI/Lco+LP+hMtcFdfYdM7Z7gvob0rxlB3/3+B+07b3xINL9/G
 kSda1GNyVIO1hu8RU9m/eWrULkCzUdb+pu80JOOsYYOCcuGsJnmT3h/qc
 z4JK4si2Ou5ncK5ekmbkUEeJPvrp6OTg29c2mYzT+atc4bLDIQxTRp2tV
 uatLLuZ5qP7o4YzWU0PpQQfIdT0nTChO+U/B1VFqO7/Q9NXShVBIa5GNK A==;
X-CSE-ConnectionGUID: HIx3zfwJRxqeeKJGIPOtdA==
X-CSE-MsgGUID: 9m5955ZtSG+HapiTrPXOhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57846802"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57846802"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 13:41:08 -0700
X-CSE-ConnectionGUID: Ag1GoTMpTVGXDzoI30lavA==
X-CSE-MsgGUID: X7ImwfMnRhCjn1kGKzc/Rw==
X-ExtLoop1: 1
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 13:41:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t 0/4] tests/intel/xe_configfs: Unbind before tests
Date: Tue, 19 Aug 2025 13:40:39 -0700
Message-ID: <20250819-configfs-unbind-v1-0-8359e66e3241@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250819-configfs-unbind-e7e839ac7e68
X-Mailer: b4 0.15-dev-b03c7
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

Some refactors/fixes and preparation for configfs returning -EBUSY when
device is already bound.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Lucas De Marchi (4):
      tests/intel/xe_configfs: Do not execute with open fd
      tests/intel/xe_configfs: Unbind before testing engines_allowed
      tests/intel/xe_configfs: Install exit handler once
      tests/intel/xe_configfs: Reset all custom settings on exit

 tests/intel/xe_configfs.c | 54 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 15 deletions(-)

base-commit: 2ce91744e2b4493045b2e6ca94391d3921c600ff
change-id: 20250819-configfs-unbind-e7e839ac7e68

Lucas De Marchi

