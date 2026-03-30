Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D800A10D14AC
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 13:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8432510E795;
	Mon, 30 Mar 2026 13:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPPfSqII";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF74710E795
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774876669; x=1806412669;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0t4YDFsYRZjFy84TjD3TYSwrEO4adfSNraX9Lt+ehgo=;
 b=DPPfSqIIzEmhb41BkhKRkcUCKwAfSYQFg+U6MrUopDPTHiYqSu8uoAZE
 lYinppAMEbj45XfKLfUAXn3hFWhPsExB66C0HV2SENcd+40+pcX+W79do
 tzJ3Wyfez9qrB+y634oTl1SvSk6HkXvvoDeH5YfqnTS/W0MsAqMZGE+Z0
 gWk+lJkY9QiDZFTeP8aXHKcF0/zhygiHEfqIdw2sAovsKwpFNjyRn5MVm
 /5MKbFdS2B+j1jBea6f63g2uKVI0G04qPHPERvwHNhBBjcFRCV+N5aA2J
 yqAJGfiWGrWzJ1z1eRPR3owmIc7ZMWUd6Aot/OKlaUpTFJlMhqY3VKsSP A==;
X-CSE-ConnectionGUID: aWPQRQvaRleMSzJWh/l1vg==
X-CSE-MsgGUID: hrC/EsVNR4u3CItAsB6LQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="87338230"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="87338230"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 06:17:49 -0700
X-CSE-ConnectionGUID: M/6IofY/QOq2IDvyttraTg==
X-CSE-MsgGUID: yBQOSim1ScyYznRjcZY0yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="219412563"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 06:17:45 -0700
Date: Mon, 30 Mar 2026 15:17:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Karas, Krzysztof" <krzysztof.karas@intel.com>,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>,
 "Sousa, Gustavo" <gustavo.sousa@intel.com>
Subject: Re: [PATCH i-g-t v2 0/6] RFC: Add attachments support
Message-ID: <20260330131730.jpfzopbtti4cdje5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Karas, Krzysztof" <krzysztof.karas@intel.com>,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>,
 "Sousa, Gustavo" <gustavo.sousa@intel.com>
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
 <d259eb2e14d5c60f4e4da139616dbb5b87ac0254.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d259eb2e14d5c60f4e4da139616dbb5b87ac0254.camel@intel.com>
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

Hi Knop,,
On 2026-03-30 at 09:01:39 +0000, Knop, Ryszard wrote:
> Hey Zbigniew,
> 
> In general, I'm not convinced putting all attachments into the
> results.json file is a good idea. This introduces a significant amount
> of overhead for CI reporting processes that don't care about those
> attachments (vis, CBL, JP Heikkila's SISO), makes those files extremely
> large and difficult for manual inspection.
> 
> Can you consider specifying attachments as filenames that should be
> present in a directory relative to the results.json instead?
> 
> Thanks, Ryszard

Could it be an option --attachments[=log|json] with default log?

So by default files would only be saved in results/N/attachment
(where N is a number of test in testlist) and also reported in test
output (hence the 'log', there could be also 'none' for no report).

Regards,
Kamil

> 
> On Tue, 2026-03-24 at 14:12 +0100, Zbigniew Kempczyński wrote:
> > This series introduces support for hook/test written attachments.
> > It is somehow limited and stiff but allows to write anything test/hook
> > wants to attachments directory and if naming contract will be fulfiled
> > content in base64 form will be included in appropriate subtest/dynsubtest
> > results.json part.
> > 
> > Series targets our need to include guc logs for failed tests especially
> > in the point of time when it occurs.
> > 
> > v2: - added clearing of attachments dir in overwrite mode
> >     - guc-log hook script is now installed to igt datadir/hooks dir
> >     - added hook-exec-allowlist to selectively execute hook scripts
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > 
> > Zbigniew Kempczyński (6):
> >   runner: Rename dirfd to avoid clash with dirfd()
> >   runner: Create attachments directory to use by hooks
> >   runner: Add attachments directory content in subtests results
> >   scripts/hooks: Example guc log copy script to attachments dir
> >   runner: Rename parsing function
> >   runner: Add hook-exec-allowlist to execute hooks selectively
> > 
> >  lib/igt_hook.c                    |  4 ++
> >  runner/executor.c                 | 88 ++++++++++++++++++++++++----
> >  runner/executor.h                 |  2 +
> >  runner/resultgen.c                | 97 +++++++++++++++++++++++++++++++
> >  runner/settings.c                 | 31 +++++++---
> >  runner/settings.h                 |  2 +
> >  scripts/hooks/guc_copy_on_fail.sh | 24 ++++++++
> >  scripts/meson.build               |  2 +
> >  8 files changed, 230 insertions(+), 20 deletions(-)
> >  create mode 100755 scripts/hooks/guc_copy_on_fail.sh
