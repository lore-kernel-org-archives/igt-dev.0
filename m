Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA8FE83062
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0839510E147;
	Tue,  3 Feb 2026 08:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NaE/SQLE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9FA10E147
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 08:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770108430; x=1801644430;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E+As+FtjcO7gvPwaQu4Hm7xAwIYklUyp5PQvlGd8VNE=;
 b=NaE/SQLE+EgpSnxqMna133zhfHh8IVSVANk13Fv/SaLaD4gGABtZrTpt
 8oAbBrH6MR1PqrCp2slM+4o1gMrOy6DBtSDL4AsjTmVlOUXwzhqBZ7QGT
 YFdjim9fL1rzQcUbYFLHrL7VC6FZtevbaKbVw7YnIam6zs1BztUgW2Cm+
 OVKvnPMkZcAXV9fgXxJ+kfdytezlvLhtM39HEVvZhVJMrDGMIrQzG8pJf
 y7G19liCcMMw29Jkg4AH48hYhgDB+BmvmtQCA2OKI6IAh8dk1hwXDDOaj
 7KaUf8RE+R1WAVExLVuheWixo3GcyVpQiyOmnklMy+ZaikPh0+asxIJUg g==;
X-CSE-ConnectionGUID: lykkmqW9SWetSQcGQNbI1g==
X-CSE-MsgGUID: tsoxu9nSTgaCRHUY4l1N8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82647696"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="82647696"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 00:47:09 -0800
X-CSE-ConnectionGUID: BsPW9RqiThGouil97/fnFQ==
X-CSE-MsgGUID: roEBGZ1bQC+c0dXUyhO1KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="240455274"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 00:47:06 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, swati2.sharma@intel.com,
 animesh.manna@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 0/1] PSR2 Selective Fetch detection for async flips
Date: Tue,  3 Feb 2026 14:12:56 +0530
Message-Id: <20260203084257.1372798-1-santhosh.reddy.guddati@intel.com>
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

This series fixes PSR2/Panel Replay selective fetch detection that was incorrectly
skipping cursor tests on external DP panels

Santhosh Reddy Guddati (1):
  tests/kms_async_flips: Fix PSR2 selective fetch check for cursor tests

 tests/kms_async_flips.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

-- 
2.34.1

