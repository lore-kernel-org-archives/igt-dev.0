Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: dri-devel@lists.freedesktop.org, Maira Canal <mairacanal@riseup.net>
Date: Fri, 15 Sep 2023 16:17:46 +0200
Message-ID: <3244709.oiGErgHkdL@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <4fb393ff-3b2a-369a-5e9f-f96d802b2d87@riseup.net>
References: <20230911130323.7037-2-janusz.krzysztofik@linux.intel.com>
 <4fb393ff-3b2a-369a-5e9f-f96d802b2d87@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Subject: Re: [igt-dev] [PATCH] drm/tests: Fix incorrect argument in
 drm_test_mm_insert_range
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, igt-dev@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, intel-xe@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ma=EDra,

Thanks for review.

On Friday, 15 September 2023 16:01:31 CEST Maira Canal wrote:
> Hi,
>=20
> On 9/11/23 10:03, Janusz Krzysztofik wrote:
> > While drm_mm test was converted form igt selftest to kunit, unexpected
> > value of "end" argument equal "start" was introduced to one of calls to=
 a
> > function that executes the drm_test_mm_insert_range for specific start/=
end
> > pair of arguments.  As a consequence, DRM_MM_BUG_ON(end <=3D start) is
> > triggered.  Fix it by restoring the original value.
> >=20
> > Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>=20
> Reviewed-by: Ma=EDra Canal <mairacanal@riseup.net>
>=20
> Do you need me to push it to drm-misc-fixes?

Yes, please do if you can.

Thanks,
Janusz

>=20
> Best Regards,
> - Ma=EDra
>=20
> > Cc: "Ma=EDra Canal" <mairacanal@riseup.net>
> > Cc: Arthur Grillo <arthurgrillo@riseup.net>
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: Daniel Latypov <dlatypov@google.com>
> > Cc: stable@vger.kernel.org # v6.1+
> > ---
> >   drivers/gpu/drm/tests/drm_mm_test.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/test=
s/drm_mm_test.c
> > index 186b28dc70380..05d5e7af6d250 100644
> > --- a/drivers/gpu/drm/tests/drm_mm_test.c
> > +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> > @@ -939,7 +939,7 @@ static void drm_test_mm_insert_range(struct kunit *=
test)
> >   		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, si=
ze, 0, max - 1));
> >   		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, si=
ze, 0, max / 2));
> >   		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, si=
ze,
> > -								    max / 2, max / 2));
> > +								    max / 2, max));
> >   		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, si=
ze,
> >   								    max / 4 + 1, 3 * max / 4 - 1));
> >  =20
>=20



