Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A88C88E5C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 08:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B5E89083;
	Mon, 26 Jan 2026 08:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLFsbdY/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5341D89083
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jan 2026 08:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769415736; x=1800951736;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UpZhRf8tQFrFkmazmqemv0pIiFQQKs1F1IzpjnvsuvU=;
 b=lLFsbdY/PWor7EpEfQVlUd4jYRF1t9Qg7DpRXzIIhPyh1h1TCjHgSRw6
 YVVBy0aMFrteYLSQ7BQBc0zTB2pxw2zaqY/5IHlFaXn4BGHfDdylSYgon
 WLy2uoYZNi5t1jmcmGu+IzmlGzB9dNLaHcQ3vgSVBuZjc9h/GEZ+xPzND
 WpeaDq8opgY58hrqK0ym8DkL0DdBilChmj/skUFRfuj+17zvt0D5YtSPD
 p8kuSkr9sm11+biMcKFX5YToi2EQL1VXOTdD6i5WYbz08VYB8PHRf3ZvX
 L4OP1fMYag37Xagokp2yEmoZd9amwep9gBAIHsIM+7SJfJDavHEe/2ogw w==;
X-CSE-ConnectionGUID: 8Dh/VBqTQICkEW2AhP3eaA==
X-CSE-MsgGUID: Q4weyVA9QQin6usfT+oLwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="74220919"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="74220919"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 00:22:16 -0800
X-CSE-ConnectionGUID: gUGE6gUyT72+yemH8EH0EQ==
X-CSE-MsgGUID: O4eKQtzwTk+nBARjdI7EZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="207652061"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.86])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 00:22:15 -0800
Date: Mon, 26 Jan 2026 09:22:12 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com
Subject: Re: [PATCH i-g-t 0/1] RFC tests/intel/xe_exec_reset: Filter expected
 timeout dmesg during reset tests
Message-ID: <yygmzo4qw2r6doq57emgz6ezid5brojuhwyi5oo23koiff6c2e@gm6x3442pozp>
References: <20260123065238.48129-1-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123065238.48129-1-sobin.thomas@intel.com>
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

On Fri, Jan 23, 2026 at 06:52:37AM +0000, Sobin Thomas wrote:
> During reset testing there are timedout messages with lrc seq no
> and seqno coming in CI Dmesg. These logs are causing CI warnings.
> 
> Since we are intentionally causing the GPU reset, so timeout messages
> are expected behavior rather than actual test failures. These messages
> filtered by CI and incorrectly flagged as errors.
> 
> This change adds ignore_timeout_dmesg() function that registers a regex
> pattern to filter out expected timeout-related dmesg messages:
> - "Timedout"
> - "timeout"

May you point out CI warnings you're mentioning? I've checked:

https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt0-threads.html

and xe_exec_reset tests and I don't see warnings related to timeouts:

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14404/shards-all.html?testfilter=xe_exec_reset

--
Zbigniew

> 
> The function is strategically called before operations that trigger
> resets to proactively filter expected messages:
> - GT reset operations (xe_force_gt_reset_async/sync)
> - Legacy test modes involving resets
> - Compute mode tests with GT reset flags
> - Thread-based reset testing scenarios
> 
> This ensures cleaner test output by suppressing expected noise while
> preserving genuine error reporting for actual test failures.
> 
> Sobin Thomas (1):
>   RFC tests/intel/xe_exec_reset: Filter expected timeout dmesg during
>     reset tests
> 
>  tests/intel/xe_exec_reset.c | 49 +++++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 8 deletions(-)
> 
> -- 
> 2.51.0
> 
