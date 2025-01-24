Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F9FC02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 04:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEEE10E1B9;
	Fri, 24 Jan 2025 04:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7pE299g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAF310E1B9
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 04:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737692780; x=1769228780;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uDFMY0z4SpdY5ZM7Pi/clcToAOdGNDVkbIgwbVBRfEQ=;
 b=h7pE299grS3aBR8S0AJFX0Le8tUn1qH18Vkmi6u67S7mDXQ0r2NCvcAe
 z4xtKCboDX0tAAOUX0JHfI0+yJSHCoLArVewLyLhXG52hskgzkrTPXVva
 XRRMA2tOnpkYJUeyuFZ6Ppt2lmsslAUVMB5iqHpnkunzK82mNkdcCTiMy
 WADsvR2MrcG+JeMh+TnSm+zl+WLoixGu/jj8jKqMTA/xAz0nawVkOp2Kp
 DzT1G/2259wQJd7PVVvhzEawOd7BzHDXzTU9MNF9QMFx5M5tUutvQvTVS
 6/fkCwo0Yq79ycgBS6P1cQJB9aP6OkMwmZryiPO8vKYo1b1PBFP6lRarT A==;
X-CSE-ConnectionGUID: oyujXI4eQnOxpZGX5RM8yA==
X-CSE-MsgGUID: kaITSRPrTbyWkJ61Egu+uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38474793"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="38474793"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 20:26:19 -0800
X-CSE-ConnectionGUID: igDn9EUqQMOiTgH2e+Rg3w==
X-CSE-MsgGUID: 242t1LMiSaSqj0H7dpMhEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="112694090"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 20:26:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 20:26:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 20:26:19 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 20:26:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKpTz42sXzi+B9C/i7XP8B9rZI23Qk/SUDYH9BGKKxhshpO4lk1ftFXPs7fXA5aTbuFpj3YlmNsZmJ0GK2sE0ZEu0WseXqsDBOVejs2mPfxzlZuPvc+et2U0RK2QDwl6OYDSt5kkSrZxtZSmH69ktaveB+D9i440P/aJcEzzoUpjJSz4j3smcQUZ3thlm4lnWzEc5s29UbqW31/JUZ0wVv+j80E2VOgjMF0Rm6p6bdxpyADWnVZnlTevgPSElzWX5eFPs5N3gXsUegl3yk2vNJKXYCe0ROryu+T5r71mhHms1mOJNhvTdaHfPbyHib59DclowSpzzKPAIh2u5Yn+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeN+4CPyI8iHasjt9OkkJ/XSk7HK74FMKjqj1p0qSMw=;
 b=tthcagwBUY2M3XgfvuZl9533IAdNSFAkqVMiqq9tLrmMEzfF5TPve1TVHbnqr0yrFkOvPo0JG+w09q7iN6LASFwyf2ACLBUPJaIsVCxSh9kRa4EQamadp3FuvGlT0xM/yEFlnVYVhddlAKvA8UXS7bycf8Pu+EqdH4dbDNsmjezFYeeZPfNxj8MO+Y8tzhYsSVHTcD72ulBWH13ZmaSlPkWi4QNQv8PrkwqA6USgAj1gNbVB2MFAtDDMLugrwtmyX0Sj6XWQjxL9L8xo4fQATAx1PoJTZ/pwO4iChZ1PkgiBJ6XaTUvhFiOx5W7HDLtOqXW3EHjhemdiQ/sJpuwREg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA1PR11MB7174.namprd11.prod.outlook.com (2603:10b6:208:41a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 04:26:11 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%7]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 04:26:11 +0000
Message-ID: <3a4ee176-d941-45e7-893e-015727fed23e@intel.com>
Date: Fri, 24 Jan 2025 09:56:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 5/5] lib/igt_kms: Add function to get valid pipe
 for specific output
To: Louis Chauvet <louis.chauvet@bootlin.com>, <igt-dev@lists.freedesktop.org>
CC: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, <nicolejadeyee@google.com>,
 <seanpaul@google.com>, <jeremie.dautheribes@bootlin.com>,
 <markyacoub@google.com>
References: <20250110-b4-cv3-01-igt-kms-v4-0-0b0474708f9f@bootlin.com>
 <20250110-b4-cv3-01-igt-kms-v4-5-0b0474708f9f@bootlin.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250110-b4-cv3-01-igt-kms-v4-5-0b0474708f9f@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::21) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA1PR11MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5ae2e3-ba66-4544-2666-08dd3c2f3b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2JnVVRQVVlkcEhNNmNpcHBxSFp6S2tPV1l2S2ZILzYwZ1FRb1gvUURETFVX?=
 =?utf-8?B?NGtTWC91ZTlmWlZiTzM2dWh6clEwa3Fza0pnTW4za3FDY3djN3ozZ2VISTc3?=
 =?utf-8?B?MEFpU1FPRXRFNkxyd3BoWXJJZmd2Z0M5c05ockNWbmVKd2htVXIrdjhjSW91?=
 =?utf-8?B?Vmo0ZXA1OG1EdzZwNjlDc2RBSjdkZCtNQTBqODdzR01vcndTQU9uaGNmOHh3?=
 =?utf-8?B?ejVna2ROSnZRSEJ1dy8ycFRWZVFMZnd3SzgrY2RDeC90aWw3WmpVUHhmWDU4?=
 =?utf-8?B?NXk5RmJSeFRyYmUyZ1NZUEsyRVJKVnhqMVVhS0FUc0xhMzUwVU1FSXYzbUd1?=
 =?utf-8?B?cEk5dDZWNEZtMTY1TEIvdkdoR21UZjZVUzFDTkZPbmRWRTJTMFNRTXZ0UzU3?=
 =?utf-8?B?QjQraEQ1Y3N1SUFJM0syWWdpbUdpN056YnJ2OEtEa0Ivd0p0c2FEdll5RCtP?=
 =?utf-8?B?YmhWM0FxKzRJOTBuNThmamNYdXQzbjhnZ1BOdGhPNWRyNkVzN2lSdG1iOHRx?=
 =?utf-8?B?VFFzaU9EUjlySHlkOWFiZ0tpU1BKNEdCV0MxZC9JWGJWRlhlNGdoUWpjbUkv?=
 =?utf-8?B?d1ErcGNKSzg4UVpMb3FQKzNLMFFYS1lYalBuTzJGWFBreDNobVBpOE5aTlVu?=
 =?utf-8?B?bHlFcGlkanhRMENSck5mQ1ZQbVJNcEdNMzFiRVhVVmw1YnZ2WWt3RjVBQlIw?=
 =?utf-8?B?d013b2JFaWYwWmg0TzdVNUFNaXlTUEl5dTZ0UE94eEE4RkRqK0V3dU16S0NY?=
 =?utf-8?B?d1RSNzBveUxObTJmZldaRmU0MUVKUDB3R3psZDJNTEtBM2paYVBnazJjQWo3?=
 =?utf-8?B?RHBWZ2xvb3dBQkR4aTJ6aGdpS2F4NDQwUFF5NDhOTkk3QUhzYjlMMUZXOTNP?=
 =?utf-8?B?RGlwams4TG44WnV4ZmgzSnFpMXlmaTBvUXJTUXFFMHFsNzgyYWJHczh5L1Vt?=
 =?utf-8?B?MERKdUFRdWZIcTlJdEFiRXZybEhYeEtDVFduYzhBWWRXWnMyZmFZUm5nMmdT?=
 =?utf-8?B?am8xZUttZ0pjcmcwTFJKSmJQYVF2SW9pQ2RTZXc1clh6c25BZ0hpeDRwQUNQ?=
 =?utf-8?B?Wm9CWXlocXlFMm4zM3FTNFNGL2lVOUV3eXBXYy9HSmhDaW1GbENNYVNjS0pL?=
 =?utf-8?B?blNBZ2VBdkIwUndqeUh6TXpKTUpUSkVObkY4Q0xXMHVpUlBIbTJuWThNbjZ3?=
 =?utf-8?B?UGZ3ZVZZWE9BUkoySjFXalMyd0hrV0pWbTV0WFdnVHBWbCs0M0V2UHNJellM?=
 =?utf-8?B?VDNWS0JpSjZ3SlNUVzluTjV2Y3RNdzhsQS80NjhZV0hPaW43b3E5Wk1vRzZS?=
 =?utf-8?B?U3JSZnRmL2p4S0owc0RzYUxXRXVHcFN6N1FHUHo1UnRNeVRkcjEyVFM4NUZO?=
 =?utf-8?B?MjI4dHpkMWYrc29JdFM4UVRMK1hETXBmQ1ZwK3pSUzQ0UnpuUWFZZytURkJ5?=
 =?utf-8?B?azRKMjRIYm12NXc4K0dwQ1RhdHVYTmxuWGZ4WWhTc0pnaUZxWkFNU0s4VTBR?=
 =?utf-8?B?eUhpRWVCWlFXVEZLbks3RTdLWVFYSU42QVRSbk5kWDBJSHFCWGhJSnVBOGlT?=
 =?utf-8?B?QTVYYXhmLzFWZDVQVUppYUlmdXoxN0JNZExkSjUwRThyOHJjdWxPQUJTTEVW?=
 =?utf-8?B?MERvWE9lNkE0bUN0OXIzTkJOZEIva25tTEEzRzFxZVYyRkxsb1lPUS9zQVdE?=
 =?utf-8?B?eFoyanV6NUZiMjhJZzE5eG5vS1JyMitaNDhDL0thcWlnT1FjREVRYWRHR0pL?=
 =?utf-8?B?VWwxdkRqL0lieTZSZ1U4bEgrMHF4OHdaUVRLbzk5RHRDS3ZkbDRqdGFvdHVF?=
 =?utf-8?B?eTJoVjNPTElrUVhvYkQ0RUllcTZCTWVIemNGeUtzYmpGSEJaMVJBbjdVamNs?=
 =?utf-8?Q?Lo+++vmHeN8Vh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MThnVW1NaVI5NEtid1VqWjB5Qm9uR0dRZmV1djZocXc0M0s5N2hxWlhIRGl6?=
 =?utf-8?B?d2lTUk9ZUjJkN0NJSzU4a0dHQmZTMmpKTjVKa1Y2YU0vNlNhVG41eXhZM1dx?=
 =?utf-8?B?V3JuejF5eDA3VDVROE5rN2VqODd0ZHJVUnYybXZwTy9NR3ViNkZ4MVJZZXdh?=
 =?utf-8?B?Q2NRVWlSNDJUTmJKeDZxdXlsZ2JIKy90a0V4UlE1cEs4NmkwSmlGejVuOXlL?=
 =?utf-8?B?dHJjcDFxL3AxRmdDZXoxWkVHSmlKSkZrZWpCZVJEc1l3aFFEYlR2S3pqMUdu?=
 =?utf-8?B?RGU4U3lGaHA3c0RNN2JzY2wxMnI4aSs5RFNCdEdsNERRRG5ackx6KytKNk5N?=
 =?utf-8?B?dzU3RHM4U2FlTWJwakw4V01yVHNqVGlsYnlNRXM1TkU0TUdTTkR6SU15VW82?=
 =?utf-8?B?VHVlNDhBVlRPdzdlek1TKzE0bThoYjJwTVFkY3F3dlprQWRoSjZIUHNvWldU?=
 =?utf-8?B?eGh2Yk1Hd2xobjVEZ3Vwa3FBL0c5eEhVUlpEZWtSYnhBVE5BMUxxNUIydWtL?=
 =?utf-8?B?WXVqMDJ6VDV2c2RsdnRlRm1VQ1BpSDdpd3Z4TCtEc0NpTUJRRmV4WFhKNU1I?=
 =?utf-8?B?dEU1VytQczhaYldIT1hMVUl5RCtKdGtYMkFFN0VqNERjb0VWcENLeXVaVFM1?=
 =?utf-8?B?Q1FueTFuVXZzd3lDTGtQYnBwcVlHOGx5L2tGVVNvbU51WFFicWJmZkNmNWNF?=
 =?utf-8?B?akh1SnBvellkRW5xR1hMbE5lMkVMUlliQUZuZzljQy9lZU10endRK1F4QlFV?=
 =?utf-8?B?bEo0ZFlhTWxIYjVKU1BPMXNEcFRRMVJUZkFmWlBIK3lPditvaDBwV3RxNHU1?=
 =?utf-8?B?ZHFZMEZpTUxCdWVsS0hXak5FU1o2K0o5Zk1FUlhmNTdjNWMrdjQ2Q2g0cW11?=
 =?utf-8?B?aXBUSFZLZUpNZGJ6QVBkY3ZGR0Z4OHAvcUIyZGQ1cEFsU3o5OHVFb3g5SU02?=
 =?utf-8?B?V2R2TGxaTS9xZjZyQnFjcmdxbUdkZmJDNFdhcHNBNEN4aUFxVVgzYXEzbGcr?=
 =?utf-8?B?Q2VLZVpkK2xNaklUYmVzNDVNcnhmRFJ2RUVIdmlpc25UaDhBWVFOamJTWU1R?=
 =?utf-8?B?RFdibitKNnB4amo1elBCTjlkanNteXkvUGU0a0p1YzBxM3VsREJ0dXJ4U1V2?=
 =?utf-8?B?cm1wVHpwN3lZbGh4eGJjQkZRWTdmZmFCUSt4YWJpNCtVT2pZL0VTRkxLcit0?=
 =?utf-8?B?TnZhSXhINitONU56VEw1dkNBYTluZkY2SFlUZ3NBM1YrTWJxNXBNN2F6dFNZ?=
 =?utf-8?B?YW9FWmxTSjRHRVpyazI2MG9wcm1QdXdPMmlQMmJtbWs3dUdBUW5XcHZNV3NW?=
 =?utf-8?B?SkdOWXh4Nk5kWG9jb013WTF2OElWcmVNL0cvOVpUV3gva0lXUWo0VFZacjNx?=
 =?utf-8?B?RG82UjNHRW5EZm5JbEpNN1pyM0tiNE1JNTIxRXRPT3pFcThjbDhJa1R2STgw?=
 =?utf-8?B?TEpTK08weGJDNWhHTmZGN3NnTG1MRXVZbjduNG1pZVpzUklKQWthNDFjNFRn?=
 =?utf-8?B?WnZhTDd1akxscE1QMmY5TjJoOTFHemZvZG55d0QxUjU1eGlsU3RLK216bkdx?=
 =?utf-8?B?YkhCM0tQZmxnQ3dEMExuczhoalRDbkVJZlNqUnhPSkw4alhGTlR1MncwakZh?=
 =?utf-8?B?SjhLa3RCTVlGYmxSbmkwZ1pya0xjampmaGcxTFVTTnZNUlBBa0Y3MGlVUzdJ?=
 =?utf-8?B?ZlBVYnJCWHJuY1FZR05jUmMrWTBvNS9SMitPRHJuWDFMVy9wRnR6eUwvUUpl?=
 =?utf-8?B?Q3JER1JLVHlsMnBsMzBSRjQ0M3l6MWZ1bEdWMW5XOVdRUU9xMm1FdWxaT1Qr?=
 =?utf-8?B?a04zVkd4bzlvWHBhU25UMjFCWVp5dGN6NkU5eTN3VUFSQUJsNmwxODhRUGpS?=
 =?utf-8?B?a2tvb0ZFMlVtZWRGcmJlbGcvRDZCQUhwNW43NmRHT0RuKzJMMjJzaEIrR0s1?=
 =?utf-8?B?c3BoOVlaQnhCdVBaQjJIREtHVUViV201YzI5ZzJaWng1VjB6RWxMWllDR0Rk?=
 =?utf-8?B?d1hkZHRYSFUvcVB0VXZrOCtxcW9hZVQyVFZTTUt5SkxmL0Z6VU1zYnlQYjZp?=
 =?utf-8?B?MFMrWmgyMGRJTHRMaEtCaDFmamtSeUxEcy82RUJTU1VwL0pIb1d0YVhqS2Zr?=
 =?utf-8?Q?AQjDetB2Dc6/IQ9qtwJCy2GwW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5ae2e3-ba66-4544-2666-08dd3c2f3b2e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 04:26:11.3610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5LWfZJkwuO8tV/Kg9OnHPuUWEJGbmq477VE8ezxxPDksxhOFEy89NcBBkLXjewkZPLhnmQ9avqeXpkrb/YPzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7174
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

Hi Louis,

On 1/10/2025 11:12 PM, Louis Chauvet wrote:
> Introduces a new function igt_get_pipe_for_output in igt_kms. The function
> is designed to retrieve a valid pipe for a specific output in a display.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   lib/igt_kms.c | 22 ++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 23 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f6d9341b75b4fc8dfa614478cd3bf35510f9ecea..d6cd6833ef24a914da6e0234dd7eea40867df452 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7458,3 +7458,25 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
>   
>   	return 0;
>   }
> +
> +/**
> + * igt_get_pipe_for_output:
> + * @display: display to fetch the pipes
> + * @output: output to use
> + *
> + * Get a valid pipe for a specific output. The return value is the pipe first valid pipe for a
> + * specific output.
> + */
> +enum pipe igt_get_pipe_for_output(igt_display_t *display,
> +				  igt_output_t *output)
> +{
> +	enum pipe pipe;
> +
> +	for_each_pipe(display, pipe) {
> +		if (igt_output_is_connected(output) &&
> +		     (output->config.valid_crtc_idx_mask & (1 << (pipe))))

Please use 'igt_pipe_connector_valid'.

Also, this function is mostly a duplicate of the existing 
'chamelium_get_pipe_for_output'. Could we reuse the existing function 
here instead of adding a new one?

Thanks,
Karthik.B.S
> +			return pipe;
> +	}
> +
> +	return PIPE_NONE;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 3be9068384aa118461dd090224d15aa5c979ac06..60a90500048dd83620c8a6ed08b70d5ddb020bbc 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1285,5 +1285,6 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
>   drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
>   uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
>   uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
> +enum pipe igt_get_pipe_for_output(igt_display_t *display, igt_output_t *output);
>   
>   #endif /* __IGT_KMS_H__ */
>
