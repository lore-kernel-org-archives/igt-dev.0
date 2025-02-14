Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F01C021A4
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 15:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E21D10ECFA;
	Fri, 14 Feb 2025 15:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GqnasB26";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D10810ECFA
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 15:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739548443; x=1771084443;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6/4B1KxkAXv9B3Ae8qU5LjJCdcZcNbnGBc+/60jfb4Q=;
 b=GqnasB26DnZ868bj1V0QRSVSHyoilgdakE3tuu/Ez8l+fYKoNdJYirj1
 18ioT6PyHvdFjHqkFEgHEWS9TEdkmZjbZa5AUANw+JAstRtazYECkg0W3
 XhZ5CbRky3AdbI05ORR7kE4UekcMZ602M6ZiPE3NvIX2AKUd59UqdSL/x
 AlxVR0WCmX2tCCoguKEau9eD0BFgRIyaLU+p8WirlvNn5C8Gp7FvTLYuf
 mX22hPMmnXPADwUYzGKcDkCE7TpvLvyUmzJ3uj8h8BaYCDhLUiebBtnKy
 s7Kqk3b52c1KBrh0w65C7L13fhQjNYj82q6bMNMZatsBnmBy5DhJLI2fz Q==;
X-CSE-ConnectionGUID: LQ6jmpPFQ0mlz/FGY8gBFA==
X-CSE-MsgGUID: Xn7ac/rhTom0bkDlbWrleg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="44230627"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="44230627"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 07:54:00 -0800
X-CSE-ConnectionGUID: wlWzFXxcTsqNES7fJGImzA==
X-CSE-MsgGUID: yKY72cKAQJGpP4FbZQLfrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="114005358"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 07:53:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 07:53:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 07:53:57 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 07:53:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAp75w/DCW8A1PW1we3Tuv1/POxcslCuxnM0OgYHcNXNyA7plK4uZulT4xR5n32ETMXsDLFP0TtqgWyGpYGCuXO5Fxm9nLIjzsW+exbimc9QYc9yvdrEKAJ6rYFo0tGJaT2uv1o4QR0FSTs9nxrAaSvhfJgNs7gxgZhnyiARoZCoSLir6J2sDxj3OYbbgnk6WUEA6e18iMTrobC2p/8ryKym91Z8DKPGlGeJSEx6fl5n4WaGhf10oCMJlNN9LT+IKEOmg/LRVVNm9liU7TsJBHDowfZ54O4F3nCejNTwGIcAkyC5VrSlJe1oR3d25DiTz+9R4+Ul1bGtB8WArJgL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNoL351GVfDQZSW7jxX5GOW1jBFOfMsz/qB++wiBDno=;
 b=qMRgG3ilkE86RSoeSLeRZHZYlPmlZZRbCRzFNean1JmMtF+aU+QM5Jx9SoE+6DIdnj7z+20HYekJu57B1dv31kM8WhEdahvhUZgp2b90Knco+owQduS44zVrCerqrWInsOwrcNBLBTaKmu1W7Ujok6apkauHyUuMuFNSnaHtGWQIDRi2KMZx6FUfa6/8Rx7op0METw/VucbJ98HlvLM3naCQZj54ysd6WC8Q914u1gMqozYVvir3oOfG8RLurIEmk0lQVeSntWcsFWZrfyGj+F/XFgs5EahYOBIVILwHwRVQESyYRQNe41zO0TDupJsNP6XXA9pkNDJG0vP3ISdfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CY5PR11MB6284.namprd11.prod.outlook.com (2603:10b6:930:20::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 15:53:53 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 15:53:53 +0000
Message-ID: <53dc7f0e-7ced-4a2e-85d7-ae2a39967d51@intel.com>
Date: Fri, 14 Feb 2025 21:23:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms: Drop 'Functionality' and 'Test category'
 from documentation
To: Lucas De Marchi <lucas.demarchi@intel.com>, kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Katarzyna Piecielska
 <katarzyna.piecielska@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20250210105646.307902-1-swati2.sharma@intel.com>
 <5mwzt4z3uhjdsohlym2366irc7hqbidufmymh7dasmzkg42hi4@7b3inieyxliq>
 <0302d77a-2202-4c8b-abc7-800ed84b1141@intel.com>
 <n3kyty56cmjqniby7uopeiklhzapt324sxnlhahkmjoelrpaou@umqhk2lztir3>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <n3kyty56cmjqniby7uopeiklhzapt324sxnlhahkmjoelrpaou@umqhk2lztir3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::16) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CY5PR11MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: e1394894-2b16-4627-0727-08dd4d0fc73e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkEvdFllRGNxK3Y2eXRSSS80QnZYRHF2bDl6dlkxNUh0QlgvTEpVVXBTejdS?=
 =?utf-8?B?dnJGdXhPN05nZllHSjgveVdqRTFTeUUzQ1B5Wi9KdDhPT0RCT0VpaFpPd042?=
 =?utf-8?B?UVNxNmltNzhpdjc5aWxKRmxYY2dwSlpibW5QeEtsZngycC9CbVMzdnRYRytq?=
 =?utf-8?B?RnIzMmVhNzc3eSs2VmtaOEpNUitGdlNvZW1RdjFuOWszMUl0SDdQYThoYzlu?=
 =?utf-8?B?bzR3MkhjUEhXSTJmdndZWVRQUmIvZDB2ZFUrTnNtL0Z1T0p5b0ZvNHp5ZEtw?=
 =?utf-8?B?QnJXR0oxNlorOTAyNnozUisrU0x0NDBmS2lUQlVvdlM0b1dqYlZSRkMwblJK?=
 =?utf-8?B?UE9kMmc1NTJzWS9LNVdtbDYwTGpEMFpVa1F2a25yT2JFbEoyM2hzenB4MWk4?=
 =?utf-8?B?OEIyK2E4NEcxZktGT2JnQitjQnFmRjJiT0grTWVIeTNIOVVrSmRBVS9CaVFX?=
 =?utf-8?B?WkNUeFBMMUlER0l6blNTT2JaRVNLM2EzVUx1OUJJZWlaODd4cUJJams4b0dq?=
 =?utf-8?B?SlQwNmdTQjhTRlV1MUNSVUI3RlZ6em9KTGhZRGpCV0psZXNHeGI4MFdrems2?=
 =?utf-8?B?dUYzQWt6OE04RjJ4MzZQRTNkRlRoa2Jid3NTazZiQld0VFRRSjdjL0kyOHkw?=
 =?utf-8?B?Y0lhd0wrbHdWVHM2bnNXUGdkaER0T3VFeE5aSXJ0bFo2Wk1jSEN1b1RXWkdk?=
 =?utf-8?B?WGIrVm5XbXJaVHpPSGJESTArY3NBQ1pLeEpZci9Od2pueTA0UnVtclQrc2Mv?=
 =?utf-8?B?VW9iOWJad0NYOEh2TzhacmpPVmcxL01NTGxiZjVyT3NaVGdYc0FpRUxRNVds?=
 =?utf-8?B?UjRURTR4Q2djTFdYbGVqUjV3bVVwdld0SGR1QndwOHRQcnpWVW5sQm5SNDJz?=
 =?utf-8?B?THk1Z3RxVzBmVWhxaEJGRUJHVGRlWEJ4REpiWjRpaXVCSjJFSnNwTzhrQnRz?=
 =?utf-8?B?QUMzS0VQVVgxY1lZUEFCd256b1BQdWNtR1NZK0xMem1qUFByQ2tlak55VW84?=
 =?utf-8?B?ZzQ2TUxNYjBPeU1RenJqKzM4N0hneHJpNUc1R2xsUFBlTGg2NGNLTERTbWww?=
 =?utf-8?B?Q3pTSGtnQ2RCV1A4b3pFV01iaHFGai9aYWt4S3FpK0tUazEvOE9WSmNjbkda?=
 =?utf-8?B?UkRVWWl6aEFTclFkSkhvSVkwWSt4eit0eG1YZHZkOTFkRUc1WW0wQnlOQVVK?=
 =?utf-8?B?Q1hiajAxK0tBaGFleFlLOXRyZ0l5d2dFdzNML0cxVU9BNGplRUJEcmFBbkha?=
 =?utf-8?B?QXNIVm53R1p1cTRvL2l6RUJBVDdEa2E5WjZnOXBBYUZUZHpEQzVuSTVGd3Jk?=
 =?utf-8?B?M2Q4UHIxemdmVzFRYS9penFvMDlybitqUzlhZnc0L1VGMFo2TWQ0Y1VxaGky?=
 =?utf-8?B?MU1oVlBFQlJrc0tCQUluNm81R2tkK2RSUXl5SzM5R1pDZXR3bTJzY05OemVO?=
 =?utf-8?B?ODAxK0lIV2puakt5Q21QMDM3QjVZL3R6RlJKQ1IraVBlTkNCL2NNSTQ0eUhp?=
 =?utf-8?B?bWpZZFJJU054Z2l2K1ZhVnQ1RWNkQnBoS0hWMnNNV3Z3WWhvUDBFc3N5ZTFm?=
 =?utf-8?B?WElKYndjUU5RNE1iMmlrSmRHUFJXMll1YzZCdDlMSTRoUCtMaWRwUCsyUzZF?=
 =?utf-8?B?UXBNMDZZL1dtNi9La0wyZ3hmZHE4d294aGRrNXB6aXFLM3U3ck44NFN5UENE?=
 =?utf-8?B?Y2JlVTh1NmErcGZ2OVZ0ZE9CUUNtOWpIU2RzTjhoMTZZYXpEY1RrbHNSVUhw?=
 =?utf-8?B?R2lyTWJhdktRZ1lQYkMraElWYlYremtaeEUwa1IyN3VtaHVHb0hudmVMcTU2?=
 =?utf-8?B?RjlzN2Q5ejg3N1J2RzQvTmRFZEVLbndqQ3U3cFBQVmFubFBhc05jME9IL3pi?=
 =?utf-8?Q?4y2oW/MFo4S1K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFhwcVRZT1ppZElMMzREdThpaUlha3RacEZoL1ZUaTZoM3N6SllJV3VDeEE5?=
 =?utf-8?B?NDlGNHYxTGpPSHZ0aHpqcjJ5Ym5vK09XWVYrWHNGV25DNDBLY2lBdldpakNw?=
 =?utf-8?B?bmhKY2FhVFFpVC93RFNXWXB6SGNFNXZwckthN3ZQQnh5TFhONmlCOEcrVlhi?=
 =?utf-8?B?ekRDbm1YeHVIM2pFYnY5M2hpUVFYQkI2dFRHLzdxbFFTbUhFRXNObEloM0dW?=
 =?utf-8?B?L25kb0hwSWZPbHBGblc4SXFTNzRqZEdHL3V5LzFXT2cvSW1LYUdPY0NoN3Q3?=
 =?utf-8?B?a2dPTG1qNjZlb245cFM5MzhrdnNGdUgrRHU2Zkd3OURrWVd1eFc2emlFbXkw?=
 =?utf-8?B?MTVHUXVwTzNQcFZHRFJZNU15NVJLRW1ucnZTWWhHWm5KUzF3MGs2eFRzY2Ra?=
 =?utf-8?B?SzNUVEsrY0dwQWx6d0ZMQWxvSUk2MjBMVnAxclg1VStRNWpBQzRoNEFLRkpo?=
 =?utf-8?B?SzQ1Z0xPTHozWjh2bkJPcHp2WnRyazNzYm9lOGVYOEFDdlI3SENaMFBScXJG?=
 =?utf-8?B?aXFxTWhXTFJIN0F0OEMvUUJjMHA4WU9oQ0w2c3ZxQVFycHhqRjFkZW9uVmtq?=
 =?utf-8?B?anpQM3U3aTFQZ3FBaUtpSTJWVWR6NWc3cDhmempmSG9RRW94ZEt3OTJNMUpx?=
 =?utf-8?B?RXM5Vjc0ZFdGb09PT1dRNFZ2aTVrS0lWL1YwQW1oNlo3ZUdWc1BhdktoZWxJ?=
 =?utf-8?B?SC9pSVhCY29VaEhtY1U1Qzg5TjlqMzN4SGxaNEIvRU85bDNWNUZkK2c0c1pM?=
 =?utf-8?B?NkFON3FJY1NPMW9JZVVaeTNCczVhSW5ub0JzN1hrWFV2T2Y3RHlQVXJpaTM5?=
 =?utf-8?B?b3Bvd2lrQ2xtUS9iT3o1c3MxNVBHKzhvNVRQREs1clp2Y1FKL3dybGlPNUVa?=
 =?utf-8?B?em1xUjJWNXN5QkxyMStsdUx4bDhFaHdPRmQzSlNKTjRBTnd0ZFFQb0lEWjF6?=
 =?utf-8?B?c0twVDczTVdVNWlNeVprYytuSUdENVN5Y2ZxM1FSWkFXbUlPTFVkVDN6SjJI?=
 =?utf-8?B?SzNmRjdhNkJaRGZ4VU8vNHBVMkpoTHNXY2pHSmo4b0RTYldsK2pqUm0zRHB6?=
 =?utf-8?B?dHlkM2traUpFQS9RcnRTaGZONDNFcGh5THZNRzhNb0pqYWxTcDVKVzdYcUtm?=
 =?utf-8?B?Q2QzMGJxNEVkRFAxTEZJazc0eGMrR1B1Um5iT253L2ZVT1M3VlBXbWcxbmVO?=
 =?utf-8?B?aWs3Nm1WZkxIeTlWbkVySVl4Z3B3MlB4bnJqSkZJUUF1c1oySS9BSHl1Tlhr?=
 =?utf-8?B?d29jM2NXSGVER2lqdmYyUVQzQ3hZVjRHTmszenVNZDBJUWRZbWQyQkkxbzFm?=
 =?utf-8?B?UHMybHZZTGNmRFl4S1JOTnFJQkQvVzBsWlJISmUraUU5cnpCUHVsbS9TYlpN?=
 =?utf-8?B?RUtBUjNWRUpNZC90NVhHc1dOYVpUSnpuTktIQm1ObzdKaEtpQXV0Tjk1anFG?=
 =?utf-8?B?OVdsQjJncnRrTyt0T3pPaTkyTzJrVm1qdzhhazNJcnJTM2RxTi81bkxoZFM0?=
 =?utf-8?B?amtSYVZHOG95UkdZRVpvbmpDYlNpekpiWkNtbU1RU0FOZFpLU2pXU3RyOVlu?=
 =?utf-8?B?eHFxeW4rNk5pOGp6MmtGdGUrcVFUckxJMVZveU9oOEJXNTdwOHlWcnNlUkww?=
 =?utf-8?B?TnAwZjQ3QVNpTStQNXNTVzBwMDFlV3RUL0ZRYlQzdHBOU0Ryekc4ZUsyeHU1?=
 =?utf-8?B?ZGdIbzZmVkRFbHpMM2hoZExtUUUvNHcxbllUZkwva2R5WUR5dWVyWmtBVWp4?=
 =?utf-8?B?VVkwOTB4SjRvYVVjOTNjOXM2cFpUQ2ZKcVhzL1RaWFVPMmRxbmg4M3JDc09G?=
 =?utf-8?B?ZU9OcDZIRUltT25GMGZ3UEppQjd6ZFZmSEJJREowUkw0MkdmTlo0bjNGbDFx?=
 =?utf-8?B?UEpRRXhocjJob0d2eXRBR25CMGo3ckFOaG1JeGZzVS91dlZIZzJZNkU2czVi?=
 =?utf-8?B?c3BBT0lXcW5zSTh0RW5vOVpHR2Q1eDV1K0dOU1NMU3dEY0FmYlBkT1RTVmJJ?=
 =?utf-8?B?Njh2aVlOZDVXLzMyZXFiNTlNNHlMWkhzQ05WOVc2aWR2M2ljTmFLdi9uTE5U?=
 =?utf-8?B?NlFLMEt3aG9wYlNIZEQzc2pYWmZkODR5M3ZYS1Z6R2oyb1Q0UHR3L21lUTI2?=
 =?utf-8?B?ZFJ2SnkwNW9nUnZmOUZzTkUwa2oyS1pTalVTQVhjVk5Ha2VtWk1XOHpNZGRQ?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1394894-2b16-4627-0727-08dd4d0fc73e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 15:53:52.9953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Su37MTp4KSDxK7+9f8G9cvHGIOFIj/4oTAs0tKSo4EeCdwDpLhEDk2jlRU9e5EKQ0uXaCe+sD5QfnpxHON1Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6284
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

Hi Lucas,

On 14-02-2025 08:22 pm, Lucas De Marchi wrote:
> On Fri, Feb 14, 2025 at 01:04:55PM +0530, Sharma, Swati2 wrote:
>> Hi Lucas,
>>
>> On 11-02-2025 12:55 am, Lucas De Marchi wrote:
>>> On Mon, Feb 10, 2025 at 04:26:46PM +0530, Swati Sharma wrote:
>>>> 'Functionality' solely depends upon developer's interpretation and
>>>> 'Test category' is not used. Let's remove them from the kms tests
>>>> documentation so that documentation can be made precise which
>>>> is easy to maintain.
>>>
>>> but is this needed elsewhere?
>> No, this is not a mandatory field for KMS tests. No no change 
>> required in json.
>
> let me rephrase the question:  you are removing them from kms tests and
> not from other tests... so the question is: can't we remove them from
> everywhere using the same argument you used to remove from kms?

This depends upon core folks, KMS and CORE documentation is different.
@kamil @kaisa any inputs here?
>
> Lucas De Marchi
>
>>>
>>> Lucas De Marchi
>>>
>>>>
>>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>>>> ---
>>>> tests/chamelium/kms_chamelium_audio.c   |   5 -
>>>> tests/chamelium/kms_chamelium_color.c   |   2 -
>>>> tests/chamelium/kms_chamelium_edid.c    |  11 --
>>>> tests/chamelium/kms_chamelium_frames.c  |  11 --
>>>> tests/chamelium/kms_chamelium_hpd.c     |  26 -----
>>>> tests/fbdev.c                           |   2 -
>>>> tests/intel/i915_pipe_stress.c          |   3 -
>>>> tests/intel/kms_big_fb.c                |  11 --
>>>> tests/intel/kms_busy.c                  |   3 -
>>>> tests/intel/kms_ccs.c                   |   4 -
>>>> tests/intel/kms_cdclk.c                 |   2 -
>>>> tests/intel/kms_dirtyfb.c               |   3 -
>>>> tests/intel/kms_dp_linktrain_fallback.c |   2 -
>>>> tests/intel/kms_draw_crc.c              |   2 -
>>>> tests/intel/kms_dsc.c                   |   2 -
>>>> tests/intel/kms_fb_coherency.c          |   2 -
>>>> tests/intel/kms_fbcon_fbt.c             |   5 -
>>>> tests/intel/kms_fence_pin_leak.c        |   2 -
>>>> tests/intel/kms_flip_scaled_crc.c       |  12 --
>>>> tests/intel/kms_flip_tiling.c           |   2 -
>>>> tests/intel/kms_frontbuffer_tracking.c  | 147 ------------------------
>>>> tests/intel/kms_joiner.c                |   2 -
>>>> tests/intel/kms_legacy_colorkey.c       |   2 -
>>>> tests/intel/kms_mmap_write_crc.c        |   2 -
>>>> tests/intel/kms_pipe_b_c_ivb.c          |   2 -
>>>> tests/intel/kms_pm_backlight.c          |   5 -
>>>> tests/intel/kms_pm_dc.c                 |   8 --
>>>> tests/intel/kms_pm_lpsp.c               |   2 -
>>>> tests/intel/kms_pm_rpm.c                |  15 ---
>>>> tests/intel/kms_psr.c                   |  33 ------
>>>> tests/intel/kms_psr2_sf.c               |  25 ----
>>>> tests/intel/kms_psr_stress_test.c       |   2 -
>>>> tests/intel/kms_pwrite_crc.c            |   2 -
>>>> tests/kms_3d.c                          |   2 -
>>>> tests/kms_addfb_basic.c                 |  17 ---
>>>> tests/kms_async_flips.c                 |   4 -
>>>> tests/kms_atomic.c                      |   4 -
>>>> tests/kms_atomic_interruptible.c        |   6 -
>>>> tests/kms_atomic_transition.c           |   4 -
>>>> tests/kms_bw.c                          |   2 -
>>>> tests/kms_color.c                       |   2 -
>>>> tests/kms_concurrent.c                  |   2 -
>>>> tests/kms_content_protection.c          |   7 --
>>>> tests/kms_cursor_crc.c                  |   5 -
>>>> tests/kms_cursor_edge_walk.c            |   2 -
>>>> tests/kms_cursor_legacy.c               |   2 -
>>>> tests/kms_display_modes.c               |   3 -
>>>> tests/kms_dither.c                      |   2 -
>>>> tests/kms_dp_aux_dev.c                  |   2 -
>>>> tests/kms_feature_discovery.c           |   7 --
>>>> tests/kms_flip.c                        |  14 ---
>>>> tests/kms_flip_event_leak.c             |   2 -
>>>> tests/kms_force_connector_basic.c       |   3 -
>>>> tests/kms_getfb.c                       |   4 -
>>>> tests/kms_hdmi_inject.c                 |   3 -
>>>> tests/kms_hdr.c                         |  10 --
>>>> tests/kms_invalid_mode.c                |   2 -
>>>> tests/kms_lease.c                       |   2 -
>>>> tests/kms_multipipe_modeset.c           |   2 -
>>>> tests/kms_panel_fitting.c               |   2 -
>>>> tests/kms_pipe_crc_basic.c              |   5 -
>>>> tests/kms_plane.c                       |   7 --
>>>> tests/kms_plane_alpha_blend.c           |   2 -
>>>> tests/kms_plane_cursor.c                |   2 -
>>>> tests/kms_plane_lowres.c                |   3 -
>>>> tests/kms_plane_multiple.c              |   3 -
>>>> tests/kms_plane_scaling.c               |   6 -
>>>> tests/kms_prop_blob.c                   |   2 -
>>>> tests/kms_properties.c                  |   2 -
>>>> tests/kms_rotation_crc.c                |   5 -
>>>> tests/kms_scaling_modes.c               |   2 -
>>>> tests/kms_selftest.c                    |   2 -
>>>> tests/kms_sequence.c                    |   2 -
>>>> tests/kms_setmode.c                     |   3 -
>>>> tests/kms_sysfs_edid_timing.c           |   2 -
>>>> tests/kms_tiled_display.c               |   3 -
>>>> tests/kms_tv_load_detect.c              |   2 -
>>>> tests/kms_vblank.c                      |  10 --
>>>> tests/kms_vrr.c                         |   9 --
>>>> tests/kms_writeback.c                   |   2 -
>>>> tests/testdisplay.c                     |   2 -
>>>> 81 files changed, 552 deletions(-)
>>>>
>>>> diff --git a/tests/chamelium/kms_chamelium_audio.c 
>>>> b/tests/chamelium/kms_chamelium_audio.c
>>>> index 74e50db3b..4feae6a93 100644
>>>> --- a/tests/chamelium/kms_chamelium_audio.c
>>>> +++ b/tests/chamelium/kms_chamelium_audio.c
>>>> @@ -30,7 +30,6 @@
>>>>  * Description: Testing Audio with a Chamelium board
>>>>  * Driver requirement: i915, xe
>>>>  * Mega feature: Display Audio
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt_eld.h"
>>>> @@ -41,22 +40,18 @@
>>>>  * SUBTEST: dp-audio
>>>>  * Description: Playback various audio signals with various audio 
>>>> formats/rates,
>>>>  *              capture them and check they are correct
>>>> - * Functionality: chamelium, dp, audio
>>>>  *
>>>>  * SUBTEST: hdmi-audio
>>>>  * Description: Playback various audio signals with various audio 
>>>> formats/rates,
>>>>  *              capture them and check they are correct
>>>> - * Functionality: chamelium, hdmi, audio
>>>>  *
>>>>  * SUBTEST: dp-audio-edid
>>>>  * Description: Plug a connector with an EDID suitable for audio, 
>>>> check ALSA's
>>>>  *              EDID-Like Data reports the correct audio parameters
>>>> - * Functionality: chamelium, dp, audio
>>>>  *
>>>>  * SUBTEST: hdmi-audio-edid
>>>>  * Description: Plug a connector with an EDID suitable for audio, 
>>>> check ALSA's
>>>>  *              EDID-Like Data reports the correct audio parameters
>>>> - * Functionality: chamelium, hdmi, audio
>>>>  */
>>>>
>>>> /* Playback parameters control the audio signal we synthesize and 
>>>> send */
>>>> diff --git a/tests/chamelium/kms_chamelium_color.c 
>>>> b/tests/chamelium/kms_chamelium_color.c
>>>> index 5550cec22..68611ec6a 100644
>>>> --- a/tests/chamelium/kms_chamelium_color.c
>>>> +++ b/tests/chamelium/kms_chamelium_color.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Category: Display
>>>>  * Description: Test Color Features at Pipe level using Chamelium 
>>>> to verify instead of CRC
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: chamelium, colorspace
>>>>  * Mega feature: Color Management
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "kms_color_helper.h"
>>>> diff --git a/tests/chamelium/kms_chamelium_edid.c 
>>>> b/tests/chamelium/kms_chamelium_edid.c
>>>> index d2d85cad5..9a7915566 100644
>>>> --- a/tests/chamelium/kms_chamelium_edid.c
>>>> +++ b/tests/chamelium/kms_chamelium_edid.c
>>>> @@ -30,7 +30,6 @@
>>>>  * Description: Testing EDID with a Chamelium board
>>>>  * Driver requirement: i915, xe
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include <fcntl.h>
>>>> @@ -55,33 +54,27 @@
>>>> /**
>>>>  * SUBTEST: dp-edid-read
>>>>  * Description: Make sure the EDID exposed by KMS is the same as 
>>>> the screen's
>>>> - * Functionality: chamelium, dp, edid
>>>>  *
>>>>  * SUBTEST: hdmi-edid-read
>>>>  * Description: Make sure the EDID exposed by KMS is the same as 
>>>> the screen's
>>>> - * Functionality: chamelium, hdmi, edid
>>>>  *
>>>>  * SUBTEST: vga-edid-read
>>>>  * Description: Make sure the EDID exposed by KMS is the same as 
>>>> the screen's
>>>> - * Functionality: chamelium, vga, edid
>>>>  *
>>>>  * SUBTEST: dp-edid-resolution-list
>>>>  * Description: Get an EDID with many modes of different 
>>>> configurations, set
>>>>  *              them on the screen and check the screen resolution 
>>>> matches the
>>>>  *              mode resolution.
>>>> - * Functionality: chamelium, dp, edid
>>>>  *
>>>>  * SUBTEST: dp-mode-timings
>>>>  * Description: For each mode of the IGT base EDID, perform a 
>>>> modeset and check
>>>>  *              the mode detected by the Chamelium receiver matches 
>>>> the mode we
>>>>  *              set
>>>> - * Functionality: chamelium, dp, edid
>>>>  *
>>>>  * SUBTEST: hdmi-mode-timings
>>>>  * Description: For each mode of the IGT base EDID, perform a 
>>>> modeset and check
>>>>  *              the mode detected by the Chamelium receiver matches 
>>>> the mode we
>>>>  *              set
>>>> - * Functionality: chamelium, dp, edid
>>>>  */
>>>>
>>>> /**
>>>> @@ -89,13 +82,11 @@
>>>>  * Description: Stress test the DUT by testing multiple EDIDs, one 
>>>> right after
>>>>  *              the other, and ensure their validity by check the 
>>>> real screen
>>>>  *              resolution vs the advertised mode (%arg[1]) 
>>>> resolution.
>>>> - * Functionality: chamelium, dp, edid
>>>>  *
>>>>  * SUBTEST: hdmi-edid-stress-resolution-%s
>>>>  * Description: Stress test the DUT by testing multiple EDIDs, one 
>>>> right after
>>>>  *              the other, and ensure their validity by check the 
>>>> real screen
>>>>  *              resolution vs the advertised mode (%arg[1]) 
>>>> resolution.
>>>> - * Functionality: chamelium, hdmi, edid
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -108,13 +99,11 @@
>>>>  * Description: Simulate a screen being unplugged and another 
>>>> screen being
>>>>  *              plugged during suspend, check that a uevent is sent 
>>>> and
>>>>  *              connector status is updated during %arg[1]
>>>> - * Functionality: chamelium, dp, edid
>>>>  *
>>>>  * SUBTEST: hdmi-edid-change-during-%s
>>>>  * Description: Simulate a screen being unplugged and another 
>>>> screen being
>>>>  *              plugged during suspend, check that a uevent is sent 
>>>> and
>>>>  *              connector status is updated during %arg[1]
>>>> - * Functionality: chamelium, dp, edid
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> diff --git a/tests/chamelium/kms_chamelium_frames.c 
>>>> b/tests/chamelium/kms_chamelium_frames.c
>>>> index a585e7e01..b9a8eb46d 100644
>>>> --- a/tests/chamelium/kms_chamelium_frames.c
>>>> +++ b/tests/chamelium/kms_chamelium_frames.c
>>>> @@ -30,7 +30,6 @@
>>>>  * Description: Tests requiring a Chamelium board
>>>>  * Driver requirement: i915, xe
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt_eld.h"
>>>> @@ -41,17 +40,14 @@
>>>>  * SUBTEST: dp-crc-fast
>>>>  * Description: Pick the first mode of the IGT base EDID, display 
>>>> and capture
>>>>  *         a few frames, then check captured frames are correct
>>>> - * Functionality: chamelium, dp, frame_integrity
>>>>  *
>>>>  * SUBTEST: hdmi-crc-fast
>>>>  * Description: Pick the first mode of the IGT base EDID, display 
>>>> and capture
>>>>  *         a few frames, then check captured frames are correct
>>>> - * Functionality: chamelium, hdmi, frame_integrity
>>>>  *
>>>>  * SUBTEST: hdmi-%s-formats
>>>>  * Description: Pick the first mode of the IGT base EDID, display 
>>>> and capture a
>>>>  *              few frames, then check captured frames are correct
>>>> - * Functionality: chamelium, hdmi, frame_integrity
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -63,17 +59,14 @@
>>>>  * SUBTEST: vga-frame-dump
>>>>  * Description: For each mode of the IGT base EDID, display and 
>>>> capture a few
>>>>  *              frames, then check captured frames are correct
>>>> - * Functionality: chamelium, vga, frame_integrity
>>>>  *
>>>>  * SUBTEST: dp-crc-%s
>>>>  * Description: For each mode of the IGT base EDID, display and 
>>>> capture a %arg[1]
>>>>  *              frame(s), then check captured frame(s) are correct
>>>> - * Functionality: chamelium, dp, frame_integrity
>>>>  *
>>>>  * SUBTEST: hdmi-crc-%s
>>>>  * Description: For each mode of the IGT base EDID, display and 
>>>> capture a %arg[1]
>>>>  *              frame(s), then check captured frame(s) are correct
>>>> - * Functionality: chamelium, hdmi, frame_integrity
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -86,23 +79,19 @@
>>>>  * Description: For each mode of the IGT base EDID, display and 
>>>> capture a few
>>>>  *              frames, then download the captured frames and 
>>>> compare them
>>>>  *              bit-by-bit to the sent ones
>>>> - * Functionality: chamelium, dp, frame_integrity
>>>>  *
>>>>  * SUBTEST: hdmi-frame-dump
>>>>  * Description: For each mode of the IGT base EDID, display and 
>>>> capture a few
>>>>  *              frames, then download the captured frames and 
>>>> compare them
>>>>  *              bit-by-bit to the sent ones
>>>> - * Functionality: chamelium, hdmi, frame_integrity
>>>>  *
>>>>  * SUBTEST: hdmi-aspect-ratio
>>>>  * Description: Pick a mode with a picture aspect-ratio, capture 
>>>> AVI InfoFrames
>>>>  *              and check they include the relevant fields
>>>> - * Functionality: chamelium, hdmi, frame_integrity
>>>>  *
>>>>  * SUBTEST: hdmi-%s-planes-random
>>>>  * Description: Setup a few overlay planes with random parameters, 
>>>> capture the
>>>>  *              frame and check it matches the expected output
>>>> - * Functionality: chamelium, hdmi, frame_integrity
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> diff --git a/tests/chamelium/kms_chamelium_hpd.c 
>>>> b/tests/chamelium/kms_chamelium_hpd.c
>>>> index 76a691043..161f494e9 100644
>>>> --- a/tests/chamelium/kms_chamelium_hpd.c
>>>> +++ b/tests/chamelium/kms_chamelium_hpd.c
>>>> @@ -30,7 +30,6 @@
>>>>  * Description: Testing HPD with a Chamelium board
>>>>  * Driver requirement: i915, xe
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "kms_chamelium_helper.h"
>>>> @@ -39,47 +38,38 @@
>>>>  * SUBTEST: dp-hpd-fast
>>>>  * Description: Check that we get uevents and updated connector 
>>>> status on
>>>>  *         hotplug and unplug
>>>> - * Functionality: chamelium, hotplug, dp
>>>>  *
>>>>  * SUBTEST: hdmi-hpd-fast
>>>>  * Description: Check that we get uevents and updated connector 
>>>> status on
>>>>  *         hotplug and unplug
>>>> - * Functionality: chamelium, hotplug, hdmi
>>>>  *
>>>>  * SUBTEST: vga-hpd-fast
>>>>  * Description: Check that we get uevents and updated connector 
>>>> status on
>>>>  *         hotplug and unplug
>>>> - * Functionality: chamelium, hotplug, vga
>>>>  *
>>>>  * SUBTEST: dp-hpd
>>>>  * Description: Check that we get uevents and updated connector 
>>>> status on
>>>>  *              hotplug and unplug
>>>> - * Functionality: chamelium, hotplug, dp
>>>>  *
>>>>  * SUBTEST: hdmi-hpd
>>>>  * Description: Check that we get uevents and updated connector 
>>>> status on
>>>>  *              hotplug and unplug
>>>> - * Functionality: chamelium, hotplug, hdmi
>>>>  *
>>>>  * SUBTEST: vga-hpd
>>>>  * Description: Check that we get uevents and updated connector 
>>>> status on
>>>>  *              hotplug and unplug
>>>> - * Functionality: chamelium, hotplug, vga
>>>>  *
>>>>  * SUBTEST: dp-hpd-%s
>>>>  * Description: Check that we get uevents and updated connector 
>>>> status on
>>>>  *              hotplug and unplug
>>>> - * Functionality: chamelium, hotplug, dp
>>>>  *
>>>>  * SUBTEST: hdmi-hpd-%s
>>>>  * Description: Check that we get uevents and updated connector 
>>>> status on
>>>>  *              hotplug and unplug
>>>> - * Functionality: chamelium, hotplug, hdmi
>>>>  *
>>>>  * SUBTEST: vga-hpd-%s
>>>>  * Description: Check that we get uevents and updated connector 
>>>> status on
>>>>  *              hotplug and unplug
>>>> - * Functionality: chamelium, hotplug, vga
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -91,84 +81,68 @@
>>>>  * SUBTEST: dp-hpd-for-each-pipe
>>>>  * Description: Check that we get uevents and updated connector 
>>>> status on
>>>>  *              hotplug and unplug for each pipe with valid output
>>>> - * Functionality: chamelium, hotplug, dp
>>>>  *
>>>>  * SUBTEST: hdmi-hpd-for-each-pipe
>>>>  * Description: Check that we get uevents and updated connector 
>>>> status on
>>>>  *              hotplug and unplug for each pipe with valid output
>>>> - * Functionality: chamelium, hotplug, hdmi
>>>>  *
>>>>  * SUBTEST: vga-hpd-for-each-pipe
>>>>  * Description: Check that we get uevents and updated connector 
>>>> status on
>>>>  *              hotplug and unplug for each pipe with valid output
>>>> - * Functionality: chamelium, hotplug, vga
>>>>  *
>>>>  * SUBTEST: dp-hpd-after-hibernate
>>>>  * Description: Toggle HPD during Hibernation, check that uevents 
>>>> are sent and
>>>>  *              connector status is updated
>>>> - * Functionality: chamelium, hotplug, dp, hibernation
>>>>  *
>>>>  * SUBTEST: hdmi-hpd-after-hibernate
>>>>  * Description: Toggle HPD during Hibernation, check that uevents 
>>>> are sent and
>>>>  *              connector status is updated
>>>> - * Functionality: chamelium, hotplug, hdmi, hibernation
>>>>  *
>>>>  * SUBTEST: vga-hpd-after-hibernate
>>>>  * Description: Toggle HPD during Hibernation, check that uevents 
>>>> are sent and
>>>>  *              connector status is updated
>>>> - * Functionality: chamelium, hotplug, vga, hibernation
>>>>  *
>>>>  * SUBTEST: dp-hpd-after-suspend
>>>>  * Description: Toggle HPD during Suspend, check that uevents are 
>>>> sent and
>>>>  *              connector status is updated
>>>> - * Functionality: chamelium, hotplug, dp, suspend
>>>>  *
>>>>  * SUBTEST: hdmi-hpd-after-suspend
>>>>  * Description: Toggle HPD during Suspend, check that uevents are 
>>>> sent and
>>>>  *              connector status is updated
>>>> - * Functionality: chamelium, hotplug, hdmi, suspend
>>>>  *
>>>>  * SUBTEST: vga-hpd-after-suspend
>>>>  * Description: Toggle HPD during Suspend, check that uevents are 
>>>> sent and
>>>>  *              connector status is updated
>>>> - * Functionality: chamelium, hotplug, vga, suspend
>>>>  *
>>>>  * SUBTEST: common-hpd-after-suspend
>>>>  * Description: Toggle HPD during suspend on all connectors, check 
>>>> that uevents
>>>>  *         are sent and connector status is updated
>>>> - * Functionality: chamelium, hotplug, suspend
>>>>  *
>>>>  * SUBTEST: common-hpd-after-hibernate
>>>>  * Description: Toggle HPD during suspend on all connectors, check 
>>>> that uevents
>>>>  *              are sent and connector status is updated
>>>> - * Functionality: chamelium, hotplug, hibernation
>>>>  *
>>>>  * SUBTEST: vga-hpd-without-ddc
>>>>  * Description: Disable DDC on a VGA connector, check we still get 
>>>> a uevent on
>>>>  *              hotplug
>>>> - * Functionality: chamelium, hotplug, vga
>>>>  *
>>>>  * SUBTEST: dp-hpd-storm
>>>>  * Description: Trigger a series of hotplugs in a very small 
>>>> timeframe to
>>>>  *              simulate abad cable, check the kernel falls back to 
>>>> polling
>>>>  *              to avoid a hotplug storm
>>>> - * Functionality: chamelium, hotplug, dp
>>>>  *
>>>>  * SUBTEST: hdmi-hpd-storm
>>>>  * Description: Trigger a series of hotplugs in a very small 
>>>> timeframe to
>>>>  *              simulate abad cable, check the kernel falls back to 
>>>> polling
>>>>  *              to avoid a hotplug storm
>>>> - * Functionality: chamelium, hotplug, hdmi
>>>>  *
>>>>  * SUBTEST: dp-hpd-storm-disable
>>>>  * Description: Disable HPD storm detection, trigger a storm and 
>>>> check the
>>>>  *              kernel doesn't detect one
>>>> - * Functionality: chamelium, hotplug, dp
>>>>  *
>>>>  * SUBTEST: hdmi-hpd-storm-disable
>>>>  * Description: Disable HPD storm detection, trigger a storm and 
>>>> check the
>>>>  *              kernel doesn't detect one
>>>> - * Functionality: chamelium, hotplug, hdmi
>>>>  */
>>>>
>>>> #define HPD_STORM_PULSE_INTERVAL_DP 100 /* ms */
>>>> diff --git a/tests/fbdev.c b/tests/fbdev.c
>>>> index f329e6ac6..fca688407 100644
>>>> --- a/tests/fbdev.c
>>>> +++ b/tests/fbdev.c
>>>> @@ -26,9 +26,7 @@
>>>>  * Category: Display
>>>>  * Description: Sanity test for framebuffer device.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: fbdev
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>> #include "config.h"
>>>>
>>>> diff --git a/tests/intel/i915_pipe_stress.c 
>>>> b/tests/intel/i915_pipe_stress.c
>>>> index 203eb46a3..8f769cd63 100644
>>>> --- a/tests/intel/i915_pipe_stress.c
>>>> +++ b/tests/intel/i915_pipe_stress.c
>>>> @@ -25,9 +25,6 @@
>>>>  *              possible bandwidth/watermark and similar problems.
>>>>  * Category: Display
>>>>  * Mega feature: General Display Features
>>>> - * Sub-category: Display Tests
>>>> - * Functionality: kms_core
>>>> - * Test category: stress test
>>>>  *
>>>>  * SUBTEST: stress-xrgb8888-untiled
>>>>  * Description:
>>>> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
>>>> index 67ab85852..d600c63a1 100644
>>>> --- a/tests/intel/kms_big_fb.c
>>>> +++ b/tests/intel/kms_big_fb.c
>>>> @@ -27,7 +27,6 @@
>>>>  * Description: Test big framebuffers
>>>>  * Driver requirement: i915, xe
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -46,7 +45,6 @@
>>>>  * SUBTEST: linear-%dbpp-rotate-%d
>>>>  * Description: Sanity check if addfb ioctl works correctly for 
>>>> given combination
>>>>  *              of Linear modifier with %arg[1]-bpp & %arg[2]-rotation
>>>> - * Functionality: big_fbs, kms_gem_interop, rotation
>>>>  *
>>>>  * arg[1].values:       8, 16, 32, 64
>>>>  * arg[2].values:       0, 90, 180, 270
>>>> @@ -56,7 +54,6 @@
>>>>  * SUBTEST: %s-%dbpp-rotate-%d
>>>>  * Description: Sanity check if addfb ioctl works correctly for 
>>>> given combination
>>>>  *              of %arg[1] with %arg[2]-bpp & %arg[3]-rotation
>>>> - * Functionality: big_fbs, kms_gem_interop, rotation, tiling
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -74,7 +71,6 @@
>>>>  * Description: Test maximum hardware supported stride length for 
>>>> given combination
>>>>  *              of linear modifier with max hardware stride length, 
>>>> %arg[1]-bpp,
>>>>  *              and %arg[2]-rotation
>>>> - * Functionality: big_fbs, kms_gem_interop, rotation
>>>>  *
>>>>  * arg[1].values:       32, 64
>>>>  * arg[2].values:       0, 180
>>>> @@ -85,7 +81,6 @@
>>>>  * Description: Test maximum hardware supported stride length for 
>>>> given combination
>>>>  *              of %arg[1] modifier with max hardware stride 
>>>> length, %arg[2]-bpp,
>>>>  *              and %arg[3]-rotation
>>>> - * Functionality: big_fbs, kms_gem_interop, rotation, tiling
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -103,13 +98,11 @@
>>>>  * Description: Test maximum hardware supported stride length for 
>>>> given combination
>>>>  *              of %arg[1] modifier with max hardware stride 
>>>> length, %arg[2]-bpp,
>>>>  *              and %arg[3]-rotation with H-flip mode
>>>> - * Functionality: big_fbs, kms_gem_interop, rotation, tiling
>>>>  *
>>>>  * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-%s
>>>>  * Description: Test maximum hardware supported stride length for 
>>>> given combination
>>>>  *              of %arg[1] modifier with max hardware stride 
>>>> length, %arg[2]-bpp,
>>>>  *              and %arg[3]-rotation with %arg[4] mode
>>>> - * Functionality: async_flips, big_fbs, kms_gem_interop, rotation, 
>>>> tiling
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -131,22 +124,18 @@
>>>>  * SUBTEST: linear-addfb
>>>>  * Description: Sanity check if addfb ioctl works correctly with 
>>>> Linear modifier
>>>>  *              for given size and strides of fb
>>>> - * Functionality: big_fbs, kms_gem_interop
>>>>  *
>>>>  * SUBTEST: %s-addfb
>>>>  * Description: Sanity check if addfb ioctl works correctly with 
>>>> %arg[1] modifier
>>>>  *              for given size and strides of fb
>>>> - * Functionality: big_fbs, kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: %s-addfb-size-overflow
>>>>  * Description: Sanity check if addfb ioctl fails correctly for 
>>>> (%arg[1]) modifier
>>>>  *              with small bo.
>>>> - * Functionality: big_fbs, kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: %s-addfb-size-offset-overflow
>>>>  * Description: Sanity check if addfb ioctl fails correctly for 
>>>> (%arg[1]) modifier
>>>>  *              and offsets with small bo
>>>> - * Functionality: big_fbs, kms_gem_interop, tiling
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
>>>> index 5917b888f..3f65ecb01 100644
>>>> --- a/tests/intel/kms_busy.c
>>>> +++ b/tests/intel/kms_busy.c
>>>> @@ -26,9 +26,7 @@
>>>>  * Category: Display
>>>>  * Description: Basic check of KMS ABI with busy framebuffers.
>>>>  * Driver requirement: i915
>>>> - * Functionality: kms_core, hang
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include <poll.h>
>>>> @@ -41,7 +39,6 @@
>>>> /**
>>>>  * SUBTEST: basic
>>>>  * Description: Test for basic check of KMS ABI with busy 
>>>> framebuffers.
>>>> - * Functionality: kms_core
>>>>  *
>>>>  * SUBTEST: basic-hang
>>>>  * Description: Test for basic check of KMS ABI with busy 
>>>> framebuffers.
>>>> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
>>>> index ad0ffe589..cb0c80f03 100644
>>>> --- a/tests/intel/kms_ccs.c
>>>> +++ b/tests/intel/kms_ccs.c
>>>> @@ -29,9 +29,7 @@
>>>>  *              complemented by a color control surface (CCS) that 
>>>> the display
>>>>  *              uses to interpret the compressed data.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: ccs, tiling
>>>>  * Mega feature: E2E Compression
>>>> - * Test category: functionality test
>>>>  */
>>>> #include <fcntl.h>
>>>>
>>>> @@ -121,8 +119,6 @@
>>>> /**
>>>>  * SUBTEST: %s-%s
>>>>  * Description: Test %arg[1] with %arg[2] modifier
>>>> - * Functionality: ccs, rotation, tiling
>>>> - *
>>>>  * arg[1]:
>>>>  *
>>>>  * @bad-rotation-90:             90 degree rotation
>>>> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
>>>> index 382b3e9d1..5cff5826f 100644
>>>> --- a/tests/intel/kms_cdclk.c
>>>> +++ b/tests/intel/kms_cdclk.c
>>>> @@ -29,9 +29,7 @@
>>>>  * Category: Display
>>>>  * Description: Test cdclk features : crawling and squashing
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
>>>> index f2bdd4546..4dc48e8a1 100644
>>>> --- a/tests/intel/kms_dirtyfb.c
>>>> +++ b/tests/intel/kms_dirtyfb.c
>>>> @@ -8,9 +8,7 @@
>>>>  * Category: Display
>>>>  * Description: Test DIRTYFB ioctl functionality.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: dirtyfb
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include <sys/types.h>
>>>> @@ -34,7 +32,6 @@
>>>>  * SUBTEST: %s-dirtyfb-ioctl
>>>>  * Description: Test DIRTYFB ioctl is working properly using GPU
>>>>  *              frontbuffer rendering with %arg[1] feature.
>>>> - * Functionality: dirtyfb, %arg[1]
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> diff --git a/tests/intel/kms_dp_linktrain_fallback.c 
>>>> b/tests/intel/kms_dp_linktrain_fallback.c
>>>> index 415005774..692915c88 100644
>>>> --- a/tests/intel/kms_dp_linktrain_fallback.c
>>>> +++ b/tests/intel/kms_dp_linktrain_fallback.c
>>>> @@ -8,9 +8,7 @@
>>>>  * Category: Display
>>>>  * Description: Test link training fallback for eDP/DP connectors
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: link training
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include <sys/types.h>
>>>> diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
>>>> index 30a09389e..d5709bcd6 100644
>>>> --- a/tests/intel/kms_draw_crc.c
>>>> +++ b/tests/intel/kms_draw_crc.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Category: Display
>>>>  * Description: Tests whether the igt_draw library actually works.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core, tiling
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "i915/gem.h"
>>>> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
>>>> index 5508e7a9e..f742674cf 100644
>>>> --- a/tests/intel/kms_dsc.c
>>>> +++ b/tests/intel/kms_dsc.c
>>>> @@ -35,9 +35,7 @@
>>>>  * Category: Display
>>>>  * Description: Test to validate display stream compression
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: dsc
>>>>  * Mega feature: VDSC
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "kms_dsc_helper.h"
>>>> diff --git a/tests/intel/kms_fb_coherency.c 
>>>> b/tests/intel/kms_fb_coherency.c
>>>> index c05bd0508..c5338568d 100644
>>>> --- a/tests/intel/kms_fb_coherency.c
>>>> +++ b/tests/intel/kms_fb_coherency.c
>>>> @@ -24,9 +24,7 @@
>>>>  *        of memset operations on future scanout buffer objects
>>>>  *        mmapped with different mmap methods and different caching 
>>>> modes.
>>>>  * Mega feature: General Display Features
>>>> - * Functionality: kms_core
>>>>  * Driver requirement: i915, xe
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> typedef struct {
>>>> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
>>>> index 9c3ff7a21..160f475f2 100644
>>>> --- a/tests/intel/kms_fbcon_fbt.c
>>>> +++ b/tests/intel/kms_fbcon_fbt.c
>>>> @@ -30,7 +30,6 @@
>>>>  * Description: Test the relationship between fbcon and the 
>>>> frontbuffer tracking
>>>>  *              infrastructure.
>>>>  * Driver requirement: i915, xe
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -45,25 +44,21 @@
>>>>  * SUBTEST: fbc
>>>>  * Description: Test the relationship between fbcon and the 
>>>> frontbuffer tracking
>>>>  *              infrastructure with fbc enabled.
>>>> - * Functionality: fbc, fbcon, fbt
>>>>  * Mega feature: General Display Features
>>>>  *
>>>>  * SUBTEST: fbc-suspend
>>>>  * Description: Suspend test to validate  the relationship between 
>>>> fbcon and the
>>>>  *              frontbuffer tracking infrastructure with fbc enabled.
>>>> - * Functionality: fbc, fbcon, fbt, suspend
>>>>  * Mega feature: General Display Features
>>>>  *
>>>>  * SUBTEST: psr
>>>>  * Description: Test the relationship between fbcon and the 
>>>> frontbuffer tracking
>>>>  *              infrastructure with psr enabled.
>>>> - * Functionality: fbcon, fbt, psr1
>>>>  * Mega feature: PSR
>>>>  *
>>>>  * SUBTEST: psr-suspend
>>>>  * Description: Suspend test to validate the relationship between 
>>>> fbcon and the
>>>>  *              frontbuffer tracking infrastructure with psr enabled.
>>>> - * Functionality: fbcon, fbt, psr1, suspend
>>>>  * Mega feature: PSR
>>>>  */
>>>>
>>>> diff --git a/tests/intel/kms_fence_pin_leak.c 
>>>> b/tests/intel/kms_fence_pin_leak.c
>>>> index 8ccd73a93..ed064aba0 100644
>>>> --- a/tests/intel/kms_fence_pin_leak.c
>>>> +++ b/tests/intel/kms_fence_pin_leak.c
>>>> @@ -41,9 +41,7 @@
>>>>  * SUBTEST:
>>>>  * Description: Along with the modeset, validate fence pin_count 
>>>> leakage.
>>>>  * Driver requirement: i915
>>>> - * Functionality: kms_core, fences
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> IGT_TEST_DESCRIPTION("Exercises full ppgtt fence pin_count leak in 
>>>> the "
>>>> diff --git a/tests/intel/kms_flip_scaled_crc.c 
>>>> b/tests/intel/kms_flip_scaled_crc.c
>>>> index 7dc07bc83..e866c62fc 100644
>>>> --- a/tests/intel/kms_flip_scaled_crc.c
>>>> +++ b/tests/intel/kms_flip_scaled_crc.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Category: Display
>>>>  * Description: Test flipping between scaled/nonscaled framebuffers
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: ccs, scaling, tiling, vblank
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -46,7 +44,6 @@
>>>>  * SUBTEST: flip-32bpp-linear-to-64bpp-linear-%s
>>>>  * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb 
>>>> to stress CD
>>>>  *              clock programming
>>>> - * Functionality: scaling, vblank
>>>>  *
>>>>  * SUBTEST: flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-%s
>>>>  * Description: Flip from 32bpp non scaled fb to 32bpp %arg[1] fb 
>>>> to stress CD
>>>> @@ -55,12 +52,10 @@
>>>>  * SUBTEST: flip-32bpp-4tile-to-64bpp-4tile-%s
>>>>  * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb 
>>>> to stress CD
>>>>  *              clock programming
>>>> - * Functionality: scaling, tiling, vblank
>>>>  *
>>>>  * SUBTEST: flip-32bpp-xtile-to-64bpp-xtile-%s
>>>>  * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb 
>>>> to stress CD
>>>>  *              clock programming
>>>> - * Functionality: scaling, tiling, vblank
>>>>  *
>>>>  * SUBTEST: flip-32bpp-yftile-to-32bpp-yftileccs-%s
>>>>  * Description: Flip from 32bpp non scaled fb to 32bpp %arg[1] fb 
>>>> to stress CD
>>>> @@ -69,7 +64,6 @@
>>>>  * SUBTEST: flip-32bpp-yftile-to-64bpp-yftile-%s
>>>>  * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb 
>>>> to stress CD
>>>>  *              clock programming
>>>> - * Functionality: scaling, tiling, vblank
>>>>  *
>>>>  * SUBTEST: flip-32bpp-yftileccs-to-64bpp-yftile-%s
>>>>  * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb 
>>>> to stress CD
>>>> @@ -86,7 +80,6 @@
>>>>  * SUBTEST: flip-32bpp-ytile-to-64bpp-ytile-%s
>>>>  * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb 
>>>> to stress CD
>>>>  *              clock programming
>>>> - * Functionality: scaling, tiling, vblank
>>>>  *
>>>>  * SUBTEST: flip-32bpp-ytileccs-to-64bpp-ytile-%s
>>>>  * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb 
>>>> to stress CD
>>>> @@ -106,27 +99,22 @@
>>>>  * SUBTEST: flip-64bpp-4tile-to-%dbpp-4tile-%s
>>>>  * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] 
>>>> fb to stress
>>>>  *              CD clock programming
>>>> - * Functionality: scaling, tiling, vblank
>>>>  *
>>>>  * SUBTEST: flip-64bpp-xtile-to-%dbpp-xtile-%s
>>>>  * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] 
>>>> fb to stress
>>>>  *              CD clock programming
>>>> - * Functionality: scaling, tiling, vblank
>>>>  *
>>>>  * SUBTEST: flip-64bpp-yftile-to-%dbpp-yftile-%s
>>>>  * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] 
>>>> fb to stress
>>>>  *              CD clock programming
>>>> - * Functionality: scaling, tiling, vblank
>>>>  *
>>>>  * SUBTEST: flip-64bpp-ytile-to-%dbpp-ytile-%s
>>>>  * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] 
>>>> fb to stress
>>>>  *              CD clock programming
>>>> - * Functionality: scaling, tiling, vblank
>>>>  *
>>>>  * SUBTEST: flip-64bpp-linear-to-%dbpp-linear-%s
>>>>  * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] 
>>>> fb to stress
>>>>  *              CD clock programming
>>>> - * Functionality: scaling, tiling, vblank
>>>>  *
>>>>  * arg[1].values: 16, 32
>>>>  * arg[2]:
>>>> diff --git a/tests/intel/kms_flip_tiling.c 
>>>> b/tests/intel/kms_flip_tiling.c
>>>> index e937c2171..3880534a7 100644
>>>> --- a/tests/intel/kms_flip_tiling.c
>>>> +++ b/tests/intel/kms_flip_tiling.c
>>>> @@ -41,9 +41,7 @@
>>>>  * SUBTEST: flip-change-tiling
>>>>  * Description: Check pageflip between modifiers
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> IGT_TEST_DESCRIPTION("Test page flips and tiling scenarios");
>>>> diff --git a/tests/intel/kms_frontbuffer_tracking.c 
>>>> b/tests/intel/kms_frontbuffer_tracking.c
>>>> index b93c0d45a..0809352cb 100644
>>>> --- a/tests/intel/kms_frontbuffer_tracking.c
>>>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>>>> @@ -30,7 +30,6 @@
>>>>  * Description: Test the Kernel's frontbuffer tracking mechanism 
>>>> and its related features: FBC, PSR and DRRS
>>>>  * Driver requirement: i915, xe
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include <sys/types.h>
>>>> @@ -51,35 +50,27 @@
>>>> /**
>>>>  * SUBTEST: basic
>>>>  * Description: Do some basic operations regardless of which 
>>>> features are enabled
>>>> - * Functionality: fbt
>>>>  *
>>>>  * SUBTEST: plane-fbc-rte
>>>>  * Description: Sanity test to enable FBC on a plane.
>>>> - * Functionality: fbc
>>>>  *
>>>>  * SUBTEST: pipe-fbc-rte
>>>>  * Description: Sanity test to enable FBC on each pipe.
>>>> - * Functionality: fbc
>>>>  *
>>>>  * SUBTEST: drrs-%dp-rte
>>>>  * Description: Sanity test to enable DRRS with %arg[1] panels.
>>>> - * Functionality: fbt, drrs
>>>>  *
>>>>  * SUBTEST: fbc-%dp-rte
>>>>  * Description: Sanity test to enable FBC with %arg[1] panels.
>>>> - * Functionality: fbc, fbt
>>>>  *
>>>>  * SUBTEST: psr-%dp-rte
>>>>  * Description: Sanity test to enable PSR with %arg[1] panels.
>>>> - * Functionality: fbt, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-%dp-rte
>>>>  * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
>>>> - * Functionality: drrs, fbc, fbt
>>>>  *
>>>>  * SUBTEST: fbcpsr-%dp-rte
>>>>  * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
>>>> - * Functionality: fbc, fbt, psr1
>>>>  *
>>>>  * arg[1].values:   1, 2
>>>>  */
>>>> @@ -87,23 +78,18 @@
>>>> /**
>>>>  * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -121,27 +107,22 @@
>>>>  * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -159,27 +140,22 @@
>>>>  * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1].values:   1, 2
>>>>  *
>>>> @@ -199,23 +175,18 @@
>>>> /**
>>>>  * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1].values:   1, 2
>>>>  *
>>>> @@ -235,23 +206,18 @@
>>>> /**
>>>>  * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1].values:   1, 2
>>>>  *
>>>> @@ -266,27 +232,22 @@
>>>>  * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1].values:   1, 2
>>>>  *
>>>> @@ -300,23 +261,18 @@
>>>> /**
>>>>  * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -335,27 +291,22 @@
>>>>  * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -373,23 +324,18 @@
>>>> /**
>>>>  * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -402,27 +348,22 @@
>>>>  * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
>>>>  * Description: Draw a set of rectangles on the screen using the 
>>>> provided method
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -434,23 +375,18 @@
>>>> /**
>>>>  * SUBTEST: drrs-%dp-pri-indfb-multidraw
>>>>  * Description: Draw a set of rectangles on the screen using 
>>>> alternated drawing methods
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-%dp-pri-indfb-multidraw
>>>>  * Description: Draw a set of rectangles on the screen using 
>>>> alternated drawing methods
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-%dp-pri-indfb-multidraw
>>>>  * Description: Draw a set of rectangles on the screen using 
>>>> alternated drawing methods
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
>>>>  * Description: Draw a set of rectangles on the screen using 
>>>> alternated drawing methods
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
>>>>  * Description: Draw a set of rectangles on the screen using 
>>>> alternated drawing methods
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1].values:   1, 2
>>>>  */
>>>> @@ -458,23 +394,18 @@
>>>> /**
>>>>  * SUBTEST: drrs-%s-draw-%s
>>>>  * Description: Test pixel formats (%arg[1]) that are not 
>>>> FORMAT_DEFAULT
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-%s-draw-%s
>>>>  * Description: Test pixel formats (%arg[1]) that are not 
>>>> FORMAT_DEFAULT
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-%s-draw-%s
>>>>  * Description: Test pixel formats (%arg[1]) that are not 
>>>> FORMAT_DEFAULT
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-%s-draw-%s
>>>>  * Description: Test pixel formats (%arg[1]) that are not 
>>>> FORMAT_DEFAULT
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-%s-draw-%s
>>>>  * Description: Test pixel formats (%arg[1]) that are not 
>>>> FORMAT_DEFAULT
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -492,27 +423,22 @@
>>>>  * SUBTEST: drrs-%s-draw-%s
>>>>  * Description: Test pixel formats (%arg[1]) that are not 
>>>> FORMAT_DEFAULT
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-%s-draw-%s
>>>>  * Description: Test pixel formats (%arg[1]) that are not 
>>>> FORMAT_DEFAULT
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-%s-draw-%s
>>>>  * Description: Test pixel formats (%arg[1]) that are not 
>>>> FORMAT_DEFAULT
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-%s-draw-%s
>>>>  * Description: Test pixel formats (%arg[1]) that are not 
>>>> FORMAT_DEFAULT
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-%s-draw-%s
>>>>  * Description: Test pixel formats (%arg[1]) that are not 
>>>> FORMAT_DEFAULT
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -529,41 +455,32 @@
>>>> /**
>>>>  * SUBTEST: drrs-slowdraw
>>>>  * Description: Sleep a little bit between drawing operations with 
>>>> DRRS
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-slowdraw
>>>>  * Description: Sleep a little bit between drawing operations with PSR
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-slowdraw
>>>>  * Description: Sleep a little bit between drawing operations with 
>>>> FBC & DRRS
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-slowdraw
>>>>  * Description: Sleep a little bit between drawing operations with 
>>>> FBC & PSR
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  */
>>>>
>>>> /**
>>>>  * SUBTEST: drrs-%dp-primscrn-%s-%sflip-blt
>>>>  * Description: Just exercise page flips with the patterns we have
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-%dp-primscrn-%s-%sflip-blt
>>>>  * Description: Just exercise page flips with the patterns we have
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
>>>>  * Description: Just exercise page flips with the patterns we have
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
>>>>  * Description: Just exercise page flips with the patterns we have
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
>>>>  * Description: Just exercise page flips with the patterns we have
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1].values:   1, 2
>>>>  *
>>>> @@ -582,23 +499,18 @@
>>>> /**
>>>>  * SUBTEST: drrs-2p-scndscrn-%s-%sflip-blt
>>>>  * Description: Just exercise page flips with the patterns we have
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-2p-scndscrn-%s-%sflip-blt
>>>>  * Description: Just exercise page flips with the patterns we have
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
>>>>  * Description: Just exercise page flips with the patterns we have
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
>>>>  * Description: Just exercise page flips with the patterns we have
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
>>>>  * Description: Just exercise page flips with the patterns we have
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -616,17 +528,14 @@
>>>>  * SUBTEST: fbc-%dp-%s-fliptrack-mmap-gtt
>>>>  * Description: Check if the hardware tracking works after page flips
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
>>>>  * Description: Check if the hardware tracking works after page flips
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
>>>>  * Description: Check if the hardware tracking works after page flips
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  *
>>>>  * arg[1].values:   1, 2
>>>>  *
>>>> @@ -639,23 +548,18 @@
>>>> /**
>>>>  * SUBTEST: drrs-%dp-primscrn-%s-indfb-move
>>>>  * Description: Just move the %arg[2] around
>>>> - * Functionality: drrs, fbt
>>>>  *
>>>>  * SUBTEST: fbc-%dp-primscrn-%s-indfb-move
>>>>  * Description: Just move the %arg[2] around
>>>> - * Functionality: fbc, fbt
>>>>  *
>>>>  * SUBTEST: psr-%dp-primscrn-%s-indfb-move
>>>>  * Description: Just move the %arg[2] around
>>>> - * Functionality: fbt, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
>>>>  * Description: Just move the %arg[2] around
>>>> - * Functionality: drrs, fbc, fbt
>>>>  *
>>>>  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
>>>>  * Description: Just move the %arg[2] around
>>>> - * Functionality: fbc, fbt, psr1
>>>>  *
>>>>  * arg[1].values:   1, 2
>>>>  *
>>>> @@ -668,23 +572,18 @@
>>>> /**
>>>>  * SUBTEST: drrs-2p-scndscrn-%s-indfb-move
>>>>  * Description: Just move the %arg[1] around
>>>> - * Functionality: drrs, fbt
>>>>  *
>>>>  * SUBTEST: fbc-2p-scndscrn-%s-indfb-move
>>>>  * Description: Just move the %arg[1] around
>>>> - * Functionality: fbc, fbt
>>>>  *
>>>>  * SUBTEST: psr-2p-scndscrn-%s-indfb-move
>>>>  * Description: Just move the %arg[1] around
>>>> - * Functionality: fbt, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
>>>>  * Description: Just move the %arg[1] around
>>>> - * Functionality: drrs, fbc, fbt
>>>>  *
>>>>  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
>>>>  * Description: Just move the %arg[1] around
>>>> - * Functionality: fbc, fbt, psr1
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -695,23 +594,18 @@
>>>> /**
>>>>  * SUBTEST: drrs-%dp-primscrn-%s-indfb-onoff
>>>>  * Description: Just enable and disable the %arg[2] a few times
>>>> - * Functionality: drrs, fbt
>>>>  *
>>>>  * SUBTEST: fbc-%dp-primscrn-%s-indfb-onoff
>>>>  * Description: Just enable and disable the %arg[2] a few times
>>>> - * Functionality: fbc, fbt
>>>>  *
>>>>  * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
>>>>  * Description: Just enable and disable the %arg[2] a few times
>>>> - * Functionality: fbt, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
>>>>  * Description: Just enable and disable the %arg[2] a few times
>>>> - * Functionality: drrs, fbc, fbt
>>>>  *
>>>>  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
>>>>  * Description: Just enable and disable the %arg[2] a few times
>>>> - * Functionality: fbc, fbt, psr1
>>>>  *
>>>>  * arg[1].values:   1, 2
>>>>  *
>>>> @@ -724,23 +618,18 @@
>>>> /**
>>>>  * SUBTEST: drrs-2p-scndscrn-%s-indfb-onoff
>>>>  * Description: Just enable and disable the %arg[1] a few times
>>>> - * Functionality: drrs, fbt
>>>>  *
>>>>  * SUBTEST: fbc-2p-scndscrn-%s-indfb-onoff
>>>>  * Description: Just enable and disable the %arg[1] a few times
>>>> - * Functionality: fbc, fbt
>>>>  *
>>>>  * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
>>>>  * Description: Just enable and disable the %arg[1] a few times
>>>> - * Functionality: fbt, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
>>>>  * Description: Just enable and disable the %arg[1] a few times
>>>> - * Functionality: drrs, fbc, fbt
>>>>  *
>>>>  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
>>>>  * Description: Just enable and disable the %arg[1] a few times
>>>> - * Functionality: fbc, fbt, psr1
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -751,43 +640,33 @@
>>>> /**
>>>>  * SUBTEST: drrs-%dp-primscrn-spr-indfb-fullscreen
>>>>  * Description: Put a fullscreen plane covering the whole screen
>>>> - * Functionality: drrs, fbt
>>>>  *
>>>>  * SUBTEST: fbc-%dp-primscrn-spr-indfb-fullscreen
>>>>  * Description: Put a fullscreen plane covering the whole screen
>>>> - * Functionality: fbc, fbt
>>>>  *
>>>>  * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
>>>>  * Description: Put a fullscreen plane covering the whole screen
>>>> - * Functionality: fbt, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
>>>>  * Description: Put a fullscreen plane covering the whole screen
>>>> - * Functionality: drrs, fbc, fbt
>>>>  *
>>>>  * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
>>>>  * Description: Put a fullscreen plane covering the whole screen
>>>> - * Functionality: fbc, fbt, psr1
>>>>  *
>>>>  * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
>>>>  * Description: Put a fullscreen plane covering the whole screen
>>>> - * Functionality: drrs, fbt
>>>>  *
>>>>  * SUBTEST: fbc-2p-scndscrn-spr-indfb-fullscreen
>>>>  * Description: Put a fullscreen plane covering the whole screen
>>>> - * Functionality: fbc, fbt
>>>>  *
>>>>  * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
>>>>  * Description: Put a fullscreen plane covering the whole screen
>>>> - * Functionality: fbt, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
>>>>  * Description: Put a fullscreen plane covering the whole screen
>>>> - * Functionality: drrs, fbc, fbt
>>>>  *
>>>>  * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
>>>>  * Description: Put a fullscreen plane covering the whole screen
>>>> - * Functionality: fbc, fbt, psr1
>>>>  *
>>>>  * arg[1].values:   1, 2
>>>>  */
>>>> @@ -795,23 +674,18 @@
>>>> /**
>>>>  * SUBTEST: drrs-%s-scaledprimary
>>>>  * Description: Try different primary plane scaling strategies
>>>> - * Functionality: drrs, fbt, scaling
>>>>  *
>>>>  * SUBTEST: fbc-%s-scaledprimary
>>>>  * Description: Try different primary plane scaling strategies
>>>> - * Functionality: fbc, fbt, scaling
>>>>  *
>>>>  * SUBTEST: psr-%s-scaledprimary
>>>>  * Description: Try different primary plane scaling strategies
>>>> - * Functionality: fbt, psr1, scaling
>>>>  *
>>>>  * SUBTEST: fbcdrrs-%s-scaledprimary
>>>>  * Description: Try different primary plane scaling strategies
>>>> - * Functionality: drrs, fbc, fbt, scaling
>>>>  *
>>>>  * SUBTEST: fbcpsr-%s-scaledprimary
>>>>  * Description: Try different primary plane scaling strategies
>>>> - * Functionality: fbc, fbt, psr1, scaling
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -822,103 +696,82 @@
>>>> /**
>>>>  * SUBTEST: drrs-modesetfrombusy
>>>>  * Description: Modeset from a busy buffer to a non-busy buffer 
>>>> with DRRS
>>>> - * Functionality: drrs, fbt, scaling
>>>>  *
>>>>  * SUBTEST: fbc-modesetfrombusy
>>>>  * Description: Modeset from a busy buffer to a non-busy buffer 
>>>> with FBC
>>>> - * Functionality: fbc, fbt, scaling
>>>>  *
>>>>  * SUBTEST: psr-modesetfrombusy
>>>>  * Description: Modeset from a busy buffer to a non-busy buffer 
>>>> with PSR
>>>> - * Functionality: fbt, psr1, scaling
>>>>  *
>>>>  * SUBTEST: fbcdrrs-modesetfrombusy
>>>>  * Description: Modeset from a busy buffer to a non-busy buffer 
>>>> with FBC & DRRS
>>>> - * Functionality: drrs, fbc, fbt, scaling
>>>>  *
>>>>  * SUBTEST: fbcpsr-modesetfrombusy
>>>>  * Description: Modeset from a busy buffer to a non-busy buffer 
>>>> with FBC & PSR
>>>> - * Functionality: fbc, fbt, psr1, scaling
>>>>  */
>>>>
>>>> /**
>>>>  * SUBTEST: drrs-suspend
>>>>  * Description: Make sure suspend/resume keeps us on the same state 
>>>> of DRRS
>>>> - * Functionality: drrs, fbt, suspend
>>>>  *
>>>>  * SUBTEST: fbc-suspend
>>>>  * Description: Make sure suspend/resume keeps us on the same state 
>>>> of FBC
>>>> - * Functionality: fbc, fbt, suspend
>>>>  *
>>>>  * SUBTEST: psr-suspend
>>>>  * Description: Make sure suspend/resume keeps us on the same state 
>>>> of PSR
>>>> - * Functionality: fbt, psr1, suspend
>>>>  *
>>>>  * SUBTEST: fbcdrrs-suspend
>>>>  * Description: Make sure suspend/resume keeps us on the same state 
>>>> of FBC & DRRS
>>>> - * Functionality: drrs, fbc, fbt, suspend
>>>>  *
>>>>  * SUBTEST: fbcpsr-suspend
>>>>  * Description: Make sure suspend/resume keeps us on the same state 
>>>> of FBC & PSR
>>>> - * Functionality: fbc, fbt, psr1, suspend
>>>>  */
>>>>
>>>> /**
>>>>  * SUBTEST: drrs-farfromfence-mmap-gtt
>>>>  * Description: Test drawing as far from the fence start as possible
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbc-farfromfence-mmap-gtt
>>>>  * Description: Test drawing as far from the fence start as possible
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: psr-farfromfence-mmap-gtt
>>>>  * Description: Test drawing as far from the fence start as possible
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbt, kms_core, psr1
>>>>  *
>>>>  * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
>>>>  * Description: Test drawing as far from the fence start as possible
>>>>  * Driver requirement: i915
>>>> - * Functionality: drrs, fbc, fbt, kms_core
>>>>  *
>>>>  * SUBTEST: fbcpsr-farfromfence-mmap-gtt
>>>>  * Description: Test drawing as far from the fence start as possible
>>>>  * Driver requirement: i915
>>>> - * Functionality: fbc, fbt, kms_core, psr1
>>>>  */
>>>>
>>>> /**
>>>>  * SUBTEST: fbc-stridechange
>>>>  * Description: Change the frontbuffer stride by doing a modeset
>>>> - * Functionality: fbc, fbt
>>>>  *
>>>>  * SUBTEST: fbcdrrs-stridechange
>>>>  * Description: Change the frontbuffer stride by doing a modeset
>>>> - * Functionality: drrs, fbc, fbt
>>>>  *
>>>>  * SUBTEST: fbcpsr-stridechange
>>>>  * Description: Change the frontbuffer stride by doing a modeset
>>>> - * Functionality: fbc, fbt, psr1
>>>>  */
>>>>
>>>> /**
>>>>  * SUBTEST: fbc-tiling-%s
>>>>  * Description: Test %arg[1] formats, if the tiling format supports 
>>>> FBC do the
>>>>  *              basic drawing test, else set the mode & test if FBC 
>>>> is disabled
>>>> - * Functionality: fbc, fbt, tiling
>>>>  *
>>>>  * SUBTEST: fbcdrrs-tiling-%s
>>>>  * Description: Test %arg[1] formats, if the tiling format supports 
>>>> FBC do the
>>>>  *              basic drawing test, else set the mode & test if FBC 
>>>> is disabled
>>>> - * Functionality: drrs, fbc, fbt, tiling
>>>>  *
>>>>  * SUBTEST: fbcpsr-tiling-%s
>>>>  * Description: Test %arg[1] formats, if the tiling format supports 
>>>> FBC do the
>>>>  *              basic drawing test, else set the mode & test if FBC 
>>>> is disabled
>>>> - * Functionality: fbc, fbt, psr1, tiling
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
>>>> index 086cfeb71..e8f79a834 100644
>>>> --- a/tests/intel/kms_joiner.c
>>>> +++ b/tests/intel/kms_joiner.c
>>>> @@ -29,9 +29,7 @@
>>>>  * Category: Display
>>>>  * Description: Test big joiner
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: 2p1p
>>>>  * Mega feature: Pipe Joiner
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/intel/kms_legacy_colorkey.c 
>>>> b/tests/intel/kms_legacy_colorkey.c
>>>> index 27ec64051..957e208c6 100644
>>>> --- a/tests/intel/kms_legacy_colorkey.c
>>>> +++ b/tests/intel/kms_legacy_colorkey.c
>>>> @@ -26,9 +26,7 @@
>>>>  * Category: Display
>>>>  * Description: Test to check the legacy set colorkey ioctl on 
>>>> sprite planes.
>>>>  * Driver requirement: i915
>>>> - * Functionality: plane, xorg_xv
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/intel/kms_mmap_write_crc.c 
>>>> b/tests/intel/kms_mmap_write_crc.c
>>>> index 59a838fe4..24b5c70f2 100644
>>>> --- a/tests/intel/kms_mmap_write_crc.c
>>>> +++ b/tests/intel/kms_mmap_write_crc.c
>>>> @@ -49,9 +49,7 @@
>>>>  * SUBTEST: main
>>>>  * Description: Tests that caching mode has become UC/WT and 
>>>> flushed using mmap write
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core, kms_gem_interop
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> IGT_TEST_DESCRIPTION(
>>>> diff --git a/tests/intel/kms_pipe_b_c_ivb.c 
>>>> b/tests/intel/kms_pipe_b_c_ivb.c
>>>> index 73083408a..11236cb36 100644
>>>> --- a/tests/intel/kms_pipe_b_c_ivb.c
>>>> +++ b/tests/intel/kms_pipe_b_c_ivb.c
>>>> @@ -30,9 +30,7 @@
>>>>  * Description: Exercise the FDI lane bifurcation code for IVB in 
>>>> the kernel by
>>>>  *              setting different combinations of modes for pipes B 
>>>> and C.
>>>>  * Driver requirement: i915
>>>> - * Functionality: kms_core, obsolete_test
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/intel/kms_pm_backlight.c 
>>>> b/tests/intel/kms_pm_backlight.c
>>>> index 8b59725ac..9b341c73a 100644
>>>> --- a/tests/intel/kms_pm_backlight.c
>>>> +++ b/tests/intel/kms_pm_backlight.c
>>>> @@ -30,9 +30,7 @@
>>>>  * Category: Display
>>>>  * Description: Basic backlight sysfs test
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: backlight
>>>>  * Mega feature: Display Power Management
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include <errno.h>
>>>> @@ -61,15 +59,12 @@
>>>>  *
>>>>  * SUBTEST: fade-with-dpms
>>>>  * Description: Test the fade with DPMS.
>>>> - * Functionality: dpms, backlight
>>>>  *
>>>>  * SUBTEST: fade-with-suspend
>>>>  * Description: Test the fade with suspend.
>>>> - * Functionality: backlight, suspend
>>>>  *
>>>>  * SUBTEST: brightness-with-dpms
>>>>  * Description: test brightness with dpms on and off cycle.
>>>> - * Functionality: backlight, dpms
>>>>  */
>>>>
>>>> enum {
>>>> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
>>>> index 9551cc6b9..89af74ade 100644
>>>> --- a/tests/intel/kms_pm_dc.c
>>>> +++ b/tests/intel/kms_pm_dc.c
>>>> @@ -27,9 +27,6 @@
>>>>  * Category: Display
>>>>  * Description: Tests to validate display power DC states.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: dpms, pm_dc
>>>> - * Mega feature: Display Power Management
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include <errno.h>
>>>> @@ -52,7 +49,6 @@
>>>>  * SUBTEST: dc3co-vpb-simulation
>>>>  * Description: Make sure that system enters DC3CO when PSR2 is 
>>>> active and system
>>>>  *              is in SLEEP state
>>>> - * Functionality: dc3co, pm_dc, psr2
>>>>  *
>>>>  * SUBTEST: dc5-dpms
>>>>  * Description: Validate display engine entry to DC5 state while 
>>>> all connectors's
>>>> @@ -64,7 +60,6 @@
>>>>  *
>>>>  * SUBTEST: dc5-psr
>>>>  * Description: This test validates display engine entry to DC5 
>>>> state while PSR is active
>>>> - * Functionality: pm_dc, psr1
>>>>  *
>>>>  * SUBTEST: dc6-dpms
>>>>  * Description: Validate display engine entry to DC6 state while 
>>>> all connectors's
>>>> @@ -72,18 +67,15 @@
>>>>  *
>>>>  * SUBTEST: dc6-psr
>>>>  * Description: This test validates display engine entry to DC6 
>>>> state while PSR is active
>>>> - * Functionality: pm_dc, psr1
>>>>  *
>>>>  * SUBTEST: dc9-dpms
>>>>  * Description: This test validates display engine entry to DC9 state
>>>>  *
>>>>  * SUBTEST: deep-pkgc
>>>>  * Description: This test validates display engine entry to PKGC10 
>>>> state for extended vblank
>>>> - * Functionality: pm_dc
>>>>  *
>>>>  * SUBTEST: dc5-retention-flops
>>>>  * Description: This test validates display engine entry to DC5 
>>>> state while PSR is active on Pipe B
>>>> - * Functionality: pm_dc
>>>>  */
>>>>
>>>> /* DC State Flags */
>>>> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
>>>> index 74e9d799a..7ebff1062 100644
>>>> --- a/tests/intel/kms_pm_lpsp.c
>>>> +++ b/tests/intel/kms_pm_lpsp.c
>>>> @@ -28,9 +28,7 @@
>>>>  * TEST: kms pm lpsp
>>>>  * Category: Display
>>>>  * Description: These tests validates display Low Power Single Pipe 
>>>> configurations
>>>> - * Functionality: pm_lpsp
>>>>  * Mega feature: Display Power Management
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
>>>> index 24f527c2a..d22f165b8 100644
>>>> --- a/tests/intel/kms_pm_rpm.c
>>>> +++ b/tests/intel/kms_pm_rpm.c
>>>> @@ -12,9 +12,7 @@
>>>>  * Category: Display
>>>>  * Description: Test to validate Runtime PM
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: pm_rpm
>>>>  * Mega feature: Display Power Management
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include <limits.h> // PATH_MAX
>>>> @@ -51,27 +49,21 @@
>>>>  *
>>>>  * SUBTEST: cursor
>>>>  * Description: Validate cursor movements along with suspends using 
>>>> runtime PM
>>>> - * Functionality: cursor, pm_rpm, suspend
>>>>  *
>>>>  * SUBTEST: cursor-dpms
>>>>  * Description: Validate cursor movements along with dpms using 
>>>> runtime PM
>>>> - * Functionality: cursor, dpms, pm_rpm
>>>>  *
>>>>  * SUBTEST: dpms-lpsp
>>>>  * Description: Validate basic modeset with dpms on lpsp screen 
>>>> using runtime PM
>>>> - * Functionality: dpms, pm_rpm
>>>>  *
>>>>  * SUBTEST: dpms-mode-unset-lpsp
>>>>  * Description: Validate basic modeset (negative) with dpms on lpsp 
>>>> screen using runtime PM
>>>> - * Functionality: dpms, pm_rpm
>>>>  *
>>>>  * SUBTEST: dpms-mode-unset-non-lpsp
>>>>  * Description: Validate basic modeset (negative) with dpms on 
>>>> non-lpsp screen using runtime PM
>>>> - * Functionality: dpms, pm_rpm
>>>>  *
>>>>  * SUBTEST: dpms-non-lpsp
>>>>  * Description: Validate basic modeset with dpms on non-lpsp screen 
>>>> using runtime PM
>>>> - * Functionality: dpms, pm_rpm
>>>>  *
>>>>  * SUBTEST: drm-resources-equal
>>>>  * Description: Validate the DRM resources reported by the IOCTLs 
>>>> are still the same.
>>>> @@ -83,18 +75,15 @@
>>>>  * SUBTEST: fences-dpms
>>>>  * Description: Sanity test for drm fences with dpms.
>>>>  * Driver requirement: i915
>>>> - * Functionality: dpms, pm_rpm
>>>>  *
>>>>  * SUBTEST: i2c
>>>>  * Description: Validate exposed edids using raw I2C read method.
>>>>  *
>>>>  * SUBTEST: legacy-planes
>>>>  * Description: Validate legacy plane (set/unset/change).
>>>> - * Functionality: pm_rpm, plane
>>>>  *
>>>>  * SUBTEST: legacy-planes-dpms
>>>>  * Description: Validate legacy plane (set/unset/change) with dpms.
>>>> - * Functionality: pm_rpm, plane
>>>>  *
>>>>  * SUBTEST: modeset-lpsp
>>>>  * Description: Validate basic modeset on lpsp screen using runtime PM
>>>> @@ -130,19 +119,15 @@
>>>>  * SUBTEST: pm-tiling
>>>>  * Description: Test to change different tiling methods & check for 
>>>> rpm
>>>>  * Driver requirement: i915
>>>> - * Functionality: pm_rpm, tiling
>>>>  *
>>>>  * SUBTEST: system-suspend-modeset
>>>>  * Description: Validate basic modeset with suspend
>>>> - * Functionality: pm_rpm, suspend
>>>>  *
>>>>  * SUBTEST: universal-planes
>>>>  * Description: Validate universal plane (set/unset/change).
>>>> - * Functionality: pm_rpm, plane
>>>>  *
>>>>  * SUBTEST: universal-planes-dpms
>>>>  * Description: Validate universal plane (set/unset/change) with dpms.
>>>> - * Functionality: pm_rpm, plane
>>>>  */
>>>>
>>>> #define MSR_PC8_RES    0x630
>>>> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
>>>> index ad49c18f0..a7b24ea7e 100644
>>>> --- a/tests/intel/kms_psr.c
>>>> +++ b/tests/intel/kms_psr.c
>>>> @@ -28,7 +28,6 @@
>>>>  * Description: Tests behaviour of PSR & PSR2 & PR
>>>>  * Driver requirement: i915, xe
>>>>  * Mega feature: PSR
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "i915/intel_fbc.h"
>>>> @@ -47,39 +46,31 @@
>>>> /**
>>>>  * SUBTEST: %s-basic
>>>>  * Description: Basic check for %arg[1] if it is detecting changes 
>>>> made in planes
>>>> - * Functionality: %arg[1]
>>>>  *
>>>>  * SUBTEST: fbc-%s-basic
>>>>  * Description: Basic check for fbc with %arg[1] if it is detecting 
>>>> changes made in planes
>>>> - * Functionality: %arg[1], fbc
>>>>  *
>>>>  * SUBTEST: %s-dpms
>>>>  * Description: Check if %arg[1] is detecting changes when 
>>>> rendering operation
>>>>  *              is performed with dpms enabled or disabled
>>>> - * Functionality: %arg[1], dpms
>>>>  *
>>>>  * SUBTEST: fbc-%s-dpms
>>>>  * Description: Check if fbc with %arg[1] is detecting changes when 
>>>> rendering operation
>>>>  *              is performed with dpms enabled or disabled
>>>> - * Functionality: %arg[1], dpms, fbc
>>>>  *
>>>>  * SUBTEST: %s-no-drrs
>>>>  * Description: Check if %arg[1] is detecting changes when drrs is 
>>>> disabled
>>>> - * Functionality: %arg[1], drrs
>>>>  *
>>>>  * SUBTEST: fbc-%s-no-drrs
>>>>  * Description: Check if fbc with %arg[1] is detecting changes when 
>>>> drrs is disabled
>>>> - * Functionality: %arg[1], drrs, fbc
>>>>  *
>>>>  * SUBTEST: %s-suspend
>>>>  * Description: Check if %arg[1] is detecting changes when plane 
>>>> operation is
>>>>  *              performed with suspend resume cycles
>>>> - * Functionality: %arg[1], suspend
>>>>  *
>>>>  * SUBTEST: fbc-%s-suspend
>>>>  * Description: Check if fbc with %arg[1] is detecting changes when 
>>>> plane operation is
>>>>  *              performed with suspend resume cycles
>>>> - * Functionality: %arg[1], suspend, fbc
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -92,13 +83,11 @@
>>>>  * Description: Check if %arg[1] is detecting memory mapping 
>>>> %arg[3] operations
>>>>  *         performed on %arg[2] planes
>>>>  * Driver requirement: i915
>>>> - * Functionality: %arg[1], plane
>>>>  *
>>>>  * SUBTEST: fbc-%s-%s-%s
>>>>  * Description: Check if fbc with %arg[1] is detecting memory 
>>>> mapping %arg[3] operations
>>>>  *              performed on %arg[2] planes
>>>>  * Driver requirement: i915
>>>> - * Functionality: %arg[1], plane, fbc
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -121,22 +110,18 @@
>>>>  * SUBTEST: %s-primary-page-flip
>>>>  * Description: Check if %arg[1] is detecting page-flipping operation
>>>>  *         performed on primary plane
>>>> - * Functionality: %arg[1], plane
>>>>  *
>>>>  * SUBTEST: fbc-%s-primary-page-flip
>>>>  * Description: Check if fbc with %arg[1] is detecting 
>>>> page-flipping operation
>>>>  *              performed on primary plane
>>>> - * Functionality: %arg[1], plane, fbc
>>>>  *
>>>>  * SUBTEST: %s-primary-%s
>>>>  * Description: Check if %arg[1] is detecting rendering operations 
>>>> %arg[2]
>>>>  *         when performed on primary plane
>>>> - * Functionality: %arg[1], plane
>>>>  *
>>>>  * SUBTEST: fbc-%s-primary-%s
>>>>  * Description: Check if %arg[1] is detecting rendering operations 
>>>> %arg[2]
>>>>  *              when performed on primary plane
>>>> - * Functionality: %arg[1], plane, fbc
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -153,12 +138,10 @@
>>>>  * SUBTEST: %s-%s-%s
>>>>  * Description: Check if %arg[1] is detecting rendering and plane
>>>>  *              operations %arg[3] performed on %arg[2] planes
>>>> - * Functionality: %arg[1], plane
>>>>  *
>>>>  * SUBTEST: fbc-%s-%s-%s
>>>>  * Description: Check if fbc with %arg[1] is detecting rendering 
>>>> and plane
>>>>  *              operations %arg[3] performed on %arg[2] planes
>>>> - * Functionality: %arg[1], plane, fbc
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -181,46 +164,38 @@
>>>> /**
>>>>  * SUBTEST: pr-basic
>>>>  * Description: Basic check for pr if it is detecting changes made 
>>>> in planes
>>>> - * Functionality: pr
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * SUBTEST: fbc-pr-basic
>>>>  * Description: Basic check for fbc with pr if it is detecting 
>>>> changes made in planes
>>>> - * Functionality: pr, fbc
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * SUBTEST: pr-dpms
>>>>  * Description: Check if pr is detecting changes when rendering 
>>>> operation
>>>>  *              is performed with dpms enabled or disabled
>>>> - * Functionality: pr, dpms
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * SUBTEST: fbc-pr-dpms
>>>>  * Description: Check if fbc with pr is detecting changes when 
>>>> rendering operation
>>>>  *              is performed with dpms enabled or disabled
>>>> - * Functionality: pr, dpms, fbc
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * SUBTEST: pr-no-drrs
>>>>  * Description: Check if pr is detecting changes when drrs is disabled
>>>> - * Functionality: pr, drrs
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * SUBTEST: fbc-pr-no-drrs
>>>>  * Description: Check if fbc with pr is detecting changes when drrs 
>>>> is disabled
>>>> - * Functionality: pr, drrs, fbc
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * SUBTEST: pr-suspend
>>>>  * Description: Check if pr is detecting changes when plane 
>>>> operation is
>>>>  *              performed with suspend resume cycles
>>>> - * Functionality: pr, suspend
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * SUBTEST: fbc-pr-suspend
>>>>  * Description: Check if fbc with pr is detecting changes when 
>>>> plane operation is
>>>>  *              performed with suspend resume cycles
>>>> - * Functionality: pr, suspend, fbc
>>>>  * Mega feature: Panel Replay
>>>>  */
>>>>
>>>> @@ -229,14 +204,12 @@
>>>>  * Description: Check if pr is detecting memory mapping %arg[2] 
>>>> operations
>>>>  *         performed on %arg[1] planes
>>>>  * Driver requirement: i915
>>>> - * Functionality: pr, plane
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * SUBTEST: fbc-pr-%s-%s
>>>>  * Description: Check if fbc with pr is detecting memory mapping 
>>>> %arg[2] operations
>>>>  *              performed on %arg[1] planes
>>>>  * Driver requirement: i915
>>>> - * Functionality: pr, plane, fbc
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * arg[1]:
>>>> @@ -255,25 +228,21 @@
>>>>  * SUBTEST: pr-primary-page-flip
>>>>  * Description: Check if pr is detecting page-flipping operation
>>>>  *         performed on primary plane
>>>> - * Functionality: pr, plane
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * SUBTEST: fbc-pr-primary-page-flip
>>>>  * Description: Check if fbc with pr is detecting page-flipping 
>>>> operation
>>>>  *              performed on primary plane
>>>> - * Functionality: pr, plane, fbc
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * SUBTEST: pr-primary-%s
>>>>  * Description: Check if pr is detecting rendering operations %arg[1]
>>>>  *         when performed on primary plane
>>>> - * Functionality: pr, plane
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * SUBTEST: fbc-pr-primary-%s
>>>>  * Description: Check if fbc with pr is detecting rendering 
>>>> operations %arg[1]
>>>>  *              when performed on primary plane
>>>> - * Functionality: pr, plane, fbc
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * arg[1]:
>>>> @@ -286,13 +255,11 @@
>>>>  * SUBTEST: pr-%s-%s
>>>>  * Description: Check if pr is detecting rendering and plane
>>>>  *              operations %arg[2] performed on %arg[1] planes
>>>> - * Functionality: pr, plane
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * SUBTEST: fbc-pr-%s-%s
>>>>  * Description: Check if fbc with pr is detecting rendering and plane
>>>>  *              operations %arg[2] performed on %arg[1] planes
>>>> - * Functionality: pr, plane, fbc
>>>>  * Mega feature: Panel Replay
>>>>  *
>>>>  * arg[1]:
>>>> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
>>>> index cd4226070..e982c3bdd 100644
>>>> --- a/tests/intel/kms_psr2_sf.c
>>>> +++ b/tests/intel/kms_psr2_sf.c
>>>> @@ -28,9 +28,7 @@
>>>>  * Description: Tests to verify PSR2 selective fetch by sending 
>>>> multiple damaged
>>>>  *              areas with and without fbc
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: plane, psr2, selective_fetch
>>>>  * Mega feature: PSR
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -52,18 +50,15 @@
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that selective fetch works on moving %arg[1] 
>>>> plane %arg[2]
>>>>  *              visible area (no update)
>>>> - * Functionality: plane, pr, selective_fetch
>>>>  *
>>>>  * SUBTEST: fbc-psr2-%s-plane-move-continuous-%s
>>>>  * Description: Test that fbc with selective fetch works on moving 
>>>> %arg[1] plane %arg[2]
>>>>  *              visible area (no update)
>>>> - * Functionality: plane, psr2, selective_fetch, fbc
>>>>  *
>>>>  * SUBTEST: fbc-pr-%s-plane-move-continuous-%s
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that fbc with selective fetch works on moving 
>>>> %arg[1] plane %arg[2]
>>>>  *              visible area (no update)
>>>> - * Functionality: plane, pr, selective_fetch, fbc
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -84,16 +79,13 @@
>>>>  * SUBTEST: pr-cursor-plane-update-sf
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that selective fetch works on cursor plane
>>>> - * Functionality: plane, pr, selective_fetch
>>>>  *
>>>>  * SUBTEST: fbc-psr2-cursor-plane-update-sf
>>>>  * Description: Test that fbc with selective fetch works on cursor 
>>>> plane
>>>> - * Functionality: plane, psr2, selective_fetch, fbc
>>>>  *
>>>>  * SUBTEST: fbc-pr-cursor-plane-update-sf
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that fbc with selective fetch works on cursor 
>>>> plane
>>>> - * Functionality: plane, pr, selective_fetch, fbc
>>>>  *
>>>>  * SUBTEST: psr2-overlay-plane-update-continuous-sf
>>>>  * Description: Test that selective fetch works on overlay plane
>>>> @@ -101,16 +93,13 @@
>>>>  * SUBTEST: pr-overlay-plane-update-continuous-sf
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that selective fetch works on overlay plane
>>>> - * Functionality: plane, pr, selective_fetch
>>>>  *
>>>>  * SUBTEST: fbc-psr2-overlay-plane-update-sf-dmg-area
>>>>  * Description: Test that fbc with selective fetch works on overlay 
>>>> plane
>>>> - * Functionality: plane, psr2, selective_fetch, fbc
>>>>  *
>>>>  * SUBTEST: fbc-pr-overlay-plane-update-sf-dmg-area
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that fbc with selective fetch works on overlay 
>>>> plane
>>>> - * Functionality: plane, pr, selective_fetch, fbc
>>>>  *
>>>>  * SUBTEST: psr2-overlay-plane-update-sf-dmg-area
>>>>  * Description: Test that selective fetch works on overlay plane
>>>> @@ -118,16 +107,13 @@
>>>>  * SUBTEST: pr-overlay-plane-update-sf-dmg-area
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that selective fetch works on overlay plane
>>>> - * Functionality: plane, pr, selective_fetch
>>>>  *
>>>>  * SUBTEST: fbc-psr2-overlay-plane-update-continuous-sf
>>>>  * Description: Test that fbc with selective fetch works on overlay 
>>>> plane
>>>> - * Functionality: plane, psr2, selective_fetch, fbc
>>>>  *
>>>>  * SUBTEST: fbc-pr-overlay-plane-update-continuous-sf
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that fbc with selective fetch works on overlay 
>>>> plane
>>>> - * Functionality: plane, pr, selective_fetch, fbc
>>>>  *
>>>>  * SUBTEST: psr2-overlay-primary-update-sf-dmg-area
>>>>  * Description: Test that selective fetch works on primary plane 
>>>> with blended
>>>> @@ -137,18 +123,15 @@
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that selective fetch works on primary plane 
>>>> with blended
>>>>  *              overlay plane
>>>> - * Functionality: plane, pr, selective_fetch
>>>>  *
>>>>  * SUBTEST: fbc-psr2-overlay-primary-update-sf-dmg-area
>>>>  * Description: Test that fbc with selective fetch works on primary 
>>>> plane with blended
>>>>  *              overlay plane
>>>> - * Functionality: plane, psr2, selective_fetch, fbc
>>>>  *
>>>>  * SUBTEST: fbc-pr-overlay-primary-update-sf-dmg-area
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that fbc with selective fetch works on primary 
>>>> plane with blended
>>>>  *              overlay plane
>>>> - * Functionality: plane, pr, selective_fetch, fbc
>>>>  *
>>>>  * SUBTEST: psr2-plane-move-sf-dmg-area
>>>>  * Description: Test that selective fetch works on moving overlay 
>>>> plane
>>>> @@ -156,16 +139,13 @@
>>>>  * SUBTEST: pr-plane-move-sf-dmg-area
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that selective fetch works on moving overlay 
>>>> plane
>>>> - * Functionality: plane, pr, selective_fetch
>>>>  *
>>>>  * SUBTEST: fbc-psr2-plane-move-sf-dmg-area
>>>>  * Description: Test that fbc with selective fetch works on moving 
>>>> overlay plane
>>>> - * Functionality: plane, psr2, selective_fetch, fbc
>>>>  *
>>>>  * SUBTEST: fbc-pr-plane-move-sf-dmg-area
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that fbc with selective fetch works on moving 
>>>> overlay plane
>>>> - * Functionality: plane, pr, selective_fetch, fbc
>>>>  *
>>>>  * SUBTEST: psr2-primary-plane-update-sf-dmg-area
>>>>  * Description: Test that selective fetch works on primary plane
>>>> @@ -173,25 +153,20 @@
>>>>  * SUBTEST: pr-primary-plane-update-sf-dmg-area
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that selective fetch works on primary plane
>>>> - * Functionality: plane, pr, selective_fetch
>>>>  *
>>>>  * SUBTEST: fbc-psr2-primary-plane-update-sf-dmg-area
>>>>  * Description: Test that fbc with selective fetch works on primary 
>>>> plane
>>>> - * Functionality: plane, psr2, selective_fetch, fbc
>>>>  *
>>>>  * SUBTEST: fbc-pr-primary-plane-update-sf-dmg-area
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that fbc with selective fetch works on primary 
>>>> plane
>>>> - * Functionality: plane, pr, selective_fetch, fbc
>>>>  *
>>>>  * SUBTEST: psr2-primary-plane-update-sf-dmg-area-big-fb
>>>>  * Description: Test that selective fetch works on primary plane 
>>>> with big fb
>>>> - * Functionality: plane, psr2, selective_fetch, big_fbs
>>>>  *
>>>>  * SUBTEST: pr-primary-plane-update-sf-dmg-area-big-fb
>>>>  * Mega feature: Panel Replay
>>>>  * Description: Test that selective fetch works on primary plane 
>>>> with big fb
>>>> - * Functionality: plane, pr, selective_fetch, big_fbs
>>>>  */
>>>>
>>>> IGT_TEST_DESCRIPTION("Tests to verify PSR2 selective fetch by 
>>>> sending multiple"
>>>> diff --git a/tests/intel/kms_psr_stress_test.c 
>>>> b/tests/intel/kms_psr_stress_test.c
>>>> index 73a6eb56d..89dd377da 100644
>>>> --- a/tests/intel/kms_psr_stress_test.c
>>>> +++ b/tests/intel/kms_psr_stress_test.c
>>>> @@ -3,9 +3,7 @@
>>>>  * TEST: kms psr stress test
>>>>  * Category: Display
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: plane, psr1
>>>>  * Mega feature: PSR
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/intel/kms_pwrite_crc.c 
>>>> b/tests/intel/kms_pwrite_crc.c
>>>> index 338c92c3a..b40a423b1 100644
>>>> --- a/tests/intel/kms_pwrite_crc.c
>>>> +++ b/tests/intel/kms_pwrite_crc.c
>>>> @@ -40,9 +40,7 @@
>>>>  * Description: Use the display CRC support to validate pwrite to 
>>>> an already
>>>>  *              uncached future scanout buffer.
>>>>  * Driver requirement: i915
>>>> - * Functionality: crc, kms_core, kms_gem_interop
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> IGT_TEST_DESCRIPTION(
>>>> diff --git a/tests/kms_3d.c b/tests/kms_3d.c
>>>> index 8e9e9929c..bdbf389b4 100644
>>>> --- a/tests/kms_3d.c
>>>> +++ b/tests/kms_3d.c
>>>> @@ -35,9 +35,7 @@
>>>>  * SUBTEST:
>>>>  * Description: Tests 3D mode setting.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: stereoscopic
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> IGT_TEST_DESCRIPTION("Tests 3D mode setting.");
>>>> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
>>>> index 30ca8b016..e5ff9ea32 100644
>>>> --- a/tests/kms_addfb_basic.c
>>>> +++ b/tests/kms_addfb_basic.c
>>>> @@ -30,9 +30,7 @@
>>>>  * Category: Display
>>>>  * Description: Sanity test for ioctls DRM_IOCTL_MODE_ADDFB2 & 
>>>> DRM_IOCTL_MODE_RMFB.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_gem_interop
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -61,12 +59,10 @@
>>>>  *
>>>>  * SUBTEST: unused-modifier
>>>>  * Description: Test that addfb2 call fails correctly for unused 
>>>> modifier
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: clobberred-modifier
>>>>  * Description: Check if addfb2 call works for clobbered modifier
>>>>  * Driver requirement: i915
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: invalid-smem-bo-on-discrete
>>>>  * Description: Check if addfb2 with a system memory gem object 
>>>> fails correctly
>>>> @@ -98,22 +94,18 @@
>>>> /**
>>>>  * SUBTEST: basic-x-tiled-legacy
>>>>  * Description: Check if addfb2 and rmfb call works for basic 
>>>> x-tiling test
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: basic-y-tiled-legacy
>>>>  * Description: Check if addfb2 and rmfb call works for basic 
>>>> y-tiling test
>>>>  * Driver requirement: i915
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: framebuffer-vs-set-tiling
>>>>  * Description: Check if addfb2 call works for x and y tiling
>>>>  * Driver requirement: i915
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: tile-pitch-mismatch
>>>>  * Description: Test that addfb2 call fails correctly for pitches 
>>>> mismatch
>>>>  * Driver requirement: i915
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  */
>>>>
>>>> /**
>>>> @@ -135,41 +127,33 @@
>>>>  * SUBTEST: bo-too-small-due-to-tiling
>>>>  * Description: Test that addfb2 call fails correctly with small 
>>>> buffer object
>>>>  *              after changing tile
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  */
>>>>
>>>> /**
>>>>  * SUBTEST: addfb25-modifier-no-flag
>>>>  * Description: Test that addfb2 call fails correctly for x-tiling 
>>>> with given modifier
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: addfb25-bad-modifier
>>>>  * Description: Test that addfb2 call fails correctly for 
>>>> irrelevant modifier
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: addfb25-x-tiled-mismatch-legacy
>>>>  * Description: Test that addfb2 call fails correctly for 
>>>> irrelevant x-tiling
>>>>  * Driver requirement: i915
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: addfb25-x-tiled-legacy
>>>>  * Description: Check if addfb2 call works for x-tiling
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: addfb25-framebuffer-vs-set-tiling
>>>>  * Description: Check if addfb2 call works for relevant combination 
>>>> of tiling and fbs
>>>>  * Driver requirement: i915
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  */
>>>>
>>>> /**
>>>>  * SUBTEST: addfb25-y-tiled-%s
>>>>  * Description: Check if addfb2 call works for y-tiling %arg[1]
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: addfb25-yf-tiled-legacy
>>>>  * Description: Check if addfb2 call works for yf-tiling
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -180,7 +164,6 @@
>>>> /**
>>>>  * SUBTEST: addfb25-4-tiled
>>>>  * Description: Check if addfb2 call works for tiling-4
>>>> - * Functionality: kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: invalid-%s-%s
>>>>  * Description: Test that %arg[1] ioctl call fails correctly for 
>>>> %arg[2] object
>>>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>>>> index 4a72be7b5..da426f753 100644
>>>> --- a/tests/kms_async_flips.c
>>>> +++ b/tests/kms_async_flips.c
>>>> @@ -30,9 +30,7 @@
>>>>  * Category: Display
>>>>  * Description: Test asynchronous page flips.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: async_flips, vblank
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -58,11 +56,9 @@
>>>>  *
>>>>  * SUBTEST: test-cursor
>>>>  * Description: Verify that the DRM_IOCTL_MODE_CURSOR passes after 
>>>> async flip
>>>> - * Functionality: async_flips, cursor, vblank
>>>>  *
>>>>  * SUBTEST: crc
>>>>  * Description: Use CRC to verify async flip scans out the correct 
>>>> framebuffer
>>>> - * Functionality: async_flips, crc, vblank
>>>>  *
>>>>  * SUBTEST: invalid-async-flip
>>>>  * Description: Negative case to verify if changes in fb are 
>>>> rejected from kernel as expected
>>>> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
>>>> index 489b0d709..1f8b23d6d 100644
>>>> --- a/tests/kms_atomic.c
>>>> +++ b/tests/kms_atomic.c
>>>> @@ -32,9 +32,7 @@
>>>>  * Category: Display
>>>>  * Description: Test atomic modesetting API
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core, plane
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include <unistd.h>
>>>> @@ -57,7 +55,6 @@
>>>>  * Description: Test abuse the atomic ioctl directly in order to 
>>>> test various
>>>>  *              invalid conditions which the libdrm wrapper won't 
>>>> allow us to
>>>>  *              create.
>>>> - * Functionality: kms_core
>>>>  *
>>>>  * SUBTEST: atomic-plane-damage
>>>>  * Description: Simple test cases to use FB_DAMAGE_CLIPS plane 
>>>> property
>>>> @@ -65,7 +62,6 @@
>>>>  * SUBTEST: test-only
>>>>  * Description: Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY 
>>>> really only touches
>>>>  *              the free-standing state objects and nothing else.
>>>> - * Functionality: kms_core
>>>>  *
>>>>  * SUBTEST: plane-primary-overlay-mutable-zpos
>>>>  * Description: Verify that the overlay plane can cover the primary 
>>>> one (and
>>>> diff --git a/tests/kms_atomic_interruptible.c 
>>>> b/tests/kms_atomic_interruptible.c
>>>> index 962c33f6f..19fbcab99 100644
>>>> --- a/tests/kms_atomic_interruptible.c
>>>> +++ b/tests/kms_atomic_interruptible.c
>>>> @@ -27,7 +27,6 @@
>>>>  * Description: Tests that interrupt various atomic ioctls.
>>>>  * Driver requirement: i915, xe
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include <signal.h>
>>>> @@ -39,7 +38,6 @@
>>>> /**
>>>>  * SUBTEST: %s-setmode
>>>>  * Description: Tests the interrupt properties of %arg[1] modeset
>>>> - * Functionality: kms_core
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -50,19 +48,15 @@
>>>> /**
>>>>  * SUBTEST: legacy-cursor
>>>>  * Description: Tests the interrupt properties for Cursor
>>>> - * Functionality: cursor, kms_core
>>>>  *
>>>>  * SUBTEST: legacy-dpms
>>>>  * Description: Tests the interrupt properties for DPMS
>>>> - * Functionality: dpms, kms_core
>>>>  *
>>>>  * SUBTEST: legacy-pageflip
>>>>  * Description: Tests the interrupt properties for page flip
>>>> - * Functionality: kms_core
>>>>  *
>>>>  * SUBTEST: universal-setplane-%s
>>>>  * Description: Tests the interrupt properties for %arg[1]
>>>> - * Functionality: kms_core, plane
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> diff --git a/tests/kms_atomic_transition.c 
>>>> b/tests/kms_atomic_transition.c
>>>> index f4f8afc66..0342af206 100644
>>>> --- a/tests/kms_atomic_transition.c
>>>> +++ b/tests/kms_atomic_transition.c
>>>> @@ -25,9 +25,7 @@
>>>>  * TEST: kms atomic transition
>>>>  * Category: Display
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: plane, watermark
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -46,7 +44,6 @@
>>>> /**
>>>>  * SUBTEST: plane-primary-toggle-with-vblank-wait
>>>>  * Description: Check toggling of primary plane with vblank
>>>> - * Functionality: plane, vblank, watermark
>>>>  *
>>>>  * SUBTEST: plane-all-modeset-%s
>>>>  * Description: Modeset test for all plane combinations %arg[1]
>>>> @@ -60,7 +57,6 @@
>>>> /**
>>>>  * SUBTEST: plane-all-modeset-%s
>>>>  * Description: Modeset test for all plane combinations %arg[1]
>>>> - * Functionality: plane, watermark, edp
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
>>>> index 2c42acbdc..ca05695d3 100644
>>>> --- a/tests/kms_bw.c
>>>> +++ b/tests/kms_bw.c
>>>> @@ -25,9 +25,7 @@
>>>>  * Category: Display
>>>>  * Description: BW test with different resolutions
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core
>>>>  * Mega feature: Display Latency/Bandwidth
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "drm_mode.h"
>>>> diff --git a/tests/kms_color.c b/tests/kms_color.c
>>>> index 4b71d3dd3..91363c54e 100644
>>>> --- a/tests/kms_color.c
>>>> +++ b/tests/kms_color.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Category: Display
>>>>  * Description: Test Color Features at Pipe level
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: colorspace
>>>>  * Mega feature: Color Management
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "kms_color_helper.h"
>>>> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
>>>> index ce0261287..86e9eae67 100644
>>>> --- a/tests/kms_concurrent.c
>>>> +++ b/tests/kms_concurrent.c
>>>> @@ -37,9 +37,7 @@
>>>>  * Description: Test atomic mode setting concurrently with multiple 
>>>> planes and
>>>>  *              screen resolution.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> IGT_TEST_DESCRIPTION("Test atomic mode setting concurrently with 
>>>> multiple planes and screen resolution");
>>>> diff --git a/tests/kms_content_protection.c 
>>>> b/tests/kms_content_protection.c
>>>> index 04dff7a05..6fe1edbc4 100644
>>>> --- a/tests/kms_content_protection.c
>>>> +++ b/tests/kms_content_protection.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Category: Display
>>>>  * Description: Test content protection (HDCP)
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: hdcp1.4
>>>>  * Mega feature: HDCP
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include <poll.h>
>>>> @@ -45,21 +43,17 @@
>>>> /**
>>>>  * SUBTEST: lic-type-0
>>>>  * Description: Test for the integrity of link for type-0 content.
>>>> - * Functionality: hdcp1.4, hdcp2.2
>>>>  *
>>>>  * SUBTEST: lic-type-1
>>>>  * Description: Test for the integrity of link for type-1 content.
>>>> - * Functionality: hdcp2.2
>>>>  *
>>>>  * SUBTEST: content-type-change
>>>>  * Description: Test the content type change when the content 
>>>> protection already
>>>>  *              enabled
>>>> - * Functionality: hdcp1.4, hdcp2.2
>>>>  *
>>>>  * SUBTEST: mei-interface
>>>>  * Description: Test the teardown and rebuild of the interface 
>>>> between Intel
>>>>  *              and mei hdcp.
>>>> - * Functionality: hdcp1.4, hdcp2.2
>>>>  *
>>>>  * SUBTEST: srm
>>>>  * Description: This test writes the facsimile SRM into the 
>>>> /lib/firmware/ and
>>>> @@ -83,7 +77,6 @@
>>>> /**
>>>>  * SUBTEST: dp-mst-%s
>>>>  * Description: Test Content protection %arg[1] over DP MST.
>>>> - * Functionality: hdcp1.4, mst
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
>>>> index 7c6f61f55..58d9bda9f 100644
>>>> --- a/tests/kms_cursor_crc.c
>>>> +++ b/tests/kms_cursor_crc.c
>>>> @@ -34,9 +34,7 @@
>>>>  *              was disabled and its drawing is directly inserted 
>>>> on the PF by
>>>>  *              software.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: cursor
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -49,15 +47,12 @@
>>>> /**
>>>>  * SUBTEST: cursor-dpms
>>>>  * Description: Check random placement of a cursor with DPMS.
>>>> - * Functionality: cursor, dpms
>>>>  *
>>>>  * SUBTEST: cursor-suspend
>>>>  * Description: Check random placement of a cursor with suspend.
>>>> - * Functionality: cursor, suspend
>>>>  *
>>>>  * SUBTEST: cursor-size-hints
>>>>  * Description: Check that sizes declared in SIZE_HINTS are accepted.
>>>> - * Functionality: cursor
>>>>  *
>>>>  * SUBTEST: cursor-%s
>>>>  * Description: %arg[1]
>>>> diff --git a/tests/kms_cursor_edge_walk.c 
>>>> b/tests/kms_cursor_edge_walk.c
>>>> index 54e9dc92f..858d1da9b 100644
>>>> --- a/tests/kms_cursor_edge_walk.c
>>>> +++ b/tests/kms_cursor_edge_walk.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Category: Display
>>>>  * Description: Test to check different cursor sizes by walking 
>>>> different edges of screen
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: cursor
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
>>>> index 533972cd4..44f031e7b 100644
>>>> --- a/tests/kms_cursor_legacy.c
>>>> +++ b/tests/kms_cursor_legacy.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Category: Display
>>>>  * Description: Stress legacy cursor ioctl
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: cursor
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include <poll.h>
>>>> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
>>>> index e41c60cc0..bbeceafbd 100644
>>>> --- a/tests/kms_display_modes.c
>>>> +++ b/tests/kms_display_modes.c
>>>> @@ -30,7 +30,6 @@
>>>>  * Description: Test Display Modes
>>>>  * Driver requirement: i915, xe
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -39,12 +38,10 @@
>>>>  * SUBTEST: extended-mode-basic
>>>>  * Description: Test for validating display extended mode with a 
>>>> pair of connected
>>>>  *              displays
>>>> - * Functionality: kms_core
>>>>  *
>>>>  * SUBTEST: mst-extended-mode-negative
>>>>  * Description: Negative test for validating display extended mode 
>>>> with a pair
>>>>  *        of connected 2k-4k or 4k-4k displays.
>>>> - * Functionality: kms_core, mst
>>>>  */
>>>>
>>>> #define HDISPLAY_4K    3840
>>>> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
>>>> index ce4172117..426caaaa8 100644
>>>> --- a/tests/kms_dither.c
>>>> +++ b/tests/kms_dither.c
>>>> @@ -30,9 +30,7 @@
>>>>  * Category: Display
>>>>  * Description: Test Dithering block status
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: colorspace, kms_gem_interop
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
>>>> index c8ada3fec..24cfdcb68 100644
>>>> --- a/tests/kms_dp_aux_dev.c
>>>> +++ b/tests/kms_dp_aux_dev.c
>>>> @@ -42,9 +42,7 @@
>>>>  * SUBTEST:
>>>>  * Description: Test that /dev/drm_dp_aux reads work
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: dp_aux, edp, dp
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> IGT_TEST_DESCRIPTION("Test that /dev/drm_dp_aux reads work");
>>>> diff --git a/tests/kms_feature_discovery.c 
>>>> b/tests/kms_feature_discovery.c
>>>> index 5bca9ad76..a4f96e2a7 100644
>>>> --- a/tests/kms_feature_discovery.c
>>>> +++ b/tests/kms_feature_discovery.c
>>>> @@ -29,9 +29,7 @@
>>>>  *        The subtests here should only skip or pass,
>>>>  *        anything else means we have a serious problem.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: feature_discovery
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -53,22 +51,17 @@
>>>>  *
>>>>  * SUBTEST: chamelium
>>>>  * Description: Make sure that Chamelium is configured and reachable.
>>>> - * Functionality: feature_discovery, chamelium
>>>>  *
>>>>  * SUBTEST: psr1
>>>>  * Description: Make sure that we have eDP panel with PSR1 support.
>>>> - * Functionality: feature_discovery, psr1, edp
>>>>  * Mega feature: PSR
>>>>  *
>>>>  * SUBTEST: psr2
>>>>  * Description: Make sure that we have eDP panel with PSR2 support.
>>>> - * Functionality: feature_discovery, psr2, edp
>>>>  * Mega feature: PSR
>>>>  *
>>>>  * SUBTEST: dp-mst
>>>>  * Description: Make sure that we have DP-MST configuration.
>>>> - * Functionality: feature_discovery, mst
>>>> - * Test category: functionality test
>>>>  *
>>>>  * arg[1].values: 1, 2, 3, 4
>>>>  */
>>>> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
>>>> index 3ad4d0afb..213b731ec 100755
>>>> --- a/tests/kms_flip.c
>>>> +++ b/tests/kms_flip.c
>>>> @@ -26,9 +26,7 @@
>>>>  * Category: Display
>>>>  * Description: Tests for validating modeset, dpms and pageflips
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: vblank
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "config.h"
>>>> @@ -62,13 +60,11 @@
>>>>  * SUBTEST: %s
>>>>  * Description: %arg[1] test to validate pageflips with available 
>>>> fences
>>>>  * Driver requirement: i915
>>>> - * Functionality: gtt, vblank
>>>>  *
>>>>  * SUBTEST: 2x-%s
>>>>  * Description: %arg[1] test to validate pageflips along with 
>>>> available fences
>>>>  *              on a pair of connected displays
>>>>  * Driver requirement: i915
>>>> - * Functionality: gtt, vblank
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -79,7 +75,6 @@
>>>> /**
>>>>  * SUBTEST: dpms-off-%s
>>>>  * Description: %arg[1] test to validate pageflips by disabling 
>>>> other connectors usng dpms
>>>> - * Functionality: dpms, vblank
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -90,7 +85,6 @@
>>>> /**
>>>>  * SUBTEST: %s
>>>>  * Description: %arg[1] test to validate pageflips with large BO in 
>>>> size
>>>> - * Functionality: kms_gem_interop, vblank
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -101,11 +95,9 @@
>>>> /**
>>>>  * SUBTEST: %s
>>>>  * Description: Basic test to validate %arg[1]
>>>> - * Functionality: hang, vblank
>>>>  *
>>>>  * SUBTEST: 2x-%s
>>>>  * Description: Test to validate %arg[1] on a pair of connected 
>>>> displays
>>>> - * Functionality: hang, vblank
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -141,12 +133,10 @@
>>>> /**
>>>>  * SUBTEST: %s
>>>>  * Description: %arg[1] test to validate pageflips with suspend cycle
>>>> - * Functionality: suspend, vblank
>>>>  *
>>>>  * SUBTEST: 2x-%s
>>>>  * Description: %arg[1] test to validate pageflips with suspend 
>>>> cycle on a pair
>>>>  *              of connected displays
>>>> - * Functionality: suspend, vblank
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -157,11 +147,9 @@
>>>> /**
>>>>  * SUBTEST: %s
>>>>  * Description: Basic test to validate %arg[1]
>>>> - * Functionality: dpms, vblank
>>>>  *
>>>>  * SUBTEST: 2x-%s
>>>>  * Description: Basic test to validate %arg[1] on a pair of 
>>>> connected displays
>>>> - * Functionality: dpms, vblank
>>>>  *
>>>>  * SUBTEST: %s-interruptible
>>>>  * Description: Basic test to validate %arg[1]
>>>> @@ -182,7 +170,6 @@
>>>>  * SUBTEST: 2x-flip-vs-dpms
>>>>  * Description: Basic test to validate pageflip along with dpms on 
>>>> a pair of
>>>>  *              connected displays
>>>> - * Functionality: dpms, vblank
>>>>  *
>>>>  * SUBTEST: 2x-%s
>>>>  * Description: Basic test to validate %arg[1] on a pair of 
>>>> connected displays
>>>> @@ -228,7 +215,6 @@
>>>>  *
>>>>  * SUBTEST: basic-flip-vs-dpms
>>>>  * Description: Basic test to valide pageflip with dpms
>>>> - * Functionality: dpms, vblank
>>>>  *
>>>>  * SUBTEST: basic-flip-vs-%s
>>>>  * Description: Basic test to valide pageflip with %arg[1]
>>>> diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
>>>> index a668b1da3..56d5128b8 100644
>>>> --- a/tests/kms_flip_event_leak.c
>>>> +++ b/tests/kms_flip_event_leak.c
>>>> @@ -44,9 +44,7 @@
>>>>  *              completed. The test itself won't fail even if the 
>>>> kernel leaks
>>>>  *              the event, but the resulting dmesg WARN will 
>>>> indicate a failure.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> typedef struct {
>>>> diff --git a/tests/kms_force_connector_basic.c 
>>>> b/tests/kms_force_connector_basic.c
>>>> index 392a02f7e..f554e997c 100644
>>>> --- a/tests/kms_force_connector_basic.c
>>>> +++ b/tests/kms_force_connector_basic.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Category: Display
>>>>  * Description: Check the debugfs force connector/edid features 
>>>> work correctly.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: force_connector
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -38,7 +36,6 @@
>>>>  * SUBTEST: force-load-detect
>>>>  * Description: Test to detect forced load.
>>>>  * Driver requirement: i915
>>>> - * Functionality: force_connector, vga
>>>>  *
>>>>  * SUBTEST: force-connector-state
>>>>  * Description: Test to check the forced connector state
>>>> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
>>>> index 9cc783776..496d2c45a 100644
>>>> --- a/tests/kms_getfb.c
>>>> +++ b/tests/kms_getfb.c
>>>> @@ -32,9 +32,7 @@
>>>>  * Category: Display
>>>>  * Description: Tests GETFB and GETFB2 ioctls.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_gem_interop
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -71,7 +69,6 @@
>>>>  * SUBTEST: getfb-reject-ccs
>>>>  * Description: Tests error handling while requesting CCS buffers 
>>>> it should
>>>>  *              refuse because getfb supports returning a single 
>>>> buffer handle.
>>>> - * Functionality: ccs, kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: getfb-%s-different-handles
>>>>  * Description: Tests error handling while requesting for two 
>>>> different handles
>>>> @@ -86,7 +83,6 @@
>>>> /**
>>>>  * SUBTEST: getfb2-accept-ccs
>>>>  * Description: Tests outputs are correct when retrieving a CCS 
>>>> framebuffer.
>>>> - * Functionality: ccs, kms_gem_interop, tiling
>>>>  *
>>>>  * SUBTEST: getfb2-into-addfb2
>>>>  * Description: Output check by passing the output of GETFB2 into 
>>>> ADDFB2.
>>>> diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
>>>> index 79dfae40e..625708ddd 100644
>>>> --- a/tests/kms_hdmi_inject.c
>>>> +++ b/tests/kms_hdmi_inject.c
>>>> @@ -30,7 +30,6 @@
>>>>  *              the metadata exposed to user space matches.
>>>>  * Driver requirement: i915, xe
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "config.h"
>>>> @@ -46,12 +45,10 @@
>>>>  * SUBTEST: inject-4k
>>>>  * Description: Make sure that 4K modes exposed by DRM match the 
>>>> forced EDID and
>>>>  *              modesetting using it succeed.
>>>> - * Functionality: force_connector, hdmi, edid
>>>>  *
>>>>  * SUBTEST: inject-audio
>>>>  * Description: Make sure that audio information exposed by ALSA 
>>>> match the forced
>>>>  *              EDID.
>>>> - * Functionality: force_connector, hdmi, audio
>>>>  */
>>>>
>>>> #define HDISPLAY_4K    3840
>>>> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>>>> index c4c9df3fc..33b6c42a6 100644
>>>> --- a/tests/kms_hdr.c
>>>> +++ b/tests/kms_hdr.c
>>>> @@ -26,7 +26,6 @@
>>>>  * Description: Test HDR metadata interfaces and bpc switch
>>>>  * Driver requirement: i915, xe
>>>>  * Mega feature: HDR
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -38,39 +37,30 @@
>>>> /**
>>>>  * SUBTEST: bpc-switch
>>>>  * Description: Tests switching between different display output 
>>>> bpc modes
>>>> - * Functionality: colorspace
>>>>  *
>>>>  * SUBTEST: bpc-switch-dpms
>>>>  * Description: Tests switching between different display output 
>>>> bpc modes with dpms
>>>> - * Functionality: colorspace, dpms
>>>>  *
>>>>  * SUBTEST: bpc-switch-suspend
>>>>  * Description: Tests switching between different display output 
>>>> bpc modes with suspend
>>>> - * Functionality: colorspace, suspend
>>>>  *
>>>>  * SUBTEST: invalid-hdr
>>>>  * Description: Test to ensure HDR is not enabled on non-HDR panel
>>>> - * Functionality: colorspace, static_hdr
>>>>  *
>>>>  * SUBTEST: invalid-metadata-sizes
>>>>  * Description: Tests invalid HDR metadata sizes
>>>> - * Functionality: colorspace, static_hdr
>>>>  *
>>>>  * SUBTEST: static-toggle-dpms
>>>>  * Description: Tests static toggle with dpms
>>>> - * Functionality: colorspace, dpms, static_hdr
>>>>  *
>>>>  * SUBTEST: static-toggle-suspend
>>>>  * Description: Tests static toggle with suspend
>>>> - * Functionality: colorspace, static_hdr, suspend
>>>>  *
>>>>  * SUBTEST: brightness-with-hdr
>>>>  * Description: Tests brightness with HDR
>>>> - * Functionality: colorspace, static_hdr
>>>>  *
>>>>  * SUBTEST: static-%s
>>>>  * Description: Tests %arg[1].
>>>> - * Functionality: colorspace, static_hdr
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
>>>> index c2cc08036..981b6ceb6 100644
>>>> --- a/tests/kms_invalid_mode.c
>>>> +++ b/tests/kms_invalid_mode.c
>>>> @@ -28,9 +28,7 @@
>>>>  * Description: Make sure all modesets are rejected when the 
>>>> requested mode is
>>>>  *              invalid
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
>>>> index 0f3a68fed..e217f81d0 100644
>>>> --- a/tests/kms_lease.c
>>>> +++ b/tests/kms_lease.c
>>>> @@ -26,9 +26,7 @@
>>>>  * Category: Display
>>>>  * Description: Test of CreateLease.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: lease
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/kms_multipipe_modeset.c 
>>>> b/tests/kms_multipipe_modeset.c
>>>> index e67392668..84c2c58f8 100644
>>>> --- a/tests/kms_multipipe_modeset.c
>>>> +++ b/tests/kms_multipipe_modeset.c
>>>> @@ -37,9 +37,7 @@
>>>>  * Description: Verify if simultaneous modesets on all the 
>>>> supported pipes is
>>>>  *              successful. Validate using CRC verification
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> IGT_TEST_DESCRIPTION("Test simultaneous modeset on all the 
>>>> supported pipes");
>>>> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
>>>> index d30f7f095..1db7f8e9a 100644
>>>> --- a/tests/kms_panel_fitting.c
>>>> +++ b/tests/kms_panel_fitting.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Category: Display
>>>>  * Description: Test display panel fitting
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: edp, panel_fitting, scaling
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
>>>> index 0c19745bc..f1760d577 100644
>>>> --- a/tests/kms_pipe_crc_basic.c
>>>> +++ b/tests/kms_pipe_crc_basic.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Category: Display
>>>>  * Description: Tests behaviour of CRC
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: crc
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -58,17 +56,14 @@
>>>>  *
>>>>  * SUBTEST: suspend-read-crc
>>>>  * Description: Suspend test for pipe CRC reads
>>>> - * Functionality: crc, suspend
>>>>  *
>>>>  * SUBTEST: hang-read-crc
>>>>  * Description: Hang test for pipe CRC read
>>>> - * Functionality: crc, hang
>>>>  */
>>>>
>>>> /**
>>>>  * SUBTEST: compare-crc-sanitycheck-%s
>>>>  * Description: Basic sanity check for CRC mismatches with %arg[1]
>>>> - * Functionality: crc, pixel_formats
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
>>>> index b9bf025bd..d08ec81e4 100644
>>>> --- a/tests/kms_plane.c
>>>> +++ b/tests/kms_plane.c
>>>> @@ -30,7 +30,6 @@
>>>>  * Description: Testes for KMS Plane
>>>>  * Driver requirement: i915, xe
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -44,16 +43,13 @@
>>>> /**
>>>>  * SUBTEST: planar-pixel-format-settings
>>>>  * Description: verify planar settings for pixel format are handled 
>>>> correctly
>>>> - * Functionality: pixel_formats, plane
>>>>  *
>>>>  * SUBTEST: plane-position-%s
>>>>  * Description: Verify plane position using two planes to create a 
>>>> %arg[1]
>>>> - * Functionality: plane
>>>>  *
>>>>  * SUBTEST: plane-position-hole-dpms
>>>>  * Description: Verify plane position using two planes to create a 
>>>> partially
>>>>  *              covered screen and check for DPMS
>>>> - * Functionality: dpms, plane
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -64,12 +60,10 @@
>>>> /**
>>>>  * SUBTEST: plane-panning-%s
>>>>  * Description: Verify plane panning at %arg[1] using primary plane
>>>> - * Functionality: plane
>>>>  *
>>>>  * SUBTEST: plane-panning-bottom-right-suspend
>>>>  * Description: Verify plane panning at bottom-right position with 
>>>> suspend using
>>>>  *              primary plane
>>>> - * Functionality: plane, suspend
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -80,7 +74,6 @@
>>>> /**
>>>>  * SUBTEST: pixel-%s
>>>>  * Description: verify the pixel formats for given plane and pipe
>>>> - * Functionality: pixel_formats, plane
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> diff --git a/tests/kms_plane_alpha_blend.c 
>>>> b/tests/kms_plane_alpha_blend.c
>>>> index eaec37661..047cc57b4 100644
>>>> --- a/tests/kms_plane_alpha_blend.c
>>>> +++ b/tests/kms_plane_alpha_blend.c
>>>> @@ -29,9 +29,7 @@
>>>>  * Category: Display
>>>>  * Description: Test plane alpha and blending mode properties
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: plane
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
>>>> index 5b3cdc069..fd9e00085 100644
>>>> --- a/tests/kms_plane_cursor.c
>>>> +++ b/tests/kms_plane_cursor.c
>>>> @@ -25,9 +25,7 @@
>>>>  * Category: Display
>>>>  * Description: Tests cursor interactions with primary and overlay 
>>>> planes.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: cursor, plane
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
>>>> index ef85e8fb9..4ed098e41 100644
>>>> --- a/tests/kms_plane_lowres.c
>>>> +++ b/tests/kms_plane_lowres.c
>>>> @@ -28,9 +28,7 @@
>>>>  * Description: Test atomic mode setting with a plane by switching 
>>>> between high
>>>>  *              and low resolutions
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: plane, tiling
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -45,7 +43,6 @@
>>>>  * SUBTEST: tiling-none
>>>>  * Description: Tests the visibility of the planes when switching 
>>>> between high
>>>>  *              and low resolution with Linear buffer (no tiling)
>>>> - * Functionality: plane
>>>>  *
>>>>  * SUBTEST: tiling-%s
>>>>  * Description: Tests the visibility of the planes when switching 
>>>> between high
>>>> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
>>>> index b7922c357..eda300b06 100644
>>>> --- a/tests/kms_plane_multiple.c
>>>> +++ b/tests/kms_plane_multiple.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Category: Display
>>>>  * Description: Test atomic mode setting with multiple planes.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: plane, tiling
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -45,7 +43,6 @@
>>>>  * Description: Check that the kernel handles atomic updates of 
>>>> multiple planes
>>>>  *              correctly by changing their geometry and making 
>>>> sure the changes
>>>>  *              are reflected immediately after each commit.
>>>> - * Functionality: plane
>>>>  *
>>>>  * SUBTEST: tiling-%s
>>>>  * Description: Check that the kernel handles atomic updates of 
>>>> multiple planes
>>>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>>>> index 4e74f0e10..63d35d76b 100644
>>>> --- a/tests/kms_plane_scaling.c
>>>> +++ b/tests/kms_plane_scaling.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Category: Display
>>>>  * Description: Test display plane scaling
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: plane, scaling
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -93,15 +91,12 @@
>>>> /**
>>>>  * SUBTEST: plane-scaler-unity-scaling-with-pixel-format
>>>>  * Description: Tests scaling with pixel formats, unity scaling.
>>>> - * Functionality: pixel_formats, plane, scaling
>>>>  *
>>>>  * SUBTEST: plane-scaler-with-clipping-clamping-pixel-formats
>>>>  * Description: Tests scaling with clipping and clamping, pixel 
>>>> formats.
>>>> - * Functionality: pixel_formats, plane, scaling
>>>>  *
>>>>  * SUBTEST: plane-upscale-%s-with-pixel-format
>>>>  * Description: Tests upscaling with pixel formats %arg[1].
>>>> - * Functionality: pixel_formats, plane, scaling
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -112,7 +107,6 @@
>>>> /**
>>>>  * SUBTEST: plane-downscale-factor-%s-with-pixel-format
>>>>  * Description: Tests downscaling with pixel formats for %arg[1] 
>>>> scaling factor.
>>>> - * Functionality: pixel_formats, plane, scaling
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
>>>> index 7e7924618..cc43088c2 100644
>>>> --- a/tests/kms_prop_blob.c
>>>> +++ b/tests/kms_prop_blob.c
>>>> @@ -30,9 +30,7 @@
>>>>  * Category: Display
>>>>  * Description: Tests behaviour of mass-data 'blob' properties.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
>>>> index 57f07e699..408e23578 100644
>>>> --- a/tests/kms_properties.c
>>>> +++ b/tests/kms_properties.c
>>>> @@ -26,9 +26,7 @@
>>>>  * Category: Display
>>>>  * Description: Test to validate the properties of all planes, crtc 
>>>> and connectors
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
>>>> index 22fb5383b..e18768141 100644
>>>> --- a/tests/kms_rotation_crc.c
>>>> +++ b/tests/kms_rotation_crc.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Category: Display
>>>>  * Description: Tests different rotations with different planes & 
>>>> formats
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: plane, rotation
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -65,7 +63,6 @@
>>>>  *
>>>>  * SUBTEST: bad-tiling
>>>>  * Description: Checking unsupported tiling for gen9+ with 90 
>>>> degree of rotation
>>>> - * Functionality: plane, rotation, tiling
>>>>  *
>>>>  * SUBTEST: exhaust-fences
>>>>  * Description: This test intends to check for fence leaks 
>>>> exhaustively
>>>> @@ -74,7 +71,6 @@
>>>> /**
>>>>  * SUBTEST: primary-%s-tiled-reflect-x-%d
>>>>  * Description: Test for %arg[1] & %arg[2] degree rotation on 
>>>> primary plane
>>>> - * Functionality: plane, rotation, tiling
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> @@ -89,7 +85,6 @@
>>>> /**
>>>>  * SUBTEST: primary-%s-tiled-reflect-x-%d
>>>>  * Description: Test for %arg[1] & %arg[2] degree rotation on 
>>>> primary plane
>>>> - * Functionality: plane, rotation, tiling
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
>>>> index 4e6a32414..47ed35c7e 100644
>>>> --- a/tests/kms_scaling_modes.c
>>>> +++ b/tests/kms_scaling_modes.c
>>>> @@ -29,9 +29,7 @@
>>>>  * Category: Display
>>>>  * Description: Test display scaling modes
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: edp, plane, scaling
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
>>>> index 0ecb825db..eb6482cc2 100644
>>>> --- a/tests/kms_selftest.c
>>>> +++ b/tests/kms_selftest.c
>>>> @@ -26,9 +26,7 @@
>>>>  * Category: Display
>>>>  * Description: Basic sanity check of KMS selftests.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
>>>> index bf3cdf821..f93724314 100644
>>>> --- a/tests/kms_sequence.c
>>>> +++ b/tests/kms_sequence.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Category: Display
>>>>  * Description: Test CrtcGetSequence and CrtcQueueSequence.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: vblank
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
>>>> index d61cfeb9a..484c3a95f 100644
>>>> --- a/tests/kms_setmode.c
>>>> +++ b/tests/kms_setmode.c
>>>> @@ -27,9 +27,7 @@
>>>>  * Description: Tests the mode by iterating through all 
>>>> valid/invalid crtc/connector
>>>>  *              combinations
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "config.h"
>>>> @@ -50,7 +48,6 @@
>>>>  * SUBTEST: basic
>>>>  * Description: Tests the vblank timing by iterating through all 
>>>> valid crtc/connector
>>>>  *              combinations
>>>> - * Functionality: kms_core, vblank
>>>>  *
>>>>  * SUBTEST: basic-clone-single-crtc
>>>>  * Description: Test allows the use of a single CRTC for two 
>>>> connectors, such as VGA/HDMI,
>>>> diff --git a/tests/kms_sysfs_edid_timing.c 
>>>> b/tests/kms_sysfs_edid_timing.c
>>>> index 763d36d32..b77ebc3d6 100644
>>>> --- a/tests/kms_sysfs_edid_timing.c
>>>> +++ b/tests/kms_sysfs_edid_timing.c
>>>> @@ -42,9 +42,7 @@
>>>>  *              Additionally, make sure that the mean time for all 
>>>> connectors is
>>>>  *              not too long.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #define THRESHOLD_PER_CONNECTOR        150
>>>> diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
>>>> index ce42b890b..1f5331408 100644
>>>> --- a/tests/kms_tiled_display.c
>>>> +++ b/tests/kms_tiled_display.c
>>>> @@ -42,7 +42,6 @@
>>>>  * Description: Test for Transcoder Port Sync for Display Port 
>>>> Tiled Displays
>>>>  * Driver requirement: i915, xe
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -55,12 +54,10 @@
>>>>  * SUBTEST: basic-test-pattern
>>>>  * Description: Make sure the Tiled CRTCs are synchronized and we 
>>>> get page flips
>>>>  *              for all tiled CRTCs in one vblank (executes on real 
>>>> panel).
>>>> - * Functionality: tiled_display
>>>>  *
>>>>  * SUBTEST: basic-test-pattern-with-chamelium
>>>>  * Description: Make sure the Tiled CRTCs are synchronized and we 
>>>> get page flips
>>>>  *              for all tiled CRTCs in one vblank (executes on 
>>>> chamelium).
>>>> - * Functionality: chamelium, tiled_display
>>>>  */
>>>>
>>>> IGT_TEST_DESCRIPTION("Test for genlocked CRTCs with tiled displays");
>>>> diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
>>>> index 9f6f4071e..a6dbb8823 100644
>>>> --- a/tests/kms_tv_load_detect.c
>>>> +++ b/tests/kms_tv_load_detect.c
>>>> @@ -34,9 +34,7 @@
>>>>  * SUBTEST: load-detect
>>>>  * Description: Check tv load detection works correctly.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: obsolete_test
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> IGT_TEST_DESCRIPTION("Check tv load detection works correctly.");
>>>> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
>>>> index c53741b62..b8044ad42 100644
>>>> --- a/tests/kms_vblank.c
>>>> +++ b/tests/kms_vblank.c
>>>> @@ -27,7 +27,6 @@
>>>>  * Description: Test speed of WaitVblank.
>>>>  * Driver requirement: i915, xe
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -48,44 +47,35 @@
>>>> /**
>>>>  * SUBTEST: crtc-id
>>>>  * Description: Check the vblank and flip events works with given 
>>>> crtc id
>>>> - * Functionality: vblank
>>>>  *
>>>>  * SUBTEST: invalid
>>>>  * Description: Negative test for vblank request
>>>> - * Functionality: vblank
>>>>  *
>>>>  * SUBTEST: ts-continuation-dpms-rpm
>>>>  * Description: Test TS continuty with DPMS & RPM while hanging by 
>>>> introducing
>>>>  *              NOHANG flag
>>>> - * Functionality: dpms, hang, rpm, vblank
>>>>  *
>>>>  * SUBTEST: ts-continuation-dpms-suspend
>>>>  * Description: Test TS continuty with DPMS & Suspend while hanging 
>>>> by introducing
>>>>  *              NOHANG flag
>>>> - * Functionality: dpms, hang, suspend, vblank
>>>>  *
>>>>  * SUBTEST: ts-continuation-suspend
>>>>  * Description: Test TS continuty with Suspend while hanging by 
>>>> introducing NOHANG
>>>>  *              flag
>>>> - * Functionality: hang, suspend, vblank
>>>>  *
>>>>  * SUBTEST: ts-continuation-modeset-rpm
>>>>  * Description: Test TS continuty during Modeset with Suspend while 
>>>> hanging by
>>>>  *              introducing NOHANG flag
>>>> - * Functionality: hang, rpm, vblank
>>>>  *
>>>>  * SUBTEST: accuracy-idle
>>>>  * Description: Test Accuracy of vblank events while hanging by 
>>>> introducing NOHANG
>>>>  *              flag
>>>> - * Functionality: hang, vblank
>>>>  *
>>>>  * SUBTEST: %s
>>>>  * Description: Test %arg[1] while hanging by introducing NOHANG flag
>>>> - * Functionality: hang, vblank
>>>>  *
>>>>  * SUBTEST: %s-hang
>>>>  * Description: Test %arg[1] with injected hang is working properly
>>>> - * Functionality: hang, vblank
>>>>  *
>>>>  * arg[1]:
>>>>  *
>>>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
>>>> index e7d2ff1db..c4bb30f6a 100644
>>>> --- a/tests/kms_vrr.c
>>>> +++ b/tests/kms_vrr.c
>>>> @@ -25,9 +25,7 @@
>>>>  * Category: Display
>>>>  * Description: Test to validate diffent features of VRR
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: adaptive_sync
>>>>  * Mega feature: Adaptive Sync
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include "igt.h"
>>>> @@ -41,7 +39,6 @@
>>>>  * SUBTEST: cmrr
>>>>  * Description: Test to validate the content rate to exactly match 
>>>> with the
>>>>  *         requested rate without any frame drops.
>>>> - * Functionality: CMRR
>>>>  *
>>>>  * SUBTEST: flip-basic
>>>>  * Description: Tests that VRR is enabled and that the difference 
>>>> between flip
>>>> @@ -54,33 +51,27 @@
>>>>  * SUBTEST: flip-dpms
>>>>  * Description: Tests with DPMS that VRR is enabled and that the 
>>>> difference
>>>>  *              between flip timestamps converges to the requested 
>>>> rate.
>>>> - * Functionality: adaptive_sync, dpms
>>>>  *
>>>>  * SUBTEST: flip-suspend
>>>>  * Description: Tests that VRR is enabled and that the difference 
>>>> between flip
>>>>  *              timestamps converges to the requested rate in a 
>>>> suspend test
>>>> - * Functionality: adaptive_sync, suspend
>>>>  *
>>>>  * SUBTEST: flipline
>>>>  * Description: Make sure that flips happen at flipline decision 
>>>> boundary.
>>>>  *
>>>>  * SUBTEST: seamless-rr-switch-vrr
>>>>  * Description: Test to switch RR seamlessly without modeset.
>>>> - * Functionality: adaptive_sync, lrr
>>>>  *
>>>>  * SUBTEST: seamless-rr-switch-drrs
>>>>  * Description: Test to switch RR seamlessly without modeset.
>>>> - * Functionality: adaptive_sync, drrs
>>>>  *
>>>>  * SUBTEST: seamless-rr-switch-virtual
>>>>  * Description: Test to create a Virtual Mode in VRR range and 
>>>> switch to it
>>>>  *         without a full modeset.
>>>> - * Functionality: LRR
>>>>  *
>>>>  * SUBTEST: lobf
>>>>  * Description: Test to validate link-off between active frames in 
>>>> non-psr
>>>>  *              operation
>>>> - * Functionality: LOBF
>>>>  *
>>>>  * SUBTEST: max-min
>>>>  * Description: Oscillates between highest and lowest refresh each 
>>>> frame for
>>>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>>>> index 1775986fe..05680837e 100644
>>>> --- a/tests/kms_writeback.c
>>>> +++ b/tests/kms_writeback.c
>>>> @@ -30,9 +30,7 @@
>>>>  *              writeback; it validates bad and good combination, 
>>>> check color
>>>>  *              format, and check the output result by using CRC.
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> #include <errno.h>
>>>> diff --git a/tests/testdisplay.c b/tests/testdisplay.c
>>>> index e83655fb5..d498eb04c 100644
>>>> --- a/tests/testdisplay.c
>>>> +++ b/tests/testdisplay.c
>>>> @@ -81,9 +81,7 @@
>>>>  * Description: This test is intended for testing of display 
>>>> functionality like
>>>>  *              modeset, clone modes, test patterns & pixel 
>>>> generators etc..
>>>>  * Driver requirement: i915, xe
>>>> - * Functionality: kms_core
>>>>  * Mega feature: General Display Features
>>>> - * Test category: functionality test
>>>>  */
>>>>
>>>> IGT_TEST_DESCRIPTION("Tests basic display functionality.");
>>>> -- 
>>>> 2.25.1
>>>>
>>

