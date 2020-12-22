Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37EC6E215
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Dec 2020 10:47:14 +0000 (UTC)
From: "Patnana, Venkata Sai" <venkata.sai.patnana@intel.com>
Date: Tue, 22 Dec 2020 10:47:10 +0000
Message-ID: <DM6PR11MB4594229EB11B98245497E8EDB3DF0@DM6PR11MB4594.namprd11.prod.outlook.com>
References: <20201221202753.2552621-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20201221202753.2552621-1-arundhati.hagaragi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_cursor_edge_walk:Add
 subtest description
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hagaragi, Arundhati" <arundhati.hagaragi@intel.com>
Cc: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Change looks good to me.
Reviewed-by: Patnana Venkata Sai <Venkata.Sai.Patnana@intel.com>

Thanks
Sai

> -----Original Message-----
> From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
> Sent: Tuesday, December 22, 2020 1:58 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Gupta, Nidhi1
> <nidhi1.gupta@intel.com>; Patnana, Venkata Sai
> <venkata.sai.patnana@intel.com>; Hagaragi, Arundhati
> <arundhati.hagaragi@intel.com>; Gupta; B; S; B S, Karthik
> <karthik.b.s@intel.com>; Patnana
> Subject: [PATCH i-g-t v2] tests/kms_cursor_edge_walk:Add subtest description
> 
> Added description for all subtests
> 
> Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
> Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
> Cc: B S, Karthik <Karthik.B.S@intel.com>
> Cc: Patnana, Venkata Sai <Venkata.Sai.Patnana@intel.com>
> 
> v2: modified subtests description (Sai)
> ---
>  tests/kms_cursor_edge_walk.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index 32b8e711..69662afe 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -339,21 +339,25 @@ igt_main_args("", long_opts, help_str, opt_handler,
> &data)
>  				igt_fixture
>  					igt_require(data.curw <= max_curw
> && data.curh <= max_curh);
> 
> +				igt_describe("Checking cursor by walking left
> edge of screen");
>  				igt_subtest_f("pipe-%s-%dx%d-left-edge",
>  					kmstest_pipe_name(data.pipe),
>  					data.curw, data.curh)
>  					test_crtc(&data, EDGE_LEFT);
> 
> +				igt_describe("Checking cursor by walking right
> edge of screen");
>  				igt_subtest_f("pipe-%s-%dx%d-right-edge",
>  					kmstest_pipe_name(data.pipe),
>  					data.curw, data.curh)
>  					test_crtc(&data, EDGE_RIGHT);
> 
> +				igt_describe("Checking cursor by walking top
> edge of screen");
>  				igt_subtest_f("pipe-%s-%dx%d-top-edge",
>  					kmstest_pipe_name(data.pipe),
>  					data.curw, data.curh)
>  					test_crtc(&data, EDGE_TOP);
> 
> +				igt_describe("Checking cursor by walking
> bottom edge of screen");
>  				igt_subtest_f("pipe-%s-%dx%d-bottom-edge",
>  					kmstest_pipe_name(data.pipe),
>  					data.curw, data.curh)
> --
> 2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
