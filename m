Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E8110E159
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 08:08:11 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 25 Apr 2022 08:08:10 +0000
Message-ID: <ff921e81dbb34b07b1d08344db76c598@intel.com>
References: <20220425074525.1124446-1-riana.tauro@intel.com>
 <20220425074525.1124446-2-riana.tauro@intel.com>
In-Reply-To: <20220425074525.1124446-2-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/i915/i915_suspend: Extend
 system-suspend-without-i915 to support suspend-to-idle
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Monday, April 25, 2022 1:15 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t 1/1] tests/i915/i915_suspend: Extend system-suspend=
-
> without-i915 to support suspend-to-idle
>=20
> From: "Tauro, Riana" <riana.tauro@intel.com>
>=20
> Extending the test system-suspend-without-i915 to run a suspend-to-idle c=
ycle
>=20
> Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
> ---
>  tests/i915/i915_suspend.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c index
> d34b7a5d..9a09f643 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -209,6 +209,7 @@ test_suspend_without_i915(void)
>  	igt_kmsg(KMSG_INFO "Unloading i915\n");
>  	igt_assert_eq(igt_i915_driver_unload(),0);
>=20
> +	igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE,
> +SUSPEND_TEST_NONE);
>  	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
Please create two separate sub test.
one for s3: SUSPEND_STATE_MEM
              s2idle:  SUSPEND_STATE_FREEZE

Thanks,
Anshuman Gupta.
>=20
>  	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
> --
> 2.25.1
