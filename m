Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA59489F1B
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 08:55:30 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 10 Aug 2021 10:55:26 +0200
Message-ID: <5485866.DvuYhMxLoT@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <YRI9ch5fTTyoihUN@platvala-desk.ger.corp.intel.com>
References: <20210810081440.21803-1-janusz.krzysztofik@linux.intel.com>
 <YRI9ch5fTTyoihUN@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t] i915/intel_memory_region: Add missing
 forward declaration
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andrzej Turko <andrzej.turko@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

On wtorek, 10 sierpnia 2021 10:48:50 CEST Petri Latvala wrote:
> On Tue, Aug 10, 2021 at 10:14:40AM +0200, Janusz Krzysztofik wrote:
> > Intel memory region header declares some functions with a pointer to a
> > structure defined elsewhere as one of their arguments.  Forward declare
> > that structure to avoid compiler warnings.
> >=20
> > ../lib/i915/intel_memory_region.h:69:19: warning: =E2=80=98struct=20
drm_i915_gem_memory_class_instance=E2=80=99 declared inside parameter list =
will not be=20
visible outside of this definition or declaration
> >    69 |            struct drm_i915_gem_memory_class_instance *mem_regio=
ns,
> >       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ../lib/i915/intel_memory_region.h:73:15: warning: =E2=80=98struct=20
drm_i915_gem_memory_class_instance=E2=80=99 declared inside parameter list =
will not be=20
visible outside of this definition or declaration
> >    73 |        struct drm_i915_gem_memory_class_instance *mem_regions,
> >       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >=20
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  lib/i915/intel_memory_region.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/lib/i915/intel_memory_region.h b/lib/i915/
intel_memory_region.h
> > index e9d1d66d4..8cd18ea0e 100644
> > --- a/lib/i915/intel_memory_region.h
> > +++ b/lib/i915/intel_memory_region.h
> > @@ -62,6 +62,8 @@ uint8_t gem_get_lmem_region_count(int fd);
> > =20
> >  bool gem_has_lmem(int fd);
> > =20
> > +struct drm_i915_gem_memory_class_instance;
> > +
>=20
>=20
> You want to avoid an #include <i915_drm.h> ?

The intel_memory_region.h header doesn't need to know anything about intern=
als=20
of struct drm_i915_gem_memory_class_instance, then I think the forward=20
declaration is more standard, but we can add #include <i915_drm.h> if you=20
prefer.

Thanks,
Janusz

>=20
>=20
> >  int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint6=
4_t=20
size,
> >  				       struct=20
drm_i915_gem_memory_class_instance *mem_regions,
> >  				       int num_regions);
>=20



