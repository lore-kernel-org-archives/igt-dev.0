Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 19 Mar 2021 11:05:17 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YFRpTVxr8Kso/7ky@platvala-desk.ger.corp.intel.com>
References: <20210317223827.446803-1-lyude@redhat.com>
 <f42f3af7-658e-b06f-fb79-c36273ac4810@mupuf.org>
 <YFMaG3tRgsiizy+J@platvala-desk.ger.corp.intel.com>
 <3c5108990850ae8f88952c3149eaa935f7e378e7.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c5108990850ae8f88952c3149eaa935f7e378e7.camel@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Introduce the igt_nouveau library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org, Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 12:49:13PM -0400, Lyude Paul wrote:
> On Thu, 2021-03-18 at 11:15 +0200, Petri Latvala wrote:
> > On Thu, Mar 18, 2021 at 09:06:29AM +0200, Martin Peres wrote:
> > > On 18/03/2021 00:38, Lyude wrote:
> > > > diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_f=
ourcc.h
> > > > index a7bc058c..87c87485 100644
> > > > --- a/include/drm-uapi/drm_fourcc.h
> > > > +++ b/include/drm-uapi/drm_fourcc.h
> > > > @@ -681,7 +681,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64
> > > > modifier)
> > > > =A0 }
> > > > =A0 /*
> > > > - * 16Bx2 Block Linear layout, used by Tegra K1 and later
> > > > + * 16Bx2 Block Linear layout, used by desktop GPUs, and Tegra K1 a=
nd
> > > > later
> > > =

> > > Maybe remove one of the "and"s?
> > > =

> > > 16Bx2 Block Linear layout, used by desktop GPUs, and Tegra K1+
> > =

> > drm_fourcc.h is copied from the kernel, no hand-editing in IGT.
> =

> These additions are all copied from the drm_fourcc.h file in the kernel t=
hough,
> do you want me to just update the whole file instead?

It was more of a response to Martin's suggestion that would need to go
through the kernel.

As for this patch to IGT, yes please, copy the file from the kernel
as-is. As a separate commit, commit message stating which SHA in
kernel it's from.


-- =

Petri Latvala



> =

> > =

> > =

> =

> -- =

> Sincerely,
>    Lyude Paul (she/her)
>    Software Engineer at Red Hat
>    =

> Note: I deal with a lot of emails and have a lot of bugs on my plate. If =
you've
> asked me a question, are waiting for a review/merge on a patch, etc. and I
> haven't responded in a while, please feel free to send me another email t=
o check
> on my status. I don't bite!
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
