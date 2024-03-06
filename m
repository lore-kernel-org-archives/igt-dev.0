Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9D7C54E4A
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 05:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7740A112EDA;
	Wed,  6 Mar 2024 05:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8quE70p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B940112EDA
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 05:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709702083; x=1741238083;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HRgYQ0B0MwdL6z7e343MQaxbO6xK5v0cnHhndSxikl8=;
 b=l8quE70p+JUbtlPdSr3uTSVrYaUbjkaQXj5RKciiaKFRDdIDlVFKsbIH
 U5iawJlTwr5Csy2uLuq9ajNtYVYXy4b0/gS8n9X/psJfrqYTou/iDW32U
 FGbARlYMvALykUz+tgedA7364OkWk1VBHckgqquu46GI2kGNrXgHtH9IG
 p0Z1ezYcoyUSv2DiYiD/NxOvnQD2qV8D3x1IocfmUDsIxVLsUzcrZtDCE
 5viK6fSM9RhQK3RV1duxvsyhZQgRmONRlOaFLWFI+9ftHi2D1ONRQFdY4
 MhUKKgReSxNkv+zgFt09318A7jQxWubjPnZjxDXiuDgak4RyPLRCIWjhK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="7240382"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="7240382"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 21:14:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9709978"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 21:14:36 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/2] revamp big joiner test
Date: Wed,  6 Mar 2024 10:55:07 +0530
Message-Id: <20240306052509.717026-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

big joiner outputs are statically assigned to pipe,
rewrite to assign dynamically

Kunal Joshi (2):
  lib/igt_kms: move bigjoiner_mode_found to lib
  tests/intel/kms_big_joiner: revamp kms_big_joiner

 lib/igt_kms.c                |  25 +++
 lib/igt_kms.h                |   2 +
 tests/intel/kms_big_joiner.c | 401 ++++++++++++++++-------------------
 3 files changed, 213 insertions(+), 215 deletions(-)

-- 
2.25.1

