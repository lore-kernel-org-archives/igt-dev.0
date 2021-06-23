Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF8989C6B
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jun 2021 06:13:59 +0000 (UTC)
Date: Wed, 23 Jun 2021 09:15:57 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YNLRnYcVTsTF1kZC@platvala-desk.ger.corp.intel.com>
References: <20210621172146.4130875-1-markyacoub@chromium.org>
 <20210622181152.3ihjwqrurd27lwvd@outlook.office365.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622181152.3ihjwqrurd27lwvd@outlook.office365.com>
Subject: Re: [igt-dev] [PATCH v2] lib/igt_fb: Support Tile Size for AMD non
 linear modifiers.
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
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>, seanpaul@chromium.org, bas@basnieuwenhuizen.nl
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 02:11:52PM -0400, Rodrigo Siqueira wrote:
> On 06/21, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> > 
> > Calculate the width and height of the tile on amdgpu when the modifier
> > is not linear.
> > 
> > v1:
> > Change width_ret to bytes not pixels.
> > 
> > Cc: bas@basnieuwenhuizen.nl
> > Cc: daniel.vetter@ffwll.ch
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > Change-Id: I30849ee1368fc626d1ce2826fb726cd76565a449
> > ---
> >  lib/igt_fb.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index 71b89855..a3926dc9 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -396,6 +396,19 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
> >  		vc4_modifier_param = fourcc_mod_broadcom_param(modifier);
> >  		modifier = fourcc_mod_broadcom_mod(modifier);
> >  	}
> > +	// For all non-linear modifiers, AMD uses 64 KiB tiles
> > +	else if (IS_AMD_FMT_MOD(modifier)) {
> > +		igt_require_amdgpu(fd);
> > +		const int bytes_per_pixel = fb_bpp / 8;
> > +		const int format_log2 = log2(bytes_per_pixel);
> > +		const int pixel_log2 = log2(64 * 1024) - format_log2;
> > +		const int width_log2 = (pixel_log2 + 1) / 2;
> > +		const int height_log2 = pixel_log2 - width_log2;
> > +
> > +		*width_ret = bytes_per_pixel << width_log2;
> > +		*height_ret = 1 << height_log2;
> > +		return;
> > +	}
> 
> Hi Mark,
> 
> This patch lgtm,
> 
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> 
> However, let's check if Bas has any comment about it.
> 
> Btw, is the CI failure a false positive?

Looks like those results are caused by the regression in the kernel we
had for a bit. I queued this patch for a re-test.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
