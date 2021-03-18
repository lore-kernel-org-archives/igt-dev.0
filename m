Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 18 Mar 2021 11:15:07 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YFMaG3tRgsiizy+J@platvala-desk.ger.corp.intel.com>
References: <20210317223827.446803-1-lyude@redhat.com>
 <f42f3af7-658e-b06f-fb79-c36273ac4810@mupuf.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f42f3af7-658e-b06f-fb79-c36273ac4810@mupuf.org>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Introduce the igt_nouveau library
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
To: Martin Peres <martin.peres@mupuf.org>
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org, Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 09:06:29AM +0200, Martin Peres wrote:
> On 18/03/2021 00:38, Lyude wrote:
> > diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
> > index a7bc058c..87c87485 100644
> > --- a/include/drm-uapi/drm_fourcc.h
> > +++ b/include/drm-uapi/drm_fourcc.h
> > @@ -681,7 +681,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
> >   }
> >   /*
> > - * 16Bx2 Block Linear layout, used by Tegra K1 and later
> > + * 16Bx2 Block Linear layout, used by desktop GPUs, and Tegra K1 and later
> 
> Maybe remove one of the "and"s?
> 
> 16Bx2 Block Linear layout, used by desktop GPUs, and Tegra K1+

drm_fourcc.h is copied from the kernel, no hand-editing in IGT.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
