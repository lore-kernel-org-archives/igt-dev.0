Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88EFCCD184
	for <igt-dev@archiver.kernel.org>; Fri, 17 Oct 2025 07:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883CB10EAF5;
	Fri, 17 Oct 2025 07:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eawjwHHB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCAF10EAF5
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Oct 2025 07:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760686218; x=1792222218;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a/5d3Yk0152lsdDtydb9aHH1IzviMPUI1UcyusUSesQ=;
 b=eawjwHHBXDYoc/szr4Wds/JSATq8jk5tGNVcWNZ4NTTuso9cdhOjABD3
 5Ds18nuSgV/garWPwQsLbx8JM/FlTEPJRYVhf2M91Shjat8MtJnDwC8YP
 kIGZXtPx7/e9fj3G4kuwQl2d3zbVRsFHvXvclAbvLxYICjWvlk2Mh4A3X
 rDMXPsWOXSvYZMUjcr6O/zngDn0V2qGnBHstmflQ8nSbsYI4v6aTf51P+
 rjw0ynWF2+0LrGTBYbR/N1qfh8AT6dEqw72MCnFVr2NwuYUGPrUeGeM77
 DuwCYFqFNBnqU6YoCidLJkb5367W98SkqV1lhQ+NsshxQFnHf57KkhIkS g==;
X-CSE-ConnectionGUID: RZe2kn0HTGqWtiIJJ02g9g==
X-CSE-MsgGUID: wD12JX9UQGSNUcigGTCrlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62931910"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62931910"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 00:30:12 -0700
X-CSE-ConnectionGUID: ANcfYhTDQuO2qtcR4ynQ5w==
X-CSE-MsgGUID: klz0z33YSqSEfEYK86sfyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186926774"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 00:30:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 00:30:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 00:30:11 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 00:30:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwCIIEc4EXfeT8Tf5mvQzS1BXAfb45W1CxPIhomrktz52XZgPdD/fVgITkYQ7scRiP40fenCE1+IgibI6KUIrn05RXEVaBTgn3rbKOhf9DvayUF5ANuY9SgmEHZnwXhxGwL+5JAW9e7z2H/TpuN3pnA/U/iKKy2CXXG1LWQkI9Fw+8a03dxfI5xqOwBrysiF3ihAF7cM4yQO0x4mdrk40/Mwmqvhn+IpNqCaFft+UKzDJfzhS4iY1Auzp06Yqd13r8gi4+rHmzsXZeJpP1jlr5QCMhknFd93utRRTljCIoyBQKUZwHit3qQZCeIgq7rS8I5j43qw4T+AoI/RZI8rNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7PB9zaWF5krmSawB25FDbL1I474kahfLnXUoQspynA=;
 b=Wr4nD5ONWe+7Mbrga2pu3hsAibQ7y01diGRs3tZ6XENp6+8gbpCoKRI2dp3TFLPA8ouPbfWNPcApBWdURo8vPav6QeAAED7Mzly4OwH0v9HuWgfeT+tFL9Mg7seryShuK0ytS15u/iDYy6i1bboIn/TJ98dPwH2t3VS6Z2aGpthsDiw1M/keOigMRULG3t4MZZ/iD42oxKadezFypB2/6qQh3dhuLYBJ2J1r0RB+gcZ8O9xadYaw1hYujXDeRXLRSd1xXPQLgENlqNJWRubC49MQNJ7hNz5hFdKa/8+LyeOUBCIxuAAaVEqTrwPmPJ6Md4D6gTBgRMBshfJRXCgzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by LV8PR11MB8536.namprd11.prod.outlook.com (2603:10b6:408:1ec::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 07:30:10 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 07:30:09 +0000
Date: Fri, 17 Oct 2025 07:29:59 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Simon Fairweather
 <simon.n.fairweather@gmail.com>
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: Add iteration option -n
Message-ID: <vf4drxg7dt5etivlwlgvbrxomkodvwrfpjm4jplicb3udecki4@uv5s3zp6t274>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251016095649.31446-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251016095649.31446-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: WA2P291CA0029.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::29) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|LV8PR11MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: eba43dc9-a1b3-4b3e-502d-08de0d4effa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEoxYWJxTm5DVHFoSEc0T0lqclRCOFBOVi9LYWJMaFl0dENpS0lndmE1OHc5?=
 =?utf-8?B?MkNyWFBaTktSRmxxT2hJNTZFU1loR2RLYVZOK0Q2NTVaS05haENYeG52eEFT?=
 =?utf-8?B?VkdhVVlReVZxQzRvUjkxMVdrclJ4dzdYdmRIM0JaMFB4NUwvbDY5djQ2bGtB?=
 =?utf-8?B?a0RDb0JwYXJGR2pET0xKd1ZnMzZSbDR2YVV6WlRIVjhyb0VBeUFtRFgzczJZ?=
 =?utf-8?B?VFlkc1hveVBUSzRuZDh3TENORWlGTVYxNHJ4RzhHM2NxY0ZjTzYrT0pTelNx?=
 =?utf-8?B?ZWt0U25hdnoyYXVFbnhEbEdON1NqczJFM1RMd3lJNmdBclNIK3IrQ0FNRzRP?=
 =?utf-8?B?clZxdzZyeUpuVlMvZDBZZWVNZTBOaXJYM0oyUHZic3RkVGRZak1xRldNRGFw?=
 =?utf-8?B?QXRpOEVyRHM0dHA3dHJnTEwzczZGVEpsdDhyc1ZpbXRFeVR3Q2hjdWliNGxk?=
 =?utf-8?B?VGdadFAyenF0V2lZcHRDWlB2eW9IS3k0NFlsWHRVaGJ4SS9wL1ZaS1RQb3FH?=
 =?utf-8?B?aTJyaE5BRjB1bmlCN09BU3loYnVNS0tnZURRTDJoSGlnNWl2MUEyU1JtV0Vy?=
 =?utf-8?B?OXJhMjVOS1dHVG5aT25PVlZHTUh3REJtSjEvMWw0RjQzc3ZHeSt0UVU1eEg3?=
 =?utf-8?B?VHJmUFAxSXNaL0xMNUp4U0hYQkp4MTQrT0ErMkdTTW44bDVaQ3k1QUxNN3B0?=
 =?utf-8?B?ZVVwTVBWS09oUWZ0czlrWTVMNnRyc20rV2YxT2FibGJkdHhLajhVVjgvazN0?=
 =?utf-8?B?a29wS1FYMm5vVTdnT05XMXNmUVdadzNyM2J6cGlYdSthaUFiV0hXakM0VDdk?=
 =?utf-8?B?L3E5WEpkN2UyMUdndU00NktUa2poLyszd2I2ay9JeURaQU1EZFY0ZHFjeEYx?=
 =?utf-8?B?bHRFODdmMUJwRndORnNRR0VGeDFITWtMcW9OSTJRbnVHZE14MXVCWXhKQ3BY?=
 =?utf-8?B?cUNTK3BqaVRUR3NtOXZHeC8zS21ObnB4UjhQRFZicWxtN1VYTEk3YUJCUmRh?=
 =?utf-8?B?UjREYVRvTEM3cHBFQWJLaXpCQmlxOGU3U3dLVVFaMzJteHlCSWpzWnExRUMv?=
 =?utf-8?B?R1J4My9CNDlFRnFMQkU2RFpLTFVpcW5Zc2FWWjhRcUNrSHRnbklSOXc0RXNO?=
 =?utf-8?B?eFFZNnA1emVNNkZpVHI1YWJ2VTNPVXl4MFhjeXh0UGFyYmU0M1d5OEZBV0pQ?=
 =?utf-8?B?ZjNpRmtmRG5VZlRwSFBteDFZbGxlcnprTGFzNFFINkJMTXVnMGFUSThLeGky?=
 =?utf-8?B?cTJSRFVLajVxQm9YeWMyd0dkeXBtTktnOStrZW9OTVc3aGo1U2ZaZ3N3NlFB?=
 =?utf-8?B?RlRWQno0TGNBbURDN2M4U1pVWmZzYStFVmhIM053LzdONGZBZUlINkIwVWlT?=
 =?utf-8?B?bHhCOUZ0SmFNOG9jdEFzY012anhJOTJ2OEFSVExwNklvT1NxRXc3VzRWaHNy?=
 =?utf-8?B?Z2tueE1RTnh5NXBDZUhqUTVFcHhZSmtKYTlCSlBzS2Rpd2NWR2pDZFhaWXUy?=
 =?utf-8?B?VEtCYitxRHlHVEM3cHZGQ1BxQ1Mvc1ZBRWxlZEZ3czlXcFJacGgrZDl5TkFh?=
 =?utf-8?B?Nk54K1lvVmNrUldvcmFqT2liUDJSK3RKMDUvWmZCVkFzN1VMK1U4cmwwWW10?=
 =?utf-8?B?bUNSb1o0Vlk2aHhiSU1FcnJCTlY1M3RPN3lSaXVSbWtXTThJckRIcjlRaVlt?=
 =?utf-8?B?dUYwS0ZzNEwzVWh5QlJkK3BFM2pPQnVyNk9qaWU3ZU1EQmZBa2k1V0dkWmJt?=
 =?utf-8?B?VFpjYVVpL29KdjBmaHFnRjZFczR6SVA5aUN6bnVMUllpQldOc3YzZzluczV5?=
 =?utf-8?B?MTU4V1MzNFYvcGxrY240QTNGZlpva00rbUtZdTVQbzIzd0h1dCt3ekhjaW5G?=
 =?utf-8?B?dHZBV0FsbFptcnpNRVIwSWVCMDJhWFI5MXJPQmxXdVd6MkEvWGQyalkrLzJh?=
 =?utf-8?Q?PT+j9dp6GrHgzi94Ng2Hrr4mB2f+/zSl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVdlRmNTVFkzeGpSRFZJbG9VRjBGNnB3ZElZOFlnWTA3OGxjOVY2MnNLbm1a?=
 =?utf-8?B?Q3BrMVlhVEpEMFUwbFYrMGJXQjZhVlV0aVhwOTNHc0xWcEs5UG5mcW9sdjc2?=
 =?utf-8?B?YlZkUGJ5bVZTdE5MRWJmalROZUpTTmhNRVk4WFBTVXpLTGZuRHRDWnFEYWhx?=
 =?utf-8?B?enpPSW1KSlhMQmE4anBEdWZ2Zi9KSTFVald6OFlMT21oSUk2Z2t5TWIwaXh4?=
 =?utf-8?B?YVlmcGR0TnBxN1J3NjZJa3V2TzgzRHVOeENWMExyb0Y1TFlid0J0TjVweFB2?=
 =?utf-8?B?WUNQdGNndTVOcVNTbVJEd2dLVEw3ODUxbGFDdjBLeDFaOE10T2VTa0MrL3hG?=
 =?utf-8?B?TURHT2gyZEZMblE2VVR6TXJzanJLcEdIbWoxZ1VQMm4rR0JLODMrZTh0R1ZI?=
 =?utf-8?B?N1VxS01qVitab0lMZmxKamVxWTFjR1p1STBDSEpTaVUzNVk1YlZpd3U3VUE5?=
 =?utf-8?B?bzVkRGFRSmFvVUZkYkFGQkpScFg5b25BaVpHLzZCVEtISXRKMmdsZVpGRjYy?=
 =?utf-8?B?Q2EyTFFkbHd5YWlWeHpoSXllWTVNMkljbVRkandqS1JJVkYyVW1GVEZuYndo?=
 =?utf-8?B?UVNtZHFIRHJKYnNwS0x6eHBoSXIxUkxUdG8vUitCM1lZUnBSNk5uQTM0ZTBF?=
 =?utf-8?B?Z3hDSUY3T0U1T1BkM3h5R2RscmsxYWx4V3VmWk9ocDhMcGhrbWZFdUdFNXZO?=
 =?utf-8?B?cUhRK242cXZsR0t3NDNCU1l2TlltUERkaW9nZHUzSnRobWdjRHhlSEU2WFE4?=
 =?utf-8?B?ZS92NFp1Tjg3SUhsNDZ3KzdQSjFkMDNZMXVCNHJPZi9YY3dvS1RXaytoNEQ3?=
 =?utf-8?B?UDNOSlB4WlNyUlR5TXBnYnJ2UXZBVkdFbTNIajlnUWsvaVZJY1hQek8xTlNi?=
 =?utf-8?B?OUVIZ0d5WGhnaDdLMUtFc3RxdTdMWmVDY25rbzhwdk5CREp2VDZoRmJmK3RY?=
 =?utf-8?B?RGRqUTdRemR2SGRDbjlPMjBiVW1JaWd6M2FWRjJKR2FhMkxTYTF0QzB2TmlR?=
 =?utf-8?B?OE9TN3lpcVd4UnYzWmduVXVxUTdyd1ZTTlJYNFRMQnRaV3lQbW9ZeE1YRi82?=
 =?utf-8?B?WGJaalBjNmFuOWV1N3RucjZxL3NFbTNtd1kyQ0pkbFBrVzhoVVpsQ2JISHN0?=
 =?utf-8?B?dWM3akJMNUt5ZlVtVGIvQ3ZOMkMwUFlwdVAyYllXRndnL0ovS0Y3UXZiY3BL?=
 =?utf-8?B?eU9ONSszTlV4SUxUK0pMSDVLblAzMnQrSS9ISW5NbnhaM2d6TENBQzNJYVJs?=
 =?utf-8?B?UXV2ZVppTlBsYWFTcHZlNDZMdTBPY2R4T21kTVM2aHNsK01wbFFPaWFTK0ZH?=
 =?utf-8?B?cENEUG5tUk0xRDNuVUhyTGJrME1qeVVCQ2lzQzl0Vy9SMExyOEFWc2lEeFZ0?=
 =?utf-8?B?dEkzdE9rZ2oxYk0xa2gzRlVrSkpPZk5SYzhQVDV3MzVQd2RIVEpwQytWRGZC?=
 =?utf-8?B?NEc3Q20ySyswV0doZTdBTk1FRGlpVnp1aldJYlN3NmROTzZENkxNNkpocDB6?=
 =?utf-8?B?ZmM4N3U5Z0xNa1I4ek81TmljaDZDT2ZpSFRGZHhaSzQ1UnJJRlhlK3BLcnhF?=
 =?utf-8?B?dGFVMU9obFdxTm5aRUJEWnQ3MzFkZVVieGJwaitmYnR2YzdteXdwUDlDKytT?=
 =?utf-8?B?d283ckdkcVNNam5HeElCY09CYXBoSVc4U1VyLy8xK1ZJTDV0UUY0dGxDMXp1?=
 =?utf-8?B?SkhuNDdQT0xmWVB6K2hSTC9rQXhYUEtRZkFObTBVYmJuU09iNEY1cVVNTzVU?=
 =?utf-8?B?NG1sTUV3K1FKYVNDaU9GT1hYWTFhSzZzWUxMOVkycG5TS3lmelpidXpCcHQr?=
 =?utf-8?B?Q2IzdmZybUJWSVJlZXRVN0p4UXh3OUVyZzVaTWJyRUhueCsyTFZHRkc0Wm9p?=
 =?utf-8?B?TWxhTUZ5cDBVY1lUK2d2NXhIcDJVYS92MU5ZWGRqZmE3K3IxdDBEaWxTdWlP?=
 =?utf-8?B?cDQxZ0lET0ZuK1lOWk15Z0pYM1dsaDg5MFlhRDZQRlBCNkc2MHlFa1lKUTJj?=
 =?utf-8?B?c2hKdGZUK0h5cHArOWFYa05XZWlaSHJkd21Ld1JNZlQzMEs3ajJxOHI4UmNU?=
 =?utf-8?B?MS9KNDc1ZzJJRkpMY05LWGxNTkRJbE1PMDVMNURLc0ErOUJMNzlaaURzS2JW?=
 =?utf-8?B?ZWo2KzVpVmtnQXFsWlRHbXRuQ1UxTTJKd1ZvUUorcDBUckpxRDBTRFFGSUJB?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eba43dc9-a1b3-4b3e-502d-08de0d4effa8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 07:30:09.2875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Hy2HxYs62qOOneZQZrfkW6vAMjfk77x09O9Exyzwoxq5Zlbjpw386Dpkr17TQxI9Ix89z+I/az0s5IGA/VmekafZQsmGeUh6rmr2e2xhMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8536
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

Hi Kamil and Simon,

> When using option -J or -c default is looping forever until user
> break process. Lets introduce new option -n <number> and break
> printing after reaching given number of iterations.
> 
> v2: corrected whitespaces, extended description (Kamil)
> 
> Signed-off-by: Simon Fairweather <simon.n.fairweather@gmail.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tools/intel_gpu_top.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 54e71e559..4bcac4b47 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1051,6 +1051,7 @@ usage(const char *appname)
>  		"\t[-d <device>]   Device filter, please check manual page for more details.\n"
>  		"\t[-p]            Default to showing physical engines instead of classes.\n"
>  		"\t[-m]            Default to showing all memory regions.\n"
> +		"\t[-n]            Specify number of iterations. Can be used with -J or -c.\n"
I built this tool with the proposed change and found out that -n
applies regardless of -J or -c being added - it gives an overall
timeout for the application. If this is what you were aiming
for, then I'd rephrase:
"Specify number of iterations. Can be used with -J or -c."
to something like:
"Specify application runtime: n * refresh period (-s option)."
or:
"Specify application runtime n * refresh period (-s option).
Useful with -J and -c options."
if you want to hint it's usage.

>  		"\n",
>  		appname, DEFAULT_PERIOD_MS);
>  	igt_device_print_filter_types();
> @@ -2618,9 +2619,11 @@ int main(int argc, char **argv)
>  	struct igt_device_card card;
>  	char *codename = NULL;
>  	struct timespec ts;
> +	int iteration_value, iteration_count = 0;
> +	bool iteration_check = false;
I think iteration_check flag is redundant here, because you
could use iteration_value as the indicator:
 1) set iteration_value to 0
 2) if -n is used overwrite the variable to whatever user wants
 3) check later if the variable has value
 4) a) if it does then increment iteration_count
    b) if not then just spin indefinitely

>  	/* Parse options */
> -	while ((ch = getopt(argc, argv, "o:s:d:mpcJLlh")) != -1) {
> +	while ((ch = getopt(argc, argv, "o:s:d:n:mpcJLlh")) != -1) {
>  		switch (ch) {
>  		case 'o':
>  			output_path = optarg;
> @@ -2631,6 +2634,10 @@ int main(int argc, char **argv)
>  		case 'd':
>  			opt_device = strdup(optarg);
>  			break;
> +		case 'n':
> +			iteration_check = true;
> +			iteration_value = atoi(optarg);
> +			break;
>  		case 'p':
>  			physical_engines = true;
>  			break;
> @@ -2858,6 +2865,12 @@ int main(int argc, char **argv)
>  		if (disp_clients != iclients.clients)
>  			free_display_clients(disp_clients);
>  
> +		if (iteration_check) {
> +			iteration_count++;
> +			if (iteration_count >= iteration_value)
> +				stop_top = true;
> +		}
As I mentioned above, this is not tied to -c or -J in any way,
so it applies a limit in main execution loop regardless of other
options.
I think the current idea is good, so its usage is not limited to
the -c/-J opts, but the explanation in "--help" section should
be changed.

> +
>  		if (stop_top)
>  			break;
>  
> -- 
> 2.51.0
> 

-- 
Best Regards,
Krzysztof
