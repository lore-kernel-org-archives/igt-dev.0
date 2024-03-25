Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECF3C54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 09:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9CC10E6E0;
	Mon, 25 Mar 2024 09:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLvyCNwR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C4210E6E0
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 09:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711359416; x=1742895416;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zPIEro+GXpdCM1J7yZRvPsC7UYG/KKJ/k8V++vnpqAg=;
 b=VLvyCNwRBHNyjyH/0011WXki0nGVhIjT4+p04NAmH90ZhzNJkaWXsgo9
 4MUZmDG5gyfL0CnNsoyB3ZxgaVVh+8sMncGqKNRUqbhsuguSjKm1PpWu6
 eooGPEzsa8benetV0Hdjxd6sB15vlqUmMT9s4KXxX5By4KQ/Lhe6QaCgp
 NVAFbe1eEH27KF9Dv172QSMCCpfl6E8FE79dyfN2xc47bAlt/CYC4gfcp
 L/NmcwRlmZN3J1wvy5VhodHIETC5vP+W7c1RtqWpEJTDsx65xmmDhdfTO
 oLeJh+S6aHWG4AvNhe+P5dVxACxOP+3uTYUwG0wSghqibNdC60nPkabb6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="16983172"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="16983172"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 02:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="15471347"
Received: from unknown (HELO localhost.localdomain) ([10.190.238.8])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 02:36:52 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [v2 0/2] Add support to paint already mmaped buffer
Date: Mon, 25 Mar 2024 15:07:28 +0530
Message-ID: <20240325093730.13640-1-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.43.2
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

On some of the platforms first write after mmap takes longer time,
hence provide and option to just update the fb incase we are resuing
the mmaped fb.

v2: merge patches 1 and 3 from v1 to patch 1, and fix review comments

Vandita Kulkarni (2):
  lib/igt_draw: Dont mmap, if the buffer is already mmapped
  tests/kms_async_flips: Reuse the already mmapped buffer

 lib/igt_draw.c                         | 61 ++++++++++++++++----------
 lib/igt_draw.h                         |  2 +-
 tests/intel/kms_frontbuffer_tracking.c |  2 +-
 tests/kms_async_flips.c                | 16 +++++--
 4 files changed, 52 insertions(+), 29 deletions(-)

-- 
2.43.2

