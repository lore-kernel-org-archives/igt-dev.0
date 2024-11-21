Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410A3E64004
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 18:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED47310EA4B;
	Thu, 21 Nov 2024 18:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+vXjbyK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CD610EA2F
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 18:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732214986; x=1763750986;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=S81lrJwCbiGFmQ1zpLZiq100GhrCbKZzbDex4HOHB7I=;
 b=O+vXjbyKS633/Gf3LDMh3f2Xn/xdF6UhU+0R9PPhlgWv1a4y1ilvUYg4
 lUTQyW8OT6jN8s73zW78D0E9aMV2FRfdtrNEeZkCwxaixVLQwgmZA/bld
 kigmFycgdglkmEDV+9oV+hi5DAZxXtPqQsm5uxw6bpjWwEAXlZ9ziWLG6
 yOHVJbVVX58F6j93iKWQq+QmXxePDzIGRDCvTj4vl3f8839F99GX5jbng
 4vsVdZNJuI91jNghm/+dvmcA6Sw5lD3+fYPFGS1r9gpmvoBJMFWgy0RSs
 DvAl6mBy22ggHXWSLBAOMeBeLVmEDpvxDQHOVfoUOkHUT1lrpniw/Nelg g==;
X-CSE-ConnectionGUID: 4pziL/3BRSC5zNZo3eSXCQ==
X-CSE-MsgGUID: B6EtNrurTYmdzZcm3OLwlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36012499"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="36012499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 10:49:46 -0800
X-CSE-ConnectionGUID: eNfRjYTFTcusCVtoNc4A/A==
X-CSE-MsgGUID: g9NSw2IxRBOOKuiGbcfTWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="113619499"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 10:49:45 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 10:49:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 10:49:44 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 10:49:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aI3noBYoSD+VmtQwjSpImW5aanPkO1hLV940b4mjzPVB8tNP/FY+Mz1H8Ud3WnVYLs5DYv9NEZ3MqREaCvhcxMwVyoUCBl+orPVfhZeIG5RZJWFjYihxodtN5nhwbGLGOuvrWIB3T0oaRUF+Oz9WfnnpUb7cLRtzUvLSap1Vod0D0NgeX/trrStbp/xveJerosBrwvxk1v/Qrq5mvpC/7fcmZNBQYuy3g3CEwevEgp1X4Ar+zOtDhy5NgnkSO8RLoBpIZmd2BAzAcNE5hPVj7ScF13dov9VERBXMnxtDm3pKZsMXAYkzeASIfJLkxgI21J12R6XaF6UMtNltG+wDpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9mglwh5xH7e/PEK9a/GIIMs2Gb43wH+ZwuFgfvl0yE=;
 b=fNy8wznb8Th1oaLAmnH2wHuAA6rF0Yb6VFF3LnmKJE9WaBTJUJGaWt+83nu0QeBBRaz9WbPO3tthW29IzFjw+z0FFOfqt9x2OkLtmHhm6p9inRDrmv9IYl2UWAvwCq2ky7LxrANEK4GTaaEIbQigTlFJ9WSKAqWPlJfbMSI22yWzT00jfC8XmuO36raxGRPOrFenWD0kSM0XPz8Pb/s3HNtpZV7wHgL3c78h0hR2LXylKVkF0XNl4llO8zYR9FUNwA6jh+ZTxONjiHpegofuv69slXIhS1GTf2JbaZhGZuYyk5ITm50vVTelEJx9pa+hQFRXDMiWhtNbmgMdhFCJfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CH0PR11MB8144.namprd11.prod.outlook.com (2603:10b6:610:18d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 18:49:38 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 18:49:38 +0000
Message-ID: <32cd90b8-a2c3-44f9-a995-82d51dfd1ce8@intel.com>
Date: Fri, 22 Nov 2024 00:19:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/kms_display_modes: Skip test if joiner
 display is connected
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241120174345.1970095-1-jeevan.b@intel.com>
 <20241120174345.1970095-4-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241120174345.1970095-4-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23d::12) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CH0PR11MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: 11830d55-a479-4413-c8ba-08dd0a5d3fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTl3M0JUZHRDVFhZaVAxQjlWZXBQWS9DQ0Fqc3hrMW5jS29zcnJaRzZsZTI0?=
 =?utf-8?B?aW1QbXpjVXFTK1d2eGFSRGd0QWVFRkxuTXY3dU13TW16MTY1SWgrSkorZ2ZR?=
 =?utf-8?B?MWo5K3JxaHZka3Q3KzN2eWJBVm1aL1B6QzBzdkxuaVAyeng1aEU1Y3dZclBB?=
 =?utf-8?B?REJNS2I3czhILzRQWVViV1Zua2FNMHZtaDlnazhOVUU5b3hHOGppd1hnOE1B?=
 =?utf-8?B?SGlRWFEzZVl2dDZ4blM3SVFxV1IwZmVSanRJMHRaWDh2N2FnRVRFSk5wRTl1?=
 =?utf-8?B?MGZqQXBxSVR6N1ZGbmJ1UkRIVUpZQzNtVDJnTnNKTjRIZGI2c291QW8xZmZY?=
 =?utf-8?B?UnJpWlJ1UE10MkVaU1FGZ25wRnUrd0ZNMVVDc0ExMzRiek5ocndkL1RGU3RM?=
 =?utf-8?B?Wm1iMkJmN09OZGlYTXkrc0J6R1owWU1jTTBlMUxVWko3Wk1KN2Nsa3hFMUI0?=
 =?utf-8?B?bHFTYm9pc3JHUWtRdUZRSXpkd1B6ZVJaNXc2MDdwOFk4OUgzYTJ3TExOSDIv?=
 =?utf-8?B?Qm96U0R0cXpTYU0xMFp5enFRZHZxSkJVbStBT3BvMEJlODhYdnRyZnhsNkNj?=
 =?utf-8?B?dGFyZFVsMERQY0VZWUJkRTh6c0RSR0VMc2FsV1RwdFdaYnhZM282SzRMREJM?=
 =?utf-8?B?b1d2Ni9ybG9pUzdKNkhPejZHc2c4aTZnRVlydlZBUzhMajZGU0dMdkNzYTVr?=
 =?utf-8?B?ZExPMVRFeEwrTW02TThaZmZyVGZWM3VmTzdUMFByTmxYQVVWa3RZRlV0QmRn?=
 =?utf-8?B?RktGYVBvSkZHN2lQQy9VR0prMlRyUVJuK2RxR2FhZHloZkFLakZxSHJPNEpW?=
 =?utf-8?B?RFZFZlVzVGdrcEtvNWlFY2dwVzBKME84QWVpZVVWdnI4cGFUTytXVGpmM0dP?=
 =?utf-8?B?MkxvVzUxQ2VnSWpiZmdZSFFTeFd1NnRWZUg4RHk1OFJIY3JkejNTQkVaUWVR?=
 =?utf-8?B?Zy9HZHpCd2VjODV5d3lTazBZbVRBK0JsT3lya041YkpEa0ZzMmoxY2Jib2VQ?=
 =?utf-8?B?c0s3WFlkVnF0VDlpSUFPRU1na0prQkdockJaeTczbHlpVThtUDVJSHBJdXFv?=
 =?utf-8?B?cGdpakEzbHgydWRyN2hnbkJJcGNTeFl5dG1ieFNKVm5NZjVDL0FscWxRRTZh?=
 =?utf-8?B?d05IZ2NON21kd2UvWnlXazNpZ3FSOEREemlxamFsNnhXZ2h6YkRtOU9zNmlK?=
 =?utf-8?B?WkVwWXl3R0N1SUhvUUtyZElOU05yMFkzREs4Qk1xcTIwa1RoSFZkREdMYlFD?=
 =?utf-8?B?WUFCT3dpUklLZjJESWpEODlhY05JZ2doZFJyc3I4Y1ExeldHOWdFM2dzelht?=
 =?utf-8?B?M2czRmNJVEVqN2EwODVnRlZ1MFphZmttenJpc3VUZ3FCVmhndCtRL2JpemNo?=
 =?utf-8?B?YXN2N0x0NmxpNWhMeTRzREpLWDFSUW9lZ0JVTWxZYWNTY1hQRjlYSlJacjBQ?=
 =?utf-8?B?Z2lleFZ6VkR2ZHYxK1hwT3BuRHdZdzU5a042cC9XbkR3NzRZMndpenZlWlBJ?=
 =?utf-8?B?K0VsNGtXK1FXQ3liSHFHM2tLVjlBV285bGQ2MjdTclVIenB3ZFFtWS9SRmY2?=
 =?utf-8?B?a29ibU9XK2pndDRRMWdXb3NkQWRxemw4WlNBL2tvZkNzRGNuU24xRUtLeGpj?=
 =?utf-8?B?K29pVWNDcXFXUWVlTWdGMUNaZU5KTlVJOFA0MmFrcXd6M00zcDRsR0c0MWZO?=
 =?utf-8?B?MENsa3Y2eG5iTjRtNTNTKzlmRUFzckpWcnJmY09kc2RZdzNtdVpvR2xrTmFn?=
 =?utf-8?Q?/h6vQXpMxN/qStUMKfczkkFhjyDMMcsh2M0eBB6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGlhRHRLcEV4cXgxOWpBTCtkWWdZK0w5VGRBbWd0ZkxVTG1HYWt1S01ZSVYz?=
 =?utf-8?B?cjB5Zml2RjZKb2dqc0dGVlRpMjRTM3BBTlBSckRyd0szSi9leHYzYkxlZm50?=
 =?utf-8?B?bVducFgzaDBkQlZkUzBPOE9IVlFvRVpVakxheTNDdjFmeTQvZXFQeVMvM1M5?=
 =?utf-8?B?dEozeEhrR3VYeG5vZUVkZjByNk9laHp1YlF2b2krR2N5SjFwMGtKak11WTE4?=
 =?utf-8?B?VlJQV2liRktid2YyWGFCY0xpUFlSd21jN3A3YndrSVRyL2p3N1FHRTMvQTdS?=
 =?utf-8?B?UytGeTkzZnpDZTZZb1IwcVRYdmhFSTh5bktWb3lCNGVDN1RFQzZKMWQ4NEgv?=
 =?utf-8?B?ZmR4aWMxK2tHSlp1bmo1YXJKQzExVFhPa210N2pubWNHTXVpWTlValpKTWZQ?=
 =?utf-8?B?bGNsdFNkTjkvT3FaZGgyNkp6OWZWdVM5N3JBSFI1TzZrUjlPYXR6emRxOXdL?=
 =?utf-8?B?ak1BOTJXbXdaUThYdGhPYitKWVBsSVliYjZ5RG1QNlM1UytmYjdQU1RmQ0pO?=
 =?utf-8?B?R0JVVG9WTlZ6SGZvakhhcDZaMkR6RzE1Y0psMHdQc3poYlEzdWNwWFpDK3lt?=
 =?utf-8?B?dk9rcUY5NnJHbU1CYm5UeG9kSTREQ0FYWXhZbmRjK3MxYTJEbTR3NGhUZ05D?=
 =?utf-8?B?WlJrQ2tKU0U3MjVJeURFQ2hBRFN4RXhqV2ZiNmx4RkFvb25jcVRmY0MwVktx?=
 =?utf-8?B?YVpJdXBzd2xsczV5RjRpUjBLSXJtU2dnYk05ZW5ZR0VWNDdoQ3ZEcWxPUUp2?=
 =?utf-8?B?aFNVQkFsK0t1eTJGYTNnVlNEMGJvN3JyWmJsbmJIZlRLZDFreUlCMFJtQ0VP?=
 =?utf-8?B?SXZhcnBqeGJHOHFCcHRUNVlHNXhYS1A3b09Uck0vZ2wwYTdacU5QMEREMnpl?=
 =?utf-8?B?TEhydElIdHZrMWE1bUsyb1RMTDd1S0xCZUxNaGNreTUwbVo5NnRPT2lFMlYx?=
 =?utf-8?B?ZmlCUkdqVHFlYy9QSTFMUHRWaG5LZ1VDTTlNZE0rZCtqblNTclBkdDg3MVpV?=
 =?utf-8?B?YjhwSnNGanFpMEw4dzJCMytyR1BkSUwwYzRzSVJNVjNQdENWMGJlUDBYUkNU?=
 =?utf-8?B?dDAveUFpcDRIVkdzK1dWMWhidlVqekQwQlZ1T2w2S2I4QlN0NkQrZHdUS0FC?=
 =?utf-8?B?dkk5M1UyNFRPdGVFdlNPeWhVYXZmS1Y0RXU0ejUySUF0S08vYklGRk1haEVR?=
 =?utf-8?B?NE1vK2ZnMkZ3L21Mdm5ST3J1a0hIR0V3RExWemQ3Tk16aC9xMGlEdzJOL25o?=
 =?utf-8?B?U2IzRjVnZkxkTUJ3RXlKenRzMlVzbzBFNHU1ejdicFFCTE40d3pFb3k3VVpB?=
 =?utf-8?B?b0NUWkFoWStZTU1XSUlsbTU5WXF6R0ZpWTlabm5JRTliL0U5VFQwWXdPS1Uv?=
 =?utf-8?B?cGVFQ2t1N0RnNWZNdjEyMVB0UUVneUw3V25oV09ZbW90Y0VnV0svVWJFOEk1?=
 =?utf-8?B?WERtbEtJVitvaEd2Wk9WSjJWc0svNDRIcEFlaVdwdCtZS3dXVytFUEpGRzM0?=
 =?utf-8?B?V1pZMVB3RU5pMTE1Lzl5amVyNnF6VXJkSmcwRDZHQmVQbnRETmI1U1ArbHk5?=
 =?utf-8?B?SWdBMzVHTmhCU2hXbnZsTnR5STJzMlplZ1NWV3JCbHJpMFhBSnd5aXZaNEFC?=
 =?utf-8?B?RlQ2LzdsYjdyWTZkblhac2ZpdksxamlIaFQ3SVRkMERGOTJWRXd1WUw2QlRO?=
 =?utf-8?B?bHJsejNKYlJGTERZeW84SkVVbGY5M2RtU21md1NzNkpUbjY0REpaQ2lPaVlW?=
 =?utf-8?B?T3FneFUwTjVLeGlpM0tpaGYrNzlJS000Z21OSHFWY1ZOQ0ZyNCtMb0NpOTRN?=
 =?utf-8?B?Ukg1ZGNDdUZJeGk0L0Q0cTh1bythc05tMEJ6dU4wK0dLQ2lVOGxIL0M0TjhG?=
 =?utf-8?B?RW9CVy9EUWpCQ1E3RnVTNXluZjl6eVJhd3A0QnBNb090QTdWOHg5azVWRkcx?=
 =?utf-8?B?UFRnNWc5TzBIbm1TSVpCVEtnU1ROUU1mMkZ4TDdrWjQ4TkNaaE4xR1E0a1pz?=
 =?utf-8?B?NkpCS3F3YWlrdlU2M0xON1VCaGp3cGlRZkdoUktkV2ZiQmkrUHhVQ1BpbFdX?=
 =?utf-8?B?Sy8wUmVOWGx5MlNVNG5XSHpLRXJKNFBMcGFwTzNSbFNGd29RQ0RmcFY3QkJ6?=
 =?utf-8?B?a2VUdktMdllCdVdOQ3o2S05NVFJDa0szb3M1cFRvdm9rWGovSFN1cUN1K3Ay?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11830d55-a479-4413-c8ba-08dd0a5d3fe4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 18:49:37.9881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FpBE9iPEA1wo2MglbdsCxep7cR5qdZGAl+v7ea1SZcSH9bn3zxaXkMJm7cLXOXzRGVEhvuK2T5AIu/UBXeknw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8144
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

Hi Jeevan,

On 20-11-2024 11:13 pm, Jeevan B wrote:

> High-resolution displays that support joiner modes can cause extended mode
> tests to fail. This commit introduces a check to skip these tests if a
> joiner mode display is connected, ensuring the test suite runs smoothly
> without unnecessary failures.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_display_modes.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index f1d8ab03d..a2ab8f267 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -318,6 +318,8 @@ igt_main
>   		igt_display_require_output(&data.display);
>   
>   		for_each_connected_output(&data.display, output) {
> +			igt_skip_on_f(is_joiner_mode(data.drm_fd, output),
> +				      "Joiner mode found, skipping the test\n");
Add output name too in skip message.
With this fixed,
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>   			data.mst_output[count++] = output;
>   			if (output_is_dp_mst(&data, output, dp_mst_outputs))
>   				dp_mst_outputs++;
