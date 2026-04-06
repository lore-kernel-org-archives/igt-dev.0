Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02000E6400D
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 06:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A228510E023;
	Mon,  6 Apr 2026 06:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QF9XqEUe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7250410E023
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 06:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775455222; x=1806991222;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=63fQKR09Qf2+2GWGbRyZCV9iTJI8i/gcDLPeJKX+u+Y=;
 b=QF9XqEUeJDzPrYyxI2gJZCZOkae+tUir0gWF+nKRxMuBLBcmJuLgyXIl
 641+e9sdtfe8tmZbDh3FpiiIcoUjEhOlS90Oflvb3AjZuxFGZE+rkQAwj
 jdcums2/enA0yzowfaNssK6QANSxqY8gQ85OCOHGEfWuDuaHK1r1SgCIZ
 u952ffnJzl7HsnEFVd+69Cbo9KWxzirpaqCr1g+m7lHUt82+XJjj7peCU
 GkI5rcP5oBOmGPg1lQ4HaGNlS6iPtttLCLZQSkkGRti9e8vvCrW9un1jg
 D1FrNyfT43r4koBQUPykNiyFeGkRapaZ6CBnXnIPCfhK6YFKRyrcRtGjR w==;
X-CSE-ConnectionGUID: RV3bTIiGTEiTKClQBi5Psw==
X-CSE-MsgGUID: IXx7lQJqTeu2LO95EAg7NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76598361"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76598361"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:00:21 -0700
X-CSE-ConnectionGUID: MhkjWw2QREmgTPM2TdAh8g==
X-CSE-MsgGUID: +4wL8MNCSVeW4Q725vg8Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="228076346"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:00:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 23:00:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 5 Apr 2026 23:00:20 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 23:00:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjbP9AIcmfp/Z4HCLMF1BZXgURPCmmXk2i1RboWmS9y6Cf6iL5+wPGyvuA1J0fkE+y6gWHqeQyvXP/O02FyPLO1DFNGdPOaywBas2QcljQ5oBuEGdCPCJ8eduoos+6B98PtllT3eIgeu2pVJ47/BMrgqeR7ruMSpbvU6Va3hJykwqNQPL7mRxVnietcjH1ESbAxJBPkoSwM7RTBE0jzUmZ3lOpGBs/uUPFGgNjF+r9fU8GimgU81yEHyB6WQpiPLaTWto+tCKUtzx7egTDQkWatD6m/E5EkqoC0iOv0MLebyj9UHeTRsPHVVlawvUQjWy3Ykbwf7Xld/Oi4tiqu65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ss+jYKsXIu/R+uHKDVdIcGuncJ8Bi69zya7c30Ls+2Y=;
 b=RX9wbO8rMdvnet373hMRqycvSIItUAYvUxP1VgmyJuQGPM+TG0AjoB7buI1cdcf5KzgtnG1y+FBDMtcki9jWEaKoazIvAfDTxIjS2hAbRtuzppGYU8DR4PanZLY0ubAUYTvGTgmFmIoJ4WhHcAChcZjzS7bxExvks0xD+d8l540UiBRKsqIm4FxT0H+ITNgGvHbAIE4dBJav7568WzqTvdCWot7d42iqEq/7vfsKvwaZmWOZDmU0fx9pV3cSXqciYh8X8rMdV1eesoZHoChv8rv0NtfG+0fqrJIXog/4WklIuQn+ZRwapxplZPBfECrx/1ruYeZ8xLCyEozcoTMgsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by DS4PPF0BAC23327.namprd11.prod.outlook.com (2603:10b6:f:fc02::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 6 Apr
 2026 06:00:18 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9769.020; Mon, 6 Apr 2026
 06:00:18 +0000
Message-ID: <73f06ce1-5186-453a-a3a7-82a526881cf7@intel.com>
Date: Mon, 6 Apr 2026 11:30:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 1/9] drm-uapi/xe_drm: Add UAPI support for
 purgeable buffer objects
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-2-arvind.yadav@intel.com>
 <2fa1646c-1dcd-42fb-bb81-f6bf42bce41b@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <2fa1646c-1dcd-42fb-bb81-f6bf42bce41b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0156.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::12) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|DS4PPF0BAC23327:EE_
X-MS-Office365-Filtering-Correlation-Id: afc45132-a108-4143-6d28-08de93a1c776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Yek6edf8dR8msdn5L5sdzlIqk82PGa35gJZy9bBcoeYbzv1IakTHSQilNKqn+wggWfHXu3J1lYo8gXscWoikTAXiEGBRt6Fn3pVKOqvhV5enyMRLbLAX9a7nybDBPOF2m9592ECoInAXQ0d3nHxIMaWNDU9YNuKFiIKzTRl4zZbvnh6n7VhuTJ1YuNyWvwW9GE9yRHcdT60Xhm4JDpeLJSl0/inTmp+Z4Aw04Fy5AMrvML1d5djpi3rT15DCv7dRKq2vOgAXgbaZFE8rTU/nJ/BoOaa3dTkDOtvyYmeNeDMFR9FCXTROJINbvSFFyLj5/ErUCGfdeEzvva3ct1FH2M1HQZdrAgO+wXT+1rCLa8X6rOFc97pXfbZQPgCoK3HC93+QCN7xpsVZA441RTGdIfHufFx+HscffvX+cxob1bK1ZjM0g3oJErCOx4ffSQeaaF1zFBM28WkzrGpd9900W1G41dT3Gv4tfkID/ddOO5ofKisG5EOfBhBQCWykCkm+Zz6HX1fZvb8Tu022MN5Gcc+glJBWL+JzWTNea4RVR7WoH8KGzFUUxOq6dckyeN4vvtbuSceY0UvNrA+4B7ta5YahjkRN8fkFN/Il9T3XuxUD8IlcEpBd0Szx5/7lDjKDUXWO/LgTweb0V+lVb0fpex+MjQ61jKUTu3WEXEdpii1kaDqKH7NGe3mXhehphvh+ShqtRABE2fp3jbQkkRDlB0nUKnwQ5zypyQGkEeKx0Aw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1NoeDNoOUJ3UXBGajQzdjUvVEZQS2tGeUduTXR4dkwrUFZHTE1jT21Vczh3?=
 =?utf-8?B?WHJOT3RpZ3Q1YW1xK0dWaHRkd1EyT2xFRi9ObHVzaWpaZ2VGQnkyVjJtWTJ0?=
 =?utf-8?B?bGJTenRuQVh6OVM5bS9sUkdYbEllRjFmbUJWRkVQblR6Yks4TlZadUdiYjBE?=
 =?utf-8?B?bjVaMTUzUWlwRGo1R0M0Q0lzRzdYZVFKZzNQSHZOZnFQY3BmWVZqOWswbXlJ?=
 =?utf-8?B?Njlrb0p6MFM4V0FBSnJkSTllRXBEbFhleVZlUXFERC9JRDNJeTlvYmdoems0?=
 =?utf-8?B?VWh3RHlVRDF0VTZ5SmpsaHJoMVBvdmdGNXNma3d4ZjRjRG9nM2hsQTUyd2NP?=
 =?utf-8?B?V3hNbGpzVkxNOEhIdmU5M2oyckZlVy9xU0tCVVA0enpTS1RIUnE3T0tBNmxC?=
 =?utf-8?B?NEpUWDJpaUltT2l4dnkybk91YnlEZnRwUkxNZlFnS0N6eGZhR0FhTzh1ZjMr?=
 =?utf-8?B?UU52V3FNd1pGMFlwTkgzeDdKdzdONDRYRHRNOFpUeU5ncE1TN2tCbU1LbVQ2?=
 =?utf-8?B?TDhmNEZyVWpNREt6dWJYMW4xd2JjV1BiN1N4U3RqdUxIVzVCL2ZtUkFtZkk1?=
 =?utf-8?B?UUlnVXI5Sm5HblFOL3ZFMXh1MjhsMTkxZXVjMHVlK3dHRC9NR3ZZM1ZIVUw5?=
 =?utf-8?B?NHBFNkZLZ0pxcG1JRnFHWE5vS2V4ZnNQSHVsTm9mWGt5L1NPczBaT0lGOG82?=
 =?utf-8?B?N1BoT05vY2xlZHpod1UxZXpoVXlqaityTkdWL0RDM0Nsb2VDL2RyZXE2dlBj?=
 =?utf-8?B?ZHJadVFSSW9wV08wSFFycFRQdWFhUCtyTGZWWjU4dXV6SXcybFpPL3BwZk5O?=
 =?utf-8?B?Z1lMUWpaa3NQSEVKalloYTcvSzBIV1I4ZlVPYTFtYWxEOFBEbTNvbGVZV3cx?=
 =?utf-8?B?Y3VUOHlMZ2Q4TmIzNWhFZEtoUCtHc3NKZWlNMFZyS2JmRTdEdjUzM1hBOWpt?=
 =?utf-8?B?aWg2Y3E5QjM5VENSTHFDY1dFUHNJYXVUU3ExNkdDRGhvU3lQbnJLcTF1Zkgy?=
 =?utf-8?B?bzQ4YXp4T2IyeWZ2NFJHMUdCeXBmbHNrcXBUM01JTU5lRExkTmJmWmFoMWxQ?=
 =?utf-8?B?K0NBS2tqR1FHUXU0UVN4WVVSNTRlMDhmR1FnTW9RNmw4Rk5wTldaVElwUnhG?=
 =?utf-8?B?dFh3alBjQWV1YS9sQTgvSDVSdGlZRmc5aWFGSjI1MU5uZWNMcTVUSTRqcGJK?=
 =?utf-8?B?Tld5cHZBOW0xcEVYTVhyaURaeDBuTFdIQ0tPL1JXb2RFRzRURXZvdE9WTlVZ?=
 =?utf-8?B?MGZ5emxSWEs2dElCRGRTTkJoWEdNcUhZSytVaENLcUlrQk1WRUZlQUF6dXNw?=
 =?utf-8?B?cTNhWmRLMDhFem14N3FWWjR4bCtTYml3ckNiYWRXSlp0d3o1YS9GMEt1MVlJ?=
 =?utf-8?B?aEhzL1kwOFowUEZFVDU4ajY2UW1aSXVvZXUwZ0xqTGN3eGcwRXhFaTc5ckN6?=
 =?utf-8?B?a2FtdTFkWFJlNDFnampBZVYwc2djOWJjMTU3V1JZQUJwbDJGL3R1L0VFKzlq?=
 =?utf-8?B?WEFnRjF4Mm9TSzI2aHE5ZzNiOEpqZWZyRFZFWEZIeHFwV0JBbTBoTVd0dzBS?=
 =?utf-8?B?dDhPMWlYdFg0VjIxMjA0U2c0VFZSVmFzV253SmVVOTd5aE4xVStGekx6ZlRU?=
 =?utf-8?B?OUZXWkwvYlQ1OVZvRjlqdHFuQzBsWXRUZ01zdFhwdkIxZkVwc2llMXNWb0Iz?=
 =?utf-8?B?QTg1RlIrSmlqSVFFQ2JEbnY2M0NTY3BxSnpuT1JnQ2h6enVPSFkvUHlqZVRZ?=
 =?utf-8?B?Ui9yUy80UFBQVnNPU3Jwc1g1Q2pzOWl0SUZ6R1l4cTJGTTF0Zy81WGFQK2Ix?=
 =?utf-8?B?NnZCUnh2WjZOaFhoMjJUQzluWUgvLy9TSkJiQnJoQlRDSUFBaVI3ZGZVZDRo?=
 =?utf-8?B?cWhIc0E1ZW4xQ1VZVGJCYW15NXNDZlN3NmpNaFo4RVo1R2dtQlBsNW5iY1A4?=
 =?utf-8?B?OGNoTm5mSGpWWTh4dkxYeG9LNS9WM2FVdXZvYkhDd1FzUkdSNk5xUXdma3lM?=
 =?utf-8?B?VDZJOXJ6RHd3QTZESElOS2hmMnRDdUgwNCtmUVNpT2d3Zis5cFhEWkRhTmpS?=
 =?utf-8?B?NkxmWWZyNHhHQXpHQk9raHVIRXUvWEdNRGNBMHdUcllSYXcxTk9WMEo5UlBT?=
 =?utf-8?B?VjJEK0tpNkdUWjljdHF6bHdzWlNBcEVhQTRVOWRCcFh4Wkc1YnV5QWkwNERQ?=
 =?utf-8?B?cXZKbmZ3R3IxSGRKcXJJYS9vSkhIQm5tTE16SGRNdko3TnpOR21tMmVKU1pw?=
 =?utf-8?B?WUY0dGwwUVlzdFFmSDlvR2lmSmdDQ01FQ2F2ZDdvR2pXS3RQRy90elBZYmN6?=
 =?utf-8?B?c2R1VHRSUzZXWDhTbXdxa3kvUlJTSkNrckQxSU1vbkJxME4rUkZFdz09?=
X-Exchange-RoutingPolicyChecked: J3xnJxewcuh7o1Wj1ZHPZcKiKExY1nWGca6h/rJVRw0JsuVas9QZ5ttjBnsLz6iJsA02r8D6eERyoDlJCNLdiODa75RPyhYawx6nNecd5RThkLYRzQnve2/M9YV2uXfQqizXwZvRD9I7zm3ncTc+NXKkPgI74g8iJjdk3tml/txs8Qm8R+ob1bEcqWi4+APUG1gzdjYfxBj9lW/XUmcThWc6paPXj1tzZX8+ucG8ogUh0YtbKhaA5J4v57xAfghFEvdAOURMwow5X31Az4ngfZXaAJ+SQ4gY26MIvBOxw7wcAgRieY0hUAvhxHZ9eiIT+ENvuj+KRjAk1AumEjButg==
X-MS-Exchange-CrossTenant-Network-Message-Id: afc45132-a108-4143-6d28-08de93a1c776
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 06:00:18.2142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kcK8lEkjumZFPm2pvqFse4RciQCmmJ3q2aoGnO670TmDHvB0Aof6HZEA4MspxgBH6QYUqkmwZ/Cr03gC7v5+vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF0BAC23327
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


On 06-04-2026 10:53, Sharma, Nishit wrote:
> It should be like:
>
> drm-uapi/xe: Sync with Add UAPI support for purgeable buffer object
>
>     Align with kernel commit f99a05cc0b85fadd109fb3250fceccc5eaad3830 
> ("drm/xe/uapi: Extend the DRM_XE_MADVISE ioctl to support purgeable 
> buffer object
>     management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute typ").
>
> In IGT you'll be using header from KMD so need to mention alignment 
> with KMD commit.


Noted. Since the kernel changes were not merged, I will add this to the 
commit message

~Arvind

>
> On 3/25/2026 6:14 PM, Arvind Yadav wrote:
>> Extend the DRM_XE_MADVISE ioctl
