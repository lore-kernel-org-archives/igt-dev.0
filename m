Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54A7CA5FD9
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 07:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5D910E386;
	Fri,  2 Oct 2026 07:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aaIncAJW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C3C10E386
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 07:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790927496; x=1822463496;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Uv0Uw2OusGD2r9e+rHrnaeoH6ZT7ME4AlPe8LNsJNdo=;
 b=aaIncAJWIQ3E0aU4/umm3VOP8S0cBh6oBSry6Ks+PH3oygZappLZyERs
 IzUFSCTZdxFjulzCrDBXKvelBzIeI47iCvEW6WbPsDFQw7ufL1iz1oetX
 W8Cjtpmm6Ce+RWvndXOqje2jHZLcwa1ALHxG91aMnSo0gK1aNVzMy0Q/j
 w451q2OjjVxNnjywZ9TAvhm/PVk/Rqup4+0dp9zwGssfd0M7kjVeRKrSD
 f18PKL07lyJf2IL1dBKyQMiFDaVJlrK9+wGIu3KwBijsrlBkQ6IwCM5q0
 6J4bOKeBw4jfNMsCOavLPO8JNyIzDgpVxMMbVkqlr7OisNHoPapw5SFMK g==;
X-CSE-ConnectionGUID: 55zVZfIUTOeiIEp5jtj7lA==
X-CSE-MsgGUID: MtriMkZ8RwWHXO+ILAEluA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90830228"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="90830228"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 00:51:14 -0700
X-CSE-ConnectionGUID: /mo2kmDRRF28qM3Lx54UJA==
X-CSE-MsgGUID: LOkKJ3D7T0y0Ml4o2agY7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="206761"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 00:51:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 00:50:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 00:50:59 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 00:50:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJGJotrOwOW5JwANCHxqHdoK5xhhI7tCL0UhEOMLnd7R1nQ5I+USvN69puDvydafbuA57qDng23V/FIWXLRH8njo1JOT5OjqWNmaII9kl/+N3xb/r9RFjIlxGq2gxzVe9SsX2S8Gc8Z//1Y9tjMRdJzF4ZjYahsV7jEtbXfaZjCbu7qFj6HQ6PJLLch02oM3RM3BYSSzc1bqlX1Gf+Lnh1lBinEZs3uQdlRCDWQMIaP36Hdc9Zaxjeu6XmNPVaXTWB1nO3MiU6INuToJYwWqDeOdH5twS5UAKXWf0rzGcV4LXoKSy1vd/flTh0XDN7+QKob4ZlNsEgeQUnYnP6ML4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57Z01VA36Jhw0N1E0F7CLmf71BTUBQig55LulKhDkXc=;
 b=QDP3UCkIrDloEj9V31rw2dFcxYeVc0sVJ/LCVcPJ5FU5P/OkkuFJ+CqH0BuX+HXkKZlqyoByqrPXVRJ5MAYfQHYNShxlzbNM83zx5BiONKqm4SGhiId1a1hIeG8JVNkPBnc3MOx1hqVUcdeRLn336eQEAGwR+Lrk6xZ8ihjb43sqeo1QNz9NZdljdfhNIcjFh3vuKsLOE6mRgQjTYRhBItsvR5BDXM3wZs2+DrWkvbq+5zCBYpeHeCYWRHxaJCrYET33dMsGCC/+IaIZt/Zp4TRelUG/+xbUm9TBCaJ2/dnlh0r0OxjIPXI6/z9Mqgvci20S+TKtBAQrYpdzlzCcGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by IA1PR11MB787425.namprd11.prod.outlook.com (2603:10b6:208:45e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 07:50:57 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%3]) with mapi id 15.21.0451.026; Fri, 2 Oct 2026
 07:50:57 +0000
Message-ID: <a9119b28-9ec1-4e18-8ebf-44c7f2087ef8@intel.com>
Date: Fri, 2 Oct 2026 00:50:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v14 4/4] lib/intel_device_info: remove the
 graphics_rel from xe2+ devices
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <kamil.konieczny@linux.intel.com>, <stuart.summers@intel.com>
References: <20260928172713.1341060-1-x.wang@intel.com>
 <20260928172713.1341060-5-x.wang@intel.com>
 <bpunru5h7bshkbvwkthco6uyfpc6tfsx25lh4d7puozo4pcx7j@jtlzpc5seuzs>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <bpunru5h7bshkbvwkthco6uyfpc6tfsx25lh4d7puozo4pcx7j@jtlzpc5seuzs>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::21) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|IA1PR11MB787425:EE_
X-MS-Office365-Filtering-Correlation-Id: a32e95ea-9abb-4952-5590-08df2059e4b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|42112799006|376014|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: MsDoNQgboVGGnHrKK/maqrfr/ixllnFrvIDsH4Jh7DYGsHXA71/hLMLJ3TWCIcG2VzGZxAVKJYQdXN+fNawGLE6H+JW0h5T2Yynvedm0c77+DA6DhaAoprbp1GpKlTgugg6iRISDkQJwyIfiHZfp657EIQlt6llbc1/CauBdM0s2uTqN6HRAQHoQ1WwE62Q3UdqrJTWnPMX4O4Twbq131clxgJdwGZNxzml03FYzJRqtk6MGCOxnUApU+sbmbwUSFw2cIvBvxzmtRVhoeKXIjVej0zLyKxZtQntg2RJ04gfINVZBUq87SuqNd5jYbGpLIk+GJ/QetFdreyrhFEoK6csRlAZoekndhf0a5ua6cp0l6Yss5fUh3Vj8Ry4IAQNc6tMiTdmUTXUy9B25m4+rUXlFmIUqr8sWHhbj1YmaIT/mxD4mRRlyGcM0ENYEhJKK8EPpbo6JmKpgWFfjzJShqb4r5IcE3txDrpsObKanLfBc/Pa/SlUQU3YZRwMI+sjKibYp6dAnwFyZFhBaLe6ID7wdxrl/yZFMfXaVBk/1Gdu2wpYtXBEyMOsnDx4/XUOfe774tqBPZxKeM0y1IA33tvo2YYRCOr+gXvgYPrGcrVraNU66ACqw49/fYeaql8s9iT8xLgLzX42j5JHTyGxLU/RxwFADDUuaUrX69xOjF7M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(42112799006)(376014)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckc1Vy9vSnEweTNJMnVRcVRiZTVSV0g1cUJvWXZXc25MM0hRazlyWWcwcE9w?=
 =?utf-8?B?RzJLaG1KM0kydjRWTHRYcmhrWkRIT3VGRzlhVUJTZnNyQituVjI3QlpCNXpl?=
 =?utf-8?B?K3JQS2s0bGNwRGhTWTJHWlQzRmZPanpzV3dmUUdwSXRXM1kzc3NtVC84YzRU?=
 =?utf-8?B?bWRpT3JYc01hNjFDMjhZd2FwQlBjR3pLT01BZWQ5S1c2Y1FKSUI4Yll2aU9z?=
 =?utf-8?B?Q2JqOUMxaGhyZHlDcXk0ZGMrT3EvRlNua3daaCtzMzZ2Z2VRSVVLVXRkb3ht?=
 =?utf-8?B?ZG5PRjRJV0dQVk1ZNy9zTUY1SExDR3V1NlVLUFpJRFhQcUoweW1wUnpXS3lF?=
 =?utf-8?B?VmFKYTZTNWEyRDIxNkV2Skxab3p6SGFLTFhSRkt1YSs5S0lEYllNU2lYN3dL?=
 =?utf-8?B?RFFVTzFyVjNNVUZVUmtDVDloaUFHVlpIUmY3RVFROTluOGIyUVFSUTc4SHVW?=
 =?utf-8?B?bUlpTEFIYk1yYzdIcllmaVVTQzVON2UydjFxNzRlRlkyWE0rUkgrUXpuV2Jo?=
 =?utf-8?B?ZHlaaWVOUEJ1TjV3STlUb3MwUmYzaVl2OTIvTXBkdjBoSnJxejNSc2pUOTBT?=
 =?utf-8?B?ZERLREtZektWNS9KYmF0Tjh6QlltMEd0Y1V2NkxVY3hRT2xBZFd1S2JjWjVR?=
 =?utf-8?B?bzc1UUlCa0dUeXpSRHUwNFBnOUVSamcxclFkUnJScXYwZWgvRXREVE1PRUJD?=
 =?utf-8?B?a1ordmtZMGM5TzhmL09GalhTYWlYcU90TFdFcGc4MTFzaDBKaGdkQ1dvUEE2?=
 =?utf-8?B?N01BcnZLa2E4TnMxbzRnc2F4Qmh3d2pzR2VPazgweVYwZGtHTmNGZ3pQL2Zh?=
 =?utf-8?B?WjY4anBKUFBkN2NvdHRUNnVaUDNPdWFNNmUvNm9VZDVVM1BydGlIQ0N2YmtC?=
 =?utf-8?B?QnE1b1gwR2lXOFFiNkI5dExNZEJMZGtBSkNuTUNDYmxjQU9TQzB4ZTVqWVZL?=
 =?utf-8?B?bW1jUzNMWmVCVHpFbE9YWTducDJPWEVHak9TUDl5N0ZXRStwdkJOdVd5SkEv?=
 =?utf-8?B?TGhvK0JPOS85bjBycXhmVFpSbFdON21FM0lwQ21nbjViNHduMkIzQ3JwWGNO?=
 =?utf-8?B?UEhGL2J1ZFZURkIvOVhWZEpQZWVxWFlmdENYbVBWWVhpUWNkMjBzeVIrTHZn?=
 =?utf-8?B?Q1V0bGQwaXBhOFI4bi9rWk1iWDcraE1odUttcnJWNDZyekt1bVZXdUY4eW1V?=
 =?utf-8?B?anJ5Y09QUys1cDFoWk1NU21OQ2EyNlNnNWRsQ0JzZWlPaVh4djFUajBpVGFs?=
 =?utf-8?B?bnlReTB1UUFBS0pmOE95Y1dibmkrSU9OczBzU1d4Vko5bHRtcUNVM1grLytu?=
 =?utf-8?B?ZkJCUXc5TmttRUgxd01sMC9IdmU3cXhJOTVWaEVkR1JvOVlzSGNZQzFsT01m?=
 =?utf-8?B?WGxEc00yMDFxYU1pUDA2dVVXalJxdmg3ZDdMKzgxTHczZ3BORG9kdkVmUENx?=
 =?utf-8?B?Z2pMTEZoTUN5dWVOU0tocmFNaXBsQ0tXYkt2ckl3MU9rTlkrR1o3WGIzY3Rw?=
 =?utf-8?B?UzR4d2RFcFA5c2FQMEVyYTkzWjBXWTV5ei9POTNydVRTSVhVWHdMbFY2TnRi?=
 =?utf-8?B?TDZPVnNwK0JkV2k2V1hObmNmZmVMZGFCRWdVMndmT0pDcTFtSnBJejF1Qzhz?=
 =?utf-8?B?Q0F5TVZEaTd4bG5zVE1YVTVLSG9hblhjeTVPQmZ4a3VGZERYT0hCWjNOTiti?=
 =?utf-8?B?bEgxeTF3OVEvbG0rUE9KczdLekV5QUhJNVJZOHVWU3kvQ1ROUDdtR3ZuWjl5?=
 =?utf-8?B?blhPdlJpc2dpbGZEcmQ5N2ZDZzJWRUdyVjN0c0JjVENteFJYdE5IOUFjT1Bp?=
 =?utf-8?B?Y3NIazl6aVpRdUt6T1BjOG5ISkNpd3ljMTVidHJIUGFpTms4N0V4OWhiNVJp?=
 =?utf-8?B?alJBQTYrTW0rZUpITGI1TkZDWXgzS01NSUlwUHhBUUNIVEQrM05ENlhzYkx6?=
 =?utf-8?B?U2FHN3pFWkl0Yzd6Y2lPK093ZkZ6alZLWHVUcFFnZzh1SzZXNFRGaGxvcWJr?=
 =?utf-8?B?NDdMYUh1TXNvdlQyVFllbnp5QzB1T0ZZNE9wL2RRZTluVm50Q1ptK1p3Tlds?=
 =?utf-8?B?cmxYclc3amUwTWpUS0lHK0FDbFRQeCt0c0xxNjZjWWNhT2R4cU9JMlh5K0dD?=
 =?utf-8?B?bTFsN3VsUkFaVWVCeFluS2kxQUhtQUdUaWU3VUlCLzJla3JaZ2NVVWNOdnZG?=
 =?utf-8?B?Q1dacGowY1M4bWwvZzcvSEVtSzZnVGk4SFpQazlvbFpHck85NDJ5VVZpbkI1?=
 =?utf-8?B?dWdoalgyWmNvN0kwUnZsU0g0ZkxlQ3d2SElpeFAvL2c0aGZSYmg0dzQwQWR4?=
 =?utf-8?Q?FLOsyUTDAp7VVJUeHt?=
X-Exchange-RoutingPolicyChecked: pU4opqcgXnEAfsfqk2iRvohzf647pRfLmp44ZbYCwPVeA1d3IID0D6ZBMnV7o/vwkcBJOZzUVTfOdn7iI+IgLPYRdN1pBIwUZEuj409L/E07rvLH0juER57lCKFsFHW8Vxggzs2lfuPQv+eVVg2flfkzvkJhHrr//pB5KOj9MZgPKvgvTKzhcwjJ55cYP3jI8Sh8ht5eRVWnJM3hN7NGSdW/zIl3ASTZSSi+G4SaDPTvodXTdtUZiDQ6BKWDdfEAkSYheQ6zp4Eenh5YLlfbY7pgKuvU4VnT5Pzca9QY3EP5QsVUntTWaEzq4kKfDNrIEojv9Q2BZ0HmeCeE973WNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a32e95ea-9abb-4952-5590-08df2059e4b7
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 07:50:57.5070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRNhD/5996dLicuj7VJNPhNLa6fhJKqrtlqqeCT5oauUJYhNzERin581Snz4GtOhBRP07ScBXpuPMzsBi0vvnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB787425
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



On 10/1/2026 22:05, Zbigniew Kempczyński wrote:
> On Mon, Sep 28, 2026 at 10:27:07AM -0700, Xin Wang wrote:
>> On Xe2+ platforms, the graphics IP version is no longer a stable
>> property of a PCI ID "device type". After IP disaggregation, devices
>> sharing the same PCI ID can report different IP versions via GMD_ID, so
>> encoding graphics_rel in the static PCI-ID table gives wrong minor
>> versions on such devices.
>>
>> Drop graphics_rel for these platforms and rely on the runtime value
>> that xe_device_get() reads from GMD_ID.
>>
>> v2:
>>   - also drop graphics_rel from WCL and NVL-P.
>>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>> ---
>>   lib/intel_device_info.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
>> index 9201ca806c..0879f49038 100644
>> --- a/lib/intel_device_info.c
>> +++ b/lib/intel_device_info.c
>> @@ -512,7 +512,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
>>   
>>   static const struct intel_device_info intel_lunarlake_info = {
>>   	.graphics_ver = 20,
>> -	.graphics_rel = 4,
> Can't we drop ver as well?
We still have PCI-ID-only consumers, such as intel_gtt, which accesses
the device through PCI BARs rather than xe_device_get(). Its GTT
address decoding uses intel_gen(devid), including an explicit case
for graphics version 20. Dropping graphics_ver would make that path
report an unsupported platform on Lunar Lake.

> --
> Zbigniew
>
>>   	.display_ver = 20,
>>   	.has_4tile = true,
>>   	.has_flatccs = true,
>> @@ -524,7 +523,6 @@ static const struct intel_device_info intel_lunarlake_info = {
>>   
>>   static const struct intel_device_info intel_battlemage_info = {
>>   	.graphics_ver = 20,
>> -	.graphics_rel = 1,
>>   	.display_ver = 14,
>>   	.has_4tile = true,
>>   	.has_flatccs = true,
>> @@ -536,7 +534,6 @@ static const struct intel_device_info intel_battlemage_info = {
>>   
>>   static const struct intel_device_info intel_pantherlake_info = {
>>   	.graphics_ver = 30,
>> -	.graphics_rel = 0,
>>   	.display_ver = 30,
>>   	.has_4tile = true,
>>   	.has_flatccs = true,
>> @@ -548,7 +545,6 @@ static const struct intel_device_info intel_pantherlake_info = {
>>   
>>   static const struct intel_device_info intel_wildcatlake_info = {
>>   	.graphics_ver = 30,
>> -	.graphics_rel = 3,
>>   	.display_ver = 30,
>>   	.has_4tile = true,
>>   	.has_flatccs = true,
>> @@ -560,7 +556,6 @@ static const struct intel_device_info intel_wildcatlake_info = {
>>   
>>   static const struct intel_device_info intel_novalake_s_info = {
>>   	.graphics_ver = 30,
>> -	.graphics_rel = 04,
>>   	.display_ver = 35,
>>   	.has_4tile = true,
>>   	.has_oam = true,
>> @@ -572,7 +567,6 @@ static const struct intel_device_info intel_novalake_s_info = {
>>   
>>   static const struct intel_device_info intel_novalake_p_info = {
>>   	.graphics_ver = 35,
>> -	.graphics_rel = 10,
>>   	.display_ver = 35,
>>   	.has_4tile = true,
>>   	.has_oam = true,
>> @@ -584,7 +578,6 @@ static const struct intel_device_info intel_novalake_p_info = {
>>   
>>   static const struct intel_device_info intel_crescentisland_info = {
>>   	.graphics_ver = 35,
>> -	.graphics_rel = 11,
>>   	.display_ver = 0,
>>   	.has_oam = true,
>>   	.is_crescentisland = true,
>> -- 
>> 2.43.0
>>

