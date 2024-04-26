Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A62AC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 13:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECA010F6BE;
	Fri, 26 Apr 2024 13:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DpmkKQKw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69ECF10F4C3
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 13:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714137817; x=1745673817;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0KkepwXG1+kVCWs6SqW+v1ARSO+3ZvPev4cNHgiwqI0=;
 b=DpmkKQKw7+SbX7Zg8or3cFZI6G5px/EZxYzq1bJW0HNWpPpbSwL9kzsc
 Y7XIKp5LiwQncePeczZl+IwVAQHj4ju2NCN2B8EAkjOigRo+A5xAIpiU9
 mpT1YL/uUbIII8Jb+bz+R5kVZTTmvGgQXx3A1U/lH3/yrFV/wT8K8ThdO
 AIhq8x0jIcLXQ2xc+7otpDTFSO0qrX89UVCXPaKQncEgXHTHXhWNo6+4e
 YaFotkk6I0aO3Eo3EEGG0u4CTDxurF8rdfxYDNEtPb+nXeOMn9FraiOwI
 NTGc/CezpHTNPwQMvAK/W5kdOBe9lrGgl42eWiLYmlLS5kVwQqF+G6zhZ w==;
X-CSE-ConnectionGUID: WjaOMXbmRoOw4+ZpTnZoAw==
X-CSE-MsgGUID: dJNq0cAYSWOKTX7wsS+a/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="13650204"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="13650204"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:23:37 -0700
X-CSE-ConnectionGUID: 70YjkepNRvSqv4pDG84eXg==
X-CSE-MsgGUID: kND86fcnQeiPq4MWh/E+ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="30222463"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 06:23:37 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 06:23:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 06:23:36 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 06:23:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4rFPs60Mtgb9KjCXohSNr+l/fXvAuAOxXQ3FWnaukU9pHK279Yu25yKhI6nUIROsc2KObXNAUNMOx8Fd1yZxqUfWsohLfxXsn9cLLAjpkxTlRm0kYQ7+IveZLy/ysOK9ViraCJVIqKUq3PiTOr8/i9KIYOUsNhJvwdJoiOZ7WftSu924N/2pUZ5u+yrGKWfWQqPGarmQeQAwBGYcZPXtGopvWqfEv37/ROkehAOUKFdrIn8Il07KzSpYuFlTwKDdDDDKpVPzjLQML4ihR6qxNvQT5I1XxIqylU/Y/MrP78rOXx5X5tdLQEmGrBqvpLYKpiyM1y1ZnA/UGxcHQuDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDI/F0OONL3qLuRXV82RffnmqQOTtrmhWOnfrKznhGQ=;
 b=Kgma4I86QoZEua0jwgDY/aDNJ06RRqIExl6zyATL/r6kH9NAmgqYzrGRqUMZfL+mBb7AMmyI3Rx/i7f7z0VETM+aU1WNgSyXzTy9aPsD1hlwae25IXZmT6iqqW/H/bwImHstOvY/DbnRHIIgXK3WoV1SYi1LenR9fGEFjn57jwEw+x2IOTTQ/Ln8EhphRFAivFCxUnLOX9Vgc/lMO73cuDyQWahAiuREnwOZxvegtj8t+67thkkwEjuEC8x/2HCTe1frlNKsAlX6yNIwyRvFiKzBnb2gwMd+CmCA0L/SOVW6UNAjEgmE0qgObulg+Yfj9qYSPzo4V6HBZbvy9lttkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Fri, 26 Apr
 2024 13:23:34 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%6]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 13:23:34 +0000
Message-ID: <edac1d70-1d22-488a-91b6-61f18822033f@intel.com>
Date: Fri, 26 Apr 2024 15:23:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 06/10] lib/rendercopy_gen9: Allow to use all
 tilings on flatccs platforms
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
 <20240426090117.78060-7-zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240426090117.78060-7-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0128.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::21) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|SJ0PR11MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: 382af154-2296-4993-6082-08dc65f412d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlV3K2VEM0cxcG4zTXJzYjQ5cElEbjkxaDlHVnY0aStoQmRpYkd0NEhac0hx?=
 =?utf-8?B?d0VMUStrUFRKYzFiWXdQQWh0ODVhTDlpRnFJYTB1V3JIdHFPZ1lMOEpWdTY4?=
 =?utf-8?B?ekRWbGs4aGk1aHlXSVdXRUZXTEdNcmZCRnlQSEhPK0ZiRFZKUG42cTdMdGs4?=
 =?utf-8?B?SjZEZGtTekhLVGFSUC9XQ0VZMTYzY1J1cHZyZ3M2cUpoZVh1QlNWQ3B3dzdT?=
 =?utf-8?B?SnU4Qk1ycVRLZUZPbXdVcXl5dUgrTzBId1Q4bDVzdFUwOWx5WEFMM3drWi8y?=
 =?utf-8?B?RUtmS0cvbE5XMHdvNndtTHp3Ukl1OStkRmdaZDNMcmhKWlpnVkFlajN6dE1s?=
 =?utf-8?B?THU4bi9KcVRrSzdiUTZGR0kwdVZnUWNSNy9qa0NFV0JYVEpqN21vQkZlZUhh?=
 =?utf-8?B?OUJvKzdISUZCR3ZBZSt0OWVlSjU4dnIwbWVHM0J5VFJvQitqaGQvcUtrU0pR?=
 =?utf-8?B?WHp2RURVaFRabE9Mb1ZrN29mNjJzMU5mS3RaL1BPem04K0NsVXhzT1JsMDhT?=
 =?utf-8?B?KzVUNVdYYkgySWg2bkIxQkFKZXAxN1orSWxqQ3JocmFmRDk2VHFiSU9SV09I?=
 =?utf-8?B?dkdKSGQ2d0ZmNUFPSFhjV2lxZTZaVmJLdVNYdGJUbVBGVkE5Wmh4L2hTak81?=
 =?utf-8?B?QTc4N1BwbkFaeU02eGZhOW5ueXBZWG01bkloUlA5SDhWZjUvWm9HQ1ZNaVhT?=
 =?utf-8?B?dXIydDE4aW5sTk1vd1JNaEljNGg5NHYrUHF2ZGdlR0hSOWNaUWkrekp2V2Vw?=
 =?utf-8?B?bHVRaTRHakUzWk1lUXJaWjcxYUVNK21RLzN3Z2VWYUdTNytMRlpZR21TNzNC?=
 =?utf-8?B?dDlRcVdFTy9ETmlqWXp1SWNlVTd2QVBPTi9aV2t4U1JDdG91cnI4OWxFL1Vj?=
 =?utf-8?B?MStCc2NDOEJPeEZOcXM5YkZGTVJvck1TQlh5dGlUSm5pK0I5SU5ja2cyTkhn?=
 =?utf-8?B?bFFQclV2UWpnMlBtTGE2NW9Dc1lsR1JtekpHTTRsWTFtTm9OeDdjSVpjaHB0?=
 =?utf-8?B?NTVoMUJzRS90VW4wVjVsY3NYa3prTVMzMTVDNVpSL1JWRXd6Zkp0MS9JNFl4?=
 =?utf-8?B?dXFzeVNzcWpkczEzYXlyN3FkUWo0OGtLd3JaOUQ0cXo5bFJCc2x0NEFsaDR4?=
 =?utf-8?B?aWkzaEQrMU94SittWEVxT2dCR3Vvb2FaLzdYUVVxMitqNlFxcWJRaVVtblpu?=
 =?utf-8?B?T3N1MnlwaCs5ZnBWdVoyYjlscHU4SmlwWStLTjlaeTJOUEhVS0ZSdGovdEhy?=
 =?utf-8?B?ZnVkSTBvUzhaQ1dqT2lHYmNzTlR6dlo2L1JNQklMbGtCZFdYdjV0VWwxUjVS?=
 =?utf-8?B?VXkzMCtURTZqQStQVElTMkVXTkFBejJlODFON1MrSTZXWnBxNUNvajV4OGNF?=
 =?utf-8?B?cDBqblFiZ3lOQ2tyWmUycEFuc2xRWCtDZWNJa0Fja0cxbXJBM2V6QXhMVnpJ?=
 =?utf-8?B?NmUrVVVNeDI3R2UyUzFKNkFwblY0Y09lQklWN2pNMFpLMC9lSW1CMEdYSjFK?=
 =?utf-8?B?eXhqMUw1d3BBR1lIby9IaUtVb2FyTXR2cVNHOUtyUXZjZXlFcVN0VVQ5U2gv?=
 =?utf-8?B?QmZkSWl2OUMxeFZoOEwyQ3Q5RURlKzQwL3ppWEs3amJEOGMwdm1UdUZUSUhJ?=
 =?utf-8?B?VGZsb2xMMGU2ekRwVTlva3VTK1p1R0t2ajVPbGVRL3VDYlYwaCs2dVNzc2xz?=
 =?utf-8?B?SmxxQmFHc1pBSVpZTngyRG9XWHNiSWhENTRqaXNwbG9kK0RWNkFqRlhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEUxSXJDazBLdzJ5U3dKVUplalU5ZzRZMHZkUjR6MEVvTUE3Nks2Mlc3dmVw?=
 =?utf-8?B?Ny9FQWxHKzZVK1hJcnZhaTk0dFZuVWVMc2tITUt2RitPOGpjeTBDeGdKVjZo?=
 =?utf-8?B?djlCTStzcEtBYWJGUTRqTEErT1NvTkFTUWo4R3lIbWFpRDdYUE5GK2s2NVVD?=
 =?utf-8?B?UXFiTXJiVUtXRGpPaVV4eTY3dDUybS84OGZ1SlZaZFBydWhvUUU2cVY3Qlho?=
 =?utf-8?B?WjlHbEtZdG9uK0hnU2NXb0x5K1g3M3BySVovNEFCWTFkc1A2czhoeHNiT2ZH?=
 =?utf-8?B?TytUUHBPYnJxakhvSGRwMlA2OHJpbDRqelg2aE1QR21adHZ1YVMvZ2p5ME8w?=
 =?utf-8?B?WWtDMnUvREVERXp2MmplanNURGE0NndBMHNHRFlnby9MME10YjNWanNqSnpk?=
 =?utf-8?B?TGo3eVFJYndFQ3hkbW1ZeWZKdllBUWlkang3QWN5aXdMTVB5WEZDZUFxT3h5?=
 =?utf-8?B?NnIxWFQzWTllU3ZIdmtSZmxEV2g2ay9zaFJrS01NTFVGNThxb3dscm5ORTBX?=
 =?utf-8?B?THdVOFp2RFZSQ244SThFbTkwTTUya0xOMTY4dkhVRE5qdWdxektlUjdyK2Ny?=
 =?utf-8?B?UHNKSlZKLzBiYWI3eW1lNkJWMnllelhCNWE4QW04bXFuU0JFYk9Jd1YxcjNQ?=
 =?utf-8?B?QkJtcTZET2Z6RnQvYUQyWll6cTNjSkdyWHJONVhZQVJGRmpINUFoUi9CNzlT?=
 =?utf-8?B?MGJNUmdSb3VMckN6b0w5WXZqbHlVYnNBZ25mKzdLd0RLYnVLYUN6anpKZmdo?=
 =?utf-8?B?YnRFSU5MTTFCRGZ5cStoS3ptOUJ2ZUN2YUp0U3ZGcXJqVnNESjQzbmtnS242?=
 =?utf-8?B?ZmxVQXUvQnNOUm5IcnpzaXIzYkoxTDQwdHZ2cmlYRU80emRDVVE4Q3B5QTcx?=
 =?utf-8?B?WmZKM0lwSFQ5YVJINEh0c2FpbHRTTG1FaW9USG1zRk1QK3A2NkVacjlPSkhP?=
 =?utf-8?B?YWIvTWR2MVRMcFdwenFjL0cxMzZCaWlFMmZOMW8wWEVxY1lXOENidDRsdzlm?=
 =?utf-8?B?VkxVdzhmc1BhSEg4YWNKUlljUVI2dWlDLzRKSUhkZDU0UVpMbGY5NFcyRVlL?=
 =?utf-8?B?NDFuK2VUQnRjcUQ3RWh4c3dSbkZMRUZ2Wno0S3Zyc1Y0NzZlbklMK1cyZG8y?=
 =?utf-8?B?QWxQSVFmZlIzMUpCNDczTmtza0ZJelRSRUhTSVRId1J0c1c0NFlJMk1kN3lE?=
 =?utf-8?B?RkhadDhqb2MrdVNZcVN1UUhiMFljMERzc0pSOFl0M3dDWjVKeENiUm9nRWJX?=
 =?utf-8?B?N1FSb2xpYnlXZi9Hbjc5d29yVm9EOWcrbUVaZ0xHTXQwc3dhTUZzdUZXS3VM?=
 =?utf-8?B?NlNOKzVNcXJpdndLcWtSVXhNaDNrL3lxbVNHVUR0b1lubEZ0ZGNabXlUNDJ0?=
 =?utf-8?B?bGN2Y3RoYUp2NVZyWHpSNE0vTWFQUDJta2ZiNkM0bnVvT0hBbDhLUG1MN2R2?=
 =?utf-8?B?a29UVFY4dUJkcHFsOWpWRXZsRTc5RDZuZ1RpY3RpZ0cvdEQ5cGw3RGpKQkFa?=
 =?utf-8?B?ak9DWUEzMUwvcUZrbC9QeWlzckN1RVBISjg5S0Q2MDQwUzJBeVA2NUFrUEg3?=
 =?utf-8?B?cG9HQUFMdkk4UVRtelducTVYMnJnOEpjMzd2L0x1aHBnNTV1SlVaNEljSERL?=
 =?utf-8?B?eEloQmlmcFl5Y2tzT3pXM2RmempzZFZURFZ6UmpjSEpjdVBiVWxRZzNlY0RK?=
 =?utf-8?B?UDZRS1FKb1p6aXVzakFHbHVPWFJxZmpPOUVZT2VwT0Y0RkpyR1ViOGd6RXFi?=
 =?utf-8?B?WTJhQy8zQ1Z1V0Jmb3Y3YURmK1RkRC91WHBSazViUTJ6MVhKTXVBaVR6QmZG?=
 =?utf-8?B?Y0loNmorb3B1TWZxb3MxdkgyLzZXcGQ1dWcydSt2VHhpYnc4L2JJbEViNVNH?=
 =?utf-8?B?ZGc3UUY3eDJIT3lCUy9DUGdheTIzQ0F3TUNJdjgwejZCa3U3YW9EV2p3Q296?=
 =?utf-8?B?VmtvUE9nUkJTSnBpSzlsSERYTnR0L2xkZXczSWlTaHJHdGNPRUtkQzhsMU1y?=
 =?utf-8?B?eko0dHdIVVZLN0lOczhMbC9qYURkU2UrdEV1Z3E0dUtKOFBTNTJSajlkalVF?=
 =?utf-8?B?aHovVTk3OWhyc01ZMkpMNFdDNjdLdDQrUU5XZ1JsVDROKy9wRldPWXgyd3Zr?=
 =?utf-8?B?N0VnNmVvVmoxaHQzVEhIeGFDcGdTVXFLV1phblN5MEo4cWRrOXRwQlNxb2Ey?=
 =?utf-8?B?bUxkekY5U20vcWJ4ZlpQcU96bFVESldhMGFqem9RL05QRXlEQW1EeGtTZWI1?=
 =?utf-8?B?TEhGanRQWWg4ODZtalN6cEltY21BPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 382af154-2296-4993-6082-08dc65f412d9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 13:23:34.4777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJ2qSNYGpr58loeLjkusuORXN8UuxM2R2o+x2d3C6foOsLEIGeFltdzCG313lm2zK8ra05nMu/nnjI/EHDVmLMor2OdZOpyJLllhmh0CBjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
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

On 26.04.2024 11:01, Zbigniew Kempczyński wrote:
> Instead of limiting compression to Tile4 lets enable it for any
> tiling when platform has flatccs area. For integrated leave Tile4
> condition to properly configure compression on those platforms.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> ---
>   lib/rendercopy_gen9.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 7c7563d50c..c73f815efc 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -268,7 +268,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>   			ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
>   		}
>   
> -		if (HAS_4TILE(ibb->devid)) {
> +		if (HAS_4TILE(ibb->devid) || HAS_FLATCCS(ibb->devid)) {
>   			ss->ss7.dg2.memory_compression_type = 0;
>   			ss->ss7.dg2.memory_compression_enable = 0;
>   			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
