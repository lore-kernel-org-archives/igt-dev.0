Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C79C02198
	for <igt-dev@archiver.kernel.org>; Sun, 16 Feb 2025 11:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D3910E1D9;
	Sun, 16 Feb 2025 11:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6KIJ99T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B038810E1D9
 for <igt-dev@lists.freedesktop.org>; Sun, 16 Feb 2025 11:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739705233; x=1771241233;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QlAuPiAHMY4f6nxTY7qhC8BoQdE8eutjNiosH3ptITg=;
 b=a6KIJ99T5vYP4O+2vzAbpoe4ostaZJCrDc/AjcS5pjV949CE6YiOZwdP
 J6oAx+IdZ6wMcBqmiShjs/jFvlqkbxDg7HpGAdeZwhqPpvYGbIgTzl9wx
 IIQglKsM8G9xWuviGHsDkwn6rRxxaHtmfsiI5mFPx629VwKjt4a1I1p2l
 uSWIH5NHNXMy2O6tU/lSVTlxFT9J0f2fD3aSx8rwVPdxEh6ymbngqdIvr
 q9+Emcu72hMj8475aR7Rii4q7C08cwgpZXGaZyMhjBthAshFT5RP2vF6Z
 fNZsqj6Q0MhSW95D0SOGKl/z7s3oXCUqmDfDuULW1iA7lHewy06WDKS0z Q==;
X-CSE-ConnectionGUID: p7wXm1s5QdifbicjznwPog==
X-CSE-MsgGUID: aSpT9IqISQSka2fAlxbF8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="44161792"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; d="scan'208";a="44161792"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 03:27:12 -0800
X-CSE-ConnectionGUID: upqW7cb8RK20jG3uWZ8E2A==
X-CSE-MsgGUID: osvx5vgLTkSGEIvGa/hfMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; d="scan'208";a="114504801"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Feb 2025 03:27:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 16 Feb 2025 03:27:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 16 Feb 2025 03:27:11 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Feb 2025 03:27:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJQZeUE3SZKzafXaKXbqalbosS4gPq8gpQZ3qFKUg8dYmlKSs3gkQtFHlY4mEtWZESZSi9sMHbkBBo9vFhwL1HTfi3nk6rSdBc5jWawcejpwX6/PHgVokrTxThFUZ79EL0NDLnih9YecplhpfaGN0Ul6IpItxe3iDtJO74N3TWUA88Ayt73Kc5vT/ErH6YLlQuI14l/P2FuXEUsstasjsrjWX+YvzeLKewd5Nm5tKmsyh3GmJe3cBPQTHFT0bI2w2KLTH6z3Qn3lQxYfkfBfZkN87BKiw4KrFvH6WvvC2gx3GcSSOV9ZeOKuLoaGghxBVbqoeLOLOysEzYJ8fvdCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mc0kkwblOZWyuYhO3mqIK77crQrKTp/iQBoZiwDucK8=;
 b=RlCGDa6pdCLB4HFeirU9pj/3iXTRdlq9slfO0y2FDLdJrNiVENIQ81kN/SYm4e6p1m6hah4RSVFewXykl6T1BiwmZmwDeCIk01i/WgxXN0zwyQKc/fB79qn1HqUxm9LhCidnyeqG6W2KNClXJE0fTDZ/CjmAEYXlNfcKL6yNApuJ9wUpGD/cbcwpkBBqhsvxApwjSi6dqocnQ85NLP44lB1FlYMw+omE7Nwu9zibWJwlZ/BIfr7s8ELcdq7FehBKkJ68rZ+ktH2xrWT92Rn5inkFcyjvPmndgykwlkfldbodyJ106FCDTv7lssmGGvmcbIGkJ3YxIZHEp31kbRQ6rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by IA1PR11MB7385.namprd11.prod.outlook.com (2603:10b6:208:423::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Sun, 16 Feb
 2025 11:27:07 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961%5]) with mapi id 15.20.8445.017; Sun, 16 Feb 2025
 11:27:07 +0000
Message-ID: <c7a585e9-7bd5-4767-96b2-51e4b611ccde@intel.com>
Date: Sun, 16 Feb 2025 16:56:16 +0530
User-Agent: Mozilla Thunderbird
From: "Purkait, Soham" <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t 1/3] lib/igt_perf: Add utils to extract PMU event
 info
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20250212095834.384508-1-riana.tauro@intel.com>
 <20250212095834.384508-2-riana.tauro@intel.com>
Content-Language: en-US
In-Reply-To: <20250212095834.384508-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::8) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|IA1PR11MB7385:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dab71d7-5a7f-4ac1-8b15-08dd4e7cd853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1JQZjRvLzkrZkVZZ2cwV0JUMFc3dGlyaFM2VGZBanUzNFpvRVhYUzU5SUla?=
 =?utf-8?B?bW81cU9WN016Smc5R09kVlM3SHZSVGNUVHJST0htSGQ2OHRIN3lsUENWSGFt?=
 =?utf-8?B?Mk8yMy91TW5vT3ovSkNHQkp3WWdlTkFQVHduRVhoQ0hzZ1p4bU5ZaWlQb1A5?=
 =?utf-8?B?b1NNOFRMRW1ETUYzc05ndExpKzRtYlFyZFU0RVB0bEIwSzQ5SXBhYlo4T0ds?=
 =?utf-8?B?NzFpbkF5dWp2RC9vOHEvaUJhdTUreVlBTXZYaWtuMzFrRHVidE02MlZSRXVY?=
 =?utf-8?B?K1FqUk1ERElGSVQ2endPbHY1N2svTFl5aUFFdldEMFZQeGRqcHV4dzJVN3h6?=
 =?utf-8?B?Sm1nUDlKU1BXWWNPS1R1MTZWcTZVZXlCUi9nc1dtYXU0eXRCSGlzU0s2UFFB?=
 =?utf-8?B?eWVlWUtpSEdlRTk1S1hHUHo2MkMxR3JuVVBudEhHNGZtTDRWRmZOS3QraWIy?=
 =?utf-8?B?NWJucHNVREMySnRpSWVDd2htQUZUUDJ4VEpJZ2o2aWpJejUwelVhR3NVVVBp?=
 =?utf-8?B?a1FjcjlKK2MzdnF0bStwTVFPTlkrOFB4WXJmUnB3cjN0L09NbkFDSnU0VGIz?=
 =?utf-8?B?MkF6clZ6SzJIa2VUa2NwaHR5OHoyTVFPbDFMOWRBcnRUenJBenFqWURyRE5p?=
 =?utf-8?B?RUdrclBNNGhvdE8vZDN4S2Q1YlRjVFE1MFVJM1N0RXJDTU1TSUZSdTdSU21q?=
 =?utf-8?B?U2hIN0p5V05QYkVFZlQwWFBYRXREc3FqMnU1MjBGVDVwNU9xbnZaeThpb3Zj?=
 =?utf-8?B?YnVIdjNoRm1CSjc2N2NpdWo2UlcvTXorR1VEOWdKTEl3dUZ2S3RXYVoxS0lT?=
 =?utf-8?B?L3oxdzlZSU9oV3JzTjhhUVdqSjNpYWtNeDlKdW42enBaaTg5VTNYZHc2cWhk?=
 =?utf-8?B?UTh4MnVhc3JqZmxBbjNyeDRPNGFBRW9McHRrb0orQkJGTjRwZTh1S0s1LzJQ?=
 =?utf-8?B?Y05FWWxPT0VXa2UxMVhTUDBtN04ySktidTRselNvbEVNMTJZQStOeXgwcndm?=
 =?utf-8?B?VXNMcDNMSDRROXR0d0ttdW9xVjZ0UVUzOUFNTlpSUzBLL2xyem5vRTBLU1Ba?=
 =?utf-8?B?ZnJsNlNwUFhyUy9mb3VIUk9Hc2RvaVNjcy9qT3R4U3FVOUhZQUM1L2hQL29k?=
 =?utf-8?B?Sk1VVW5PeEhrMjNGU1kzNWlORFdXZ013TEc2Q2JpYTRVS3lKZDMveWxxVFJH?=
 =?utf-8?B?SEFBdTdxZWpTR2ZMQkQxMVF2NmwzeWRLUllZek1RL3dKQlN6bG44aUVLY3VC?=
 =?utf-8?B?Y0lYYVdpbGV5UDNaNEl1OFg0aVQ1SXdjSFNrMktLaXNxak42ZDBTVm9EZm84?=
 =?utf-8?B?NzdVNnBEQ2JicDdjY1d0QWM5dEt5UEVNLzhrS3FjdjcvZDFQSm1RNU9JNkhm?=
 =?utf-8?B?SjJqMnl4M3ZmUmlGYVprTzRROC9JQ0xBU1dTb29CeG1zVVRzSnpGNXMxVTFQ?=
 =?utf-8?B?Si91bEF5TnlLaFlGckdmV2Q0OWhNbzBBbS9GNExJV3I1aWw0aCtBYXJ3Q1Zr?=
 =?utf-8?B?RGlzNnNqbExYM1dkK2lIWjFCM2VpT0pKa09MK2lQUDVPYUFHNlg3dVVHaUdP?=
 =?utf-8?B?RDZ4WXZYWWM5RUszazNJZ29LTkMyUm5abm9wYU5pTnlKUnZpa1VuSi95RGpT?=
 =?utf-8?B?Tzg3NU1BVnRqQ0N5bVkza2xXR0lXeTBTODVKNnh0QUpLMENESjhMZXlwTTcz?=
 =?utf-8?B?Ym8rODNVMzJ2dTRGVkY3MFBWTVdSanpiZFVxWit5dHVFOEZvMlRaWXlzNDE5?=
 =?utf-8?B?WkV1c2hFODNkcHFmYUVqSVhzV0luYlVhVHBCeXdIUksvMWRCWTBRSUtHVjU3?=
 =?utf-8?B?RFRjWDkvMmcxNHpIb0RtLzhRd2t2OWJmMzErRm90bUFpVDZkYWZKMkV6MW5p?=
 =?utf-8?Q?lMOyYc/2ybQzY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnhOSXVUeStWQ3NwUTRvMzJYUEF2d2ZOYVJrVmxaSk5MS3VsRkVYeTVqL2pX?=
 =?utf-8?B?Y1V6Nlp0UDFodkVtcTZZQm0xRnBZQkNXMGJzOENTYTZQQmVNNWYwVllRTjdT?=
 =?utf-8?B?MDNXTFJFSFpodG9YMHk2c1AzMnpYM1FWZmxMaTBsR1FIemoyVHRRdEZEeWI4?=
 =?utf-8?B?emxXK2pINUlKakJoTTRUS3F3QkZKN3V6c3NDT2VOSkRYOHdHZDB2TFR3cFNw?=
 =?utf-8?B?K1pFWmR0RlJpYXp0KzhtQVNaTGp2TE9oZTR1RDJ5U0dsSzZZaDgyY1R3dHlN?=
 =?utf-8?B?SmVTa3d2VVFkVGpqZWRVM0FPSUF5Y1N4ZDNjdWNlRENPTHduUkNTU1o4Z0Ja?=
 =?utf-8?B?WnVKUTdNNUs0WVk5VzhSWmlqQW95YzQzOUVqS2lUaW1rK0lmTGpXVVBrbks4?=
 =?utf-8?B?Z2hkelE3Vlp5US94dXRkTGRjUXBVWDRwV3FSdG1YRkNkbDFHNCt1R2ZvUUdj?=
 =?utf-8?B?RHlQWWFMb0FEa0JUUkI1dWN6UFFsd09zTmFCSGwxZ3U3bDU2emdVWlVLU25E?=
 =?utf-8?B?Y3RaSU4zcUM1cHVxci9xZ2VXcW0zZW1qbmMraEQ5RkhOYWlrNkZjTlR5VEgv?=
 =?utf-8?B?Y3pNb3dlTVNkM2piQmtnOG10Smd4MXV0a3hUaHFYRXRRWTZOWUxtNmZsNXV2?=
 =?utf-8?B?Qmh1dHgxZzU2RFhPdDhxNkhTRWNXWUt3UXRIemV5NlJuVjF2djBxWnNibUVV?=
 =?utf-8?B?ei9ScjlBSVRZemZkQUZDa3RpVEMzYzRUMERQWmxPK3NBUGNPaEFELzJHWUhZ?=
 =?utf-8?B?bU1GVXRiVHFzYjlYaHdHK1VxWDZoK3pmWUVicUE3Yzh0K2JQRDNyc1dJK2FE?=
 =?utf-8?B?Z3hJZ0ZWMmN3cGUrTCtRNmNkSzY3WExOV2UvVjhaZmttS2JVczZiRkRLUFdl?=
 =?utf-8?B?NlpodW1QNnVraFpoMVQ0bkp1NTRoM0lFMVFzU1JUcjh2a3MyczJCQXBtaGs1?=
 =?utf-8?B?NjJnSG8xck5Qak1lT1JndlZ6bXo5TUVMd3E5dzBuaWRxOG1XK0hFV3JQUnpN?=
 =?utf-8?B?ZWJXZUVJWnZHT1VFLzlnTEVPWHlkNnpRU250ZEdNbTd6SVc1RXUrSHJwSERO?=
 =?utf-8?B?L3VwU3VyYkMwUjcxbU1kWkRRNXdYZjFXUytheGNIWVphdzluSHFPKzB5YVJN?=
 =?utf-8?B?eUhpN2N6OW5HSm1ab0t4MXpMTi8yTGIvR0hRT1ArVjY4L1dockt5L1J1M25I?=
 =?utf-8?B?MFRFUU4wbE0rTGlPbjZqOFpUMjV4K3dMSlkya3p5TmVzWXFQakdNMWhGLzYv?=
 =?utf-8?B?QUVOMUlPR012MTRHTyt4T29LV1g4RmVkc3prUDI3RlBOaFhYZENWUmZPOUJJ?=
 =?utf-8?B?Y1crL1EvZnVkYmVnZDRVTGFSQ1Y0Q24zb2JERE5RamtjNjhZTmdTNitpWStN?=
 =?utf-8?B?ZytCUWo3SlFMN2JiRmovcjlxUUxLYVNwK0pJZmNKUndFSEZqRlB6cFhQR0o0?=
 =?utf-8?B?NWhiL1p5Rlp4dTVUV2JtRUIvN2xkSkt4Mk03SmVRQzNIYUxpVlcyblFxbkhz?=
 =?utf-8?B?bHpncGpDcGJtVmN0dGNFZXJVZk0yUEFXSkowMlpKL2xJZlNJY1pQR2kyUmpP?=
 =?utf-8?B?WFFsbkJZeENHQ29oQU9UUTV6UG9Hc1hmRDNJUkxCUktVM290UEp2R0F3aDZw?=
 =?utf-8?B?a21mNS84TVUxQzhVMzA1dWtab0ZnUTQ3K085WHNkU2V3Z0Iwc3QvSHEwM2NH?=
 =?utf-8?B?SFRoWXZqVU5iM3llc0FUV0lnYlNTRFcrRFRaejVJNlM1RVJMRVY0TFhZNVE3?=
 =?utf-8?B?VUdRWHE4VjZlQUtRSG9XUU5SV2czdmRHQWxnUmUyUDFZWnJsc0FoaE9ic200?=
 =?utf-8?B?NGh0MmIwc3p0dThRVlIyUGk5ZnFIWlgzT3RHNGxiamVZL1dEcTF1WFhuQm9v?=
 =?utf-8?B?TG55RDUrNjIwYVNBNDdyRmdsNUtDcDlGQ1NudEh3anpHWk5CZkoyY2oxNEVL?=
 =?utf-8?B?eHVHZlgwaTFJVHA1K0I0eXpvazlOZ3FHb2FOWUtoM3RNVXQ3QVdaZTFhdExt?=
 =?utf-8?B?aFpqMEFYQUlVLzJzeDhoU0xVRGMwd3JLMjlRcmJwYzJLWnNjZ1pTczU1c0tk?=
 =?utf-8?B?dXNiR0s3TG5TMXFzRURpMnZlQms1NUZ4RmpDa1oxZVJpM25yRDE3VHBmcTVa?=
 =?utf-8?B?Q0x0dGVTTXhFMkdaRG9yYTdiMjF2a0Jac3ozZ2dLRHdUSmpqNitKK0xYQW1j?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dab71d7-5a7f-4ac1-8b15-08dd4e7cd853
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2025 11:27:07.2846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFb5WtiaMh8bqvJVFa4YUWCvb66gC11dNmv9rx+wFnPNNNn08OlL6IPX/8he3t55TevciYv7/Ta8L2jURibyJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7385
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

Hi Riana,

On 12-02-2025 15:28, Riana Tauro wrote:
> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
> Functions to parse event ID and GT bit shift for PMU events.
>
> v2: Review comments (Riana)
> v3: Review comments (Lucas)
>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   lib/igt_perf.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_perf.h |  2 ++
>   2 files changed, 72 insertions(+)
>
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index 3866c6d77..f021fc3ec 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -92,6 +92,76 @@ const char *xe_perf_device(int xe, char *buf, int buflen)
>   	return buf;
>   }
>   
> +/**
> + * perf_event_format: Returns the start/end positions of an event format param
> + * @device: PMU device
> + * @param: Parameter for which you need the format start/end bits
> + * Returns: 0 on success or negative error code
> + */
> +int perf_event_format(const char *device, const char *param, uint32_t *start, uint32_t *end)
> +{
> +	char buf[NAME_MAX];
> +	ssize_t bytes;
> +	int ret;
> +	int fd;
> +
> +	snprintf(buf, sizeof(buf),
> +		 "/sys/bus/event_source/devices/%s/format/%s",
> +		 device, param);
> +
> +	fd = open(buf, O_RDONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		return -EINVAL;
> +
> +	bytes = read(fd, buf, sizeof(buf) - 1);
> +	close(fd);
> +	if (bytes < 1)
> +		return -EINVAL;
> +
> +	buf[bytes] = '\0';
> +	ret = sscanf(buf, "config:%u-%u", start, end);
> +	if (ret != 2)
> +		return -EINVAL;
> +
> +	return ret;
As per the function description it should return 0 on success.

Thanks,
Soham
> +}
> +
> +/**
> + * perf_event_config:
> + * @device: Device string in driver:pci format
> + * @event: The event name
> + * @config: Pointer to the config
> + * Returns: 0 for success, negative value on error
> + */
> +int perf_event_config(const char *device, const char *event, uint64_t *config)
> +{
> +	char buf[NAME_MAX];
> +	ssize_t bytes;
> +	int ret;
> +	int fd;
> +
> +	snprintf(buf, sizeof(buf),
> +		 "/sys/bus/event_source/devices/%s/events/%s",
> +		 device,
> +		 event);
> +
> +	fd = open(buf, O_RDONLY);
> +	if (fd < 0)
> +		return -EINVAL;
> +
> +	bytes = read(fd, buf, sizeof(buf) - 1);
> +	close(fd);
> +	if (bytes < 1)
> +		return ret;
> +
> +	buf[bytes] = '\0';
> +	ret = sscanf(buf, "event=0x%lx", config);
> +	if (ret != 1)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>   uint64_t xe_perf_type_id(int xe)
>   {
>   	char buf[80];
> diff --git a/lib/igt_perf.h b/lib/igt_perf.h
> index 3d9ba2917..69f7a3d74 100644
> --- a/lib/igt_perf.h
> +++ b/lib/igt_perf.h
> @@ -71,5 +71,7 @@ int perf_i915_open(int i915, uint64_t config);
>   int perf_i915_open_group(int i915, uint64_t config, int group);
>   
>   int perf_xe_open(int xe, uint64_t config);
> +int perf_event_config(const char *device, const char *event, uint64_t *config);
> +int perf_event_format(const char *device, const char *param, uint32_t *start, uint32_t *end);
>   
>   #endif /* I915_PERF_H */
