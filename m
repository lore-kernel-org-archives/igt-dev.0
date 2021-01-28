Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F00B6E193
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jan 2021 12:24:51 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Thu, 28 Jan 2021 12:24:45 +0000
Message-ID: <SN6PR11MB3327AC4E41AEC126ABEDB41E8DBA9@SN6PR11MB3327.namprd11.prod.outlook.com>
References: <20210117132630.557502-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210117132630.557502-1-arundhati.hagaragi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_vblank:Added subtest
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Arundhati Hagaragi
> Sent: Sunday, January 17, 2021 6:57 PM
> To: igt-dev@lists.freedesktop.org
> Cc: S@freedesktop.org; B@freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/kms_vblank:Added subtest
> description
> 
> Added description for all subtests
> 
> Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
> Cc: B S, Karthik <Karthik.B.S@intel.com>
> ---
>  tests/kms_vblank.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index b00ebec5..c71b8c24 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -438,6 +438,7 @@ static void run_subtests_for_pipe(data_t *data)
>  			if (m->flags & ~(f->valid | NOHANG))
>  				continue;
> 
> +			igt_describe("checks if test run with NOHANG flag set");
Still, it is not clear what this test does. It would be good to add some
info about the test.

Suggestion:
If there are multiple tests available & difficult to describe in generic
way, we can add a new member "desc" to the struct funcs and print.

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
> +	igt_describe("check if test reports INVALID error for garbage
> values");

We are trying with different invalid combinations not garbage values.
How about "Negative test for vblank request" ?

>  	igt_subtest("invalid")
>  		invalid_subtest(&data, fd);
> 
> +	igt_describe("check the IOCTL events works with given crtc id");

How about s/"IOCTL events"/"Vblank & Flip events"/r ?

>  	igt_subtest("crtc-id")
>  		crtc_id_subtest(&data, fd);
> 
> --
> 2.25.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
