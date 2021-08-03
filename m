Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FCA6E889
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Aug 2021 15:06:02 +0000 (UTC)
Date: Tue, 3 Aug 2021 11:05:57 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210803150557.3j44je22mtjqxh5l@outlook.office365.com>
References: <20210722083240.33453-1-zbigniew.kempczynski@intel.com>
 <20210722083240.33453-45-zbigniew.kempczynski@intel.com>
 <20210723142621.rvln6c65wkz2o6cd@outlook.office365.com>
 <20210730040427.GA4915@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210730040427.GA4915@zkempczy-mobl2>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 44/50] tests/kms_cursor_legacy: Adopt to
 use allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, nicholas.choi@amd.com, "Wentland, Harry" <Harry.Wentland@amd.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 07/30, Zbigniew Kempczyński wrote:
> On Fri, Jul 23, 2021 at 10:26:21AM -0400, Rodrigo Siqueira wrote:
> > Hi Kempczyński,
> > 
> > I tried part of this series in an AMD device, and it introduces a
> > regression in the basic-flip-before-cursor-legacy (probably other tests
> > will start to fail on AMD). For the new version, could you split this
> > series in two? One dedicated to generic changes and kms tests, and the
> > other focused on i915? This will make it easier to review.
> 
> Hi Rodrigo.
> 
> Change in kms_cursor_legacy adds supporting allocator in spinner code
> (.ahnd = ahnd). get_reloc_ahnd() asks for supporting relocations 
> in i915 so maybe this is root cause of the failure. 
> 
> Which subtests from kms_cursor_legacy you're using? Could you verify
> if you'll replace:

I tested basic-flip-before-cursor-legacy. However, I did not tested
everything because this test take a long time.

> 
> uint64_t ahnd = get_reloc_ahnd(display->drm_fd, 0);
> 
> to 
> 
> uint64_t ahnd = (flags & BASIC_BUSY) ? get_reloc_ahnd(display->drm_fd, 0) : 0;
> 
> issue will be solved?

Yes, that fixed the issue when I added in the basic_flip_cursor
function.

Thanks
Siqueira
 
> --
> Zbigniew
> 
> 
> > 
> > Thanks
> > Siqueira
> > 
> > On 07/22, Zbigniew Kempczyński wrote:
> > > For newer gens we're not able to rely on relocations. Adopt to use
> > > offsets acquired from the allocator.
> > > 
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > ---
> > >  tests/kms_cursor_legacy.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> > > index 75a822c4e..4f96c880e 100644
> > > --- a/tests/kms_cursor_legacy.c
> > > +++ b/tests/kms_cursor_legacy.c
> > > @@ -517,6 +517,7 @@ static void basic_flip_cursor(igt_display_t *display,
> > >  	struct igt_fb fb_info, cursor_fb, cursor_fb2, argb_fb;
> > >  	unsigned vblank_start;
> > >  	enum pipe pipe = find_connected_pipe(display, false);
> > > +	uint64_t ahnd = get_reloc_ahnd(display->drm_fd, 0);
> > >  	igt_spin_t *spin;
> > >  	int i, miss1 = 0, miss2 = 0, delta;
> > >  
> > > @@ -548,6 +549,7 @@ static void basic_flip_cursor(igt_display_t *display,
> > >  		spin = NULL;
> > >  		if (flags & BASIC_BUSY)
> > >  			spin = igt_spin_new(display->drm_fd,
> > > +					    .ahnd = ahnd,
> > >  					    .dependency = fb_info.gem_handle);
> > >  
> > >  		/* Start with a synchronous query to align with the vblank */
> > > @@ -631,6 +633,7 @@ static void basic_flip_cursor(igt_display_t *display,
> > >  		igt_remove_fb(display->drm_fd, &argb_fb);
> > >  	if (cursor_fb2.gem_handle)
> > >  		igt_remove_fb(display->drm_fd, &cursor_fb2);
> > > +	put_ahnd(ahnd);
> > >  }
> > >  
> > >  static int
> > > @@ -1319,6 +1322,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
> > >  	igt_pipe_t *pipe_connected = &display->pipes[pipe];
> > >  	igt_plane_t *plane_primary = igt_pipe_get_plane_type(pipe_connected, DRM_PLANE_TYPE_PRIMARY);
> > >  	igt_crc_t crcs[2], test_crc;
> > > +	uint64_t ahnd = get_reloc_ahnd(display->drm_fd, 0);
> > >  
> > >  	if (atomic)
> > >  		igt_require(display->is_atomic);
> > > @@ -1366,6 +1370,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
> > >  		igt_spin_t *spin;
> > >  
> > >  		spin = igt_spin_new(display->drm_fd,
> > > +				    .ahnd = ahnd,
> > >  				    .dependency = fb_info[1].gem_handle);
> > >  
> > >  		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
> > > @@ -1394,6 +1399,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
> > >  	igt_remove_fb(display->drm_fd, &fb_info[1]);
> > >  	igt_remove_fb(display->drm_fd, &fb_info[0]);
> > >  	igt_remove_fb(display->drm_fd, &cursor_fb);
> > > +	put_ahnd(ahnd);
> > >  }
> > >  
> > >  igt_main
> > > -- 
> > > 2.26.0
> > > 
> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Figt-dev&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7C3dcef109673e465caaac08d9530f235f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637632146746647908%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=gpapeZA1PhJE6kvBFEU%2BzrVAIz4OnDByegc5pJBa6Ms%3D&amp;reserved=0
> > 
> > -- 
> > Rodrigo Siqueira
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsiqueira.tech%2F&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7C3dcef109673e465caaac08d9530f235f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637632146746647908%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ycmN5bKNTN9u0Xl1ELOSF%2BITbQO4FlDhf7%2Bn1rGi%2BBo%3D&amp;reserved=0

-- 
Rodrigo Siqueira
https://siqueira.tech
