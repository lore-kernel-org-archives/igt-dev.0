Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FE710E0A4
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 10:09:56 +0000 (UTC)
Message-ID: <76d19c8a-2df3-d8d9-ac97-c5fa1d3e6de6@intel.com>
Date: Fri, 21 Apr 2023 15:39:43 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
 <20230418164501.1687266-36-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230418164501.1687266-36-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 35/45] tests/kms_hdr: Add XE support
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
>   tests/kms_hdr.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 23f12c14a..81a32dbf8 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -226,7 +226,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   			if (igt_pipe_connector_valid(pipe, output)) {
>   				prepare_test(data, output, pipe);
>   
> -				if (is_i915_device(data->fd) &&
> +				if (is_intel_device(data->fd) &&
>   				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
>   					test_fini(data);
>   					break;
> @@ -503,7 +503,7 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
>   
>   	/* Change the mastering information, no modeset allowed
> -	 * for amd driver, whereas a modeset is required for i915
> +	 * for amd driver, whereas a modeset is required for intel
>   	 * driver. */
>   	hdr.hdmi_metadata_type1.max_display_mastering_luminance = 200;
>   	hdr.hdmi_metadata_type1.max_fall = 200;
> @@ -517,7 +517,7 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
>   
>   	/* Enter SDR via metadata, no modeset allowed for
>   	 * amd driver, whereas a modeset is required for
> -	 * i915 driver. */
> +	 * intel driver. */
>   	fill_hdr_output_metadata_sdr(&hdr);
>   	set_hdr_output_metadata(data, &hdr);
>   	if (is_amdgpu_device(data->fd))
> @@ -590,7 +590,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>   			if (igt_pipe_connector_valid(pipe, output)) {
>   				prepare_test(data, output, pipe);
>   
> -				if (is_i915_device(data->fd) &&
> +				if (is_intel_device(data->fd) &&
>   				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
>   					test_fini(data);
>   					break;
