Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CB889D8A
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jan 2022 19:39:36 +0000 (UTC)
Date: Wed, 19 Jan 2022 11:32:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <YehnTHp2uQ+23qaV@mdroper-desk1.amr.corp.intel.com>
References: <20220117085700.1723228-1-priyanka.dandamudi@intel.com>
 <20220117085700.1723228-2-priyanka.dandamudi@intel.com>
 <85czkq9krp.wl-ashutosh.dixit@intel.com>
 <YedACz8aYwPs59md@mdroper-desk1.amr.corp.intel.com>
 <b8588c68-c21c-a46d-2e38-ebb6414dd321@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b8588c68-c21c-a46d-2e38-ebb6414dd321@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/2] lib/igt_gt: Check for shared
 reset domain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: John Harrison <john.c.harrison@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 11:09:00AM -0800, John Harrison wrote:
> On 1/18/2022 14:32, Matt Roper wrote:
> > On Mon, Jan 17, 2022 at 12:20:42PM -0800, Dixit, Ashutosh wrote:
> > > On Mon, 17 Jan 2022 00:56:59 -0800, <priyanka.dandamudi@intel.com> wr=
ote:
> > > > +bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx)
> > > > +{
> > > > +	const struct intel_execution_engine2 *e;
> > > > +	bool rcs0 =3D false;
> > > > +	bool ccs0 =3D false;
> > > > +	int ccs_count =3D 0;
> > > > +
> > > > +	for_each_ctx_engine(fd, ctx, e) {
> > > > +		if ((rcs0 && ccs0) || (ccs_count > 1))
> > > > +			break;
> > > > +		else if (e->class =3D=3D I915_ENGINE_CLASS_RENDER)
> > > > +			rcs0 =3D true;
> > > > +		else if (e->class =3D=3D I915_ENGINE_CLASS_COMPUTE) {
> > > > +			ccs0 =3D true;
> > > > +			ccs_count++;
> > > > +		}
> > > > +	}
> > > > +	return ((rcs0 && ccs0) || (ccs_count > 1));
> > > > +}
> > > No need for bool, just use counts. Something like:
> > >=20
> > > bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx)
> > > {
> > > 	const struct intel_execution_engine2 *e;
> > > 	int rcs =3D 0, ccs =3D 0;
> > >=20
> > > 	for_each_ctx_engine(fd, ctx, e) {
> > > 		if (e->class =3D=3D I915_ENGINE_CLASS_RENDER)
> > > 			rcs++;
> > > 		else if (e->class =3D=3D I915_ENGINE_CLASS_COMPUTE)
> > > 			ccs++;
> > > 	}
> > >=20
> > > 	return ((rcs && ccs) || (ccs >=3D 2));
> > > }
> > >=20
> > > Hmm, this can just be:
> > >=20
> > > bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx)
> > > {
> > > 	const struct intel_execution_engine2 *e;
> > > 	int count =3D 0;
> > >=20
> > > 	for_each_ctx_engine(fd, ctx, e)
> > > 		if (e->class =3D=3D I915_ENGINE_CLASS_RENDER ||
> > > 			e->class =3D=3D I915_ENGINE_CLASS_COMPUTE)
> > > 		count++;
> > >=20
> > > 	return count >=3D 2;
> > > }
> > Yeah, there's no reason to count RCS and CCS separately; all we care
> > about is whether there's more than one engine in the shared reset
> > domain.
> >=20
> > However I think any approach that involves just counting engines from
> > userspace isn't really going to work once we start supporting multi-tile
> > since the various RCS/CCS engines on two separate GTs do belong to
> > separate reset domains.  E.g., if you query the engine list and see just
> > CCS0 and CCS1 (or even RCS0 and CCS0) you don't know whether those
> > engines are both from a single GT and thus share a reset domain, or
> > whether they come from different GTs and each has its own reset domain.
> There is a query API to determine which engine is on which tile, isn't
> there? The distance thing? If CCS0 and CCS1 have a distance of zero they =
are
> on the same tile and dependent, otherwise they are on different tiles and
> independent?

If I recall correctly, the distance query is only for determining the
distance of an engine from a specific memory region.  So if you had a
four-tile layout like

        0 - 1
        |   |
        2 - 3

some pairs of tiles would be the same distance from any single memory
region you choose.  You'd potentially have to compare the distance to
multiple memory regions to figure out whether the engines truly
originated from the same tile or not.  So I guess it's doable (if/when
the distance query arrives), but kind of ugly.  It seems like userspace
would rather have a more straightforward way to determine this, such as
a reset ID (integer) associated with every engine.  If two engines have
the same reset ID, userspace would know they're tied together without
jumping through any extra hoops.  I don't know what the UMD plans are in
this area though.


Matt

>=20
> However, I wonder if this is the right approach at all. What should a test
> do on a multi-tile system? Test each tile independently but skip dependent
> engines? Test them together with RCS of one tile vs RCS of the other? Just
> skip everything? Seems like it is likely to be a different requirement for
> different tests. So maybe=A0 the API is going to need to take take two en=
gines
> as a parameter and say whether those two specific engines are shared or n=
ot?
> It's all getting extremely messy.
>=20
> John.
>=20
> >=20
> > Matt
> >=20
>=20

--=20
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
