Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E465CD4846
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 04:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0F510E121;
	Thu, 14 May 2026 04:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vzo5/Eev";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BDC10E121
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 04:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778732877; x=1810268877;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZInIlqFmXTJuBHnI9KPvtu2trCx9DyyWK+fILLIkCMk=;
 b=Vzo5/EevsbAawcyvfknyxtPuK2eg/ptd+/1t/iW/kAOMljPS6NNy0aGW
 NHh+GCGBsPdisKFZXGeX6+NmfI/pC3n/JCukwNes2psP+X8FtTFHxs9cX
 tR6vCkX8PVT3cNCIhN8PdFxfMtaEeVlNlPedm3LrNm48HZVS0eePTQD3q
 /VaQjyH4Nd6doNp98EZVgBGsNCzhFRaZVQSWIJ8DVcwDSTT3KSX3Tbizr
 Qs06jiTfdOhQ+D9FUkBv1G1DQVJmDaky1/U6A9Il8u++tBhVE0wFKBzsM
 GXfy3rZVn4OZe8bRy5Jgz3HIYEHFMsIfoT+DsmwnqcyAQMAhlKLeWtNNu w==;
X-CSE-ConnectionGUID: Xq9oiLCzSU2qF9svUs3EFg==
X-CSE-MsgGUID: 4n+gXuhZTfKwMyWqgxIgDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="90772079"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="90772079"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 21:27:57 -0700
X-CSE-ConnectionGUID: CvqxAtJoTEOmVuwNeOi5YA==
X-CSE-MsgGUID: 71t6jEd1SZ+rn76IwsYPfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="237416313"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 21:27:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 21:27:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 21:27:55 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 21:27:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTXiAPcEJEHX9eT1XP5qp/2bux8CSybnZGH9BAPANK5yi0D1xRjHdxy5FuWTS/U1FwoRmRfIFZWtaygSR9PIkyS2+EPncd45CZqS1vpkD4/4vF9LT8ixkj/zv9DIOQ7CVUWrJeVg2dw2aorA6gKtkNetkgXoo7BcwL+4Zy+DI3szIUpuuKxfM+0Gt0k0M5VPfVRqzJ4wnc5CYmTyKWW+UA7wvo0VHgh//B2xKbdEXlDyQKdy+knIHGnUsRO+KgZEZr3adbzLrtQgD34iGeRXmMkWpBFsD30kGJtBrv1eSTtJlGb/ngjEe8HIGu83pn9oy4KXXtVvJrMdAv4ca953Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7qHJB5/+kgWhmlQSgMH9IJAwS3ORdgJ9ArxnF1UuPs=;
 b=ac2pz3XmFdX+ngtpX0qmUv0eJ84ImymFkSCjgnUlWXRO1D8KXTMgIuSP5xO6faX3efk797C35m10SRw8OCN+4bMpkHlonsIU+mO3csK23PBw74jSHRmVWM9OaaHNkjAcu3Aik8nboVg798G7NicF0TARdqE1py30MkTKUdjDHYZ0lQPyK0n3Bkz2ttTHHVG1ApGBA1il3Ww5Fu0+AZt4Z+NHJmc4gInASUoDlL5RfZpttxYy+/oiF+THMlWEVJL0MkoqTL7l2o5d5wKobyv6E1Lj6i1a7z3SCfcnFJH8B+iSc1tCEaWtS2S+mNjebX3eLBuOzdJtb3g5RjT4wZl2FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DM3PPFD2F4A0090.namprd11.prod.outlook.com (2603:10b6:f:fc00::f50)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 04:27:49 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 04:27:49 +0000
Message-ID: <b5a72df2-94bd-4bd9-a683-08b1b97ca099@intel.com>
Date: Thu, 14 May 2026 09:57:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 22/25] tests/kms_async_flips: Use
 igt_format_mods_has_modifier()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-23-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260512122143.11013-23-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0185.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::13) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|DM3PPFD2F4A0090:EE_
X-MS-Office365-Filtering-Correlation-Id: 494320c7-c2cc-47a3-def2-08deb171272e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|11063799003|4143699003|56012099003|3023799003|18002099003;
X-Microsoft-Antispam-Message-Info: mxaQhqBJF1PQzItzBwzhOhyUGUfmXbbPtShgoB5HPxw+Cz+wDT+Z3BhgT4L0uFau6t45aq0OPv/Z2vD3ZiNop4nJ6ke7vAynHN6K4K0IwA5wxx8MnKmmZducBtp4Y6K1qiVy1Wlvav0vWpFN8cBtaTyJ4imqqVEJKiKt2Z7FbgqlFqf1em7F6bnZVjubOmuXqRlbdiQ5vrThgHCkkwBKWGebGqg1658jvYb0qunkEqF44wNPbxPokD0QsfF6S8AHtxZCBK4RgtPMKJg7UyGNiFZPnEGnBuMCvuKCF3nivvfpzkG8DOUPFf0E2Dg5mzizpX9o6Q8Sk1ywG7Vl1QRgK9/SF12GYxVnphINIS1gb5o5/LyQfckEafLrdfSYvIAKUzogM4qOEot08wIUpkJnA9ARPWje27Tg8t1mFg87Om6p9r4EkIiicYyOVB1qPTVrO20IDcBKSeQA8zwc9CsDbsxByuUGX5SmSRGJ6tef/7cmAt41v6wlxkvkZbjBEKpDStYTN4J9ZBulbveGU/d5iFx0AkyNzialqT0v1kpJjxdq5ScTUTFP8bTq1plZuTwBUVK+zfrHtso0sD2KwHP8utT6caTqL/jyQvV0fJQ6vJxioeK4FoYzHxkNpvBg9jWUDZiJNkcpCTXsdVqFWTWmtguNXNkYQrukuKUcKsyGB/daLzF2+yVXzDyXBaL9ZlGg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(11063799003)(4143699003)(56012099003)(3023799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjRzRW5ibGlZVk5UcGdZVjN3TEFCWncxdDlvOHU1R0ZxKzhtTG1QNk1zeDc5?=
 =?utf-8?B?eXd2YUVrMFNndWY1NzlsYWxEc3FRWW9TWjVTN2l5KzhWY1RLWVBlZ09nTnpM?=
 =?utf-8?B?YTBVdkxIcGNRWWF6S2dmRnBHb05CaDdUWTlCWE1vT2FxeHVMTkNlZC8rbTNm?=
 =?utf-8?B?V0pRZFl1Nms0bEQ1ajYrbFNWNC9rVFJFcEM3ZG1uMUptRitSMUtmaldXQ1d0?=
 =?utf-8?B?Wm9LcnlWbGcybTloTG5peWtkWURDVWVrTWtIWDZJdFV0ZjRLTkFBNDZYcEJk?=
 =?utf-8?B?WWRRQ1dKZ29WbE91ak1JVG1YOTRVd2N0bTdLUlk4V3FJKzc4WjZLK2RKNDFR?=
 =?utf-8?B?c01FWjJ6dkhpNU9rck1sV0M2YUtIQyt1dFd5VmZ0bFcxbVgyQmRSVEg0Zmph?=
 =?utf-8?B?L2JyWkJJSm9lYlFjWVpMNTBTUGtCRE1pVWwvRGRZaWVJcXV4VWd2ZjZoWG4y?=
 =?utf-8?B?b0JnT3hSWlpnRkZTSjBVWjV3NXZqb1lTMzIrOStOYkZnTFVLNGFlTVBmdUor?=
 =?utf-8?B?ZHovNzhjblBMVGtpRTJqZzNGcERVUmFaU00rTDE3ekdZUStRSS96Qmd6ZW9k?=
 =?utf-8?B?N212b1B5alJzY1JtelQyL3F3VlczOUN5dzdTL253VUp0YVNWNVpxdnB1Yzl3?=
 =?utf-8?B?VUZOZkJZUU4xWlB2ZnNCOUtpK3YrUG9uTjhrK2RSclpkM3Z4c0JiTmRwRS9U?=
 =?utf-8?B?elA1Qzk0RjFLM2RmcmZTeUl2ckVVSnpJUi9Pd0hTaGZjQ0NGMHF6UGhpNEdB?=
 =?utf-8?B?ME1RdlJ1ZUlqS1NiellJM201NFhsdGJQSHJCSDh3NzE3bUxZck9LSjkrRVRI?=
 =?utf-8?B?WTBaZFVBOW5HdHVVUU9BM3RIaXRtOW5vVU5HZ2lNWjdOWEFBMVlxWWNDTHZV?=
 =?utf-8?B?QTJlalJSYkZsTjV0bzhkUmY1bDRqYjdwc294eXZTeTh0TDVmWDU5M2l5MDQw?=
 =?utf-8?B?Z242d3BYZTBsTGFsR2xzeUhLTnljbVo3bDdTMUQzdmxEV1FhTVFrV29DQUxD?=
 =?utf-8?B?SVlSVVNqbXkra1k5YlV0UC9rVDhiQXg4aUdKdmIzSmpYNjhnWnlRUyt5WWNN?=
 =?utf-8?B?R2ptYVhoZDFsWkVVZ2svMmRiTGUxQUFoTjEwUyttTEhpK04ra294MGk2L0VU?=
 =?utf-8?B?eXpITWNBSFNVeWtKaHlQSWlEbi93SDJMVW9MS1pWWWlGNDBMMDJ4Wk5NV05F?=
 =?utf-8?B?dy9KSmVBc3gzOU5SWGhScGZtR0hPWU5jb095R1UwaTFBTUpaK3ZHTmk1MklB?=
 =?utf-8?B?cnkyYmttVkVQRDZVSzFmbVNKWUdheFMwVTMxRnp1dDc2N0J4RitjZlp1UWo0?=
 =?utf-8?B?V0U3UDl5eEJmRFJveXNxRDFXNERrQWdSaWh1OE5sdmdkY2R4K1dLM1gyOXpo?=
 =?utf-8?B?SEI4RnNhVVdobDRMTThFcVpwYXlBbm1pa0FkYWZkVlB1em53WWJxWTlaTTZ5?=
 =?utf-8?B?OVJFcTlVVWx0Z1grWmVTZllYdDBuY1pLVjBpUGVmWlYyV01yQ2NJOUJabms0?=
 =?utf-8?B?L0lFOStMTkJYaHF1WFI1bEVtOS9vL1pWSkVCWndGK3M3Rlg5QmtzMU9qMTRi?=
 =?utf-8?B?aU41Z2tGRW01a0ZtTjlGek1BVVRmd3ZUZEtCZ0w3d0FCMW1nVWNmTEhLcHpl?=
 =?utf-8?B?Ti9XalRnU1QrMEFmTGl2b1hRdUNGZVF1bTZ1bWVia21SNDRydHhka3NoYTR3?=
 =?utf-8?B?VnBhaW1pOWJJZzVldUEvZ0FkelI3UElOY3p4V2F1TExDTjg1ajlTVDJ3dkov?=
 =?utf-8?B?ZzlnZFNGdmpPYktOdHZwVDl2eGFrZUxONnAxeGJjc0NYaFlVWCtXNkVzcFpN?=
 =?utf-8?B?ak9mblRqNWpBbTAxRnl3SmZrWDcyWHRBRXQ2THV4UlBKRUFRcGQ5S3E2U0s2?=
 =?utf-8?B?bUpGODRBbmZQWHkwMFBpc2NNbWJXaTJuZWl3MXp4cGNkNlJpYityMnJXeFlB?=
 =?utf-8?B?ZUVkTXlHWGY5VmF5MTVFQ0ZsR1BJNnkrdHl2K09uK2hRNWZ0QWkzY3c5U20w?=
 =?utf-8?B?SFY0Yk1yRElFUGtSYVVQZWFTWlhmMWFKdW84QXF2ZnJvNEhmMWlYQUNSaTdi?=
 =?utf-8?B?VmdkU1lySEpqbmhhNmRKd1NzU2xKeHJBNUh3TmIrdVF2OHNSOGNWL2loc0Z3?=
 =?utf-8?B?VUZkZTNJL1pDYnNtaWNEdWU1cEdoUEt3V004a25NVi9sWGJuSlZFVG42YmlC?=
 =?utf-8?B?RnJyZDdJbDZVZTd1MlViQTVwNXVNczB0S0IzZXRBSHZMTHIyRTQxbzVRejl5?=
 =?utf-8?B?UWpUYXNpbGQ0SlNybUdDWnE2aWROT3A5WTJoYUlYRGh1Tm9MRUl5dDFPU2tN?=
 =?utf-8?B?azF4QzVwcGRMNlpENURpOGhZL1RnQ3g4cmxPbWFyZzJFWGNQdktQMTVENHYv?=
 =?utf-8?Q?Y7+SRx1HME7YRmV7yMU1aASOR1TzPl0jE5FdM?=
X-Exchange-RoutingPolicyChecked: aKTji76LO7gR0gctHGGmcM3hVYDRCpr1HlMnAScpCccvsGQd5H59q2LkUpPSPquhHVwEXx+ixmZ4+T/abfsy6XVENqxeZVk0V6HNbWC/aWctlVU8xCMYwPdaS9X0HAKaIAy+e9bh/flCUSBuecwfHSQkv3n+zLEYRpQWDwSrdzOx3vcJY8+j9qsofpEE63T8PeD+NLU02xEHfh5Vm0Z1uBUGUIdarXSJxf21O4pKJ7fNVrXUh1yJkJnavYGd0y/SI+pwBOgeMpSItozQkPGlIcXqLEXyml05k4oOUFIWE18sTx3rWv1PV9GWAKudu4D5JxxheHYA2F/bNAIGmgSdAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 494320c7-c2cc-47a3-def2-08deb171272e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 04:27:48.9015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRnMc/0+4DpSsErM72PxrpaLiH8zr+8HUSQ1RFYQLaQ44HwFpgUk1Bjl4+K972QneXfIcZ/4yuI3zUf9onnXsjnkZj9PH5vLls3Zn9IgzXKax1mxi6nXywCg2ijLqF8w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD2F4A0090
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

Hi Ville,

On 12-05-2026 17:51, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Use igt_format_mods_has_modifier() instead of hand rolling it
> for the linear check.
> 
> And to make the code less convoluted, let's just look for
> whatever modifier we want to use, linear or not.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
LGTM,
Tested-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 19 ++++---------------
>   1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 3d8c37631e2a..e8c9979bd06d 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -869,20 +869,6 @@ static void test_crc(data_t *data)
>   	igt_assert_lt(data->frame_count * 2, data->flip_count);
>   }
>   
> -static void require_linear_modifier(data_t *data)
> -{
> -	for (int i = 0; i < data->plane->format_mods_async.count; i++) {
> -		uint64_t modifier = data->plane->format_mods_async.modifiers[i];
> -
> -		if (modifier == DRM_FORMAT_MOD_LINEAR) {
> -			data->modifier = DRM_FORMAT_MOD_LINEAR;
> -			return;
> -		}
> -	}
> -
> -	igt_skip("Linear modifier not supported for async flips on this platform\n");
> -}
> -
>   static void run_test(data_t *data, void (*test)(data_t *))
>   {
>   	igt_crtc_t *crtc;
> @@ -903,10 +889,13 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   		test_init(data);
>   
>   		if (data->linear_modifier)
> -			require_linear_modifier(data);
> +			data->modifier = DRM_FORMAT_MOD_LINEAR;
>   		else
>   			data->modifier = default_modifier(data);
>   
> +		igt_require(igt_format_mods_has_modifier(&data->plane->format_mods_async,
> +							 data->modifier));
> +
>   		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
>   			      data->output->name) {
>   			/*

