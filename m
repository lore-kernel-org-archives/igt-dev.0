Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C62C71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 08:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357D010E2D9;
	Mon, 16 Jun 2025 08:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vo3617+g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD06A10E2EE
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 08:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750062231; x=1781598231;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yeTvnWFuTIGgpPjSLLRcCbPxlrnOPEhMy2wU053qyRI=;
 b=Vo3617+gP4HnU/yXR9I+Zr9G5PA1NLi8DQ7u/6dUbxJcNPL6XCyQHVyt
 NJtqLwBfs2mlxm0vwOkZhtFZumVo+acMfE4dtOmbAvOnbANlQkuA2mw+f
 82HZte7SL0TLf+S2rb/D7S6BydOo1IION1QAGSM1ek5wLuhmHk8mo2pym
 oUPzc6NS+MYfX3iV05ecgpqH8bKppGCxGDavxorgHehYOg+MBVRmHdcLU
 EWM8BbuLG7SKT4SoQnmt7hEFnfP+t+SgdoebAOShiqzW+Ko+ez/OcD/zx
 HUJUd2axaszUycAkOIcf7Ud/CPXvpiSeR0/m17Sd8xpu8BPv+k0Nw51l0 g==;
X-CSE-ConnectionGUID: uWSG6N0aQ+SCIDfxWo3nZQ==
X-CSE-MsgGUID: ztZjqlyaReqbQgdtNNAs1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52342118"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="52342118"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:23:50 -0700
X-CSE-ConnectionGUID: ZArlUBUgSHiYAfn45RuzaQ==
X-CSE-MsgGUID: iuuaLR/URuC08GFAQ2ZLIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153707421"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:23:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 01:23:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 01:23:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 01:23:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2Yz40tYR7FQHnngpvnsFWSPIMdYJfw7iL3ATHny8cYUpbuV15hdb6ew7D8466TaqxrYcX/Znx+cIw2l3BpuhkBy4BwIg2HBk3St3XQfJTq0wwHEJoBRkLngTdGUrBfS34/gLlHI3Avl2zHSYMSCS17jCAmGy9KpgZOLewMd33smav8IuiX0aV01UkcJ5dNJSOtygPulrQMvak3IFLsIFSwI/B+aRQktRgRaXQpWlQZO5LFXL6fbJezc3vNbP7Ge+okAGIptJp9FafSvwUOKjJ/8t9N5PBVHDiFhuCZW+8aJxTIvpxO5tGARutvpQONHNS8aV4bCPLlHHidc73eirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XM8gg8XLsnedjdxnJWH/A68NxzzqgxtZWOYiqZkkKxw=;
 b=Ek+kdJkSqJfoDGLQmsKKVyS9LpYoZsfT6mXeGopK8aett4z78Gm0rmR9T8JB1pb3IzWB8+hWKfhZ/ojsjrjaTkcBrLCgN3ozRjDJl7jQ+VnAwsdIwS6+WNvOkWxG5EixzH5dZ0efw51XijIuL+arQUJYJCe0FZuASrjsGZ4kXy2TLdeO8RKwMlFXnAvrNQPH+d1oz+m/AbpG3zsMg901sNxUwACIe0AZJ/Dlw2yNG3bbwEhFWVyLaxGJiD0vpYn78fm3MKocUTK3Hv0ccXWrhJxB9vgHu/mE2Vy/jetL4qtOWYCV52nFS94Q7omIcpNP/bpfWVOwea3WNIRHVXvXqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH7PR11MB6834.namprd11.prod.outlook.com (2603:10b6:510:1ed::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 08:23:45 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 08:23:45 +0000
Message-ID: <77f1cc60-03a0-4c50-b952-412f88c92af6@intel.com>
Date: Mon, 16 Jun 2025 13:53:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_getfb: replace CCS with NV12 and use
 libigt functions
To: "Kahola, Mika" <mika.kahola@intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20250526122039.50519-1-juhapekka.heikkila@gmail.com>
 <DS4PPF69154114FAA703FC19AF91AB6D869EF6BA@DS4PPF69154114F.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <DS4PPF69154114FAA703FC19AF91AB6D869EF6BA@DS4PPF69154114F.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH7PR11MB6834:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d6a0be-e43c-42e2-ec5f-08ddacaf1c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REN0T3grZTA3akpMZndEVFJHTmRvV3lEdlQzZ28zNFBOL1RGQitRRjVrL00z?=
 =?utf-8?B?Zkh4Y0VkN2JzY2VaY283aCtzaC92U0V3bjgvZlBJbTRzT1cxMXlGMmFya1pS?=
 =?utf-8?B?TlR1S2R2ZXNGaklIeExTMllOeVpLZGhSWnBqZXVwUkVpdjE2cmVzbE8yeWd5?=
 =?utf-8?B?Si84SnQzRTFoUkl2eHhSaUI1VlV4VDNPdXYzekRUd3Fsa0habXF0RTNMSU5V?=
 =?utf-8?B?SjNIZG84OE5LYW9UQzVkNTBKUXB4SHFBbFBMRi9pQmtVd2JMMjFxZ3RoWDRr?=
 =?utf-8?B?cHpkVUhFQVdqTlBRQWFvYmFBNllsUHVYQXhjRjJ2c1ZuRDY2WGxOSGlSdjRa?=
 =?utf-8?B?UGhtdjFlWkRXK09lMm5QczlCWFMyMFR0cDVmT1U0aHcrU2JkczJIa2lRS002?=
 =?utf-8?B?MUZzM1dJbEhtWng4RWl5VDQySTlvYVVlVnkyNldBT21SVXJMN05aN080Rnh3?=
 =?utf-8?B?djg3UTNDOVloZ1ZEL1R0RTF2M2dybmNXckJLUTExczQxK05XUjJuVVhONS9O?=
 =?utf-8?B?TElzdmVEZTI3RXkrOFY0R3JXRkNZZkFNWWdxczg1STVkbnNwanBXQmJzRCtI?=
 =?utf-8?B?eTJjSDFUQVpmM09VdG9sLy81TWN6U29nanQ1T3EvYytya1hvT1Z6V0J2ZjZQ?=
 =?utf-8?B?dFRTdlBud0dtTFN0bzhnekM5Sk5URHRKVDdzTmkxem96ejI4YzMzKzBvTERQ?=
 =?utf-8?B?TzhPNkRvK3lPNGtWblFBek4yc0NETitzazZEbUgrUmlWUjc0MEtBL3A4Nkcz?=
 =?utf-8?B?RnVQaWk0bXpONENLa2szaWhhakRWODVhK1J2SWVMVm5SSXowblh1VGJvWEV1?=
 =?utf-8?B?bGFUcWN5Qm1ka01JYmQvMWdVZFoxakJMeTd4ejJVRy8vNWlmbWpqaFR6TmVN?=
 =?utf-8?B?LzZQaWtpYXpzWTRpTklKMlNzeTFJcHpxRXRnYlgwRU9VeDhzK2tmQ05wN0xt?=
 =?utf-8?B?Yi9NVHEvK0pEN3c3cGQ5bHZrZEp0L0wreGlBVzhYYXJTeUVScVFiT2tBRHcv?=
 =?utf-8?B?d0lNc1o3UzZDUUxyZjM1ZVo5U0tmUFZQZGF1bTJheUlGQ2ZPdGQwSkJLVnV2?=
 =?utf-8?B?UkZsQ0NhcW1aVk5VTis3OVhvSExtK3FVayt1UVJNVTMzK1BVR1IreWZwOHpV?=
 =?utf-8?B?ejkwTXl1SE0rZ2toUjM1UmMxM2FHNUxPU1VTaTRma0xzSEN1akxMRG9udjBx?=
 =?utf-8?B?TUVpaVBwQ3Q0aWZvTHN6QzBHblJ3UWMyVFRWakFYWDIyUUptczgwS1B2NHM4?=
 =?utf-8?B?QzNmK3crajlnZzBTRURRSHJOcGpYRGdYZ3YzR2d6R1BxRktmK2t5NERMMXlI?=
 =?utf-8?B?a3k3RUxNTVQ1Um8xZzVMZllXT21BdmVxVVZ4NnczSkhMZzBoNThydUpXQ3lI?=
 =?utf-8?B?Mzdhc0haR3pOdFFNeXgrMXU5SGl2bGZ4eUt4ZFBRVHJIeDE4cVpwb3N6ODBN?=
 =?utf-8?B?ZTdUT2V6MzBBK01mTUlabnNWNUx6Rkl5bTRYdUc3OU1uYlN1Nm81OWxLaG8z?=
 =?utf-8?B?MFZZMjNrTzRrL21JcUlFd0kwVkQ2d0FoVkc0c29GNk1iQnZHUVFKQzFUa0VK?=
 =?utf-8?B?MmVPUzFsTjljOWN5eDBYNUE0bU1WYW43UXRia3o5dVJqL3YzaFZTRFplOGgv?=
 =?utf-8?B?L250T05rM3VnanAvaktOdWpBM3VoNlFQWkR5WDZrQWZyS1oyeHg1ZWsxa3dG?=
 =?utf-8?B?Zm54RkV6Q3BUaW51ak1yUzlHV3RCRFNzRXJsRURBYXFYK2NCUTRzZWYwUVVC?=
 =?utf-8?B?cnBvYXpFK1kwcjRZbjZ6RERBdnBid25ILzJoRm1NVHpwZStjbFdkMFpPdGVh?=
 =?utf-8?B?K3hSS3pQblI4NDBPL0dmMlZlRFI5L0RqbEExUTlHWXRiZDVUbjFibSt6eTdK?=
 =?utf-8?Q?OME7arVMmXRAa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzJQd2Q4dVhtZ0kxWlNQZlRwSWxTcHJaZkJzN2dQVVdVbmZYTjQ0dnVySGx2?=
 =?utf-8?B?ZVRKZWZvT0xkM1B5WVpwYlJUWEdzL2J1djJpWGRoZFhRbjQrUkZlRmZJZFdT?=
 =?utf-8?B?OEp2dnFKQVFJRVU4R3RCSWV2bTZoc3FITHhoRGpnYU1hUzljbkNrVXBqUFJN?=
 =?utf-8?B?SjBWTW96UFFkVFVDQWd5OXZIUUJnZ2FBWDNTWncxeStMS2Z4K1lsUFlwS1lW?=
 =?utf-8?B?a1VDR3JqVHo1azBnWWZDU2JGM1h3V1RpU09VQ0dOYzlUQVJQdklWT0RYVjBk?=
 =?utf-8?B?cmlROFlVdXBpQ2grWGQyankxdDlobUVMWUc5RXE2L3RqaVVBRTVNcVk4TjVJ?=
 =?utf-8?B?bStPM290SlZFWjQrTlFmOTVXTkV2R3F0UVRiYUVxbTBUVW1nNlM3ZTk5eThr?=
 =?utf-8?B?L1Vxcm5uSTZtdGVGbzlRY290TjFaOHpOUitUZ3NldllpRjc3UmxqV0JlYVdk?=
 =?utf-8?B?VXkrQXlhR0ZkRnNZMDduNHltRkxVaEdDanMzbGhhYkFVREtFaENlWlB0N0lm?=
 =?utf-8?B?eUNoL3p2QktqT093cEIyZmlmMk1sZHlmS2NvVHhXaXJ1YWs3NlNEK2tUTHdM?=
 =?utf-8?B?L2Y3SkIySnY2Z0pwbTNTTlIyT1o4OVRmcnE3bWNoczEzVlRPTGRwZFRhQXBF?=
 =?utf-8?B?aXBWQWVnY3RKRlNTK09uWDlyVUNGTldUQnJvN3pFV2ExdmkvZjhNUmt0cWI4?=
 =?utf-8?B?OEgrZHhMVm9Odk0rdGxPRUswanNhbGZlOGNFMFArMDN3SU11U1VEbGpoUi94?=
 =?utf-8?B?eFBZNnBGL3dDZ3V1SmI4MjA3Yy95V2h0SEJNZTd5Ny9GM0RtbnFndit5OFEr?=
 =?utf-8?B?VzNJQmdocXEzT2xLTW5iS09kams3eTMxcmFFREtoTGhSV3laNG85b1FWVnpV?=
 =?utf-8?B?Znk4enlDblVBQWdSMnJBTzcvMTZnczJVZXNTdk1lL2twWTk1UlRndkFEc1ZN?=
 =?utf-8?B?SDY4Y3FvbmJ6SUV6K3h6WFZXSXNHV3R2R1ZQVTNvODhoRnhvdWk0Sk52aHBl?=
 =?utf-8?B?Um13Qnc3cHZJbm1iQmN4dnpsdFBiQlNUdkpsbUp6NWFxOUJnand0TFQwS2V0?=
 =?utf-8?B?Qnk0Z0t1WGpnRkx5TWtvNGdrczljR3k4dTAzR0h3akVIdkE4a0VkMVdMcEVW?=
 =?utf-8?B?eDNFZUZpTkN0U1hENWgrSjcwajRWNHJnQUs2OVdXdWYzaEQvSmVoOFFkdGM3?=
 =?utf-8?B?NlBUdS9ndCt0cGhYUU0raWlGK1NycTdFWHNoVXF6STZyT3hGTzZFYkxHR1B1?=
 =?utf-8?B?eDYxRzQvckV6djFaRE5GTm5saWF2cFR2T2JjZ2FEbG1GMnhwMGpIcnR1S2tT?=
 =?utf-8?B?cHdlR0FkYkQzQStvUmsvQW9VZVNCL0dxc2xvaExWTGt5WUVrVTZvdEVRV0hl?=
 =?utf-8?B?L0h5NjJQTWpYTEJOK3ZUbVdmU0tGYlZFY0xIbW80eVZqWkdGQTNkSDRjeEdl?=
 =?utf-8?B?My9OZk1oRk4wbGNyS1lpaTJlOElxZ3kvRFdyR3oyeUl5YTVISzBraUtZOWVj?=
 =?utf-8?B?ZGlYSStLQlI2Y1BTdTc4aE44VVdJQkgwbHF2ZzVPWEJ6OWxFODMyblRDVlBl?=
 =?utf-8?B?d0YyN3hKZS8rV0JvR0doTWpCdnB0ekF6dTlGM2hadXNDdkJQSVQwS3pFVEhq?=
 =?utf-8?B?RGlxNGdDMzkyNFJ5Y2NnU2dISWVZSFFXWDhBR1VpelpzQXR4WVFRUmtsRVdu?=
 =?utf-8?B?bDhqencvSG9PQVozSm16MUg3YnBScWY5QkhibkRrOUlzT3Q1dnNtK2pQek9m?=
 =?utf-8?B?ZHVveE1OOWxNUDM3VXlEZUZrQmx3blZnOEN2cjVxdDJQWE9ETHFtRkhoeURK?=
 =?utf-8?B?dzlMdjE5Ky9Hb042bXpoNmFrWFc1d3Vxd244dHVSOXk1UDJqWlJ5WGNWU0lD?=
 =?utf-8?B?NVJQRG02cUEyK1dvZVVFcHo3dnNNNzFuNW9EWGJnVW9aQ3JLZUcxdjU1NnJD?=
 =?utf-8?B?alBxN21ybkdxWmFIcXY3dkNsK2FtWWRyejBlR3dsWjlEUkZrYlprYVVoZkxy?=
 =?utf-8?B?eHRRekg4blVaUjBQODNmRThKenB1Z1JpVTVBTHRPWHFGS1FtalNWckJLc283?=
 =?utf-8?B?V1JOVHdZc2JUbUc4bG82TGlZdzNiN1h6YkFkZHBBMWcrOFRnMFVRNTNpMHJs?=
 =?utf-8?B?RnlERVBGMVQvWlIzdU1xS09XcGl4bUQ4RnlicERyL003dG02WDNmdWRDbTdZ?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d6a0be-e43c-42e2-ec5f-08ddacaf1c29
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 08:23:44.9868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKyNK8m2Z4BebsLc4Ic3PhTNwF69sZECtY1n3FVUV/7HHo7q1+B0Fs1Kg5e5lO8X0sECwlqqhHc9iYTPlldFOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6834
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

Hi JP,

Patches LGTM and even results look good.
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13255/shards-all.html?testfilter=kms_getfb
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13255/shards-all.html?testfilter=kms_getfb

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 09-06-2025 05:12 pm, Kahola, Mika wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Juha-Pekka Heikkila
>> Sent: Monday, 26 May 2025 15.21
>> To: igt-dev@lists.freedesktop.org
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Subject: [PATCH i-g-t] tests/kms_getfb: replace CCS with NV12 and use libigt functions
>>
>> Replace use of CCS with NV12 making tests non-Intel specific. While doing so had to do bit of replacing legacy igt code.
>>
> Looks ok.
>
> Reviewed-by: Mika Kahola <mika.kahola@intel.com>
>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   tests/kms_getfb.c | 339 +++++++++++++++++-----------------------------
>>   1 file changed, 122 insertions(+), 217 deletions(-)
>>
>> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c index 496d2c45a..7c4a42856 100644
>> --- a/tests/kms_getfb.c
>> +++ b/tests/kms_getfb.c
>> @@ -66,8 +66,8 @@
>>    */
>>
>>   /**
>> - * SUBTEST: getfb-reject-ccs
>> - * Description: Tests error handling while requesting CCS buffers it should
>> + * SUBTEST: getfb-reject-nv12
>> + * Description: Tests error handling while requesting NV12 buffers it
>> + should
>>    *              refuse because getfb supports returning a single buffer handle.
>>    *
>>    * SUBTEST: getfb-%s-different-handles
>> @@ -81,8 +81,8 @@
>>    */
>>
>>   /**
>> - * SUBTEST: getfb2-accept-ccs
>> - * Description: Tests outputs are correct when retrieving a CCS framebuffer.
>> + * SUBTEST: getfb2-accept-nv12
>> + * Description: Tests outputs are correct when retrieving a NV12 framebuffer.
>>    *
>>    * SUBTEST: getfb2-into-addfb2
>>    * Description: Output check by passing the output of GETFB2 into ADDFB2.
>> @@ -126,111 +126,13 @@ static bool has_getfb_iface(int fd)
>>   	}
>>   }
>>
>> -static bool has_addfb2_iface(int fd)
>> -{
>> -	struct drm_mode_fb_cmd2 arg = { };
>> -	int err;
>> -
>> -	err = 0;
>> -	if (drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &arg))
>> -		err = -errno;
>> -	switch (err) {
>> -	case -ENOTTY: /* ioctl unrecognised (kernel too old) */
>> -	case -ENOTSUP: /* driver doesn't support KMS */
>> -		return false;
>> -	default:
>> -		return true;
>> -	}
>> -}
>> -
>> -static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret) -{
>> -	struct drm_mode_fb_cmd2 add = {
>> -		.width = 1024,
>> -		.height = 1024,
>> -		.pixel_format = DRM_FORMAT_XRGB8888,
>> -		.flags = DRM_MODE_FB_MODIFIERS,
>> -	};
>> -	int size;
>> -	uint32_t devid;
>> -
>> -	igt_require(has_addfb2_iface(fd));
>> -	devid = intel_get_drm_devid(fd);
>> -
>> -	igt_require_f(intel_graphics_ver(devid) < IP_VER(20, 0),
>> -		      "No ccs modifiers on Xe2\n");
>> -
>> -	if (HAS_FLATCCS(devid)) {
>> -		add.modifier[0] = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
>> -		add.pitches[0] = ALIGN(add.width * 4, 4 * 512);
>> -		size = add.pitches[0] * ALIGN(add.height, 8);
>> -		size = ALIGN(size, 4096);
>> -	} else if ((intel_display_ver(devid)) >= 12) {
>> -		add.modifier[0] = IS_METEORLAKE(devid) ?
>> -			I915_FORMAT_MOD_4_TILED_MTL_RC_CCS :
>> -			I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
>> -
>> -		add.modifier[1] = IS_METEORLAKE(devid) ?
>> -			I915_FORMAT_MOD_4_TILED_MTL_RC_CCS :
>> -			I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
>> -
>> -		/* The main surface for Gen12+ is 4x4 tiles aligned
>> -		 * For 32bpp the pitch is 4*4*32 bytes i.e. 512 bytes
>> -		 */
>> -		add.pitches[0] = ALIGN(add.width * 4, 4 * 128);
>> -
>> -		/* The main surface height is 4 tile rows aligned */
>> -		add.offsets[1] = add.pitches[0] * ALIGN(add.height, 128);
>> -
>> -		/* CCS surface pitch is 64 bytes aligned which corresponds to
>> -		 * 4 tiles on the main surface
>> -		 */
>> -		add.pitches[1] = DIV_ROUND_UP(add.width, 128) * 64;
>> -
>> -		size = add.offsets[1];
>> -		/* CCS surface height is 4 tile rows aligned */
>> -		size += add.pitches[1] * DIV_ROUND_UP(add.height, 128) * 4;
>> -
>> -		/* GEM object is page aligned */
>> -		size = ALIGN(size, 4096);
>> -	} else {
>> -		add.modifier[0] = I915_FORMAT_MOD_Y_TILED_CCS;
>> -		add.modifier[1] = I915_FORMAT_MOD_Y_TILED_CCS;
>> -
>> -		/* An explanation of the magic numbers can be found in kms_ccs.c. */
>> -		add.pitches[0] = ALIGN(add.width * 4, 128);
>> -		add.offsets[1] = add.pitches[0] * ALIGN(add.height, 32);
>> -		add.pitches[1] = ALIGN(ALIGN(add.width * 4, 32) / 32, 128);
>> -
>> -		size = add.offsets[1];
>> -		size += add.pitches[1] * ALIGN(ALIGN(add.height, 16) / 16, 32);
>> -	}
>> -
>> -	if (is_i915_device(fd))
>> -		add.handles[0] = gem_buffer_create_fb_obj(fd, size);
>> -	else
>> -		add.handles[0] = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0), 0);
>> -	igt_require(add.handles[0] != 0);
>> -
>> -	if (!HAS_FLATCCS(devid))
>> -		add.handles[1] = add.handles[0];
>> -
>> -	if (drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &add) == 0)
>> -		*ret = add;
>> -	else
>> -		gem_close(fd, add.handles[0]);
>> -}
>> -
>>   /**
>>    * Find and return an arbitrary valid property ID.
>>    */
>> -static uint32_t get_any_prop_id(int fd)
>> +static uint32_t get_any_prop_id(struct igt_display *display)
>>   {
>> -	igt_display_t display;
>> -
>> -	igt_display_require(&display, fd);
>> -	for (int i = 0; i < display.n_outputs; i++) {
>> -		igt_output_t *output = &display.outputs[i];
>> +	for (int i = 0; i < display->n_outputs; i++) {
>> +		igt_output_t *output = &display->outputs[i];
>>   		if (output->props[IGT_CONNECTOR_DPMS] != 0)
>>   			return output->props[IGT_CONNECTOR_DPMS];
>>   	}
>> @@ -238,213 +140,214 @@ static uint32_t get_any_prop_id(int fd)
>>   	return 0;
>>   }
>>
>> -static void test_handle_input(int fd)
>> +static void test_handle_input(struct igt_display *display)
>>   {
>> -	struct drm_mode_fb_cmd2 add = {};
>> +	struct igt_fb fb;
>>
>>   	igt_fixture {
>> -		add.width = 1024;
>> -		add.height = 1024;
>> -		add.pixel_format = DRM_FORMAT_XRGB8888;
>> -		add.pitches[0] = 1024*4;
>> -		add.handles[0] = igt_create_bo_with_dimensions(fd, 1024, 1024,
>> -			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
>> -		igt_require(add.handles[0] != 0);
>> -		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add);
>> +		igt_create_fb(display->drm_fd, 1024, 1024,
>> +			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> +			      &fb);
>>   	}
>>
>>   	igt_describe("Tests error handling for a zero'd input.");
>>   	igt_subtest("getfb-handle-zero") {
>>   		struct drm_mode_fb_cmd get = { .fb_id = 0 };
>> -		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB, &get, ENOENT);
>> +		do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get,
>> +			     ENOENT);
>>   	}
>>
>>   	igt_describe("Tests error handling when passing an valid "
>>   		     "handle.");
>>   	igt_subtest("getfb-handle-valid") {
>> -		struct drm_mode_fb_cmd get = { .fb_id = add.fb_id };
>> -		do_ioctl(fd, DRM_IOCTL_MODE_GETFB, &get);
>> +		struct drm_mode_fb_cmd get = { .fb_id = fb.fb_id };
>> +		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get);
>>   		igt_assert_neq_u32(get.handle, 0);
>> -		igt_assert_eq_u32(get.width, add.width);
>> -		igt_assert_eq_u32(get.height, add.height);
>> -		igt_assert_eq_u32(get.pitch, add.pitches[0]);
>> +		igt_assert_eq_u32(get.width, fb.width);
>> +		igt_assert_eq_u32(get.height, fb.height);
>> +		igt_assert_eq_u32(get.pitch, fb.strides[0]);
>>   		igt_assert_eq_u32(get.depth, 24);
>>   		igt_assert_eq_u32(get.bpp, 32);
>> -		gem_close(fd, get.handle);
>> +		gem_close(display->drm_fd, get.handle);
>>   	}
>>
>>   	igt_describe("Tests error handling when passing a handle that "
>>   		     "has been closed.");
>>   	igt_subtest("getfb-handle-closed") {
>> -		struct drm_mode_fb_cmd get = { .fb_id = add.fb_id };
>> -		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &add.fb_id);
>> -		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB, &get, ENOENT);
>> +		struct drm_mode_fb_cmd get = { .fb_id = fb.fb_id };
>> +		igt_remove_fb(display->drm_fd, &fb);
>> +		do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get,
>> +			     ENOENT);
>>   	}
>>
>>   	igt_describe("Tests error handling when passing an invalid "
>>   		     "handle.");
>>   	igt_subtest("getfb-handle-not-fb") {
>> -		struct drm_mode_fb_cmd get = { .fb_id = get_any_prop_id(fd) };
>> +		struct drm_mode_fb_cmd get = {
>> +			.fb_id = get_any_prop_id(display)
>> +		};
>> +
>>   		igt_require(get.fb_id > 0);
>> -		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB, &get, ENOENT);
>> +		do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get,
>> +			     ENOENT);
>>   	}
>>
>>   	igt_fixture
>> -		gem_close(fd, add.handles[0]);
>> +		igt_remove_fb(display->drm_fd, &fb);
>>   }
>>
>> -static void test_duplicate_handles(int fd)
>> +static void test_duplicate_handles(struct igt_display *display)
>>   {
>> -	struct drm_mode_fb_cmd2 add = {};
>> +	struct igt_fb fb;
>>
>>   	igt_fixture {
>> -		add.width = 1024;
>> -		add.height = 1024;
>> -		add.pixel_format = DRM_FORMAT_XRGB8888;
>> -		add.pitches[0] = 1024*4;
>> -		add.handles[0] = igt_create_bo_with_dimensions(fd, 1024, 1024,
>> -			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
>> -		igt_assert(add.handles[0]);
>> -		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add);
>> +		igt_create_fb(display->drm_fd, 1024, 1024,
>> +			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> +			      &fb);
>>   	}
>>
>>   	igt_describe("Tests error handling while requesting for two different "
>>   		     "handles from same fd.");
>>   	igt_subtest("getfb-addfb-different-handles") {
>> -		struct drm_mode_fb_cmd get = { .fb_id = add.fb_id };
>> +		struct drm_mode_fb_cmd get = { .fb_id = fb.fb_id };
>>
>> -		do_ioctl(fd, DRM_IOCTL_MODE_GETFB, &get);
>> -		igt_assert_neq_u32(get.handle, add.handles[0]);
>> -		gem_close(fd, get.handle);
>> +		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get);
>> +		igt_assert_neq_u32(get.handle, fb.gem_handle);
>> +		gem_close(display->drm_fd, get.handle);
>>   	}
>>
>>   	igt_describe("Tests error handling while requesting for two different "
>>   		     "handles from different fd.");
>>   	igt_subtest("getfb-repeated-different-handles") {
>> -		struct drm_mode_fb_cmd get1 = { .fb_id = add.fb_id };
>> -		struct drm_mode_fb_cmd get2 = { .fb_id = add.fb_id };
>> +		struct drm_mode_fb_cmd get1 = { .fb_id = fb.fb_id };
>> +		struct drm_mode_fb_cmd get2 = { .fb_id = fb.fb_id };
>>
>> -		do_ioctl(fd, DRM_IOCTL_MODE_GETFB, &get1);
>> -		do_ioctl(fd, DRM_IOCTL_MODE_GETFB, &get2);
>> +		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get1);
>> +		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get2);
>>   		igt_assert_neq_u32(get1.handle, get2.handle);
>>
>> -		gem_close(fd, get1.handle);
>> -		gem_close(fd, get2.handle);
>> +		gem_close(display->drm_fd, get1.handle);
>> +		gem_close(display->drm_fd, get2.handle);
>>   	}
>>
>> -	igt_describe("Tests error handling while requesting CCS buffers "
>> +	igt_describe("Tests error handling while requesting NV12 buffers "
>>   		     "it should refuse because getfb supports returning "
>>   		     "a single buffer handle.");
>> -	igt_subtest("getfb-reject-ccs") {
>> -		struct drm_mode_fb_cmd2 add_ccs = { };
>> +	igt_subtest("getfb-reject-nv12") {
>>   		struct drm_mode_fb_cmd get = { };
>> +		struct igt_fb nv12_fb;
>>
>> -		igt_require_intel(fd);
>> -		igt_require_f(!HAS_FLATCCS(intel_get_drm_devid(fd)),
>> -			      "skip because flat ccs has only one buffer.\n");
>> +		igt_require(igt_display_has_format_mod(display,
>> +						       DRM_FORMAT_NV12,
>> +						       DRM_FORMAT_MOD_LINEAR));
>>
>> -		get_ccs_fb(fd, &add_ccs);
>> -		igt_require(add_ccs.handles[0] != 0);
>> -		get.fb_id = add_ccs.fb_id;
>> -		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB, &get, EINVAL);
>> +		igt_create_fb(display->drm_fd, 1024, 1024,
>> +			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR,
>> +			      &nv12_fb);
>>
>> -		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &add_ccs.fb_id);
>> -		gem_close(fd, add_ccs.handles[0]);
>> -	}
>> +		get.fb_id = nv12_fb.fb_id;
>> +		do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get,
>> +			     EINVAL);
>>
>> -	igt_fixture {
>> -		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &add.fb_id);
>> -		gem_close(fd, add.handles[0]);
>> +		igt_remove_fb(display->drm_fd, &nv12_fb);
>>   	}
>> +
>> +	igt_fixture
>> +		igt_remove_fb(display->drm_fd, &fb);
>>   }
>>
>> -static void test_getfb2(int fd)
>> +static void test_getfb2(struct igt_display *display)
>>   {
>> -	struct drm_mode_fb_cmd2 add_basic = {};
>> +	struct igt_fb fb;
>>
>>   	igt_fixture {
>>   		struct drm_mode_fb_cmd2 get = {};
>>
>> -		add_basic.width = 1024;
>> -		add_basic.height = 1024;
>> -		add_basic.pixel_format = DRM_FORMAT_XRGB8888;
>> -		add_basic.pitches[0] = 1024*4;
>> -		add_basic.handles[0] = igt_create_bo_with_dimensions(fd, 1024, 1024,
>> -			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
>> -		igt_assert(add_basic.handles[0]);
>> -		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add_basic);
>> +		igt_create_fb(display->drm_fd, 1024, 1024,
>> +			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> +			      &fb);
>>
>> -		get.fb_id = add_basic.fb_id;
>> -		do_ioctl(fd, DRM_IOCTL_MODE_GETFB2, &get);
>> +		get.fb_id = fb.fb_id;
>> +		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_GETFB2, &get);
>>   		igt_assert_neq_u32(get.handles[0], 0);
>> -		gem_close(fd, get.handles[0]);
>> +		gem_close(display->drm_fd, get.handles[0]);
>>   	}
>>
>>   	igt_describe("Tests error handling for a zero'd input.");
>>   	igt_subtest("getfb2-handle-zero") {
>>   		struct drm_mode_fb_cmd2 get = {};
>> -		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB2, &get, ENOENT);
>> +		do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_GETFB2, &get,
>> +			     ENOENT);
>>   	}
>>
>>   	igt_describe("Tests error handling when passing a handle that "
>>   		     "has been closed.");
>>   	igt_subtest("getfb2-handle-closed") {
>> -		struct drm_mode_fb_cmd2 add = add_basic;
>> +		struct igt_fb test_fb;
>>   		struct drm_mode_fb_cmd2 get = { };
>>
>> -		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add);
>> -		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &add.fb_id);
>> +		igt_create_fb(display->drm_fd, fb.width, fb.height,
>> +			      fb.drm_format, fb.modifier, &test_fb);
>>
>> -		get.fb_id = add.fb_id;
>> -		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB2, &get, ENOENT);
>> +		get.fb_id = test_fb.fb_id;
>> +		igt_remove_fb(display->drm_fd, &test_fb);
>> +
>> +		do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_GETFB2, &get,
>> +			     ENOENT);
>>   	}
>>
>>   	igt_describe("Tests error handling when passing an invalid "
>>   		     "handle.");
>>   	igt_subtest("getfb2-handle-not-fb") {
>> -		struct drm_mode_fb_cmd2 get = { .fb_id = get_any_prop_id(fd) };
>> +		struct drm_mode_fb_cmd2 get = {
>> +			.fb_id = get_any_prop_id(display)
>> +		};
>>   		igt_require(get.fb_id > 0);
>> -		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB2, &get, ENOENT);
>> +		do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_GETFB2, &get,
>> +			     ENOENT);
>>   	}
>>
>>   	igt_describe("Tests outputs are correct when retrieving a "
>> -		     "CCS framebuffer.");
>> -	igt_subtest("getfb2-accept-ccs") {
>> -		struct drm_mode_fb_cmd2 add_ccs = { };
>> +		     "NV12 framebuffer.");
>> +	igt_subtest("getfb2-accept-nv12") {
>> +		struct igt_fb nv12_fb;
>>   		struct drm_mode_fb_cmd2 get = { };
>>   		int i;
>>
>> -		igt_require_intel(fd);
>> -		get_ccs_fb(fd, &add_ccs);
>> -		igt_require(add_ccs.fb_id != 0);
>> -		get.fb_id = add_ccs.fb_id;
>> -		do_ioctl(fd, DRM_IOCTL_MODE_GETFB2, &get);
>> +		igt_require(igt_display_has_format_mod(display,
>> +						       DRM_FORMAT_NV12,
>> +						       DRM_FORMAT_MOD_LINEAR));
>> +
>> +		igt_create_fb(display->drm_fd, 1024, 1024,
>> +			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR,
>> +			      &nv12_fb);
>> +
>> +		get.fb_id = nv12_fb.fb_id;
>> +		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_GETFB2, &get);
>>
>> -		igt_assert_eq_u32(get.width, add_ccs.width);
>> -		igt_assert_eq_u32(get.height, add_ccs.height);
>> +		igt_assert_eq_u32(get.width, nv12_fb.width);
>> +		igt_assert_eq_u32(get.height, nv12_fb.height);
>>   		igt_assert(get.flags & DRM_MODE_FB_MODIFIERS);
>>
>>   		for (i = 0; i < ARRAY_SIZE(get.handles); i++) {
>> -			igt_assert_eq_u32(get.pitches[i], add_ccs.pitches[i]);
>> -			igt_assert_eq_u32(get.offsets[i], add_ccs.offsets[i]);
>> -			if (add_ccs.handles[i] != 0) {
>> +			igt_assert_eq_u32(get.pitches[i], nv12_fb.strides[i]);
>> +			igt_assert_eq_u32(get.offsets[i], nv12_fb.offsets[i]);
>> +			if (i < 2) {
>>   				igt_assert_neq_u32(get.handles[i], 0);
>>   				igt_assert_neq_u32(get.handles[i],
>> -						   add_ccs.handles[i]);
>> +						   nv12_fb.gem_handle);
>>   				igt_assert_eq_u64(get.modifier[i],
>> -						  add_ccs.modifier[i]);
>> +						  fb.modifier);
>>   			} else {
>>   				igt_assert_eq_u32(get.handles[i], 0);
>>   				igt_assert_eq_u64(get.modifier[i], 0);
>>   			}
>>   		}
>>
>> -		if (!HAS_FLATCCS(intel_get_drm_devid(fd)))
>> +		if (is_intel_device(display->drm_fd))
>>   			igt_assert_eq_u32(get.handles[0], get.handles[1]);
>>
>> -		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &get.fb_id);
>> -		gem_close(fd, add_ccs.handles[0]);
>> -		gem_close(fd, get.handles[0]);
>> +		igt_remove_fb(display->drm_fd, &nv12_fb);
>>   	}
>>
>>   	igt_describe("Output check by passing the output of GETFB2 "
>> @@ -452,18 +355,16 @@ static void test_getfb2(int fd)
>>   	igt_subtest("getfb2-into-addfb2") {
>>   		struct drm_mode_fb_cmd2 cmd = { };
>>
>> -		cmd.fb_id = add_basic.fb_id;
>> -		do_ioctl(fd, DRM_IOCTL_MODE_GETFB2, &cmd);
>> -		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &cmd);
>> +		cmd.fb_id = fb.fb_id;
>> +		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_GETFB2, &cmd);
>> +		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ADDFB2, &cmd);
>>
>> -		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &cmd.fb_id);
>> -		gem_close(fd, cmd.handles[0]);
>> +		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_RMFB, &cmd.fb_id);
>> +		gem_close(display->drm_fd, cmd.handles[0]);
>>   	}
>>
>> -	igt_fixture {
>> -		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &add_basic.fb_id);
>> -		gem_close(fd, add_basic.handles[0]);
>> -	}
>> +	igt_fixture
>> +		igt_remove_fb(display->drm_fd, &fb);
>>   }
>>
>>   static void test_handle_protection(void) { @@ -527,24 +428,28 @@ static void test_handle_protection(void) {  igt_main  {
>>   	int fd;
>> +	igt_display_t display;
>>
>>   	igt_fixture {
>>   		fd = drm_open_driver_master(DRIVER_ANY);
>>   		igt_require(has_getfb_iface(fd));
>> +		igt_display_require(&display, fd);
>>   	}
>>
>>   	igt_subtest_group
>> -		test_handle_input(fd);
>> +		test_handle_input(&display);
>>
>>   	igt_subtest_group
>> -		test_duplicate_handles(fd);
>> +		test_duplicate_handles(&display);
>>
>>   	igt_subtest_group
>> -		test_getfb2(fd);
>> +		test_getfb2(&display);
>>
>>   	igt_subtest_group
>>   		test_handle_protection();
>>
>> -	igt_fixture
>> +	igt_fixture {
>> +		igt_display_fini(&display);
>>   		drm_close_driver(fd);
>> +	}
>>   }
>> --
>> 2.45.2

