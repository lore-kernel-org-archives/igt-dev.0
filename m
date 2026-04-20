Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DCFF55808
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 10:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B6A10E160;
	Mon, 20 Apr 2026 10:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G90iB4oV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F85510E4B2
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 10:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776680804; x=1808216804;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UDd5uEXSlZ90PGeXmO9e1W1nM0bst6Sj7pNUrNYPbEg=;
 b=G90iB4oVcZSdwFVIMhv32NMJ08KBr433ioP2pdAGric9iETGnpk17lKs
 xNbRI2LxYb3ag7EJaHFFLvckTwppYeTye9bSjgpKrau2QccPqbiqkh7jQ
 Pc2GcyR9SAwp+FDLPhZSMvN+PNWTtaPAJXyHkJP+zTjUvR2gx+QpSsj7f
 1eVJmLYMpaBKkGI3ZvH9b3xIf35urjkdiS7exwcrOepFY3fgN2YQZMXqD
 1maslXkPGwSeohtWgx3mb/zjC8MYXueAMyFEQdNfmmNLmcw6CJjNWScdw
 H8Oq9KTu67OGRNSS+tTuAaApCUbDoArpLzEvAhIDRCIPJcv48hxrQrlmx w==;
X-CSE-ConnectionGUID: G9Xv3mgPQVq6lZo5omArwQ==
X-CSE-MsgGUID: NTAYQRGxS3+08wbKF7KA0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77507592"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="77507592"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 03:26:43 -0700
X-CSE-ConnectionGUID: F39krx6lQoGqNzII38eLcw==
X-CSE-MsgGUID: IYLTkHWQQAyuHlgmnY3bDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="227346487"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 03:26:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 03:26:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 03:26:41 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 03:26:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCj1KtxHx088rCIyQk1YEbC4HFZsek1c+1QMXSLH8eoW88ZZrOkbhSTfTQzvwcvVFFhn4m54fju4YGNRkgzNvue8VaISVm7WhsvNGE0S6FXHgQhqJ+g0fqaFKTjnTTC22xyMzaSRTUAf9fhFjz7b+mGI9hTxPc3XlC7JeDKtTbKkDnTDdGp9LspVyWFxeB4AJCpZ85VYT2vbORFUMBMmQ6jTHG8B82Sc9/kx7eSdS3b1YLPSAEaa9Aoi9lrP8BVp4YRSAzwlaYUGR5FMuWPAzMq+1Jwq+KIhPEzPIfeExKFIT6F+mfJL9x2MZ2twa7keuo5EMF5Fh5y8bqj50ltCxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7A8Y6gei60oSOs8EX2n6H8eGAqVdYKh5lXBSFR5w78=;
 b=WPes1dfKIeW1qNuTqr/N5/zFonUdWPOYmo6YcjKeiOiCdOxanRooYMLNFMY3VruYPYQt1kTtbknCLtS+HRTf5BGCzdWdeXxv3i8T+KNVJZOKNpW1e7ORUPn7wud+c6DsnWPG6kj+yzcyyI2nuZOQ6aOcIhQygCZ/oJgqttuiIbWUz7ptVAcxayExZUvdamwZJZnggpgXMovR5i1tAxcriT1Yy5rujZC+C5xENJim7doXBkIhLTkMB+B4qcXyp8P3r4kZG0ctDprWhCiiehPAH31hllVdUYKvwAWPQuqmFY1rIl6taXWi/KoAA0o38FKCzZt52x99KCt+sgrEU6R2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH8PR11MB6877.namprd11.prod.outlook.com (2603:10b6:510:22b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 10:26:38 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 10:26:38 +0000
Message-ID: <028fe462-fa81-48bb-b030-ef10ab48e96f@intel.com>
Date: Mon, 20 Apr 2026 15:56:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] lib/igt_core: Create asserts for pointer
 comparision
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20260417181157.177299-1-kamil.konieczny@linux.intel.com>
 <20260417181157.177299-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260417181157.177299-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH8PR11MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: c7eaaeb0-0b48-4a80-a259-08de9ec74e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Q+k8QNROd30GhtvDoGm4qwc68iC45RiiL0oJ5UWpXKcvCRlynK2cY0B4F6QTtb7vSaAaxsYv3xr1IkLUpiOIcdnX6Dajk2iwQK8BxZcmp5V+nKQrV1bOIVlLhT24mW8JKyKSNUA19NkBhYdGHsHzmcvwGHwvlXMdWpdDekWOxHQSeQvMW/Z+gcP/ranOC4bEBT/4e9ipmQwsaBikZoTtSoX50MsUFHh50PWbuO9QfwqqY3U08PFnuyzLiJtxnDyd1gmkPQG8iavZue9kb5+HLr4nXV7YrRkCL60RblumUT63sr0ssLhXllNpergN4xVl5cEMORDmpTR3B2YhzhgNUahYFcFiez89SISCRYGsMbKIAJzH6Hcs9tPidXBROlgJdwqQ+YG2UDljUHQI04z2v81ttr9gBBcU0+of1HmacOpjsfC6WtDqZjXss7BOQgNqqZSieCFFXNaw6/v7jliiOO0RrlRcenw8OQ2uoUqwT+wdsiAwzQsg7mJs2eCT7b+RNyZJ3CL1Hcy9ubapniBxIAfBReQJIRCthieCuwCLXvZ4arjXZCc0A88Cz69HIQx4TIGtCHNJ9dRsZqPxUCcrEnrUXJUxm+cXi9drdStiey3VPa5KfbP7fDg/QTrqY0PQ5FjgC4m9fYEdkiPVRRJLU2lA2RIMf5n2MsEXmG9yLmtf8DIOFOK4n9uXTFnT/gRr8iHsr7YP3fIHkEGCFbFsd/U8vWvBzqMACEjXpCE8JBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXNRWDhwRURIa2d5TEFOcG14ZmwvRFlSVHAyTkJlMGxVOEgxYXJOV29ZSXNR?=
 =?utf-8?B?Q2prOTVEMWlIQ1pBbTFMSTBJSytzMEZ1UzY3Z0g4U09HMDRranZnQWdFNVZk?=
 =?utf-8?B?ai91MkJQWmNiQUtLSkFTQnlRQll6ZmFuWXZwUXkxWTBteWFGUmJPejVZanhO?=
 =?utf-8?B?MmJ1a3pYbkRYTjc2T05EYVdrR1VTZWtLN01wQmxqVE9YMkFQY2ZhbW9yVmY5?=
 =?utf-8?B?Y0ZaRm5uVDNrRUVTRklMazFNdnE0UklZb0E0dzU1cjZXMjNOMzUzYkYzUE9J?=
 =?utf-8?B?S29XU1lXVHcwZHhvNW90VWRCMXkyb3FZajhvMjFYWUJ4MHRYcXJVL2p5S016?=
 =?utf-8?B?YkVZOFZUKy9kRUlWb1EzSTd6dXJHYU8xTDM0VEQrL3VOWnBheTNCakZxcGJu?=
 =?utf-8?B?TDY0N1dNQmVxc3hSc2dDaWxSVEdUeXpqMDkrN3RyOW5GdHBQK2IzMEZWV2Fn?=
 =?utf-8?B?MCtTbXVVb0Y4eTdzaWlmMFYzbDluMjBFdExDOEtVK0NMUWVOZzZpTG9VVURa?=
 =?utf-8?B?eWxUNGo5dE9WN0hUZ0JTL2p4d3I0M1RDS1dQVGRWSTJzQi9ZQlpTMkpYcE1V?=
 =?utf-8?B?VVZZVjZ2dHAvaHhDS0pST0h2MzNPMnAwb2hHR0lWVmVtQUV6Z1lnd1J5S3Rz?=
 =?utf-8?B?bkdWOFhiMWxaajRVbWNRa3lGOEg3RjhRS0Y0Z1ljazd3Q29xRGhZYSsvVHRo?=
 =?utf-8?B?aFVuQVpvWTl1NmtnNzhyUzMxdjBvMFk5OHdsNEM3Z0FBK0NaNHRJSlZXZzJt?=
 =?utf-8?B?Z1BORnkyZm5nZUVlWmJXckNUa1hxejR4ZU9iNjNZbzNkTGV3blhxVzhOWHVZ?=
 =?utf-8?B?SDhKRlNONWcrdk4xV2MrRWc2YzBldEpXdlc0Uk00ZUU5cUswZm9URHR1L1J5?=
 =?utf-8?B?dHk2M0RxejkzVW1XNXVXak1XaGlqQmRCMWwxQW5NRW5BTWVoblhiVkdxYzcr?=
 =?utf-8?B?MDFsN2lnWktnbVNoYzZWRFdIMFk1NWxQcmE4L1N0VFh5YSt2cnhLV0JjQXBz?=
 =?utf-8?B?MFNGM2FWSGM5RW5hN0hCcDM4ZkxTU20yK2NyVmltTkpmSzlDK2hmMlVQUGRM?=
 =?utf-8?B?SHBscWVkcEZqbGNCanhLcE1SanV0enViNFJMK2ZRdEU5NmJYSHZ5VW1JblZl?=
 =?utf-8?B?VzBRWTZOZSt2UUxsSHpVZW9TOHF2LzBvY0x0djJiVElxWlZ2UjZHZ2YzOFQ4?=
 =?utf-8?B?VFVRSFpEQU1EZFdnQmp1TjMzbE9hTHVqbkZzYUp1bzlSRllLMzJUV2ZQU0d4?=
 =?utf-8?B?YUFqQ2Z2TW5VaTRPZ2VOQk1uNllySjlBOXcySkVyUFJTZzZvajNVbS9keHBS?=
 =?utf-8?B?TFQ5N1lTRXZ0VmxvczJmK0pPV2VycXV2U1ZWRFNXMU1kRW1hdWJkcjhuYUx5?=
 =?utf-8?B?VjlaOGd4SzZmYUxLK2Z0UVlYdzErNmgzcGNITkpMMnJvYUU3VGdyNytTanZ5?=
 =?utf-8?B?WHp1dENOOHR2WTVoZm1wZDVGbjBRRjhVeGRSRWZxU3hPbUFqbHEzQVJ2Tjdm?=
 =?utf-8?B?Zm0wOWVLOENxV1RqazJlY3JpaDAwVmRQdmx3N1hVaFo1ZFJPL1FrdzdjRytk?=
 =?utf-8?B?c0JSY1NZbXJoaGJ3bkxlWm5ScURtWU42c0pNVXh3TjNuNTN4RFVNQy9qNWxZ?=
 =?utf-8?B?Q2p3N0dnTkxwTjR0UitoK2xtdWY5WlBFdlBXenpYQ0dSU0oySjVUSEo3eEJz?=
 =?utf-8?B?QWNWVW5mdnk0UGdVQmc5TU90M1FFQ2lpcElNT215S3dxU2lkVHFsTWkxdmxs?=
 =?utf-8?B?TnE0VUM5TldNU0FEOWhDS01aOEhxdytZNmYxaVpid0VkSFdjMEVKT2FvUkFP?=
 =?utf-8?B?SWNLM3BVR1V3UU9uc0M5VVI0WmpkUVFxbE94RUJDMUhhUVpvNkNnNTVZNlFE?=
 =?utf-8?B?L2Z4ZVJJRG9VQ21TbGNEVU1sYjZoQnd4cWQ1dXNTVHNEQysxbFRCTTVYZGEv?=
 =?utf-8?B?Z1dxRVFUcmlLNjF6ZWNYalh3cEN6WjVnKzdmVGM4Yk9XbmVLbjVKQlJPUVoz?=
 =?utf-8?B?ak1xMmlpc2k2SVdUcUhDd3lpSFdhL2M3Z1BGQkozVFR6L3IxY3VUdXBudUlw?=
 =?utf-8?B?TXl5UTd1aks5SVRzcjhvbGdKcVRCVStZeUV1ZFdWV3dLVXVITGZSOGNwZWZL?=
 =?utf-8?B?MkJKNzFVZUNZbDV3bGM5U1MzclR2YmthUTZzbTRqU2ozVjk3RUNIaHNBeFo2?=
 =?utf-8?B?T2tqNmlCTWtiV2JOZzcyUjZLZ2x5SldtZWZ3MmxrdkFydVI5MXc3Zm55RnB1?=
 =?utf-8?B?TnJpOGs2WVZHR0xjWkJjZnZybXcrNHZnOFlEc2VCUUx4OGF2RGJia3pEbzR1?=
 =?utf-8?B?bXdZMEJtdkdmZUUzenZRcE9LZStjSkVTL2owOUIvTGRMTEgrTWdXQT09?=
X-Exchange-RoutingPolicyChecked: VYAhPCIG1ZCCzso2R+uXiIbQ8zBaEitZ9HlGNXHA1BcdShgFsDIZrxS/rH8whqBWtQx4F92K7gs055SWdFC8oKRURMdpqRdcYhHX5PJDi6KIymD4IpNARaJKQpEztDAVtPFWBfeNCHlqcEswHwCt3FO4hCvKl21xmNsw3Cy9K3lpF+UikGUsZLH3XyqBAi5eVQUqQYBGaEhloGQgaAVybzjBre34c1SuuJVxpb+PNLn1fIRj58Wo8LTU9zWx0PdQMViMLZN/jidwLD4yWM7iQNb/4yM9qeP2C7BGWUVcITLCIi33lsdPuTXt63GR0Rmwg/6GVE1bnXvVFIXdIa8SeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c7eaaeb0-0b48-4a80-a259-08de9ec74e27
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 10:26:38.3886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dy/JSgoZitqAaykOLNYIGxV3Vtcmu1Nc86WwWKcieH9lbSslLyoKV/jHrxIomTmomrkjORBUTPx7BqloNK2Ygw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6877
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


On 4/17/2026 11:41 PM, Kamil Konieczny wrote:
> Create two macros for pointer comparisions, igt_assert_eq_ptr
> and igt_assert_neq_ptr. They will print corresponding pointers
> on fail. This will allow us to remove ugly casts, for example
>
> igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
>
> could be rewritten into
>
> igt_assert_eq_ptr(ptr, MAP_FAILED);
>
> v2: add cast to 'void *' in macro (Zbigniew)
>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_core.h | 42 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
>
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 6845f853c..9fe3997e7 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -723,6 +723,48 @@ void igt_describe_f(const char *fmt, ...);
>    */
>   #define igt_fail_on_f(expr, f...) igt_assert_f(!(expr), f)
>   
> +/**
> + * igt_assert_cmpptr:
> + * @n1: first value
> + * @cmp: compare operator
> + * @ncmp: negated version of @cmp
> + * @n2: second value
> + *
> + * Fails (sub-)test if the condition is not met
> + *
> + * Should be used everywhere where a test compares two pointers.
> + *
> + * Like igt_assert(), but displays the pointers being compared on failure instead
> + * of simply printing the stringified expression.
> + */
> +#define igt_assert_cmpptr(n1, cmp, ncmp, n2) \
> +	do { \
> +		void *__n1 = (void *)(n1); \
> +		void *__n2 = (void *)(n2); \
> +		if (__n1 cmp __n2) ; else \
> +		__igt_fail_assert(IGT_LOG_DOMAIN, __FILE__, __LINE__, __func__, \
> +				  #n1 " " #cmp " " #n2, \
> +				  "error: %p " #ncmp " %p\n", __n1, __n2); \
> +	} while (0)
> +
> +/**
> + * igt_assert_eq_ptr:
> + * @n1: first pointer
> + * @n2: second pointer
> + *
> + * Like igt_assert_eq(), but for pointers.
> + */
> +#define igt_assert_eq_ptr(n1, n2) igt_assert_cmpptr(n1, ==, !=, n2)
> +
> +/**
> + * igt_assert_neq_ptr:
> + * @n1: first pointer
> + * @n2: second pointer
> + *
> + * Like igt_assert_neq(), but for pointers.
> + */
> +#define igt_assert_neq_ptr(n1, n2) igt_assert_cmpptr(n1, !=, ==, n2)
> +
>   /**
>    * igt_assert_cmpint:
>    * @n1: first value
