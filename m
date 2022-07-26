Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC96910F3A9
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 05:54:12 +0000 (UTC)
Date: Tue, 26 Jul 2022 08:52:45 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Rohith Iyer <quic_rohiiyer@quicinc.com>
Message-ID: <Yt+BLRqEpZR13L8k@platvala-desk.ger.corp.intel.com>
References: <20220713222235.11655-1-quic_rohiiyer@quicinc.com>
 <20220713222235.11655-3-quic_rohiiyer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713222235.11655-3-quic_rohiiyer@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1 2/3] tests/testdisplay: Use
 igt_parse_mode_string for command line arguments
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 03:22:34PM -0700, Rohith Iyer wrote:
> Use igt_parse_mode_string instead of sscanf to parse mode string from command line.
> 
> Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/testdisplay.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/tests/testdisplay.c b/tests/testdisplay.c
> index e9fbd260..4db182b4 100644
> --- a/tests/testdisplay.c
> +++ b/tests/testdisplay.c
> @@ -625,8 +625,6 @@ static const char *help_str =
>  
>  static int opt_handler(int opt, int opt_index, void *data)
>  {
> -	float force_clock;
> -
>  	switch (opt) {
>  	case '3':
>  		test_stereo_modes = 1;
> @@ -642,12 +640,8 @@ static int opt_handler(int opt, int opt_index, void *data)
>  		break;
>  	case 'f':
>  		force_mode = 1;
> -		if (sscanf(optarg,"%f,%hu,%hu,%hu,%hu,%hu,%hu,%hu,%hu",
> -			   &force_clock,&force_timing.hdisplay, &force_timing.hsync_start,&force_timing.hsync_end,&force_timing.htotal,
> -			   &force_timing.vdisplay, &force_timing.vsync_start, &force_timing.vsync_end, &force_timing.vtotal)!= 9)
> +		if (!igt_parse_mode_string(optarg, &force_timing))
>  			return IGT_OPT_HANDLER_ERROR;
> -		force_timing.clock = force_clock*1000;
> -
>  		break;
>  	case 's':
>  		sleep_between_modes = atoi(optarg);
> -- 
> 2.31.0
> 
