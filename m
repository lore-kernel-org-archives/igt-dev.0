Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1A410E18E
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Dec 2022 07:53:28 +0000 (UTC)
Message-ID: <a3ee5de8-5923-650c-f2c6-4bc2ba206c03@intel.com>
Date: Fri, 2 Dec 2022 08:53:24 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20221129220309.1472045-1-alex.hung@amd.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <20221129220309.1472045-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] tests/kms_plane: check before calling i915
 libraries
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



On 29.11.2022 23:03, Alex Hung wrote:
> for_each_memory_region calls functions in lib/i915/ and let's
> check is_i915_device first.
>
> Fixes: db2bdd3a (tests/kms_plane: skip memory demanding modes in test_plane_panning)
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   tests/kms_plane.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index fc530d2c..164dacf4 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -391,9 +391,12 @@ test_plane_panning(data_t *data, enum pipe pipe)
>   
>   	test_init(data, pipe);
>   
> -	for_each_memory_region(r, data->drm_fd)
> -		if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE)
> -			mem_size = r->cpu_size;
> +	if (is_i915_device(data->drm_fd)) {
> +		for_each_memory_region(r, data->drm_fd)
> +			if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE)
> +				mem_size = r->cpu_size;
> +
> +	}
>   
>   	for_each_connector_mode(output) {
>   		drmModeModeInfo *m = &output->config.connector->modes[j__];
