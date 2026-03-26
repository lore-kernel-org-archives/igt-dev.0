Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72588109E54B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 06:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC81110E26B;
	Thu, 26 Mar 2026 06:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KR4VQDpD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CA810E1F8
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774507127; x=1806043127;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qbu1WbaF6tXFfs3ZEMei4XrEUdrTEkrQySfKYz5K5OA=;
 b=KR4VQDpDk1Z/6092/krI4BDeMu8+GVaLrmOgZVMrBIBQPU4mp0v/a6Fc
 fOltd0L+57SoY1MPDxIauApHyIOa1X13BLmVfRr+k+rtwr09oLUJnZAlh
 KaAMuNLEMw/mFLCb3g+AkiuOh6hlnC2LLx2ZYYHkMSgHw/hNw7y5HV6oF
 DP98knayWk4gv9c2s00awTnMryQuZubcgWIMUZO7qckW98q6b1reE86n7
 DidSKU04ejhT01xcUFdU3bHCAWLAkjixLTF4urWqPhSRRVH6HBmQ5uxjN
 W79BvaEnXhDhxU7WmIv6l1wlRaUBJH+RHUjEAO0Dvm4FfIRA58qrAsi5t Q==;
X-CSE-ConnectionGUID: CkM4dBDdQLSgqtnDfDJcgA==
X-CSE-MsgGUID: RKpDqDpJQTmh01OTtx5S8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79462438"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="79462438"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:38:46 -0700
X-CSE-ConnectionGUID: yfLnnsO1RfGGn7FiZ9dtZw==
X-CSE-MsgGUID: 64kMY3O2THmqS2q2v+6zGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="255403461"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:38:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 23:38:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 23:38:45 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.67)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 23:38:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izS3OnImo6SjEp7HO8L0y88DUuTHM7ZHAg0Wvn1coTrLQOGUgK034ZHW2xe0eZ2aqEOknLvurNZY3Osu2fG4gHey7LT3wfEEtMUD/AvUdTP9G6AAVmh9C/e60UGOr6+024GZu4V0OpwuTiZHVnOCBOOm6974cH3YZXDaENmL/fui9o1tqcACjJdjJsRYBamu40pCKf/1l6IoulEi2XTYIYcydCU1SaMLu8AoZkBpGew4uYkFGGEDj6VQMqWuZSl0xUUJp7Q0WmD2VH+nobAYReOLoxHeisu52DESJs9VumxiUu/pR89Ko3aMuyiO6s6wFOLCUzdC3dzL+Jlj+417Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XisyRfhBjzQklj7Rxd3R8ht5ABLDO4xg8WxGJpvOqTs=;
 b=lZwtXZEUIFPDWo2z9Po7Czyg9J3t/CdSDK5eXy0VLlLzKslz9V2Ne6NQtv6++zAkZdzvlVWBjwflyHQ75NcyaQGa4d7iZs79/HwotBrVI6b/VoLXzu0LoZhbCCGe/lmocAcGTvg38Qhf82WAbnyRmxspeWKONXnK3m7OyhtcQv5WxnmyZ6FcAP4Phezbui0Q6Irltwn5gfkWsFwphTZhnItfYrEDoOVf4SjJGhMVbz/zLoGBKmxMjjVIl6k93hgMwVJ0e2+IqDYErXKU8ViPOKjkVmYTlCtw/ANeebbPx7yduoOQQoSf3G4gmkGtM66GQNjQIBB2rHESsRQWsk7tag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DM3PPF818092190.namprd11.prod.outlook.com (2603:10b6:f:fc00::f34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.12; Thu, 26 Mar
 2026 06:38:33 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 06:38:33 +0000
Message-ID: <7b8415b5-a883-4630-b1fa-f7818b722269@intel.com>
Date: Thu, 26 Mar 2026 12:08:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/4] intel-ci: Move suspend/resume chamelium
 tests to end
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Mohammed Bilal <mohammed.bilal@intel.com>
References: <20260326064201.783311-1-sowmiya.s@intel.com>
 <20260326064201.783311-2-sowmiya.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260326064201.783311-2-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0251.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::12) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DM3PPF818092190:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c42a9b0-c640-43d7-40c1-08de8b024cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: sl4nt4sPKsTBOxB3hbzqvxMr091zkdQBDXMk17BgbvldbyuRVOKHPCdMy8oOXClaVxtJ22fIMwyCreL/RR0vlZTnJWCDPMGDtTfF1sVlbHZWMnYqV3j6H+37A8AAcl1wpdOP5o/3TtaCqw9gzfVfKPgr+JvOhCJKQj8SFSOblOuXnucp29RZBluIKMcxn0FzI9qfWIwhTg65kxYyDRp+qeVicGx3uinHjvITDG2Ou488pGF4/jDmDudWQGBIyHwtwQKxsyonTenlhYg//1QbLMWiXYYZn+yUhVE0TG4jqGSBhBIwDkTtMqHUJdBpM9FwnPyPvhiYvqZOEjtq92GlraV1g4hcXV9CSqPN/4U7uIXqsvxnAls9i4HyQMXTylKOjoqlazYi4fLEII5sJjGERjHVpwYTYHQQc5zIASRRGH9qPH66lDTf3HYK/LSXLEscraBsXbk30uhmOpWEe6t1/5m3U386U5Jg9Y0iz3asf9mX7MpIls2xz8wa+Eb1Q8V1ZB/fRg7ZEGOvoBAEqEq5LnT4XFN+A1XCxyOf844rVdNenYGMwzx6c87EHWPpi4apUGsmjFEKL0DmBxUU7/zA+vrKfkihdQsZ61k6mMbcsgLwZ2SBk8BP5h58iFlYeb4Ouve4591PKIO+4O4/d3Js7u0cKnV0JgW+bmhAqTPdYzee7N5YcVc3ciMI7bglF/HUJ6BbB7vigIV4wpwiWoQnprSXqcGKCi1Jg0GAoHMSnu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEtwa0duTDJuYVZudkRVd21XSHR6aVhvUXdEVUdtSkUzK3dtMEtCTmdCUXFv?=
 =?utf-8?B?NHNaWjgxVE4vbHNkcUFuRHNMb1Y4WmRGNzRKczZ2OWxtamRUQ1JwVDhKbDZi?=
 =?utf-8?B?M0ZXblR0bEhBMDVaeHpUKzdDZktqV2F5a2FqZzdUeHRNUHFRVERibVM0MFBZ?=
 =?utf-8?B?R2FVRFFaT3gxdE4wc0djOHc1ZnE3SkVjV1RVM3U0M2hHUlhsS24rMm9JV01j?=
 =?utf-8?B?NWhlZXFvNkZUakM0MWN6Zk9rUWQxNUUwaURCd1cvN2RNQ080b0pzNzFjMXc1?=
 =?utf-8?B?Z0dreWZ6blVZTGxvQjJZZXdRRHVUUU5mWmRWTVkxc29aZ2VQanFZMHJZSEJm?=
 =?utf-8?B?TTlkVUFxTWhPaFdUdUYwQk5ZWWdVVGlLY1FvbUcwejlJTEdzSmZ5VElrdFZC?=
 =?utf-8?B?akgxcG13TUYrcFJud1BBY3FSWm1oVklock9NUjBONE1Zd1Z1MklnQXZoOEJI?=
 =?utf-8?B?aDRyandGWGNFZUtBWlJwcm5kbGxrbmt3ZG1yNkkwR2hZOGgrY1QweGhsZzg0?=
 =?utf-8?B?WGNsejJOZyswM1ViRnNmVWlTWE5nby80NjVZaWNDckppVFVzdWVkaTdMS0FR?=
 =?utf-8?B?OUYxeHEyVDY1MTA1VDdzRkptYjBYN3FaRHF6UnFTWDg0c2ZzY3c0VFJuZ1Az?=
 =?utf-8?B?TG1zMW5BWDA2ZEl0cGJuVjR3TzlIT0plU0Q5SGV3SENWemwwZi9PNHY3Q2Vp?=
 =?utf-8?B?dHJWNmZLQ1c1YVFqVVplLzBYc2NYVk9BQU5BYm5wQzVLUFBsZ2dZL1l3RmtE?=
 =?utf-8?B?VTlibHI3ZTh3UCt2bDJXdFltaStreXc5Vnl1eGI5bFplUlR4N3dYeEhCTXlS?=
 =?utf-8?B?bXpPQ3JFTUJZVzEvOTNUa1BGbXppOVBiQUpOaTdqeWFxdDlaQlc2NEQvVjlD?=
 =?utf-8?B?UTVDM21GeXFiK1c5c09Tc0NESTJnZ3UwcGVkT2ZXT3daTWV2aGVJdlhyZ25M?=
 =?utf-8?B?QmNaREMwQUE0cWdla3g2Vll6UjFzMVQxZEhQbHVSekRiNXZVd05vT21CNFQ1?=
 =?utf-8?B?ZS9OTDM4NkVxRWl1QjJtQW84VHd4UHZCK3RvYjRIN0NWNGxjbG10R0k1RVp6?=
 =?utf-8?B?SjdiZ2pvWWJmNmV1Vis1L3AzalE1cUZYSUtzWUdWVDkwTmNYajRjWEpINE0z?=
 =?utf-8?B?SFVValB1eUVqeFNCTlBMajBKYjFEc1M5NlpCNmF5VGxrTllzY2lzWlJvSCtq?=
 =?utf-8?B?clJFVVdtRXJUL0JqZy9LSG84eStYZ1Fvd1JnNzJybS80eldzREhNMTFQRG5E?=
 =?utf-8?B?UFc0Z3U2TUpER1ZwdzMxaVBEU3hFMkpFeUY4Z0srOEcwMXBKdVNaeXoxYXF1?=
 =?utf-8?B?a1dKVStMOHJKUGUrLzYrTE1GanM2SGdyYzI4MUt4czR5NXF2amJvZGJhVHJ3?=
 =?utf-8?B?Mk5XKzY0K3VTNEwrNWlLS1FDOExqOENBUEo2dU54a013eFYyd1ZBTkdYTHZI?=
 =?utf-8?B?c1BTT0F3cUxUVGlNbjBhdjM1OU43Q0dmbnIzckVSUUFTOW9NWmt3Qk5jMkE3?=
 =?utf-8?B?ZjFsaXFoWDJrZVRmczlGUDVwSzhKaTc5QlBJZmlpQlM4RVBESGFKUURyOWRR?=
 =?utf-8?B?OGZxeEd3MUdFK0FTdksrSUk2VFp3Qy9acVdjYW9wcFhOUUZ6NkJZMmFQMUdW?=
 =?utf-8?B?V25PajMxQkQzblkrZmFIbXlxWnpISi9zeWx2b3JZSEQvWmEzQXJDY2taMm9V?=
 =?utf-8?B?dGdpM1B6bSsrZmVsTUsrTXdtK2hTdlFrYXRqRG4wSTRySjNQQlI5SFV4ZUJa?=
 =?utf-8?B?Kys4cTVDWnpaM0M4WGFOWnZJQkxpVGUwd0RleEpOU2UzaHRPMEhMMTBUc0xS?=
 =?utf-8?B?SnpsdXlpazVkaHl6bU8xdngxMFZad3MzRGQ3N2tHajRxV09Fbk5yenZ3UzNM?=
 =?utf-8?B?MkxuN3I3NE14bDFuQWVoNHQyd3NlazFaYlV4amdOUFllOUI4UldLOXUzR1JX?=
 =?utf-8?B?RW05TDRDaUhSS1pjZmtOekNYOGo0WmdxQ3RnUHhHSDV4NVZxYTRwS1lFY2dr?=
 =?utf-8?B?YkczOHZnWHJyUkM5OW9zZlNpWm5VU1pKQXkvOVl5TTM0eHBEcTJpV05FMmxJ?=
 =?utf-8?B?ZnBIVkVMVmVyOFhiTS8zT0E4TmhMZTB6YTA2emt0cFBDV3NoUW1KeHNlZnM1?=
 =?utf-8?B?aGU5S1A3SVVPbng4NERJQ1lzcnZLV0VwTFEzVnAzMVMrUXJWZ0dRZ0NCdzNQ?=
 =?utf-8?B?cTRhMldrUWJHOW5RUEtMK21iZGZMYU95L2RXUkhoNWhNRXdqbjh3OGd0VmhF?=
 =?utf-8?B?K2dvZEVIK2Uvd3ovYTR5Wk1HWDdLVTROc2lFQ0t5b1haZnUvMzRDVGhnQzA3?=
 =?utf-8?B?M0ZFMytNSDJlZE9YdzdTcEV2d3hXdXZMR09TZWFpNmdPa1FmN3R2dz09?=
X-Exchange-RoutingPolicyChecked: Go4dEWLXW4MIJio2T6FAZUbim5Mp1KiG64Y4uhtCAVhFRV25Xmj31+102sY9k5eYFGHspsH86wHIfvmR8Lxzox6r/nveAJdvvnQtt22I53/78UlQK+Ys/a5YjF25H+cW3Up2+qWm4yhs6VATMUXcHW7i/y3FJMayXeqxIrSwRSrLHaX1DBGQ6m1mcGFG22ywZt4yRCRKpcpIVl7Jkk534WfeUHEaMQqgito4d5g2U8gcC3XzCdh9Vtr/j3So2y/U0H1eQnUU/C/JpGOSEJ10QkmCtoQSAMq3xW3Pjy4jMkGaNR5JOrytQc9MEg0S88hKo5NCszIxWI8NFItYWEcEjw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c42a9b0-c640-43d7-40c1-08de8b024cd3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 06:38:33.2325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5SAB/GL1Ren5O1XPFwzlvBW4f0OKQc6vyXTTMYhm1l6AAJKlci2vd3C7232lP4mXrwLl2lPo/UhlEEXrN0QgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF818092190
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

Hi Sowmiya,

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 26-03-2026 12:11 pm, Sowmiya S wrote:
> From: Mohammed Bilal <mohammed.bilal@intel.com>
>
> Suspend operations can cause system hangs or connection timeouts,
> so isolating them at the tail ensures stability of main test
> execution.
>
> v3:
> -Sort tests alphabetically (Kamil)
> v4: Add detailed comment (Swati)
>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>   tests/intel-ci/chamelium-only.testlist | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> index 9adace28c..0e7c8e301 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -12,13 +12,11 @@ igt@kms_chamelium_color@ctm-negative
>   igt@kms_chamelium_color@ctm-red-to-blue
>   igt@kms_chamelium_color@degamma
>   igt@kms_chamelium_color@gamma
> -igt@kms_chamelium_edid@dp-edid-change-during-suspend
>   igt@kms_chamelium_edid@dp-edid-read
>   igt@kms_chamelium_edid@dp-edid-resolution-list
>   igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
>   igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
>   igt@kms_chamelium_edid@dp-mode-timings
> -igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
>   igt@kms_chamelium_edid@hdmi-edid-read
>   # Chamelium v1 board HDMI receiver supports max 4k@30 resolution
>   # removed test as its having a mode 4k@60 resulting
> @@ -41,9 +39,7 @@ igt@kms_chamelium_frames@hdmi-crc-planes-random
>   igt@kms_chamelium_frames@hdmi-crc-single
>   igt@kms_chamelium_frames@hdmi-frame-dump
>   igt@kms_chamelium_frames@vga-frame-dump
> -igt@kms_chamelium_hpd@common-hpd-after-suspend
>   igt@kms_chamelium_hpd@dp-hpd
> -igt@kms_chamelium_hpd@dp-hpd-after-suspend
>   igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
>   igt@kms_chamelium_hpd@dp-hpd-fast
>   igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
> @@ -51,7 +47,6 @@ igt@kms_chamelium_hpd@dp-hpd-storm
>   igt@kms_chamelium_hpd@dp-hpd-storm-disable
>   igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
>   igt@kms_chamelium_hpd@hdmi-hpd
> -igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
>   igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
>   igt@kms_chamelium_hpd@hdmi-hpd-fast
>   igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
> @@ -61,7 +56,6 @@ igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
>   igt@kms_chamelium_audio@hdmi-audio
>   igt@kms_chamelium_audio@hdmi-audio-edid
>   igt@kms_chamelium_hpd@vga-hpd
> -igt@kms_chamelium_hpd@vga-hpd-after-suspend
>   igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
>   igt@kms_chamelium_hpd@vga-hpd-fast
>   igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
> @@ -75,3 +69,12 @@ igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
>   igt@kms_chamelium_hpd@common-hpd-after-hibernate
>   igt@kms_chamelium_hpd@dp-hpd-after-hibernate
>   igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
> +# Suspend operations can cause system hangs or connection timeouts,
> +# so isolating them at the tail ensures stability of main test
> +# execution.
> +igt@kms_chamelium_edid@dp-edid-change-during-suspend
> +igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
> +igt@kms_chamelium_hpd@common-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd-after-suspend
> +igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> +igt@kms_chamelium_hpd@vga-hpd-after-suspend
