Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4DA6E09F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2019 11:14:05 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
Date: Thu, 12 Dec 2019 13:14:00 +0200
Message-ID: <87lfrh3ifb.fsf@intel.com>
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
To: D Scott Phillips <d.scott.phillips@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 10 Dec 2019, D Scott Phillips <d.scott.phillips@intel.com> wrote:
> FreeBSD maintains a port of drm and a few drivers: amdgpu, i915,
> radeon, vboxvideo, vmwgfx:
>
> https://github.com/FreeBSDDesktop/kms-drm/
>
> Recently I backported some drm & i915 security patches into our
> tree and was lacking a way to verify the backports. Here is my
> attempt at adding FreeBSD support to igt.
>
> I've tried to order the series so that what I believe will be less
> controversial comes nearer the start. I've also tried to err on
> the side of too many small patches, so I'm happy to squash things
> where that seems more appropriate to people.
>
> The "null" implementations toward the end are probably more like
> RFC ideas. I'm willing to take other approaches there if anyone
> has a better idea for how to handle large sections of code that
> are more linux specific. Cheers,

I'll mostly defer to Petri and Arek, the IGT maintainers, on the
details.

I think the bigger questions are, 1) How do we ensure this does not
bitrot in a matter of weeks? Which translates to, 2) Who is going to
automate and maintain continuous build testing? And, 3) Who's going to
take ownership of the port in general?

Personally, I don't think this is going to work long term just by
merging the port upstream. I think without the continuous support from
people who care about FreeBSD, this is going to be a net negative.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
