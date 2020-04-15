Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Wed, 15 Apr 2020 12:06:18 +0200
From: Maxime Ripard <maxime@cerno.tech>
Message-ID: <20200415100618.dffhwxhctgarqleq@gilmour.lan>
References: <20191022005910.siuiwfikmr76qpg3@smtp.gmail.com>
 <20200415094649.2tgelyotjliao2dk@gilmour.lan>
 <0kwho152-gzRe09N-ECBh9KepTGX-b_MU8X-TtBnTdWAQP9o5ni7tOVqGn9LK2U2ormexeYvS8U1uVcBMY5Lv-Le4z0dnnMnRaSbb29xjqo=@emersion.fr>
MIME-Version: 1.0
In-Reply-To: <0kwho152-gzRe09N-ECBh9KepTGX-b_MU8X-TtBnTdWAQP9o5ni7tOVqGn9LK2U2ormexeYvS8U1uVcBMY5Lv-Le4z0dnnMnRaSbb29xjqo=@emersion.fr>
Subject: Re: [Intel-gfx] [PATCH v7 i-g-t 2/4] kms_writeback: Add initial
 writeback tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0126914759=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Simon Ser <contact@emersion.fr>
Cc: Brian Starkey <rodrigosiqueiramelo@gmail.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0126914759==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iqwghg2ae7xjnb5u"
Content-Disposition: inline


--iqwghg2ae7xjnb5u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 09:49:46AM +0000, Simon Ser wrote:
> > > +   igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR, (uint64_t)out_fence_ptr);
> >
> > On ARM (32bits), this cast creates a compilation error since the
> > pointer size isn't an uint64_t.
>
> Does casting to uintptr_t before uint64_t fix it?

It does yep. Casting to uintptr_t alone also works

Maxime

--iqwghg2ae7xjnb5u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpbcmQAKCRDj7w1vZxhR
xRltAQCsHwl0Opg1dnFbHzByfer2JWyYtCvM5aNFZxyjXiNCDQEAjfl2jJJBRsTA
pOEtKD/zOuO0xPadYxVUN15OL/v4JQc=
=dxUv
-----END PGP SIGNATURE-----

--iqwghg2ae7xjnb5u--

--===============0126914759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0126914759==--
