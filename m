Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B2D89E2A
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Mar 2021 07:29:57 +0000 (UTC)
Date: Mon, 1 Mar 2021 09:30:17 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YDyYCW0KfY01A1AU@platvala-desk.ger.corp.intel.com>
References: <20210227144900.3961632-1-richard.purdie@linuxfoundation.org>
 <4b0ea6a7-92a7-566a-ce32-f8548eb87092@mupuf.org>
 <52b977b0d59d74e8283c4f2f2630db91df030a1b.camel@linuxfoundation.org>
 <7d90b3ab-a525-bf0f-8952-aba2e106c48a@mupuf.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d90b3ab-a525-bf0f-8952-aba2e106c48a@mupuf.org>
Subject: Re: [igt-dev] [PATCH i-g-t] meson: Allow source location to be
 configurable
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
To: Martin Peres <martin.peres@mupuf.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 08:43:12AM +0200, Martin Peres wrote:
> Hi Richard,
> =

> On 28/02/2021 14:29, Richard Purdie wrote:
> > On Sun, 2021-02-28 at 12:06 +0200, Martin Peres wrote:
> > > On 27/02/2021 16:49, Richard Purdie wrote:
> > > > =

> > > >  =A0=A0lib_version =3D vcs_tag(input : 'version.h.in', output : 've=
rsion.h',
> > > >  =A0=A0		      fallback : 'NO-GIT',
> > > > diff --git a/meson_options.txt b/meson_options.txt
> > > > index ff3abf08..a0a1aaed 100644
> > > > --- a/meson_options.txt
> > > > +++ b/meson_options.txt
> > > > @@ -50,3 +50,7 @@ option('use_rpath',
> > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0type : 'boolean',
> > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0value : false,
> > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0description : 'Set runpath on installed=
 executables for libigt.so')
> > > > +
> > > > +option('srcdir',
> > > > +       type : 'string',
> > > > +       description : 'Path to source code to be compiled into bina=
ries (optional)')
> > > =

> > > Shouldn't this read: "Path to THE source code to be compiled
> > > (optional)"? Compiling into binaries is a little redundant, so I would
> > > drop it.
> > =

> > I'm not sure that does quite mean the same thing. The option is talking
> > about a path which gets compiled inside the binary rather than a path t=
o code
> > which is compiled.
> > =

> > Regardless, it clearly needs to be more clear! :)
> > =

> > How about "Source code path in the target environment for use within ta=
rget
> > binaries (optional)"?
> =

> Ah ah! Yeah, that was not how I understood it, and your new help text is
> definitely making sense :)
> =

> Please send a v2 with this done, after you get an actual review :)


Somehow slip in the word "override" in the description, or add some
kind of other mention that by default it's automatic.

Otherwise LGTM and the reasoning makes sense.

For the record, the embedded path is used by igt_fopen_data(), only
used by one (!) test currently to open an image file...


Reviewed-by: Petri Latvala <petri.latvala@intel.com>



> =

> Cheers,
> Martin
> =

> > =

> > Cheers,
> > =

> > Richard
> > =

> > > Other than this, the rationale seems sane, but I am not
> > > knowledgeable-enough about IGT's build system to comment more on it:
> > > =

> > > Acked-by: Martin Peres <martin.peres@mupuf.org>
> > > =

> > > > =

> > > =

> > =

> > =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
