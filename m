Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A298CDC167
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 11:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76AF10E0AE;
	Tue,  6 Jan 2026 11:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLwyLWE8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B2710E0AE
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 11:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767700486; x=1799236486;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XVpR0bUfwyBvEv77GZZs7IVWA8jL7M2T6LDHT0b2E1g=;
 b=QLwyLWE8imSqCdH0EKciD0yRE0RxAXLMaYv2MtBFKCzMutvz5mMaNgPZ
 vPj+uFNw/LQaEuFwC49lAEEacJS5SXhSwrLFGdsWfiw61NVNhbvyMvZ6N
 jKHjo8dsr5mhPhHK3FUvwW2l2fF5cDaJJWopZDyYA4u/PqSGXiJGld4PG
 EQ+tmL5gfib1Qj/TK2TsSzWzYCnnY+EyAyFYGihCASDADyjCICAa4XLas
 uaic7cXU5ulyqT85x4ctMf00qTT06liqx1ZcvPmKs+GHhdbGhz/mk7QJD
 CJyCgXC2DQwFsQBVwAZ09MtnfeQEwP0UbniE2zCym4GQXoYRQMpeRD/3A A==;
X-CSE-ConnectionGUID: yBiC0ClnSu252UNwtXh1ZA==
X-CSE-MsgGUID: XA5fsXGDTPudYqLmpnvc+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69225877"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69225877"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:54:46 -0800
X-CSE-ConnectionGUID: XoEZnbLTRZaWXWwae0AkwA==
X-CSE-MsgGUID: qa0VlWthTzKyMnvBEuhvkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207677862"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:54:47 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:54:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 03:54:45 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:54:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Av9xFB6XWt9ryBWPScTlSgXOqtNFuLu742go0r742+0YUEWtsf8mhUPuEiDSMmFbkHQ2IOMjVA35zSYnEPwrRVpTTykxq/hOID5thycHASXaMvYDvO/wrj1k3xW/JSnufa1AJAe31E2rtDMjzKVI4aAfPDec0qj43qVmoksjPI/rTWlE4Kf6M4T7zHFXqLxMCcQCHZfUxVjnQtsBLenKG/2PGX1QZYoF4ZvSP4NRumAHMCtPvPREI1mXA9Vjv9iIMHsNwbkucF5RgyrETMQrPfkzpumTcVI5rbfXVL/ed2KnJZHzIG7WAcpWY2+QQdUXhLA1Pqe66LbSMKSFD3Yudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pxm/WvbNd+1tBgj9wGYJhlVLNTbus+YWCbH7VC0PfF0=;
 b=kZCCJ7OYIGNvQcyiXj3nI9OjXWEG8whZaWaAcvHaS/2XQxEML83SvQEFu5HGNoKAd9A04lRJOAwbqjdoU080dRSzCaaKJ1ld+NbCXl3M6DDAyJX/Ab3G1ZeVXa6TXfvXzrzmsgIq9Oms7PE5pQ5ETezWFItHqHIeQRZMQGdFed1Rb06erHZeKxymSTotaDl2hLg4pyRGrrpVa+mi3cX5F4caKAJ51UuKG4K9fkeIb3fqSkLMXtpPyox1eaf87UF+28gwARYxRr5hbYtqdLOVP0EGU6l/MTklxpCbiJxkXUeN+sLXpDpvCx9R1im+kyNQubRmZGHRaKztynwAa823Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by DM4PR11MB7352.namprd11.prod.outlook.com (2603:10b6:8:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 11:54:39 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::13d7:d295:64e0:273c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::13d7:d295:64e0:273c%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 11:54:39 +0000
Message-ID: <9537e13f-65b0-4fa4-849e-883145abe769@intel.com>
Date: Tue, 6 Jan 2026 17:24:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_pipe_crc_basic: add mst suspend-resume
 test
Content-Language: en-GB
To: <igt-dev@lists.freedesktop.org>, <kunal1.joshi@intel.com>
References: <20251126092412.739982-1-kunal1.joshi@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20251126092412.739982-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::6) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|DM4PR11MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: cf85de38-2a68-4a2a-efb6-08de4d1a5f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGh1VGtzL2p5aWU1cllXeWZhRnltS2IzeGxoTW81UE1IVkpnUVRldGxUbkly?=
 =?utf-8?B?dllvRS9vSEU4S1oraG56amRwN3BLTlFJWFhjZThQeVBha1FGVW9TRElwZXlY?=
 =?utf-8?B?UmpIbEg4aDVLWXY0dlRlbk5IeU50ekdHWGZwMnZZdngrUTg0NlZ2UmJ1bEZQ?=
 =?utf-8?B?Vm5EU0JTdjA2eFpkZHMwaVZKNGdRRTh3M1Yvei9nME5VK2I4K2dHcmFDWkc0?=
 =?utf-8?B?KzZyWXk0RmZaTXo3eTcxVHJ4OUwxdm1DQTVsNC8rM21MWnpTRHgxbk9IYUhq?=
 =?utf-8?B?Nno0ZXQwdm1OUHpRTnYvYVFoZTZTZU9vNXFmQ2piZWFVZExVTzBRa1cxYnhO?=
 =?utf-8?B?NlNMeVZoU3lvODBycnVERy9NYy9LZU1ORXJFNExMakJHVUF6dTd3WElrRWQr?=
 =?utf-8?B?QWUwMHdQRjluL3g4bUtTY2Y1dktvNEMyaU05U1hueGVNTGpvRFpUaUM0QlFN?=
 =?utf-8?B?TXhlT2xYZFE1Z0JSbmhscSt5bEdqOTN1Ukx3ZXF0WVdORUFFUnBLRWswcmV4?=
 =?utf-8?B?c1N3SDZoRVNkaWUxRWRsK2ExMnRFSzllbGgxUzRkT0sxbmNVV2FSK1VIc2lU?=
 =?utf-8?B?dEpNVHZDaTB0bkNLV1VlL1dxMmxJV0lkYXJVSzUzL1gxb1dLN0hneTdTMzhH?=
 =?utf-8?B?UU9RV2d6SDdjSVRGTmw5K2xaMkV1aW13cVpHWlhkNHFZNWpQRmtVY0hKUHJt?=
 =?utf-8?B?ZXdqTUJaOGVZSzRFekJuanFTMFQvU240UnJTenVVNWU4bmlwVDlJTkRmMWFa?=
 =?utf-8?B?aWJoRml3UVNKaS8wcDJmSjQvamNaZkRINUJQcnZFdlRJcEJxT0tza0ZDUmxO?=
 =?utf-8?B?S01kZ2xtU3NOYjkvTjRZQ3RIMXc5ZzZDZDFHRUxacHJValZmVUw3bllXcUwv?=
 =?utf-8?B?cExIRTNrMmJmUmloNXpKeVFYUGhqWFpHZVdMWnkxc2Yxcy84bnhKdzVlOFE2?=
 =?utf-8?B?bjY4dnRESjFrWmY1MStOSGc0eDdUMUxWRmFFd3dncEU2dk8xeWZ1cjUxY0pT?=
 =?utf-8?B?ME9kait2M0NlVXNpWDlGZDA1RXArS0NYVURka0s3N3FsSk5mZURFb083U3Ex?=
 =?utf-8?B?WS9NVEE5Y1lKcWlYZ0pDMVlZWWRUQndhNzJNcVV3V3dQWjRBMDlZdXJiZm82?=
 =?utf-8?B?WVhaODRCRGpQM3J0bzNXRW53UG9VTnd5cTVab1BCc0RjUnUzTUUwYnJ0L2JN?=
 =?utf-8?B?RnRqUDZPU2RzZWgvaEN4L0k4cXN1Z0Z3Rys4cUVHeml2NXNCZWlacFZmTmRW?=
 =?utf-8?B?Q1JlUlAwNEpiU2k0WFlya2x2K2RYdjllekkrdXBHUFN2c2FsVGZVbjhrMUdL?=
 =?utf-8?B?MVpSVTMvclZIMUFiUTdmWTh6MGl5SmF2R25lNTZyeHB6blV1WWpCN1M0NmVk?=
 =?utf-8?B?dWJ2ZXpuZkNtU3V4WWdkVWxHWUNWZzJmRjdFaHVEQ091YWl6bU13a04rREk5?=
 =?utf-8?B?V2hyZnpoTDNyQkozb041T2pYSDYrYTNNSEd6R1hXMitjSUJPeG5WN1NBQ0pR?=
 =?utf-8?B?WkRVSzNzS1M1anhtVU5KdjBoak5iOWZMeHZtNnloRGZPY2VPWkR2Z0ZOeGxp?=
 =?utf-8?B?T0tESGkyMnhUVkdTd3JrNGo0bFRJZFFDL3FLWDVqNzhINjhyaDQvcGdhc01L?=
 =?utf-8?B?MWhrSGJ3RU1tamgwNHNyc09QYmdrQlYvSlVzWG9vNVlTM1RxZ1U5eE9SV3Qr?=
 =?utf-8?B?V0NvZzY5dGlmTW5UenhxUVhxTU9GeStpakZsYWpnNVlYYzU2bHRnM2ZyQmlt?=
 =?utf-8?B?YXFlZjN1VzdTQ0cxWTcrSGE3d0ovZFJtYlllT3NiZnlOMHZqVXpSL3JBUCs1?=
 =?utf-8?B?RUcvOWtyZUtvczVmdzZ3ZExsUEFyaG5YQ0xQVEZkUDVwSFNRSHdUUnh5aE8w?=
 =?utf-8?B?V2tkeWNQRWFlZ1JodTloNlRsM0tuS0NCWVRhYkpvTzRRWmFxTnAra3NON29x?=
 =?utf-8?Q?/XEyaqxYLpI4e3xMXRIae3Cseo6botCF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckpvb3NHcnF4dnc5RHZYYmFtMXB4ekZMaWtxUDdXdTlWaWRwRERrQk9kM3JC?=
 =?utf-8?B?KzVYaE05R0RLck9XbXlLZ0EwazkvZ2dpODlSYzhGNmRxdU9Ga0F0akZaUjlm?=
 =?utf-8?B?NUtpT2NDREJHMzFXbjhIUzdsMWwzTm1aamRCT1pNaEFJRHltSUMxSE5RTGto?=
 =?utf-8?B?MnQrUXZTUytQc01FVmUyV2MxVFZaamNsR0U2dzhLL3dCMElHSlJWM1RyQlNy?=
 =?utf-8?B?RkRoVkFWTUt4V0hsK3I2SnNGSkIvaU5JSlM0ZWk3bVZaZzNuQnk2NjFUUnpk?=
 =?utf-8?B?dnA0NjU2ZjFhM0NUSHFXcWZhMzZSZHB5WTNtcXlQMXNYbXZMeFQzQ2Z2Q1Vn?=
 =?utf-8?B?a2ZXbGRUWXpuNmk1a3hJTkFWaWE0MmkzL2lOU0lmbHRaYmErTlBrejYwTW81?=
 =?utf-8?B?a1BUUFYzbEtqODZicHR0ZmVQYW5DK0xxbUd1anFLa216ZFFQRmhDei9nekZE?=
 =?utf-8?B?cUpoNHEyTndWLytCVmRtbkxTVnJvZjZ1d3o1TjFFNmxNZkxnUEEwM0czRG1t?=
 =?utf-8?B?NDQ2ZkNDWFZ2TkxpYmFzZzRwSjU1M3FyZ2N4SGppMVRDQzllaWRCd2UzUlJU?=
 =?utf-8?B?OXN5UUFJL3VCeS9SNllselV0bXNUd04wY0txQVlSc1A4Z3RTdVJNRFB4djNt?=
 =?utf-8?B?Wi9KUWhiS1lKYkF0R0U0SHJiejF6U1QzTGJkL1R4VC9TL2MxSE92OVZCckV4?=
 =?utf-8?B?WTUreXdoVC9DTDdQS0lnR084aUx5MTRnMzdaWkxyVHBQcGJMUTBnU2oyTVNG?=
 =?utf-8?B?MmRGZG55TDd3bFRqSG9JNXNmeTFadGpXTkZTV2tRbTBuTVhrNDQrVWpWbzVk?=
 =?utf-8?B?VGNJOUszM3hBSjFFbTVGWjN6NUFKUVBDNnhqOStKSzRVNlZlcjJWU2RzUWpQ?=
 =?utf-8?B?eWpUcFI5R01ncUVaOGJFVFpZb0RVdnFNc0RpMGVJMVdldmc1VCtoTm90UEJx?=
 =?utf-8?B?VjlLcW0yQmtaYzYrQzR3aWRkWktWSTdoUGplQWE5M1hWdkFJWFRMa2pxUTFm?=
 =?utf-8?B?MFRDbTBibXZGZk4wTmx0YjN4TWpyZlNpVFdrb2tNNzI2ZVBNcnBDUEFWNGZv?=
 =?utf-8?B?dGlVaU95WUJURUs2eTJsSXp6N2JTUEN3Tlh2NXl5TWpCdjNsdmhTRFRJWFdG?=
 =?utf-8?B?V2NCYU5uMGNmSW9xK09ZYjlqRXl3NlJrVDA4T2VqYUswSUN6aW4xOVl0VjFi?=
 =?utf-8?B?UVBsSFBqZFB2NEVsdlJGN1pucDk3SmRGVTI5UkVLdG9Jd1R2d0s3bWdtWmNZ?=
 =?utf-8?B?S3BBeU1STEhQUTFCc0NtWFNmWnp2QkprOEtVdXFqRUt2Zmd4aVhpVmErdTd5?=
 =?utf-8?B?bmI3ZjVKZEs4MExwU2d3M1dDR3JPNldZNTNDVklWWWZaVm04TXpEZXhsUGRz?=
 =?utf-8?B?TmwxWWNPTFFwblhTMmZXTzRtcWpaZGZCU3dEV3BBaUpEcldkSDNYYnN6OFRC?=
 =?utf-8?B?VmNBVGxlK1FGRDJtOVptZlY0enFNdTRnQUxBMFVFc1B3TTV3UDRLRm5nVVlH?=
 =?utf-8?B?a2NrRE82U0dLcjNRZ3hJSmlLZlJvQWtNdnFCMVBHWUVqWEV6cU1VTGx5aUwr?=
 =?utf-8?B?bTRVcmM4aFJmSHlNMnBsN0VFRENxS0wrUGhQS0VzWDBiWDlpcjNBMFlQZE5Y?=
 =?utf-8?B?ZGI5OHpZUksrbWcwY2liMVRYMFc0Z3dVSjBHM0N3SVhIVkV0NUs4bkk4VytE?=
 =?utf-8?B?Z1ZkVXRGWUxjbGI1VEZuVC9WSmNkbXpnSVFUMjBCa2RLc0dWMXRlWElyUUxl?=
 =?utf-8?B?dU8reVQzb005ekErSWl0L0FTUnk4UGJ6UHdnRW5hMjZXYUx5c3QwOVZYSVRu?=
 =?utf-8?B?WFBsbUZYR016Um9POW94ZFV2Z2VGY1RMV0YyV0lvQVBaSVFwUlJEVmVZSFFP?=
 =?utf-8?B?cFN0SmhZcFRnOFFVaEkrWlp6ZnMvSXVQajJmK3MrYlF5YytzOWtScm9xcng5?=
 =?utf-8?B?Z0pFczhsMTNXeDZzSnJKMlBFV25sVTlFUUQ0eGlUQ3NqNHNMS0tVTXFzMVcr?=
 =?utf-8?B?WDI5K3ZiYWdwWDdTL2NwNjhFNzVMMTBnZFQ0cGFPVEo0bEw1SVJiTzJhaUd6?=
 =?utf-8?B?d3RBaElkQzRyR3NoSTJPeXZKZUtQTmczbFBsT05vVlpnRWh5SHU4VkFSdmE3?=
 =?utf-8?B?MDJ4SE52VG05YXF1WjNweDRiZ0huaE1YekM3QXk5cW02ODJuZCs1d2ZDWU1F?=
 =?utf-8?B?OUdIV3pvblZld003VnVDVXZoR2xTRU92RjgvTDMzenVsdTZPVjg1YlBzdk9k?=
 =?utf-8?B?ZWJ0M0JGR0pXWXFUNjlmZW5tM3B0cSttYndmYmkwSjV5VElqNXB4dmsybTJ0?=
 =?utf-8?B?ZnNXb2tnY3Q0eDB1b1piV0I4TWhyQ2VBdWR0SURmcWlrZDVJV25mQXFIQk42?=
 =?utf-8?Q?URO1l1LTIMOwFyzg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf85de38-2a68-4a2a-efb6-08de4d1a5f05
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:54:39.3613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YopjyzAoMIsx6y0OgVSr/HioilMwGRpqNMcVVulc8/VB3YRi4yYtkSl2hBourXkUcCJdWH08RpCgCoWQUtBrgQPkjfCNZwvBDDuxYM9e0aI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7352
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


On 26-11-2025 02:54 pm, Kunal Joshi wrote:
> Extend kms_pipe_crc_basic with an MST-specific
> suspend-resume subtest.
>
> mst-suspend-read-crc subtest does below:
> -> Enumerates MST topologies using the PATH-based helpers.
> -> Builds all non-empty subsets of up to MAX_MST_OUTPUT
>     outputs per topology.
> -> Assigns pipes in a joiner-aware way and enforces
>     link bandwidth limits.
> -> Asserts that pre and post-suspend CRCs match for each
>     tested subset.
>
> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
> ---
>   tests/kms_pipe_crc_basic.c | 206 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build          |   3 +
>   2 files changed, 209 insertions(+)
>
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 9750d014c..3a8cd3251 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -32,6 +32,8 @@
>   
>   #include "igt.h"
>   #include "igt_sysfs.h"
> +#include "intel/kms_mst_helper.h"
> +#include "intel/kms_joiner_helper.h"
>   #include <errno.h>
>   #include <stdbool.h>
>   #include <stdio.h>
> @@ -77,6 +79,11 @@
>    *              CRTC does not cause issues.
>    */
>   
> +/**
> + * SUBTEST: mst-suspend-read-crc
> + * Description: MST suspend test for pipe CRC reads.
> + */
> +
>   static bool extended;
>   static enum pipe active_pipes[IGT_MAX_PIPES];
>   static uint32_t last_pipe;
> @@ -96,6 +103,194 @@ static struct {
>   	{ .r = 0.0, .g = 1.0, .b = 1.0 },
>   };
>   
> +#define MAX_MST_OUTPUT 3
> +
> +static void collect_single_crc(int drm_fd, enum pipe pipe, igt_crc_t *crc)
> +{
> +	igt_pipe_crc_t *pipe_crc;
> +
> +	pipe_crc = igt_pipe_crc_new(drm_fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
                 -->Check if we can add error handling here...
> +	igt_pipe_crc_collect_crc(pipe_crc, crc);
> +	igt_pipe_crc_free(pipe_crc);
> +}
> +
> +static void collect_crc_for_active_outputs(igt_display_t *display,
> +					   igt_output_t **outputs,
> +					   int num_outputs,
> +					   igt_crc_t *crcs)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_outputs; i++) {
> +		igt_output_t *output = outputs[i];
> +		enum pipe pipe = output->pending_pipe;
> +
> +		igt_assert(pipe >= 0 && pipe < IGT_MAX_PIPES);
> +		collect_single_crc(display->drm_fd, pipe, &crcs[i]);
> +	}
> +}
> +
> +static void run_mst_subset_and_verify(igt_display_t *display,
> +				      igt_output_t **active_outputs,
> +				      int num_active,
> +				      int n_pipes,
> +				      uint32_t master_pipes_mask,
> +				      uint32_t valid_pipes_mask)
> +{
> +	int a;
> +	igt_crc_t pre_crcs[IGT_MAX_PIPES];
> +	igt_crc_t post_crcs[IGT_MAX_PIPES];
> +	uint32_t used_pipes_mask = 0;
> +	enum igt_suspend_test stest = SUSPEND_TEST_NONE;
> +	int drm_fd = display->drm_fd;
> +
> +	igt_require_f(num_active <= n_pipes,
> +		      "Not enough pipes for MST subset\n");
> +
> +	igt_require(igt_assign_pipes_for_outputs(drm_fd,
> +						 active_outputs,
> +						 num_active,
> +						 n_pipes,
> +						 &used_pipes_mask,
> +						 master_pipes_mask,
> +						 valid_pipes_mask));
> +
> +	igt_require_f(igt_fit_modes_in_bw(display),
> +		      "Unable to fit modes in bw\n");
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_info("MST subset: %d outputs, n_pipes=%d\n",
> +		 num_active, n_pipes);
> +	for (a = 0; a < num_active; a++) {
> +		igt_output_t *o = active_outputs[a];
> +		drmModeModeInfo *m = igt_output_get_mode(o);
> +
> +		igt_info(" pre: output %s pipe %s mode %dx%d@%d\n",
> +			 o->name,
> 		 -->igt_info("[%d] PRE-SUSPEND: output %s -> pipe %s, mode %dx%d@%d\n",
>
>          	 a, o->name,  will give bit more clarity about which mst out is being tested...
> +			 kmstest_pipe_name(o->pending_pipe),
> +			 m ? m->hdisplay : -1,
> +			 m ? m->vdisplay : -1,
> +			 m ? m->vrefresh : 0);
> +	}
> +
> +	collect_crc_for_active_outputs(display,
> +				       active_outputs,
> +				       num_active,
> +				       pre_crcs);
> +
> +	for (a = 0; a < num_active; a++) {
> +		char *s = igt_crc_to_string(&pre_crcs[a]);
> +
> +		igt_info(" pre: output %s CRC %s\n",
> +			 active_outputs[a]->name, s);
> +		free(s);
> +	}
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, stest);
> +
> +	collect_crc_for_active_outputs(display,
> +				       active_outputs,
> +				       num_active,
> +				       post_crcs);
> +
> +	for (a = 0; a < num_active; a++) {
> +		igt_output_t *o = active_outputs[a];
> +		drmModeModeInfo *m = igt_output_get_mode(o);
> +		char *s_post = igt_crc_to_string(&post_crcs[a]);
> +
> +		igt_info(" post: output %s CRC %s mode %dx%d@%d\n",
> +			 o->name,
                                 -->igt_info("[%d] POST-SUSPEND: output 
%s -> pipe %s, mode %dx%d@%d\n",
                                      a, o->name,    will give bit more 
clarity about which mst out is being tested...
> +			 s_post,
> +			 m ? m->hdisplay : -1,
> +			 m ? m->vdisplay : -1,
> +			 m ? m->vrefresh : 0);
> +		free(s_post);
> +	}
> +
> +	for (a = 0; a < num_active; a++)
> +		igt_assert_crc_equal(&pre_crcs[a], &post_crcs[a]);
> +}
> +
> +static void mst_suspend_read_crc(igt_display_t *display)
> +{
> +	igt_output_t *output;
> +	igt_output_t *mst_outputs[MAX_MST_OUTPUT];
> +	igt_output_t *active_outputs[MAX_MST_OUTPUT];
> +	int num_mst, i, num_active;
> +	int traversed_roots[IGT_MAX_PIPES];
> +	int num_roots = 0;
> +	uint32_t valid_pipes_mask = 0;
> +	uint32_t master_pipes_mask;
> +	int n_pipes = igt_display_get_n_pipes(display);
> +	int drm_fd = display->drm_fd;
                 -->Order declaration lines in decreasing line length.
> +
> +	for (i = 0; i < IGT_MAX_PIPES; i++) {
> +		if (display->pipes[i].valid)
> +			valid_pipes_mask |= BIT(i);
> +	}
> +
> +	igt_set_all_master_pipes_for_platform(display, &master_pipes_mask);
> +
> +	for_each_connected_output(display, output) {
> +		int root_id;
> +		bool root_seen = false;
> +
> +		root_id = igt_get_dp_mst_connector_id(output);
> +		if (root_id < 0) {
> +			igt_info("Skipping non-mst output %s\n", output->name);
> +			continue;
> +		}
> +
> +		for (i = 0; i < num_roots; i++)
> +			if (traversed_roots[i] == root_id)
> +				root_seen = true;
> +
> +		if (root_seen)
> +			continue;
> +
> +		num_mst = 0;
> +		igt_require(igt_find_all_mst_output_in_topology(drm_fd, display,
> +								output, mst_outputs,
> +								&num_mst) == 0);
> +		igt_require(num_mst > 0);
     -->i think we can give some print if no mst found?
> +
> +		if (num_roots < IGT_MAX_PIPES)
> +			traversed_roots[num_roots++] = root_id;
> +
> +		if (num_mst > MAX_MST_OUTPUT)
> +			num_mst = MAX_MST_OUTPUT;
> +
> +		/* In future if we can print name of MST hub will be great */
> +		igt_dynamic_f("mst-topo-%d", num_roots) {
> +			int mask;
> +
> +			for (mask = 1; mask < (1 << num_mst); mask++) {
                                                     ->use named 
constant insted hard cordcoded...
> +				int bit, idx = 0;
> +
> +				/* build subset for this bitmask */
> +				for (bit = 0; bit < num_mst; bit++) {
> +					if (!(mask & (1 << bit)))
> +						continue;
> +

-->what if idx, max out for supported mst output?

                                                             can we have 
check to break if idx >= mst max supporet?

> +					active_outputs[idx++] = mst_outputs[bit];
> +				}
> +
> +				num_active = idx;
> +				if (!num_active)
> +					continue;
> +
> +				igt_display_reset(display);
> +
> +				run_mst_subset_and_verify(display, active_outputs,
> +							  num_active, n_pipes,
> +							  master_pipes_mask,
> +							  valid_pipes_mask);
> +			}
> +		}
> +	}
> +}
> +
>   static bool simulation_constraint(enum pipe pipe)
>   {
>   	if (igt_run_in_simulation() && !extended &&
> @@ -456,6 +651,17 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		}
>   	}
>   
> +	igt_describe("MST suspend test for pipe CRC reads.");
> +	igt_subtest_with_dynamic("mst-suspend-read-crc") {
> +		bool found_mst_output = false;
> +
> +		for_each_connected_output(&data.display, output)
> +			found_mst_output = found_mst_output |
> +					   igt_check_output_is_dp_mst(output);
> +		igt_require_f(found_mst_output, "Need at least 1 MST output\n");
> +		mst_suspend_read_crc(&data.display);
> +	}
> +
>   	igt_describe("Check that disabling CRCs on a CRTC after having disabled the CRTC "
>   		     "does not cause issues.");
>   	igt_subtest_with_dynamic("disable-crc-after-crtc") {
> diff --git a/tests/meson.build b/tests/meson.build
> index da70c5014..59dc52492 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -392,6 +392,9 @@ extra_sources = {
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +        'kms_pipe_crc_basic': [
> +           join_paths ('intel', 'kms_mst_helper.c'),
> +           join_paths ('intel', 'kms_joiner_helper.c') ],
>   }
>   
>   # Extra dependencies used on core and Intel drivers
