Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56ED66E84C
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2020 07:32:12 +0000 (UTC)
Date: Thu, 23 Jul 2020 10:32:03 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200723073203.GS20883@platvala-desk.ger.corp.intel.com>
References: <20200721181522.20042-1-carlos.santa@intel.com>
 <20200722075603.GR20883@platvala-desk.ger.corp.intel.com>
 <20200722114504.GC6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722114504.GC6112@intel.com>
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
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 02:45:04PM +0300, Ville Syrj=E4l=E4 wrote:
> On Wed, Jul 22, 2020 at 10:56:03AM +0300, Petri Latvala wrote:
> > On Tue, Jul 21, 2020 at 11:15:21AM -0700, Carlos Santa wrote:
> > > In some sandboxes the toolchain complains about missing braces
> > > around initializer, however, adding an extra pair of braces
> > > fixes it, see below:
> > > =

> > > ../tests/kms_plane_cursor.c: In function '__real_main_302':
> > > ../tests/kms_plane_cursor.c:305:2 error: missing braces around initia=
lizer [-Werror=3Dmissing-braces]
> > > 	data_t data =3D { 0 };
> > > =

> > =

> > Argh, gcc.
> > =

> > C++ supports initializing with empty braces ( data_t data =3D {}; ) and
> > C doesn't,
> =

> It works just fine. We use it extensively all over.

Hmm, indeed.

Although we're both correct; that's a gcc extension. I can't find any
documentation about that, the closest I can find is
https://gcc.gnu.org/legacy-ml/gcc/2019-07/msg00066.html explaining
where it _probably_ comes from.

As we explicitly use std=3Dgnu11, using empty brace initialization
instead of { 0 } sounds like the way forward here.


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
