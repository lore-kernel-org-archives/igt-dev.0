Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65096E153
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2020 11:45:07 +0000 (UTC)
Date: Wed, 22 Jul 2020 14:45:04 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200722114504.GC6112@intel.com>
References: <20200721181522.20042-1-carlos.santa@intel.com>
 <20200722075603.GR20883@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722075603.GR20883@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] tests: add missing braces around initializer
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 10:56:03AM +0300, Petri Latvala wrote:
> On Tue, Jul 21, 2020 at 11:15:21AM -0700, Carlos Santa wrote:
> > In some sandboxes the toolchain complains about missing braces
> > around initializer, however, adding an extra pair of braces
> > fixes it, see below:
> > =

> > ../tests/kms_plane_cursor.c: In function '__real_main_302':
> > ../tests/kms_plane_cursor.c:305:2 error: missing braces around initiali=
zer [-Werror=3Dmissing-braces]
> > 	data_t data =3D { 0 };
> > =

> =

> Argh, gcc.
> =

> C++ supports initializing with empty braces ( data_t data =3D {}; ) and
> C doesn't,

It works just fine. We use it extensively all over.

> leaving only the commonly used { 0 } idiom to mean "I just
> want to zero-initialize this object, don't care about the
> structure". Even better, due to the brace elision clause in the spec,
> that construct is fully defined and means exactly fully
> zero-initializing the aggregate object regardless of its structure.
> =

> I could agree with this change if the initialization used non-zero
> values but just adding braces to make the compiler believe you really
> meant this...
> =

> I wonder if playing around with -Wmissing-initializer
> -Wno-missing-braces lets us leave the code as { 0 } for elegance,
> while still get a warning for actual incorrect use...
> =

> Which version of gcc was this on?
> =

> =

> -- =

> Petri Latvala
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
