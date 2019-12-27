Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6524F6E178
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Dec 2019 09:38:26 +0000 (UTC)
Date: Fri, 27 Dec 2019 11:38:18 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20191227093818.ut6vkzzxlucfznn2@ahiler-mobl1.fi.intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
 <87lfrh3ifb.fsf@intel.com> <86v9qlo176.fsf@intel.com>
 <20191216135519.GG25209@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216135519.GG25209@platvala-desk.ger.corp.intel.com>
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 03:55:19PM +0200, Petri Latvala wrote:
> On Thu, Dec 12, 2019 at 10:20:29AM -0800, D Scott Phillips wrote:
> > Jani Nikula <jani.nikula@linux.intel.com> writes:
> > 
> > > I'll mostly defer to Petri and Arek, the IGT maintainers, on the
> > > details.
> > >
> > > I think the bigger questions are, 1) How do we ensure this does not
> > > bitrot in a matter of weeks? Which translates to, 2) Who is going to
> > > automate and maintain continuous build testing? And, 3) Who's going to
> > > take ownership of the port in general?
> > >
> > > Personally, I don't think this is going to work long term just by
> > > merging the port upstream. I think without the continuous support from
> > > people who care about FreeBSD, this is going to be a net negative.
> > 
> > Right, I think that's a fair point. What level of continuous support do
> > you think would get us out of the negative here? A continuous build
> > could be fairly easy to get configured, but might be a side workflow
> > apart from how normal CI results are presented. I think that could be a
> > reasonable indication that things aren't rotting. More sophisticated CI
> > is within the realm of possibility but could be quite a bit harder to
> > get off the ground with.
> 
> I'd say the bar to reach is
> 
> * build-testing for each commit
> * someone responsible for fixing issues in the above in a timely manner
> 
> Build-testing we can reach quite easily in gitlab, for some values of
> easily, but the second point is harder.

Do we have any FreeBSD runners[0] available on freedesktop's GitLab
already? Or do you have something else (virt) in mind?

[0]: https://docs.gitlab.com/runner/install/freebsd.html

> 
> > Ultimately, I think as long as the kernel driver port exists this is
> > something that we will want.
> 
> Yep. Ultimately, running the tests on HW on FreeBSD is a change that I
> would very much welcome.
> 
> > As to who owns the port, FreeBSD has a "Graphics Team" that collectively
> > owns the kernel driver port, so I think the most robust answer going
> > forward is to have them own this port. I can take this up with them and 
> > see if they'll affirm that they will take some ownership here.
> 
> Thanks for doing this!
> 
> As for the series as such:
> 
> There's some trivial cleanups in there that I suspect will help even
> Linux users on non-glibc systems that we can merge as is. I'm going to
> go through reviewing the series later this week for those parts.

Google is maintaining IGT for Android port and they decided it's easier
to do that out of tree. FreeBSD is closer to what most IGT devs are
using, so it shouldn't be too much pain for both FreeBSD and Linux
folks.

Anyway, since Android is also a non-glibc system I think it's worth
looking at what they have been cooking on their side:

https://android.googlesource.com/platform/external/igt-gpu-tools/+log

-- 
Cheers,
Arek

> The null-implementation patches are for sure getting a NAK in that
> form. They need a function-by-function analysis of whether the correct
> "do nothing" approach is actually doing nothing or straight up
> igt_skip("Not supported on this platform"); in some form.
> For example, tests that use igt_fork_signal_helper will test nothing
> if they don't manage to fork a periodical interrupter process.
> 
> 
> -- 
> Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
