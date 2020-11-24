Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421D189F69
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2020 07:32:57 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Tue, 24 Nov 2020 07:32:54 +0000
Message-ID: <b23f57b032994fd2ad77294c6a1f9838@intel.com>
References: <20201123142035.1426734-1-mika.kahola@intel.com>
 <160617523538.16791.6725216974285613313@build.alporthouse.com>
In-Reply-To: <160617523538.16791.6725216974285613313@build.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/rendercopy_gen9: Ensure to cover
 all destination area
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: Chris Wilson <chris@chris-wilson.co.uk>
> Sent: Tuesday, November 24, 2020 1:47 AM
> To: Kahola, Mika <mika.kahola@intel.com>; igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH i-g-t] lib/rendercopy_gen9: Ensure to cover all
> destination area
> 
> Quoting Mika Kahola (2020-11-23 14:20:35)
> > To ensure to cover all destination area during fast clear, we need to
> > round up the destination coordinates at the lower right corner.
> >
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > ---
> >  lib/rendercopy_gen9.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c index
> > dd8c8c7c..eecf73d3 100644
> > --- a/lib/rendercopy_gen9.c
> > +++ b/lib/rendercopy_gen9.c
> > @@ -293,7 +293,7 @@ gen7_fill_vertex_buffer_data(struct intel_bb *ibb,
> >                 emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
> >                 emit_vertex_normalized(ibb, src_y, intel_buf_height(src));
> >         } else {
> > -               emit_vertex_2s(ibb, (dst_x + width)/64, DIV_ROUND_UP(dst_y +
> height, 16));
> > +               emit_vertex_2s(ibb, DIV_ROUND_UP(dst_x + width, 64),
> > + DIV_ROUND_UP(dst_y + height, 16));
> 
> Ok. Still worried about partial coverage, but it only appears to be used for
> fastclears in kms_ccs over the whole fb. The API leaks.
> 
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk> -Chris

Thanks for the review! I pushed this patch to upstream.

-Mika-
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
