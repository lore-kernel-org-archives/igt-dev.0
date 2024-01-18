Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <761f6968-1f07-4d5b-a2dd-9482b44915df@intel.com>
Date: Thu, 18 Jan 2024 11:45:21 +0530
Subject: Re: [PATCH v5 2/3] lib/igt_kms: Correct the check for igt_require
References: <20240117141323.14994-3-mohammed.thasleem@intel.com>
 <20240117145308.26010-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240117145308.26010-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev.lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Message-ID: <20240118061521.31UKoKt5SOrMraHWDissd_v1BKftS0Z0NNFoOEGimto@z>


On 1/17/2024 8:23 PM, Mohammed Thasleem wrote:
> The function 'igt_debugfs_dir()' returns -1, if it fails and a non-negative
> fd otherwise. However in the function igt_get_max_dotclock() the condition
> to check the debugfs directory uses igt_require (dir), which fails even if
> the dir is 0.
> So correct the igt_require check for a valid igt_debugfs fd.
>
> v2: Correct the logic in igt_require.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   lib/igt_kms.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e4dea1a60..1b4d0d761 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6100,7 +6100,7 @@ int igt_get_max_dotclock(int fd)
>   	drmModeFreeResources(resources);
>   
>   	dir = igt_debugfs_dir(fd);
> -	igt_require(dir);
> +	igt_require(dir != -1);

Open() does return -1 in case of failure, with errorno set, so looks 
good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>   
>   	/*
>   	 * Display specific clock frequency info is moved to i915_cdclk_info,
