Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4893F8D76E
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 19:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1A110E1A4;
	Thu, 16 Apr 2026 19:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnBsd784";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7232B10E1A4
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 19:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776369064; x=1807905064;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F1lqVwroH5DMa/oqi9plv1RcIKqhVgl8zxgzuA1hCEY=;
 b=BnBsd784EKnVW983yiQ5TmzR4QIvPSVTat0wZXi5L1cdCNdGVrAOGjFJ
 PLIMDwICfc6chw83wp/VP6JyUCwhcmbWEKy9AoUctbqWQzCxnCDZXFNKW
 eBBmbo4rYSbe5FpHtTjy5LfWhtasOYYqEZnKuuOL7Kmp65Ji/hAzUyC0j
 UAssKbXHLn71XIR6yntWredgcluLn344CqSAMtRvtSmm+xahTtm45bXql
 MXw/T7oRbdWYtoztLeU6Qc4OoFFMiNrrfWSkEk98y/v0i2y2TR/U3mk0o
 PSApw+22KAWCwyI8wLjl/Q/952ovLaJwuQs1ey3r0DUUPdKDzAt/qx9MX g==;
X-CSE-ConnectionGUID: R/mlaZUxQGGJW1O5fJ6/1g==
X-CSE-MsgGUID: Bap4v4uwQAev8Qbs7SlpEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94787517"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="94787517"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:51:03 -0700
X-CSE-ConnectionGUID: QcN15IxhTjCQ85RkNUrZ/A==
X-CSE-MsgGUID: veHHyIpHSBy340a1+ApQ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="229823316"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:51:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:51:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 12:51:01 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:51:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7HpwhkVZWUoIlsoQmASX1mtFZZv3ME97xevfsYslS7IzIMUPC8XUxAu+/QiswxbffSq0+q9JGcUDvnGpNI6SCBlUWj52BLsagOdDM1iptKso/K4fLpURu3slm5/oUyCo7ZmkfdxTzrP3nWj4oLtbIcoHp4cUwM0+DXQe1a5+gEtBYtVgXMGKUlu9jIc8tjJAiN8eX25G4lZOi+JWcOEDgwLOKQ96OYz1BEsc+1W4ntsC4Weev+p3ZuDyg7jg0H5AFUyjF6wpVfcr5iL7MHsyy39zNX2XA6ZdxprPDUI18JsmRSTNQOkw8TuHIZrYX/ABZnLDN5cl5m7tvLu29aIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1J+tGgkhLGWruRRAsYz6usxOPdbXFFwC3eVL+vssG5o=;
 b=Vkr1QDdvsefWAcgcvZkZO44fIwfXcxiKYbIJvbsOJnQORBioLjeorL/Fj86oNJouZdfanFxWJ/SEgPvM6A/Vq5g4qJBgDQcGokI+9+TlaOkyurvbuq2cTkAdmWpi8MhOv62CLkEzFcWvWpu+mPu4cUucCm6G/RBrrqBLRTKQyzFcx+v97o9Zyrp3HDs+9fdcgavGdTkNPa8ZXn92WX5XzpvvuIPQk01+WqDsjEt+L8mz/fz8ZnQj5i864dp3CT5UjOe4Cqq/h6QsZzAK6OwNlN3Ie2JQnR1nbT1cilGbLFgw9tL7DQNN/zCGI6R/c6Kgmt/UE8P7vVGpTFSp6uyOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 19:50:58 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 19:50:58 +0000
Message-ID: <4c42053d-a31f-4c69-8e1b-d8018c429b4d@intel.com>
Date: Fri, 17 Apr 2026 01:20:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/intel/kms_sharpness_filter: refactor
 test_sharpness_filter function
To: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
 <20260331190412.1907571-3-juhapekka.heikkila@gmail.com>
 <5d92caab-f7c2-40a8-952f-b0b0f6629e47@intel.com>
 <CAJ=qYWQGiwPsu3ObRyWkgHnL=Mjph6Op5Ntw3sxah2LGRbHddw@mail.gmail.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <CAJ=qYWQGiwPsu3ObRyWkgHnL=Mjph6Op5Ntw3sxah2LGRbHddw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|MW4PR11MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: d4cca7ff-ccdf-4e25-2f84-08de9bf17b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: mm5q8NuUyA9oR6HzyYwAHQiAr2vJ2nf0C9bSLpHp9iy6Lc4eaU2o5zYCEjyKyL9C8otkfo677ievj3g3gYESWx96G/UsyKpOyRd2VZNOHz3k0TkLUDPtoiI4QQaIe7ntnS9W/4li68wueYOvOtGnEwZvmfafKbERgv1E6Rg5L7kU9AXfu1EZ0oTAvNOFe9S45T6ZqcmGuKYZ86gWUl/6XlPIaHUFrL98yQf/0LYocztN1XsAKPiaEsbR4LH3ki2Z6z27l0C/fYOZJo3tu/ELKZplSplrP0uxeJrAc9BaQ96BdWiKEdXGcptgcEAtneFH+9sZ1UG+K8YBBfPxC/S5q3Kh63QgJHglkg2dnTrp6sI6oABpouHCPsJbUKzCe2jdsP40FJ0rAKX3VxLYR9sz5tv5+K1iEwWKRjpgIN522HZP5OU640gqk7LtsH7o5tn2gipIHhxLujCwRJB8yPhuyI36pGsrIC91MqloRP7qPDx3cHa5pEwZE44WJdFmthpOxEorF/l4KwGuiPlpXASahEvkwAd+cmwkA+vQ+iS4SlwWHeQc8o8e5DyA6MaMCF/msK0OzCGSMkMa/QMRlpkMEj3ykysFju+KFMMifX1jRMReRSXfmI87NCcBca4yck/0rMShjQyQvJ0YcedhxiRr0OqDYrMuYGBXVZiWv6xP0A60hTH9uf952lGZRQ5yrcdF2AYY01IjxgBrmIuUo0PclP7ZGRo+Idi5Ol00BMaEEhw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDMvYnZsNXhYWUVZYWJaZ0R1bUFkVllwUWNNUWhNWkpYTjlwQWlUbkNDWE9a?=
 =?utf-8?B?czgvd1UvQ0h5UHJqU20xYVlkcDB4aXNWZVhqME1tMFYwWlZ4NDZiMGVQaWtk?=
 =?utf-8?B?ck1RQjdNQ3p3ZEpxYnhIOG56RExnalNFd1dSSEY5cVlsV2xaL0JnSitHKyta?=
 =?utf-8?B?ZFhOeHFLUmtLeTJxeTRCa0gvM0hWQUo5TFMxeFBpOHFOa1JnRFNFek5kUzdV?=
 =?utf-8?B?c25ObkRibGF1bHV6TjJ1cGFiVVJ5cmxEdGZXNHFMc0VuUVI3Y1RUMEhxdjla?=
 =?utf-8?B?VHFBMU9ZMmVpUkVEeFJKSnpZQk8xTFRxZjlwZmN0M1FlQTBIV0hZZXo2cHlD?=
 =?utf-8?B?d09QSEVvaDhqcTdvd1ZDRmVDcmtZQlRRWHA1bENFRitsclZNbkRGcnVRNjFv?=
 =?utf-8?B?RDdFSlpkNUtQRXBIRXZuTVFLUkxkaGQzSWJ0OHlXWFdBUWdQemlGRndTSS9W?=
 =?utf-8?B?emJoSHEwc2t6bnl6SFJtUXdJVkcweDlMdVcxenpCdThIZm9WYWZNOVQxREZi?=
 =?utf-8?B?S00xSDkwb01hNld6dW9hOHFDSHdCNXEyd0NMT3BqZzBpZFVzVW1yR0xJQ09r?=
 =?utf-8?B?V1Q4ajh4MzdXSklVUEtnS1Jyekh0akxTOC9Mem5DMldaSmhXSGIwOTNaeXRj?=
 =?utf-8?B?WTlySzZOZzFKeHB1Y2hBYnc3N0RzS1lqRVdsVy94M1hHMG13cDhMV3d6OXRr?=
 =?utf-8?B?cGRDQWE1alluZmY1UTdqcmNIeTZXQVBWcnhnQjYzc1NuQkFhb2d6VzZiWFhx?=
 =?utf-8?B?N0R3R0E3OGhIYUdzbVhJNnZGbkJ1UWR4eWZIb20rZXJCTmpNeFNuekRBMzUw?=
 =?utf-8?B?ekRnYXl3QS9oaHVod09TUXhYVGwwcXpwVnVWM3hHTnhyRmtITjRKUEhnRngy?=
 =?utf-8?B?YmRhSDFSNXNDdFFHMFJCajQ0T3R3bW1MTG9pa2tYL1JhQTlMaENOWDVHYzJv?=
 =?utf-8?B?TUhtcGtPOG1MMnBzNm9KODRiemJlRUxESlZ6RWtXWXV3Ri8wVDVCUlR3SERH?=
 =?utf-8?B?VFBmdGJnaWdTMDM4bWwxRk9RbCtUU1gxeWlOcWtCcnhiWEg0WnEvTWFBZFB5?=
 =?utf-8?B?VUhTSTdINmJoVWZNdWh3Tzd6QWpCYmZPdmFWRjlJZlk4b3BoWElhL0tyS0VS?=
 =?utf-8?B?bWVIcGFqYmIxYThLUGtidnVQMWRSdUNwRTQ0aWM3UXErT0R3NFdSTE5MS3RF?=
 =?utf-8?B?dHBoUktsWUlZSmFRMVRPOVRMZ21vc1ZMUElURU1xUm9wb0hYdmo0ZGpjV1Yz?=
 =?utf-8?B?eU9BODdiU0REZ3IvVW5XemtqVHV2STNsUE8zMWZKVTNzdGNrd0ZvYnlWcU04?=
 =?utf-8?B?WmhKVG92VlRHVGNQbDBneXM2RFBtZHlqT0FuSkVWZWJpRy90NkVxNmJINjEx?=
 =?utf-8?B?YWoyMUhkbGE5TGJWNnRqQ0FTKzBEK0Z2Nm1EZDRBTDVXb3ZKTTdxYVYyWWNi?=
 =?utf-8?B?T3o5RHRkeGJGdkdnUU5XUXlFQTRtbGtCOWFueURuSnBKeTlLQkNodVpYSjJN?=
 =?utf-8?B?YWxJZXI3MUtWbEEza0JmT09FV0dXdE9ZWU9HaDVVUFZpYTJtdG5KSHMvU0Z4?=
 =?utf-8?B?QTNocVBuckFlZnZPUWNLdU1QOUE5eEdoZVBENkl5akhlRVFQSlF0L3k2K0FU?=
 =?utf-8?B?YkF6eGJjOU82SWc0Sk5EV2NNSTZDWG04RllvRjZ4R3lacU50M0ZTbERWQ3da?=
 =?utf-8?B?bXFiNXJNQnV0MDRQWnRaL2k0bVBPRkNaRCtsSFo2bzg4RGI4c2RNQWY1OWxt?=
 =?utf-8?B?MFJuZVFQMkk4dlorZkQzWE0rZVA0bHRNSVdVc0JmT1ZESi9MU0lxOXZ3S3c2?=
 =?utf-8?B?YTRqdDhpZFlXR1hwSXozdmpaWjhOQ1NJWUVDNnVKWm1NbXYxMndLVTlwbXNi?=
 =?utf-8?B?T0tWK3JEbHloTkVabkJaeGpSOGU3T3V5VlRUSFZmQnY5YXdnQnNYNFNVdGNh?=
 =?utf-8?B?cS8wbDJoUGRoVmlHdURZcmJFVEllYVBvK1hxNms5NFdBb2t3NEJkTTBWYnY3?=
 =?utf-8?B?WWhMK1V1c29tdGhSSERTQ24xTTM2Tlg4cXQrd1BLVDNrMkxnbXBsMEdKZW1P?=
 =?utf-8?B?NXQ4WDJidk5ncTBlR00wbU9JSThLbWExd3NmSEVnb1JDbzBlV1hyS05MbjRN?=
 =?utf-8?B?VlB0ZG9VQUZLNkF5WjE2T2NSOFBMNzVCSzVWMmNldTRLMXhsTThoMm9LRVJw?=
 =?utf-8?B?WXdHaGpoZ1FYU1J3ajYxc2duemlNSUFBaWsxbFkyc250VkZtSDNoMjV4dlJ3?=
 =?utf-8?B?MnJFaUdHQ2VLSnI3ancxUzdZWU56THRBUWRYenlEMDU5MUFlbGp1bW1lMTRp?=
 =?utf-8?B?NzVhNGx1cTR5S0ZxNU9xSWovNEVpRVkwV2dhZTA2Z3VWUjZmVGJFZz09?=
X-Exchange-RoutingPolicyChecked: VxpKBUvK7MYv0S3/VDVGGUoO3HgLVWNbBuM+F5oeCDX/iR0R8wB/Mf/mOJBjFrhKA3Pb+mz4V/oFMXVJc2EHVlkhVqOLtLtcOdIv88jZsNjiDbWWsCTmz7MJCaHQq0z+KBgo0z82zaRA0yGa463k+n5jkB4wTMLrfxSNkcswCDcwZA0zJ6jGEDuv1a/VIdDwJQFfoSI1+fLj1jRoJ+6kUKxvAsRAzQ46vjr1PsdKL+2Wlh7P4uVqURmUmCaDiA44L70Yv3HLm+8RAnZAMXEVT4XZwS4dLYExoX4j36DJiV9Ez7QsfdQJQobPyjBGbohyM5fdtLvRHdSLvhPVKafRXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d4cca7ff-ccdf-4e25-2f84-08de9bf17b17
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 19:50:58.8815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAsnsdMfa6oc/jhZxRcfWGdQk1HJH+wfkBWNjfRJ18++cPaoyo3HtgBY1cVNQdHlotVphYDR4M3PPbWX2kPXFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
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


On 15-04-2026 05:13 pm, Juha-Pekka Heikkilä wrote:
> On Thu, Apr 9, 2026 at 3:04 PM Sharma, Swati2 <swati2.sharma@intel.com> wrote:
>> Hi JP,
>>
>> Overall patch LGTM. One small nit.
>>
>> On 01-04-2026 12:34 am, Juha-Pekka Heikkila wrote:
>>> refactor to make it look more nice
>>>
>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>> ---
>>>    tests/intel/kms_sharpness_filter.c | 108 ++++++++++++++++-------------
>>>    1 file changed, 59 insertions(+), 49 deletions(-)
>>>
>>> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
>>> index 029b735bd..ed8d2e48c 100644
>>> --- a/tests/intel/kms_sharpness_filter.c
>>> +++ b/tests/intel/kms_sharpness_filter.c
>>> @@ -88,15 +88,6 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
>>>    #define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
>>>    #define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
>>>    #define NROUNDS                             10
>>> -#define INVALID_TEST ((type == TEST_INVALID_FILTER_WITH_SCALER) \
>>> -                || (type == TEST_INVALID_FILTER_WITH_PLANE) \
>>> -                || (type == TEST_INVALID_PLANE_WITH_FILTER) \
>>> -                || (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
>>> -#define SET_PLANES ((type == TEST_FILTER_UPSCALE) \
>>> -             ||  (type == TEST_FILTER_DOWNSCALE) \
>>> -             ||  (type == TEST_INVALID_FILTER_WITH_SCALER) \
>>> -             ||  (type == TEST_INVALID_FILTER_WITH_PLANE) \
>>> -             ||  (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
>>>
>>>    enum test_type {
>>>        TEST_FILTER_BASIC,
>>> @@ -327,12 +318,37 @@ static int test_filter_toggle(data_t *data)
>>>        return ret;
>>>    }
>>>
>>> -static void test_sharpness_filter(data_t *data,  enum test_type type)
>>> +static bool is_invalid_test(enum test_type type)
>>> +{
>>> +     switch (type) {
>>> +     case TEST_INVALID_FILTER_WITH_SCALER:
>>> +     case TEST_INVALID_FILTER_WITH_PLANE:
>>> +     case TEST_INVALID_PLANE_WITH_FILTER:
>>> +     case TEST_INVALID_FILTER_WITH_SCALING_MODE:
>>> +             return true;
>>> +     default:
>>> +             return false;
>>> +     }
>>> +}
>>> +
>>> +static bool needs_extra_planes(enum test_type type)
>>> +{
>>> +     switch (type) {
>>> +     case TEST_FILTER_UPSCALE:
>>> +     case TEST_FILTER_DOWNSCALE:
>>> +     case TEST_INVALID_FILTER_WITH_SCALER:
>>> +     case TEST_INVALID_FILTER_WITH_PLANE:
>>> +     case TEST_INVALID_FILTER_WITH_SCALING_MODE:
>>> +             return true;
>>> +     default:
>>> +             return false;
>>> +     }
>>> +}
>>> +
>>> +static void test_sharpness_filter(data_t *data, enum test_type type)
>>>    {
>>>        igt_output_t *output = data->output;
>>>        drmModeModeInfo *mode = data->mode;
>>> -     int height = mode->hdisplay;
>>> -     int width =  mode->vdisplay;
>>>        igt_crc_t ref_crc, crc;
>>>        igt_pipe_crc_t *pipe_crc = NULL;
>>>        int ret;
>>> @@ -343,57 +359,31 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>>>                      "No requested format/modifier on pipe %s\n",
>>>                      igt_crtc_name(data->crtc));
>>>
>>> -     setup_fb(data->drm_fd, height, width, data->format, data->modifier, &data->fb[0]);
>>> +     setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
>>> +              data->format, data->modifier, &data->fb[0]);
>>>        igt_plane_set_fb(data->plane[0], &data->fb[0]);
>>>
>>>        if (type == TEST_FILTER_ROTATION) {
>>> -             if (igt_plane_has_rotation(data->plane[0], data->rotation))
>>> -                     igt_plane_set_rotation(data->plane[0], data->rotation);
>>> -             else
>>> -                     igt_skip("No requested rotation on pipe %s\n",
>>> -                              igt_crtc_name(data->crtc));
>>> +             igt_skip_on_f(!igt_plane_has_rotation(data->plane[0],
>>> +                                                   data->rotation),
>>> +                           "No requested rotation on pipe %s\n",
>>> +                           igt_crtc_name(data->crtc));
>>> +             igt_plane_set_rotation(data->plane[0], data->rotation);
>>>        }
>>>
>>>        if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
>>>                igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
>>>
>>> -     if (SET_PLANES)
>>> +     if (needs_extra_planes(type))
>>>                set_planes(data, type);
>>>
>>>        set_filter_strength_on_pipe(data);
>>>
>>> -     if (!INVALID_TEST && data->filter_strength != 0)
>>> -             igt_debug("Sharpened image should be observed for filter strength > 0\n");
>> Since this in NON-CRC based test, should we keep this debug msg?
> I don't think this debug message help here. Maybe these tests should
> be moved behind command line flag so they wouldn't be run on CI?

Ok. No, we need to run these tests on CI; else we won't be able to catch 
regression.

>
>>> -
>>>        if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
>>>                ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
>>>        else
>>>                ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>>>
>>> -     if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
>>> -             pipe_crc = igt_crtc_crc_new(data->crtc,
>>> -                                         IGT_PIPE_CRC_SOURCE_AUTO);
>>> -             igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
>>> -     }
>>> -
>>> -     if (type == TEST_FILTER_DPMS) {
>>> -             kmstest_set_connector_dpms(data->drm_fd,
>>> -                                        output->config.connector,
>>> -                                        DRM_MODE_DPMS_OFF);
>>> -             kmstest_set_connector_dpms(data->drm_fd,
>>> -                                        output->config.connector,
>>> -                                        DRM_MODE_DPMS_ON);
>>> -     }
>>> -
>>> -     if (type == TEST_FILTER_SUSPEND)
>>> -             igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>>> -                                           SUSPEND_TEST_NONE);
>>> -
>>> -     if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
>>> -             igt_pipe_crc_collect_crc(pipe_crc, &crc);
>>> -             igt_assert_crc_equal(&crc, &ref_crc);
>>> -     }
>>> -
>>>        if (type == TEST_FILTER_TOGGLE)
>>>                ret |= test_filter_toggle(data);
>>>
>>> @@ -409,13 +399,33 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>>>                ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>>>        }
>>>
>>> -     if (INVALID_TEST)
>>> +     if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
>>> +             pipe_crc = igt_crtc_crc_new(data->crtc,
>>> +                                         IGT_PIPE_CRC_SOURCE_AUTO);
>>> +             igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
>>> +
>>> +             if (type == TEST_FILTER_DPMS) {
>>> +                     kmstest_set_connector_dpms(data->drm_fd,
>>> +                                                output->config.connector,
>>> +                                                DRM_MODE_DPMS_OFF);
>>> +                     kmstest_set_connector_dpms(data->drm_fd,
>>> +                                                output->config.connector,
>>> +                                                DRM_MODE_DPMS_ON);
>>> +             } else {
>>> +                     igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>>> +                                                   SUSPEND_TEST_NONE);
>>> +             }
>>> +
>>> +             igt_pipe_crc_collect_crc(pipe_crc, &crc);
>>> +             igt_assert_crc_equal(&crc, &ref_crc);
>>> +             igt_pipe_crc_free(pipe_crc);
>>> +     }
>>> +
>>> +     if (is_invalid_test(type))
>>>                igt_assert_eq(ret, -EINVAL);
>>>        else
>>>                igt_assert_eq(ret, 0);
>>>
>>> -     /* clean-up */
>>> -     igt_pipe_crc_free(pipe_crc);
>>>        cleanup(data);
>>>    }
>>>
