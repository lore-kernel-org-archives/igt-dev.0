Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57A3C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 18:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500CC112922;
	Wed,  8 May 2024 18:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcnuCRoW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E782011319E
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 18:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715194589; x=1746730589;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=eomer5XzH+NOCOcYRlRXxs+hJNI/oNXuNA1cgEZqeSs=;
 b=lcnuCRoWt+RpDhWtPNVdtHDKy10Q2Wxt09E/oRP3zpMeYZulRyop/uU7
 UYKDdmqEgE77S6noPHbiPtN71PSceslFX9wP5Mdmg1YZNWfXCkIQZ83uN
 Jg0rEuLQ3WAACex8Ll8d5LgZ4vEaVX6GxW8e0EZBy58PMqgnKS2PPWTS3
 m9wGiF3LO+aIxVVKcctoCSBhpCxv695wnv7C57ZFa1d4cQ11Cd3VGHxtY
 eNbIXXt4wTq78X0AleDMyRj14dt5IqD1uCFD0MeI5IHN1id+4uydpOeYt
 ay4Ql/i9t0/Aj2BE/p1F9J8jdFdLWeTaMBat8BrqidAek+hD0zL/7RoFo A==;
X-CSE-ConnectionGUID: ywJyxR7sRwujgit5SAoADA==
X-CSE-MsgGUID: XHKwxhEhQbSefu/WPv5f0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11239532"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208,217";a="11239532"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 11:56:27 -0700
X-CSE-ConnectionGUID: vA+uGqpEQvqWjOrI+WCGpA==
X-CSE-MsgGUID: ZxGN6B8xTNa1or1C/QOmFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208,217";a="28928422"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 11:56:27 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 11:56:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 11:56:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 11:56:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYhk/360IPOF9j7ibLkd9aJugRNzi97sLXw6C5WecnzyxZZjd30EQ55MX11gt41+jrUg+u2l9+w9Whmo65z13E3OseFSaZuBSsOoWA1BnZMvjsxN6i2Eu0SkO1uXge79VkG7P1redzqItyDquGsohTG+fdlKHdaHpiBGcnf2K9r+08rvkokMTg/8eHj8W14p7QCE2FKerEE70reeSX48o+Yx7jbH3XrsNUmz0VCy107xiYGUYwBYJ/EbtT4wnvdMPyWwPO5OzMV9wEnYkxdnuQdxLPgMuzbOJzHBYg2cZXoOYCGW0Etlrruz8HFbWvpxXhbJ974jEFYNMzCpT7XppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACbqy900J5wV98QaS+R5FuE4jsZaBm6n2jHtD1AP728=;
 b=Zjvm0aQO+oJqvYsbjPh6np+U1+eoSL5OlrwrWPhAx+xECZN6SY+LXQL4zFlsyvaR8YBb1dstSUKpod4fH2OIhyOunVM/knGN0qM8MHNISj8Gc/NLMc0aFPzubhSdYYTomaNZrJQWJuCUYOaXmRnJDjI2CyOCBDo9e0VZpBGU+ZEcInBQiGTI0G3aS4Ym92dgiIk7BvzpugekXuum8NbQeFGg2bKJcxwVxSVInp72Oy5iFAGwef1P+k+CMCjM96LFrZiTyW3g6D+Pelzs8Qyw47J8zvitb0DaJEBEJUtfFIM/nIDsFW20mPTe9R/lHjarWZqfgRH5E2vbJ1OuCTjFFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by DS0PR11MB7311.namprd11.prod.outlook.com (2603:10b6:8:11e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 18:56:24 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273%7]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 18:56:24 +0000
Content-Type: multipart/alternative;
 boundary="------------rCGRVe6P945H404vsJjbj2lJ"
Message-ID: <7fe4cd1a-dfe2-4113-8afa-6a092e6c737a@intel.com>
Date: Wed, 8 May 2024 11:56:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/xe/xe_spin.c: Fix typo
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <jonathan.cavitt@intel.com>
References: <509c80865fe3460ba32ac25b49bb6ed1c40a6b33.1715109028.git.jagmeet.randhawa@intel.com>
 <20240508142255.jo6pmyrpbzvbqtdh@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240508142255.jo6pmyrpbzvbqtdh@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|DS0PR11MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c17e425-3d21-431d-57e0-08dc6f908e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aThYRVFXNkVTNkJwRW51akpIVFl6WTcxT0p4dDhXb1podVp3emJJenF4RDBY?=
 =?utf-8?B?WHRCM3JJSjluVUQ2UGJWbURLb0pLaTJXSUs0dEF0d1BEZHVIakFheGZtL3gr?=
 =?utf-8?B?VXUxaW9WK2NZUnBjbys4ZWo0UEhwdzd2RmhReFJKdkVEcmVReFNnczlJZkgx?=
 =?utf-8?B?Y0p5UVAxakVNVStpZkVlVHpIZGl1V3hvSmpUREV2QmtGTWUwTlE2b1FyWXZ6?=
 =?utf-8?B?Y3BlekVKbTZtQ3d5UjZ6aW9NWFZkb3RNdnB0NWRGbmlOcVdRcVhxTi8weUky?=
 =?utf-8?B?ZnZqaU5zN0xyY3VFNFVTWFN1R3RZV1MyQ29keDI5RzFicmNmbXc4QjN4anZq?=
 =?utf-8?B?cnRPT1Iyb1FWaGRHYkxEdTQ4RTJQOWRJUllqTFhjT1EwZ0hiY0p3RXpkZXl3?=
 =?utf-8?B?T3BQTUVnZE5BYmNCZDdCZWZtS2ZISXhjVVZWOHNYd1F5bWk1TUhGdDkzOUsr?=
 =?utf-8?B?eUp4ZFhxRWw3aDZ1aDF4dTR2aHFXMExYeHhnN25hQnZjWUlOc0RjZGxmOEFR?=
 =?utf-8?B?eFVGOUNkNjFuWkU3a29hVi9LZnZNaXdQbDdGeUVRNHVsQS95U0xnWkFsbUtp?=
 =?utf-8?B?alpDa3hQN2RyRVBUNkZjbWg5Y21iL2pqcjNRNm45YUZXbDBhNFRFRXoyNlRx?=
 =?utf-8?B?b1pvajNPZEtCOHdaNVU5allVZHo1b1ZpRUM1VldhS0hDVUV3d1RWZTgvdjdy?=
 =?utf-8?B?MHhiLzRCem5xVURHSmJMYkphREt1UVN6SHhIVCs5MEhGVGY3Sy8xd0Y3OTg5?=
 =?utf-8?B?MS9nWVo1UlFtVC83WU10R1F6OGtuNmxic0xSK0llV2kzWXMvRzVKaFVHOWZF?=
 =?utf-8?B?aGF6RzlCZ3dzbHRiRm5sNktQSTJNN1JLRUxEVElmaklqNS9VQkRJV0FxSnRS?=
 =?utf-8?B?NndUbHpxU0ZhemFIL29IczBYQzk3eWtUZjQvTjJKU3ZUL3I1MHdHZVd6bnBM?=
 =?utf-8?B?eUxRb0tDdmtQZkNoeUlCZUN5M1ZKL3ZpUzBVd0dtdFgrd3pLOWtTYk5GNjVj?=
 =?utf-8?B?eFUyeG9tR0hLUk44M0dkM3RPdm5MKzQwZzczb1N4VXpYZUl5TWordEUwVnNX?=
 =?utf-8?B?RXQzZS9SckZESnZBV3BudTA4TGttY1c1YW5Gb3drcWVkRHpMa0QrRHN0TFpa?=
 =?utf-8?B?bEkya1MxM04rSDFmT1pkZmVBVmFRaHc0eVQvc1JFNmlTTlh6eXJOQ2dvdWNE?=
 =?utf-8?B?SVRZQmVqNGJZakE2a1d0SGJ6c2trMmNEanFwYmNsRFlmMFgxOFRoanI0UXlZ?=
 =?utf-8?B?YXMxc3I0M2xCeFJhTDFpZEpteEtBaktIUUdma2Y1VnY2SC95N0lBZW4yU0Rn?=
 =?utf-8?B?ZUdXTTZlUCtadzBXaVJZOWY2RUlNYVBRODJoWFR0ZHJJVk1wTGZSVmxvTVRD?=
 =?utf-8?B?Vy9hUm5NemozSmJHWVl3YldFeGw0R3d6SHNCTld1SVJTbmFRMGhOcHZXbTZB?=
 =?utf-8?B?YVRWVm5UWFpwZU9HTWdMSEF5ZTJSZzk5RmxmanhkMlREWFpTTEZrN2JRQVFl?=
 =?utf-8?B?dkxGKzJGaHZPVExYclpuU1h5QnQyaVlqN3ZXMFhxWlZnOWxXM2poeGs4U3pp?=
 =?utf-8?B?eFlyalA2a3UraWpmWnZ0dm5wZk9MTUR1bmphaTZjMXRNUDcwYWllNERqRlVU?=
 =?utf-8?B?RnNMZnRxU295RlF2WFZ2S0xFOTRMcTN3eFNaeHBudzNoR0c2NjM2OWNvZ2pW?=
 =?utf-8?B?NGFiVEhiVlVxeWQxTjlrUitUU2h3THhmUUpWNS9UOEhFR09Fd1Jab21RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0hQWi9zRndYd3A3WVlGdlFwRUhGY3pqNjkvRHM5SWg5Z2NxcVBLS3RTcEdt?=
 =?utf-8?B?WDJrUVhXNnNZVVBRemIwcm1YSnphWlFqR3YvUzlTRkN1LytGWDZqdmVuMlpz?=
 =?utf-8?B?WHYzeFRtTzZob1FqY2RpU0trSmZ6aS84empmMWZpcFRoeG5EVFhidnhsRGRa?=
 =?utf-8?B?S1JDZ0NibWFVeDJGK3ZuWWc2QnZ0UlVkNlhzUFdlTnpUTU1Tb05tdEw3VlNs?=
 =?utf-8?B?d1NmQ3BLeFVOMEhjcWhaZVUvaUNtZ1JPT3BBQUg5WG8wYVV5R0hnM0lSWUQv?=
 =?utf-8?B?dkJRTzYzLzJhSUtsOG5hUVNiWXBIQVhGMWp5d2p3cGRqZXpnMkN2dzRJS0p5?=
 =?utf-8?B?NC81Sldqa00va2MxNDZ5OW85NUpJQmZkSU1xemVTRVFzNlp3eVFzYms4TW1t?=
 =?utf-8?B?UWlnRjBrZ2owcVJVaDNOcmlDVjZWb2piRm5jbXRucnFpQlhmQ29mQ1A4SUdy?=
 =?utf-8?B?RVVNTE9ERzFSeEc5MnhFVGxIWWN4MUsvZTVhekdSRmsyUG5MNnlrT3h4MHRy?=
 =?utf-8?B?OUNUZVhnMFVKN3JrdmlYK215NERGZmJveHFienZqR3BGWEplaXlNS2d4bFV0?=
 =?utf-8?B?MFBLcUpJWmVxQ2YwTzJESTBpL0V3Q25NOWVaQ3dOc2Jwcmd5OVB5c2xwMFNC?=
 =?utf-8?B?OXl1dUlrWUxuZ0tzZWVlMjI4bVcyRDcwU2NNN1lWRWhNckxDa2JyZXgrSElN?=
 =?utf-8?B?U2poanQ3LzVUVDl5eTNLMjNPTHdvQUNPMThKMm8ySlkrZVZFYnBqMnF1WmZJ?=
 =?utf-8?B?S3RDN0F2Q1JZeXV6MFNDNkV2RzRESVAzc3ZnSjZNTFdHcUZrWTJzRGszOCtF?=
 =?utf-8?B?eU9ZZVRHTUxUcFZ0azEyM25BM1pybGZtWFQ5NkM2MTM1Y0RFVHVhOG10UUNu?=
 =?utf-8?B?bFBDUmpzYlIvTHlDREFmVVBNKzR2YjVhbEUzYURDN3QvUnBSeGVLT0Z0aita?=
 =?utf-8?B?TjhtbDBiMVkvK1IyVmJuWDFUK0ZoaVd3YmFTNzliTE9ZQXU0MkhjenNpMUxj?=
 =?utf-8?B?WUdVQTFHMGRqRUx3ajU3dHk4WVdtTERuZ2s4QjFYNGEyalJhTWRFd1BUeEhn?=
 =?utf-8?B?TStod3ZFQ2pZbUFZQS9PVWFrSkZIYkYvQTdUY3JxVFR6dUN5Z25udzJScjVu?=
 =?utf-8?B?UThxeG1qb2tHaFdEMTV4T1VneU9QNjVoUjhMRHJ0ZVVvNzZlRWdOZm51ZXkv?=
 =?utf-8?B?aHBqQlQ0NTRKQjdKcWZkdHZmVi8rTjRLYjZycFBRMDQ1aTRJWkF3MTdiR0s3?=
 =?utf-8?B?aGl6SUU2QUFyL29wYzJ1M0U1cTBxdFFJVXRDL2JCWGhYbkVBTmRqbHorc0tT?=
 =?utf-8?B?Y0VSeHg5QnZvaFhmdzRrcG00cVpjR081ZzM4Qyt2c0phRFFQWWRESDJsTmdY?=
 =?utf-8?B?NnQ4RGEvelBvMEZNazRlSitxRWpHU0JqVEdIVHExMU1hM0Q3SHNKK3liRmlL?=
 =?utf-8?B?R2xSbTJqekkvQTVVUUYrZnkxZmdwRWN6YkQ3S3VRMjVkOXhndUtmRDkwaFJD?=
 =?utf-8?B?bi9zanN3NW5vTGRJNzc2MjN1emxBZTV4OVNWeTJqaFFXOHUrcFlORjFaQkNU?=
 =?utf-8?B?NGtFOTFUMlZ6VmpjQk95SmJKTW1PaFgvd0VzR0V4WVNtR0xFRUcvY2lVQ3M0?=
 =?utf-8?B?WkU3dUJwaEtVdmUwNS9pcjdtbzZyWmhjMWdiamFaanZYazNQbUM0Qk1nRzk3?=
 =?utf-8?B?SkloREFwMHB4Lzd4czNFcnFJUThScHIwZmpBV0J6YVFzVVVNTGFHbFVqQ1VP?=
 =?utf-8?B?WnM1allma0lGRW9nMGxWQWNybkx1aEIvUHBZdi9mQ3BBVTVLYWlTb1NKY0NM?=
 =?utf-8?B?cGpLblhTeFhyNkJpV0h2anNhZ2NKRXB4TGs3WGdWRHhUTEdIMjlCUWl2eHBz?=
 =?utf-8?B?T215bnpUeHMwVmx2bllFODArR1BoWmZkZnA2SE44YzcyTTd4WitBMTR5K0Nu?=
 =?utf-8?B?a3pPMHM3RjJtYzdrNHg1bUdsc3ZraitPTnZFRWtjSmY4Q2dPQm5oTzJkWnNT?=
 =?utf-8?B?enhvMTNydTl6dUhnVmFhUVEzT3o4MmQ0UnZQU2NBbER5SlJlRkdWWmxscXpY?=
 =?utf-8?B?VmQ1WWhTQzVhczZPWkl2cFd1d20xRzBuTTVSQ3FvNzlkVTFNZi9wQXdnZ0Zx?=
 =?utf-8?B?TGM3THFQeEdjMFBCYUhkdnFWYmV3RGtaYjYzRUo4cWxMTmtFN3FBWVVYUTFO?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c17e425-3d21-431d-57e0-08dc6f908e98
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 18:56:23.9168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVYW7AdrjDdIcGM7WbP+nnovGQrIojMdhnpVxqgMWpPD6L3WOnoSSRBtJFcB4FhLcbNA0HWcHS6KfvrVd1cLZJdLns0ldL92Zhz/dtEto6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7311
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

--------------rCGRVe6P945H404vsJjbj2lJ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 5/8/2024 7:22 AM, Kamil Konieczny wrote:
> Hi Jagmeet,
> On 2024-05-07 at 12:23:12 -0700, Jagmeet Randhawa wrote:
>> Fix typos to follow proper format.
> While at it could you also rephrase it somewhat?
> See below, no need for sending new version, just
> reply in this thread.
>
> After agreement I could merge it with ack from Jonathan.
>
>> Cc: Jonathan Cavitt<jonathan.cavitt@intel.com>
>> Signed-off-by: Jagmeet Randhawa<jagmeet.randhawa@intel.com>
>> ---
>>   lib/xe/xe_spin.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
>> index 381e5e950..2dbd51199 100644
>> --- a/lib/xe/xe_spin.c
>> +++ b/lib/xe/xe_spin.c
>> @@ -162,7 +162,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>>    * xe_spin_started:
>>    * @spin: pointer to spinner mapped bo
>>    *
>> - * Returns: true if spinner is running, othwerwise false.
>> + * Returns: true if spinner is running, otherwise false.
>>    */
>>   bool xe_spin_started(struct xe_spin *spin)
>>   {
>> @@ -262,8 +262,8 @@ void xe_spin_sync_wait(int fd, struct igt_spin *spin)
>>    * xe_spin_free:
>>    * @spin: spin state from igt_spin_new()
>>    *
>> - * Wrapper to free spinner whhich is triggered by xe_spin_create.
>> - * which distroys vm, exec_queue and unbinds the vm which is binded to
>> + * Wrapper to free spinner which is triggered by xe_spin_create.
>> + * which destroys vm, exec_queue and unbinds the vm which is binded to
> imho better would be:
>
>   * Wrapper to free spinner created by xe_spin_create. It will
>   * destroy vm, exec_queue and unbind the vm which was binded to
>
> What you think? Jonathan? Btw 'triggered by' could stay, no strong
> opinion for 'created by'.
>
> Regards,
> Kamil
Hey Kamil, I agree with you. Your description is more clean. I think

'created by' is a better fit.  If Jonathan is in agreement, we should also

change the subject to "[PATCH i-g-t] lib/xe/xe_spin: Improve comments 
and fix typos"

as you mentioned.


>>    * the exec_queue and bo.
>>    *
>>    */
>> -- 
>> 2.25.1
>>
--------------rCGRVe6P945H404vsJjbj2lJ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/8/2024 7:22 AM, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240508142255.jo6pmyrpbzvbqtdh@kamilkon-DESK.igk.intel.com">
      <pre class="moz-quote-pre" wrap="">Hi Jagmeet,
On 2024-05-07 at 12:23:12 -0700, Jagmeet Randhawa wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Fix typos to follow proper format.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
While at it could you also rephrase it somewhat?
See below, no need for sending new version, just
reply in this thread.

After agreement I could merge it with ack from Jonathan.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Cc: Jonathan Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
Signed-off-by: Jagmeet Randhawa <a class="moz-txt-link-rfc2396E" href="mailto:jagmeet.randhawa@intel.com">&lt;jagmeet.randhawa@intel.com&gt;</a>
---
 lib/xe/xe_spin.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 381e5e950..2dbd51199 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -162,7 +162,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
  * xe_spin_started:
  * @spin: pointer to spinner mapped bo
  *
- * Returns: true if spinner is running, othwerwise false.
+ * Returns: true if spinner is running, otherwise false.
  */
 bool xe_spin_started(struct xe_spin *spin)
 {
@@ -262,8 +262,8 @@ void xe_spin_sync_wait(int fd, struct igt_spin *spin)
  * xe_spin_free:
  * @spin: spin state from igt_spin_new()
  *
- * Wrapper to free spinner whhich is triggered by xe_spin_create.
- * which distroys vm, exec_queue and unbinds the vm which is binded to
+ * Wrapper to free spinner which is triggered by xe_spin_create.
+ * which destroys vm, exec_queue and unbinds the vm which is binded to
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
imho better would be:

 * Wrapper to free spinner created by xe_spin_create. It will
 * destroy vm, exec_queue and unbind the vm which was binded to

What you think? Jonathan? Btw 'triggered by' could stay, no strong
opinion for 'created by'.

Regards,
Kamil
</pre>
    </blockquote>
    <span style="color: rgb(0, 0, 0); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Hey
      Kamil, I agree with you. Your description is more clean. I think</span><br style="color: rgb(0, 0, 0); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p><span style="color: rgb(0, 0, 0); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">'created
        by' is a better fit.&nbsp; If Jonathan is in agreement, we should
        also</span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">change
        the subject to &quot;</span><span style="color: rgb(0, 0, 0); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">[PATCH
        i-g-t] lib/xe/xe_spin: Improve comments and fix typos&quot;</span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">as
        you mentioned.<br>
      </span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><br>
      </span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span></p>
    <blockquote type="cite" cite="mid:20240508142255.jo6pmyrpbzvbqtdh@kamilkon-DESK.igk.intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">  * the exec_queue and bo.
  *
  */
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------rCGRVe6P945H404vsJjbj2lJ--
