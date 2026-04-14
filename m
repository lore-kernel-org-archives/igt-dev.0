Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56769F9D0EC
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 19:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E003A10E057;
	Tue, 14 Apr 2026 19:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRSGmrGB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28CE10E057
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 19:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776195287; x=1807731287;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eW+kvelWeuBqDbrmn6GEbOqBl2xmkBe2yjLu0WJ6WsM=;
 b=YRSGmrGBwMpK06feI07w1ZzD2C51/7sVysR14SvVItBo3/u0YeMWBZdk
 v7wao0f+Qu3JPBQVtMbRkLgwOph7k1omhQxx5GHeKER5kYXeLkxdznhfg
 66XY+VGhMBQQ1ADhEVRBNd3QlcYUnJxbb7zF3UORS1Da53vB1qOd9Xx5J
 i36t2hNqxoBCIU9EaQUw7Darlz+UF2rmRzSScAcdnQ5ELbnAT4W3oQL5J
 ee9hBOlPP9WDQ+gpqb8mSg/lX7v7+12xgYl9CHi256vxbXAZ3NO+pj5s/
 YG0gYfUScVfosmzQR8U0KpMBsEOc2/hI3Nc+LvpVSEqsX2z7SrRbZaOWu w==;
X-CSE-ConnectionGUID: 6++9+yHeQSGu3x5WwHnk1Q==
X-CSE-MsgGUID: V0UrPIhMTjGZpMqUpKU6sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102623902"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="102623902"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 12:34:47 -0700
X-CSE-ConnectionGUID: tNui7P7cSPeTbjrYjaGBgQ==
X-CSE-MsgGUID: 6BEVspZcQg64t+q1qhH+Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="227007983"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.163])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 12:34:46 -0700
Date: Tue, 14 Apr 2026 21:34:44 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v3 3/5] scripts/hooks: Example guc log copy script
 and allowlist
Message-ID: <mosb4o4wfnpgmq5ksg5l5xxoevv5pwvpasbcqq3dfnh65ujnzn@eeigbnqxs3kg>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-10-zbigniew.kempczynski@intel.com>
 <jn26ku5x5vntbwlnipmy7o26eato73wi56odeghml6auke7idt@2li7wvim6jiw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jn26ku5x5vntbwlnipmy7o26eato73wi56odeghml6auke7idt@2li7wvim6jiw>
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

On Tue, Apr 14, 2026 at 08:06:52AM +0000, Krzysztof Karas wrote:
> Hi Zbigniew,
> 
> On 2026-04-13 at 22:17:26 +0200, Zbigniew Kempczyński wrote:
> > We need to explicitly extract guc logs for failed tests so add hook
> > script which does it after subtest/dynsubtest execution. As copying to
> > attachments takes a lot of time do it only for failing subtests.
> > 
> > Adding this hook script to CI will extend execution time much and
> > using allowlist is necessary. Instead of allowlist argument in the
> > runner (previous attempt) now script filters such list on its own and
> No need to mention development process (previous attempt,
> previous version). Otherwise, it seems like you are referring
> to the way this mechanism worked before your patch was
> introduced, which is not true, as it did not exist yet.

To be honest I wondered should I add an info about previous attempt
regarding allowlist implementation as a runner argument. I know
implementation wasn't yet merged, but decision why scripts have to
filter allowed tests on their own might be important for the reader.
Short info we considered to contain allowlist in the runner might
answer questions why we migrated this responsibility to script itself,
even if it is at the end of food chain.

> 
> I'd split this section and leave the following in the commit
> message:
> 
>  Adding this hook script to CI will extend execution time much and
>  using allowlist is necessary. The script filters such list on its
>  own and decides when to move forward and do some post-test actions.
> 
> and move the reset to --- section:
> 
>  Using this approach, instead of previous versions, is more flexible,
>  but moves decision to script what causes it to be more prone to bugs.
> 
> > decides when to move forward and do some post-test actions. Such
> > approach is more flexible but moves decision to script what causes
> > it is more prone buggy.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > ---
> > v2: install hook to datadir/hooks
> > v3: migrate allowlist from runner to script
> > ---
> >  scripts/hooks/guc_copy.allowlist  |  2 ++
> >  scripts/hooks/guc_copy_on_fail.sh | 47 +++++++++++++++++++++++++++++++
> >  scripts/meson.build               |  3 ++
> >  3 files changed, 52 insertions(+)
> >  create mode 100644 scripts/hooks/guc_copy.allowlist
> >  create mode 100755 scripts/hooks/guc_copy_on_fail.sh
> > 
> > diff --git a/scripts/hooks/guc_copy.allowlist b/scripts/hooks/guc_copy.allowlist
> > new file mode 100644
> > index 0000000000..04cb3f8298
> > --- /dev/null
> > +++ b/scripts/hooks/guc_copy.allowlist
> > @@ -0,0 +1,2 @@
> > +igt@xe_compute@compute-square
> > +igt@xe_exec_basic@once-basic@ccs0
> Are these the most prone to fail in our CI? It would be good to
> mention in the commit message why you chose these particular
> subtests. 

Good question. I've picked random tests to create an allowlist and
parse it in a script. In real world scenario we should modify this file
according to bugs we notice in which we want to dump guc logs.

There're two goals I would like to achieve - dump guc logs for tests
which guc log is important, and second - how to not slow down CI much.
Everything I propose adds some overhead to CI (execution scripts
modification, etc), but as guc log is important from debug perspective
and we have to collect it even at cost of introducing some complexity
in the CI workflow.

--
Zbigniew

> 
> [...]
> 
> -- 
> Best Regards,
> Krzysztof
