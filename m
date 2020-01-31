Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1791B6E20A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 12:11:39 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Fri, 31 Jan 2020 12:11:36 +0000
Message-ID: <73353afc9c5f5e95db09c4a388bc734434e1b4c7.camel@intel.com>
References: <20200131092603.24223-1-mika.kahola@intel.com>
 <20200131092603.24223-2-mika.kahola@intel.com>
 <20200131105520.GY25209@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200131105520.GY25209@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-ID: <5C5CF19EBB41FC488828697A29795795@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/1] tests/kms_plane_lowres: Fix CRC
 mismatch
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
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 2020-01-31 at 12:55 +0200, Petri Latvala wrote:
> On Fri, Jan 31, 2020 at 11:26:03AM +0200, Mika Kahola wrote:
> > Mixing SDR and HDR planes yields to CRC mismatch. The patch
> > computes the
> > reference image and CRC with the main plane matching the SDR/HDR
> > plane type.
> > 
> > v2: HDR planes are not defined for gen9 and older (CI)
> > 
> > References: https://gitlab.freedesktop.org/drm/intel/issues/899
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > ---
> >  tests/kms_plane_lowres.c | 142 +++++++++++++++++++++++++--------
> > ------
> >  1 file changed, 90 insertions(+), 52 deletions(-)
> > 
> > diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> > index 4c3f5636..012b25e3 100644
> > --- a/tests/kms_plane_lowres.c
> > +++ b/tests/kms_plane_lowres.c
> > @@ -32,11 +32,15 @@
> >  
> >  IGT_TEST_DESCRIPTION("Test atomic mode setting with a plane by
> > switching between high and low resolutions");
> >  
> > +#define SDR_PLANE_BASE 3
> >  #define SIZE 64
> >  
> >  typedef struct {
> >  	int drm_fd;
> >  	igt_display_t display;
> > +	uint32_t devid;
> > +	igt_output_t *output;
> > +	enum pipe pipe;
> >  	struct igt_fb fb_primary;
> >  	struct igt_fb fb_plane[2];
> >  	struct {
> > @@ -77,11 +81,44 @@ get_lowres_mode(int drmfd, igt_output_t
> > *output,
> >  	return *mode;
> >  }
> >  
> > +static igt_plane_t *first_sdr_plane(igt_output_t *output, uint32_t
> > devid)
> > +{
> > +        int index;
> > +
> > +        index = intel_gen(devid) <= 9 ? 0 : SDR_PLANE_BASE;
> > +
> > +        return igt_output_get_plane(output, index);
> > +}
> > +
> > +static bool is_sdr_plane(const igt_plane_t *plane, uint32_t devid)
> > +{
> > +        if (intel_gen(devid) <= 9)
> > +                return true;
> > +
> > +        return plane->index >= SDR_PLANE_BASE;
> > +}
> 
> kms_plane.c has similar HDR plane finder code by Ville. For some
> values of similar. At least it had comments explaining why the SDR
> plane base is 3. :P
> 
> Any takers for refactoring to shared code?
I'm planning to put these on lib. Similar code is also used in kms_ccs
test.

-Mika-

> 
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
