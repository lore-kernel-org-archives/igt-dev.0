Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E1710E66C
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 20:15:47 +0000 (UTC)
Message-ID: <1dc2450f-9e96-4b9b-af5d-eebb84c50aee@amd.com>
Date: Wed, 29 Nov 2023 15:15:39 -0500
Content-Language: en-US
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20231129080307.135383-1-jesse.zhang@amd.com>
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20231129080307.135383-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/amdgpu: fix secure bounce test
 issue
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jesse,

Which ASIC causes failure for this test for SDMA copy of secured buffer?

Thanks, Vitaly

On 2023-11-29 03:03, Jesse Zhang wrote:
> To the secure memory, the destination data(bo2) has been encrypted,
> after copying it via SDMA from bo to bo2.
> It cannot compare bo2 with the original data.
> Therefore, skip this memory check.
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Please, remove the empty line here and from other change also
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  tests/amdgpu/amd_security.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> index d1146a7ce..678270fdf 100644
> --- a/tests/amdgpu/amd_security.c
> +++ b/tests/amdgpu/amd_security.c
> @@ -225,14 +225,16 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
>  			secure == true ? 1 : 0);
>  
>  	/* Verify the contents of Bob. */
> -	for (pp = (__typeof__(pp))ring_context->bo2_cpu;
> -	     pp < (__typeof__(pp)) ring_context->bo2_cpu + SECURE_BUFFER_SIZE;
> -	     pp += sizeof(secure_pattern)) {
> -		r = memcmp(pp, secure_pattern, sizeof(secure_pattern));
> -		if (r) {
> -			// test failure
> -			igt_assert(false);
> -			break;
> +	if (!secure) {
> +		for (pp = (__typeof__(pp))ring_context->bo2_cpu;
> +			pp < (__typeof__(pp)) ring_context->bo2_cpu + SECURE_BUFFER_SIZE;
> +			pp += sizeof(secure_pattern)) {
> +			r = memcmp(pp, secure_pattern, sizeof(secure_pattern));
> +			if (r) {
> +				// test failure
> +				igt_assert(false);
> +				break;
> +			}
>  		}
>  	}
>  
