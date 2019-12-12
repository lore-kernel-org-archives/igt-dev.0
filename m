Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC046E0C5
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2019 18:20:31 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
In-Reply-To: <87lfrh3ifb.fsf@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
 <87lfrh3ifb.fsf@intel.com>
Date: Thu, 12 Dec 2019 10:20:29 -0800
Message-ID: <86v9qlo176.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 00/30] Add FreeBSD Support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Jani Nikula <jani.nikula@linux.intel.com> writes:

> I'll mostly defer to Petri and Arek, the IGT maintainers, on the
> details.
>
> I think the bigger questions are, 1) How do we ensure this does not
> bitrot in a matter of weeks? Which translates to, 2) Who is going to
> automate and maintain continuous build testing? And, 3) Who's going to
> take ownership of the port in general?
>
> Personally, I don't think this is going to work long term just by
> merging the port upstream. I think without the continuous support from
> people who care about FreeBSD, this is going to be a net negative.

Right, I think that's a fair point. What level of continuous support do
you think would get us out of the negative here? A continuous build
could be fairly easy to get configured, but might be a side workflow
apart from how normal CI results are presented. I think that could be a
reasonable indication that things aren't rotting. More sophisticated CI
is within the realm of possibility but could be quite a bit harder to
get off the ground with.

Ultimately, I think as long as the kernel driver port exists this is
something that we will want.

As to who owns the port, FreeBSD has a "Graphics Team" that collectively
owns the kernel driver port, so I think the most robust answer going
forward is to have them own this port. I can take this up with them and 
see if they'll affirm that they will take some ownership here.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
