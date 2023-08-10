Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E28C10E500
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 11:08:59 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 10 Aug 2023 11:08:41 +0000
Message-ID: <DM4PR11MB631271446EB6C883EF1B1B0B9013A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-77-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-77-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 76/81] tests/kms_universal_plane: Document
 each subtest for testplan
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


> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Thursday, June 29, 2023 8:19 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [V5 i-g-t 76/81] tests/kms_universal_plane: Document e=
ach
> subtest for testplan
>=20
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_universal_plane.c | 67 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>=20
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c in=
dex
> 957d600f1..358b7ae18 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -28,6 +28,73 @@
>  #include <string.h>
>  #include <fcntl.h>
>=20
> +/**
> + * TEST: kms universal plane
> + * Category: Display
> + *
> + * SUBTEST: cursor-fb-leak-pipe-%s
> + * Description: Check for cursor leaks after performing cursor
> +operations
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: disable-primary-vs-flip-pipe-%s
> + * Description: Check pageflips while primary plane is disabled before I=
OCTL or
> + *              between IOCTL and pageflip execution
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: universal-plane-pageflip-windowed-pipe-%s
> + * Description: Check if pageflip succeeds in windowed setting
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @A:
> + * @B:
> + * @C:
> + * @D:
> + * @E:
> + * @F:
> + * @G:
> + * @H:
> + */
> +
Other subtest details missing.=20
> +/**
> + * SUBTEST: universal-plane-pipe-%s-%s
> + * Description: Check %arg[1]
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @A:
> + * @B:
> + * @C:
> + * @D:
> + * @E:
> + * @F:
> + * @G:
> + * @H:
> + *
> + * arg[2]:
> + *
> + * @functional: the switching between different primary plane fbs with C=
RTC
> off
> + * @sanity:     for scale-up or scale-down using universal plane API wit=
hout
> + *              covering CRTC
> + */
>=20
>  typedef struct {
>  	int drm_fd;
> --
> 2.40.0
