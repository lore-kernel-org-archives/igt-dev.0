Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A459410E39D
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 10:26:37 +0000 (UTC)
Message-ID: <32a7249f-a61d-c3bf-d397-5eb38d0e1c65@intel.com>
Date: Tue, 26 Sep 2023 15:56:32 +0530
MIME-Version: 1.0
To: Nemesa Garg <nemesa.garg@intel.com>, igt-dev@lists.freedesktop.org
References: <20230922161302.440145-1-nemesa.garg@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230922161302.440145-1-nemesa.garg@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] tests/kms_rmfb: Add check for xe driver
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

Hi Nemesa,

Can you please add this test in fast-feedback and add as HAX patch,
to check CI results.

On 22-Sep-23 9:43 PM, Nemesa Garg wrote:
> As the xe check is missing the value of open_count
> variable is not incrementing and because of this
> during drm_close_driver operation based on open_count
> value mutex is acquired and there is a callback to
> lastclose function.
> 
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   lib/drmtest.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index e1da66c87..99b655680 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -649,7 +649,7 @@ int drm_open_driver(int chipset)
>   	 * starting a test and we install an exit handler to wait until
>   	 * idle before quitting.
>   	 */
> -	if (is_i915_device(fd)) {
> +	if (is_i915_device(fd) || is_xe_device(fd)) {
>   		if (__sync_fetch_and_add(&open_count, 1) == 0) {
>   			__cancel_work_at_exit(fd);
>   			at_exit_drm_fd = drm_reopen_driver(fd);
