Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B786E418
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 08:16:05 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Mon, 20 Sep 2021 08:16:00 +0000
Message-ID: <BY5PR11MB437275A323C72B9423A85B0D89A09@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <20210916141227.17554-1-vidya.srinivas@intel.com>
 <CAJUqKUrnH7grhjC8deuZs9qjsJGKJvoLKoRj3TyyFpgL5BG6pg@mail.gmail.com>
 <20210917072135.GA5022@zkempczy-mobl2>
In-Reply-To: <20210917072135.GA5022@zkempczy-mobl2>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915/intel_memory_region: Fix
 regression on 5.4 kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Mark Yacoub <markyacoub@chromium.org>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> Sent: Friday, September 17, 2021 12:52 PM
> To: Mark Yacoub <markyacoub@chromium.org>
> Cc: Srinivas, Vidya <vidya.srinivas@intel.com>; Development mailing list =
for
> IGT GPU Tools <igt-dev@lists.freedesktop.org>; Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com>; Mark Yacoub
> <markyacoub@google.com>
> Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915/intel_memory_region: Fix
> regression on 5.4 kernel
>=20
> On Thu, Sep 16, 2021 at 11:25:30AM -0400, Mark Yacoub wrote:
> > On Thu, Sep 16, 2021 at 10:24 AM Vidya Srinivas
> > <vidya.srinivas@intel.com> wrote:
> > >
> > > Starting commit 8759c4a3020ce4 "Add intel_buf_init_in_region"
> > > __intel_buf_init uses gem_create_in_memory_regions instead of
> > > gem_create. Older kernels like 5.4 still dont have support for
> > > I915_GEM_CREATE_EXT_MEMORY_REGIONS (i915_gem_create_ext_ioctl)
> from
> > > kernel commit
> > > (https://patchwork.freedesktop.org/patch/431581/?series=3D89648&rev=
=3D1)
> > > Due to this, the flip-vs-fences tests are failing on kernel 5.4
> > > Patch add roll back to gem_create when
> __gem_create_in_memory_region_list fails.
> > >
> > > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > > ---
> > >  lib/i915/intel_memory_region.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/lib/i915/intel_memory_region.c
> > > b/lib/i915/intel_memory_region.c index 3de40549319b..323b96bad232
> > > 100644
> > > --- a/lib/i915/intel_memory_region.c
> > > +++ b/lib/i915/intel_memory_region.c
> > > @@ -209,7 +209,9 @@ uint32_t gem_create_in_memory_region_list(int
> fd, uint64_t size,
> > >         uint32_t handle;
> > >         int ret =3D __gem_create_in_memory_region_list(fd, &handle, s=
ize,
> > >                                                      mem_regions, num=
_regions);
> > > -       igt_assert_eq(ret, 0);
> > > +       if (ret !=3D 0)
> > > +               handle =3D gem_create(fd, size);
>=20
> > I'm not sure if this change should be here or should be at the caller
> > `void __intel_buf_init(...).
>=20
> I agree, silent fallback to system memory when mem_regions could contain
> only device memory is definitely not we want.
>=20
> You may leave this function intact and call underscored (not-asserting)
> version of __gem_create_in_memory_regions() in __intel_buf_init(), then
> react to result. I mean if region _is_ system memory fallback to gem_crea=
te()
> is possible, otherwise assert.
>=20
> --
> Zbigniew

Thank you very much Zbigniew and Mark. I have made the suggested modificati=
on and submitted
Kindly have a check https://patchwork.freedesktop.org/patch/454570/?series=
=3D94761&rev=3D3
I guess I should've passed buf->handle directly to __gem_create_in_memory_r=
egions.=20
As of now, I just passed &handle.

Regards
Vidya

>=20
> > > +
> > Let's have a check before we return, parallel to the removed `
> > igt_assert_eq(ret, 0);`, Something like `igt_assert(!ret || handle).`
> > >         return handle;
> > >  }
> > >
> > > --
> > > 2.33.0
> > >
