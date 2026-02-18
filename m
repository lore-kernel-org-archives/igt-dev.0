Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDD9E9A049
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 03:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E284810E2D3;
	Wed, 18 Feb 2026 03:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nj3LXACq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDD010E2D3
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 03:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771387066; x=1802923066;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EW3MVTE8GuEVs6lfOoDD74hPK8s62/xjWuTkIwrcU/Y=;
 b=Nj3LXACqdTGiO0hbR/EsDKmxLqyQiNfRdJC/Vq7onlNfEh9x5etUcWe4
 GmSRQ6p+kSblKcCQYb8U44U5wTVo8CKxlVwe6K2DgICnBeE5A0npMwya/
 ZEL+NFOPF+yNHKnIB3Tm+sthWKOCGWWj3SwJaGFh/7b7oPnHnPDLcPl+2
 /Hr3CT2917qqdPV44rtFxeb7M3MgHL8P8o8u5yO6boWgwhtI6NuYXcZvG
 QJyxhBhf0AcBihwXg7GlI8TYFTVUWf5zrd8JjY2p7mvMJjGd1qoEPlTRe
 kFPz3XLewktrDaLNZLg7yBbYb11Yj6Me/ZnknTSJZplzE0RWVbhzcUYMg g==;
X-CSE-ConnectionGUID: ErJLih88Q/q6vgYiDhZUsA==
X-CSE-MsgGUID: XhR0m4c6SKm+pXIVuPH7GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="90048812"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="90048812"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 19:57:45 -0800
X-CSE-ConnectionGUID: Xm6APNbRTpGzSVj5mv2jXQ==
X-CSE-MsgGUID: 3uWsk+khSUOyj0dt14fD7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="244671054"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 19:57:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 19:57:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 19:57:44 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 19:57:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCu0+s37N10AXuKjVmYq8qO967GisUkZHP6ZEf5tgyroDrYUIujocCG4CoRigKMr4skY4D3/Xwqg9HfRWaGN1J7K1pvvyC4ViKIh2uitP/w+9paWZO93OHdPltfXJUY14IcYhusfYVs96Y9FkoCfX3EWC0WzAj7nzAoZ+eqh+tv3vo5fOGSWqvmCg42miyAH1Ca+7HczHB4LHNThEh5tQRVfheyOGTMeWaSU0hVwZNUo4+S3WT8oaULENvV6WPJ6cR+Ll8UnVNt/nLtGt8Wjl1p03qB+aLmB8QO9psZhcE0attqlZ8f3cDJaC28ycnhgda3DGrjnWb0Uyd3WwsfeJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRJJAttUdX2S3TsWfQ4ZJ7JErZOXBZA3cFsR7cJREfM=;
 b=HOYoq14rXwpVmB9lfgcISd2YJqfEsovohBLWTFqMS+gzy8bpnC60D1TrUTtYN+pPMOUr09XKz//vFcX3jcjrMr4EAgWnpNLEHh6rk2B3u1dEbwg8JTkbg3NxmGAvG4K22KwWWGlqbKFdkV9ScCQw0MYQeBXxaKdehn/IxH/BFQbXrZS9ZdDR7Uu2qBNF8JKOB1WrIjXevu0NVpAxguFz59JYu2rR/4Ma13i6Aspw7GjrdEb4B6DELlvJnVzIQfrU7u9TCQPm4ZuAswS1PJ/HisE5H9Y2HwfMN/ASJhAo72xwhNvSNCGOHaOJP/3O1Iq8hrqR33OT3+aaDoqELri4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB7972.namprd11.prod.outlook.com (2603:10b6:8:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 03:57:43 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 03:57:36 +0000
Message-ID: <060fc9e1-2db1-496b-a4c8-979141bd7166@intel.com>
Date: Wed, 18 Feb 2026 09:27:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane: Optimize modifier check for
 unsupported platforms
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>
References: <20260217055606.1595789-1-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260217055606.1595789-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 239a6529-7a65-416d-4ed9-08de6ea1da3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0dGdXlYdm40azlncldjMkY3dFliRXBNNkt2TkQ5ZXQ4TVA4ZDlnWlMrQURt?=
 =?utf-8?B?WVREekIvcWZwWGFRdmwvS2MyRndoTzlOTjFXcEZUSkQ4VTZyR3RrcXhMVDBx?=
 =?utf-8?B?ZVArT3h5Z21zdDVMTlhPNWV3NjRJeEpuVE5lM3VCWlpkc09PdXQ2VW1SSmlm?=
 =?utf-8?B?OVlxR1ZRczZYOHJhWncveEdmeXROR2VlNzAwL25PVFo0dzllUkdDNFU3c2c4?=
 =?utf-8?B?UkI1QlArU24yaFVzVDNVY0tSaFEzdGFJZXdCaXc2aTJhQzk0aVJJd2hQcGM2?=
 =?utf-8?B?WnA4YTRWZHJhZHlubDEwNlB4YkZZbmswd2dPQVVNUkwvOXhNL01Wc3NieEVY?=
 =?utf-8?B?YUlVZXI4TVlRMlFNRUF6cEV2SnF1aC9UTWdLTWRUYmNtRHlyQWhNQm5YVUZJ?=
 =?utf-8?B?amU2U243MkhucjVYYTV2NmJXM1NnaDFyYUtNYStrSFd0OURmZ2NjMUxpTWgw?=
 =?utf-8?B?RGN2b1ZWbi9XWW10OE1Wa2hjTml1NTJncURSTDZuL0RBRCt2N1VNc1g1RnRn?=
 =?utf-8?B?VHR3NkZTU1FVMHAzU01HY095UllTTXhNOEpMeEl0SEhRbU9zY1BwT0Y1a2lQ?=
 =?utf-8?B?UmsyaDcxeS9hdW9pWWM5a0ZPcFg4NktUZHFFWUZJOW1VYzdsaG40d3ZmZjl3?=
 =?utf-8?B?Uml0Vnd4L3FTRmFiQWVaTzgwbXVqazF4ZXlPRnJ0dExjRG9xVmNRSi9xb28x?=
 =?utf-8?B?dzBoQURHM2o1QW5MV1laRlY0TkZiYklqNmZtQVpvcmNOMXFpZThqRUF2ZXFx?=
 =?utf-8?B?MFRmRG5PN1krZjM1N1B2a0pZNVZzdjgwR1Y4N2o1aVBWSnhUSGorb1lrOWl2?=
 =?utf-8?B?Wjd6YTdqZXlZelg3MUlkcERDMkpGQWRlN3pPY3ptZWJuM2F1SW5ScFlyeFgr?=
 =?utf-8?B?REZKbGROU0k5eGdkcSs1Y3E3ZWFBOUs4dUZGUWxUMUxRbXV6dWJIaFpmc09W?=
 =?utf-8?B?ZzhjcDBsTGNmU1BoandFenExc0VZNndlVlh4eFZ1b3BOU3QvNTdZVGxmamV5?=
 =?utf-8?B?ZDZXZW5POTNOVUtxQmZkQ0owaDh0bFd6Yjh0eGFoMDNYN0dVN0RvTlJtTHlq?=
 =?utf-8?B?VldMS1d4K1BqMFBpZGUyUmdOdm5uTURrVk5PTnp0amVRbmU1dXVYYkJKSDh0?=
 =?utf-8?B?NGNNRVlzQWYxTEN0MndpU2orY24rc3gweFFrSzlNRHRRbXBGZ1BCa3Foc1N5?=
 =?utf-8?B?VTVacDNZL0tuZFN2WDRCSGZMWHlWRlhObE02Q2Z1bUdRK1k5cEY1a0NRclNl?=
 =?utf-8?B?WGtjTkY0NTFhWm9PNGo5bTJqNEtqejU0SFFrdHBtempaV1RReDIva0xReDA1?=
 =?utf-8?B?dHI3bUFBUUY2MG4yMlh1SjBzLy9uYmxXVUJPVHBlL0pHZ1R0Y3liMHVSUWM2?=
 =?utf-8?B?OGF0U0JRakkvVmJ1bnl0czc5NlROcVZvSkNPOTlZNStmVjR0ZmdlTk1aNS9H?=
 =?utf-8?B?TWJUZkROV1ZJYnN0NFBPZUduSTRDRzNTdXJBQWhzUTJwOENlY3NxWE11ZVhq?=
 =?utf-8?B?K0kyRkxoRmV2MjhYVW42YXF0SDRINHhDZkpjeGRWbld2OUhIcWc5bDZYM0Zv?=
 =?utf-8?B?Q3l4SlZxQjVxUWxQcWlMZTRIZERVU2ZydEdld2QrSisxNGhxNmZnQ2NPelBh?=
 =?utf-8?B?YTBGVC8vUXFkcWRDYStUTUV1Vk9KNy9FU1FrYjN4cnZPZEtQaTNPTjJ4Y0NQ?=
 =?utf-8?B?cEQzR3ZldTVqNXpzWmljaHFCOTVxWCs3VGdkeTc4VWptNFFaUHhJMGJFejU4?=
 =?utf-8?B?NUpjdWc4RkdKeEpPZGdVeThLbm9kT21DVzZxaTA0U1J5eGFHL24zNUZVK2Uz?=
 =?utf-8?B?UDZWOVNnY24ybzZpdjRYcFIyM0tGN1JuRW41MFhJazBrcHJmeFVzSUJhQmZi?=
 =?utf-8?B?ejJmNytvRy9GR0JoaTFxekZ1alFUcXUvTkdVV1RQZUgrUGdnQUcyb205d2tZ?=
 =?utf-8?B?ZnNQbzkycklaUEZVL2o5b3Z3RDdDYmdTbUY5eXFnRGdHL3FhM3g4WDNzSHNl?=
 =?utf-8?B?WXU4K25GZm1KeGJNV0piZGY4NlhSSkczaS9jbWJWN09nYUlOTFRPZnlzbVZS?=
 =?utf-8?B?V2hXL2pDM3ZFbFFTaGtjcGZKcEhwYkprUjhRMHpqT2tEek4zUVhMZjFxeWJ4?=
 =?utf-8?Q?cxx8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE9TSDBWMU0yK1hybkhlR0hNTlh2WXFZbFk1WjdtRkMwTVFQazdQeVhza3pL?=
 =?utf-8?B?Mk02TFFDdi8zaEQ5alRPL1VLN1k5eVo2ajVCajFVU2FFakZleEQzNlNoRzI2?=
 =?utf-8?B?UG9CWUlmMmZGNTJXdHZxeFB2OWpBeFlrcStqVy9SRXo2R3ZhaWg1MURhaFlp?=
 =?utf-8?B?bHVMN05QZjR4N0RvdnpXMldKY2pwWTE4dzRoWlpDY0YveDJ3aXJnN1pDV2VB?=
 =?utf-8?B?dFVlTzJWSWhseSs2SWdZWTFscllvUzJKS0ZUcXRXQU5FTVkyZlhWNG1LaDVa?=
 =?utf-8?B?ZndlN2FUU1MyMXRTMXUyQ1ovQmVLN0E5aks0RnA3UUtCU0VyYm5BK1o0bnU5?=
 =?utf-8?B?MVRnWk95Wk1XL25EZEt6Z0NJWklrRzhoWWFDdVZXODZTWjhidnFzazMrYng5?=
 =?utf-8?B?RUxEUCtjbXRrZzYwS1FIVVhnUTIwU3JwVUpEUGtHeWhvRGtkSW1YWDRQbFNP?=
 =?utf-8?B?Ry8rRFVFY0luMWNnMUtJRitST3RjSmtBdktIYjJEbFJuRzBWVEQyTVpHZWJz?=
 =?utf-8?B?eXV3MFhjZVB4UWx2L2JKd2ZOclgzVzJ3Y3pJOEY3OGpIV0pSRDBWa29yaE9n?=
 =?utf-8?B?MW9ub05rZi8rN0JyL2lRTVV5SnhhS29JbEZjUWQyeDRwNENlVW1RNTk5cGti?=
 =?utf-8?B?OWhGQXhQd0NISzRSOGtQdndpcDkzT1hvVkMvTjV5Mm81TnVkNXdkS0ZrOHNn?=
 =?utf-8?B?SEZKUmlpaWlNeWViM1VHai96ZVBramJkL0ZBQ3B2RlNGVnQzS3J4YjZtZzll?=
 =?utf-8?B?cjliNHQyQ2NOQ2VBdGU1Mm9NcFQ0ZXVhYWNJQVAzeGFhaUk5ZzJjNXJ0NnNB?=
 =?utf-8?B?cXZRZ014b1NEb2JoYmc1MHlVMzRreXEvUDNhbFJhZlVydUh6aXFKbHRYR1o4?=
 =?utf-8?B?QTc3bitoTklnL2ZvYzQrQjVQRzFyZ2s4UmVjVVhUYlNaSkRObjRJN01Ya1ly?=
 =?utf-8?B?L2FoVlFNVXB2REhub3RaeHdvYkdWTGpGTzQ4aHZwd2Q2K3ZvS2krZWRybFJq?=
 =?utf-8?B?dllHdytiSGlHSFBjaWE1YUlnOEdvWFphSTVJWW9pVzhmTmFLenBTaXppcnNB?=
 =?utf-8?B?dkJUOVI3OU5kcEhsSnM5N3FLUGw1WHkwa0NOVGJNeXRvSGJNV3dIRFYvYkxC?=
 =?utf-8?B?b0oyR09OZncxMGJ5Qm9EK3FPWWI4ZlJ5clVMMkgwWExuQU9EU1dRVE1ZS2Fl?=
 =?utf-8?B?VSsrOVlpK09nRlR4R0ZyL2lYUnNkMElsZDhJd2ZnZ3B4WjllMmd2UW5hYlRJ?=
 =?utf-8?B?a0NudGJkTnlyZFM5eW4vekFHT21RSTFRamNFR3M1TnhGYlpvQjF6NTZLckxM?=
 =?utf-8?B?TUUyNnc4ZnprUGJjVW05d25ycUNxeWIwZkpwdUhMK0J3OWtrZ2loQlI0UXMr?=
 =?utf-8?B?dFN5RVpNWnNsUytsWUZ2NmhxOUlvSVNjUVRrZk8vcUlKVnJBRFVTbDUydTZW?=
 =?utf-8?B?RHhUVVk4NG94R3p2SHNOT0dYM2lYZGpkSC90dmp5T3lOYjI3cFlUUWJVM1pw?=
 =?utf-8?B?QTdJZjdOYkQxOFgwNjdsMkgva2FsdW9OTklPbDJBc1k1SmJwbXpyRFNYREY2?=
 =?utf-8?B?UVJjVDdhVkpGZFp4VElRWFVsdUhGRkJvT1ByL0tzVmZUK0hWOHp2bHlId1Fp?=
 =?utf-8?B?Q0F3c2JvZjVRZk5HVmtiOTBocWFtZjFuWGh4ak10T05PdkQ2Q3A0NFF1OGZD?=
 =?utf-8?B?bmRUTmN1ZG45czRZZ3hxWnVYLzd1Nlh2TmN5S0dvdWZFaDB1bFBhR1VSMjhq?=
 =?utf-8?B?TEhBTWhLNzBSdTJhS2M4bU9maHhqOXZhUVJNbVlwRWlqT2VPYUlUcXh6bURH?=
 =?utf-8?B?TGxtc1BiNkU0QkFEV0drZzA1MGFMZjJsTzEyRjFmTGtzclEvMnNmZ09DREtm?=
 =?utf-8?B?UmdnNVp2Y29mMTJEWFI5eWdtK0g1OCs1SzAvZHVWYkFBZHRIY1MrUkpTaGN0?=
 =?utf-8?B?WFB0dDFiTXRJTnJNR01Xb09tS2RlbHQ3eklUZG54Uk5ZSFJ6bVdWV0ZXZVgz?=
 =?utf-8?B?dGZmTVpDQWNxYmVyZmxocjI4NTRXVW5JVG1EUSt5T0U0UnljTEV4ZWQ3TTlD?=
 =?utf-8?B?UTNFSDNuVXVoQWVzM2N6ejkxQU1EeEx0WDlYQkFEVmxYZnF1OVBNQ0c0aGxj?=
 =?utf-8?B?YWxuYloxYTNBRUpYdFNEeDZjVys1TEVqM3BZV2htc2pGZGRMZjFIYm9kbVRh?=
 =?utf-8?B?aW1FbFpDU0hNOFdEaGQxa0tXRWZGdEtSSEtxQXdxam9GSGdtRUYyY2srN0k3?=
 =?utf-8?B?c1pTSHE0SGU5VGJLaE53aU5VREZyelBPUDI1VGFiWWFRVWNBZ3FWQThYZEJq?=
 =?utf-8?B?R0g4cDJvVDN2WVVWYStyTk5RWkFHUWo5ZFVKQlZQNGRtQmZtNlBJUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 239a6529-7a65-416d-4ed9-08de6ea1da3a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 03:57:36.8201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlZjuhBLgA3RmqoCh+nUcZtrhuOHTdznRH57OGWNNC5z4xvZfFyv1FYz3I+npraMyfkMaTK6n/rdBOEKZS1z8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7972
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


On 2/17/2026 11:26 AM, Pranay Samala wrote:
> Optimize the modifier check by moving it outside the CRTC/Output loop.
> This avoids redundancy and ensures the test is cleanly skipped.
>
> Fixes: a4805b36cf23 ("tests/kms_plane: Skip unsupported modifiers")
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_plane.c | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 362748cdb..f37b019d1 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1489,18 +1489,14 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
>   	igt_crtc_t *crtc;
>   	int count = 0;
>   
> +	igt_skip_on_f(((data->flags & TEST_PIXEL_FORMAT) &&
> +		       !igt_display_has_format_mod(&data->display,
> +		       DRM_FORMAT_XBGR8888, data->mod)),
> +		       "Skipping: Modifier " IGT_MODIFIER_FMT
> +		       " is not supported on this platform\n",
> +		       IGT_MODIFIER_ARGS(data->mod));
> +
>   	for_each_crtc_with_single_output(&data->display, crtc, data->output) {
> -		if ((data->flags & TEST_PIXEL_FORMAT) &&
> -		    !igt_display_has_format_mod(&data->display,
> -						DRM_FORMAT_XBGR8888,
> -						data->mod)) {
> -			igt_info("Skipping: Modifier " IGT_MODIFIER_FMT
> -				 " is not supported on pipe %s, output %s\n",
> -				 IGT_MODIFIER_ARGS(data->mod),
> -				 kmstest_pipe_name(crtc->pipe),
> -				 igt_output_name(data->output));
> -			continue;
> -		}
>   
>   		igt_display_reset(&data->display);
>   
