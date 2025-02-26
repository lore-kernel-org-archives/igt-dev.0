Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E925AC19F2E
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 16:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC9410E958;
	Wed, 26 Feb 2025 16:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eaQiMyqm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B3810E958
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 16:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740587029; x=1772123029;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/Bt87JCLUI0CrHpK/b9qpUwzIUWIvNTPQiPUH0FCkpw=;
 b=eaQiMyqmwt2Xwdq1J6PafX9LLn/S9Ya7bJaZYsLKp145S3YXn+m8znXj
 eho0cXGLPmuJ2JQhzeTGlzpXytC20+oIxRhc/qePglxV9nVVsZA1Hnmno
 2GJetzFUuORRQFb02NYNS2eWL006lD5Z1jj1C4n1rlNURYiQAH5HmT5ko
 NJUKXNi4bJcpAB5NwuyHWHpDB9aPApi+7ebNtSOBWZhdJ837HCqtDN5iR
 I41SKBXHIEUmoFm3cHABXEfiPIUSUfMblkUXSzpMeVAGdNPUKzoqOkLMC
 2mElBa4OLFb1t99dRHffVQIfrxL/CnvvxhcUr5ybcZENEnHP3/p2rgyE0 w==;
X-CSE-ConnectionGUID: xd7SJSSgSc6mF9/lxYRSAg==
X-CSE-MsgGUID: 02CHPU8yTEe36NflnZIRHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="51652542"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="51652542"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 08:23:49 -0800
X-CSE-ConnectionGUID: zTH5QSizQvSdGOhPEzo9Kw==
X-CSE-MsgGUID: JYNyTGKFRtekwgnIuIWk0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="117383355"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2025 08:23:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Feb 2025 08:23:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 08:23:48 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 08:23:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WH3r93aAHVN8ShnkSt4ihRr1JpVYwIqEaLWoWSj9OP47zCzoWgLG/YklVKdN8Nby9GQSgKPz6NZaF2QeIxv85arhn2kdYkw7r3JXijrd+nNE4uUI8YT02zuhCHBZDlCxiD7g9LRQuVKtwHynrG/yXH1bFEG6iaHY7FfbvrLpIQxLFJAhUuaOqcqYyE20OZ/jWV4QYZuoSaI+sAneG7YQOvFcteA/CJUNinewwN4iSIMWCiWMs5bt+Lb48vLbWjQfG+NV6KAy+2JwZxdYx9yYS/RPtZhIKF6imI986IW3k95pRNptuFiA8Bd/xd8SZLp2HqFsa5jP06hLKwYSN4jNrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Bt87JCLUI0CrHpK/b9qpUwzIUWIvNTPQiPUH0FCkpw=;
 b=UwOmysqrbyLM0o6Vb/0hkTiT0v1/x5cqfbqeMedxkiusOTk4ZZ6DKNoUWyUQi+8TgR56/DeVEX1xwYldLqZY4Ng6N6BduQcjraKkXNdOLQnn8ARKVRYA0+ZC2gvt+Qc/H1k8G2vLKW1G2oJjyZh811AacMT4ZOpOfNxiSPQ+SCNmbsXDRa1pIop28PYLB1Hd3u2/v+hj1qh+29ufhaX/iwJYeXJehJlOKmDBmVt4Wh+pvtlYGZQ+wjaEmWQBSv4UqHwU+dhdCNRnNjIoWKsCodZLp41XrEFnJerJwUYMTS8U5gJFVxDEn5qCcZ0Z5X7ff73jFSvTcBJLd5hKKE+tHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 16:23:39 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 16:23:39 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 5/5] tools/intel_display_bandwidth: Tool for
 measuring display memory bandwidth utilization
Thread-Topic: [PATCH i-g-t 5/5] tools/intel_display_bandwidth: Tool for
 measuring display memory bandwidth utilization
Thread-Index: AQHbCHWyKUPrcwVTBkGDYl+HrjrpIbKB+6iAgAShLoCA1BtxgIAAA30AgAAI5IA=
Date: Wed, 26 Feb 2025 16:23:39 +0000
Message-ID: <292ff967e0aedd558204510804c74960799f0869.camel@intel.com>
References: <20240916201841.29592-1-ville.syrjala@linux.intel.com>
 <20240916201841.29592-6-ville.syrjala@linux.intel.com>
 <20241011175207.lzwiaqkj5ah7lmwn@kamilkon-desk.igk.intel.com>
 <Zw1H-xmKtanuPUQw@intel.com>
 <6bc5bfad4b7c5925d158e1a460fc32e395195df1.camel@intel.com>
 <Z784lIDC8_bLQGSK@intel.com>
In-Reply-To: <Z784lIDC8_bLQGSK@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|PH7PR11MB8036:EE_
x-ms-office365-filtering-correlation-id: ada474b0-0bca-4ca3-88d0-08dd5681edcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZVFSUEVWZGxhYW9ZTHRzSXVTeDhCZGd1dVgvVnVBY1RSOTVwbzlVTjVKVnUx?=
 =?utf-8?B?VGQwOENwY3cySUMyamZFZDkxK1pEaW9QdlVySVlkYkVubktsYUdXQnFMR1Fo?=
 =?utf-8?B?NkF1bmFUa0ZFYUhzZ2VPMnlneHpnZStmd0ZZRmUxTU45U3FFQU43RzhGVVRB?=
 =?utf-8?B?Z1BFT3BlN2FuMUJLTlRhVzdZUldiSnpkeUFmbEZwR3lkQ0p5OWZOZW9oL3Vt?=
 =?utf-8?B?NHZwQUlLaUQ3ZU56REtJbkltRGZsR015a3pDa21lZmxGaHB5RFNLZUdHWmx3?=
 =?utf-8?B?amlkZitNZkUwZi81WWRrdW4zQktRY0JzNXNIR0JYdVNtZ3JOTTMreXlmQ1Vt?=
 =?utf-8?B?b2tIb0NzcGhxQUlVN3FoaDc0UjN2OGN4SlBYOHJlUTFkTEJESzJZQkdzN2pH?=
 =?utf-8?B?c0Q4bHlLNFgyWjdGQXVDMjNTL016d1NOWGhMQUxyN0UycVQrZGRpUEdaRGIx?=
 =?utf-8?B?WjZIZEswR0FCTEtVT1pPakVMOGVGSGg5NVdyTkpaZkRBMElxL1FVSVhYbHl5?=
 =?utf-8?B?aUlwQVIzZG8zUTgyd3VSeXdEb2FDazRjeEFmeWM2RTcwQjlCK1IrSkhJMStU?=
 =?utf-8?B?Qm9sY2lYMXFCakZwMi9mMjRnR3Y0WEdQYjlhVER4cU5POGprVHI3S0ZSUkFC?=
 =?utf-8?B?d3NIam81ZzVvVU5ZTVduN3BoKzhtYUIzUXNzVkFkZ3JBODZWZHZVTTRZOENs?=
 =?utf-8?B?OGxqbFU1VVArTHl0NHpNMDB6UkhTcnFBQXc2ZThnVlRNZmhUVDlUbG5CMmg0?=
 =?utf-8?B?OFRHcVNzd2ZhcW40SjYyd25nQWp1WWhMclFVanUvWDZwOGFrRWhaaHhLK1lP?=
 =?utf-8?B?aG5lK080dENyY1lLR3B3c0IwMlp5eitSS1U1eHcrMHhsMmpLdW1KUDVQaFVh?=
 =?utf-8?B?MG5GRHo4UmtmVnBlbS9xTjVpcUtDdmtYMGVKTXBwV09TVGErYXFwVnFHY3VC?=
 =?utf-8?B?MGtJbWRyN1BXU3RjM3N6QlhQblNxaU5KazkxN0dYckdiZFNlUEN1dldWdmpF?=
 =?utf-8?B?RFIrNGhPaUFxRlZ5dGRydEtRem9Ja3NrblY0azErSksyMnkrbUlYNjczY1Rp?=
 =?utf-8?B?ZGhFUTVYZFhXb0dvWnIxVENWcElTb2diUU1oZU1xYnlrQ3ZKUGNlejM3THpl?=
 =?utf-8?B?N0x5QzJxK0E0SDhTWTd5a1VNN3JTbTJPSkhpUEVFcHJneWt2UFQwcUQ2WXlr?=
 =?utf-8?B?WDY0K3VNSGNWREw1a0w2OFJwT3pzRFNxUmVDeTRXWlhmdmIwMDVYZHFkSkRM?=
 =?utf-8?B?Q1dsQTdvNFRWcWU2MERGenFXeDhhdXZGMW5lK2tnRGFnNjdVNHJkU0VyTHBM?=
 =?utf-8?B?ZHhhU1NDMldBa0RvVjB5dy9BcitwSVlwRnR6MXJFakswZVhteHN4NVRtbjl5?=
 =?utf-8?B?TXIxc0Y3UkVmc3NXZ2dlYkRqM1hyQVNGWDA0NnU0cllSNUd0d2RaamtmSGdz?=
 =?utf-8?B?S0FGdjlRV0FmWVIyekFuaEYwZUF3SFdvK0wyblFyeVBUZHdpeE9GVzlNdVlK?=
 =?utf-8?B?MFFLcGNHNmpleEtKb25XZ244K3NIeEQ3ci9MUGhtcXJneG5QeGt1ZXJ6RjZh?=
 =?utf-8?B?R2hXMVRSL1FIemtFbzVTR2p6R0dzU3Q0LzVCWUxjSzRBR2RuSXB1cEkxT1hT?=
 =?utf-8?B?QVRGdHFlNXIxSXg2ZHJlZ3ZEanBRQ1dDNUU0OG9BOVBPSDhRTTRLZFZ2dUJj?=
 =?utf-8?B?aGdGS3piZmJacE5VWkplZkdnVEcrSnJTckpRM3cvUHkvdEV6b2dPeHh4ME1C?=
 =?utf-8?B?ejZ2SzZVcXczdzk2d1dLZjdsaG9HUjAybVArUmxXcGR3bFdIMTlZemJ0enpT?=
 =?utf-8?B?ZEdkOHJ4VjNUeUFId0hxTUovazl0RlBFc0dlZ2pQWTFDVWxaU1pSRXF5ZnAv?=
 =?utf-8?B?bUQwSW51dHNRS3BKVXJWR0xaV3M5cm5VZS9oUnhwZzZkcDBFZkpGbk5neGRB?=
 =?utf-8?Q?VzxhyFLrTkbTvtl8/GaZ69scg7pej5a5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGF1VTZ3OC9aMVFKOHE3ajVwR1pIRENpZ3dYSDZwSU84dEtoUW56VVZrOHph?=
 =?utf-8?B?cXE3UTU0ajBrR2ZvL2xwbUpSSWRZVkcwUnFJa2ZkalhYWnJTWjRZSUkranha?=
 =?utf-8?B?V2RJaEV6Q01VWGZPVTdyVmgxa2RQZDd3eFFUb05teEZWWTJYZWlIdWtQWndk?=
 =?utf-8?B?ZU9GbU9jbDFxTlZmeTlsMHBZYzg2NDRFam5EeGg3bGVvVWR6Mzc1aFA1ZjJy?=
 =?utf-8?B?eThXdnZndy9UNjZmaXV6SkJUd1hCck9WankrTlpkeHBkYVFNZkljY1hqUHpW?=
 =?utf-8?B?dkFyem9QWG9yQnZDdjlWRGhWN2ErTmpCZzRnaTF0ZzRtd2F0UDRwbmJqcVRT?=
 =?utf-8?B?bTkrVk5ISXA1NjU5OXczUEZ1OGFJRERNVDNnZnU3S2dKb0pGTWFYVmEyTFJT?=
 =?utf-8?B?Z3ZaMkdQT1YyVFB1L0ZrU1M0MnZxcXM1dlV2L2dTTk1pSm1zOGR1djNUN2J0?=
 =?utf-8?B?cGN1UmFTbXZSODU1K1BnSkNxdXlRRzlaMUVjUFZja2FlSHVTV0tXbkt4MUJl?=
 =?utf-8?B?VVJVTkpuY0pDSHNpQ0JoU3ZCSjJrakxCZmd4U1Q2NlRQWkRJZjQ4ZGJzWktw?=
 =?utf-8?B?em1LdXhKaDhmMnh6YjB2RUUzUnd5QnE3OFBFc2pOTGlveVVVdUdxUkxUOVA3?=
 =?utf-8?B?a01PeUhtcmdtekVPeXowWUJWckdVZmtRaFhMYkFNdUhqc0ZqM1l5dEJiOEZS?=
 =?utf-8?B?elc4eHptZHUzRHNIZVF6QUljU2hvR1pKWXhzUC9weTVQQ2tnOUgxZzUxT0dw?=
 =?utf-8?B?OVpFWExnK2VPTlpqQkRoakJYS3NIWVBPMnA5MEdLdGNRTVlJUnlnMWE1TzQz?=
 =?utf-8?B?d21BNzh2N0g0Q0YzV0JQcnpndytGYUNEdW9ydDJqdHBtYlNBaGV4NDF4TEUr?=
 =?utf-8?B?MWlRZFM4NTQ4QzBEN0ZmRytWZW5qMzM2RzBuUFJOTlNFNnVNZXhkV012OXVY?=
 =?utf-8?B?VWF0emlLR2Iwa1dPcXo5b0Q4aXR6VWpLM0o5bHQ2WWlYdk5XTlgyNTJaNzQ4?=
 =?utf-8?B?N1JxUHk4ZkY1SEFNcTFoTzBUZG5MMCtLa0Z2R1ZZQkd0TjNmNVgzZWdlL0U1?=
 =?utf-8?B?YkJycUJNckMyaHl2MksxY3g5bklwYm1vWFlBWHNvNmJONlpQV0ptTlM0Qlhu?=
 =?utf-8?B?VStibHFQQmdYSjZRb3E4ckNyc2U0TEI5bFpZdzhBZW9KWW50aEdQS3llSE5Q?=
 =?utf-8?B?RW1MTTNFZm5yS0Fsa241ZVdzRGR3cGk2eklWVTlhd1dkZzczMGJDNGM3aWJo?=
 =?utf-8?B?RWVwSVdmbm9wLzFVL0dMMTlyOUFUeldUeGo2Smpha0NsQmx4bDZhK2hFTUhy?=
 =?utf-8?B?bjBPcTlVOUZPYnU5UlZEeEw4UnRxMCt4S1ZMYWZUQ3ZYTkpjZ3daOG5sQzY1?=
 =?utf-8?B?N0Njd3lRWWd2RzkyVDBPL1hldlFQTEMwQUpHdDN4VmtyWHdlaVp5U3Q2U3lF?=
 =?utf-8?B?Q0tSUWh6TG1hcHBSYVBaNEpUcWN3NEw5TjluTEtiK3BEM0hFcDlSL0h0bFhI?=
 =?utf-8?B?ME8xamZIeHY5bmtRdXo1NTIySDh2Y1Nra3c5NVJvUzgzMW9JQnVZYmVhbk5x?=
 =?utf-8?B?TmdIMDdrZmg3THBqb2s4WDd4NFMyMUloNmtXU0RuaCszVSt4S25mb29mZVgx?=
 =?utf-8?B?UmpWdngxNG1seituWmU0YS9paFJ2RGFyU2xsRVNUVzEvTUVPZ3I5TGtCNVp3?=
 =?utf-8?B?NkViYUhNcFg2VEJGbXBqdWwxRlJBTlRnaG1YQVM0YUFic0NXekl0RVRVKzAv?=
 =?utf-8?B?OVQ0a2pGdFk5VjBnSlk3UXQzajhPVWt1cE04cWg5VU1aNXVmWWhBVXRSb210?=
 =?utf-8?B?cEp5c0JVak5sTUM0UlRVbE9nMDErSi8xZG5wTE1NZGFQSGp1STFOMDl1Vk1X?=
 =?utf-8?B?RFpzTGxZbS9HMEFpNlMxSnZnQ0lRNEpBUmliazAwK0NveVdvc1lHZldTbWQr?=
 =?utf-8?B?RVZ1ZlJ3Ukp2U1ZkK29saVVuRkpjNFM0MXdHZTk1UWkwWEhrQnR4TnpJb2Y2?=
 =?utf-8?B?Ti9sMHJJR1MyeUMvOW9ZcGhaTFkxcHRiREh3TTA3RTdRQ3dyelJGdzJWUTNs?=
 =?utf-8?B?TnJ2V3pBRFFRNGpXd1d2L3pscStVMzFPNDFXczV1bzhSVVNycm1XZnBYRGVy?=
 =?utf-8?B?eUZzblVWbUp0VktWTitsV0V3VzVESnNHVWx3VHhPOStGamt0T1pHUUZUUDg4?=
 =?utf-8?Q?rIE4dx/0L3WTuUHkF3FKKFM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF4E39164104F14A9294469ECE9B47A5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada474b0-0bca-4ca3-88d0-08dd5681edcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 16:23:39.6301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dI+4mXTrOm2U5vTK1pVo9ELEoaoKNehsr1lsZJ5Yix0ZWQL9b6Oa2DEsDshlA6FT/T7+oqSJXGDgt38FJDsiDjI19nDZDCRb+XLXginnnBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
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

T24gV2VkLCAyMDI1LTAyLTI2IGF0IDE3OjUxICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFdlZCwgRmViIDI2LCAyMDI1IGF0IDAzOjM5OjIxUE0gKzAwMDAsIEdvdmluZGFwaWxs
YWksIFZpbm9kIHdyb3RlOg0KPiA+IEhpIFZpbGxlLA0KPiA+IA0KPiA+IEkgdGhpbmsgeW91IG1p
c3NlZCBvbmUgY29tbWVudCBmcm9tIEthbWlsLi4uDQo+IA0KPiBJIHNhdyBpdC4gQnV0IG5vIHJl
YWwgcG9pbnQgaW4gcmVwb3N0aW5nIGp1c3QgZm9yIHRoYXQuDQoNCk9rYXkuLiB3aXRoIHRoYXQg
Zml4ZWQsDQoNClJldmlld2VkLWJ5OiBWaW5vZCBHb3ZpbmRhcGlsbGFpIDx2aW5vZC5nb3ZpbmRh
cGlsbGFpQGludGVsLmNvbT4NCg0KPiANCj4gPiANCj4gPiAiDQo+ID4gKwlpbnRlbF9yZWdpc3Rl
cl9hY2Nlc3NfaW5pdCgmbW1pb19kYXRhLCBpbnRlbF9nZXRfcGNpX2RldmljZSgpLCAwLCAtMSk7
DQo+ID4gDQo+ID4gVGhpcyBmdW5jdGlvbiBjaGFuZ2VkIHJlY2VudGx5IGFuZCBub3cgdGhpcyBj
b2RlIGRvIG5vdCBjb21waWxlLg0KPiA+IFBsZWFzZSBmaXggYW5kIHJlc2VuZC4NCj4gPiAiDQo+
ID4gDQo+ID4gVGhlIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIGlzIGxpa2UgdGhpcyBub3cuLg0KPiA+
IA0KPiA+IGludCBpbnRlbF9yZWdpc3Rlcl9hY2Nlc3NfaW5pdChzdHJ1Y3QgaW50ZWxfbW1pb19k
YXRhICptbWlvX2RhdGEsDQo+ID4gCQkJwqDCoMKgwqDCoMKgIHN0cnVjdCBwY2lfZGV2aWNlICpw
Y2lfZGV2LCBpbnQgc2FmZSk7DQo+ID4gDQo+ID4gQlINCj4gPiBWaW5vZA0KPiA+IA0KPiA+IE9u
IE1vbiwgMjAyNC0xMC0xNCBhdCAxOTozNCArMDMwMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOg0K
PiA+ID4gT24gRnJpLCBPY3QgMTEsIDIwMjQgYXQgMDc6NTI6MDdQTSArMDIwMCwgS2FtaWwgS29u
aWVjem55IHdyb3RlOg0KPiA+ID4gPiBIaSBWaWxsZSwNCj4gPiA+ID4gT24gMjAyNC0wOS0xNiBh
dCAyMzoxODo0MSArMDMwMCwgVmlsbGUgU3lyamFsYSB3cm90ZToNCj4gPiA+ID4gPiBGcm9tOiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IEludHJvZHVjZSBhIHNtYWxsIHRvb2wgZm9yIG1lYXNpbmcgdGhlIGRpc3Bs
YXkgZW5naW5nDQo+ID4gPiA+IHMvbWVhc2luZy9tZWFzdXJpbmcvDQo+ID4gPiA+IHMvZW5naW5n
L2VuZ2lucy8NCj4gPiA+ID4gDQo+ID4gPiA+ID4gbWVtb3J5IGJhbmR3aWR0aCB1dGlsaXphdGlv
bi4gR2VuZXJhbGx5IHRoaXMgaXMgYXZhaWxhYmxlDQo+ID4gPiA+ID4gb24gU05CKywgZXhjZXB0
IG9uIFRHTC9kZXJpdmF0aXZlcyB3aGVyZSB0aGUgcmVsZXZhbnQNCj4gPiA+ID4gPiByZWdpc3Rl
cnMgd2VyZW4ndCB1cGRhdGVkIHRvIGNvcGUgd2l0aCB0aGUgbmV3IEFCT1ggbGF5b3V0DQo+ID4g
PiA+ID4gaW4gdGhlIGhhcmR3YXJlLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFF1aXRlIGhhbmR5
IGZvciBjb25maXJtaW5nIHRoYXQgRkJDL0NDUy9ldGMuIGFyZSBkb2luZyB0aGVpcg0KPiA+ID4g
PiA+IGpvYi4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBOb3QgMTAwJSBzdXJlIGFib3V0IHRoZSBy
ZXF1aXJlZCBzY2FsaW5nIGZhY3RvciBiZWNhdXNlDQo+ID4gPiA+ID4gYnNwZWMgY2xhaW1zIGl0
J3Mgb25seSBuZWVkZWQgZm9yIE1UTCwgYnV0IG15IEFETCBkZWZpbml0ZWx5DQo+ID4gPiA+ID4g
bmVlZHMgaXQgYWxyZWFkeS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiA+ID4gPiA+
IC0tLQ0KPiA+ID4gPiA+IMKgbGliL2ludGVsX3JlZy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqAgNSArDQo+ID4gPiA+ID4gwqB0b29scy9pbnRlbF9kaXNwbGF5X2JhbmR3
aWR0aC5jIHwgMTcxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+IA0K
PiA+ID4gPiBJcyB0aGlzIHRvb2wgZGlzcGxheSBvbmx5Pw0KPiA+ID4gDQo+ID4gPiBZZXMuDQo+
ID4gPiANCj4gPiA+ID4gV2hhdCBhYm91dCBidyBmb3Igb3BlbmNsIGNvbXB1dGF0aW9ucz8NCj4g
PiA+IA0KPiA+ID4gSUlSQyB0aGVyZSBtYXkgYmUgc29tZSBraW5kIG9mIHRvdGFsIG1lbW9yeSBi
YW5kd2lkdGggY291bnRlcg0KPiA+ID4gZXhwb3NlZCB2aWEgcGVyZi4gSSdtIG5vdCBhd2FyZSBv
ZiBhbnl0aGluZyBtb3JlIHNwZWNpZmljIHRoYW4NCj4gPiA+IHRoYXQuDQo+ID4gPiANCj4gPiA+
IE5vIGlkZWEgaWYgdGhlcmUncyBhbnl0aGluZyBmb3IgZEdQVXMsIGVnLiBsb2NhbCBtZW0gYncs
IFBDSWUNCj4gPiA+IGxpbmsgYncsIGV0Yy4gV291bGQgYmUgbmljZSB0byBoYXZlIEkgc3VwcG9z
ZS4NCj4gPiA+IA0KPiA+ID4gSXQgbWlnaHQgYmUgaW50ZXJlc2V0aW5nIHRvIGV4cG9zZSB0aGUg
ZGlzcGxheSBiYW5kd2lkdGggY291bnRlcg0KPiA+ID4gdmlhIHBlcmYgYXMgd2VsbCwgYnV0IEkg
aGF2ZW4ndCBsb29rZWQgYXQgd2hhdCB0aGF0IHdvdWxkIHRha2UNCj4gPiA+IHRvIGltcGxlbWVu
dC4NCj4gPiA+IA0KPiA+ID4gPiBDb3VsZCB3ZSBoYXZlIG1vcmUgZ2VuZXJhbCB0b29sIGFsc28g
Zm9yIGNvbXB1dGUgY2FzZT8gVGhlbiBpdCBjb3VsZCBiZQ0KPiA+ID4gPiBuYW1lZCBpbnRlbF9n
cHVfYmFuZHdpZHRoIG9yIGV2ZW4gc2hvcnRlciBpbnRlbF9ncHVfYnc/DQo+ID4gPiA+IA0KPiA+
ID4gPiA+IMKgdG9vbHMvbWVzb24uYnVpbGTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDEgKw0KPiA+ID4gPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCAxNzcgaW5zZXJ0aW9ucygrKQ0K
PiA+ID4gPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2ludGVsX2Rpc3BsYXlfYmFuZHdp
ZHRoLmMNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL2ludGVsX3JlZy5o
IGIvbGliL2ludGVsX3JlZy5oDQo+ID4gPiA+ID4gaW5kZXggMjY4MzNjNjZmOGU3Li41ZTA0OWQ4
YjE0ZDYgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvbGliL2ludGVsX3JlZy5oDQo+ID4gPiA+ID4g
KysrIGIvbGliL2ludGVsX3JlZy5oDQo+ID4gPiA+ID4gQEAgLTE0MTMsNiArMTQxMywxMSBAQCBT
T0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4NCj4g
PiA+ID4gPiDCoCNkZWZpbmUgUENIXzNEUkFNQ0dESVMwCQkweDQ2MDI4DQo+ID4gPiA+ID4gwqAj
ZGVmaW5lIFNPVVRIX0RTUENMS19HQVRFX0QJMHhjMjAyMA0KPiA+ID4gPiA+IMKgDQo+ID4gPiA+
ID4gKyNkZWZpbmUgREVfUE9XRVIxCTB4NDI0MDANCj4gPiA+ID4gPiArI2RlZmluZSBERV9QT1dF
UjIJMHg0MjQwNA0KPiA+ID4gPiA+ICsjZGVmaW5lIERFX1BPV0VSMl9BQk9YMAkweDQyNDA0DQo+
ID4gPiA+ID4gKyNkZWZpbmUgREVfUE9XRVIyX0FCT1gxCTB4NDI0MDgNCj4gPiA+ID4gPiArDQo+
ID4gPiA+ID4gwqAjZGVmaW5lIENQVV9lRFBfQQkJMHg2NDAwMA0KPiA+ID4gPiA+IMKgI2RlZmlu
ZSBQQ0hfRFBfQgkJMHhlNDEwMA0KPiA+ID4gPiA+IMKgI2RlZmluZSBQQ0hfRFBfQwkJMHhlNDIw
MA0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS90b29scy9pbnRlbF9kaXNwbGF5X2JhbmR3aWR0aC5j
IGIvdG9vbHMvaW50ZWxfZGlzcGxheV9iYW5kd2lkdGguYw0KPiA+ID4gPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+ID4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jN2JlM2MzOTBkMDgNCj4g
PiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ID4gKysrIGIvdG9vbHMvaW50ZWxfZGlzcGxh
eV9iYW5kd2lkdGguYw0KPiA+ID4gPiA+IEBAIC0wLDAgKzEsMTcxIEBADQo+ID4gPiA+ID4gKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4gPiA+ID4gPiArLyoNCj4gPiA+ID4gPiAr
ICogQ29weXJpZ2h0IMKpIDIwMjQgSW50ZWwgQ29ycG9yYXRpb24NCj4gPiA+ID4gPiArICovDQo+
ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsjaW5jbHVkZSA8Z2V0b3B0Lmg+DQo+ID4gPiA+ID4gKyNp
bmNsdWRlIDxpbnR0eXBlcy5oPg0KPiA+ID4gPiA+ICsjaW5jbHVkZSA8c3RkYm9vbC5oPg0KPiA+
ID4gPiA+ICsjaW5jbHVkZSA8c3RkaW8uaD4NCj4gPiA+ID4gPiArI2luY2x1ZGUgPHN0ZGxpYi5o
Pg0KPiA+ID4gPiA+ICsjaW5jbHVkZSA8dW5pc3RkLmg+DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+
ICsjaW5jbHVkZSAiaW50ZWxfaW8uaCINCj4gPiA+ID4gPiArI2luY2x1ZGUgImludGVsX2NoaXBz
ZXQuaCINCj4gPiA+ID4gPiArI2luY2x1ZGUgImludGVsX3JlZy5oIg0KPiA+ID4gPiA+ICsNCj4g
PiA+ID4gPiArc3RhdGljIGJvb2wgaGFzX2RlX3Bvd2VyMih1aW50MzJfdCBkZXZpZCkNCj4gPiA+
ID4gPiArew0KPiA+ID4gPiA+ICsJLyoNCj4gPiA+ID4gPiArCSAqIFRHTCBoYXMgREVfUE9XRVIy
IGJ1dCBpdCBtZWFzdXJlcyB0aGUgbG93IHByaW9yaXR5IHRyYWZmaWMNCj4gPiA+ID4gPiArCSAq
IG9uIEFCT1gsIG5vdCBub3QgYWN0dWFsIGRpc3BsYXkgdHJhZmZpYyBvbiBBQk9YMC9BQk9YMS4N
Cj4gPiA+ID4gDQo+ID4gPiA+IHMvbm90IG5vdC9ub3QvDQo+ID4gPiA+IA0KPiA+ID4gPiA+ICsJ
ICovDQo+ID4gPiA+ID4gKwlpZiAoaW50ZWxfZGlzcGxheV92ZXIoZGV2aWQpID09IDEyKQ0KPiA+
ID4gPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKwlyZXR1cm4g
aW50ZWxfZGlzcGxheV92ZXIoZGV2aWQpID49IDYgJiYNCj4gPiA+ID4gPiArCQkhSVNfVkFMTEVZ
VklFVyhkZXZpZCkgJiYgIUlTX0NIRVJSWVZJRVcoZGV2aWQpOw0KPiA+ID4gPiA+ICt9DQo+ID4g
PiA+ID4gKw0KPiA+ID4gPiA+ICtzdGF0aWMgYm9vbCBoYXNfZGVfcG93ZXIyX2Fib3gwX2Fib3gx
KHVpbnQzMl90IGRldmlkKQ0KPiA+ID4gPiA+ICt7DQo+ID4gPiA+ID4gKwkvKg0KPiA+ID4gPiA+
ICsJICogRGVzcGl0ZSBoYXZpbmcgQUJPWDAvQUJPWDEgVEdMIGxhY2tzIHRoZQ0KPiA+ID4gPiA+
ICsJICogYWNjb21wYW55aW5nIERFX1BPV0VSMl9BQk9YKiByZWdpc3RlcnMuDQo+ID4gPiA+ID4g
KwkgKi8NCj4gPiA+ID4gPiArCXJldHVybiBpbnRlbF9kaXNwbGF5X3ZlcihkZXZpZCkgPj0gMTM7
DQo+ID4gPiA+ID4gK30NCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gK3N0YXRpYyBpbnQgZGVfcG93
ZXIyX3NjYWxlKHVpbnQzMl90IGRldmlkKQ0KPiA+ID4gPiA+ICt7DQo+ID4gPiA+ID4gKwkvKg0K
PiA+ID4gPiA+ICsJICogRklYTUUgc2hvdWxkIHBlcmhhcHMgdXNlIHNvbWV0aGluZyBsaWtlDQo+
ID4gPiA+ID4gKwkgKiBpc19pbnRlbF9kZ2Z4KCkgYnV0IHRoYXQgb25lIHdhbnRzIHRvIG9wZW4g
dGhlIGRldmljZSA6KA0KPiA+ID4gPiA+ICsJICovDQo+ID4gPiA+ID4gKwlzd2l0Y2ggKGludGVs
X2Rpc3BsYXlfdmVyKGRldmlkKSkgew0KPiA+ID4gPiA+ICsJY2FzZSAxMzoNCj4gPiA+ID4gPiAr
CQlyZXR1cm4gSVNfREcyKGRldmlkKSA/IDEgOiAyOw0KPiA+ID4gPiA+ICsJY2FzZSAxNDoNCj4g
PiA+ID4gPiArCQlyZXR1cm4gSVNfQkFUVExFTUFHRShkZXZpZCkgPyAxIDogMjsNCj4gPiA+ID4g
PiArCWRlZmF1bHQ6DQo+ID4gPiA+ID4gKwkJcmV0dXJuIDE7DQo+ID4gPiA+ID4gKwl9DQo+ID4g
PiA+ID4gK30NCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gK3N0YXRpYyBpbnQgZGVfcG93ZXIyX3Vu
aXQodWludDMyX3QgZGV2aWQpDQo+ID4gPiA+ID4gK3sNCj4gPiA+ID4gPiArCXJldHVybiA2NCAq
IGRlX3Bvd2VyMl9zY2FsZShkZXZpZCk7DQo+ID4gPiA+ID4gK30NCj4gPiA+ID4gPiArDQo+ID4g
PiA+ID4gK3N0YXRpYyBmbG9hdCBiYW5kd2lkdGgodWludDMyX3QgZGV2aWQsIGludCBkdXJhdGlv
biwNCj4gPiA+ID4gPiArCQnCoMKgwqDCoMKgwqAgdWludDMyX3QgcHJlLCB1aW50MzJfdCBwb3N0
KQ0KPiA+ID4gPiA+ICt7DQo+ID4gPiA+ID4gKwlyZXR1cm4gKGZsb2F0KShwb3N0IC0gcHJlKSAq
IGRlX3Bvd2VyMl91bml0KGRldmlkKSAvIChkdXJhdGlvbiA8PCAyMCk7DQo+ID4gPiA+ID4gK30N
Cj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gK3N0YXRpYyB2b2lkIG1lYXN1cmVfZGVfcG93ZXIyX2Fi
b3gwX2Fib3gxKHVpbnQzMl90IGRldmlkLCB1bnNpZ25lZCBpbnQgc2xlZXBfZHVyYXRpb24pDQo+
ID4gPiA+ID4gK3sNCj4gPiA+ID4gPiArCXVpbnQzMl90IHByZV9hYm94MCwgcG9zdF9hYm94MDsN
Cj4gPiA+ID4gPiArCXVpbnQzMl90IHByZV9hYm94MSwgcG9zdF9hYm94MTsNCj4gPiA+ID4gPiAr
DQo+ID4gPiA+ID4gKwlwcmVfYWJveDAgPSBJTlJFRyhERV9QT1dFUjJfQUJPWDApOw0KPiA+ID4g
PiA+ICsJcHJlX2Fib3gxID0gSU5SRUcoREVfUE9XRVIyX0FCT1gxKTsNCj4gPiA+ID4gPiArDQo+
ID4gPiA+ID4gKwlpZiAoc2xlZXBfZHVyYXRpb24pIHsNCj4gPiA+ID4gPiArCQlzbGVlcChzbGVl
cF9kdXJhdGlvbik7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsJCXBvc3RfYWJveDAgPSBJTlJF
RyhERV9QT1dFUjJfQUJPWDApOw0KPiA+ID4gPiA+ICsJCXBvc3RfYWJveDEgPSBJTlJFRyhERV9Q
T1dFUjJfQUJPWDEpOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCQlwcmludGYoIkRFX1BPV0VS
Ml9BQk9YMDogMHglMDh4LT4weCUwOHhcbiIsDQo+ID4gPiA+ID4gKwkJwqDCoMKgwqDCoMKgIHBy
ZV9hYm94MCwgcG9zdF9hYm94MCk7DQo+ID4gPiA+ID4gKwkJcHJpbnRmKCJERV9QT1dFUjJfQUJP
WDE6IDB4JTA4eC0+MHglMDh4XG4iLA0KPiA+ID4gPiA+ICsJCcKgwqDCoMKgwqDCoCBwcmVfYWJv
eDEsIHBvc3RfYWJveDEpOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCQlwcmludGYoIkFCT1gw
IGJhbmR3aWR0aDogJS4yZiBNaUIvc1xuIiwNCj4gPiA+ID4gPiArCQnCoMKgwqDCoMKgwqAgYmFu
ZHdpZHRoKGRldmlkLCBzbGVlcF9kdXJhdGlvbiwNCj4gPiA+ID4gPiArCQkJCSBwcmVfYWJveDAs
IHBvc3RfYWJveDApKTsNCj4gPiA+ID4gPiArCQlwcmludGYoIkFCT1gxIGJhbmR3aWR0aDogJS4y
ZiBNaUIvc1xuIiwNCj4gPiA+ID4gPiArCQnCoMKgwqDCoMKgwqAgYmFuZHdpZHRoKGRldmlkLCBz
bGVlcF9kdXJhdGlvbiwNCj4gPiA+ID4gPiArCQkJCSBwcmVfYWJveDEsIHBvc3RfYWJveDEpKTsN
Cj4gPiA+ID4gPiArCQlwcmludGYoIlRvdGFsIGJhbmR3aWR0aDogJS4yZiBNaUIvc1xuIiwNCj4g
PiA+ID4gPiArCQnCoMKgwqDCoMKgwqAgYmFuZHdpZHRoKGRldmlkLCBzbGVlcF9kdXJhdGlvbiwN
Cj4gPiA+ID4gPiArCQkJCSBwcmVfYWJveDAgKyBwcmVfYWJveDEsIHBvc3RfYWJveDAgKyBwb3N0
X2Fib3gxKSk7DQo+ID4gPiA+ID4gKwl9IGVsc2Ugew0KPiA+ID4gPiA+ICsJCXByaW50ZigiREVf
UE9XRVIyX0FCT1gwOiAweCUwOHhcbiIsIHByZV9hYm94MCk7DQo+ID4gPiA+ID4gKwkJcHJpbnRm
KCJERV9QT1dFUjJfQUJPWDE6IDB4JTA4eFxuIiwgcHJlX2Fib3gxKTsNCj4gPiA+ID4gPiArCX0N
Cj4gPiA+ID4gPiArfQ0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArc3RhdGljIHZvaWQgbWVhc3Vy
ZV9kZV9wb3dlcjIodWludDMyX3QgZGV2aWQsIHVuc2lnbmVkIGludCBzbGVlcF9kdXJhdGlvbikN
Cj4gPiA+ID4gPiArew0KPiA+ID4gPiA+ICsJdWludDMyX3QgcHJlLCBwb3N0Ow0KPiA+ID4gPiA+
ICsNCj4gPiA+ID4gPiArCXByZSA9IElOUkVHKERFX1BPV0VSMik7DQo+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ICsJaWYgKHNsZWVwX2R1cmF0aW9uKSB7DQo+ID4gPiA+ID4gKwkJc2xlZXAoc2xlZXBf
ZHVyYXRpb24pOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCQlwb3N0ID0gSU5SRUcoREVfUE9X
RVIyKTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKwkJcHJpbnRmKCJERV9QT1dFUjI6IDB4JTA4
eC0+MHglMDh4XG4iLCBwcmUsIHBvc3QpOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCQlwcmlu
dGYoIlRvdGFsIGJhbmR3aWR0aDogJS4yZiBNaUIvc1xuIiwNCj4gPiA+ID4gPiArCQnCoMKgwqDC
oMKgwqAgYmFuZHdpZHRoKGRldmlkLCBzbGVlcF9kdXJhdGlvbiwgcHJlLCBwb3N0KSk7DQo+ID4g
PiA+ID4gKwl9IGVsc2Ugew0KPiA+ID4gPiA+ICsJCXByaW50ZigiREVfUE9XRVIyOiAweCUwOHhc
biIsIHByZSk7DQo+ID4gPiA+ID4gKwl9DQo+ID4gPiA+ID4gK30NCj4gPiA+ID4gPiArDQo+ID4g
PiA+ID4gK3N0YXRpYyB2b2lkIF9fYXR0cmlidXRlX18oKG5vcmV0dXJuKSkgdXNhZ2UoY29uc3Qg
Y2hhciAqbmFtZSkNCj4gPiA+ID4gPiArew0KPiA+ID4gPiA+ICsJZnByaW50ZihzdGRlcnIsICJV
c2FnZTogJXMgW29wdGlvbnNdXG4iDQo+ID4gPiA+ID4gKwkJIiAtcywtLXNsZWVwIDxzZWNvbmRz
PlxuIiwNCj4gPiA+ID4gDQo+ID4gPiA+IENvdWxkIHlvdSBhbHNvIGFkZCBjb3VudGVyIC1jIGFu
ZCByZXBlYXQgbWVhc3VyZW1lbnQgTiB0aW1lcw0KPiA+ID4gPiBiZXR3ZWVuIHNsZWVwcz8NCj4g
PiA+IA0KPiA+ID4gU2VlbXMgYSBiaXQgcG9pbnRsZXNzIHdoZW4geW91IGNhbiBqdXN0IHJ1biB0
aGUgdG9vbA0KPiA+ID4gaW4gYSBsb29wLg0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiA+ICsJ
CW5hbWUpOw0KPiA+ID4gPiA+ICsJZXhpdCgxKTsNCj4gPiA+ID4gPiArfQ0KPiA+ID4gPiA+ICsN
Cj4gPiA+ID4gPiAraW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkNCj4gPiA+ID4gPiAr
ew0KPiA+ID4gPiA+ICsJc3RydWN0IGludGVsX21taW9fZGF0YSBtbWlvX2RhdGE7DQo+ID4gPiA+
ID4gKwl1bnNpZ25lZCBpbnQgc2xlZXBfZHVyYXRpb24gPSAwOw0KPiA+ID4gPiA+ICsJdWludDMy
X3QgZGV2aWQ7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsJZm9yICg7Oykgew0KPiA+ID4gPiA+
ICsJCXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb3B0aW9uIGxvbmdfb3B0aW9uc1tdID0gew0KPiA+ID4g
PiA+ICsJCQl7IC5uYW1lID0gInNsZWVwIiwgLmhhc19hcmcgPSByZXF1aXJlZF9hcmd1bWVudCwg
fSwNCj4gPiA+ID4gPiArCQkJe30NCj4gPiA+ID4gPiArCQl9Ow0KPiA+ID4gPiA+ICsNCj4gPiA+
ID4gPiArCQlpbnQgb3B0ID0gZ2V0b3B0X2xvbmcoYXJnYywgYXJndiwgInM6IiwgbG9uZ19vcHRp
b25zLCBOVUxMKTsNCj4gPiA+ID4gPiArCQlpZiAob3B0ID09IC0xKQ0KPiA+ID4gPiA+ICsJCQli
cmVhazsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKwkJc3dpdGNoIChvcHQpIHsNCj4gPiA+ID4g
PiArCQljYXNlICdzJzoNCj4gPiA+ID4gPiArCQkJc2xlZXBfZHVyYXRpb24gPSBhdG9pKG9wdGFy
Zyk7DQo+ID4gPiA+ID4gKwkJCWJyZWFrOw0KPiA+ID4gPiA+ICsJCWRlZmF1bHQ6DQo+ID4gPiA+
ID4gKwkJCXVzYWdlKGFyZ3ZbMF0pOw0KPiA+ID4gPiA+ICsJCQlicmVhazsNCj4gPiA+ID4gPiAr
CQl9DQo+ID4gPiA+ID4gKwl9DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsJZGV2aWQgPSBpbnRl
bF9nZXRfcGNpX2RldmljZSgpLT5kZXZpY2VfaWQ7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsJ
aWYgKCFoYXNfZGVfcG93ZXIyKGRldmlkKSkgew0KPiA+ID4gPiA+ICsJCWZwcmludGYoc3RkZXJy
LCAiRGlzcGxheSBiYW5kd2lkdGggY291bnRlciBub3QgYXZhaWxhYmxlXG4iKTsNCj4gPiA+ID4g
PiArCQlyZXR1cm4gMjsNCj4gPiA+ID4gPiArCX0NCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKwlp
bnRlbF9yZWdpc3Rlcl9hY2Nlc3NfaW5pdCgmbW1pb19kYXRhLCBpbnRlbF9nZXRfcGNpX2Rldmlj
ZSgpLCAwLCAtMSk7DQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlzIGZ1bmN0aW9uIGNoYW5nZWQgcmVj
ZW50bHkgYW5kIG5vdyB0aGlzIGNvZGUgZG8gbm90IGNvbXBpbGUuDQo+ID4gPiA+IFBsZWFzZSBm
aXggYW5kIHJlc2VuZC4NCj4gPiA+ID4gDQo+ID4gPiA+IFJlZ2FyZHMsDQo+ID4gPiA+IEthbWls
DQo+ID4gPiA+IA0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCWlmIChoYXNfZGVfcG93ZXIyX2Fi
b3gwX2Fib3gxKGRldmlkKSkNCj4gPiA+ID4gPiArCQltZWFzdXJlX2RlX3Bvd2VyMl9hYm94MF9h
Ym94MShkZXZpZCwgc2xlZXBfZHVyYXRpb24pOw0KPiA+ID4gPiA+ICsJZWxzZQ0KPiA+ID4gPiA+
ICsJCW1lYXN1cmVfZGVfcG93ZXIyKGRldmlkLCBzbGVlcF9kdXJhdGlvbik7DQo+ID4gPiA+ID4g
Kw0KPiA+ID4gPiA+ICsJaW50ZWxfcmVnaXN0ZXJfYWNjZXNzX2ZpbmkoJm1taW9fZGF0YSk7DQo+
ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsJcmV0dXJuIDA7DQo+ID4gPiA+ID4gK30NCj4gPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbWVzb24uYnVpbGQgYi90b29scy9tZXNvbi5idWlsZA0KPiA+
ID4gPiA+IGluZGV4IDQ4YzlhNGI1MDg5ZS4uNGU5MTAwZGRiMmI3IDEwMDY0NA0KPiA+ID4gPiA+
IC0tLSBhL3Rvb2xzL21lc29uLmJ1aWxkDQo+ID4gPiA+ID4gKysrIGIvdG9vbHMvbWVzb24uYnVp
bGQNCj4gPiA+ID4gPiBAQCAtMTYsNiArMTYsNyBAQCB0b29sc19wcm9ncyA9IFsNCj4gPiA+ID4g
PiDCoAknaW50ZWxfYXVkaW9fZHVtcCcsDQo+ID4gPiA+ID4gwqAJJ2ludGVsX2JhY2tsaWdodCcs
DQo+ID4gPiA+ID4gwqAJJ2ludGVsX2Jpb3NfZHVtcGVyJywNCj4gPiA+ID4gPiArCSdpbnRlbF9k
aXNwbGF5X2JhbmR3aWR0aCcsDQo+ID4gPiA+ID4gwqAJJ2ludGVsX2Rpc3BsYXlfY3JjJywNCj4g
PiA+ID4gPiDCoAknaW50ZWxfZGlzcGxheV9wb2xsZXInLA0KPiA+ID4gPiA+IMKgCSdpbnRlbF9k
dW1wX2RlY29kZScsDQo+ID4gPiA+ID4gLS0gDQo+ID4gPiA+ID4gMi40NC4yDQo+ID4gPiA+ID4g
DQo+ID4gPiANCj4gPiANCj4gDQoNCg==
