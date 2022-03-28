Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388DE10EB3A
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 05:52:33 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 28 Mar 2022 05:52:27 +0000
Message-ID: <3ca349db65714618a5a82f5a75095f1f@intel.com>
References: <20220328051727.119142-1-riana.tauro@intel.com>
 <20220328051727.119142-4-riana.tauro@intel.com>
In-Reply-To: <20220328051727.119142-4-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/intel-ci/fast-feedback: Add
 system-suspend-without-i915 into fast-feedback list
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
> Sent: Monday, March 28, 2022 10:47 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Ewins, Jon <jon.ewins@intel.com>; Dixit,
> Ashutosh <ashutosh.dixit@intel.com>
> Subject: [PATCH i-g-t 3/3] tests/intel-ci/fast-feedback: Add system-suspe=
nd-
> without-i915 into fast-feedback list
>=20
> From: "Tauro, Riana" <riana.tauro@intel.com>
>=20
> Add system-suspend-without-i915 tests to CI fast-feedback test list.
*subtest
>=20
> Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
> ---
>  tests/intel-ci/fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-
> feedback.testlist
> index 5c867bbf..c1014558 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -174,6 +174,7 @@ igt@core_hotunplug@unbind-rebind
> igt@vgem_basic@unload  igt@i915_module_load@reload
> igt@i915_pm_rpm@module-reload
> +igt@i915_suspend@system-suspend-without-i915
>=20
>  # Kernel selftests
>  igt@i915_selftest@live
> --
> 2.25.1
