Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F84D10E8EE
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 10:44:33 +0000 (UTC)
Message-ID: <c57d6323dcc6a5ff09dbe4e57c4dbe461224b9a4.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Date: Wed, 22 Mar 2023 12:44:28 +0200
In-Reply-To: <17274286-8b9b-4106-ca44-c76c17fc738a@intel.com>
References: <20230320143622.5166-1-swati2.sharma@intel.com>
 <4b8b5e1fd10fd32ab7f2196cb5b11129e849f3b9.camel@coelho.fi>
 <17274286-8b9b-4106-ca44-c76c17fc738a@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_plane_scaling: Fix
 out-of-bound array access
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

On Wed, 2023-03-22 at 15:52 +0530, Swati Sharma wrote:
>=20
> On 22-Mar-23 3:36 PM, Luca Coelho wrote:
> > On Mon, 2023-03-20 at 20:06 +0530, Swati Sharma wrote:
> > > With this fix we are solving 2 issues. Firstly, the
> > > planes_scaling_combo() tests were leaving one scaler assigned
> > > after running sub-test with two consecutive planes because
> > > one scaler was getting reused in the next run. So with this fix
> > > scaler is not reused since we won't have any common plane.
> > >=20
> > > Secondly, when k =3D=3D n_planes - 1, we were trying to access
> > > planes[n_planes], which led to array out of bounds error. So, with
> > > this fix, this issue is fixed too.
> > >=20
> > > v2: -fix condition if n_planes is not even (JP)
> > >=20
> > > Suggested-by: Luca Coelho <luciano.coelho@intel.com>
> > > Suggested-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > Reported-by: Luca Coelho <luciano.coelho@intel.com>
> > > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> > > ---
> > >   tests/kms_plane_scaling.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> > > index 3a6904afb..7feb45ca3 100644
> > > --- a/tests/kms_plane_scaling.c
> > > +++ b/tests/kms_plane_scaling.c
> > > @@ -744,7 +744,7 @@ test_planes_scaling_combo(data_t *d, int w1, int =
h1, int w2, int h2,
> > >   		igt_assert(0);
> > >   	}
> > >  =20
> > > -	for (int k =3D 0; k < display->pipes[pipe].n_planes; k++) {
> > > +	for (int k =3D 0; k < display->pipes[pipe].n_planes - 1; k +=3D 2) =
{
> > >   		igt_plane_t *p1, *p2;
> > >  =20
> > >   		p1 =3D &display->pipes[pipe].planes[k];
> >=20
> > What will happen if we have only 1 plane? Shouldn't the test be
> > skipped? It seems that the loop will just not run and the test result
> > will be pass?
> Right.
> Should we add igt_require(n_planes >=3D2)?
> With that if n_planes=3D1 test will SKIP.
>=20

Yes, that sounds reasonable.

--
Cheers,
Luca.
