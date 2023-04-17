Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CFA10E158
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Apr 2023 05:03:20 +0000 (UTC)
Message-ID: <63eef62d-390f-4110-0e06-407437992c45@intel.com>
Date: Mon, 17 Apr 2023 10:33:08 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230413162732.1155058-1-bhanuprakash.modem@intel.com>
 <20230413162732.1155058-5-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230413162732.1155058-5-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 4/7] tests/kms_cursor_legacy: Add XE support
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


On 4/13/2023 9:57 PM, Bhanuprakash Modem wrote:
> Add XE driver support for kms tests.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_cursor_legacy.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 5f430090815..cd247cf0088 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -308,7 +308,7 @@ enum flip_test {
>   static bool cursor_slowpath(igt_display_t *display, enum flip_test mode)
>   {
>   	/* Intel display 9 and newer will handle cursor movement as fastsets */
> -	if (is_i915_device(display->drm_fd) &&
> +	if (is_intel_device(display->drm_fd) &&
>   	    intel_display_ver(intel_get_drm_devid(display->drm_fd)) >= 9)
>   	    return true;
>   
> @@ -1708,6 +1708,7 @@ igt_main
>   	igt_describe("this test perform a busy bo update followed by a cursor update");
>   	igt_subtest_group {
>   		igt_fixture {
> +			igt_require_i915(display.drm_fd);

Hi,

Could you please remove the 'igt_require_intel' check inside 
'flip_vs_cursor_busy_crc', as with the above check that is redundant.

With this removed, the patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Thanks,
Karthik.B.S
>   			igt_require_pipe_crc(display.drm_fd);
>   			igt_display_require_output(&display);
>   		}
