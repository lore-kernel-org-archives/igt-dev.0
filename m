Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F04ED132A3
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 09:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0B610E39B;
	Mon,  4 Nov 2024 09:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gs3MK4lh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A99110E39B
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 09:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730711700; x=1762247700;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=O2RsMTYv8XPu77tJxz0KECq+iXeZwA/hgwozuiZ18AY=;
 b=Gs3MK4lh4Y6Pk8VeXFsZcRXcrv5gpCg4Xj0MxrnTdGxEHI5xrNpTI8TR
 SVhjIXsOpUnFHBEl99vcs206kwesI2YEfyHRuAUbwTonUmFaRcGz46wEy
 Di6uW4UvEXW4U5aFOtJ8DIjHiRL6TNFF4pf6TtrX2rTqUGTZpQ1hcAFij
 kfrrTLZ+ZXqQixaPXmtDn2RMz3Yhcmir08ZkWyWRTEGuRTgt4yncp8oJW
 GwKzMguIlQ6zkfnpn+82oRwT3lGNL2YIr1Sqo5aol2LmDlxdGUPYb7VEh
 IJfFHmT2sllZ138skVg387fIPQfBgUDusBbg99QsbKmvMGG9jD1VB2qsL A==;
X-CSE-ConnectionGUID: tRcr9qB2SdaYPbFyxv8Ykw==
X-CSE-MsgGUID: qK2+TB+HQ26NLksmW+h2YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30575297"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30575297"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 01:15:00 -0800
X-CSE-ConnectionGUID: wzEz3ZK4TLmRMq8N1l6IPQ==
X-CSE-MsgGUID: Mmw5YndnR0SmqNkV9AEOzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="114380449"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 01:15:00 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 01:14:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 01:14:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 01:14:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vK9+3BfmHUIHEFBj3s0jybj8ckKosucCPbCweiVbuR2OtTsgQZwzqs3C8NR+egiQ+kSwcTpwR9B6rnFfFJQEikl24rnzSvMKcUsthnQ4djsbqxkdkQsvYZR+nMJ6ebrJrRbzdrg5JSG5UI37Ei9K96zbBcRpUDSJAQD3kN11fwYad6iHMi1vO//kgWnWofyweIvnkw3Y/x7TYQiwDlZmaM/hSoDiK1E3ryqctHIKGEaB18HqT6OqViXEE4+qe3f/YEOGh52SohAQgAuX/P297zcBAU9PIfRuDfhYKgJ5W5wo7Z1J9yUz+8Hbn8FOqfep9Luof3wJHfxU/k5jyduUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgy5aUWDQMEE1xwE3S1fJRwUenaUICqSAcpEEaplp7M=;
 b=Xb5tXGUOw4ttW4V1QMukgGeLG3fN01815Lm12tMM2XeVf7noq/eTNSiwz+J4oLFIb61WaWzG7k6cPZblJudH+h3plEg/R0L8OH9u56lsnU6tAPGkqkOA3F8fYkLrwMgvv4AkD+3VUid2XFFadx+ye5Hw5R18BZ1VJ6gxdoD2gMjUkyahPR8Gem1v8kCSoCUHbzkUFba84kbkWLL7f3z4SJD6k6EZy+rg1aMPuQHODTuzgPddh0UZreorkSbJx4paxoskYC7ebukIlYA8daDi2peuwb7EPJDNsp4MG7cIJXQ/nxemB0NdlYJkXnhI4cUd7pdYukYt3mO53f8HJFPGeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by SJ2PR11MB8513.namprd11.prod.outlook.com (2603:10b6:a03:56e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.37; Mon, 4 Nov
 2024 09:14:56 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 09:14:56 +0000
Date: Mon, 4 Nov 2024 10:14:43 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_fo?= =?utf-8?Q?r?=
 tests/intel/gem_ctx_persistence: Wait for context termination
Message-ID: <dykzcnlnkbszyejy7gg64qj6wlil4lwldmpd4kimkunzv2k4se@tnqbhz47qiqr>
References: <20241028125640.22936-3-krzysztof.niemiec@intel.com>
 <173022592415.1360633.16927327203874905281@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173022592415.1360633.16927327203874905281@2413ebb6fbb6>
X-ClientProxiedBy: WA2P291CA0048.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::10) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|SJ2PR11MB8513:EE_
X-MS-Office365-Filtering-Correlation-Id: 03fab388-8492-459c-bc3a-08dcfcb12625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHZyUkErVEMrVDB1ditZNm5BWllnekZhdnVCdmpRYlRCdFdHbHdLODVMaGl2?=
 =?utf-8?B?ZWloSXlmUGhFdmdXTFZkdXZNUGpJbFRjUUpic1ZGNTFDNHVHMFdLNURneDZQ?=
 =?utf-8?B?aVRBcEU0NUtvYWlOMm1BRFZRYnR6dVRCbndpdk1pdHJqc3BWVlNvT0xaSFQx?=
 =?utf-8?B?V0lLd0xtaHZKcWRqVFVSRjRQRW01dHg0NUYyVmhwL1NqZWVSRXdTaU8xdzVH?=
 =?utf-8?B?NitrWm5qTnQxTUozUk0zeWh5Zzl3ajNOY1Vmb2FneDQyMnpVUnlmeTlnM1h3?=
 =?utf-8?B?ZmFkbHNST0FmWDh3TUV0eC82bXRJSC9Pd2dKOFF6TXR2bDA5aXNZbUNLKzBp?=
 =?utf-8?B?RHpNSzYzSzhKcFRVcVU0cFdhczdkYWVXQUNLcmJhcVhIa0poRnJjNGNXQkR1?=
 =?utf-8?B?c3VqZmt4UDg1QVlTbjNWeVpRN21tNEFXVXpmcUdRTkQzeEZTUlI4VFpYNWRi?=
 =?utf-8?B?Unh6Q0c2SElHVTdBNTR0ZHJ5THl2ajR6RStmaU5zbDNqMzc1TTdsWWljcW1S?=
 =?utf-8?B?QnRYR0o2NGxPSnZhTXpNcDV6azdkQTBDRE8ybk9qWHliL2xZTTlXRWN3OFlR?=
 =?utf-8?B?eDF5d0RML0hnQ1VMU00yNTFoUzFSZEtHY2FLY3lVR1gvS3JUVml6czZxRHJG?=
 =?utf-8?B?d1VuQzI1K25SL0hqVm43dUllRFAwSEMvN3BSSFBCKzNuUkR4TmloNDB0UElN?=
 =?utf-8?B?UnZjRDVJWE05bS8rTkM2UVNQZkp6SVAzaG9aV2ozcSsrVWczY3dCQWIyU3Ar?=
 =?utf-8?B?KzVoS3F1U2Q2RE9KcTNaT0w3bzhtOVNmMHByMGUxV2dBc2pSaDIrRmtVL0gw?=
 =?utf-8?B?VWtQMDRweUhBK1d5em51SVhtcFVzTXY2a05Jb2FuNDhGNlhNRU1WN2M4UzEv?=
 =?utf-8?B?aGJsUTlHTU9BdEQ2QUc0WkUwaGUwUlBBbldSakpUZmptSGsxb0FGajJDYW41?=
 =?utf-8?B?NTgyNWlncjVNL3BReFFpaG4xbk1pb3hYTGtqYnI1aUtrS2tVdzJwdnU5YUZ2?=
 =?utf-8?B?L2pIdWFoRjlHc3JBcVdYMW8wcUxWZ1pQN2JlWGU1NFNhRFlyckYrMTdJMjJu?=
 =?utf-8?B?MGM4VFpVc1FvTFUwMDVvZ01TS1N2aFNRUVlSV1BuMnRnK1labTRqZ1FLM0Vo?=
 =?utf-8?B?cWJwNmZ0eGVmdC9nelJxSFhVb0pCSDJDZTc1TkdLdk9nR01laldrQ1VyQnJI?=
 =?utf-8?B?U0Fwa1N4c2hOY3NXNTBUanRQZnpadXdUMStlMFN2bENaRlI1RzBpb0k0a25W?=
 =?utf-8?B?dTcrVjNEc3dJU3hlMmk4dk9OelMzcXFoNGt6d1FnREhEd0tGaURsamtCMFJi?=
 =?utf-8?B?ZHNtUmxsbExnU3RKb1UvdHpDSW9yRlRMbktYYkVLaGZ4ZEFGUno4b2VBTUVE?=
 =?utf-8?B?MzloS3ZRRnZsWGFycVR3Z0dncVdkUzZrdlQxYjlaQ3VNNVNLZkJzVjQ0UEVF?=
 =?utf-8?B?OWh4dDY2a3hKZ29uUGdNM1BiNDVnem9EbkdydjRibzVXWHJEK1oyZklRbmRn?=
 =?utf-8?B?WTJpOUt5N0N4YmpOTVZjODRmM2ZXeEM3cFM1RkR0c28zSnBZT0VHb1d0Tm43?=
 =?utf-8?B?cjB0RE83TTVEZnFEaGh0aG4rUXo0ZnZmSGxFSVQ2STFtYnVEakx6azRtQzVk?=
 =?utf-8?B?RmprNEQ3SXErV1V2eGVlZDI3WXppK1dQYkZucCtHNmI3ekM2bWFUTzdzWEhF?=
 =?utf-8?Q?6iJOoBoE5z5PWIbR/xHE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUY0UkpYaExqdjA0bWZnMmNURjVWMVhqdkx5bFpPMTlPVXpraVRPbmRXRVlh?=
 =?utf-8?B?TExGc1ZxTWVnOFVEdjJOeWNnM3ZUOEF2MVQwcEQ3SjJtdlh5ZWRKSWtqMnVR?=
 =?utf-8?B?Zk1vVnpwMmN1eThmby9yZm0zdndaeUpSZjNMeG5CTm9iS1hOeVlYbnNneUZD?=
 =?utf-8?B?Ym5xRU5GRHpTNVZsYzFJNU5JWHBJN2E0R1c2VkZsaWE1MnZmN1p2VGUvTTBB?=
 =?utf-8?B?WEpYVXVvY0FNcmt1NWdwRCtlY3BGSnVCK1NPZzdkSFRrR0x2UlFuWUFJanJB?=
 =?utf-8?B?andyV285SEtURTJ2U1dzV0NuZGxWUlduV1Z5Zk56R25aeFdVZ0dzUHlQMzJw?=
 =?utf-8?B?QUdkQ2ErYVJESWRlRWo0QWg3MVdJWXRSQkdRQjMwR2VCSkNjYWNEZEVwRDRm?=
 =?utf-8?B?Y2sxVlBoazFpMkhOWEJocVA1NlhVeWN4VlRmY0YzaVd0YzlBYmJmV216TnZH?=
 =?utf-8?B?K01ZSFRaT1dmcklkVUhTT0dObkw4bjluTDdzQmtjNHdUQlFVWW5oOENBMFZp?=
 =?utf-8?B?RUhOYmJ1dWtIVTJranFqcUNXQzYzcDN5ZTBPNE1OcTdzcXcxY3JCUEREOXIy?=
 =?utf-8?B?VHcybWNSa3BFWkY2NVMzOThHZ2cxSnA4bDkvQ1g3MlRTWTRvcXJiTlBKN3k4?=
 =?utf-8?B?RXpZdDNXV1IwdXpNWEFsZmk5RU13eE5hbFQ3STFQSHQ4dnd4RTlNb3ZYZHJR?=
 =?utf-8?B?L3EyWjNjb3kycUVkRTU1ZjlCZXFGS3MyWnI1bjNtdEFZSXN3OTk5MVdKMXRy?=
 =?utf-8?B?R2tBR1ZwQUZkdVVBRi95b3BwcnF2SjNJMEVzdHN1Q0d6ZiszcW1DdkVaQmNp?=
 =?utf-8?B?bStBNzEwT0ZXejdzUDc4UGFKaU54VmRDQk9wVEVGaUFRNFVhNEhuV21JNHFo?=
 =?utf-8?B?VUxPRUZhK1NKSGN5cTRNMm9aRHFKQndTY3hSZGRrOVpJZURmMng1VW5rUEVK?=
 =?utf-8?B?U0JIQ1Q2ZTNocE9OdU56VUxLNHhXdU5CN2I1TkNUWmdUaFJMYlVMNG1jQ0VB?=
 =?utf-8?B?NzJpWDBNLzBpMGVUcmszZkRiTTNaM3Z6VWlmeWJsQUdLZGZHUU5Sb2grL2NS?=
 =?utf-8?B?c3RCZzBnQ25IbUw2a0Z1M2xVcGZMU0tlVXJQS0tNc3F3UFl4ejQzWnpvS0Zt?=
 =?utf-8?B?S3pqdzFxMGcwOVgxSnhrR0drYlRGOGVPeExibFcwNVRWak1jUjkxN29CL1dy?=
 =?utf-8?B?bDJKTVV0NTkxbXo0RmpGR3dqVytkUTlsTUYzanRocGk5S2ZDbVlaWStUTmhl?=
 =?utf-8?B?RUNjMWR1UkkxSkRYaHdZNXpOMlBvQkNYN1NOYjJ6ajlTdm5vQkJ0aDJYNUlG?=
 =?utf-8?B?KzYxTU4rU3ZwOGRaTVQ3aDlQVzFqV2tCdEd4NHg3Sjd4SndWazFvWU5vMDFR?=
 =?utf-8?B?OC8waUxmSEw3VDBCbENZRXNYOHI3QUljVG14YXJUdlU5K1lZVG9XSXd3SnY1?=
 =?utf-8?B?QStBbDhQcGxqOVBlUkh5dDhqYzJpeWlJaFZ6aVZWZHAzb20wWUlHMFJtZmRX?=
 =?utf-8?B?elZxNEdoQ1VzakVPa05UN0pQZWxnSUJia1UvcGQrdkZTL3pKRDhaRk1MVFcz?=
 =?utf-8?B?VDhtZzlrOFNsWlhYa0JlTmYwbWd6WnlTZkhnL1lwdE9PdkxwY1M1cUdVWEty?=
 =?utf-8?B?SDBzaGJTSksvYUUzTFZ2QjlOZU5ydCtkREE3OHJJdlUwV0piTm5NeEpWK0RC?=
 =?utf-8?B?VDRVWkRKSWtpb2xDV0Z0K21PMzRvWkZoN1c1ZWFKd0lUMnFTbVpBdUhydVNm?=
 =?utf-8?B?RTlDblZxaTlWR1B1L0t4NDZZdktEeDkwQXgvWkxmc3ZUaUIxUGh4K1VNLzJs?=
 =?utf-8?B?U3VnOWg4MDcvRHoxcWdTT3QxVkdpemlqSWYyN1RFUFh4UGdzaXNZb3Q1azFZ?=
 =?utf-8?B?YUMzblovcWtRbUdJQ0lGZUFPeEs0N01KZVZlZUZnYkhsOW56TlloZXZnU2tH?=
 =?utf-8?B?QjY4QTNkc3RqMzdwaW43STF5NGlOVmVQUk1oMUI0bGNWVi96eWhKaDB5amh5?=
 =?utf-8?B?bkRGaXZ4MGl0S1M5eXFXMGg2LzEyOU9IUXRZR3pCSE5JckNrSVR2cGZFa3dD?=
 =?utf-8?B?Rk1NRkgrV3U1Um5NbnRNcnhFQk92cWdZZlpGTUhCeVhtZHZCRTY4dXdyVlF1?=
 =?utf-8?B?Rk1EU0c5RFpIdVJ6bnhwMklia3FDYVBQQVZ6NFNoZ1hmaVNYa0c4MWxDQXo1?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fab388-8492-459c-bc3a-08dcfcb12625
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 09:14:56.0425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ce+toD+5Es2tjZqzKQXYLIdYSDXSaz/yvlpKVn7vSjXX6q5VRXcBi5IPG7Fq24WVetrVJ2dEbGw0W4pBpWpfokbzCAD3MZQfCryT9lZAPWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8513
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

On 2024-10-29 at 18:18:44 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_ctx_persistence: Wait for context termination
> URL   : https://patchwork.freedesktop.org/series/140582/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8087_full -> XEIGTPW_11992_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11992_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11992_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11992_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_setmaster@master-drop-set-shared-fd:
>     - shard-bmg:          [PASS][1] -> [SKIP][2] +4 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@core_setmaster@master-drop-set-shared-fd.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2:
>     - shard-bmg:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-b:
>     - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-b.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_cursor_legacy@torture-move@pipe-b.html
> 
>   * igt@kms_flip@dpms-vs-vblank-race:
>     - shard-lnl:          [PASS][7] -> [FAIL][8] +3 other tests fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-8/igt@kms_flip@dpms-vs-vblank-race.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
>     - shard-bmg:          [PASS][9] -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-bmg:          [SKIP][11] ([Intel XE#2327]) -> [SKIP][12] +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-bmg:          [SKIP][13] ([Intel XE#1124]) -> [SKIP][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-bmg:          [SKIP][15] ([Intel XE#2887]) -> [SKIP][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][17] ([Intel XE#2311]) -> [SKIP][18] +5 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [FAIL][19] ([Intel XE#2333]) -> [SKIP][20] +3 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][21] ([Intel XE#2313]) -> [SKIP][22] +3 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>     - shard-bmg:          [SKIP][23] ([Intel XE#1489]) -> [SKIP][24] +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr2-basic:
>     - shard-bmg:          [SKIP][25] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][26] +3 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_psr@fbc-psr2-basic.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr@fbc-psr2-basic.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
>     - shard-bmg:          [SKIP][27] ([Intel XE#1130]) -> [FAIL][28] +1 other test fail
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
> 
>   

These are not related to my patch, I didn't change anything in these
tests.

Thanks
Krzysztof

> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11992_full that come from known issues:
>

(snip)

> Build changes
> -------------
> 
>   * IGT: IGT_8087 -> IGTPW_11992
>   * Linux: xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab -> xe-2137-95fd9af8bb5389f9b5a639d567ef5c3e43e25682
> 
>   IGTPW_11992: 3342f387a4c17dbc466bbdf0099520c573107185 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8087: 7abd9c49a49a9ff1f3300d7c51a92a5af8a789f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab: 738c18d8599dce736da8b6958f96d2eac08a36ab
>   xe-2137-95fd9af8bb5389f9b5a639d567ef5c3e43e25682: 95fd9af8bb5389f9b5a639d567ef5c3e43e25682
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/index.html
