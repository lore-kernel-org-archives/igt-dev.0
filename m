Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B29C5AC67
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 11:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0E410E30A;
	Tue, 11 Aug 2026 11:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMYSOJVN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E514610E27F
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 11:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786448875; x=1817984875;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=kbfiVTTfClBUEHANdL79oJ1x8CkLbMBYFvrXqqCWSnY=;
 b=BMYSOJVNKiOwR+jm2IgPnUwDUiiDBVqTvNJIdjYOBgqdOGNORXBA9fWn
 l20Ab4z0aoQq6ZzpNOFObp0OVSyBVbQtzQACp4WIhPMoN5cZw+iiAzEpV
 W8P3L9xnNeWsnFLS8CXbURO1r8sDvFcwLbdId2B8I1/yIg1Gpn/ZGR5RW
 mQ3B9mmNOYbSDtUQMCaqQuZ6OKAL9Ca7JjMWhmEfQL7Nx7+bPaJXyypQo
 /QWD4CaMHbEjSFTgxPBdQ/godnEay0dqRyEGh+p6AJKBfQoi1ywMEw8ZI
 nvbJ03f+7vBbPLtWOWwI9hpKDuZgWZ/CpljPfKBdxFq/SXxazhtxKgyZ6 Q==;
X-CSE-ConnectionGUID: TQn9rQjCRSW+cIPvboF21g==
X-CSE-MsgGUID: CusaUB1gTS2ar/8ItUWedw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86856226"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208,217";a="86856226"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 04:47:55 -0700
X-CSE-ConnectionGUID: ftgHBk47QLSGqp1hUwalEQ==
X-CSE-MsgGUID: TROinoobQhe+3N3hL4ZbJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
 d="scan'208,217";a="259478304"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 04:47:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 04:47:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 04:47:53 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 04:47:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZXiTafEoy1FfzH7sRUBlFylDsKEGA9gMemuIdK03MrmjPfVSSPT5NXU8kQT4qrIB/cVoaaPBW4AZuMy/p9tpBo84slgapV1PfaESS2W0zXQPys7SVJgqrDjQp0vtl8L55Chw4gcOjVHDenthdXIN41sWnfj1jtcxGPQOturBt1RaTicoYVjTZtLaq3OSDcYOYpfZMZjTrWY/lmAtqcEPHIP5c7gQzalMid+ugZ0UxYR0gFG9cBmh3sFOPQFFkU/Lx13C8hTjfJ5Wnvggh1YtHG/Vq+dOSRF2H+N/F4xssYbqJjG+QFuwPG7vu+ouS/8dEKYYxs+hetNJHMSqy6mmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZNF4PKSesfVpkNxX7BTUkBAFq8V1Anrsd4kUIdCIFc=;
 b=e96eI1gLbt2p2/87e+Pcv4uCP6hmvVzS69YowuVO1THyt1yF2VehtVHnDZGEfBt/orVEBHVdYI6YAeUs3C0r0JzueO7Z7RS9ZKwezxvWOLWz1ZtVFUgNoYV4Znf2byUgi2FyGKjMyQ4NRIK/JiJemPJC0ruBMnlAiZiplwTOTE0IGSpDEfR/dlf5ZNHyW9j3De4D/bNc5muSmHK4vQneAHkZG4neD5YPUy7OrkjBaUi0ZLJRwwxG6GyT7tIOoc0YukRdCUvKGXLIqdAaiwDuCGxLnvl60HOnWbhKZVLhIxqzhPymJA9N46s0eZiN4yGX8fcV2/6bCd0E+rt6pImxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 11:47:50 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 11:47:50 +0000
Content-Type: multipart/alternative;
 boundary="------------kYW58oV6evH0RY42arNJVVVN"
Message-ID: <9282cef9-45a8-438c-8df7-53a41b3525db@intel.com>
Date: Tue, 11 Aug 2026 17:17:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] lib/igt_drm_netlink: add set_error_threshold command
 support
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>,
 <raag.jadav@intel.com>
References: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
 <20260729121959.603890-5-ravi.kishore.koppuravuri@intel.com>
 <anZokYJr2DxQZjWm@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <anZokYJr2DxQZjWm@intel.com>
X-ClientProxiedBy: MA5P287CA0099.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::10) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|SA3PR11MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 9839767f-4261-4de7-3c0f-08def79e5ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10067099003|11063799006|56012099006|4143699003|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nbl1IljcRyuXudDeNnqqQu1HdR9H/w8Y+M77xt/qkuqUo8puDQi5BQxs0oregMERjVKDIwPsPMpPB5q4ndJRv4w20bUHogJvNxD4iK3iugLAaLH+1x4l4HLjROb1k9gkH90GP/ORrsXn/UY+xyN2jcOoXVSzQBE+K2TRQQjIjHxfJz+4vEjNEtsvY7EKM/beq3CAc/k6H7DDQLxkDUwG6mheY5nYG5eJpMI44sVcFpJiFCRbw/ICf+bUjj7aVl4sfr/+hv4gwlagX6/p10tHCrXf9Pi069D9G++baYYk7WDakhdLyQNOhRD6wtiOSwjU3kurF7KRtXNWBPsKd5oDNUrwkoeSf63/hjMo/dj09w4s/p3WTODsQafB8jEifaEQ68A+y7bfGWbBM/5TKDsWi5aHapircoWRvu9JkQh80WDWwVqMDHta6FV+zNh7JIuEIOyWkUNzp3Oj3DbANE8o7vnfapb95mlNnUl+Dyk5NzschH2g2ov7qZIv/IgtYA4a3pzLQbHg/v+fNvwx2BFJAMqJ5obvwtnARYJ1eDC2b5WkFgNjs3AruR0f9JsS38CSw8N4qas31msfx/oc5eAlEHdPGXiWuE2oHL2A9VIAADATy+VwbrkVMFSs9g8EIOx0r4EhuetEKLnf3DsGHkqyaHSmEeNMOxCAnvxTc6Mfe/4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(8096899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YStsZkVteDMyTEtncjZtTTVYaGtVRitEMnRjQjVTWUxaUDB1WEZDMERYNXE2?=
 =?utf-8?B?c1RVRW4xUzJSSm1CQ0d0T0hmNTJlU1BWRVNaYmgzYm50OUN4MWJGdWJUR2l5?=
 =?utf-8?B?REVmNGNic1lFc0drVGordDJYMEQ2b0d4MFYyNVJHKzJhWG9yaWt3Smc1cXBW?=
 =?utf-8?B?bS9Gd0grZGVjQnVSM0JaMFVmYmVxb3hZcjRsMFZxdk5YZ3U0RkdJSVpuWVo2?=
 =?utf-8?B?SnRnemd4QjkrWjB5UzdsS2gzTUpkcUpML2JTRG95N1pEdmNkTVh1UHpBZS85?=
 =?utf-8?B?dksrWUN0dUE0OHJ5TUJZeVdtTVFKM3I4WFBob3Bhb3RmTW1WQlR5ZStVVUtL?=
 =?utf-8?B?Ym5YWkI3UnU1YzN6M1pWd2VnZHNnUllnMlV2Y2JjQkl2aS8xVURGVm4vWWc0?=
 =?utf-8?B?RlFaUTNnd3I1ZXBtajV3OTgwUEFXQnhBVDlvd3dpRFQxMW4vK1M4ZEY2L2Fl?=
 =?utf-8?B?aXNhaDBkT3RsTGl6aUEwVm5DeGd4L2ljUEVPdDFteEczUzk5SmlZUzJ0VDl1?=
 =?utf-8?B?UTF6NHAvL01SN3JsdEY1OXQ1WnJWSDcvaG82elpQUENHK0tEbk5Va2tYd1BX?=
 =?utf-8?B?ZUpOT0F2M1pHS0kyWktjUTNpSTBlWEpyaG8waXFCdEhLd0FaV1k3K3hZRk1m?=
 =?utf-8?B?MWdSNUxUdW41VDVMQVlEZGg1VWhkc1M1M3owOHpmc3lMbUE5cEU2MzlkcWs4?=
 =?utf-8?B?UzcyaXpsQ0FNM1drK3JNdHBXOHZoTW9xK2dwTm50RXpndGU3SElhL2RmVWtT?=
 =?utf-8?B?anZoU2VFQ3NXQndHd3pQK3kxdWVPdWFxSWdESm9GMzBoL0kzSGNySFF1bTZo?=
 =?utf-8?B?dUw2VlhiZGNiVmx2L1VMMm9JdmI5ZWdZNXBBWThCRGN3QjBHaTRBNEM4dTZl?=
 =?utf-8?B?bmZZbXQxVmdzM3JDMzEzZCsva2p2djBGRkx6N253K1FvVjNnZVA3UFdVTlVU?=
 =?utf-8?B?a3ZsdFpCUjZGZ0NLL1JRdHJpNEVkUVA5Q01vYlc3MnJvS1BuMHFLeDNwQ0gw?=
 =?utf-8?B?bGpKUUZ0NzR0K2cwZU5LakE2cmt3TUZhTFBuSGpreU8yR0FNdUxNQVNZdzRD?=
 =?utf-8?B?eGU3YUNrdWNlV0R1WnVhSXJXMHZyYUNKSFpuZjdQNGdFZkhYWXhQMlY0Mlg5?=
 =?utf-8?B?QW1sZVB1ZCs2WXhqRnA0alVXS29SUmVKTG1IeFh3NWdEVkFmZ1hnMmNuL01N?=
 =?utf-8?B?aEs1Y2l4Ty9xdlFxbFgxbXdZQWJsL3F1TUo5Vnk2M2FRMll6aW9LNlBGN3Qx?=
 =?utf-8?B?STB5QW9hOUg3bnBHRGtUcnExR3VvNTY2cU42V2JHWEtIN0ZmKzNIUWNyUGpX?=
 =?utf-8?B?OWdCZ2l5S2hvajRpYngwbU9pR3hzMmhMYStrMkFBTm5wWG5SYzNTREtRc2hB?=
 =?utf-8?B?SWVTa0puNUZRd2pyWU1XdHN6Zm5vcHRiSnNTeldZY0J6SC92YzgxRHVybVZD?=
 =?utf-8?B?aXRVb0pRbXNVVng1dm1acWlVR3dRRWV1Q0M1SHJvV0dFSktZSXIyQzNSTFhy?=
 =?utf-8?B?VUt1QkNkQTdZa0NmNnlMK2lLQ2w5Ymx3dSsyREYydE02eVhHbWZ6OGhUK3pZ?=
 =?utf-8?B?MW0rZmxLaW9wYWIrOGxTd2Y0K243NUFXK0luZjBLZ0dGSThrR3dockE2RUFV?=
 =?utf-8?B?RDBQdzVKZVpES0Q2NmRIV3lPN2FicEdxdXNId01hdjZJNE5meFVpK1NEa3U2?=
 =?utf-8?B?TXNibitTOVh6RDdFVTkwWWdQMUtoYTdja08vbERPU3JqaVlCcnRsWG1Uam14?=
 =?utf-8?B?M2dTUUQ5VzBtbVNlNmNEZkF6MTk1QXk1b2hHRFZieHE5UTc5MXVJeHYxbjND?=
 =?utf-8?B?OVdmT2RnSERzbTRMZEp5bGRWMlJCempHWXovWlVGZnRSeGhOWnlYTGFwTnd2?=
 =?utf-8?B?Nk16ajZza3BUeVl6NXdDVS9za3htNUdncFdkR2psZEQ3NU1LUmthZlZTSkIr?=
 =?utf-8?B?UXJYcUVlZGtPc3YwMlp5bEh3ZVpyVVlWK3hiem9qUjlnaGw0cmdHVmw4SVRa?=
 =?utf-8?B?aDZVcnZMVld3N1lMNVplamRFVGxnTytlM1Y3b1pCdkRtOVNhUTJQSzN5MnRj?=
 =?utf-8?B?c3ZuTUR4NWplVitIdVpvQ3VUTE9qMnMrc3o1L3prRFBRajVUYmthV1BEWGZp?=
 =?utf-8?B?T3ZuNitxWkJQOXFicUYxajluYm10RkJYaHV2aGpxblJvdDF6a0NqR1d3VkhC?=
 =?utf-8?B?TE5sSk5vb0gzbE9CWmRaWXp4aUJmQlZzcURnQ25PSXJkdmNpcktNdy9MUmhC?=
 =?utf-8?B?V1NkdFpSZU5xNVJUMGQyWDI3Y0V2d0FzUm02YzlkTEhhVWUwbUlQQ1Frdmhq?=
 =?utf-8?B?NVhRT0VMWXFoMHo0UHpuRkxRSnVUSWEvQjhnVUdnRldiOGFJNE1RSHpUc0Iv?=
 =?utf-8?Q?0jztHYZz3sFXCa6/3sKoC1x/vUj9ZixB/94H6?=
X-Exchange-RoutingPolicyChecked: hUddja4f4XgpPfip5FEPsbMaXT2OqnZs/qut5zbH5kLsC/fansxkKCNUTU4wpGmEq+mBG9E00Jo54bJrRGVXn+WYwaVwmM5ylCDF4q8gT7zUdC7KXkBQ5YsndEbnGED4WFYR6FqZKSlso0PG7yTZCCvmGurStLm7//U/7HEmX1AD9x4hveykJ+A6edW/EVW6Jbq1caYN293UrWfih50CZnERObRcMesRD4Dij5cgxvpkdTp74VCWf8d8hl7NA4LN407C31v9dZSWqQ4OMEUfp42u/vh4immIiPpeR+Nr5yM0Txwvyl75P45KVVgE1d6KqCDpuhr7CwsS/np3BkfF6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9839767f-4261-4de7-3c0f-08def79e5ed6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:47:50.2728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzXeB6Cgd7Bs1QQUCViV3EPZyPRRg664JHqXIjS8pD9cGk/OT/WZdtoMxGVd3GDzIWGoOSRMJVbJAevIkQSkknVsZIr08ooi8SCqMB3WY3IcGZ0k7Al1KdZQrhwugrtT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
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

--------------kYW58oV6evH0RY42arNJVVVN
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08-08-2026 04:51, Harish Chegondi wrote:
> On Wed, Jul 29, 2026 at 05:49:55PM +0530, Ravi Kishore Koppuravuri wrote:
>> Add support for SET_ERROR_THRESHOLD to set the custom error threshold
>> value
>>
>> Signed-off-by: Ravi Kishore Koppuravuri<ravi.kishore.koppuravuri@intel.com>
>> ---
>>   lib/igt_drm_netlink.c | 39 +++++++++++++++++++++++++++++++++++++++
>>   lib/igt_drm_netlink.h |  1 +
>>   2 files changed, 40 insertions(+)
>>
>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>> index 036660a6a..4738090af 100644
>> --- a/lib/igt_drm_netlink.c
>> +++ b/lib/igt_drm_netlink.c
>> @@ -29,6 +29,8 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>>   	gnlh = nlmsg_data(nlh);
>>   
>>   	switch (gnlh->cmd) {
>> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
> The definition of DRM_RAS_CMD_SET_ERROR_THRESHOLD needs to be added in
> this patch instead of the previous patch.
This file is the UAPI header file directly taken from the Kernel (as it
is, not modified anything here). In my opinion, better not to alter
anything in this header
>> +		break;
>>   	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>>   		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>>   
>> @@ -109,6 +111,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
>>   	}
>>   
>>   	switch (cmd) {
>> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
>>   	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
>>   	case DRM_RAS_CMD_GET_ERROR_COUNTER:
>>   		ret = nla_put_u32(msg,
>> @@ -126,6 +129,16 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
>>   			nlmsg_free(msg);
>>   			return ret;
>>   		}
>> +
>> +		if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD) {
>> +			ret = nla_put_u32(msg,
>> +					  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
>> +					  ctx->error_threshold);
>> +			if (ret < 0) {
>> +				nlmsg_free(msg);
>> +				return ret;
>> +			}
>> +		}
>>   		break;
>>   	default:
>>   		nlmsg_free(msg);
>> @@ -238,6 +251,14 @@ static int validate_inputs(struct app_context *ctx, uint8_t cmd)
>>   		return -EINVAL;
>>   	}
>>   
>> +	if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD &&
>> +	    (ctx->error_threshold < 1 || ctx->error_threshold > 16)) {
>> +		igt_warn("Invalid error_threshold (%u) provided. "
>> +			 "error_threshold should be >= 1 and <= 16.\n",
>> +			 ctx->error_threshold);
>> +		return -EINVAL;
>> +	}
>> +
>>   	return 0;
>>   }
>>   
>> @@ -280,3 +301,21 @@ int get_error_threshold(struct app_context *ctx)
>>   
>>   	return 0;
>>   }
>> +
>> +int set_error_threshold(struct app_context *ctx)
>> +{
>> +	int ret;
>> +
>> +	ret = validate_inputs(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = send_command(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	igt_debug("Set error threshold: node_id=%u error_id=%u threshold=%u\n",
>> +		  ctx->node_id, ctx->error_id, ctx->error_threshold);
>> +
>> +	return 0;
>> +}
>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>> index fae9b0e06..c44486ffa 100644
>> --- a/lib/igt_drm_netlink.h
>> +++ b/lib/igt_drm_netlink.h
>> @@ -33,6 +33,7 @@ void cleanup_nl_socket(struct app_context *ctx);
>>   int init_nl_socket(struct app_context *ctx);
>>   int get_error_counter(struct app_context *ctx);
>>   int get_error_threshold(struct app_context *ctx);
>> +int set_error_threshold(struct app_context *ctx);
>>   
>>   #endif /* IGT_DRM_NETLINK_H */
>>   
>> -- 
>> 2.34.1
>>
--------------kYW58oV6evH0RY42arNJVVVN
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08-08-2026 04:51, Harish Chegondi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:anZokYJr2DxQZjWm@intel.com">
      <pre wrap="" class="moz-quote-pre">On Wed, Jul 29, 2026 at 05:49:55PM +0530, Ravi Kishore Koppuravuri wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add support for SET_ERROR_THRESHOLD to set the custom error threshold
value

Signed-off-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a>
---
 lib/igt_drm_netlink.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_netlink.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
index 036660a6a..4738090af 100644
--- a/lib/igt_drm_netlink.c
+++ b/lib/igt_drm_netlink.c
@@ -29,6 +29,8 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
 	gnlh = nlmsg_data(nlh);
 
 	switch (gnlh-&gt;cmd) {
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">The definition of DRM_RAS_CMD_SET_ERROR_THRESHOLD needs to be added in
this patch instead of the previous patch.</pre>
    </blockquote>
    <span style="color: rgb(36, 36, 36); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">This
      file is the UAPI header file directly taken from the Kernel (as it</span><br style="color: rgb(36, 36, 36); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <span style="color: rgb(36, 36, 36); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">is,
      not modified anything here). In my opinion, better not to alter</span><br style="color: rgb(36, 36, 36); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <span style="color: rgb(36, 36, 36); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">anything
      in this header</span>
    <blockquote type="cite" cite="mid:anZokYJr2DxQZjWm@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		break;
 	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
 		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
 
@@ -109,6 +111,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
 	}
 
 	switch (cmd) {
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
 	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
 	case DRM_RAS_CMD_GET_ERROR_COUNTER:
 		ret = nla_put_u32(msg,
@@ -126,6 +129,16 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
 			nlmsg_free(msg);
 			return ret;
 		}
+
+		if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD) {
+			ret = nla_put_u32(msg,
+					  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
+					  ctx-&gt;error_threshold);
+			if (ret &lt; 0) {
+				nlmsg_free(msg);
+				return ret;
+			}
+		}
 		break;
 	default:
 		nlmsg_free(msg);
@@ -238,6 +251,14 @@ static int validate_inputs(struct app_context *ctx, uint8_t cmd)
 		return -EINVAL;
 	}
 
+	if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD &amp;&amp;
+	    (ctx-&gt;error_threshold &lt; 1 || ctx-&gt;error_threshold &gt; 16)) {
+		igt_warn(&quot;Invalid error_threshold (%u) provided. &quot;
+			 &quot;error_threshold should be &gt;= 1 and &lt;= 16.\n&quot;,
+			 ctx-&gt;error_threshold);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -280,3 +301,21 @@ int get_error_threshold(struct app_context *ctx)
 
 	return 0;
 }
+
+int set_error_threshold(struct app_context *ctx)
+{
+	int ret;
+
+	ret = validate_inputs(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
+	if (ret &lt; 0)
+		return ret;
+
+	ret = send_command(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
+	if (ret &lt; 0)
+		return ret;
+
+	igt_debug(&quot;Set error threshold: node_id=%u error_id=%u threshold=%u\n&quot;,
+		  ctx-&gt;node_id, ctx-&gt;error_id, ctx-&gt;error_threshold);
+
+	return 0;
+}
diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
index fae9b0e06..c44486ffa 100644
--- a/lib/igt_drm_netlink.h
+++ b/lib/igt_drm_netlink.h
@@ -33,6 +33,7 @@ void cleanup_nl_socket(struct app_context *ctx);
 int init_nl_socket(struct app_context *ctx);
 int get_error_counter(struct app_context *ctx);
 int get_error_threshold(struct app_context *ctx);
+int set_error_threshold(struct app_context *ctx);
 
 #endif /* IGT_DRM_NETLINK_H */
 
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------kYW58oV6evH0RY42arNJVVVN--
