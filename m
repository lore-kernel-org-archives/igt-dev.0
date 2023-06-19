Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0937210E1D0
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 10:17:50 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
Date: Mon, 19 Jun 2023 10:17:45 +0000
Message-ID: <BYAPR11MB341327BF1A61C44682E6710CD05FA@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <20230619095324.3931861-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230619095324.3931861-1-mauro.chehab@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe/xe_spin_batch: fix test
 documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Chauhan, Aditya" <aditya.chauhan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM=20
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

> -----Original Message-----
> From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Sent: Monday, June 19, 2023 3:23 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Chauhan, Aditya
> <aditya.chauhan@intel.com>
> Subject: [PATCH i-g-t] tests/xe/xe_spin_batch: fix test documentation
>=20
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>=20
> The test documentation is wrong:
> - it should have just one TEST: tag with the contents of the
>   test file;
> - it is missing Category, Sub-category, Functionality and
>   Test category fields. Those are needed for proper grafana
>   functionality mapping.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/xe/xe_spin_batch.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>=20
> diff --git a/tests/xe/xe_spin_batch.c b/tests/xe/xe_spin_batch.c index
> bc13bddddf73..29a837251058 100644
> --- a/tests/xe/xe_spin_batch.c
> +++ b/tests/xe/xe_spin_batch.c
> @@ -4,15 +4,20 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>=20
> +/**
> + * TEST: Tests for spin batch submissons.
> + * Category: Software building block
> + * Sub-category: spin
> + * Functionality: intel-bb
> + * Test category: functionality test
> + */
> +
>  #define MAX_INSTANCE 9
>=20
>  /**
> - * TEST: Basic test for spin batch submissons.
> - *
>   * SUBTEST: spin-basic
>   * Description: Basic test to submit spin batch submissons on copy engin=
e.
>   * Run type: FULL
> - *
>   */
>=20
>  static void spin_basic(int fd)
> @@ -28,12 +33,9 @@ static void spin_basic(int fd)  }
>=20
>  /**
> - * TEST:Test for spin batch submissons.
> - *
>   * SUBTEST: spin-batch
>   * Description: Create vm and engine of hwe class and run the spinner on=
 it.
>   * Run type: FULL
> - *
>   */
>=20
>  static void spin(int fd, struct drm_xe_engine_class_instance *hwe) @@ -5=
7,12
> +59,9 @@ static void spin(int fd, struct drm_xe_engine_class_instance *hw=
e)  }
>=20
>  /**
> - * TEST: Basic test for spin batch submission on all hwe.
> - *
>   * SUBTEST: spin-basic-all
>   * Description: Basic test which validates the functionality of spinner =
on all hwe.
>   * Run type: FULL
> - *
>   */
>  static void spin_basic_all(int fd)
>  {
> @@ -91,11 +90,9 @@ static void spin_basic_all(int fd)  }
>=20
>  /**
> - * TEST: Test for spin batch submissions.
>   * SUBTEST: spin-all
>   * Description: Spinner test to run on all the engines!
>   * Run type: FULL
> - *
>   */
>=20
>  static void spin_all(int fd, int gt, int class)
> --
> 2.40.1


