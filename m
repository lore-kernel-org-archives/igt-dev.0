Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5394CD6DDEC
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 09:00:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175A010E1BD;
	Fri, 15 Nov 2024 09:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GW8clomP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF7010E1BD
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731661209; x=1763197209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w04TcUnCjWMNWcCcH6j2EpuXaTyFZo0Yg47UBNw/d9k=;
 b=GW8clomPpGGBu2McEMwq+UpHdAEBoOgnYLXiQJ/6QWNegBMDbKlzoxXX
 Z211w9qZ7aGE76lqqmFTTIKM0yHSEg843JI2EpuwQa7LA2UeQUyhrRbLi
 iELeWKB4E54Uhkn5VjLFd0UpU76A33A6/v1eTIxfmsU9gRAtGz8uhnQKL
 +AEu6mYwykfWwyuZa/hlwjDy4wq0JL9awsG39LnKL4C4q1XJ0fp7anhqG
 dCfuzmIiMUp/QAluxSaj9w5AUPaIFWUbY3SIfr1AbajiDgV5jgrEVO5Q9
 8Pontq/tSk7sxlzOWP1ydilQMURiNaj9kwWmqHRgzYfjgZiczwUqJdVub w==;
X-CSE-ConnectionGUID: ycgsgqS4QRaerGL0didhLQ==
X-CSE-MsgGUID: 6au+aFxTS3OAB0D85pS9Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42191597"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="42191597"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 01:00:08 -0800
X-CSE-ConnectionGUID: AQc0EhMYSNC76Ge3MJi1cw==
X-CSE-MsgGUID: qwIcg9uDQHScUBHuemLTMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88915650"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 01:00:07 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel-ci: Block all gem_exec_fair tests
Date: Fri, 15 Nov 2024 08:59:47 +0000
Message-Id: <20241115085947.4054676-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115085947.4054676-1-katarzyna.piecielska@intel.com>
References: <20241115085947.4054676-1-katarzyna.piecielska@intel.com>
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
---
 tests/intel-ci/blacklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index cfc5491d5..6d1a4111f 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -29,7 +29,7 @@ igt@gem_evict_alignment(@.*)?
 igt@gem_evict_everything(@.*)?
 igt@gem_exec_big@(?!.*single).*
 igt@gem_exec_capture@many-.*
-igt@gem_exec_fair@(?!.*basic).*
+igt@gem_exec_fair@(@.*)?
 igt@gem_exec_fence@.*hang.*
 igt@gem_exec_flush@(?!.*basic).*
 igt@gem_exec_latency(@.*)?
-- 
2.34.1

