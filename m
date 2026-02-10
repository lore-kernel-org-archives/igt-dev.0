Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E455AEE6B73
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 03:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD3810E1D7;
	Tue, 10 Feb 2026 03:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSnARRPf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB7110E1D7
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 03:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770695988; x=1802231988;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Q+CG2Dsm7WyT2eYhUhwivtd2GbSU47W7MU3NF6UyqTU=;
 b=kSnARRPfe5PmgB6FTF1Mi6a3iSO/qO6xGWc4oX6DCbLs8EPDDNetymNe
 pRjHpfVNCCyUhWO2bQuGGObybuxoAyIR7YRLxHP7yIDEKPqeL7y6nHM1x
 f42IWGGw7oWYq2trR7eojCXJ09DsJ4g6+zV2iTSLt7/uGbCc6TFTD8CQz
 mMeykFjFN2vDtIlMms3tyHkr4Yhh8Mw9pcWwFboEgyCu2fo6Ehp/pSD+i
 e5pL6R0TNqUGpCN2j0w3nMfhOIbEG8mJPeqltu8KgQIx2u/X1Rx5/dGlc
 O+B8LMNV+Y2cAs8ked/IMLq6tZk5+4tgyg/G/aZ4VTr7hzV9UrMUXj/XY Q==;
X-CSE-ConnectionGUID: JEd/Q2JxQ6O5vYSB6/r0DQ==
X-CSE-MsgGUID: kbC0xXuvTo6r8Vvp3+VxUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71715502"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208,217";a="71715502"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 19:59:48 -0800
X-CSE-ConnectionGUID: 9CA6xxF3QdKjkxk6aq7Uog==
X-CSE-MsgGUID: H3VU5GjaTBWP+cLC8u2b6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
 d="scan'208,217";a="215961202"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 19:59:47 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 19:59:46 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 19:59:46 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 19:59:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5QVB6B/YYZyTPOjpky5v4gTxKMtkOXaPqFzt1NhWPJSTTiDQ4oVs9Q7L4lphSGhKwkhhnbEyfx9Vj8cQp/n3k2AyPvS9TvyM6Ang3NyWQAuTvKD7LwJ9GfahVrnSeLBBLbTIKsB8/qITKRDS9TI3b+U6wXpx3v+a/xKBim7OF937xjRKiUo8OlYZb6B8RaQxLNAXetqzQeHb5ybUQR/Jk0J3qxH0RKHhH2KtUk94WOP9fpHe8YSxoX+pLcBGcyuUIztIvpJw7nfxjRKuj+ofOQpD25H0DQhO1akG8ZWVmTbLIffPpAXXvsvRm5e8/I7+FRNHC2mOk+UQEI2hd3K7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xwgiix2FiQDTBL59QiEHFD7trnNdCwKoMQqr9Tesbz0=;
 b=lER+IT4KabxVofcSnSMIOqWhlENyLIZ7BugXXSME5fJQ73zixdHAqbXyyUKyvow4o+YMKjOPARWsqbnbVbH9nIJgIpdL0idrr50J3A6cPB8Q9+bUUghLAbtM6Mt70BeqW/ozDc/YOZCzO0IAs75d3aP4lQfJEmip+cVC+PXvEdcP4C2kGiCQH2lBP9P2ev2Tt+TQn/UrDec7vlskdqtWpwKtWeLv0hpl9dErjmibb0RHXrqEHlxtUwwEykSvMMzcgPPCItZR0bNYvF6MpkvkSZl51aadgPw3P1V1v41EndexDbxdwJqg293XFgNEEu5+6lknARgrO+lRP+9ITmX+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20)
 by PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 03:59:43 +0000
Received: from BL1PR11MB5253.namprd11.prod.outlook.com
 ([fe80::c721:b1ce:dcb1:11e1]) by BL1PR11MB5253.namprd11.prod.outlook.com
 ([fe80::c721:b1ce:dcb1:11e1%5]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 03:59:43 +0000
Content-Type: multipart/alternative;
 boundary="------------dZ8tI6i1M3JnyEQ2nsLjDnJG"
Message-ID: <baf4c410-08de-4008-b5f5-5d21c66fdb20@intel.com>
Date: Tue, 10 Feb 2026 09:29:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/2] tests/kms_plane: Skip cursor plane for
 source clamping
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260209083331.1088550-1-pranay.samala@intel.com>
 <20260209083331.1088550-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260209083331.1088550-2-pranay.samala@intel.com>
X-ClientProxiedBy: MA5PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::16) To BL1PR11MB5253.namprd11.prod.outlook.com
 (2603:10b6:208:310::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5253:EE_|PH7PR11MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca22ed9-85be-4842-bc95-08de6858d291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UThVZ29kZ2RrYTBGSXVHUWZxZ1VieHFhL1JhcEZndFgrQm5Mekh6NlFOcmo0?=
 =?utf-8?B?KzRpUStBbWN6NkVnTUZ2MHl6YTFnNmpvRDRBdXlWc2c4S2cydjRMUWRqOFdv?=
 =?utf-8?B?dDFIMFg4blVhL2pOajVUU3FpaE9sMDFoOWlVemoweEpsU2ltRkhidW41Y3d5?=
 =?utf-8?B?Mm9WZU1JZ2hBUXN6WE9lYUJmWGM0SlVlTmY2R3VUUS9QYTZlUnVQSEtzYWY4?=
 =?utf-8?B?RmJlaGIvZkluaFNmamk5eVY5ZWRaSmgvV1lnZUNXWUpRSG5IZURhQ203cEYw?=
 =?utf-8?B?b0llQWFMbklsWnh3TjVxK2pmZ2d4eWRlMnBERUtURXUreVNLcFA0SVpEcWpr?=
 =?utf-8?B?Q3lhRUVjV1BUZGloUFUxaElvUzlZZmUycWlVd1AyeGdmNnhGbyt1NitrSW9v?=
 =?utf-8?B?cDB5K3JBOEFTZlRWMWY3RkVnSFFoMDlSbjhySkNjRDhwSUZTL3RPRG8xdlgx?=
 =?utf-8?B?N3oxQWFlNjNhRUNYeTBsdHZrSFhSb1VSMExlTHVnT1YvalNzYU9YK1JVREtT?=
 =?utf-8?B?dDlNTUFlckVFb3VBMmoyVVpYWExnVkR1L2dOc3NPQ21sYU8rVm1DQXhmQzlD?=
 =?utf-8?B?aDNPd3pDYlZ4Z0pXa1ZCWlN6NlJCRGx1UnhUMjk1QXh6SG5jR1JNMkZ3YUV6?=
 =?utf-8?B?MFMzd1d0T0plSGZjKzByYnBGTEROQWY3RHpBdmR6NEFEQU5mSlpOdDN5eTFh?=
 =?utf-8?B?RDBoczBrUXp5TGtYUzNIRlY1eVRCTm1ySFJ0UXU2czZJSDNNaG01ak15WDgv?=
 =?utf-8?B?a0I0S1paTEVaeThBM0gyYjlVb1JwWmN6K2FvOTZianFXN2pTemc3dmVobDg1?=
 =?utf-8?B?dklaSFZONkhtUENGaUU2ZFE1VTc0dW1IVnlzVkdvRkUyWWF5UVJGeXBoZThx?=
 =?utf-8?B?NGxmOVUvWEE4amdHL0lNeHVxSXFHUzdPMmY1cWc5MjkyeTBnd0xibi91alJp?=
 =?utf-8?B?bzBTaWo5L2FiT21rNEhVL3FzWnlSYVc5VXlXM29SWncxZC9Ua3lSZ2FDZ20z?=
 =?utf-8?B?MzJ4MGVwV1gyc3drY2h1bmJMNWVhUnExeERVQVk5TEZ5cDN3TWFnMWQwRzln?=
 =?utf-8?B?eENLWFhVOGtqemtaVXBrZE9QWkhKbE8rU0hMS0tFLzlyWEtYbVVpQ29Pczk4?=
 =?utf-8?B?eVEzVUJaMWVZUXRObHJpR0thWDByM1UrRkNHUGViK3pMelgvTm5hY1BWV2JY?=
 =?utf-8?B?enlETC9VL0RDeDRCekxhL2p5V084M2c1MWpibzFEdmtqUERiSnlJWS9ZdmNI?=
 =?utf-8?B?Y2VBdDlkamVvSCtMWjk4bVZZcXhLTEU4SWFSeGlXNERQeWRqRzY5ZUMwQVRS?=
 =?utf-8?B?ckIyMXBESjFvZmpBWXNkSExZVGRBWWdLSzdRUEdwbWw3MUU3dGh5bkJDMXJk?=
 =?utf-8?B?cE9BYWN4M1hKTjl4bWtKVWdLVWxXNngrcTJGY3J3blVlbU1qcUlsZFl5TGd2?=
 =?utf-8?B?VGxHbVlrdG9vNGNOR3RCSDEydnlDZDlvUkFCNGlVT1ZiTDY5Sk9ENzFQemhz?=
 =?utf-8?B?Q2ZMdGNpZ2pXNmVwZG52UGdSa21LaUFLRjBLN3huVjB1SVYzRG9EVDZXUUt6?=
 =?utf-8?B?MGxVZ2R6WlpacEg5dnRRMHBuaU5HY0YyRUs3bUp0VTNVVzNhZzRXSkRCL3c5?=
 =?utf-8?B?cDJqd09SaHI2UjdNY2pDb3o5TUdHOUJFdXE5QmFmZVlVbWNZdFl2MHFSYitY?=
 =?utf-8?B?Zzh0L2VyTFh1cVpmNjQxcDcwbEtXMnZVUG4xZm03YkJOcDJNZEE4MnllNi92?=
 =?utf-8?B?TlhvbTdUZjU1ZDZrcUROclRXS1lVSHFDUG11amE5dVc3TGRtTktxNnJ1RHpL?=
 =?utf-8?B?MFJsWk14U0VoWGZhVjhDNTh3Nm9vMEExWHZCZUFkdlFuV2pub3F5c0pMZTFt?=
 =?utf-8?B?WUV0ZXM0Ymx1Zkg5aTFYK0R6OUdPOVI3c0Y0VVVudHFoK28zMUF2VVdGNC90?=
 =?utf-8?B?b1JlQ1BTeXpYcFJiWlAvK0REQVZzODBuU3JPUlE4RkJodFJZWTg2anhwVWFJ?=
 =?utf-8?B?bUY1N1FhRXc3RnVHdWZGUkthN2dIemVCRU1KTVZlY3F3MXhKeU9Jd2lPYjQv?=
 =?utf-8?B?UEFmdTE0SFI4NHB3dEFZRFNVeUhQQnJNbDcrNUJQNDJBTnMzMG9BbTNrclI2?=
 =?utf-8?Q?UDn4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5253.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1Z6dVc2djl6Tm5md1N1REdjK2RpZ1hMVVVmdkxwNjhqNXR3cm8yZEdwUURx?=
 =?utf-8?B?ZEdhZW5kWlVlTitHZ01QTUlMcUxXZWFXMU83UktFUG42dUdiM2V6ZHR1OERB?=
 =?utf-8?B?b3BUTlZzdW0rdW8rRWlnMmVUZUVIaXgyckFhQmZ2bTA5Ri9LcmU5ZjZtT0xV?=
 =?utf-8?B?V2M4MEhhZGV1UHBPeWlsYklNa2dGaUw3bEVWZ0d5WitJci9wQ25hY2k0Z0pl?=
 =?utf-8?B?Y09GU1hXVVA3YkxOS1RQeGVreUVnVE0xLytBaHhDN2taeUE4WnVVTUZxQnIx?=
 =?utf-8?B?eDREcHlKdDNpTytzTEprU0pGbWpUQUZlejg1LzJ2eTVjRS9wdis5L2xYUllQ?=
 =?utf-8?B?R0lpSStYc3poaWNVbzRiT01aWWJSbTRFZUlOblBPTTdZdE01VlRocDZuRWJt?=
 =?utf-8?B?cDE2c3A0Y2wxWU1PQWQwbHRvaDJNbEg5em8zb0dPZm84WjZwcWN2akRmYUtW?=
 =?utf-8?B?aERORGNYQjhyY0I1RklBZW96bk91MWJuMDdnNHAzMEZ3YzU0dmh0c1RqTHBX?=
 =?utf-8?B?SXZBNEJnMHZkeEdZNWhGQnNkMG1XYzc0MDh5bnJtWXRZVzFhL1VLN2JhWGFl?=
 =?utf-8?B?a2xieDA1NmlTYnNrWlZlcGZPUFBJS2VSb3dsVm1iZkpwSFo1YTFIYVBleUFE?=
 =?utf-8?B?VGJFNHIrQ3lkaFhVTFU5SWRSTUdCMkVmNVV0aFQ4dm92Y01sWk1ZYWQvQ2lC?=
 =?utf-8?B?dS95cyt2MUZNMDRhMG52YnhMNklRUzdlWG4yWWlkN0dZZ284TDlLZ1o4NlRO?=
 =?utf-8?B?YVNNT21vajNNRTNkeUhFM2hkTnZwakcrMjRRTFhQTklIRlk5ZEdraWtLTHVz?=
 =?utf-8?B?NEJRYTZtdTJGY2prT1lvRTNiQ0puaThHVWk3ZzFiclh2bzJ1cFlHNnpQaEY5?=
 =?utf-8?B?dm9IeS9NTHdBcDNmVFEwakNHdm1rRURDem1lVjJGWlJjbk5yT1RGTmtzZ3kx?=
 =?utf-8?B?NWhNU2hsQktRVU1FcE1jNFc3R21KUk9PMXlNK1F3WUhOdmxaZzRSa25YSU1y?=
 =?utf-8?B?alJ5b3VjTnJnbk00bVlYUVBOOTN0KzhycVFaMGlIZElXWHhEZUt6Q0NGSGlB?=
 =?utf-8?B?V2d5TUt4ZEU3cWtScnU3Ty83eW1GTXRuNHc5UGNQV0ZoV2UrSzdOVlJsZFla?=
 =?utf-8?B?cTBnVXgza2NCeVdZMmZ3ajczNkhUdjUxRnZPd3dIQ1krYk5CV0pIT09rbXRT?=
 =?utf-8?B?dExnTXVKTHB4NUVQSG5Sa2tmOVJGOURuSnBhRDhSYkhiSkVYWU1Wcys5RnRJ?=
 =?utf-8?B?dk52a293SC9IRWdwOVlxR21YSU8wZkJaaUpBNmpLU3NvZVl5dzRwU0ZIUmVF?=
 =?utf-8?B?aHloYU5YT0FEa2JVQ1hFSW0rMVNyTHIzeGZCaXFxUytPUXpya0xDSHJUS2l1?=
 =?utf-8?B?SXR1djBzSFg3RXUxT2dFYitZSWs2QXBvNTRzdzRqdElWNDJtdzZJc1hROTJs?=
 =?utf-8?B?Y3E4SEt1UkVTRytQdWV0MzYrMjZaT1FRa1FTc00yMWttdzZlWm5wS1FiZG55?=
 =?utf-8?B?cnowVkVDU1phNms3REdTMGFVWHYwRkVwbDJLWDNMMVZjYStFUGVvK3JheFU1?=
 =?utf-8?B?REZRbEcrQXF3aXB6MDNlUUw5RXVsNGk3UW14ZGhYVGVNaS8wZUFhK25sK2x6?=
 =?utf-8?B?ZjRtZW9rT1NhU1dZVStNeVgrQWxHSWVVV2tibmJEWXFlNWhmSVZzNDNCZDhw?=
 =?utf-8?B?MytrV1Z0QkRnbVZSaCtwRkdINTJIWHg2Q3QxWlF3VWY5K2JsSzd3akhwWWZ6?=
 =?utf-8?B?d2k3bk52MjR5MStCdFlsbVZRVnlHWmtSUUZMNW9OWDZxSHprbERHQkd2dWVT?=
 =?utf-8?B?dUJLcjlJN3cxcS95QnZjNWhyaGVMUWV3UUcvYy8wZlpNNU9UN0NER2d6SE1j?=
 =?utf-8?B?dTF2MExybjk4RWdrTHJ4VVc4MjdwL2U3VEhINGlUOENpTFNlaDZZaldsNG9x?=
 =?utf-8?B?Q29xb05uTDBYNjVrVno3OFV0SnZsK0d1K0lVMkNva3c1Ri9nYWxYZk1HbG1S?=
 =?utf-8?B?cFJkenZDZ0szeHBJd3JBdmdXV2orbWVERFl6eVRuNVZhUUwzOUoyOUYrZktK?=
 =?utf-8?B?eWdjTGNQc2JtenFnbU9JUm5yaDBVNWM2UGk1Y0RCc1prNTB1T0I4clNRQzlz?=
 =?utf-8?B?ZHhldVVVMEFTd3YvSzh4c0cwc3ZuWUNuM3JLaGpYSC8rS3pCa0llbFhLU1NV?=
 =?utf-8?B?TXZGTXZaL3FlU0RpUWZNdmR4Q25oaUt4SlN0SFlwTVF3cDE3Tmd5b3VWNTZD?=
 =?utf-8?B?WDdIUyttb3pDU2t4UXZPV0FqQTU0MjhhMmxUd1M1WDJ0SWxuSTJoMUp2R1Jy?=
 =?utf-8?B?Y0JKSDhnakRuZnFadENIY3kxTW1ON3MwTUNmRDdsRFZ4WmNtRnRYdVZrVW5a?=
 =?utf-8?Q?egIFOWjMa+uOW7GI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca22ed9-85be-4842-bc95-08de6858d291
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5253.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 03:59:43.6088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbDx/qL2mHTQ7Sf6Or9mK2OIH6S4uFuztgt/QqQPu5q3nwb0gVOkIE3EUb5gbb1oALDnc87nL6aZXj8Ed3REA8hhvAcFVeAXLzI/EGFzEeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6451
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

--------------dZ8tI6i1M3JnyEQ2nsLjDnJG
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pranay,

On 2/9/2026 2:03 PM, Pranay Samala wrote:
> Avoid running source clamping tests on cursor plane,
> which do not support clamping.
>
> v4: Add a short comment (Jeevan)
>
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   tests/kms_plane.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 2be10f032..22c45ae5e 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1090,12 +1090,6 @@ static void test_format_plane(data_t *data, enum pipe pipe,
>   	bool result = true;
>   	bool found = false;
>   
> -	/*
> -	 * No clamping test for cursor plane
> -	 */
> -	if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
> -		igt_skip("Clamping is invalid for the cursor plane.\n");
> -
>   	for (int i = 0; i < plane->format_mod_count; i++) {
>   		if (data->mod == plane->modifiers[i]) {
>   			found = true;
> @@ -1288,6 +1282,10 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>   	for_each_plane_on_pipe(&data->display, pipe, plane) {
>   		if (skip_plane(data, plane))
>   			continue;
> +		/* Cursor planes do not support cropping, skip generating subtest on cursor plane */
> +		if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
> +			continue;
> +
>   		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane->index)
>   			test_format_plane(data, pipe, output, plane, &primary_fb);
>   	}

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

--------------dZ8tI6i1M3JnyEQ2nsLjDnJG
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Pranay,</p>
    <div class="moz-cite-prefix">On 2/9/2026 2:03 PM, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260209083331.1088550-2-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">Avoid running source clamping tests on cursor plane,
which do not support clamping.

v4: Add a short comment (Jeevan)

Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 tests/kms_plane.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 2be10f032..22c45ae5e 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1090,12 +1090,6 @@ static void test_format_plane(data_t *data, enum pipe pipe,
 	bool result = true;
 	bool found = false;
 
-	/*
-	 * No clamping test for cursor plane
-	 */
-	if (data-&gt;crop != 0 &amp;&amp; plane-&gt;type == DRM_PLANE_TYPE_CURSOR)
-		igt_skip(&quot;Clamping is invalid for the cursor plane.\n&quot;);
-
 	for (int i = 0; i &lt; plane-&gt;format_mod_count; i++) {
 		if (data-&gt;mod == plane-&gt;modifiers[i]) {
 			found = true;
@@ -1288,6 +1282,10 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	for_each_plane_on_pipe(&amp;data-&gt;display, pipe, plane) {
 		if (skip_plane(data, plane))
 			continue;
+		/* Cursor planes do not support cropping, skip generating subtest on cursor plane */
+		if (data-&gt;crop != 0 &amp;&amp; plane-&gt;type == DRM_PLANE_TYPE_CURSOR)
+			continue;
+
 		igt_dynamic_f(&quot;pipe-%s-plane-%u&quot;, kmstest_pipe_name(pipe), plane-&gt;index)
 			test_format_plane(data, pipe, output, plane, &amp;primary_fb);
 	}</pre>
    </blockquote>
    <p><span style="background:white">LGTM,</span></p>
    <p>
    </p>
    <p style="margin:0in;font-family:Menlo;font-size:9.5pt;color:#333333"><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20260209083331.1088550-2-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------dZ8tI6i1M3JnyEQ2nsLjDnJG--
