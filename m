Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F84910E1A9
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 16:38:36 +0000 (UTC)
Message-ID: <861601d0-be84-c837-297b-c936cabc70b7@intel.com>
Date: Tue, 26 Sep 2023 22:08:16 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230918075411.247122-1-swati2.sharma@intel.com>
 <20230918075411.247122-3-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230918075411.247122-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] tests/kms_atomic: rename subtest
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


On Mon-18-09-2023 01:24 pm, Swati Sharma wrote:
> Follow IGT rules, to use '-' instead of '_' for subtest naming.

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_atomic.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 951014685..f984d34f0 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -1170,7 +1170,7 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
>   }
>   
>   /**
> - * SUBTEST: atomic_plane_damage
> + * SUBTEST: atomic-plane-damage
>    * Description: Simple test cases to use FB_DAMAGE_CLIPS plane property
>    * Driver requirement: i915, xe
>    * Functionality: kms_core, plane
> @@ -1550,7 +1550,7 @@ igt_main
>   	}
>   
>   	igt_describe("Simple test cases to use FB_DAMAGE_CLIPS plane property");
> -	igt_subtest("atomic_plane_damage") {
> +	igt_subtest("atomic-plane-damage") {
>   		igt_require(igt_plane_has_prop(primary, IGT_PLANE_FB_DAMAGE_CLIPS));
>   
>   		atomic_setup(&display, pipe, output, primary, &fb);
