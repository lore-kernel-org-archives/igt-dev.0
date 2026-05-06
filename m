Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E49CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 11:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537AB10E173;
	Wed,  6 May 2026 11:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gIKV4Ke2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9248A10E173
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 11:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778066001; x=1809602001;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DjAHeLJZ23KoAjyGPjs29ppUIo7VUZ1907zd2r/lsTo=;
 b=gIKV4Ke2ErtrOw7QXPFDEghQCg0mKdi9Ou3YhQ3a8qu8q6z+uU3qZDDe
 tojwf13APZJDApGmc93yqpfxWQdTmR8xXx7K0lM7jaIMOVSH7ATaNtBkc
 9qh/Vv89U5kx2H/u5noyeyHIGUn1wfRtd6LfkawR3Jvl5shBGUgCm3pKZ
 00eiVHwRsObuDKgVAtjU+Tq+LONFQNpRATf/2CMhimhjSJkeR2cb5XjPC
 yCo2GFj+gyWqO9OzJz7SGuCkPp9Dah9DUUH5/CcFOkBjyTlbceRcgBXYi
 YYyuOpjbf1jmNBA7/n8yD7pyEF/olnw/Xu8ADhhltRgi2mrFZ4rG9Jk40 w==;
X-CSE-ConnectionGUID: +i5PQ4vSQkiTBh37FLNs+Q==
X-CSE-MsgGUID: vQMI7E/nQn+H/ZAvcxXMTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89691623"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="89691623"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 04:13:21 -0700
X-CSE-ConnectionGUID: 9BRHItoYTAexmDlWaxuYAQ==
X-CSE-MsgGUID: 7jzg30Q2ROeBvkIBU4iy3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="259806324"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 04:13:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 04:13:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 04:13:20 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 04:13:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YS/d1s0CEfd4mvEOPz41hrPu8U2/hR5g6tzmmRBM8df3WRWFQETb1CS9dAeicOcyQJf+MSi5pwag+Aa40BafUNfX2kNGPnmsvkYeOLK8eBMdw+yZw9YNprR7o3P7zQx1BssZie3+ZjqbEMxjl+hME6VBrn4l9xCQu5I6sorx3r75P1xqG4OKAJmWSHn6eUGhmWuPP29yt9p8xJcbjpn5wMl6B3a+rZFm+sh6zdzZABK3Zumcw4LPBaAW98fdjuU5mBcK3/D2x4Tt+pTdtWzuHb+0Zr4gX/J8Va7mMLS+sHzqzSZmD+9QTlo+hq1Lcz2knm5XDSiHe0tuy4quyI7DeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTloLfSu838nIjtPxkk05wKKJLWPun6UQ7OV+vGYpOI=;
 b=QQbwHZ37iQsK9UxUl3x7aZW3xGFVvdUU3Z1LbD31rhP8n8gQjCe/05kPajqxwl2w/dbFCSyU0+SjEV/5xWrbTsiHQ5go/AQGf5OA5gR+0WNjsO96HTzuN9bPlw3HWJgM4H7zXGlNXdKmpAPS0GuBY2uOHhReoyAATR2uEGVux99RYPNK2Nz6QTIjMRBufYq6iBTv7X8satvNRSLTUaRcLi5oZSMMciMEurMrCrR6WmB00FcNg1Dtntpi2IXgTEBzDIfXbeyfxGUP0sF1aDob+QK4uA3FBXNtKzQpf+S+jNDizTHmHv7t3qflgGjMS2ANJ/Wsu8g2CIaxJIGZDTCg8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Wed, 6 May 2026 11:13:18 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 11:13:17 +0000
Message-ID: <550e8c78-7510-442d-9121-d3b05038b857@intel.com>
Date: Wed, 6 May 2026 16:43:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 3/3] tests/kms_content_protection: Add FB cleanup
 for MST tests
To: <igt-dev@lists.freedesktop.org>
References: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
 <20260330032205.467130-4-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260330032205.467130-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::9) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b32b06-1c11-44dc-282a-08deab607955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: aW38HdMIXsQ8+J9e38fzbxk7rljXnQtP8RKdGtYbjV1PkpeO7X4HqiwXiAABNlVwGTfMv1DTew7hwP7X+lW9e7WbONh1tQQ9GGVFiDaMCQSTVCOaqjYA2W0yoXEZ8eqPx8/MRdLHWXM/R3YXT8G3ap+lKj4B6ci+DXlwRZlG3p17l9JEY2VzA9KwMWDEI+sDag+fJQrUOmh69+uYLGGyc1N6lndagiMqZo2ObaUCDszSKERftL3E8qAH+XS2iKvWhi8ujrI3/a6i/uX5JgVzwiI32KftTWV45PdG60MrPAS54a3N7lHmK2xMT679caAUEzvJxAwbRZtztjz4szMVWnS8lvr+7JVjQ/VNwHkJDXEpPOy/zP1A4uoenfGyuL9LtJh3df0/XI2JN8qZW7i92jgUl4AhrXZ1vlZM7P+OehJ5RXql2BZiPA4KU4DWrAxDabu0N1ZVxRR9tOlnIzD3HW6umnVxcdltMRqn7XDLKABcx7Fd+deE+unNoHx20gi+WIIqph7ZqxQqukxvRpkBb1wApLlv54pHZELXmb7ivhnl1o+NJ4ojbqTDddqjJ69qdhgN7flqeaqbs5mUQyH17UetdHtxvYOyAX4VnEl0weUzcnMNKin6bD+KUU5bQrqcOzHKpSug5W78ZcVDa+NhZRes0F9sI3zIDSv9RZScivQqECvF/F2ojA1jjdSwlhs4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTU1djhhKzNINjhNN0s5ZGJEeHI2OHZMSzEvaUlkMVZVRzZPeDU0OUF1OGZG?=
 =?utf-8?B?d1hzNm9obk1FYnhya29WUjZFR05XbzdJSkVZQ3hvU1pydVZuUGprUG1VSm5t?=
 =?utf-8?B?N1FnTlhZbjlLa3UzR3p5SndwRWlFVTlNVnFxQXA4R0lVRzVkWVNVVTZQTGtT?=
 =?utf-8?B?TDl0S005M3hISGpjMTNxclRhWWVyYnZzVXlUVU9yUjFxQjhIYzFpaGxFS09F?=
 =?utf-8?B?Qmlrd1pUSG9HRmVDYXE5MjJGR2F4dUFqZjI4L2hZekRLWkJDTmNmZnVDNHZT?=
 =?utf-8?B?TGYvODRqSlNRVVBEaEdOV3VHd3pabHBmVlUyV0tDelUzVGorTUZVUmJnakxW?=
 =?utf-8?B?YmZ4NVlBRDNuTGl6aGg2Rlc1MktWY3lod3h4MkQxZ0VDOFduZTRJVmVJVWxu?=
 =?utf-8?B?MVNiUGxWSDdyMWwxN05CaHVweU91QlNBMnUwemJqeVFkMnlNMldGVnBYaUl2?=
 =?utf-8?B?YW5LYVJNNlgwWE1TZnliQndXbitjWUlJeU5ubFhsakh1ZTJYcHEyeFk3MGdV?=
 =?utf-8?B?emptZ0YybjZoSVFISXhUa0RmRVdsVnNKaExTK2VkMmxvZFdwTkFYeWlLWC9s?=
 =?utf-8?B?MGVsUmFYRVdFaUdGTFRuZFEwTWZ1WkhxUU4zbm5CUVdwd3pLdkhmZkQ3d0NF?=
 =?utf-8?B?WDEyeENKOE1acmFrSkFlQ090c2dQVndINENTd0MxanM2QTVvNE9NV0FyNVdG?=
 =?utf-8?B?U1orYnlxOWRTT09FZitHK2NpNm5yT2g4RFIzRzdFL1IwUmlzYkdFSlR6a2Z6?=
 =?utf-8?B?WXlWVVUxeHNCR3F0S3JhM3hWL3l0cE9VaWdubWRFcDQwUmRaaWJwUTcrYWZZ?=
 =?utf-8?B?SCt3VjZiVHJPYkg3bGJhOWtsSS91Z2pjK0RYS0J6dVBLdXhuWjlsWjBqYjV0?=
 =?utf-8?B?KzlRajYya21pU0lDWENZYVhaT1IrcVJ0MTlHeVdXaXRVVWVUd3JoTTZ5Qisz?=
 =?utf-8?B?dm1nYkkvVk1SbUkrd1U4TEp4bzN0RGZmRFdEOFFSWVRYMElVNWc5alZOYS9T?=
 =?utf-8?B?Ty80SUN1NTBaaTZvcEw3ZkJubUJrSmQ4dUduajV0U3kzWUdIdmJuTjdzM1kx?=
 =?utf-8?B?cTczc0pLT0lEbmI4NmZPZzJUdlo1Rkx0OWZWc0FlVGRFYmFUYnpoQ3o4TDg1?=
 =?utf-8?B?dVBqNlVwMDh0SWJKSjByQ3ZTbVhVL0tFWmw0MXRqbnk3YmpPQS9RRzd4eGQw?=
 =?utf-8?B?YTg0b1VJRTJTQUFkU3RDSE1kMXJ3eWhiMkFOZ2dUOWNYS0NNdVBPSGJEaHFX?=
 =?utf-8?B?b1pDY250Q2FiWm9KcURHSDQveDdyNjZDSlBHS0FsQVk4Q1pyWjE4emRUYVox?=
 =?utf-8?B?ZHh5Mk5LNHF1MVBBRFNnbDRiakJQOWFLcWpsR3o1T2RTNzZnblh4eEl6Y05u?=
 =?utf-8?B?ekVYK1JtSmhSNzUzMGhjZjI5WTNxMnFoU0xzMGRKUWRqSTdkVFFtd3BjU1I3?=
 =?utf-8?B?di8yeHlsTkwxRzhlWUU0R0F5bTRkVXFvS3p2NnZiRlBRR3BXMmF3OGlndERG?=
 =?utf-8?B?blBiUjBkRHlVMWJKK2lFYlNYS2RXUkFWTjFMcmZQc1YyUmJhZGd1T3lBR0dO?=
 =?utf-8?B?dTRSSTZaN2YzUjRycmxYR1BHc3VMcmdTbWlueHp0c0J2QU03RVA1a0gxbjY1?=
 =?utf-8?B?NnZ1RFNZWi9oMDVtUEdPVFlSSWZEZHFRRjcxbm5yaURqenVnQnY0SzNWTWhL?=
 =?utf-8?B?SjZhdHdDcVRkY2NSY1FPUmlwNm1Kb0x2L3FLYjk3S0lkNjZ3Ums1M0xDRzd6?=
 =?utf-8?B?R1oreExyaXNvSWtPalJOL29QczF5Mzk2NTBOYTYrU25QOWV0NGFhSUhLRDM4?=
 =?utf-8?B?RVNIbkdJT05hKzVyQmc4UzlvZjRCL29UZHpWV0pyZDgzNWw3bW1mQjQ1MG15?=
 =?utf-8?B?ZmZnM04zNTNiOUhKUDJESnBhaDlJaGdXQlZlTlorVTlVaHY0Y3YxbWNOR21H?=
 =?utf-8?B?WGhFT2Y3eUpqcWhWcUR6QUxoMkZzUXJ5d2tTU3MzbzFkYnBRM09sTStKaWIv?=
 =?utf-8?B?aVVVdGpLT2wvczNJY04zTHNvY1YwUGY4YzNPbGpmRnBvUnhMclpzMnk4QzVH?=
 =?utf-8?B?aHZkVnZ6S042b3htbXJ4UEloNlhPZVBqMytBTEx0LzZqLzVMTExWMmNRcHox?=
 =?utf-8?B?QWJYNzZnMHFpN1FWb3psZHJUZTcxNXpaUUp0SXZCaGVhV1BwV21HT0xJdzNy?=
 =?utf-8?B?UUVyZ1NXRXhnMVpTczI5Y3AzZGN6SEVGNnFNd0lvZG5vRkg5K2lueHd6L0Ur?=
 =?utf-8?B?alhmUTZxYjIzdC9tUldMME5CaWVKazJpQngrU2FMYXZSY2E4VFpOWHhlRHlm?=
 =?utf-8?B?Qjh4RjVKR3hJampLWmtmNEJlNmhORlBHT1NwMVUwQ3NpWDJHNFF5T2NDT1Ji?=
 =?utf-8?Q?KSWqipBZs3BL+t23pVZW9xDrxga2EMHi7ExCx?=
X-Exchange-RoutingPolicyChecked: S8AYQ1aOolzeF+mEn/3ie/2HaMBtiiBSokdyEAZ/24bCYErbQp2uuEVT+TrHBkZPhCiHOV0600XnhQcyXbNwUo3cTHcbaQU5bBd2MEL4hbC2pzEbjXZIteIbcvpAEHf587jJGkLbLdKjbK6tCZV4zqjWKJqH78EF18P1lejNtuWPyrgW38A4gJwA2D1aIz3tG/9/CXpG2x1YcS77YIWb28/ao3RBGxYbfTg0QQwS88nSg4H2PfsztQS0ILN7rsUE9AqrA8rtUfW+FFuvENawUoG0UCMsD/Y6rRf7S3ujvQmOB7oK/WCOq6cvQHJxM5HYGNXSNLFQOkM3QLi3kadX0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b32b06-1c11-44dc-282a-08deab607955
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 11:13:17.9407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJ+gexINqtd/vzGlNvIbH0HiJyPz94OpQ767O/KsrUWNqGu/+iASby94+xmYi8pUEgHWYwMAkYug3f5GfHkz1YOoiTX1dK8KDSKLxcSzhjFbmgpAMzdJY+I9y57+grT4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
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



On 30-03-2026 08:50, Jason-JH Lin wrote:
> Reuse create_fbs() framebuffers for initial MST setup to avoid
> unnecessary recreation.
> 
> When igt_override_all_active_output_modes_to_fit_bw() changes modes:
> - Detach planes before removing FBs
> - Recreate FBs with new dimensions
> - Re-attach planes
> 
> Add test cleanup: detach planes and remove all MST FBs to prevent
> resource leaks.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Suggested-by: Karthik B.S <karthik.b.s@intel.com>
> Reviewed-by: Fei Shao <fshao@chromium.org>
  Tested-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
  Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>


> ---
>   tests/kms_content_protection.c | 44 +++++++++++++++++++++++++++++++---
>   1 file changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index b302d4cfd47d..7a5d49106074 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -945,9 +945,33 @@ test_content_protection_mst(int content_type)
>   		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
>   		igt_require_f(found, "No valid mode combo found for MST modeset\n");
>   
> -		for (count = 0; count < valid_outputs; count++)
> -			prepare_modeset_on_mst_output(hdcp_mst_output[count], false);
> +		/* Detach planes before removing framebuffers */
> +		for (count = 0; count < valid_outputs; count++) {
> +			crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
> +			prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc, false);
> +		}
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +		/* Need to re-prepare after mode override */
> +		for (count = 0; count < valid_outputs; count++) {
> +			drmModeModeInfo *mode;
> +
> +			crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
> +
> +			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].red);
> +			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].green);
> +
> +			mode = igt_output_get_mode(hdcp_mst_output[count]);
> +
> +			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					    1.f, 0.f, 0.f, &data.fbs[crtc->crtc_index].red);
> +			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					    0.f, 1.f, 0.f, &data.fbs[crtc->crtc_index].green);
>   
> +			prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc, false);
> +		}
>   		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>   		igt_require_f(ret == 0, "Commit failure during MST modeset\n");
>   	}
> @@ -973,8 +997,9 @@ test_content_protection_mst(int content_type)
>   	/*
>   	 * Verify if CP is still enabled on other outputs by disabling CP on the first output.
>   	 */
> +	crtc = igt_output_get_driving_crtc(hdcp_mst_output[0]);
>   	igt_debug("CP Prop being UNDESIRED on %s\n", hdcp_mst_output[0]->name);
> -	test_cp_disable(hdcp_mst_output[0], COMMIT_ATOMIC);
> +	test_cp_disable(hdcp_mst_output[0], crtc, COMMIT_ATOMIC);
>   
>   	/* CP is expected to be still enabled on other outputs*/
>   	for (i = 1; i < valid_outputs; i++) {
> @@ -985,6 +1010,19 @@ test_content_protection_mst(int content_type)
>   
>   	if (data.cp_tests & CP_LIC)
>   		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);
> +
> +	/* Detach planes before removing framebuffers */
> +	for (count = 0; count < valid_outputs; count++) {
> +		crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
> +		prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc, false);
> +	}
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	for (count = 0; count < valid_outputs; count++) {
> +		crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
> +		igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].red);
> +		igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].green);
> +	}
>   }
>   
>   

