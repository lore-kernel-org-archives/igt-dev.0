Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D84C79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 16:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A3C10E2B7;
	Thu, 10 Sep 2026 16:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tsn/gWFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC62C10E2B7
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 16:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789057648; x=1820593648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JCOo1fv+us7yOGX/jq6mBPlwFhxISQMmbRCT7ZEeCfs=;
 b=Tsn/gWFYlvX9CNBDUeFtgyLPS8Av3qGkfstE/IVQt8HweNW0fxBYDC+a
 3Jy5bf/TqGq1kjp6TIB+BBhgU9QuH7RZVe2fEtAY8MJmKkJeNKf+I1rDB
 YzcC7mv/7eHX4Uz60mLRCKvQbSocprwj+rxrmkn3ZXBzRTseSMC0o3FkA
 dpTXGQWKwER3A4EoxguElR4aO3XZanAi5hjzvrWht6CAfQFxZzv3Nwe/7
 kYIRM1MMR41guRO3a5BYiEVmguSovWupFgyulr0PHGY4we8zoknLDW1eh
 rm2OiXF+ZULwvJG9UCZQtv5wDKsiiaaHKIYNytfEpzv6QB4ZTTGtquFiV w==;
X-CSE-ConnectionGUID: jCi8oFTQQUqNCbSulUcueA==
X-CSE-MsgGUID: a3bjzbZ9RgWlqHFH3OTRvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="115058356"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="115058356"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 09:27:28 -0700
X-CSE-ConnectionGUID: SVALFogQQ0m8dtjUAGQeNw==
X-CSE-MsgGUID: usJnmAtmR4qchzkar8xe+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="269921952"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 09:27:27 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, andrzej.hajda@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v2 0/1] lib/rendercopy: Use the Xe2+ depth buffer packet
Date: Thu, 10 Sep 2026 18:27:17 +0200
Message-ID: <20260910162718.4189583-1-jan.maslak@intel.com>
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

v2:
 - Extended commit message to clarify the dropping of HAS_4TILE check
   on Xe2+ platforms

Jan Maslak (1):
  lib/rendercopy: Use the Xe2+ depth buffer packet

 lib/rendercopy_gen9.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.43.0

