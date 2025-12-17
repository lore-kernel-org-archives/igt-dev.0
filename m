Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2FAD64062
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 06:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE01210E287;
	Wed, 17 Dec 2025 06:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwM0EEIW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8101910E287
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 06:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765953271; x=1797489271;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LnYnkGXiqX5TTtYsOR2u3fUaTac4iwOARH6n38fmNoI=;
 b=mwM0EEIW55FGCoOUcVObjXx9Gc1WFfHrNML+ZeW5sMbQBhBXFMS8pdql
 6ABneYC2koBl7o1vlLU61AjC0MPs+i7vCdkXUm55FptwNa7mVKh0Ni/03
 vqlmm51KPTe/nO5rpoROfakpOT0d31z0UIjtmcFNnPJ6PJYSBq/gkpcW1
 hUeSmdiSrycl+Jc/GUu7Z1szJChVdbaC5HoyDl3PuPwnC3V5K2GxJ66zu
 TAZDvJ3O7I9zPW/ufaxjaaaRWOxACT0gwpIYlstECXosXz0dH2mJQaKHo
 PjTzU+LVQFvMpxNl2vDGtsyDY2j5I0jV3iNZkBFaLUu/9YyCckpjHbGcs Q==;
X-CSE-ConnectionGUID: 8O/R9nYDQnW78LXej86clQ==
X-CSE-MsgGUID: wWok/j44QF+rxYUp9g55dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67954716"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="67954716"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 22:34:31 -0800
X-CSE-ConnectionGUID: knzvlMOESaWO9VE4OH2rPw==
X-CSE-MsgGUID: GfJUcUJeSQC/cxCt3M2NBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="198224320"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 22:34:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 22:34:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 22:34:29 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 22:34:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmP/6foGiRqqEmFzNf0s+nUFQbxj0db3SfryGijL2KHSn30ZMU1GwQsz8/kvjVNB40bh2QUjzybqyBABKS8JgSMICN/7EpO62nI9yDvCgZSyB/xhhXHPEDe0aeEDFv/WOba+jE1KhoGrRKHpL1IUR8bN7wDoYMIy8PwcG8hd+Rt7j1zqPi83SJyDRAcpCTeRzwEfNhi4oJ5fnxDlu2PMIyXjhKnlXNxIKPORMKH5htXLYONBaVaCSwiTNL8dcSzrwk0Qg1fGH0CXdIyVUYCtgU2iZ18TOvfPmBSKOTrNHMcExvzduPacfnKC6BrQP1EQPUdTWITcj+gPBI7FDhwzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzk/brubhbAOJvyRioQ2YKaJU644AXkS9zz2Ocs07+o=;
 b=FzM1OJ3JqJt24hPkywF94nub9C1B6ubpB4KzuZ0rPbgZTwv0uyrlxD2z1XGg5PGEXFeD3hDSVIjbM1mgcOdEmO9njkNaG2Fy1bn+i4UcPFPZYakyryFaQC/VtJg8CrzKBupfSBjXgO3BfBLo1n1ziHTFtVYcJnyyDN8uEDaK+KRpwIzFQ7s7BbXgs2UJy5GWBYHeSxdfjG6Xi9WPuCFdzQ1riw8+z1AqgQsqdHg4WszGh8+Y4AdODDml1ZQcBL3v/wKOQDnKq27rRKP9ZZMmZqf8h6a0M/0KK8QxV7nm53YTNeWaGXi3Et9QrNY3qGm7aDRsGjs5EZlUFMe+ksw8og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DM3PR11MB8716.namprd11.prod.outlook.com (2603:10b6:0:43::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 06:34:27 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 06:34:21 +0000
Message-ID: <642c3e47-5a73-4bca-8d52-ad7f2d625cb7@intel.com>
Date: Wed, 17 Dec 2025 12:04:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 2/2] tests/intel/xe_pm_residency: Add subtest for
 ASPM Link state residency
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20251216080951.199893-1-karthik.poosa@intel.com>
 <20251216080951.199893-3-karthik.poosa@intel.com>
 <b49b01e7-935c-402e-93c9-eaf1f4ecaca6@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <b49b01e7-935c-402e-93c9-eaf1f4ecaca6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::16) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DM3PR11MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a66fd6-27f1-47eb-63c7-08de3d364fab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGVYMm5ZNnExaFgwUEZ0ZGFqOHJnQTJHL2RTb0twdGNQWjc4TEJHYm5NNk5N?=
 =?utf-8?B?aGVGdVdoTU42TTVPTEVwMGZ3dU5ucnVOU0hsSXowYmtYNjdvbzN1dFlKQ1VL?=
 =?utf-8?B?OGNtTit0Um5WTTQwbFE2NndSTUthMm5HbTBUbmtKclJidkNNOUVMazV2OVYy?=
 =?utf-8?B?M3Q3ZWsyZjZobFpRcFRmS0N6YlZkZkdBVVdjMXptaGM0QXpnRWNsc2RpZk9W?=
 =?utf-8?B?OTNEMVhFL3JWT1dma3Q2Y0xCUGtwTzlDMGN2encyaUxYMy9UZlF3ak82RUhQ?=
 =?utf-8?B?TEgzTFhwNWJQOXJvWU5QRjBHUjJJdFloemdDMXYyNzUxQlltc0lONTl5bVMy?=
 =?utf-8?B?YTlOSDZOVGpBYy92TGNJZDFWbjJMdUQ0WnNDb2hjMDRSV0QyQStXZU0vWjJH?=
 =?utf-8?B?RGFJU01IUkg1blFYRU12RFZTV2JlM3ZSbDBkRGZyZnIwM3g3RTJEd3h4NGRR?=
 =?utf-8?B?a2todUtNYnpCRG5EY3JjYW13bVkvdXFiR01wT3JlLzZVbllDM0tEeVZObW1P?=
 =?utf-8?B?Q1RiQ1Jsa00wZFB2bGE3Y25oNmZUWGx4WnFZNzVPdzkwRWhVM3RBYVQ3N29V?=
 =?utf-8?B?S21QQXJRbW9GUWJsTkpKd0tnYzNVWExGblZpck1zQnY3THlpZGUwTkhlc0dW?=
 =?utf-8?B?dFlRazJwRDlaaGpTVVArR0owbzkyMEI3Z3QxQkc1UFFKVUFCTVFFS0hJa05Q?=
 =?utf-8?B?dzhwRjFkYnR6QmU1SWl2OG1ueVdMYzgrRDN5V2ZmcXVyd0tDdG0wazJJUTFK?=
 =?utf-8?B?MFpBT1VvMSttakJwU1I5UkZUL0VyMTJFeXM1bEhQa3hPS1k5WTFmVjc4TGhG?=
 =?utf-8?B?TkNQeG1RTTJGVHlVU2VWNGN1dnJYM1hpbEdsTTk0UHF3VDhOVVNFK29NVWRW?=
 =?utf-8?B?UHVEZ1ZqZ3lSS2RuOVZoRytYNGx4dlhoZFJuU052OWxqTWZ0VW9RZTZoNGNh?=
 =?utf-8?B?VFJ1cjNYbk8zL1U0TEM3N3A1SzNQNzNFVXJydjFLT205SEcxd1NwVkppN1Rs?=
 =?utf-8?B?clRVZG1zcVRGYUtDRDVVb2hScVRWNjVRMi9jdWJ4RWVodGwvNnhYY25LZWVK?=
 =?utf-8?B?Rno3ZGo4YU9hWGJYam81RnZ1L2Vpa01SVzZLSXJTVjltRkpEZ09Sanl3dFdk?=
 =?utf-8?B?cldyOGRqT3JrcmxGZjQ4bWZEc2NXYlpxQ3FlNXNtQ0R1akRDQXlyT2txeFZ2?=
 =?utf-8?B?TWlrYm5SSDlyOG5ONTBXYXV0M0QvMFRzMVJjcmJ3WXc0UGs3WXgrc2V2Nkpa?=
 =?utf-8?B?dUQ3c1ZSWFluTXAxY05RMTBPWE9yRmZvMmVidlo2eWJoV2hQNVVpclViYndR?=
 =?utf-8?B?QlU4cWFXVjRVU0NMcFRNM2FicDY4eHZpam5RQWFKN2hxTFRxSGZWYjlBQXBG?=
 =?utf-8?B?UTdTNTVnSEhUUjdTSmhucmRzMmF6WEU5cVAwa3VYSHRScXVvWUVuS1JnYmt6?=
 =?utf-8?B?TUZWSlBiK0lOeFVPbTJEbGM1bXlmZlhXa0syRHE4Qmk5MUpsZWpMTkh6Y0x4?=
 =?utf-8?B?WFFhNXR2L3g1WGZDYkdJejc4U0czMWVkc0dLT2E5V0FsZFBIMSt3ekJOOEZs?=
 =?utf-8?B?TWRhQi8vU0ViRktZcWNJTnoweUhBWkdjRGtDdkxuM0pxekFjL0xMV0MzVWRD?=
 =?utf-8?B?emY0SDdrcFF2V3hzb1p0bnpvQ015TG5FRjJ6azdSVjJFOUZkU01GTlh0VXpu?=
 =?utf-8?B?dEdQN1VqWEEwU0djMFB2VlRnUElxN1JNUUg5VHYvVHpoblFoc0J1M3hjWkcz?=
 =?utf-8?B?Um1zbHl5YitqU2kzNW92V3dXY0YvcW1MY09neU85TTEwSW13aTBIOXVvQm11?=
 =?utf-8?B?d01nVzNpQzJXeEZzRzVsTW8wL2hPdVVIaUIzNGZ5RzgveXpnQllSWkhHYStL?=
 =?utf-8?B?ZVMvZ29ua0FhdEQ3R1lSL0JFNXpQUjV6dE9MMzF1bmVjUHpPeVFNTzRvYXM2?=
 =?utf-8?Q?Og3c4GQClhJyDO1Nnzi27bWnAeFnfwXp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVhwa1ZrVXdTNnkyOElTM3hiRTY4Q1Y1V2FxUkM0MEhjK0pNcDRtWitPQyt5?=
 =?utf-8?B?M3BQTU90VWZobGJIWS9ydENiTzA4dmF0bmRMUFY4UnBpckRVWWRIaDFTN092?=
 =?utf-8?B?a010R3dQQmU4YW5uSEo5bmoxSklXSEFZY0E5a3Ztazk0Y2JOQlFtNU96Vm9j?=
 =?utf-8?B?bjJQNlhRWldqYm42OEl6Q2JoZVpuQjhoemExRm9ocHlXSHR2OVd4cVN6ajFq?=
 =?utf-8?B?OHdjMzJrdDlrQ1k4NTM3blVqU29EODZ0MTVYNWNKNVYxVTZOTUd4cmpoTC9D?=
 =?utf-8?B?RnhwOUtvQjFjeUN6MWloSksydGsvVVBTVzMyRVBtZisrKzNWRWlmb3hicFox?=
 =?utf-8?B?R3pOcVRLUDc3WTdDditMdjRvZXc5UUdKcW0ramNCcENuMXZ6VFBHVHZjc1VY?=
 =?utf-8?B?N2Uza1JHRGZVVjRGZ3pHODI3MTMrTFlrK1RlM0pSYTdqTC9rNFNibWorU3ox?=
 =?utf-8?B?YjRJbXhWVnZZcHpsU0NvUnlsRCsrYjNneVNQS3d5dHRiOFRFVCs2ckFkaVk0?=
 =?utf-8?B?OU1SV3lQNzdZOVFvbmdDL2xDSWZwYm5mNlZtSTV0SlF0M2JKSStnSUNyRHB3?=
 =?utf-8?B?MytERFpwS3RJNGlwS2l3TXVybWh2OCtIY3gvNmRIc2FEMG10Q0o2SDIvQlpv?=
 =?utf-8?B?TU15UC9abFc2UjZsNTRVVTdQd2VZVFc2aE5haTF0VHdMcmRwNGNJSC9pOVNr?=
 =?utf-8?B?WG5XNFY0V2E3UC9IT21qRk9mYlY3NE44Wk94cjJ6N0dienpPbG1vM2Vrd0t0?=
 =?utf-8?B?QkZ5T0pZTHpqTnRoVUpNSGwwRnhXY2MvaVhhZ3ArbWI1SncwMnJvN1kyM3Fp?=
 =?utf-8?B?NVRCRVY5MUVUV2RDV2NSMXBQa0YzbjlNdmVEL3l2dXNjN1VIcm4zMzlYMWVw?=
 =?utf-8?B?K093OTdid283OGRIRTFGS3N4bFEzcm9Scm1QQUQ4M0RYTm13T0RsSlN2V0sw?=
 =?utf-8?B?amF0d0Y3SXVaNWoxTGZsWXVsT0ltRExDRUN3R0lYN0ZxUWw5dC9rckZZU21N?=
 =?utf-8?B?NTBHbmVIQ3RWTlZnNlBNRUI4UXNhZFdTaXF4RW8wektJL05yUkJCOGpTanM0?=
 =?utf-8?B?anFOSitKMFV4d0NpNzlMVlhPN2hzcTlVaWphUE9GbEplbEZqTko2TTJwQ1Z2?=
 =?utf-8?B?SUxuUklibWswYnRvbkZnQkFyS2llZlFubGUrQi9PVnJ5MTdveUZvaHk0aURq?=
 =?utf-8?B?QmJCMm1qZVlwKytEY0Fid01lLzJTQ0pMbUVxZUxQUEJBczRtMkh0VzRKSTMz?=
 =?utf-8?B?bWs3b2VCVGZjRnJRS2pwc3FWTW5HM01hbjB3dWZKRDZuU0tOT3dSU3NpL2po?=
 =?utf-8?B?OGt5dWVOUE9oNmJteW1PVFFLWUN3b2FtME1zVmpuKzdLOWlyWk90M0Z3U1Fs?=
 =?utf-8?B?NThlMlV1TWFrbFhMbnd4NDdoSXJJR01iRkd5NUE2YXE2cGhlbjZVNFVHcW9B?=
 =?utf-8?B?allJTGZxdFo0TXkyci83Z0U4NVZVZGRZR2R5UXdjOHpuR2pOMVBpMTZKUDl6?=
 =?utf-8?B?anZrY2RXNml3ei9MUlhVMU9xUmVkWHl1QkxkdmtYQ2VmVExwMXdxcEdaMWll?=
 =?utf-8?B?cFJEcVVDNlNERXo3WnRYc3pjYjZYeG9EdzZONCtOK1d5bkhBSWIvQ0x4WGVi?=
 =?utf-8?B?d2JyUTJIZm83UzFtVXArbjZWVXhmMWdENWhVd3dxTFpXRVloN3hwMnFJTEFG?=
 =?utf-8?B?NmpVMHZQWndITHVkV1RiVmxXamh5ZGVRc1ZSQWZpRmI3M3JJZjR3amNOOVNl?=
 =?utf-8?B?WFpPOUVCYTJsWUxDa05DK243bGJyc1dZTDZvNUdSc3R6bGdMYlFVZ2dQcVI0?=
 =?utf-8?B?L3l0MXdINmU0TWs5Zm1Wb2xOR2tCL25RVlhObnZoT2JJampqeGdsYjhlY2Fx?=
 =?utf-8?B?QzFaaE9mbXpxVGJlOGdHU0c0WnhHMWpReXFVS2h3aCtiSEJhU1YrdmV0dnAw?=
 =?utf-8?B?UEtWYmJXUDl2N1d5N0ZMTnVwZWUzT0Z4RjhiMkowcCtMVnZsemRzRTBjdU1Q?=
 =?utf-8?B?elZlemdnM1VCU29jS3ZFd3BBQTVOWDd1a0VpTHhjWWF0TUZTUTl3VDlvei9H?=
 =?utf-8?B?TlRyY0lSQStLVnB3MDZsT1BIMk5SdXRxQlU4UU54Q1dnOWl5ZXMxNWhlMk9u?=
 =?utf-8?Q?9Q5Jhu8iMWo3PyYEh9EL6w/WT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a66fd6-27f1-47eb-63c7-08de3d364fab
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 06:34:21.3237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvjE5OyRGPLKufkBulHXQWNCpFQLJhl2pwD9IAnKSVFn0/JCf33iH5Bidm+GPb2BqnyrjQSdlheP08yISmEB/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8716
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


On 16-12-2025 19:48, Riana Tauro wrote:
> Hi Karthik
>
> On 12/16/2025 1:39 PM, Karthik Poosa wrote:
>> Add subtest aspm_link_residency to verify PCIe ASPM.
>> Active State Power Management (ASPM) is a power management mechanism
>> for PCI Express (PCIe) devices that aims to save power while the devices
>> are in a fully active state.
>> This test uses link state counters from debugfs - 
>> dgfx_pcie_link_residencies
>> to verify this.
>>
>> v2:
>>   - Add dedicated function to get pcie endpoint upstream port. (Badal)
>>   - Read residency counter as unsigned long long int instead of
>>     unsigned long int.
>>   - Print residency counter before sleep also.
>>   - Don't assert if sysfs not corresponding to aspm_link_state
>>     is not present. (Badal)
>>   - Run workload before validation of aspm link residency. (Anshuman)
>>
>> v3:
>>   - Move igt_device_get_pci_usp to separate patch. (Kamil)
>>   - Move reading of residency to separate function. (Badal)
>>
>> v4:
>>   - Add description about PCIe ASPM in commit message and code. (Kamil)
>>   - Add a NULL check for the return value of igt_device_get_pci_usp().
>>   - Resolve compilation warnings about using variable as format string
>>     to sscanf.
>>
>> v5:
>>   - Use igt_device_get_pci_upstream_port() which is the renamed version
>>     of igt_device_get_pci_usp().
>>
>> v6:
>>   - Refactor and enhance readability. (Badal)
>>   - Move save and restore of link states to separate functions. (Badal)
>>
>> v7:
>>   - Skip aspm_link_residency on integrated platforms as it not 
>> supported.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   tests/intel/xe_pm_residency.c | 179 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 179 insertions(+)
>>   mode change 100644 => 100755 tests/intel/xe_pm_residency.c
>>
>> diff --git a/tests/intel/xe_pm_residency.c 
>> b/tests/intel/xe_pm_residency.c
>> old mode 100644
>> new mode 100755
>> index d33a87b13..04e560f9b
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -37,6 +37,27 @@ enum test_type {
>>       TEST_IDLE,
>>   };
>>   +enum link_state_index {
>> +    LINK_STATE_ASPM,
>> +    LINK_STATE_ASPM_L1_1,
>> +    LINK_STATE_ASPM_L1_2,
>> +    LINK_STATE_PCIPM_L1_1,
>> +    LINK_STATE_PCIPM_L1_2,
>> +    MAX_LINK_STATES,
>> +};
>> +
>> +struct link_state_info {
>> +    const char *filename;
>> +    char state;
>> +    const char *parse_str;
>> +} link_state_sysfs [] = {
>
> Remove space before [
ok
>
>> +    { "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
>> +    { "l1_1_aspm", 0, "NULL"},
>> +    { "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
>> +    { "l1_1_pcipm", 0, NULL},
>> +    { "l1_2_pcipm", 0, NULL},
>> +};
>
> What will be the value of state here?
it will be 0, we shall overwrite this in save_and_disable_link_states() 
and read in restore_link_states()
>
>> +
>>   /**
>>    * SUBTEST: gt-c6-on-idle
>>    * Description: Validate GT C6 state on idle
>> @@ -64,6 +85,10 @@ enum test_type {
>>    * SUBTEST: cpg-gt-toggle
>>    * Description: Toggle GT coarse power gating states by 
>> acquiring/releasing
>>    *        forcewake.
>> + *
>> + * SUBTEST: aspm_link_residency
>> + * Description: Check for PCIe ASPM (Active State Power Management) 
>> link states
>> + * entry while device is in D0.
>>    */
>>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>>   @@ -255,6 +280,24 @@ static void idle_residency_on_exec(int fd, 
>> struct drm_xe_engine_class_instance *
>>       munmap(done, 4096);
>>   }
>>   +static void do_exec(int fd, struct drm_xe_engine_class_instance *hwe)
>> +{
>> +    unsigned long *done;
>> +
>> +    igt_info("Running on %s:%d\n",
>> +         xe_engine_class_string(hwe->engine_class), 
>> hwe->engine_instance);
>> +    done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>> +    igt_assert(done != MAP_FAILED);
>> +    memset(done, 0, 4096);
>> +
>> +    igt_fork(child, 1)
>> +        exec_load(fd, hwe, done);
>> +
>> +    *done = 1;
>> +    igt_waitchildren();
>> +    munmap(done, 4096);
>> +}
>
> Can't we just run a spinner. Is this necessary?

I've reused code from idle_residency_on_exec() where this is being done.

Will have to check if it is really required.

>
>> +
>>   static void measure_power(struct igt_power *gpu, double *power)
>>   {
>>       struct power_sample power_sample[2];
>> @@ -370,6 +413,127 @@ static void cpg_gt_toggle(int fd)
>>           powergate_status(fd, gt, "down");
>>   }
>>   +static uint64_t get_link_state_residency(int fd_xe, const char 
>> *parse_str)
>> +{
>> +    int fd_debugfs_dir = 0;
>> +    int ret = 0;
>> +    char *ptr = NULL;
>> +    char path[256] = {0}, buf[1024] = {0};
>> +    uint64_t residency = 0;
>> +
>> +    fd_debugfs_dir = igt_debugfs_dir(fd_xe);
>> +    igt_assert(fd_debugfs_dir >= 0);
>> +
>> +    ret = igt_debugfs_simple_read(fd_debugfs_dir, 
>> "dgfx_pcie_link_residencies" , buf, sizeof(buf));
>
> Extra space
> Keep the maximum length to 100 lines throught the file
okay
>
>> +    igt_assert_f(ret >= 0, "cannot read link residency file\n");
>> +    ptr = strstr(buf, parse_str);
>> +    igt_assert_f((ptr != NULL), "cannot find residency string %s\n", 
>> parse_str);
>> +    if (ptr != NULL) {
>
> if you are asserting why check again?
not needed, this can be removed
>
>> +        sprintf(path, "%s%%llu", parse_str);
>> +        igt_debug("searching for-%s\n", parse_str);
>
> Why do we need these debug messages ?
this can be removed
>> +        sscanf(ptr + strlen(parse_str), "%lu", &residency);
>> +        igt_info("Link residency %"PRIu64"\n", residency);
>> +    }
>> +    close(fd_debugfs_dir);
>> +    return residency;
>> +}
>> +
>> +static void save_and_disable_link_states(int fd_pci_usp)
>> +{
>> +    int i = 0;
>> +    int ret = 0;
>> +    char path[256] = {0};
>> +
>> +    for (i = 0 ; i < MAX_LINK_STATES ; i++) {
>> +        sprintf(path, "%s", link_state_sysfs[i].filename);
>> +        if (faccessat(fd_pci_usp, path, R_OK, 0)) {
>
> Use existing sysfs functions
will replace with igt_sysfs_has_attr in next revision
>
>> +            igt_debug("%s not present to save\n", path);
>
> unnecessary
will remove this
>> +            continue;
>> +        }
>> +        ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", 
>> &link_state_sysfs[i].state);
>> +        igt_assert_lt(0, ret);
>> +        igt_debug("saved %s = %c\n", link_state_sysfs[i].filename , 
>> link_state_sysfs[i].state);
>
> extra space
>
>> +
>> +        ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
>> +        igt_assert_lt(0, ret);
>> +    }
>> +}
>> +
>> +static void restore_link_states(int fd_pci_usp)
>> +{
>> +    int i = 0;
>> +    int ret = 0;
>> +    char path[256] = {0};
>> +
>> +    /* Restore saved states of L1 sysfs entries. */
>> +    for (i = 0 ; i < MAX_LINK_STATES ; i++) {
>> +        sprintf(path, "%s", link_state_sysfs[i].filename);
>> +        if (faccessat(fd_pci_usp, path, R_OK, 0)) {
>> +            igt_debug("%s not present to restore\n", path);
>> +            continue;
>> +        }
>> +        ret = igt_sysfs_printf(fd_pci_usp, path, "%c", 
>> link_state_sysfs[i].state);
>
> extra space
>
>> +        igt_assert_lt(0, ret);
>> +        igt_debug("restored %s to %c\n", 
>> link_state_sysfs[i].filename , link_state_sysfs[i].state);
>
> extra space
>
>> +    }
>> +}
>> +
>> +static void test_aspm_link_residency(int fd_xe, uint8_t 
>> aspm_link_state)
>
> use the enum
okay
>
>> +{
>> +    struct pci_device *pci_dev;
>> +    int fd_pci_usp = 0;
>> +    char name[PATH_MAX];
>> +    int ret = 0;
>> +    char path[256] = {0};
>> +    uint64_t residency_pre = 0, residency_post = 0;
>> +
>> +    igt_assert(aspm_link_state <= LINK_STATE_ASPM_L1_2);
>> +
>> +    /* Get upstream port pci_dev */
>> +    pci_dev = igt_device_get_pci_upstream_port(fd_xe);
>> +    igt_assert_f(pci_dev != NULL, "Couldn't get pci device of 
>> upstream port\n");
>> +    igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n", 
>> pci_dev->domain,
>> +          pci_dev->bus, pci_dev->dev, pci_dev->func);
> This will be helpful in case of failures in CI, without having local runs.
>> +
>> +    snprintf(name, sizeof(name), 
>> "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
>> +         pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>
> use igt_device_get_pci_slot_name
that doesn't prepend the name with /sys/bus/pci/devices
>
>> +    fd_pci_usp = open(name, O_DIRECTORY);
>> +    igt_assert_f((fd_pci_usp >= 0), "Can't open link directory 
>> upstream port %s, ret %d\n", name, fd_pci_usp);
>> +
>> +    /* Disable runtime PM as link ASPM entry happens during device 
>> is in D0 only. */
>> +    igt_assert(igt_setup_runtime_pm(fd_xe));
>> +    igt_disable_runtime_pm();
>> +
>> +    /* Check if ASPM sysfs is present. */
>> +    sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
>> +    igt_require_f(!faccessat(fd_pci_usp, path, R_OK, 0), "%s is not 
>> present\n", path);
>
> Use igt_sysfs_has_attr
ok
>
>> +    ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", 
>> &link_state_sysfs[aspm_link_state].state);
>> +    igt_assert_f((ret > 0), "couldn't read residency for %s", path);
>
> Start with Caps
ok
>
>> +
>> +    /* Save current state of all available link sysfs entries and 
>> disable all link states. */
>> +    save_and_disable_link_states(fd_pci_usp);
>> +
>> +    /* Enable only the ASPM link state needed for test. */
>> +    igt_debug("Enabling %s\n", 
>> link_state_sysfs[aspm_link_state].filename);
>> +    sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
>> +    ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '1');
>> +
>> +    /* Read link state residencies before and after idle wait time. */
>> +    residency_pre = get_link_state_residency(fd_xe, 
>> link_state_sysfs[aspm_link_state].parse_str);
>
> Wrap at 100 lines
>
>> +    igt_info("Waiting for link to enter idle....\n");
>> +    sleep(5);
>> +    residency_post = get_link_state_residency(fd_xe, 
>> link_state_sysfs[aspm_link_state].parse_str);
>
> Wrap at 100 lines
>
> Thanks
> Riana
>
>> +
>> +    /* Restore saved link states. */
>> +    restore_link_states(fd_pci_usp);
>> +
>> +    igt_restore_runtime_pm();
>> +    close(fd_pci_usp);
>> +    close(fd_xe);
>> +
>> +    igt_assert_f(residency_post > residency_pre, "ASPM entry failed, 
>> pre %"PRIu64", post %"PRIu64"\n",
>> +             residency_pre, residency_post);
>> +}
>>   int igt_main()
>>   {
>>       uint32_t d3cold_allowed;
>> @@ -444,6 +608,21 @@ int igt_main()
>>           cpg_gt_toggle(fd);
>>       }
>>   +    igt_describe("ASPM Link residency validation");
>> +    igt_subtest_with_dynamic("aspm_link_residency") {
>> +        igt_require(xe_has_vram(fd));
>> +        xe_for_each_gt(fd, gt) {
>> +            xe_for_each_engine(fd, hwe) {
>> +                if (gt == hwe->gt_id && !hwe->engine_instance) {
>> +                    igt_dynamic_f("gt%u-engine-%s", gt,
>> + xe_engine_class_string(hwe->engine_class))
>> +                        do_exec(fd, hwe);
>> +                }
>> +            }
>> +        }
>> +        test_aspm_link_residency(fd, LINK_STATE_ASPM);
>> +    }
>> +
>>       igt_fixture() {
>>           close(fd);
>>       }
>
