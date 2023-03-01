Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1068C10E18F
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Mar 2023 06:09:09 +0000 (UTC)
Date: Wed, 1 Mar 2023 07:08:58 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230301070858.4a95c134@maurocar-mobl2>
In-Reply-To: <20230228150852.6jhwxigitk7rhfx7@ldmartin-desk2.lan>
References: <20230224104443.62373-1-zbigniew.kempczynski@intel.com>
 <20230224104443.62373-2-zbigniew.kempczynski@intel.com>
 <b2b782a7-d7ef-d20a-998b-745bcf72f2f7@intel.com>
 <20230228082543.7brsu5glv3p3rxdw@zkempczy-mobl2>
 <20230228150852.6jhwxigitk7rhfx7@ldmartin-desk2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/8] drm-uapi/xe_drm: Add Xe uAPI
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 28 Feb 2023 07:08:52 -0800
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> On Tue, Feb 28, 2023 at 09:25:43AM +0100, Zbigniew Kempczy=C5=84ski wrote:
> >On Fri, Feb 24, 2023 at 06:57:52PM +0100, Michal Wajdeczko wrote: =20
> >>
> >>
> >> On 24.02.2023 11:44, Zbigniew Kempczy=C5=84ski wrote: =20
> >> > Introduce uAPI contract for Xe IGT.
> >> >
> >> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> >> > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >> > Signed-off-by: Philippe Lecluse <philippe.lecluse@intel.com>
> >> > Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel=
.com>
> >> > ---
> >> >  include/drm-uapi/xe_drm.h | 807 +++++++++++++++++++++++++++++++++++=
+++
> >> >  1 file changed, 807 insertions(+)
> >> >  create mode 100644 include/drm-uapi/xe_drm.h =20
> >>
> >> is it really necessary to copy this buggy header to IGT right now?
> >>
> >> maybe we can wait until this header will be properly reviewed and
> >> cleaned up in the kernel repo first ? =20
> >
> >+Lucas
> >
> >We discussed yesterday about this header - from IGT perspective it
> >is not a blocker, after fixing in xe kernel we'll copy it here.
> >Xe-igt repository had sense during early development stage, but now
> >we want to migrate it here. Code still requires fixups and cleanup
> >but we may do it here. Otherwise workflow would require sending to
> >igt ml (squashed patches with some of them removed [kunit]), then
> >fixup to xe-igt and repeat squash/send. Very time consuming we want
> >to avoid. Fixing that later in igt is acceptable for us as xe driver
> >is not production ready. =20
>=20
> yep, any fix to this file should be done in the kernel side. igt only
> copies this file so it doesn't depend on any kernel-headers package.

Agreed.

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

>=20
> The obvious issues I see are in the comments/docs where we have
> leftovers from i915. Michal, is this what you are referring to or there
> is something else?  If you can send a patch cleaning that up or creating
> an issue in gitlab it would be appreciated
>=20
>=20
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
>=20
> Lucas De Marchi
