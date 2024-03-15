Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F93AC54E58
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 06:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D2510F9D2;
	Fri, 15 Mar 2024 06:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZSqFjwM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF7910F9AF
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 06:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710483078; x=1742019078;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y/E6GBtxDBaf0umCbz/BuMdoUaGABoDQbAgHww9eGM0=;
 b=YZSqFjwM5bDq/ckWdjwHp6J1edFsG0WEznHuW8cf2IO25emM+iy43rMb
 GILwZhKf3uIz6y6Nvg2PPv3+Sl26V9tarOgNR/6i52BZp/ypD26Z32Hf4
 JUm3S6OKS+Bi+gjvTbRZR7ujMucNvWRHqSCfidrVdtFATWbA3hgH0CD+8
 kWPdMDOhIlxvDOmmvXHNuatf7xq2y+x/js0dLECjfhSxPiVdZoVkak8OX
 9FwUAarXvLs849qvxxa6frG6YGcuee8hkWAfuQtmB42J9FbywrSByODt+
 txUU55jg8hMTKjvjTluuxNxphbAaY+DEw82HPVhsCl7EmUaGH4+7dGz35 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5187363"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5187363"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 23:11:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12463506"
Received: from unknown (HELO localhost.localdomain) ([10.190.238.8])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 23:11:14 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, bhanuprakash.modem@intel.com,
 "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
Subject: [PATCH i-g-t 0/3] Add support to paint already mmaped buffer
Date: Fri, 15 Mar 2024 11:41:39 +0530
Message-ID: <20240315061142.6591-1-vandita.kulkarni@intel.com>
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

From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>

On some of the platforms first write after mmap takes longer time,
hence provide and option to just update the fb incase we are resuing
the mmaped fb.

Vandita Kulkarni (3):
  lib/igt_draw: Dont mmap, if the buffer is already mmapped
  tests/kms_async_flips: Reuse the already mmapped buffer
  tests/kms_frontbuffer_tracking: Align to new igt_draw_rect usage

 lib/igt_draw.c                         | 57 +++++++++++++++-----------
 lib/igt_draw.h                         |  2 +-
 tests/intel/kms_frontbuffer_tracking.c |  2 +-
 tests/kms_async_flips.c                | 16 ++++++--
 4 files changed, 47 insertions(+), 30 deletions(-)

-- 
2.34.1

