Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4866110E5BB
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 08:29:47 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 31 Aug 2023 08:29:40 +0000
Message-ID: <DM4PR11MB63603AB6BE5A865D5B313F31F4E5A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230830153937.1215474-1-swati2.sharma@intel.com>
In-Reply-To: <20230830153937.1215474-1-swati2.sharma@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel-ci: add basic audio test to
 ffb
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati =
Sharma
> Sent: Wednesday, August 30, 2023 9:10 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/intel-ci: add basic audio test to =
ffb
>=20
> Add basic audio test to i915/XE fast feedback testlist.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

Please get the CI failure reported as expected on ATS-M.

Regards,
Uma Shankar
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel-ci/fast-feedback.testlist    | 1 +
>  tests/intel-ci/xe-fast-feedback.testlist | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-=
feedback.testlist
> index c09c6c417..841051058 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -110,6 +110,7 @@ igt@kms_force_connector_basic@force-edid
>  igt@kms_force_connector_basic@force-load-detect
>  igt@kms_force_connector_basic@prune-stale-modes
>  igt@kms_frontbuffer_tracking@basic
> +igt@kms_hdmi_inject@inject-audio
>  igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
>  igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
>  igt@kms_pipe_crc_basic@hang-read-crc
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe=
-fast-
> feedback.testlist
> index ef7ddff24..a395fa8c3 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -229,6 +229,7 @@ igt@kms_force_connector_basic@force-connector-state
>  igt@kms_force_connector_basic@force-edid
>  igt@kms_force_connector_basic@prune-stale-modes
>  igt@kms_frontbuffer_tracking@basic
> +igt@kms_hdmi_inject@inject-audio
>  igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
>  igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
>  igt@kms_pipe_crc_basic@hang-read-crc
> --
> 2.25.1
