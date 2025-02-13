Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04A0C021A4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 05:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5203610E9F4;
	Thu, 13 Feb 2025 05:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bx84njaO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D1E10E9F4
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 05:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739425747; x=1770961747;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/0wCYlacLTbnpNW2RPxE9EvMbq6RrNS8BGDlIkcixwQ=;
 b=bx84njaO5C39RDchjQgEJeW/twAQNeMusetF4/FX1OTaKcgflHGYIpm1
 m32Q5VtfVMKm6+MCO/fC7Y1A22vswmbjZSjDnwWHxBgWMeUoEZgekcfsR
 LrSwGZUahq1L0Ts9bvD2ebBhcEt+K/m8FySZbcM8ikMbtmwPkbOjlFzsO
 cx/6Qyaq3pgXeQ3QeoCumzrbwQZX9mCSyVWCEdfDbmu4TlHgVJdxFyL7Z
 AOzCRdiYhXM+4FlgtqPvs1jbHj0V4hrgxmqGu9m/M4z2+7ByJEUVmph8X
 +a/dYBGmZQiDKrAsgWnauv1rVQaANmErPMNnYQ1mrXZ/8elyqnWRyculh g==;
X-CSE-ConnectionGUID: 5Fj89G22Q8i0EiXjWqh5/w==
X-CSE-MsgGUID: w3/dFF63TEqnRym29pJOQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40145280"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40145280"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 21:49:05 -0800
X-CSE-ConnectionGUID: 41MKmzt9TZG6+HRLeoo9ng==
X-CSE-MsgGUID: yx82ue9LTKSnNZkSt+b7EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="118128794"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 21:49:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 21:49:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Feb 2025 21:49:00 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 21:48:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcE+0UQ+5TuT3KWmiBLJ7bsV4LjHDONxmPVQxlXQgdkEH8oGOqJbzHBkt4t6s0mI94YtTsinBOJ20CGP4ruMQWcoeWJ+OjGBgvpbBcVJfC8h3uc6WOPMrz8xqiwPWaNam961j/PK1VCLb2VP29d+o4uQUwF3RLckt9b4wn3NRMiD3d3SENG2KIFg9n8HFIHQsNX+xN5Z+BpqNMuGiZLEk6X6h1gNg3ozT7ENcRKNPB6R4OsifOwzUiW2Tko83oy0InW8MkAtq6baIQxN3ASxMoPc3EKQ9uSQXXOb6r4k+sq4zauQ7qVXJ+JHo8p+eBM81WHaEQR+C8IXKkllITUp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZez2IvySqN1bFCeXUq1DdpOzdfIdAEEuS3boTuoHjQ=;
 b=mUcsjuun0uOJq5yTlD+lIhHTpksGaDMn/XIdjEg6mG9fEXbbRJLRMNhVZdK12aM7Hrva4Kur0djX8GlIwdutoiAwgZ2lyYwJ6Bf/mNboIEW1FhDMaPXwyfx7skFxzx8+iQpkjnTWDhK9XDeny249E/abW2yV8d/WBYvUxjXFcdKMYFL5a3VQ/3anJ4q5YMtnKN79D+pAvzU8FBiYEsD5krgoI+wGYZYxcoFfdJ2XKwvp0pExMVzSOEVaElnVkUotNlAiD1LU+oG55sOh9241C2p9hABwzFZpGB6CvxqbkreFlptsVlr1gj7ZshgYeG9qUxqkD2KSzeDhN3qqTMsntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB8597.namprd11.prod.outlook.com (2603:10b6:510:304::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Thu, 13 Feb
 2025 05:48:53 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 05:48:53 +0000
Message-ID: <74a6bbe2-e310-4f70-be37-7a375559fabe@intel.com>
Date: Thu, 13 Feb 2025 11:18:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/7] tests/intel/kms_dp_linktrain_fallback: fix typo
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
 <20250211180542.1430676-5-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250211180542.1430676-5-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::32) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc6525b-e402-4122-6a1f-08dd4bf218b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2Z5ZCtKMUczRytFdFplQ1JlK25JbEZqcW5wemRVeUQvWTJ4SFJHdlFHR1Fa?=
 =?utf-8?B?ZjZGWnEyZDhaVjVZRGZzWENKNU92QmpVaURvdnliQkVYZ3BjNlh1RUtqQy9K?=
 =?utf-8?B?QjBJN3grUVIwVnh2ZS9lQ1JhcVordmhBaHlrckFmZmpnZG1jeEtON0FrN1d1?=
 =?utf-8?B?cjZxVFhFNTVHR2RGNnIyYkU0UzFhazlxSlRnRk9lUjE1L0Y4OWR6YzhDZU1w?=
 =?utf-8?B?WHlabUQvS2UwaC9HTlphMDNvL05peHBsZFRnR2tmUVVSSzlCVUNKZDZ1eXpR?=
 =?utf-8?B?MnEwRDdEL2hUQkdlc1VIWk5NTzFIUnJqOHFQZk1jeWFSYWdOOUdBMWxsVXF2?=
 =?utf-8?B?cUxvRU96STNyS0grQXpWbktDZ2lPWmpzR3ZpUjRBd3NGZW5ZRDBWWmc3dFV6?=
 =?utf-8?B?UGxCbXE5cEswQ0tkUXFYa2xZN2RiZFhqNEV5aWZUVnNOZTRKMDFpVE5qc2Mx?=
 =?utf-8?B?L1JUWkVuNXNrNXBqTm5VQ2pUQzJZVEtUOUNoYlpFNUR0MklEVjgyRjRTWCtP?=
 =?utf-8?B?S1NLZEJSbCtnVk1USlRDWlVUclliSEZkVjh5WWtESVF2c1dUZDRZa1hPL1ly?=
 =?utf-8?B?ejloam5OdWhZU1lCN3p3cGRmSGZtQVg0TzE5SEVweXB0aHlDZ1hOdDE3R3lw?=
 =?utf-8?B?dDRnL0xWK1VmVVVmR3RaOVFoSGxXdFd0aW1qMlBqbzdKOHFCVDNhQ2o1a0JZ?=
 =?utf-8?B?N0tSSWRzNlFQaFJhYjZqdk9UdlAxdU9zSm10c1NKWDI1dWhrUmUrN21Scldo?=
 =?utf-8?B?ek9GeFpXanRDZUQ2YmNOWXlIK0FRd1FRL0hxZndTcHZvTW4yVVQwZGNFb1hQ?=
 =?utf-8?B?OVJyaElyY3BTd3I2RzlRdk0wRWd3SWV2N0NHVlppSEtZU0RTQnVGOTRIRW15?=
 =?utf-8?B?NjMzZ0YwRWFLR05LMEdVL1haKzU5Ni93Vlg1S2xYTC94R0FoRWhNMzZ2Tk1F?=
 =?utf-8?B?Snh3bDFuNy9hTzdLN2syaWl5dDBTUW85enh1TWROWGdmVTNSZFJ6WmpteUdQ?=
 =?utf-8?B?UmFjTmlwdGNPbG1SaTV1aE1YNWxaYlNrZGVMckFHcGQzQTdkWVRTTEdSZHk3?=
 =?utf-8?B?N0l1T0Fma3lxOHNJV0orRERVRTRHU01tbFFoUXduK2JhcGVRR3dmb2NtcFNU?=
 =?utf-8?B?T1pQYVRoaElCMm05VDF4WkU1VS9kSnFzcEtlU1VJbkJMdkZZVCtJTVM4SkFr?=
 =?utf-8?B?RCtUUDRiK0JQMXYxMXNtZFlCSnJNSmFtT0Fqa1JpYWd4WEdBVVFLME1yZGFU?=
 =?utf-8?B?YmpTc2pDR29QWFZXSld3YTVRcjl3Ly9ubTVpQlVGbk9panM0NWg1OEFJdVds?=
 =?utf-8?B?YlFkSHVGbEMvcHpTSmRYc2g5d3BUZmlDZTRuWnp3QWwvVzVjYnUwZlVYb2Nj?=
 =?utf-8?B?dDRESUl0aEJFMFlibnNuZWNlR2dYVWpFc2szVWZNV0xDdTRqZ3NUTXZhZjRu?=
 =?utf-8?B?OTdtekZjcUZtcDNZQ04yb010Q3NZRjVIQlJjTWpLb1FvYXNHT2dtLys1Wkoy?=
 =?utf-8?B?Z1BIekpSMnlxWFhHZWpLU0E0WWZtWkpvZ3docWVXazRxWmFmQ1FBZ3dweVIw?=
 =?utf-8?B?U1RWT1A1VkdWem5VK2lYckI5WEVPeFBGbUtDNFdMU3VSYnRHK2xETFFLUElh?=
 =?utf-8?B?Vis1QnlhVWVlN0dxR0VPK0VMVGU0cjAyTzRYays5QUtERGh4QjVKbDQ3SENZ?=
 =?utf-8?B?ekdKVDdiTCtENkFDYWpINi8wa2Y2d01Fb28zUVRSTHRtR0cxR2paMkVyRGdI?=
 =?utf-8?B?OVdZay90b2FEM2w2Qjh3bVFxOGJ1UDlyQy9MeGQzOWtRU0VGNWk4MXRmR2RF?=
 =?utf-8?B?TUx6U2RndlBhSEphdU9mcEtyLzVSL1FZUjBVWHlPMk1FRG9zWUlsME1LQ3F1?=
 =?utf-8?Q?4WLArAsIn0XOo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enc4dnI2ZEJMU1lFc3FpRnllNjNockN6TE9CUkh4NWNMMEpnR1pzZnlzbi96?=
 =?utf-8?B?Z3pCVjJDQ05OQi9GbEhIT1lRa1hJTTc0M01zM0RGa0pIWlhLR1VzcjY4Ynpj?=
 =?utf-8?B?ZFdmL2hhLzYwRU1lenBLRDFxMms4R1dXdmhlLzZTano2NjVrdEhjcVRGcmkr?=
 =?utf-8?B?RDNSR1czSjl4YkhNanpCRTJKZkQrdnBZdW1jRDBXVkQwc0ljRlFtdDZCMHNH?=
 =?utf-8?B?VE9aRGJFdC92OFU0K3N2Zlo1QWZuSFIwNHJJMjBZZFQ5enRpTWk4Uk9vVEdY?=
 =?utf-8?B?QjlVNkdBSml4MFBFaHVLZ3pWeUQvQmRXekRaajQyd1hFNFk3UHdjMmtxdFRk?=
 =?utf-8?B?UldrZmFFN1dUZm93WG92Y3hlbHI0K0piemZPUzhZTFhqR2MvbkxiVDVGOStu?=
 =?utf-8?B?R0srUnJKdkd3M3JaK2dTSG52Z3NGZ1kza24yOEJ4Y0R1b2g5amlBaDk4ald0?=
 =?utf-8?B?dkplTTZhWFQ3QXBNNHpvYVpDaS84WnMyRzYvcmZDV0daU1plMVBUWDkyZFY1?=
 =?utf-8?B?SXRURVg4WEV5M0tKV1A0d25OMVliaUp0eDkvQUV5VDV5OVUzNk5qaHZaZ2xI?=
 =?utf-8?B?Ymk3bFdqV2prdTM2Y2JjZmJ5K3BOeVc4OXBNK2JVbnpNbmFtL1VITVRIcjZa?=
 =?utf-8?B?N013K1JNVVMyRWROUlljbjA3eVhRYTMycnA1VGd3SG9NdUxiNmlFcThnQUU2?=
 =?utf-8?B?V0pqT3B1cVFZTFp5R01QWnR6dHRwaU5QUlh4WHpjQ3gzTDNRalV5Tm83aWFZ?=
 =?utf-8?B?QytRWFRyMDFEdGlra2FvOWJRS0dXSzhMeSsraXJHeFhNL1gwWFB3bkl4MXAw?=
 =?utf-8?B?Q0hnUEZaT0tqUVYwNS96dTRGMk52VnNMMys2TDU2TDYzb0FJdHRoVWdKRXNV?=
 =?utf-8?B?QU16b0NBSDlxWGFHdHpXNEo0WEhlalhYeWxmb0tseHZvWUEwWFpFa3FvdHN6?=
 =?utf-8?B?dnJTamRtVjM3SUE1QzJiQTVQQVdkaU1rV20yK1pmRC9KRUFVWE1IM3o4MmVZ?=
 =?utf-8?B?OXV3QVZsbFdnVDBMSGordmtka2QxSWlKNitOWGVybHBQSVkxQzk0d3Bic1lE?=
 =?utf-8?B?M0o4ZEZydWs4MnIycm9sbGplMGVYMlZxZHFwWHk3dDYxenBCUDFxZWdXdUFV?=
 =?utf-8?B?cXBQbVNLQ3pJSjBUK1dISjVKa2I2Ym9ZaW12TlBHK0RLWEFHZENrMUZFMDJ5?=
 =?utf-8?B?VHpKUm5vNGQ1eW0rb2lCZGlYcmR3QW1LOWI4djdLSnlERmk4UTBwb0s4aDA2?=
 =?utf-8?B?WFJYOXpjWDBQa2JITmlmeG1MQXN1YWdoVVcrazNOVUt5aWcva2tDbkF2b1or?=
 =?utf-8?B?cmFOdmtWRGJNaTVhODVyTTFxRW15bW9xckN2cEN0TUxLTlNUZGRuSDZxd0lR?=
 =?utf-8?B?cHcwTEV1ZXFZemE3RmtibGVNRnRtWkxYblM4eTVvRDM3YVliRVZ5V2JaQ2gy?=
 =?utf-8?B?ZTg0eHNFVlB2QzBySU95YW9oWG96SWM0djJDUW5RQmJOdlArSDNyYml4M1RI?=
 =?utf-8?B?clI1ME8rZWN0Y25tVXZNMU11ODl0dmQveTdpTTQvSE1uaEFKdjRZZ3EwanhY?=
 =?utf-8?B?cWtmSVZzN0tUSEFqNjJmS0ZmL0hZR0RkM3FaMUZqRFJoWC8wcVhyaDNCVXFC?=
 =?utf-8?B?M3R1Yzd6Z0dlcDV1RDlSNUkxdlJIUUh0UkFSSTlBT2NqbmM3UWxidW1lNk5m?=
 =?utf-8?B?V2tic2haUHgwYkNIa1V2bVZ3bHV6Y1RMVVlLNDNORHN5R1k2SERsMUV0S3V2?=
 =?utf-8?B?NmNHL0pSNCtUVDZUb1A1RXlQbnVIa0hMY2ZqUjVodGQwbTR3ZU9uTW4wMmpu?=
 =?utf-8?B?bWNiZWRPTjJtWW1HczZ5Y3I4NlVIekdPZjB3d2FTeUFKYTgyQmtqS3VBSVAx?=
 =?utf-8?B?Y0pLZnVkSHlyUElqcHlweUttMXlWNDdaUTRTS004Sm8zSFo3ZE9XUVB3ZVZE?=
 =?utf-8?B?RnVQQW9aUlNRRXZIcFN1YXYzL2s1cHdBZ2Fla2kvR3g4VkRheDZVYXpqWWt2?=
 =?utf-8?B?RUZIRmFsZVV2eFF2bFVSWFdDdWE4Slpvb2hXMXFYVzJ6aU85czBiZU9yeUFL?=
 =?utf-8?B?cTNyVzV2cUREQTJsZE0rRm8zbVVCcTEydXRhOGNOS3RsSFhCR3lJVi9zczJx?=
 =?utf-8?B?RUIzZHNLV1ZDMnBjY2g4eUJqbGMveTROdGlQdkU1UUk2bFRvcjJiVXFFU29G?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc6525b-e402-4122-6a1f-08dd4bf218b7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 05:48:52.9118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRdqxhhMu02d8JpQhbE7q9bMGuHtmY8leXJ7vhE66LLJlQ2SOH73GCycb8PnxcpG3w/pZSuOpSyWXdnd4J7gUgMW8n9t7Fkhh7WlGY7YWp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8597
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


On 2/11/2025 11:35 PM, Kunal Joshi wrote:
> fix typo : %s/primarys/primaries
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 55a71e35b..c6e9fba53 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -358,7 +358,7 @@ static void test_fallback(data_t *data, bool is_mst)
>   	igt_output_t *outputs[IGT_MAX_PIPES];
>   	drmModeModeInfo * modes[IGT_MAX_PIPES];
>   	struct igt_fb fbs[IGT_MAX_PIPES];
> -	struct igt_plane *primarys[IGT_MAX_PIPES];
> +	struct igt_plane *primaries[IGT_MAX_PIPES];
>   	struct udev_monitor *mon;
>   
>   	retries = SPURIOUS_HPD_RETRY;
> @@ -367,7 +367,7 @@ static void test_fallback(data_t *data, bool is_mst)
>   	igt_reset_link_params(data->drm_fd, data->output);
>   	if (!setup_outputs(data, is_mst, outputs,
>   			   &output_count, modes, fbs,
> -			   primarys))
> +			   primaries))
>   		return;
>   
>   	igt_info("Testing link training fallback on %s\n",
> @@ -409,7 +409,7 @@ static void test_fallback(data_t *data, bool is_mst)
>   							  &output_count,
>   							  modes,
>   							  fbs,
> -							  primarys), "modeset failed\n");
> +							  primaries), "modeset failed\n");
>   		igt_assert_eq(data->output->values[IGT_CONNECTOR_LINK_STATUS], DRM_MODE_LINK_STATUS_GOOD);
>   		curr_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
>   		curr_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
