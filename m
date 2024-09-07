Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46001E71080
	for <igt-dev@archiver.kernel.org>; Sat,  7 Sep 2024 11:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE8C10E205;
	Sat,  7 Sep 2024 11:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvxDZV4I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D8E10E205
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Sep 2024 11:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725709172; x=1757245172;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qyq8DhQ0HgTWO5vV9YrU8ooeFmvJ64/M4RG9rtl52a8=;
 b=fvxDZV4I6p/jKQBd1IPKccsoZDwMkkdrdpoupDwNlhOE2T4jmzv3eZf4
 PwCMxyWqp5niCMtxzlP+L4jEellpx4ajomWpqCtXe7P9oHeqP3CXmNBdj
 zDFGLDHg2HYmaB6Jhv7AP6OQdpDuXYBEkrkmq/UaKun6YmZ0Hg7lpP85c
 z96YBo7J7B73Svqm3+lwRj5g8JwL57nMCgtOxFFVe2eDJUpMdYCiJ8yRw
 PwmuCCcpm922gc7B8Ji6wFlSkhfF+suhahSb4n/l1gLhfG9xzG8ee39MR
 szbc2qlqteQrcURD763G4DChOhSA8SdYSHXaXOnvw5+8ERgd4t/zhDPor w==;
X-CSE-ConnectionGUID: SyzxhbkIQKWuFb3QjYC2/w==
X-CSE-MsgGUID: X+pbou9yQIKOjqrGMh6Pkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28339822"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="28339822"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2024 04:39:31 -0700
X-CSE-ConnectionGUID: cpvkQ+o9SVmONkqMzuLc9Q==
X-CSE-MsgGUID: T4GC69j2RSOLQu56gE/ymA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="66184333"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2024 04:39:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 04:39:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 04:39:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 7 Sep 2024 04:39:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 7 Sep 2024 04:39:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmNERwoExg8/vxyczDNk69f932gFUAYjG9YUi7yFQgjj0OZ5sq1wrcLXH7BVCPXjqYWYQ6hix7a3g7DqbvAHI2Htx5FimdhZivSrrqINU31hKkJmUZ5PsFfB7rHAhVQ50aCLaFRt2rpc5Oekuu+CPszH+JST5Aq3YJJD1wec3hBseYTmAhwI529614J1lrgoB1ih+iAB6nquarTPTASe2mDWs2a4FAG0O34KQE8MJFAHl+RrFP0QgcepyDpJQC8U7dKb5CiUsaCxlRiPEsDJaZ1W4J3nEV9VJQtPbBdMQi05hbKwJlNyxFanV9mCfdIWvFH8S27/wZEF3BRlK+cazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1w1ST7q8cvJhB70slS+CqVV0GKzJMvZcQtaA1ECCILM=;
 b=j0cmuPRyIOlmKNr9z8XfH7RGAzXEdho7OoZt910TBLBaeBb0HG2hEXzo/DSJmLZ9rkgjkhnd/5pXe0RTiwurXiPYSy0eWqA3dSIxWONMYV7V9WsWO0q80ZgsU9GerNrKa8tHsy1zEAX43wbn8QIbPQYUcacuO4CPenNRmwmM+AsBE0eRTxGGeNZ2oI92yXP4XqOfCS3m810NDNaenws7lCPECAhFgnUhW06vsXGtJ21J1kcxVGWodnMtrMFqcnh3e/7QNq9ODxCA7P5Cjw/8YU/78HE+KI+rNl3a7vBzMhXjtYmtqJRdwbFqmKLrT+nBmYFXpP5VRwlUCNpz3roN4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Sat, 7 Sep
 2024 11:39:27 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7939.017; Sat, 7 Sep 2024
 11:39:27 +0000
Message-ID: <d59e40be-ae35-485a-9f59-89fd7d32c689@intel.com>
Date: Sat, 7 Sep 2024 17:09:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/igt_psr: Add mechanism to check sink status
 as well
To: <igt-dev@lists.freedesktop.org>
References: <20240701051301.3344927-1-jouni.hogander@intel.com>
 <20240701051301.3344927-2-jouni.hogander@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <20240701051301.3344927-2-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::35) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 5250b016-708c-47bf-1bd8-08dccf31ba58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1B3Nko2amNNZkVKQnpHTmlhci9Oc2ZJdm9DQ0hURTlVUG9DdG4yNE5zWXln?=
 =?utf-8?B?USsxMG9wN0RPR0FudWs0ZnoyYzVDMVZ1K0VPdmlZd0FDSzZEOHB0Q054eW85?=
 =?utf-8?B?bi9ZNW1QRUdGL1o4dWN1aGNJa1F0eTMyaDlCTmRSaFdHWkw0Vml1OWpUOG1l?=
 =?utf-8?B?VkdiU3pxL0dLMm02NGE3aU1YMGoyOUpjMDZKL3c1amIrdm1KR2haUTRsMlNw?=
 =?utf-8?B?WGVVd0x3RC9kelZrR0lRbUR5a2kyVUwyejI3bWZUb012dFJLSFRQN25UTDZm?=
 =?utf-8?B?VWV5WXVmcU1VZkViS3ZmRWFCRW9ndjh5V3VYSlN5U2c2MnNHU0ZLK2JFMDVE?=
 =?utf-8?B?RkErdDlaMWU0NmNOSTFvNUJuOC9NZk1FQk1sWi9BZERwS0VoZUhZdVNXV0gx?=
 =?utf-8?B?dUc0UkIrQlFDTis5VGJSeWFWcE1qRGM1ODNIeldEWlpCS2VsN0xOcUdLYVhv?=
 =?utf-8?B?dXRkUTNiRnBBVjI4MWkvQWFocXJyd2tOdjlwZzNXaDZJdDhiWnRFWTc4ek5Z?=
 =?utf-8?B?MEUyZmlvNGhmd3piamdBU2VqR3psV1BJWjMrRDNUUENiZHNGYTdVZm5mb0hk?=
 =?utf-8?B?M2hoSnZVd2YySUxxRGdLMTFTeDlYcTV6RFpMaFgrS3JKY2ZoLzNaRUVDYVdz?=
 =?utf-8?B?amRkUzNNZ3BFRERxZDBaRVU3U0gyRjJpUEpiSm14U3hOWFFBY0N1OFZ3MldD?=
 =?utf-8?B?ckJGSDArMlo1SWtjN2p5S1hTS05GM0xld3hMNjBWLy8zcEhSRE1nb0pCU3FR?=
 =?utf-8?B?cU5JRnJtMXhaZWFrMWppelNrSXRrUUcvSHdhMVM2OXhieCtJa1NFTG9iTk1R?=
 =?utf-8?B?K0VuMDFhWm5RS0pRNUErL280UjBCbW5EQkkwcmxFekdjUDA0b3MwWlRIOXUz?=
 =?utf-8?B?ajVXVFZtRXU0SmVCdSs2UGJWa1VITWtKTnFDRFNsWEVHTWszclkxNDJPaUZH?=
 =?utf-8?B?RFBNSXR0VVZxdjRDQWl3SUVwUDFOc25JZUJhN1BtM0lFVTArVGYrajdvUTg3?=
 =?utf-8?B?d1J0bGpIb3JrWjlGT0tRMktkTzF5Uk5va0U3NXZtc3JIZ1VieEx5RU5zQ3F4?=
 =?utf-8?B?eW84K3BWNTNHdWk3UzJnaWk5a05jVFhQNDQ1UmJPTFRYQ1NMYzlKbEhraUtS?=
 =?utf-8?B?Y2dQVFErakM0eTlubUdqdC8wVXV5bXpnMG4yMTUvblJIaGgxT0ZTcVJ1MG1H?=
 =?utf-8?B?TzIrMGNuM0Nlb3VabjRZZWYyclNLOFhmMm5wOHZNY2NlNmZBdlhVbkZHMmF0?=
 =?utf-8?B?d0R0d0V5eWZQc3RGVW9HTndnNkE0VkxvNG5KUTNMaUcxM1R6aXNwbHM5ckxu?=
 =?utf-8?B?ZnhxTXg0VXh2b0l6STZQN1c1Nk16T043VDNjZi9GZkM1VEs2azVPQnRMNGpn?=
 =?utf-8?B?UktIUG5BcEJHR0pybTFIVTl1a2g2YTBtWEpOMk5GemxkUloxNXVRTStKUlJT?=
 =?utf-8?B?N0ZkQzNkN3hQTFhNd3lTOGVGL1R5dExTbW84aXRScXZnaFZEcFFjOGg3TnBh?=
 =?utf-8?B?b2FDYXB0Y0x6dUVGM3IyVjdFNWJTYkJld3dYb3g0WHFwKzZIdyt1VVZRbnVh?=
 =?utf-8?B?RERrN3VCMGlzUnAwdE5Ed1hkaFYyQnVQMDJ6WUMrak02NnBuRUMwSVJQSmxW?=
 =?utf-8?B?VzREeVBQZkJCSS9hUm0rMzcvYWpFV1VGNE5MQS9zZnVTbzBKb0NuUUV0MVlq?=
 =?utf-8?B?YVpTc0xQUGRxcC9VZ0h1aDRwYS9SblkvQkZ4c2R5aDZSRFE1U3ZXOFFmWml6?=
 =?utf-8?B?NWdjYTVhOVp5ZEcvWkxrTkRmRE55ZWhaYXFyMUw1UUZwcjhTc2l3c0k0b2FZ?=
 =?utf-8?B?U3BrVGpUcnhhQ1pJcTlrUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk1udjQ2N0d0K1dFV0ViSzZQVlFPWkJuNks3M3lYOGNXYWlFTU1JWmZraWZH?=
 =?utf-8?B?QXhhbDd3QjY5dURLemorNzRoeVZUK2pNOVVmSVU4OVM5VmQvRVlUZzBXRlFS?=
 =?utf-8?B?bGJGMWtwVWRGb201eEU5ajQ2bmgvc2o0Ky92dmdnVndmd0xKSitrUURnM3Qx?=
 =?utf-8?B?YTFIMkFXcnpPMS9JZDFLcXFidVpCSjl4c20rYXlwYzVaeEZpM2xoUnBzdDlV?=
 =?utf-8?B?RjlKTEhnczd1dlpYbTdsc2p6WW9hdlpUbEFNVUhxVUF3SVRoVjZ4Wm43Zktm?=
 =?utf-8?B?YUdCQUV5NVYzb1ZGZEQ4ODVFaCtkL2VvbFo5amIwbnJpcjZBeXhWcWdmaDRy?=
 =?utf-8?B?QjVpTjlyS01DcWtCNlZ6UzdoZkczd2NhUFVlZEJaK1ZlWjk0dWlRa1MrNE9m?=
 =?utf-8?B?Z1lWcCsyM1ZPUmE1UGZlbXFjTHZvSDUyVUdRbXF5dkRvU0FYMkNiZ1lDeVV0?=
 =?utf-8?B?cDBQQUJoWjZKSVVoZGd2dkhWZlhFRTJNRVN1ZmN0U3BTTVZlTnZ2eFRoc0JD?=
 =?utf-8?B?anlFTUY3bktmT0I2cnQxZ0J5OXBHSFgyMTczSHpEWENuQllGamdIbWFvWFBH?=
 =?utf-8?B?aEQwTXRtazRKSExGRFVkOGNoLzVTVEpQQ1ZjbEhSaEhJMEZhVzdZaUsyNzNy?=
 =?utf-8?B?d2orV3QyUldueFE2S3kxeHlOWFpHUTRHaXI4NzROMXZodUpRQ1dqNGthYmsy?=
 =?utf-8?B?OVpIR2c4VVR1R3RHQmppdHVJUk5tL2VuZkJLUTJndlRuNnBIUnFiMWg2NjBG?=
 =?utf-8?B?VGNXaEMrcFFsNEJEdlI2Y01NWGRtZS95dDJmRGhqVnFTeEhEZ1NON0tEK05W?=
 =?utf-8?B?ajI2SzArNmtaT2NkeGkyY2JTZEdjV3RRTmNvdEwrcDdFcm53QVNQSW50aUIr?=
 =?utf-8?B?RHBsOURENjA0c3hwaWxCalNMY0taMllyVjJrS0NXMDVYeG5qVEdNMXA3b3Zk?=
 =?utf-8?B?ZTFuay93SDh3NVpDcXVWaVlNRlpyRVh1QmlSYzlOZGVOditBWGFvVm4wbW1M?=
 =?utf-8?B?V0hTMWpFcmlYWC85ditTSkZwT3lBcWZuQ1V2Y1NjVUIwWXJmOWFkeTZ3UVVk?=
 =?utf-8?B?SHBWVlBvWGV1QUlndXhDZXRNeUtuMDBlaWNJNHh4bE1NNU8ycGRNRnRUc2lG?=
 =?utf-8?B?YTRUaFdpdjB4d2F5ZGcvZnRWZjVqcSsvbEIwUDUxRkxxcHFnbmk4ckN5ZkFa?=
 =?utf-8?B?aW1PSGNjSGJxN1FDdXpOOHNZd0FLTG8wTDRFNm10YmQxeWZLMnd5T0RNd3ZJ?=
 =?utf-8?B?c294K2FxSDZ3enUyVzRkQi81bnZNZ0JEQVBCcWhkcGFlcEtRM0JFRGlZd08r?=
 =?utf-8?B?VVNoU2pNRkl4cDFvbDhHaFdoZElmc0V6SE91QWQ4dDdiRThMdUlCaGE2UUJp?=
 =?utf-8?B?YzJmN1JvNzlFZ2JaQkZZTWJPd2xPb2YwRzFkQ3lLbjJyMU9FVWdCMTV2NUh1?=
 =?utf-8?B?bzE3dTdPbzNBcUxJZVNMczZJSDRJZzBublRNUzdqVGVhQ1FlMG5oR29JMFVt?=
 =?utf-8?B?cElhMXZuaXJ2TzlkdVZxYTRFaytZR2wrZ2NVcGplSTY4UWhvcGFkSU1tYzVE?=
 =?utf-8?B?dnVCUHZDQ2htOHFLbFdhRDBuUXpxSS9seHZ1ZTZJVm1lVzIyb0J1OFI2aC81?=
 =?utf-8?B?Y1lONmJJZ3F0b3Bmb2c1T21jejJTTzRJWEU3ZkoyK1BONWZoajdwNTdyS2ow?=
 =?utf-8?B?ZUMzVzlnUkxiakUzeG94NGJlY2Nnc3lRT3VaVWxFeEwvMlZsLzhOM2VwWlRk?=
 =?utf-8?B?T2dZeUtJN0dZanA3U0hvYVNWTVJkUVIrUVdWU1VzR21LbUxLb3FmUjFMelNO?=
 =?utf-8?B?cllqYU9ESHd2eGNMSHA5ZnkxbTRJbjlZOERsOTZFWGpoT3IzcjZIZGhUUitL?=
 =?utf-8?B?Vmp5Vjh1TktJcVVjU1lsTWVHZUpUcGNBMGR3NFBJOVFNaXh1Z0VRS0wzYUVO?=
 =?utf-8?B?WjRZM053RTk0amtUN1Y3YmptQlMza21Ld2txQ2huZkhuVTZJWlc3NDdUWlNr?=
 =?utf-8?B?U2RnQ01EWlFiZVMxVmdBVjM4V0lUN0NFTFNTUEZOdGRUNXdnbTdYdzNQWldE?=
 =?utf-8?B?UitvSk1ZVnJYbnUzMXFxWk42dGxReU4wVmljTkVYNzJkZVNaR2QvdE1WTFBl?=
 =?utf-8?B?Tjk1bGRaVnZTb2FNdlRQbEJmdFlkU2wzK2kyaHRsZncreTF6KzFLdkRYWVBk?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5250b016-708c-47bf-1bd8-08dccf31ba58
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 11:39:27.0197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcUuBm2EafdhBcgokEIWMCBQP6bg/0j3u4/eRLHadXZtb0kHDX3K40cJGz3Tn8MKCRHEDfUMJ2hdLDYnNr7A/gLsY9yDHjZdZQUn9nXZVtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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



On 7/1/2024 10:42 AM, Jouni Högander wrote:
> We have seen passing PSR testcases even though panel is not even aware of
> PSR being used. This can happen because we currently not checking sink PSR
> statuses at all. Also sink might have detected errors but our testcase
> currently don't care about that.
> 
> Help the gap described above by adding new interface to check sink error
> statuses. Also add sink status check to be part of psr_is_active check.
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   lib/igt_psr.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>   lib/igt_psr.h |  1 +
>   2 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index e3e7577eb..47517b5dc 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -52,6 +52,19 @@ bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
>   
>   	return strstr(buf, "PSR2 selective fetch: enabled");
>   }
> +static bool psr_active_sink_check(int debugfs_fd, igt_output_t *output)
> +{
> +	char debugfs_file[128] = {0};
> +	char buf[PSR_STATUS_MAX_LEN];
> +	int ret;
> +
> +	sprintf(debugfs_file, "%s/i915_psr_sink_status", output->name);
> +	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
> +				      sizeof(buf));
> +	igt_assert_f(ret >= 1, "Failed to read sink status\n");
> +
> +	return strstr(buf, "0x2 [active, display from RFB]");
> +}
>   
>   /*
>    * Checks if Early Transport is enabled in PSR status by reading the debugfs.
> @@ -72,6 +85,7 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
>   	char buf[PSR_STATUS_MAX_LEN];
>   	drmModeConnector *c;
>   	const char *state;
> +	bool active;
>   	int ret;
>   
>   	if (mode == PR_MODE || mode == PR_MODE_SEL_FETCH) {
> @@ -100,7 +114,11 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
>   
>   	igt_skip_on(strstr(buf, "PSR sink not reliable: yes"));
>   
> -	return strstr(buf, state);
> +	active = strstr(buf, state);
> +	if (active && output)
> +		active = psr_active_sink_check(debugfs_fd, output);
> +
> +	return active;
>   }
>   
>   /*
> @@ -297,6 +315,38 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
>   	}
>   }
>   
> +/**
> + * psr_sink_error_check
> + * Check and assert on PSR errors detected by panel
> + *
> + * Returns:
> + * None
> + */
> +void psr_sink_error_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
> +{
> +	char *line;
> +	char debugfs_file[128] = {0};
> +	char buf[PSR_STATUS_MAX_LEN];
> +	int ret;
> +
> +	sprintf(debugfs_file, "%s/i915_psr_sink_status", output->name);
> +	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
> +				      sizeof(buf));
> +	igt_assert_f(ret >= 1, "Failed to read sink status\n");
> +
> +	line = strstr(buf, "error status: 0x0");
> +
> +	/*
> +	 * On certain PSR1 panels we are seeing "PSR VSC SDP
> +	 * uncorrectable error" bit set even it is applicable for PSR1
> +	 * only
> +	 */
> +	if (!line && mode == PSR_MODE_1)
> +		line = strstr(buf, "Sink PSR error status: 0x4");
> +
> +	igt_assert_f(line, "Sink detected PSR error(s):\n%s\n", buf);
> +}
LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> +
>   #define PSR2_SU_BLOCK_STR_LOOKUP "PSR2 SU blocks:\n0\t"
>   
>   /* Return the the last or last but one su blocks */
> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> index a7ebd0739..7639f8d46 100644
> --- a/lib/igt_psr.h
> +++ b/lib/igt_psr.h
> @@ -56,6 +56,7 @@ bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *outp
>   bool psr_enable(int device, int debugfs_fd, enum psr_mode, igt_output_t *output);
>   bool psr_disable(int device, int debugfs_fd, igt_output_t *output);
>   bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output_t *output);
> +void psr_sink_error_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
>   bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
>   void psr_print_debugfs(int debugfs_fd);
>   enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output);

