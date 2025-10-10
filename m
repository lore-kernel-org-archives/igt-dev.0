Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD40CCD183
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 01:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7712410E08D;
	Fri, 10 Oct 2025 01:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICWm/Tps";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EF510E08D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 01:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760059435; x=1791595435;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=86mX4kev870I5Y3MafoAt7nIywg/kYGUV0fbFFgc4Ig=;
 b=ICWm/Tpsy5A8Eux4QG7JecKRNezq8dFmdkWcO3px+ROkwNIxbyTHGnRM
 lZ39srjCFpTBicOHefMOZ8lmbALD+/ni3QZzwWfvZgg0PSQebaYkZD7jN
 vCy/FVUZ+S4Stg25eULbqmwqA1QY6FXUH806OpHd9nKLxCvI95fYeWz0x
 1l9PB6TcunYxCpPxX0YejxYmouRbOVFF1/kwNGvi/GQKzBPeycPjCcddn
 et2GrJwIUVbs8+5SLoQytmnEd0GB1BCgYMvP1JTjwBg8iKsade5aH6+JR
 +5nf702x5NPJ3llttB5kOn7IBMQrqjewH/eNBM/x0QnHL0vAcDumhJnOl g==;
X-CSE-ConnectionGUID: V9a0Ejc4S8+OwzCbwhWVxQ==
X-CSE-MsgGUID: 57IFqwZaT+aOLVZBQRjppQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="49841885"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="49841885"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 18:23:54 -0700
X-CSE-ConnectionGUID: QB6XqywuR7aSmgsnpvAp4g==
X-CSE-MsgGUID: n7N+K05qT8ON+Gh0G/b9RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="185977678"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 18:23:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 18:23:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 18:23:53 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 18:23:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8XLhLQ3kPfiflM04EMwqdRQ639xcmWRqhWgf+H1d7lWUVWnoa9GBmcpIqhdp4zJx7UuX9QX3qnd5poMr4DFTN5sP2yrLr+Zvo6nPGjDFujQJ5UYjiq765VPf6DyDdp9ExR8YvMhGrKqTiSMnyO3yH3+YjdYBRxLb3VaoHwUf30s5goHeHtUvja5fJbLbiDlrKKVnzN/8MrdMzWXf70C5uCgcpuKyLTdFAkUPl71/gcJyStEQjBCSPNJKQE3lItsUVsaxlqRqNU3zM8bexu4Ikau/X2aUvBV76xUNLO3pStKU7UHFtxwp7OtDVbTHF4uVPsVMp3Br6SR8q8qlLIKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nV7CZd87+NezSYpup1IVynI62g93TG2PTQsVySH2pME=;
 b=edmkTR9ZnwRX0yw03lBLrMBXmnGTo33znLKKeE2o/v9WfKVthhEi/LdioM5eLhOxIKlRWSM03dbij1RKGREjsfEnsIvvdRoqE684zEuSkEDFa5i1vltocSD2Z4JradxMQSIlxuARu3dcrhhzXBw31kfyeUJorbCvyIPTVuD9ydtQnnTxEGF4QHQonFsCUjRyuR45fFsVEcPviQuABQB7K3q0MrK84qTYmZ6Fpzn0BjgQdFeI5r8LqUbmGFaSZzSEi9JiMDYeP84PE0E+FgQoGPic9NpR6dqV1arY4oAuAuVEek60V37IyfgGjKSSzlNMIdhMkONj54neVNxCuERP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA1PR11MB6148.namprd11.prod.outlook.com (2603:10b6:208:3ec::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 01:23:50 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9160.018; Fri, 10 Oct 2025
 01:23:47 +0000
Message-ID: <cdec370c-a6a2-415e-95a7-be9a8c5ef3c2@intel.com>
Date: Thu, 9 Oct 2025 18:23:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/i915_pm_rps: Added Multi-GT support
To: <mallesh.koujalagi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20250829122039.1896093-1-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250829122039.1896093-1-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA1PR11MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8e21ac-d240-4ed7-ddfa-08de079ba8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RThGUXZxVG9WWGNqM2pUVGRwQTc2TmM5a2ZndFNCNGZmclQyVTBZU2QvVFR1?=
 =?utf-8?B?cUpYWlc2QWJPYVZ3L1B4dzlMNjBnQ2FPTGdrb2RNb2VmK05tTnM1UGxvbllq?=
 =?utf-8?B?SjhGZkdsa083WGIzWnp6RzNNZW1ibHkwMVhCMkxRRkJuN0pKTm1KYnQwaUZh?=
 =?utf-8?B?OExMRzVRWUpGcnRYL2FBRWx1akZEV1RlV3R6WUtkSDVuNStuOE8xMnhXVCs0?=
 =?utf-8?B?ZE5tQVNQamIvalZYRmlRNFZLSFlpMGNqQmFPMDFHNVkzUjhXa1VtcUVqWFFj?=
 =?utf-8?B?ZzJXV2I0c3VaUzg4RTQzNm5rRzFUZWl0MWFYWGd6RDdQRGpnVDJQQlJzYlJC?=
 =?utf-8?B?K09OZUI3VU5keFFRcEVNSndPTjZQdzNlbE0vd2lXa2V0MVArUzE4b0psNGxj?=
 =?utf-8?B?S2ZDNXZZVzdmMmk2K3BzWUppUHpHd25sazk5QTU4S3F2WFJ5UnlyaEdUSE5q?=
 =?utf-8?B?R2lWQnhQT2J4SVEwNGhLRm5WL210YkZtWFhZSDc4cmdNU3czTFg0RkViVFJi?=
 =?utf-8?B?OGM2UnBobXA4R3ZJZkNEYk1sTklGTC9nc3FXNFB2NmNwdWR1RkwrbHRtUDE5?=
 =?utf-8?B?SXlCNWJ3Sm5WOFNRV1hrd2RIUEZFYmpkYkFXQXB4MFk3TVF6QWxwMHdvRUcz?=
 =?utf-8?B?S1dNNkVhMko4YzhnVFRKeDhMczNwcndsdzFFSmdLc3gxejVUR2ptUFhldjQ5?=
 =?utf-8?B?NkI5bFY5WEdEa2FNcDVrQW5sK014Y3VUMXlzSWRpdCt6YUF6RjlGcXV1cWdh?=
 =?utf-8?B?NEFzcEZCWTZiZ3JFcDF0eTBYS013VmFTdktCZWZuNXhoM2E5REszaWZKZmNs?=
 =?utf-8?B?VFN4b3ltb21KRVEwOU5HdHNreXlIV3ZqbWUyQ29QNk9PRjlIckRUekJYT2d6?=
 =?utf-8?B?dUpiVnVYUmc3dEMwQWE0OGEwM0JkZFFXTmxuOHEyTXptWFdnUjJaTlpoWWZ6?=
 =?utf-8?B?d2hHbE0wU1lkWjZKZHBrcTlHbkluK1grWE51NHFrZXF3ZnFKTjNYNjJSbVF2?=
 =?utf-8?B?V0Q1ZzVtbGhyQTgzNUdtYWIzZ0dSdWFVZE5YMlFJWDNLd2dOSTZ3NFJTQnhq?=
 =?utf-8?B?TWR1UHpwd0pjbGJIcVlpYWxJV25KT1VOTXIzZy9YSWNCTjNaUTk3U1VqVk1X?=
 =?utf-8?B?bHNyQ0h3MEdRdUF4MTJkY3Q5K2t3am95Und4V2RHMVhwQlFMRGF3RUJDZEQx?=
 =?utf-8?B?cUg4WW0wVk5jOVpCeWJ0dmRwVllpQWxzMnV6ZEttMEZzWUNsc1lLSmhPbDNU?=
 =?utf-8?B?RWJNL1dQdkQ3elFEZ2RScjE1c0JzQTdJT04ydUphSEIrZ211MFlNYVQ5UWc5?=
 =?utf-8?B?Y2VKRjNtTmt3cVQ1NGNVd1A3ZWZWTnBnelRDQWIzSmI5S2VXcWlFZy9XUW5n?=
 =?utf-8?B?NFlOMG5HS2c1OGRXRjVrMlY1MDR4WmhJMmRhZG52enpaVWNoNWxuU2hzTFBx?=
 =?utf-8?B?MTdGblRpSlRTbVJVT2xsaDV2T0Yzbmh5R3dpc1BRd3VKbUFxdnNCbnI3bERI?=
 =?utf-8?B?RW1JQy9tUk0vUGdMdzdGNWxSbVpiWk44QjNSK2g4aTRZOS9Pb1g0dHBFTlVp?=
 =?utf-8?B?K2U2M1l3K0lHcGsvSFc3MkxOMkVab0lKQnhFbU9VN2wybmtVeW9YZmlUNUFO?=
 =?utf-8?B?Z1FPdTJzWUdGQ21XNnY3RTJLMnMyRXFwZC9oTnZRQ2lJaXdEVUhtS0tBdUt5?=
 =?utf-8?B?bjBNK0pFekdickg5eWtNYTRzcTZZcTFuMENJK2h0T29SNEcwS0lLNG52VW85?=
 =?utf-8?B?Yyt0ODRJYVRFazJBZ3h0bUhncTRUY2E3aFlrZnNSaUE5VEl3TDZFeDNpNk1v?=
 =?utf-8?B?ckRkMng4ZDVnRDY2VFZJc0Q5MUxlOTg5eXJEZXF5QWVZL1R1UXBDK09INGMy?=
 =?utf-8?B?QzVpVU5sZE5MRzdYOThPWW9yQzFWNTdGbDBDUTJPV2dGTTc2UDdPNW5Ib05J?=
 =?utf-8?Q?fK3g3KGweoaBRbfq/31v6kMrlSpXAm3A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bExabGVtdmRacldtb05NN1M4aHllYXF3Nmt5ZXByTHFydzZkeE1rSnJBem5G?=
 =?utf-8?B?TGpHaTB6UEZUem1QMXpoQzZsemFNdUx1Rm9ZTnBBTC8rT2NEbTRGYk43WFpj?=
 =?utf-8?B?MEx2emZiR296Vzl0cjBmRU1PSTdaTjUxNm0yc0diYkV5Z0F2cDNPWkJIaGxY?=
 =?utf-8?B?enFEMWROZ24xR25IWERFTWxtVkZaSERBWHFDT2dISDNqK1NhUWFHZ21lKytU?=
 =?utf-8?B?Z2NqV0RoRHZ5SXRyQVI2YXFXYWU1V21EMm11a1BwZVlkTkZqUlRzcG1tT2FB?=
 =?utf-8?B?UFl3TkZQR3ZoZTJObWZoMDlJL3hXMEtMWDlwYjJqWTBlamJZU2Vvbmw4TmJq?=
 =?utf-8?B?K1Azb2k0cmo1VUpXdThBdVd2dmczV3NMSnRuTFdsV0ZVZXBPcFVMYzVCR1dv?=
 =?utf-8?B?eWV1bEhpbDNwUFA5cnVGd29HdjRMYXJMdGhoWnlNVUVvSGhScG5uUmVEOXNB?=
 =?utf-8?B?T1JSV2thVFRKMmg1WS8yQVZzN2NoTkdUVitiZzFBbUNjeU5ldjZpU3V1RzRo?=
 =?utf-8?B?Q0J4dU03Rmwvb04vMC8yWksxYlhEUU15dktZdGVGUDgydUlGaTlwZUtmOFo3?=
 =?utf-8?B?UkVpSENTUVZmMjhGNXVsSUg0MDFIYzJTT1R0ZUhLeklRUitwbS9JRDI5dFFQ?=
 =?utf-8?B?alZoT0hXSHlKUFMxcFN3bzZrblZxMzgwekZ1VTBIcWR0Z3NqZEVKcjRtME5w?=
 =?utf-8?B?aDdWcWpua2xVS3pLb3FUYm56WlM5N3FPL3JsTW1xV091UG5UR1RLZVNaQTcy?=
 =?utf-8?B?N2NLNnd4d3hraW1hd1JvbTYxaG9ZeWF6eHZRRWZleU83eU9sSU5LamJUOVZW?=
 =?utf-8?B?TTdtZzFXTm5SVjBQbElZMzhhU1FhQmxuR044TWJDd01md3JOTHNjKzlodHR5?=
 =?utf-8?B?S0M0R1QwenYvTmVaNHNxVElPZTkyZlorZ2NEZnRvSVhlR2orcUg3TzZ4UnVD?=
 =?utf-8?B?VFlHdzZuNWcxVnhkY0ZFcURNUVB5bklXdnpUdWduYW5ENGREVkgxcE1VM29C?=
 =?utf-8?B?amswaWR3bmo4SlR0ampXWWdpYmtHdnpoMVJtak5zQzFzdGVUcTkvdHc1dkdx?=
 =?utf-8?B?eGhUQ09oOEFaM0ZMaThzWHJFdWRmdklxQ3dmWVVqVW1jUGo1VkIvVHRmdjZV?=
 =?utf-8?B?TVRyelM3MDk3WlpLcjFYRE5NN0twMnlNUDVVYjBiLzlRamhUcUZnVVFya2gz?=
 =?utf-8?B?Yk1yaGhwNUFib1orZk5RbS90VVJhQXB3c0JEeTR5WEl4TGF0MVNiTWdSS3dz?=
 =?utf-8?B?VmRXUFlDUkV4ci9OdHBCQjJNOTM0djZNdDVac2t4WElQandBSkwwSExKa0x4?=
 =?utf-8?B?UG50Q2J2d25DMFAwZlZBMmhnRjlSTGd2bDlUTUMzSHBQbFhmMVo2SkxPTVRV?=
 =?utf-8?B?MGQ2S1lSUWpRNzZ3MlpEak03Nnh3OXBTOVg0aDBpOWNuMDdIQTZPbU5Ra0pG?=
 =?utf-8?B?bEpTVXU1elNuT3U0cVVYNGROVU1ydDhEK0xwcmZoUlQ5K3VxZ1NiQmc3R1dN?=
 =?utf-8?B?RDh4OXg5RFRweVNNUFpBbmRpL3dtelFIQWgzajlzaXRxRDVXT2wrTzFvcWVT?=
 =?utf-8?B?QjloeGlqQVQrdWdZQTNacEgydWhPMWVPblh1NFloeC9jVDBGVmpJUFNvSlpS?=
 =?utf-8?B?d1NzN2ViUGtNTVgrbnk1bDBVRTA1eU5TU1FTdzNvODA5dXRXWlhXOElabStD?=
 =?utf-8?B?c0c4V01CU1hXcFgzMDB2ZHdvcS9BWnNyUTErU2kyV3hJcTVMQW1mb1BoYmdW?=
 =?utf-8?B?WWduYXRWOHVTSGZEU0lBcFZJWC90UUpMaE1ZTk5qcUJreFU1Z2tIYjZDRTlv?=
 =?utf-8?B?MkVseUx5UkVQTFc3Snd0Z3NmR3hNdDlVbWExRG1KQ2JublhkK2w3aDJ5eXpt?=
 =?utf-8?B?d3JwOXdSeVFtclJTNmNtemJsd2xTTjExbnUvWEpDaTRIK0xsUElXWm5QblJ0?=
 =?utf-8?B?TTRZZjkrSEYraUJPdk1tb0RqN1lSSVpIZUsra0F4blUyUkpzbjNBWkJXZVpW?=
 =?utf-8?B?MG11YmhpQm4yRUVUVTc3djQydUF1eHVVWG5HSlYrRFQ0NWZyVDRLQkNjdjlj?=
 =?utf-8?B?cjdFR1BjY1hVQXNRbVNmQi9WQW0wYXcyaVFRZWpoYjhFeHZWUGlWb1hBU1hF?=
 =?utf-8?B?OEdYMWZVakpKc0tzSDFjdlFGWjFLWTI5YTQvcDZoMkxaYkVJRXVsdFMxQjdk?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8e21ac-d240-4ed7-ddfa-08de079ba8f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 01:23:47.1543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X00d7vkp6whG24GQ+mHuGzzvOtpl7q2g5YMtpTfoyMiL+AlJ6VcolhG01ygohxBfm62NbyUHTizlB2tUIudRXwx1khzC6T8BZDxsJGv2L5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6148
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


On 8/29/2025 5:20 AM, mallesh.koujalagi@intel.com wrote:
> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
> Multi-GT support for various functionalities
> - Enhanced basic API to accommodate multi-GT configurations.
> - Implemented min-max configuration handling for idle states.
> - Updated min-max configuration handling for loaded states.
> - Improved waitboost functionality for multi-GT scenarios
> - Refined reset test cases to ensure compatibility with multi-GT setups

can we do this in separate patches? One for multiGT, and a separate one 
for each subtest being optimized? Those patches should describe how the 
subtests were improved. Few more cosmetic comments below.

Thanks,

Vinay.

>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   tests/intel/i915_pm_rps.c | 346 +++++++++++++++++++++-----------------
>   1 file changed, 191 insertions(+), 155 deletions(-)
>
> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
> index 80f3e76c1..7ca37b0ac 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -77,6 +77,9 @@
>    * SUBTEST: waitboost
>    */
>   
> +#define NUMFREQ		8
> +#define MAX_GTS		2
We need a common definition for this eventually.
> +
>   IGT_TEST_DESCRIPTION("Render P-States tests - verify GPU frequency changes");
>   
>   static int drm_fd;
> @@ -89,26 +92,36 @@ enum {
>   	RP0,
>   	RP1,
>   	RPn,
> -	BOOST,
> -	NUMFREQ
> +	BOOST
>   };
>   
> -static int origfreqs[NUMFREQ];
> +static int origfreqs[MAX_GTS][NUMFREQ];
>   
>   struct sysfs_file {
>   	const char *name;
>   	const char *mode;
>   	FILE *filp;
> -} sysfs_files[] = {
> -	{ "act", "r", NULL },
> -	{ "cur", "r", NULL },
> -	{ "min", "rb+", NULL },
> -	{ "max", "rb+", NULL },
> -	{ "RP0", "r", NULL },
> -	{ "RP1", "r", NULL },
> -	{ "RPn", "r", NULL },
> -	{ "boost", "rb+", NULL },
> -	{ NULL, NULL, NULL }
> +} sysfs_files[MAX_GTS][NUMFREQ] = {
> +	{
> +		{ "act", "r", NULL },
> +		{ "cur", "r", NULL },
> +		{ "min", "rb+", NULL },
> +		{ "max", "rb+", NULL },
> +		{ "RP0", "r", NULL },
> +		{ "RP1", "r", NULL },
> +		{ "RPn", "r", NULL },
> +		{ "boost", "rb+", NULL },
> +	},
> +	{
> +		{ "act", "r", NULL },
> +		{ "cur", "r", NULL },
> +		{ "min", "rb+", NULL },
> +		{ "max", "rb+", NULL },
> +		{ "RP0", "r", NULL },
> +		{ "RP1", "r", NULL },
> +		{ "RPn", "r", NULL },
> +		{ "boost", "rb+", NULL },
> +	}
better to init this in a loop which actually checks how many GTs we 
have. What happens on a 2-tile system?
>   };
>   
>   static int readval(FILE *filp)
> @@ -123,12 +136,12 @@ static int readval(FILE *filp)
>   	return val;
>   }
>   
> -static void read_freqs(int *freqs)
> +static void read_freqs(int *freqs, int sysfs_gt)
better to name the second param as gt_id(here and elsewhere), makes it 
clearer.
>   {
>   	int i;
>   
>   	for (i = 0; i < NUMFREQ; i++)
> -		freqs[i] = readval(sysfs_files[i].filp);
> +		freqs[i] = readval(sysfs_files[sysfs_gt][i].filp);
>   }
>   
>   static void nsleep(unsigned long ns)
> @@ -147,23 +160,23 @@ static void nsleep(unsigned long ns)
>   	} while (ret && errno == EINTR);
>   }
>   
> -static void wait_freq_settle(void)
> +static void wait_freq_settle(int sysfs_gt)
>   {
>   	int timeout = 10;
>   
>   	while (1) {
>   		int freqs[NUMFREQ];
> -
> -		read_freqs(freqs);
> +		read_freqs(freqs, sysfs_gt);
>   		if (freqs[CUR] >= freqs[MIN] && freqs[CUR] <= freqs[MAX])
>   			break;
>   		nsleep(1000000);
>   		if (!timeout--)
>   			break;
> +
>   	}
>   }
>   
> -static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check)
> +static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check, int sysfs_gt)
>   {
>   	int ret, orig;
>   
> @@ -179,16 +192,17 @@ static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check)
>   	} else {
>   		/* Expecting no error */
>   		igt_assert_lt(0, ret);
> -		wait_freq_settle();
> +		wait_freq_settle(sysfs_gt);
>   		if (readback_check)
>   			igt_assert_eq(readval(filp), val);
>   	}
>   
>   	return ret;
>   }
> -#define writeval(filp, val) do_writeval(filp, val, 0, true)
> -#define writeval_inval(filp, val) do_writeval(filp, val, EINVAL, true)
> -#define writeval_nocheck(filp, val) do_writeval(filp, val, 0, false)
> +
> +#define writeval(filp, val, sysfs_gt) do_writeval(filp, val, 0, true, sysfs_gt)
> +#define writeval_inval(filp, val, sysfs_gt) do_writeval(filp, val, EINVAL, true, sysfs_gt)
> +#define writeval_nocheck(filp, val, sysfs_gt) do_writeval(filp, val, 0, false, sysfs_gt)
>   
>   static void check_freq_constraints(const int *freqs)
>   {
> @@ -203,14 +217,13 @@ static void check_freq_constraints(const int *freqs)
>   	igt_assert_neq(freqs[RP1], 0);
>   }
>   
> -static void dump(const int *freqs)
> +static void dump(const int *freqs, int sysfs_gt)
>   {
>   	int i;
>   
>   	igt_debug("gt freq (MHz):");
>   	for (i = 0; i < NUMFREQ; i++)
> -		igt_debug("  %s=%d", sysfs_files[i].name, freqs[i]);
> -
> +		igt_debug("  %s=%d", sysfs_files[sysfs_gt][i].name, freqs[i]);
>   	igt_debug("\n");
>   }
>   
> @@ -375,14 +388,14 @@ static void do_load_gpu(void)
>   }
>   
>   /* Return a frequency rounded by HW to the nearest supported value */
> -static int get_hw_rounded_freq(int target)
> +static int get_hw_rounded_freq(int target, int sysfs_gt)
>   {
>   	int freqs[NUMFREQ];
>   	int old_freq;
>   	int idx;
>   	int ret;
>   
> -	read_freqs(freqs);
> +	read_freqs(freqs, sysfs_gt);
>   
>   	if (freqs[MIN] > target)
>   		idx = MIN;
> @@ -390,10 +403,10 @@ static int get_hw_rounded_freq(int target)
>   		idx = MAX;
>   
>   	old_freq = freqs[idx];
> -	writeval_nocheck(sysfs_files[idx].filp, target);
> -	read_freqs(freqs);
> +	writeval_nocheck(sysfs_files[sysfs_gt][idx].filp, target, sysfs_gt);
> +	read_freqs(freqs, sysfs_gt);
>   	ret = freqs[idx];
> -	writeval_nocheck(sysfs_files[idx].filp, old_freq);
> +	writeval_nocheck(sysfs_files[sysfs_gt][idx].filp, old_freq, sysfs_gt);
>   
>   	return ret;
>   }
> @@ -402,112 +415,112 @@ static int get_hw_rounded_freq(int target)
>    * Modify softlimit MIN and MAX freqs to valid and invalid levels. Depending
>    * on subtest run different check after each modification.
>    */
> -static void min_max_config(void (*check)(void), bool load_gpu)
> +static void min_max_config(void (*check)(int), bool load_gpu, int sysfs_gt)
>   {
> -	int fmid = (origfreqs[RPn] + origfreqs[RP0]) / 2;
> +	int fmid = (origfreqs[sysfs_gt][RPn] + origfreqs[sysfs_gt][RP0]) / 2;
>   
>   	/*
>   	 * hw (and so kernel) rounds to the nearest value supported by
>   	 * the given platform.
>   	 */
> -	fmid = get_hw_rounded_freq(fmid);
> +	fmid = get_hw_rounded_freq(fmid, sysfs_gt);
>   
>   	igt_debug("\nCheck original min and max...\n");
>   	if (load_gpu)
>   		do_load_gpu();
> -	check();
> +	check(sysfs_gt);
>   
>   	igt_debug("\nSet min=RPn and max=RP0...\n");
> -	writeval(sysfs_files[MIN].filp, origfreqs[RPn]);
> -	writeval(sysfs_files[MAX].filp, origfreqs[RP0]);
> +	writeval(sysfs_files[sysfs_gt][MIN].filp, origfreqs[sysfs_gt][RPn], sysfs_gt);
> +	writeval(sysfs_files[sysfs_gt][MAX].filp, origfreqs[sysfs_gt][RP0], sysfs_gt);
>   	if (load_gpu)
>   		do_load_gpu();
> -	check();
> +	check(sysfs_gt);
>   
>   	igt_debug("\nIncrease min to midpoint...\n");
> -	writeval(sysfs_files[MIN].filp, fmid);
> +	writeval(sysfs_files[sysfs_gt][MIN].filp, fmid, sysfs_gt);
>   	if (load_gpu)
>   		do_load_gpu();
> -	check();
> +	check(sysfs_gt);
>   
>   	igt_debug("\nIncrease min to RP0...\n");
> -	writeval(sysfs_files[MIN].filp, origfreqs[RP0]);
> +	writeval(sysfs_files[sysfs_gt][MIN].filp, origfreqs[sysfs_gt][RP0], sysfs_gt);
>   	if (load_gpu)
>   		do_load_gpu();
> -	check();
> +	check(sysfs_gt);
>   
>   	igt_debug("\nIncrease min above RP0 (invalid)...\n");
> -	writeval_inval(sysfs_files[MIN].filp, origfreqs[RP0] + 1000);
> -	check();
> +	writeval_inval(sysfs_files[sysfs_gt][MIN].filp, origfreqs[sysfs_gt][RP0] + 1000, sysfs_gt);
> +	check(sysfs_gt);
>   
> -	if (origfreqs[RPn] < origfreqs[RP0]) {
> +	if (origfreqs[sysfs_gt][RPn] < origfreqs[sysfs_gt][RP0]) {
>   		igt_debug("\nDecrease max to RPn (invalid)...\n");
> -		writeval_inval(sysfs_files[MAX].filp, origfreqs[RPn]);
> -		check();
> +		writeval_inval(sysfs_files[sysfs_gt][MAX].filp, origfreqs[sysfs_gt][RPn], sysfs_gt);
> +		check(sysfs_gt);
>   	}
>   
>   	igt_debug("\nDecrease min to midpoint...\n");
> -	writeval(sysfs_files[MIN].filp, fmid);
> +	writeval(sysfs_files[sysfs_gt][MIN].filp, fmid, sysfs_gt);
>   	if (load_gpu)
>   		do_load_gpu();
> -	check();
> +	check(sysfs_gt);
>   
>   	igt_debug("\nDecrease min to RPn...\n");
> -	writeval(sysfs_files[MIN].filp, origfreqs[RPn]);
> +	writeval(sysfs_files[sysfs_gt][MIN].filp, origfreqs[sysfs_gt][RPn], sysfs_gt);
>   	if (load_gpu)
>   		do_load_gpu();
> -	check();
> +	check(sysfs_gt);
>   
>   	igt_debug("\nDecrease min below RPn (invalid)...\n");
> -	writeval_inval(sysfs_files[MIN].filp, 0);
> -	check();
> +	writeval_inval(sysfs_files[sysfs_gt][MIN].filp, 0, sysfs_gt);
> +	check(sysfs_gt);
>   
>   	igt_debug("\nDecrease max to midpoint...\n");
> -	writeval(sysfs_files[MAX].filp, fmid);
> -	check();
> +	writeval(sysfs_files[sysfs_gt][MAX].filp, fmid, sysfs_gt);
> +	check(sysfs_gt);
>   
>   	igt_debug("\nDecrease max to RPn...\n");
> -	writeval(sysfs_files[MAX].filp, origfreqs[RPn]);
> -	check();
> +	writeval(sysfs_files[sysfs_gt][MAX].filp, origfreqs[sysfs_gt][RPn], sysfs_gt);
> +	check(sysfs_gt);
>   
>   	igt_debug("\nDecrease max below RPn (invalid)...\n");
> -	writeval_inval(sysfs_files[MAX].filp, 0);
> -	check();
> +	writeval_inval(sysfs_files[sysfs_gt][MAX].filp, 0, sysfs_gt);
> +	check(sysfs_gt);
>   
> -	if (origfreqs[RP0] > origfreqs[RPn]) {
> +	if (origfreqs[sysfs_gt][RP0] > origfreqs[sysfs_gt][RPn]) {
>   		igt_debug("\nIncrease min to RP0 (invalid)...\n");
> -		writeval_inval(sysfs_files[MIN].filp, origfreqs[RP0]);
> -		check();
> +		writeval_inval(sysfs_files[sysfs_gt][MIN].filp, origfreqs[sysfs_gt][RP0], sysfs_gt);
> +		check(sysfs_gt);
>   	}
>   
>   	igt_debug("\nIncrease max to midpoint...\n");
> -	writeval(sysfs_files[MAX].filp, fmid);
> -	check();
> +	writeval(sysfs_files[sysfs_gt][MAX].filp, fmid, sysfs_gt);
> +	check(sysfs_gt);
>   
>   	igt_debug("\nIncrease max to RP0...\n");
> -	writeval(sysfs_files[MAX].filp, origfreqs[RP0]);
> -	check();
> +	writeval(sysfs_files[sysfs_gt][MAX].filp, origfreqs[sysfs_gt][RP0], sysfs_gt);
> +	check(sysfs_gt);
>   
>   	igt_debug("\nIncrease max above RP0 (invalid)...\n");
> -	writeval_inval(sysfs_files[MAX].filp, origfreqs[RP0] + 1000);
> -	check();
> +	writeval_inval(sysfs_files[sysfs_gt][MAX].filp, origfreqs[sysfs_gt][RP0] + 1000, sysfs_gt);
> +	check(sysfs_gt);
>   
> -	writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
> -	writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
> +	writeval(sysfs_files[sysfs_gt][MIN].filp, origfreqs[sysfs_gt][MIN], sysfs_gt);
> +	writeval(sysfs_files[sysfs_gt][MAX].filp, origfreqs[sysfs_gt][MAX], sysfs_gt);
>   }
>   
> -static void basic_check(void)
> +static void basic_check(int sysfs_gt)
>   {
>   	int freqs[NUMFREQ];
>   
> -	read_freqs(freqs);
> -	dump(freqs);
> +	read_freqs(freqs, sysfs_gt);
> +	dump(freqs, sysfs_gt);
>   	check_freq_constraints(freqs);
>   }
>   
>   #define IDLE_WAIT_TIMESTEP_MSEC 250
>   #define IDLE_WAIT_TIMEOUT_MSEC 2500
> -static void idle_check(void)
> +static void idle_check(int sysfs_gt)
>   {
>   	int freqs[NUMFREQ];
>   	int wait = 0;
> @@ -515,8 +528,8 @@ static void idle_check(void)
>   	/* Monitor frequencies until cur settles down to min, which should
>   	 * happen within the allotted time */
>   	do {
> -		read_freqs(freqs);
> -		dump(freqs);
> +		read_freqs(freqs, sysfs_gt);
> +		dump(freqs, sysfs_gt);
>   		check_freq_constraints(freqs);
>   		if (freqs[ACT] <= freqs[RPn])
>   			break;
> @@ -532,7 +545,7 @@ static void idle_check(void)
>   
>   #define LOADED_WAIT_TIMESTEP_MSEC 100
>   #define LOADED_WAIT_TIMEOUT_MSEC 3000
> -static void loaded_check(void)
> +static void loaded_check(int sysfs_gt)
>   {
>   	int freqs[NUMFREQ];
>   	int wait = 0;
> @@ -540,8 +553,8 @@ static void loaded_check(void)
>   	/* Monitor frequencies until cur increases to max, which should
>   	 * happen within the allotted time */
>   	do {
> -		read_freqs(freqs);
> -		dump(freqs);
> +		read_freqs(freqs, sysfs_gt);
> +		dump(freqs, sysfs_gt);
>   		check_freq_constraints(freqs);
>   		if (freqs[CUR] >= freqs[MAX])
>   			break;
> @@ -556,19 +569,19 @@ static void loaded_check(void)
>   
>   #define STABILIZE_WAIT_TIMESTEP_MSEC 250
>   #define STABILIZE_WAIT_TIMEOUT_MSEC 15000
> -static void stabilize_check(int *out)
> +static void stabilize_check(int *out, int sysfs_gt)
>   {
>   	int freqs[NUMFREQ];
>   	int wait = 0;
>   
>   	/* Monitor frequencies until HW will stabilize cur frequency.
>   	 * It should happen within allotted time */
> -	read_freqs(freqs);
> -	dump(freqs);
> +	read_freqs(freqs, sysfs_gt);
> +	dump(freqs, sysfs_gt);
>   	usleep(1000 * STABILIZE_WAIT_TIMESTEP_MSEC);
>   	do {
> -		read_freqs(out);
> -		dump(out);
> +		read_freqs(out, sysfs_gt);
> +		dump(out, sysfs_gt);
>   
>   		if (memcmp(freqs, out, sizeof(freqs)) == 0)
>   			break;
> @@ -581,75 +594,83 @@ static void stabilize_check(int *out)
>   	igt_debug("Waited %d msec to stabilize cur\n", wait);
>   }
>   
> -static void boost_freq(int fd, int *boost_freqs)
> +static void restore_sysfs_on_each_gt(void)
>   {
> -	int64_t timeout = 1;
> -	igt_spin_t *load;
> -	/* We need to keep dependency spin offset for load->handle */
> -	uint64_t ahnd = get_simple_l2h_ahnd(fd, 0);
> -
> -	load = igt_spin_new(fd, .ahnd = ahnd);
> -
> -	/* Strip off extra fences from the object, and keep it from starting */
> -	igt_spin_free(fd, igt_spin_new(fd, .ahnd = ahnd, .dependency = load->handle));
> +	int tmp, gt;
>   
> -	/* Waiting will grant us a boost to maximum */
> -	gem_wait(fd, load->handle, &timeout);
> +	i915_for_each_gt(drm_fd, tmp, gt) {
> +		writeval(sysfs_files[gt][MIN].filp, origfreqs[gt][MIN], gt);
> +		writeval(sysfs_files[gt][MAX].filp, origfreqs[gt][MAX], gt);
> +		writeval(sysfs_files[gt][BOOST].filp, origfreqs[gt][BOOST], gt);
> +	}
> +}
>   
> -	read_freqs(boost_freqs);
> -	dump(boost_freqs);
> +static void boost_freq(int fd, int *boost_freqs, int sysfs_gt)
> +{
> +	const intel_ctx_t *ctx;
> +	uint64_t ahnd;
> +	int64_t timeout = 1;
> +	igt_spin_t *spin;
>   
> -	/* Avoid downlocking till boost request is pending */
> -	igt_spin_end(load);
> -	gem_sync(fd, load->handle);
> -	igt_spin_free(fd, load);
> -	put_ahnd(ahnd);
> +	do {
> +		ctx = intel_ctx_create_for_gt(fd, sysfs_gt);
> +		ahnd = get_reloc_ahnd(fd, ctx->id);
> +		spin = igt_spin_new(fd,
> +				    .ahnd = ahnd,
> +				    .ctx = ctx);
> +		igt_assert(gem_bo_busy(fd, spin->handle));
> +		gem_wait(fd, spin->handle, &timeout);
> +		read_freqs(boost_freqs, sysfs_gt);
> +		dump(boost_freqs, sysfs_gt);
> +		igt_spin_end(spin);
> +		igt_spin_free(fd, spin);
> +	} while (boost_freqs[CUR] != boost_freqs[BOOST]);
>   }
>   
> -static void waitboost(int fd, bool reset)
> +static void waitboost(int fd, bool reset, int sysfs_gt)
>   {
>   	int pre_freqs[NUMFREQ];
>   	int boost_freqs[NUMFREQ];
>   	int post_freqs[NUMFREQ];
> -	int fmid = (origfreqs[RPn] + origfreqs[RP0]) / 2;
> -	fmid = get_hw_rounded_freq(fmid);
> +	int fmid = (origfreqs[sysfs_gt][RPn] + origfreqs[sysfs_gt][RP0]) / 2;
> +
> +	fmid = get_hw_rounded_freq(fmid, sysfs_gt);
>   
> -	igt_require(origfreqs[RP0] > origfreqs[RPn]);
> +	igt_require(origfreqs[sysfs_gt][RP0] > origfreqs[sysfs_gt][RPn]);
>   
>   	load_helper_run(LOW);
>   
>   	igt_debug("Apply low load...\n");
>   	sleep(1);
> -	stabilize_check(pre_freqs);
> +	stabilize_check(pre_freqs, sysfs_gt);
>   
>   	if (reset) {
>   		igt_debug("Reset gpu...\n");
>   		igt_force_gpu_reset(fd);
>   		sleep(1);
>   	}
> -
>   	/* Set max freq to less than boost freq */
> -	writeval(sysfs_files[MAX].filp, fmid);
> +	writeval(sysfs_files[sysfs_gt][MAX].filp, fmid, sysfs_gt);
>   
>   	/* When we wait upon the GPU, we want to temporarily boost it
>   	 * to maximum.
>   	 */
> -	boost_freq(fd, boost_freqs);
> +	boost_freq(fd, boost_freqs,  sysfs_gt);
>   
>   	/* Set max freq to original softmax */
> -	writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
> +	writeval(sysfs_files[sysfs_gt][MAX].filp, origfreqs[sysfs_gt][MAX], sysfs_gt);
>   
>   	igt_debug("Apply low load again...\n");
>   	sleep(1);
> -	stabilize_check(post_freqs);
> +	stabilize_check(post_freqs, sysfs_gt);
>   
>   	igt_debug("Removing load...\n");
>   	load_helper_stop();
> -	idle_check();
> +	idle_check(sysfs_gt);
>   
> -	igt_assert_lt(pre_freqs[CUR], pre_freqs[MAX]);
> +	igt_assert_lte(pre_freqs[CUR], pre_freqs[MAX]);
>   	igt_assert_eq(boost_freqs[CUR], boost_freqs[BOOST]);
> -	igt_assert_lt(post_freqs[CUR], post_freqs[MAX]);
> +	igt_assert_lte(post_freqs[CUR], post_freqs[MAX]);
>   }
>   
>   static uint32_t batch_create(int i915, uint64_t sz)
> @@ -899,13 +920,17 @@ static void engine_order(int i915)
>   
>   static void pm_rps_exit_handler(int sig)
>   {
> -	if (sysfs_files[MAX].filp) {
> -		if (origfreqs[MIN] > readval(sysfs_files[MAX].filp)) {
> -			writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
> -			writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
> -		} else {
> -			writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
> -			writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
> +	int tmp, gt;
> +
> +	i915_for_each_gt(drm_fd, tmp, gt) {
> +		if (sysfs_files[gt][MAX].filp) {
> +			if (origfreqs[gt][MIN] > readval(sysfs_files[gt][MAX].filp)) {
> +				writeval(sysfs_files[gt][MAX].filp, origfreqs[gt][MAX], gt);
> +				writeval(sysfs_files[gt][MIN].filp, origfreqs[gt][MIN], gt);
> +			} else {
> +				writeval(sysfs_files[gt][MIN].filp, origfreqs[gt][MIN], gt);
> +				writeval(sysfs_files[gt][MAX].filp, origfreqs[gt][MAX], gt);
> +			}
>   		}
>   	}
>   
> @@ -1082,8 +1107,8 @@ static void test_thresholds(int i915, unsigned int gt, unsigned int flags)
>   
>   igt_main
>   {
> +	int tmp, gt;
>   	igt_fixture {
> -		struct sysfs_file *sysfs_file = sysfs_files;
>   		char sysfs_path[80];
>   		int ret;
>   
> @@ -1094,23 +1119,24 @@ igt_main
>   		igt_assert(igt_sysfs_path(drm_fd, sysfs_path,
>   					  sizeof(sysfs_path)));
>   
> -		do {
> -			int val = -1;
> -			char *path;
> -
> -			ret = asprintf(&path, "%s/gt_%s_freq_mhz",
> -				       sysfs_path, sysfs_file->name);
> -			igt_assert(ret != -1);
> -			sysfs_file->filp = fopen(path, sysfs_file->mode);
> -			igt_require(sysfs_file->filp);
> -			setbuf(sysfs_file->filp, NULL);
> -
> -			val = readval(sysfs_file->filp);
> -			igt_assert(val >= 0);
> -			sysfs_file++;
> -		} while (sysfs_file->name != NULL);
> -
> -		read_freqs(origfreqs);
> +		i915_for_each_gt(drm_fd, tmp, gt) {
> +			for (int j = 0; j < NUMFREQ; j++) {
> +				struct sysfs_file *sysfs_file = &sysfs_files[gt][j];
> +				int val = -1;
> +				char *path;
> +
> +				ret = asprintf(&path, "%s/gt/gt%d/rps_%s_freq_mhz",
> +					       sysfs_path, gt, sysfs_file->name);
> +				igt_assert(ret != -1);
> +				sysfs_file->filp = fopen(path, sysfs_file->mode);
> +				igt_require(sysfs_file->filp);
> +				setbuf(sysfs_file->filp, NULL);
> +
> +				val = readval(sysfs_file->filp);
> +				igt_assert(val >= 0);
> +				origfreqs[gt][j] = val;
> +			}
> +		}
>   
>   		igt_install_exit_handler(pm_rps_exit_handler);
>   	}
> @@ -1118,28 +1144,37 @@ igt_main
>   	igt_subtest("basic-api") {
>   		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
>   			      "This subtest is not supported when SLPC is enabled\n");
> -		min_max_config(basic_check, false);
> +		i915_for_each_gt(drm_fd, tmp, gt) {
> +			min_max_config(basic_check, false, gt);
> +		}
>   	}
> -
>   	/* Verify the constraints, check if we can reach idle */
>   	igt_subtest("min-max-config-idle") {
>   		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
>   			      "This subtest is not supported when SLPC is enabled\n");
> -		min_max_config(idle_check, true);
> +			i915_for_each_gt(drm_fd, tmp, gt) {
> +				min_max_config(idle_check, true, gt);
> +			}
>   	}
>   
>   	/* Verify the constraints with high load, check if we can reach max */
>   	igt_subtest("min-max-config-loaded") {
>   		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
>   			      "This subtest is not supported when SLPC is enabled\n");
> -		load_helper_run(HIGH);
> -		min_max_config(loaded_check, false);
> -		load_helper_stop();
> +		i915_for_each_gt(drm_fd, tmp, gt) {
> +			load_helper_run(HIGH);
> +			min_max_config(loaded_check, false, gt);
> +			load_helper_stop();
> +		}
>   	}
> -
>   	/* Checks if we achieve boost using gem_wait */
>   	igt_subtest("waitboost") {
> -		waitboost(drm_fd, false);
> +		restore_sysfs_on_each_gt();
> +		sleep(1);
> +		i915_for_each_gt(drm_fd, tmp, gt) {
> +			igt_info("gt%u\n", gt);
> +			waitboost(drm_fd, false, gt);
> +		}
>   	}
>   
>   	igt_describe("Check if the order of fences does not affect waitboosting");
> @@ -1155,13 +1190,18 @@ igt_main
>   	/* Test boost frequency after GPU reset */
>   	igt_subtest("reset") {
>   		igt_hang_t hang;
> +
> +		restore_sysfs_on_each_gt();
> +		sleep(1);
>   		hang = igt_allow_hang(drm_fd, 0, 0);
> -		waitboost(drm_fd, true);
> +		i915_for_each_gt(drm_fd, tmp, gt) {
> +			igt_info("gt%u\n", gt);
> +			waitboost(drm_fd, true, gt);
> +		}
>   		igt_disallow_hang(drm_fd, hang);
>   	}
>   
>   	igt_subtest_with_dynamic("thresholds-idle") {
> -		int tmp, gt;
>   		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
>   			      "This subtest is not supported when SLPC is enabled\n");
>   		i915_for_each_gt(drm_fd, tmp, gt) {
> @@ -1171,7 +1211,6 @@ igt_main
>   	}
>   
>   	igt_subtest_with_dynamic("thresholds") {
> -		int tmp, gt;
>   		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
>   			      "This subtest is not supported when SLPC is enabled\n");
>   		i915_for_each_gt(drm_fd, tmp, gt) {
> @@ -1181,7 +1220,6 @@ igt_main
>   	}
>   
>   	igt_subtest_with_dynamic("thresholds-park") {
> -		int tmp, gt;
>   		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
>   			      "This subtest is not supported when SLPC is enabled\n");
>   		i915_for_each_gt(drm_fd, tmp, gt) {
> @@ -1191,7 +1229,6 @@ igt_main
>   	}
>   
>   	igt_subtest_with_dynamic("thresholds-idle-park") {
> -		int tmp, gt;
>   		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
>   			      "This subtest is not supported when SLPC is enabled\n");
>   
> @@ -1200,7 +1237,6 @@ igt_main
>   				test_thresholds(drm_fd, gt, TEST_IDLE | TEST_PARK);
>   		}
>   	}
> -
>   	igt_fixture
>   		drm_close_driver(drm_fd);
>   }
