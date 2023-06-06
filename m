Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37CA10E2F0
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 08:35:15 +0000 (UTC)
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
Date: Tue, 6 Jun 2023 08:35:11 +0000
Message-ID: <BYAPR11MB34791757A9085AC0BB357023D952A@BYAPR11MB3479.namprd11.prod.outlook.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
 <9166079.rMLUfLXkoz@jkrzyszt-mobl2.ger.corp.intel.com>
 <BYAPR11MB347921D98F30E435CF352D86D952A@BYAPR11MB3479.namprd11.prod.outlook.com>
 <20230606101811.519cace0@maurocar-mobl2>
In-Reply-To: <20230606101811.519cace0@maurocar-mobl2>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v5 i-g-t 0/8] Introduce KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Sent: wtorek, 6 czerwca 2023 10:18
> To: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>; igt-
> dev@lists.freedesktop.org
> Subject: Re: [PATCH v5 i-g-t 0/8] Introduce KUnit
>=20
> On Tue, 6 Jun 2023 07:54:56 +0000
> "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com> wrote:
>=20
> > Hi Janusz,
> >
> > > -----Original Message-----
> > > From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > Sent: wtorek, 6 czerwca 2023 09:47
> > > To: igt-dev@lists.freedesktop.org; Piatkowski, Dominik Karol
> > > <dominik.karol.piatkowski@intel.com>; Mauro Carvalho Chehab
> > > <mauro.chehab@linux.intel.com>
> > > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > Subject: Re: [PATCH v5 i-g-t 0/8] Introduce KUnit
> > >
> > > On Monday, 5 June 2023 12:47:08 CEST Dominik Karol Piatkowski wrote:
> > > > This series is a continuation of Isabella's work on introducing
> > > > KUnit to IGT.
> > > >
> > > > Sample drm_buddy output:
> > > > 	Starting subtest: all-tests
> > > > 	[thread:8003] TAP version 1
> > > > 	[thread:8003] Executing 6 tests in: drm_buddy
> > > > 	Starting dynamic subtest: drm_buddy__drm_test_buddy_alloc_limit
> > > > 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_limit:
> > > SUCCESS (0.000s)
> > > > 	Starting dynamic subtest:
> > > drm_buddy__drm_test_buddy_alloc_range
> > > > 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_range:
> > > SUCCESS (0.000s)
> > > > 	Starting dynamic subtest:
> > > drm_buddy__drm_test_buddy_alloc_optimistic
> > > > 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_optimistic:
> > > SUCCESS (0.000s)
> > > > 	Starting dynamic subtest:
> > > drm_buddy__drm_test_buddy_alloc_pessimistic
> > > > 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_pessimistic:
> > > SUCCESS (0.000s)
> > > > 	Starting dynamic subtest:
> > > drm_buddy__drm_test_buddy_alloc_smoke
> > > > 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_smoke:
> > > SUCCESS (0.000s)
> > > > 	Starting dynamic subtest:
> > > drm_buddy__drm_test_buddy_alloc_pathological
> > > > 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_pathological:
> > > SUCCESS (0.000s)
> > > > 	Starting dynamic subtest: drm_buddy
> > > > 	Dynamic subtest drm_buddy: SUCCESS (0.000s)
> > > > 	Subtest all-tests: SUCCESS (0.707s)
> > >
> > > It would be nice if we could see CI results from the new kunit
> > > subtests before accepting the series.  Unfortunately, none of the
> > > tests seems to have been executed within the pre-merge run.  Can we
> fix that?
> >
> > AFAIK, Kconfig used by CI does not have required params set
> (CONFIG_KUNIT and CONFIG_DRM_I915_KUNIT_SELFTESTS). I submitted a
> merge request to enable these params, but it was not merged yet. The best
> option I can think of right now, is a trybot run tested with Kconfig patc=
h
> enabling these params. Would that be ok with you?
>=20
> Where is such merge request? Let's review/merge it first. Then, re-trigge=
r
> the test.

Hi,

The merge request is here:
gitlab.freedesktop.org/gfx-ci/i915-infra/-/merge_requests/122

Thanks,
Dominik Karol

>=20
> Regards,
> Mauro

