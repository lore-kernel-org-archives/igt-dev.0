Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187BEE7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 09:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA3B10E39D;
	Thu,  5 Dec 2024 09:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMRMH/Ye";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9297910E39D
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 09:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733392287; x=1764928287;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6MZalqbyx5LgE03LMhzGLnbw2gxeL8BbfJoSevwbPa8=;
 b=HMRMH/Yem0ElvC7Ri1wMv5g5TRBvP5hiG4MOjCN7tdnIKgBsDRi8WBp9
 vlHDS7U6L5eBBuLisdnKOuPHZPowP2/uRvbQDUSL1bs6z/r7BCZ4tBzXf
 kEYsBLhqP3PR5jwl/Sl30rcgl74SRt5mgovkh0c+zejbatpSGr2kZYARH
 eEDtC4z3nKYky+noZTF407pwOfoPGraUteC283xxwgIslIS7lHWEQhiAF
 323tsCpjak1ir/ZYAOcaHYN+uDnNrZh6LOZ3RUR8kHcodDKneKWV6nAJJ
 gmehK3MSXgpT6u3as4JDIrjrcV9mdYbZ3qPJACpj1iJhc5CWlibu69fOI A==;
X-CSE-ConnectionGUID: ojGmB1wpTomHj/l6WtTjvg==
X-CSE-MsgGUID: qdFBO0IRTFeH/kp2gKM5yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="56173874"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="56173874"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:51:26 -0800
X-CSE-ConnectionGUID: ejila3cMTiCFPS5oTX5PSA==
X-CSE-MsgGUID: 10xOKFNPSOyUXQwu8lZOmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="131474086"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.113.95])
 ([10.245.113.95])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:51:25 -0800
Message-ID: <37e9e22b-01e2-40ca-a761-b50980532be3@linux.intel.com>
Date: Thu, 5 Dec 2024 10:51:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 3/4] tools/vmtb: Test resources - vGPU profiles
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, michal.wajdeczko@intel.com,
 pawel.sikora@intel.com
References: <20241127102202.3903735-1-adam.miszczak@linux.intel.com>
 <20241127102202.3903735-4-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20241127102202.3903735-4-adam.miszczak@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 11/27/2024 11:22 AM, Adam Miszczak wrote:
> Provide vGPU profiles definition for Flex 170 (ATS-M) platform.
> Definitions are provided in a JSON format, parsed by the VMTB
> and applied as a test setup (fixture).
> 
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   .../resources/vgpu_profiles/Flex170.json      | 113 ++++++++++++++++++
>   1 file changed, 113 insertions(+)
>   create mode 100644 tools/vmtb/vmm_flows/resources/vgpu_profiles/Flex170.json
> 
> diff --git a/tools/vmtb/vmm_flows/resources/vgpu_profiles/Flex170.json b/tools/vmtb/vmm_flows/resources/vgpu_profiles/Flex170.json
> new file mode 100644
> index 000000000..ff1fa7e20
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/resources/vgpu_profiles/Flex170.json
> @@ -0,0 +1,113 @@
> +{
> +    "version": "1.1",
> +    "PFResources": {
> +        "Default": "MinimumPFResources",
> +        "Profile": {
> +            "MinimumPFResources": {
> +                "LocalMemoryEccOn": 402653184,
> +                "LocalMemoryEccOff": 402653184,
> +                "Contexts": 1024,
> +                "Doorbells": 16,
> +                "GGTTSize": 268435456
> +            }
> +        }
> +    },
> +    "vGPUResources": {
> +        "Default": null,
> +        "Profile": {
> +            "Flex170_16": {
> +                "VFCount": 1,
> +                "LocalMemoryEccOff": 16777216000,
> +                "LocalMemoryEccOn": 2147483648,
> +                "Contexts": 1024,
> +                "Doorbells": 240,
> +                "GGTTSize": 4026531840
> +            },
> +            "Flex170_8": {
> +                "VFCount": 2,
> +                "LocalMemoryEccOff": 8388608000,
> +                "LocalMemoryEccOn": 2147483648,
> +                "Contexts": 1024,
> +                "Doorbells": 120,
> +                "GGTTSize": 2013265920
> +            },
> +            "Flex170_4": {
> +                "VFCount": 4,
> +                "LocalMemoryEccOff": 4194304000,
> +                "LocalMemoryEccOn": 2147483648,
> +                "Contexts": 1024,
> +                "Doorbells": 60,
> +                "GGTTSize": 1006632960
> +            },
> +            "Flex170_2": {
> +                "VFCount": 8,
> +                "LocalMemoryEccOff": 2097152000,
> +                "LocalMemoryEccOn": 1073741824,
> +                "Contexts": 1024,
> +                "Doorbells": 30,
> +                "GGTTSize": 503316480
> +            },
> +            "Flex170_1": {
> +                "VFCount": 16,
> +                "LocalMemoryEccOff": 1048576000,
> +                "LocalMemoryEccOn": 536870912,
> +                "Contexts": 1024,
> +                "Doorbells": 15,
> +                "GGTTSize": 251658240
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
