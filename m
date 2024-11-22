Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A39D75E22
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 10:39:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C19310EB4C;
	Fri, 22 Nov 2024 10:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9GGCFNi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9BE10EB4C
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732271969; x=1763807969;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=BQa5eIq6igZ8ex01WtpK1G+V7VfO260koAKHZLV1C30=;
 b=I9GGCFNibGqRAtJykgJWccJEyB5phtRVpUgMFuItXJRctsinX3GPd8AA
 r8vZo7nTW925kfWg6v5sogsUYjb1cocKbbc9ItmsOdIht8Ph23pGXiEuG
 M7HbXdvWsgJbyzNnd8O1uG43oJnW5eEnXuoI97my82uPVfYiQohb8x36e
 p8LJ/TmAh3QmjjJzwH6PH6vPMKVP1B650CgGWdpAHvDDel0wRmJxjemrQ
 JTj4oTewJYiujDo2RVZJQHI1stQQqDZhbSuHVSI/a3LeEGdt4n1rKcb40
 0voypgI+Xm7DeFIXf+Bwa97hLkefPUt3CkXr1MXeu8naWz0yu8Twna3XR w==;
X-CSE-ConnectionGUID: wCKDGuIFRnKI41EUUnm0+Q==
X-CSE-MsgGUID: fZeEir1YRVCfMr+J8xCkDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43038723"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208,217";a="43038723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 02:39:29 -0800
X-CSE-ConnectionGUID: rJGey81sTXWxwHa2o1HT6w==
X-CSE-MsgGUID: oDFpTik5Qdi8C0UuDt4msg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208,217";a="95335612"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 02:39:28 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 02:39:28 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 02:39:28 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 02:39:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SosByXC4GBiIsx6/KrKCADRNg9Vs4ZhVcYMTIL2Lo9fk5cSnNbw3zCRhj0L8rFJF4Zk/KfOFd6ijbCGvNL0rM9GjIWXFfFo5BPeNCPPog2Z+FlLlEhM3RJlDvxlkfdNSNihIyVRgcg74e4tv0LXZVHXJVkTxYHD7OrXesDsTDU9jCKuv8D4ScxQpGNUBuZbITRCTAuVh60n3bJ+TQ6A3OlJEaeAQHaFKgNzoBZkGUPzIwIAPq8HuUnsubNIkCQ5Xs46i5o2C/D5zQ2FqEiyngPPS1zRRefGUqjhgOQ4ynOxfP06+g1C1BD45IRSSEf0wUkEfs+FGLGRVPO+V0eDniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyDHZz7ydTFUIkHpQFYvnI1Yjo2nRZOJ3+IbqCjSEYA=;
 b=jY9Sl4flPMLSIL02BMQR0EMkU4xro0c0iv7qw5LBIxtqhm8IWwBtn6ov7UjaWrZXkBG7Gkpxh4MhWFyBUzAwKuKGKeq5QeQZTUKFHZNqDsF2fibTYlozJo1bQxfzrrB6iub8yNTcdMIFBlTCQydno1PD2d74wQ8QvqhgmiAYnmF/EyPlrB1AWMZty7tWIw+c3wwZ8rgTWhjUfNhAk3ihWF04JHXerQj907UeR6stG9VfmlowCEmMVF8MGnjQXb0bAFAAwO/Jm8dGrUyXsLKLZLHkvz1e4tDpezg6gKKf2BtGoqesy6qjbmcS+dVx2OwoWzBCbk0R4+QZX8fCIumGJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by LV3PR11MB8694.namprd11.prod.outlook.com (2603:10b6:408:21b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 10:39:20 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 10:39:20 +0000
Content-Type: multipart/alternative;
 boundary="------------wSFp1UUlcFGq9AS4e04iWlsg"
Message-ID: <dd49b6a0-4039-4ea3-b34b-be1f10d25ecf@intel.com>
Date: Fri, 22 Nov 2024 11:39:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 3/4] tests/xe/xe_sriov_flr: Use SKIP for unmet
 subcheck prerequisites
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>, <michal.wajdeczko@intel.com>,
 <michal.winiarski@intel.com>, <narasimha.c.v@intel.com>,
 <piotr.piorkowski@intel.com>, <satyanarayana.k.v.p@intel.com>,
 <tomasz.lis@intel.com>
References: <20241121141851.631877-1-marcin.bernatowicz@linux.intel.com>
 <20241121141851.631877-4-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241121141851.631877-4-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: WA2P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::28) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|LV3PR11MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: f08009c9-9ca3-42fe-a01a-08dd0ae1ebfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFFlUFVDZWY2RjFNWmo3UWZrOElsQWdYVVRJdGllZWNNb1JYQlpXc0V5cWVj?=
 =?utf-8?B?OUtxWFh2RGFBV0IvYWpwa0E5WEc3TjNPcGlPRTVwWE43dXREdThWWGNieW1q?=
 =?utf-8?B?RW1PNlBxQUxVVVFlWHJwVWdtMjRlUE5YSXluL0VsK1dLSlR0K056bVZYNHp6?=
 =?utf-8?B?YVc0T0VHUDV4d2FuUFhvVjJZakJxd1MzdStLNzg3TUYzMHR2cDAxWDV1WUhF?=
 =?utf-8?B?MWlScnc4RXRLOHRVdjlJYm9FY0QyR1hBSzR0VzhoRkR6ejVoK3kzYnpSejFY?=
 =?utf-8?B?cXR4TE9PZFVLMkI0V1J4OGdRQUtKRkxwUHNxTmVzT0g3REhKN3UwRS9lKzh6?=
 =?utf-8?B?TzV3M2JvUjBkVFliNGtBWVFlRGN6Mk1DZEV1TndsNXlsV1ZqQ3MrOThtYWt1?=
 =?utf-8?B?VHY4eHVjZXJaK2tqRTNaSUsvMHBrR1ppcHFLZ2ZveXBOQzl1cWhVOUxJREJP?=
 =?utf-8?B?OEIrOGgydlAvUnN5Tlg1SmpGR21vdm9RYTFuOEZOWFFXNm03VGllQ0ZCMXpX?=
 =?utf-8?B?WGpId3MzdDYzQklLN0svQ2FwWkxkTEJJeE9CYWY5OFZTbnBaVHI2N2dNYVNx?=
 =?utf-8?B?OXB4aTNIdDFQZW9rNXdid1A4QnlpRzlxWG1UbkM4aXV1Z3dtZ2RaQmRDK3BV?=
 =?utf-8?B?ekNjK0NRMWYxTHVXbEY2NzF2cXY0U1FYRmxpZkFHVjV6bDdDbW9uTUNTeHRX?=
 =?utf-8?B?T2dDeHIzbFdmd3ZpSm9weWIzN2x3Ui9WVS9aeG83TXlkOEJBUTRCc0czcWVx?=
 =?utf-8?B?cWR1WkpUeS9tTGxMR1JKd2k5M0xUdTBKNW9iT01zTHJjRytLUHByamluSmVm?=
 =?utf-8?B?Q1dYOVNnZTdXa0FnRDhkQnFkQkhTNm5LYURXeFhNSFFsT2EzeUdTWTdraDht?=
 =?utf-8?B?STU5WXAxcU9maUFjMjVsU1EvNk5DeCszVm9zdzB1OHVuM0dRaTRpM3JZM2NH?=
 =?utf-8?B?Z2NwTEtCMkgra1JvUjRVU2VFRmE1TjY3d2YzQmc0a0dmOVFJTlluZG55d09l?=
 =?utf-8?B?Rm5hV09kY2wvc2lDOXNGM3cwbWxPZDBlUVFXek9keGx4ZVFVK1l1SllwZUxD?=
 =?utf-8?B?Q1d5N3MzUXdVZkxTM0JiWDROOEVwRSsvK2NuVzd5Tm9zVmlrdTYvdlRVOGR0?=
 =?utf-8?B?UDZhQzVFQnlOL3FOV3p2MFJnV0lNNkg0QUV5YWtEZkNPZmdvczBEQldiN2c0?=
 =?utf-8?B?M2NXaXFuc1RXZjhQSWwvL2RIdFBpWXRWMjdYbnB5ajBrQ0s5akt1ZDd3Q2Z4?=
 =?utf-8?B?OGFJMHZMZnRmVXhXZGhYcktOS0JYTUpvYTVhTzdhbXdPUHBaQkdNNDI1VWU4?=
 =?utf-8?B?cGpRZ3ZaM1Zvbms5SWpjT1J0Wm1WY2ZUQ2FNWkxGeWlTWWtRVDU1Mkk2NDZQ?=
 =?utf-8?B?QVBCWHV3OXdtYkJpYmxLVFM4Y2NraHlZM1pyTStuMkRUZ1dLOFdzMXVEQmFt?=
 =?utf-8?B?MFdUWVIwOWZkaEwvMVJDVXY5bWUzd2ZETDhaSFVRUDdKWHVCU1RreUd1L0t1?=
 =?utf-8?B?U09sbUZ5OGFTbWVZVnZIVXJoUDNMUTBDZlZvY2l1Z0ZtMDh0azQxU2cvVHJK?=
 =?utf-8?B?Nk9SZ0FLZlJzOVg1dkt1ZWg3V0RyeVFxVWFVM0dZZ1BBRHZvRVRZaDFQMUU4?=
 =?utf-8?B?ZzR2bGpuSzA4MXBsRUlNbkJ0SE5pK2NwR242M2FnTlpndkQ1TUlpNnBsWXpV?=
 =?utf-8?B?c2FieGZDZHpjbHdnRmlUclJ1UkJiaDJmNVFSU0xUNjVhdDdmUldjOTk0Zzln?=
 =?utf-8?Q?N8Pa5kJ5u7Rumgx79GtCjyfqGBxmHXLEE4qDTSl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjVTaElYT0dOOTczYWcvVmRNSDdXd1FTQllhUjdDdWlOdVlRaE5NR0RCNWd3?=
 =?utf-8?B?VUpWdTZ6R1I3TnZ3UWo0djEvaWZFdjFSYVFIZkJiOWFHWFNWY2xCcVF4TkVI?=
 =?utf-8?B?enR6WFo3UGJKT2ZwOVd4S0ZJVkhRZjFrZmcrUHNuck03VTRNSGhxVlZ2bkFk?=
 =?utf-8?B?MEszYkxaY1l0bW55OVFBZWw2MWF6WGJ3YlBvMXpBNzRkbjhmSlFvRlorZVZN?=
 =?utf-8?B?cEFqQ1BzSnNzVWorMWZXRkhCUzZZTzc2dW05TDhRTE8vY3ZOVDZrWFhXQ3lN?=
 =?utf-8?B?WTJhdE01M0U1dnhLSkJKUEsxQlpGaHQvVnl6SjlqVW9MUkV4YU9tMEoybEUw?=
 =?utf-8?B?ck92WHNpUGN0T1RtcWlTNUVZTkNBMzk3QVBpRmtTTmRPYW1LK1JMRWdzTm84?=
 =?utf-8?B?TmdNRWJXTnVDa2VXNmtVcHFSK1RJY2FwQUhGeWFRdlY1QVpRbDAxa3ZtOGo5?=
 =?utf-8?B?NFpaWk5WeWRrU3RyVzc3bzRPdnBudGowaERNcHZUd2xrOWhLNlgxY05ybHhV?=
 =?utf-8?B?VmNSZUpQajBXOHZYcXp5dzhCdzZNYm4wSG13ZkRHOXI3TkNnZFRnejhBOHRv?=
 =?utf-8?B?Yzh6TFdUTGFzUDJtWm9YZEc2MGVRSUJGZTYxT24ycy9WZ2F0Q0JuTG9FZTNq?=
 =?utf-8?B?R1c4RFZVK0xNMWxqR2YzRGdYNHozdnJSQWc1QXhGdWpNOWRXN09iTGVLcU5C?=
 =?utf-8?B?SUN4bTBHaGNKTWJOM29HKzMyeEhrL1g1NlNPd0lwUjdJU0Y2UVJrZnc2RWVF?=
 =?utf-8?B?WHZKbVlPVU5SdkszU2RxQzNuSVlnWlQxTGtNNWxxWVlFNVRZRVVoSVFVdTBG?=
 =?utf-8?B?dWRlWGVUZ05MSmozeWNtZkNXQnpCNnV1UXpMelA1UHh1VThjWUo5eWpjUGhn?=
 =?utf-8?B?cDRicTRJT212TmQ3ek5Tdkxtck5ReGxRL2czayt4bVBMN21WUWs5OC9GSGNH?=
 =?utf-8?B?NCtJRG5nbHNFMk96YldpYkZtY0M1WmF1NGFPNkc0OU9JWlE0a0k2YmJ2SGNN?=
 =?utf-8?B?VURTcmVOYU40bDVWTXI3Z243dGk3eENpRUlYdFlBZ0o0T2RjZ1d6OFBSNVhp?=
 =?utf-8?B?T0g3QmRQR2hiMUltOVJVNkN4Q2pYc2lrSjJMN04weTBKNWNkaTdQWFpsODgv?=
 =?utf-8?B?OG9Rdy80Y1k2c1pWMHJHLzdZQ0tpRjNRL012V29PSlFQOG9Fa0hzOGI4WFAv?=
 =?utf-8?B?UUUwRXpwUGdWT0pxY0kzdWpwYUxRVCtqTXAvdG16cHhOQTZIR2lvcU5XQ2hh?=
 =?utf-8?B?U2xucWNkNG10QnFScmtBemFaMVcrSS9hVFQySzg1WFpoUlI2U2ZqWm05K0NH?=
 =?utf-8?B?eWNES095TWNocklCelc0bVV3YS9ZQUFRLytYUnBFVi9paFkvdDJuVUFtN0JI?=
 =?utf-8?B?V2ZEYjA2WFBDTWoremppY2NZZUhSMGQ4aStEd0RWcmN5N1F3VEhOd2hRQ2NY?=
 =?utf-8?B?UTNzRFVpR0dXb2hTeXRXWVFhczFPVXFtNy9kbjJaRmFyU3BKZ1ltSWFDanJw?=
 =?utf-8?B?Y3NCOXFNOStsK21DVjZWcjdaQVp3ZVNXa3k4K0tCZTRPdngzOUxZQm9Xcjg5?=
 =?utf-8?B?QnF0b3hna2RiMTkrQnl6cXVpL3IyTEpVVDZOdFcrQURFb3I4eUFLclRzMUlC?=
 =?utf-8?B?Q1p6Q3JXRG1MZDBQRXdJSVM2dVZ6MkppTzRLWldFTSs5TXJYT01LRXhMQVlp?=
 =?utf-8?B?T3VSNHJZZTRBMDd3YS9qaEtLMEFKUmVXQStZK0hUUlRVNEUvaGdyZ3d5L3Zl?=
 =?utf-8?B?ZEdDUUwrVUp4QmJYdTI4OThydGFQMVdHTmJYV25YbEhpSUJkN3Z6OHBobk44?=
 =?utf-8?B?WE9jOTYvak5jR2JsL2Ewb1oxTlBEL0FnUFcxS0w3d1ppTGFvclhTYklyQlBS?=
 =?utf-8?B?eGFYd1JsYXlXSUtJczZWRWFyTmppZzlPQTJOSWI3RzJxaURoTzI0cUlJQThR?=
 =?utf-8?B?ZUJTOG9kSXR6YW1RNnZqMkNkd1VPRllDRmcrSXNaWmVZZHJkaU9nb095Y0dy?=
 =?utf-8?B?aE4zS2VUaW1RNCtDcGVkM0hMNzRyTGV4NEx0ZzRmSFZXUDFjYzJRbUdQQWRW?=
 =?utf-8?B?VzVIN1pna0F6dks1RU9OVHpPMUd6QTcyUXZZZmJBdDJCZldwWHMvbEtoT2U2?=
 =?utf-8?B?ZWtEWWVwY0JRR1YwUXRuSnU0VTVyMitBNWNZcFFTZHMvdlplY285NGJEWVdk?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f08009c9-9ca3-42fe-a01a-08dd0ae1ebfa
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 10:39:20.3352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3to6ZFBOWFdhTcgp68EObR3fg9Pyuk2UiEmpBm0Cxwy2Y6XINULANWK/1GlXcU2Nk5IfSEK5JI+uHSqtQU7og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8694
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

--------------wSFp1UUlcFGq9AS4e04iWlsg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 11/21/2024 15:18, Marcin Bernatowicz wrote:
> Handle missing prerequisites by marking subchecks as SKIP instead of FAIL.
> This avoids misleading results suggesting FLR issues when tests haven't
> started or conditions aren't met.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: C V Narasimha<narasimha.c.v@intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: K V P Satyanarayana<satyanarayana.k.v.p@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>
> ---
>   tests/intel/xe_sriov_flr.c | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 1049cffec..550d58bb9 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -393,7 +393,12 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>   		if (vf_id == 0)
>   			continue;
>   
> -		igt_assert(vf_id >= 1 && vf_id <= num_vfs);
> +		if (vf_id < 1 || vf_id > num_vfs) {
> +			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#lx-%#lx], num_vfs=%u\n",
> +					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
> +			free(ranges);
> +			return -1;
> +		}
>   
>   		if (gdata->pte_offsets[vf_id].end) {
>   			set_skip_reason(&gdata->base, "Duplicate GGTT PTE offset range for VF%u\n",
> @@ -410,7 +415,7 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>   
>   	for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
>   		if (!gdata->pte_offsets[vf_id].end) {
> -			set_fail_reason(&gdata->base,
> +			set_skip_reason(&gdata->base,
>   					"Failed to find VF%u provisioned GGTT PTE offset range\n",
>   					vf_id);
>   			return -1;
> @@ -440,7 +445,7 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
>   
>   		populate_ggtt_pte_offsets(gdata);
>   	} else {
> -		set_fail_reason(data, "xe_mmio is NULL\n");
> +		set_skip_reason(data, "xe_mmio is NULL\n");
>   	}
>   }
>   
> @@ -460,7 +465,7 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>   	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
>   		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
>   				 (uint8_t)vf_id, &pte)) {
> -			set_fail_reason(data,
> +			set_skip_reason(data,
>   					"Prepare VF%u failed, unexpected gpa: Read PTE: %#lx at offset: %#x\n",
>   					vf_id, pte, pte_offset);
>   			return;
> @@ -696,7 +701,7 @@ static void lmem_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>   
>   	if (!lmem_mmap_write_munmap(data->pf_fd, vf_id,
>   				    ldata->vf_lmem_size[vf_id], vf_id)) {
> -		set_fail_reason(data, "LMEM write failed on VF%u\n", vf_id);
> +		set_skip_reason(data, "LMEM write failed on VF%u\n", vf_id);
>   	}
>   }
>   
> @@ -758,12 +763,12 @@ static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>   		struct pci_device *pci_dev = __igt_device_get_pci_device(data->pf_fd, vf_id);
>   
>   		if (!pci_dev) {
> -			set_fail_reason(data, "No PCI device found for VF%u\n", vf_id);
> +			set_skip_reason(data, "No PCI device found for VF%u\n", vf_id);
>   			return;
>   		}
>   
>   		if (intel_register_access_init(&rdata->mmio[vf_id], pci_dev, false)) {
> -			set_fail_reason(data, "Failed to get access to VF%u MMIO\n", vf_id);
> +			set_skip_reason(data, "Failed to get access to VF%u MMIO\n", vf_id);
>   			return;
>   		}
>   	}
> @@ -773,7 +778,7 @@ static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>   
>   		intel_register_write(&rdata->mmio[vf_id], reg, vf_id);
>   		if (intel_register_read(&rdata->mmio[vf_id], reg) != vf_id) {
> -			set_fail_reason(data, "Registers write/read check failed on VF%u\n", vf_id);
> +			set_skip_reason(data, "Registers write/read check failed on VF%u\n", vf_id);
>   			return;
>   		}
>   	}


LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

--------------wSFp1UUlcFGq9AS4e04iWlsg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/21/2024 15:18, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241121141851.631877-4-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Handle missing prerequisites by marking subchecks as SKIP instead of FAIL.
This avoids misleading results suggesting FLR issues when tests haven't
started or conditions aren't met.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: C V Narasimha <a class="moz-txt-link-rfc2396E" href="mailto:narasimha.c.v@intel.com">&lt;narasimha.c.v@intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: K V P Satyanarayana <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Michał Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 tests/intel/xe_sriov_flr.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 1049cffec..550d58bb9 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -393,7 +393,12 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 		if (vf_id == 0)
 			continue;
 
-		igt_assert(vf_id &gt;= 1 &amp;&amp; vf_id &lt;= num_vfs);
+		if (vf_id &lt; 1 || vf_id &gt; num_vfs) {
+			set_skip_reason(&amp;gdata-&gt;base, &quot;Unexpected VF%u at range entry %u [%#lx-%#lx], num_vfs=%u\n&quot;,
+					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
+			free(ranges);
+			return -1;
+		}
 
 		if (gdata-&gt;pte_offsets[vf_id].end) {
 			set_skip_reason(&amp;gdata-&gt;base, &quot;Duplicate GGTT PTE offset range for VF%u\n&quot;,
@@ -410,7 +415,7 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 
 	for (int vf_id = 1; vf_id &lt;= num_vfs; ++vf_id)
 		if (!gdata-&gt;pte_offsets[vf_id].end) {
-			set_fail_reason(&amp;gdata-&gt;base,
+			set_skip_reason(&amp;gdata-&gt;base,
 					&quot;Failed to find VF%u provisioned GGTT PTE offset range\n&quot;,
 					vf_id);
 			return -1;
@@ -440,7 +445,7 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
 
 		populate_ggtt_pte_offsets(gdata);
 	} else {
-		set_fail_reason(data, &quot;xe_mmio is NULL\n&quot;);
+		set_skip_reason(data, &quot;xe_mmio is NULL\n&quot;);
 	}
 }
 
@@ -460,7 +465,7 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 	for_each_pte_offset(pte_offset, &amp;gdata-&gt;pte_offsets[vf_id]) {
 		if (!set_pte_gpa(&amp;gdata-&gt;ggtt, gdata-&gt;mmio, data-&gt;gt, pte_offset,
 				 (uint8_t)vf_id, &amp;pte)) {
-			set_fail_reason(data,
+			set_skip_reason(data,
 					&quot;Prepare VF%u failed, unexpected gpa: Read PTE: %#lx at offset: %#x\n&quot;,
 					vf_id, pte, pte_offset);
 			return;
@@ -696,7 +701,7 @@ static void lmem_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 
 	if (!lmem_mmap_write_munmap(data-&gt;pf_fd, vf_id,
 				    ldata-&gt;vf_lmem_size[vf_id], vf_id)) {
-		set_fail_reason(data, &quot;LMEM write failed on VF%u\n&quot;, vf_id);
+		set_skip_reason(data, &quot;LMEM write failed on VF%u\n&quot;, vf_id);
 	}
 }
 
@@ -758,12 +763,12 @@ static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 		struct pci_device *pci_dev = __igt_device_get_pci_device(data-&gt;pf_fd, vf_id);
 
 		if (!pci_dev) {
-			set_fail_reason(data, &quot;No PCI device found for VF%u\n&quot;, vf_id);
+			set_skip_reason(data, &quot;No PCI device found for VF%u\n&quot;, vf_id);
 			return;
 		}
 
 		if (intel_register_access_init(&amp;rdata-&gt;mmio[vf_id], pci_dev, false)) {
-			set_fail_reason(data, &quot;Failed to get access to VF%u MMIO\n&quot;, vf_id);
+			set_skip_reason(data, &quot;Failed to get access to VF%u MMIO\n&quot;, vf_id);
 			return;
 		}
 	}
@@ -773,7 +778,7 @@ static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 
 		intel_register_write(&amp;rdata-&gt;mmio[vf_id], reg, vf_id);
 		if (intel_register_read(&amp;rdata-&gt;mmio[vf_id], reg) != vf_id) {
-			set_fail_reason(data, &quot;Registers write/read check failed on VF%u\n&quot;, vf_id);
+			set_skip_reason(data, &quot;Registers write/read check failed on VF%u\n&quot;, vf_id);
 			return;
 		}
 	}</pre>
    </blockquote>
    <br>
    <br>
    LGTM,<br>
    Reviewed-by: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a><br>
    <br>
    <p><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------wSFp1UUlcFGq9AS4e04iWlsg--
