Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 8 Mar 2022 10:26:24 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Message-ID: <20220308102624.1a757e36@eldfell>
In-Reply-To: <20220304144607.3pwfwhxf4zsckan7@houat>
References: <20220304144607.3pwfwhxf4zsckan7@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iCg=Yj0kdBgmLGBsNe3WJT=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [igt-dev] Writeback Assumptions for XRGB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tim Gover <tim.gover@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--Sig_/iCg=Yj0kdBgmLGBsNe3WJT=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Mar 2022 15:46:07 +0100
Maxime Ripard <maxime@cerno.tech> wrote:

> Indeed, while the input buffer uses 0xff for the X component, we'll get
> back 0x00 from the hardware, and thus the hashes are not identical. We
> can force the hardware to always set it to 0xff, but that doesn't seem
> right. It would make more sense to ignore the X component entirely in
> that case.

Hi,

I tried hard to send a slightly longer response, but gmail refuses to
deliver to anyone without explanation. So here's a summary of my opinion:

- KMS must ignore X channel contents on read
- IGT must ignore X channel contents when comparing results
- it would be nice if IGT filled image X channels with garbage to
  verify the first two points


Thanks,
pq

--Sig_/iCg=Yj0kdBgmLGBsNe3WJT=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmInEzAACgkQI1/ltBGq
qqcUcQ//UZAQSQNYXpLzSLqy5/Ap3IXCOzNmkT14SnHdO1VT3umGK6G4/4R+tJ/U
UBPB6atLZdf/5grpUxWX5fAGXLXMSqeInDaoBM/ooTR/xU61CTTmgTHyHNr6d4vK
xEoxw0D+CKCO8VDyyk2n1nnsD9893ghMcTptE0BvplAx/H4HgXqdy9IFLKdEHYGB
v6pcOoJyUf/bQMgtYCRHwB1fBlXLKpWWzrvlIar0EhCbZMF8LNZMjxWLD0gw3fbA
R/1WLY6ze0UCCtBvYqzIWGVEt8RHwtU1l8MC+WcbKZ7SBxZCj3yR03qCAsQjlS7I
1GVxAQjmqcn+p4ciqZX0lmaRptk3NdiUkPFHoHtgPAyb+d8fZ2ECUiEU0tu97CQ5
QPsFynig8Ka7fHq4xBiTb2Db3xj2rEPwT16EjkAze5Ql3fq0ycYVKJiSzhKdccMQ
mSOSH+MdqVLW36j6XHbA0doHHxdinNERg+7xwetl84h344TKkfJKYOxXOqbON5pj
nrABkqabmTGhO0GL/Fv/6lnKN64DtBt9DE0DBHThn8NtU1D/rN1GolPztdLvkqi9
onoXpQgEATC1psPlm8bnBzOhC66CGOi0+QeyEn8wepO2PLQN1rTS6tHgcj+yW17D
x7BlGGi0qnb3JX5MqpQ0P7jaI2wfndL1WfQysI8nk9wOY41hW4I=
=tdw1
-----END PGP SIGNATURE-----

--Sig_/iCg=Yj0kdBgmLGBsNe3WJT=--
