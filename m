Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE9810E309
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 14:51:33 +0000 (UTC)
Message-ID: <d8212e26-7b4e-b6d5-1881-8d7c68f8bfea@intel.com>
Date: Mon, 11 Sep 2023 20:21:05 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230908175039.1291593-1-swati2.sharma@intel.com>
 <20230908175039.1291593-5-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230908175039.1291593-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] tests/intel/kms_pm_dc: Use
 gem_has_lmem()
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

Hi Swati,

On Fri-08-09-2023 11:20 pm, Swati Sharma wrote:
> Instead of using i915_capabilities debugfs to know if platform
> is discrete or not, use gem_has_lmem for the same.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 13 +++----------
>   1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index b5779eaa5..cbb419e12 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -140,15 +140,6 @@ typedef struct {
>   static bool dc_state_wait_entry(int drm_fd, int dc_flag, int prev_dc_count);
>   static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
>   
> -static bool is_dgfx(data_t *data)
> -{
> -	char buf[4096];
> -
> -	igt_debugfs_simple_read(data->debugfs_fd, "i915_capabilities",
> -				buf, sizeof(buf));
> -	return strstr(buf, "is_dgfx: yes");
> -}
> -
>   static void setup_output(data_t *data)
>   {
>   	igt_display_t *display = &data->display;
> @@ -661,6 +652,7 @@ static void kms_poll_state_restore(int sig)
>   igt_main
>   {
>   	data_t data = {};
> +	bool is_dgfx;
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> @@ -742,7 +734,8 @@ igt_main
>   
>   	igt_describe("This test validates display engine entry to DC9 state");
>   	igt_subtest("dc9-dpms") {
> -		if (!(is_dgfx(&data)))
> +		is_dgfx = gem_has_lmem(data.drm_fd);
> +		if (!is_dgfx)
>   			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),

Patch LGTM, but looks we don't even need of the variable "is_dgfx", 
instead you can adjust the igt_require_f().

If it's make sense, please fix the above comment.

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

>   				      "PC8+ residencies not supported\n");
>   		test_dc9_dpms(&data);
