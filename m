Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258A2F99C69
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 21:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9E510E00B;
	Fri, 17 Apr 2026 21:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEsdCm4r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F09110E00B
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 21:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776461724; x=1807997724;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h0MPr64EcTc9l6R1jJ/9dKkJha/ZaLxUR468dXEBBhE=;
 b=gEsdCm4rnUGFz5BfEyqSDYqhE5zk6GPeiNgOM9KU3NRhZO1lhI944IkW
 4mzV8UrEf+kRBDhczt4et4Ca6PBxFRzPsTj2d9q1BqtMiLNmX4RxWZIz9
 JuUmmM/VHflQlocGKYfYMgQ7VgcDNqkiH6t1YzKDXTN7N73UeSXaAgiGx
 kz5/uj6vYiCRHBeVwMkkkl0s89GyvcS2Y779q94T9lL6+TWSPoJ12rYGd
 8ZOTywrqm/OFJwP1J0HyuX/4Et2nWOlMY4kxvd1U9D8C0J+vpvi8j+b8y
 O2Os527VT3WMB+oxSh3tCZOZmqIqcNXBfAdA9/McDqVOLRfdwFPfCh7zx A==;
X-CSE-ConnectionGUID: xS1NYipzQJ+ChGIjWjOApQ==
X-CSE-MsgGUID: BP3dmsF0TRytFzpb7zGfuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76644576"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="76644576"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 14:35:23 -0700
X-CSE-ConnectionGUID: Cljw2WMUSeCZ5d+sEoin8Q==
X-CSE-MsgGUID: YR+ECmr2Tg25JtzCYLPnhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="235141469"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 14:35:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 14:35:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 14:35:23 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 14:35:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoNa/jyy43DGWSDJjsYTuMyAE70waH8h195XJ1eSycCFNAWy6jEGbVZZKdVu7gsJjeQGMB5c/2hhYqPBOTYl2ol3UwMnX3MZ65qDZa5Efp6BCg/+yuohL4+xuK/B6dauk7cldut50dJIzMYJvy+8TAHKDZ6I8goDG1u1jxe460EFvntgBYGZV0R8waUxLs1wIYaw52sWbFtWoZWOsONrAE3tmcbsAMsYaDqf0rRS7bhvGT6GsAvOYROPw5kQkOWzBWJnaL5lQmSAowNDgrEbSKIR/kJil3WnNRfJJ7vOTGQP/NFbvq99PWodRjUeV2tN6UCiMlBC+aWgZNwBP8SQdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4wFke8+do0QcTz+v4s67vDztvy0UUsR5gnkJ7aetjk=;
 b=Ar2mSQDLm/m136Sle+owpWmI47ODNnNRus5zPao9jXyc6C1RSXZmq5GMnFFEiBTNnplOdOkdiN3eXDIzjJVGaWF+opBOXvaX3FFB2fiMPKzMWYHDAhFAtDqxkqQ8HQuaTSH6AAB50CXKNYnMS1BDr6rvIBpX0DdDG184iy2cZJLzN7FVmRe25NWLm0XYHJEBk6NfWvZPD6YY5Moc88STq4MF9GnGdTC5ncwbRl3skzo1OwVSq6PqIps1b/J7XGk3vMmj5LLZszafCKSsqnzmVECXYfUe3d14nkF0U1O5C/kPm+W8ly5cVyquyiB5zPyx8z9+SJfhAiNKWvCgR+o92w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by LV3PR11MB8725.namprd11.prod.outlook.com (2603:10b6:408:21e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 21:35:18 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 21:35:18 +0000
Message-ID: <f21edea0-a0de-45b4-b9a6-441b0e05ad34@intel.com>
Date: Sat, 18 Apr 2026 03:05:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] lib/igt_hdr: Extract HDR helpers into igt_hdr library
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <wayne.lin@amd.com>, <Mark.Broadworth@amd.com>
References: <20260317175136.3754576-1-alex.hung@amd.com>
 <b2afa0a7-95f8-4f28-b95b-9504cff26fad@intel.com>
 <1620f56d-c574-4bb4-a843-6696f2db3d4c@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <1620f56d-c574-4bb4-a843-6696f2db3d4c@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0151.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::14) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|LV3PR11MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: 85ae7f2c-3bc5-469c-69f9-08de9cc9386b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: AP1/oHPAvkbW9V0IRT8wEUwVxGJY7f84PVB1D3Mze1ciVWROsb4nv7tyO95SAd7uJjlHXT0hewl32KOF4zwj7UgPiNt0nhbsIFDrGwJElcfuyPTH+LGWCIoEifNWUMSjC0zl0eWEIHmMxcPPkCSTrQIScpkBxoJyAznZuvuFNp1vDvFKn7GwJFoZ5oTjmqxbxkiJUVOeTDAE6+yAr6tqI//LN8iq129/98DncptPnbNHXDVCnFosMrD6XkHpEzQaL62O5iQZbeICzyTGL3oM1GFG/ta40XqavGRmWjhw/cgv3RxyAveL+Y4QIPHQgLMmFqTcOAMSZ9leWIS9zJ8kyGVjQMhBP/tBbcibcGh75Ins1qDWGN986MdShcpvxn3Tdyy0AcB6X0l/W7sRyJJJfELZakPl2cGQa1mRT1MvcpcgFfxX+VcVk0dPLd+U3uB3Bn9YnANtxrcTufoFMRZUkm5mkSgJpVLBlHCW+sVAn4UKIAqP1Z1N4iJ+4nM1oyV5yNAdl2NbEeZIS8ErCeiHXLPRMDhQa6+1/nFOaRshWkmJXIg1QTltSmVGkUgd0FneNr2oDRf3fOLv8BU0KBKEkb8gzxA7Fd4WYVvoozPN+r73e8MO8YSAcXX3NiR2r1deLqqogHcxZuKXG/t9JueaBbMEeeK6zmpM7Klqu7ann0guegX/UrnAXCSx5IjK5fyn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1VDMlFuUXRFaGRVMnJ5RjZXMHFSY2FBZjBCQUxyaEJJekNGLzVsRVNRWXdk?=
 =?utf-8?B?cTdJT3A1Z2R0R2ZIdUs2RTkwckFwaXBvL29Pemt6Ky9WZXlSMC9DV1Bsd2ly?=
 =?utf-8?B?MHdqWTNzUWJRM2wzb1UreXI4L0RtZXZIMWpULzR3U0FIVENLOWtxKytOVmJX?=
 =?utf-8?B?TFZ6OFBNZUlEZDNBMTJRUEpURmU2QjNnd3psS2FNVDJuMk42TVczaWN1QS9N?=
 =?utf-8?B?QWpFOXA2ZzhuUWNFdkNEdlF6WlE0d2plTHYxWjAxSGE2OXFycDNOMVlUamxP?=
 =?utf-8?B?VTFHZjU2cmhKSGVSRG5KS090UTNuUGlxYlN0eFZ1bU5MeHQ1U3VqVUtmaTZO?=
 =?utf-8?B?WDVDN0RLRTRJTU4wQm05a0xrNm0xVU9VNUlxa0tHejFBbzNkYys2akQzaUtX?=
 =?utf-8?B?OG1VSmswMmZyNFc2RldTc3NDT05SWlNNYlloUXRIeXFOL1pQUGpzaGs2MFEy?=
 =?utf-8?B?QjJwVHhkb3JFS0pVUWJPWUhrRWJlWTBtVHFpNXJzS1Z4WXVreVgvQy9aOVhY?=
 =?utf-8?B?aVBUajFITThpUmNoTktLYTNTbTlRWExXdFBMb085d3A1YWFReFp4VXhhQVhQ?=
 =?utf-8?B?VkRac0pkalNydWxOV095NVhldFo0QXFsMG1GdzdGVnJGa25pZHg4QnZKaUdm?=
 =?utf-8?B?WDdZTEZKOWdGdGhRM2hYeGIyMS80SE1vOGorSDRIbXhETHRvQlBidEI3dVhG?=
 =?utf-8?B?a0Y1UjU0L2JUbFNya2dWTmU3dkQ0aDdYS0hCR1ZjQWRHaXNBTGczOUd5a1Y2?=
 =?utf-8?B?OEZFRWl2a3pid2d4QlJhRjJrK0phbTlJTFhoSkYyS29xYUU0YzBGQmtEdGVG?=
 =?utf-8?B?eDc0ZGhTUFRRSUFabVliNDJoRFM0UlB4TENBSGhmajF1Y05qandJQ3F4eWFR?=
 =?utf-8?B?Q294TURxeGNjbUd6Ynd2R0pDK0s2Q0VwY3BLMUdhSC9zVHo0T1B6Y2V6aUta?=
 =?utf-8?B?dXZQRzNZd29kd1FINW9RVFEwYnprZFozLzlBakZ2TklyMGNCU3prZEhkUjRr?=
 =?utf-8?B?YVJVejhoNG1QS2QwZXFDVWpscFlGd2lmL2pSM1Nla25NYlovc0kzYVVWeDlo?=
 =?utf-8?B?SE1ENkluTVhqNG1vTWNnQVFOdTFqUjUwMnh1WEhLaUVhZm9zVDhHT0hiMVdi?=
 =?utf-8?B?NWJ6RTd0WmNMTDNFV2p2ajFvUTBReEQwQzdISTV0Q3BmYThrQ0ZwaG9yWE84?=
 =?utf-8?B?Tkc0YUVIekdyWFIzTjk4Q0FkN2duOTRsWUUwRDEreStMYm9TV2dNQTJmbDY5?=
 =?utf-8?B?S1l6MmFLKzhyb2dKdk13SFY1WmdYOENFbGNZWkpVUUdzV1hnWkdRN1dTYlY5?=
 =?utf-8?B?Kzg0MUh4NXVpQm0rcFpyZFV5cWFISXViZGhCQml5b3NMSmkvSGR3QzQ2dW44?=
 =?utf-8?B?eEVDbDhUTjgyUXNFMXVYN3BCdUp4MmNkYmNqVFU4RWJUVE1ERlZGTGNjam9P?=
 =?utf-8?B?MkJ6ejJqUEdQcnZsd0xESndiUDAyUENQTXcxa3QySjVUUms4RkN0S0tyRkNs?=
 =?utf-8?B?Z1pBRDQrVDlXcE90NEFSMlk1bHRvWXZWS0tFT0h3VWE4blpBTmJzRGl1aFRM?=
 =?utf-8?B?cHhYc2puRnR6bWI4Mk9DbTdxdmVYVGVXcFNhdHBlZEhlVWdUTGpBeDFhdm9H?=
 =?utf-8?B?VmxrWXRxZWQ3dHBNR3Jmcnp0cFBYUmtkc3R2bFNLcFhWUS9hRFRmdU90TWNs?=
 =?utf-8?B?OWdOR0hDOTVla3NOUUYyVUsvVHRSand6NVdZcFVBNVRCRmZ6UFEra0ErNGJL?=
 =?utf-8?B?eXpHRERDSFBWR3JhYXcyYlZ6ZnJVK2ZWUUtSM1pIV0tGaXVOWmUzZkFoSk51?=
 =?utf-8?B?Q05KemxEWkdXMEtrOUdsMnRvcUdiSUVUcDNNbE9aMmpSNjhNWm9VQ045dTlC?=
 =?utf-8?B?QjlaQzZ0VEpxTTh0V2FnYWtmaUxRNzBhOWFKSWhzZDViR0VjQkFodlNyb1JX?=
 =?utf-8?B?RzJQM01CNnVkWFoxVWdTVm1MZVlTZ0xIM0oxbWh5UUkvZ2VRampwQWZTV0R2?=
 =?utf-8?B?TTVHOFBrTTdBaFRacGNUTDk2S0x6QnMwNFl6V2RUOGtKeDV2VGlKZzRjZnd6?=
 =?utf-8?B?RThSbVI4U1psaUNJUEN6VkNsdURsNG9FejZpWjhDV1BxMEJQczR3aCt5R0Zv?=
 =?utf-8?B?dG10b3pTbVBHMTBCbk9ZNmJmQ1dHNjl4MTFod044MTQyOWlhUDVRMkd6a0Ez?=
 =?utf-8?B?ckJWQ3lVY2xyY1NBODBMWXRGNFgyMTF0UnRSeC9CTDJvazd0M3hzbndVTHAx?=
 =?utf-8?B?VnFKZjI3eTVqSmdjQld1TDBIaXRDaWJ0enlqYi84TUg2Q3hCbVh3TFJFMVB5?=
 =?utf-8?B?UncvcW9iSVNJY0FOcGQ1NVM0eFVKODdtOEtWM2xKNmFSMnJ3OVNSdz09?=
X-Exchange-RoutingPolicyChecked: JBBo1wxkjOCSmNdy40g7EvZVqV1REpO69VAeHPDyiG27ew/KZkZpzPvGJXUAUequSCh1ATw7YOeqx/vDnV0ayT5OvDKwPZLxrnJevg1hTOmTzeAO8gtYVHtU4x0FgGK+mJoknNMP1aJDzrd40RdrQpx6PAVTs8qKaV/RJ7QRnf9rpLA5sljc1TI42pRGOh32kMAub2y4cdql1C1E/wuKtJq1SNMN6CCzHd+1vVQk2VhYIV9MwsPIxw7VeHGHLumMmpaOxXangUGlCELF4bXlla0fVjk8TSKjmOH++yAQ8NIAnqL3+zTQP8zIPf8yHPn86PdWa2F+nD/Y13fWypc9TA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ae7f2c-3bc5-469c-69f9-08de9cc9386b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 21:35:18.4658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fMCCV7lY4fg/uJMM5Wtt/hxly4OqeTv2MVK6bVOQyyvS6Ie3HGgcgrM9TNXxptyhp8IJOJ/4FOcWyXhQceNVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8725
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


On 19-03-2026 12:10 am, Alex Hung wrote:
>
>
> On 3/18/26 01:34, Sharma, Swati2 wrote:
>> Hi Alex,
>>
>> We already ahve patch series to extract HDR in separate lib
>>
>> https://patchwork.freedesktop.org/series/158425/
>>
>> Series is reviewed. Need to fix CI regression.
>>
>> Can you please add your patches on top of this?
>
> Sure but this series won't apply clearly on top of IGT's master now. 
> There are lots of conflicts and one of which is from change of 
> pipe->crtc.
>
> Will you send V3 to address it?
>
> If possible, it would nice if you can integrate my patch 3 
> (https://patchwork.freedesktop.org/patch/712423/?series=163396&rev=1) 
> to your patch 1 
> (https://patchwork.freedesktop.org/patch/696737/?series=158425&rev=2) 
> in V3 since you are moving this function.

Hi Alex

Sorry for replying late.

Sent v3 https://patchwork.freedesktop.org/series/158425/#rev3 and 
incorporated your above comments.

Please ack. Once CI results are okay, will merge.

