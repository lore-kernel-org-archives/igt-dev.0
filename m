Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574ADD6DDEC
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 09:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEBF10E139;
	Fri, 15 Nov 2024 09:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RqHeKkYX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E64610E139
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 09:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731661200; x=1763197200;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RFuu1d14b9cb+2Xyq2mykFRKkIoDU8G1xbz3367bkmQ=;
 b=RqHeKkYXtGi9kzOuWv6/d3zUtP4Gx0j/bp0sE6cPUZKd7qg3g/TA3pCe
 GKS5q1444veJdTf/pvpmAhnGlLzukeG9BfLMozif0/GrNLzI68xd4rg4m
 9IMzaAyq/SxCcBpKgamtw7O8URxmj8WkY9Vps0Qj5oTzczKceqUubu1lC
 eEkvowmJ30ps4JAJuRg0QoDTyT7DcfGIscNXFB2qnxCFtf2jVS1mqMnAP
 qR9Xi+CMHspciGWrk5WrPa8f6SMNxSubZDZ9XMGaiCp+gyYV2wt/pGlL1
 6vU/tqrE/heO48wzM+wY3v6xI3MJZH6X54I6VTaeDAzH8fA+2YBkxCcLc Q==;
X-CSE-ConnectionGUID: NKfvMCA+QuiAPzEngJvOmA==
X-CSE-MsgGUID: QxNoAqRuRVmGMYLPzBzVeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42191587"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="42191587"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 01:00:00 -0800
X-CSE-ConnectionGUID: 0FLmyH4dTq+gmrJHJJatBw==
X-CSE-MsgGUID: yYDekumfT72UjzDuhkHUTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88915549"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 00:59:58 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel-ci: Block all gem_exec_fair tests
Date: Fri, 15 Nov 2024 08:59:46 +0000
Message-Id: <20241115085947.4054676-1-katarzyna.piecielska@intel.com>
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

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Katarzyna Piecielska (1):
  tests/intel-ci: Block all gem_exec_fair tests

 tests/intel-ci/blacklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1

