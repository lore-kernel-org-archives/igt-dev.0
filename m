Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A29DC71157
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 11:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C465F10E137;
	Wed, 18 Jun 2025 11:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NUs1PinH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5632F10E137
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 11:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750247894; x=1781783894;
 h=message-id:date:mime-version:to:from:subject:
 content-transfer-encoding;
 bh=RdxIY8caTSimNkK2IytFRaXw6Jp2ag9lZlrdVxfWp1o=;
 b=NUs1PinHfaNG2/ydpfaYvFk/Q0LKXlmE5Hfo6BaItw+agc3G0zpgVqWe
 kIJJ5uEbKuJKjkncrZU0e2qKTt56RhE/o44zB4EAIVOIymvmp0T3zu+dk
 Tb/9gubLdlZQ2qyd0bMSAHwy5bE0gbqu990IhFnanHCvQ12mJzp2yY/us
 WrTpmN7ffNe0FDfaVSu1WEwcCMtkKIdquGNDRNlMlM/g5uQ6GPtCjPTAg
 nCxyiN4SLT8xrotfAdGi1BotCGxnYkZJO2HLzgsKahY7Oz/laiXrtURBr
 uJdq+3Gp5T2vZV0SijIfHofZAPpw/DEJkn5DOUAV55kvS6ivI5BcWuJ6P Q==;
X-CSE-ConnectionGUID: g+QEb8ejSgOij2mrjkRU/A==
X-CSE-MsgGUID: XvakbYgVQZKUGTCVg8K0hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52437196"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52437196"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 04:58:14 -0700
X-CSE-ConnectionGUID: aR/xIU2FSQSQP5VgnJJDxQ==
X-CSE-MsgGUID: qxF7RLYERqqgLjsUJjDu/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150023750"
Received: from lslusarc-mobl.ger.corp.intel.com (HELO [10.245.81.4])
 ([10.245.81.4])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 04:58:12 -0700
Message-ID: <ab750d76-d4fd-4ad9-aa98-25096606b4e4@linux.intel.com>
Date: Wed, 18 Jun 2025 13:58:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Integrate kmemleaks and igt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear Gustavo,

I am reaching out to you after Lucas suggested me to contact you about
integrating kmemleaks with igt.

Currently igt_runner has the -k option allowing the user to choose
between running one kmemleak scan after all tests, or to run one scan
after each test.

The problem with these approaches is that running once after all tests
is not very useful, and running one scan after each test imposes a large
performance overhead, making it not practical for our CI.

Lucas suggested an interesting alternative: Run a scan before module
bind and another after module unbind. This way we will add a relatively
small overhead while strategically running scans when we are more likely
to catch something interesting.

The problem now becomes how integrate kmemleak scans around bind and
unbind operations. Lucas suggested new hooks IGT_HOOK_PRE_MODULE_BIND
/IGT_HOOK_POST_MODULE_UNBIND as a potential approach.

Two related questions for you Gustavo. Any thoughts or preferences about
collecting kmemleak scans around bind operations? What about these new
proposed hooks, do they seem like the way to go?

Thank you,

Peter
