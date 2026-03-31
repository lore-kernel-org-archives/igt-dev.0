Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94D8109B47B
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 15:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5722510E984;
	Tue, 31 Mar 2026 15:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WeutlUD4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C6110E984
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774969245; x=1806505245;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/J0AJ9lvtYuipa6BitZ51pebB9T9IaPJgjYjq/kI7RM=;
 b=WeutlUD4y+K0DWISeCJECIkGXFRIkuF9wv5bpzQZM5tVd02+XatXSDw7
 94wFGOnKnpZzYhHgFTVJ1UKLJoc3B3j3uV1AYfO/Gj5krKOqsQ0BPe+1M
 ShtsHNP8+5JYnuss4kAPzFrZg3COXzg1mh6IfWzMfFUYzHxl2p+4pGSbl
 DN+bBy/vfb5Oahx4SCWSqas4bbyNWVAuJe/Nx9rc3/syHNjyxGfdT4YFy
 iQE//HIuB3TMfHChHdlMCse12dUrC33Yq70qkP9evU0l7B/WWliojcEUE
 QwKM+XJ4giRvMGGQYbiOeZkJFbsAW3Cdy+J2NSnQ8vIT+i3+GyNWGEIr3 g==;
X-CSE-ConnectionGUID: U35mgQ3ATQuQMUEd9WX5QQ==
X-CSE-MsgGUID: r8qCvSZCQ2ia40GkYGtIMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93565345"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="93565345"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:00:44 -0700
X-CSE-ConnectionGUID: P0kcSzXgT8SrJAuGGkxDLQ==
X-CSE-MsgGUID: XrDO9+LrTiaVSMNnQBqCtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="221986419"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:00:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 08:00:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 08:00:43 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.28)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 08:00:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQDgDT1v08amMWeJf5RXhISJrs5mmqUXJst3RxaIRnJiGOJI+oVY9SPnGlZqPwFhaz+WZua4UeZiklEfNgEn06YI2o3ke3NRMmzJxebirilEw0ZFA6mmjk+4yxTQz7oP6fUMhJ9bw8kpO/JRcU60gnx2xCWkUkT65aMAdMQfarYD/JuphW9YLn/8MUAkxGFylC03Aym+nWI0zLHKgI1Px37KRs9HE5imYA8Rz5VjhmGdwxhQsHVjNhNHeH/yyjPqgINrWuffCD/bMOuwWqyhNJYUABrtVsS4X5rIJ+SRD/doWLSguVO+qwicwsX8DRDziijPWCXDrb6nr2dTDzO2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5PAxOnR9T1om9t94Myx3ND2Uh5O6xyeuXzwPWCylQo=;
 b=RxBIoyxTYfTB4c+TEUMJtE1/dV0LaYh0V8q2ZpqczvSS5UWIHnljDt438dMR+OoujNUPEKJN20CZSL3LbRL5wDoYKJ9YeOf1NqCrbYArMThlkPU3Rl7n7+0uTkGBL3YLDIRFHsxSLrQmpkqSDq2ScJmIgyaItINgCgmlRkB/hx7vFM6FO8NDsjEaiThEbCLsuCujiQjuGV8iF2baa7OS+nc22DQOhpoLhqdhikPb01Z0sVkvd6B9evNc1XWMZZjrQWxICBlqP4mEPrg6rKqPuWmi8Wvi9HWg3Cce4i8RzR3fogn+Iqvcwghc4NZBP2BdcnninQQ2JLCVyRndsKTg7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by MW4PR11MB8266.namprd11.prod.outlook.com (2603:10b6:303:1e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 31 Mar
 2026 15:00:39 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 15:00:39 +0000
Message-ID: <72ef81b2-82b4-4003-8b3a-85d7aac8e459@intel.com>
Date: Tue, 31 Mar 2026 20:30:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] tests/intel/xe_vm: Add
 DRM_IOCTL_XE_VM_GET_PROPERTY validation tests
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <jianxun.zhang@intel.com>, <stuart.summers@intel.com>,
 <shuicheng.lin@intel.com>
References: <20260325212208.85743-6-jonathan.cavitt@intel.com>
 <20260325212208.85743-9-jonathan.cavitt@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260325212208.85743-9-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::24) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|MW4PR11MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fc5831-07fd-4430-89d8-08de8f3645a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Bax/gfB6YvJNAqFpBgVlQxrVPCcgBfvgi2COqcbN5hRoS44ugkHg02CSH1DZ+h/tSi6J4ykyX+R8jbXp+53mjuCrlJh89o2zfCm6vwDNcueax+Lce5ZXfhbzjFIKkz/561I5nCzDRcNSZ9DDgM3zxx0JtKpIA23h8VaZJ52FPBsYnZWgV0P9xoVrj+U3F1xeowDo1vM6twAEjF3fop7sNdV+sB8nHmwa+bsIJiu9/x+c+KwWI95AjedsbmJFxufe2LlZGdKeXR16x143DMsrzzESn3W1x/cgVI4tDXXx7K898mNfWs8BH64Ujr03DaDDWoYwtXLyKZW0dlxMFwdhbXwQ3C1kb/JDIAwBFt7NW5ElHTT4tkknBBgUpJ8tWFVsKPLpKF1y2kqAU243MJpJO4xJuxxzwAKcOCoulxSQoy/gGmox7PYP11vOFCQ9eE2YgN6Kh+nu+JzqYc9aMEhroqFWlQZfbDLf2d7Ipl8D79EaQVotz3NvqKAtPggiWqn8iDHhM6GxaWya3arJ26IH1exxbKd/ISeAVNsKme/0aMuKwrpxMDEaBHSheD/ZMxkAwkKqEbWgo1NuBsAHg3cHiY5x0qsznO9e/jRAuMXfchky3ILcxpCkgv184qM4ODYtfGgxEDaL1bc0/Ubvk8nRq9cv38z8wetLbmOmcQV04EQjwk8snbpoCOlo2z5SYafVtZuLmUtMkIKDNvp027dinsytP8IOr+hTdRQmFpAJ3L8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFVURmw4MG1hRWh6U1Q4OTBTWnd1QmpuVUJJRXBzSXVpd3ZyQkNFdlVHTXdi?=
 =?utf-8?B?RXIwbmtrQi8vVVZlVExWNkJ4Y21peGUvK0dXTDlhZFBnSWtIaVN5OTZOS25K?=
 =?utf-8?B?N05vWnFnVGYvVTZKNkpEc0FUb2ZKZ25mOU1XTzZoRE1VS3haVXpvMkpTWmxV?=
 =?utf-8?B?TkV1NWZZeWh0RE8xVVAzN202T2tOQzVqOC8wdVFYaWZieTE4dHVKYTZ0NGta?=
 =?utf-8?B?bEMrVm4xUE9ZVkFDZFJEaW45Mjh3RG8xNFZHQTlBUVRUQm1rQ2dxSVoxZmdr?=
 =?utf-8?B?MXF3NTBwL0RaKzl4b0xDN2k3M3JKOWtQMjc3SGl4ZjVGK3V6N3ZNRmRPcUNu?=
 =?utf-8?B?ZTBUNkh1d0MvbG5WOVd0R2M2SXR5MHM4V25CYzJvN3hTMW1Sa08wNzUwWDBw?=
 =?utf-8?B?d0dtelNBOUFRaEhSSnkrSmNRR3B3RW5qTFlQbXJoRTdVL2E4dDM5TWMzaGxq?=
 =?utf-8?B?djJkM3hlZTViU3g5WGtOQ2hibnliRDEwbDNHZXZUM0k3QkNJUkxwdllKUTlq?=
 =?utf-8?B?Qll1SXNsekM3cW82dnVsM2VnQjhpS0MyWkhLRWRuSzc1Wk0rajJQTmcvdmVu?=
 =?utf-8?B?eFhUcFh0elhiMmhtZXdLRkFONVBkOG9GOTVEU25FemhzcEFMK0NTZStDUXFL?=
 =?utf-8?B?bnBZRmIrYkJYVVVwL09sUWJIY25QVGlGT0N1bm9SallyZW91eFU0Y3J4MDVL?=
 =?utf-8?B?dm93TllHUE5xMVg3V05kQTkrcWlsUHlDeHkrdjA2STFHUk5INlU3UkVrL0Qr?=
 =?utf-8?B?R1NEZEoyTnJIQ3QydkZKMDZBNzJGY2xZVW1qYmdWMEs1aUh3OFZncTg1NWNw?=
 =?utf-8?B?ODJhMmZDU3d3TlJkWFFCV1ZHSjhmelBzUHdMZmxjNkl6NFV4dTl5aEQ1dVVo?=
 =?utf-8?B?RHJyRGtmd3ErZFg1anpUQ0lPZFZQcVJXMlVTbHFhM2Zrb2gxcXRoYkdTMHRq?=
 =?utf-8?B?cHcxUFBia291L3diL1JkWVBaSzZ4cmI0NWpIeWI2ZFd4RVdJeDRWSWZwTWhi?=
 =?utf-8?B?Y3pLSDdoWU50RkhPK2M3cGVkTDdqWTk5aFBGUTloL3pPUmtlRUpFS3lRR1Z1?=
 =?utf-8?B?M0RYYndEdzRCc2gzZjdjWENXMFpjdDJUZ1o4WHZ2TzRwb2NyRTdySXJNeHlq?=
 =?utf-8?B?MTE2YWsvbkE0UUxjQVUxVm5TWlNIUVN3cEIrT3A0SFV2eTZrbFg5bXF6UHFs?=
 =?utf-8?B?ZmNHditYSkIwL0doY1ZVZlIrdm1iOWN2WVd5cEtzcTVCOHd1ajF6UGs4dXNN?=
 =?utf-8?B?L2NScnUrMjAwZzlSZFBqMjg2ZHJwRkwvSVdnbkZWOUJQNXdDeEY4UnBXWUpV?=
 =?utf-8?B?S0grYnpJb3NWTGdvcXlMb0FaYjBjcHVZeXZWc05MYjJLQXZ5cHUxNjlyZTBZ?=
 =?utf-8?B?dWdVOHVUQ0dHTGRVYnZBb3FkditoQjNqTFJ4WGE3Sjl0d25NMGZvUThpWWNx?=
 =?utf-8?B?RnZqd2lOWXpBZWZ5K3IyMWt5Z2xwUkZVNzNySFFsemZkTU8vcWp1eU9PUWt0?=
 =?utf-8?B?QlluOG9QT1l5NmZ1bGJrSE1ncWdSbkY2U1BtL25VTUNDOUg5eVE4ZFJiSWJE?=
 =?utf-8?B?VUpnQ1NHTm56YlhTdVpBbjhsVmVyWEZvUURvejFTVWVXVUxLZDcrTEdqM3Vk?=
 =?utf-8?B?a2ZpYXhXZFdOSDB0elJ6YldrQ2dOWG5qYko2Q2RyUjAwZndBYTllaERaUWFI?=
 =?utf-8?B?VjcwM0Vpem5yS1ZrdnNHZzk3c2QvZFFyZDlHcmFSNWorV2Z2emRDMFZKalVT?=
 =?utf-8?B?ci82U3dTZUFUcVNMckdFUXF1aHVvRVlhbi9GSXFCZHV6NHBtbzNRbWJuZk10?=
 =?utf-8?B?R3d5dy9YZWlsNDR5ZTVHRXBzTVNwdERlOGltYWhPQjJsZ29IbGV3bWk1eEIx?=
 =?utf-8?B?a21BU2l5SjJWVCtHK3FLREtCTUZFc2FIMHdIWk1DSDZpaW5YaGkyclRXY2FO?=
 =?utf-8?B?UHdtWjRZZVNyaFQ5Y2lhcXY1VFlCamVNRUxYZzIxVGN3SVRFd0hRb09ReDVR?=
 =?utf-8?B?SzIxUk01RzYzM3liamZjSEZ6bVYxMXpkNkNnV29MdHZ4a2xCRlhVZzIwZXJK?=
 =?utf-8?B?ZGVCTGI2dmk1WG51WDVPLzVMY29NaFlFZnBwSStka0RBZ1ZxTWZWRzh4cE5j?=
 =?utf-8?B?ci9SdWNjbEs4NU1ybGhhbkhTWlgyK0t5TUpuaEF6dVpaZnRVcWRuNk9adE0w?=
 =?utf-8?B?QVFTNno4aDVlNlV1T0Z6M0tJNExMcU1mWE53bmhpMnlISlZBb04wNDZYMVlr?=
 =?utf-8?B?OXgxNnoyb1U0YVZjWGwwU0ZHeVRHcWZRazJOMnUzRTBIUFRLTDBmYzJQQVBE?=
 =?utf-8?B?bFBkcyt1cm5ybU9lNjR5RHpXSEpOS1NLUzVLTkZWbHhPZGdLMGFIQT09?=
X-Exchange-RoutingPolicyChecked: dpYxZafuzT1oqYGekt8aoY8zVgZlnIpcyF0EXsIw51c6pgYnbV01l1bQIrXpQvHECVLMHIi/yAHqoaqDl6j0IblRO3lV7AsapCRaFeuMytJKJheV5xflT+TxsBpXicSYNps8eWavw2Sh0I8e/N/JRMhuPHohLT7afy7Qz0pt42ezqYaLgyz9FyKemRq1dZXPY+XEBNWWM6ZHgQw2dApAs0F2G52P3UGVQrwkpk+QWTElGB1asTjhu4TMQ80PSvm1SjOtiGZwHFpf2wmHahswJKjLPZqGWJwly937qGVa+++AhlYjYeViKX3h7H+LSP7Q/jZQSpDL4nyqCXCjfzOlmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fc5831-07fd-4430-89d8-08de8f3645a4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 15:00:39.5698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEKSd4RYhNoPDpNnth3MA9pP/Oo6i9NpoZ93srF8FvQZcgbTC4J5rcCl+tzAE/VsC8bPAOr3W/7AoIDBlD8IKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8266
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


On 3/26/2026 2:52 AM, Jonathan Cavitt wrote:
> Add tests to xe_vm that exercise the new DRM_IOCTL_XE_VM_GET_PROPERTY
> ioctl.  Specifically, add input validation tests that exercise the
> return values for improperly formatted ioctl structures.
>
> v2:
> - Make vm creation consistent between patches (jcavitt)
>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   tests/intel/xe_vm.c | 81 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 81 insertions(+)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index ccff8f8046..778d9ac86d 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -2450,6 +2450,71 @@ static void test_oom(int fd)
>   	}
>   }
>   
> +/**
> + * SUBTEST: vm-get-property-invalid-reserved
> + * Functionality: ioctl_input_validation
> + * Description: Check query with invalid reserved returns expected error code
> + *
> + * SUBTEST: vm-get-property-invalid-vm-id
> + * Functionality: ioctl_input_validation
> + * Description: Check query with invalid vm_id returns expected error code
> + *
> + * SUBTEST: vm-get-property-invalid-size
> + * Functionality: ioctl_input_validation
> + * Description: Check query with invalid size return expected error code
> + *
> + * SUBTEST: vm-get-property-invalid-property
> + * Functionality: ioctl_input_validation
> + * Description: Check query with invalid property returns expected error code
> + */
> +static void get_property_invalid_reserved(int fd, uint32_t vm)
> +{
> +	struct drm_xe_vm_get_property query = {
> +		.reserved[0] = 0xdeadbeef,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query, EINVAL);
> +}
> +
> +static void get_property_invalid_vm_id(int fd, uint32_t vm)
> +{
> +	struct drm_xe_vm_get_property query = {
> +		.vm_id = 0xdeadbeef,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query, ENOENT);
> +}
> +
> +static void get_property_invalid_size(int fd, uint32_t vm)
> +{
> +	struct drm_xe_vm_get_property query = {
> +		.vm_id = vm,
> +		.property = DRM_XE_VM_GET_PROPERTY_FAULTS,
> +		.size = -1,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query, EINVAL);
> +}
> +
> +static void get_property_invalid_property(int fd, uint32_t vm)
> +{
> +	struct drm_xe_vm_get_property query = {
> +		.vm_id = vm,
> +		.property = 0xdeadbeef,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query, EINVAL);
> +}
> +
> +static void test_get_property(int fd, void (*func)(int fd, uint32_t vm))
> +{
> +	uint32_t vm;
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	func(fd, vm);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
> @@ -2562,6 +2627,17 @@ int igt_main()
>                   { }
>           };
>   
> +	const struct vm_get_property {
> +		const char *name;
> +		void (*test)(int fd, uint32_t vm);
> +	} xe_vm_get_property_tests[] = {
> +		{ "invalid-reserved", get_property_invalid_reserved },
> +		{ "invalid-vm-id", get_property_invalid_vm_id },
> +		{ "invalid-size", get_property_invalid_size },
> +		{ "invalid-property", get_property_invalid_property },
> +		{ }
> +	};
> +
>   	igt_fixture() {
>   		fd = drm_open_driver(DRIVER_XE);
>   
> @@ -2850,6 +2926,11 @@ int igt_main()
>   		test_oom(fd);
>   	}
>   
> +	for (const struct vm_get_property *f = xe_vm_get_property_tests; f->name; f++) {
> +		igt_subtest_f("vm-get-property-%s", f->name)
> +			test_get_property(fd, f->test);
> +	}
> +
>   	igt_fixture()
>   		drm_close_driver(fd);
>   }

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

