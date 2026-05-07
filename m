Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7829CD3427
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 05:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D51C10E18B;
	Thu,  7 May 2026 05:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOMJ/q0y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1772210E198
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 05:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778133028; x=1809669028;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BySJh4xgO/Uy+TNaeJYLHbmjEavl/C8qIYFSkk3Hf0Q=;
 b=dOMJ/q0yltA76MNzJvW3ggzjXlHID2lnWD2kVzX314Hb58xJ8CEd66V+
 eFGROzsgg/RB3ZSNjZFfjr35gTAXN+n940owPEscsXhxdfbXpSZo4VFZy
 8leW/xJbMU/F3R1z4hqqYv4yij1sKddVdtwK9xcut/DJvoBTDb7aRrxrD
 T1g7spGWegUDW8S6QKWNqohgshA0wVnp34RJUaIfjs8fgddTWXQ6Sr27M
 6v88u1ZuljI8U+DALpDrh404+PbbuA/+lF8zOMwpVNZkaRhpxMqJ4Xy60
 mPpRhmluErZ1Sn4mh7tvJzAirc7B0zuK8h9BYPwK5fGQaQe2vljqjg+LR A==;
X-CSE-ConnectionGUID: xF/LwvEsQ0Ssx4MzPsSAcA==
X-CSE-MsgGUID: OyelYFUpTeKM9muTROs2QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82941514"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="82941514"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 22:50:28 -0700
X-CSE-ConnectionGUID: vBkymmZaQGuOZKmIgGxcYA==
X-CSE-MsgGUID: q+acwXFXSKiSi9sb9Lp7hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="274500855"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 22:50:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 22:50:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 22:50:27 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 22:50:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkRpG/XNV5egza5P7euQ152RW9xlbIB7O8kLg50t0AD3/yuKeeO68KUf8AwSFyh7oqQRt+ssQnOclx/6R2D7DyqxXT/U9IqjNkP2axH4ggf/pXnG4j71HqLokSlEaFIsAVTu2xJSbX5osOMvIclLCglkkxJpOv8yAKqjxoNyGoj+qyH7aFVfcO5vW2g/NYuG503m+R1JkgldoDWgBsUeX0jHrEfXC9BowIrKW6KN7TIDcNASMdD56tChij/svdwEubLhmhnhz08RItmKtBYYccwCEof872r4vj3NPaUJsCAEqFOK3DtP64X54sAnJ78S7K75sWtxDnjLQM9m0/jb7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7SiE7t+5ixI/QBcxr4KS5oMNOuYHweOEnpp0uy8w+0=;
 b=cWkWCvMwkzwRLwXXrD/gsogh3ygBAYzGHh7cMBpze6Yt7+4bP867+YguuxsxtlfCIB+YOZUd2NnWaZvS/T+es9XQLIj2aeNQvmJmm8ZQEU4zUCT9NwSQs4CINSXTY8rfpPvEL4aHuwwNW4vZRbTMaBB0VzCkjvRfHuTSTPTiu14QtVCSlJJmj8CKcyM2fHa6jlLbhoQlY8+zkX/lv9M6OYS0/XyEnXI4131To5rJXKs3AWUEZnBEECaH/3vC380AD4L1DdRYUK0pNw5WgHlIhT3XElDr8te5x8xCHLhlnGNd18jT9tkD1VsAKHMJuhjicC002dOxkPXBHl4kboSrLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SABPR11MB9961.namprd11.prod.outlook.com (2603:10b6:806:50b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 05:50:24 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 05:50:23 +0000
Message-ID: <29fe6cb3-ad27-47a3-ad95-9186a5f39308@intel.com>
Date: Thu, 7 May 2026 11:20:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] tests/intel/xe_oa: Wa_14026633728
To: <igt-dev@lists.freedesktop.org>
CC: <ashutosh.dixit@intel.com>
References: <20260507053459.766300-1-shekhar.chauhan@intel.com>
 <20260507053459.766300-3-shekhar.chauhan@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20260507053459.766300-3-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::17) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SABPR11MB9961:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c753102-4194-4db3-a471-08deabfc881b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: +e5vdOU+to4LWIjuCOi/BCaPAOByyN3MeKcPtLVdqhjT6zKVqXrLlUZHbS3L4fw6ShaiXUcc1UvsdKDWO+6FGTpDiHg//mmztLt/TVbFgbZf6rLzYHscPM/dzH48zUxZ565UeaOcihehGccaYNc3KDLa8k+ubq0Pb2UzIp5WTmoYfEIM39iEfylJ6ovsIMPmiGlDn7qjn54Eh0lEiH2mi9kNPAupz0hOySLSctSroy35CxXqyEeUnmI/1czJb5zV5zKMPO7B8/h3xq3uYg5ufy891f88pDaxjZh/cIYPAKcLxOjm0sNEpOrGbzXL7D0r/290R9eND4Jd19LxmED19L2VjYlfOswWpOj8sttY6XmkclpSCWu11B7pfFVW35K0KyckQFcpx8r+fWBw0KBXSDXYvhTwkCLT5T67oXwR6EicJ66f5TX+zXw3BAoEZrit6yTno5E+h1KDy/52tygmjp4r2uCZw6tCEXENvw65tboLcAqJBcfBHVCo1x1vKx9dNmfUmxid7gAcsibz/mhIRKx8p1AGju0ZoTyj4c+DOHoshLMagwxPNza9BfrMcPgCUhFf+l+Mqyw1QYeFw1Lpv3phVpu0lNr3jlTzi8YgY3YQ4TQNDaCvKRezswlw0Vy2eCmezwS2sruTmNXxgzJVQIaSoX+BxNZLELUXsBwWjF6ISx2fo3rVwNbyuaNpEk7x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFN4T3VaM0xWSlEwTmdFNHNqK3R5T1FzRWorUDlBUUZXQk9OQlprTTZORVJR?=
 =?utf-8?B?bTFkcGJDb0JIM0w3bEtLQ1dwaTI0VXZuZHFPMGw4clVqUmUxc0ZHM3JyRjJY?=
 =?utf-8?B?MmJZeWExNGtmd1MxajVhMnFrdUw5S1kyMVpmQ016clREUSt6Ylh6QXM2MUhQ?=
 =?utf-8?B?VGNvSnVJRmszMnhEQUNTSXZ6b2FSNVZSVTNyUlVIRDhDbm9kV1pJeFdZdmxQ?=
 =?utf-8?B?NTlZanlpQ3Q4U0pPN0tXcFhMMkROZjkzVEkxZUUvY0d4NTJWVWd4YVdSQjJB?=
 =?utf-8?B?dUg0MS9mNWpvdFQweGFHMVpEOGlEc2lQTnBGclRibG10WG5XRDZyZUJUTEx0?=
 =?utf-8?B?cGppTmRtNWZDU3JiUEMwSGlBTVFYdlBYc1pSNm43WnZLaGtic2hwNkxUTHlh?=
 =?utf-8?B?Ly9FenVHUUNJcWVzekNnbE1KRlZvQTJFWkh3M1NrMUhJd3lvTGt1WXp6d1ZD?=
 =?utf-8?B?NXRaQ3dqUFZITHc1S2hYQ0g5RHJqNWo1Z0YvMGJqTjhESlFiY09Jd1B2Vmx3?=
 =?utf-8?B?ZzB2V01LbS9ITXU4TS91OHd4WFQxajlpYjRicG5QTUFEbHFqdVJBaVgvd0d1?=
 =?utf-8?B?anU0a3RLbTkxSXRrajBhMVJxT1BaQjZaSUgxam1oWUtkNFlmTHN4c2FESmNt?=
 =?utf-8?B?cnE4Y3NITGI4VHkrZHQ1OHFrU0Q0NVNkL0kzZ2lFbWd6UzdXQ2RYeGw2SVdu?=
 =?utf-8?B?YUhxZHppYTBhRTFWUGwyNTBCUUVMQlI3R3lQdHRhZWhrMklMbjhreXlibFhX?=
 =?utf-8?B?YnRXTkltWnZ6NFJtZ0dnSGlmMnR5MEV4eCtxSldQd2JHOUdMbk4yUmp2NmdG?=
 =?utf-8?B?Q1ZraDVrbEszbFp5bmNBTFVKcWJGREdDU1BGaFF4eGZlSUwycFFjc2piUDhz?=
 =?utf-8?B?MWRERUZYaUZ3Tmh4T2hrMUlxVVNpbFQ4V3FnM29mMytsSjl2NEZvdUNuOEJN?=
 =?utf-8?B?NnVSU01CS2JjMWVaVW1OcE4vYURMODVQbXUvdzBIdmg3SkdOcFdrK25xR2Qx?=
 =?utf-8?B?aDh2dEpobnF3OCtUOVBjVUU2NEZzQXBWZlpSUStTRGtQKzZYR0Q1MWdVSUtG?=
 =?utf-8?B?M2ZjVGF6VDVMVHg4ejVvb0svNUhRYkhxWW14QXVxdzZ2OFRlVnNyOFhhSHpk?=
 =?utf-8?B?UHg4TElOM3Q5bkp6dVBlaDhVOVhuS1lqbklnN2NOVXdUQ0l6ZlVUaE04SXJy?=
 =?utf-8?B?YitocGJvL0U0TnlDckNiTkNOajJib2JqK2p6MEpTRFVuUys0b3locHZGbzhk?=
 =?utf-8?B?SWg2MzVhaFp6ampBcnRiVkhMdGJ4VDg3VnMzTE5UTFkwTjZlZXZ5WDFRNEhH?=
 =?utf-8?B?eHlvZm9ocUR4ck1ReVpVYm5wRFp4UWRzVktiV0NlMWhhbll6TVVTaGlnNkxr?=
 =?utf-8?B?dDY5OUFGY3Y4eTA3dXdQK2JhSjNzL2pTZzBxTHkvL3RoVEVEWmdISnpDVVV2?=
 =?utf-8?B?dGtGZTRLN0p3Vlo2NmF0L2xHNms1UWk1RW1iWi9KbTFVenIxY0gyMzV3YkMy?=
 =?utf-8?B?Q3M5aUNzQmdMQVhWbCt5TEhod25iQlBxNiszbDhsNGtGU3AyMHhoNm5LcFlm?=
 =?utf-8?B?RUFZUXN2WnAzTEloR2JHcERPN3lLSmFZMEJocVFjdjlzaHJKc0pMckhTUy9T?=
 =?utf-8?B?RnpOZmRnUlpYQlpBOGxQdTFEaFJXcGpaQ056V1FsazBNVlFra1ZGNDlDaXhT?=
 =?utf-8?B?VG1DdkpUZldsOTc5VkJWTFZ3ZGJGa09BS0Z5Z1lNRFpMMWdPTEJ0dWJoZ1hJ?=
 =?utf-8?B?dTNnTHZzZks2L1RKbTFsR2J2ckNHTTl5TlZVUElUTWhoSFFaeGsvQ1B5SUJ2?=
 =?utf-8?B?RTVTYWJYVk54eUhYbFhRL25rQnFKQmV5MlNzUzE0KzlMelJlSWRpV3ZoR01h?=
 =?utf-8?B?czlibXNUZFdseHdaTTBaWmM1N0hVaXY1bGVmMDZKVlhVYmRZdWJPUTVtYzJ0?=
 =?utf-8?B?V0RUNUU3UG44eUN2WjdFNzNFM3NKLzdVS0Z5WUYwc1RMQmR2RDM3Rmo3RE02?=
 =?utf-8?B?VU9lL3lNYmJqSXlENFgwWDRTOXlQSDlBYXJ2RlB3Q3Awd3FBSld0TEZYdU9l?=
 =?utf-8?B?aVJlUDVweVN6TiswaWIybU52RytWYnA5MUd2WmtDT09TMWVoUHRiaWI0OVBH?=
 =?utf-8?B?WlJHb0hsQmFPUGRlUi9xK1hvMUZKU3Jha1MxdG9GS29WNldCcjRlbGdVRmZs?=
 =?utf-8?B?dVpTc01mT0ljeTR4UG0vdUFpQzU1OGJuaUE5QlRGdHBMK2UrK1dxM2dSMXc4?=
 =?utf-8?B?ZWdpOThLKzlIYU9KOWxrM1cycjVPdkZhcTNmUmpMaDBnaTlsbE5vUzZJaFQy?=
 =?utf-8?B?eWY5dWJsT1FGTndGNlhmU1NkVHdmektGQmVtd1ZJdlkzampDNnE2UTdZRXly?=
 =?utf-8?Q?gkgUtT98U3jNTtHM=3D?=
X-Exchange-RoutingPolicyChecked: lGArkeQ4fHSjTFUE+s7lb4R2qIfsyHJz6Xx6dY3lH3e6o1EhphdpKRXRKo8MUU7DBT6MeTgEANEQpU/yjxxJRR5W7lmNIGA66HqmJk6HxQOjkoSFJbkKX0dUMlIsn6d2Kza3f06ghjLZaNBd6dxilo4QhIuxgfz1paDFVrf5ZryftjgmY+hAAeRzecf+t93lVHI1vdeH1Tilc2EQh0XNl7dVAe7SnJgbyoNayyG23U77wvsDyv6+f8nojIQnTAS5WiIhOjTD5SwDa+1Y5Nu2ODSliXxkEZyTEatn1FTVULfHzNU1LHVFUTXAKO1khcFsV/Fba+7KRrbVYqXpKjlkGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c753102-4194-4db3-a471-08deabfc881b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 05:50:23.8290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMHW/5KDVNJtIkUKMao1A5xxORgiw+i29Bsv+xcLpWEpM468VeIxANOIK+syR8+0k1Fdww0CYDwubKgXTLQgBMRsAIsyEwZ+M+TLdwfww6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR11MB9961
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


On 5/7/2026 11:04, Shekhar Chauhan wrote:
> For MERTOA in CRI, oa buffer can be in device memory. Because of slower
> device mem access, OA exponent values lower than 8 can result in buffer
> overflows. Bump the OA exponent value.
>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>   tests/intel/xe_oa.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 988c46df6..c464d5a0d 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -24,6 +24,7 @@
>   #include "igt_device.h"
>   #include "igt_syncobj.h"
>   #include "igt_sysfs.h"
> +#include "intel_wa.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
>   #include "xe/xe_oa.h"
> @@ -2648,6 +2649,11 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>   	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>   	uint64_t fmt = test_set->perf_oa_format;
>   	size_t report_size = get_oa_format(fmt).size;
> +	/*
> +	 * If modifying the indices or order of items inside properties[],
> +	 * ensure that a corresponding change is made for oa_exponent index
> +	 * in the workaround Wa_14026633728 below as well.
> +	 */
>   	uint64_t properties[] = {
>   		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
>   
> @@ -2671,6 +2677,18 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>   	int len, check_idx;
>   	u32 oa_status;
>   
> +	/*
> +	 * Wa_14026633728: For MERTOA in CRI, oa buffer can be in device memory.
> +	 * Because of slower device mem access, OA exponent values lower than 8
> +	 * can result in buffer overflows. Also, update the value of oa_exponent
> +	 * in properties[].
> +	 */
> +	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
> +        igt_has_intel_wa(drm_fd, "14026633728")) {
> +        oa_exponent = max(oa_exponent, 8);
> +        properties[9] = oa_exponent;

If we were going with my previous design (with using that ternary 
operator "?"), we didn't have a "magic number" in place.

I've added a comment on top of the properties[] which asks any future 
developer to ensure that they make proper adjustments to this workaround 
as well if they touch the ordering in that array.

Let me know if you have some other suggestion about implementing this. 
Or, we can just fall back to the ternary way, although that looks 
complicated but it solves both problems: C90 rule violation and 
properties array indexing.

I also ack your ask to change the design of that function, but I'd like 
to keep this series focused on this workaround and right after this, 
I'll send another patch to implement your ask in lib/intel_wa.

-shekhar

> +    }
> +
>   	igt_assert(buf);
>   
>   	igt_debug("Ready to read about %u bytes\n", buf_size);

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

