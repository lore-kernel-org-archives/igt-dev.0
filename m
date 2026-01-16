Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F7BD4A607
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 07:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4F710E068;
	Fri, 16 Jan 2026 07:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CkSMuJkL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D7F10E068
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jan 2026 07:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768546962; x=1800082962;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=vzEzhBXD2qNDYb3FMtrxQu4hx6ohxNUultVthuQRacM=;
 b=CkSMuJkLMx7/5Rx6kIyNkJKbLf0gXROJSV6T4/n8zclKvlYmRDEQQBbv
 i3D/IFZlNX+Ga+gciffIBdLVKWCOM8O797i6J3Qf3K4SuUslMtYy72DfV
 QEYnJufWTm8QDoxc6lQnMUt95Gr0xQV1JM6z59p7iZcLM9JMMEK6hXpun
 18sBMYXl/73yyHu2kC0tGPuXSamnBtk1VkybyGelclYBlKfy8XrBIRlv7
 aT1HcFlENuh6lS80bBNyb/aurOp1tlpVaOKIybzJNOCBhaiEZY3OtcyS2
 tEQ4JZj0QeyHCXORCOQ8ZgDy9MUwkwXN4bFCDO6McYexx6E2u24hpME3i Q==;
X-CSE-ConnectionGUID: qv3/CSyARkeqjuD9QPvrQw==
X-CSE-MsgGUID: vD5xVzW3T6agX7QRrHHbOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81308072"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="81308072"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 23:02:42 -0800
X-CSE-ConnectionGUID: RQ/J5Va+QQG+bi6/vD8zOw==
X-CSE-MsgGUID: 7yrPFEo/QJ22h6KNcUrMSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="205628120"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 23:02:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 23:02:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 23:02:40 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 23:02:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9YZMeUc9pKF6gyWOYclEdRN1mT5LqkEzB1vul/JzpgvGG00LBTRL7zbP1CJQgZM4Hq0I1tNitRzDUWqM0mS05n0tNWTxX/s8JZ+KepCNA0FXxNw9uCudPgqh6Utzsr83fcNvIyqgdtWGReSOQxQeHBJ2BZelaZCpmbTw4SdZkqSpW0FcDpdQtQDCEcMBoKH8wpERyFAr65rEr6PW04MuPlxbLJ5LCshLYhS0ZyPlh7K6COH5h1ZuqdWY+oGYXARxF2BVn/y9hX2EyOuhvxdQvp3jM5dT287SAR0CdoIlbWURfEpXGsZVHawEANkF5XdnZt1pBivoEP6/gre5350yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylM8cicWcAuzsmktoohYMZFr0uRsZjVDc6pSm7UXvMk=;
 b=ZUJvL+eFieluI3yPvbQrOz04kUS4kEs6Co96sK0TVsn6GLi2xGJktEQnOXfA1xdbcLWSTBEngSfkmMRxuLwZRnq88HEhrensxO4JUsxojlK9dN3o7tN1DkCAuaTjnUiJnQGtYpB59XlS+yLRGlRiyPo0oAPcQbb3bOgGdQRBRpcAPr4NJAMSIy4aVwD2WNC0AWjWGJnyZW7t1YSKJP4/B56Wf5AEpL7sLVs8X/P6K3NbtcacMw490kPl9Zvptwq+GEdXkttysphX5Fn/3TjrdWOxeU2z7Z1QPpS3TYY+umZfn7kDa1RNhO5nQZh6d8aSm1kAe4TGC4tcaS+Ruwy+kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ1PR11MB6276.namprd11.prod.outlook.com (2603:10b6:a03:455::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 07:02:37 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 07:02:37 +0000
Date: Fri, 16 Jan 2026 12:32:31 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 tests/intel/xe_exec_basic: Enable dynamic subtest (rev4)
Message-ID: <aWnih2NGPiqOcG0y@bvivekan-mob1>
References: <20260114065732.377106-2-balasubramani.vivekanandan@intel.com>
 <176841097453.153896.17782373302675900191@a3b018990fe9>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <176841097453.153896.17782373302675900191@a3b018990fe9>
X-ClientProxiedBy: MA5PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::7) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ1PR11MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 1408c2f4-2ce7-4179-4bb3-08de54cd3b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEtkNklnOEdPdkNBNkM4cEFrcFpXdnFBL1lVV3YxZHMvV05oU3NWT284RE01?=
 =?utf-8?B?bGUyRFd0aG44bzF4WUVvVi9lbmdNZVFJQUNMNTJmeWM4bmQ0RXZPQ3k5bDRT?=
 =?utf-8?B?QUVQdENyZVFuWWx1TEl5QjdrUDVqRVB6dFhZUEVhZzhKZHIyUkU5K3lzRDRH?=
 =?utf-8?B?dmFpMnlsVFl6cm81bkJOK0RyVWtQOU9mYitqRHZVMktFcFArOXFyd2gxSlFp?=
 =?utf-8?B?WVVWWjhaUEhDYlY2RHpDNSt5Vkp1emZWbmVQdmN5TUdNdEV2TXRyemFkOEYx?=
 =?utf-8?B?WFVHMis0SXBNdk9pNVlGSWt2anpKK1ZNNUNYUlQzaHhaK2dsQWFQRTFzNHJp?=
 =?utf-8?B?T0FnbGtyblNJVTZmV0xFS2FXb2d6NUZUb3BYS2c3OWprSWF2eXhqWENQNGhz?=
 =?utf-8?B?QUlUSG9sTHFqUWdkOXdDRXg1a2ZzUjBnZ0lJWUZzWnpjN3llQy81ZEkyVnJy?=
 =?utf-8?B?WWpHSDVmdW1RZmZCQWo5T0hmZGlNRUNNd0t3OVNvaHFRVmRZOVdyNDJzRlV1?=
 =?utf-8?B?NDN6ZjIxYW5oUVZGTUhiQ2JBNUpTeTFNNmpMSURPcmFRVW96ZDAzajlXcWdp?=
 =?utf-8?B?ZXFJOEhIWFVsWTJ3T1VKYk1uK1NuK1NoME5MK2t6N3grZldDTzdpLzBKV0gw?=
 =?utf-8?B?UHA2TW1mTFlpSWpxMjZvM004aTlLMEEzd29BUWUwRVk3V1pPdG4vSXdWL1FC?=
 =?utf-8?B?VGoybElMYmtOR2FyOVJ6bjcyYnNkeTNkUzdtam5qTWpQSThGUWI4ZGVPa0o1?=
 =?utf-8?B?RWs5QVJuNVRoOVNzVm5TTzZPTmFtRDc0dEpMUUQ4d1E3UkpueDVLZlQrMW5p?=
 =?utf-8?B?dDZRdU9DRlVnSWpxanZDN2hhMGFtTmRGaVhqQXo2TjJyY2JaUXNIVXVIUEhS?=
 =?utf-8?B?UzE0bHU5d3RuOXJGaytndExhdmdBa1V1VDNwU2lZa2d3c2NZLzJXOG5vVXRq?=
 =?utf-8?B?V1VCVGF6bGp1ajR0R210aUVwRjlZYkNZVUM1dGdlUEZNMFNjdlN6VkREREo3?=
 =?utf-8?B?RkZLR3I2RWM0MnRObkIreWVXZVJEVCsxamxtS2VqOHNNU0JRa1pyMEhvY0ll?=
 =?utf-8?B?MDFJTzIxa0o1RWpuNDRObml6bnNLNEJTeE9jdUsrMVdGQmxjTk0zbVRXa2tW?=
 =?utf-8?B?Sis0TE01cW94dDltVU9jOVN3QU5pTVNtNWtOMzVLMi9aVWs1QmxNT0FST0d2?=
 =?utf-8?B?WkNHUnladXNiWElJakpocWNvZzltWk5WejVNNDNQd3FZZm5QOEJvYis1Q0xB?=
 =?utf-8?B?cXlNUmNrRGk3Sjlrdm9IaVkxUUc5eGtEQ1JCZzRzekVFZ0FIUnhvbUdlYmZX?=
 =?utf-8?B?QmhYM0xoWkhUMDJ2anJ0Nm5GSEpDajlSMCtBMXNUL2doNUh5b21saEZWTlRN?=
 =?utf-8?B?NzBsclJySXJ1dlhERXJ4SlpHZ1gyVmYvSElRd1NjMGhuSUh3eWlkSE5YNy9q?=
 =?utf-8?B?UWl2MVFtNXpROVdlcjhHM2Z6ZkZoTVI3OTNYcGs3RHZKb1l4dzhITUVmUHRF?=
 =?utf-8?B?MzlkVENYTStWSGg2UzRIRHZLTzV3OUhZUDdZZFJBcVlzaHQwR24yVVV1dmJ0?=
 =?utf-8?B?bkFBemcvUk9rdWYyM2Z1L1BmQUpRYW5QaHZTL1Y1aldiOGcxKytlTkxMS09V?=
 =?utf-8?B?WjEvclk3QlRXN3B3YnVYSmRKODVMUlNBWmlGNEhINTM0ZlFHNFFtUXBSVWxv?=
 =?utf-8?B?Mm0zeE05SEU1blBYdXF4UTNJTzJFbU8rYldCNFJTaHd5NStKSXdtSzhIT2lV?=
 =?utf-8?B?NHV3SEIvNC92c003Q01BZnNYandqbVA4cUdoemJLSGY1bGFyMXdidjVObUdl?=
 =?utf-8?B?RnZtc0FNS2d6NHM4aFZlYmxLSVdBa3A1T3pGVDRMZERiT1hMa2orOUFkaGcx?=
 =?utf-8?B?ekM2NFhEVkdoeS9kRlBBdGtYTm13c1poUWdyZHRCL05Ka2I1S2tUL1BQLzJJ?=
 =?utf-8?B?eDYyQTFidm55eU83NDZOeXhMTzY1QllKaWp0WmpnYzBpcDVJbkVBQytDVzNB?=
 =?utf-8?B?YUtEQ1pWc0NqTjZoRVlFOHZjb1Z3cG1vM0tTQUl2ZjRLQVFXSnlMVWh6b0Jy?=
 =?utf-8?Q?BXcHns?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVFSMTN5MmdkVzdNaXh3US9TNG1vWFJsa3Q5b011aytrUDRYZU53ak5MaDM2?=
 =?utf-8?B?VkttUjJudUhKSVloWFRselNRekVUZHR5azlDbGdTVDh1YzlXN2xkV3J5OXpp?=
 =?utf-8?B?NStOUlBnQXJ4RFBIa1pCaXN4L3FGbUN2TlkzSEt1RGl2WVdtc29GZFRiUXlk?=
 =?utf-8?B?L2kyS3ZDSkZYczdNZUQwRlVWM2M5S0MvMHJtWFZ2S2Z5MStRcGdnZCtuK3pX?=
 =?utf-8?B?NkNseGt6MCtQVVVaV1lEaTB5ajd2T1UxK1NZYmcxaUJJbFV5SC9ZL2cvR0kr?=
 =?utf-8?B?cHhWeXRITG50RkFBUnQxNzdoR2lJMjM5ZU1BTEZ2eVpIRTRlV1ZwWVpRNlB1?=
 =?utf-8?B?YitIditQZmJaMXRRQytIek1lR3FvbjAyaGFHZXp6dHBocUtyT0FPNy9yWTdp?=
 =?utf-8?B?TjlXSlFTSFVDQW1LQVhUVXA3VkhhYjMrekxkQXRkMnI1eHYwL2Q5b2JJY1oz?=
 =?utf-8?B?MitKWENxSTY1R29WU2QzMjBFaFd5U0FmOFhqeG9Idnc5QUpFVFBEQUxiK1dh?=
 =?utf-8?B?aEZheGxPOWhKcUtGQTlUbmlpc0pxQWd6UlB2VjdWZDhJNzVaUXVFVGpheXln?=
 =?utf-8?B?N0R0czcwQU5odlN5Mys1eURJMGtzbVlQUlZlekxRQitoZm9SN1VIMFRWOHBI?=
 =?utf-8?B?YVhYeUc2M0NQN3VqVXN4SnhpY0dGeThMMFNRVlY0VUxpaGxPcDdKNm1kMjcr?=
 =?utf-8?B?R3MyYlVLWkF6QTJlM2Q5MDRMenVpNTVINmlMVXNabDBmMnBQd1Z0WjRXNVFl?=
 =?utf-8?B?Q2JYUGNGRFROTmhkNTlleTFPZEVvYkNUcnZwcUs3WEs0YS9xWU80T1BNME9p?=
 =?utf-8?B?cVhPV054dHNOdVNWQno4ZnBpTS9pY1NMMUkvVGZwdnJwMkt5OEx6QXptZzVT?=
 =?utf-8?B?d2UvbFNEVFVhNnc3cUtFdnBYR2dpTG1KMXZPY2tESGhCSi8zY0ZhNUtqRHhI?=
 =?utf-8?B?RWpZd29yTHEybEtuTmlHenhqcVdrRFF0TVFWdjFhdFJBR0dua2Q3QmhEejhU?=
 =?utf-8?B?bzdrWlcwYVJYcFNyN0MzbitiRy83MGJhOWllVS9sM1dMOHh3Zm45d0FRaGFx?=
 =?utf-8?B?TUljZk5RQTVDUm96WW82RWk5anVvZFRqRkE5d2QxZ1pXNktwOTYxWnFOTzd1?=
 =?utf-8?B?UzFjNUFvZ2lmMWlvdmIrNEM4bXFQY2tubGRtOWdDNjVIRWEwM2FWMWZreENG?=
 =?utf-8?B?WVhlcUQySkQ3bUtZTkRiWGVYTlQ3QUNDd1lJWEsrcW83SWN5aTY3UEcvZkRP?=
 =?utf-8?B?dmhlcEltMDF5eDl3ODBDeXN4Vkh4WUpaYTZERERpTXE5SGF0TTlJbDhuQ2tN?=
 =?utf-8?B?TWIvQUFRVDhoSm5YL0VSVmJvbHlxakFXT05LUHJOVzBuSmtPL3BRRzA2Q25S?=
 =?utf-8?B?d2paTUd6Zll1TmkwWkpOZVpsUHZKRDBPcys5QiszMGUzdGE1RnVOOEVyQ2Yy?=
 =?utf-8?B?Z1VoU0MrSHBLY0s4MG5lREVMRlZjcmcxbW5ZNFZ2OWRPd2xrL01tOHZqbmhG?=
 =?utf-8?B?VjZLMEJwN3oxZ1p6YTBoQ1c2L1Zvb0Z6bTNXcFE2MVMvU0MrWDc1RW4zMFlx?=
 =?utf-8?B?RkVPQ0l4K3ZIb04zU0pYZCtSaGE0dzdZdXNqOTBpdFFDcHU1VFdSNkMvbDQ4?=
 =?utf-8?B?YXZZRWRYV08vY2pWalpOYktscWMzZmp3aG00NXhYRDhNN3VKOFhHalhFT0Nq?=
 =?utf-8?B?RTRhUEFUOTB6dWkwYXdpalZoK1A0eGxKenJwei9laGl2UXVtZnlFbDhVM3VM?=
 =?utf-8?B?UVp3aThLQVlTalV6MStqYXllV1N0T0dRVTlFbW1BRGZNNnpuOTQ1cFV0SGcy?=
 =?utf-8?B?Tndnd3U2ZDdvcjFBclFQYnV6VlFhNXlQalV2R1pobXAreGVxeDJub201Wkc1?=
 =?utf-8?B?aWZGMnFseHhueUp6SEIvQU4vS3RGQlh3M2wwcFpJa1pKT0ErKytMRyttN01B?=
 =?utf-8?B?ZjdiQ1U4bk40K29EMDZDdmo5MHJQd1V5T09UdVdnR2dTajRsYjR5Y2NkTWZ0?=
 =?utf-8?B?cHV0RzJ2QVpHb1I1cEU1U2lJeWEreGtSVkZwaXM4OXl1RHg1TzJzZ3l3UHhi?=
 =?utf-8?B?TFZLeklIYUNvOVc1RXhHZDFSeUd1WHo5bE1ySUM4VEgxUVVUbFo1dGdwK0NU?=
 =?utf-8?B?L1hXRjdmUlNzTnlkTzhRM0ZhOGhVT0FoZ1o1bEltNDIwWG1HUi84a0tkWUto?=
 =?utf-8?B?QU14cG52UmUwZFBBcmN3NlVUa3BocTF0UTRIdTFUb0UzR2RVZVR1VERBYWR3?=
 =?utf-8?B?bUR0WUZwZmhhZHhwRHFka2xVZmx3SzhPOGh4cFc3azV1WXNyOEs0WFA4cjFP?=
 =?utf-8?B?REk2d0V0OWZteEcxdW1iWldSUndONUFsTUc3Y2pQRWFGdjRyTjNlUk1oek9W?=
 =?utf-8?Q?P2HKkhwP1BldNHAo7vIg2p0+i40C+EGP/Vu2j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1408c2f4-2ce7-4179-4bb3-08de54cd3b28
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 07:02:37.3713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKFuENhY0vRKxkiDjTskM6J3DL4E/pbsnSUBZtMXyCgqHz4r2jiJzZEP9U+Xwyq62WJPHFcmHVu5EfgYxq1UMQUBWW+R43bL3j31o72nTsIKfO70dYV6CX8v8btNfgK7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6276
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

On 14.01.2026 17:16, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_basic: Enable dynamic subtest (rev4)
> URL   : https://patchwork.freedesktop.org/series/159958/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8700_FULL -> XEIGTPW_14339_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14339_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14339_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14339_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14339/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3.html
> 
>   * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro-eocheck:
>     - shard-lnl:          [PASS][2] -> [DMESG-WARN][3] +2 other tests dmesg-warn
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8700/shard-lnl-8/igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro-eocheck.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14339/shard-lnl-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro-eocheck.html

Both these failures are not related to this patch. Patch only impacts
the xe_exec_basic IGT.

Regards,
Bala
