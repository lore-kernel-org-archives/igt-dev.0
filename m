Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB872FF8860
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 12:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D21910E725;
	Mon, 27 Apr 2026 12:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ow314jiR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1631A10E726
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 12:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777293521; x=1808829521;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vfb3lIXIqswGres15rTOYi27WCWn3D8gGTKxy3gGN1Y=;
 b=Ow314jiRV7dcOEdsFPA3MH2Tvd14pka16NPX28BRJ4Kefo3dc+kpNns1
 sgljiM2jeY25nNBFM8swnk5Jy+Gf/w1Zbn2KioF5y+X4MzfuwdTj2Nhyy
 z+jOlF+qFqdeix/qnOOUscASgB9O5EKLdc6ISCJcJ1113dbvEbgqA6STa
 I6lpUdpffO4UIkO8h5UY2ei+NoBtkUDPdO3Yycw8oIbzRybIAz+3dofau
 9Owy8DwOKJ3F1lLzxNYgrt9wBIY4z9q6fAi4L5KuKn/KMtDoP9FgRnZgg
 WEsgkBTDMh30Inr0s/rAanpUVpWSIwQv0ephtoJpXnckS80AcfDD0wAyc Q==;
X-CSE-ConnectionGUID: sxs1Ak1gR5isEbIf6Hf+YQ==
X-CSE-MsgGUID: 8WTDNuS1T/OJR0/6ltlWgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="95740064"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="95740064"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 05:38:41 -0700
X-CSE-ConnectionGUID: uZq1m+D8TKWuC+WmKY4X9g==
X-CSE-MsgGUID: t75uHjARQXakdsGxsjwPxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="232641207"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 05:38:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 05:38:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 05:38:39 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 05:38:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ME8s7TNIC6sL+MKeZSs0CcEmLSIaDHWlq/YYMv4Dv+O5utKH13LchyuZ46oGnh36KKHXoS3dcm6V4nT0YKtk/XOVVHOUC+JL9vcB9/dz4tWikHNVOGeTAy0DsV9RbEAFUpmBzf3Crf1naUs0xEOTbtnogk146nMCa2gsRhn/p+jjGzgwSpLra6s2nkn0ltYhE59cbhtC7r6EaUL5POJzGeWngO2txDUyikOJl5Lt7u+3KwAT9axK/Ydhp+TZtxXjIhR0SRaeRauJ3iDhygFOo+gO/y289hzbxX9mhDHpsed8G7GK+iHD+TugeD0wvnwOkQLuulO/22SNMi0juB0chw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQpH++I74bSWQB5dajObA51cS6SO0XzvJ+XWB3TZV0Q=;
 b=ivuU26geEcY+9K4RJd6LPGKuxovmgS/lsPuojLVf8BV55bjLGrgkN16mIYO8oTfHndMXAJfi5O67wE+R4dRXjYrO4Atb7RjULEjrI0mzE4KPLiednOrCuZzun+IuPzkKiSyAQ5topdSZaqUeIDFnJa4sZ5Tv0Bm0pNN4X+f6UFJ58poH+dxNHaHGKz5iCqnSYYic5PcX6pmWMYHy9PkBfPIivT9ljJRkhTnT/d9x7Ob3UxgN2RKKhCGRxjrfQOkWJMlmdMyKzodye+8udTBYThobF3/zozGeqZTcl+Rvv9h93yXaWLJO5dmd0ARAXuO+eovXF5Q4QJ3nj7dYPxeNlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 12:38:34 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 12:38:34 +0000
Message-ID: <7f4df10b-4f7d-4182-ab63-c6654253cea6@intel.com>
Date: Mon, 27 Apr 2026 18:08:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/8] tools/intel_vbt_decode: dump eDP data rate
 override field
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
 <20260422034335.2326098-7-ankit.k.nautiyal@intel.com>
 <761b1815-3012-4f5a-9916-508226fff572@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <761b1815-3012-4f5a-9916-508226fff572@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0246.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::13) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY5PR11MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 49cfd77b-2eca-4faf-8dd9-08dea459e3e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: G2NJJCG7gznVsOPYsfvq+56ncs/tcGWWsaytMRcFMSW476DS96QZPb/YJpqzktrDyQqeex7TptgO7L5oWzGxgl1ZX95amMfDSbsIpXpQoZ8Fv43Hlj1ejo/osr/15+tjCrylsmVuoPNUwG94pLS4v36otYFLlqy5ctW29rQPCzsNUCaDu34w1cCrFEHOzAP04UiZw7DUvyir+NSisN+354BgiENrreTOSvFEmVcbEcM7ii/C2w17prQUEqcHGflynWkXiwZasDBTrF7Y4npzBCAJMFsJG0BsxGPq1/sth409MCbaza7M3rUhnjDhLxsCIAvmgbnECurMwxmaxTk1RTQuYuIt2T0g53uyJf8GKwWWo0VjJvIvO+lhmaVm0rWq7iicUeS6vcaaZuMbxW9aU5PiOaxRbyoRZudOLzvdIssW9kBMllR8l7sfFxZ4Cvn/dkFA8DUi/my9XiRRglJKgIwwYayHr8b5BjyaHccMHFefKSN5zSqvgNp62mZCDBF5eaYdKxIXKrZp1+Ssa+unMOzhBvISD0Xto5FYY+XVHw7AY5LFle2v3bc3dKi6UKgAnRg7P9C+wU4n3mhfPu1DDzOgmtqWdvhRT+qURX17F5OnwkmHWYZB8SZCOjOYyCcJtwDnM48x5CqMecHuRY28AUO9vpXZZ7npY3EAJukyCVOLl4ka7oaBy9lS65wrKHpSidb3nBOa8ZyCCPwYs29BmiunfHsEkMc0A4q3jgo4PGo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk9wOGFwbFgwbGpPcmg5Q0ZTN21GdmpNVnRqUkRHbWFNRFMvZ1VYNlh5WmJp?=
 =?utf-8?B?dWFGTWNxNnhwdWtxNnFWNGtoK0tnSEt1MjN1RndJSkF3bW9WbjNRQ0huRnhF?=
 =?utf-8?B?MjAvSVFpRlk4dENnUmpDQmFDdjBLellzUktKd3gzSGh1N01mNERMeEVZUElW?=
 =?utf-8?B?UlF4TlBsUXU4VHdyZWZScEoyelBRZFN3NHY5MEIrdjJBQXA0dDNlOW85TTFz?=
 =?utf-8?B?Q2xzR2NPbWtVNnlUYTIvYTNmQkdGU3g4NFVYNXJ4RzdHK2MwWHF4bkpmOHh6?=
 =?utf-8?B?UVozdXhYODBsbkU0Z0xHU01sT2Zncithd2MwU0VkSnBzZEpnTmU5RDdITVRN?=
 =?utf-8?B?cTRHakI1R2hFTDlwazZ4VGhJSkJ3S2lDZi8xbUo3cmNneHI2dTBBcTJHc0hs?=
 =?utf-8?B?dGNObkRQdCtJdnltdkhhTmlmSFRsNFlFZ0JiWHhsc1p2cCtGOFBUcm1Vb05s?=
 =?utf-8?B?clVRUkpzaSt5aWU0RWx4S3d4LzJSS3hhTnRBOVFjMzBLYzduZHUrdXFHeWtG?=
 =?utf-8?B?ZklqbVdVSVVqcVVvQTNpTnJRQjhBcXZrQzlONy8zNFNraExabkQ3Z1F6SDZy?=
 =?utf-8?B?T1VXR0NUVnZxaWd1NHVOMUd5dG1aeitsOFNxTUpyNGhKSTlXUlJwOGthdnc4?=
 =?utf-8?B?cHZaNmxVMVRJMmQzTHplOHFvY2o5ak1JVzFZYzFkTFQzSzlrR1EvQTlMQXpt?=
 =?utf-8?B?TVQrVkRUK3k4bWVTazBhUFl2SWdOMXlYbXYvOHZtNGt3OWxuc21ObGJyeGV1?=
 =?utf-8?B?eWc0azVYWmgzbjF0MUxDNFV3OVdCaUhQNUZsM010VldBSVpBWlNDc1RWbnZv?=
 =?utf-8?B?TzRaVjJwM1l4bCtCMy8vamZHU1MxWDN4TDQvVWZpK2ErTTNDQUk1YXZQL0dT?=
 =?utf-8?B?bWhvS1oxa1dweDZ1WW55WDJMQjNsRG5PTzV2Y01oaEllZWJUd2xhUlpicUZG?=
 =?utf-8?B?bUE1d3psMUtJL2RONVpOZU95YnpUdUk0bmpFcXA5SmRuSHBFUXNiNzEvbXZj?=
 =?utf-8?B?eDAzY3VXbUZaVDdqaGoxVjA1dUw2TURjU0NmaWdwTmFEeHNrRUF3NnZmM3k0?=
 =?utf-8?B?VTAxQUYrMURBRHo5KzBIaGhVN0xvUFZsOGloeGxDdTQwVVJGcmdlNUpFUVNy?=
 =?utf-8?B?bDR6dllURVU2M1hEblh1Z3VNU0ptZEtKMnJMek53RWRtSEJmd3lxbUZES3BF?=
 =?utf-8?B?c1crUTZqMklTOFhPZTR4RW5LazJqQUJuUkxzY3U1T0tleThiVEJSNk1mWHlD?=
 =?utf-8?B?dTdSUmp5Vko4Zmt6Nm9aeE5GdVE3blBCTVdoUmExQ3ZLNDZXa1VRaFh1UmN4?=
 =?utf-8?B?VkMwQm9sS0UrVzc2SkJhMmRQT1RVTmdPZkNWa2Q3eldnUWVseVpiS21KaFBt?=
 =?utf-8?B?THdRQnREbm9zc0djTWJOL2xKTDNabjdIR2kveStzZEthb3RCaVpWUUZjZlNP?=
 =?utf-8?B?ZUc4NkFJWUNLUzRZREhoR3hHTk40V1Z4aFVGdnFic2lFU0JQZzlQSnZVTzA5?=
 =?utf-8?B?Qlo5dUJaY1Vwb3RtTnFZUE5XRWN3eGFoVVdwZXdCQ3ZoVFVKYjN3b3BFY0pq?=
 =?utf-8?B?ZmlGems5T3hSbmNjNGQ2RklyWGdZTjdVdURuQVhuZm9nQU9leWp0Rm4ySTc2?=
 =?utf-8?B?L1U5YWdtTi9IdlJiOEFvejBaTWFyUXFPd01QOHZpUitWUHNpaXFidVN3bDdy?=
 =?utf-8?B?ZjVxaldkaStXY3ZsVE85UG5zZnBlUEs4ZEx3c0dlVmxXSjNxS2VYT0pGUUdZ?=
 =?utf-8?B?ZjBzSlJpR1graW1heGY2ZXRYcXF0Yk9sa0lIUUFLK3c0V2t0bFVWL0dMZ0hW?=
 =?utf-8?B?YUxoU3JxY3BDQVpiOHJSMTVVSUhidE5YVXRUVzhiQzZvaEhTaFlJVGt5Mi9t?=
 =?utf-8?B?M1pCOGluZ2JlaCtyTThJM0F5c0YyMjRmelRlZjBML0xxcldVQ2l6c1pqdmdD?=
 =?utf-8?B?OVZQZ0preHFqU0JiSnIvOTNWOS9aSjYxMEpZNGkzcG1BenphVko4UldNUG43?=
 =?utf-8?B?WUtuZXhHaEtVaEpFWFRIbnllUHNkS2V2OVEwUHJpQ0RIQlZIRUdUOTNscFQw?=
 =?utf-8?B?UmFSUEtWTW5jOHhWR2M4bVpjVCtHdVF1dmpHL0VqUStvaExHdGs1KzFHaGFG?=
 =?utf-8?B?OURWb3dtYzJZVklHQmNUenhSRWxzSUZNWWxZdXJwNmd6R2xhTTVvV3NZSzZ5?=
 =?utf-8?B?OFBucGVNTWxLSGJkSVdYbzFTampNeVl6WC9QUWw2YzM5dzhxQWErYUk0Nmdp?=
 =?utf-8?B?bzB5SU05NG9OZXo5cXpZMm0zVWYwUXBPd2dmNURVVjdUckhRL2RYRGVZN2tD?=
 =?utf-8?B?bFRuZFVjckRtb2FhbG1PVEFDSjZMaXNMZUN4ODFrSnMvRDdvVXpncnphZktX?=
 =?utf-8?Q?niFaxWJmt/dg8UPU=3D?=
X-Exchange-RoutingPolicyChecked: b2wSmd7HDc/IAJAfW2zgKM6h/d5WTvwgM+ri3vhImJBgkCM1gwGDtydEDO66vpvkTVo1do83aeBVanqXVCi79UqImuv4nDkdfqP3XBc7SomNG+3uvv/5mHLoKinIb961jQbUok6GA6h4bJcqnMJItxbtN6PY+OuvuhpSZQSRuOujpL3MEslAi+0E6EVxOsDf/SK5fFs2Cr3kcLYCwSEpftSTfk0Gg2G0caUy4vCwRQJwYw+z2RGdDpfB4TTb9mtIpx4lCfEmeC+++BbZYyCrbfy78sU+1jpOuIISIFAaSbJDFmtSs3nbGOEm0ns/NLYsdvospEjq5AS7OUcFPKJr6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cfd77b-2eca-4faf-8dd9-08dea459e3e3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 12:38:34.4313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAT5B4NjXg6mcdRW2uN2RUY12bgdU7Wi5KGTL1sXunu7tlpH5njai7uwct5PD9eG6L2HUUb8vy1vhxH8KhmTfdrGSqAeM6D2fITRcenu9WY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
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


On 4/27/2026 10:47 AM, Karthik B S wrote:
>
> On 4/22/2026 9:13 AM, Ankit Nautiyal wrote:
>> Add decoding support for the eDP data rate override field introduced
>> in VBT version 263+.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   tools/intel_vbt_decode.c | 36 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>
>> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
>> index 7785e9e82b1f..6c0273aeecfc 100644
>> --- a/tools/intel_vbt_decode.c
>> +++ b/tools/intel_vbt_decode.c
>> @@ -1121,6 +1121,39 @@ static const char * const hdmi_frl_rate_str[] = {
>>       [5] = "12 GT/s",
>>   };
>>   +static void dump_edp_data_rate_override(uint32_t 
>> edp_data_rate_override)
>> +{
>> +    int i;
>> +    static const uint32_t link_rates[BDB_263_VBT_EDP_NUM_RATES][2] = {
>> +        { BDB_263_VBT_EDP_LINK_RATE_1_62, 162000 },
>> +        { BDB_263_VBT_EDP_LINK_RATE_2_16, 216000 },
>> +        { BDB_263_VBT_EDP_LINK_RATE_2_43, 243000 },
>> +        { BDB_263_VBT_EDP_LINK_RATE_2_7, 270000 },
>> +        { BDB_263_VBT_EDP_LINK_RATE_3_24, 324000 },
>> +        { BDB_263_VBT_EDP_LINK_RATE_4_32, 432000 },
>> +        { BDB_263_VBT_EDP_LINK_RATE_5_4, 540000 },
>> +        { BDB_263_VBT_EDP_LINK_RATE_6_75, 675000 },
>> +        { BDB_263_VBT_EDP_LINK_RATE_8_1, 810000 },
>> +        { BDB_263_VBT_EDP_LINK_RATE_10, 1000000 },
>> +        { BDB_263_VBT_EDP_LINK_RATE_13_5, 1350000 },
>> +        { BDB_263_VBT_EDP_LINK_RATE_20, 2000000},
>> +    };
>> +
>> +    edp_data_rate_override &= BDB_263_VBT_EDP_RATES_MASK;
>> +
>> +    printf("\t\teDP data rate override:");
>> +
>> +    if (!edp_data_rate_override) {
>> +        printf("(none)\n");
> Nit: Add a space before (none)?


Thanks for catching this. I will add the extra space.

>> +        return;
>> +    }
>> +    printf("\n");
>> +
>> +    for (i = 0; i < BDB_263_VBT_EDP_NUM_RATES; i++)
>> +        if (link_rates[i][0] & edp_data_rate_override)
>> +            printf("\t\t\t%d kbps\n", link_rates[i][1]);
>
> Nit: '%d' -> '%u' ?

Makes sense since the array is uint32_t.

Will change this as well.


Thanks,

Ankit


>
> Both can be fixed during merge. With this,
>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
>
>> +}
>> +
>>   static void dump_child_device(struct context *context,
>>                     const struct child_device_config *child)
>>   {
>> @@ -1281,6 +1314,9 @@ static void dump_child_device(struct context 
>> *context,
>>         if (context->bdb->version >= 256)
>>           printf("\t\tEFP panel index: %d\n", child->efp_index);
>> +
>> +    if (context->bdb->version >= 263)
>> + dump_edp_data_rate_override(child->edp_data_rate_override);
>>   }
>>     static void dump_child_devices(struct context *context, const 
>> uint8_t *devices,
