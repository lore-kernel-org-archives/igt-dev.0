Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBBCD75BBB
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 05:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0BC10E068;
	Thu, 21 Nov 2024 05:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izUxh0xv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F17C10E068
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 05:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732168357; x=1763704357;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Q0B1DWCPE6j21mJYeVYYBRnFxINfryokLrEXgzTVs1Y=;
 b=izUxh0xv+vQAEzo84faL5ReH/PHdMqpqdEtoWUi1buVuOX2LzSLOx3Nn
 x3P5YPpVyauwjQg//JZVMx8t+M2Yb73lRT2IUMaK5y7tn7JYCrIB4ulB8
 GAqbFiEVS8AbfQCO5bESgVpQc+JG1TUlQfv3lFUuiyBi43lKLL7sid2BY
 TnoUmU0vFwwBsfb0zS2aUSxmjs8X5XS/wRpLH/gzEtmTS7BfoxiBFe4NY
 gKThq0BN2vVzY9ZRMqZXkKYFe2Ohr16Mw6S9ZUtwIFvsKO1BT0JkNjXQY
 Rre/6JFY5lijdiacUOGV0BqPInhnkhFER4tlZFvbKkRINA2Q4EkvagMcb g==;
X-CSE-ConnectionGUID: eoGQX7g/TO6Yg42sCgMSqQ==
X-CSE-MsgGUID: VnBasVssROeCVeq2dyq72A==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43641818"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="43641818"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 21:52:31 -0800
X-CSE-ConnectionGUID: wITpyqSHQz2qF2jNLmNrgg==
X-CSE-MsgGUID: iH6UYDpUREGYESfAH2BWGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="95201221"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 21:52:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 21:52:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 21:52:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 21:52:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nO7z8TVSXbh/AAXGxdemTPjTpeKVXuLBcWPWBAlK94qaG54ukxHW2J1UOQyDQYgtsxzu9PW3a1QbruIIJi8S8ZqSGxOgeB2Xpi2hdG9SdrqZ8iLhmiXy9k1oejOphs+awK3A40fenHR52Icjb+4yzv6g7/NDgA03W6T8XuHWJd2DMvB6BbD7V7moLmZkdds2UEsHoMRp/CJDtomjCc8gGieyqOJTzGuD00wu1FuOts+jTNvuEVtpmHt23fAp1VlvB0HxptsMuKGcdea8vaEKnLcVSuutlLkYymopDOx939NNLhsXYmVoJZmcavAsDRBGcBIRFlW/rrQN+X8HQf0HRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNbtqAjVRa0MKiWaNtWixWtGJzjrS2s7DdceKPk1yuU=;
 b=opPKwED5fp9OZNlN33Yg2WkbbjrxSTx1D0/O7kLrc/e+fNjU498Db+5+8GjWT81lNAr1Cs8sFckdR6TQ0aH4cpTvej01VS9vV2WU/EpfteSmTgAbAfOFwJQMHhtvKyX7eyfiQ7khOIOmoN2k16Hz87azStyVZtJ9I88RH7XBRz0VGh+u2Vl69DNHMbI7UdZz80Tg2zczhu1C3aGJk/vcjZFqdxw5u4eMe3pgK/J8ljAMk0OS0iK9vHNc+6zl3EYS6/3yw5Z5eQhVNZ6JhaH7UXMEHoiseBw3Km41V72XRXDqQWrDO64igkHGIRpVCBS4marXXvCfI0BCItRWsmIuxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by MW4PR11MB6571.namprd11.prod.outlook.com (2603:10b6:303:1e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 05:52:27 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8182.013; Thu, 21 Nov 2024
 05:52:27 +0000
Message-ID: <55d6ef30-7bb4-49a1-8c37-a969d4514c37@intel.com>
Date: Thu, 21 Nov 2024 11:22:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 6/9] XE3: tests/intel/kms_draw_crc: fix x-tiled
 tests for case when there is no x-tile
To: Clint Taylor <clinton.a.taylor@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
 <20241114190339.3885752-7-clinton.a.taylor@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241114190339.3885752-7-clinton.a.taylor@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::20) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|MW4PR11MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b1de1d-228a-40d7-4b6a-08dd09f0addd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTRoMU5kY1hyZEx0WkVIZUJnaUhsVzdabVNRTVdHL2Y4M1BKa3gwaFVZZ0J0?=
 =?utf-8?B?bmJVU1dsbFlIaitZbDhHZE5xY09URVhWdlFrYVpZYit5TzRoSlFFaWh1SFRv?=
 =?utf-8?B?SGJNQkd4RzAzeXVCWkdjR255V0E4R0RkZUF0cXV4MDJqMlAvSWwyTkxocWtj?=
 =?utf-8?B?M2xLMWJTc04vVU5BZVBOVy9Ha2N5MEVnbXRpVHQ5Q3ZBTE5FR0F0MmM5dTFS?=
 =?utf-8?B?L2F4YlhKTGcvUHk4YTQ1VlhydjEyazd0dXo2TE9FdE1adnoyc3laVzJEWG13?=
 =?utf-8?B?S254LzVuOWdkekd2cDFUZ1BBaStzM2V3MzFWU2c4WXpPTjBGcmhIZ3pzcWI5?=
 =?utf-8?B?eUpPeVJvdVMwQkM4MkxpQXY5TjE4VmZuTmR4RW1BRFlSaVZXK1VlN2VDM0U3?=
 =?utf-8?B?WTRXSDlJYmNmQXNpQzEzbmVEVkFxbzhWWGkrRXNLR3pQcW1ZZWJHcmd4NHZT?=
 =?utf-8?B?MmRhSFd5WHVPazQvVG9aYzZmVkpOc3ZobFFZNmdXZzNmaTRsSHphRzhUYWpo?=
 =?utf-8?B?bXU3Z3R0ak0wWmJsNVZkcXVVS0w5bjE4SEhiSDhiOGl0NkhWaU5PNlk0ZFlt?=
 =?utf-8?B?NE5TN1p1QVVTOXZFbTZsazlSTDZxU3ZkenhjRHJIU3hwY2pOY2ZwN1BoOUJ3?=
 =?utf-8?B?eUhUQkRId1g1SmtpZnBRVXlZNlg1aW5ZMkhjazY0cXJtbVRzL3JUQWZsT2tr?=
 =?utf-8?B?TWlSRUM1S2ROdUk1YURZZy9wZG5DNHJtQWN1Tml6MmNjN3VhUm90TkZCZS90?=
 =?utf-8?B?Y1Y2UFdFQjdBZTZZb3FYR1RhYTBiR095Vjl0ZzBIR2ZXcndLQnVSS2RycFhs?=
 =?utf-8?B?ZktQbTNNMDFIbnc4c1lGeGx4UEVEWEZldUNEbWkvb3Qxc09xdnFKTTNLZ1ps?=
 =?utf-8?B?QmtYeUpZcHB3RE01c0N5cUtvbi9MTEdnMURUb0ZGa08xV0swQ0FoVWJJUm1D?=
 =?utf-8?B?VWEwQVJnaXJMWElkR2liRDhLRFVMSUg0RldYOWFmcVhSWW9wanQwWTgzc3Br?=
 =?utf-8?B?c1ZDNXdZNk9HNExhUmczYTFqMjRSemVlWWpvaEpBcC9UQUt3eE41d0ZDTEJo?=
 =?utf-8?B?TVBBTGNKM0hxWEsvaU8rWFYxV0xIVGtwbFR0Q3VtVGFzN3hPZmNERnIvQmto?=
 =?utf-8?B?Mko2WExFaWIvQm40c25uNXpDN3NRaXpsR2FWNnhJUDdSVy81STlyQVpoaDJq?=
 =?utf-8?B?bFBoMFl2ZlE0MS9sTW10Y0FJcXNyQmQzZlNYcXV5TkpjVjdLQUVOczcwU2Js?=
 =?utf-8?B?K2JOR2VrWEFraFZqVzJvcWt0dG4wZ3V0MUIzZnpVQTBXT0kxVkdaa3Y0aWZL?=
 =?utf-8?B?TnppZmZneEJFN2l6ajFiWXloRkI4OHUyMUlpUDhzMTI1eXhPT25GcUpObWNQ?=
 =?utf-8?B?anh6c2o5WVAzR2NlcWd4aERZemhQRnVoamRDOExaSWgwcit6ZFVCVVNRaW96?=
 =?utf-8?B?UEI5QmpKUGgyczZuV2xTc09oalcwMGdWUWxISTFHV1N1TFdtUGpDR1BUTFlp?=
 =?utf-8?B?anl4cUJhKzVseDZ2TEZEblNKYTNybGlESnNJeGF1Y1dvNXZZQkEydlBoNnZN?=
 =?utf-8?B?bXNSN3FUQjFZcEp2N0JZVWtubFRBVFlkVjB3d2RGRDh6Wk9aRmRJN2ZvV0dI?=
 =?utf-8?B?K3lOZHg2NVpvSVptb2hXVFhLUTI3MkdDYzlhQ3IvVlZ1djVoaGdZUjhHQ1R5?=
 =?utf-8?B?eXlxOTVuL0xqOEVBcW9ZNGpuY3IvY3RRV3hTMWcxZ3RQaHJsd0hVT2dNeFZV?=
 =?utf-8?Q?Dpx7pg7WTRjQMRdaU+Z2AD2UJq93DH0oX9p/oan?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWZJV05sS29SUEdqZWIrZ2hOb2djbVdhTnNSUTVjeDkzZlhhVzBuVVpxb0Nv?=
 =?utf-8?B?U2w2bE92ZWZDL0x4MFFUamhIS1lXbWN4a2xLTGlCZUxqa1N2empraVdjRGRi?=
 =?utf-8?B?ZmUrMElOazlrVWUrZTYvK0NpTDVvdzVDY253MmdpLytXdXFyUG1jVU5iWXgr?=
 =?utf-8?B?LzkvV01DY1I0c2RRU01zeGhPWXIxN1JZNTR5NTQvbXFFZFEyeDJoV2pmWmxX?=
 =?utf-8?B?bHVadzlXZlA1RFpDVmVGeVVOcGJ0RmI2OENybktzT0FTQm1GYkRyNkJQek55?=
 =?utf-8?B?Rm9nd2loalFEUy91bjlRaGdtb2c5WmN1am9weDZvNzh0ek85cy8vSXA5NGZ5?=
 =?utf-8?B?YzVYZm5Ta3A4WW12d2pZTEVuVTREbjR6ZXZLN0dKQ25HbkRaV1hSc1hveFJq?=
 =?utf-8?B?VDZiMEQrbUpIYXRiV1Q0UWg5UjVpMjRxN3dBa2JKVS9lT05wdmZsckdMOFVs?=
 =?utf-8?B?VXo4TU5FOGdOajI4Q3k2YnpKMy9kUlYrd2hzd2hPTVpnaExqaVNzMGt0RmdT?=
 =?utf-8?B?cWczSm5RVFpnUGxBelM0dXZFK3Q4ODJHOWZUMXlMUGd0WEpiUVA5N0I1cjF3?=
 =?utf-8?B?M2tJUDFweWxzdU9FamE2MXg1RnlOWmVlUmpxMVMxYlV3TUlWWCtObC9sNlh3?=
 =?utf-8?B?VHRNanlTNGRXUy83WGh1YVZHR0FRNDNEc0pQeWczVytpcWNxWWpZcWJ5UDVj?=
 =?utf-8?B?MWc5MlJZdnZ2c0RxV3dIL3ZieUJZOEJpclBIUEFxWmZieWpQTDhTWWRFZW1C?=
 =?utf-8?B?U3BjZ1J6NW45Vk5xRmNGdTNRYVhBSjZFbU1EdmdwSlRJcmdSRUhuQkF5eitL?=
 =?utf-8?B?OGdkT012NGU2RHhDcTJWY2NqWU5iSlJRQVhEV0RVQjlESWFqMzUxNExzSk1F?=
 =?utf-8?B?TytuMXNtOVZmYmVwMHhOM09rVDRzb2tOWnprM0FQSTRJaldmSnZ2K3VhVDNS?=
 =?utf-8?B?K0w5emNxQlJhc1FlNVBwcGkyRkxxa1RMNG5Tcnpqa0taVko1SzVPdzR6VktO?=
 =?utf-8?B?b01wT1kxZHMvczJsd0kxN1pXWXpkZkR6OWo4Y2ZKcHF4U3d1SUxlekc5VGll?=
 =?utf-8?B?OFlQdCs5ZStDVWJHcWp0emQ4Z2RKeDMzY2VCc3ZrUlczNTBzWk1ackwxUitL?=
 =?utf-8?B?YzA4dzlDaW90UDY1NWJabzhBUTE1K3g0VnZCeitiZWw4VUl4ZTRST2Ftb2pq?=
 =?utf-8?B?Sy9kOTZHTWNscWIrY2l2VUszWXZIcHkxYmtza0dDb0JCUk9UWWR0NnJHTDVF?=
 =?utf-8?B?K09QZHZVK0E3dElEWStRcVFMUUN0N0lMb0J6UnI4SzRaNGRnYU9ONzRuMzht?=
 =?utf-8?B?UGYyenhqTDgyLzE5eG1kbFNHQVRCZDNjSTdpUzV5Sm1EUWdoRUtDQjNhL0pS?=
 =?utf-8?B?Z25nc0NibmJKZ3VNWnc5NXp0aXZCdWlxUGUyN2pibGl3emlJT1JaTk1VMmpm?=
 =?utf-8?B?K0ZDOTF6MW5ocUNnYStzdGlvVnN2cEtWbkxiZUtJMmJDM05OSVRXaDNWNWJY?=
 =?utf-8?B?YjRCZUd3Rm9LSkU2TEt2REh2aitWRzlZS0xienBzU2MxSUdhVFhWb2YxWkUr?=
 =?utf-8?B?SnoxcWxKbk01U1k3QnBDVG1rVFNYWEJCdjVrS3JlMlQ2VjUvRjEvZ29VUk4x?=
 =?utf-8?B?RWFuTkkxdFA1NXlVRkJ2SWFSdEZPTmNvcUoxQnZJTS9rc245MVRvcTV2bXcz?=
 =?utf-8?B?U0lBK0tvdUliTUFFdDFxTTNQVzczanVZMmlhWkM5Mm9pNk1DQnRHZ0k2dzhz?=
 =?utf-8?B?dlExZy9mVENFOGJISFRqQlVXWXFHUnpib2Q5UTRjcVF6UG1JZGRRZ1JueFpX?=
 =?utf-8?B?UDJmMDFZZjBZVmpjZ0o5NmNWS2NvWnlJallUUVRrZlA0eEJIWXUrQm5XRUw5?=
 =?utf-8?B?MlNLQTFvaFlTcklyNXpXT3JiYXhyNUpmMmhMWVZBdVVEdVNpVVhtL3ZSUjhN?=
 =?utf-8?B?R3h2UnExbFlvRDJpMnljcytDakQycGtLR2N5TURRNVkwR2JQQjFMRzhxcUhJ?=
 =?utf-8?B?MmV6WmdDMHBDV1BSamJDcmJTcFF2WU4zWHE2MDhndVByNnZaS0NnVUNUWlBM?=
 =?utf-8?B?bE1oeUx3WGlIMHlqQUNrejhvRWl0K0lOeSsyM0tJT3BzWG1XSzE5TU1yRitn?=
 =?utf-8?B?S3cvOUZPVlFwYWNGeGRXR2VRSWxYNUV2UHM4bmNXaGNNdy92R2pmM3o2TnBo?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b1de1d-228a-40d7-4b6a-08dd09f0addd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 05:52:27.4295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tV7Al9LOCXo3AV+JuW0uEeFrfTIA5J0F5FvZm3bun6OOjurDpksnRQhIBF6b6FU/tSAaCzFVFje+DMoQ9lh5n9Cyhn1PnSez989CVdDzKfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6571
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

On 15-11-2024 00:33, Clint Taylor wrote:
> From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
> 
> On Xe3 display no more support x-tile and will disable such framebuffers
> 
> Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> ---
>   tests/intel/kms_draw_crc.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
> index e3d1c0ba9..3084e9c9b 100644
> --- a/tests/intel/kms_draw_crc.c
> +++ b/tests/intel/kms_draw_crc.c
> @@ -243,8 +243,10 @@ static void fill_fb_subtest(void)
>   	get_fill_crc(DRM_FORMAT_MOD_LINEAR, &crc);
>   	igt_assert_crc_equal(&crc, &base_crc);
>   
> -	get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
> -	igt_assert_crc_equal(&crc, &base_crc);
> +	if (intel_display_ver(intel_get_drm_devid(drm_fd)) <= 20) {

In the kernel, we now have,

{
   .modifier = I915_FORMAT_MOD_X_TILED,
   .display_ver = { 0, 29 },
   .plane_caps = INTEL_PLANE_CAP_TILING_X,
}

So, we should probably change the condition here as well to

if (intel_display_ver(intel_get_drm_devid(drm_fd)) < 30)

Thanks
Sai Teja


> +		get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
> +		igt_assert_crc_equal(&crc, &base_crc);
> +	}
>   
>   	if (intel_display_ver(intel_get_drm_devid(drm_fd)) >= 9) {
>   		get_fill_crc(has_4tile ?
