Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6491D10E615
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 07:18:32 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Latvala, Petri" <petri.latvala@intel.com>
Date: Mon, 28 Mar 2022 07:18:27 +0000
Message-ID: <fb6518b872e7474bbf05a11b58dbd0fa@intel.com>
References: <20220328064722.127301-1-riana.tauro@intel.com>
 <20220328064722.127301-3-riana.tauro@intel.com>
In-Reply-To: <20220328064722.127301-3-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/intel-ci/fast-feedback: Add
 system-suspend-without-i915 subtest into fast-feedback list
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
> Sent: Monday, March 28, 2022 12:17 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Ewins, Jon <jon.ewins@intel.com>; Dixit,
> Ashutosh <ashutosh.dixit@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel-ci/fast-feedback: Add system-suspe=
nd-
> without-i915 subtest into fast-feedback list
>=20
> From: "Tauro, Riana" <riana.tauro@intel.com>
>=20
> Add system-suspend-without-i915 subtest to CI fast-feedback test list.
>=20
> v2 : Addressing review comments
>=20
> Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
Looks good to me.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
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
Hi Petri,
Could you please provide Ack to add above test to BAT list.
This will test Suspend/Resume without i915 module to filter out system leve=
l issue
with Suspend/Resume.
Thanks,
Anshuman Gupta.
>=20
>  # Kernel selftests
>  igt@i915_selftest@live
> --
> 2.25.1
