Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333ABCD3430
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 09:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D865810E9FD;
	Tue,  5 May 2026 09:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xl+qY+7T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C103410E9FD
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777971986; x=1809507986;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lD0k/mupfqIdw0glCmH+7M7xwJLIv6DNRWh5YC6E6tA=;
 b=Xl+qY+7T/7DxTRx7aG6jaiRGgIMe/HlbnbMZyofqeWgeyC/xWlLxryw6
 xxCrbShD8tDTSlTrMefZtWuR/r4LWnbxDQydk8sJ9wrhrHC93K40+jzS8
 Hq7c2SrO12uGcpyncLBtVAkxatklL/eu1JHJrpafHPLyKSfuwbKImjjnc
 sHiH8pGYxoKU05LfTTvg+ZOGgMe40A9AabC8Lkt96/kcxQ9yRXtRZIwXe
 lg382Ho7hurZfhgvq5c9S5Q8N9Lt7NN2urxHBgh0JUCygFpEp+aAmAoFB
 nf7LIQupeGt2K9zpsNjLXHkE21F7RIWmbMSnjpRbRo45Gq2vU34tGkQPf g==;
X-CSE-ConnectionGUID: tqmZkNkdTvCgWsTl4WgnpA==
X-CSE-MsgGUID: TIsbCvC2R9abkldOuDXv1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="90293463"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="90293463"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 02:06:26 -0700
X-CSE-ConnectionGUID: 1IEzHN26QVyfYg6AOTeMGQ==
X-CSE-MsgGUID: 6Jbqif33SWK02hNc6+/cng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="232617943"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 02:06:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 02:06:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 02:06:24 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 02:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noyGHnVsm4XXQ2OTa6weCJsSEJNoVNlt/29RRclu2AHIgj+2CnMWjlmlcZimacar7P/utXQ3qEJ3KhU5MrlC99uKmUqoEh0S26i+gI2B7v4OHIb2th/Z4jHSj70ZR5rbfNZ/V9ouSoss7UCizJFOEmp3uZ0+f4bwjp6x6wPg3j9c54NOeik9XgDM5RoCxrenR9Sjh0iQ+nRwhEKAg3I5oucB4Jsm/R2W31QpMKIfNWC6hvO/veBGW07Mp1cbWeFH8pVzukGqbnNewv3hbIz/tFrezi/Q9ZTenpK0/DRs2GjdqIX0StmVXoBYKGH71Y4nxRfahX3PaDf+QfH7ZndjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvkudLxpKvyp6yCxY0UM5euw0uBjUuNKoqcBUMTHkJs=;
 b=GU5zUz0JLXVkdnl4ItoXJvMIbm214+on3kyOw0k0EwZ3RnESlwh9eqZogauYso4xUAiJZyMMND7z8CKKME8ZJ5ziPfAaYtrTiXx6ASeZa8e0OHfKnAQg+zpagvpApiNZ6KJ4ZUZO3rZGhflIzSr6RdNupIuKDa4iycBXTIIgaWq/Q9bjAU/hVa5hHTqxY+FSlnr6JBK6qQzXI5edKZmXrUsgKxjcAkzyxlDIr1Yh2fep6WGyXxDjJDDA0uCB2MskJGwZXLp3cYZcr65hftSmW+baFxZHg2GNh9h6T6gcg8473RIQ6OKsCLT9rgqupCOfWOYqVAMHMi/UaM2kF4xfoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by IA0PR11MB7329.namprd11.prod.outlook.com
 (2603:10b6:208:437::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 09:06:16 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 09:06:16 +0000
Message-ID: <bccb577a-cba3-468e-8ddd-be72bfc82c16@intel.com>
Date: Tue, 5 May 2026 11:06:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/xe_gpgpu_fill: Add subtest with 4x4
 position for XE3P
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
References: <20260422191922.274036-4-zbigniew.kempczynski@intel.com>
 <20260422191922.274036-6-zbigniew.kempczynski@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260422191922.274036-6-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0014.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::13) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|IA0PR11MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf46241-9bcd-4c57-b063-08deaa859039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: G5NwxWBFnfBNg9pXZxoHYe/LWIMqHUnSnDiEvnb/mv9+tlkNCSJvDOv9FCFJN8XgW3HGMGzWvvt0RG5Tr+KOsn/1A1Nu4xFwClrw6bszel4BsMbyR7lDjbOhCI/MTTSUN994RxbDj/NGv8KUTV4Vueat7lBjci0ZBJk3AR+h1Q2mVQh0m47m96VxMhrKvjPR2CbSIimRy06H9m3lb4+FYeG9IqUCUBsV20yfMu9s75we1S70jMgrGLF+Xkyo6Zp72c8zqaSLAph/ExCbiRAkVDBBW3p6Pqz2D/fBeEu3aUh/d/0WhehozJlEvQhinCwCkh3nMe4QrGyUIAUlrMcK8WBwEpPp4CXU22DlvKr/XUX1MLeyg1Ew1S5jQ9EpPjhxK0Ni5U+4s7TWuQ3xPdk619k1LkMaCWDOQqojuZBiORST+y7vyQABTF0+Wdlzgmjtf2rTbl5Y22xNxdrbyWjsJ4ZwHiy9YG961ya/3iBu6wnmX+1paHVPmqG+kbok1niU0q5c/AKrYF3L7dlLie9cs/9zPHJj6r2ATwzHaXKUuyFKcTTWIA3OS9E1Wn5FwecUF5cqtqvj6rJDeKf1dhSWXL9YoSRn2RaySdoG1DCg7Clre59zI5ecLsD+4FQxoWRfOx8GpQ1I0cJRjYl1ODoMUEu0on0vxFOAFOkLzAn58W5pO+u7Q1xF15+unT0kdB5h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHV4YU5GN0kwNGFPMXZRbXBVVHFDbHluY29nTFhoWTBacHo4cDhZSWgyZWFs?=
 =?utf-8?B?Si9oZUdWc2JBcW5yNDdTcldlTlFPUElCbi9CR3kzUzlXQkxVYVNmbVdzemQ3?=
 =?utf-8?B?cVdwVldBM09TL2dUcU9qMGdoVTNGUU83VFFaZkJGZ3hXV0l5TTNZU2dwa0NB?=
 =?utf-8?B?Y05Ma3FkcVVDdjNGUGNVTnhrUkk4VWNyNGVWTkJSaDFUaTI3ZFJVakRwSmtB?=
 =?utf-8?B?TGpTNGJzUVpSSTlLYm5KQlcvR29uU2VjSnFrU0cxVnNDbTltWkVKU250WHJF?=
 =?utf-8?B?YXBkUytPcHMyZHVYZ29xRHVRaDBCVEc5QTRSRWx4cTZKbEJMUDQvYm4vZTBa?=
 =?utf-8?B?WVM4aDhuUVlqUWYvbFNGV3J6R1p5aUpDckc2VDBxc3IxOERKazc5cjRXUTZV?=
 =?utf-8?B?WElKY2hWcEUvRTNIRXdrRVpVRFhGeTJLT2ZQdTJFSTkvV1pHUllUenFqc0xO?=
 =?utf-8?B?U3ZjMWIveDh1U1crT0ZxU0tpS0l1aHF3Q1NnemNxdmxpME1PendzeVFIVFlj?=
 =?utf-8?B?S296NzQ3RlNVM3BReFZ1Q2NWZmIrUFBJMUt6WHNaTGJPREgzakEvMHpIOGwz?=
 =?utf-8?B?UFFxcnNLMTdKVzdqYjZSQ3YzQnhzRnNuYVdxM3VlQzZTTTZBMjh5cWdJRW5H?=
 =?utf-8?B?cEFWYWFLbDJlekswYmF6NTdIY3lWL0libDFkOHo2MWlqRFQ3bkp1dlNtTVgr?=
 =?utf-8?B?Y05sQytiTTZpUVlsMVcyYlNQUnNlZEJvcFRWNWZZSjJtSDN2SitrYjhjSmRU?=
 =?utf-8?B?TXBlUEZYemZ5aStWTTlVK1B5V2VqaFBOWW5SdUF0a2J3RDB6N0NHNk9yQTF1?=
 =?utf-8?B?aUJHOEZxZ3BjbGtreUhGdllsbEk1NzRIdlhNYS9WZy9FTkcyZTU0TzlMSkpv?=
 =?utf-8?B?dnZ1V0t1QU1VK3hIR204N1NpODBKb2NHSlE5M2pXdHRWajJVOHQ1TEhvN3JR?=
 =?utf-8?B?ZGJ2NGNnQ0k2TDJFcTJTWVBIbzBOaUEwRXZEU0YwWGhRUFo4Ym0rczU2ZDUz?=
 =?utf-8?B?Wi84bWx3REpHcUQ3S2djbFowU3JLQTlkc08zZWNrUFlEZWZYclQyWVdYaTNo?=
 =?utf-8?B?c0haR0xidXBMbVFSYm1qcDdrRXNPdjFwa3A4RURVcnI1eDhRWno2QWVUUUUy?=
 =?utf-8?B?VjF4VVFZbUU3bGtCRHZ0T3YzaytmdjNoT2tMZlR3V0VUa0JzSFlHVDltSVFP?=
 =?utf-8?B?SFpLM3JyMjNUREpCUUhxVGMwKzVveVRObitIa0JUVjhpaGI3QWVSNDkrN3lU?=
 =?utf-8?B?cjU4cU0wZjEzZ01vdDdISzU1YTJlZmdiYS9SQ2JIb0xRM0hQTFExTmRVSUgz?=
 =?utf-8?B?QlhCTjhHbWJaYzNPTHRUdlBBbGxNVkZUMCtmREo1dW9qTUowd3dVdkl1cHNK?=
 =?utf-8?B?eWIvQkozWU1nSmNUOEM1RnhCM0ltdFd2SlpwOFRnelpPQjJTL1BHTzhjQmY3?=
 =?utf-8?B?ODF4ejQ5MWdzaVA4Q01zTG5UK1VsVGd5RmRoSnFCMFoyUjJ0ZEdxYVZHY24r?=
 =?utf-8?B?RE1HOGFZMXV2T1AvZW9hQ0dQdmtFTU10V1l2OUEydDJselNkYThYQVhObW9y?=
 =?utf-8?B?VCtsUXJGWU9kYnZZOUs2cTFpcDhDUXdCZTBCVVZaMVh3d0NOTmYyd1U2QVlv?=
 =?utf-8?B?V05NQkp1Q2VVWnpXTGFyNDkxTTNiU0xDZVRrWnhmMTA5bnJIZnJtVmhrZ1g2?=
 =?utf-8?B?MExGWXpMQzFhSFgwelRnY1FTbjl3SlVSNVVKZUtoYVRHY3Fqek1MQllrZWFD?=
 =?utf-8?B?b2FYcU9nMDM0aktRcXpQVHBJamhpR3l6bHRYTDA2cnN0RzB6MUFCcStjOVNT?=
 =?utf-8?B?RmNSOG82aENBY2NmUmprbmNIRUlPYTBzNnk2TTJBWGdUcjc5eEJPdUVjZXYr?=
 =?utf-8?B?L0Y3Ylg4b3NpM0VzVHhLTm5meHZnd3hPcEtrbEtOc24ra1ZNd3RMWWVYbWdU?=
 =?utf-8?B?VnFSdXQ5QW5xdGJhNnJuN2x5ZG1WOTkzWlZLVjNSREYrcitDK1pjOFFnSGFw?=
 =?utf-8?B?TnlEaUYyWHdTUUpxd3NwTitqZTM2bnY4MkVZYmk5M0FPb3FDSjNmdmUrcTVN?=
 =?utf-8?B?S0xnU2tEbGhpMW9UVmtadEFqeUtLQzdYWUtHZW16S2VSaGFLblBGalpJLzBO?=
 =?utf-8?B?b3JqckNYeFZHOXlVbUlINVJ0NUl0VVROMmF1Nzl4dnFyRTB3UDk3Ym94dHVJ?=
 =?utf-8?B?NDJzWjJYN3ZHQkNkNlRieUlFa3hOelpYdG1MMWU2d1BacDhUeFJrVUlOWDlP?=
 =?utf-8?B?ejhZaVNKSklJdURsbmh6ajZSSzI3QW1vSVNtc2ZFRTR0VmdpWEVHV1hNdkdp?=
 =?utf-8?B?enJqd3NzMDZKNS80Q081dGxwV21Pem1KaVQ4RlVLdjlmQi82d3N0dz09?=
X-Exchange-RoutingPolicyChecked: BVx0FgYdFs1ugPzFHJtri9qK5SP0tLzf42w8nQzq5qewqVPSSTW4vBeoV9Kb8Fs2qMZs6eRG8byTgKkqhrnWvFKTPKiah0jMbuL8laEhel0SNBSGjv3IG9EirZNgCr1NJ0IYBfcojcPaSlQ9Vi+Jfh57tVRfIFz+1CRWHRVQUboNqQv30sfeSt85GrEraoX+ZiUW8jhDpzKQbY8J733+lqyoNU8X+ZQWFm0i5Bti6ezEnNaBUOK8O2Rg2FqhlI0oReARduOGtmI729dISidm5Hq30r2N7iLgCxUYaLSkHFPXhP4joWSLPfG9AZmMJMPY/W+UUwJIsAiQbgBYIoWEHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf46241-9bcd-4c57-b063-08deaa859039
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 09:06:16.4135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4WfmqfF8sR2HXqGXTaRZQDwG9weLh3r4Pi9E3Flszvtd5GGs12o5Zlu4gLa5csCvHHaTjaxnClqox70scL81A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
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

W dniu 22.04.2026 o 21:19, Zbigniew KempczyÅski pisze:
> Gpgpu pipeline for XE3P allows passing x which is multiplied of 4
> (y may be incremented by 1). Exercise this is working properly
> on platforms like NVLP and CRI.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   tests/intel/xe_gpgpu_fill.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/tests/intel/xe_gpgpu_fill.c b/tests/intel/xe_gpgpu_fill.c
> index ce6222ddd7..9ab8b51e78 100644
> --- a/tests/intel/xe_gpgpu_fill.c
> +++ b/tests/intel/xe_gpgpu_fill.c
> @@ -91,6 +91,8 @@ static void buf_check(uint8_t *ptr, int width, int x, int y, uint8_t color)
>    * SUBTEST: offset-16x16
>    * Description: run gpgpu fill with <x,y> start position == <16,16>
>    *
> + * SUBTEST: offset-4x4
> + * Description: run gpgpu fillwith <x,y> start position == <4,4>
>    */
>   
>   static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region,
> @@ -201,6 +203,15 @@ int igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
>   			   surfheight / 2);
>   	}
>   
> +	igt_subtest("offset-4x4") {
> +		igt_require(intel_graphics_ver(data.devid) >= IP_VER(35, 0));
> +		gpgpu_fill(&data, fill_fn, 0,
> +			   surfwidth, surfheight,
> +			   4, 4,
> +			   surfwidth / 2,
> +			   surfheight / 2);
> +	}
> +
>   	igt_fixture() {
>   		buf_ops_destroy(data.bops);
>   		drm_close_driver(data.drm_fd);

