Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F184710EDDC
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 09:47:15 +0000 (UTC)
Message-ID: <565e98d4-5de9-af4d-ca7f-5800db335e73@intel.com>
Date: Fri, 21 Apr 2023 15:17:03 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
 <20230418164501.1687266-17-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230418164501.1687266-17-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 16/45] tests/i915/kms_cdclk: Add XE support
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

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 4/18/2023 10:14 PM, Bhanuprakash Modem wrote:
> Add XE driver support for kms tests.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/kms_cdclk.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
> index bb0036802..0f9b8dc58 100644
> --- a/tests/i915/kms_cdclk.c
> +++ b/tests/i915/kms_cdclk.c
> @@ -65,6 +65,9 @@ static int get_current_cdclk_freq(int debugfs_fd)
>   	 * Display specific clock frequency info is moved to i915_cdclk_info,
>   	 * On older kernels if this debugfs is not found, fallback to read from
>   	 * i915_frequency_info.
> +	 *
> +	 * FIXME: As of now, XE debugfs is still using i915 namespace, once the
> +	 * Kernel changes are landed, update this to use the XE specific debugfs.
>   	 */
>   	res = igt_debugfs_simple_read(debugfs_fd, "i915_cdclk_info",
>   				      buf, sizeof(buf));
> @@ -368,7 +371,7 @@ igt_main
>   	data_t data = {};
>   
>   	igt_fixture {
> -		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		igt_require(data.drm_fd >= 0);
>   		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
>   		igt_require(data.debugfs_fd);
