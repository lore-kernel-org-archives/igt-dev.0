Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3835A10EC7F
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Sep 2022 11:48:01 +0000 (UTC)
Date: Fri, 16 Sep 2022 14:47:57 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YyRibcESzwZyno5h@intel.com>
References: <20220913150855.43540-1-hamza.mahfooz@amd.com>
 <YyRT5uE+qldgkFu4@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyRT5uE+qldgkFu4@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_setmode: degrade assert to
 debug
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 16, 2022 at 01:59:38PM +0300, Petri Latvala wrote:
> On Tue, Sep 13, 2022 at 11:08:55AM -0400, Hamza Mahfooz wrote:
> > Unfortunately, there are too many sources of jitter that can cause the
> > vblank interval approximation obtained from DRM_IOCTL_WAIT_VBLANK to be
> > off by more than a scanline for this assert to be useful. So, to allow
> > this test to pass consistently degrade the assert to a debug.
> > 
> > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> > ---
> > v2: fix logic
> > ---
> >  tests/kms_setmode.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> > index bfa10891..58abfe14 100644
> > --- a/tests/kms_setmode.c
> > +++ b/tests/kms_setmode.c
> > @@ -527,12 +527,12 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
> >  	 * See:
> >  	 * https://en.wikipedia.org/wiki/Standard_deviation#Rules_for_normally_distributed_data
> >  	 */
> > -	igt_assert_f(fabs(mean - expected) < max(line_time(kmode), 1.718 * stddev),
> > -		     "vblank interval differs from modeline! expected %.1fus, measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
> > -		     expected, mean, stddev,
> > -		     fabs(mean - expected),
> > -		     fabs(mean - expected) / stddev,
> > -		     fabs(mean - expected) / line_time(kmode));
> > +	if (fabs(mean - expected) > max(line_time(kmode), 1.718 * stddev))
> > +		igt_info("vblank interval differs from modeline! expected %.1fus, measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
> > +			 expected, mean, stddev,
> > +			 fabs(mean - expected),
> > +			 fabs(mean - expected) / stddev,
> > +			 fabs(mean - expected) / line_time(kmode));
> >  }
> 
> 
> History has taught that having such messages in the logs are generally
> useless. Without a mechanism to tell that the output has changed, it's
> going to get missed and when you realize something is completely off,
> figuring out when it changed is a ghost hunt.
> 
> In short, the action "to allow this test to pass" is effectively
> deleting the test.
> 
> Having said that, deleting the test might be the right move. I said
> people will miss changes if it's just a message, but it has been an
> assertion failure for i915 CI for some time... But a consistent
> one. The difference on SNB looks to be 2.5 scanlines, sometimes 2.1,
> but most often 2.5.
> 
> Maybe Ville is able to comment? What's up with DRM_IOCTL_WAIT_VBLANK
> timings, is this assert obsolete with today's kernel? Or does the test
> need some kind of tuning?

It depends on how good of a match to the requested clock the PLL can give
us. Generally for Intel hardware modern platforms tends to have finer
granularity whereas older stuff can be a bit coarse. Though there are
ways (namely clock bending) by which we could increase the accuracy even
old some older platforms, but no one has bothered to implement that so far.

And no, I don't think deleting the test is the right answer. We
certainly want to catch regressions with it on the platforms where
we have accurate clocks. Ideally I guess we'd somehow try to catch
regressions on the less accurate platforms too, but not sure there's
any good way to do that beyond maintaining some database on what the
expected accuracy is for each CI machine. Relaxing the requirements
across the board would risk not catching smaller regressions on the
accurate platforms.

In its current form the test should fail or succeed consistently.
If not then there's likely some kind of problem with the way the
driver or hardware operates.

-- 
Ville Syrjälä
Intel
