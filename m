Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0206F4A6
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Oct 2021 14:40:47 +0000 (UTC)
Date: Thu, 7 Oct 2021 10:40:38 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20211007144038.ojiw5nzbydkfvgk2@outlook.office365.com>
References: <20211001085319.789392-1-stylon.wang@amd.com>
 <20211002151511.vjblbkuoymw4jtyi@outlook.office365.com>
 <YVrh5zBX9mLq4Zg2@platvala-desk.ger.corp.intel.com>
 <20211004141835.uzqrsamqgdstee2q@outlook.office365.com>
 <7c206aba165a465aa14b465c72b6802c@intel.com>
 <DM8PR11MB5655AF5FCCDDD8EAB30C92B0E0AE9@DM8PR11MB5655.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB5655AF5FCCDDD8EAB30C92B0E0AE9@DM8PR11MB5655.namprd11.prod.outlook.com>
MIME-Version: 1.0
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
To: "Saarinen, Jani" <jani.saarinen@intel.com>
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Latvala, Petri" <petri.latvala@intel.com>, Simon Ser <contact@emersion.fr>, Stylon Wang <stylon.wang@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "nicholas.choi@amd.com" <nicholas.choi@amd.com>, Mark Yacoub <markyacoub@google.com>, "Wentland, Harry" <Harry.Wentland@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

I noticed that the patch looks good from the CI perspective [1] and I
don't see any problem on that, so:

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

1. https://patchwork.freedesktop.org/series/95313/

On 10/04, Saarinen, Jani wrote:
> +Simon. 
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vudum,
> > Lakshminarayana
> > Sent: maanantai 4. lokakuuta 2021 18.42
> > To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>; Latvala, Petri
> > <petri.latvala@intel.com>
> > Cc: Stylon Wang <stylon.wang@amd.com>; igt-dev@lists.freedesktop.org;
> > nicholas.choi@amd.com
> > Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_hdr: Fix failure to read output_bpc on
> > AMD hardware
> > 
> > Filed https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Fintel%2F-%2Fissues%2F4262&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7C8c3f22f5fa6c48f0166808d9875c3133%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637689652302229936%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=sK0l9HWKszTbO75F%2FTaS7Swv%2FegjwVP0M8q%2FRlFg0Ys%3D&amp;reserved=0 and re-reported.
> > igt@kms_lease@invalid-create-leases - fail - Failed assertion: create_lease(data-
> > >master.fd, &mcl) == -22
> > 
> > Lakshmi.
> > 
> > -----Original Message-----
> > From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Sent: Monday, October 4, 2021 7:19 AM
> > To: Latvala, Petri <petri.latvala@intel.com>; Vudum, Lakshminarayana
> > <lakshminarayana.vudum@intel.com>
> > Cc: Stylon Wang <stylon.wang@amd.com>; igt-dev@lists.freedesktop.org;
> > nicholas.choi@amd.com
> > Subject: Re: [PATCH i-g-t] tests/kms_hdr: Fix failure to read output_bpc on AMD
> > hardware
> > 
> > On 10/04, Petri Latvala wrote:
> > > On Sat, Oct 02, 2021 at 11:15:11AM -0400, Rodrigo Siqueira wrote:
> > > > Hi Lakshminarayana and Petri,
> > > >
> > > > I noticed that the CI was not triggered for this patch [1]. Do you
> > > > know why? Is it possible to trigger it?
> > > >
> > > > 1.
> > > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpa
> > > > tchwork.freedesktop.org%2Fseries%2F95313%2F&amp;data=04%7C01%7CRodri
> > > >
> > go.Siqueira%40amd.com%7C43b5d7ab0731407a2f9008d987278e48%7C3dd8961fe
> > > >
> > 4884e608e11a82d994e183d%7C0%7C0%7C637689426230154758%7CUnknown%7C
> > TWF
> > > > pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> > > >
> > 6Mn0%3D%7C1000&amp;sdata=NIEF78%2B74hVRdQPhcCEPVlp4To3iDjkpkkv8VjSC0
> > > > %2BE%3D&amp;reserved=0
> > >
> > > CI was down for a bit due to server cert issues, testing that and the
> > > other affected series happening in a bit.
> > 
> > Thanks Petri,
> > 
> > I noticed that the CI was triggered for this patch.
> > 
> > Lakshminarayana,
> > 
> > It looks like that we have a false positive	in the result:
> > 
> >   https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F95313%2F&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7C8c3f22f5fa6c48f0166808d9875c3133%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637689652302229936%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=zJ74sNT%2B6yOcR3%2BH6w%2B2A8tYx84ge1c4ij%2FpCkOQoT8%3D&amp;reserved=0
> > 
> > Notice that this patch only changes kms_hdr, but we have a failure in the
> > igt@kms_lease.
> > 
> > Thanks
> > Siqueira
> > 
> > >
> > > --
> > > Petri Latvala
> > >
> > >
> > > >
> > > > Thanks
> > > > Siqueira
> > > >
> > > > On 10/01, Stylon Wang wrote:
> > > > > The first commit with TEST_ONLY flag in bpc-switch subtests could
> > > > > in some cases cause reading of output_bpc on connectors to fail on
> > > > > AMD hardware.
> > > > >
> > > > > Use ALLOW_MODESET to prevent this from happening.
> > > > >
> > > > > Signed-off-by: Stylon Wang <stylon.wang@amd.com>
> > > > > ---
> > > > >  tests/kms_hdr.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index
> > > > > 5b8529c8..a4983b9a 100644
> > > > > --- a/tests/kms_hdr.c
> > > > > +++ b/tests/kms_hdr.c
> > > > > @@ -217,7 +217,7 @@ static void test_bpc_switch_on_output(data_t *data,
> > igt_output_t *output,
> > > > >  		igt_plane_set_fb(data->primary, &afb);
> > > > >  		igt_plane_set_size(data->primary, data->w, data->h);
> > > > >  		igt_output_set_prop_value(data->output,
> > IGT_CONNECTOR_MAX_BPC, 8);
> > > > > -		ret = igt_display_try_commit_atomic(display,
> > DRM_MODE_ATOMIC_TEST_ONLY, NULL);
> > > > > +		ret = igt_display_try_commit_atomic(display,
> > > > > +DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> > > > >  		if (!ret) {
> > > > >  			data->w = afb.width;
> > > > >  			data->h = afb.height;
> > > > > --
> > > > > 2.32.0
> > > > >
> > > >
> > > > --
> > > > Rodrigo Siqueira
> > > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsi
> > > >
> > queira.tech%2F&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7C43b5d
> > > >
> > 7ab0731407a2f9008d987278e48%7C3dd8961fe4884e608e11a82d994e183d%7C0%
> > 7
> > > >
> > C0%7C637689426230154758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM
> > DAi
> > > > LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=VvCE
> > > > WNlBkZnAm9M1JYeheIlVaUVMkeDiallVz0uUM8o%3D&amp;reserved=0
> > 
> > --
> > Rodrigo Siqueira
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsiqueira.tech%2F&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7C8c3f22f5fa6c48f0166808d9875c3133%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637689652302229936%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ahQpaPpbX2AQtBhiQJU2zF25iWO%2FnWU3Vnx%2F640yRfU%3D&amp;reserved=0

-- 
Rodrigo Siqueira
https://siqueira.tech
