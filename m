Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC89D6ACE7
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 11:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CF110EE96;
	Thu, 18 Dec 2025 11:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XotWCao3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C7910EE93
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 11:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766057452; x=1797593452;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=G6f1lVMXVVSD28vJvWDeJ28a1xmuysJgJi+l2XET898=;
 b=XotWCao3ZocgwVgVoA01akTXnsV3xqQoYPGM9cV4Hxfe0TbWB21yBOA7
 0NSW3ZxbV5zTfAQimFQr281aQp5dexk3dz7o3osrc1EiMgkI7FU1cW2IQ
 kWd/8763Bc7zbOqv0Z3aKcuzSqnLin3rdfXoUPgZWIIE8PgPz41y+KC4W
 c2Ug8pRsYkF6mI86L0ZOoUvNQiGXsAbxNBj9e6TW5fl2dqgnZ7nKfV+OE
 MaYM8rGFjijrWp8YyCQ+B607GmZtRboex2AsaxVSKfesw6W8oXIbKOcqY
 fcomRvd1oob39WptCYHlOYGEolxeHLpRnX981SdKbthDk4WQ2MqAhfkxE Q==;
X-CSE-ConnectionGUID: aBfdFC6kQdCHQeqinYUlVg==
X-CSE-MsgGUID: kja2j1TDQn6Y3/2txnlJvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67887309"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67887309"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:30:51 -0800
X-CSE-ConnectionGUID: NcoFyN/ARO+ofozylQZ3CA==
X-CSE-MsgGUID: rsLtOu3NQSmyBfRdVnOrDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198560672"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:30:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 03:30:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 03:30:50 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 03:30:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tN6ve1da8NvRQeCOWbq3Il/IknC/SHWvIqX3ZS+I+WFHZNqz5GjZTCAwTpQjKy1H8tvIx5ma/6MW4kw0Hw496LQE8NVHqn2x3Nrp4x6lMifdOVPrb3aB9AJzeeCdPIPqGmyQyuPrFSaVwzIew4Sxdy0WWNRU3ShtbXR9pwqlj3cWMnOLDrnPX2sHQ96mMgm2l7tqcI/+OCVj9Pe56oXiD1LElXmrM+wn4GlcKckSgEA6dsSzMPxq20S3PHZ337zoKHXhUf+gfrpBq/QPrTfy9mBRgjSUD8rGrq8vpbpRIbhswyIj1fimvDKxtjA5MZ7a0r7d56GFmHXZBfC22PZerw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/K8Sh3F6aB09LtMoyuuvYk6wLf4CCxz76njyulcBsk=;
 b=jqguGseP0gmzBZe66lK7JiyV8FO8uta3D9s5j4iKsK/ylPMR5H0mAUs1iFhN9EnH0hDsWX7Kp1NKTO7T96z6k3KQx1f6d2Bihst6NT2/9O6jQvYAlVDFo2q/8nIKcG5nwWqgYrK0idTqTfJC3heUF4bdLCSxrcUdv6Lnx3RL/dg7qX59gwGCgRF/twXL/6q4umwVHqqgLw2PSW5ADJHkiv2TFV3e3NLw9q36XHLGpecYYUHBH+xp2boVGQQNse5bq8IRveCMRGjUH9mSbsaw4eJ1HYd3IdFUZTjPn/h2s+1PL0zN9d7F1G3zfjbuDLYlLzGy/YzOa3b1udJqgbDwwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM4PR11MB6405.namprd11.prod.outlook.com (2603:10b6:8:b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 11:30:48 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 11:30:48 +0000
Message-ID: <d3489b40-82a8-465d-ac58-1b8a4f22106c@intel.com>
Date: Thu, 18 Dec 2025 17:00:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/chamelium-only.testlist: Enable
 additional Chamelium tests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Mohammed Bilal
 <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>,
 <sameer.lattannavar@intel.com>
References: <20251216091433.1245664-1-mohammed.bilal@intel.com>
 <20251216173653.knmo2oyysxzu2ohk@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251216173653.knmo2oyysxzu2ohk@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0093.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::19) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM4PR11MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c46130-23f2-4b18-4604-08de3e28e421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|42112799006|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEtuZ3JqUXNMVVpqTFljMCtTK2MxVUI4YkhsYnlrRXN1dHBOWFYxZEJRcWt1?=
 =?utf-8?B?cnpDb21mQmZVU0dTZmNST1psVkdreGVPWWVGTGE0c1FlUGV6ME5pQkVEZ3R5?=
 =?utf-8?B?N1RmS3ZjL2RkZzFWQXFHemk0eG13eG8vdmxsSVl6VC9KaG8rdGhVcnpsUUIr?=
 =?utf-8?B?dk9iRW1SRW9aKzFySmxEcjNvR1VXTFN1MTI0K29ROWtwWUNPL2V3M2VFaDdr?=
 =?utf-8?B?SUpwSmMwUlhJSzNKczJVL1NQTE9RQ0hubUo5SVdEZUZmS3AxTFkyV1hycWxN?=
 =?utf-8?B?RCtpRnV1RkhKR2kzVnpueTNZdmZoUXZ2dE4xdzdHR05mRXZ2d0wxNExEMUFi?=
 =?utf-8?B?c0VPdmE3RjNDc0JKSjV1dVl1c2pBeUlObTRSamRoME16cnhucDYzU1NWMklX?=
 =?utf-8?B?ZFFIWm1zMGRTTkk1ck51L2lraW9TWEFwWmh2ajBPampkWXIxbGtFNE5JV2w3?=
 =?utf-8?B?MEtCd21hYzROOFoybHB3WHhEZ3dkVHZXb1lidUJiMDNwN3dQa3MyVlNsUmNv?=
 =?utf-8?B?K3ZXYnN4c3ZHNmFKV0tpUklBS2VHN1gxZ2tGb2IzQzlpbTh3eUo0OHhGaDRY?=
 =?utf-8?B?dE9tcm13Q2laa2ZEQThFS0VrcjNUMTJGNm9LRXNDUFFjSC9BYXB0aW9PUFlv?=
 =?utf-8?B?MDhDZERndlNmeFppR1VDeDVObk00SHpuRVNyQkVteVpNSWRqTlJPd0ozVjdN?=
 =?utf-8?B?K3BzeGdEbmpTREVpYjhXWjMwMlNoWGQzeXFwUmlDNUZOL083aGFsaDFSNWY0?=
 =?utf-8?B?czR5cVBEQS8wNkFWYlFMbnNXOGNzZEY0QUQzdmZIa1ZYMWNnSjI1NFpmQm1F?=
 =?utf-8?B?Zk42UC9ZTWUzeWxtU3hFNnFkbnE4NHIxbGxscS9lL2txVWhUUVFTOFhjYWxq?=
 =?utf-8?B?bVVYNkxqdjNKa3BxcWMzTkxZbk5xMXNlQWU1TG5jb3h0RlN5aG9oZGFDdDU3?=
 =?utf-8?B?MVBQZnh6N05sRkpUZjd6RmtoQlAxTDdaN1VKRW13a1VWS2dsanNLUnZiMDkx?=
 =?utf-8?B?WUJRaWhoa2ZQQlAwTGNxbXl1bWtQUFJwbk4vUkdqdXFadTBDbitUTWxrczEw?=
 =?utf-8?B?RTRJZW42UTYvZjl4d1NhbDdVWCtzMGROMk9COVVNWFo2WXE0OWtHTGR2c3dv?=
 =?utf-8?B?V25DN0hGOVBIa2xpU3pMSUFTV2c3NzZyaDhrTHo2cFVBOFgvVURUK24xb0t1?=
 =?utf-8?B?WGhZTURwV2ZsckNLUkdZYlJXUkNsUm1DRDRxdlptcG8zVTVPVXR4aUxTMFpD?=
 =?utf-8?B?QXFRWjZLREg3ZFFqZEREampXY1d3aXptMGpkWXd1MStNbXlLc09PWG1rR3BB?=
 =?utf-8?B?eFoxME05TEFsVHFzeGJ6d0Q4eDVBeThOdkZRdnZWd2lyZ1VYNHZQNkw4cGpy?=
 =?utf-8?B?MFZBakNUV1pLNnFsd3hUUTFzcXpNbXhSZmNyT2NhaG5Pb0xBMHlFNk1CeGY4?=
 =?utf-8?B?Um5wVXJ4ZExxcktsLzB1dXArc1hqd2JpSHFJcDYzbmJpb3lkYm1qNTVrMFY3?=
 =?utf-8?B?YkMxQ1BTVmJOdlhXTnNDS3JGbjlzTExWczVta1d0RlM0TFByWTNmQXhmaDcx?=
 =?utf-8?B?K2xSWjBEUXBjZ3dMb2crcVc0bFQ4cEVET0t2RzhzMFE5YTZveTRUMDV3ZFNw?=
 =?utf-8?B?MElCejZjU2ttS3FnMFI0ZnhFRm9DeW92c1p3UFN5K1o1djM5Mzdnb2M1VVZm?=
 =?utf-8?B?dTZlUE9nTi9taTFJMHZIL2taT0o0WVhWSzFoSm5kbGtVbHFCR3hneExPdWg0?=
 =?utf-8?B?M3R6UFA5aW1QQ3VWTU4ySGU4YWUyOFRST1FBK0U4VnphS2Y0QlBYM2NDQnJ1?=
 =?utf-8?B?UnJ3WWdRNWpUQ1o5SXRpc3JIc0RndkJLeUo0VjF0Y2pGNjJmcStURlFxc1lT?=
 =?utf-8?B?Zk1Yb00zblgvR1E5NC9ocnJ0aUhpMlAvWGZNNVl0VzBvRG02eE1VVys4WXV3?=
 =?utf-8?Q?LoWFPf232ZFbfS31l2Ln9u3ZIU9qoA65?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDZwREJJTE5PdG1kT0NWNWd4SnFaNnpWeURPaFRRcnlXdEsybFlpZ1N0b0FI?=
 =?utf-8?B?Zmt4K0xZeFRwdlBwbCtyUUhPUW5Yc3F5WmppVFZRZ2w2U0VNODNBRGQrcU9p?=
 =?utf-8?B?cmZwVjhwVUQxZnZ3T3dFVCtWN2VYbDkzdUVTc2hyeml3enFZMUJDUGI1ZGEr?=
 =?utf-8?B?QnhNdE80SVRPQWwwbDhiWEUvYSt6Ymo3Q05OanczKzJtU3F5MU4zSFFSWVJG?=
 =?utf-8?B?dU9EUTJoa3lZd0pxSlM1QmFKTm9hUGpEekFCYW1TVElpdnUvQ2JoS1VpM2cr?=
 =?utf-8?B?U1VoMkhwS0NaVTBZTjgzUjNKMlB6VGpEcnJSZzJtaXhNNCtBcCs1TTZhVGxQ?=
 =?utf-8?B?bVFHb0U4N3ozdTRKeWFYeTFGLysybFdCRVhybjlGaHNEdUhGNDFsMnQzVFls?=
 =?utf-8?B?aDRCWDBqOUpONmJSNDZ2WnJmbDFGM2w1MUdQaWQxK2xXZE9nUUxqci81K014?=
 =?utf-8?B?M1ZvOU9SSnFURFZBUElRczF4SHY4WjAwdVNpSHBKcVVuQTFVMCtwTGJ3NE9q?=
 =?utf-8?B?WFVsYldaU1Q2NXNiRjV5ZGx1bi9UWno2djEwSDZCVDdqdG03RkxBU2pmenM5?=
 =?utf-8?B?TTVTdENIdjRsT1NZbnhDeHduY1l3aUdHY3JWTDRvN1A3R2R4WkQ4NTA1dVg0?=
 =?utf-8?B?Y3FzY0JFQUhxalhqRWptTGtHVm51ek05NmNGUmZqSGRkSU1Lb1BFc2gycXkr?=
 =?utf-8?B?UHdHalIwVDZINjZtVVBETzRsU0hpVmY5VW9QUGlUT3pJTjdvajJhRXhJeSty?=
 =?utf-8?B?a2NwNHJzMDg3ZkY3NlV1czhSdE5lb3JFQ0FCUm9zM2hOR01tWUwyUFBMOVlx?=
 =?utf-8?B?UDRPcmQwd2IvcDluYTJveGhqbG9jZlczSE1YL1BkVFV4UTJDdHJJMDBBdmND?=
 =?utf-8?B?cjR4bHZodm5LTUJyRGdZSzc4bXI3WEMxSm1iUkRkYk01c0JMTk9OTE85Q0lX?=
 =?utf-8?B?akN0MEVXQkladTgwSFN0eHhMTDl6cVhrMmRkVFRiL2UvQzM5cjlSVUNibS8x?=
 =?utf-8?B?cG9UOUlpdzBHWUJ2WkJIVEp0TVBURmVsaFlmK1FXVitoWGlqbzNsRGQ4Zzhy?=
 =?utf-8?B?NWE0dlFxdWt1cWF3WmtSTEE2cGlic1B5cHlacHNTTFpxU2JSLzBYZnJDaDE1?=
 =?utf-8?B?eGRxWkFFZk9ibEpkNVdJQ1VxTzhaelIrYy9QK0xTd25wWEdJcUdTUzB0STdz?=
 =?utf-8?B?NXBBUllhdkdGM0o1SlVDb1JyOGU4eDROVmgrU2IwYnhDODhHMjZnZWRRYWV0?=
 =?utf-8?B?UWpzNzEvcUlHejd1Qjl5d1l4eXMzTnlrQ1M1a3dhSVRwaVVuVDR0UEs0Tm9t?=
 =?utf-8?B?VGs4S3pZMTZJbGpJak9uZ0x0OWNHNXI4WmdUUDZqTC95QStNeWk0ekU4T3pX?=
 =?utf-8?B?b003Z24ycnltbEVhSjBpTXVWWjZKNEd5cSs1b25oR2xXaXlkT1MrcklPQ3pI?=
 =?utf-8?B?RGY0ai9ZR2hDamJDbnh0SWs4VVV4NEJCTE11ZFFYREc2QkJVaWs4QjJOOFZG?=
 =?utf-8?B?YnVuRDNKMjVhYjJUdjc0Wk5GY3pNZXdLM29wbzBCTVl2QmxBVGh4elpPbWFH?=
 =?utf-8?B?aG1GQlorbys5NzAwUjhqWlphU3NFZU1haWhQOXg4QStFVE5vUmtVL3dWOFpo?=
 =?utf-8?B?UlZVdzd0Mk5JL1o0WTdxVXhJT09ESXZieTB4Yk4ySFJnY1VkVXMrd0xDUDBL?=
 =?utf-8?B?cjBwdUVSc0o1OTFrbGRLR3l0M3BOZ0h2NENMYWM5UFRKaEZsUTRJZUtaU01l?=
 =?utf-8?B?eG5QRE5mRzRLZG9MZForcHIzc3VqWVo5dlNLM2NGa3pFOXZ0Zm1haUUxZzJZ?=
 =?utf-8?B?QWdTVnVTWUtPcVdYbk0zRFk5VStwOHVMYUZYL2QwN0p1VjByS1BTWXB0eEs1?=
 =?utf-8?B?V3FEaExSeE1tN0RmUVl3SmZDZnVpYmF5U2Q1UEQvTHpac1RHNHliSE1GNDZB?=
 =?utf-8?B?RllkNzJPRTFNeWhCQlcxK2dQWFRFNnVaU0l3NVBXS2pyblFYNHBoYWN5Y0hE?=
 =?utf-8?B?WUlyUGlKdzhkSFFWcmtiSzZ5QmU1OWpuMFRLOHVoMHMwZFN2eUtiQjh5NVZX?=
 =?utf-8?B?UTJyOVRrYWk4VHpiRitSNTlqa3hDcWw0dWNVdHJyWW1WVjhGZVZyOFJIRjV5?=
 =?utf-8?B?TUlsOWlHRXRlSHIycXBJRVFxY295WnB3NHk0eUlpS2p6MUpndGJZUEJlUUdD?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c46130-23f2-4b18-4604-08de3e28e421
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:30:48.3566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jg9n3fpUBUjJCjCrA/46oHh24V+efGiLGpE+7IVKgEhwG4bajLwtl2ZjNwFN5DRtZaPE7MGCfd3MmpiE+QOvhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6405
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

Hi Kamil,

On 12/16/2025 11:06 PM, Kamil Konieczny wrote:
> Hi Mohammed,
> On 2025-12-16 at 14:44:33 +0530, Mohammed Bilal wrote:
>
> please simplify subject, just write:
>
> [PATCH i-g-t] intel-ci: Enable additional Chamelium tests
>
>> Enable additional Chamelium tests, including hibernate-related
>> subtests and random plane comparison tests.
>>
>> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
>> ---
>>   tests/intel-ci/chamelium-only.testlist | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
>> index 99d2f2409..50cba517a 100644
>> --- a/tests/intel-ci/chamelium-only.testlist
>> +++ b/tests/intel-ci/chamelium-only.testlist
>> @@ -67,3 +67,10 @@ igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
>>   igt@kms_chamelium_hpd@vga-hpd-without-ddc
>>   igt@kms_chamelium_sharpness_filter@filter-basic
>>   igt@kms_tiled_display@basic-test-pattern-with-chamelium
>> +igt@kms_chamelium_edid@dp-edid-change-during-hibernate
>> +igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
>> +igt@kms_chamelium_frames@hdmi-cmp-planes-random
>> +igt@kms_chamelium_frames@hdmi-crc-planes-random
>> +igt@kms_chamelium_hpd@common-hpd-after-hibernate
>> +igt@kms_chamelium_hpd@dp-hpd-after-hibernate
>> +igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
> Instead of adding it at end, please keep this list sorted
> alphabetically.

IMHO, better to have hibernate tests at the end of the list(at least 
initially) so that even if any issues are seen on these it doesn't 
affect the other tests. Would this be fine?

Thanks and Regards,
Karthik.B.S
>
> Regards,
> Kamil
>
>> -- 
>> 2.48.1
>>
