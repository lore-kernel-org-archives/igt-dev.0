Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADEFD4920C
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 11:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA36210E1B7;
	Mon, 18 Nov 2024 11:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yw94Ohsl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AE410E1B7
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 11:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731928541; x=1763464541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jq6rqT1k9KdsoZZsefo+HG77MbFnFEXxRDNsnHlBV60=;
 b=Yw94OhslqsZxufAT7rpeYF+u4kfNr6B5yIjGOUj+dcYxVzoTHmfpp1+K
 PYFbtZqZa0xyixqmiZ3cafSAHXWNa3xgYZZPVZrp27phrW+LtCViT+inI
 ISFDFTb4UPAwow9qU1FHC6N8dZdr0B6hhp5S8IcG86iNsDGCIUrW+L7/E
 Giu20UNbQ1A6314uGjlysK0NFWqI6FahChzfobKnWaKIp2v0wfFIEcaYA
 FKiUgWptuTmVg1vlua4347f9WuXKH70zdeqvtBqYXGPqr9LFdHWDgsm4u
 tjuIAR5J9qTEQWoTO+aRSd0emGFtLgPl5luoxVoG8DgTJcP1VsUZCLIXr A==;
X-CSE-ConnectionGUID: QHLPWjohQOi+YlnZ7THmog==
X-CSE-MsgGUID: zb/INhHVRmyTDO79D91M0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43266225"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="43266225"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:15:40 -0800
X-CSE-ConnectionGUID: s7S9mwjJQsCr4qDAXfVrEg==
X-CSE-MsgGUID: FV43kkQ0RrivJgDkOg+E9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="89111629"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:15:39 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 0/1] tests/intel-ci: Block all gem_exec_fair tests
Date: Mon, 18 Nov 2024 11:15:27 +0000
Message-Id: <20241118111528.4190241-1-katarzyna.piecielska@intel.com>
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

As i915 schedules is not going to be improved there is no need to
execute gem_exec_fair tests. For now let's keep them for future
reference.

Ref:
https://gitlab.freedesktop.org/drm/intel/issues/2842
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12786

v2: Fix regexp (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Katarzyna Piecielska (1):
  tests/intel-ci: Block all gem_exec_fair tests

 tests/intel-ci/blacklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1

