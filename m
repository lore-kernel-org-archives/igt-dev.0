Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361EBE6748D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 11:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA77D10E06D;
	Mon, 22 Dec 2025 11:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6/A1VgD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13AC10E06D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 11:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766402402; x=1797938402;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zjp58jf6xw+l7m0+Cvrd8wG6SbuENqJTeiPeoY3e/Fo=;
 b=O6/A1VgDWdbFblw1itVHsF9BtKgRMfz9uEaI5IsGmhTp4ftK2hFuiyhv
 pWT1W5BLqOOSLw8VJnsRomO1/V+gdibSQ0C0LZP8R30LiPBch99P15Rm5
 +ShktG+5yZg70dx4Ent+uLK3vq6ztZksJUBsCK2r7+R2Q2iA8eaw7tRdc
 6VbeuudNo25n8BbeBbYmFm50prTpg9mCX+xmxxhE5RQOBNPH4YrW0b8xT
 D5c3/2aKNAQWQENfxXNzSLYt9Njz3E61QWTfQ/S/pKaxxaoytlalfPLfM
 FRlmCON4N31xOmMvUcYvYIZVzXthiwdZRfSjQGulvQtdVe/Agi/xwYISd A==;
X-CSE-ConnectionGUID: Egxot8BLTaKzTno1Q9rZJA==
X-CSE-MsgGUID: Qr3tOCUARP6Umhl2SkZ7fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68410265"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="68410265"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 03:20:01 -0800
X-CSE-ConnectionGUID: VHl0+mTuR5+TgtvN5lIgbQ==
X-CSE-MsgGUID: VlehymwsTCKqkEgji4W75g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="204030473"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 03:20:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 03:20:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 03:20:00 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 03:20:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltmj/9sPNe2OTVU7RUyP3Sv5KN7BHKmVVWIhY6ocL1fieAWpECQxRVt5uFM0G743x4rhpYd24Knu26xCoWSFV+3DtUA3Obdti2ah3oEp0HAysZyM9DuBCeH1cYpY9AiY5tC/U4USLtYkT+ixwSVelok1TIjG5Xayuhf7sblg8/tCU0X2SwMMTBIm5uFSr94P7jR6GLJ4A/s2k7ciog2LoJnPzBETZCyFexmy/+KYDMXiz9pEmerKlyYIyNTj3PpyQGXtxZSkhWAuX2o4wKqXvwq+La2ygr3r2JJ5BrpOS2ixEatJmtg/0kNEp7r563cjAgKgAgVlpKbx21DP9ZknXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ys5/c6SITgp9vJVqxKQc1ejHkBBi68yfFhQ4NKt51/w=;
 b=EgCaaAG9ZvsGLRhpjvQSw+BHqkELQlUJBfxg74moPB9p2bQHsrnn+/4GFN6vW5rd0eoLlLF2+Wwm8RXzwB6sqFDuQacrgmRqxpX6qtrNcwD9lQ97G6osSeweWN/zI4mQjpi3BClupj8UZohMdLBktecyUaXXhw+sfQhNU4/vla5mQhtC6pmokTlAv7JKWyrHRCSLzN3E5USsA3E7RNFvT7Sx0c25FqBAwx5U2xHmWOusYoELOI4SyzD9XCuwUtVx6AmLGdHFwrvYR/L7oSt4OCnSzDu2EeXDKlSb2YZOdnIHYLyEQwCtDgxOdxETITigJvvB5j2DdRLrCdaOPB73nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA3PR11MB9351.namprd11.prod.outlook.com (2603:10b6:208:57c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 11:19:58 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 11:19:58 +0000
Message-ID: <2f74d23f-17ac-487b-ab96-1432eaf4c314@intel.com>
Date: Mon, 22 Dec 2025 16:49:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v4 1/4] lib/igt_kms: Add igt_get_joined_pipes_name()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250905210816.319104-1-swati2.sharma@intel.com>
 <20250905210816.319104-2-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250905210816.319104-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0218.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA3PR11MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: 013fd9cb-bda9-447f-5605-08de414c0a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG9CU2dpUjhGRk8wb0pWSUpWa2JiTDdUKzhtR0gxdkpXejhwWEhOUjVrZ3Ar?=
 =?utf-8?B?c0FPRFNPSDdLLzJnRDJoODFtekhzM3Y2eXdoZ21aOE9lZW5aLytMSk1jSitz?=
 =?utf-8?B?TFRJZVdEVUZVajJ5a2VQOVpGS25LcWZTVm9nUmVwUjV3TjBRTHJuVHZvUmNL?=
 =?utf-8?B?TEtVQTRxNVcxK3h6aS9WNjlIQ004TmN2aEliZTllaFlDdjZhTWl4WndwL0dm?=
 =?utf-8?B?aWs1aGxvb0tRSmtlTTV4c1A4bkNOVTBUR0Z1aGFFZ0NBOUtaanRYK044bmYy?=
 =?utf-8?B?QW1KRUpLUDRUQk1oVVhCeG5Hcnc3OGNKMFNBcGE4TnB4OVpJSWJlaWR4SWJ5?=
 =?utf-8?B?OW1xSEhqbWNwbVFCVW5ySFVxaEN2b1RBVENNNGIwRlROOWJxcFY1T0JVdjhn?=
 =?utf-8?B?RzdUaEVXOGVneC8xajhSMWJJMlJoYVgvQjliVGtwUUN1dHFSRVZuUk1PUVVp?=
 =?utf-8?B?cVY2bndxUFNxRWxUNENTTWVta2d6UTJVZVdkdkpuM0VuTmZZUHVVRU1TTThq?=
 =?utf-8?B?SUhEdzJvUWtEejZieWVQZ05kWEM4ZVVTVkxCUVk0SmViMDV4dEZCT3VtMVUr?=
 =?utf-8?B?L1F5bzFIUFY4R1UzZmJXKzl3SndzY0JkN2JxZ1hDc1VKYzQ2bzlzejhUdEQr?=
 =?utf-8?B?SkZERHJSTjVUaHlvYTRxa2N3a2MrbWl0N0dyV1A0RmdUMlUvRkUzaUhFOHNP?=
 =?utf-8?B?SnZWL24ycDRkZEl6VVFiaitxWjVPTkEzZGhKK0gwU1JtdEI5TzFiVUg1bk9L?=
 =?utf-8?B?RFlFR3NBVUZVdWpIVzlNRjk2Z0hORGsxZVdTbzFhWmw1VlRiS3BmUWlzWjFF?=
 =?utf-8?B?TTgxdncvaDQ1UEZHbitUOVRGSHpTamJNM3cxcytuaHNKQUNZcGxlSlVza3cr?=
 =?utf-8?B?WlVodm1IbzRheGFvdkQzL3RGNnR0QU1UcnRUNDkyQm1PcFlPSjFSRjR6Vkhs?=
 =?utf-8?B?OGpGN2JmZWlPeUx4M2FrUm5mbXRQN3hsNGZnL2NPUjZJMkRJay9SMTNseU9W?=
 =?utf-8?B?SGplZmE3dlhScndVK3RVLzViNWNsbTIxZVdrOGUvOU5BVWlsQithTFkybEJ0?=
 =?utf-8?B?akRRVDFRYVVldy9TK1RPRGcvZkJDRC9YOFhkQ3J3Q3JXLzVtdUV6dlowYWEw?=
 =?utf-8?B?K1FiUFdMSkZsSWxubm8wcUM1cTl4eTc5K0lqdjF0RjZpRzV2RGxYbEhzcGdr?=
 =?utf-8?B?S0pqTWVhRmJmMURvVjFqYXNPcHhMOG9aYklqTFVPRVE4eUVZUGV0bjlod2la?=
 =?utf-8?B?djFESVpRMVNRVXB5bWZwYmpDNlhvWFZ0L0ZMbmZKUDhSelc4cCtDNENqa2V4?=
 =?utf-8?B?L1UvbkRMYStGTE03cGt0MUdDUDAzWHVEWE1hYzJQUnhITUsrdEd3K0tadXlN?=
 =?utf-8?B?VEd4bE1sZHRHaklWQ0dNK1psdEJNTUJRSG02Tjg2VzV6alNNbllqMDFWd0tJ?=
 =?utf-8?B?cENUTEJVcktGV29MQ2hsTWlCSUQ4TDZNdkZ2dkhFNms5MTh0UlBmRVhnRXRz?=
 =?utf-8?B?bU1GdzRPU2Q2NlB0VEZNVlAxSGlORnpvMFJZd3JWZFVaZHBjU2RCVEdLUm1T?=
 =?utf-8?B?WjZZR0VLS3ZsVjZSSDFHNmZSYStFSTZWenhwcHpjK1UvaWtiOG9hOTQrYlVy?=
 =?utf-8?B?ZS9NMVdXZFBIbHdpaHlIcjZ5dHZFQlpTcmdSRStxMzRtODc3aGdqTWlsM0tm?=
 =?utf-8?B?WlBCT0xpYlJ6RTUyMGQ4YzlSQWlibUFwVng5MUJ3RkxTdGhxcmFOZkNEMjlE?=
 =?utf-8?B?eHpUYmR1ajFVdXpudjMxSU5lQzN5bjV0NmdSUEdWamh6NEF2VTRWbU1BNGhZ?=
 =?utf-8?B?Uk9aME5lR3JYRUE2UEJkRTJBMHVIYTBNcHZkS1lOMGV5N3AvN0lpNVFrWklm?=
 =?utf-8?B?NXJncXBwZVpPMWpSdGhOUDc2R3YwcE1QeE13NWFYa3FxQko5RDkzSkJVbWh2?=
 =?utf-8?Q?ehL1FLTYUWBEuY4ABmlhsyfv3jiqQGk7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHViWmoza0VHaEFIdFMyeEpnd3hOcXkxL3hpODFrTEtEcmsrOVVmYUs2bzkr?=
 =?utf-8?B?Y1l3UmttSkNxUkZCVWhER0UvWTF3eHFaTklJYjRUcTNnWW14VE90MlZSOFYy?=
 =?utf-8?B?ZnlISWhUZ0ZnSzNheHpiMWNHL0pLUUhtRG94RU5HQndXeGJacHF4NytXSjJm?=
 =?utf-8?B?TmJ1bjNtakRPRVZvSXNnZjJaWjlKWG40WUUwRjRKVGI4TUFiK2N3dzRicnhs?=
 =?utf-8?B?czEzRkZZK005UG1XMXNPYzluOGpxRTM1dUUzSmg1Vy9VRDF0RVNPMTlMamxh?=
 =?utf-8?B?QS94bTZoaTVOSzZBbWdMYUtBcWlCa2Z2dXZCM1lLL0JZMjc2QW01Sm5SZDJJ?=
 =?utf-8?B?TE93UUdPOTZBdlhBT0JhMzBXcTZyMDBiblI1U2xjc1ZZQXBJQWtINWovKytY?=
 =?utf-8?B?N2lBa3pRYTZISHliRXFzSWE1alV1UTh5Y3RQcTVWT0VUUnR3cktIcDBiUllY?=
 =?utf-8?B?eklhbVFqdVlYaWR5MGl1NkxBUG14TGVpOGF1RXNMR01RTGdqWVZqcW9ZZ1NG?=
 =?utf-8?B?ZGJvZEpuNEVxQ3pTZUpxRmVqcEtDUmVsUUdySzliY0pqV2hrMG9pT2NHWHEw?=
 =?utf-8?B?bllLZmJxTUdTN3g3TlY5cSsvS2RCQ3ZIYzBMRU1xWVlIL1hWSGRDcVVhYmlp?=
 =?utf-8?B?V1RpVTNIZVdpc2hwdy9pMmlqeEJXallvSFkrYXpLNWNxTVJBZDF0K3NWT0d3?=
 =?utf-8?B?WFBwK0MxMmF0SVQ4RVNreUpUaVFuZHRaWTlyYTh4amh4M25BdVhWL2h6eG8v?=
 =?utf-8?B?cnl3dEF0SHg4azZJejM1R1hCaUM2QXo4TTlvUlJmNVc2aXZnNSszRzVnbW96?=
 =?utf-8?B?cUZuUmJPT2ZhNS9wUUYvM2V6WmpLSlFIeWFrNzJSZ1ZpVnRLM05DUUxGNWF1?=
 =?utf-8?B?ZmhxUWJrZXJ3ME1CK1dYa2J4VEVMN2tnRlhjMkFGZUNCRzMzRGZvVVAxOFAw?=
 =?utf-8?B?b2NMNXppWkthMDlQR0wrTm12UnBtRHk1akZWWkJ1T291cGQ0elhzSnM3Ryt2?=
 =?utf-8?B?U1RmejkyMlZWcHRkeEc1ZEsxWDltT0F1am13ZWlyL1V0YjVtektsdWRNTnll?=
 =?utf-8?B?aEJjR0hYYnoxWXVZczB5a1F1Q1hweUhiV1p5Z29MRUZFbllVRk53UE5OK2xI?=
 =?utf-8?B?QnpnVjNMVWpVSEh6STVxMWhWT3RJaGVDdFBDU09LTWtrSmZOcnU1SmRGN0VT?=
 =?utf-8?B?QkI2ZnVoNzkyWE1xRU9QNDcxcG1ZTE50NVppUmZzUjQ1V1c2S3c0WiszZzYr?=
 =?utf-8?B?RTQySUdmV3ZoNDZDOEUvMkRzUmQ4WWlHak4rRzZYSGcyZVFhOUMzTWt0TWNG?=
 =?utf-8?B?WW1JbThETGNJcExWRzBxMk1jVTZGQnpzUEdYNnVBRVNNcFppUHhnL2JUdW1F?=
 =?utf-8?B?blBCQ2RxM0RrQStjbWhIaFZGTUVNdXVtd1FTbW9RM204bXNQWHN5eTErWjE2?=
 =?utf-8?B?aGpaKzd5aEQwV2Z1M2tLVHJTWlRQWjlRN0d0VFlnRFV2aitlcUFibllFemlq?=
 =?utf-8?B?ZU5vNThCM1pYZUZDOER0aDN0d2NROGZFSjVGc1VDUHZCblhNdmE2eUtaUHo0?=
 =?utf-8?B?RnM1dzFDRDNHWGdEczR1M3dQV3BKcExZb0NhVXBwbzN1UDFLZEpCd2J4TWJt?=
 =?utf-8?B?YU1kSjFrSEJTSjZmcitFUitXUlRTdTM4VzlybzNISGk5K2pOL1RNeGJhTGx0?=
 =?utf-8?B?RGt0bDhRcTE3UGtGM0pCUlZOeU10R2xpczBjTytOeENXMURRcy8zbm8xeURp?=
 =?utf-8?B?Z3ZaSGoyLzA0NmNCZk9yUll2N0FCL1dqcTdNS1o4MUMrYlpMNmlBZVBQUVZh?=
 =?utf-8?B?QWZmRkJkcjMvT0xzVXdyd09UTHovN3BhQmxyR0FpSG5LeXd5Q21laHRnL1hh?=
 =?utf-8?B?QzdtTkJ6OUJNR2NDZVl3bnVmaUd2R2h4ZnMxQWhrckE2U2ttZGg3a2cyWjl2?=
 =?utf-8?B?VUo4eStRWVNUVzd6TG91bkRxelh0bEU4T3Z3YmltS0pVc3RGQXlTUVJlMk50?=
 =?utf-8?B?MTVFZjhlMDFTRDcyMGdya1hHTjVaTkNtMjNYOWtpYWhzMy9iWTJYTXJ2eVhT?=
 =?utf-8?B?L1A4ZWhXOWZZUHFQbDdLMEJMNU4vbmlYNlU4dHpFNE9lWHJRM2svL2swajhF?=
 =?utf-8?B?eVh6SmFYditYUURTbXIzNzJ1RG1XcnZ2c0EvTklNUkRzTnlRNks5VHNBUng3?=
 =?utf-8?B?N2QrckxFOExVbE1HZkVSejdZS2RWQ28vRDMwNmFTcWIxaGpIQVpZUHRrTFJS?=
 =?utf-8?B?T1pVYjdGN0JZK2QrSzd2TTBiR1lablZlbHp6SEVQMno2cEdUdW9CbVhPSitH?=
 =?utf-8?B?UzUrYk8wbzB5c2phaVYzSnFjN2xIc25YNEZWVzVPSFJoeFAxUVFHMDFhV1ZT?=
 =?utf-8?Q?tmmWBm0HLnbk+uvA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 013fd9cb-bda9-447f-5605-08de414c0a2a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 11:19:58.7016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eI/jsiapp2ZCR+QafqMx1TvXNqzBnbsBF9vNk55jAVh2mGoRkSVhkFPXf0H8xHQQGDRMiayXmN7+Z2L2AKAfwiLUr3POznq0eK+6uLdtj1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9351
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


On 9/6/2025 2:38 AM, Swati Sharma wrote:
> Add function to transform the enum into a string.
>
> v2: -Improved func() doc (Jeevan)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   lib/igt_kms.c | 22 ++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 23 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index d240c7ac5..1d059a8bf 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1801,6 +1801,28 @@ bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int
>   	return true;
>   }
>   
> +/**
> + * igt_get_joined_pipes_name:
> + * @val: forced value
> + *
> + * Returns: A joined_pipes enum value into a readable string.
> + */
> +const char *igt_get_joined_pipes_name(enum joined_pipes val)
> +{
> +	switch (val) {
> +	case JOINED_PIPES_DEFAULT:
> +		return "";
> +	case JOINED_PIPES_NONE:
> +		return "-none";
> +	case JOINED_PIPES_BIG_JOINER:
> +		return "-bigjoiner";
> +	case JOINED_PIPES_ULTRA_JOINER:
> +		return "-ultrajoiner";
> +	default:
> +		igt_assert(false);
> +	}
> +}
> +
>   /**
>    * kmstest_force_edid:
>    * @drm_fd: drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 6ef6871d5..b52429bdc 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1286,6 +1286,7 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
>   int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
>   int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
>   uint32_t igt_get_connected_output_count(igt_display_t *display);
> +const char *igt_get_joined_pipes_name(enum joined_pipes val);
>   
>   drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
>   
