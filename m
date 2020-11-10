Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F378982C
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2020 05:36:39 +0000 (UTC)
Date: Tue, 10 Nov 2020 06:36:33 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201110053633.GA5056@zkempczy-mobl2>
References: <20201110045510.14716-1-nidhi1.gupta@intel.com>
 <87wnytg5bi.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wnytg5bi.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Fix IGT Warnings due to dynamic subtest
 inclusion
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, nidhi1.gupta@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 09, 2020 at 09:16:01PM -0800, Dixit, Ashutosh wrote:
> On Mon, 09 Nov 2020 20:55:10 -0800, <nidhi1.gupta@intel.com> wrote:
> >
> > From: Nidhi Gupta <nidhi1.gupta@intel.com>
> >
> > Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> > ---
> >  tests/kms_atomic_interruptible.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
> > index 27bb6a2b..f98023ca 100644
> > --- a/tests/kms_atomic_interruptible.c
> > +++ b/tests/kms_atomic_interruptible.c
> > @@ -288,7 +288,9 @@ igt_main
> >		for_each_pipe_with_valid_output(&display, pipe, output) {
> >			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> >				run_plane_test(&display, pipe, output, test_legacy_modeset, DRM_PLANE_TYPE_PRIMARY);
> > +			{
> >				break;
> > +			}
> >		}
> 
> Are we trying to break after the first call to run_plane_test() here? In
> that case why are we using a for loop (for_each_pipe_with_valid_output)? I
> am not sure if igt_subtest_with_dynamic/igt_dynamic_f combinations can take
> a break statement, this code pattern is certainly not used elsewhere.
> 
> So the patch does fix the warnings (which is a relief) but otherwise I
> don't know if it makes sense. If not, I'd say revert the previous patch and
> do it a different way.

IMO patch doesn't makes sense. @Nidhi - please decide which "for" loop you 
want to break and resend.

--
Zbigneiw
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
