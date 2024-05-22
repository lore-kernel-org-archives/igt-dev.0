Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53C2C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 16:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF5810E2E4;
	Wed, 22 May 2024 16:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVgB4gOY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CD010E2E4
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716394352; x=1747930352;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sS0R6b5RGm3B0ndJxBuWCPBc6pdOPSy7RrwH2rqdDLI=;
 b=XVgB4gOYmIdb84X5wDP9YcrvyBBTJacQt6VHvGCxMYI49hPG+aqVnXSu
 ZjimCug6DcBa8d+1FMiuSf7zBEcal7XqYDB87yqh68WbSN82ft8TkfSIH
 UDyqTTHLepoVmelkgh4cuF2WaIRkUFdl5l3i1wdHJgfdhftKBoe4ZT0Sk
 Jt9kzcnyi0gJymNTnZOmByupXv/SHUDYaZVXHQz2MpRJNhGl0JFc3YUpf
 OH9Sljh3hBv45StAgU1p5pGAa93jEVLwsvn+rTa0VJtn5TdFKYj2sFhvo
 xbFu/iQ/w5m/k+24XU7IDHPOibSi74kWRQ/ShJEycBt7ghcIe3nnbBl18 w==;
X-CSE-ConnectionGUID: 06eJ0W99RIuEnUDN8T0n8g==
X-CSE-MsgGUID: TzkfYg5VQSS7MYGzecmyRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="24063580"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="24063580"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:12:32 -0700
X-CSE-ConnectionGUID: zqo1Vk9kQdqlfD2l5GJz5g==
X-CSE-MsgGUID: AEBmO3LIR9Sgx0jFYl8pOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33335279"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:12:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:12:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:12:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:12:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDwRnjgLMgjNrClJcoe7wiLPpU/1VhZHffj6CUAAnVSY6ZtE6RKwL3oxS8vJ4cTGIT8gOIKD0PDEBAcoLFnIBGdF9gaA/pVIbuoNd6wsn9hLBongQPT19NseKzD/OkOX75Ql0BKSqaY5GalalykNTowTLb7Gp6jcOeXw5n4zgTyMpgNPX0c3QgH0hN0mBZRwKxOH3cwqFazcHcoNyvkeKo89oaRZ45NdGX0LUVL1N2qldI1KItCo1VbGzHELDf7ID02t2eK2xYiDhQ3hyMLML7X6tCGwN3PuRV+MKlLDCc3iJDHzl8lCQiEsQKQ+KVzi1GAfVgFC+edh+4rT0lX/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUiKSAs7CTZ6c5TWQkKSDlsOfiYCDY+QUGzybA9Oxp8=;
 b=QMTPrB7xOVKOpxF6B5r/RyNkqKGTd25B9G0pkmSJLtNKTZ33IOimWIubPS0Q+BkcOTqJhpkv3gNkRUlJPx/Ry6Ordz0FxrMsw/NPAKHDKvm+vx7jLRzL41vZ4LAFm5EipIZnLqYs4aBLxiE4t+hi6S/pI/0hCT9UC3/Aj5tdc6ylkL+ktItv4f3FxqevDyEkI5RP2vs5Sz0C6GEuZMeikfwZYEpZtxQOHrYoh5lQvdKZh728A4+mmQluNVdhzQfq2uJaZoIoeLqRswxJiTedqMJD2n5i45Wa7hHnuMvFBfG407aOjAmRBpquz2wYp1b2uzr6l3PB1+iJXfkX1HQFmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8474.namprd11.prod.outlook.com (2603:10b6:806:3ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 16:12:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:12:28 +0000
Date: Wed, 22 May 2024 12:12:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 07/10] lib: sync i915_pciids.h with kernel commit
 7858cc0b55e3
Message-ID: <Zk4ZaQgGKqpW6wnM@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
 <f01a84905a1659e2ac0cb2fc657c776428aa3ef5.1716373923.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f01a84905a1659e2ac0cb2fc657c776428aa3ef5.1716373923.git.jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR13CA0096.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 144ea53a-5822-42bb-eb11-08dc7a79fa09
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qBJV4y0OfJWfj2cSfiUJk/7HseJ2jxqSRglvNfXi1Wg9RPHBojdbTfP9wNkZ?=
 =?us-ascii?Q?UEBMW4UTlwwZ0Zt6Dqyj5A99bAX8K8CqHGKGvq+OQvhpoSqHRDPiW0rg4UMm?=
 =?us-ascii?Q?r957NYbUhLJIsNO94FjKIb13vqB4k1Dh3DNER5Ow62e4woyfKVvSHjcgpO99?=
 =?us-ascii?Q?fz2msJqjwWoZycRt1FTs8+bB3YFKXiG83IP1XKdA5dDkRhsTnnRh1YSb2tQR?=
 =?us-ascii?Q?NfNZzEqWob3JVLJhlWI0sCD4n1/gsveVD2t6ukM/eyLqUgguIGMyp23a2B1j?=
 =?us-ascii?Q?ERn82Nl9OXhMbzBfJ+HqZmpmcw8h2bn0tAGG6N28k+HUU4a1zEGsQBaPzT3L?=
 =?us-ascii?Q?vc1vy47QRisWHeiKCeQFX1cIXOXVwRAnJsmEQAWMUWwPamlnoc+xAJMYps9a?=
 =?us-ascii?Q?OXU4yuiA++dXftSUwoPsD+gHlnTlok+yB+ZVrFepDC9ZW6j3l02+V4EE/3SC?=
 =?us-ascii?Q?bgUkT2IVmhTjikFb1fZA3tN4PQc08eKCnsy4I7sFIwyeHJPtNwkySDAelv47?=
 =?us-ascii?Q?Zlh6LFbWzdb3E1ZIqIybBaxql3RAyqoFi/DtMFBFnnCISljRzG6QV3Ssah4g?=
 =?us-ascii?Q?5yKvEq3Ov9mdRpd30VpNDkKkjowKdl4slll4ChpiDJJKtELVm/ZtAEYxNPbD?=
 =?us-ascii?Q?8nQKsNpB+TBpGQn2zhsA6Qisa2DKb7wbHnM07q0gghpnxLHP2rffWAs3sxWx?=
 =?us-ascii?Q?xWEvZWTbW9175B2X+6f7MF0bQBvfKlC2CPePhzB1fmhQZSZMcgvhPNFRTxVn?=
 =?us-ascii?Q?aGOA+ME1qBdJq0vsj2KrGwUcPnkBtx7e7bLIO1OqaOjw+N+t26eJUJyQAO/2?=
 =?us-ascii?Q?FuG3AjtCVjfnE7LgBIXFKm5JRqhBR1MoLcbS9SkJ3RbS1F0kLq/h8oKKX7yS?=
 =?us-ascii?Q?KuoiCLLzaBV8JD7TuGYtPZz9eDjS6p2PaHcQc2FVO/GBXBPG56ffckcFJ3mn?=
 =?us-ascii?Q?zO1MRW5nk0z9BFDTEQ4wsJCkBhEdg8CNqAyOgYDAO1NVjrYig1QQxoeQlwfo?=
 =?us-ascii?Q?T/AIUW7A+hZChtB3X3HNRZwSqK/ipxU/02CxgduXKZq0wvRKJfcvpZX1s4yG?=
 =?us-ascii?Q?JDJuw7WAHNsALPR4RsWqPNbq39+RR842uOBMF5/PmU1R5XhtRvFFn/nFEGJ+?=
 =?us-ascii?Q?XcKUQf1me07DPWgfj/ANhxisqSjvx00WXO7OTqC/5QQ+TQbBIt/MHo6c0N7M?=
 =?us-ascii?Q?HT5APvWe9oLmmc4MNo7ey4hVQf4EWa3JM0rivbgPbfY8xxKSjKhERKzM66hI?=
 =?us-ascii?Q?ey3az8KVbzmy3csP5TgrLEX7rUwotFkrqi/qrB/LnQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T5QzjWLQBUaykDTmkhwMBApS+IOH7OrnajYHp58+5zI3FA3HHtea1NAG5BhM?=
 =?us-ascii?Q?zV3pl9x9maMXqZfIvoL6qXeZlhVg49vEYvuXWwOrVcYVkI135I31AMcZvyrC?=
 =?us-ascii?Q?JP4GIwYbL3NWHzjx+XQG8KenW3aQ862biCc5r8LZX1kQS3jFVTTFdb1oE1Xf?=
 =?us-ascii?Q?4nwO5bJHsC9jxlRmtgrnf4sUKfJx/cz91JZd624XnI81WJH7eLwm2jhrqVlR?=
 =?us-ascii?Q?NwipTnMfNH/oX93noF2lMNnVnu5rx6lezmNzJ+qd6u1rvX2OrWwVeGQH8+Q/?=
 =?us-ascii?Q?KDjdqVrN0TIBZwEiVERReHogFO4ikXpbqLyoftUVHRHvxQOF8UV74+E1Qly6?=
 =?us-ascii?Q?18nQte1VYlTW4Y4alP4BiQw5lIVb0ebaYBvW50C4KWfdaO35nNFbi6Q1KZQQ?=
 =?us-ascii?Q?+M3mUOn/rIpUe/3eE50K5TdTQ47WnWvJk7huh1nTIF6ZBpTiQ9aiat0WoIjW?=
 =?us-ascii?Q?My3cTYNEeHomTyZaW33HiV9JWWcVVYi1YoJBqV5JQFNdatRDydKw8NvG0zjQ?=
 =?us-ascii?Q?+mNh4opckmmfOD+EqO8t0XG19O72SqqwR235kZYi9MaA4mzd4ftVQkOmhDqP?=
 =?us-ascii?Q?MMOFDK7cB+4Ex3x+ZhLaCcWdJKUomRL+Lk+a/yfXoTKRylgEJVapVJCWKF5t?=
 =?us-ascii?Q?YKP226eIcYuUgCQvJOi1cvduP/PSj0EQavj8XRSeC7ABLjCYEncMfDN5JTm6?=
 =?us-ascii?Q?Iezoo6EBJdRUiIcnlv5Yk8zptIkUvuCywoiuazChV95GQ5tWDfybGFAlrgVR?=
 =?us-ascii?Q?S4HlNbF+jliRziY9tWm2co7UNbUbSqrQEQ882j52NS4BbD8hIZyXI9TseJqZ?=
 =?us-ascii?Q?kbTCYiYqC9cjM7XZFo1ufJVv4aMUVaLuC6rQZctF0HQBUAvwxwCdnlJmfPhZ?=
 =?us-ascii?Q?oSBWQz3zX3JjsRw3JBBol5DLK0vDMRRp79MxhQ/Oa8Hivwq3XSMUjW+vG5aI?=
 =?us-ascii?Q?L8uu1hiifDuMyt/k9+/fw+N7KwcGvc5nUQLrCIXAe16loszcn/8CiJ4QOAOm?=
 =?us-ascii?Q?8B/NLjCJ6xSW2+0t9nRPmEnYzAH9uL1R4pfnc3LjwXNqWLKLEjrsjZ83D8GL?=
 =?us-ascii?Q?0vg0xOhuP01wuhQaYGDhBTjzelmOw9p7Z5AASvIZDBN8ObvgX0Y1iPszluAV?=
 =?us-ascii?Q?mfIFC99HR8HSAHQAy/4FM2hmrHyMdWeBlO/jwGyXJqQ7QM3F8d/2Qr1yOioA?=
 =?us-ascii?Q?46C9j8FWlrE9Xvk1fxVM8ktl18WJQFAYWVAp/YQl5HwGhtFKSorhIgS9FDLO?=
 =?us-ascii?Q?9pOdejTXa3I2yObjsYF8ym1XzUIsbf0UJNRSqwE/aaHETgTdRK66p38QKxO8?=
 =?us-ascii?Q?sw+T1fDCOc5nhkRbqrWK82u8ifbV/U/JxmLltNKAo/h5PZOECnpHURfHzZ4U?=
 =?us-ascii?Q?xGEafP8KayM2FScLUg/BirjXdTAlb7J1lR5us8uRdmb5sUcq7rqEHaHkTob4?=
 =?us-ascii?Q?UYtLmP865LAouFvQl88Sn3ih1soUqRrZJcNnej9f+9CMUXxzkxSo7xYL1xA4?=
 =?us-ascii?Q?SpvQBuDVr6j63aoPF8SYI2sMo8DfVLNTDVeVqM+WesucghyZE3Xs4ROhmxHq?=
 =?us-ascii?Q?VuhHwkGTbsfTzFOl3gaENpg6ROp+Y1ioWCUVHlmt8TRb1jFCIsBqwdQd7Z5y?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 144ea53a-5822-42bb-eb11-08dc7a79fa09
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:12:28.6693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IA4LMp6pW4c6CIz1mUdRN1qq17MZ430+yhFw+uEKz7IFbuvCWdXqgDacETi4bM0t1OrBY4wLRB+qNe7e75OIRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8474
X-OriginatorOrg: intel.com
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

On Wed, May 22, 2024 at 01:35:20PM +0300, Jani Nikula wrote:
> Synchronize i915_pciids.h with kernel commit:
> 
> 7858cc0b55e3 ("drm/i915/pciids: remove 12 from INTEL_TGL_IDS()")
> 
> and update the references in intel_device_info.c.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/i915_pciids.h       | 10 +++++-----
>  lib/intel_device_info.c |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index ecfd7f71e2e7..42913d2eb655 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -620,12 +620,12 @@
>  	INTEL_VGA_DEVICE(0x4E71, info)
>  
>  /* TGL */
> -#define INTEL_TGL_12_GT1_IDS(info) \
> +#define INTEL_TGL_GT1_IDS(info) \
>  	INTEL_VGA_DEVICE(0x9A60, info), \
>  	INTEL_VGA_DEVICE(0x9A68, info), \
>  	INTEL_VGA_DEVICE(0x9A70, info)
>  
> -#define INTEL_TGL_12_GT2_IDS(info) \
> +#define INTEL_TGL_GT2_IDS(info) \
>  	INTEL_VGA_DEVICE(0x9A40, info), \
>  	INTEL_VGA_DEVICE(0x9A49, info), \
>  	INTEL_VGA_DEVICE(0x9A59, info), \
> @@ -635,9 +635,9 @@
>  	INTEL_VGA_DEVICE(0x9AD9, info), \
>  	INTEL_VGA_DEVICE(0x9AF8, info)
>  
> -#define INTEL_TGL_12_IDS(info) \
> -	INTEL_TGL_12_GT1_IDS(info), \
> -	INTEL_TGL_12_GT2_IDS(info)
> +#define INTEL_TGL_IDS(info) \
> +	INTEL_TGL_GT1_IDS(info), \
> +	INTEL_TGL_GT2_IDS(info)
>  
>  /* RKL */
>  #define INTEL_RKL_IDS(info) \
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 79e3796dbefe..b1eec572dd82 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -599,8 +599,8 @@ static const struct pci_id_match intel_device_match[] = {
>  	INTEL_EHL_IDS(&intel_elkhartlake_info),
>  	INTEL_JSL_IDS(&intel_jasperlake_info),
>  
> -	INTEL_TGL_12_GT1_IDS(&intel_tigerlake_gt1_info),
> -	INTEL_TGL_12_GT2_IDS(&intel_tigerlake_gt2_info),
> +	INTEL_TGL_GT1_IDS(&intel_tigerlake_gt1_info),
> +	INTEL_TGL_GT2_IDS(&intel_tigerlake_gt2_info),
>  	INTEL_RKL_IDS(&intel_rocketlake_info),
>  
>  	INTEL_DG1_IDS(&intel_dg1_info),
> -- 
> 2.39.2
> 
