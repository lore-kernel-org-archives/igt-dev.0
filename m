Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97720C02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 06:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E77010E4CA;
	Tue, 21 Jan 2025 06:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qiq+Tnpo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A602510E1CE
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 06:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737440544; x=1768976544;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0CXqBufTeiTSpY5WkLGLJv7ZU9aqG5+6q2+PsygD7Ho=;
 b=Qiq+TnpoP3hiNytNq1lvgHNg67nqVrfbiBq5b5RrTDTClJ0rqaf9QL2G
 oigWA2qR7CYo6J54eM7uNLwUF9NKn6Rv5DS6xbQAl9VICRgQ0dDELMH+V
 MHCT3QZUrVyh59TiOBU3JzTBZjilEk7/uBh6vkjglAXVOz742eaxoB3iY
 a+G+8EWmau/pj2t7te0xbJ9d/bvWJUQvLcR4Pg6cwe5Ujy1JTP/IjDBJF
 /hgrDYBDQzezBiDO7E3OtM9y84Zllyoz7ulAEN8A/G2IWe2opt8YfgJNK
 tZLA4rZrWmp3TERQirX8k26NyScvt5pzBCgVVpf4AUe1E/mjt51XjHKAn A==;
X-CSE-ConnectionGUID: hjwVNafgQ0miUtwep24KrQ==
X-CSE-MsgGUID: hmRbdB4ETue0g+KqsgrvXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37999068"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="37999068"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 22:22:24 -0800
X-CSE-ConnectionGUID: uIPQVfXwSc2XNuM3KyCvlA==
X-CSE-MsgGUID: IKw2P3G6TyutKPyS1BJ/vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="111684926"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa003.jf.intel.com with ESMTP; 20 Jan 2025 22:22:22 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 peter.senna@linux.intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH 0/2] Make igt_facts_test noreturn and cleanup
Date: Tue, 21 Jan 2025 12:02:05 +0530
Message-Id: <20250121063207.71737-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

fix BOOL_COMPARISON, COMPARISON_TO_NULL,
LINE_SPACING, PARENTHESIS_ALIGNMENT,
Remove extern from header warning from checkpatch

'Fixes: 1a9c3117328 ("lib/igt_facts: Library and unit testing")'

Pravalika Gurram (2):
  lib/igt_facts: Make igt_facts_test noreturn
  lib/igt_facts : Cleanup

 lib/igt_facts.c | 24 +++++++++++++-----------
 lib/igt_facts.h |  3 ++-
 2 files changed, 15 insertions(+), 12 deletions(-)

-- 
2.34.1

