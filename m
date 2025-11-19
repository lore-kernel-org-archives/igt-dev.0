Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DD9CF34B5
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 14:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4005610E244;
	Wed, 19 Nov 2025 14:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGow2Lqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C6E10E244
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 14:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763561731; x=1795097731;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F4vtsvDYvfA+EVhP77UXJpezmUgCBKbSZ3o9AB3VONI=;
 b=XGow2LqpBptz0yPua8s0Qe3bhyX+1MEcyEgngYZIwg2MTkIPQ5xv6v7H
 Oj+HOTGN3czEp9ugfamfeYIczTFBTl8UbEYPSyE/MYfENQnCps+WJIXNr
 jYx59cKbFNwTSZiRsc3caRlknHsObrN2+/NmTCeI+ew+7iL8myljya24F
 7fJwLAyb4TMWvJh4MkfelTTSS5d/laKGlEQ4dvRJyBeTIlsLHNSNDe8iH
 7x675CLk4GocLXaty1NfVzWs/+5vrPTBRCkW08zES+BrOXdphJk4kuFH3
 VHnODRPRE2YQS98ULFHgHlHAW8Z5dqCCJcuf8qwqhVs6aoLbVW5qoI4kv w==;
X-CSE-ConnectionGUID: CwAZw7jISz6eGtaEiOpv3w==
X-CSE-MsgGUID: T8H0aChHR++PcjCEnssBPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65694151"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="65694151"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 06:15:21 -0800
X-CSE-ConnectionGUID: O8TWG3wOQ4KFtW+7v+nhMQ==
X-CSE-MsgGUID: bl9zfrJVTT6/hUiwQm/p8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="221703296"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 06:15:21 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 06:15:20 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 06:15:20 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 06:15:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2SRdf5xx+ieoZFlWtWMJ4SnERhNSZP2pyqETs77o/CEdfuOxBvkNUvfvUkE4rUCbu1mfkHwY/JH8ytbkosxNlujorsj8XOHX7u3pkkEnZkMmwSCIKY4Q2YQ/5mQL51uIFqMqgaATt9buV4Ejqj8UktMn5jXHbYPS/WL1dOkDb1ocTplitxLzoGytsof6dF+IYouh3wub9fxo9wrjTY0U1HdBk12WCty7p0btmB7/eBLHador8nanwh8zlNNkcUjXE6BWlCs3DAhEZtUQN1YOEa7L5szdNQRjAXo+DCsGSX7+2u/OuvIf2vksUtuAqRNKh9b6BrcGlJDw5lYkNlk4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lt+zWZJmhL9wDMa4wMtgOFOc09PxxFoh1DhTgLpqL34=;
 b=rvypOQ5hnLNVhnBTDcDMkqpwJaHWqCyeueg4Os146tXavuMKlMpCzzdF4uCQiogz45sebE2SXz6UxvVHZU8DpEsz7j74KbPBnKqWHJXDZbweq1DE1tzAcYjC78MRH/5TIuTvwO5nRzqpGFJ/Xr4AeoRm5jJ348IEU4F1S5cD4CwZMNrfu4nnetAthiKz4V24NisVvymNbUxtCRZU7RWtlOSBNVEFkVXHD36ejjhQ5bdKP2HSQ9wO9N2Ee0Hzxm7ViEYVVDvO9vKrbxFIHXp3AWIr5aJsKFQMTlwYIaWCrHz/Gb/IZxgeMNHkj5ZS35uTC3xFMIuUGkFdbbVyvBpk9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 14:15:17 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 14:15:17 +0000
Message-ID: <4cf2a7c5-9e9a-49aa-87b0-124eb61803db@intel.com>
Date: Wed, 19 Nov 2025 15:15:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/xe/xe_sriov_provisioning: Drop sched_if_idle
 reads
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Jakub Kolakowski <jakub1.kolakowski@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20251022155839.288289-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251022155839.288289-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::15) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH0PR11MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: f20f5d61-4cad-4f3e-8917-08de277610c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0pqUks5Z3hGSFB1WFVFUm9DU0ZKRk9jWFYzcSsrSXRydmxhdU0xZWlFYm1s?=
 =?utf-8?B?ZGNyV2UrcnZDR1pNbVJXTDl1T3Z4SUhnRmNZcWEveGVOQ0xMV3hDSFFDcVpn?=
 =?utf-8?B?bGZ2T0x4M0gzNjRWOUw4OWNiVGw3dHVYb0Y3KzFGL0pxaHBLVThnQUpNbWJs?=
 =?utf-8?B?dXJWMFJ2bWxMWlhxaGNEcjNjQTZScXVFYWxIYnJub2NxSzBVSmFwSGlPd2ts?=
 =?utf-8?B?SHZlTUFGNXBIa1BHcFdkTUd3Q1c1aVVYbzJra3ZYSTRIRXdSeUVVME5FTnJE?=
 =?utf-8?B?c0lMc1dFTG5kdFBFaGk2WnkvYm9EUVdWb1pPZ3JBaEVkYkJ2enFIanYvTXBl?=
 =?utf-8?B?UTZGMXRrclZ0aXV4dmNISVFSZ250VlRPYmYrY25tcE9DNlJpOVB3M2xqUVgy?=
 =?utf-8?B?RmZrU3hwTjFhUGRhWklVTzZkL1B0MFNVeVViUUdRNi9DM3dPdjBPd2JINTVU?=
 =?utf-8?B?WnBwa3ExNzBzSnFuNmZ3NVFHWGI4TnFrT1hvYUMrQWZQZ2JhZW85M2FBcDRl?=
 =?utf-8?B?L0dOblZoUHZ3M2IwTUNUSXFyakFKbmpUK2k4ZzFuenFOUFlHQWJtWjJzTkEr?=
 =?utf-8?B?MkdSaEpKVXRWaExRTXJMVW9ZcGh2dG50aVloWUlreW5DUzFvakp6RDBqYkR0?=
 =?utf-8?B?YXB0UG4vbmFISWJ5K3pnaGJlTVRxaEpKNGdkU1pLVFZhYlQ0eFI0VEpUQVBp?=
 =?utf-8?B?L2FKeFdXam1aSmY4NEs1ZzB1WDhhRXpjZVBTcUlqZ0s3czJiN2tRdGxBNktm?=
 =?utf-8?B?cVU4d3JDT2dtbWlFUW83T2NFV3NpbGM0cEo2VE81SUZ3L3V5blVTUGM1Yisv?=
 =?utf-8?B?UmxSMHNEenZyK2VNVlZ6MmJuRUhPdDBkemViYXRCMFQrZzlONGIxd294anlx?=
 =?utf-8?B?L3d5YjFzUzNLZUwwZjJvT3VZSzJZUnkwdDl0QlBHMEV2U0JvSHRXV2Q4dkYy?=
 =?utf-8?B?TkFLZXYvcTgxQmdrWmJmY09uVW45UWxYTUdzVXM2WCtJMHpxZWVkRTRVVVhw?=
 =?utf-8?B?RjAzOXNpTU1DdEltb1NBZTllNmdLQjJSS2Rrbzhud001Y3lsSW9UWERXRzdw?=
 =?utf-8?B?YUt3REx6WkhqSURON2Q2dzZhdytmNGVoMkRZZmE5Zm1BREhkdGNGc3dVQ0wr?=
 =?utf-8?B?L1ByY2NpTy9JeVdFQWxrWVhiUGVaZ3VFS2FZRVFxbGlCZWJvMm5Cb1pMUCtZ?=
 =?utf-8?B?TDR2QU1QR1d6VzBibEM2REovVTRmbFk1dGovRUoyQWFJRkdsaHo2ZnM2M1Ay?=
 =?utf-8?B?NVk5MVo3cjRzRHZNRUZWVFZqR3JJdzdDc3o0M0puMVBJSE43NWhiZmdyQTFz?=
 =?utf-8?B?cld3cjhxbEFZd0h2RkFwNWtjZWFFNXc5Q0hlc2toblE1cG1WQ2dmY3J0NldB?=
 =?utf-8?B?ckpIeVVvTVZucnVuVE5sQStEamllYUdnbmM1M0dQWllKTFFLbjFsbmEwNDB1?=
 =?utf-8?B?WnZkQ3g5WERiMGlnZTY2bW9zNlNFSzJHSG94MEFvV3VXSTBxL0VpT1VFeGdI?=
 =?utf-8?B?Y3dGalBoQ2IxbW1OMmg1T2RkanVaWFJHcVhRUnkyaUtna1VjdHE1d3ZaRGht?=
 =?utf-8?B?NVJrMkZjZ2xOUnZBK3d4K0RmZE51QXdVRkRUYzZvUTlXcTVNRnFQSjh5Vjhk?=
 =?utf-8?B?TS9OTVhJSHFiY0prZlRQZWs2NkxYbzJwZE8vYXZ0anFLN2dENUkrVHA2SVZ4?=
 =?utf-8?B?QXAzbzJhWFBQcC9hV3ExUWNoWWRtbkJNcHlBS3U3ckFTZUNLTEx6UGFDaURO?=
 =?utf-8?B?OFlYS0FjRGlYUjc3N3k1VS9uSU9lNzRYaWZRbjN2MUxWa1NFOENMbWtycGR1?=
 =?utf-8?B?cGRGUThCY3A0YmdIcm1aak4xTFROQXlhL2ZkVWVjL0FCZlFRTnlmVEpoMjky?=
 =?utf-8?B?R0dWdW9UM0I4bm9NNEU5TWc2WHowUkxKa0V6Vi9sZ0lIaGZ5cTRxTlhvQVVN?=
 =?utf-8?B?M21VL1FYUWd2Z3hLb0Z6NHQvc2pPb0xDVE5RYWdER2VEemNQMGhFRmttQUh1?=
 =?utf-8?B?dFNzeGFoMGdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFpUK2ZvY3JSSzc2djlrdUxKQzhabWdNYXgyYms4clFiaFpsVEpwVXpVWGp0?=
 =?utf-8?B?YTFiek9Pb2R2Tnd2Um55VEgzZjFzVzU4N2xocEtURkpkNnZaOEthZlVuN2Rh?=
 =?utf-8?B?NUVxVS9YZXltTG9OVHBaVnlLNzlLU2FRc0dwSkNTNUg0cEczQXNQQVFhVWhF?=
 =?utf-8?B?eHBBcjBGeW5DbVNNY2NVZGkxeFUyVmpvZFpnRVUwM3hJUS9hVUNDMFJTdCsz?=
 =?utf-8?B?RHhJZGhQcG1pMS9BcTJGQ1VjeS8vWjdwQjJmb25wdzZRTW9QSSs1MDlqNGVO?=
 =?utf-8?B?WWdpZzBlTGMwWnM3RHRUc3VxWmhLSGdpQ0VhK3dNMHpBYVVQN0F2TEh0d0FV?=
 =?utf-8?B?dXVuYlpVMDR0RFh5RGF1OGZsbVIxclFrdHRoenZYYlhKS1FINEVOc1pRNCto?=
 =?utf-8?B?VXhWZkhkWmpla1hPZGxKN2xYM3A5dUE4Nktvc0VsY2VRd0xBaHdPT0hhSHNJ?=
 =?utf-8?B?ditKMDNTRHpNQnpkcUFpK1hhbmhqODl0aGVXTU1Nd2lBVWhvdytIMmxrZ3Bx?=
 =?utf-8?B?Q0ZNMlI5ZncwaGtRQVp0dW1vSmlHQTFXVFU4cGJNTjY4S1VHMzdQaEQxMG5r?=
 =?utf-8?B?Ym9UNnlDZWZzTE0xYkN3QVNSc21FU0tCSDhtNkhKVjNUUzhTLzZQU1ZxemtP?=
 =?utf-8?B?RFF0UFMzMEZReUU3ZkJVczJnbU9VblA1bFZHVnFUTStKK2VpeFFPRTdWUFly?=
 =?utf-8?B?aW1USzVIcFdNVTlJMXd6TzVydEFsdS9Nd3gwemRDN2VySFhsem92TEROTDJN?=
 =?utf-8?B?amdYN1ZKQjZFbnNkdDlPeUhBZWQzazkvdlZ6MGdFeWN2SUF4YzRnUDU4cUNF?=
 =?utf-8?B?NHFVK3pWNnJtc2FIcjB1SHlRR3gyc080QTRkQzJURGVqWm1pTDNRTjZsTW8y?=
 =?utf-8?B?WWZxNWFSRlNNeHBSY0Rybk8xWkFMSGs1Z3JNaDVZeVlMMmM3N3JxMDhyQ1VD?=
 =?utf-8?B?UThNdmRDell2NFlqbVEzanJmUVFNWWI1WEVpL0N3eEcxeHc3SmN2VlZjYjNu?=
 =?utf-8?B?SkZqVzFYVzRWNW9ITXYwak0vVjQzR3JqNW1Bb0V0b2Z3dngxYkVESGl1S2Vw?=
 =?utf-8?B?aysyTVE1NmZieTJROXROMjhyaGw5T2F0Vy9vUzBXY0JFV0NTN2ZhakdUL0tV?=
 =?utf-8?B?dnNoR2tmV0gxUG9mN1lTa3J6UWtnY1Z2V0RPZFZUYzd2NWVxWHVST25kdDlE?=
 =?utf-8?B?dmtuWk5ZbkQyYTdjTmZzRDB5N3pYTURxNkR4Z1kxQi80My9YYjlMcWhtWEh2?=
 =?utf-8?B?TXJSOTRmOGRxS05qMmQzZVZKenlhbmUyUWN1dUMvMm5JR1NOSFBudWpqdDZB?=
 =?utf-8?B?Y3hHMFU5REEwU3l2U2FQSlVURXREdURzMnhJYy9NRHpSZTU0WWthUjUyUlJw?=
 =?utf-8?B?WS9LZ1VqRThLRmJqZmFqY1FublNwS0NjZGRXellrakdTRVpPZXMyQmx2aGZj?=
 =?utf-8?B?UjVEcDMybFp6VHR3RTBJdGFTSzJVNWMzaklZVjhmb1VlNi9SdWdpRVhoandU?=
 =?utf-8?B?dkVaSDh2dXlqY3lNc2hKLzhoZC9aeERGQ2J6U3lsTTJTQjlHYjNLelVPR29M?=
 =?utf-8?B?RVVVRmxwY2ZaL3JVSzR2UTd6OHpKUm5wdmNoRHlrTThVcGtrUU05TnBGUUhz?=
 =?utf-8?B?Q1pveUxzdmNiNWgvQkcwYndPdWMremI3OXMyRjRWZ3VoM09jOXZRTUN2bnB5?=
 =?utf-8?B?ZmFtcWJpQ25GSitrQ3NyaFJPcGFCcmlNVUNicTRlb012dU9LQUp0L1c4QjBl?=
 =?utf-8?B?NEl2RWt6R3lIU2lrMkV1OENjYjJBMHJ3dk9obDI2RzNYNnhZdWxPN0F4VmF3?=
 =?utf-8?B?Y3NYRzhVR3RLOXZFdmY4TlhKZXJwTTg4Mm8zbUVwSnc2cEpSdExFRGV1U2tl?=
 =?utf-8?B?MWNLQjNpcE1naWJMZ25rMHlNUTE3QTg4WExRaDZZSTNyMEZ4d2QvWXNmL0JG?=
 =?utf-8?B?VTEyOXpCSU9vUDBRUW15UTNQamlQeUtuN2NrVUF4bjJBUW1OZDZnVS9nbysv?=
 =?utf-8?B?MEZOYWhvSTBnZVpPQVowRXN0QlNUTlhFaXVhcFJhcWZnOWRaakQxNll3NjRm?=
 =?utf-8?B?OHVxNWpsOU5JcGp1dXNnWVdTSjdBb2x3VG9WV250ZVdGMElJOXNQaVA1RFd1?=
 =?utf-8?Q?5+CqP8UGXZfM+y3D1Gzi2puIA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f20f5d61-4cad-4f3e-8917-08de277610c8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 14:15:17.7638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ST4Y+cQEW8/hpQlseMoEf6XoVtcLtmyCpgizqE9qfruCcUbLsbZ1OtRxpQU0ggxTo0Q5V6Q2Cab/TSbPkg2GbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7585
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

On 10/22/2025 17:58, Marcin Bernatowicz wrote:
> Reflect kernel change making sched_if_idle debugfs attribute write-only.
> Remove related getters, checks, and update default attributes and tests.
>
> Link: https://lore.kernel.org/intel-xe/20251021210549.2114-1-michal.wajdeczko@intel.com/
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   lib/xe/xe_sriov_provisioning.c | 41 +---------------------------------
>   lib/xe/xe_sriov_provisioning.h |  2 --
>   tests/intel/xe_pmu.c           |  9 ++++----
>   3 files changed, 5 insertions(+), 47 deletions(-)
>
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index ff9d1f7d2..28ce3d95b 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -570,42 +570,6 @@ void xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value)
>   	igt_fail_on(__xe_sriov_set_engine_reset(pf, gt_num, value));
>   }
>   
> -/**
> - * __xe_sriov_get_sched_if_idle - Get the scheduling if idle policy for a given GT
> - * @pf: PF device file descriptor
> - * @gt_num: GT number
> - * @value: Pointer to store the read scheduling if idle policy status
> - *
> - * Reads the scheduling if idle policy status for the given PF device @pf on GT @gt_num.
> - *
> - * Return: 0 on success, negative error code on failure.
> - */
> -int __xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num, bool *value)
> -{
> -	return __xe_sriov_pf_debugfs_get_boolean(pf, 0, gt_num, "sched_if_idle", value);
> -}
> -
> -/**
> - * xe_sriov_get_sched_if_idle - Get the scheduling if idle policy for a given GT
> - * @pf: PF device file descriptor
> - * @gt_num: GT number
> - *
> - * A throwing version of __xe_sriov_get_sched_if_idle().
> - * Instead of returning an error code, it returns the scheduling if idle policy status
> - * and asserts in case of an error.
> - *
> - * Return: The scheduling if idle status for the given GT.
> - *         Asserts in case of failure.
> - */
> -bool xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num)
> -{
> -	bool value;
> -
> -	igt_fail_on(__xe_sriov_get_sched_if_idle(pf, gt_num, &value));
> -
> -	return value;
> -}
> -
>   /**
>    * __xe_sriov_set_sched_if_idle - Set the scheduling if idle policy status for a given GT
>    * @pf: PF device file descriptor
> @@ -731,7 +695,6 @@ void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_nu
>    * Default scheduling attributes are as follows for each VF and PF:
>    * - exec_quantum_ms equals zero (meaning infinity)
>    * - preempt_timeout_us equals zero (meaning infinity)
> - * - sched_if_idle equals false
>    * - reset_engine equals false
>    * - sched_priority equals XE_SRIOV_SCHED_PRIORITY_LOW
>    */
> @@ -739,13 +702,11 @@ void xe_sriov_require_default_scheduling_attributes(int pf)
>   {
>   	unsigned int totalvfs = igt_sriov_get_total_vfs(pf);
>   	enum xe_sriov_sched_priority sched_priority;
> -	bool sched_if_idle, reset_engine;
> +	bool reset_engine;
>   	uint32_t eq, pt;
>   	unsigned int gt;
>   
>   	xe_for_each_gt(pf, gt) {
> -		igt_skip_on(__xe_sriov_get_sched_if_idle(pf, gt, &sched_if_idle));
> -		igt_require_f(!sched_if_idle, "sched_if_idle != false on gt%u\n", gt);
>   		igt_skip_on(__xe_sriov_get_engine_reset(pf, gt, &reset_engine));
>   		igt_require_f(!reset_engine, "reset_engine != false on gt%u\n", gt);
>   
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> index e1a9d0a63..8ee567bc8 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -134,8 +134,6 @@ int __xe_sriov_get_engine_reset(int pf, unsigned int gt_num, bool *value);
>   bool xe_sriov_get_engine_reset(int pf, unsigned int gt_num);
>   int __xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value);
>   void xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value);
> -int __xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num, bool *value);
> -bool xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num);
>   int __xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
>   void xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
>   int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 9525655ba..c630fd047 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -692,13 +692,13 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
>   	}
>   }
>   
> -static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci, int function)
> +static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
> +			       int function, bool sched_if_idle)
>   {
>   	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
>   	double busy_percent, exec_quantum_ratio;
>   	struct xe_cork *cork = NULL;
>   	int pmu_fd[2], fn_fd;
> -	bool sched_if_idle;
>   	uint32_t vm;
>   
>   	if (function > 0) {
> @@ -748,7 +748,6 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
>   	if (function > 0)
>   		close(fn_fd);
>   
> -	sched_if_idle = xe_sriov_get_sched_if_idle(fd, eci->gt_id);
>   	if (sched_if_idle)
>   		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>   	else
> @@ -1188,13 +1187,13 @@ igt_main
>   		igt_describe("Validate per-function engine activity");
>   		test_each_engine("fn-engine-activity-load", fd, eci)
>   			for (int fn = 0; fn < num_fns; fn++)
> -				engine_activity_fn(fd, eci, fn);
> +				engine_activity_fn(fd, eci, fn, false);
>   
>   		igt_describe("Validate per-function engine activity when sched-if-idle is set");
>   		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
>   			xe_sriov_set_sched_if_idle(fd, eci->gt_id, 1);
>   			for (int fn = 0; fn < num_fns; fn++)
> -				engine_activity_fn(fd, eci, fn);
> +				engine_activity_fn(fd, eci, fn, true);
>   		}
>   
>   		igt_fixture
