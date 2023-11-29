Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9D510E079
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 20:00:22 +0000 (UTC)
Message-ID: <a232732a-94a5-4d59-a020-418177b23e18@amd.com>
Date: Wed, 29 Nov 2023 15:00:14 -0500
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20231129080502.135689-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20231129080502.135689-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/amdgpu: add GFX1150 chips for IGT
 tests
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

The change looks good to me.

 Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2023-11-29 03:05, Jesse Zhang wrote:
> Add new asic id for igt.
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_family.h       | 1 +
>  lib/amdgpu/amd_ip_blocks.c    | 3 +++
>  lib/amdgpu/amdgpu_asic_addr.h | 4 ++++
>  3 files changed, 8 insertions(+)
>
> diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
> index 9e534208d..847fb0375 100644
> --- a/lib/amdgpu/amd_family.h
> +++ b/lib/amdgpu/amd_family.h
> @@ -104,6 +104,7 @@ enum radeon_family {
>  	CHIP_GFX1102,
>  	CHIP_GFX1103_R1,
>  	CHIP_GFX1103_R2,
> +	CHIP_GFX1150,
>  	CHIP_LAST,
>  };
>  
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 58a037ac0..1adea6987 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -656,6 +656,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>  		identify_chip(GFX1103_R1);
>  		identify_chip(GFX1103_R2);
>  		break;
> +	case FAMILY_GFX1150:
> +		identify_chip(GFX1150);
> +		break;
>  	}
>  	if (!info->name) {
>  		igt_info("amdgpu: unknown (family_id, chip_external_rev): (%u, %u)\n",
> diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
> index 1178a920e..0130ae2f0 100644
> --- a/lib/amdgpu/amdgpu_asic_addr.h
> +++ b/lib/amdgpu/amdgpu_asic_addr.h
> @@ -29,6 +29,7 @@
>  #define FAMILY_YC      0x92
>  #define FAMILY_GFX1103 0x94
>  #define FAMILY_GFX1036 0x95
> +#define FAMILY_GFX1150 0x96
>  #define FAMILY_GFX1037 0x97
>  
>  // AMDGPU_FAMILY_IS(familyId, familyName)
> @@ -47,6 +48,7 @@
>  #define FAMILY_IS_GFX1036(f) FAMILY_IS(f, GFX1036)
>  #define FAMILY_IS_GFX1037(f) FAMILY_IS(f, GFX1037)
>  #define FAMILY_IS_GFX1100(f) FAMILY_IS(f, GFX1100)
> +#define FAMILY_IS_GFX1150(f) FAMILY_IS(f, GFX1150)
>  
>  #define AMDGPU_UNKNOWN          0xFF
>  
> @@ -104,6 +106,7 @@
>  #define AMDGPU_GFX1102_RANGE     0x10, 0x20 //# 16 <= x < 32
>  #define AMDGPU_GFX1103_R1_RANGE  0x01, 0x80 //# 1 <= x < 128
>  #define AMDGPU_GFX1103_R2_RANGE  0x80, 0xFF //# 128 <= x < max
> +#define AMDGPU_GFX1150_RANGE     0x01, 0xFF //# 01 <= x < 255
>  
>  #define AMDGPU_EXPAND_FIX(x) x
>  #define AMDGPU_RANGE_HELPER(val, min, max) ((val >= min) && (val < max))
> @@ -167,5 +170,6 @@
>  #define ASICREV_IS_GFX1102(r)          ASICREV_IS(r, GFX1102)
>  #define ASICREV_IS_GFX1103_R1(r)       ASICREV_IS(r, GFX1103_R1)
>  #define ASICREV_IS_GFX1103_R2(r)       ASICREV_IS(r, GFX1103_R2)
> +#define ASICREV_IS_GFX1150(r)          ASICREV_IS(r, GFX1150)
>  
>  #endif // _AMDGPU_ASIC_ADDR_H
