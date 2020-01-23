Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315E66FCC9
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2020 13:59:12 +0000 (UTC)
Date: Thu, 23 Jan 2020 12:30:06 +0530
From: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20200123070005.GA19868@intel.com>
References: <1579586055-27583-1-git-send-email-kunal1.joshi@intel.com>
 <1579586055-27583-4-git-send-email-kunal1.joshi@intel.com>
 <20200121135115.GF25209@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121135115.GF25209@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/3] tests/kms_color_chamelium: add
 subtests to validate color
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

On 2020-01-21 at 15:51:15 +0200, Petri Latvala wrote:
> On Tue, Jan 21, 2020 at 11:24:15AM +0530, Kunal Joshi wrote:
> > To validate color subtests using chamelium, subtests modified
> > to do frame dump comparison instead of crc comparison.
> > Tests require chamelium and will validate color features
> > at pipe level.
> > 
> > (v2)
> >         Comparing framedump with framebuffer reference instead of
> >         comparing two framedump.
> > (v3)
> > 	Moved common functions with kms_color to lib/igt_color
> > 
> > Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> > Suggested-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  tests/Makefile.am           |   1 +
> >  tests/kms_color_chamelium.c | 759 ++++++++++++++++++++++++++++++++++++++++++++
> 
> 
> Meson changes are missing.
> 
> Looks pretty much what you'd expect from a kms_color ported to use
> chamelium. When you send the next revision, can you also include a
> patch with commit message "HAX: Run in BAT", modifying
> tests/intel-ci/fast-feedback.testlist to add all these new tests
> there. That way we get testing done on chameliums, which we currently
> only have on the BAT machines, not on shards.
> 
> 
> -- 
> Petri Latvala
Thanks petri for the feedback and support.
I will float the next patch with recommended
changes.


Regards
Kunal

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
