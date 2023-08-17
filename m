Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A6D10E183
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 06:40:48 +0000 (UTC)
Date: Thu, 17 Aug 2023 08:32:15 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Alex Hung <alex.hung@amd.com>
Message-ID: <5zt2ctyod27qaw7sld4ejvvemgxm6chh4dtf7cnjiil2rizksm@bfiezcb3zo3q>
References: <20230816205316.867195-1-alex.hung@amd.com>
 <20230816205316.867195-3-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zldbs75ns6ptuqjj"
Content-Disposition: inline
In-Reply-To: <20230816205316.867195-3-alex.hung@amd.com>
Subject: Re: [igt-dev] [PATCH 3/3] tests/kms_writeback: support
 DRM_FORMAT_XRGB2101010 for writeback
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, brian.starkey@arm.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--zldbs75ns6ptuqjj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Aug 16, 2023 at 02:53:16PM -0600, Alex Hung wrote:
> Allow kms_writeback to run with DRM_FORMAT_XRGB8888 if supported
> or to try DRM_FORMAT_XRGB2101010 if DRM_FORMAT_XRGB8888 is not
> available.

XRGB8888 is always supposed to be available, if it's not, it's a driver
issue. Which means that XRGB2101010 will never actually be tested.

I think we should make a proper test for that format, instead of a
(silent) fallback?

Maxime

--zldbs75ns6ptuqjj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZN2+7wAKCRDj7w1vZxhR
xUNFAQCwFjPDsKHn8mo/ZeOVwtGmBQzbkqZmZfuQJf8/NedIPwD7BSJhqVz1gQeE
SdtkvPaLvMS1EK0Wcsss9j4Z4MaCvAo=
=SNy9
-----END PGP SIGNATURE-----

--zldbs75ns6ptuqjj--
