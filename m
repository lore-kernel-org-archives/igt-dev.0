Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7942D10E51A
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 08:41:46 +0000 (UTC)
Date: Fri, 25 Feb 2022 10:42:08 +0200
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <20220225084208.GE29898@intel.com>
References: <20220225050853.8349-1-jeevan.b@intel.com>
 <20220225050853.8349-8-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225050853.8349-8-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 07/10] igt/tests: Add support for
 Tile4(TileF) format to tests/kms_plane_lowres
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com,
 petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 25, 2022 at 10:38:50AM +0530, Jeevan B wrote:
> Adding subtest to test new tiling format.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> ---
>  tests/kms_plane_lowres.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> index 6c0fce86..3f3f77c8 100644
> --- a/tests/kms_plane_lowres.c
> +++ b/tests/kms_plane_lowres.c
> @@ -314,6 +314,9 @@ igt_main
>  			     "high and low resolution with yf-tiling.");
>  		igt_subtest_f("pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
>  			test_planes_on_pipe(&data, I915_FORMAT_MOD_Yf_TILED);
> +
> +		igt_subtest_f("pipe-%s-tiling-4", kmstest_pipe_name(pipe))
> +			test_planes_on_pipe(&data, I915_FORMAT_MOD_4_TILED);
>  	}
>  
>  	igt_fixture {
> -- 
> 2.17.1
> 
