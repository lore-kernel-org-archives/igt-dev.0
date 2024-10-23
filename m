Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1C9D2E010
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 05:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D70310E72E;
	Wed, 23 Oct 2024 05:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mgRmdPVy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DAC10E72E
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 05:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729659928; x=1761195928;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gRLqeXd/LNQOXQcA3PDtfzVxKuFO+7Yqmt9omQM8vdc=;
 b=mgRmdPVyKz7pp7Azx+hJ8gAfkGG4F8AMUaEWjoGZIjXwbZB7FkTdISt9
 m/aoLG0npAU/5NVbMdJ62SIPz7HTddU2h5NTkHWomWIz2wMUgc1oSKmhs
 u31x++vnAXRm7Q6GZMF9FADHizacAXVMXjyv1JDsnBDecazdIjSAJm9tO
 1E0qyaMUYrJEtO1xp4LM47Rk+WViIZpH+EdwgDfTB9IHS1PG044edSK48
 rS1CF7MgIBlzZRXclhzmK3FRpC+LYV4NL1B9ZtSFSm8xV4/N9/jgUuEF2
 GiNGJA7PEzRdKvKFhXQ6LCmrkL/pkhHB50vfG6dGU6Wdr67f83ZguSJNB w==;
X-CSE-ConnectionGUID: g13ZlltzQMeH3lzYTXNfmA==
X-CSE-MsgGUID: RJL7tqYFQfGs5wDjzFanTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="16849310"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="16849310"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 22:05:27 -0700
X-CSE-ConnectionGUID: KBMeuuhXRBSlEUxxQHVtaA==
X-CSE-MsgGUID: F1pa+WuLS6exEUcjII5eNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="84871444"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 22:05:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/2] Fix perf_pmu@unload
Date: Tue, 22 Oct 2024 22:05:00 -0700
Message-ID: <20241023050502.3049664-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

This is now passing for me on DG2 since it now uses the unbind + unload
logic. Besides, this should not explode in the kernel anymore when used
together with the patch mentioned below.

I have other changes on top to make the unbind+unload logic for all i915
tests (just like it is for xe), but I don't want possible noises in the
tests, so I will leave these for later.

Test-with: 20241023042909.3038309-2-lucas.demarchi@intel.com

Lucas De Marchi (2):
  lib/igt_kmod: Export igt_kmod_unbind()
  tests/intel/perf_pmu: Migrate to unbind + unload

 lib/igt_kmod.c         |  6 +++---
 lib/igt_kmod.h         |  2 ++
 tests/intel/perf_pmu.c | 22 ++++++++++++----------
 3 files changed, 17 insertions(+), 13 deletions(-)

-- 
2.47.0

