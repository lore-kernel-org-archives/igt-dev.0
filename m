Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E78C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 14:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A2510E040;
	Wed, 12 Feb 2025 14:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NSsuy+0Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3455010E040
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 14:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739372369; x=1770908369;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AYVPILoa2eyWf6VUyZG8LdfK/2cuIOWKDav1TnbRHdQ=;
 b=NSsuy+0QjjPYaSvjRpI5lU/yjVNZcJ8sVEmEQILOOE0IOizjZvCAlIbD
 LGbXijZfICeapgTxm5xq7NoLH4XMlRVVLGuTnEz/EdCs8nV6x+fZ4f6Uy
 yFsMtpW53+OzD8X1uKXGGKwmbJQz3mHpLwU8FT8WDKauWgdexuamD023F
 z/S4+YWzq65aW5XjzfyXUnmwKOBJPvzYz1dP2/9jQkA/qZGfXgSKZS0Of
 CrHQcgG1Xgfc73AFKel6DWwRVotU/FUOwoDf3L06iLlbPnjkWDi+msVnQ
 sZuctj8h0gAw22Wi/LOMoM5R1X2l5qIpStLfm/bz+BbtIpdNSX4xmKa+x w==;
X-CSE-ConnectionGUID: UoL5qSXCQWS29Lc6h74/SQ==
X-CSE-MsgGUID: WItv9yfEQRGlqrLDSvJBtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39954158"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="39954158"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 06:59:28 -0800
X-CSE-ConnectionGUID: QVd/zNy1RcSm25sF5e3h+Q==
X-CSE-MsgGUID: jbdetYzSQZeBChY49AtrKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112696666"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 06:59:25 -0800
Date: Wed, 12 Feb 2025 15:59:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com,
 katarzyna.piecielska@intel.com, ryszard.knop@intel.com,
 ewelina.musial@intel.com, adrinael@adrinael.net,
 mateusz.grabski@intel.com, konrad.b.brodzik@intel.com
Subject: Re: [PATCH i-g-t] Bump aborting on network failure deadline to 40
 seconds
Message-ID: <20250212145922.mw7obok46u2appzy@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com,
 katarzyna.piecielska@intel.com, ryszard.knop@intel.com,
 ewelina.musial@intel.com, adrinael@adrinael.net,
 mateusz.grabski@intel.com, konrad.b.brodzik@intel.com
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
 <20250211092108.enj3kzrlh3rzh6rk@kamilkon-desk.igk.intel.com>
 <d137decd-4adf-474b-a56b-1398ef5472d1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d137decd-4adf-474b-a56b-1398ef5472d1@linux.intel.com>
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

Hi Peter,
On 2025-02-11 at 10:55:37 +0100, Peter Senna Tschudin wrote:
> Hi Kamil,
> 
> Thank you for your review. Please see below.
> 
> On 11.02.2025 10:21, Kamil Konieczny wrote:
> > Hi Peter,
> > On 2025-02-06 at 16:21:47 +0100, Peter Senna Tschudin wrote:
> >> Commit ddfde25f16ba ("runner: Add support for aborting on network
> >> failure") introduced a 20 second deadline for the DUT’s network
> >> to recover after a suspend/resume cycle. If the network isn’t
> >> back up within that time, igt_runner aborts the test run to save logs
> >> and prevent potential log loss from an imminent power cycle.
> >>
> >> This deadline was set to accommodate our internal CI system, which
> >> checks for DUT network connectivity every 5 seconds and retries up
> >> to 3 times at 20 second intervals. If it fails 3 consecutive checks,
> > 
> > This is a little confusing, you wrote in first paragraph about
> > 20 second deadline and here it looks like 60 seconds (3*20).
> 
> The first paragraph is explicitly about the deadline introduced by a
> previous commit. The second paragraph is explicitly about the internal
> CI mechanism that inspired the deadline. Can you explain what is
> confusing?
> 

Using same value "20 seconds" confused me, sorry. imho
it is better to write something like:

External monitoring machine checks DUTs health and if it
cannot reach it over network for 60 seconds it will reboot DUT.

So no need to exactly describe how it is done, only what is
happening and why runner needs to adapt to that.

> > 
> >> it triggers a power cycle on the DUT.
> >>
> >> Although our internal CI system can be configured with a longer
> > -------------- ^^^^^^^^
> > Remove this.
> 
> No, why?
> 

Looks like it happened when Ci tested upstream commit:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030

and it is one year old, do we have anything new?

> > 
> >> wait time, extending it further would unnecessarily prolong tests
> >> in cases of DUT hangs.
> >>
> >> Bumping the deadline to 40 seconds keeps the abort mechanism safely
> > 
> > imho this should be option for igt-runner, I would prefer to not
> > adjust it later, let CI team tune it. Option could be either time
> > or retry counter or both.
> 
> I disagree. We can add value now by potentially preventing premature

I would prefer actual case solved by this change, not 'potential' one.

> aborts with very little risk of creating any issue. The people in CC
> seems to agree with that.
> 
> This patch is as simple as it can get. I don't buy the benefit of the
> extra complexity of adding yet another command line option. It is way
> more effective to send one of these every 6 years or so.

Sorry, I didn't look into code, after reading part of it setting this
is done not by runner options but by igtrc file or enviroment, see
my reply to Ryszard. imho it is better to put these into configs/options
then hard-coding into runner, we could keep old 20s as default.

> 
> Am I correct that this is a nack from you?
> 

No, I am just not convinced it will solve anything, do you have
numbers? What are times needed for hibernate and resume? Because
it will be time-in-hibernate + time-for-resume + time-for-ping-deadline
and if this exceeds 60sec DUT will be rebooted.

Regards,
Kamil

> > 
> >> within our internal CI system retry window while improving chances
> >> of preventing a premature abort. For upstream testing on Jenkins,
> >> the deadlines vary from 16 and 25 minutes, and this change has
> >> no impact.
> >>
> >> CC: juha-pekka.heikkila@intel.com
> >> CC: katarzyna.piecielska@intel.com
> >> CC: ryszard.knop@intel.com
> >> CC: ewelina.musial@intel.com
> >> CC: adrinael@adrinael.net
> >> CC: mateusz.grabski@intel.com
> >> CC: konrad.b.brodzik@intel.com
> > 
> > imho better here 'Cc:'
> 
> Thank you!
