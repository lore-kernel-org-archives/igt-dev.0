Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2766C10F010
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 09:28:03 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 14 Jun 2022 11:27:57 +0200
Message-ID: <5382541.GXAFRqVoOG@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <YqMxKyeHrKArZJW3@platvala-desk.ger.corp.intel.com>
References: <20220610113335.573064-1-janusz.krzysztofik@linux.intel.com>
 <YqMxKyeHrKArZJW3@platvala-desk.ger.corp.intel.com>
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
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Friday, 10 June 2022 13:55:23 CEST Petri Latvala wrote:
> On Fri, Jun 10, 2022 at 01:33:35PM +0200, Janusz Krzysztofik wrote:
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
> >=20
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>=20
> I was wondering why I haven't seen that error, but everything
> currently has i915_drm.h included directly or indirectly before
> intel_memory_region.h so it was hidden.
>=20
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Thank you Petri, pushed.

Janusz

>=20
>=20
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
> >  int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint6=
4_t *size,
> >  				       struct drm_i915_gem_memory_class_instance *mem_regions,
> >  				       int num_regions);
>=20



