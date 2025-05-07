Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB7CC3ABBF
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 10:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854D510E18F;
	Wed,  7 May 2025 10:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJC3v47l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDBA10E18F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 10:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746615021; x=1778151021;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hcC6Nhi7pLPZpYc+TmcySvAbc211gPpEy/jb9gS2TAM=;
 b=ZJC3v47l9/mu5rJ266XsKN+iTxALGco6UfoT6xQ9R3XN3RKv+rhzl7Wn
 P0QwEz2Pf5BxmMbpuBeHrHt7eYUxoAT6yh9Hsyq1pJ4g3DuJ7amnG4y+l
 lWhYRm1qk6E6mM/5Ff5ROlPrKKsLeCXFFWDDieoNhxJqpcau7MUj42nzK
 IinFkZGXlHInKIknqlWDzjl6sZt3sJyLQ3FNsvZCsOBmmI2kCkz/soNUB
 rb6DR27KcYRonrjtVf6rEJdtcweYh3+qIL6TrzfU/hKXru+asMyHUkPB7
 aJylm21AI96JPPyJM2+70e5a+MldjuBqJKaGgOeH06HmT1wn+gCOZhHCL A==;
X-CSE-ConnectionGUID: CUETYudOQ5aT/IxFRYHoqA==
X-CSE-MsgGUID: MdD9yvqZRkKOSJYYnUDMgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59689890"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="59689890"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 03:50:21 -0700
X-CSE-ConnectionGUID: 0xsAqq1LTxKrl0VyDEokzg==
X-CSE-MsgGUID: 8lWOkT1wTwqRjpVfQrVd8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="141043585"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 03:50:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 03:50:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 03:50:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 03:50:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJcdRF4eeL/5N6NZz5IZbJ/RiDNpI7EDmIoHwHGpHmxUrc0HY3faZNTb6fChm/qvUmpsGsiTrY1Ki5v62oU3r/H/z7rWVLFREKTpjWhRvV0N/66cjq21cLGw+jMyPdq0G64PcCmqk2461Ypr3IpKiftP7WcObiJFklHQMNcyuVfscs5JZfhvKzXi15WE6YeVSfbch2Yensa1vkC7xuvuHY+U/Oo2AdiRE1bPVK52pQxj2np6pvVwuFXsnytFWFWHc0ayTXBSI0vPjjtRO8AAL5I4FM+gwLkJIepy89625YDOgJWjzkWDEa/9MjSA4Pmggy/UKwgLLH7RRYSMnoCa0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z74RCyizkymMwCPSoIgK7s2ytNf9e7B8mnSSablZFjk=;
 b=jqkNzkj0ybzdJVeSVOcuNYt43U7gu/YaOaipxqcZihRz3QU6l0NAM/HeTOS5/XbA13xnmuKbemjMWJOYNrtSNyERlLCd+gkePDtyq/hqNa8YGrNjXIsZI6ZFVfwsm+pV9TGpnpFzXAGrXSnnWsEBOta6DKaZ+l5YP1NcQsWNVKlmFdGlGKXLj44mcLsioDJay7gzKyFTB1F+wHXyTrXjb0cGrNWDwXDryXfp4E3/bWGdvUR8p13khFRRdJtoiaZmi5XErMbqIH1ZzT2PBRuoOPqaH28Eytf6ApvTyyZwuSIjWCetYTTVwKE9GYSfhJV+Bor3OBgnKOC92H3b4KdBBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM3PPF97A7CBDC1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 7 May
 2025 10:50:11 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8699.035; Wed, 7 May 2025
 10:50:10 +0000
Message-ID: <5e507a20-03ea-4197-ac8f-d388cb9e2d30@intel.com>
Date: Wed, 7 May 2025 16:20:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/2] tests/i915/pm_rc6_residency: Use sysfs to achieve
 peak frequency
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20250422063135.2502377-1-sk.anirban@intel.com>
 <20250422063135.2502377-2-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250422063135.2502377-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM3PPF97A7CBDC1:EE_
X-MS-Office365-Filtering-Correlation-Id: 9790ff5f-15aa-4414-b9bb-08dd8d54f03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2tpaFdsNjdteUZWdVFlc3dRZUtRbFV3UmlscEZRelhmdzhtRnNqUmdYVHVi?=
 =?utf-8?B?a0FoTVFGT2ZYWWI2MStEdHVBMm5ZRWg1dW4zMDhuRmZTbDlES2pyYU4zb3I0?=
 =?utf-8?B?R1h2MnN3SysveG1FNHN3amVJL0ljandnTzFsU2pTdisxWExyTTJQTU82NVU5?=
 =?utf-8?B?TVpnRGQ2V0NtR1Z0K2hqRGlxcnFoOTFsUUlQWnM0NnJ3V0JCbngzQkIxQ0Rp?=
 =?utf-8?B?cHUxODNrQVUxdTMxSTBsQXMyN3lUUVVTeVdiT0d0WVNMTWZIMGhTRnh1Mlp0?=
 =?utf-8?B?ZmJFdENnRkZYclJNMzBzSDQ0WlFxNlBQa3MrOWI2RHVyTkZKNnFFTi9Nc1VV?=
 =?utf-8?B?R09BZDJ2T1JmY2Q4Uy96MHZ3TS81NlJqR1hrdC92clBkdU4zUXU2aElFYnRF?=
 =?utf-8?B?TUZubDFCOVRseUU4YlEzMnhKK0xMNnZCVWJKenF2ZjJxaWQ4VWxVR3FhYzkz?=
 =?utf-8?B?L3J2SzE4Z2I4MDVuckR6UUxxT2RiaktFNHc4MHVlbUEwbkIwdnFzZ2NxMk1w?=
 =?utf-8?B?aUo3NmY1QkJUQXBHL3gzU3orQ3RYanNPdSt5aER0K3ZnZGdLSW1ZUG5UK3dq?=
 =?utf-8?B?VU0yY3pWaXZ5Y0VSYUVqR2t6b3dKcXhEVEI1YTdPL25SbzMzWndJNG9ML0M5?=
 =?utf-8?B?VjVnWldyK01UMnVpTFY3elk0UW1RT0w4SjQ0ZGhuSnVYeVU0Si9DQVpUdFFE?=
 =?utf-8?B?bm5ZTEEvQ2lDL2lONUNNME5Fd24wdHJDYU5NbDNmU0lHVnMxcDQrVVh3OHJx?=
 =?utf-8?B?QmR1ZWg5TDlSOEdjM1dNK3hpTnJIL0V6dTBBNkZhemlCcDlKQktIdjV5alFl?=
 =?utf-8?B?Vk05cXlaYkNwcFJIaVMzRnpmRkxBajVQM2JCbGh6d0IwS01sSVg5SDF0WmUv?=
 =?utf-8?B?RW1FQmErandSY1ZJM0JIMUh0Q0R6eXc0dXhhTXNPT2lReU9zWFFHcHdMV0ND?=
 =?utf-8?B?NStkSlFUcFJBUlVGVDhOZ1pQWWRIVldiMnNiVTJjUzEyelhpMjhtcDRCSjFT?=
 =?utf-8?B?cENCMkhJOHV3OWNMQ3I2d1prS1d6UmNva2c1Y0x3MnRrZzY2SGcvbDlFcHN1?=
 =?utf-8?B?VTl6aEZCdnhrL1p4RUdRSFlHYXZsU1hoOHZETDRzM2FPaHdZWXBleTI5Uzh3?=
 =?utf-8?B?UEp2NUVtWElmdmRSMWNsOUptc0c4NVNiUnFKdjZsRXBiRHNaeVVEQm01U0py?=
 =?utf-8?B?dW44Z2NHZE84d2pFdW5UOXkxYUtISVZKTWVubFZXYkJHVDAyMTEyTllFbXYv?=
 =?utf-8?B?OTZaL05MRmtYL3o5b2k4N2lMVXd4b043OHhGRmVIUUdpVDdBRXl1TkJvWmFM?=
 =?utf-8?B?aHNmdG5lMEdaNCtIK0Y1VUpQYW5ja1p6V1A5SkdTeVR4UWVJN1o1M2pVRFpO?=
 =?utf-8?B?TG94MVRERFBsdGp0dVVjblAwb1ppRXhLS0tGSytMVjY2R0hMRCtyNWt6RmhF?=
 =?utf-8?B?Q2h0MmY5aitMVzFobU04WWw5MXFaTlZqY0xBcDQ2MFllZTBFSnRCV1FRSjRl?=
 =?utf-8?B?SW1vWDA3Mk9DSGZmVlk0eERoYVRacnVhVE1kSWpNbE1NYU1jbG8yWmQ2YTZM?=
 =?utf-8?B?SFpEZHlhZ09iQ2Z4Qll3QXJMdU9MVG9JK3NmWUw4eXJCRnpSbWVxaVFDSmxj?=
 =?utf-8?B?czJjZ3B1SVg0bld0VEVrNTVKQXg5SHp4RTNEKy9qL0xZUFBNN1RUbERGTUhM?=
 =?utf-8?B?RUhmUzNHTXQvSExJMjJaZnBKVGpVMEFVRkxhZlJoQVc1WVdKMWVMM0EzYS93?=
 =?utf-8?B?emZlUFc5S1d6OVpFOVBJdVlId0tZSHZkdTI2NUtkN3NaNXpxNFQ2YkR5YXVh?=
 =?utf-8?B?Zm01WE5QaXpWSVpaaThrdXlPTG02a0ptUDZUSHBRbkVCRDRyR3JUeGhTR2N6?=
 =?utf-8?B?RkNBMVV4V2h4L0lSR0Z5bmdmT2JGNS9wSU84NjIrcjNnTHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGszRlkvK2lxZ3owdHAxVHRpcXhvd2duOU16ZjRiZ1dFQ3dnbDdIb0hEVTN5?=
 =?utf-8?B?VlB4b0NXUlRYU3ZJK2ZRbGszUkFjdllVN2hLTUYzZlJGRlU3NzU4eVlkSlhC?=
 =?utf-8?B?a1lWT3BlazAxTUpZMm0ybEFQUlZ2a3FHMDMxQnQ0ajliRy8yOE1IakMvWlUw?=
 =?utf-8?B?bDRjd3ZZWExUOERXVzRBNm1hK2g0S1VURGRyU1pOYXZ0bVo5N0NERkVFTUdT?=
 =?utf-8?B?eDFQNUJDUGpRS3d1ZEVUNkZRbk5lZ0x5YVRHVG9YT0hSdGZFNExrS3ErWkhj?=
 =?utf-8?B?bi81WlhvS0JQcnhwTEluREtFdjZZM1dpVWhZVmR6NU1Qem1kS1Z2TS9EVkt6?=
 =?utf-8?B?N3dtL2Q1RHk0aTFYbzlFQzBpNjVRekpYd3VBRm1UTUVMaUp3NzYranBIL09I?=
 =?utf-8?B?bzVUWXBEUnIwMHdtdFgrMEpLakhVK2xHMnliZ2dVSGJaYWs3RXErWkVPd1R6?=
 =?utf-8?B?bGdHNE05ZGwwd2xMbXZQM0VINlczcU9zTVgvd0VwZkVKZ2lPa3BWb0xaaUVL?=
 =?utf-8?B?dUJjWkR3Ym5hTDBDb2taNlBpem1xRENHSjh1WCtNL2wxVkkyR3pMbzM2TXdL?=
 =?utf-8?B?dTFEZjRhSGVGRHVja0NTdXphSHRmS3JjMHM4Wmc1MVRycmF0UTBUTDR1c1Js?=
 =?utf-8?B?c0RibXhmSFRMN0I5akVZNXg4elBGMFA1a3prTVd6cTJkWXlqRFhzZFJNTmZU?=
 =?utf-8?B?cU1DTSs3STU1S3JsOEhvMGZIUGxUNE1ybkMzTVRCR3d1bUwxaWV0ZllZdFpK?=
 =?utf-8?B?R0V6R3kwd1dEOEM5dDBpUFo3QmlVY0NHMEFrU3V0c0t3L1VpeWlGTkNWOFlE?=
 =?utf-8?B?VUpLZWJySmlKeDNPOTBvUktzV3hCQ3VOWGxPOHFrUEFJZS9DSTZRSVF6eERk?=
 =?utf-8?B?LzdlT3RwQ2ZSazd4MThpMzdnMVRlMmRXS00za1Q0c0N4bklENHZHRWJWNGQ2?=
 =?utf-8?B?UjZQdlZ3QjVNdFRiemsxSDlDWmtCQ1YvaUZDR2ZLa2MrMTZ4UWVrWUpES0tI?=
 =?utf-8?B?d3NqQ3dkNkZpMGpvdG85VVBiKzRteERDS0I0OVpKTldEU2tvQWttWklHcmVG?=
 =?utf-8?B?S3hmckdSK0xmZjFQV0RwQjgxOEVTeWtqeVRHaS9CMGFGaU1QRjkwSlJUKzVv?=
 =?utf-8?B?aThTTFRkREI5WnFaMk42S0l0VUs2Y2Z1SjFieEZ3Qm1ZdURyYkJvWXBmUG8r?=
 =?utf-8?B?bUoxN08vQTF6MUI1UGhzMDJDbFp0ZXN2UUZPU01lQS9UYmZzWHhxOGhvRGV1?=
 =?utf-8?B?WVVseFRyQktDa1FlK1gvczJBOS9QTHVMQ0xlbTNKZ1BFQzYraTRSL1hqc0xD?=
 =?utf-8?B?VEExSW9RRWZFcGh2YkFibTJHMVdaMXpTODh0eE9CYjRXdC9EajlPaUtxT1hw?=
 =?utf-8?B?dnpTL3B1UlJLNlJGTGkrTmxrbnU2NmdxWTU5b0NFV2pmdzlEeFZ4UWt1d2tl?=
 =?utf-8?B?YVY1cXdmUjc2NGJDRm85TE05T3dBd2ljNGVjV1VOZVhmRisxMjJ4MndtcEl5?=
 =?utf-8?B?SGsrRHFUZkJCVkcxVzRsQ3R5b1htNU1RODFmZlZNR1lEZEZJUlFZUDdMS0Rt?=
 =?utf-8?B?Zkc4OFJpOW9qd2duMXlJcTV5bUhXUTB5MU1aR0JSYlMrVG5WNmdsakpQaG1J?=
 =?utf-8?B?c0JiczZXRGtrS1dCTlNkNFRGRVE2d0RlYW5MZWpON1E3UDM0OGdBbDRNTGVD?=
 =?utf-8?B?cS9FWklQeTc5anNyWmxTckdmWXYyMCtiQUVnWmJnMlJWY2YwOE9TcHUxNHNn?=
 =?utf-8?B?dDhRaGk0allnbUpub2Yrdk1EejAvcjFWenFwV1F1alJOVVUxaUNLa013RlF0?=
 =?utf-8?B?NS9MN1Rab2JqRkg4dnZGMjZFdyt3Tk1KSWN0TXI4RTBzLzZiS3JPd0dCVFNy?=
 =?utf-8?B?SkFLVm01M1F4L01qdXcwWGtLallmbFJQenNlQVEzUmp2MmFLRHd5OW5MTExl?=
 =?utf-8?B?RkFJS1FCVEk3Q0M5bzdGLzQ4MmtNWExjZjdkaUFPRXg0d3pEczU0TGVyaFBv?=
 =?utf-8?B?aEtHaFdzZXEydDM0S3V6d1VBRm9OWnltVXJqZ3NEMUVISHAyMXVLSWhNY08r?=
 =?utf-8?B?TDdwUHdGd0RXbTVHcFJvNVdaMHh1Vk1WZHBnTmRRZG1acExiSUN0amtCSjNj?=
 =?utf-8?Q?W0yQnt6D/vpLDgJZBJrR32Etl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9790ff5f-15aa-4414-b9bb-08dd8d54f03c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 10:50:10.7334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6Nz+EP4xcVgf1qrAty1xLELb3ajjIJyydAiujjdLW+dLhr3zPfyLHEmJ2j6n+IxaVORyYHombfNSEUGaXBsKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF97A7CBDC1
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

Hi Anirban

On 4/22/2025 12:01 PM, sk.anirban@intel.com wrote:
> From: Sk Anirban <sk.anirban@intel.com>
> 
> Leverage IGT spinner to trigger frequency scaling and
> set RPS minimum frequency to RP0 for achieving peak frequency.
> This method replaces the existing waitboost mechanism used
> to reach maximum frequency.
> 
> v2:
>   - Disable power consumption check for dgfx
> 
> v3:
>   - Implement igt exit handler
> 
> v4:
>   - Cosmetic changes (Riana)
> 
> v5:
>   - Limit the power consumption test to GT0 only
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/i915_pm_rc6_residency.c | 141 +++++++++++++++++++---------
>   1 file changed, 96 insertions(+), 45 deletions(-)
> 
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index c9128481d..1b447f83c 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -264,17 +264,6 @@ static bool __pmu_wait_for_rc6(int fd)
>   	return false;
>   }
>   
> -static uint32_t batch_create(int fd)
> -{
> -	const uint32_t bbe = MI_BATCH_BUFFER_END;
> -	uint32_t handle;
> -
> -	handle = gem_create(fd, 4096);
> -	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
> -
> -	return handle;
> -}
> -
>   static int open_pmu(int i915, uint64_t config)
>   {
>   	int fd;
> @@ -286,45 +275,83 @@ static int open_pmu(int i915, uint64_t config)
>   	return fd;
>   }
>   
> -#define WAITBOOST 0x1
> +#define FREQUENT_BOOST 0x1
>   #define ONCE 0x2
>   
>   static void sighandler(int sig)
>   {
>   }
>   
> -static void bg_load(int i915, uint32_t ctx_id, uint64_t engine_flags, unsigned int flags, unsigned long *ctl)
> +static uint32_t get_freq(int dirfd, uint8_t id)
> +{
> +	uint32_t val;
> +
> +	igt_assert(igt_sysfs_rps_scanf(dirfd, id, "%u", &val) == 1);
> +
> +	return val;
> +}
> +
> +static int set_freq(int dirfd, uint8_t id, uint32_t val)
> +{
> +	return igt_sysfs_rps_printf(dirfd, id, "%u", val);
> +}
> +
> +uint32_t *stash_min;
> +int i915 = -1;
> +
> +static void restore_freq(int sig)
> +{
> +	int gt_num;
> +	int dirfd;
> +
> +	for_each_sysfs_gt_dirfd(i915, dirfd, gt_num) {
> +		igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min[gt_num]));
> +	}
> +}
> +
> +static void bg_load(const intel_ctx_t *ctx, int dirfd, uint64_t engine_flags,
> +		    unsigned int flags, unsigned long *ctl, unsigned int gt)
>   {
>   	const bool has_execlists = intel_gen(intel_get_drm_devid(i915)) >= 8;
> -	struct drm_i915_gem_exec_object2 obj = {
> -		.handle = batch_create(i915),
> -	};
> -	struct drm_i915_gem_execbuffer2 execbuf = {
> -		.buffers_ptr = to_user_pointer(&obj),
> -		.buffer_count = 1,
> -		.flags = engine_flags,
> -		.rsvd1 = ctx_id,
> -	};
>   	struct sigaction act = {
>   		.sa_handler = sighandler
>   	};
> +	int64_t timeout = 1;
> +	uint64_t ahnd;
> +	int rp0;
>   
> +	ahnd = get_reloc_ahnd(i915, ctx->id);
> +	rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
>   	sigaction(SIGINT, &act, NULL);
>   	do {
>   		uint64_t submit, wait, elapsed;
>   		struct timespec tv = {};
> +		igt_spin_t *spin;
>   
>   		igt_nsec_elapsed(&tv);
> -
> -		gem_execbuf(i915, &execbuf);
> +		spin = igt_spin_new(i915,
> +				    .ahnd = ahnd,
> +				    .ctx = ctx,
> +				    .engine = engine_flags);
>   		submit = igt_nsec_elapsed(&tv);
> -		if (flags & WAITBOOST) {
> -			gem_sync(i915, obj.handle);
> +		if (flags & FREQUENT_BOOST) {
> +			/* Set MIN freq to RP0 to achieve the peak freq */
> +			igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0));
> +			igt_assert(gem_bo_busy(i915, spin->handle));
> +			gem_wait(i915, spin->handle, &timeout);
> +
> +			/* Restore the MIN freq back to default */
> +			igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min[gt]));
> +			igt_spin_end(spin);
> +			igt_spin_free(i915, spin);
> +			gem_quiescent_gpu(i915);
>   			if (flags & ONCE)
> -				flags &= ~WAITBOOST;
> +				flags &= ~FREQUENT_BOOST;
>   		} else  {
> -			while (gem_bo_busy(i915, obj.handle))
> -				usleep(0);
> +			igt_assert(gem_bo_busy(i915, spin->handle));
> +			igt_spin_end(spin);
> +			igt_spin_free(i915, spin);
> +			gem_quiescent_gpu(i915);
>   		}
>   		wait = igt_nsec_elapsed(&tv);
>   
> @@ -350,6 +377,7 @@ static void bg_load(int i915, uint32_t ctx_id, uint64_t engine_flags, unsigned i
>   		/* aim for ~1% busy */
>   		usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
>   	} while (!READ_ONCE(*ctl));
> +	put_ahnd(ahnd);
>   }
>   
>   static void kill_children(int sig)
> @@ -361,25 +389,29 @@ static void kill_children(int sig)
>   	signal(sig, old);
>   }
>   
> -static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
> +static void rc6_idle(const intel_ctx_t *ctx, uint64_t flags, unsigned int gt)
>   {
> -	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
> +	const int64_t duration_ns = 2 * SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
>   	const int tolerance = 20; /* Some RC6 is better than none! */
>   	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
> +	int num_gts = igt_sysfs_get_num_gt(i915);
>   	struct {
>   		const char *name;
>   		unsigned int flags;
>   		double power;
>   	} phases[] = {
> +		{ "once", FREQUENT_BOOST | ONCE },
>   		{ "normal", 0 },
> -		{ "boost", WAITBOOST },
> -		{ "once", WAITBOOST | ONCE },
> +		{ "boost", FREQUENT_BOOST }
>   	};
> +	int dirfd = igt_sysfs_gt_open(i915, gt);
>   	struct power_sample sample[2];
>   	unsigned long slept, cycles;
>   	unsigned long *done;
>   	uint64_t rc6, ts[2];
>   	struct igt_power gpu;
> +	int sysfs_dirfd;
> +	int gt_num;
>   	int fd;
>   
>   	fd = open_pmu(i915, __I915_PMU_RC6_RESIDENCY(gt));
> @@ -407,12 +439,25 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>   
>   	assert_within_epsilon_debug(rc6, ts[1] - ts[0], 5, drpc);
>   
> +	if (gt) {
> +		close(fd);
> +		close(dirfd);
> +		igt_power_close(&gpu);
> +		return;
> +	}
Why? Can't you just run the entire test for primary gt only?

> +
>   	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>   
> +	stash_min = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
> +	for_each_sysfs_gt_dirfd(i915, sysfs_dirfd, gt_num) {
> +		stash_min[gt_num] = get_freq(sysfs_dirfd, RPS_MIN_FREQ_MHZ);
> +		igt_pm_ignore_slpc_efficient_freq(i915, sysfs_dirfd, true);
> +	}

Why for all gts? you are skipping if gt >=1.

> +
>   	for (int p = 0; p < ARRAY_SIZE(phases); p++) {
>   		memset(done, 0, 2 * sizeof(*done));
>   		igt_fork(child, 1) /* Setup up a very light load */
> -			bg_load(i915, ctx_id, flags, phases[p].flags, done);
> +			bg_load(ctx, dirfd, flags, phases[p].flags, done, gt);
>   
>   		igt_power_get_energy(&gpu, &sample[0]);
>   		cycles = -READ_ONCE(done[1]);
> @@ -451,19 +496,21 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>   
>   	munmap(done, 4096);
>   	close(fd);
> +	close(dirfd);
> +	close(sysfs_dirfd);
This is not necessary. for_each_sysfs_gt_dirfd already closes it

>   
>   	igt_power_close(&gpu);
>   
> -	if (phases[1].power - phases[0].power > 10) {
> -		igt_assert_f(2 * phases[2].power - phases[0].power <= phases[1].power,
> +	if (phases[2].power - phases[1].power > 20 && !gem_has_lmem(i915)) {
> +		igt_assert_f(2 * phases[0].power - phases[1].power <= phases[2].power,
>   			     "Exceeded energy expectations for single busy wait load\n"
>   			     "Used %.1fmW, min %.1fmW, max %.1fmW, expected less than %.1fmW\n",
> -			     phases[2].power, phases[0].power, phases[1].power,
> -			     phases[0].power + (phases[1].power - phases[0].power) / 2);
> +			     phases[0].power, phases[1].power, phases[2].power,
> +			     phases[1].power + (phases[2].power - phases[1].power) / 2);
>   	}
>   }
>   
> -static void rc6_fence(int i915, unsigned int gt)
> +static void rc6_fence(unsigned int gt)
>   {
>   	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
>   	const int tolerance = 20; /* Some RC6 is better than none! */
> @@ -557,7 +604,7 @@ static void rc6_fence(int i915, unsigned int gt)
>   	close(fd);
>   }
>   
> -static unsigned int rc6_enabled_mask(int i915, int dirfd)
> +static unsigned int rc6_enabled_mask(int dirfd)
>   {
>   	igt_require(has_rc6_residency(dirfd, RC6_RESIDENCY_MS));
>   
> @@ -570,13 +617,14 @@ static unsigned int rc6_enabled_mask(int i915, int dirfd)
>   
>   igt_main
>   {
> -	int i915 = -1;
>   	unsigned int dirfd, gt;
>   	const intel_ctx_t *ctx;
>   
>   	/* Use drm_open_driver to verify device existence */
>   	igt_fixture {
>   		i915 = drm_open_driver(DRIVER_INTEL);
> +		intel_allocator_multiprocess_start();
> +		igt_install_exit_handler(restore_freq);
These are required only for rc6-idle? If yes, move it inside the igt_subtest

Same for intel_allocator_multiprocess_stop

Thanks
Riana


>   	}
>   
>   	igt_subtest_with_dynamic("rc6-idle") {
> @@ -590,20 +638,23 @@ igt_main
>   			for_each_ctx_engine(i915, ctx, e) {
>   				if (e->instance == 0) {
>   					igt_dynamic_f("gt%u-%s", gt, e->name)
> -						rc6_idle(i915, ctx->id, e->flags, gt);
> +						rc6_idle(ctx, e->flags, gt);
>   				}
>   			}
>   			intel_ctx_destroy(i915, ctx);
>   		}
>   	}
>   
> +	igt_fixture
> +		intel_allocator_multiprocess_stop();
> +
>   	igt_subtest_with_dynamic("rc6-fence") {
>   		igt_require_gem(i915);
>   		gem_quiescent_gpu(i915);
>   
>   		i915_for_each_gt(i915, dirfd, gt)
>   			igt_dynamic_f("gt%u", gt)
> -				rc6_fence(i915, gt);
> +				rc6_fence(gt);
>   	}
>   
>   	igt_subtest_group {
> @@ -621,7 +672,7 @@ igt_main
>   				igt_dynamic_f("gt%u", gt) {
>   					struct residencies res;
>   
> -					rc6_enabled = rc6_enabled_mask(i915, dirfd);
> +					rc6_enabled = rc6_enabled_mask(dirfd);
>   					igt_require(rc6_enabled & RC6_ENABLED);
>   
>   					measure_residencies(devid, dirfd, rc6_enabled, &res);
> @@ -635,7 +686,7 @@ igt_main
>   
>   			igt_require(IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid));
>   
> -			rc6_enabled = rc6_enabled_mask(i915, sysfs);
> +			rc6_enabled = rc6_enabled_mask(sysfs);
>   			igt_require(rc6_enabled & RC6_ENABLED);
>   
>   			measure_residencies(devid, sysfs, rc6_enabled, &res);

