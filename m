Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BA1C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 11:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0732B10E7E3;
	Thu, 12 Jun 2025 11:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxPSXfrY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6587C10E7DD
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749726380; x=1781262380;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=5HQlXIZQ0UOisdlA14rZgVnNZLZtx1juym9th8vlKvs=;
 b=AxPSXfrYSK5kCP+ZJiKUJnp5c2bTDbqoLTKfQkzfVf28+pU0o0W6RZ3C
 PSKiu1I93qF0vsbrBGQRs35JoVV2YUT/iujxQAoWTvQ7yD4W1aJygz0Jg
 1imc6ZBv9gOorOVWXpfCt9ziIr6l7NCctFfsHuDO2Ia7m33nGG2yA8KIu
 MoAoTN+oddIO/G7m9NiVx441BEOlawM8E/xobEiY3BeJZMMxJ5TzyLu4m
 X2okxuvNyo4hd/uyF5OQE8mbU++k4wpFOGrUsEVwHnVaSV6JOijhfFOZC
 h9ZHvBhmJnIUbX+CwApCQBa678uJTErlttfXh4/OX3NOkGERBAMBB5iFt Q==;
X-CSE-ConnectionGUID: ee4tpESaSE2VNtEa9s0dEQ==
X-CSE-MsgGUID: S194Kg1+RRuedy34Ea2DuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51770314"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51770314"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:06:20 -0700
X-CSE-ConnectionGUID: adcw38MeS6SpngE3L6gSJQ==
X-CSE-MsgGUID: GfEm+o/NSFGedFKins2kkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147333459"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:06:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 04:06:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 04:06:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 04:06:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOqTb/kiMW82wRG7dsL5+hDD1Aqz4/WmG7AchrwsXNI4nM3TC6jaHyJ6+egwm1iGIWRgVJecXFnNBn4kN1KqemlGRv81UO9v9Gkhx7SkoMvMbktgHlo46phHc5EeLYNAitjRCVcQ/BK4qbgqDhEMHQhKtqbQzX+DqfikuFsKoQqWX5zK1TUTRB6Q4nrVRJWlk68idnhCb7xav7lONH7ZoX4dmoJXCHWq1sypohseozzyRB9iSNfiv5PKxrL8USVUb+M/KaX0HY3z+QuvHbLJdhUtEjBTovhTNXkJjNTlcRGK7sE+Wxph3thfe5CrTivVWknfWY9xk9dfjH44TLg1lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGzsJnfIZpFROTV4Hqc5KJ5kXqNqBuVZe79Kj0MATSk=;
 b=PwJDl0wvbQrcWhS+UjV9q5JZijDDDco0Uwral/wq7umP3eMhYE2XfM4aAzA5hT3169veLTzBSLSUVRGa3pF2SbCV7cJBqRpkRR2vBPnOr2lSiNd8xN7mUu+Q9O38wKWzu4yBhSBJ7kOlEYAtIFrpCm9yBmbm5ILNh9Z24jeC/7dH6yW+0Z8P8YZSoD6mJ/EAa3YdzJTRSttEnQuwgRhG7ygzMQxSmEWfTIpaJOYXqpTbWVnisRcDf78rMqC5R2109y0tAsJNKD9lRFP3hlSPRBEa3AmhVXOoxtio6hdad+BMEiyQ0+9HMQpTTNLrINOnZ3k4ulMW4UH8qqBOeOeWzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by IA1PR11MB7293.namprd11.prod.outlook.com (2603:10b6:208:42a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 11:06:03 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%6]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 11:06:03 +0000
Date: Thu, 12 Jun 2025 13:05:55 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Revert_?=
 =?utf-8?Q?=22tests=2Fintel=2Fgem=5Fexec=5Fcapture?= =?utf-8?Q?=3A?= Deal
 with DG1 recoverable vs. capture uapi changes"
Message-ID: <bkqegrvlwhv35k2fbb3l6nelsed45vaarjcahqbmdfk45zpplr@x2kiisjcwzxw>
References: <20250610141852.55249-1-krzysztof.niemiec@intel.com>
 <174959273339.65592.10519070021033738593@1538d3639d33>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <174959273339.65592.10519070021033738593@1538d3639d33>
X-ClientProxiedBy: DB6PR0301CA0099.eurprd03.prod.outlook.com
 (2603:10a6:6:30::46) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|IA1PR11MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d67a3d-b8e0-4f89-0b90-08dda9a11f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1pDNnZOUFU1bVFVUnlBT256bGJXSy9sSEl0V3pXOWx6cCsvVFIvOFFYMXBo?=
 =?utf-8?B?SHZGTndPa2M1cGRiWFdpVm0ya0U3RzV0STRMcFZvK3FFRmdnTzFRSVArQ2VW?=
 =?utf-8?B?bVZDSVRla2sydDlZOUQrT2RkZjNiUUV3blROMEJLR1VxM1ZsWTAwMkU0Wm9m?=
 =?utf-8?B?TmJURjhiQWZsejRTM1U4bGhzNWUySzNJV09JT3ArSTFJdWtibHQ5TXhnQlYx?=
 =?utf-8?B?aENMeEpiNHNtM0d5dEVTUG9ocFozWVF0c0lPMWdPZHhtWFJFV0lOM3IrVjcv?=
 =?utf-8?B?M3Iva0QrNGFERkYvYW12S2NxdW04cHlPdmpIUG5nMkx4ZmVodFh1VEx2eGJi?=
 =?utf-8?B?U0RheUUzbG5qc2wwb3cwZmxNeTMyWmJKYVBYR1M3b1RSWkVsZ1pYbkF6eEpk?=
 =?utf-8?B?MkJxa2tvZGo4dXgyUzA5WUNSVGlTUjNjN09WWmcyMU1wT0R3VlMvRFRuajNi?=
 =?utf-8?B?VjdWTXd5c1VvWHArVnlUV0pweUZlWnBjd1N0VlZDT2YwaVdqZ3QwdUw4dXVC?=
 =?utf-8?B?UjE5ZTZCbm9Ma0t5R1Q1UUJFNlA3YVFSeXlmSWRpaW5QWlgzQUhFcGRhM0NJ?=
 =?utf-8?B?MEROSHNGdGJWWkUxVmZpWHJxODArV05HaVhxcUFQaDRiVnBVek52WkUyYndJ?=
 =?utf-8?B?cDY1RVFFV3ZyWXlmNnNvNXRWSUs1eXcySWxyVHdyYjV0NEhBQmRvUnkrcFhJ?=
 =?utf-8?B?Y2E0WmNzeFJlbmpvTHlkNUVPSUEwZmtlZGltWVZlWGFKdmFGVFJNampFd1Q0?=
 =?utf-8?B?ajlGb2t0YVFiNVpHUExEU0ZnZ1gvN0E1Wm5RdHZzRmxMYkhPdTN3LzM2dWE4?=
 =?utf-8?B?c3IvWGVMOGROcC9JRFZsc3g1bkJjUzlOaDc5WkV6VkNTTG5vQ3FTd3BvODhV?=
 =?utf-8?B?Q0NLMzRFYnRZREkyQUNLclBuQmFHT1BEK1N5bXAreFFqR1FWNFoxWEZFUjV4?=
 =?utf-8?B?VDBlM2w2MWIycGZkaEk0VmFsMzNyN3htSlZ1SHdqZjZmQ24vMmNPdWlrY1Zt?=
 =?utf-8?B?L0U4SHdwdTMzcTUvZWlBSUgxck9UQXVDck5PVndWbTNYb3hlTlYvRjBzUDZt?=
 =?utf-8?B?Y1cyNXlxM3M1NlBQUUIzZVBxcEM2UnhtaUppL2lwWGtkTUt0NDBzVlkwU3RS?=
 =?utf-8?B?VDhmZzBOTmZXVWUwNC82c09kV0tsNWV5ZFNRak9NeXBRTDk4d3VTUFZ5L2Q3?=
 =?utf-8?B?LzlkQ0czSjhLS2Q0b09aeThnQlBuSUNyL01RekV5Z1ZpWW02UUdZbm1YaWI1?=
 =?utf-8?B?OFBRM2JTemtLVlRxUFIwTzZMbnJrVHVSUDNaRlRkS0RmQ2dtazM2eW9ETzVR?=
 =?utf-8?B?bkZUVE9kaUlIUit1WSswbTZiZjNHeStMRnk1RUIrOTRxZm9lUytPazlsK2dK?=
 =?utf-8?B?RUZ0R3luZ1lCL0l2WCtRakZDYTFjREZpZ1RUZ1hIQmxwMHBvK2FGSGgvQjJy?=
 =?utf-8?B?NkJsOWNjb3lpZzIvN1prREJZWHFIcEFseVZPUTRVQ0tINU4reDk2NXdMeGVp?=
 =?utf-8?B?YVJBUG9tZ3k5YUE3c3N0cU5HNzBZaEVzazdDSlZ2a04veVVpNDlXbmdLdkts?=
 =?utf-8?B?ZCsyOVpHODNZSUNpSUJQS2hvZ2JLVXoxY1ZZc2lpdmZvK3NKNnNURFBQSnNE?=
 =?utf-8?B?OWxxbHdSejg3SFZUa21JU3BMS01lUnMyR2FxSGVwN2thNzRKY2x2VzNZVlBE?=
 =?utf-8?B?VXA2RTdLZkpHaTdnVXcvZi9ZZkViemU2WkpkOE50WU9weW56Nk1hSGdZWDRH?=
 =?utf-8?B?NDc3dXU1Y1U1cTRzUmRKcWpjVG1qUE9yM1BpRE1PUFp0Ym8rK20weDZOMjFt?=
 =?utf-8?B?VU9SSEMrYW1LNTdjWTA3Y0JqU2ZodXlmZExwc3Y0QkJSNWc5YzRjSk1WRjJj?=
 =?utf-8?Q?ofzqnTUl7sRZ5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmF4YnM1Q0hVYjZrejcyaytDaDNFT1B2aGpnUlFzY3pWNm5TU25SSEw1TTZX?=
 =?utf-8?B?NFFhd1BvZytNUkZwNnVNN0xWNWRhVFAyZ0dyczRQb1k2ckFPSlQwODZ1NVRZ?=
 =?utf-8?B?ZU9zR244aEluN2QzZ3B1dGRKSUNLa0dSajlHd2E0YlgvYkNydUNCbTd5NGpj?=
 =?utf-8?B?aERPcDg4S2F4MzVvZDl6Z0ZsNlJ6SEZoc3kyVFUvcE42Q0theEw0cWVueDRN?=
 =?utf-8?B?MVZCQ2NoT2hOSWpjRXJMTndqL1pCZWIzWmZjTHdyOGRlTEwrMjZyK09iR1Vo?=
 =?utf-8?B?c2dBeXZPWHFpa3krYTZYVXVpbjY0RDh1YnpmaVYweXpvL2gwYUFJRGRYYWhO?=
 =?utf-8?B?K2xOeWYreXpUNE9CamUrdHJlRVFxOGJSUmRTa3BOVTdEWVh1bXRwQXB6TFJN?=
 =?utf-8?B?clpOajlnTktncjFUSU9ha2p2cHh2WGFpS081TERDSjlQVFNGTm5XV3pPdDh2?=
 =?utf-8?B?NTNHTlB0aCtHQ0JFWHJZcGtDaEMxVDVBNEpnTDZUVUlNaEhYRnJ6RmVqa3FX?=
 =?utf-8?B?ajJsTXpXcXBSeTJ4Ry9IY2NaNENWTEFaVzRBU3ozVk1mc1BjYzM5NC9udWdU?=
 =?utf-8?B?K0hwVVROcDB5OXBCRmJlSXNJbkdUR1Fidm1EMTB6VVQwQytLS1FEK0ZZcDhO?=
 =?utf-8?B?WVBJN1VPMlRPQ1Q2TW44ZWdyRzk5bzZyMEtKOXp5M25acXl1cnZOUDRmZ0FP?=
 =?utf-8?B?UE0wVDV1UUtvNmRTSGlPVFlka09veS92L2Juc0dlUWd5Y1RGNFg4UFBTOHdx?=
 =?utf-8?B?QlhSeE5iS3Qzd05UOEhIWEwzMjRGSHkxaUhUYlpaK3h0OTZXK1c4ejNBNkNN?=
 =?utf-8?B?aFIxUjBKVDRJRHg3U2dWVTlQT0tHM0crNFFUbzVjMFhGVVFWNmZVSWU2ZUI5?=
 =?utf-8?B?My90YkgySndPSGtoeDVSZlBTUW1hMkhxa0lBTzFJNGZTekZhT2VKTDQ3ZFNp?=
 =?utf-8?B?b09qQmFHb2VESExCamhLZVlFYmJ0ck1Xc1NKSnFWbDdiTFF0NWg3YVUxenB1?=
 =?utf-8?B?cjYrbDNYSVBMYXgzVWU0cGNiRUtFM0FDaUtRaXhKbmtkbktiZ1RCQlJXcmIx?=
 =?utf-8?B?ZXhtdzZySlhpbnp5RHJJenBiV0tzbnFkT0xOd3JWelZuV1M2L3MzYUlMOUwy?=
 =?utf-8?B?RW00MkxGRzB4dEVzbjFQcUxjRGE1bWs5NHFtdTVQa3IvWXVObWJrNmlTb2p1?=
 =?utf-8?B?MFRBLzM5NWNLMVptbFRPOEYrM2lGK0hzYnc0eVMrQnNTcnlWaGpEWjdUd2Fu?=
 =?utf-8?B?LzJWZXVwUElaY0VvSlIrMHFFTVZnS0R2OW1HeEtyeDF6cStmVGMyTk9heStl?=
 =?utf-8?B?cGcvRGFaU0VMWFZnT0J2QkozblBsV09QTHU5aWtrVDZvU1U1alNHNFRnS24y?=
 =?utf-8?B?QmdvYnJuaTRVR1A2Nm9KeVVOR0J1cnEzZU8xZ2M5TENKUWswL0svaWNiQXZa?=
 =?utf-8?B?Ny9JUjR4NGxxSFZXMUlidUZiQUluWmNpdXlQMElmUTF0dW9STFF2bEpTZG5R?=
 =?utf-8?B?bEhwMUgycHBIK2UySVNZN1hqYVJhbnpub1ZZNzd0MmxzZnR4SHZyQ2toZGc4?=
 =?utf-8?B?akU5a3U5d0RIVTN5ZW81cmlOYWk5c3lBNXBTZFFDeVJaQjFud3VSeWtSQm0w?=
 =?utf-8?B?aWZudS9zcDJOaGkyNkk1N3Q2UGpLbFVEV3VhQjhaMG1CS3h0SkZZRmVrYW9q?=
 =?utf-8?B?ZHRXb2dDMjBvT3hiRmJ6cVViWXZuVG9SQ3JxQTM5eEhXVEd4MjNNQWVNTHNE?=
 =?utf-8?B?UDFUNXBjZ25tUkhaUlVsYllodE5lRitnNE9jaXBQc3VyUHlEMm5qSmVja3FK?=
 =?utf-8?B?TTNMZmtpQmZYcmpHQXY4RzRTckx1eDdCUTRNV1ZKWnVvM09DeDh4RlBlVTFC?=
 =?utf-8?B?Q2pSYm1KemVoUTBMMHRHdFJiYWtlVjN2dmRtZzRxUUNlRFMzNHl2dDZTRHBE?=
 =?utf-8?B?cUxLcnQxZ0t1SWRwNythQ0lNTnFWZmlXTmphemlVQno4RWhoSmR2UGNSbnpQ?=
 =?utf-8?B?TmFIOE51VDk3L0hqbWRUZHpqWFN5MFVPbzhDNkFMWEltTzJTMlpIREtyRnV5?=
 =?utf-8?B?cmc5QkRoYVFuOE0vdG90U01kNDh6RXV0VU9JbTN3dUFvc3pFMmpkbExmMTlu?=
 =?utf-8?B?VmpIRVVncWUvUVVyc3JEQ0t6d1NGakZPZ2tndTIwMGlmREtlM0dmMVBEUCsr?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d67a3d-b8e0-4f89-0b90-08dda9a11f44
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 11:06:03.7228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gAvknT4IZa95ZioNz2GnVgLZt42uc/aqZMSrygSgeVjakCwBwsmRPjqSSPci9EWAPcJD9YvyrT55gTpzoTtZdm9v0QCb/aL2T+xqoxbEis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7293
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

On 2025-06-10 at 21:58:53 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: Revert "tests/intel/gem_exec_capture: Deal with DG1 recoverable vs. capture uapi changes"
> URL   : https://patchwork.freedesktop.org/series/150046/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8403_full -> IGTPW_13264_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13264_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13264_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13264/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13264_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@dpms-vs-vblank-race-interruptible:
>     - shard-tglu:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8403/shard-tglu-3/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13264/shard-tglu-9/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
> 

This is unrelated to the change.

Thanks
Krzysztof

>   
> Known issues
> ------------

<snip the rest>
