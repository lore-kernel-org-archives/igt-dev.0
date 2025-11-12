Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681F9CCFA1A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 08:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1932510E1B8;
	Wed, 12 Nov 2025 08:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WE0wdPV2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2636610E1A6
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 08:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762937741; x=1794473741;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FTBuYYj0C8shWywUtZovPFdpJwsNrmKn37hoLiOTEoE=;
 b=WE0wdPV2f4pTi6piQPNhM03zMv03CLO3KHv6SSB/JnXUvZbWFxNifF8D
 2us9kAiEh6U8vVgntj3iBvR4ZRdvTPv+HJFczkMtYs4RSNdvkxFqSWUDR
 vsYCLwBG5cyi74L6LXee0pucAUgkN8UDGJEAPmvF8OAcT0Xb/KR4yXduO
 dmyKlC/XOEBTALARcPM7A5YZ1Jli56F9fsoprmgLJZipQjdjR7NCgkhhA
 Z4AIA4GHLmqCnsArmiFqAykBOEkFnlxXcVtIU4Z8UzpO4sJ0v98gbvbhA
 zVQ6WUM2ZV0vOXvoox+fX5qKA5AEhRidW13LFkEbnREh16vr4ms6JU4pF w==;
X-CSE-ConnectionGUID: I970ZjwHQ5203elRlmlSeQ==
X-CSE-MsgGUID: gYAGkce/TVaCwZbc0DBTuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="82627744"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="82627744"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 00:55:41 -0800
X-CSE-ConnectionGUID: W8LIwk1YRfCr++lCCM3n/A==
X-CSE-MsgGUID: 9/ZmjGHISieHWjNpqSWo7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189428523"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 00:55:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 00:55:39 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 00:55:39 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 00:55:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOegDyLmm/Uon+YJCfZNqnojTr3IrI9PpAczmOfTjo34FEH7uyI6ljIfQOAkx77snBcbqLanpincVLgbQjZOZvbkYz1R9/cwPEIpNnsQICUZdOq9JDQWzLS4mb0k6u7IKroKmp6JE53ofw4431fbZ+OUE7JOLrbImTi4cXnBl8sTAyy1vafBczfLg5Yx8iA+6E7pFOoXFCbN/8MwIdwqhBkx3kRnOFjVRMM1qs/38+JyR/zrtKmTWb00pxah8qff2HgWwMkT535fu/QDfRLGdGaPqUSEghuAZlfbSMTBW2Ihn0r7bHcMXWJ8LtUR+l4vvLCGFJ2TwRgZ9GMek51VeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cr9cHeXKubqbCJ5Mk8VC4lXpu7uFToOmSm8oRrtQRrg=;
 b=HGK+5dokh28DHqA0II1sl/0Cxx3BZkrznoao+vZXVnRd4N1Ze37cXYwKGsuZwy0zUPTLua6rUmPIOnDNsUUUm3A9HTT3gofwkir6mJJR+FyCyFK4im6AUnClX5aUi4XZn0UkeM3GSp19hEeBZ5BsDPgSm7KrEC8TIajUKIzeFxwGojVboiAQr6QDmIMT+0oSgX3X2RKyay52CVvnsXUiG5tZu2GeYgg1T20wGvm3oObTuUdvHNkgoKK7y0Q/5KJG57U1+67M7lO60J2KWUERoXEljESaLEuaeHPZqzOpaOzRFyfhUdbWQOpeWyf6TXQGTX5gxfpUFPF9zs1q++5KUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by DS4PPFA92F35354.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 08:55:37 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 08:55:37 +0000
Message-ID: <ca6ebacb-432d-453b-9478-067ec3b75c33@intel.com>
Date: Wed, 12 Nov 2025 09:55:32 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=C3=A2_i915=2ECI=2EFull=3A_failure_for_lib/xe/xe=5F?=
 =?UTF-8?Q?query=3A_implement_few_query_helpers_=28rev2=29?=
To: <igt-dev@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>
References: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
 <176264223586.33229.8564876521918217527@10055242dc62>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176264223586.33229.8564876521918217527@10055242dc62>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|DS4PPFA92F35354:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f23ad99-18e1-414a-76f7-08de21c93f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ym1UbVdUOGpFRENSN0FxWXZSTlU5T2ZYYmlEME5qY2tiNndISjNPWndmcmhw?=
 =?utf-8?B?Y1FHNW9pUEpLeTFuRVJsMER4aWJ3emN1YnVaaUNFZ0tFaEFzL1NTLzRoQ1Nw?=
 =?utf-8?B?bFBQV04xSXlST3dlYlNUandJNCt6TnorVk9La3pQMGdDdjMraTNtS0R0cFZr?=
 =?utf-8?B?cDJYUE1tdVFnd2p2cmVhVUtTN3B3ZlVLazhDZDZlVzVHNTRtTTlNclBVN2FI?=
 =?utf-8?B?ZTY1OVBtMEJybTNZQ25jOWkrNG1FTXFUUTRMajJ3Ym95Z3l5eVFMSmJWY1U1?=
 =?utf-8?B?dkVvSy9yMU80cGJaNzFiYmV2ZTBkWEpscDZNOXZON1hFUUhoS1JGZ25rR1Jx?=
 =?utf-8?B?Qys0QUc5cEFBN21vb1B4TG5UZ1VDNzRlNENsNVN4WXdNVEd4QURzaWNQeXkz?=
 =?utf-8?B?aXppNGZnM2ZlOW8xK2hHcmZCRXgwRHQ1OE9uNGR4SCthOThJUno3eVdrd2Nw?=
 =?utf-8?B?N0VvTjRkdWNGV050TVdydnJnRW03MVhYaGw5Z0dqc2VKOWl0SFVQeWhjKzY5?=
 =?utf-8?B?ZmMzVzYxYUtXWDdvMVVtWXJtUzkwMmgvNWVyNDlrYmJXeWdpeWFIakluZEVs?=
 =?utf-8?B?TnlPVEFTOFVNblZ1NEV6VGxyWlEzSVNXdDA0SHV4ekw0RW43c0hhQklSeS93?=
 =?utf-8?B?dG9LSEVaSlFQeXplOWF5aStCTDlyV2Zqa0VZVGFvZkF4V0o4THB5c09iVmxl?=
 =?utf-8?B?VWxQSGpONXFjMnMyRW41cGs4OHNEcEZYNG8rRnFCUStVbTJER1B5cmppK0hU?=
 =?utf-8?B?b1F4RmNhNmlkYk9ta01obkZ2WHlKbENKZzB1MW5FcCtHa1hCSmZzWnV2MlJE?=
 =?utf-8?B?SEhCKzREalFLTWhxSUJsVCtvdjQxMUZKMlM3WmFDRFdQbFltc3R2WnJvRHBn?=
 =?utf-8?B?d0ZFMmRhQUVJK25DaTF5SExLbkxqdjZ0MWl1NEV5aW1GaGphUHN4Ym5lbGNC?=
 =?utf-8?B?OUZEQmI3WGFhQ2FFU3BJU1R4dzVKaitsL3lxSFlrSkJQRDhub1pycnp2a2I0?=
 =?utf-8?B?cGM0QXpVV21FM3hadXdOclVsNmRQMEpzVXRzVmNUMitMbTFFU25hdW5EdElI?=
 =?utf-8?B?S1M3enVQYzM2VjAwSml6SFZ4WjJjbk9QWGprQUR0cFFtdm5KVTVraEhaSTMv?=
 =?utf-8?B?cmlLSER0Ni9ESnFKdXIyRXJVMVhGYXhjZjRoMS9BMmlWd2RyTjExWDR2TWdU?=
 =?utf-8?B?amVxazZBWGhZWU90azlsTTFLUlZKeWx2YXQzODVFelQ1MXFQNENGcis2WFd2?=
 =?utf-8?B?RnVaL08vYi9TSmRvbjNRUnRleWt3QTJMTGcwMlA4VlBxeGFJb2phdTVabWx4?=
 =?utf-8?B?SHVrb2doUWNLQUx0VG1HTWYrQlErbXM5cXpMRkhrYVg3Tzl1cU8xUStmYVRu?=
 =?utf-8?B?U0U1M2FsQnVvbldBSlV4UGRXa1VrYnkzdGxCSHNTNmdXbzRiR3pIL2dRYVJr?=
 =?utf-8?B?YXRLZHYyMkdHTEFndExMMlRsUCtvWG8ydGpyMzFNOFpvcThsOTQ1M013a3R6?=
 =?utf-8?B?bjlVSVdib1p1K2c3azdBQjBWbWM0Nmg0ejVCQS81cHFBUmtoRDRtaWhleU1I?=
 =?utf-8?B?Q04vekFyVWt1TFh6WVRvNUQvUGxwOW0zSU1nQWY1WDc1bmNRMFRVUHNtK203?=
 =?utf-8?B?NmNCR3JiVzY5Yk5RNkNQWDNKbjRnVHZSOU51WFl6clcybjYvclVhRUJZRUxV?=
 =?utf-8?B?Uk9RaG95Z2pYTm01dXplQ2RHQmo3SEtSWW1zdnMwczM1YUprVWVLbkM1Z0Q0?=
 =?utf-8?B?YWVDS0ZxYWFIZThNRjZOR2s4M2kxd2RiYmIwKzNCUVlVTUg4U1I5YnoyYUs1?=
 =?utf-8?B?OU5SNHFZQjJTeGRQYmxhUUlKUWNGQjkwUWRHdG9sSEd4a0ZIS3pGV0UzRTY1?=
 =?utf-8?B?KzY1T1hRMW1zbXYrbFV3eGM5Kzl2bjdwV2F4alczZ2NzcUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1dra0N6THFaOGRsRXl1akg4SllLdTBybWx2eWJ3cXI3bU8xN1IyY0cyRzFp?=
 =?utf-8?B?dE1nRDdSZkVaNDN2ckxNTXUrWVFYU0c1RW9KZU9vZmpDNEJJekJmcHMvSkVO?=
 =?utf-8?B?ZWkycGxzdTBMSzVsMzFHUlZCeHQwdlVKb3JxTjJWNys1N3V4ZnRsYUdOcFZW?=
 =?utf-8?B?aEJLR0VXM05LOUhkS3g0WDBqWlUxcVE3Wk1NaXVWenFoMTIzQktPaDlsMHFz?=
 =?utf-8?B?K3lJL2s5R0FEejBPTU9XMmtPd2EwRE1iMzFkUnk5ZkxIeUc4encxZkpmNVlh?=
 =?utf-8?B?M2tEVlZZSytPa0s0cEp5QkxRZU9qSjBEM2FKYUpQQUNRYVI2N0hDb25JNHRh?=
 =?utf-8?B?V0dUTWp1V1FhN0kyeUxmYmh4WjhaR2tMUWZtTC9zUXlYOFUxakFVLzRNYTJa?=
 =?utf-8?B?UG9HeVI0N1E5MVJnTWhrYjFzYjlNeEFWYjFhNmRteVNmTFZCUlVtd09tL2g1?=
 =?utf-8?B?TU1LNHM4WFJubmhCc2hVN0hjdWpIb1BkSFlvTmw1dWloMEFFbUpPaTlKSGlh?=
 =?utf-8?B?T0tOODNpRGZWQVZpNFpISlVlMUUrS1NITmtqSElEVit2S01rbmQ3MDNRaXp2?=
 =?utf-8?B?UXpBMkNYLzluZ0J5eE5NZmlqK3c0dTZYMnhvWTQyUTNqb3FIK0JxUFM2REVI?=
 =?utf-8?B?b3FrOFRqYk51Ym01QjR2cksxbFNvK1VtY2t2Sy85NU5qbnVpR2c1T1hjZzVv?=
 =?utf-8?B?bWR5OElGV1djazFmZzRISCtnSWdOanpEek84dmFzbC95OUFyenhuSFR2WWcr?=
 =?utf-8?B?bE9pV2pTdzZudlE1YjZTM0JLSUJ1OUhzSGNSRjZMN3R0Nm9CWm54NDJYclRR?=
 =?utf-8?B?b3hGaFQ5bUlpMzM3OUdGV0l1UExvQUpYVTJaSHZhTXIvNmp2alZZK1NFdnZD?=
 =?utf-8?B?NVNaT2RKa2I1aFBwRmd5R3IzVlRXMjd0TGkvblNLZm1pb2NRSEljdGU2Rm5R?=
 =?utf-8?B?anpCVm0rZWNMa0cwV1dzbDhPMjBFTlhXSm9sZkdFMSsvUklnN25TOGMzd2Mr?=
 =?utf-8?B?Vk0vVjBVZnptYVpYZ2s1dkJEeEZPMHVKdVgyMC96ZnluNENQYWNpWGQzU2VT?=
 =?utf-8?B?SFdKQy8zNzErdU9PS2E1Q3VmZ01YcmFDbHVBUWU2QlNjSUFGRlpOVEFodmhT?=
 =?utf-8?B?Qm5jSHBWQVJuT1dJQ0ZtYWZMY2hPVFA4N01HNElyaEVTNVNRSHpzWmo3cnEy?=
 =?utf-8?B?TUdydi9mTm9qOC92enRsZnhrVnB5VDVGbVd3SE15Q29xV09SNGtSZ2FQQW45?=
 =?utf-8?B?b3BicGlNQ3pNSlVUK2FJK01OTEtKVm9QMzFiZ0pnMS96MmVmZnFJTzFKYjZU?=
 =?utf-8?B?NFg0TmpFdGRMemFkVERQU3kxYWpYTFRST09XWDhNWlN3RmdzeE5wRHlxbFpU?=
 =?utf-8?B?allZaVdDM29UR3VlU08xakdTK1Y0dS9CcE1rVU5kbkRncVV1M1VYRVEwYnJP?=
 =?utf-8?B?ejd0bU96MmRpVzhJa25CTzhBN2dyKzROWEYyeEdKUTM2UmZyMjJUSXRReTNH?=
 =?utf-8?B?QS8xL0FBY0lNRmUyb2c5cTM4WmVDS05aOGtCMlVGeVN0QUpLVkgxekVDdld1?=
 =?utf-8?B?RkJtUkdKcXd0MGIvNzVrSU9wc25ZejJBRWZ6NHlBblM2N2o0SHJFWHVCVURl?=
 =?utf-8?B?eVdCdlJ5cXhUc1V5NjIvVmFtYkVoN05FbklHYzcvRmFLekgvcnc1VmFqZjRE?=
 =?utf-8?B?Y1NEVERnRFR0OHF5eEhjc0dNSllqUllZODdwdFU3MUNlajJKMFMydWhaTjVT?=
 =?utf-8?B?SjdoYVQ3YXRDS0ZZZzgyalpCcFgwTE9GemhITDQwSXU5c3dHYTdtUUxDNDVk?=
 =?utf-8?B?c3BaWllnUDhxWkhDcEN3UmNPWjU4RENNbktsQkF6ZHlYSEMyWmNxOGtMMU52?=
 =?utf-8?B?VlV0aldTYTViR0RBYk9iaEROZThGRWRqcDdUZWl4TG02cGdSMjFQYU1iZGxW?=
 =?utf-8?B?cEFSWXhBYXNuVUpNSjRULzNwWkowWVN0aVJNamp4bHpyWkR2SnFOK3VCcFRI?=
 =?utf-8?B?UHFmZ0l5bk44MTlOL0o2cC9peDNzTDluOTVpYlZmSnJNYXNMMFIwZkxqWi9N?=
 =?utf-8?B?aU1mU2Z0VU9ZWHYvR0NPdmVEUVZjSENCZmNSTE5qekJZbXlaMUYzaDRrdHFS?=
 =?utf-8?Q?fW28gdpRl43GO88mIUeLqP2i6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f23ad99-18e1-414a-76f7-08de21c93f07
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 08:55:37.2487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAt/CQB80RZmlQ1tIHzH3zD2/p+sDVIRVbvoE/4bc91aayy0Pf892tJFbyog82uqVBDgTIh0cLbIZ0AlJko9BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA92F35354
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

W dniu 08.11.2025 o 23:50, Patchwork pisze:
> *Patch Details*
> *Series:*	lib/xe/xe_query: implement few query helpers (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/157140/ <https:// 
> patchwork.freedesktop.org/series/157140/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/ 
> index.html <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_17515_full -> IGTPW_14022_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_14022_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_14022_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/ 
> index.html
> 
> 
>     Participating hosts (12 -> 11)
> 
> Missing (1): shard-snb-0
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_14022_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@panthor/panthor_gem@bo_mmap_offset:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-4/igt@panthor/
>         panthor_gem@bo_mmap_offset.html> +3 other tests skip
>   *
> 
>     igt@panthor/panthor_vm@vm_unbind:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@panthor/panthor_vm@vm_unbind.html>
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-16/igt@panthor/panthor_vm@vm_unbind.html>
> 
> 
>         Warnings
> 
>   * igt@panthor/panthor_vm@vm_create_destroy:
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@panthor/
>         panthor_vm@vm_create_destroy.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-8/igt@panthor/panthor_vm@vm_create_destroy.html> +2 other
>         tests skip


False positive. Panthor tests do not use xe specific library 
lib/xe/xe_query.

Regards
Andrzej


> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_14022_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@api_intel_bb@object-reloc-keep-cache:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-7/igt@api_intel_bb@object-reloc-keep-
>         cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/8411>)
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-7/igt@api_intel_bb@object-reloc-keep-
>         cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/8411>) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-5/igt@api_intel_bb@object-reloc-
>         keep-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8411>)
>   *
> 
>     igt@fbdev@eof:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-4/igt@fbdev@eof.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@fbdev@eof.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#2582 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582>)
>   *
> 
>     igt@fbdev@info:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@fbdev@info.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@fbdev@info.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#1849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1849> / i915#2582 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2582>)
>   *
> 
>     igt@gem_bad_reloc@negative-reloc-lut:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-
>         lut.html> (i915#14544 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14544> / i915#3281 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +1 other
>         test skip
>   *
> 
>     igt@gem_ccs@block-multicopy-compressed:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@gem_ccs@block-multicopy-
>         compressed.html> (i915#9323 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9323>)
>   *
> 
>     igt@gem_close_race@multigpu-basic-process:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-5/igt@gem_close_race@multigpu-basic-
>         process.html> (i915#7697 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/7697>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-14/igt@gem_close_race@multigpu-basic-
>         process.html> (i915#7697 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/7697>)
>   *
> 
>     igt@gem_ctx_persistence@hang:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-3/
>         igt@gem_ctx_persistence@hang.html> (i915#8555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-3/igt@gem_ctx_persistence@hang.html>
>         (i915#8555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8555>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-13/igt@gem_ctx_persistence@hang.html>
>         (i915#8555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8555>)
>       o shard-snb: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-snb5/igt@gem_ctx_persistence@hang.html>
>         (i915#1099 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1099>)
>   *
> 
>     igt@gem_ctx_sseu@invalid-sseu:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@gem_ctx_sseu@invalid-
>         sseu.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/280>)
>   *
> 
>     igt@gem_exec_balancer@bonded-dual:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-3/igt@gem_exec_balancer@bonded-
>         dual.html> (i915#4771 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4771>)
>   *
> 
>     igt@gem_exec_balancer@parallel-bb-first:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-5/igt@gem_exec_balancer@parallel-bb-
>         first.html> (i915#4525 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4525>) +1 other test skip
>   *
> 
>     igt@gem_exec_balancer@parallel-contexts:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@gem_exec_balancer@parallel-
>         contexts.html> (i915#4525 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4525>)
>   *
> 
>     igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-3/igt@gem_exec_balancer@parallel-
>         dmabuf-import-out-fence.html> (i915#4525 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>   *
> 
>     igt@gem_exec_balancer@sliced:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-4/igt@gem_exec_balancer@sliced.html>
>         (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4812>) +1 other test skip
>   *
> 
>     igt@gem_exec_capture@capture-invisible@lmem0:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-8/igt@gem_exec_capture@capture-
>         invisible@lmem0.html> (i915#6334 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>) +2 other
>         tests skip
>   *
> 
>     igt@gem_exec_fence@submit:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-17/igt@gem_exec_fence@submit.html>
>         (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4812>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-7/igt@gem_exec_fence@submit.html>
>         (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4812>)
>   *
> 
>     igt@gem_exec_flush@basic-uc-prw-default:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-5/igt@gem_exec_flush@basic-uc-prw-
>         default.html> (i915#3539 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3539>)
>   *
> 
>     igt@gem_exec_params@rsvd2-dirt:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-8/igt@gem_exec_params@rsvd2-dirt.html>
>         (i915#5107 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/5107>)
>   *
> 
>     igt@gem_exec_reloc@basic-write-read:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@gem_exec_reloc@basic-write-
>         read.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3281>) +4 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-write-read-noreloc:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-15/igt@gem_exec_reloc@basic-write-
>         read-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3281>) +3 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-4/igt@gem_exec_reloc@basic-write-
>         read-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3281>) +4 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-write-wc-noreloc:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-4/igt@gem_exec_reloc@basic-write-wc-
>         noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3281>) +9 other tests skip
>   *
> 
>     igt@gem_exec_schedule@reorder-wide:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-4/igt@gem_exec_schedule@reorder-
>         wide.html> (i915#4537 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4537> / i915#4812 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>   *
> 
>     igt@gem_fence_thrash@bo-copy:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-2/igt@gem_fence_thrash@bo-
>         copy.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4860>) +2 other tests skip
>   *
> 
>     igt@gem_fence_thrash@bo-write-verify-x:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-11/igt@gem_fence_thrash@bo-write-
>         verify-x.html> (i915#4860 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4860>) +3 other tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-12/igt@gem_fence_thrash@bo-write-
>         verify-x.html> (i915#4860 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4860>) +2 other tests skip
>   *
> 
>     igt@gem_lmem_evict@dontneed-evict-race:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-10/igt@gem_lmem_evict@dontneed-
>         evict-race.html> (i915#4613 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4613> / i915#7582 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>       o shard-glk: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-glk9/igt@gem_lmem_swapping@heavy-verify-
>         multi-ccs.html> (i915#4613 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-2/igt@gem_lmem_swapping@heavy-
>         verify-random-ccs.html> (i915#4613 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@gem_lmem_swapping@parallel-
>         random-verify-ccs.html> (i915#4613 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +1 other
>         test skip
>   *
> 
>     igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>       o shard-dg2: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg2-8/igt@gem_lmem_swapping@smem-
>         oom@lmem0.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-dg2-1/igt@gem_lmem_swapping@smem-
>         oom@lmem0.html> (i915#5493 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5493>) +1 other test timeout
>   *
> 
>     igt@gem_lmem_swapping@verify-random:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@gem_lmem_swapping@verify-
>         random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4613>) +1 other test skip
>   *
> 
>     igt@gem_mmap_gtt@basic-small-copy-odd:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-18/igt@gem_mmap_gtt@basic-small-copy-
>         odd.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4077>) +3 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@basic-write-read-distinct:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-6/igt@gem_mmap_gtt@basic-write-
>         read-distinct.html> (i915#4077 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/4077>) +2 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@cpuset-big-copy-odd:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy-
>         odd.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4077>) +14 other tests skip
>   *
> 
>     igt@gem_mmap_offset@clear-via-pagefault:
> 
>       o shard-mtlp: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-mtlp-2/igt@gem_mmap_offset@clear-via-
>         pagefault.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-mtlp-8/igt@gem_mmap_offset@clear-via-
>         pagefault.html> (i915#14809 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14809>) +1 other test abort
>   *
> 
>     igt@gem_mmap_wc@close:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-7/igt@gem_mmap_wc@close.html>
>         (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4083>) +8 other tests skip
>   *
> 
>     igt@gem_mmap_wc@write-gtt-read-wc:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-16/igt@gem_mmap_wc@write-gtt-read-
>         wc.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4083>) +3 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-3/igt@gem_mmap_wc@write-gtt-read-
>         wc.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4083>)
>   *
> 
>     igt@gem_partial_pwrite_pread@write-display:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-19/igt@gem_partial_pwrite_pread@write-
>         display.html> (i915#3282 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3282>) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-8/
>         igt@gem_partial_pwrite_pread@write-display.html> (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>   *
> 
>     igt@gem_pread@snoop:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-4/igt@gem_pread@snoop.html> (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +3 other tests skip
>   *
> 
>     igt@gem_pwrite@basic-exhaustion:
> 
>       o shard-tglu: NOTRUN -> WARN <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-4/igt@gem_pwrite@basic-
>         exhaustion.html> (i915#2658 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2658>)
>   *
> 
>     igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-1/igt@gem_pxp@dmabuf-shared-protected-
>         dst-is-context-refcounted.html> (i915#4270 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +1 other
>         test skip
>   *
> 
>     igt@gem_pxp@hw-rejects-pxp-context:
> 
>       o shard-rkl: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-
>         context.html> (i915#12917 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/12917> / i915#12964 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>) +1 other
>         test timeout
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-on:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-16/igt@gem_pxp@reject-modify-context-
>         protection-on.html> (i915#4270 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/4270>)
>   *
> 
>     igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@gem_pxp@verify-pxp-key-change-
>         after-suspend-resume.html> -> TIMEOUT <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-7/
>         igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html>
>         (i915#12917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12917> / i915#12964 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/12964>)
>   *
> 
>     igt@gem_readwrite@beyond-eob:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-4/igt@gem_readwrite@beyond-eob.html>
>         (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3282>) +3 other tests skip
>   *
> 
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-4/igt@gem_render_copy@y-tiled-
>         ccs-to-y-tiled-ccs.html> (i915#8428 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>   *
> 
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
> 
>       o shard-glk: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-glk9/igt@gem_render_copy@y-tiled-ccs-to-y-
>         tiled-mc-ccs.html> +328 other tests skip
>   *
> 
>     igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-5/igt@gem_render_copy@yf-tiled-ccs-to-
>         y-tiled.html> (i915#5190 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5190> / i915#8428 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>) +4 other
>         tests skip
>   *
> 
>     igt@gem_tiled_pread_pwrite:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-6/igt@gem_tiled_pread_pwrite.html>
>         (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4079>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-16/igt@gem_tiled_pread_pwrite.html>
>         (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4079>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-6/
>         igt@gem_tiled_pread_pwrite.html> (i915#4079 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>   *
> 
>     igt@gem_userptr_blits@create-destroy-unsync:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-5/igt@gem_userptr_blits@create-
>         destroy-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@dmabuf-sync:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@gem_userptr_blits@dmabuf-
>         sync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3297> / i915#3323 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323>)
>   *
> 
>     igt@gem_userptr_blits@unsync-overlap:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-6/igt@gem_userptr_blits@unsync-
>         overlap.html> (i915#3297 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3297>) +1 other test skip
>   *
> 
>     igt@gem_userptr_blits@unsync-unmap:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-5/igt@gem_userptr_blits@unsync-
>         unmap.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3297>)
>   *
> 
>     igt@gen9_exec_parse@bb-large:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@gen9_exec_parse@bb-
>         large.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/2527> / i915#2856 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>) +2 other
>         tests skip
>   *
> 
>     igt@gen9_exec_parse@bb-oversize:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@gen9_exec_parse@bb-
>         oversize.html> (i915#2527 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2527>) +1 other test skip
>   *
> 
>     igt@gen9_exec_parse@cmd-crossing-page:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-6/igt@gen9_exec_parse@cmd-
>         crossing-page.html> (i915#2527 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/2527> / i915#2856 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>) +2 other
>         tests skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-4/igt@gen9_exec_parse@cmd-
>         crossing-page.html> (i915#2856 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/2856>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-12/igt@gen9_exec_parse@cmd-crossing-
>         page.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/2527>)
>   *
> 
>     igt@gen9_exec_parse@shadow-peek:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-11/igt@gen9_exec_parse@shadow-
>         peek.html> (i915#2856 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/2856>) +3 other tests skip
>   *
> 
>     igt@i915_drm_fdinfo@all-busy-idle-check-all:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-6/igt@i915_drm_fdinfo@all-busy-idle-
>         check-all.html> (i915#14123 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14123>)
>   *
> 
>     igt@i915_drm_fdinfo@busy-check-all:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-13/igt@i915_drm_fdinfo@busy-check-
>         all.html> (i915#11527 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/11527>) +5 other tests skip
>   *
> 
>     igt@i915_drm_fdinfo@busy-check-all@ccs0:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-3/igt@i915_drm_fdinfo@busy-check-
>         all@ccs0.html> (i915#11527 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/11527>) +6 other tests skip
>   *
> 
>     igt@i915_drm_fdinfo@busy-check-all@vecs0:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-3/igt@i915_drm_fdinfo@busy-check-
>         all@vecs0.html> (i915#11527 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/11527>) +7 other tests skip
>   *
> 
>     igt@i915_drm_fdinfo@virtual-busy-idle-all:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-11/igt@i915_drm_fdinfo@virtual-busy-
>         idle-all.html> (i915#14118 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14118>)
>   *
> 
>     igt@i915_module_load@load:
> 
>       o shard-mtlp: (PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-mtlp-2/igt@i915_module_load@load.html>, PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17515/shard-
>         mtlp-2/igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-2/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-3/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-3/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-3/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-3/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-4/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-4/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-4/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-5/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-5/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-5/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-6/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-6/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-6/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-6/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-7/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-7/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-7/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-7/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-8/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-8/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-8/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/CI_DRM_17515/shard-mtlp-8/
>         igt@i915_module_load@load.html>) -> (PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-6/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-2/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-3/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-6/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-6/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-3/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-2/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-7/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-2/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-7/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-3/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-7/
>         igt@i915_module_load@load.html>, SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-5/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-3/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-7/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-4/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-5/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-8/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-4/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-5/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-8/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-8/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-4/
>         igt@i915_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-4/
>         igt@i915_module_load@load.html>) (i915#14785 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14785>)
>   *
> 
>     igt@i915_module_load@reload-no-display:
> 
>       o shard-dg2: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-dg2-4/
>         igt@i915_module_load@reload-no-display.html> (i915#13029
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13029> / i915#14545 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14545>)
>       o shard-rkl: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-rkl-7/
>         igt@i915_module_load@reload-no-display.html> (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +11 other tests dmesg-warn
>       o shard-snb: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-snb6/igt@i915_module_load@reload-
>         no-display.html> (i915#14545 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14545>)
>   *
> 
>     igt@i915_pm_freq_mult@media-freq@gt0:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@i915_pm_freq_mult@media-
>         freq@gt0.html> (i915#6590 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6590>) +1 other test skip
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-fence:
> 
>       o shard-tglu: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-
>         fence.html> -> WARN <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-
>         fence.html> (i915#13790 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/13790> / i915#2681 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681>) +1 other
>         test warn
>   *
> 
>     igt@i915_pm_rpm@gem-idle:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-2/igt@i915_pm_rpm@gem-idle.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-5/igt@i915_pm_rpm@gem-idle.html> (i915#13328 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328>)
>   *
> 
>     igt@i915_pm_rps@thresholds-idle-park:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-6/igt@i915_pm_rps@thresholds-idle-
>         park.html> (i915#11681 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/11681>) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-19/igt@i915_pm_rps@thresholds-idle-
>         park.html> (i915#11681 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/11681>)
>   *
> 
>     igt@i915_pm_sseu@full-enable:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-10/igt@i915_pm_sseu@full-
>         enable.html> (i915#4387 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4387>)
>   *
> 
>     igt@i915_query@test-query-geometry-subslices:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-8/igt@i915_query@test-query-
>         geometry-subslices.html> (i915#5723 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723>)
>   *
> 
>     igt@i915_selftest@live@workarounds:
> 
>       o shard-mtlp: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-mtlp-7/
>         igt@i915_selftest@live@workarounds.html> -> DMESG-FAIL <https://
>         intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-mtlp-8/
>         igt@i915_selftest@live@workarounds.html> (i915#12061 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>) +1 other
>         test dmesg-fail
>   *
> 
>     igt@i915_suspend@debugfs-reader:
> 
>       o shard-rkl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-rkl-4/igt@i915_suspend@debugfs-
>         reader.html> (i915#15131 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15131>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-5/igt@kms_addfb_basic@addfb25-x-
>         tiled-mismatch-legacy.html> (i915#4212 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-
>         mismatch-legacy.html> (i915#4212 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-13/igt@kms_addfb_basic@addfb25-x-
>         tiled-mismatch-legacy.html> (i915#4212 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-
>         tiled-small-legacy.html> (i915#5190 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>) +2 other
>         tests skip
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-
>         legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4215> / i915#5190 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
> 
>       o shard-glk: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-glk6/igt@kms_async_flips@async-flip-suspend-
>         resume@pipe-a-hdmi-a-1.html> -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-glk9/
>         igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-
>         a-1.html> (i915#12761 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/12761>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-
>     internal-panels:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-7/igt@kms_atomic_transition@plane-all-
>         modeset-transition-fencing-internal-panels.html> (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>       o shard-glk: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-glk6/igt@kms_atomic_transition@plane-all-
>         modeset-transition-internal-panels.html> (i915#1769 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>)
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-0:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-
>         rotate-0.html> (i915#4538 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4538> / i915#5286 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-
>         stride-32bpp-rotate-0-hflip.html> (i915#5286 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +2 other
>         tests skip
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-
>         stride-32bpp-rotate-0-hflip.html> (i915#5286 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +4 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-
>         stride-32bpp-rotate-180-async-flip.html> (i915#5286 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-
>         rotate-270.html> +15 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-7/igt@kms_big_fb@x-tiled-32bpp-
>         rotate-90.html> +3 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-
>         rotate-270.html> (i915#3638 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3638>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-
>         rotate-270.html> (i915#3638 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3638>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-3/igt@kms_big_fb@y-tiled-8bpp-
>         rotate-90.html> (i915#4538 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4538> / i915#5190 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>) +10 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-
>         stride-32bpp-rotate-0.html> (i915#4538 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>) +2 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-
>         stride-32bpp-rotate-180-async-flip.html> +27 other tests skip
>   *
> 
>     igt@kms_busy@basic:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-3/igt@kms_busy@basic.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_busy@basic.html> (i915#11190 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-
>         tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +142
>         other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-
>         mtl-rc-ccs@pipe-a-hdmi-a-1.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +47 other
>         tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-
>         mtl-rc-ccs@pipe-d-hdmi-a-1.html> (i915#10307 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> /
>         i915#10434 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/10434> / i915#6095 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6095>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-8/igt@kms_ccs@ccs-on-another-bo-
>         y-tiled-ccs@pipe-b-edp-1.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +29 other
>         tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-y-
>         tiled-ccs@pipe-d-hdmi-a-3.html> (i915#10307 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/6095>) +156 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-9/igt@kms_ccs@crc-primary-
>         basic-4-tiled-lnl-ccs.html> (i915#12313 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_ccs@crc-primary-basic-
>         y-tiled-ccs.html> (i915#6095 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/6095>) +39 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-3/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-dg2-rc-ccs-cc.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +69 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-3:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-y-
>         tiled-ccs@pipe-b-dp-3.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +20 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-glk1/igt@kms_ccs@crc-primary-
>         suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html> (i915#12796 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796> /
>         i915#14694 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14694>) +1 other test incomplete
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-bmg-ccs.html> (i915#12313 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-
>         mtl-rc-ccs@pipe-b-hdmi-a-2.html> (i915#14098 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/6095>) +58 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-
>         d-hdmi-a-3.html> (i915#13781 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/13781>) +3 other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-7/igt@kms_cdclk@plane-
>         scaling.html> (i915#3742 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3742>)
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-c-
>         hdmi-a-3.html> (i915#13783 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/13783>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@dp-crc-fast:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-5/igt@kms_chamelium_frames@dp-crc-
>         fast.html> (i915#11151 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/11151> / i915#7828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +11 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_frames@dp-crc-single:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-8/igt@kms_chamelium_frames@dp-
>         crc-single.html> (i915#11151 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/11151> / i915#7828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +7 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-storm:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-
>         storm.html> (i915#11151 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/11151> / i915#7828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +4 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-storm:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@kms_chamelium_hpd@hdmi-hpd-
>         storm.html> (i915#11151 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/11151> / i915#7828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +4 other
>         tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-16/igt@kms_chamelium_hpd@hdmi-hpd-
>         storm.html> (i915#11151 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/11151> / i915#7828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +3 other
>         tests skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd-
>         storm.html> (i915#11151 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/11151> / i915#7828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +1 other
>         test skip
>   *
> 
>     igt@kms_color@ctm-blue-to-red:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-6/igt@kms_color@ctm-blue-to-red.html>
>         (i915#12655 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12655> / i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>)
>   *
> 
>     igt@kms_color@deep-color:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-6/igt@kms_color@deep-color.html>
>         (i915#12655 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12655> / i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_color@gamma:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@kms_color@gamma.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_color@gamma.html> (i915#12655 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-7/
>         igt@kms_content_protection@atomic.html> (i915#7118 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> /
>         i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9424>)
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-3/
>         igt@kms_content_protection@atomic.html> (i915#6944 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944> /
>         i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/7116> / i915#7118 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/7118> / i915#9424 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/
>         igt@kms_content_protection@legacy.html> (i915#6944 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944> /
>         i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/7116> / i915#7118 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/7118> / i915#9424 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@lic-type-1:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-6/igt@kms_content_protection@lic-
>         type-1.html> (i915#6944 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6944> / i915#9424 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-6/igt@kms_cursor_crc@cursor-
>         offscreen-512x512.html> (i915#13049 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_cursor_crc@cursor-
>         offscreen-512x512.html> (i915#13049 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-19/igt@kms_cursor_crc@cursor-
>         offscreen-512x512.html> (i915#13049 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-8/igt@kms_cursor_crc@cursor-
>         offscreen-512x512.html> (i915#13049 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-7/igt@kms_cursor_crc@cursor-
>         onscreen-512x512.html> (i915#13049 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-max-size:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_cursor_crc@cursor-
>         onscreen-max-size.html> (i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +1 other
>         test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x512:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-7/igt@kms_cursor_crc@cursor-
>         random-512x512.html> (i915#13049 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>) +1 other
>         test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-random-max-size:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-2/igt@kms_cursor_crc@cursor-
>         random-max-size.html> (i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> /
>         i915#8814 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8814>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>       o shard-rkl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-4/igt@kms_cursor_crc@cursor-
>         sliding-256x85.html> (i915#13566 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>) +1 other
>         test fail
>       o shard-tglu-1: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_cursor_crc@cursor-
>         sliding-256x85.html> (i915#13566 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>) +3 other
>         tests fail
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-11/igt@kms_cursor_crc@cursor-
>         sliding-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3555>) +4 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-tglu-8/igt@kms_cursor_crc@cursor-
>         sliding-64x21@pipe-a-hdmi-a-1.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-tglu-4/
>         igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html>
>         (i915#13566 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13566>) +1 other test fail
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@kms_cursor_crc@cursor-
>         sliding-64x21@pipe-a-hdmi-a-2.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-5/
>         igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html>
>         (i915#13566 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13566>) +1 other test fail
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-
>         max-size.html> (i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555>) +1 other test skip
>   *
> 
>     igt@kms_cursor_edge_walk@128x128-top-edge:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@kms_cursor_edge_walk@128x128-top-
>         edge.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-6/igt@kms_cursor_edge_walk@128x128-top-
>         edge.html> (i915#14544 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14544>) +37 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-5/igt@kms_cursor_legacy@2x-
>         cursor-vs-flip-legacy.html> (i915#9809 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-
>         flipa-legacy.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544>) +22 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-
>         flipb-atomic.html> +9 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-
>         flipb-legacy.html> (i915#13046 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/13046> / i915#5354 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>) +5 other
>         tests skip
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-
>         legacy.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-
>         legacy.html> (i915#2346 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2346>) +1 other test fail
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-5/igt@kms_cursor_legacy@short-busy-
>         flip-before-cursor-toggle.html> (i915#4103 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>   *
> 
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-4/igt@kms_dirtyfb@drrs-dirtyfb-
>         ioctl.html> (i915#9833 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9833>)
>   *
> 
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-6/igt@kms_dirtyfb@psr-dirtyfb-
>         ioctl.html> (i915#9723 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9723>)
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-
>         panel-6bpc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555> / i915#3804 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-5/igt@kms_dither@fb-8bpc-vs-
>         panel-6bpc.html> (i915#1769 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/1769> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> /
>         i915#3804 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3804>)
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-5/igt@kms_dither@fb-8bpc-vs-
>         panel-6bpc@pipe-a-hdmi-a-1.html> (i915#3804 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-
>         panel-6bpc@pipe-a-hdmi-a-2.html> (i915#3804 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>   *
> 
>     igt@kms_dp_link_training@uhbr-mst:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-9/igt@kms_dp_link_training@uhbr-
>         mst.html> (i915#13748 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/13748>)
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-7/igt@kms_dsc@dsc-basic.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-fractional-bpp:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-2/igt@kms_dsc@dsc-fractional-
>         bpp.html> (i915#3840 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-11/igt@kms_dsc@dsc-with-bpc.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3840>) +1 other test skip
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-7/igt@kms_dsc@dsc-with-bpc-
>         formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555> / i915#3840 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-glk10: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-glk10/igt@kms_fbcon_fbt@fbc-
>         suspend.html> (i915#9878 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9878>)
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@kms_fbcon_fbt@fbc-suspend.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#9878 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9878>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-6/
>         igt@kms_feature_discovery@display-4x.html> (i915#1839 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-on-nop:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-
>         on-nop.html> (i915#9934 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9934>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-7/igt@kms_flip@2x-flip-vs-
>         expired-vblank-interruptible.html> (i915#3637 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637> /
>         i915#9934 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9934>) +2 other tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-modeset:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_flip@2x-flip-vs-
>         modeset.html> (i915#3637 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3637> / i915#9934 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) +3 other
>         tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@kms_flip@2x-flip-vs-panning-vs-
>         hang.html> (i915#9934 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9934>) +5 other tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>       o shard-snb: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-
>         interruptible.html> -> TIMEOUT <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-snb6/igt@kms_flip@2x-flip-vs-
>         suspend-interruptible.html> (i915#14033 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033> /
>         i915#14350 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14350>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
> 
>       o shard-snb: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-snb6/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-
>         hdmi-a1.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-snb6/igt@kms_flip@2x-flip-vs-suspend@ab-
>         vga1-hdmi-a1.html> (i915#14033 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14033>) +2 other tests timeout
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-16/igt@kms_flip@2x-plain-flip-fb-
>         recreate-interruptible.html> (i915#9934 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) +2 other
>         tests skip
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-7/igt@kms_flip@2x-plain-flip-fb-
>         recreate-interruptible.html> (i915#3637 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637> /
>         i915#9934 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9934>) +6 other tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-7/igt@kms_flip@2x-plain-flip-ts-
>         check.html> (i915#9934 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9934>) +9 other tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-6/igt@kms_flip@2x-plain-flip-ts-check-
>         interruptible.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#9934 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) +1 other
>         test skip
>   *
> 
>     igt@kms_flip@bo-too-big-interruptible:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-4/igt@kms_flip@bo-too-big-
>         interruptible.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-rkl-6/igt@kms_flip@bo-too-big-
>         interruptible.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#3637 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>) +4 other
>         tests skip
>   *
> 
>     igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop-
>         interruptible.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#3637 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-glk9/igt@kms_flip@flip-vs-
>         suspend-interruptible.html> (i915#12745 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745> /
>         i915#4839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4839>) +1 other test incomplete
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-2/igt@kms_flip@flip-vs-suspend-
>         interruptible.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-rkl-3/igt@kms_flip@flip-vs-
>         suspend-interruptible.html> (i915#6113 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
> 
>       o shard-rkl: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-rkl-3/igt@kms_flip@flip-vs-
>         suspend-interruptible@a-hdmi-a2.html> (i915#6113 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-glk6/igt@kms_flip@flip-vs-
>         suspend@a-hdmi-a1.html> (i915#12745 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>) +1 other
>         test incomplete
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>     downscaling:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-9/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>         downscaling.html> (i915#2672 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/2672> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +4 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-9/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>         downscaling@pipe-a-valid-mode.html> (i915#2587 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> /
>         i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2672>) +4 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-4/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>         upscaling.html> (i915#2672 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2672> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> /
>         i915#8813 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8813>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>     upscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-4/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>         upscaling@pipe-a-default-mode.html> (i915#2672 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672> /
>         i915#8813 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8813>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-
>         yftile-to-64bpp-yftile-upscaling.html> (i915#2672 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-
>     downscaling:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-
>         downscaling.html> (i915#2672 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/2672> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-
>         ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html>
>         (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2672>) +5 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-
>         ytile-to-64bpp-ytile-downscaling.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-
>         downscaling.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +6 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-
>         ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html>
>         (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2672>) +5 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-
>         upscaling.html> (i915#2587 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2587> / i915#2672 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-
>         upscaling@pipe-a-valid-mode.html> (i915#2587 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> /
>         i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2672>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-7/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-
>         downscaling.html> (i915#2672 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/2672> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +1 other
>         test skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-12/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-
>         downscaling.html> (i915#2672 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/2672> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +1 other
>         test skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-4/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-
>         downscaling.html> (i915#3555 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3555> / i915#8813 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-4/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-
>         downscaling@pipe-a-default-mode.html> (i915#8810 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810> /
>         i915#8813 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8813>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-12/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-
>         downscaling@pipe-a-valid-mode.html> (i915#2587 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> /
>         i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2672>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>     downscaling:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-
>         ytile-to-32bpp-ytilercccs-downscaling.html> (i915#2672 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555> / i915#5190 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5190>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
> 
>       o shard-dg2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-
>         primscrn-indfb-msflip-blt.html> (i915#6880 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-
>         primscrn-spr-indfb-draw-blt.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-
>         blt.html> (i915#14544 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14544> / i915#1849 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849> /
>         i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/5354>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-
>         primscrn-spr-indfb-draw-mmap-cpu.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#1849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1849> / i915#5354 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5354>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-
>         pri-indfb-multidraw.html> (i915#1825 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +21 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-16/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
>         fullscreen.html> +19 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-
>         rgb101010-draw-mmap-gtt.html> (i915#8708 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +13 other
>         tests skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-7/
>         igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html>
>         (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8708>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-glk5/
>         igt@kms_frontbuffer_tracking@fbc-suspend.html> (i915#10056
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-5/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-
>         pwrite.html> (i915#15102 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15102>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-
>     mmap-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-
>         mmap-gtt.html> (i915#15104 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15104>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
> 
>       o shard-snb: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-snb4/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-
>         mmap-wc.html> +137 other tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-15/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-
>         mmap-wc.html> (i915#15104 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15104>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html>
>         (i915#15102 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15102> / i915#3023 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3023>) +11 other tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-12/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html>
>         (i915#15102 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15102> / i915#3458 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3458>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-
>         move.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/10433> / i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102> /
>         i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3458>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-8/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-
>         render.html> (i915#5354 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5354>) +31 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-
>         pwrite.html> (i915#1825 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/1825>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-13/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-
>         mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8708>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-13/
>         igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-
>         pwrite.html> (i915#15102 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15102>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-
>         offscreen-pri-shrfb-draw-mmap-cpu.html> (i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-
>         mmap-gtt.html> (i915#15102 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15102>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-10/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-
>         pwrite.html> (i915#15102 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15102>) +19 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-
>         rgb101010-draw-render.html> (i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102> /
>         i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3458>) +23 other tests skip
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o shard-snb: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-snb1/igt@kms_hdmi_inject@inject-audio.html> -
>          > SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/
>         shard-snb4/igt@kms_hdmi_inject@inject-audio.html>
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-8/igt@kms_hdr@bpc-switch-
>         suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555> / i915#8228 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>) +1 other
>         test skip
>   *
> 
>     igt@kms_hdr@static-toggle-dpms:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-5/igt@kms_hdr@static-toggle-
>         dpms.html> (i915#12713 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/12713> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> /
>         i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8228>)
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@kms_hdr@static-toggle-dpms.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8228>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-12/igt@kms_hdr@static-toggle-
>         dpms.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3555> / i915#8228 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>   *
> 
>     igt@kms_invalid_mode@bad-vtotal:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@kms_invalid_mode@bad-vtotal.html> -
>          > SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/
>         shard-rkl-6/igt@kms_invalid_mode@bad-vtotal.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555> / i915#8826 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826>)
>   *
> 
>     igt@kms_joiner@basic-force-ultra-joiner:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-3/igt@kms_joiner@basic-force-ultra-
>         joiner.html> (i915#10656 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/10656>)
>   *
> 
>     igt@kms_joiner@basic-max-non-joiner:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_joiner@basic-max-non-
>         joiner.html> (i915#13688 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/13688>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-big-joiner:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-2/igt@kms_joiner@invalid-modeset-
>         big-joiner.html> (i915#10656 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/10656>)
>   *
> 
>     igt@kms_pipe_stress@stress-xrgb8888-yftiled:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-9/igt@kms_pipe_stress@stress-
>         xrgb8888-yftiled.html> (i915#14712 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-8/igt@kms_pipe_stress@stress-
>         xrgb8888-yftiled.html> (i915#14712 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712>)
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-5/igt@kms_pipe_stress@stress-xrgb8888-
>         yftiled.html> (i915#14712 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14712>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-14/igt@kms_pipe_stress@stress-
>         xrgb8888-yftiled.html> (i915#14712 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712>)
>   *
> 
>     igt@kms_plane@plane-position-covered:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@kms_plane@plane-position-
>         covered.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-6/igt@kms_plane@plane-position-
>         covered.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#8825 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825>) +2 other
>         tests skip
>   *
> 
>     igt@kms_plane_alpha_blend@alpha-7efc:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/
>         igt@kms_plane_alpha_blend@alpha-7efc.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_plane_alpha_blend@alpha-7efc.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#7294 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/7294>) +1 other test skip
>   *
> 
>     igt@kms_plane_alpha_blend@constant-alpha-max:
> 
>       o shard-glk: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-glk5/igt@kms_plane_alpha_blend@constant-
>         alpha-max.html> (i915#10647 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/10647> / i915#12169 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169>)
>   *
> 
>     igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
> 
>       o shard-glk: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-glk5/igt@kms_plane_alpha_blend@constant-
>         alpha-max@pipe-c-hdmi-a-1.html> (i915#10647 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>) +1 other
>         test fail
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-none:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-
>         none.html> (i915#13958 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/13958>) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-
>         none.html> (i915#13958 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/13958>)
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_plane_multiple@2x-
>         tiling-none.html> (i915#13958 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/13958>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-19/igt@kms_plane_multiple@2x-tiling-
>         none.html> (i915#13958 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/13958>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-8/igt@kms_plane_multiple@2x-
>         tiling-none.html> (i915#13958 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/13958>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-
>         size.html> (i915#6953 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/6953> / i915#9423 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-16/igt@kms_plane_scaling@intel-max-
>         src-size.html> (i915#6953 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6953>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-
>     format@pipe-a:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-4/igt@kms_plane_scaling@plane-
>         downscale-factor-0-5-with-pixel-format@pipe-a.html> (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +4 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-
>         unity-scaling-with-pixel-format.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-
>         format.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#8152 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-
>     format@pipe-a:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-
>         unity-scaling-with-pixel-format@pipe-a.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-
>         format@pipe-a.html> (i915#12247 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/12247> / i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>) +2 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-
>         factor-0-25-with-rotation@pipe-c.html> (i915#12247 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>) +3 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-5/igt@kms_plane_scaling@plane-
>         upscale-factor-0-25-with-rotation@pipe-d.html> (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +4 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-3/igt@kms_plane_scaling@planes-
>         upscale-20x20.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-rkl-6/igt@kms_plane_scaling@planes-
>         upscale-20x20.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#6953 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953> /
>         i915#8152 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8152>)
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-3/igt@kms_plane_scaling@planes-
>         upscale-20x20@pipe-b.html> -> SKIP <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html>
>         (i915#12247 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12247> / i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#8152 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>) +3 other
>         tests skip
>   *
> 
>     igt@kms_pm_backlight@fade-with-suspend:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-7/igt@kms_pm_backlight@fade-with-
>         suspend.html> (i915#9812 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9812>)
>   *
> 
>     igt@kms_pm_dc@dc5-retention-flops:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-6/igt@kms_pm_dc@dc5-retention-
>         flops.html> (i915#3828 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3828>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-11/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#14104 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14104>)
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#3361 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3361>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-12/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#3361 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3361>)
>       o shard-tglu: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#9295 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9295>)
>   *
> 
>     igt@kms_pm_lpsp@screens-disabled:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-5/igt@kms_pm_lpsp@screens-
>         disabled.html> (i915#8430 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8430>)
>   *
> 
>     igt@kms_pm_rpm@dpms-lpsp:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-1/igt@kms_pm_rpm@dpms-lpsp.html>
>         (i915#15073 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15073>) +1 other test skip
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-
>         lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-
>         lpsp.html> (i915#15073 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/15073>) +1 other test skip
>   *
> 
>     igt@kms_pm_rpm@dpms-non-lpsp:
> 
>       o shard-dg2: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg2-7/igt@kms_pm_rpm@dpms-non-lpsp.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/
>         shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html> (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-
>         stress.html> (i915#15073 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15073>)
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-
>         stress.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-
>         stress.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#15073 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-7/igt@kms_pm_rpm@modeset-non-
>         lpsp-stress.html> (i915#15073 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/15073>) +1 other test skip
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-
>         stress-no-wait.html> (i915#12916 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916>)
>   *
> 
>     igt@kms_prime@basic-crc-hybrid:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-6/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/6524> / i915#6805 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6805>)
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_prime@basic-crc-
>         hybrid.html> (i915#6524 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6524>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
> 
>       o shard-glk10: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-
>         plane-update-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
> 
>       o shard-glk: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-glk5/igt@kms_psr2_sf@fbc-psr2-overlay-
>         plane-update-continuous-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +5 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-update-sf:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-7/igt@kms_psr2_sf@pr-cursor-
>         plane-update-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +4 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-
>         plane-move-continuous-exceed-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +2 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-7/igt@kms_psr2_sf@psr2-overlay-plane-
>         update-continuous-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +8 other
>         tests skip
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-plane-
>         update-continuous-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +3 other
>         tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-plane-
>         update-continuous-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +2 other
>         tests skip
>       o shard-snb: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-snb6/igt@kms_psr2_sf@psr2-overlay-plane-
>         update-continuous-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +2 other
>         tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-1/igt@kms_psr2_su@page_flip-nv12.html>
>         (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9683>)
>   *
> 
>     igt@kms_psr@fbc-pr-basic:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-3/igt@kms_psr@fbc-pr-basic.html>
>         (i915#9688 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9688>) +8 other tests skip
>   *
> 
>     igt@kms_psr@fbc-pr-sprite-plane-onoff:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-16/igt@kms_psr@fbc-pr-sprite-plane-
>         onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/1072> / i915#9732 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +7 other
>         tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-basic:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-11/igt@kms_psr@fbc-psr-basic.html>
>         (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9732>) +21 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-cursor-mmap-cpu:
> 
>       o shard-glk10: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-glk10/igt@kms_psr@fbc-psr-cursor-mmap-
>         cpu.html> +16 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-cursor-plane-onoff:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-3/igt@kms_psr@fbc-psr-cursor-
>         plane-onoff.html> (i915#9732 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/9732>) +19 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-plane-move:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-6/igt@kms_psr@fbc-psr-sprite-plane-
>         move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/1072> / i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9732>) +1 other test skip
>   *
> 
>     igt@kms_psr@psr-cursor-plane-move:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-4/igt@kms_psr@psr-cursor-plane-
>         move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/1072> / i915#9732 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +11 other
>         tests skip
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_psr@psr-cursor-plane-
>         move.html> (i915#9732 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9732>) +9 other tests skip
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-6/igt@kms_psr_stress_test@flip-
>         primary-invalidate-overlay.html> (i915#9685 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/
>         igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9685>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@kms_rotation_crc@primary-4-
>         tiled-reflect-x-180.html> (i915#5289 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-3/igt@kms_rotation_crc@primary-
>         rotation-270.html> (i915#12755 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/12755>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-7/igt@kms_rotation_crc@primary-y-
>         tiled-reflect-x-270.html> (i915#12755 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755> /
>         i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/5190>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-8/igt@kms_rotation_crc@primary-y-
>         tiled-reflect-x-270.html> (i915#12755 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-10/igt@kms_rotation_crc@primary-
>         yf-tiled-reflect-x-0.html> (i915#5289 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-7/igt@kms_scaling_modes@scaling-
>         mode-full-aspect.html> (i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +8 other
>         tests skip
>   *
> 
>     igt@kms_selftest@drm_framebuffer:
> 
>       o shard-glk: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-glk5/
>         igt@kms_selftest@drm_framebuffer.html> (i915#13179 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179>) +1 other
>         test abort
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-16/igt@kms_setmode@invalid-clone-
>         single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3555>) +4 other tests skip
>   *
> 
>     igt@kms_sharpness_filter@filter-basic:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-5/igt@kms_sharpness_filter@filter-
>         basic.html> (i915#15232 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15232>)
>   *
> 
>     igt@kms_sharpness_filter@filter-toggle:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-3/
>         igt@kms_sharpness_filter@filter-toggle.html> (i915#15232
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232>)
>         +1 other test skip
>   *
> 
>     igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-1/igt@kms_sharpness_filter@invalid-
>         filter-with-scaling-mode.html> (i915#15232 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232>) +1 other
>         test skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-15/igt@kms_sharpness_filter@invalid-
>         filter-with-scaling-mode.html> (i915#15232 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232>)
>   *
> 
>     igt@kms_vrr@flipline:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-6/igt@kms_vrr@flipline.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555> / i915#8808 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8808>)
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-6/igt@kms_vrr@flipline.html>
>         (i915#15243 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15243> / i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_vrr@max-min:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-6/igt@kms_vrr@max-min.html>
>         (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9906>) +1 other test skip
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-vrr:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-
>         vrr.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9906>) +1 other test skip
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-glk: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-glk5/igt@kms_writeback@writeback-check-
>         output.html> (i915#2437 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2437>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-3/igt@kms_writeback@writeback-fb-
>         id-xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/2437> / i915#9412 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>   *
> 
>     igt@panthor/panthor_gem@bo_create:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@panthor/
>         panthor_gem@bo_create.html> (i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@panthor/panthor_vm@vm_create_destroy:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-9/igt@panthor/
>         panthor_vm@vm_create_destroy.html> (i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +1 other
>         test skip
>   *
> 
>     igt@panthor/panthor_vm@vm_unbind:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-3/igt@panthor/
>         panthor_vm@vm_unbind.html> (i915#15241 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15241>)
>   *
> 
>     igt@perf@mi-rpc:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-8/igt@perf@mi-rpc.html> (i915#2434
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434>)
>   *
> 
>     igt@perf@per-context-mode-unprivileged:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@perf@per-context-mode-
>         unprivileged.html> (i915#2435 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/2435>)
>   *
> 
>     igt@perf@polling@0-rcs0:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@perf@polling@0-rcs0.html> -> DMESG-
>         WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/
>         shard-rkl-4/igt@perf@polling@0-rcs0.html> (i915#12964 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>) +36
>         other tests dmesg-warn
>   *
> 
>     igt@perf_pmu@busy-double-start@vecs1:
> 
>       o shard-dg2: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg2-6/igt@perf_pmu@busy-double-
>         start@vecs1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-1/igt@perf_pmu@busy-double-
>         start@vecs1.html> (i915#4349 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/4349>) +4 other tests fail
>   *
> 
>     igt@perf_pmu@event-wait:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-7/igt@perf_pmu@event-wait.html>
>         (i915#8807 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8807>)
>   *
> 
>     igt@perf_pmu@event-wait@rcs0:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-mtlp-7/igt@perf_pmu@event-
>         wait@rcs0.html> (i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555> / i915#8807 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807>)
>   *
> 
>     igt@perf_pmu@module-unload:
> 
>       o shard-tglu-1: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-1/igt@perf_pmu@module-
>         unload.html> (i915#14433 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14433>)
>   *
> 
>     igt@perf_pmu@most-busy-check-all@bcs0:
> 
>       o shard-dg1: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg1-12/igt@perf_pmu@most-busy-check-
>         all@bcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-18/igt@perf_pmu@most-busy-check-
>         all@bcs0.html> (i915#11943 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/11943>) +1 other test fail
>   *
> 
>     igt@prime_vgem@basic-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-6/igt@prime_vgem@basic-gtt.html>
>         (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4077>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg1-16/igt@prime_vgem@basic-gtt.html>
>         (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4077>)
>   *
> 
>     igt@prime_vgem@fence-write-hang:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-6/igt@prime_vgem@fence-write-
>         hang.html> +49 other tests skip
>   *
> 
>     igt@sriov_basic@enable-vfs-autoprobe-on:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-8/igt@sriov_basic@enable-vfs-
>         autoprobe-on.html> (i915#9917 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/9917>)
>   *
> 
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>       o shard-tglu: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-tglu-10/igt@sriov_basic@enable-vfs-
>         bind-unbind-each-numvfs-all.html> (i915#12910 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@fbdev@nullptr:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@fbdev@nullptr.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#2582 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2582>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-5/
>         igt@fbdev@nullptr.html>
>   *
> 
>     igt@gem_ccs@suspend-resume:
> 
>       o shard-dg2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg2-4/igt@gem_ccs@suspend-resume.html>
>         (i915#13356 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13356>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-11/igt@gem_ccs@suspend-resume.html> +2
>         other tests pass
>   *
> 
>     igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
> 
>       o shard-dg2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-
>         compressed-compfmt0-lmem0-lmem0.html> (i915#12392 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392> /
>         i915#13356 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13356>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-11/igt@gem_ccs@suspend-resume@linear-
>         compressed-compfmt0-lmem0-lmem0.html>
>   *
> 
>     igt@gem_eio@in-flight-suspend:
> 
>       o shard-rkl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@gem_eio@in-flight-suspend.html>
>         (i915#12964 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12964>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-5/igt@gem_eio@in-flight-suspend.html>
>         +30 other tests pass
>   *
> 
>     igt@gem_eio@kms:
> 
>       o shard-rkl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@gem_eio@kms.html> (i915#13363
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363>)
>         -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/
>         shard-rkl-7/igt@gem_eio@kms.html>
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o shard-mtlp: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-mtlp-8/igt@gem_eio@unwedge-stress.html>
>         (i915#15178 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15178>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-mtlp-8/igt@gem_eio@unwedge-stress.html>
>   *
> 
>     igt@gem_pxp@fail-invalid-protected-context:
> 
>       o shard-rkl: TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-3/igt@gem_pxp@fail-invalid-protected-
>         context.html> (i915#12964 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/12964>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-8/igt@gem_pxp@fail-
>         invalid-protected-context.html>
>   *
> 
>     igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>       o shard-rkl: TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@gem_pxp@verify-pxp-execution-after-
>         suspend-resume.html> (i915#12917 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917> /
>         i915#12964 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12964>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@gem_pxp@verify-pxp-execution-
>         after-suspend-resume.html>
>   *
> 
>     igt@i915_selftest@live@workarounds:
> 
>       o shard-dg2: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg2-6/
>         igt@i915_selftest@live@workarounds.html> (i915#12061 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         dg2-6/igt@i915_selftest@live@workarounds.html> +1 other test pass
>   *
> 
>     igt@i915_suspend@forcewake:
> 
>       o shard-rkl: ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-4/igt@i915_suspend@forcewake.html>
>         (i915#15140 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15140>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-2/igt@i915_suspend@forcewake.html>
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume:
> 
>       o shard-rkl: ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-4/igt@kms_async_flips@async-flip-suspend-
>         resume.html> (i915#15132 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15132>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-5/
>         igt@kms_async_flips@async-flip-suspend-resume.html>
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>       o shard-dg2: FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg2-8/igt@kms_atomic_transition@plane-all-
>         modeset-transition-fencing.html> (i915#5956 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition-
>         fencing.html>
>   *
> 
>     igt@kms_color@degamma:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_color@degamma.html> (i915#12655
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12655> / i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-5/
>         igt@kms_color@degamma.html> +1 other test pass
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-256x256:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_cursor_crc@cursor-
>         onscreen-256x256.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x256.html> +40 other
>         tests pass
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>       o shard-rkl: FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@kms_cursor_crc@cursor-
>         sliding-128x42.html> (i915#13566 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42.html> +6 other
>         tests pass
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-tglu-9/igt@kms_cursor_crc@cursor-
>         sliding-128x42@pipe-a-hdmi-a-1.html> (i915#13566 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-
>         a-1.html> +5 other tests pass
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>       o shard-dg2: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg2-4/igt@kms_dither@fb-8bpc-vs-
>         panel-8bpc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-dg2-11/
>         igt@kms_dither@fb-8bpc-vs-panel-8bpc.html>
>   *
> 
>     igt@kms_dp_link_training@non-uhbr-sst:
> 
>       o shard-dg2: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg2-5/igt@kms_dp_link_training@non-uhbr-
>         sst.html> (i915#13749 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/13749>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-dg2-11/
>         igt@kms_dp_link_training@non-uhbr-sst.html>
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#3637 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html> +4
>         other tests pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-
>         linear-to-16bpp-linear-downscaling.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-
>         linear-to-16bpp-linear-downscaling.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-
>         primscrn-cur-indfb-draw-pwrite.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#1849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1849> / i915#5354 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5354>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-2/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-
>         pwrite.html> +7 other tests pass
>   *
> 
>     igt@kms_invalid_mode@overflow-vrefresh:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_invalid_mode@overflow-
>         vrefresh.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#8826 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-4/igt@kms_invalid_mode@overflow-vrefresh.html>
>   *
> 
>     igt@kms_invalid_mode@zero-clock:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_invalid_mode@zero-clock.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555> / i915#8826 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-7/igt@kms_invalid_mode@zero-clock.html> +1 other test pass
>   *
> 
>     igt@kms_plane@plane-position-hole:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_plane@plane-position-hole.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#8825 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8825>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-2/
>         igt@kms_plane@plane-position-hole.html>
>   *
> 
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-
>         factor-0-25-with-pixel-format.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#8152 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8152>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-
>         factor-0-25-with-pixel-format.html>
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-
>         factor-0-5-unity-scaling.html> (i915#12247 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#8152 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8152>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-8/
>         igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-
>         scaling.html> +5 other tests pass
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-
>         factor-0-5-unity-scaling@pipe-a.html> (i915#12247 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@kms_plane_scaling@planes-
>         downscale-factor-0-5-unity-scaling@pipe-a.html> +3 other tests pass
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-
>         factor-0-75-upscale-factor-0-25.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#6953 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/6953> / i915#8152 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8152>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-3/
>         igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-
>         factor-0-25.html>
>   *
> 
>     igt@kms_pm_dc@dc5-dpms-negative:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_pm_dc@dc5-dpms-negative.html>
>         (i915#13441 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13441> / i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-5/
>         igt@kms_pm_dc@dc5-dpms-negative.html>
>   *
> 
>     igt@kms_pm_rpm@cursor-dpms:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_pm_rpm@cursor-dpms.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#1849 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/1849>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-3/
>         igt@kms_pm_rpm@cursor-dpms.html>
>   *
> 
>     igt@kms_pm_rpm@i2c:
> 
>       o shard-dg1: DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg1-17/igt@kms_pm_rpm@i2c.html> (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/
>         shard-dg1-16/igt@kms_pm_rpm@i2c.html>
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-dg2: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-
>         stress.html> (i915#15073 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15073>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-dg2-3/
>         igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>   *
> 
>     igt@prime_busy@hang:
> 
>       o shard-rkl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-3/igt@prime_busy@hang.html> (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12917> / i915#12964 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/12964>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-8/
>         igt@prime_busy@hang.html> +1 other test pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@device_reset@cold-reset-bound:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@device_reset@cold-reset-bound.html>
>         (i915#11078 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/11078>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-6/igt@device_reset@cold-reset-
>         bound.html> (i915#11078 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/11078> / i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>   *
> 
>     igt@gem_ccs@block-copy-compressed:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555> / i915#9323 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-5/igt@gem_ccs@block-copy-compressed.html> (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> /
>         i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9323>) +1 other test skip
>   *
> 
>     igt@gem_close_race@multigpu-basic-process:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-2/igt@gem_close_race@multigpu-basic-
>         process.html> (i915#7697 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/7697>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@gem_close_race@multigpu-basic-process.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#7697 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/7697>)
>   *
> 
>     igt@gem_close_race@multigpu-basic-threads:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@gem_close_race@multigpu-basic-
>         threads.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#7697 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-2/igt@gem_close_race@multigpu-basic-threads.html> (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>   *
> 
>     igt@gem_create@create-ext-cpu-access-big:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@gem_create@create-ext-cpu-access-
>         big.html> (i915#14544 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14544> / i915#6335 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-7/igt@gem_create@create-ext-cpu-access-big.html> (i915#6335
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>   *
> 
>     igt@gem_create@create-ext-set-pat:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@gem_create@create-ext-set-pat.html>
>         (i915#8562 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8562>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-6/igt@gem_create@create-ext-set-pat.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#8562 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8562>)
>   *
> 
>     igt@gem_exec_balancer@parallel-balancer:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-4/igt@gem_exec_balancer@parallel-
>         balancer.html> (i915#4525 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4525>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@gem_exec_balancer@parallel-balancer.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#4525 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4525>) +1 other test skip
>   *
> 
>     igt@gem_exec_balancer@parallel-contexts:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@gem_exec_balancer@parallel-
>         contexts.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#4525 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-5/igt@gem_exec_balancer@parallel-contexts.html> (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>   *
> 
>     igt@gem_exec_capture@capture-invisible@smem0:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-3/igt@gem_exec_capture@capture-
>         invisible@smem0.html> (i915#6334 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#6334 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6334>) +1 other test skip
>   *
> 
>     igt@gem_exec_reloc@basic-cpu-gtt:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3281 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3281>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-4/
>         igt@gem_exec_reloc@basic-cpu-gtt.html> (i915#3281 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +8 other
>         tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-
>         noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3281>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@gem_exec_reloc@basic-gtt-wc-noreloc.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3281 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3281>) +11 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-
>         random-ccs.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#4613 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@random:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@gem_lmem_swapping@random.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4613>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-6/igt@gem_lmem_swapping@random.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#4613 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4613>) +1 other test skip
>   *
> 
>     igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>       o shard-dg1: TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg1-18/igt@gem_lmem_swapping@smem-
>         oom@lmem0.html> (i915#5493 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5493>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-dg1-17/
>         igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#5493 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>) +1 other
>         test dmesg-warn
>   *
> 
>     igt@gem_partial_pwrite_pread@reads:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/
>         igt@gem_partial_pwrite_pread@reads.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3282>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-7/igt@gem_partial_pwrite_pread@reads.html>
>         (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3282>) +3 other tests skip
>   *
> 
>     igt@gem_pwrite@basic-random:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@gem_pwrite@basic-random.html>
>         (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3282>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-6/igt@gem_pwrite@basic-random.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3282 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3282>) +1 other test skip
>   *
> 
>     igt@gem_pxp@create-protected-buffer:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@gem_pxp@create-protected-
>         buffer.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#4270 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) ->
>         TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/
>         shard-rkl-5/igt@gem_pxp@create-protected-buffer.html>
>         (i915#12964 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12964>)
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-off-3:
> 
>       o shard-rkl: TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@gem_pxp@reject-modify-context-
>         protection-off-3.html> (i915#12917 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917> /
>         i915#12964 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12964>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-2/igt@gem_pxp@reject-modify-context-
>         protection-off-3.html> (i915#4270 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +1 other
>         test skip
>   *
> 
>     igt@gem_pxp@verify-pxp-stale-buf-execution:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-buf-
>         execution.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#4270 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) ->
>         TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/
>         shard-rkl-5/igt@gem_pxp@verify-pxp-stale-buf-execution.html>
>         (i915#12917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12917> / i915#12964 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/12964>)
>   *
> 
>     igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-2/igt@gem_set_tiling_vs_blt@untiled-to-
>         tiled.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/8411>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@gem_set_tiling_vs_blt@untiled-to-tiled.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#8411 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8411>)
>   *
> 
>     igt@gem_userptr_blits@access-control:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@gem_userptr_blits@access-
>         control.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#3297 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-8/igt@gem_userptr_blits@access-control.html> (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@dmabuf-sync:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3297 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3297> / i915#3323 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-4/igt@gem_userptr_blits@dmabuf-sync.html> (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297> /
>         i915#3323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3323>)
>   *
> 
>     igt@gem_userptr_blits@forbidden-operations:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@gem_userptr_blits@forbidden-
>         operations.html> (i915#3282 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3282> / i915#3297 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@gem_userptr_blits@forbidden-operations.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3282 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3282> / i915#3297 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@relocations:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@gem_userptr_blits@relocations.html>
>         (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3281> / i915#3297 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3297>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@gem_userptr_blits@relocations.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3281> / i915#3297 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gen9_exec_parse@batch-without-end:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@gen9_exec_parse@batch-without-
>         end.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/2527>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-rkl-6/igt@gen9_exec_parse@batch-
>         without-end.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#2527 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +1 other
>         test skip
>   *
> 
>     igt@gen9_exec_parse@shadow-peek:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#2527 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2527>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-5/
>         igt@gen9_exec_parse@shadow-peek.html> (i915#2527 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +3 other
>         tests skip
>   *
> 
>     igt@i915_pm_sseu@full-enable:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@i915_pm_sseu@full-enable.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#4387 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4387>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-7/
>         igt@i915_pm_sseu@full-enable.html> (i915#4387 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>   *
> 
>     igt@intel_hwmon@hwmon-read:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@intel_hwmon@hwmon-read.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#7707 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/7707>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-7/
>         igt@intel_hwmon@hwmon-read.html> (i915#7707 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-
>     internal-panels:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-3/igt@kms_atomic_transition@plane-all-
>         modeset-transition-fencing-internal-panels.html> (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-6/igt@kms_atomic_transition@plane-all-
>         modeset-transition-fencing-internal-panels.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_atomic_transition@plane-all-
>         modeset-transition-internal-panels.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-
>         internal-panels.html> (i915#1769 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-
>         stride-32bpp-rotate-0-hflip-async-flip.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/
>         shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-
>         hflip-async-flip.html> (i915#5286 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +3 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-
>         stride-32bpp-rotate-180-hflip.html> (i915#5286 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-
>         hflip.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-
>         rotate-90.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-8/igt@kms_big_fb@y-
>         tiled-8bpp-rotate-90.html> (i915#3638 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +1 other
>         test skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>       o shard-dg1: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg1-18/igt@kms_big_fb@yf-tiled-64bpp-
>         rotate-180.html> (i915#4538 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4538>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-dg1-12/
>         igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html> (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423> /
>         i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4538>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb-size-
>         overflow.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-8/
>         igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> +12 other
>         tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@kms_ccs@bad-pixel-format-4-tiled-
>         mtl-rc-ccs-cc.html> (i915#14098 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14098> / i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) +6 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-
>         lnl-ccs.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-8/igt@kms_ccs@crc-
>         primary-basic-4-tiled-lnl-ccs.html> (i915#12313 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-y-
>         tiled-ccs@pipe-b-hdmi-a-2.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-
>         hdmi-a-2.html> (i915#14098 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14098> / i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +1 other
>         test skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-
>         tiled-lnl-ccs.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-2/igt@kms_ccs@crc-
>         primary-suspend-4-tiled-lnl-ccs.html> (i915#12805 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805>)
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-
>         tiled-lnl-ccs.html> (i915#12313 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/12313>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/igt@kms_ccs@crc-
>         sprite-planes-basic-4-tiled-lnl-ccs.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>) +1 other
>         test skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-
>         tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html> (i915#14098 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/6095>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-
>         tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-
>         mtl-mc-ccs.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-5/
>         igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html> (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14098> / i915#6095 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6095>) +11 other tests skip
>   *
> 
>     igt@kms_chamelium_color@gamma:
> 
>       o shard-dg1: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg1-14/igt@kms_chamelium_color@gamma.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/
>         shard-dg1-19/igt@kms_chamelium_color@gamma.html> (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-storm:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-
>         storm.html> (i915#11151 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/11151> / i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/7828>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         (i915#11151 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/11151> / i915#7828 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/7828>) +4 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-for-each-
>         pipe.html> (i915#11151 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/11151> / i915#7828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html>
>         (i915#11151 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/11151> / i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#7828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +5 other
>         tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-1:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-
>         type-1.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-2/
>         igt@kms_content_protection@dp-mst-lic-type-1.html> (i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-3/igt@kms_content_protection@dp-mst-
>         type-1.html> (i915#3116 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3116>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_content_protection@dp-mst-type-1.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>   *
> 
>     igt@kms_content_protection@lic-type-1:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_content_protection@lic-
>         type-1.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-2/
>         igt@kms_content_protection@lic-type-1.html> (i915#9424 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@mei-interface:
> 
>       o shard-dg1: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg1-19/igt@kms_content_protection@mei-
>         interface.html> (i915#9424 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9424>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-dg1-12/
>         igt@kms_content_protection@mei-interface.html> (i915#9433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433>)
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_content_protection@srm.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-7/igt@kms_content_protection@srm.html>
>         (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/7118>)
>   *
> 
>     igt@kms_content_protection@type1:
> 
>       o shard-dg2: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg2-11/igt@kms_content_protection@type1.html>
>         (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/7118> / i915#7162 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/7162> / i915#9424 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         dg2-5/igt@kms_content_protection@type1.html> (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> /
>         i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9424>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@kms_content_protection@uevent.html>
>         (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/7118> / i915#9424 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9424>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_content_protection@uevent.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-
>         movement-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3555>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_cursor_crc@cursor-rapid-movement-32x10.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +3 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-
>         movement-512x170.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (i915#13049 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13049>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@kms_cursor_crc@cursor-
>         sliding-512x170.html> (i915#13049 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-
>         before-cursor-varying-size.html> (i915#4103 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-
>         varying-size.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-
>         varying-size.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-rkl-6/igt@kms_cursor_legacy@cursora-
>         vs-flipb-varying-size.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>) +12
>         other tests skip
>   *
> 
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-7/igt@kms_dirtyfb@psr-dirtyfb-
>         ioctl.html> (i915#9723 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9723>)
>   *
> 
>     igt@kms_dp_aux_dev:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@kms_dp_aux_dev.html> (i915#1257
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/
>         shard-rkl-6/igt@kms_dp_aux_dev.html> (i915#1257 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>)
>   *
> 
>     igt@kms_dp_link_training@non-uhbr-mst:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-
>         mst.html> (i915#13749 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/13749>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_dp_link_training@non-uhbr-mst.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>   *
> 
>     igt@kms_dp_link_training@non-uhbr-sst:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-
>         sst.html> (i915#14544 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14544>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-rkl-8/
>         igt@kms_dp_link_training@non-uhbr-sst.html> (i915#13749
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749>)
>   *
> 
>     igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-
>         fallback.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-5/
>         igt@kms_dp_linktrain_fallback@dsc-fallback.html> (i915#13707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>)
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_dsc@dsc-basic.html> (i915#11190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/11190> / i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-4/igt@kms_dsc@dsc-
>         basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3555> / i915#3840 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-with-formats:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-8/igt@kms_dsc@dsc-with-formats.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3955 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3955>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-4/
>         igt@kms_fbcon_fbt@psr-suspend.html> (i915#3955 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-4/
>         igt@kms_feature_discovery@chamelium.html> (i915#4854 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_feature_discovery@chamelium.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#4854 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4854>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#9337 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9337>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-2/
>         igt@kms_feature_discovery@dp-mst.html> (i915#9337 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-3/igt@kms_flip@2x-flip-vs-dpms.html>
>         (i915#9934 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9934>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#9934 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9934>) +3 other tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>       o shard-dg1: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg1-15/igt@kms_flip@2x-flip-vs-expired-
>         vblank.html> (i915#9934 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9934>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-dg1-19/igt@kms_flip@2x-
>         flip-vs-expired-vblank.html> (i915#4423 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423> /
>         i915#9934 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9934>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>       o shard-glk: INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-
>         interruptible.html> (i915#12745 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/12745> / i915#4839 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>) ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-
>         interruptible.html> (i915#12314 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/12314> / i915#12745 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745> /
>         i915#4839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4839>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-
>         interruptible@ab-hdmi-a1-hdmi-a2.html> (i915#4839 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>) ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-
>         interruptible@ab-hdmi-a1-hdmi-a2.html> (i915#12314 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314> /
>         i915#4839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4839>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-interruptible:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_flip@2x-plain-flip-
>         interruptible.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#9934 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-7/igt@kms_flip@2x-plain-flip-interruptible.html> (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +7 other tests skip
>   *
> 
>     igt@kms_flip@plain-flip-ts-check:
> 
>       o shard-rkl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-2/igt@kms_flip@plain-flip-ts-check.html>
>         (i915#12964 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12964>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-6/igt@kms_flip@plain-flip-ts-
>         check.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#3637 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
>     downscaling:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/
>         igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
>         downscaling.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-
>         to-32bpp-4tiledg2rcccs-downscaling.html> (i915#2672 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555>) +3 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/
>         igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>         upscaling.html> (i915#2672 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2672> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>         upscaling.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +1 other
>         test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-
>         indfb-fliptrack-mmap-gtt.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#1849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1849> / i915#5354 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5354>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-7/
>         igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-pri-indfb-draw-mmap-wc.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#1849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1849> / i915#5354 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5354>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-8/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (i915#1825 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/1825>) +25 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-pri-shrfb-draw-mmap-gtt.html> (i915#1825 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-
>         draw-mmap-gtt.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#1849 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849> /
>         i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/5354>) +29 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-
>         scaledprimary.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#1849 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849> /
>         i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/5354>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14022/shard-rkl-5/
>         igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html>
>         (i915#12964 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12964>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-
>         tiling-4.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#1849 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849> /
>         i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/5354>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-
>         tiling-4.html> (i915#5439 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5439>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-
>         primscrn-cur-indfb-draw-pwrite.html> (i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102> /
>         i915#3023 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3023>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-
>         primscrn-cur-indfb-draw-pwrite.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#1849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1849> / i915#5354 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5354>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-
>         rgb565-draw-mmap-gtt.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#1849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1849> / i915#5354 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5354>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-8/
>         igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html>
>         (i915#15102 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15102> / i915#3023 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3023>) +12 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-
>         offscreen-pri-indfb-draw-blt.html> (i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-
>         draw-blt.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-
>         offscreen-pri-shrfb-draw-pwrite.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-
>         draw-pwrite.html> (i915#15102 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/15102>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-slowdraw:
> 
>       o shard-dg2: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-
>         slowdraw.html> (i915#15102 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15102> / i915#3458 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         dg2-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html>
>         (i915#10433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/10433> / i915#15102 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15102> / i915#3458 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-dg2: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html>
>         (i915#13331 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13331>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-dg2-7/igt@kms_hdr@brightness-with-
>         hdr.html> (i915#12713 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/12713>)
>   *
> 
>     igt@kms_hdr@static-toggle-suspend:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8228>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_hdr@static-toggle-suspend.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>) +1 other
>         test skip
>   *
> 
>     igt@kms_joiner@invalid-modeset-big-joiner:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-
>         joiner.html> (i915#10656 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/10656> / i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-2/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         (i915#10656 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/10656>)
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-
>         pipe-crc-check.html> (i915#4070 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/4070> / i915#4816 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (i915#4816 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4816>)
>   *
> 
>     igt@kms_plane_lowres@tiling-yf:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-2/igt@kms_plane_lowres@tiling-yf.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555>) +2 other tests skip
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-x:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-
>         x.html> (i915#13958 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/13958>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-rkl-6/igt@kms_plane_multiple@2x-
>         tiling-x.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>)
>   *
> 
>     igt@kms_plane_multiple@tiling-yf:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-4/igt@kms_plane_multiple@tiling-
>         yf.html> (i915#14259 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14259>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-2/igt@kms_plane_scaling@intel-max-src-
>         size.html> (i915#6953 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/6953>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_plane_scaling@intel-max-src-size.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#6953 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6953> / i915#8152 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-
>         factor-0-5-with-rotation@pipe-a.html> (i915#12247 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-
>         rotation@pipe-a.html> (i915#12247 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-
>         factor-0-5-with-rotation@pipe-b.html> (i915#12247 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-
>         rotation@pipe-b.html> (i915#12247 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#8152 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8152>) +1 other test skip
>   *
> 
>     igt@kms_pm_dc@dc5-retention-flops:
> 
>       o shard-dg1: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-dg1-17/igt@kms_pm_dc@dc5-retention-
>         flops.html> (i915#3828 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3828>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_14022/shard-dg1-19/igt@kms_pm_dc@dc5-
>         retention-flops.html> (i915#3828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828> /
>         i915#4423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4423>)
>   *
> 
>     igt@kms_pm_dc@dc9-dpms:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@kms_pm_dc@dc9-dpms.html> (i915#3361
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/
>         shard-rkl-2/igt@kms_pm_dc@dc9-dpms.html> (i915#4281 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281>)
>   *
> 
>     igt@kms_pm_rpm@dpms-lpsp:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#15073 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15073>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-5/
>         igt@kms_pm_rpm@dpms-lpsp.html> (i915#15073 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-
>         move-continuous-exceed-fully-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-
>         exceed-fully-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) +4 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-
>         update-sf-dmg-area.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_14022/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-overlay-
>         primary-update-sf-dmg-area.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +4 other
>         tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-render:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-
>         render.html> (i915#1072 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/1072> / i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-5/igt@kms_psr@fbc-psr2-sprite-render.html>
>         (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9732>) +14 other tests skip
>   *
> 
>     igt@kms_psr@psr-sprite-plane-onoff:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@kms_psr@psr-sprite-plane-
>         onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/1072> / i915#9732 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html> (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#9732 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9732>) +15 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-90:
> 
>       o shard-rkl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@kms_rotation_crc@primary-
>         rotation-90.html> (i915#12964 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/12964>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_rotation_crc@primary-rotation-90.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-
>         reflect-x-0.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-3/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/5289>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-
>         reflect-x-90.html> (i915#5289 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/5289>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>)
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_setmode@basic-clone-single-
>         crtc.html> (i915#14544 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14544> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-8/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_sharpness_filter@filter-formats:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_sharpness_filter@filter-
>         formats.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-2/
>         igt@kms_sharpness_filter@filter-formats.html> (i915#15232
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232>)
>         +2 other tests skip
>   *
> 
>     igt@kms_sharpness_filter@invalid-filter-with-plane:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-8/igt@kms_sharpness_filter@invalid-
>         filter-with-plane.html> (i915#15232 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-6/igt@kms_sharpness_filter@invalid-filter-with-plane.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) +2 other tests skip
>   *
> 
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@kms_writeback@writeback-fb-id-
>         xrgb2101010.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#2437 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> /
>         i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9412>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_14022/shard-rkl-4/igt@kms_writeback@writeback-fb-id-
>         xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/2437> / i915#9412 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>   *
> 
>     igt@kms_writeback@writeback-invalid-parameters:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-5/igt@kms_writeback@writeback-invalid-
>         parameters.html> (i915#2437 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2437>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-6/
>         igt@kms_writeback@writeback-invalid-parameters.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#2437 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2437>)
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@prime_vgem@basic-fence-read.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3291 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3291> / i915#3708 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-2/igt@prime_vgem@basic-fence-read.html> (i915#3291 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> /
>         i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3708>)
>   *
> 
>     igt@prime_vgem@coherency-gtt:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@prime_vgem@coherency-gtt.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3708 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3708>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_14022/shard-rkl-8/
>         igt@prime_vgem@coherency-gtt.html> (i915#3708 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) +1 other
>         test skip
>   *
> 
>     igt@sriov_basic@enable-vfs-autoprobe-on:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_17515/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-
>         on.html> (i915#14544 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14544> / i915#9917 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14022/shard-
>         rkl-5/igt@sriov_basic@enable-vfs-autoprobe-on.html> (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8614 -> IGTPW_14022
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_17515: 2bc418aa7efaae562e49d84e8b28f799cf624745 @ git:// 
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_14022: 14022
> IGT_8614: 8614
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git:// 
> anongit.freedesktop.org/piglit
> 

