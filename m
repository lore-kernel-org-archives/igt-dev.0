Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0099D4336A
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 14:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D20D10E310;
	Thu,  7 Nov 2024 14:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtU67Uba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0FF10E310
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730990135; x=1762526135;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=YXDul1k8NEdgBNQuulHJhqySQII0hL3EVDsS0WlHvK4=;
 b=MtU67UbadSoYUMnmICDUfeJ3CGFKHxjIemB7A0YvIxExSCNsfOYF8YYM
 p0Ia6AALYH5pAFM1sC9V+gTxz1p3cq+RV4YIzqDLTaUIQQPVCmm34z62O
 aQh1CexxX5u7pUyLcmyDw9N1qx0iIm5NJ1QWUKZAZzXtojihhiwR4Bn2A
 sQ4xwFcUbtgw8hRNCwzuLHIYTd03ps858Mt85PgxcW2a2EehSCdl/bV9Z
 plpcFjLh9k4L3Asu6H+9mbHqF7gLP9F3KtiL2a0uJiDtmsfAzY9U/nK/U
 nRr/cPk4RoW3ORWiY/7KCBk/0z9GqYsPTPDqm+nbWvLvMM3Qe/DkzPYiM g==;
X-CSE-ConnectionGUID: XrWKcXxCQnGVsdhdklb8eQ==
X-CSE-MsgGUID: QStimipdRNqh/cPmp4lpgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="56231624"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="56231624"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 06:35:29 -0800
X-CSE-ConnectionGUID: hFtRqPezRZ2OV5nzrKaomw==
X-CSE-MsgGUID: UrQaqez8SZiw9jSizyXscg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="108374953"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 06:35:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 06:34:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 06:34:55 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 06:34:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yviUscB6YC9rocabhmAA6w9bRwCa94anZL+1hkFR4Bm7aTz5CpjUMr7GJuq9/LdMEoqekFNJTJVt/7X6vy8T+bIv5hEMw2/WGhnfniair7yDjrub4zCLWYamiORZ8vyH+hrbpUGGBXeoxRZaSQE1R5OzfKZCZZo0FWBkplBraLVFmzwt63/5Fu8wrppBRTg7BeWi0S8cUiwd64CkQ/dZMUaxIvaAhdaPgvrYAZ4LKbBz9zwbAePDyQot9oaiq4BwkCKl6+qxCSpwD6nDsW3DUb3ZAe/oo7jUwptgVn9ysJLg3J7tHMj32wPYGM1vPYGK0unsOIcj63/rKvv9GjY1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TtEZYQnfAUto3rpAbAUOxA5f/P+fYsSiz/xTvudfi0=;
 b=YThHcKb43luswPY3kyW0VKHaPhgxNiCZqKsFlq+RNMGsVu7GblRWD96A9dJ5XnkbM6Yag7A6UYKT6G++BiLuQY/1u/FkpGJiIbJJSXFiM5BXqPa+BMbXFnngym6f0RR7bP6EvkpFM5B9G4JoeN0uKNn5dLOjNlogPxID8yqoy0UnfoqLfNTtz1Oc9Zq4S/pQEdf1v9b7WnvuLVqrkXN/kaLuWp7ErjxGwdExhWk+MA92AuyYAR3b2WFUhSHWF43bLu+pZ2V3gifvYWwZ84+tbUi0c0/hGbZW1YCvK5nosbe3nNrPj4Pl9VLmmhsovgD2CD+Mp265M7Gx6hct6hv2aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by DS0PR11MB7652.namprd11.prod.outlook.com (2603:10b6:8:14e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 14:34:46 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%6]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 14:34:45 +0000
Date: Thu, 7 Nov 2024 15:34:35 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests=2Finte?=
 =?utf-8?Q?l=2Fgem=5Fctx=5Fpersistence?= =?utf-8?Q?=3A?= Wait for context
 termination (rev2)
Message-ID: <4inqdgzpyqpumf3adg3m733m2yca7axitczyebjt6drozqhapm@qudnopohflnf>
References: <20241028125640.22936-3-krzysztof.niemiec@intel.com>
 <173090180385.1416981.10299827974621401894@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173090180385.1416981.10299827974621401894@2413ebb6fbb6>
X-ClientProxiedBy: WA0P291CA0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::9)
 To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|DS0PR11MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: 03cc5203-24b5-4fd5-a2af-08dcff39535a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmVlckZrSXNweEtoNEpNNHJDb1h3U0hjNlhGWGgxbmpTVjdrLytVQUU3TEhm?=
 =?utf-8?B?KzBrVjduVzdjNkNMN3hKZnFMTlhBQy9CcHBGSEJXV3ZOTm94WThQTk5DL3Jt?=
 =?utf-8?B?bEZXSHdqbE9sNWg5LzFvYlZIanMrRnB6M29vdTNyQkh6cmdwc2tTTUNudlRT?=
 =?utf-8?B?TGVIYUxRaTYvWEhxcUZhdTRUYmpaa0tDS2prVFk0OEhMVHU5aGJVSzN3VFhx?=
 =?utf-8?B?cnhQT0ZiSGZ3THRlWlFnemJTL1FZSE01TFNyNHdoZDN2NDJSY2orcmJ1QWJz?=
 =?utf-8?B?M2k2YlZ0c2U0bUhmVkU3SXFLQTNjVUx0WjNoWTcwQlhVTUsvb081SnBRNzF1?=
 =?utf-8?B?amtUOGpaRmhDZFhMNUNHRWZmTmF5TGttS2NqZ1I4RjdueUNVeUlWSGRzT0lH?=
 =?utf-8?B?VXZtOGdDZ3pNaHJJbEVlRURpSmJIRWN1d01lekU4OERRV0dUNE9wVFRITUFD?=
 =?utf-8?B?VWJjandkZ3BVanNZS0hIbjNRY2tUcXVBVG03Z2FtQStGVGZhTEtOWm1QYzk0?=
 =?utf-8?B?cTN3alp5VTlxeldoZ1lBMGRWNXZxemIxZlpTcHdzSk1Fc254Sjc5UTArMHd1?=
 =?utf-8?B?NEttVkhrQURYdVJzMHBXV29yOHZGSHlXUXJ5dmhOcXRGSGFkZlRPSjVFWFRO?=
 =?utf-8?B?cTZQQ1ZkLzlBM0YxSXk4cUZYMG9XT2JTWFRSUlhTc2QvNlR1SGVtRGdMN2Nv?=
 =?utf-8?B?aDdIWVM2UXVIUEdmYS9weDJuY0pROTZJVjVCbUVKVzFnajhOeTRkYWcwOXpu?=
 =?utf-8?B?RlNycmRldWFhTTJpVHdaemtFQ0cxTVJjZ1I3WTNiMjdVNnRhRUhpcXkwV0dr?=
 =?utf-8?B?dmNDM2xCTWQxL081U1ZFODJXc3hVemhYUktEWDdLNDZuaDZLd1R3YkpPRmFF?=
 =?utf-8?B?cFBOMmMvOCtSbDRSVVAxODArODFCTjg4cWM0Z0VaOEl3dTMvYVRRVkt2VXlP?=
 =?utf-8?B?RDBnUjlFUkZ6VkcwNExCYW5FWUhCdGZYVm9HOGtFeDlDUUJpOHYzVkFzN2Vu?=
 =?utf-8?B?RlVmRFppZkxzOWY5K09Wc0h6OHZZUGdFQnlOaHR0T2NXOUlXam5zZGZudG5Z?=
 =?utf-8?B?cTZPSWVuR3hidENDd3hkV25pWW1iT3drdmxhSXYwalVuTjZvT1NOVEtwdVpy?=
 =?utf-8?B?UUJ6MkhJRndmL0Q1ZC9jV2RGdTU3VlV4c1l3ZmpLOVJtQzdRdVU1Y2lmbjlC?=
 =?utf-8?B?VitRb2xGSDlMSS9RSTJtREdxV3JVelhuVjIvMGdhMzNsQUVBVHpDbVpsbUJa?=
 =?utf-8?B?cWdLYk5DdTZXbFFKODBKdHB5Tzc5WVprbHZpL3E5N3RQc1lGSUdVMEhLVFpH?=
 =?utf-8?B?Z014bGhSMmpZNVNQQXpJWkY3cVZoMUFZM2Nqa2hZSEhpc1dJUDhNcHE5Y2l5?=
 =?utf-8?B?VDVKeDRPY0ZwNjYyeXR4WFIwT0JlYU9scStiQ3YwUmo1UlVEMjZwK0xnTUZQ?=
 =?utf-8?B?ekxwc0d6ejl5Z2t1VjdDY2J6VWhvN3F2SlBLSitTR3NqbkJxOWV4VUM1NFRF?=
 =?utf-8?B?NGZNVjNoK1FsUStIM01KR0xtMnFBVlpzM25VelRoM3BWNzZZb2RJVFFLWWFY?=
 =?utf-8?B?aXl1YkVOZTVrdkpJYnAwb0poZm8xSmZaMXY2YXZ4VE5FbU1QRGJxbzBpV1Vr?=
 =?utf-8?B?K1dFZVZVQXdvSCtpWVY5ZlhpYUZha3J2TC9uWnI3bklhOFR5Q0loMHlUYTFy?=
 =?utf-8?B?MlorVHlzMlNCbDR1N0xaVTdVNm90R2FuVmJnV3JQcVBKU3JUNjR6OEJ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnRDSndNRnFid2hDZGlOWFZmTU5mbnl1QTZCakZWYkNPb3AwWFBySklzTUNj?=
 =?utf-8?B?ODZCUkl4NHY3TW80V3NoUE1nVnBNSmI5QlFLZ2lCM3hHdUdUVWMxbkRlZHB6?=
 =?utf-8?B?VzUwQlpjeTFZRmRtRjZRblNVbGJlSEZTcEUvZFBzK04zbUZ0RE1GTTBRQ2lo?=
 =?utf-8?B?VGUwYjFYUjBlZVJ3ZlVzcUtrcjNMRGg5NWZwNWlPNWZVbWtDNm9NNjN3U2dp?=
 =?utf-8?B?c3BpVDRUWFQxZkV0Z0NiRkEwN1ZJRWEzYW5qZE5XWGM0MlZMSDlGcFV0T2xD?=
 =?utf-8?B?b204VmQ5eW9TdGFvNVV5QnZtbDRyTnVlYVlIM0dzWjhIeXYvYVhQYmpwdTMz?=
 =?utf-8?B?b25pRk9IV1NOSGEvTjFiT2dCN2dETVc2NmRCMmY3ZEdYd1JjUHY1SzdUZ0ZT?=
 =?utf-8?B?TXR4cUVRclhSSytsNXlGVGtXSnpTeFJWUUdhaGtyNkRTZTM2T3J6eHpxcnlN?=
 =?utf-8?B?M2E0YU5rQkc2d3FYQXk3NlhGUlU5K3NPRFdieDRNWHkxUU52bklwTVp3NjAv?=
 =?utf-8?B?NzNWelNCUFpubFNxRWZTQ0wxQWFic1A5U3ZmNGRqZitlWkoyeDNwUHFaa25q?=
 =?utf-8?B?Rjc4WStUeDIrZmEvdmdLeTdvUUt2RFo4TUV5NCtML1lQRXBYQkdKSkR3VVJM?=
 =?utf-8?B?U2xmR2taaHlVT2lUR3FsTE9manJncDJuc3pUalNmcDdCeHUrcUxVMyswb21G?=
 =?utf-8?B?RlhIYnBGSjZYR1k2cTRmMlZwOTAwVDkwT2dqZlMyeGpFSTN3bGtkS2orUXM2?=
 =?utf-8?B?SWNPT1ByODBhNTBENnRLTmpHOTllcW9wNW0xOEh4NGtHMGk2T01aVmhzN2xW?=
 =?utf-8?B?MGE1V2hlUldQTTl4bGFUV3NQUS9yTFRpN2xETWlhTzkvM28xWUdRa09qbUpF?=
 =?utf-8?B?eEV6VmxpSnFvWGhWa2RDZDBGNlNTeWFRTkNtRXNlQXkvNDNMeFpXWE5MR3dm?=
 =?utf-8?B?cmEwK3BSdW9tQndxWUw0eXpablhHUEhMZGhWa1FpeGlISktqNjZGV1BYdERr?=
 =?utf-8?B?TjZyUjBzSkFEc2lrUlNZNkVnSExhOCt3eXQ5a1o4S0hlN0hkV1ZpZnc2R3RT?=
 =?utf-8?B?M3dmdVRYYnZpMTFNRjgrWkVuc3BkQzg5V0pESmc4V2ZZMVNIZE9ZcHByUHJO?=
 =?utf-8?B?OVo4RXA2VEFCd1JTMzBFbnRGaTRDSmV0Y2JFUkdVV1hNeTBXNU1ObGd1WmRN?=
 =?utf-8?B?L3NrRkV2UzBnNDQ2Q3ozN1dET0c2UENOL21xTTVIanNNUXExaWtGbzZRY2l6?=
 =?utf-8?B?L0RCMVUyeERVVG4zVXNZWmhKUE8xdUsySmlsV3p3cXNrVjZMYnBORkNpOVdn?=
 =?utf-8?B?VEoyMjZUckVwOUFSV3k0dlg1SVVSaWQ1R2tXVXRTWWt3Mjl0M2VPR0MyaWVt?=
 =?utf-8?B?a1ZKa3dMellGbWlCanNvREQvTzd3Vkhtd3RhMzRFQTdzUTZKMmRYeitkYnNz?=
 =?utf-8?B?SXNVMVRCeDg3d016alRHcmNSZDI1ZmZ1eDJwcGZTeGxmNllKZXRLMXZvSlUz?=
 =?utf-8?B?RWY0eW5BOU1RWHlxaVJKNG05WWtOcTZ3bk44eGY1c2VBNDkzV3czSk1jNnQw?=
 =?utf-8?B?UHROTytUTTRkeWhzS1p0RmpTcjhiejByVU1MWThqaWZ2Vjl2dVA4V3M3MFF2?=
 =?utf-8?B?Sm9HaWUvTVIwMi83SEh4TUFGRGNFSzF6cW1HSjhzU2V4Rmo3UVMzUFFhTXJF?=
 =?utf-8?B?ekRvcEoycmh2R2ovd3FHV0VMWjFUd0ZkWUJRNTZIdUlVVHVSSVNxN3FYV1dH?=
 =?utf-8?B?bzdGVEs2KzFqY1JrdXV4dUN6cjFHOFovejcrNG9abkorcUJ4M3BaQVJXZCtU?=
 =?utf-8?B?emxSY3JJck44Rm9FbmZESmpuQXQyTkRZaHRtMVF6d1BqdmRmb3lubmFiaGp3?=
 =?utf-8?B?aFhIdDJ0QUpYQ0VRUDZKc2ZDM2RGa3BZeXNkSW0zUDV0YThqSkJ4dk9tM1NW?=
 =?utf-8?B?OEhZQW8xMThaZnJaWjF3Q0dkMTJ6aWNYQk8rN1l3UlZIbEVQNk9tOFpDem81?=
 =?utf-8?B?elhaK1VXdUJ2akV3WmNUeHBwSzVZUko4UitRRFdCVm5TK0ZNR05wOTZ3cUhy?=
 =?utf-8?B?b28ydlcxVCtJb1dVL3BtQUlMU0F2aHhwYlhVeGUrRkJnS0hzUzd5SXpYelB6?=
 =?utf-8?B?OGRHMVpMV3RDSE95NlZLNm1KVkF0OG84dHB1NmlvZ1NhaUU4NTNzTUQ3ZnZC?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03cc5203-24b5-4fd5-a2af-08dcff39535a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 14:34:45.7887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umwaaFn56x1e6NwUlzq7+O9VV2a4JYaH0QyNumNUVT9SdYLWMGLp2tgA4Re7+BPhon3dkd9GqmRrnHrvaKd9TurOcY+KKJq+43MR1DhdfTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7652
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

On 2024-11-06 at 14:03:23 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_ctx_persistence: Wait for context termination (rev2)
> URL   : https://patchwork.freedesktop.org/series/140582/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15642_full -> IGTPW_12048_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12048_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12048_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12048/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-glk 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12048_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>     - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15642/shard-snb1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12048/shard-snb1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>   * igt@perf_pmu@invalid-open:
>     - shard-dg2:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15642/shard-dg2-8/igt@perf_pmu@invalid-open.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12048/shard-dg2-7/igt@perf_pmu@invalid-open.html
> 
>   

I haven't touched those tests, so the failures aren't related.

Thanks
Krzysztof

> Known issues
> ------------
> 

(snip)

> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12048/index.html
