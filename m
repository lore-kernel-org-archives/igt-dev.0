Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4239D89C97
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 11:04:41 +0000 (UTC)
Date: Tue, 31 Mar 2020 14:04:38 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200331110438.GI9497@platvala-desk.ger.corp.intel.com>
References: <20200330110229.4755-1-mika.kahola@intel.com>
 <20200331064440.GF9497@platvala-desk.ger.corp.intel.com>
 <fcb11df357404b83af8dade221c7047f@intel.com>
 <8948cf46ed2a48c88e87c50b713e0c45@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8948cf46ed2a48c88e87c50b713e0c45@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/kms_concurrent: Move bandwidth
 calculation to igt_fixture
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
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 01:12:31PM +0300, Kahola, Mika wrote:
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kahola,
> > Mika
> > Sent: Tuesday, March 31, 2020 11:22 AM
> > To: Latvala, Petri <petri.latvala@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/kms_concurrent: Move bandwidth
> > calculation to igt_fixture
> > 
> > 
> > 
> > -----Original Message-----
> > From: Latvala, Petri <petri.latvala@intel.com>
> > Sent: Tuesday, March 31, 2020 9:45 AM
> > To: Kahola, Mika <mika.kahola@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; juhapekka.heikkila@gmail.com; Lisovskiy,
> > Stanislav <stanislav.lisovskiy@intel.com>
> > Subject: Re: [PATCH i-g-t v3] tests/kms_concurrent: Move bandwidth calculation
> > to igt_fixture
> > 
> > On Mon, Mar 30, 2020 at 02:02:29PM +0300, Mika Kahola wrote:
> > > The commit 153b34b5353df8c18a87d ("tests/kms_concurrent:
> > > Test maximum number of planes supported by the platform") caused
> > > regression on HSW pipe B testing such as.
> > >
> > > IGT-Version: 1.25-gfd8248084 (x86_64) (Linux:
> > > 5.6.0-rc7-CI-CI_DRM_8194+ x86_64) Starting subtest: pipe-B Testing
> > > resolution with connector VGA-1 using pipe B with seed 1585245074
> > > child 0 died with signal 11, Segmentation fault Subtest pipe-B: FAIL
> > > (0.330s)
> > >
> > > To fix this, we need move bandwidth calculation routines into part of
> > > igt_fixture instead of calculating it just before actual testing. The
> > > patch takes the minimum of those maximum number of planes for given
> > output.
> > >
> > > v2: Limit bandwidth check only gen11+ (CI)
> > > v3: Loop child process 5x longer when running test with 1 iteration
> > > (CI)
> > >
> > > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > > ---
> > >  tests/kms_concurrent.c | 30 ++++++++++++++++--------------
> > >  1 file changed, 16 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c index
> > > 1403e990..31c5620a 100644
> > > --- a/tests/kms_concurrent.c
> > > +++ b/tests/kms_concurrent.c
> > > @@ -36,6 +36,7 @@ typedef struct {
> > >  	igt_display_t display;
> > >  	igt_plane_t **plane;
> > >  	struct igt_fb *fb;
> > > +	int max_planes;
> > >  } data_t;
> > >
> > >  /* Command line parameters. */
> > > @@ -223,13 +224,13 @@ test_plane_position_with_output(data_t *data,
> > enum pipe pipe, int max_planes,
> > >  				igt_output_t *output)
> > >  {
> > >  	int i;
> > > -	int iterations = opt.iterations < 1 ? 1 : opt.iterations;
> > > +	int iterations = opt.iterations < 5 ? 1 : opt.iterations;
> > 
> > This changes nothing though for CI. You still use 1. In fact this just limits the
> > iterations to 1 for everyone who specifies more than 1, until they use 5 or more.
> > 
> > And still, this patch needs an actual explanation why the crash happened and
> > why doing the same calculation in a fixture help. Otherwise there's no guarantee
> > it won't happen again. Until proven otherwise, avoiding the crash is accidental.
> > 
> > I investigated this a bit further and I noticed that for yet unidentified reason the
> > bandwidth calculation returned different number of planes for pipe B. This was
> > too much to handle on actual test and therefore child exited too early.
> > 
> > There seems to be a simpler way of computing how many planes we can support
> > with the given bandwidth. I propose that we disregard this patch and I will
> > propose and test another kind of solution.
> 
> What would be to best approach here? Should I first revert the original patch i.e.
> 
> commit 2b65609b1de3 ("tests/kms_concurrent: Test maximum number of planes supported by the platform")
> 
> and then provide a new patch that has similar functionality but the approach is different or should I just a provide a fix that removes bandwidth calculations and replaces that with a different approach?


Yeah if you want to revert and try a different approach, fine by me.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
