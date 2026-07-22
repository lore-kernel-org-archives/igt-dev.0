Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A14C4452D
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 07:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54B110EC9B;
	Wed, 22 Jul 2026 07:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIvNF07V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD6A10EC9B
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 07:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784705421; x=1816241421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=na5tzhtmWMDXR0SMQ7SBMaHLLUhLZT/Q6QIWhrHsKGU=;
 b=MIvNF07V1FXETcamBihYPszzcr35qx0m8/G8GQmotE3wHn+3afo5TUZb
 sw1hd564YLR2IcJKoh9E5jSeSpgJsM4nxve5tFmjNM5XH7mi9rFK82mFM
 AIYzrXRtMMtvRRnviPolDrgcvTuuM6ts5eij7c+EBeiX5nlJiFW0JCZix
 idPvKeLrvy+TRAe6uqinJLy8WUYRlEFeuynYES/o70XhVEun3FXtPl0x7
 qkCMSngKrpEyrU4b4/dhIv8VpKoZUuTS+CyZCHdbMPCWqkiTAyoXvh6Cg
 qUFRa9pgTuevE6BuC1S2UuTb/r1yx/nudXGkJqwVB/0wh66Kcyx5vMgz0 g==;
X-CSE-ConnectionGUID: zxp2V5IuT2SOViwLjZ7uJA==
X-CSE-MsgGUID: Z2VTzWoPSgy5PnHncYyh+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="110874735"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="110874735"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 00:30:18 -0700
X-CSE-ConnectionGUID: vaK5cUxaQR2rHQoVT1sFaA==
X-CSE-MsgGUID: OO3l2zAjSBqWmNX6SNNw0w==
X-ExtLoop1: 1
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.245.176])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 00:30:16 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/1] Remove EUdebug meson option
Date: Wed, 22 Jul 2026 09:29:58 +0200
Message-Id: <20260722072959.12790-1-dominik.karol.piatkowski@intel.com>
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

This series is a resubmit of patch 8/8 from [1] v4, as back then it was
breaking CI pipelines' build. Rest of [1] is already merged.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

[1] https://patchwork.freedesktop.org/series/168778

Dominik Karol Piątkowski (1):
  meson: Remove Xe EUdebug

 meson.build       | 2 --
 meson_options.txt | 5 -----
 2 files changed, 7 deletions(-)

-- 
2.34.1

