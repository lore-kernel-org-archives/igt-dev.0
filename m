Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF0CD5B161
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 03:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14D210E290;
	Tue, 16 Dec 2025 03:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcD/+p/6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D439310E290
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 03:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765855667; x=1797391667;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ws1l/eQ9T8vrtTou9RZdEjSe1JlN9CZHMVPOV+pWxTM=;
 b=VcD/+p/6QnTZBpM+EbYZGO1YcVttJacjBllJBGtVE8Zb5l76qIQIVJzi
 DHBuQ26bz4PSqKZZAaIYaK45eRdPfyVRAGbd9M01I6aaxBbm800nJMGo9
 BUnDdh7WZtb77AHlRlpZahFRKRHSpLNaNy34/mbihgS3iq1dvz11D+GMh
 Ayj42/XsdXGRo3/YyJis793TK8zd4IO+LsWLqLaSztMt4dEwiTlwHRTHX
 /nrUT08Yyjf0qF5k77G1hS2gbSBroIBrVXbBbnpLRBP2PFMCROVz/yOtX
 gSMkIgVN1QBKZM9XVE/u76YsHgQju3BTkQdEZHvg9p6wHv7D+uujevneo g==;
X-CSE-ConnectionGUID: dds6+zWSTTGE4sy5HAmmxw==
X-CSE-MsgGUID: 6pTn0a9UT0OU+BmUWXWW8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="93244899"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="93244899"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 19:27:46 -0800
X-CSE-ConnectionGUID: U1sqiORUSgKDm8tlrLiBgQ==
X-CSE-MsgGUID: F3cRZn7LSF2xbH7tc5+qRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197792045"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 19:27:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 19:27:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 19:27:46 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 19:27:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6pxiZyErrIXX41QXoh+DHO3v8f2L+AxoFtQCI3hRXOWOsRj8Xt5gf2BXK8F52d6gtEB0bcCj1aWYcp3wT4nSEW2le7FuPPjpujZs6WJB3S2rI7ZkaX8aK3U7pdEF1YEWttX3RjE6mZfd9AaoB7jEbFpAmQCGqp3Uz76zCmZguNxNb3W1/k7kxYm45I7BZ/RexdC0/KF6HQi/6ZWB7l41Ejd6erMxpmirtlf3fBLB1c2TmsO4pU7cnmTP7XKinZeANfiQs8c7FCFEhL9cTv0lHNH6As29dM1Xz8QUixXoOx8YxsQzj1kcfPnuNpS9s665ObC7AMvuT8i2KJ0HM/FkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXFyc0WKO0/YPtJzYpikaWxBFe+YVqrZrqSegTJE67U=;
 b=c7Oy4C4Q0rfobhh3ZydIq1OfKIQaO5vj4fd9ogtkpsKJmkVMMwGnQrCs0EndLgiinSE+CdIRephHZL9cs9TjlW6YdPmK/GD+YW9v1ChPbOH6jkjZRtTms/gedMaNE6fWWmyv81BS1lD4HpSxPzVJr+Cndew4FwfFDLBEG9VwJ7pKHopNe6Fln5CVmf5efpkFHBjkCkKAOmGDOYkFQaovItjwNjdNO/cKvmBRQRMblU1eeSnbAeMKB8QTrJ6MzXEBUHplLPaXQYcNJrEfRL5KjTKdkXdKz6h98KYNP+xnnGU5mKKYauomk80d8Nn/1PxSUa8ubOCpyCJndfETkkTn8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 03:27:38 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 03:27:38 +0000
Message-ID: <ca20e864-97ec-4e10-ac2a-a106e9497343@intel.com>
Date: Tue, 16 Dec 2025 08:57:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 4/4] tests/prime_udl: Fix i915 device opening
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
 <20251215223639.117028-5-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251215223639.117028-5-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: c4875eac-f09f-45d5-5418-08de3c531032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|42112799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K09GNG1hU1hvS25VUUx1eFNLVzJwWll1OTZEU3lFKy9NanJER283L25xckhl?=
 =?utf-8?B?UVp4Nk44YU5rZDZ6UnZYWjdSWmFEL0d4b3BESTVDMTBUWEdJRXk5aDMvY29u?=
 =?utf-8?B?MkpZcFk2SnhRcnNmWTNFNnAxK045QnNZTjRaRy9ZUSs2dzY4Vms5S3AvQm5U?=
 =?utf-8?B?VXcvRUZCREZtWmgyVzc5OTF3czFLRnM5L3dQRS9qR0lmNFg2YldDMkpVczNS?=
 =?utf-8?B?bERxNFdwbDVhVjBXb1o5dWhKckRwQWk3dFFsVS9zQlE2b25LZ0tXZ2dSN1ZX?=
 =?utf-8?B?dkRKcWdFWXc2eEhpaU5yelBTSm03QWladWlIanR2Wlc0aVZqbXJQYzNjdE9u?=
 =?utf-8?B?aWo4R2FoOWFGbEFmSndFKy82eDVrN2V1QTZaZ3locXBKU010YWdhaWR5eGE2?=
 =?utf-8?B?UzU2cXpoQTN1dnJRaTJvbE9VaUV5SHhhU0ZUbkpVZld1YUtVbW1jTHlvQUhO?=
 =?utf-8?B?UTdNeDJjMUI0SGV0QWg5TDVLNjk4YVQxV3FqRVlKTnpTdDd3YkpVcWRucldj?=
 =?utf-8?B?Sy9rd01OQXNYQ1AxR2gvM3JtOVdvcnhHVjcxR0d5RlhHTGFIVHUyR2djM2xE?=
 =?utf-8?B?cmxHaW1aekliUDJwSmFuaXc5OHQyaTNjK0RtbnNQQ2MrY0RhM3BuTzdiaml3?=
 =?utf-8?B?SmNSOHZ0ZnJMNGFlMklhVUVHUWhjWjFtSU1RSytLeGRob0wyRWFoWEl3TGFx?=
 =?utf-8?B?RkwyMkg2b0VpRTZ4dkRNbFJzUUl6VFp4dDF1WkFvRlVvL3B3dWtzN09wQ2px?=
 =?utf-8?B?WDROZVRjNzJuLy9qWkpQN3ZLRnhidmdlZXZEQTA2djA2TW4zalZmRVBZcDdE?=
 =?utf-8?B?V3VWZTBmYi9ucUhCN01FektxWkRuOHl4OG0yZHlVQnVDbkM3MkJLU3I0ekl3?=
 =?utf-8?B?dnRkdDY1VHNKbXBFODU5OVNNYStnNEV1TGE2bWl2aElXN0JJMS82M2I5cUF2?=
 =?utf-8?B?TEhhd25wckxRdmtma0pLVmxDWUlqcEwvYkh2TkFFSFVGL29ybUNmVUQ4TDMw?=
 =?utf-8?B?NFA5YTVYbXFmOXZvRTBVQnpnYWxnN0ttWWl4Mll4cmVPUStmZk1Ha1c3MUVv?=
 =?utf-8?B?T0xYS1UrYjljaS9RVnlyUkRZaTBjTnRhMEMzQjk2c3FMTUJEQkVndGZMUVlR?=
 =?utf-8?B?UitJbEp2ZWpONFJET3FSRVVWc1RtUHhkeUhnNXBuZEtpZm55Ky8vTm0vMnVQ?=
 =?utf-8?B?dFI3NjBoYzRiMUhueldrVHgxLzBLdzBmVER4TTArVnVCY29BRkhScXRoQU15?=
 =?utf-8?B?d2lORjV3RWxocmg1OGlBeDkyZTZ3Nk1nTCswQWJNL2pyNWNpMVRuN2hld21m?=
 =?utf-8?B?NStHWnFWSDlvLzBKKzVRelZlVU56UHZHK1hRYzRxOFFPVWRPVDZXYkNxVURE?=
 =?utf-8?B?QlJra0hPS1dSWW00K2M4bmFEVlFRSVR1M3l0VlNWc3doKzBZWVEweWlOeGNJ?=
 =?utf-8?B?UGtza3VMZStKNGxRREl4OXR2RE9FaDBwN2xGbWN3N2xPOXBtQWZkU2o4YzB1?=
 =?utf-8?B?dXBiQjl4STlGZnNrWjJYV3c5YVZHSlJya25EeXFvNXBjNTNUYnpYT09qa1Zv?=
 =?utf-8?B?VVM5SXcxaVBSaGlLUTJ3YWlSb2h0MHdEWGo4WmJiZFNEQlk2dUhTSVhIVFRC?=
 =?utf-8?B?dk1JWVpPdnJQTmFpRS9PNXNYdGdGaXlXblRZai8zV09oOW02V0U0WGNBMmE2?=
 =?utf-8?B?KzF4ZDU0UUhaRlNzTWFNdnFaVlhTT2NSWGJGenQxNXk5ejd1S3o0TngrOE1F?=
 =?utf-8?B?OEhOR0Q0SVZpNktXTy9VRElXdUFVUkNpZTJpbmFzYmNER0FoT2lIK1ovVUxK?=
 =?utf-8?B?TVRycndVbGFsbm11NUZneVg0SzRXd0V0ckluYzJ6WXZuaERhR1BIRDl3d3J2?=
 =?utf-8?B?dytjbVJwSnd6M3BHaXlRWkdxcEoza1JBSTlvWjg2VkhlalVpck94aDROL2Va?=
 =?utf-8?Q?TUMV1l2X7PulkSvU2fNg1cGDJI+waqZ3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHRLdTB2M2VMKytMUm5jV1h3TS9zOFJHY2VFL3RzYVVaaTRZMkZzOGJVWW5h?=
 =?utf-8?B?WkZpbER6UGFTRTRTNEV3aDBLNHJSZ3FDM2pER3A3V0F4VzNpR2FDaXZXM21a?=
 =?utf-8?B?Sm8yWUNXR0hRS3N1VUYvR1JKWWkxNXB3TXVRWm1qbkpBL0U0R1ZsNWxlWW1m?=
 =?utf-8?B?MVRCSi96Z2NNT3ZmNmtFb3MyNUxnTnpmbmlSNkNvZFhJQkVTN3g1RkQxZ1dZ?=
 =?utf-8?B?Rm9iUjk2ODZlSitXOGVtaWplRE94T3pCUlNsZldRR1ZpL3J6SzdWVDVFTTVP?=
 =?utf-8?B?RHFlS05hTzI3TGhNUjRxNWYzMm13UFB6MjVLbVg4N0NjaHIyMVlXcW5Oc0lY?=
 =?utf-8?B?R2Q5dmJjN2JqampNaEZ6QTMwc1I2OE1RbVJQQlc5RFhiTFNlcnlRQW5iMUw0?=
 =?utf-8?B?dGtOY0xIcmtCcEVLdlRxNlR5YitlZmJQUVpVdVZOdzNJNkV5UU1nV1pJcWkr?=
 =?utf-8?B?cFRFNGtSOGFIK3hjTk5tcGlRU2o4T3M0RkxQbnJEOE1LdWZQU2hKRXFuUlFl?=
 =?utf-8?B?TS9yRm5hdlQzekd4blBYVGM2bVg4am5wSW5TSm4yNHRLMXovMVUzZTJmdzI1?=
 =?utf-8?B?SjY5QUVtdG1uZFZOWllHT0xxcTdOem5hblkyYVJ1dUE2cWlMeGtJS1FwZnpK?=
 =?utf-8?B?U1UydFNWL0JzR2J2NEVxOUpwQmlOYjlYcTM3ZnJjKzNVaHE4MVRTTTZPWThI?=
 =?utf-8?B?aGFGUkZMRXNkUlF2NXByMmNrR3JSbDFzMWtWYy9BQndvRWxOYjgvajhyajVM?=
 =?utf-8?B?dE0zU09RNFdIMkpDL3hjamJjM1J2V1BtRng5eW83c3paQm10R1haS0ovT2hW?=
 =?utf-8?B?SE1NZDZQUzVpUTBJSXFvVG9xb0MwbEZJUzdWOVBTUmRueUtDQnJ5bUQvTWN0?=
 =?utf-8?B?Mk5KU3plQTEvbGNMYlJIZzRkRWI4cnR2V1hKdDcxRTVSTHM2eTVQR05XY3dN?=
 =?utf-8?B?NUxsME9qY2gwbmpQYWdTanBQODZaZXh2R2dCMStQMjh6TXh4WVVMTUQxT29L?=
 =?utf-8?B?eUczWSs0dmNyOXdBNDBpR2lkb0JSS0tqYVhjcDRTODJUSWg0cXIzalE1Wlpk?=
 =?utf-8?B?T0hXTzE2aU9EMDFnQS9KVjBOTk9GamUzQ2o4MGY3eVVsZEhrRTRnQVAwdDdm?=
 =?utf-8?B?QXlyWk1oN050eG0xeE9XRXB3NEhhWURyL2kvaDFiOG5vWms1aUU3cEJudmM1?=
 =?utf-8?B?d2F1TmRQVmlYQ2tNQTlaTi96bEdQSTRVUUQwd29yWVI2VVVla1c2QlVrNFdN?=
 =?utf-8?B?K25xUVpWd0I0WVROZzdteDZIL0g3UWNIWW82ek9aczVldEgvMldyWjhYYTNV?=
 =?utf-8?B?QW9HVngrREIyTHR5STY4OTgzaEUzTWI3ei9ha1N6RHpGUTljcUpiNExKK21L?=
 =?utf-8?B?VTBaZXU5RXNGR2JGOXhJZGVFVkk1SjlmUTJXSkxLOUlvMG1kK08rUmhrOVkw?=
 =?utf-8?B?ZGR4UHJiMkdkZFdNYkx5TGR0dnVyanhsUjFGRDlSd21SOGEwMlRjbW1LM3pn?=
 =?utf-8?B?UlFtamszUU9zeVZsbFFUVEk5a0EwQ0RYWG9wNDVtaFVleGZTOEFCTTRSVk4y?=
 =?utf-8?B?ZjdWRFBsWDNQNkptUE51K1NBeitnQzJDK1ZYcWVBdTgrRUZ2cjRjdWNGaW53?=
 =?utf-8?B?bzlPcmc1TU9tWUdvNGZHVXhMVUpXelBQMXp6cHp6cVhveS9odTRCRG1pZ1hW?=
 =?utf-8?B?N2xIcDFkN1cranVlYUZING5lQjk5NFo0VFFiK1hpbzZYRTVoV21ycE43ZFRs?=
 =?utf-8?B?ekkwNGpGZDlTNHFRQUtlbW1IQkNFZHZjZkFZbFp3TWJKY1pTQkZ3UXZES3lV?=
 =?utf-8?B?bDJ0ZmFmSVFDOGpYL3pBb1ZwZGY3QjVMZU5IaExRSVoyOEo1S3pkQkFkcTh5?=
 =?utf-8?B?dUh2d3RnL2twZ2dTcWgwTDAySTNzY2kwZjlHZ1d0a3lWMllKYWhvMmNjRFM3?=
 =?utf-8?B?RjdZeTkwa1JnbXJPVitOYmNEYlphMERTSEhmNk5KOG83MDJRY2NwRzVvT29Y?=
 =?utf-8?B?SVR3bDB0NGJnanZPcW5KU1Y0NTR6Z1c5V25PdjgramJiS04yL2hYZ3N4VjZQ?=
 =?utf-8?B?NFBQWTRkRkJ0NTZWb3VRd3h4UGJhRDEwZ1hMdTR6UjkrYW50WXBQaUhhMmFU?=
 =?utf-8?Q?/h/1pqzv4/4K2sStzoBFU2IVW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4875eac-f09f-45d5-5418-08de3c531032
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 03:27:38.8160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyF0nE0aUAkbM/alYKNL3S8l2YiClLoUR5akWXaKJCMNBNp2ThStb0j27vpQP/JL7aqP/BxCbLG18/Vp5iEI9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6991
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


On 12/16/2025 4:06 AM, Kamil Konieczny wrote:
> There are now Intel cards handled by Xe driver so make sure we
> open one handled by i915.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/prime_udl.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/tests/prime_udl.c b/tests/prime_udl.c
> index 8dcbfa58c..fec5e2f02 100644
> --- a/tests/prime_udl.c
> +++ b/tests/prime_udl.c
> @@ -49,6 +49,11 @@ static int find_and_open_devices(void)
>   			intel_fd = open(path, O_RDWR);
>   			if (intel_fd == -1)
>   				return -1;
> +
> +			if (!is_i915_device(intel_fd)) {
> +				close(intel_fd);
> +				intel_fd = -1;
> +			}
>   		} else if (venid == 0x17e9 && udl_fd == -1) {
>   			udl_fd = open(path, O_RDWR);
>   			if (udl_fd == -1)
