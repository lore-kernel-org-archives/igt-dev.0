Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942CBD730A3
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 06:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A66410E2DB;
	Fri,  3 Apr 2026 06:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIB+ah1n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CFE10E43D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 06:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775197279; x=1806733279;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xvNgzm3WlW2964sFSVXsFEcGes9zG0CIdSYwb9Q2+KI=;
 b=QIB+ah1nkXe7HN6fANFXPkYtaUsuETsOFs7fJY1uFWXV9pSWe6jzuwtB
 V3IgdiA284iBWQmyeheK6qXQtSTNMxWj27UYtukTxEXpQQ3qwi9vGAwsB
 Q6LGmMjjjEYiS+RV9oRFeFrk+2zbbYX5/xrzG87Eo2cE9Zh0c5OOBeONB
 aoZ8HBnaFUudFmiw4H31PcCsN7vm7+MrPMNfncHV/e/ljX7zTV4EgETmf
 QDuM/PZ3I2ak2kWB3hl04b4MQY/PlufzBzDibViYMSaQET9gJ4l90Fmxc
 djqaoO27sTvc7PeMeNUuaZLau8dwCvn4ewmv5zPn3EUnwNzweloZlIY2X Q==;
X-CSE-ConnectionGUID: QbRpwuBnRNCru3dgfGbdfQ==
X-CSE-MsgGUID: SDgtJJHyQKaxt+a/kGjv0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76327050"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="76327050"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 23:21:19 -0700
X-CSE-ConnectionGUID: EeS5JxM4STidIaU0Wze13A==
X-CSE-MsgGUID: TwRee4SOSK+rM4JseTpsgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="228810605"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 23:21:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 23:21:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 23:21:18 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 23:21:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFhvMhgjCY+2WxAsZfbCdaI6OORzQbKBxi6CnT3eDceupWs4F0lSijdxJ0TvY3ReWLEbjuKST77gX1CCO7ZwBiRbzNlbEXjYUl8pzsxnkam95Pgyy0VeGQvFwzhrJ+4RJp4T36j6+S74HqD2hN/HvyaFkVevIp26opQnq0q1aNb/RgD7HnQ0fgg2jqH8tnUCwnyEmA+ppWv6cNB9U+neOJ5eOpiyIZhXISaJNuDkZOy71MtDCZr2eC6W6XFi5U6NiT0j0w5f8BT1NgZLFeCnJ5y+O+xxabrx6axKJlWpWbCqyshDm80t4o9Qm0+lV6hFdzyJPEqfvVVAKr6pIb9A8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBRLOFrOEAAaC2P/FZgQaZOXlp4Bzazs+c2cFJRBfbU=;
 b=Vub2hzinnGjAptCTKfGVGQ6L0UnY9WkghGJOuueIzgqvPx2kNDvjDpPnwRhVMhNOTrToBvcCPsxP1+xeppA4K3RjxVZTl/i894VtICkWmR6nMDTHtwA24hZ5XCgzG43oRtRZiLjHJNxJ4MoY07cpLATaNj650Im9g1Q5kRXs/JUITv/ZExS48ueQAjzS2hUkTXWRwgTL8MSqkSRVNfKWpVJV293QvaI9/UXzVb3Niwlt70p3QKikPAouTfSH3ocRdwByiKi3deLaINrOESCLKQahH46Q8jNGBkPn9dIRxjcytdyBhFXLxKvYpmpy1Ebc1wFQyAWVnvw0RhP+E7fILQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 06:21:16 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 06:21:16 +0000
Date: Fri, 3 Apr 2026 06:21:04 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Andi Shyti <andi.shyti@linux.intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_endless: Use the per-gt
 interface to set frequencies
Message-ID: <xikwecctejlsgkulibfmws2jz7vijds67nmuymb7h2llj7armr@o7sjsjznemd2>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260402110411.6367-2-krzysztof.niemiec@intel.com>
 <DHIMQVF67ANT.23LIAAMEJIANT@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DHIMQVF67ANT.23LIAAMEJIANT@intel.com>
X-ClientProxiedBy: TLZP290CA0006.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::16) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CH3PR11MB8434:EE_
X-MS-Office365-Filtering-Correlation-Id: 612e9b88-2fa4-490c-d158-08de914935f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: BHmhvRJsCaYSqCNnSqlsS8gTLhAusDwyZwHzy98QXk+xvRZXJj50yZiZblygE56lfONtqXkBBAxwDfhOH5hPL5oVNppY68Cx6WAbQm/c1PanEyKXfLs6GiXeYj6aOoQ/gs0/Dwx5qOOhL0ojNbtXyQ36ZSyd66cP73Kxh7PquukYvDGZJWsYnD8kL0mesijukH/WNY5Zmx1lhAGTyM/9D1K3QHZRYBk3lGa0ndtnoLXcs6v/h3u3GNV+rqtePmRGe943UAghChGQjphLH0/28/BLoK8Ze7DY2uUigTnM5K9CQPO2NHAo7zqOl/3cQruJJ2bwI/8KUBH0bDz5+orRrIOrgOhazIB9fjW9kVy2q761LyNdCQDcwbAivjBzpETgGyeBm73zahca7Kg2HlNDDI06PbrY/0Qoxo4dLI1iYiPHXyAj3kNDnWAY2Zxf9Qe57syZr/9PRRj5DgNQt04Bm47KLFDhBrfOMHk+DBaIXVpdfFmvh9qrOTmEuYJwkRuIULx7gjGepC5ttNkO9AYbFVFcApjv/Of4mimfyRZn8CVGihw0bxe1eWgCAgU9v4YadloA+5tCHpTMFobubWh5K1zgaeSU9CelJsjGD7PMMeTU5Vu3dwWhJ4uGq339nT0pPq8RsrqmeCiQ2tU6m1nPYCNFeA5mWmaG42NhreJZhvsU/J4EfWRi2iYbeet3Zk7akHXKwyPrleKC6sEGSM0gbMKTLAfHi9Pdko4FnvHBC8o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlo3cndHM1lQbzZuTEU2ZFZjM0kydFJJcG1id0JlN1AwbHlUZEx1K09GU2FJ?=
 =?utf-8?B?bDhqKzVEWGxEcEdjY0s2akZSS1JhWVN3UzV5djBMa2k0RFpxeHFQQmR2TWI1?=
 =?utf-8?B?ZGRXb2hkeUNnd3RsKy8xQkdqcld0cXQrVUsyRmtFVkNQMERUUlo2S3lrcTg4?=
 =?utf-8?B?VTF4L0JRVTdJZkprOUsrbnJVZVpyZGd3dkRONnYxbW9BLzBEZjc2cE1TR1Nw?=
 =?utf-8?B?TklWV2Izb0JFYWlYdjluNlVnT291WHova1VHZFd3bFJrRERyMDF1dzdma2JL?=
 =?utf-8?B?M1ZxZ3FZYjFYT0xJNWxUNmFZZzRoYnhqWEd6L01EcUQvYXh4cWRNMEQyUk5D?=
 =?utf-8?B?cVZIOHdISERjZ1dnbEgzOFF5NlJZcFFpd01yM1RIRDBtV3BnRy8ra0l1SEJV?=
 =?utf-8?B?YmFsaXFMY3R3K3BSTHc5WjMxV2cxUTJCMzhmTFBSUm1xOVNCNytUYzRvLzRn?=
 =?utf-8?B?TzUwQ2VUR1VnQVVFVjR0ZlhLL2hicWRGU1cwMUpodTR6OXNsbGpxQ01Lbzg5?=
 =?utf-8?B?TVFISnBCeUlQUVVsY0Q3engrWVRXZklHNVlmRGxZM2JEOERCQTJ6ZFJpS1h4?=
 =?utf-8?B?UDFxTlQ4M0VQZXN5VUpGWElFY2JPTEwxVm4wNWFDUGFtQlRtdUtRR1BPeHVn?=
 =?utf-8?B?OTB6R0d5QnFsampoU3JWdGxRQlRRUVZQNE1oaFU2Nm8wZHpSWk1tdEdMSTA1?=
 =?utf-8?B?bE1VUWZSVDd2M28vYmRMbGxCY3VoTW9FZWhUN0Z0Z3IzdWtFWURIKy9la3Nq?=
 =?utf-8?B?MW1YV3hwU0g5cjk5V2lRSjBPbndEYkhjRXdrM2hZYk9sL2w3WU1pRk1rL3RI?=
 =?utf-8?B?YnllbU0yaWdJNUJEOE9tS0IzYWs2MUNncEVsaVdVRUhwaFdSeUp6RjRoTEdk?=
 =?utf-8?B?ZDg4ZEVndk9kSklpd3hsQkczWXR5ZENmQXdXS2Y4T1VJUHB4NmRLcmEzQ0xx?=
 =?utf-8?B?M1RSRkZJckhUNE56KzcyUUhCS0tEWFZmZ21PRFJVQ1pnVytpUmJ2b20ybERH?=
 =?utf-8?B?ZG5LRkdzRHFTNXBPZkFSc2w5L3EvZFppWkMranBCRmRDKzFiUHpzMlNPZzd0?=
 =?utf-8?B?Nkxla09SUER4QVRSWjI3R2ZnMmx2eU1WYUlUb25hSVh4SUdOSlJTWm4yaWp0?=
 =?utf-8?B?VENJRGQ2UVZOQ28zaW0wc0JjKzNiRUV2dFcxVGhNclZGNlorUWJHUnllRXFI?=
 =?utf-8?B?ODhBd3BuN0N3c09xV0RObHFGZWVvSW52U3FvQXJxTWw0endtZUVEYytLMG1s?=
 =?utf-8?B?UFZZU001KzgvYmYreG9lcEVBMFBtMk9IdnZ3WFZNaG9ITVRSb0o4aURZWCt1?=
 =?utf-8?B?TEF2b3BvNkdsU3p3R3NLTUhiTnVqU0g0LzlmV05MbUpRL21zU1lqaDhFdlgr?=
 =?utf-8?B?K1Q2a1RGSU5YcXZ5K0d4QVFaYWhUNE9wYU5la1o2ZlR0dnRYcEZQNE56TXB3?=
 =?utf-8?B?bjU3eEJzelV3U1RrbDdwbUJuTi9XOHhEZHh0WVVMa01ZbFAyYjdFcnBHMmFD?=
 =?utf-8?B?M0wrdk1YbVBzTmFHTDFmd0lzTDlzQWllZnZDa3Y4WDZPV0loc083R1EvNjhZ?=
 =?utf-8?B?L0ZseXpIejhsUk4yYWx0c293TU5URHdIemNwcFNNOXViT1J6d0lkZE5tdk5j?=
 =?utf-8?B?aDRBeUEwUld3c1BwOG5JcWRIbG8rM0hFVVNkOUcxREx6UTc3dUhSWmw4dHp1?=
 =?utf-8?B?dnlNcmpYdkdhaDJlc3kxajFIT1l5YldSMkM4d2I5MVNQMnJwcnROb1NqUHk2?=
 =?utf-8?B?WXlPVzN2bS9XOCtwYlgxNHBWdGhoejNncHFyY04xWTZoVVRtcmVDTjNBYkdJ?=
 =?utf-8?B?V0FDZDAwdVoweFpVbmpYWkk0MzVTNWJ4WHl4T1dPNDdPd1dXNjVqUERQS2JD?=
 =?utf-8?B?Vy8wZXRvSEkrazEybURnbDhvV0N4aWwrK3FnVDRMMWtmMXV6VnpJeWVTT0dZ?=
 =?utf-8?B?bFl3RzBqVzBHVzRPS25MUWVYKzIraldjZnBTaTZyVzdLemJUYXp4ZHRsS2Vw?=
 =?utf-8?B?VU1KUHlrdWhyOGVFMTBHM0htdnZhdTB4ZVZicVAxYTJyVUVobWI2YnU1eStO?=
 =?utf-8?B?Rm1SMVBFUlh2Y3BqQitEODdLL2ltTnJZODFCUEh4dnk4MzdPY0NsNDNIb0VK?=
 =?utf-8?B?TkVYOGlmclpxa29XcFBWSTYzclFZaGxQcCtTdXlic2JVTzJYa1ZQVDAyeGZx?=
 =?utf-8?B?d1RNUzJwS3ZrbjJTbjZ2ZGRteFVENDRkR3cxWXBtTlpsNXVTaHQzZlBVM2pp?=
 =?utf-8?B?S3Y4YW12bUdoSjgrVGovY3EyckxFSGw5Ylc3QUJGeldZZUVXb293d0dkRFBG?=
 =?utf-8?B?MXA2SEtKZTNvR2JpNVREN2Z2Q2xvazNjZlYxY2Z4clh0Z014cVZQMGZoYlBu?=
 =?utf-8?Q?p/eIaMyQ+tn2d7CE=3D?=
X-Exchange-RoutingPolicyChecked: moXZUtrvZNMur+CWMiG0RrEHmBUdygTzRlz4/hjLWL+h3xR+3s4l4WX31pnhVGBgGelRo64OQs335f6CJkPDg1VdmGL6xTKCayUOEGvQ+HFtPuEhydH53QDOGv/KufVnyEQCw0WMcs/NsmQNIONESYklNb+Wr9A4Cp5k0twD13sE6FG6AOri4lc/Os9KkGSbiX53CRkQtEE8EfcHgM0uDXrualr5WSeokVp2DEw8JoQa7QZuM7Xn1XZ8SHRUn6uiiSDdr5nwZAwnxikXdY8R0rZTh/uKHb/RDZ3OpzcUlkrVZB2qPv17uLuVOCWCr8vptymgwYRYmNZKAyrxLr7KWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 612e9b88-2fa4-490c-d158-08de914935f2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 06:21:15.9446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWq2+NJ9nlmFo1Scr3r6YoiiT7jKjkyVxUJ48DZY7XqgKwxqyC6A/OK+V4Eril32whDptuZ0yC7s6RENBnOXGTvX5mSR2KOdgmJ3TO3aP2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8434
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

Hi Krzysztof and Sebastian,

[...]

> > @@ -355,7 +355,7 @@ int igt_main()
> >  
> >  	igt_subtest_group() {
> >  		struct intel_mmio_data mmio;
> > -		int sysfs;
> > +		int sysfs_gt, tmp, gt;
> >  
> >  		igt_fixture() {
> >  			igt_require(gem_scheduler_enabled(i915));
> > @@ -365,16 +365,22 @@ int igt_main()
> >  						   igt_device_get_pci_device(i915),
> >  						   false);
> >  
> > -			sysfs = igt_sysfs_open(i915);
> > -			pin_rps(sysfs);
> > +			i915_for_each_gt(i915, tmp, gt) {
> > +				sysfs_gt = igt_sysfs_gt_open(i915, gt);
> Isn’t sysfs_gt already opened as a tmp file? Also, is sysfs_gt closed anywhere?
> ```
> #define for_each_sysfs_gt_dirfd(i915__, dirfd__, gt__) \
> 	for (gt__ = 0; \
> 	     (dirfd__ = igt_sysfs_gt_open(i915__, gt__)) != -1; \
> 	     close(dirfd__), gt__++)
> 
> ```
+1 to Sebastian's input. Krzysztof, you could ditch the 'tmp'
name and use 'sysfs_gt' in the loop instead. That way it will
close automatically thanks to the defined for_each_ loop.

>  
> > +				pin_rps(sysfs_gt);
> > +			}
> > +
Extra newline here, remove it please.
> >  		}
> >  
> >  		test_each_engine("dispatch", i915, e)
> >  				endless_dispatch(i915, e);
> >  
> >  		igt_fixture() {
> > -			unpin_rps(sysfs);
> > -			close(sysfs);
> > +			i915_for_each_gt(i915, tmp, gt) {
> > +				sysfs_gt = igt_sysfs_gt_open(i915, gt);
> > +				unpin_rps(sysfs_gt);
> > +				close(sysfs_gt);
> I see this close() but im not sure if it's same fd.
Same as in previous loop - use 'sysfs_gt' in the loop arguments,
so there will be no need to handle the file descriptors yourself.

> 
> > +			}
> >  			intel_register_access_fini(&mmio);
> >  		}
> >  	}
> 
> 
> 
> 
> -- 
> Best regards,
> Sebastian
> 

-- 
Best Regards,
Krzysztof
