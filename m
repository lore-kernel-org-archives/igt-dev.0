Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FC1CE8343
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 13:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59B210E4E3;
	Mon, 30 Sep 2024 13:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dEuv+TS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A96410E4E0
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727703367; x=1759239367;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8HA3MvauLHE5t8M0bjkbEc1LmhujpCUZ2XCvwhA/+/4=;
 b=dEuv+TS6SnM49SqvRWHC/8WJy7+DwFb+4dpiFErFH2J5RZy2INrf827d
 rG/gPmmY/OrjbEtdp5jfbSUmyzcGgnS0zht4uuiPFC0vPH3Yo/WcPcK32
 pqeJz7vxtBVL3I1kKZReoC3VLqKdFUSB5QQJgI1skVTMKgz3WJXAkZ0Fp
 GZgYUouVZrJBldJMPZXdot8j4v2q5mw+Z5ET6Go3E3aaw5Dz34SWHdoQS
 4xM2EpBqAiGJEasnTvzEVcKee9zrohaAEVjW0yG61ZxPCyDvTyhuLN+rr
 QgWFakpeBkySfpmno/NFVvG40A5rlSwRiKv2ReNQx2I0St7KVVmZ+/hUX g==;
X-CSE-ConnectionGUID: 4rUcruo6QmaB95wQm7Oyuw==
X-CSE-MsgGUID: rpPfOLVMR/G2MhMNctTRwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="44311919"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="44311919"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:36:07 -0700
X-CSE-ConnectionGUID: togH951DTjKpnK4EMBo7UQ==
X-CSE-MsgGUID: GNFa/abETiqhA13RuhtjRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="104107959"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 06:36:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 06:36:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 06:36:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 06:36:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 06:36:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5pPSuiAAxgibqVxruPp6FbF+JYQGpSCX0CgMcBprPsMzjkXAG7zlUks/dItVuCM07hJRh9pHDjYybbyPHJvDJzjoXl+W08U08bcQkktO5SQCNKF1BQBd2cdDTiudePklws37mvoZD6uRL3jDkhS2RbWfQHgpGvqlAyFn0BG5YAPvkzezHVBr6YlKaskN5NYm4Y5qmcQ5g7JtzDVKZfzEhmKCecCyigeOy4X45SUe/FlM2PsgtKnJKDIOQ42Pw9IJdJQjsWRiXANiYgHTRsnGlGS6e/8WosKtRsuk7tf0vjW7aqiLbjVTx8rSbgb8HTsMife/cECkofaG8Ks4HtrPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HA3MvauLHE5t8M0bjkbEc1LmhujpCUZ2XCvwhA/+/4=;
 b=pNFFPfsdeRhlBwMi8e+730rOUkbcvCQAP4EqSagedieMMo96WG5zPYw9MwPtJtKpKO0e7L2YsBRwtHlgbjyHo+hMnmnGLqH9brlBOtEKjLDVyi7NLM/58SaOqyKBS/YtNfdu9WLG8JAQBAgp+TUoZ57QST6HSXo9EgAL6J3aq/GCKVLNPqhLPJEFxyvdHCHTngMG639u/hAsdkP06vystcCaDY0jgxpDv5isLuGF28/q+Y5vtV3FnubSGBgSmV1NPzP8tajPfZ0smbv3d+UZaho70iPyiVPwEt9pTOEadqdVs5AzT5zi7G4sB0RLKFyiDHb3LUQlM7pkLrnKfeSqUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by MW4PR11MB7008.namprd11.prod.outlook.com (2603:10b6:303:227::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 13:36:02 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38%4]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 13:36:02 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: RE: [PATCH] tests/intel/xe_tlb: Add test to check TLB invalidation
Thread-Topic: [PATCH] tests/intel/xe_tlb: Add test to check TLB invalidation
Thread-Index: AQHbEJWdtUf/oiINe0inMP8l+u4PDLJrZnaAgATx2tA=
Date: Mon, 30 Sep 2024 13:36:02 +0000
Message-ID: <BL3PR11MB57475ED384A5EC42C94755AFD0762@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20240927043544.1782340-1-sai.gowtham.ch@intel.com>
 <cee2c2a5-96f5-42ee-a066-2ed76979ed49@linux.intel.com>
In-Reply-To: <cee2c2a5-96f5-42ee-a066-2ed76979ed49@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|MW4PR11MB7008:EE_
x-ms-office365-filtering-correlation-id: 970e4a12-a9cb-4a9f-14d0-08dce154d378
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?T0p4Yks3N0J0T0hjRzJDNkdrRTVWZGtJanpXMm5Xd2ZRbVVDdm10UkVVT01p?=
 =?utf-8?B?NDZGUTVJcWdaTWptcnphM2hmQjdNYUdPdnJJZGdsMS9BMTdXdHc3Qkhlb1RX?=
 =?utf-8?B?TENzQnpDbmc3bU9jOUcwT2M4TDZXSEpRNVZZSVJPUXpoTUR3VnFQT2Zna3Qw?=
 =?utf-8?B?RmZXbHFxTW42L2FJbERrSmMwRStZUlc1U2ZkRitKR2J5cEpJVGtOSzNqZitS?=
 =?utf-8?B?Tk93cCt6VmVGOEFFbFYzZGRKWlpXa0ZKMnZRdnlKNlNPb2hrbkJkMXExZlBW?=
 =?utf-8?B?dWZqcVdxVGtxWVZXNTNSVmxLVW0xREZOUmJnVGNWK2oydExSbVFjK1duRk5T?=
 =?utf-8?B?QUR6ZTRyTUNwWWpCRVhpbUlRQ1NyNVJTeTZINUxUWXBwU1ZCZkdJNks1YzVZ?=
 =?utf-8?B?VG5lbHBOQW43RUxKeTBzdVU3dDVIdUx6RkwvYU5iT3E0Z0hlb3pSWnRubm9w?=
 =?utf-8?B?RXJTZUdGZmlUQVlGeWJXVWlFcmRqLzBTQnJYQnNURmlnS2dpMVJ2aHdiNk0x?=
 =?utf-8?B?SEYzUFVuQmJTTkZ4T3pFMjJVNWRLei9aTXVVOU1CcXl6VDRPd0FoSlNtcCtB?=
 =?utf-8?B?K2dXQmJ4S3crb0k3M2RVTGJqdTJqYTFPd3JIaUUxcXpPQ0JhQjdsa1Q2QkpG?=
 =?utf-8?B?OXZML2ducWNUdEhrMlNERFE1QklvWlhIM3VsdDBVK3Q3eHcxZlRHR1U4b3du?=
 =?utf-8?B?cWx4WW5yMjZpNGI1cDRYMDRTLzVacEFoOGVOazJRNW5laGdhRHlDaDJsekpD?=
 =?utf-8?B?MmFHdGJVa2YwNU9qcHBiUnZrRjRjaVJmVmcrK1dHeHVNZEdtamlnamtObnJj?=
 =?utf-8?B?TGl6SU5KcGplTVZ6MVdEVjhVTG1OS2NvMTNXcU5HZDJJOHdnanBKdnFGR2JX?=
 =?utf-8?B?dVJvWGZ2WFpmMUFoN1JNR28vQXMyTStYbDZCc3JlNVZUbW11U1FGRk0xeUtX?=
 =?utf-8?B?aWZIU2xoNDVPZi9nTk1udEtmVEJHRDNjdTNLQVhrclVBaU1ZZEcwdWVkZ0kr?=
 =?utf-8?B?dzZ5bWV4Mm9RNE1ySWlpNHgzRHhyS2RlR3ptenYvV1M0NzVnV2p4c0VIb3JO?=
 =?utf-8?B?SnQrUVliVFdySWUzcjNDVUxiZGVBakZqT3VLb1hhL1JjMVRSUGdlcEw0N1pI?=
 =?utf-8?B?Rmh1RFJqUTV6ZzZLeXpzeXFqclJOM2pOY1VTNnVHN0FzSEJDMVRMOTdlZ05j?=
 =?utf-8?B?RUZ5OWpFZTkwYzllbjFzMlBkd21QVCt4SGZyM1hHOW1YTENHMzJFVjl0TExk?=
 =?utf-8?B?aFFZOGR1L0ZMcFpsYUdQMHk3TWljL254S01wOEorWUJMZjB1YmZlYUYyc2Zw?=
 =?utf-8?B?Q0RidVErajFESlRTU3ZrK2pjUkdXMW0raWNaSW5zc3ZZTnRBcGFGS2F6dzJK?=
 =?utf-8?B?c1dNemFJaUQvUjg0aGo1RmYwcFQyRGQ2S2tsZm9FSm1mdUk5K2UzcWZoQzBC?=
 =?utf-8?B?MEI4SDlmRDlNbGxrcG8rZ2o4amlZNWFKOFIwb2NYVzcyaU9rWlh2Qkk3SllG?=
 =?utf-8?B?cUEwa1RyL3ZmR2lOQ0luRmhseWJvZnp6dUx4eWdJSWgwZlRWRFJxbFBZNEwz?=
 =?utf-8?B?TXN6YjBsNmI1dWdLd0NMbWtLeCt5WUQxZnhSVm84UG1BS2g1alZoS0FpSWJV?=
 =?utf-8?B?T3hvMkFYRDFSUGdvSzFXYk15NEU0ckNXVFY2ZjNmMkJaVm5VMU0waVpKNDNH?=
 =?utf-8?B?UCsvemFXcDBvVWxxNmM3cks4T0VoRjFWUW5uSVFXL1oybjBDSFJMY1hOM1FH?=
 =?utf-8?B?aHlKTmZVTTdkTkV5R3hGUVhOQXY0eHhjQ2hTd2xad3RtVCtRQVBwWkJhSkhN?=
 =?utf-8?B?V0VRQUoyd1JLWUQ5eG9WVnJiMTUzWWJQRFRzSTI0cWlVTkZZZFdDTXdld2xj?=
 =?utf-8?B?UnFsa2hRZmVobWZIeXlqdC9CblQzTnJMb2JzNjdTLzNiR3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHdnRkZtVTlFRjhoMjRoaXRYcGdaY3UxaE1FakJmK0NsWW03TE54Q2w0TDhq?=
 =?utf-8?B?S2kwcUhjVFFXc1l3V1FWTHlWZWtGVFY0RHFQdHJ3U3pLdW1lc2tBUkUzRE53?=
 =?utf-8?B?Tk5xVjJncW50YzZ4dCtVQUMreWkyK1dYY2JuRXYwZ1hXWklmQ2Y2TnJGRTNj?=
 =?utf-8?B?OU45ZXJTK3BHdG9oNjBHTTd0bVFkdTZSbjdxcHpMUE1UTDdVSFZLQjJFMVU5?=
 =?utf-8?B?UVh2QVRUMzBEN1dlbjVDSG9FQnRnRW5Ed1NPUXVmSTdaYXBHU0xHeThvOG1U?=
 =?utf-8?B?dG1IRlRYWkdrRHdRZnU2SUJpZ1BJU3VSNW9CYW9zQzVRUkVYVWR0RGpwNkFW?=
 =?utf-8?B?WnFlcm1jUjZrV1lKVC9weXpDKzJabHpMN1FCRndpWVdSNlROOEw5YW5wOGl6?=
 =?utf-8?B?TlBsaHNSVDdZck5pbzdMdmY0bkJuelVLVk9TN2R4TUNXa1JBYXZ5c1lkWXh1?=
 =?utf-8?B?bXlUd1NqT0sxT3k0M0NEeUlraUtFQ01RUzhuWG9HMTRHSnRaNzdhNTRRSVlw?=
 =?utf-8?B?WmFyeUsxTG81Nll5WndOZ3AwbFkzb1hhK1ZSd1NTMCtIZU03emFLMFJkZThS?=
 =?utf-8?B?SWducEpqNVVvUUpvaHV4UlJhR01PL3hMWGRiaFJaUVVMVFdOMTBCSjllU0NZ?=
 =?utf-8?B?UnZOdy84N2UzemduS3QxdW1sY3ArS1FTUDdsNlkyYVhyZDg4QlE3T2xCZ2dn?=
 =?utf-8?B?Z0RWOTh5TGh3QWRzbVV4SkdMYVlnQzhnM0x4aDZxNDl1VGJnQTI4MTZqQmNn?=
 =?utf-8?B?VWh1M0xSRUdiVjF6cGVyUWp4U3l6bEZWUzlkU0hvVkVycGxqV1RGSEo4MXBV?=
 =?utf-8?B?ZnFITXdVM2xoMWxEMjA3YUo0Ym1HcE5HZDcrK2JiaGRXWmVSMFVReENpMWY3?=
 =?utf-8?B?NHFUZys4M3AvMnBGSzBYN2dBSkdkOU5BSTFJaW9HbW1GZURqeXgyN0J4djVq?=
 =?utf-8?B?dG1jRDhkd0hhN0Q5Y21EMDNMR2QzRTVRRFdZbnJPZng2eldrMnJ0NlRTOVJv?=
 =?utf-8?B?NXgySll5cXFISjBMVHAzTVhtMFRzZnB0Ym1ScGxaczJMSS8vS0ZQS290Ylo5?=
 =?utf-8?B?czA3WEptRjd0WTBqWlBSUlloSWdlVnRMMEpvTmRTOTZQM3BSalpza2FoakVJ?=
 =?utf-8?B?akg3SVc2Q3VTU1BJUlMrUTJ1UGtRR3liWVhJK1hiWE1rQ1d2S0ZGZktoNThU?=
 =?utf-8?B?QmxEWWdESWpGSGtLeHp3a3VoWnA5TXdQZ2JLQ2dRWVdWN1EvaUU2dEJsVWNG?=
 =?utf-8?B?OWhwTjdHeGsvQjAzZW5NOExvUUlPcXlLRjJJWkZOUE43N3BjVEhHU1YvcVFF?=
 =?utf-8?B?Z0o4T3AxV3FpVFNuYXdmQWpnQ2xzdTZYdkxKRkdSUGtYZmUzRGZjMmovS2Yv?=
 =?utf-8?B?eXh2akI3MG9HOGwwajVueXkwSXh6dnRqQmNQVEkyODlMN0krV1dCdi9weHJI?=
 =?utf-8?B?cnZxMjJVckJhY1JhWHAwdmJxcnhVbEs1bmNOclJXQ1dyakc3NTJySGZ2Qlk5?=
 =?utf-8?B?SUs4aWF1aE1WNldyUVRyd1o5VlJWbTJ5a2dYY2Fjd0tDK0lWbUhTZ2VMZE1j?=
 =?utf-8?B?aXJhSndvTkFJVG9USVBDZUpWOVk4UVYwemh0ZW1UZ3BGYUFRd2Mra3RRS1c1?=
 =?utf-8?B?VnpobU1ZZzBZTHAwMGNkNUlTdjYvRG5sUVpEcENsUDVEeGdldFVSSktVZjEy?=
 =?utf-8?B?MWpUSmlOUGZ0bDhETHB5OE81QkRCTk1aSDhJTnp2N0Nzc0owbUFIaUZDbWZz?=
 =?utf-8?B?QlhiQWpYMkNyN0EvdmpyQVdRZHBuSHJnanNuQ0h5bkd0aXg4N0FZNG94VjZm?=
 =?utf-8?B?UHUxU01jZURQZW9ZNW1ieGRXWXpCLzB6SlVaczRGRk9DTlZweVZvRVhOU3hC?=
 =?utf-8?B?cjNCV3ppNVlLaWhlamN6bUxYOWxDci85OS95YlpQenBoUWovVU9iSUN0Yjl2?=
 =?utf-8?B?UE5Pai8wSzZGOXpubUFsQ3JEejZwZDhFbHBIQTh2MkN1RVpVOFhhdjd5cDZ3?=
 =?utf-8?B?bDA5UmxTWVBoQ3Z0U29HazBIeFlDaktGK2p0TWVMU2JHOE5ZZGdJK0dsN0NF?=
 =?utf-8?B?bll4bHAyNGx3c0FDKzFQVVhuMXZXMHpKSkRTZUhZeUtvYTZPZ2pRMngyL0Nm?=
 =?utf-8?Q?AdwYQePjCAOLp2ov8aINJfIel?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970e4a12-a9cb-4a9f-14d0-08dce154d378
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 13:36:02.1028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dyhMRbjbeHEwFugO1XKkkjOGC9KrwGet1AqNb0FJl40m/2YkWS7hUjXulw6ycFu7zDw5Ai08d08dyJkPsxPf9ez+oHnkEWRblJ4tV14jyW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7008
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE5pcm1veSBEYXMgPG5pcm1v
eS5kYXNAbGludXguaW50ZWwuY29tPg0KPlNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDI3LCAyMDI0
IDM6MjkgUE0NCj5UbzogQ2gsIFNhaSBHb3d0aGFtIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+
OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj5EYXMsIE5pcm1veSA8bmlybW95LmRh
c0BpbnRlbC5jb20+DQo+U3ViamVjdDogUmU6IFtQQVRDSF0gdGVzdHMvaW50ZWwveGVfdGxiOiBB
ZGQgdGVzdCB0byBjaGVjayBUTEIgaW52YWxpZGF0aW9uDQo+DQo+DQo+T24gOS8yNy8yMDI0IDY6
MzUgQU0sIHNhaS5nb3d0aGFtLmNoQGludGVsLmNvbSB3cm90ZToNCj4+IEZyb206IFNhaSBHb3d0
aGFtIENoIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+DQo+Pg0KPj4gVGVzdCB2YWxpZGF0ZXMg
VExCIGludmFsaWRhdGlvbiBieSBiaW5kaW5nIGRpZmZlcmVudCBidWZmZXIgb2JqZWN0cw0KPj4g
d2l0aCB0aGUgc2FtZSB2bWEgYW5kIHN1Ym1pdHRpbmcgd29ya2xvYWQgc2ltdWx0YW5lb3VzbHks
IElkZWFsbHkNCj4+IGV4cGVjdGluZyBncHUgdG8gaGFuZGxlIHBhZ2VzIGJ5IGludmFsaWRhdGlu
ZyBhbmQgYXZvZGluZyBwYWdlIGZhdWx0cy4NCj4+DQo+PiBDYzogTmlybW95IERhcyA8bmlybW95
LmRhc0BpbnRlbC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTYWkgR293dGhhbSBDaCA8c2FpLmdv
d3RoYW0uY2hAaW50ZWwuY29tPg0KPj4gLS0tDQo+PiAgdGVzdHMvaW50ZWwveGVfdGxiLmMgfCAx
NTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gIHRlc3Rz
L21lc29uLmJ1aWxkICAgIHwgICAxICsNCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDE1NSBpbnNlcnRp
b25zKCspDQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2ludGVsL3hlX3RsYi5jDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3RsYi5jIGIvdGVzdHMvaW50ZWwveGVfdGxi
LmMgbmV3IGZpbGUgbW9kZQ0KPj4gMTAwNjQ0IGluZGV4IDAwMDAwMDAwMC4uZWY0NGExMDY5DQo+
PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi90ZXN0cy9pbnRlbC94ZV90bGIuYw0KPj4gQEAgLTAs
MCArMSwxNTQgQEANCj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+PiAr
LyoNCj4+ICsqIENvcHlyaWdodCDCqSAyMDI0IEludGVsIENvcnBvcmF0aW9uDQo+PiArKg0KPj4g
KyogQXV0aG9yczoNCj4+ICsqICAgIFNhaSBHb3d0aGFtIENoIDxzYWkuZ293dGhhbS5jaEBpbnRl
bC5jb20+DQo+PiArKi8NCj4+ICsjaW5jbHVkZSAiaWd0LmgiDQo+PiArI2luY2x1ZGUgImxpYi9p
Z3Rfc3luY29iai5oIg0KPj4gKyNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPj4gKyNpbmNsdWRl
ICJ4ZS94ZV9xdWVyeS5oIg0KPj4gKyNpbmNsdWRlICJ4ZV9kcm0uaCINCj4+ICsjaW5jbHVkZSAi
aWd0X2RlYnVnZnMuaCINCj4+ICsNCj4+ICsvKioNCj4+ICsgKiBURVNUOiBDaGVjayBUcmFuc2xh
dGlvbiBMb29rYXNpZGUgQnVmZmVyIEludmFsaWRhdGlvbi4NCj4+ICsgKiBDYXRlZ29yeTogU29m
dHdhcmUgYnVpbGRpbmcgYmxvY2sNCj4+ICsgKiBNZWdhIGZlYXR1cmU6IEdlbmVyYWwgQ29yZSBm
ZWF0dXJlcw0KPj4gKyAqIFN1Yi1jYXRlZ29yeTogQ01EIHN1Ym1pc3Npb24NCj4+ICsgKiBGdW5j
dGlvbmFsaXR5OiBUTEIgaW52YWxpZGF0ZQ0KPj4gKyAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9u
YWxpdHkgdGVzdA0KPj4gKyAqLw0KPj4gK3N0cnVjdCBkYXRhIHsNCj4+ICsJdWludDMyX3QgYmF0
Y2hbMTZdOw0KPj4gKwl1aW50MzJfdCBkYXRhOw0KPj4gKwl1aW50NjRfdCBhZGRyOw0KPj4gK307
DQo+PiArDQo+PiArc3RhdGljIHZvaWQgc3RvcmVfZHdvcmRfYmF0Y2goc3RydWN0IGRhdGEgKmRh
dGEsIHVpbnQ2NF90IGFkZHIsIGludA0KPj4gK3ZhbHVlKSB7DQo+PiArCWludCBiOw0KPj4gKwl1
aW50NjRfdCBiYXRjaF9vZmZzZXQgPSAoY2hhciAqKSYoZGF0YS0+YmF0Y2gpIC0gKGNoYXIgKilk
YXRhOw0KPj4gKwl1aW50NjRfdCBiYXRjaF9hZGRyID0gYWRkciArIGJhdGNoX29mZnNldDsNCj4+
ICsJdWludDY0X3Qgc2RpX29mZnNldCA9IChjaGFyICopJihkYXRhLT5kYXRhKSAtIChjaGFyICop
ZGF0YTsNCj4+ICsJdWludDY0X3Qgc2RpX2FkZHIgPSBhZGRyICsgc2RpX29mZnNldDsNCj4+ICsN
Cj4+ICsJYiA9IDA7DQo+PiArCWRhdGEtPmJhdGNoW2IrK10gPSBNSV9TVE9SRV9EV09SRF9JTU1f
R0VONDsNCj4+ICsJZGF0YS0+YmF0Y2hbYisrXSA9IHNkaV9hZGRyOw0KPj4gKwlkYXRhLT5iYXRj
aFtiKytdID0gc2RpX2FkZHIgPj4gMzI7DQo+PiArCWRhdGEtPmJhdGNoW2IrK10gPSB2YWx1ZTsN
Cj4+ICsJZGF0YS0+YmF0Y2hbYisrXSA9IE1JX0JBVENIX0JVRkZFUl9FTkQ7DQo+PiArCWlndF9h
c3NlcnQoYiA8PSBBUlJBWV9TSVpFKGRhdGEtPmJhdGNoKSk7DQo+PiArDQo+PiArCWRhdGEtPmFk
ZHIgPSBiYXRjaF9hZGRyOw0KPj4gK30NCj4+ICsNCj5JIHdvdWxkIG1vdmUgdGhpcyB0byBsaWIv
aWd0X3N0b3JlLmPCoCBvciB1c2UgdGhlIG9uZSB3ZSBoYXZlIHRoZXJlLg0KPj4gKy8qKg0KPj4g
KyAqIFNVQlRFU1Q6IGJhc2ljLXRsYg0KPj4gKyAqIERlc2NyaXB0aW9uOiBDaGVjayBUcmFuc2xh
dGlvbiBMb29rYXNpZGUgQnVmZmVyIEludmFsaWRhdGlvbi4NCj4+ICsgKi8NCj4+ICtzdGF0aWMg
dm9pZCB0bGJfaW52YWxpZGF0aW9uKGludCBmZCwgc3RydWN0DQo+PiArZHJtX3hlX2VuZ2luZV9j
bGFzc19pbnN0YW5jZSAqZWNpKSB7DQo+PiArCXN0cnVjdCBkcm1feGVfc3luYyBzeW5jWzJdID0g
ew0KPj4gKwkJeyAudHlwZSA9IERSTV9YRV9TWU5DX1RZUEVfU1lOQ09CSiwgLmZsYWdzID0NCj5E
Uk1fWEVfU1lOQ19GTEFHX1NJR05BTCwgfSwNCj4+ICsJCXsgLnR5cGUgPSBEUk1fWEVfU1lOQ19U
WVBFX1NZTkNPQkosIC5mbGFncyA9DQo+RFJNX1hFX1NZTkNfRkxBR19TSUdOQUwsIH0NCj4+ICsJ
fTsNCj4+ICsJc3RydWN0IGRybV94ZV9leGVjIGV4ZWMgPSB7DQo+PiArCQkubnVtX2JhdGNoX2J1
ZmZlciA9IDEsDQo+PiArCQkubnVtX3N5bmNzID0gMiwNCj4+ICsJCS5zeW5jcyA9IHRvX3VzZXJf
cG9pbnRlcigmc3luYyksDQo+PiArCX07DQo+PiArCXN0cnVjdCBkYXRhICpkYXRhMTsNCj4+ICsJ
c3RydWN0IGRhdGEgKmRhdGEyOw0KPj4gKwl1aW50MzJfdCB2bTsNCj4+ICsJdWludDMyX3QgZXhl
Y19xdWV1ZTsNCj4+ICsJdWludDMyX3QgYmluZF9lbmdpbmU7DQo+PiArCXVpbnQzMl90IHN5bmNv
Ymo7DQo+PiArCXNpemVfdCBib19zaXplOw0KPj4gKwlpbnQgdmFsdWUxID0gMHgxMjM0NTY7DQo+
PiArCWludCB2YWx1ZTIgPSAweDEyMzQ2NTsNCj4+ICsJdWludDY0X3QgYWRkciA9IDB4MTAwMDAw
Ow0KPj4gKwl1aW50MzJfdCBibzEsIGJvMjsNCj4+ICsJY2hhciB0bGJfcHJlWzQwOTZdLCB0bGJf
cG9zWzQwOTZdOw0KPj4gKwljaGFyIHBhdGhbMjU2XTsNCj4+ICsNCj4+ICsJc3luY29iaiA9IHN5
bmNvYmpfY3JlYXRlKGZkLCAwKTsNCj4+ICsJc3luY1swXS5oYW5kbGUgPSBzeW5jb2JqX2NyZWF0
ZShmZCwgMCk7DQo+PiArCXN5bmNbMV0uaGFuZGxlID0gc3luY29iajsNCj4+ICsNCj4+ICsJdm0g
PSB4ZV92bV9jcmVhdGUoZmQsIDAsIDApOw0KPj4gKwlib19zaXplID0gc2l6ZW9mKCpkYXRhMSk7
DQo+PiArCWJvX3NpemUgPSB4ZV9iYl9zaXplKGZkLCBib19zaXplKTsNCj4+ICsJYm8xID0geGVf
Ym9fY3JlYXRlKGZkLCB2bSwgYm9fc2l6ZSwNCj4+ICsJCQkJICAgdnJhbV9pZl9wb3NzaWJsZShm
ZCwgZWNpLT5ndF9pZCksDQo+PiArDQo+RFJNX1hFX0dFTV9DUkVBVEVfRkxBR19ORUVEU19WSVNJ
QkxFX1ZSQU0pOw0KPj4gKwlibzIgPSB4ZV9ib19jcmVhdGUoZmQsIHZtLCBib19zaXplLA0KPj4g
KwkJCQkgICB2cmFtX2lmX3Bvc3NpYmxlKGZkLCBlY2ktPmd0X2lkKSwNCj4+ICsNCj5EUk1fWEVf
R0VNX0NSRUFURV9GTEFHX05FRURTX1ZJU0lCTEVfVlJBTSk7DQo+PiArDQo+PiArCXNwcmludGYo
cGF0aCwgIi9zeXMva2VybmVsL2RlYnVnL2RyaS8wL2d0JWQvc3RhdHMiLCBlY2ktPmd0X2lkKTsN
Cj4NCj5UaGlzIHNob3VsZCBnbyB0byBsaWIgYXMgd2VsbC4NCkkgZmVlbCBjaGVja2luZyB0bGIg
aW52YWxpZGF0aW9uIGNvdW50cyBtb3JlIGdlbmVyaWMgdG8gdGhpcyB0ZXN0LCBhbmQgd2UgY2Fu
IG1vdmUgdGhpcyANCnRvIGxpYiBhcyBhbiBlbmhhbmNlbWVudCBpbiB0aGUgZnV0dXJlIGlmIG5l
ZWRlZC4gDQoNCklmIHlvdSB0aGluayBvdGhlciB3aXNlIGNhbiBtb3ZlIHRoZW0gdG8gbGlicy4g
DQo+DQo+PiArCWlndF9kZWJ1Z2ZzX2R1bXAoZmQsIHBhdGgpOw0KPj4gKwlpZ3RfZGVidWdmc19y
ZWFkKGZkLCBwYXRoLCB0bGJfcHJlKTsNCj4+ICsJaWd0X2luZm8oInRsYiBpbnZhbGlkYXRpb25z
IGNvdW50cyBiZWZvcmUgc3VibWl0dGluZw0KPj4gK3dvcmFrbG9hZHNcbiVzXG4iLCB0bGJfcHJl
KTsNCj4NCj5XZSBuZWVkIHRvIHN0b3JlIHRoaXMgYW5kIGNvbXBhcmUgYmVmb3JlIGFuZCBhZnRl
ciB2YWx1ZS4gVGhlcmUgc2hvdWxkIGEgZml4DQo+bnVtYmVyIG9mIHRsYiBpbnZhbCBmb3IgYSBz
aW1wbGUgam9iIHN1Ym1pc3Npb24NCj4NCj5zbyBtYXkgYmUgaXQgaXMgd29ydGggdG8gYWRkIGEg
Y2hlY2sgbGlrZToNCj4NCj5pZ3RfYXNzZXJ0X2d0KG51bV9pbnZhbCwgbWluX2V4cGVjdGVkKS4g
T3RoZXJ3aXNlIGxvb2tzIGdvb2QgdG8gbWUuDQpTdXJlIGNhbiBiZSBkb25lLg0KDQpUaGFua3Ms
DQpHb3d0aGFtDQo+DQo+DQo+UmVnYXJkcywNCj4NCj5OaXJtb3kNCj4NCj4+ICsNCj4+ICsJZXhl
Y19xdWV1ZSA9IHhlX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bSwgZWNpLCAwKTsNCj4+ICsJYmlu
ZF9lbmdpbmUgPSB4ZV9iaW5kX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bSwgMCk7DQo+PiArCXhl
X3ZtX2JpbmRfYXN5bmMoZmQsIHZtLCBiaW5kX2VuZ2luZSwgYm8xLCAwLCBhZGRyLCBib19zaXpl
LCBzeW5jLCAxKTsNCj4+ICsJZGF0YTEgPSB4ZV9ib19tYXAoZmQsIGJvMSwgYm9fc2l6ZSk7DQo+
PiArDQo+PiArCXN0b3JlX2R3b3JkX2JhdGNoKGRhdGExLCBhZGRyLCB2YWx1ZTEpOw0KPj4gKwll
eGVjLmV4ZWNfcXVldWVfaWQgPSBleGVjX3F1ZXVlOw0KPj4gKwlleGVjLmFkZHJlc3MgPSBkYXRh
MS0+YWRkcjsNCj4+ICsJc3luY1swXS5mbGFncyAmPSB+RFJNX1hFX1NZTkNfRkxBR19TSUdOQUw7
DQo+PiArCXN5bmNbMV0uZmxhZ3MgfD0gRFJNX1hFX1NZTkNfRkxBR19TSUdOQUw7DQo+PiArCXhl
X2V4ZWMoZmQsICZleGVjKTsNCj4+ICsJaWd0X2Fzc2VydChzeW5jb2JqX3dhaXQoZmQsICZzeW5j
b2JqLCAxLCBJTlQ2NF9NQVgsIDAsIE5VTEwpKTsNCj4+ICsJeGVfdm1fYmluZF9hc3luYyhmZCwg
dm0sIGJpbmRfZW5naW5lLCBibzIsIDAsIGFkZHIsIGJvX3NpemUsIHN5bmMsIDEpOw0KPj4gKwlk
YXRhMiA9IHhlX2JvX21hcChmZCwgYm8yLCBib19zaXplKTsNCj4+ICsNCj4+ICsJc3RvcmVfZHdv
cmRfYmF0Y2goZGF0YTIsIGFkZHIsIHZhbHVlMik7DQo+PiArCWV4ZWMuZXhlY19xdWV1ZV9pZCA9
IGV4ZWNfcXVldWU7DQo+PiArCWV4ZWMuYWRkcmVzcyA9IGRhdGEyLT5hZGRyOw0KPj4gKwlzeW5j
WzBdLmZsYWdzICY9IH5EUk1fWEVfU1lOQ19GTEFHX1NJR05BTDsNCj4+ICsJc3luY1sxXS5mbGFn
cyB8PSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTDsNCj4+ICsJeGVfZXhlYyhmZCwgJmV4ZWMpOw0K
Pj4gKwlpZ3RfYXNzZXJ0KHN5bmNvYmpfd2FpdChmZCwgJnN5bmNvYmosIDEsIElOVDY0X01BWCwg
MCwgTlVMTCkpOw0KPj4gKw0KPj4gKwlpZ3RfZGVidWdmc19kdW1wKGZkLCBwYXRoKTsNCj4+ICsJ
aWd0X2RlYnVnZnNfcmVhZChmZCwgcGF0aCwgdGxiX3Bvcyk7DQo+PiArCWlndF9pbmZvKCJ0bGIg
aW52YWxpZGF0aW9ucyBjb3VudHMgYWZ0ZXIgc3VibWl0dGluZw0KPj4gK3dvcmFrbG9hZHNcbiVz
XG4iLCB0bGJfcG9zKTsNCj4+ICsNCj4+ICsJaWd0X2Fzc2VydF9lcShkYXRhMS0+ZGF0YSwgdmFs
dWUxKTsNCj4+ICsJaWd0X2Fzc2VydF9lcShkYXRhMi0+ZGF0YSwgdmFsdWUyKTsNCj4+ICsJaWd0
X2Fzc2VydChzdHJjbXAodGxiX3ByZSwgdGxiX3BvcykgIT0gMCk7DQo+PiArDQo+PiArCXN5bmNv
YmpfZGVzdHJveShmZCwgc3luY1swXS5oYW5kbGUpOw0KPj4gKwlzeW5jb2JqX2Rlc3Ryb3koZmQs
IHN5bmNvYmopOw0KPj4gKwltdW5tYXAoZGF0YTEsIGJvX3NpemUpOw0KPj4gKwltdW5tYXAoZGF0
YTIsIGJvX3NpemUpOw0KPj4gKwlnZW1fY2xvc2UoZmQsIGJvMSk7DQo+PiArCWdlbV9jbG9zZShm
ZCwgYm8yKTsNCj4+ICsJeGVfZXhlY19xdWV1ZV9kZXN0cm95KGZkLCBleGVjX3F1ZXVlKTsNCj4+
ICsJeGVfdm1fZGVzdHJveShmZCwgdm0pOw0KPj4gK30NCj4+ICsNCj4+ICtpZ3RfbWFpbg0KPj4g
K3sNCj4+ICsJaW50IGZkOw0KPj4gKwlzdHJ1Y3QgZHJtX3hlX2VuZ2luZSAqZW5naW5lOw0KPj4g
Kw0KPj4gKwlpZ3RfZml4dHVyZSB7DQo+PiArCQlmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJf
WEUpOw0KPj4gKwl9DQo+PiArDQo+PiArCWlndF9zdWJ0ZXN0KCJiYXNpYy10bGIiKSB7DQo+PiAr
CQllbmdpbmUgPSB4ZV9lbmdpbmUoZmQsIDApOw0KPj4gKwkJdGxiX2ludmFsaWRhdGlvbihmZCwg
JmVuZ2luZS0+aW5zdGFuY2UpOw0KPj4gKwl9DQo+PiArDQo+PiArCWlndF9maXh0dXJlIHsNCj4+
ICsJCWRybV9jbG9zZV9kcml2ZXIoZmQpOw0KPj4gKwl9DQo+PiArfQ0KPj4gZGlmZiAtLWdpdCBh
L3Rlc3RzL21lc29uLmJ1aWxkIGIvdGVzdHMvbWVzb24uYnVpbGQgaW5kZXgNCj4+IGU1ZDg4NTJm
My4uMTdjODA4YWI2IDEwMDY0NA0KPj4gLS0tIGEvdGVzdHMvbWVzb24uYnVpbGQNCj4+ICsrKyBi
L3Rlc3RzL21lc29uLmJ1aWxkDQo+PiBAQCAtMzE2LDYgKzMxNiw3IEBAIGludGVsX3hlX3Byb2dz
ID0gWw0KPj4gIAkneGVfc3lzZnNfZGVmYXVsdHMnLA0KPj4gIAkneGVfc3lzZnNfcHJlZW1wdF90
aW1lb3V0JywNCj4+ICAJJ3hlX3N5c2ZzX3NjaGVkdWxlcicsDQo+PiArICAgICAgICAneGVfdGxi
JywNCj4+ICBdDQo+Pg0KPj4gIGludGVsX3hlX2V1ZGVidWdfcHJvZ3MgPSBbDQo=
