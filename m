Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E631C79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 12:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F254210E22F;
	Thu, 10 Sep 2026 12:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlBCzX88";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 10 Sep 2026 12:46:50 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670CA10E22F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 12:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789044410; x=1820580410;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dTC056JGRV8BpqBKEdDNUQZzIIXlx//z4qbLVLvNcBw=;
 b=PlBCzX885CPCgei3farVd91OuJNeccdgk2Yv6Hcyldyz15FzWiXDUWtN
 aOpTLeZtGNb8kDCSHNJQyWVYiCZlNB2eitmqSqIhSGo3PDiF0G5Ac5nZR
 6ltXNe7yncrZwQx7Gywb4FS6zI9SNgzYMRljX8D1oq2YDmIZpqv6XP4+Q
 hvWYNIIONl74xfdrJy2OjirP2ftvaQ9gRRLoemmJC2H6wlWH5wJCjLgjX
 NgQ6xuADkX4p0wAbH2auuK9n94WFg4PRyssTscTBBHDjHx7pRkyeBA319
 3gUbzlCazWOljDLvakFJ+3X+fQD7auDsRLlAyRN8r5FbKuCHYKp4VMoeT Q==;
X-CSE-ConnectionGUID: KMi7nEJeRaKkHB2ayTQQdg==
X-CSE-MsgGUID: HZoOxu4qTG6pnKxx8BFmkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="13792"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="13792"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:39:45 -0700
X-CSE-ConnectionGUID: BZw/pPetQK+PQzDi++5Fwg==
X-CSE-MsgGUID: FEdQ4sb+S2KB+P0fBtjWhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="265413955"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:39:43 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/1] lib/rendercopy: Use the Xe2+ depth buffer packet
Date: Thu, 10 Sep 2026 14:39:33 +0200
Message-ID: <20260910123935.4183522-1-jan.maslak@intel.com>
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

Jan Maslak (1):
  lib/rendercopy: Use the Xe2+ depth buffer packet

 lib/rendercopy_gen9.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.43.0

