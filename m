Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323626E1B1
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Feb 2021 14:12:46 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Thu, 11 Feb 2021 14:12:40 +0000
Message-ID: <SN6PR11MB3327848505FB1E8602ADECB88D8C9@SN6PR11MB3327.namprd11.prod.outlook.com>
References: <20210203191447.2894572-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210203191447.2894572-1-arundhati.hagaragi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_vblank:Added subtest
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Hagaragi, Arundhati" <arundhati.hagaragi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
> Sent: Thursday, February 4, 2021 12:45 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Hagaragi, Arundhati <arundhati.hagaragi@intel.com>; Modem; Modem,
> Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_vblank:Added subtest description
> 
> Added description for all subtests
> 
> Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
> Cc: Modem, Bhanuprakash <Bhanuprakash.Modem@intel.com>
> 
> v2: Modified description to be more specific. (Bhanu)
LGTM
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vblank.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 31b3f0a6..e561e41d 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -438,6 +438,7 @@ static void run_subtests_for_pipe(data_t *data)
>  			if (m->flags & ~(f->valid | NOHANG))
>  				continue;
> 
> +			igt_describe("Check if test run while hanging by
> introducing NOHANG flag");
>  			igt_subtest_f("pipe-%s-%s-%s",
>  				      kmstest_pipe_name(data->pipe),
>  				      f->name, m->name) {
> @@ -451,6 +452,7 @@ static void run_subtests_for_pipe(data_t *data)
>  			if (f->valid & NOHANG || m->flags & NOHANG)
>  				continue;
> 
> +			igt_describe("check if injected hang is working
> properly");
>  			igt_subtest_f("pipe-%s-%s-%s-hang",
>  				      kmstest_pipe_name(data->pipe),
>  				      f->name, m->name) {
> @@ -521,9 +523,11 @@ igt_main
>  		igt_display_require_output(&data.display);
>  	}
> 
> +	igt_describe("Negative test for vblank request");
>  	igt_subtest("invalid")
>  		invalid_subtest(&data, fd);
> 
> +	igt_describe("check the Vblank and flip events works with given crtc
> id");
>  	igt_subtest("crtc-id")
>  		crtc_id_subtest(&data, fd);
> 
> --
> 2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
