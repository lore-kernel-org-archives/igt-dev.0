Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CC210FB37
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 04:49:44 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 29 Apr 2022 04:49:43 +0000
Message-ID: <0472364634864daeb9991c087d2730d4@intel.com>
References: <20220425122147.1141783-3-riana.tauro@intel.com>
 <20220425132804.1142619-1-riana.tauro@intel.com>
In-Reply-To: <20220425132804.1142619-1-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/intel-ci/fast-feedback:
 Add suspend tests without i915 to fast-feedback list
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
> Sent: Monday, April 25, 2022 6:58 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t v2 2/2] tests/intel-ci/fast-feedback: Add suspend t=
ests
> without i915 to fast-feedback list
>=20
> From: "Tauro, Riana" <riana.tauro@intel.com>
>=20
> Add basic-s2idle-without-i915 and basic-s3-without-i915 to fast-feedback =
list.
>=20
> Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
> ---
>  tests/intel-ci/fast-feedback.testlist | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-
> feedback.testlist
> index f6329708..6c39df0c 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -174,7 +174,8 @@ igt@gem_lmem_swapping@parallel-random-engines
>  igt@gem_lmem_swapping@random-engines
>  igt@gem_lmem_swapping@verify-random
>  igt@i915_pm_rpm@module-reload
> -igt@i915_suspend@system-suspend-without-i915
> +igt@i915_suspend@basic-s2idle-without-i915
> +igt@i915_suspend@basic-s3-without-i915
Please rebase this patch.
Thanks,
Anshuman Gupta.
>=20
>  # Kernel selftests
>  igt@i915_selftest@live
> --
> 2.25.1
