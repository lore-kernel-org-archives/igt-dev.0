Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2169FCF31AF
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 11:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3A610E238;
	Wed, 19 Nov 2025 11:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKwb+2bd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2F610E238
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 11:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763552703; x=1795088703;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NcBMhN5RpqpsNW9DAzp+CdP1anWzrfUkP0XYjND/RoA=;
 b=BKwb+2bdyfK/51goZ9YM0y0ZbFU4eYFHtRZitRsy+FyeZqQHNMl6ykHu
 SDJL+CSyLU5nBSIqq2r//cT+ZoOMsnzWeDihorJmnkke7XcctB+YyynBI
 mn9ha/voj2SdmqGPUq0vd63yi4G5l4bZ0sCBsM6GAbnqU4LxgQPPa02Ty
 f6Yqg8GjiBj4Xw35Oi1CGiFXXGZNWY9UkemWFG/gG38WnmgWEf5Zlq1mr
 25Moxv13V5LakOq9WV13dXNlP1apwYFlRKNNRzfdstuOYgaQ1BNW1Sz3C
 ILuBzqgCIEu2KEUdY7W/X1uSzuZx9fnmoVLnESSvCTbMhqBc5T1szNRxj Q==;
X-CSE-ConnectionGUID: 889ZpWRqTdarfhjED88Vrw==
X-CSE-MsgGUID: 3aXKgPfMQ/21mRab+FYQ5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76270391"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="76270391"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 03:45:03 -0800
X-CSE-ConnectionGUID: hK5HmXVTR3ugAQTinyGW7A==
X-CSE-MsgGUID: oLGkMu4IQKW1HzvIYpiybw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="191821952"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 03:45:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 03:45:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 03:45:02 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 03:45:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytOyG1ngM0OvmpLXeHFmHuyPW3ho9dMW15buz6NeMCAp6B5/GJA8l7+vnnSqiWglSYstwA+0yG/Na2FHB8SaoOurKn1AkU42ed8U9FjFcZLr7VPlSLgQuFJ72l3Oo45FbaYs8eF3rX9cDylnyKJxLMkRIWp9UpBhQOImNyW2X5OwPsbEZkpF0MHw3QiFREfr4dRCvi93rgPdBUbL4AvaLEQO2duVJHICDAdoXfoSGCWGFkxaWZlcxv9I3r9E4F3q72LwD7jcUhMeJCW96UORzSLzxucWnnKqb6uZ5EKuR6lO9l1M1i4a5G8K1MF3/H8hS+TSgb/K+ZxPvCFLhs+wVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycQrFkc2fLC+q+s5dmafxbjmeNhfvSRiNFnK7LJCm4U=;
 b=aTzd3XFW4l/+8sbvrkJ1JXJNL0qU224ehP3Q8yJAlgobksWg/8ymXTn3scLPOqhP6/A/1u/4rH+bhOJSrJ9Jx6ZgcBJtzx0DZh2RBFLem0TdoGlfB+vwl9LfyMMQtPbtR1K5t5k5p0VAThLKcF0lk33Jm87BJWEiXX9XnElsnEyuqTcT1Z86EkfjHJmz6yQhaj1FMYiAAMW8yFd6Xl1Ltz3b3u+YHNGLeSEhIskcFlUzMlDZzbvA2FkJPy51Ivskzm4323fihmLZ2VclH2Iwt1aJw/msf9M0tW/KFbroiJ7xUkgFIVCXdRl8beEa0L3AZdcOf3oecVK06GSfMMGeSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 11:45:00 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 11:45:00 +0000
Message-ID: <55200caf-2c88-4d3c-9e7b-20040d1f020a@intel.com>
Date: Wed, 19 Nov 2025 12:44:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_auto_provisioning: Add
 restore_auto_provisioning tests
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>
References: <20251023203233.592113-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251023203233.592113-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::17) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA0PR11MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb6863a-9b72-4f9d-07fe-08de276111ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHQ4alZOZTVvNTg5ekpDKy9uQkNpQ3RpOElXbmRabnlLT1ZNcFcwbVd5Nktw?=
 =?utf-8?B?cUo3SndxYXFuN2wrdkN6YzE1cnJIWnpTQlVaQXhUME9YU3J1dHVEcVhvZE1C?=
 =?utf-8?B?TFY5K3VIK2s4TURLNHpPbWtNNmRHUnppSWkwaGg1MHZ4bUpWelRqVXROcjBs?=
 =?utf-8?B?TUJ5dWlnYTRNNThaLzloaFFkM2lHOUVRKzlUVUxjSXVYT0g3TWpoeXBSNlpy?=
 =?utf-8?B?b2ZGeUpQQXhnSUtIUkVMdHpmQnFvZVFyWmFjb09Hd2dQU3g0TEVhN2tCcDB4?=
 =?utf-8?B?eGx3RWFUNTlNdzU2elkxN1NmcWIxT1I1aFp0NkRCajF4WmZMeEUvTlJEeWJF?=
 =?utf-8?B?SkFLQ0hYaDhTeDI0VEsxWjFlMGg0OTYvMkJGbEc0K21jaWZPNDNZVDVCV0pR?=
 =?utf-8?B?SyttTTVUam9QOWtUQ1ZmaXhMcXRqMzF1NDBCcEZUaUFXOVF2VDdUVW9sN050?=
 =?utf-8?B?bWJjZHM1THBYR2tmWElUVFM2TFpTTy9VSnNhZGM5c3AxbGdrb1VKbjFiY2t1?=
 =?utf-8?B?QlpSZU5UWWxhTE44T1FiSTZiTVA1WkZsRTRJQ0JycmpZNC9wZS9pOEZkbUVt?=
 =?utf-8?B?bHBCSDJlc3hPcjlHSTlWNmQvaktOMmcrNlZuUkRJV3ZGRHpQVzdXMDRBM2NO?=
 =?utf-8?B?K3BjVTBtdjN5d3ZNY1Q5TDYxOWZndW5DcCtGK3psUFJrVGI0ZUQ0MUlycWhs?=
 =?utf-8?B?dk9PSGdVWGdYUi8xc1N4ak9HS0E1V0VXbmp1WW5Pcmc1SWsvUWJEalhRQXZ2?=
 =?utf-8?B?clUxM3ZreFcwUDBuM3NHTHVsNm85dHFXNU1WSkFWRlM2K1luRHJ2R2VRYWxM?=
 =?utf-8?B?T0RjWWNucS9GOWpXY3BZcDQ5UEtWOTNPTnRZbFg0WFpzUDV0cW5JR2RrQzVG?=
 =?utf-8?B?VmpvdGlScU44WHdlV3NHeHlJaWw4WE1jV1Q4cDJ0T3IzMHJtM2ZjRElscHBi?=
 =?utf-8?B?NU93eEppZ0RicXdMeXVEeVNFQ3pXdzdzcm8vbGU5cFl5WWFweFc2Tm1SNnBt?=
 =?utf-8?B?ZVNmTmpoUVVNc3JHRGNUY0F0NTUxTkJPQlBoVDRJQlFRbXUrQ3E1dG1ERkZ6?=
 =?utf-8?B?dWdoNE81SDRSQ2llSXNIem9jSmM5dmRiZFBYY3R1ZXNibWFQbDRMbXZxRmJI?=
 =?utf-8?B?ZTdLOEZpUUQrNHp4RlQxZzl3Tk0zUlhJM25DL1hqeVp0dWtqK2hRWTd2ZVF6?=
 =?utf-8?B?K2R5QmtwT0dnRmJsRFdZZG9pS20wQUxyVlN4enBjNEMvYlNmWUs5R28welMv?=
 =?utf-8?B?dG9TemQ4MHpna2VZNlVtYVBVeGVkTjBSRmtvc1RGYVB3S0lDMnRSaTkvY0xM?=
 =?utf-8?B?cXlqOUpNUHA1S2VWUmZVbGVkYTltZzl0dWVYNzJxWFBjSW1IS2JDWVpGcWJx?=
 =?utf-8?B?TE5MbUNHQ3FySVJLVlBPNFhmb1E1bExlL2FrZzRNaGg2M0lLN28zZzZFTHNT?=
 =?utf-8?B?VnZOR2w2K0x0RSt4b2ltMDhlR3FBcXdJTkZ3QzRpVFdKUU9hUk56SThLQjg5?=
 =?utf-8?B?eDJLaEtIb2MxRlduY2oyeFpQcGpPb1hmdm9IdEJNZTBIcEZEeXlPMk9TeVlo?=
 =?utf-8?B?ZnJUQi9mbW9QTHh5MDlOZEkvUmZjMUR2dlhJbi9CMWw5Z2M5YStvbS80aC9N?=
 =?utf-8?B?bENSaDluemtZYlVEUzZqKzBESWZqT05vUldxUk1kT29melVlSTJnM3lzRlFj?=
 =?utf-8?B?aEk1NkVmSDR1THYzcEd5QUVLMWR0RmpQdXhURFBvYndqM0xkU0RGU1NTUnRp?=
 =?utf-8?B?aklGdmN0Y25VYXB3YzJGRHM0eHJtOFNGN2U1cUt0eXhEdW4wdlhZVWtWVDM4?=
 =?utf-8?B?dzBUV1l6Zmo5N241aEdNeUluaE1wZnhVQU5ERWJvNFBIT2hmNVlhOEcrQStG?=
 =?utf-8?B?ZlRzQlZlOGNoMlk1bUNudFB2UGFwckVFTFphaHRTYzVKS1MyZDZ1d3lBbnNO?=
 =?utf-8?Q?AlnbblZr1+IYSrPTEu7LNVN4wpa3aLFp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmVoTUViblFDY0FmZ0xLY3Q0dnlrb0F5MFNJdXZocGpZWVh0bDl1OEp3KzBL?=
 =?utf-8?B?T2Z2anVTckdDRk5EbEpFTkdHN1JtS2lzblpPVW9lWFZzNExnaUxyVTNUUFVr?=
 =?utf-8?B?dUJ0d29SU1dDTU96TE9LN0pPR25Bd3VyUFZodUFSa2NOU0pUQ25LU2gyTlRE?=
 =?utf-8?B?Q243OVdwb2JKU2RmY2k5dTZQK2t3OUFDaTBaV1RjWDBaTi9QYjlWWkhDNGRM?=
 =?utf-8?B?eTFCM05OTllIVitvU2trNVgrNXFRSUJiaVZBN0IvNndCVEZmSXdwZnhKRG80?=
 =?utf-8?B?N291M3g2bUpVRGNUZUhBVWtzKzFIM3c3RGw1Nnp4SGNsSHZ4UWVOUktKWElZ?=
 =?utf-8?B?aXRjd3llek1keUROUEFxNk5JZ1NuNXNKZjBoeENIZ1hSd3lnRkhwSTkvMDFJ?=
 =?utf-8?B?VFNJVjA1RXo3VUhhUWduMzM0S0dLWXd6RHBuUFZIQVVEekZqeFRSY2N2d1Z6?=
 =?utf-8?B?cXRFUTFyWm9NTnZ0dGx5WEI4TVhreDgxaWpRVExaRk85bXR0ZisrMUQrM3pM?=
 =?utf-8?B?bFd2OTE1MllJdnhhR2NqOGNvTit4SE1CWE1aT0EvQVBDZnQxakJEYkYvSkhz?=
 =?utf-8?B?Njh1blJhTlp5VytYckxwUmRvWnBEenRTeU0yQ3prSGRsc1ByOWJEZ3YvT3pj?=
 =?utf-8?B?YS91WnJXZEVrWHNZcEFKNHkyZU5VRHlZZWwrZ0dxY04zczdJSzR3ekNvUmZK?=
 =?utf-8?B?YWFxdXk5aDRkWWxaeG5QRmZRRm9McUlVZXEzM3RIVWZ1bUhuVVRwaExnTm41?=
 =?utf-8?B?NXVSRUhQK1RnYUlleHI0TlpZWmNMVXJkU21vVDNOQW5UeEIvYW5LWjAzZmta?=
 =?utf-8?B?U0VMOExQTmdaN2lhdGhBZEd0OTZKZzVnMWw0eXZQTWowT2FQS0JjU2tlNEk2?=
 =?utf-8?B?UER0dGFDekFSMnErYWFZUkpnaFZrVUlWV3U4eW02c3JpbHE2OG9la1lqcXd1?=
 =?utf-8?B?QlR1d0wvMFVmTlhGU29VU3BKazcyUEE5OHNYNkU0VmNNV2xCS3RvYVdNdE56?=
 =?utf-8?B?VlM2VlM2OGJ6Q29aaU9ta3JkaWk1eVVvMngzcFpBQ2prL3ovS09GdGdvQkJ3?=
 =?utf-8?B?SVA5ait4Zk54TFhWeGJNNXg2M1NhdWdnQTRkWnNiSURna1ZIcVowWlI2cURp?=
 =?utf-8?B?ejY1VTZYbmdWbkwzU3N6RVRZelBiVTcvUmx5ekFhNXBEdDdScGthRlJOUDhH?=
 =?utf-8?B?MGluRStWNGlFekUwdmZOdDcyUkdvUnQwdXRVMVJzK3JvOVo3Wm10V0F2UEc0?=
 =?utf-8?B?MU9vV0MwV01MOXA0VFRMNlFlanFVbnRKZE1pR2Y4bnJYL0V5dktpdElKNlpS?=
 =?utf-8?B?THR2VmpVQVV1dnpIY0U5YzNFRmMrWVQ3YUtoUmhoa0x1bDVLMy9zYXc1ckdQ?=
 =?utf-8?B?S3BSSXdSV1RwbjRvWmNTUmh1ZThIR2JFL0drL1E4RWtmODNXMUFUTjBMS2FJ?=
 =?utf-8?B?TzdzeWdTLzNkS3BxWVN5Y0NURmwyMVJ3S01IWStHUmlQV0hvbE5LTTlXd1Va?=
 =?utf-8?B?azRJTlZkbnBlYk9NRk00cmNQc3VYU1FZSEdCT0NnMWVDSEtUQjJYa2g5dXFO?=
 =?utf-8?B?R2RrNjlySEdaWDJJNXV2U3FIdmdFcEp5RjcvY1JYaElCcTFiZ1pXeXE0cTlO?=
 =?utf-8?B?d1o2dVd5TGZHaC9uZ3pMKzhHWitYM1k1QlQyUFk1RC92citLNjZMaW5peUF0?=
 =?utf-8?B?UTJranM0enNLUFdhQVYrZmRzMlc3NmVrUGMyRjc5SHFQMEd3dHVZTnBNN3Jk?=
 =?utf-8?B?c3NEeWNpOUxjSTZXN2xmR0hBSWIxSy9FVDV0YkYxSGdUYitRc2VNdXVzY3Fj?=
 =?utf-8?B?dmRJTTh3b2RKNDcrTzF2SnluSE1rVFkvK2VpL3M1UW1HTE1NRllmcmRCcGtx?=
 =?utf-8?B?am40VG94YTV6b3I4ZVNJVEx6aE9FaGJwSU1odytxWHAxbllETnpYc29QM2pJ?=
 =?utf-8?B?QS8rLzJmd01TK3lVZi9HWWdFdm5ZeHlsd3ZRMDFlcCs0QVRrR0pSNm9KZmxs?=
 =?utf-8?B?NmNDS21qR2lSeHl1Y2t2UGRrdCtHRktOT1dkRlZIbDFGQVk5d3ZVcUhuV0hZ?=
 =?utf-8?B?cm1LZkMwRDRkajMwQ0pJRFhHcHRIYUsva3JjOWIrUWJvMnRISnpCWjVBMVlp?=
 =?utf-8?Q?grIJcKomcv+qQmyX3dvsa9epK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb6863a-9b72-4f9d-07fe-08de276111ec
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 11:45:00.1058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luckdHY3SLDecYGUtFi1opEqyvFNzSg7KiEVbsyeqflw//jIYNdFGdRgiQpH2Lz4phoQnDx+ij/Ovx2kMqSeZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7378
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

On 10/23/2025 22:32, Marcin Bernatowicz wrote:
> Add subtests that verify restore_auto_provisioning with:
> - disabled VFs (succeeds; idempotent)
> - enabled VFs in auto mode (no-op)
> - enabled VFs in custom mode (-EBUSY; succeeds after disable)
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   tests/intel/xe_sriov_auto_provisioning.c | 136 ++++++++++++++++++++++-
>   1 file changed, 135 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
> index 451c3c5ca..74cea5422 100644
> --- a/tests/intel/xe_sriov_auto_provisioning.c
> +++ b/tests/intel/xe_sriov_auto_provisioning.c
> @@ -290,6 +290,98 @@ static void check_selfconfig(int pf_fd, unsigned int vf_num, unsigned int flags)
>   	igt_fail_on_f(fails, "selfconfig check failed\n");
>   }
>   
> +static bool empty_shared_res_attributes(int pf_fd)
> +{
> +	struct xe_sriov_provisioned_range *ranges = NULL;
> +	enum xe_sriov_shared_res res;
> +	unsigned int gt;
> +	int fails = 0;
> +
> +	xe_for_each_gt(pf_fd, gt)
> +		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt)
> +			if (xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res, gt, &ranges, 0))
> +				fails++;
> +
> +	return fails == 0;
> +}
> +
> +/**
> + * SUBTEST: restore-auto-provisioning-disabled-vfs
> + * Description: Verify restore auto provisioning when VFs are disabled
> + */
> +static void restore_auto_provisioning_disabled_vfs(int pf_fd)
> +{
> +	igt_require(xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd));
> +	igt_skip_on(igt_sriov_get_enabled_vfs(pf_fd));

We have such prerequisite in the main test fixture so I'm not sure if we 
need it here.

Let's add a new line to separate prerequisites from the subtest operations.

> +	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
> +	igt_assert(empty_shared_res_attributes(pf_fd));
> +	// check second call is noop

I think /* ... */ comment style is preferred in linux kernel

> +	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
> +	igt_assert(empty_shared_res_attributes(pf_fd));
> +}
> +
> +/**
> + * SUBTEST: restore-auto-provisioning-enabled-vfs-auto_mode

s/auto_mode/auto-mode ?

> + * Description: Verify that restore auto provisioning with VFs enabled in auto mode is noop
> + */
> +static void restore_auto_provisioning_enabled_vfs_auto_mode(int pf_fd, unsigned int num_vfs)
> +{
> +	igt_require(xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd));
> +	igt_skip_on(igt_sriov_get_enabled_vfs(pf_fd));
> +	igt_require(empty_shared_res_attributes(pf_fd));
> +	// ensure auto provisioning on
> +	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
> +	igt_assert(empty_shared_res_attributes(pf_fd));

New line + comments format

> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +	// ensure noop
> +	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
> +	igt_assert(!empty_shared_res_attributes(pf_fd));
> +	igt_sriov_disable_vfs(pf_fd);
> +	igt_assert(empty_shared_res_attributes(pf_fd));
> +}
> +
> +/**
> + * SUBTEST: restore-auto-provisioning-enabled-vfs-custom-mode
> + * Description: Verify that restore auto provisioning with VFs enabled in custom mode is rejected
> + *		and auto provisioning restored after VFs disabled
> + */
> +static void restore_auto_provisioning_enabled_vfs_custom_mode(int pf_fd, unsigned int num_vfs)
> +{
> +	enum xe_sriov_shared_res res;
> +	unsigned int gt;
> +	uint64_t dummy_value = 10;
> +	uint64_t expected[num_vfs + 1];
> +
> +	igt_require(xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd));
> +	igt_skip_on(igt_sriov_get_enabled_vfs(pf_fd));
> +	igt_require(empty_shared_res_attributes(pf_fd));
> +	// ensure auto provisioning on
> +	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));

New line + comments format

> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +
> +	xe_for_each_gt(pf_fd, gt) {
> +		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
> +			for (unsigned int vf = 1; vf <= num_vfs; vf++) {
> +				xe_sriov_pf_set_shared_res_attr(pf_fd, res, vf, gt, dummy_value);
> +				expected[vf] = xe_sriov_pf_get_shared_res_attr(pf_fd, res, vf, gt);

assert(expected == dummy)

> +			}
> +
> +			igt_sriov_enable_vfs(pf_fd, num_vfs);
> +			igt_assert_eq(xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd),
> +				      -EBUSY);
> +
> +			for (unsigned int vf = 1; vf <= num_vfs; vf++)
> +				igt_assert_eq(expected[vf],
> +					      xe_sriov_pf_get_shared_res_attr(pf_fd, res, vf, gt));
> +
> +			igt_sriov_disable_vfs(pf_fd);
> +			igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
> +			igt_assert(empty_shared_res_attributes(pf_fd));
> +		}
> +	}
> +}
> +
>   static bool extended_scope;
>   
>   static int opts_handler(int opt, int opt_index, void *data)
> @@ -432,10 +524,52 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   		}
>   	}
>   
> +	igt_describe("Verify restore-auto-provisioning when VFs are disabled");
> +	igt_subtest("restore-auto-provisioning-disabled-vfs") {
> +		restore_auto_provisioning_disabled_vfs(pf_fd);
> +	}
> +
> +	igt_describe("Verify that restore auto provisioning with VFs enabled in auto mode is noop");
> +	igt_subtest_with_dynamic("restore-auto-provisioning-enabled-vfs-auto_mode") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
> +				igt_dynamic_f("numvfs-%d", num_vfs)
> +					restore_auto_provisioning_enabled_vfs_auto_mode(pf_fd,
> +											num_vfs);
> +
> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				igt_debug("numvfs=%u\n", num_vfs);
> +				restore_auto_provisioning_enabled_vfs_auto_mode(pf_fd,
> +										num_vfs);
> +			}
> +		}
> +	}
> +
> +	igt_describe("Verify restore-auto-provisioning with VFs enabled in custom mode");
> +	igt_subtest_with_dynamic("restore-auto-provisioning-enabled-vfs-custom-mode") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
> +				igt_dynamic_f("numvfs-%d", num_vfs)
> +					restore_auto_provisioning_enabled_vfs_custom_mode(pf_fd,
> +											  num_vfs);
> +
> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				igt_debug("numvfs=%u\n", num_vfs);
> +				restore_auto_provisioning_enabled_vfs_custom_mode(pf_fd,
> +										  num_vfs);
> +			}
> +		}
> +	}
> +
>   	igt_fixture {
>   		igt_sriov_disable_vfs(pf_fd);
>   		/* abort to avoid execution of next tests with enabled VFs */
> -		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)\n");
> +		if (xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd))
> +			igt_abort_on_f(xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd),
> +				       "Failed to restore auto provisioning\n");
>   		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
>   			    igt_sriov_disable_driver_autoprobe(pf_fd);
>   		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
