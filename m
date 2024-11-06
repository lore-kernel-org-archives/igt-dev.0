Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D850D44D46
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 10:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED68C10E62F;
	Wed,  6 Nov 2024 10:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/V39u2y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB1210E62F
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 10:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730890462; x=1762426462;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LZZA2dS91MBMQdmdfpZ9ib+ZUJ8fYKAViClxfIkI5GM=;
 b=Y/V39u2yxpTbF8OM8aEjMeUtTgz1m6dQvPyqHXOrXx6kuyOxvYHr14Zd
 3ii1OekuykQWRvPKbpF9L+p256H4wxI3GpYLnoN6/4KRvtjq7GPw87/pA
 JHmdJ7U2yx7ZQp3ZD9fZYGhYkx/pu1exf3veiY+beOoLfmfo0Z6gpN+li
 m8fK/AGsITlicdx1TLlbsQp9JsOZ8Ou64YhTxuwibLTnVGZY1Jvz8qL25
 8NHulXz7/r/HUjOQauc82Tkw6ygjd3bWvvUlOavvAO79Mgv7SpryywYm4
 nF3HBQQpQiNrYuzTa50itw+UK7rU4Fz4ZZGekUDl0vyVDSmSoZ9kLogcr A==;
X-CSE-ConnectionGUID: HFPa0M4LTmuRqg4A8uo3cg==
X-CSE-MsgGUID: 7TTDzGElRN+k0Sf7kfSoCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30109834"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="30109834"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 02:54:17 -0800
X-CSE-ConnectionGUID: VD6msDa5RwSAE0XdTr7CLA==
X-CSE-MsgGUID: YyVPGY/aQMq28/nWjyAg5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="84826715"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 02:54:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 02:54:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 02:54:13 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 02:54:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glXeKPglfEDmSOR2u9szfU3sa3Zs7qH0QuVW2HnW2r397yvdSbJonPFqtzPlYGaiI6mqqaLepAT8d1UjQNoX3IQRqWiBvEStzvKqJu69VeR/cuJ8YOt3FYA0QWY7FvlH/pj8K7O94Aj7x7t+a/BmgpWsWa+opIqdLFSdycl7tHYONaze70xrK6b2dBKmEpAgbyix+JoumgwVycMpX6ToXLaC79tZd6J9GiIPq1CvLZSG3DvapyiO7czBeL2XoCZUpWphPHycE+yQgDp8fJsRSaN3HRfpvwCnWyFuINKp0WUqY4JGOQWuZbAAZp5MF+Rc1uRGoyOVCj9qqhRPHGOeaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hPSXVAw/L7xfxnFA1dfr4zgQWcRRcvF3ay13z5DblY=;
 b=P1AE2ewiBNWhIG+YMAiOqh1Nqcl4+LXFgCLwMEElhNZx65zNuarLwZNHUrA2Mlo5x+6H0VcTW3Mm2l2t3OlRmZP3osV1eoOLf3BNs8dXRsBov+7P03b48pi7Yz1b4pa6qGjwU6a4VVLzKcn5cmMwI3e3tOU6qdSmsKniI5//jnZgPusa8x0CvbBiqZw/if/6c4OFI6gUbX96hXr1jwmS4Imu2pITccwr2OgeKJPMlCyOGkMHNHPEa5qp5O81aOvEGLFvnG/krui+BoC7YEZU/aTxlZJA11mOOBw2dAl/eTagpraDav0mNX7kB2SyMLH1VAPRZEKUY3N73gfYp+o5RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CY8PR11MB7106.namprd11.prod.outlook.com (2603:10b6:930:52::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Wed, 6 Nov
 2024 10:54:11 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 10:54:11 +0000
Message-ID: <a0afc98a-338a-4a08-ba86-013b88f15f8d@intel.com>
Date: Wed, 6 Nov 2024 16:24:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/kms_rotation_crc: Intel display
 version 20 onwards doesn't do hflip with tile4
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241104194415.563277-1-juhapekka.heikkila@gmail.com>
 <20241104194415.563277-2-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20241104194415.563277-2-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CY8PR11MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: bbfa3ec5-4eeb-4a9a-ca2f-08dcfe5158aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDhmbmVhZ3owVW1aelNqMmhtNWRnV0Y1SmN0U3dTUDVOYjdLTW1laW9YUXNN?=
 =?utf-8?B?RS9Xc3p5VStmbnplWWZoRDA0YzVzcTBCWkdDVEgrekx3WEg2MXdLendlT29k?=
 =?utf-8?B?eXJsTVB3SEkxYTZOSkdzRVkvcEJyek1BWGVnNkt6cTF3RExhbmJyUjRvVnJp?=
 =?utf-8?B?cmVJcGo0UTdRTEtGZkVWakh5VVpObFZkN2k5aG5nMk9yQm80RHFoYlpoaTFM?=
 =?utf-8?B?MVFhSkthallYdUtJLzFGcVM0OHVnREFZMDJpQlMzNFRHc3VYNzhISHdNcEtz?=
 =?utf-8?B?UklnQzFlNy9WYXptRDlhRXg5Qmg4ME9pOE81a0Fvc0VqaFlRR3NiRUoxMVdS?=
 =?utf-8?B?Kyszc1JULzBHc0VobVN4Nk1pUkFCME9wNlQ5SUdSZ2oyRENCSnovazF5RjJX?=
 =?utf-8?B?SzF0bEVzTGVSUlpkV0FNK09PVXlLK2xUUVlLbUV5NHNCVExQVDlXcyt3Nlpu?=
 =?utf-8?B?ZHF0MXVYQUJ2ZzZKVHFPZTFNWU5SdnNyenI0aTFwWnp3NEpqY3ZBZXhVSEww?=
 =?utf-8?B?UGN1RmZMSmFaNGpoSy9temYzZzdrN1pmeEt0TDgrYjRwV2pYOVdrUUFzTjAx?=
 =?utf-8?B?TG15MWowZmRxQmhSK2g4QnU2MGtqVE92VXQ2QWVDd3U0Zk52ajg4OTdJY0RE?=
 =?utf-8?B?SjBza1JpNW9NUThMMlpZbWszbkpra2FaM2tuTTd5VzVjZ3ZKOGpMV0IycGI1?=
 =?utf-8?B?NTZ3bGdSM0w1YWhJRzFxYmdIVDBOMWFtSVFqcjQzQmhDZ1gxcTVqU3hUakpB?=
 =?utf-8?B?NGt3Tnp3bEJOVDJML3llbzN4L3p6T01MdEl0YnRJblVVdlBreDFIRU4yd08w?=
 =?utf-8?B?RzFmODlVZHRyZjdxUmNuWVdmNmpUajArOXgyUVZ3OUoyRmNtUkRjUDJubC96?=
 =?utf-8?B?UCtTR2ZSbFRNU0hwOE1pdWM3RkRWK2MrVWVXSDJRaHJhWFNRZ25xYUN3dHB0?=
 =?utf-8?B?U1JZdFd2QTIwbUpzRW5RSW5MR2szSkxVczdIYlNrVUEzOU44c0drdkdrRm9Z?=
 =?utf-8?B?RmlST1dmVm5nMlBhWGtXQUZJS0kxNXZXYTVRNHVJalNEbnExNDYxNlBLVERS?=
 =?utf-8?B?Mm5NQWwzYXZtYWNrVGhXUTRxVHVKdWxRZC9aVHkyWjRGbThZcURqQnJpTmlq?=
 =?utf-8?B?UDN2NEtkaVhYYWxFL20yM2ZScW5pTCtkcitjL2lDQmFDdGlJZGJHeVcxYStl?=
 =?utf-8?B?WE1CVUw1TnhzVkxLTW5pT2NhNnBaS1NObTJJNFd6UUVpZzM2NlNmOUp2Zjkv?=
 =?utf-8?B?dVo0S0doZy9jZ0RsYUpkclNwMmc0ZU1Qc3BFS2VyMm1pMVZnK0xsMUM0UE10?=
 =?utf-8?B?QnVKZTNGSVJYazRiNE1UQm11ZnRLRS8rSUtJMC9uODBRTzdyV3ZKd21pbW9x?=
 =?utf-8?B?dk5qaE9RUFAxbUlkbk5HZ3FkNE5ZMG1aYWlFaXZtM1NnVEtJQzZHc3dJaDJs?=
 =?utf-8?B?Y2Y0b0l5OWdkbE5YbmtjdFYyWDRpaXZSanAxQWtiOG1nempyOUI3Zmxxanpn?=
 =?utf-8?B?amN3cnIrM0ROa2kwSWRqcFZyZEVROCtiOFpBUVAraE9IY1ZGMmVsWTNiNUkv?=
 =?utf-8?B?bUQxcUU4RFNyT0pLZytDNDBqSUVYaHgrcEQwT3Nya3pNa2krVFdHZ25ZVEZP?=
 =?utf-8?B?VWx6Q0g1NHNVL3h2ei9VL3AzNktoWFRFd2FjNDdvdXBjOUc1TlZPU0ovSU5i?=
 =?utf-8?B?K1ozN2tZd0hSTUtqVUhyL1BMT1p3OEFacE5EdzA1Q0ZaY3hMd2JRd1ZlVkJM?=
 =?utf-8?Q?0YLcJ74xBAL9qRoX15OBdptY4e6L2oG7HVlAEu4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RCtEdGhKQjlta0FwWVY3dFkwUjJTaFF5QkhWdmloKzNubGJWQ29kVkkzREFZ?=
 =?utf-8?B?V01hcnRIZlVPSmVVSk80V3diQzVxRGU4bDAwUDdReTh0QnZzaTZCWnh6eldP?=
 =?utf-8?B?SEtiTXU2SzQwMjd4MTNkNU92bXBFazQ2eHlTTHJRbzZNdVF1OFprMmkrUkcz?=
 =?utf-8?B?QTVaYTFneUkvck9Id05wWWNqczVSdmZhK2NkTzJ4UDJuZlNJZkM4K0tkTnkz?=
 =?utf-8?B?Z3B5MXhPb283eDYyVnFWK0xYcVBab0pVTVg0djR6UlB4QnpXSmdWYXh3K0M5?=
 =?utf-8?B?NlZzTnJPcGhOVW1MVFRRVGZSMzJNNWxrWWF6YU9Ca3VxRFROcnU1N3EweklV?=
 =?utf-8?B?azBSRHRBWUNxYWlxa3BLSWNwWjkvTm9ZbWdWRmEzMkxORTBIZDVKU0dFOVRH?=
 =?utf-8?B?N0VTeTJvSG5mWitJdWs2VTZWYmJwZ0ptS3hWem1hb1ZTWFl1NHM0UnA2TmRU?=
 =?utf-8?B?ZURHQ2lGUjlIVUNqbzdFWWo4RFNCOGJWRzBSdk5uWVA4MlZUTUhwQk1iY013?=
 =?utf-8?B?azE3ejdscmdJV2JLR3pGaGgxbXBlQlk5bllqUHVEYmZ3ajU1bytJcldNQ0xL?=
 =?utf-8?B?Yk0wcmgzZzhuWnBjV0U3TWhaaE1uVndJT0t2ZTRjbWxxTW82YjJwakRyM282?=
 =?utf-8?B?TzNVczdjaWQ1Q0diOEtSSnk3N2hHMXRQc0ZyUStkTHJjR2N6bCtxaHFpMVpo?=
 =?utf-8?B?L1NaNXdGcGIvUTZyN3VRTFdLWG13OUd3RDBGb3YwRTAyNzRrNHo4QTNJTUFu?=
 =?utf-8?B?ZGxyck82Y2N2Y3cwVEFwcVhEQXQ5b3YwZFk2NFBpWCsvSGdQZG1lb1B3dWM0?=
 =?utf-8?B?WFUrMmF1S3o5RWFteHBZOXAyYlRkQnh3WkMxNHZ5dzdVWnNzajhxMCt3OTBB?=
 =?utf-8?B?cDJQVXMzeXZGTlAwODZTSkNuRmZncTcvRHJMeVhLSEo0UUloSkRURFg1YVlZ?=
 =?utf-8?B?bVU1OVYvWlREOFFnODdIRjFNNUhwZ216OGE4S0dmRE84SWZuVGVYYjgxSHNK?=
 =?utf-8?B?d1NnQk9ieHdjR000cE9VT0FwNDBkWU01bUx0WkJaOFVtcG13OUNtUjVhVWxj?=
 =?utf-8?B?YjdiNHhoRTB1bVljT1RHcmdZT3RPUWlDNWRuRmFSeTJFL0d5MndRYlFKbGV3?=
 =?utf-8?B?T2IreE03OHFQRy9Kalpyd1JtQmVnaDBJMU1LK1JsZ1lUSEplanM5c0orNE5a?=
 =?utf-8?B?MDloMWNubThkanRQNWtCZ0huL2lvNnZCeEpqaHVqREMvTEtIZ2hMWWxaeHJX?=
 =?utf-8?B?aUd4M0pZd090eUxSVjJPejhXd3QxT2krYkZrVGdIY0hCYm9mRWdTbmVHVGdr?=
 =?utf-8?B?bmI0M1FGQTN1VkdrSXI2V1l5cElGMkh2cnpoUWN0ekV5QzNaR0ZKbmszR0JM?=
 =?utf-8?B?WXpEMjRmdk5SNDZmOGo5UDAvUTJ3d24xYlNjR09ka3ZiNnFsTTUweXl2ZWJu?=
 =?utf-8?B?WnRnd1Q5RzJMaDZYTjdCZldZWmwzVTRiYlVUOWdHRXFjc0VkYlhmaEpQMURv?=
 =?utf-8?B?V1lEOVBBZzI3dHEvdXFWNk4yU0pRenRNU1RVejNYZkRqaEFSSzVRanhyKzRI?=
 =?utf-8?B?b2RNdjRUSDN1RE1xSGFhMEoyWFJCS1BFVHVCd0dOVkhlVGRiYzlOdXhlSjJu?=
 =?utf-8?B?R2lndkFxaHNvMHVtUDJzVDhVbGlBVkYyRzR5S2ZsNUxvYUh0U1dTV0NxKzBH?=
 =?utf-8?B?alNpU1UwM3c0MXhHQ1Q3UFAyNnFsM0VNb2RuL1Q1eDVPem0zcEpIcTAzWktE?=
 =?utf-8?B?K1RUMUlWNy9kVS9KWGY1cFJ2RTRtMEZkRi9FT2ZrRkVjaXBXQTl6Q3FtZGZs?=
 =?utf-8?B?cWFiMWdVaW9IMDRpTUhLN3FvWW9IK1UxQ3ZMS1V4dGtQeWoya3Jmb3puRXpT?=
 =?utf-8?B?eGZjSE1ibUNTOFlvTXN5UU5iZjFDc3RhSStjMkUxSldHYTlqRmkxT054Rk16?=
 =?utf-8?B?OU5Ddjh6NjZ2R0k1bEtmRnpCaHpzRG1TWkN4STl4OUt4ODRybkd0bXJUdFFy?=
 =?utf-8?B?cGJoVnpGTVpYcVpMUzczRGlaeEx1ekwwd2xYYmxoWHlIeElCZlpvbzdIY0dH?=
 =?utf-8?B?cnkyT1ZyUC81bW9GbzMzcjRQOEF2MVV3cTV5RnNEblJsOUF5MlBJVDZUZStk?=
 =?utf-8?B?ODgyZTJaYnB2dEhkcm1TcmRyY0p0TUFlSnhyVmRORmZJdTVQNjRKeGdtaENn?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfa3ec5-4eeb-4a9a-ca2f-08dcfe5158aa
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 10:54:11.6188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLN4ehaExUJRko8lGCKPDYIx96mriyiLiuFgI/uchTPiCzYr1aRKhl136RpHAEA99yQ5tgLaRbg2TZcDu9r5rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7106
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


On 11/5/2024 1:14 AM, Juha-Pekka Heikkila wrote:
> On Intel display version 20 Tile4 no longer can be used with horizontal
> flip.
>
> Bspec: 69853
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_rotation_crc.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index e8b6e4ff2..22fb5383b 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -577,6 +577,13 @@ static bool plane_rotation_requirements(data_t *data, igt_plane_t *plane)
>   	    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X)))
>   		return false;
>   
> +	/* Intel display version 20 onwards cannot do reflect-x with tile4 */
> +	if (!(!is_intel_device(data->gfx_fd) ||
> +	    intel_display_ver(data->devid) < 20 ||
> +	    !(data->override_modifier == I915_FORMAT_MOD_4_TILED &&
> +	    data->rotation & IGT_REFLECT_X)))
> +		return false;
> +
>   	return true;
>   }
>   
