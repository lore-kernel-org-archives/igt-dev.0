Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19164C47DB3
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 13:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA2D10FA1D;
	Wed, 31 Jan 2024 13:26:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FAB10FA09
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 13:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706707564; x=1738243564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GQgKJhk12UnKUOVDQmYKMggxdF/HIq31VUr9gx1rGYo=;
 b=K97KX/aIrl3yF2GPq6DmbXS/PmntRseuSr02Vn36V7Sq/mFpLuJBtkiJ
 345gFQjw/szfViINdrqfOzwlH+pRVEkloJnTXvrapzyx8Wb59Ul/GP/UN
 BVvq/mmYKmuD+yvD88oN3lMNx+Mw7npN5iVqUfbjKmsOV+Hn5zXACMByg
 Q51gBtRPX+yq6b/4CFYSDfaG1l/LBkElTnf4JhnzgGElan708alPI6NBU
 VQpGCR4HshTUR7CLQfoe+VWEhvuXd8CUqV7Om/41TRbwDlXMnkvrACGpx
 AWa1U0bfBb7iJC2kfExv8k8b83eyIXVb/bF80xsBA/4vN9QXOGpu6qdPF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="25075075"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="25075075"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:26:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4093567"
Received: from mmackowi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.18.126])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:26:02 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 0/4] Fill block-copy test gap for unaligned sizes
Date: Wed, 31 Jan 2024 14:25:54 +0100
Message-Id: <20240131132558.208971-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Using 512x512 resolution for testing is too optimistic and hides intel_blt
limitation for using different (smaller) resolutions which also might
not be aligned to expected stride and height.

Address this by adding few helpers, change blt buffer creation size
calculation and add "increment" version of the test in xe_ccs.

v2: fix handling Tile64 what also requires bpp in dumping to
    png as helper for aligned height depend on it (Zbigniew)

Zbigniew Kempczyński (4):
  lib/intel_blt: Add helpers for calculating stride and aligned height
  lib/intel_blt: Change surface size calculation
  lib/intel_blt: Use object pitch and aligned height on png write
  tests/xe-ccs: Add tests which exercise small to large blit sizes

 lib/intel_blt.c                |  83 +++++++++++++++-
 lib/intel_blt.h                |   2 +-
 tests/intel/gem_ccs.c          |  23 ++---
 tests/intel/gem_exercise_blt.c |  16 ++--
 tests/intel/xe_ccs.c           | 167 ++++++++++++++++++++++++---------
 tests/intel/xe_exercise_blt.c  |  16 ++--
 6 files changed, 233 insertions(+), 74 deletions(-)

-- 
2.34.1

