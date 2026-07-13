Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24169C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 05:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E2310E547;
	Mon, 13 Jul 2026 05:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jy0dPakC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5119410E547
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 05:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783920472; x=1815456472;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qgEG8KfSFYBXPp0etMG1ss7Kg7HeBmTcgvZhbJ6F6yw=;
 b=Jy0dPakCia/UYuvsE1oWruFZdi2vqD/TeuU/WQ7WjlguScIjByqN6Kjl
 c3vWzE8HCPMqWmaaN/QpFGesPG6Mkk2w/OcXqAbY4BI93mzhbdqG2JgA8
 43Pihs9oUEJ4iWH460gxTr+k9nTNWNDV4wDYqlLq0U/gL3QGf8ltTuZnn
 1IK/BZhigYS/0RCPutn+qksFTltdc+f+K9eiDLh7VayqvMgo+TW6Jruja
 wV6pmcxGfbROQBU+1xoqLZ01tL/IDtL1txNvnv8Sirl1A+3OxrK6wTqUd
 iFMtHnPjxjYZ8b1Nj8ePQtqaVDzGEoYzy83LF0TKlwyM/COKBlGnXcuIw g==;
X-CSE-ConnectionGUID: y0o3hS9FSMiOrWAhkHohTQ==
X-CSE-MsgGUID: rdDvOd1HTKm39DOIt21W+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107322178"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="107322178"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 22:27:37 -0700
X-CSE-ConnectionGUID: pCr2pB3eSDWdCjnmhDmkag==
X-CSE-MsgGUID: St6Yz1KjSIOsrgTYgOdyrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260332424"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa005.fm.intel.com with ESMTP; 12 Jul 2026 22:27:35 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 0/2] Rename test and relax platform
Date: Mon, 13 Jul 2026 10:57:35 +0530
Message-ID: <20260713052734.2231573-2-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

It has 2 patches:
Patch 1 has changes related to rename test and relax platform.
Patch 2 has changes related to make the test work for all compute
engines.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (2):
  tests/intel/xe_cw_post_sync: Rename test and relax platform
  tests/intel/xe_cw_post_sync: Run walker-post-sync on all compute
    engines

 .../{xe_non_msix.c => xe_cw_post_sync.c}      | 19 +++++++++----------
 tests/meson.build                             |  2 +-
 2 files changed, 10 insertions(+), 11 deletions(-)
 rename tests/intel/{xe_non_msix.c => xe_cw_post_sync.c} (92%)

-- 
2.43.0

