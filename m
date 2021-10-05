Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9D26E2D1
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 04:59:38 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
Date: Tue, 5 Oct 2021 04:59:35 +0000
Message-ID: <31a014d2d2c94969bbf65db929e05269@intel.com>
References: <20210923064526.18615-1-jeevan.b@intel.com>
In-Reply-To: <20210923064526.18615-1-jeevan.b@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/core_hotunplug: Drop log level
 for preventively unloading snd driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Thursday, September 23, 2021 12:15 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] tests/core_hotunplug: Drop log level for preventiv=
ely
> unloading snd driver
>=20
> change igt_warn to igt_info when unloading the snd module before unbindin=
g i915
> until WA is fixed. As this "todo reminder" is flagged as BAT failure and =
showing up in
> all sorts of top-bugs lists for various platforms.

Seems ok to clear the BAT noise, till the proper fix is done in audio drive=
r.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

Note: Since this is a v2, you should add this and what changed in this vers=
ion.

> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/core_hotunplug.c | 2 +-
>  tests/device_reset.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c index
> 2d73e27f..b3661668 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -164,7 +164,7 @@ static void driver_unbind(struct hotunplug *priv, con=
st char
> *prefix,
>  			igt_lsof("/dev/snd");
>  			igt_skip("Audio is in use, skipping\n");
>  		} else {
> -			igt_warn("Preventively unloaded snd_hda_intel\n");
> +			igt_info("Preventively unloaded snd_hda_intel\n");
>  		}
>  	}
>=20
> diff --git a/tests/device_reset.c b/tests/device_reset.c index e6a468e6..=
982ba5ef
> 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -201,7 +201,7 @@ static void driver_unbind(struct device_fds *dev)
>  			igt_lsof("/dev/snd");
>  			igt_skip("Audio is in use, skipping\n");
>  		} else {
> -			igt_warn("Preventively unloaded snd_hda_intel\n");
> +			igt_info("Preventively unloaded snd_hda_intel\n");
>  		}
>  	}
>=20
> --
> 2.19.1
