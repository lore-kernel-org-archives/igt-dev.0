Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304E110E2DD
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 06:14:15 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 16 Aug 2023 06:14:08 +0000
Message-ID: <DM4PR11MB631267921AD950F213CB12EF9015A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
 <20230811184655.157060-77-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-77-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V6 76/81] tests/kms_universal_plane: Document
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
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Saturday, August 12, 2023 12:17 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [i-g-t V6 76/81] tests/kms_universal_plane: Document each subtes=
t
> for testplan
>=20
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>=20
> V2: - Fix test description
>=20
> Cc: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Not all subtest details are added as mentioned in previous version.=20

> ---
>  tests/kms_universal_plane.c | 68
> +++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>=20
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 957d600f1..a23a0d8cd 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -28,6 +28,74 @@
>  #include <string.h>
>  #include <fcntl.h>
>=20
> +/**
> + * TEST: kms universal plane
> + * Category: Display
> + * Description: Check pageflip & modeset on universal plane
> + *
> + * SUBTEST: cursor-fb-leak-pipe-%s
> + * Description: Check for cursor leaks after performing cursor
> +operations on %arg[1]
> + * Driver requirement: any
> + * Functionality: cursor, plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: disable-primary-vs-flip-pipe-%s
> + * Description: Check pageflips while primary plane is disabled before I=
OCTL
> or
> + *              between IOCTL and pageflip execution on %arg[1]
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: universal-plane-pageflip-windowed-pipe-%s
> + * Description: Check if pageflip succeeds in windowed setting on
> +%arg[1]
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @A:    pipe A
> + * @B:    pipe B
> + * @C:    pipe C
> + * @D:    pipe D
> + * @E:    pipe E
> + * @F:    pipe F
> + * @G:    pipe G
> + * @H:    pipe H
> + */
> +
> +/**
> + * SUBTEST: universal-plane-pipe-%s-%s
> + * Description: Check %arg[2] on %arg[1]
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @A:    pipe A
> + * @B:    pipe B
> + * @C:    pipe C
> + * @D:    pipe D
> + * @E:    pipe E
> + * @F:    pipe F
> + * @G:    pipe G
> + * @H:    pipe H
> + *
> + * arg[2]:
> + *
> + * @functional: the switching between different primary plane fbs with
> CRTC off
> + * @sanity:     for scale-up or scale-down using universal plane API wit=
hout
> + *              covering CRTC
> + */
>=20
>  typedef struct {
>  	int drm_fd;
> --
> 2.40.0
