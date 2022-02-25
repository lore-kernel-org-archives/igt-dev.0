Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28B210E51A
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 08:41:09 +0000 (UTC)
Date: Fri, 25 Feb 2022 10:41:31 +0200
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <20220225084131.GD29898@intel.com>
References: <20220225050853.8349-1-jeevan.b@intel.com>
 <20220225050853.8349-7-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225050853.8349-7-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 06/10] igt/tests: Add support for
 Tile4(TileF) format to tests/kms_plane_multiple
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

On Fri, Feb 25, 2022 at 10:38:49AM +0530, Jeevan B wrote:
> Adding subtest to test new tiling format.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> ---
>  tests/kms_plane_multiple.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index ebadc14b..1679f7ce 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -398,6 +398,9 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>  	igt_subtest_f("atomic-pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
>  		test_plane_position(data, pipe, I915_FORMAT_MOD_Yf_TILED);
>  
> +	igt_subtest_f("atomic-pipe-%s-tiling-4", kmstest_pipe_name(pipe))
> +		test_plane_position(data, pipe, I915_FORMAT_MOD_4_TILED);
> +
>  	igt_subtest_f("atomic-pipe-%s-tiling-none", kmstest_pipe_name(pipe))
>  		test_plane_position(data, pipe, DRM_FORMAT_MOD_LINEAR);
>  }
> -- 
> 2.17.1
> 
