Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3E26E843
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Aug 2021 15:37:12 +0000 (UTC)
Date: Wed, 18 Aug 2021 18:36:37 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YR0pBbw64UfIdvUq@platvala-desk.ger.corp.intel.com>
References: <20210818145614.1093522-1-Rodrigo.Siqueira@amd.com>
 <20210818145614.1093522-5-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818145614.1093522-5-Rodrigo.Siqueira@amd.com>
Subject: Re: [igt-dev] [PATCH 4/4] test/kms_atomic: Skip plane overlay test
 for amdgpu
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: igt-dev@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>, Nicholas Choi <Nicholas.Choi@amd.com>, Sean Paul <seanpaul@chromium.org>, Mark Yacoub <markyacoub@chromium.org>, Melissa Wen <melissa.srw@gmail.com>, Arkadiusz Hiler <arek@hiler.eu>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 18, 2021 at 10:56:14AM -0400, Rodrigo Siqueira wrote:
> Currently, amdgpu does not support an overlay strategy. As a result,
> plane_overlay fails on amdgpu; since this is a driver limitation, this
> commit skips the overlay test for amdgpu.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Nicholas Choi <Nicholas.Choi@amd.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>  tests/kms_atomic.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 1e1bee4d..e460ba35 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -501,6 +501,13 @@ static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *p
>  	uint32_t w = mode->hdisplay / 2;
>  	uint32_t h = mode->vdisplay / 2;
>  
> +	/* On AMD, with hardware cursor, overlay plane must fully cover
> +	 * the primary plane (underlay). AMD does not support this test
> +	 * scenario
> +	 */
> +	if (is_amdgpu_device(output->display->drm_fd))
> +		igt_require(0);
> +

A skip result with a message of "requirement not met: 0" requires
special magic to understand without reading the code.

How about

igt_require_f(!is_amdgpu_device(output->display->drm_fd),
              "Overlay must fully cover the primary plane on AMD\n");



-- 
Petri Latvala
