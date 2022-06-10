Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14F810EEA1
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 12:59:17 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 10 Jun 2022 14:59:13 +0200
Message-ID: <4108975.ghgXmdF2J7@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <YqM1PSROt/HVArcc@kamilkon-desk1>
References: <20220610113335.573064-1-janusz.krzysztofik@linux.intel.com>
 <YqM1PSROt/HVArcc@kamilkon-desk1>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_memory_region: Fix missing
 header inclusion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

On Friday, 10 June 2022 14:12:45 CEST Kamil Konieczny wrote:
> Hi Janusz,
>=20
> On 2022-06-10 at 13:33:35 +0200, Janusz Krzysztofik wrote:
> > IGT commit 68efa99c62e2 ("i915/gem_eio: Exercise object creation while
> > wedged") extended lib/i915/intel_memory_region.h header with a definiti=
on
> > of new struct gem_memory_region.  That structure contains a member of t=
ype
> > struct drm_i915_gem_memory_class_instance, but definition of that type =
is
> > not available unless "i915_drm.h" header is included.  Include the miss=
ing
> > header.
> >=20
> > ../lib/i915/intel_memory_region.h:118:44: error: field =E2=80=98ci=E2=
=80=99 has incomplete type
> >   118 |  struct drm_i915_gem_memory_class_instance ci;
>=20
> I don't see this error when I recompile i-g-t ?

As Petri already stated, current users do include i915_drm.h, explicitly or=
=20
implicitly, prior to intel_memory_region.h, that's why you can't see the=20
error.  New code I'm working on doesn't require i915_drm.h but needs=20
intel_memory_region.h.  Future code may have similar requirements.

> >=20
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  lib/i915/intel_memory_region.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_reg=
ion.h
> > index f9af9401ea..a874172401 100644
> > --- a/lib/i915/intel_memory_region.h
> > +++ b/lib/i915/intel_memory_region.h
> > @@ -20,6 +20,7 @@
> >   * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER=
 DEALINGS
> >   * IN THE SOFTWARE.
> >   */
> > +#include "i915_drm.h"
> >  #include "igt_collection.h"
> > =20
> >  #ifndef INTEL_MEMORY_REGION_H
> > @@ -62,8 +63,6 @@ unsigned int gem_get_lmem_region_count(int fd);
> > =20
> >  bool gem_has_lmem(int fd);
> > =20
> > -struct drm_i915_gem_memory_class_instance;
> > -
>=20
> Maybe this change caused error ?

This forward declaration was needed by definitions of functions which accep=
t a=20
pointer to struct drm_i915_gem_memory_class_instance.  My patch removes it =
as=20
no longer needed since now definition of the structure, needed by the chang=
e=20
introduced by commit commit 68efa99c62e2 ("i915/gem_eio: Exercise object
creation while wedged"), is pulled from i915_drm.h.

Thanks,
Janusz

>=20
> Regards,
> Kamil
>=20
> >  int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint6=
4_t *size,
> >  				       struct drm_i915_gem_memory_class_instance *mem_regions,
> >  				       int num_regions);
>=20



