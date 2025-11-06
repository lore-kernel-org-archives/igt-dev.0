Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578C9CCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 14:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE90810E8E6;
	Thu,  6 Nov 2025 14:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBFCiiiF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02A910E8E6
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 14:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762438190; x=1793974190;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=ihWz/MNQI+K+j25J0BTmB0yYts/WshA4NZKQmiO8tiY=;
 b=QBFCiiiFLFQobZJQjvN/WkxKkY8fwWmKo/lp73YYFDjB/aoeEsl98sMw
 vklIIQmycsyxDEXPjzGltR1wvDAy/exA1nDzBQBuHx0qIexrj7h+Zr4v6
 MMJjRB+81sQjQRaA4tfCVy0WZm37i782W7Znw7HGmVgba0VfYptlraZv2
 zS4qnkDM41Qkh2Q9hdiudKtd4PcZRsXnMcuDbyB/Gb9cCfj3p5epAUF8+
 l07mFVoDbkTZ1y/j+BQKoGszj20ixvgUyG4hWr5V+saMhyfHBbXP62KKi
 XPcoTEucAC/iyXHyedm03KKyfTsaykNqRgsSxlkJQqzBqX3KAdaceL0Nn A==;
X-CSE-ConnectionGUID: 6WKKLjIGQsqQiCHDzXT2wQ==
X-CSE-MsgGUID: iHWvQI/oTkSbfMlK/2HkNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64480910"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208,217";a="64480910"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:09:49 -0800
X-CSE-ConnectionGUID: sjwhAc0sQcGGnggOGKhx9Q==
X-CSE-MsgGUID: oVGESTd4TDCneHB/MkC+9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
 d="scan'208,217";a="187019030"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:09:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 06:09:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 06:09:48 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 06:09:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdh3Ev8IRq3lyIMq1Esxy/zX4tCgXE56RFIFJF/ngr7IOLDZNOCGksWB7fc4G/FXepd/cxV7CiNmrAX+M+nGVeLcU73F6i+n1wfJQyp8kZWkAtL6nO1NfPxOxdp+kbHp+3jnf3MwmYYKl1SnMsVs5YA43Mm87wzhfrMyfIKF0O1W3p7PFaeHTU9IlqC/+S0Lks0UqcpV48zYdHIJerw5BmuM2op7l14XRuf9jD8opLrJ34u7CdrNI3RgWzOUTEbhY4FOW2ca4RVPwoSPDpbgY73PLKqDheYuUdB5rQLyxU46u1Vs4kc6Y8D58f4mFTlduDHV7JSP3uduetjoT6nljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1EfP62+0dRGns5ZcmGWhMDh5EOsORKFUtfUr+snLjg=;
 b=E6wzNIzamstnAh7cFBQL+AZ66U9AAHfbYTiQpjydFP6nE7fhDGkEExEsjXtoIgNTG+ymEc5aWABksLt4A6iJJO+5rE/xMRpZZeG6Uew3owiZ5tZXBXVLNcptiOSyrz55dIfy8yatFtflX2YZJygJ7jfctMdyMsHs/7V726qCFYnoxywmRpDZgKHMy69JmAlMgkYQAF5kFBuxbHs94y42fX01oAmt/mnh02owFDFerMOnpH+mNRthceZ3gKUgKmOKGn4R8b1zXZca7eLUOELzi2XkOykLYKBQXhsmfPfzqFQT0dMVcGa4rotRxnFokiRgl6QpwvNPSQrSW+YMkSdBuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by DS0PR11MB7878.namprd11.prod.outlook.com (2603:10b6:8:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 14:09:45 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::2701:d09b:709b:953]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::2701:d09b:709b:953%7]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 14:09:45 +0000
Content-Type: multipart/alternative;
 boundary="------------iuqDXtv0uqCS5cDq0wjRrXZo"
Message-ID: <a1c0083a-4768-4f9e-90c3-2a3497530e37@intel.com>
Date: Thu, 6 Nov 2025 15:09:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/xe_exec_sip_eudebug: Band-aid
 breakpoint-waitsip(-heavy)
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251104115418.11917-1-dominik.karol.piatkowski@intel.com>
 <20251104115418.11917-2-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20251104115418.11917-2-dominik.karol.piatkowski@intel.com>
X-ClientProxiedBy: BE1P281CA0286.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::13) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|DS0PR11MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: 613e231e-eca8-4be8-0fe3-08de1d3e2328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OC92dVNoNS8wUlBqTWpyS0lwT2MzZy9TU1EzTDBOQ1hmTHEwc3lKd3Z1aTVz?=
 =?utf-8?B?d2grTnNWMVZGUEloRXE0NDNnWVE1OG1rcUZEUnM0VzdleFFCUkhBa2FQdXAv?=
 =?utf-8?B?R2owZ0poWUJqTjJIbjBMTy9GcThOTUlTUHVTWHJzRGQ4bTBhRnlVOGtUU0k4?=
 =?utf-8?B?YmU0OGQ1bXZxWVkzeUd0aEhlVnBHYks2dFZDcGpWQndnS2hJS0FZaVB3MUpi?=
 =?utf-8?B?OU42SjJCbEY5ZU0rRTNwNnA5MDZlQWp0enlYS2IwVzVJVWtYY2E0Y1VNRUlS?=
 =?utf-8?B?eTRvVDlBLzFLWkJBQU9PUjBTQ0NTLzBmQnp6Q2dZbWZuODBGSThVTER1ZXN4?=
 =?utf-8?B?alhuaEViY05YaXQweXcvdExidnBaWSswY3hVZnZ5NFIwU3Awbzg3aXlIeWU5?=
 =?utf-8?B?M2pTWmxpVDhOM2ZsWFRjZGM0dnZWR0pVQkdlL2VOaE53ODJhUzR2QTdlYlVG?=
 =?utf-8?B?OUUvOWNBMEQ0NEc1a013bWloMitSSGlncUtKT1VuWlNheGxOZm5UOTlrVHVW?=
 =?utf-8?B?OUhDSGxCaVRZeUs3MVFOZEhiYXVUalpndVl3Q2xnZHVaM2l5TEd2S1drQUc2?=
 =?utf-8?B?OWtYTG1KN2ZUSEowR29heGxMNUwxckFhcUU4S2dEb1FuT0FnNm54blRmU21s?=
 =?utf-8?B?bDdpNExoamZhZnpycEI2WVZHTHgrL0IxRW1PZFNHTUFiNXlaVnBkNXU0c2Nr?=
 =?utf-8?B?YmFNK24rcXBDWEpBeTB6TzR5aGtiQ3FSVnB3QTlPU0QrWXY5ZjNSKy9JL2Mw?=
 =?utf-8?B?NlFHMWZ4ZTdIS3dTcEszOHFualB4NGQxL1R2Z0I1Y3lFT2g1cmRPcWJSdUF1?=
 =?utf-8?B?WVlIL0xNeEJxYzNUZk9CZTcyNHZnNTJCVzhSN05NcXJ2VHcxVjA1REljTkt5?=
 =?utf-8?B?UGRTNWNKb2VBcyt4R2taSEJnWnpEN3Z3ZGhjM3NmNEJQdVBWYnZheG5yZm9O?=
 =?utf-8?B?RXBIYk5JKy93cjJvL3dNa1lQa3p6OEhheGxUMTR5MHdxMm5LcjJPZ1dpa2Iv?=
 =?utf-8?B?bFExcjAxL3Byc0tVYkFuMng1TS9tR0Vsd3Z1cXRiSFZMNGF3TnV2R2JCS3cz?=
 =?utf-8?B?VGxKOGtqQXBCL1dUTjhvS0lSand6blQ2Yi9nRjFad3M1MDNDSjU0bjYxLytN?=
 =?utf-8?B?Q0JTTERsZmhWaTVRMHpyc1N6NzBZZ0tBOXZsOWVCdmx2SDBUbjQxQW5uMXY5?=
 =?utf-8?B?eUZNTkdUaFNXa09NS1RpdEo0eHZ3QlFUQjR2QWxQRUluVksxUkx6SzRwVUpu?=
 =?utf-8?B?bVlrREtTU3NMcjllTzE3NHl6VkJ1bkNQeStoTlgzeEJZRXdRRE9iTjNDYTVE?=
 =?utf-8?B?bmdZNkpNWGx0bnBjYVFwV2VsREw4dGN6NTQ3bXkzMDR3aXB3MU5ZSW9HcGw3?=
 =?utf-8?B?bkMwZThrOGk1YWlFNmxQZTVvUUp1UzRSYTZsTkFEdUs0QlFQdHVTRERaVmU5?=
 =?utf-8?B?TmZnUFVhVWYvWm12NkpsVnE3UTNLc0I3VmQ2Uk14OUVvSmowOXFSN1gzZHFE?=
 =?utf-8?B?aHcwU3dZYU1RcW5uajIyQlRaa1NIUG9sTWY4RWJ0RUUzVDQrQlZDczN6Skpa?=
 =?utf-8?B?NFZ5MThucDV1aTl6RjFZdG1wS1NDZ2N0bXo5RndWT3VBT0JvdjdJamRKdGxI?=
 =?utf-8?B?eUR0K3FqRTI0emhHd0dVQ0s3MlpVTnVRQzByV2xkaWJCUk41bkNBZnNIakxJ?=
 =?utf-8?B?OVhwQ2NlZk1kYiszUThiZFhiZzNnSVJsa0ladC9oMUtGTHg0TTZRMzIrN2hH?=
 =?utf-8?B?L2l4RGJScTJQVVBDN3hFUWpDeHl5UDNuNmtwMnIxclhUTkVwTWNIWkNkUlRu?=
 =?utf-8?B?elBKdUZKMEhKK3hFUFNlZjB6aXphRGtoZDNNQVBZZy9PcXZSOW5UdWROWUpI?=
 =?utf-8?B?RHA1QlIrTUxQN2Rha3ZVZlFWNFM2QVN3MWFXZzFMaVJ2d3RpOGZRcVdLTXZj?=
 =?utf-8?Q?YmYnPNMvaS9Ew1ZUA4kpWD0z47+ZZ6Af?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUt4VzQ2Q0N3OXgweEQ2RFl6YktBQmxhM2RNdkJrYytNaWthT0dsUjAyL045?=
 =?utf-8?B?dUh1TlZtV2Q4MFRuazNPenBabG1icFRxM3c0UE5jaGFKZkFJMVJBNUVHUzBk?=
 =?utf-8?B?RGVKenZhWGJDUCtNbEFhdXk5SS9zWlJKY0RGdDdlR2I2eEdQTGJjVldsc2dr?=
 =?utf-8?B?TE1qSGxvMVpuaUtSY2sydFJ3Z0dCNTdBOVVJb2NqdEJpeFp2NWlpck95QnBL?=
 =?utf-8?B?dGJNN1lzNG1rRTZiTUlIcWpVNkU1VXdBbTB4Y0JQSG1wdjZrRFpXTkw3QXFC?=
 =?utf-8?B?dGtsNkJHZ0k5S29lMEJ6eGVPR1A2MFBFbHRKTnphZ1NSS1Rkd0hpQUlSUnZZ?=
 =?utf-8?B?OVRlM2FndXFmRzM1M05meFhwem5GNHIwcEl3ZHloaWYwcktRZ1MvbHYvNnBp?=
 =?utf-8?B?ZERybnM5ckRSbE1QVU8wM1FnN3F0Y2hvSDRyMUdSZFlXOU50VlhIS3Rmc25R?=
 =?utf-8?B?WXZpK2hSYmtUbHUrUkIyN1Fvb0JLZ09VQTZNaFU0UW9WZTM3QXA0VFo2Z1lK?=
 =?utf-8?B?VFQ1RElzNjJ3R2ZkNHJjZU92SFkxZUo3cThjY2hDbzF2cnVrM1VOY2crSGlH?=
 =?utf-8?B?dDBhR2RadDJxa3RiYjJzSjJYeU5zeXVXQURzaVJiS1V1ZWRpbCtBOWlrTmN5?=
 =?utf-8?B?QlpjZTZUa2pCQk1IR1MxZElrTnRLbXQ3NysrV0RxU3R4eFFSc0RzbTZYK3R5?=
 =?utf-8?B?ZmxWdTJsQzMwbmtmZjVEcFFobmxsZDcrcnNDSlM2TnRLT0JRUTZidGlzQUMz?=
 =?utf-8?B?Uzlic2pQQkNpTWZ2OS8xL2hQcnd3Y3hZMitZcWp1dmhQeDRkUm14MXR4Tzgw?=
 =?utf-8?B?M216bWVoU2NOK20va0grUjN2TENoTllFcDRNbUNqeWFvWlBPMjNycmE1MVdl?=
 =?utf-8?B?SmN0cEgwQkFIVjVabFhRQlUvYmtuZEgxRkM0bDZ6VFVhckZJMnQyUTFuSzNh?=
 =?utf-8?B?WnZDREpacXZMalVjcC9FS0hNWXJwbjY0RzFnZllMSFB1THZ1cFllajRabDhW?=
 =?utf-8?B?OFJ3Y2RKMGVhQlJFSjNVSWFtd0ltdUlZcUllVk0vcStMMGt2dFBpbG5IQkNH?=
 =?utf-8?B?TzI3azB3OTdyZXhwUVF0NnorNUFVWXlScXBzUVVZWkFXTmxoZWJCR3k2VHV5?=
 =?utf-8?B?WUdvTlNyYUpYR0EwSk9SVFhsdVA1eDlGQXRKY2laekE1bXRsTVJwUTYvQ1BV?=
 =?utf-8?B?TjhDdXYzL0ZxeXIyKzJEYjBObjg5Yi96T3MxVW1jME0zQVBJOHpKaEs5ZEtk?=
 =?utf-8?B?ZGtJVWk5MlUza0xvQ2hLQzc5MmN2bzlOOWZOemh3NFhmcWtJWEEvNCtQdURx?=
 =?utf-8?B?b2dITU14b2U4dHFteXNkbWE3Z2hneElCY1pBc3BQMXdtRlZHL3RvbkxGVTJS?=
 =?utf-8?B?djZZdXR0OFVPQ0VFQnozOWZUY0lDVGRKN2oxOHg1RmFTSy9xSGEzbHhwRzZr?=
 =?utf-8?B?WlIwdG5uODlvWlpnd3A4QmtJMlJaZG9vS2hIQlorNVVLMXRwenV1VG1rSllo?=
 =?utf-8?B?dlIwU1V2MFZVeTlMdWlCR2tzNUM3dzJzNlhRbWxNS2FEVlZ1Wmltem0rbzI1?=
 =?utf-8?B?Z2hTSTZVN0lCaEFueVdITU12RUYzdlNiUkJzbnRkMmg4RkRxK3ZOZm1aNkl1?=
 =?utf-8?B?ZVUrUFI3QXFidHlxRldLbWtrVWloNVByQzhHTE9LK2JuUUovNGx1dHZTV09z?=
 =?utf-8?B?UjAvdldPd2ZSOFZyZzBBWXlXYnVWY2wvUUVXaHhVV2laaVNucUJ5c2RvRU5O?=
 =?utf-8?B?aUpmR2pyejNsYTk5emJDWnBaYUxtZGppanFpVHpZRFhIdHBqaVd3b3dtTUZO?=
 =?utf-8?B?cjR1ZzkyK3RZV0tEMm9xVkxWRzBhZDlNZllJUG5hNEtkSHN5ejFab21BbUN3?=
 =?utf-8?B?UGFWdTVQM3piekRBRHZOdmNQNXhESUJlb2MyM3E0WEhMNG9QZTVTWkEyRXoy?=
 =?utf-8?B?QUM4NnJ4Q3FpMjFWQzVxOGF1Tm5DanNvVG13eFNXRENIaGhqeldOcFAvdERy?=
 =?utf-8?B?NHlSNUltSFpPeEl1ZVJLREJIVzhiS0FRNHhTSjNqRllLMFhBcnh1Nk5sa0RF?=
 =?utf-8?B?c29tWFVLc1psMlJhWVRtVlhOczUrN1d1eTRHTnRFSkVNYm1KQjVUVDdGVFhz?=
 =?utf-8?B?Tk9tZEhRTzFNSTYvZjB4Z0V5bmFjQldLZDFydUp2K2NkT2p3VmlQSmZnZkNw?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 613e231e-eca8-4be8-0fe3-08de1d3e2328
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 14:09:45.1056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41X6CxWKl5v1dWUnjRUXKUOziC4/iBlo8QkutcZlfsRVzTy16kbn68rwyaqou5TtjhrtKXyT3/xMdue7TUc8aZWfOQjW1G3NCMk5OwC8GJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7878
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

--------------iuqDXtv0uqCS5cDq0wjRrXZo
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2025 12:54, Dominik Karol Piątkowski wrote:

> Both breakpoint-waitsip and breakpoint-waitsip-heavy are expected to trigger
> a reset, but the reset is asynchronous and can overlap with test starting on
> next engine.  Mitigate it by adding an arbitrary sleep until a proper
> solution is in place.
>
> Signed-off-by: Dominik Karol Piątkowski<dominik.karol.piatkowski@intel.com>
> ---
>   tests/intel/xe_exec_sip_eudebug.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
> index e5b8ba418..6af034380 100644
> --- a/tests/intel/xe_exec_sip_eudebug.c
> +++ b/tests/intel/xe_exec_sip_eudebug.c
> @@ -304,6 +304,16 @@ static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
>   	xe_vm_destroy(fd, vm_id);
>   	xe_device_put(fd);
>   	close(fd);
> +
> +	/*
> +	 * XXX: build a sync between reset and test end
> +	 *
> +	 * Both breakpoint-waitsip and breakpoint-waitsip-heavy are expected to trigger a reset,
> +	 * but the reset is asynchronous and can overlap with test starting on next engine.
> +	 * Mitigate it by adding an arbitrary sleep until a proper solution is in place.
> +	 */
> +	if (sip_type == SIP_WAIT || sip_type == SIP_HEAVY)
> +		sleep(1);
>   }
>   

If we know the GT the shader was running we can use debugfs sync reset 
feature.

Like something

/sys/kernel/debug/dri/0/tile0/gt0/force_reset_sync

If possible.

Regards,

Maciej

>   #define test_render_and_compute(t, __fd, __eci) \
--------------iuqDXtv0uqCS5cDq0wjRrXZo
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>On 04/11/2025 12:54, Dominik Karol Piątkowski wrote:</p>
    <blockquote type="cite" cite="mid:20251104115418.11917-2-dominik.karol.piatkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">Both breakpoint-waitsip and breakpoint-waitsip-heavy are expected to trigger
a reset, but the reset is asynchronous and can overlap with test starting on
next engine.  Mitigate it by adding an arbitrary sleep until a proper
solution is in place.

Signed-off-by: Dominik Karol Piątkowski <a class="moz-txt-link-rfc2396E" href="mailto:dominik.karol.piatkowski@intel.com">&lt;dominik.karol.piatkowski@intel.com&gt;</a>
---
 tests/intel/xe_exec_sip_eudebug.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
index e5b8ba418..6af034380 100644
--- a/tests/intel/xe_exec_sip_eudebug.c
+++ b/tests/intel/xe_exec_sip_eudebug.c
@@ -304,6 +304,16 @@ static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
 	xe_vm_destroy(fd, vm_id);
 	xe_device_put(fd);
 	close(fd);
+
+	/*
+	 * XXX: build a sync between reset and test end
+	 *
+	 * Both breakpoint-waitsip and breakpoint-waitsip-heavy are expected to trigger a reset,
+	 * but the reset is asynchronous and can overlap with test starting on next engine.
+	 * Mitigate it by adding an arbitrary sleep until a proper solution is in place.
+	 */
+	if (sip_type == SIP_WAIT || sip_type == SIP_HEAVY)
+		sleep(1);
 }
 </pre>
    </blockquote>
    <p>If we know the GT the shader was running we can use debugfs sync
      reset feature.</p>
    <p>Like something</p>
    <p><span><span class="ui-provider ed bic bem buo bup buq bur bus but buu buv buw bux buy buz bva bvb bvc bvd bve bvf bvg bvh bvi bvj bvk bvl bvm bvn bvo bvp bvq bvr bvs bvt" dir="ltr">/sys/kernel/debug/dri/0/tile0/gt0/</span></span><span><span class="ui-provider ed bic bem buo bup buq bur bus but buu buv buw bux buy buz bva bvb bvc bvd bve bvf bvg bvh bvi bvj bvk bvl bvm bvn bvo bvp bvq bvr bvs bvt" dir="ltr">force_reset_sync</span></span></p>
    <p><span><span class="ui-provider ed bic bem buo bup buq bur bus but buu buv buw bux buy buz bva bvb bvc bvd bve bvf bvg bvh bvi bvj bvk bvl bvm bvn bvo bvp bvq bvr bvs bvt" dir="ltr">If possible.</span></span></p>
    <p><span><span class="ui-provider ed bic bem buo bup buq bur bus but buu buv buw bux buy buz bva bvb bvc bvd bve bvf bvg bvh bvi bvj bvk bvl bvm bvn bvo bvp bvq bvr bvs bvt" dir="ltr">Regards,</span></span></p>
    <p><span><span class="ui-provider ed bic bem buo bup buq bur bus but buu buv buw bux buy buz bva bvb bvc bvd bve bvf bvg bvh bvi bvj bvk bvl bvm bvn bvo bvp bvq bvr bvs bvt" dir="ltr">Maciej</span></span></p>
    <blockquote type="cite" cite="mid:20251104115418.11917-2-dominik.karol.piatkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
 #define test_render_and_compute(t, __fd, __eci) \
</pre>
    </blockquote>
  </body>
</html>

--------------iuqDXtv0uqCS5cDq0wjRrXZo--
