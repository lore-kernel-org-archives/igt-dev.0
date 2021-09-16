Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D56F6ECCF
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 11:22:03 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
Date: Thu, 16 Sep 2021 11:21:59 +0000
Message-ID: <f96eaa5827e943ce98db08476e9e8e59@intel.com>
References: <20210907191752.11262-1-jeevan.b@intel.com>
In-Reply-To: <20210907191752.11262-1-jeevan.b@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] Change igt log level from warn to info
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
> Sent: Wednesday, September 8, 2021 12:48 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH] Change igt log level from warn to info

Please prefix with the test fixed. Also since it's not done universally so =
in current form
the header is not right. Just say that "Drop log level for preventively unl=
oading snd driver"

> change igt_warn to igt_info when unloading the snd module before unbindin=
g i915
> until WA is fixed.

Try to give the reasoning as well as to why you are doing it.

Regards,
Uma Shankar
>=20
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
