Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BE1C87FCB
	for <igt-dev@archiver.kernel.org>; Tue, 12 Aug 2025 06:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C0210E595;
	Tue, 12 Aug 2025 06:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AjyXi4sC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EA010E595
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Aug 2025 06:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754978586; x=1786514586;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/5p/qL+YZBRGa0/AJ4vkCi45Ho+A53Gls1ealD0si0Q=;
 b=AjyXi4sC7lnrsedpUyf131UNCLhlDmD1l0zwH4AtfJZkderFb9/FieTO
 kgJJ0PeLkzw7WOLMsfiGcfk91LreSjfU++7JGpReEwiMXsD2H0fS+5RXe
 CwiIq0J1gZ6flnulCEo/+W1Y1D6fE1Zq2rS6l3EpyOa1woMVDx1S4AT8V
 jArfSnYl/XnPirAeqWD6TkxqXtcX/V3rh2WShvilXFAj/NcTkx7BpDxVj
 im/y8cR0gbaPV6kmMBsjhh8ffop7xTedUMAMM3FG3zVZpnjnZP1HaFFBC
 cAc9uwCD8ji6iG/pIu0dblsX7XjyIE1JCXGW6kt/ysyF+UNSyZ9XguhZt g==;
X-CSE-ConnectionGUID: cin1jEqyTX+Nt60Sp/ZsxQ==
X-CSE-MsgGUID: 70bI11CfQ2uRpq084z3U5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57322397"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="57322397"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 23:03:06 -0700
X-CSE-ConnectionGUID: Uj+jlOi5SR+rEMpKPa6N2w==
X-CSE-MsgGUID: W/cqMAD2RtahgZlRigN1rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="166466642"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 23:03:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 23:03:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 23:03:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 23:03:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgYtPhgZuy1AqLWqK253DdekBHbx3ByAiSj/UvjITymXfVhPoVLWjbi52GUvEXtlBNofIBHdGmZ/gKroTrNRiU17pFpLxagIpgve0skus0v+qFCiKW8siPLDU15ERQXlImePROpqnhYNNJurG4WafycJtq/5Q+DtLepnENaC4KvD8G5UDniPyBrKhwkuuzKvXYrrfkL0OLa+gCFy0FAWESbEfz9QTIWMMo1taRJ+Z0fm8HjNbB88CyN8Ztbj/RUJUc4CQKcV1Gd6KGjY6Oy/t1P+2tTQ73RN39F/UciwPB5wufvYJV1lnj3dpTIjDQCcGJby8nHytjTCnb3BVQzyWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8y8nyRNPAvTk3JhqAkCaoWfA88VUYevYdVBJzPwnKLQ=;
 b=Oc+gdFu1QLaoFuBYkBsUmkptK9vFnbr/uobNXLjVqJ6kNJliErqQly9yYXnOjlC+2eDFx+pg+IIc8/1zC8fmKTq6btDHGe9ina3G2HRhMHphKfa5/JP3ceZuKrcTEca2Y8SE3/D8S60BSEm8MacC8rqBrdJo6fMt6CgBltrpFYDQPChaFBCBEWQYHK48Nk3F6naIa3hcQseYIGhP7OfrDrNJcmByerul53lpZlWmE9xUoK/m2kcaTA4pgk49qD/rCTFk7jsTDT9oVCvqHFxs6uHWxIrxEoW9OQ9j4jcw6jv2tIXfwxb/v/7fxaiRhh1Ec5b4mdpS8P1ZyjtwybnFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CH0PR11MB5267.namprd11.prod.outlook.com (2603:10b6:610:e2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Tue, 12 Aug
 2025 06:03:02 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.9009.021; Tue, 12 Aug 2025
 06:03:02 +0000
Message-ID: <91e7cbba-4d0b-47d8-a2b4-1a9a954aa337@intel.com>
Date: Tue, 12 Aug 2025 11:32:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/dsc: Add helpers to disable force dsc
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20250811075850.28146-1-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250811075850.28146-1-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::17) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CH0PR11MB5267:EE_
X-MS-Office365-Filtering-Correlation-Id: a35f54b1-29ca-4725-29b2-08ddd965e56c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWIwOTFBSWFBUDR3cVlCMjlCSXVlTTRBZVU1eVpqS3ZtSjZtZ1ppTjZtSS9J?=
 =?utf-8?B?SVdRMnN1aEZGc0tuakVRMUh4bzRIMS9TZ2QwOTdsM09OajlFdmxtVUpDM2xj?=
 =?utf-8?B?WTFQRjV5ckc0c0NHbStKQXFkVVF4OEdUeWpUZUU3QVNuWW9TMXNoMjhrbnJJ?=
 =?utf-8?B?Q21Yb21xMUEzTXEwRVhlU2E0QmM0YTVyUjUvR1ZUSkRuTXg2Rzl4TDdJVDNx?=
 =?utf-8?B?RVB6RWQ0bkpMZXJiNUZOS3lSNmU2bWZGZWtGOGx6V01uTk1RUFhwNG93eGp6?=
 =?utf-8?B?TUtSbTV3S2ZsQWlLa3FaNG5PR0YveXFwamtXQThKK1FjOWFxOWpxZElmTTFM?=
 =?utf-8?B?MU54V09JL0xKOHFnOHFySmhlVGlNNFd3UXlSTGRHcURmbXJRTzNweGxEakNq?=
 =?utf-8?B?TktzdDNLU1creGdmL09EVUt5bU8vc2h4N2NXSjN6eG9HZWlZenJwdjNzTXo0?=
 =?utf-8?B?NUZxOWFnMXVsOVVTZ0hWUFlSblhDQWZoN3h5dHhkd2Jvc3ZnMGdPZDJQTFRt?=
 =?utf-8?B?QzJaZWdvQnZqb1Vydnk4aVE4dklmd0Y5d2dvdGtFME9aUHNWcVZtalRRSEdv?=
 =?utf-8?B?dnJjc3NOL2dhQXAxOU92RkN2RCtvQWl3Z2Z4aHlaZEd6OVBMTjNGU1loMkdk?=
 =?utf-8?B?aStXUkFsWG93S29Jb21zR0hzVmNCNGJHZjluSmRhZWk2Qm4rbmFETHdVWkV1?=
 =?utf-8?B?OTdnMjRFbjUvNGxNOTBaUmZBdUhrcGw4ZXA5ckdRUkkwSUdqZWZGcUZTZ3JD?=
 =?utf-8?B?dlRFVXREZitBeDBSckx4NEUzOWwxMzVxbUE4a2VacGdxNFFIdEZnWEFLeGJQ?=
 =?utf-8?B?VTZVeUx5K0Qzckp0b2NRT1JFOEJJKzlPRDlZM0ZLTTlMZGVNMFliaWo4cXdj?=
 =?utf-8?B?NmwvMUp4S2ZFTUQ0eHo4OXdGdkFOcE5RQXhZaDZvQmRmcVE2elNSSzI5WVov?=
 =?utf-8?B?cmp4U0dYeHV0STQwU3E4S0FxSjNzeHhwNU9CUEpTOFdYS0doV1RhRjMvNnRH?=
 =?utf-8?B?c1FBcGFUSzJjYlZtamd3VVZOSmdCbGg0UUpZNktGc1krMWdjb25nSVdBeXVH?=
 =?utf-8?B?NE45L2VZeWl6ekZySjNZNkxYb2wrM3psMzk3NGU0ZHBHNEJhdFYwVVpCbWh3?=
 =?utf-8?B?cXc1VEVFTXdTNDl0bjJRRkNCWDFEOFZEY25mRGQwUkcweWVBYkdydXVOSW9y?=
 =?utf-8?B?bXcvL2hwQ2gxR0RoSE9DOGg4eW1hNGNCTmJrdGRwb25nUnU0Z2k3UlZURFNG?=
 =?utf-8?B?VFUwNjZsbEE2NHRPSnZHZTJ2cWxRTG16YUEyWmcyNW1MSFZCeXFnTmdrQUVL?=
 =?utf-8?B?VG1qZC9aVmduVmdKSFVxZjZjYldqMVgvU2RnRElGL2ZxK0l0UStWYmpoRFJB?=
 =?utf-8?B?UHVTWHdQMXVWRU5IdzkzUE9ESmdQUHNvQ3oveFdxQzdPZEd2MGpnSmNXc2J1?=
 =?utf-8?B?dnJHRzdNSmVYRGlvQXU3R1F2ME5NN2NmTlhMUk5BZXpPOWQrc2lWaGNIbnRw?=
 =?utf-8?B?VVZVbUwxVmxiWjcwd05zNUVqNjFoZWltYTFRSkNQbmJWV1lKQjVGQUdNNi91?=
 =?utf-8?B?NHFJTXZrTGtDdTlZbVozNmZackdOWkJOK2UzeTZIeExXcVMzc0xXNG5IelA3?=
 =?utf-8?B?Y3Z1TUcwNzN4UVUrMWo2OHNVQXZCYklISzQwZWxiL2taWmtkTnBseGI2TkRr?=
 =?utf-8?B?Nnp6czdhd1lrSS9jaEZudmJkUDFoaDhnTjZxZEkrSlgwMTUvRmhHZktJRmZP?=
 =?utf-8?B?RlNsLy9TSmtGNDlYM1BOSU5xZ2dCSUdNZ1BPVG5mVlZzTVRpQkg0RzRvRTMx?=
 =?utf-8?B?bFdoUjhxK0pia2NvN1Q2TGo4bHRhdlJrN0lKMS92YVJHQzFLUXBlZStrMG9B?=
 =?utf-8?B?T0JiczRwMHo5N2RpcTJOaTF2NmZ4YUs5b2JmYjdadC9MUmcveUFvWFBBRFkx?=
 =?utf-8?Q?PQ252Hqq1FE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0dRTXhzSlQyN040RlkzYUx5UysyK0Q0eEdSM2M5a01uYXBxWjczL3JXR0JY?=
 =?utf-8?B?cnFMY000cEpQTUlTYTV0cVUvZW9uRmxlT2NIS1kvaDRsVTYzVWQ3SE04VkEy?=
 =?utf-8?B?SXlXeEtVcHVNWGZJVXE1WEhLQkkwcEpha25QN2FlZ0F6Tm14SjJPSzA2bjNC?=
 =?utf-8?B?VGZFUFM5eEpDUnIwVWh3a2RReEdjRWI2WTMxRlNUdjQ2UGJRQjZKdmovdDQ5?=
 =?utf-8?B?ck85WDBNeThLd0RDOWNmVmlhUGJ1SHRJckM3ckxDWmpxamxWWVNZemI5N0Jp?=
 =?utf-8?B?NVJ3L3lYbGhTcWE4TE9jV25XbXVQcUhHSkZxK25rRE5YYnZYblhPeDBNaVhC?=
 =?utf-8?B?RnZ5ZzduS3R2VGdnYVJtNk5PUGRUQk1TVWJYanVwdFlGbndweE94VEwyNG5n?=
 =?utf-8?B?akFQMkF6MTRNWGFaNE4zOVFURE9SZ2Q4NFNlQy9MeEJOQ3VNU0pGTVdDSnV1?=
 =?utf-8?B?ck5JSHJreTcvZDRPSndESDFaQWdPVWN5bFppNTNJSk13NlJWb3RBeVZpR1dq?=
 =?utf-8?B?Z3hKNEw4ZGFKYlZVZVA2cmlJMVpQZlZVZlppdWk4amo0WWpCNEk5cTQ1Vjdy?=
 =?utf-8?B?UGhXNWpxcGFIQk1hUjErb2tWRk5rUnBPTWRCRlM3LzhHdURIa05pMDJHdmE0?=
 =?utf-8?B?YnUra1lxMEowMUVFOHRWMTRkRVJiZktnZ2xaSzNnUjlhMTJpbGxWMnc0dDhp?=
 =?utf-8?B?TGR1d0V6QUwveHQ0bi9leDE4Mnk2dUdUa2VRVnNDcHdQb0F5MUhhRUNya1ow?=
 =?utf-8?B?NU16RW1wM2h3dFAweXg2bWRPMUxlakl1V05sUTBXNUtSMTc0b1dVYWl4OC8z?=
 =?utf-8?B?ZWJqRUhoVnBhWUU1V1FMVys2dGdhTmlzS2ZJb3NlN2tjbzAyQnd0NndQQUNn?=
 =?utf-8?B?UE0wV21MdHNJb0NuV2RVME5DVkNjT3dVb3VITlFDSDAvaCtKUWlZdkFZTXhM?=
 =?utf-8?B?RUhvME5hMngzMEtoYUZUckQvaFl2RzBRbGtJZ1ZSRVBVMXJXWldicFpCdFFF?=
 =?utf-8?B?aG1aV3pxNm9hM0tXSk9sYkNnVkdSd204RDVVYldlUUhUb0w0OTQ4MmZwU3hX?=
 =?utf-8?B?WjJvUXdQRUhTK2NvY0IzTU9Mb1VLU2ZmTU1iS2lRaVlJeXhiN0tIU3lyaElH?=
 =?utf-8?B?NXNCM1JDUHZsSXNFWTg3Z1l2SkE2c2dzTFM1WGpoMU1UcjNPSGFVOHk5cFZB?=
 =?utf-8?B?Yno5SmhqcFdOS1BhSTNEZEtQT3l1cFIxbldaK2ZZTGt5R1FXeFRCZ256QkxW?=
 =?utf-8?B?UUorWERuYzE5dGtXanBOc3RTTTcvc2pGbGZpbkk5NFFwT0gzdWNWbjJQSXV3?=
 =?utf-8?B?SG9td0dMRCswdUp5Q2JIeSt3VThCcDd5VWpVZlZtT1BrcU44bUlZTHlaN2Fx?=
 =?utf-8?B?NUxhUHhaOFdueXNmZXZTTjZYa1N2Ti9YSGVXeWFkejR3eU5vdTBOb1FwdmNJ?=
 =?utf-8?B?M0FtNUJtaE9qVHpuMWgyU0tQQ2xadXlpcHYveGhtYWhieDA2RitDMWF4L1pi?=
 =?utf-8?B?SDRMZ2krWDdLbXIzV21RenJBSUh5Qyt0VnU3Y25mdXg4b3dzcHh0akpCM1U3?=
 =?utf-8?B?QnVzS2lxbmtIeUlYclpRZFVaUnhaZitBMkJEaFhDUE5xUCttUzJoMmpiTUY4?=
 =?utf-8?B?OExGc09mQy8xMXN6V2RnblU4cis1OHRxSFYvQmVRVWNJdFNiWmtJSHR2UHZB?=
 =?utf-8?B?YSthWVNraTNuT3NaV2JQcHptbFdBYXFGZ0JoSk9EM09LSE4yWHNuLzdZaEkz?=
 =?utf-8?B?ZzhzT0VkWEo1aWpRazlmY1UxVXUxY3Z1bGlNd0x2Q3lvaUxLa09uT3IxRkt3?=
 =?utf-8?B?S2tVbGdoaEdUWjZERjJmSE41L0NURjc5Z2phNkFSRFg0RVRaSVZSYVFraEVB?=
 =?utf-8?B?ZGcvOSthOWcxSmFlN1JTZm1lVnQ4RGJUVytneE00UWJCT1dORG9ybnRyZHk5?=
 =?utf-8?B?aTdsL1VIQ1BTa2JRUTNPaWphTHNSN3pHUmJsckdvQnpiRHB6Ny9ueTZMZzlO?=
 =?utf-8?B?UUlkbHpIdk9rdnJVcVRlYlhVMWJaaGJzSDQ2WGpMdS9iRCtOaE5MdVhsQjNO?=
 =?utf-8?B?S0RMRDc1UW9oL0tiR3V3NjFvSnAvL1Q3YnJDV2xIQlkyOXRvdE0xUndCTHVo?=
 =?utf-8?B?VTNPOUg1elNoTWhGZlhtQUdkR2Rpd3Ayd3J4aWVFMzlYMy9qUjZMangzNDdS?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a35f54b1-29ca-4725-29b2-08ddd965e56c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 06:03:02.3947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xXmnJKT3j9Nt8y1xxdrP5SIjR2xurqhdwj6jtuciiuX4JyeJ538pE0xbuMo+9DyJ9E9tZfQommhMn4emngSVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5267
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

On 11-08-2025 01:28 pm, Chaitanya Kumar Borah wrote:
> Add helpers to disable "force dsc" and verify that it is disabled
Hi Chaitanya,


Patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   lib/igt_dsc.c | 25 +++++++++++++++++++++++++
>   lib/igt_dsc.h |  2 ++
>   2 files changed, 27 insertions(+)
>
> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
> index 4caad39db..3754eef07 100644
> --- a/lib/igt_dsc.c
> +++ b/lib/igt_dsc.c
> @@ -124,6 +124,31 @@ int igt_force_dsc_enable(int drmfd, char *connector_name)
>   	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_fec_support", "1");
>   }
>   
> +/**
> + * igt_is_force_dsc_disabled:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Returns: True if DSC is force enable is disabled (via debugfs) for the given connector,
> + * false otherwise.
> + */
> +bool igt_is_force_dsc_disabled(int drmfd, char *connector_name)
> +{
> +	return check_dsc_debugfs(drmfd, connector_name, "Force_DSC_Enable: no");
> +}
> +
> +/**
> + * igt_force_dsc_disable:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Returns: 0 on success or negative error code, in case of failure.
> + */
> +int igt_force_dsc_disable(int drmfd, char *connector_name)
> +{
> +	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_fec_support", "0");
> +}
> +
>   /**
>    * igt_force_dsc_enable_bpc:
>    * @drmfd: A drm file descriptor
> diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
> index 3cf2d4e76..f63345848 100644
> --- a/lib/igt_dsc.h
> +++ b/lib/igt_dsc.h
> @@ -17,6 +17,8 @@ bool igt_is_dsc_enabled(int drmfd, char *connector_name);
>   bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
>   int igt_force_dsc_enable(int drmfd, char *connector_name);
>   int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc);
> +int igt_force_dsc_disable(int drmfd, char *connector_name);
> +bool igt_is_force_dsc_disabled(int drmfd, char *connector_name);
>   int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
>   bool igt_is_dsc_output_format_supported_by_sink(int drmfd, char *connector_name,
>   						enum dsc_output_format output_format);

