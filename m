Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D88A10EDA2
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Mar 2022 09:10:52 +0000 (UTC)
Date: Thu, 3 Mar 2022 10:05:07 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <20220303090507.grenwdro7u4fzmoe@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gjbp5kld2r3vrbfj"
Content-Disposition: inline
Subject: [igt-dev] Mandatory Test Suite for KMS Drivers?
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


--gjbp5kld2r3vrbfj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Back at XDC we floated the idea of creating a test suite for IGT that we
expect any KMS driver to pass, similar to what v4l2-compliance and
cec-compliance provide for v4l2 and CEC respectively.

I was looking at the list of tests, and it's fairly massive, so it's not
clear to me what tests we could start this suite with. I can only assume
all the KMS (but the chamelium ones) and fbdev related ones would be a
good start?

What do you think?
Maxime

--gjbp5kld2r3vrbfj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYiCEwwAKCRDj7w1vZxhR
xYEPAP4wWX/UvJPJGzZxQArnd78Hzt17r5fwycxoIW4ED+mWdgD/R1LIodCabRyO
+6j6QSNqtNS3m5ahq9W2890Dq7WoxAE=
=wmlu
-----END PGP SIGNATURE-----

--gjbp5kld2r3vrbfj--
