Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13BD10E1D1
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 11:18:55 +0000 (UTC)
Date: Thu, 5 Oct 2023 13:18:50 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <20231005111850.dvzha4frsaoiy7l2@zkempczy-mobl2>
References: <20231004134722.319334-1-juhapekka.heikkila@gmail.com>
 <73b5370c-a61b-46e7-8041-2809ad8c3f50@linux.intel.com>
 <e06efa0c-8f9f-dbb6-fbea-1199766d79d8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e06efa0c-8f9f-dbb6-fbea-1199766d79d8@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_fb: on Xe driver take into
 account adlp with no extended block copy
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 05, 2023 at 11:39:54AM +0300, Juha-Pekka Heikkila wrote:
> Hei Maarten,
> 
> On 4.10.2023 19.41, Maarten Lankhorst wrote:
> > Hey,
> > 
> > Patch looks good, but right below HAS_FLATCCS is used instead.
> > 
> > Could you fix that too for consistency?
> 
> That is not cosmetic change, it will affect mtl behavior. Currently I don't
> have access to machine which would match to what ci has so I cannot test
> what will happen.

Looking at the code HAS_FLATCCS is not true for mtl so now we're
not using extended block-copy command. Bspec said it should and
BLT_CMD_EXTENDED property is set in intel_cmds_info.c. Do we
have working blitcopy() for mtl now?

--
Zbigniew

> 
> /Juha-Pekka
> 
> > 
> > With that amended,
> > 
> > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > 
> > Den 2023-10-04 kl. 15:47, skrev Juha-Pekka Heikkila:
> > > With Xe add check to not use extended block copy if it is not available.
> > > 
> > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > ---
> > >   lib/igt_fb.c | 20 +++++++++++---------
> > >   1 file changed, 11 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > > index f0c0681ab..54a66eb6a 100644
> > > --- a/lib/igt_fb.c
> > > +++ b/lib/igt_fb.c
> > > @@ -2920,17 +2920,19 @@ static void blitcopy(const struct igt_fb *dst_fb,
> > >               blt_set_copy_object(&blt.src, src);
> > >               blt_set_copy_object(&blt.dst, dst);
> > > -            blt_set_object_ext(&ext.src,
> > > -                       blt_compression_format(&blt, src_fb),
> > > -                       src_fb->width, src_fb->height,
> > > -                       SURFACE_TYPE_2D);
> > > +            if (blt_uses_extended_block_copy(src_fb->fd)) {
> > > +                blt_set_object_ext(&ext.src,
> > > +                        blt_compression_format(&blt, src_fb),
> > > +                        src_fb->width, src_fb->height,
> > > +                        SURFACE_TYPE_2D);
> > > -            blt_set_object_ext(&ext.dst,
> > > -                       blt_compression_format(&blt, dst_fb),
> > > -                       dst_fb->width, dst_fb->height,
> > > -                       SURFACE_TYPE_2D);
> > > +                blt_set_object_ext(&ext.dst,
> > > +                        blt_compression_format(&blt, dst_fb),
> > > +                        dst_fb->width, dst_fb->height,
> > > +                        SURFACE_TYPE_2D);
> > > -            pext = &ext;
> > > +                pext = &ext;
> > > +            }
> > >               blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
> 
