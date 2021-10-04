Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22986E9C4
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 11:10:20 +0000 (UTC)
Date: Mon, 4 Oct 2021 14:13:43 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YVrh5zBX9mLq4Zg2@platvala-desk.ger.corp.intel.com>
References: <20211001085319.789392-1-stylon.wang@amd.com>
 <20211002151511.vjblbkuoymw4jtyi@outlook.office365.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211002151511.vjblbkuoymw4jtyi@outlook.office365.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_hdr: Fix failure to read
 output_bpc on AMD hardware
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Stylon Wang <stylon.wang@amd.com>, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>, igt-dev@lists.freedesktop.org, nicholas.choi@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Oct 02, 2021 at 11:15:11AM -0400, Rodrigo Siqueira wrote:
> Hi Lakshminarayana and Petri,
> 
> I noticed that the CI was not triggered for this patch [1]. Do you know
> why? Is it possible to trigger it?
> 
> 1. https://patchwork.freedesktop.org/series/95313/

CI was down for a bit due to server cert issues, testing that and the
other affected series happening in a bit.


-- 
Petri Latvala


> 
> Thanks
> Siqueira
> 
> On 10/01, Stylon Wang wrote:
> > The first commit with TEST_ONLY flag in bpc-switch subtests
> > could in some cases cause reading of output_bpc on connectors
> > to fail on AMD hardware.
> > 
> > Use ALLOW_MODESET to prevent this from happening.
> > 
> > Signed-off-by: Stylon Wang <stylon.wang@amd.com>
> > ---
> >  tests/kms_hdr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> > index 5b8529c8..a4983b9a 100644
> > --- a/tests/kms_hdr.c
> > +++ b/tests/kms_hdr.c
> > @@ -217,7 +217,7 @@ static void test_bpc_switch_on_output(data_t *data, igt_output_t *output,
> >  		igt_plane_set_fb(data->primary, &afb);
> >  		igt_plane_set_size(data->primary, data->w, data->h);
> >  		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> > -		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
> > +		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> >  		if (!ret) {
> >  			data->w = afb.width;
> >  			data->h = afb.height;
> > -- 
> > 2.32.0
> > 
> 
> -- 
> Rodrigo Siqueira
> https://siqueira.tech
