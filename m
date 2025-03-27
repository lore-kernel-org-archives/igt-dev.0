Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0033C36010
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 14:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710ED10E8E8;
	Thu, 27 Mar 2025 14:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8eTSvnU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F4D10E8E8
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743084488; x=1774620488;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nLtsbfJVcSs5mCpKdJlFCkuDAeCqGo6FqLwwCdOZUj4=;
 b=Y8eTSvnU4CLE52WtKJ5I+9dnE88FMN6ca4iq6nNMN3PlWtbK1FeC7Ehc
 cosXtn0c5VOjJh2JdYGEqfPrzAvKowpB8uSbWtOcxVuruKPFHVY9ibPJV
 mLq5VSWgHWJtR1tfXCGZWuZHoc3PdKdimpaxjor2c9vcyFvhmNBitqXUt
 kd3037bOJP0ZrTs6vhDKmuHPr6I19o9tDcbEuidSZNhvwdrkNUrxQdWVU
 OTh2gLXGOjHwFClCuUkdlP/PzWUzUxGSVA/chbJL6SfCm2VyYwyNh3fFg
 ZOj3DSXUs6yz/upTxBUqAqoywQX7e3hXAPkQrdfQxTOv/wUikwnewuhID Q==;
X-CSE-ConnectionGUID: jZOuKzpGT3mPf65m3aHGkA==
X-CSE-MsgGUID: yn3xF3GoSC29rBW9zwzMiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43660909"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="43660909"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 07:08:08 -0700
X-CSE-ConnectionGUID: SizqmVbhQW6/JF9znikLhQ==
X-CSE-MsgGUID: I+H1k+NTRemMmdIOGBursQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="125129804"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 07:08:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 07:08:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 07:08:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 07:08:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8OEPF4Mx4jSH8o458wm7A+sXUGyCplqsSBWW8HSNW4MUeQ/D8ycU46+OadbtcAYdfKUazGCY6IBe0E5X2/duWdnO02zKsU8MghZhOLrlEWxJMpNCruJZkR4Hvfm+FFUEt/AA/zZVeHjtbBM3Jezl3ix5ou4SfF0kRdjy2SEKqJsK5WVH+OJjVEjdNSQEXbTvN/W40G3qloavGdC6RqnEDfC8+UemjNOYO/NUllZO4CewxiRMerpyIvR87p8QvCUqqib3acJuI3ylGoZ9uzX8YqCyk1BFN8SKEPh80eWFgmKY5hcqSOLwjO70GqgiFBDicObn26mOxAPORLkNioRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/9TdwyK+9WUYlvPV0542jNj+z1uxm7mtHdjuy12sFU=;
 b=iZGbGf6trBmxp+E4UTVM9+IAYSIcG9gFoU1jQ69I1qFnb+Bqi2Rw1Tht6JLQOnv3g5AIrRU1BpqS6IG6UYuKkKf32MCsTT7niA8bW/Xftm8S7pcpkBThQXlszCjeZoD8On4YuRX2djXv2ZFpOJasLC+1OFt3GDHGgXn5WrpxCWM1vbmAvJfYcUmiLEl110U5imrZIP5hQusycc6myIgbwT36NIz5arxh71pZoMpFPTdQ+/pFoCgJDuJJsp1cR2p58JmtjQ3C5imQkwWvtav63P1cXblN/rzmhVWbd0gJ01oDpRDFawHD466hqWkDpq+MIkhEk/Jjyg8WSVZMK5ixCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB5923.namprd11.prod.outlook.com (2603:10b6:806:23a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:08:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 14:08:03 +0000
Message-ID: <9a519d72-c528-4a90-a275-6c7367af313c@intel.com>
Date: Thu, 27 Mar 2025 19:37:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 'i-g-t' v2 2/2] tools/intel_pm_rpm: Add support for xe in
 runtime pm
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250327014827.1829635-1-soham.purkait@intel.com>
 <20250327014827.1829635-3-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250327014827.1829635-3-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: 34da6100-e863-45c2-4f6c-08dd6d38ca03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2tWbENQb1htUVJxYUFERmYydkNtbGhrMi9EdkdRaEEzTURvdFZQZExFckNl?=
 =?utf-8?B?a2I0Wm9MZW4wM0plU1ZwOXJWNzRiUlZqbzZUS2hYUW4yOVBwNXNIZ20wL0JU?=
 =?utf-8?B?Z29iNGVDcE5DM2xia2lRS0hnMUxaL3d4MFlSTXh2NDA1VWI4Nkk4SnlzSTBt?=
 =?utf-8?B?QTdoNkR5b3FYZFl6NXBlVjJUdVFtQXdkRUlMdm9nYlVkTEY5U1NKSms5RjVr?=
 =?utf-8?B?a3NHSzc3d3FpbkkrTGxBSmZlOFhUMGxCbm5wVWYzdDdTOHFGWVJJanpEZWVW?=
 =?utf-8?B?ckRteHh3WmhNcUJDemkxRUdZa0g4NnJyelhOK1lHbldKTlJoYm5hd3dGeUd1?=
 =?utf-8?B?bTVMc3M1RGRsQUVWZWVOOSs1blEvRGtaYjlUY2pKLy8rRnZBMmpQV0pPYjdE?=
 =?utf-8?B?QnNFU0hIUjVpaWwyMW1tU1RQbHlxUnV1SExuT243aTI0TDlQWGsreCtmUDUx?=
 =?utf-8?B?Q3p4RmtBak9rZnVicE96REZOY1hUVkRQVXVEK1RmdW44M0JEQVBYNklhNDVk?=
 =?utf-8?B?c1hGa2xSNXBxZHI3QXA2cUZ0YjVrd1dWMmMvVi9JSlNqMVpqRUFPRVFxR29X?=
 =?utf-8?B?bnlZUGcyRGpCRnlhSjV1bHBTNDloRzdKcDVXR1hTaHJuY0ZqTVV1eEl1b3Ft?=
 =?utf-8?B?bThVK2VkKzRjbDZEaEU2VSs4a1RBcGN4emVNVGhoQjFmNjE3UEpzb0NtUEJM?=
 =?utf-8?B?anFoVml6UThlWE96d0wxaUFFRis4cTFmNFBac1JWRHUrSkFFNUwyWHE4NE83?=
 =?utf-8?B?NUtaZE1hbHlEMXhQbFVWbGJaTm40S0V6WEkrdGxQOGxocnJHTGxUNXpOcmRo?=
 =?utf-8?B?STBTakR2YTNDVkRjVEVEOGIwYnl2VTBsWXVqTU4zTXFWTUdpSHlTejVwSCtZ?=
 =?utf-8?B?TEtidjhoNG44WXNsUnFGMUVvdHhiYkFEcnVOSjRQWExOdEJDS2c1UTl6SHJt?=
 =?utf-8?B?TzFQYlcvZkcwSHhuYkkyRGNPL2V3eU1lcEx2a0tQYVkvZ3BIR09Cb2lmbFBS?=
 =?utf-8?B?ano2bGE3bWVEQzBuM3p2VllvNGVGNkozZFZYYXc0SWdOTU5LUmRIZXNsaWcx?=
 =?utf-8?B?VUhEalN2clI0NGlnNmd0THRSdGFzeGZ2bzRaS25WUWV6Y0R2WDJuaDZvRW5u?=
 =?utf-8?B?aW85Z1FqOHdJQXQ3T2pPdk53MUUxOWNsbE1WUXRhaWdNdFlDTzBTRTFwZG9C?=
 =?utf-8?B?K0ZQNTl5KzBlUzU5TDh6d09ZUEFvaUZHYlBaL0ZlendkR3lBbGI1YkRVQ3Jk?=
 =?utf-8?B?S3FwNUFnWEVZK1JTYkl5RVVIc0VWd0NsRGR2NDRPUktnQjFweGpZNFh0bnRj?=
 =?utf-8?B?bHhrQlVMMnU5OGtESXB4alBSRkpyMXJmcjBQZU5UNXhSQVNTL1l6dVVRdklu?=
 =?utf-8?B?WWdzc0NpTkEvUEdBWlFCVFk3MTVYOE9zT1BSeUhWT3dLb2ZTVlZ2dnBiQmlZ?=
 =?utf-8?B?QldidDBhTGxZalRma2VtWWtJRE9sNy9POUJKMlBwNG03Z2JxTzFPY3l0RzRy?=
 =?utf-8?B?SUpQNXB5SjRFZGh6Rm93YVpVcVBHYis5Q1NQeGJiQVViUWwvVUNmYTl0RzRi?=
 =?utf-8?B?VkxvV1FMM0dWWHg1UzFjbDdhS3ZBTnZWeG95Z3U4NE9VbWRIeE1FTVpGNkxP?=
 =?utf-8?B?QjFFc0RvTGEydFJheWFEa2FibzgrWnNZSGY4S1hSY0J3My9LUy90NERUMnBY?=
 =?utf-8?B?dW5VSjVJTktXc1JaOXA1aEt1ZDBLeEhYa2JNWW50RXhFRkRiNHZqd1BBbnJX?=
 =?utf-8?B?aUppWHlwMC9ETWxzeVpITWdhNm5aSzlTN0ZtR3dvWGpTZmVKbnFpUXorN2VI?=
 =?utf-8?B?bVpLaUpvZS9rNGF3TkdpeC8ydDZkOVUwL2s5R1RhMmlrTGlSNHVWTGxxdkMz?=
 =?utf-8?Q?NSwW3CDEzXEr0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzlCaDhESE5vOHBvalhmSkNXVWV1TXRMa29RTHFLL3ZHZWZneXIxcnBWK2ZV?=
 =?utf-8?B?NUl3VUhOckdnWG0ydDllWTV3SGFqZG1TaitQUmVYTkdHdjU2dEN2MGpkNU11?=
 =?utf-8?B?SS8va2oxTEVwOXBEeW5TN2FqdlN5V0FyWjg0NTBXK2ZGVzNhU2duM25TV3dk?=
 =?utf-8?B?UHYxZWZ4T3BEUFM5QlhRSThOc0pTeG40by8rQnA3UjBYaVBLalFISTVUNENT?=
 =?utf-8?B?QlBLL0J5NVVFVEJDUlRtWFhpbkg3MkJQbXpZdEhYbm1zRmtzcUwwWFJEcEY4?=
 =?utf-8?B?QTFwSUJIYnFQSHVjNFRVbkRVblZVMXcySTlLQXZtMzRvYkRmclBZZ0dnSFBV?=
 =?utf-8?B?Znh0bmx5Ykh1NUdEYzNPVkdDRWpCT0pXVFRSc1hCMTFKSWVsek1wOVM4V01V?=
 =?utf-8?B?Q0RWVlhGeDIxMERYT2dNRlQwc0VyNGtKSlhNa2NUNnJqTjdrUlQvRStjTmQz?=
 =?utf-8?B?SWZOeFVmNW93U2RUZnVOTldTOUN6Y2M0NGFKRGRhU25lYmdwTVdvYURHbG1o?=
 =?utf-8?B?emJDU0JIc1BKRlpXc3BDWTNqWmxvZVFOdStNU2Y2bWN5eDd3clNYV1IzL1pU?=
 =?utf-8?B?emhYTHRVYWs5bDFvRmNFWjhDQW5oajRmSUVqcjRwTVcydmpGZmNDbEdVeHlp?=
 =?utf-8?B?ZE1UZkptRis4LzIrUkNETmpuSnhUTExDSWtZeXVUb0ZQZVphYzJvQmpSUmM3?=
 =?utf-8?B?dFBKREFoWmxmUmU3OXFFaXNUUjRvcVg0K201aUs1U0JSZTNucE5QWTdvSVFt?=
 =?utf-8?B?TkVDY0RQek9KYTZYajFTWThaMzd0YWxMOXZwYXZDWlBvZHFDcDZDQW1uNHZD?=
 =?utf-8?B?QXVFa1V3bjY2QXdHZjdVWU9yR2N0b2RxMDB3UGlpRXl4MEtrS0cvRjhRQS9m?=
 =?utf-8?B?Q0RvaU5jZHNUcDFkMFNkQmUxOGhrRnBxR29CVllSVURwcGN1K21mQ1htYVI1?=
 =?utf-8?B?Y3BNZXdUSVFOK2FZdjg0bzJiTUQyZTA3eld1ZGxiRVRzaUxQeURycnVvelVJ?=
 =?utf-8?B?UE1iRmIrZHNJUG56MWFCMkFGajRGeDNiWkVPaG5zQ1ZJY0Y0eU5jb01HWTRX?=
 =?utf-8?B?dGVXQkZibEUyVXRsM1Fwb0ZPdHZ2Ymk0OVQ0SFB6OGhkSXJJUDJuZmJPSUNR?=
 =?utf-8?B?aGFiNld5RENYZDZGOHdjdEQveWhBVzJheUdCQ0hQd0dKREFwNXZCYzhna2VE?=
 =?utf-8?B?VlpFVS9KMGJ0aXBCTEdIUlU4VjFYME02ZURRRjFnTVpxQUJ3SDZ5UnZrN01k?=
 =?utf-8?B?WGVCb3pzNWNTVisxZDdzOGhTb0lQenFtMnU4eHJZNnM0WmJsSGVmQjRpOWww?=
 =?utf-8?B?ekVNbW9EaU1GVVVvc0VqYUJQaE9aY1ZSaHZnY0dFV0o4SWJxalZISVFWeHFI?=
 =?utf-8?B?VGMyVWdxKzYrT0JHVC8rTnZnR0xMcm1VOEIwZnR2d0Zma0g4Ymw2VjQ1a2s0?=
 =?utf-8?B?Mkx2dUZ2aGFjWmhKbGd6Z1JUTE9iSEttRnRJOUhKZ2tzV21mMXN6MmRnS3JW?=
 =?utf-8?B?ZUhLS2c0YW93cFA2ZjE5ZFI3Q21STTJlcEJoc1ptSmt6eVprQnRtdnFFQlBo?=
 =?utf-8?B?QU1QUzlaNWpJN3ZRMmtVQis3OXhJOUo2TnduYlF2U1JGVzhjZFRmUTVoUnY5?=
 =?utf-8?B?MHlCWlZFQjVTaERiZ0hlNlpWTjdqd0RBM1Q2SW4xS1RXTWJiRXB3RnJOWVVy?=
 =?utf-8?B?MmFMaFo2WlBLUVUwd1prcG9VSFR3SStLU2ZwZGRvYlVqbi9xKzN4Zm5nSUcz?=
 =?utf-8?B?Q1pubUFscWNqQlk1VGJmWlV4c2tZNy9jT3gvMENET1VReCtIa25CUEYrNzU3?=
 =?utf-8?B?NzF2bE9hVGxqeCtpVStPSXVRb3pkVFV5eEV0ai9lY01hdEZtb2dzclFydnov?=
 =?utf-8?B?aWZ3cVF3YWlnQWRUYldybWxYWWZSOHJxYnhLQ1lwNjZXc0I4SXR4WkNudElL?=
 =?utf-8?B?ZFcyRiswcitUSVZMcnp4WkxpM2gwSm40TGFzOVQ4N0dGNUxKd2hiakJ5dVBF?=
 =?utf-8?B?cnJkUUx0Mmd6QWxTNHJTeXpoRzF1RlFQcDE4bklxSHRzY21PamxVOGp4bVMv?=
 =?utf-8?B?VlJ3UUFudlRHWHBDa0hwbWs3NTVwclBER0xpaXVFU2MybEE2RCtQUXFNZHhp?=
 =?utf-8?Q?jX1NXylN1H/JB16mDx+XzKYfy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34da6100-e863-45c2-4f6c-08dd6d38ca03
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:08:03.5481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tv2h3VcY5MfxpPSHgBbJEwEzF3mHkObe72wOLaFLU7NMuiLpW+Fc3Ktx7QbaxdNqqxOJa1VeJmMA+N+tWIbgyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5923
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

Hi Soham

Use this while generating patch for igt
git format-patch --subject-prefix="i-g-t"

Replace  [PATCH 'i-g-t' ...]  with [PATCH i-g-t ...]

On 3/27/2025 7:18 AM, Soham Purkait wrote:
>    Add support for runtime power management
> for Xe driver along with existing i915
> support.
> 
> v1 :  Updated references from "i915" to
>        "generic GPU driver" to include support
>        for the xe driver, ensuring clarity and
>        consistency
> 
> v2 : Add prefix in commit message (Kamil)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tools/intel_pm_rpm.c | 28 ++++++++++++++++------------
>   1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
> index 08c25ca8a..8c4778e4f 100644
> --- a/tools/intel_pm_rpm.c
> +++ b/tools/intel_pm_rpm.c
> @@ -35,7 +35,7 @@
>   #include "igt_pm.h"
>   
>   #define DONT_SET_AUTOSUSPEND_DELAY (1 << 0)
> -#define SET_I915_AUTOSUSPEND_DELAY (1 << 1)
> +#define SET_AUTOSUSPEND_DELAY (1 << 1)
>   
>   typedef struct {
>   	int drm_fd;
> @@ -47,8 +47,8 @@ typedef struct {
>   const char *help_str =
>   	"  --disable-display-wait\t\tDisable all screens and try to go into runtime pm.\n"
>   	"  --force-d3cold-wait\t\tForce dgfx gfx card to enter runtime D3Cold.\n"
> -	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set autosupend delay to"
> -	"  i915 autosuspend delay. Use --setup-d3cold=i915-auto-delay as optional argument.\n"
> +	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set GPU driver's"
> +	"  autosuspend delay. Use --setup-d3cold=auto-delay as optional argument.\n"
>   	"  --help\t\tProvide help. Provide card name with IGT_DEVICE=drm:/dev/dri/card*.";
>   static struct option long_options[] = {
>   	{"disable-display-wait", 0, 0, 'd'},
> @@ -80,14 +80,14 @@ static void disable_all_displays(data_t *data)
>   static void
>   setup_gfx_card_d3cold(data_t *data, unsigned char setup_d3cold)
>   {
> -	struct pci_device *root, *i915;
> +	struct pci_device *root, *gpu_device;
>   
>   	root = igt_device_get_pci_root_port(data->drm_fd);
>   	if (setup_d3cold == DONT_SET_AUTOSUSPEND_DELAY) {
>   		igt_pm_enable_pci_card_runtime_pm(root, NULL);
> -	} else if (setup_d3cold == SET_I915_AUTOSUSPEND_DELAY) {
> -		i915 = igt_device_get_pci_device(data->drm_fd);
> -		igt_pm_enable_pci_card_runtime_pm(root, i915);
> +	} else if (setup_d3cold == SET_AUTOSUSPEND_DELAY) {
> +		gpu_device = igt_device_get_pci_device(data->drm_fd);
> +		igt_pm_enable_pci_card_runtime_pm(root, gpu_device);
>   	}
>   
>   	igt_info("Enabled pci devs runtime pm under Root port %04x:%02x:%02x.%01x\n",
> @@ -151,7 +151,8 @@ int main(int argc, char *argv[])
>   			goto exit;
>   		}
>   	} else {
> -		if (!igt_device_find_first_i915_discrete_card(&card)) {
> +		if (!igt_device_find_first_i915_discrete_card(&card) &&
> +		    !igt_device_find_first_xe_discrete_card(&card)) {
>   			igt_warn("No discrete gpu found\n");
>   			ret = EXIT_FAILURE;
>   			goto exit;
> @@ -169,8 +170,8 @@ int main(int argc, char *argv[])
>   			break;
>   		case 's':
>   			if (optarg) {
> -				if (!strcmp(optarg, "i915-auto-delay")) {
> -					setup_d3cold = SET_I915_AUTOSUSPEND_DELAY;
> +				if (!strcmp(optarg, "auto-delay")) {
> +					setup_d3cold = SET_AUTOSUSPEND_DELAY;
>   				} else	{
>   					usage(argv[0]);
>   					ret = EXIT_SUCCESS;
> @@ -203,7 +204,7 @@ int main(int argc, char *argv[])
>   		kmstest_set_vt_graphics_mode();
>   		igt_display_require(&data.display, data.drm_fd);
>   
> -		/* i915 disables RPM in case DMC is not loaded on kms supported cards */
> +		/* GPU driver disables RPM in case DMC is not loaded on kms supported cards */
>   		if (!igt_pm_dmc_loaded(data.debugfs_fd)) {
>   			igt_warn("dmc fw is not loaded, no runtime pm\n");
>   			ret = EXIT_FAILURE;
> @@ -215,7 +216,10 @@ int main(int argc, char *argv[])
>   		igt_setup_runtime_pm(data.drm_fd);
>   		disable_all_displays(&data);
>   		if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)) {
> -			__igt_debugfs_dump(data.drm_fd, "i915_runtime_pm_status", IGT_LOG_INFO);
Add a error or warn statement for xe or else it'll just quit

Is this tested for xe since CI doesn't run tools?

Thanks
Riana> +			if (!strcmp("i915", card.driver))
> +				__igt_debugfs_dump(data.drm_fd,
> +						   "i915_runtime_pm_status",
> +						   IGT_LOG_INFO);
>   			ret = EXIT_FAILURE;
>   			goto exit;
>   		}

