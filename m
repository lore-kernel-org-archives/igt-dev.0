Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B55C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 13:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5AF10E276;
	Wed, 12 Feb 2025 13:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kypJMLEk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B87810E276
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739368357; x=1770904357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fyvmsdAP7xPFUMJmVTANAT8j0hrrru9JrAow/BTs9WI=;
 b=kypJMLEkCIM1CeBvZFiZtCh4L+M2MQk5FopokZqPd+zAn0y5U3NKdDaS
 6etz8X4N5U83Eld68WoKUdnV8DgRbdGxLQyeWLxeItUZbNIMLFCCZMTAf
 /3ffB4H+jhk6oh3x32qzdeMrGEq2BUZo5/NIE9Pgwj7byzhvQqJn3HcnG
 +EY2pXRGZEA0BE1hLDi70fZRhZxczTUI9by+/J9UX9OPS9j9bL03F7EzM
 fDvmT+6/9Ej0bcqAFrPaVLk1yjC+t9FJtzaStJvemXKWKFh2lu4DKoyPj
 WbZyowjIUzhjmsTrY4swlYp7BC67FpQdTUTE537bGarPHBJCoUhJp6Lhb Q==;
X-CSE-ConnectionGUID: 9nGaPNv6TQOcs6qZA8QlAA==
X-CSE-MsgGUID: y94ibfeeQcKkwVKt7RgxEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43678509"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="43678509"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 05:52:36 -0800
X-CSE-ConnectionGUID: LG36jx3uR3qH87Oqs0nxoA==
X-CSE-MsgGUID: cx4wVGZ5SpCCXnkyNIwx5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="143747007"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 05:52:33 -0800
Date: Wed, 12 Feb 2025 14:52:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "Musial, Ewelina" <ewelina.musial@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>,
 "Grabski, Mateusz" <mateusz.grabski@intel.com>,
 "adrinael@adrinael.net" <adrinael@adrinael.net>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Brodzik, Konrad B" <konrad.b.brodzik@intel.com>,
 "peter.senna@linux.intel.com" <peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t] Bump aborting on network failure deadline to 40
 seconds
Message-ID: <20250212135231.6lxk2j5ezg72glra@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>,
 "Musial, Ewelina" <ewelina.musial@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>,
 "Grabski, Mateusz" <mateusz.grabski@intel.com>,
 "adrinael@adrinael.net" <adrinael@adrinael.net>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Brodzik, Konrad B" <konrad.b.brodzik@intel.com>,
 "peter.senna@linux.intel.com" <peter.senna@linux.intel.com>
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
 <20250211092108.enj3kzrlh3rzh6rk@kamilkon-desk.igk.intel.com>
 <d137decd-4adf-474b-a56b-1398ef5472d1@linux.intel.com>
 <IA1PR11MB6097AD4DB631A02EF73EAE1886FD2@IA1PR11MB6097.namprd11.prod.outlook.com>
 <c246f66564337e7778abc23b23fa1ad7400138c1.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c246f66564337e7778abc23b23fa1ad7400138c1.camel@intel.com>
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
On 2025-02-12 at 10:06:47 +0000, Knop, Ryszard wrote:
> On Tue, 2025-02-11 at 11:59 +0000, Piecielska, Katarzyna wrote:
> > Hello Peter
> > 
> > 
> > 
> > Hi Kamil,
> > 
> > Thank you for your review. Please see below.
> > 
> > On 11.02.2025 10:21, Kamil Konieczny wrote:
> > > Hi Peter,
> > > On 2025-02-06 at 16:21:47 +0100, Peter Senna Tschudin wrote:
> > > > Commit ddfde25f16ba ("runner: Add support for aborting on network
> > > > failure") introduced a 20 second deadline for the DUT’s network to 
> > > > recover after a suspend/resume cycle. If the network isn’t back up 
> > > > within that time, igt_runner aborts the test run to save logs and 
> > > > prevent potential log loss from an imminent power cycle.
> > > > 
[...]

> > > > wait time, extending it further would unnecessarily prolong tests in 
> > > > cases of DUT hangs.
> > > > 
> > > > Bumping the deadline to 40 seconds keeps the abort mechanism safely

[...]

> > > 
> > > imho this should be option for igt-runner, I would prefer to not 
> > > adjust it later, let CI team tune it. Option could be either time or 
> > > retry counter or both.
> > 
> > I disagree. We can add value now by potentially preventing premature aborts with very little risk of creating any issue. The people in CC seems to agree with that.

I want to avoid bumping it to lower or bigger value later
in future, see my proposition below.

> > 
> > This patch is as simple as it can get. I don't buy the benefit of the extra complexity of adding yet another command line option. It is way more effective to send one of these every 6 years or so.
> > 
> > Am I correct that this is a nack from you?
> > 
> > This looks like we need a good discussion with CI team. @Knop, Ryszard @Grabski, Mateusz can you comment on this approach?
> 
> - If the current value is good and the ping timeout causes machines to
> take 20 seconds longer on each broken run, it's just 20 seconds.
> Compared to everything else we do suboptimally, it costs maybe a few
> minutes on a bad day, so it's not a problem if it's overshot.
> - If the current value is too low, runs take longer, but on the other
> hand we get less broken runs and less noise - I would prefer this
> instead of spurious aborts.
> 
> IMO it's fine to bump this to 40s.
> 
> Thanks, Ryszard
> 

Can I take it as acked-by by you? Thanks!

I also have one more question, do we need this now or could
we work longer and improve it? imho it is better to add one
more way for CI to increase this value by CI team instead of
here in code.

I mean we could add to runner one more env var IGT_PING_DEADLINE
and to igtrc DUT section PingHostDeadline, what you think?

Regards,
Kamil

> > Thanks,
> > Kasia
> > 
> > > 
> > > > within our internal CI system retry window while improving chances of 
> > > > preventing a premature abort. For upstream testing on Jenkins, the 
> > > > deadlines vary from 16 and 25 minutes, and this change has no impact.
> > > > 
> > > > CC: juha-pekka.heikkila@intel.com
> > > > CC: katarzyna.piecielska@intel.com
> > > > CC: ryszard.knop@intel.com
> > > > CC: ewelina.musial@intel.com
> > > > CC: adrinael@adrinael.net
> > > > CC: mateusz.grabski@intel.com
> > > > CC: konrad.b.brodzik@intel.com
> > > 
> > > imho better here 'Cc:'
> > 
> > Thank you!
> 
