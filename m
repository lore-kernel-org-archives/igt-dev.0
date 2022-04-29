Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE8810FC92
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 10:58:56 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Latvala, Petri" <petri.latvala@intel.com>
Date: Fri, 29 Apr 2022 10:58:55 +0000
Message-ID: <f002bbaa0dfa44faac020885b8dc6ceb@intel.com>
References: <20220425132804.1142619-1-riana.tauro@intel.com>
 <20220429095436.2203529-1-riana.tauro@intel.com>
In-Reply-To: <20220429095436.2203529-1-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/2] tests/intel-ci/fast-feedback:
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
> Sent: Friday, April 29, 2022 3:25 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t v3 2/2] tests/intel-ci/fast-feedback: Add suspend t=
ests
> without i915 to fast-feedback list
>=20
> From: "Tauro, Riana" <riana.tauro@intel.com>
>=20
> Add basic-s2idle-without-i915 and basic-s3-without-i915 to fast-feedback =
list.
>=20
> v2: rebase
> v3: rebase
>=20
> Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
> ---
>  tests/intel-ci/fast-feedback.testlist | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-
> feedback.testlist
> index d075aa31..b579c20a 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -176,7 +176,8 @@ igt@i915_selftest@live  igt@dmabuf@all
>=20
>  # System wide suspend tests
> -igt@i915_suspend@system-suspend-without-i915
> +igt@i915_suspend@basic-s2idle-without-i915
> +igt@i915_suspend@basic-s3-without-i915
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Hi Petri,
Is it ok to add extension of this test to fast feedback list.
Thanks,
Anshuman Gupta.
>  igt@gem_exec_suspend@basic-s0
>  igt@gem_exec_suspend@basic-s3
>  igt@kms_chamelium@common-hpd-after-suspend
> --
> 2.25.1
