Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91227EB1049
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B4E10E249;
	Tue, 10 Mar 2026 10:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9dbUUDx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1D310E249
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773139983; x=1804675983;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rzlYQbMiOLkubm7Dl9F8Aof2oL+kcR6cFoQXDTYLhYs=;
 b=d9dbUUDxMDEji7M5Xd+ez7+IE3iEi8oq9bX2U2TSIgoA4JHBYIHJXcBK
 9HpNzpc9oULtpRs3eaFXw6nK7OglOShB9rApaT/d/ghJQcx4oktA7VWlj
 g4nKray7mpCx4akbMgVcV1AlxuEreoBRHZ209d1DfwLnC/1ntOq7zXxg/
 BcYIF+pte9cFqcGgk3sHSHrYxukz+1l7R0czFilXq90ARIB6WfTsorjOw
 m7xbclrF/ROqjEkpHYVf50Hi5gyqgZx7HD6XfZPDM3bHMxY1AggvIwUXn
 LdR4qWyTjr6S+51FY1i2fK2Z2laLhTdREJxoNoPAROzEgOUWYodt6RKcL Q==;
X-CSE-ConnectionGUID: Jogp9RGLRfGrVsd2bZtCRA==
X-CSE-MsgGUID: zNEktKQgS1e6mfZxRojTeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74224393"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74224393"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:53:02 -0700
X-CSE-ConnectionGUID: xEfh465vRXCkY4jdl6cd6Q==
X-CSE-MsgGUID: UX1TH++cTHek4WgVv1pzvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="216459001"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.135])
 ([172.28.180.135])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:53:01 -0700
Message-ID: <63ee2081-9eea-43d8-9899-70808d7fd91e@linux.intel.com>
Date: Tue, 10 Mar 2026 11:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 10/10] tools/vmtb: Platform enabling: PTL and BMG
 support
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
 <20260224075027.2409675-11-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260224075027.2409675-11-adam.miszczak@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 2/24/2026 8:50 AM, Adam Miszczak wrote:
> Add PCI Device IDs and example vGPU profiles for
> Panther Lake (PTL) and Battlemage (BMG).
> Remove unused ATS-M references.
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/bench/configurators/pci.py         | 43 +++++---
>   .../{Flex170.json => Bmg_g21_12.json}         | 58 +++++------
>   .../resources/vgpu_profiles/Ptl.json          | 97 +++++++++++++++++++
>   3 files changed, 154 insertions(+), 44 deletions(-)
>   rename tools/vmtb/vmm_flows/resources/vgpu_profiles/{Flex170.json => Bmg_g21_12.json} (73%)
>   create mode 100644 tools/vmtb/vmm_flows/resources/vgpu_profiles/Ptl.json
>
> diff --git a/tools/vmtb/bench/configurators/pci.py b/tools/vmtb/bench/configurators/pci.py
> index 8e8afb138..0b524d3c2 100644
> --- a/tools/vmtb/bench/configurators/pci.py
> +++ b/tools/vmtb/bench/configurators/pci.py
> @@ -1,13 +1,13 @@
>   # SPDX-License-Identifier: MIT
> -# Copyright © 2024 Intel Corporation
> +# Copyright © 2024-2026 Intel Corporation
>   
>   import enum
>   import typing
>   
>   
>   class GpuModel(str, enum.Enum):
> -    ATSM150 = 'Arctic Sound M150 (ATS-M1)'
> -    ATSM75 = 'Arctic Sound M75 (ATS-M3)'
> +    PTL = 'Panther Lake (PTL)'
> +    BMG = 'Battlemage (BMG)'
>       Unknown = 'Unknown'
>   
>       def __str__(self) -> str:
> @@ -21,28 +21,41 @@ def get_gpu_model(pci_id: str) -> GpuModel:
>   
>   def get_vgpu_profiles_file(gpu_model: GpuModel) -> str:
>       """Return vGPU profile definition JSON file for a given GPU model."""
> -    if gpu_model == GpuModel.ATSM150:
> -        vgpu_device_file = 'Flex170.json'
> -    elif gpu_model == GpuModel.ATSM75:
> -        vgpu_device_file = 'Flex140.json'
> +    if gpu_model == GpuModel.PTL:
> +        vgpu_device_file = 'Ptl.json'
> +    elif gpu_model == GpuModel.BMG:
> +        vgpu_device_file = 'Bmg_g21_12.json'
>       else: # GpuModel.Unknown
>           vgpu_device_file = 'N/A'
>   
>       return vgpu_device_file
>   
>   
> -# PCI Device IDs: ATS-M150 (M1)
> -_atsm150_pci_ids = {
> -    '56C0': GpuModel.ATSM150,
> -    '56C2': GpuModel.ATSM150
> +# PCI Device IDs: PTL
> +_ptl_pci_ids = {
> +    'B080': GpuModel.PTL,
> +    'B081': GpuModel.PTL,
> +    'B082': GpuModel.PTL,
> +    'B083': GpuModel.PTL,
> +    'B084': GpuModel.PTL,
> +    'B085': GpuModel.PTL,
> +    'B086': GpuModel.PTL,
> +    'B087': GpuModel.PTL,
> +    'B08F': GpuModel.PTL,
> +    'B090': GpuModel.PTL,
> +    'B0A0': GpuModel.PTL,
> +    'B0B0': GpuModel.PTL,
> +    'FD80': GpuModel.PTL,
> +    'FD81': GpuModel.PTL
>   }
>   
>   
> -# PCI Device IDs: ATS-M75 (M3)
> -_atsm75_pci_ids = {
> -    '56C1': GpuModel.ATSM75
> +# PCI Device IDs: BMG (G21 - VRAM: 12GB / other)
> +_bmg_pci_ids = {
> +    'E20B': GpuModel.BMG # B36 / 12GB
>   }
>   
>   
>   # All PCI Device IDs to GPU Device Names mapping
> -pci_ids: typing.Dict[str, GpuModel] = {**_atsm150_pci_ids, **_atsm75_pci_ids}
> +pci_ids: typing.Dict[str, GpuModel] = {**_ptl_pci_ids,
> +                                       **_bmg_pci_ids}
> diff --git a/tools/vmtb/vmm_flows/resources/vgpu_profiles/Flex170.json b/tools/vmtb/vmm_flows/resources/vgpu_profiles/Bmg_g21_12.json
> similarity index 73%
> rename from tools/vmtb/vmm_flows/resources/vgpu_profiles/Flex170.json
> rename to tools/vmtb/vmm_flows/resources/vgpu_profiles/Bmg_g21_12.json
> index ff1fa7e20..75ca907ab 100644
> --- a/tools/vmtb/vmm_flows/resources/vgpu_profiles/Flex170.json
> +++ b/tools/vmtb/vmm_flows/resources/vgpu_profiles/Bmg_g21_12.json
> @@ -1,58 +1,58 @@
>   {
> -    "version": "1.1",
> +    "version": "1.2",
>       "PFResources": {
>           "Default": "MinimumPFResources",
>           "Profile": {
>               "MinimumPFResources": {
> -                "LocalMemoryEccOn": 402653184,
> -                "LocalMemoryEccOff": 402653184,
> -                "Contexts": 1024,
> +                "LocalMemoryEccOn": 134217728,
> +                "LocalMemoryEccOff": 134217728,
> +                "Contexts": 256,
>                   "Doorbells": 16,
> -                "GGTTSize": 268435456
> +                "GGTTSize": 67108864
>               }
>           }
>       },
>       "vGPUResources": {
>           "Default": null,
>           "Profile": {
> -            "Flex170_16": {
> +            "Bmg_12": {
>                   "VFCount": 1,
> -                "LocalMemoryEccOff": 16777216000,
> -                "LocalMemoryEccOn": 2147483648,
> +                "LocalMemoryEccOff": 12717129728,
> +                "LocalMemoryEccOn": 12717129728,
>                   "Contexts": 1024,
>                   "Doorbells": 240,
>                   "GGTTSize": 4026531840
>               },
> -            "Flex170_8": {
> +            "Bmg_6": {
>                   "VFCount": 2,
> -                "LocalMemoryEccOff": 8388608000,
> -                "LocalMemoryEccOn": 2147483648,
> +                "LocalMemoryEccOff": 6341787648,
> +                "LocalMemoryEccOn": 6341787648,
>                   "Contexts": 1024,
>                   "Doorbells": 120,
>                   "GGTTSize": 2013265920
>               },
> -            "Flex170_4": {
> -                "VFCount": 4,
> -                "LocalMemoryEccOff": 4194304000,
> -                "LocalMemoryEccOn": 2147483648,
> +            "Bmg_4": {
> +                "VFCount": 3,
> +                "LocalMemoryEccOff": 4211081216,
> +                "LocalMemoryEccOn": 4211081216,
>                   "Contexts": 1024,
> -                "Doorbells": 60,
> -                "GGTTSize": 1006632960
> +                "Doorbells": 80,
> +                "GGTTSize": 1342177280
>               },
> -            "Flex170_2": {
> -                "VFCount": 8,
> -                "LocalMemoryEccOff": 2097152000,
> -                "LocalMemoryEccOn": 1073741824,
> +            "Bmg_2": {
> +                "VFCount": 6,
> +                "LocalMemoryEccOff": 2080374784,
> +                "LocalMemoryEccOn": 2080374784,
>                   "Contexts": 1024,
> -                "Doorbells": 30,
> -                "GGTTSize": 503316480
> +                "Doorbells": 40,
> +                "GGTTSize": 671088640
>               },
> -            "Flex170_1": {
> -                "VFCount": 16,
> -                "LocalMemoryEccOff": 1048576000,
> -                "LocalMemoryEccOn": 536870912,
> +            "Bmg_1": {
> +                "VFCount": 12,
> +                "LocalMemoryEccOff": 1023410176,
> +                "LocalMemoryEccOn": 1023410176,
>                   "Contexts": 1024,
> -                "Doorbells": 15,
> +                "Doorbells": 20,
>                   "GGTTSize": 251658240
>               }
>           }
> @@ -110,4 +110,4 @@
>               }
>           }
>       }
> -}
> \ No newline at end of file
> +}
> diff --git a/tools/vmtb/vmm_flows/resources/vgpu_profiles/Ptl.json b/tools/vmtb/vmm_flows/resources/vgpu_profiles/Ptl.json
> new file mode 100644
> index 000000000..efc61bce1
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/resources/vgpu_profiles/Ptl.json
> @@ -0,0 +1,97 @@
> +{
> +    "version": "0.1",
> +    "PFResources": {
> +        "Default": "MinimumPFResources",
> +        "Profile": {
> +            "MinimumPFResources": {
> +                "LocalMemoryEccOn": 0,
> +                "LocalMemoryEccOff": 0,
> +                "Contexts": 256,
> +                "Doorbells": 16,
> +                "GGTTSize": 67108864
> +            }
> +        }
> +    },
> +    "vGPUResources": {
> +        "Default": null,
> +        "Profile": {
> +            "Ptl_1": {
> +                "VFCount": 1,
> +                "LocalMemoryEccOff": 0,
> +                "LocalMemoryEccOn": 0,
> +                "Contexts": 1024,
> +                "Doorbells": 240,
> +                "GGTTSize": 4026531840
> +            },
> +            "Ptl_2": {
> +                "VFCount": 2,
> +                "LocalMemoryEccOff": 0,
> +                "LocalMemoryEccOn": 0,
> +                "Contexts": 1024,
> +                "Doorbells": 120,
> +                "GGTTSize": 2013265920
> +            },
> +            "Ptl_4": {
> +                "VFCount": 4,
> +                "LocalMemoryEccOff": 0,
> +                "LocalMemoryEccOn": 0,
> +                "Contexts": 1024,
> +                "Doorbells": 60,
> +                "GGTTSize": 1006632960
> +            }
> +        }
> +    },
> +    "vGPUScheduler": {
> +        "Default": "Flexible_30fps_GPUTimeSlicing",
> +        "Profile": {
> +            "Flexible_30fps_GPUTimeSlicing": {
> +                "GPUTimeSlicing": {
> +                    "ScheduleIfIdle": false,
> +                    "PFExecutionQuantum": 20,
> +                    "PFPreemptionTimeout": 20000,
> +                    "VFAttributes": {
> +                        "VFExecutionQuantum": "lambda VFCount : max( 32 // VFCount, 1)",
> +                        "VFPreemptionTimeout": "lambda VFCount : 128000 if (VFCount == 1) else max( 64000 // VFCount, 16000)"
> +                    }
> +                }
> +            },
> +            "Fixed_30fps_GPUTimeSlicing": {
> +                "GPUTimeSlicing": {
> +                    "ScheduleIfIdle": true,
> +                    "PFExecutionQuantum": 20,
> +                    "PFPreemptionTimeout": 20000,
> +                    "VFAttributes": {
> +                        "VFExecutionQuantum": "lambda VFCount : max( 32 // VFCount, 1)",
> +                        "VFPreemptionTimeout": "lambda VFCount : 128000 if (VFCount == 1) else max( 64000 // VFCount, 16000)"
> +                    }
> +                }
> +            },
> +            "Flexible_BurstableQoS_GPUTimeSlicing": {
> +                "GPUTimeSlicing": {
> +                    "ScheduleIfIdle": false,
> +                    "PFExecutionQuantum": 20,
> +                    "PFPreemptionTimeout": 20000,
> +                    "VFAttributes": {
> +                        "VFExecutionQuantum": "lambda VFCount : min((2000 // max(VFCount-1,1)*0.5, 50))",
> +                        "VFPreemptionTimeout": "lambda VFCount : (2000 // max(VFCount-1,1) - min((2000 // max(VFCount-1,1))*0.5, 50))*1000"
> +                    }
> +                }
> +            }
> +        }
> +    },
> +    "vGPUSecurity": {
> +        "Default": "Disabled",
> +        "Profile": {
> +            "Disabled": {
> +                "ResetAfterVfSwitch": false,
> +                "GuCSamplingPeriod": 0,
> +                "GuCThresholdCATError": 0,
> +                "GuCThresholdPageFault": 0,
> +                "GuCThresholdH2GStorm": 0,
> +                "GuCThresholdDbStorm": 0,
> +                "GuCThresholdGTIrqStorm": 0,
> +                "GuCThresholdEngineReset": 0
> +            }
> +        }
> +    }
> +}
> \ No newline at end of file
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
