Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C261CE8D5C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 08:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D323710E24A;
	Thu, 19 Sep 2024 08:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHXyP2sQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C925E10E24A
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726733273; x=1758269273;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=M/8XD2ADLKH9/AR7uQ7COF5Ri25LrovtwJGkIaL9Qy4=;
 b=XHXyP2sQt7NsOH0ij+Fgxz8QPNrVVAZ3QxVc8iy4Gx95b51exjBj3xB2
 U6GRju6PC/W85iq6J/19jgEPtRIZ430alEQYOY97JwlTQ3s7g4p6CGfRh
 Zpnxf8K6ZcfwHwhhgDPJ+OP4r4jkSRSj7VZGsM0UIFx8ByCau5UpKFGQc
 yBAAmAX6udzyBWzi7XIIH/XvovRjn9zsrYirE7uHzkcUorqY6O0G52E1S
 Bjs2kx1SRkvfTMdqQqILMigYxTmDW349axbOQtSs0QKFOhovFeUPhm6hk
 /4I7bjOnViPMvbziZZaCW6AD7m+XXiCinuPHisznNTwWIAvbAqJGdkWeQ w==;
X-CSE-ConnectionGUID: MgE8tUeSS+yO077dn9vCJQ==
X-CSE-MsgGUID: nPkTK9nxRuWVOSOVT1T8Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36253507"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="36253507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 01:07:53 -0700
X-CSE-ConnectionGUID: mw3bxnFFQH2nUlTLdpfkkg==
X-CSE-MsgGUID: wZ3mnISoTk6lmpr+qrLNrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="107315662"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 01:07:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 01:07:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 01:07:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 01:07:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 01:07:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEfbpv+/AZzDaw/pF2EiyU0UmTEvA/o7/qO8GExRL1YRZG/OB1eXgMB9stla46ZJL4DMMAEX0BcfvDpD/9KBgWUTNHsoNuIGnlgT18uIhspgzoOJhQS0jbshZFKe/UiPF8Nz3BZydJ0+H1uQ5H+LJhZ4b8K9zK3NGli5Kao9cmTnLP+pIpcZl7zjpDa74hoOmFKITCqBtju7QsHqBTuNsxRupAJYI/+VhgaGBRwWEa2qFd3+Xpp5sLu5sKwrZtkMSx9wN3g6OoOefkt4N+z2o8rYkIU015LZewHCRFd/Ee7GMvjMLVJnYIKF5K5QwdnxyL3Ia6aSDp/kzcC6i3Db6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLxFJjBkZ14jsGChCk2FHf7bRH6jck+K/Gu4QXl1cZg=;
 b=yR2aICWeYXZW4Al7wvrJbDeYhCAeW5b6JemVGxlrkhTO4A9hq/LTvQBVGamh70W77CPj/xUIlPrER+fdSauYpIAG2nXhUVmELU9iglS3zSACaYvivrC11QrUe576GCnNsp/p9NqGlx0DLlwMA4RVHWZ2WTwYL8RY2BQmb9MTEWChuTjGgnRB/ihELFJqXRnmNP+WRKHDsLDkWZR+L8imqnc5xHQyZRsSUcIPDU4VJ2CoterfbRLWKgTu+Wy2TUv9zmd7pBfziMq1s1ifkOWjNKMDQByvlg+XTql9fQsSM51NG2gjejWSBEujycLpLFLk0aRU13owR0XH5z0R/A1YLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by SA1PR11MB7110.namprd11.prod.outlook.com (2603:10b6:806:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 08:07:47 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 08:07:47 +0000
Message-ID: <9abe086d-29f4-49f6-a984-07044ba5362b@intel.com>
Date: Thu, 19 Sep 2024 13:37:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms_vrr: Update LOBF test to resuse the existing
 logic
To: <igt-dev@lists.freedesktop.org>
References: <20240913065616.326959-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240913065616.326959-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|SA1PR11MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f5642d-8875-401c-2bf8-08dcd882261d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDZtWGJtSXVIYjVDVGxYSUZmNi9Rb0ZRL0Zxc3NrMlFDQ2QzdUQ0ZXpCcS85?=
 =?utf-8?B?bGpqMFF3OEU2dUhlT1JrbStKQWRUSVJpRzk5UFdjOUhhajQ1cmN6bVZmU0d2?=
 =?utf-8?B?YXVkOVdmZG1lbDI0NGtobW1HNzFwaCtraGEyZ21hK3MxeWRhOHRJWFZ2ckVL?=
 =?utf-8?B?aG5Mbjk4T3BRUm9UOFg5VEZGeXVqbzQvZzZDenRRSVRTNXU1ZmQzSlBUeUJI?=
 =?utf-8?B?MWdXaHc5NCsrRnk3NjRCOUhVazcxVkJBdDRJQmt0aERTbXJaamNSMm80am5o?=
 =?utf-8?B?OVJIVHJFSzFxYjJOOWY0RFd1SUg0Wm1aTmJkZkxHZENVOWFTWHBVcFpscSt4?=
 =?utf-8?B?NDlpamxIbWRuWUhaUFVpbERUTm03MUFoVzFyRGcrTnhKcXJaWmw5UlZDQ0RN?=
 =?utf-8?B?cHN3NmJSdjdGUkg3cGZCQ0twenA2S1pVNElUdENWU1dIRXRIaGVwcUxqTWQx?=
 =?utf-8?B?cjNtb0VBblZhdW9oeDkrajJvRG5BT09nc0dtc2U4OXoxazA5ekcxSUJMMGNi?=
 =?utf-8?B?SkE5dUlZeVc0QUlwa1FpVGIzYm9MQjdqMjN3ZlBDS21DajFhcXdQRkFBQW1S?=
 =?utf-8?B?b1UxeDR5cXAxVy9JNkpqaldDUEhiSmwvWUtPY2thUytMV3Q5b0p1NmZLNENs?=
 =?utf-8?B?eFI3VVZqbzd0TERMc0hpc2JESllNNnVIWTZDeU5CbGtJMERDQVF4MklpejBY?=
 =?utf-8?B?U1JUV0FmYi9nb094bWxrMG9Qa1pweXc5ZUxNcGNCQkNsNE5za081R2MwRW9t?=
 =?utf-8?B?WXBFOWhMcjZDMGc4aVdFZTNmbVNVWVl6clpYelpPd3JHZ1dZVlFCb252OTAw?=
 =?utf-8?B?amE0Ujh2RUFNMEd4K0RLay9jNzErcndtR0thbDY2OGYzUXAxbGhTTUM2WWVE?=
 =?utf-8?B?aExpNmdpVTdlNWVGK05NYXlpNS9Fall5QmZXUDhESnE1cGRyT3E5VU1vWisx?=
 =?utf-8?B?OEFKYWVhbUhQb1B3Q2ZwYVkzcDNJbmlVb25MLzNadElEV3Nlb0dITGRXZHJ5?=
 =?utf-8?B?VTFJMHEzU3BBTjJmVkpIQk1sK1hvVy9oaENlM0pOdElWV0tRd1VWU3JpL2ZG?=
 =?utf-8?B?TXIxdTlzTlI2b2Z6dm5QTVMwTzhBTWpJRVFQeFRuQnFhQzllT3dYOXVHRzlo?=
 =?utf-8?B?cVdDTnZ1ZGVtd2dyM21jTTFzdXY5SnE4dEFROWZOeVpBM2txcGpJSWJueVcv?=
 =?utf-8?B?OWNuL093aWxIYXk1VzJpaTV4L1JmRzJ1ODUrQkkwdjBZVDV0WHZpMlBEb2xT?=
 =?utf-8?B?Q2dXQmdhTTE1bHRTQVZZajd1cHZvdXZ2eS8yKzVnTi9GOHkyclFjbVdWTUs5?=
 =?utf-8?B?RGJBVGd3QzBlYk5KVFZmSEY0d3lEOUE3b2RCYmgzbkx5bnlCWGZ0VDJiaWFr?=
 =?utf-8?B?Q25GaFVjU1JDVUFCR1BqdEZPcCtrNGdiTEEvUnRTRFN0S09mRTdXdzhVUUhY?=
 =?utf-8?B?ekdNT3Y1MkE1c1JQUHp3TUNCTk5NbVNVenQvMFo1OG5NOTBVUVNtS0hUdUdS?=
 =?utf-8?B?QjRyaFAxT0t5eHhLOUt4ODg2K0xUVk05VStQZ0tkMStIZStZWXNVSHJsOWR3?=
 =?utf-8?B?ZWcvTEZtOUtodXdOTjcyeWx3RTlVUmE2NkhPd1J2RkdxTlhEU1hyZko5UThE?=
 =?utf-8?B?dXpac2VnNEg5SWNjNXJTc2F2S0s4Y09CVktwZTJXbmJYNlJvcFVud1NQbkUv?=
 =?utf-8?B?Q09hQklYVGhyVVI3OTRnUDNlQURVSnRLQksvMWZMaEhNQ2IvaVBDUEsxdW9q?=
 =?utf-8?B?OE1wWXRKakQxemhRdkc1RHU3MHRmRm91MFQzT1A4dFMzZ21PMDFtNkFjb1RM?=
 =?utf-8?B?bWErQ1hITVR2ZUkvRVNldz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEZYZ0gwZS9Qc2IzRjRhMnBXdVpkZzdzaGp5WWFOV1BBdXFickJ0YkNJajQ5?=
 =?utf-8?B?T0pESUdqNjhTc3dqOEo2dG0xWWZoc3BwTDlEcmVKZndRWTkxOGZsNTVncW5C?=
 =?utf-8?B?aGJrS0theWJwL053a1VIanBsK01td0UvaHh3WE1mNUEwVHVHYW5Ka2xqdGZa?=
 =?utf-8?B?bXBQa283Q2p3UDJlQTA2aE1xMWI1VWtod2YyM2RXRXlOZ2Y2WlVOMEN2bUth?=
 =?utf-8?B?NHNVTXBEMWNiUmxTNUtZR0htemJYVG5LOUNnTjZWdW5SWFRDUExiUXhtSmFG?=
 =?utf-8?B?SDJ3Zk5HZDJiVUlFcjZhTVlOaE1DQ1BhN3ZzQytLMlA2elY4bGxGY2E1QmE0?=
 =?utf-8?B?aXJ4NWJxcWNOTEpKTXJicFBzZGFUSEVHVDhDUUdleXNjNHdnN3o2TUprK0Er?=
 =?utf-8?B?dW1qL3NNYlNiMG1NbTN2N2ZYdUQ1WEFwNHhQNUdicjJsVXg4bzNzSm92bWFq?=
 =?utf-8?B?T1g5bnRvTXM2bXJFTDBkSmpyWXo0Z05obVNwUVJnZVRocm5maXg4MnlZcktD?=
 =?utf-8?B?S2Uzcjg3S3YwZTF4a2U5TE5aRy95Q2duZEMvbksxcEN6Q3c0V3UwWmJXbE9p?=
 =?utf-8?B?bG53QUEyUCtoZG5tMHVxb0VobEQ0aFZDaGk2YTZ0aWhZZEwzN2VDZC9Sb1Jp?=
 =?utf-8?B?S1dYZHR1NC91R1YrN21tWitobGxXUEtKK3NYcG4yaXJGNjExVS9SY2Q1T1Vh?=
 =?utf-8?B?NDZtM3BXTkVCWFZJTzFTMU5Xa0I1RG9Cakh6Q0JMU3RJaXdUQ0g0aXdGZUxk?=
 =?utf-8?B?UGx6V2hnZjRrOXBtL2lOUWFEV1pTTTlIZVdvVmRXa01IUTU2T0pLdzd0Mytl?=
 =?utf-8?B?TzNObm9ralAydDFkMGt1V2pwdUIvbldhWEM1WlNkYlRFZHhIQVpyMFNtbFh2?=
 =?utf-8?B?YWtuSEhXandMYzJiM1lSMUtMREcwV2VmSDZ2ZnROeEpTa1dSdktuMnB2aVlC?=
 =?utf-8?B?dTVLRmJDMFNGYmhyYTkyRm5JdlZoelppKzR4cVo2RkJpQXZtK1pzeVZjeWpW?=
 =?utf-8?B?TlpMcGM3MHl2aFFBcVpTOU5ZZ1hVd3ZhbVhINmdJNVRlWlliVldaK3dGdVBO?=
 =?utf-8?B?aGJNMnMxb2JOODRQcHpIYkx2d093ZEVSVGZCUlpFR0MvRGFCbVJISUkrRmlU?=
 =?utf-8?B?V2NYRmdtTGhZOU9pR3ora3ZPeWc3WTA1U0FrMDVuTmloKytGWHh0VzNoeWJ2?=
 =?utf-8?B?ZWZCakwwY2VMckR5S2xoTjl6R3I2M3VpSUZsZWFGOHc4aHVlZEJWYzFkRVpq?=
 =?utf-8?B?c0JqUlhCYjRPVDJpQno4a1B4blcrd3Izb0plNjJpQ0c1bDF6T2Q3ZXdFRmRE?=
 =?utf-8?B?RUtOUHNCa3p1VXJMbmtJM0xta0dzZStYaDJlbmQyTHVIMW5PQisyam9IMHU2?=
 =?utf-8?B?QkpyRDNNZkM4OXJnR3F4ZW9SRVUrQXg4K2VnVHJJMEIrRUNGOTlHNzk5Z2h1?=
 =?utf-8?B?Slh5SGdXTHVmdURkZnZqYWlzN1lBZUdSMVBRbDNzQ3lpd0txR29HaDc4ZUZX?=
 =?utf-8?B?SjVlY2MzbW9UWEVvWmNMRUNtVHNUNU9oZ09VK1pkVUo4b0RSSm40cUYvcmdq?=
 =?utf-8?B?UW5HYXNwVjloNW1WZGJOSGZQRXBpZkhxZzIxTHpUYVNuQmZyYmorc0JjeWZK?=
 =?utf-8?B?TXlpV0JqSko1dWhFZmZVeHZEMW5RcWxJQ1R6Q0orazRwRTRGME9YbkpTMnRH?=
 =?utf-8?B?ZW5XTWdKU2UwTzA0Y2hRMElyNWVSTzR5aC9ZNDV2QXV3c2FCQ1VJRVc0Tm1B?=
 =?utf-8?B?dHJHZTJrYmdGU2lyU3ZKVGtFMHBlOTNESnBkcU9sSGk2a2dXK3hnM2lWMEU1?=
 =?utf-8?B?TitPZWZsTStFRllseDJsdWpyM1hhYzA3WndJdEJROXRRc3AwLzNQdjc0cXFU?=
 =?utf-8?B?c3dkK0hXUG94OXhRWVdtVVBDVGFKZWxoM2hXU0NTaGxhY1RVeE54Nmc3alFP?=
 =?utf-8?B?YzJrbDNsU3JzMjd4ek5BSHZ2cklzZmZYYjdEdkxTTC92Vk9hbHRlRXdQd3kx?=
 =?utf-8?B?QklKU0dvcDl2emN6RVFtVm1QZHZ5VG0vblgxWUR6aUtjSjBzMEtJdnhTRFFv?=
 =?utf-8?B?N1NYZ0FxL2pOaTdqczZNSzVoaVMvVDFmbnlyaldQaER0dU1CS1FoVGVhNWFG?=
 =?utf-8?B?cnI4bVMwT1hrMDA1S0Z1TXNLcitJR005dUtwR0FjdDdlcGRJUmgzTDIxbnN5?=
 =?utf-8?Q?7Xzq6UxyOmx8ajxswBVXetM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f5642d-8875-401c-2bf8-08dcd882261d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 08:07:47.7303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUnGRa9fvy915eFgQkaSBBSRvARO/mvkyE1GP+xByVq326cCkl7s8y3bZrkfhwRN7dwYg1rK8tc0nTBfKdbCwXFUzud/XvLUSkmbJr1IaqKBaYtK8vFstbcsfE8p+e2V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7110
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

1. Fix Typo in subject "reuse".
2. Remove FIXME: test_lobf comments

Rest LGTM.
Reviewed by : Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>


On 13-09-2024 12:26, Jeevan B wrote:
> Removed the test_lobf function and used test_basic instead to simplify
> the code. Improved validation and error messages to make LOBF testing
> more reliable.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_vrr.c | 45 ++++++++++++++++++---------------------------
>   1 file changed, 18 insertions(+), 27 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 36a22eebe..5d9b321d3 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -640,7 +640,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   			     (range.max + 5), rate[0], result);
>   	}
>   
> -	if (flags & ~(TEST_NEGATIVE | TEST_MAXMIN)) {
> +	if (flags & ~(TEST_NEGATIVE | TEST_MAXMIN | TEST_LINK_OFF)) {
>   		rate[0] = vtest_ns.rate_ns;
>   		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
>   		igt_assert_f(result > 75,
> @@ -656,16 +656,24 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   			     (range.min - 10), rate[0], result);
>   	}
>   
> -	if (flags & TEST_MAXMIN) {
> +	if (flags & (TEST_MAXMIN | TEST_LINK_OFF)) {
>   		unsigned int range_min =
>   			/* For Intel h/w tweak the min rate, as h/w will terminate the vblank at Vmax. */
>   			is_intel_device(data->drm_fd) ? (range.min + 2) : range.min;
>   		uint64_t maxmin_rates[] = {vtest_ns.max, rate_from_refresh(range_min)};
>   
>   		result = flip_and_measure(data, output, pipe, maxmin_rates, 2, data->duration_ns);
> -		igt_assert_f(result > 75,
> -			     "Refresh rates (%u/%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
> -			     range.max, range_min, maxmin_rates[0], maxmin_rates[1], result);
> +
> +		if (flags & TEST_LINK_OFF)
> +			igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
> +				     "LOBF not enabled\n");
> +		else
> +			igt_assert_f(result > 75,
> +				     "Refresh rates (%u/%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target "
> +				     "VRR on threshold not reached, result was %u%%\n",
> +				     range.max, range_min, maxmin_rates[0], maxmin_rates[1],
> +				     result);
> +
>   		return;
>   	}
>   
> @@ -796,27 +804,6 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
>    * (Set Context Latency + Guardband) > (First SDP Position + Wake Time)
>    * one the depends patches are merged please fix this function.
>    */
> -  

  >>> Also Remove FIXME comments from here
  */
> -static void
> -test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> -{
> -	uint64_t rate[] = {0};
> -
> -	rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
> -	prepare_test(data, output, pipe);
> -
> -	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
> -		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
> -
> -	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> -	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> -	igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
> -	rate[0] = rate_from_refresh(data->switch_modes[LOW_RR_MODE].vrefresh);
> -	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
> -	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
> -		     "LOBF not enabled\n");
> -}
> -
>   static void
>   test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   {
> @@ -1098,12 +1085,16 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   			run_vrr_test(&data, test_cmrr, TEST_CMRR);
>   		}
>   
> +		/* FIXME: test_lobf : Lobf can be enabled when
> +		 * (Set Context Latency + Guardband) > (First SDP Position + Wake Time)
> +		 * one the depends patches are merged please fix this function.
> +		 */
>   		igt_describe("Test to validate the link-off between active frames in "
>   			     "non-PSR operation.");
>   		igt_subtest_with_dynamic("lobf") {
>   			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
>   
> -			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
> +			run_vrr_test(&data, test_basic, TEST_LINK_OFF);
>   		}
>   	}
>   
