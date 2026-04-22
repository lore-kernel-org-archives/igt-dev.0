Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941E8F94CC1
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 05:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D5410EFC3;
	Wed, 22 Apr 2026 05:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtjGUxWD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE3010EFC3
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 05:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776834385; x=1808370385;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0WM6u8oIMwjvw/mvHrTlLGrhWmadPWcsD3GN5Tu+KxE=;
 b=OtjGUxWDFj2kF8ZZ10hsUXWy7MEKMtU6Ps+F0+YXKRup3aLBb6QE1w70
 nu2ZhmPtubRH8FLD9xQVjRY5VmdyntUc6/9lH78a23/7Z7HOB44/5LxP6
 NzAyngxScxFxtLfQweq2rGqf+sM9w9iCWeqRDzUVg73XCefOfnXqm5Li6
 DwF4Qf6Yn59WeZyxLt0TugMotnt7ejWA1YYdvlA1WUQr3xhysG44txCjO
 e42JiXk1OxRgVEk7mcI5pRicXgURl1ujzpIpZCVlS/5+huH9b7DZ9H3o6
 4yDh116SUT7gQikEGhHVpIWQkgTaSY36GUaePf7PUF83nhqFIMb8Wawm/ g==;
X-CSE-ConnectionGUID: 1XDiTAJmRS+LfFW52ULVKA==
X-CSE-MsgGUID: REDW63d4Rja098+jwTK+vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77694387"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="77694387"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 22:06:25 -0700
X-CSE-ConnectionGUID: DW38nBmkQhuwpjuzjnvh6Q==
X-CSE-MsgGUID: XEEGzwv7QMy/St4ITN4lTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="270338283"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 22:06:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 22:06:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 22:06:24 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 22:06:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ynm86xOy3rpTFrmSzFUgTJ/rkFs6D1AQ7pBxsdOLUmySu767p2hJ6CaByDXJbbLSEcxYGt1yKBo5oTwXM6BJjaWXI7Cfl0nXAcJi9i9/Sm9Qbfvzvt/HhtQmrTUnpEN/lsTAmbZwvkegdj3vPheZXqE4FZgsVSTP6+qESbqowkG7rgX/mJGcQinV4csLeIwKI4ZU5nY8FT89zpwyfD3/U970UlFJjj0viwt2ulq4ZK8GhrNDty4DaEmK0exO8bqO2BpS4QigTXQx/lc0LnR8UNmgxCE73utost1RZT0wgo5gqK+XT1jN8shlgf1zii1OjrrGuVfHZoemNxnmdQlTtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kbgi6n73J3mYc/LgpoCkoK6vg2jl5QtSKqCswZriRAA=;
 b=dczBHz7H9hVw4oWQFGkXmujH94ViYixfeIYqoW0mE/9Cf22YEbMUrdbNAoh0lL+FnL0pF8qH56X3+ls/93eQP5U/xbFkCuZeHI8EBBDmalx0pQxeMUKqJxdKFI3N7MCMRfGDSyCpUup2YVGdWEuOgkK7GqvEUGp7apYvmo2d00stR6TV8OsHpe16b9zxZUArQigqYRg2JwtB/D2o5sRzXXQEwHq5j28fbYysEhdrtSmpIqcWumNazW7x8FJ0Ht1SyydkK+4EcCIYfWBnFF2TTSXIQuve7Gu/wjwbViq+8kBqtP0ey+dtxnVgHWqqCCxU3S/8N60Z8QmGHTjLGTvkfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA3PR11MB9301.namprd11.prod.outlook.com (2603:10b6:208:573::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 05:06:20 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 05:06:20 +0000
Message-ID: <aa8eb6a8-97f5-4eb4-8ec8-49e98f866b7b@intel.com>
Date: Wed, 22 Apr 2026 10:36:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v3] tests/kms_bw: Allow custom modes for external panels
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <pranay.samala@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20260420061231.1952346-1-karthik.b.s@intel.com>
 <8d6c7aba-2f3d-43d6-b729-8ec8774d2f2f@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <8d6c7aba-2f3d-43d6-b729-8ec8774d2f2f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA3PR11MB9301:EE_
X-MS-Office365-Filtering-Correlation-Id: 10673a90-0681-42a9-c538-08dea02ce412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|42112799006|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: a1AhCIXb09VFRYW0EvZnrgw0UPYYHYmwlXPLrrkSY/b2Qm1Op+zVZU3GVpugyY5TdWffC+ENv+PwwZLttnrpqiJPH6bCRFX40d8BdehnPYzV0eRpXkM1bu9LnGHNZqSl8e+yYKtR/O8yOIO29wdkM5BgkzQCepuliEcVtOkcFqVllKwRfQDbnf0s0OFYaNnGjSvfWRx3Eev7+jX24z/6arG+2fxmgLFC74zlh8+D8kgau0E1zZgAMEVSAgWOTALLgNnJiUzYdovuXUd3KR44vg79Ee7aECZavrH+4/Ml7ESl2S9o+IkIrmCSAwaZPCKVdkbiNuo8PmwjVnuI2XZjMRZ8zt1muGCeNCRw8c+mKk+e6gtknyyYEzn7LHi4PymT3R57uRG45Y1jBx1L5aqD0tcp3ugNvmtrl/SrpCyt2lNeqk1WaIVjikvHM4AUVWePEpJyFDvZcSK6AjVpLUS/BHUIty5MgCvs8bmVW+tW6nkCLfq0Siii/GdRlVWWNmb7qfFDwzpVm5b5ek414IyLQDXFdxnXSXV10rUHJrFcBxt25sjQqftkLgCn1RjG6zF69ImMPYZmRu6uEoXalc9umOlJ626dwFPdPpIna8ZsJTCMA10u6DIU9ifRIYS7amEp/4kDkQz3rU1qZ4B/PZ+4EOcgWb0YKr6W3XUTU8s/pbezlX+by76wLI9wffjOS1ZlrgWh/D3zIOJo+bWSXw4GZKrkKztBw/eeghrsDasd3jU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cysyQ0hSSHVOWHlrSDJ2OG5xL1Y0MjhCYmdET1NNS3pQN3d6VmlLYWhnQ1lE?=
 =?utf-8?B?KzlPRmtJcEc5TWZqMVh4YXpFazRockN5VkhmWmNxTXNuTWcwbm82MmJtMjY3?=
 =?utf-8?B?RTRWZUt3M3V4eFo3dEdYY21vL1hpQ1ZWOG8zcXZNZTMrZjdjYlQySGxLZncx?=
 =?utf-8?B?VytYbTdGV0l2QjBiU01aYlVCK3pLSDRuRWp6MTZYY0IvL255cjQ4eWtrVnNw?=
 =?utf-8?B?ZUxCTnF5YXc3R2Z4SUxTYXZnL1IvZ0ZjMUdBU2xDY3BncE5mSGNab2JCR1p3?=
 =?utf-8?B?K0MzWXlEMTJXczdhb3B5OHdQT0ljSHpRTURWNW9zdk1wRjhEWVJXb0lWSjdQ?=
 =?utf-8?B?cTNlQUtCZU9HdmNMMWc3b21DSEI0cEs5SGhjUldoeG5TUlRXQ21zUk8yZnJZ?=
 =?utf-8?B?d1IwUWtoTmRVb3BGMitqZGgvRUF1ZkhrYW9IbzlSeUdVVzRTeDdpMlh4eWVU?=
 =?utf-8?B?MVd1SUp5ekdTRWpPck5MaDdmZEo1aXpGS3dkT2p5YU40dW1pU1VQZWo2SGkr?=
 =?utf-8?B?ZUt4WWNJQ1o0SnpqdjFHeTZZRHJ2U2tZMW9wWFA4TVBNWVdLa0kvRjlHNUI3?=
 =?utf-8?B?cS91VTg3WHJCYU5JN052aU8vei9KejREenk5VDZ0VVZFODFhWTBGNmFORG8r?=
 =?utf-8?B?dlIrVE1xTURCZU9ralp2dmxzWTBURWpoQVFxKzc2N20veFl1VVRxSVFpUzkx?=
 =?utf-8?B?a2RXR1MwRGJTdFo4bkpUNUhhSm9VYWJpMEx2UTlaT0EvWkNMU2tyczdEd1cw?=
 =?utf-8?B?WHR1OXZXL2JWdmpvYXQ4K0VaWmNlYk1wRUFTTytvMFplVDlRdlFvRkFjZ2dN?=
 =?utf-8?B?ZVlORC83dUsrSDFRMGYwWVdKeHR3RERIdkw4RElPYTlwcFdpdHpIeHh5L0Er?=
 =?utf-8?B?b1V2cnRUa012eitoR1hZeTZjRkFIZlBib1hScUNHeGgyTXFzbC9keThMM2c0?=
 =?utf-8?B?MGJQRU1QNDBVSHlqeVN5dGVHdHNxdUxtcURWWTBnaWNaazNybi9NYjByMHUw?=
 =?utf-8?B?TTluYjhQbDFqNDdBL0hxNXNhQ0dEbzVXSEhvZ3E0Z01iRFFZL1NDaS9TdWcz?=
 =?utf-8?B?TzB5ejlYcVJJN2tJckNveFJxcEdMVmlsdS9aOFgxamM4R2V2NUIwTTBWNVNQ?=
 =?utf-8?B?VUF1Sk1LU1hXUHNETEMzK3VlNCtCaXZXbVRWdjNNMHJweFNrRWRzQW1YQ0la?=
 =?utf-8?B?ak83YjVaK2pGaTdybVNwQzRRR1BtMDJ0QXZjZmkvRkFBa0FDSndZUGFXbHRp?=
 =?utf-8?B?Zk1nWTZrV1M5dTUweFdsV3U4L1NZR3dXMm1OLy9vK1RsNWZ1dXdsTzNOaEp0?=
 =?utf-8?B?cmU2Z0NsVy9Ib1JUeVVpVzhMYW5hTUlkSzFsMU9wTlZTVTVQR29KdFE5NlJV?=
 =?utf-8?B?dTdKa041c1U4Uks2RGJBS3pqYXVIL1BFRmhpQU56UkFRREhHUlg3TUx5Vjk1?=
 =?utf-8?B?QndFL2tJUWpCNXpCYTZVYXc4dHdjWmZJTnh5bVVkL3JyQ2gyeGQydkZGZDV3?=
 =?utf-8?B?Z0VSNitTUHpWOTBjWXFxU3pzaGxSRi84VVBVWVNDdTkzQ2owb3BEcEVEOXFE?=
 =?utf-8?B?clk0T0hYMnprRTg0Y3RZSHB4eFBicUJ5UnhaQTVmYTA0OEV3TlhHK2x0bmR2?=
 =?utf-8?B?NDJqSnBoaldXdG1NY2NRcUc3VmJJOUpsWjh0a1dZN0lqcVBYUHdtM2J0bGFX?=
 =?utf-8?B?L2JvY2I2d2hZTWRXeUJoSUVGbm1KeU9YNjg4NzZrRnJqbjlFc0MwZXF6QTNZ?=
 =?utf-8?B?UUU4dnFBSEJma0w4VUZkVHZZNnZjbXRqeE1xSk1wSzNPOVRxQkZ2cGJ0eDQ2?=
 =?utf-8?B?RzJxYW9MZDZjZFVDM1N2cVc1K0R2WTNiQzJsbGtCTHBsOG1PVWVQNGlUTmxB?=
 =?utf-8?B?SW1oNFpjNnI4a2FmRENWa29VcFNtNzkrMkNwUkN2STRFRDNkckxEeXlKc2or?=
 =?utf-8?B?QmFGRlRaY1M3Vk5EQUFYdmpDR0Y2dVBxV2dUeEdMcDVieVRUYlZmc2J3YnM3?=
 =?utf-8?B?cDhyWjJVZzVVL0JyeDlnRk0yYy9Cc3VCUGlGQllkNm4zSWxLSEFzdit0bkFV?=
 =?utf-8?B?bnRXNnVSYjE1ZWZGbDJvVk9YUGxEd0dmNy9sMjdhWG1PTmlHWC92WDVxVzBW?=
 =?utf-8?B?VXB1akN1cmp2U3lOMXpzbzBLSFhDSkZud3Mvcm1kWlovVVlJM3lHaW51NEJa?=
 =?utf-8?B?aUo1Tkc4R3VYRXZUZlg4alpuYTFnSStFUG4zMHZCcHZ4SWR1OEJvUGhUUE1O?=
 =?utf-8?B?dVR0MEJRaGNIbUI4cVhpOWs1QXRZVm9aNUgveFFrbkxzZTBKdm5rMlhNSlhM?=
 =?utf-8?B?RDgwNXNNRDFoZzVMd3NrdlQ2UHNWWXZoOEg0SklOV3NaMTRvbDEzUT09?=
X-Exchange-RoutingPolicyChecked: oWkRi2JX6nXACIoL0nUJs2uMazQKliejTtgPqFM6gskeQL5AZQraf9auMgHYd68CmIW0QN7Uri92nWoMGLDRwSL7hhq9N2R43awEHYeSOWPEcLkdJ4phDYKcHwWuuwaU7AGaZj1VRVtAWVd1vnkC6vX89oI9NqnKxmiH/Da8lTK44SaA4kGBihDADUTRXq/VjX1X+A0ulOEi8DhGF/VURE5ZHghAt2wfay/tQtybyQ28Ca2UnaASUPGoDAQ9AigjFJ+58aJYUy58R5/pdSQKlLb9EYO9i27b4abGVTOwuCUiKg1TG0ed/gpJA70GW6YosDmd2bErxbdUWE62LdJ+DA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10673a90-0681-42a9-c538-08dea02ce412
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 05:06:20.6446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3FQQJugwlIOZWB6Xo6IvSnbb/BPcaFcAJ8nAPm/p6pc9S8KMovgGhyYz2s7FaDkJmqqnpWhQcgkFlNicmIZrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9301
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

Hi Kunal,

On 4/21/2026 10:48 AM, Joshi, Kunal1 wrote:
>
> On 20-04-2026 11:42, Karthik B S wrote:
>> Currently, the test is rejecting outputs where the mode does not match.
>> This is leading to excessive skips on configs where the tests
>> were passing previously.
>>
>> Instead of this, use default mode for fixed-mode panels if the required
>> custom mode is not found, and use custom mode for external panels as
>> these are allowed and have also been passing previously.
>>
>> v2: Fixes in output_supported_mode (Kunal)
>>      Add description to call out fixed-mode on internal panels (Kunal)
>>
>> v3: Fix documentation issue on compilation.
>>
>> Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
>> Cc: Kunal Joshi <kunal1.joshi@intel.com>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> Tested-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>> ---
>>   tests/kms_bw.c | 82 +++++++++++++++++++++++++++++++++++---------------
>>   1 file changed, 58 insertions(+), 24 deletions(-)
>>
>> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
>> index 4df5c2cee..fea7d9d38 100644
>> --- a/tests/kms_bw.c
>> +++ b/tests/kms_bw.c
>> @@ -35,7 +35,7 @@
>>   #include <xf86drmMode.h>
>>     /**
>> - * SUBTEST: linear-tiling-%d-displays-%s
>> + * SUBTEST: linear-tiling-%d-displays-target-%s
>>    * Description: bw test with %arg[2]
>>    *
>>    * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 
>> 15, 16
>> @@ -47,7 +47,7 @@
>>    * @3840x2160p:       3840x2160 resolution
>>    * @2160x1440p:       2160x1440 resolution
>>    *
>> - * SUBTEST: connected-linear-tiling-%d-displays-%s
>> + * SUBTEST: connected-linear-tiling-%d-displays-target-%s
>>    * Description: bw test with %arg[2]
>>    *
>>    * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 
>> 15, 16
>> @@ -186,14 +186,16 @@ static void force_output_mode(data_t *d, 
>> igt_output_t *output,
>>       igt_output_override_mode(output, mode);
>>   }
>>   -static bool output_mode_supported(igt_output_t *output, const 
>> drmModeModeInfo *mode)
>> +/* Check if output has a matching mode and call it out if mode is 
>> being forced */
>> +static void log_output_mode_support(igt_output_t *output, const 
>> drmModeModeInfo *mode)
>>   {
>>       drmModeConnector *connector = output->config.connector;
>> +    drmModeModeInfo *default_mode;
>>       int i;
>>         /* Virtual/forced sinks support all modes */
>>       if (!igt_output_is_connected(output))
>> -        return true;
>> +        return;
>>         for (i = 0; i < connector->count_modes; i++) {
>>           drmModeModeInfo *conn_mode = &connector->modes[i];
>> @@ -204,26 +206,33 @@ static bool output_mode_supported(igt_output_t 
>> *output, const drmModeModeInfo *m
>>               igt_debug("Found matching mode for %dx%d@%dHz on %s\n",
>>                     mode->hdisplay, mode->vdisplay, mode->vrefresh,
>>                     igt_output_name(output));
>> -            return true;
>> +            return;
>>           }
>>       }
>>   -    igt_info("Mode %dx%d@%dHz not supported by %s (has %d modes)\n",
>> -         mode->hdisplay, mode->vdisplay, mode->vrefresh,
>> -         igt_output_name(output), connector->count_modes);
>> -
>> -    return false;
>> +    if (output_is_internal_panel(output)) {
>> +        default_mode = igt_output_get_mode(output);
>> +        igt_info("Mode %dx%d@%dHz not supported by %s (has %d 
>> modes).\n"
>> +             "%s Default mode: %dx%d@%dHz\n",
>> +             mode->hdisplay, mode->vdisplay, mode->vrefresh,
>> +             igt_output_name(output), connector->count_modes, 
>> igt_output_name(output),
>> +             default_mode->hdisplay, default_mode->vdisplay, 
>> default_mode->vrefresh);
>> +    } else {
>> +        igt_info("Mode %dx%d@%dHz not supported by %s (has %d 
>> modes). Forcing mode.\n",
>> +             mode->hdisplay, mode->vdisplay, mode->vrefresh,
>> +             igt_output_name(output), connector->count_modes);
>> +    }
>>   }
>>     static void run_test_linear_tiling(data_t *data, int n_crtcs, 
>> const drmModeModeInfo *mode, bool physical) {
>>       igt_display_t *display = &data->display;
>>       igt_output_t *output;
>> +    drmModeModeInfo fb_mode;
>>       struct igt_fb buffer[IGT_MAX_PIPES];
>>       igt_crc_t zero, captured[IGT_MAX_PIPES];
>>       int i = 0, num_pipes = 0;
>>       igt_crtc_t *crtc;
>>       int ret;
>> -    bool has_supported_mode = false;
>>         /* Cannot use igt_display_n_crtcs() due to fused pipes on 
>> i915 where they do
>>        * not give the numver of valid crtcs and always return 
>> IGT_MAX_PIPES */
>> @@ -242,14 +251,28 @@ static void run_test_linear_tiling(data_t 
>> *data, int n_crtcs, const drmModeModeI
>>           crtc = data->crtc[i];
>>             output = physical ? data->connected_output[i] : 
>> data->output[i];
>> -        if (!output || !output_mode_supported(output, mode)) {
>> +        if (!output)
>>               continue;
>> -        }
>>   -        force_output_mode(data, output, mode);
>> +        log_output_mode_support(output, mode);
>> +
>> +        /*
>> +         * On fixed mode panels trying to force a custom mode can lead
>> +         * to failures or implicit handling where the default mode is
>> +         * used even though custom mode is requested.
>> +         *
>> +         * To avoid this use default mode on fixed mode panels and
>> +         * use custom modes only on external panels.
>> +         */
>> +        if (output_is_internal_panel(output)) {
>> +            fb_mode = *igt_output_get_mode(output);
>> +        } else {
>> +            force_output_mode(data, output, mode);
>> +            fb_mode = *mode;
>> +        }
>>   -        igt_create_color_fb(display->drm_fd, mode->hdisplay,
>> -                    mode->vdisplay, DRM_FORMAT_XRGB8888,
>> +        igt_create_color_fb(display->drm_fd, fb_mode.hdisplay,
>> +                    fb_mode.vdisplay, DRM_FORMAT_XRGB8888,
>>                       DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
>>                       &buffer[i]);
>>   @@ -258,10 +281,8 @@ static void run_test_linear_tiling(data_t 
>> *data, int n_crtcs, const drmModeModeI
>>           igt_plane_set_fb(data->primary[i], &buffer[i]);
>>           igt_info("Assigning pipe %s to output %s with mode %s\n",
>>                igt_crtc_name(crtc), igt_output_name(output),
>> -             mode->name);
>> -        has_supported_mode = true;
>> +             fb_mode.name);
>>       }
>> -    igt_skip_on_f(!has_supported_mode, "Unsupported mode for all 
>> pipes\n");
>>         ret = igt_display_try_commit_atomic(display,
>>                           DRM_MODE_ATOMIC_ALLOW_MODESET |
>> @@ -273,9 +294,8 @@ static void run_test_linear_tiling(data_t *data, 
>> int n_crtcs, const drmModeModeI
>>         for (i = 0; i < n_crtcs; i++) {
>>           output = physical ? data->connected_output[i] : 
>> data->output[i];
>> -        if (!output || !output_mode_supported(output, mode)) {
>> +        if (!output)
>>               continue;
>> -        }
>>             igt_pipe_crc_collect_crc(data->pipe_crc[i], &captured[i]);
>>           igt_assert_f(!igt_check_crc_equal(&zero, &captured[i]),
>> @@ -284,7 +304,7 @@ static void run_test_linear_tiling(data_t *data, 
>> int n_crtcs, const drmModeModeI
>>         for (i = n_crtcs - 1; i >= 0; i--) {
>>           output = physical ? data->connected_output[i] : 
>> data->output[i];
>> -        if (!output || !output_mode_supported(output, mode))
>> +        if (!output)
>>               continue;
>>             igt_remove_fb(display->drm_fd, &buffer[i]);
>> @@ -319,7 +339,14 @@ int igt_main()
>>           n_crtcs = i + 1;
>>             for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
>> -            igt_subtest_f("linear-tiling-%d-displays-%s", n_crtcs, 
>> test_mode[j].name)
>> +            igt_describe("Exercise bandwidth test using linear 
>> tiling across multiple pipes "
>> +                     "on a combination of phical and/or virtual 
>> outputs."
> NIT : Typo : physical
> Can be fixed while merging.
>> +                     "The test targets a bandwidth configuration 
>> corresponding to the "
>> +                     "requested mode, forcing the mode on external 
>> or virtual outputs"
>> +                     "(where supported).On fixed-mode internal 
>> panels, if the native mode "
>> +                     "is used even if it does not match the 
>> requested mode.");
>> + igt_subtest_f("linear-tiling-%d-displays-target-%s",
>> +                      n_crtcs, test_mode[j].name)
>>                   run_test_linear_tiling(&data, n_crtcs, 
>> &test_mode[j], false);
>>           }
>>       }
>> @@ -328,7 +355,14 @@ int igt_main()
>>           n_crtcs = i + 1;
>>                     for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
>> - igt_subtest_f("connected-linear-tiling-%d-displays-%s", n_crtcs, 
>> test_mode[j].name)
>> +            igt_describe("Exercise bandwidth test using linear 
>> tiling across multiple pipes "
>> +                     "on physically connected outputs only."
>> +                     "The test targets a bandwidth configuration 
>> corresponding to the "
>> +                     "requested mode, forcing the mode on external 
>> panels."
>> +                     "On fixed-mode internal panels, if the native 
>> mode "
>> +                     "is used even if it does not match the 
>> requested mode.");
> NIT : Remove if, Can be fixed while merging
> On fixed-mode internal panels, [if] the native mode is used even if it 
> does not match the requested mode.
> On fixed-mode internal panels, the native mode is used even if it does 
> not match the requested mode.
>
> LGTM
> Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>

Thank you for the RB.

Will make these updates during merge.

Thanks and Regards,
Karthik.B.S
>> + igt_subtest_f("connected-linear-tiling-%d-displays-target-%s",
>> +                      n_crtcs, test_mode[j].name)
>>                   run_test_linear_tiling(&data, n_crtcs, 
>> &test_mode[j], true);
>>                   }
>>           }
