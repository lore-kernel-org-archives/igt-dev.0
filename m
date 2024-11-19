Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2DBD62057
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 09:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E3A10E34D;
	Tue, 19 Nov 2024 09:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQHWCPRK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790F510E34D
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 09:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732008869; x=1763544869;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CKs1rXQz+0Sw1e5cdiQqkBEnrqGYPKuXdZeBt+phwog=;
 b=RQHWCPRKarJqijz8Twiy5JBr91FcrsuqiDAdC4StRMVkgIO1xcLbugCw
 9wz7vDbYFFkCU/dDTnGY+fdRUui+4ZyB3KCXWxtOdTbEvv8dcMgoOz5AJ
 zJ2Ic6iwmow4Z1Dja9lQxXN9e/Eij2bgJTds7ZH1DecEaqIaX6RURkagC
 7Kyyvyq0E9Z2QhpyOtLchRjijDpsk7qwrad0YO3VUrzRho5GfBIqiw9d3
 AHEMNzWaxv6hrAyLK6V5DffOXd6jqheAGjp+5ZAHY2gYyNY2hxyTZJKiH
 Ipqq295noOM7haM2+yVyLFztWLQsShw2TflsJtAElp9sDcpbdDk0ZMfFs A==;
X-CSE-ConnectionGUID: AX8Fhz9gSHmKfLwT54PxYQ==
X-CSE-MsgGUID: F68ILn6YSYeJYN36nB7SDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="57405200"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="57405200"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 01:34:29 -0800
X-CSE-ConnectionGUID: byq4o3nYQ+mHxLi+k54hRw==
X-CSE-MsgGUID: I1SXR139TJGn4ch59Ny2Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89664185"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 01:34:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 01:34:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 01:34:28 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 01:34:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gjb+f8Xk5xgISC5br4q0fvuPCZ/rYFgMZLPhNP8n3pxLJpK0w+J3wtdObs702I3L8UhnXnGhLrOZla2rzUVtsNj6g8XxbGOxyDKNdreosemGFBYdTZpibYPhI21+LOcVSLJsumoCTbIRqqLh0EJtb65bapvkw/OQfXS0aCTsj7NnPAhfembgCkKEV3+jyUwyEVrrFuSGvQcOj3FP6QMQQz5ZCE7e1Udo1VJUWLaYKhfD5124GfVuLOr5V8pPT6HAIzvG2L1OHA1DJMGKaLE5YitOyi6mx/ArLtCPPpJObNQByyhUmz/LN4WlFJAd4QMe9hi1983Jop1fjQk8YhSv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CABS/N14T2Joza76LS8eI9wILK/uXES6WvnX9Q+mDSk=;
 b=jyCndq8vZUAildIlGgbwCfhwM8UxYTKwThEqURMsP1uTAlCQWGaQ8DElg0aHNXmEPGVQaAq4K6ts2E+4UXCmgPoFLuy0VpW8EcyCQZB5psmo5WzfXAVgrUXhA7qW8Vb0/uvPRTS94veMQD83zt6VQEBuqeOSFCRdtuhimoMeBr2MSYIFxxBGjrD352JuJR31xsZzlPXMthaokG4haacTu/QcbekVrJECmC/mAmvHiHxrEVzwVCplfNXBC2iiS9s5LawHie+k17gaXUFxqj0h+TR/w1IIKUWvf/DAZH0onUFDwQPfBAr789VmsFAxzjWup9IoCpiuF/GIcfgGu9/3eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by PH8PR11MB6705.namprd11.prod.outlook.com (2603:10b6:510:1c4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Tue, 19 Nov
 2024 09:34:25 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 09:34:25 +0000
Message-ID: <c7c2a9e3-b9d1-4cc0-9437-c01e1d0a4ef2@intel.com>
Date: Tue, 19 Nov 2024 15:04:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 3/9] XE3: lib/intel_pat: extend for xe3
To: Clint Taylor <clinton.a.taylor@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
 <20241114190339.3885752-4-clinton.a.taylor@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241114190339.3885752-4-clinton.a.taylor@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PEPF00000182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::52) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|PH8PR11MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b205c3-a8cc-4890-dfc4-08dd087d5b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzBGOGt5b1lWUk9ZWndxTzM1WHdwOTRVdHYrc3k3YjhpbXBkYXYzVzNTQm10?=
 =?utf-8?B?YzNSajNXTHVYRVg4cWhiT1o3c2R1cDA3blNzUGNaV2dZWWVxaDhPWm9MVk9L?=
 =?utf-8?B?a1crN2xyRTEwOHhJaXRPdG4xU0tCWEJ6dEloZWZRR0xuU0VTNFA2QWF0YU1F?=
 =?utf-8?B?WVdxU0xrTmhSZEsrOFg4WlZHTDMwMW9JcHRYVVZTSnlRaCtjZ2o3dlc3SnJu?=
 =?utf-8?B?YWwxZnAvYkJwRUdJZVk2OVorRUxLdjVkQzRNWDhsSWN5bERMMzFiWmJ6bGFz?=
 =?utf-8?B?c2lzTTJ5NHFpaHBBSURxcnNMSzQ1UE92Vy9tK0lBWW1RUTFFS2tBazNOUFND?=
 =?utf-8?B?ZFUxa2doWXBCdWsrMTQzd2grTzlsSjhXMGo5bXJORUdyQW9KdFkzRWJlU2Jr?=
 =?utf-8?B?c2FsRXQ4L3N0RWxMN0toQzZHenJObjByblVsZEg4VkZlZ3ZocU1HSTR2WnVs?=
 =?utf-8?B?alhnOWhPa2RuK0l2VE5xSTV6UFZuTFFzY0ltbDRza0FGQmRtTU4rSHhkT3dT?=
 =?utf-8?B?ZE5RMitZUmxKTTFLZE1tWmdyOGhUa3p5RHh4MkgwQmlvVXhMOUwyUldZVDVt?=
 =?utf-8?B?OVdFcGhaWG9jc24yOW1iVC9GU0t1R05wWEFCekYzNk1ieGpNWFJzNzh4M0F1?=
 =?utf-8?B?TlVDQkNFdzhDQVZYMmIrcmpFU0l5azR4MkRXQkxabjZDR2U2N2I0Y2Z5dXB0?=
 =?utf-8?B?QlJzNkQ2NUVSVDc4Q21ZT1RsbVBKNFUySkE1c2JRNGtSbThKVkliT1A5OG5p?=
 =?utf-8?B?RUFsOWhhQUdKdW1ERDN3bWltbjNxU0hsTmFqUkRCUDBLc1VCNUJ5MWltYnBz?=
 =?utf-8?B?VXpmTzNna2ZRYUxmSmtUUDRsb3V1OXlLcE45bkUxaGhZK3FaY1pnM25OTHFp?=
 =?utf-8?B?MGRZVDJzU1NXWU9vcVJiMDNsYXFrT1ozdFF1V29TT29VR2J5b0J3dzR5OU9x?=
 =?utf-8?B?Rmw0QnFGZE9xbFFOdFBaMUdReTBmNTZCVk9xdWdpQWljTzgzd2tuL05QUjZC?=
 =?utf-8?B?eHdYSTRGd0tHUG5MejNEY3lROWpQRFV1ZDBxNWoveGpxWGE1VDlXanBXd3Fi?=
 =?utf-8?B?RFl4STU1QmFsbDZyTHBXb2wybmVubXFKdGpEeCtxWTlTSHhIb2xKVGUwL21t?=
 =?utf-8?B?dEk1cmN1MitpRUNCZ21WQ0phcnQ3aHdRY05Va0tUUG55cHBGQUlneWluWXc3?=
 =?utf-8?B?Z2ozbXJiSzIzczh3RFhFL2dZc0xxTmZsTkVDbWF6aUVCVlZDZjZueXJpUnZh?=
 =?utf-8?B?LzEvd0dpekxEcXFkVHdIWWt0QU53WnUySDRuMzlvNHBNWXVuQ0JyNzk0cklT?=
 =?utf-8?B?YmJLNzJ1MU5NaEZRU2NpVjVycU9TUUNxS0RjRFMxNElVaDZEdFlZSUFkTWRT?=
 =?utf-8?B?c2pvb3BYUGVETzBwQ241TW5MWDNkNS94MXZEZ2F1Q3pEUENlNzVqMk5kWU9C?=
 =?utf-8?B?eDYyelVlSGRlbGVudXlNaWpIdlFiQmM1enlDd25NNE5IL29ocy8vQTlXMTZM?=
 =?utf-8?B?STZxSFdWREs0aW9aOW0zTFo2MkF2R005UC9sT3hGaUlKNTlSS2dmaFgxUGtT?=
 =?utf-8?B?RVFjT0I1cHFIZEI1VU1EcW5JOXd6ZHNxaFUzaTQ0c1NSaTROZ3VDamxtSkJF?=
 =?utf-8?B?QU5rTnovYzZWT2VFWWt0VnBFWlFFakMxRUN4UnFDWWs1WHlicGMxZWZ2V0Zz?=
 =?utf-8?B?VXp5NEtsWnVDaVNCQyt1TG01L2c4bmp5Rkk5R0dSU3YzSkxOOS85aTEvNjJs?=
 =?utf-8?Q?G+ptLuMMl6CJB7665iqX8gzeswUSLl0wC5VGDXE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnFMSlRuYVJHMGg0VW9mN3lieTZDWXhNNXplekRUdGg2OWcwcG9zLzY1d1pv?=
 =?utf-8?B?RE1lNkhMdmg5Yk10b3U3cE9hU1BCV094VFhjNXptMUpjL1VTRWsxdXV2azhQ?=
 =?utf-8?B?V2JVbHJxTnErWHlrQ2x6ZFJPMiszU2VycTF2dVMzNVR2eFRpNjRuVUlqMnZI?=
 =?utf-8?B?T1ZXbWJqYTM5YVVZSVZZbnJBM0gzSE9XczMzZll4aEFNVHoxY1hPU0NVRks4?=
 =?utf-8?B?Vk9iaE5YSGx2Uy9SWTIwOHZKOWVyVXhrOE5PN2VqRG9hTjE0WFk0RmJ4TUJY?=
 =?utf-8?B?YjVxZTJPSk1lbE84Vmwzc2dzR09hbHdrL3BEYUVZWVB6VWtxWlBSWnp1SmE3?=
 =?utf-8?B?TWg5a2Vybk1QZG1tVWhVZ1lyVDY1bEN2bzY3MldGSHg1NFJzcFZsU3FkMXBP?=
 =?utf-8?B?NUdZZzkwMmE5VU94ZXZXT1R6VEw2d2hMRENLR3BDaEVLd3pCMjNydWk1dkxp?=
 =?utf-8?B?Z2dTUCtkU2taQXUxYzdsZW1TcVV1VEJzSVhnTzdPTjRSNWFEVlZFcGVUNUg3?=
 =?utf-8?B?MjBETzkwMSsrTXQvbTk4SkhWY3NjQjVUMTZodS80QVlLUUsrOWhTSDVKY3o5?=
 =?utf-8?B?MTVPeS9DOVVsNk9rcVpQKytWNzFKeHpYMFo0KzZDWXlhbitBL3V4MmRvVDk4?=
 =?utf-8?B?WFJqRkhNRCtpYUlkbjE2aWhiWUlnaExkNER1eG1DTnA1TUYwMVNIT3o3L25S?=
 =?utf-8?B?dlRCdXUvWFZ2Y3I3bjcwUVdPdG5GSHE0TmFiVlJ5T1NnWVZ0Y3c5cHNYKzY0?=
 =?utf-8?B?aG5kMVVDK2Y2UVh0dzVCcWRtTUJvNnZSNjMxQ08wQ1NIcWc1VUtYUDhyK05m?=
 =?utf-8?B?MHkyUmZRMlpPTnFEeDBOMU5PRnJ4QkF4U1ZBVytLcUVPa3pRNHh2aEVPUTBr?=
 =?utf-8?B?aU4yTk8vSExSL0h2L1NxbFM1MUJNcGZpalUyaklUTVZ1ZExybXhENEVmSTg2?=
 =?utf-8?B?QlFqUnpubEE4cmJYNjJUZXhKRnpBQTVrYUJkUTVvZkNxdVVPRUJvZ2FKaThI?=
 =?utf-8?B?aEh4MkFZZzBXN241bUpCQVVKSkRhcmlrdjdSb1p1ak5hT2xmK3VJV3RTK2Uy?=
 =?utf-8?B?ZnhEL3k4WUxBMkVwNmxnN3BlNXRnbnhxSXdmb0ZlUVcycWZmanlIbXRvTERi?=
 =?utf-8?B?OWcwRkxwZUJCMVM0TVRnUzRRcyt5Rlg2STJ0WElnY1BhUTZ3cTBLUzhTTmEy?=
 =?utf-8?B?NkV4aVBuRS9xa3duMkYySW1MNXI0Ynd3bHg2Nmp5NEEvL1ROeW5Ed0NsZFZD?=
 =?utf-8?B?TkJTcUppSDI1OEJTdVVVZ0pYdHVSOVdpUHdkeWdqTFVNY1JMQWZ2d2V6UEF1?=
 =?utf-8?B?SUdrMzJtRDd5TWo3eHYxVkxPWWYvNEFneXM2OS9MSmtHV1NmWE5ZejBEbWZn?=
 =?utf-8?B?NmxjQzBJcEQ2RkgrT2NJMm9NTXQ5TTFuMk9iU2QydWRjUzY5VW5hL1ZseFpi?=
 =?utf-8?B?QnBPU01LaXZmazhGUEJWNUQxU1NNdG9XN0hDMDVKSlROdEZJamxSbWk3UVIw?=
 =?utf-8?B?bW9TYzhXRXZnazZGcGFqYldJK056Q3NJZ2hiZnRqMGg1RS8xd2hwMjY2aVFU?=
 =?utf-8?B?MUM3WW1oVDZqVW5TMWd4VlBSM3h0TFFIVUVEQTRYL3A3dndpSWxUdUw4anlt?=
 =?utf-8?B?U0NyTXJzZmxJQlpseXhjWno5VGcyN0VQcXQrcEJzS0pYL2szT1AyeEJFd282?=
 =?utf-8?B?YWJiZzFRb05Sci91VHg4SlRnTm5uRGRNcEE4SjMxVFo4SndJbWdhRjJ3Q3VY?=
 =?utf-8?B?bnExMER0dk8wbG9VV2JSa2d5cUxCU21XY2JYdGVKQ3VNSjFWME5pbkZvNDNW?=
 =?utf-8?B?eFhGWnl2a0hMMjhNcktoMXo0M1JzeXJMb0Z4Y0YvYlNKaWdHZFRMRGpXYW1Y?=
 =?utf-8?B?YXRuZ1duQ2RiSzRabkFvZXlPaURDa1A5UFJoZVNOeXlGaUdhbDBwNGltM2gr?=
 =?utf-8?B?dGZvMnMxcVZEd3NaYUNaLzFqQy9tV3V0bFVIazMyODd1ZllSZ0hLeG9Tdytz?=
 =?utf-8?B?TUxMVXdRVlZJRTNaKzI2MHRadS82QTJGZVV4bTVNMFNvTVNRTmlSTGRkWURL?=
 =?utf-8?B?c0JVeDdwRHNzdk5qNmpxS285d1hVa1ZFSmVlRDNob3NTaUtzTjducjR1TjFj?=
 =?utf-8?B?eWdlRU5sdllYTDVxSWJuaTRtbVNMMkxlWVpsaEgyYmgyZlhkMk90aWVGWlpM?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b205c3-a8cc-4890-dfc4-08dd087d5b22
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 09:34:25.1262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYb9LsCeV+gJyRwACL0qfkhl1Rb1YBwWWkow88KbQO5g/KHYQBub7Rr7hgj15iQa+clFq1c/GdD222q1ASu1rKJe1H47CreqQCEajK7wO/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6705
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

On 15-11-2024 00:33, Clint Taylor wrote:
> From: Matthew Auld <matthew.auld@intel.com>
> 
> Xe3 should use the same pat_index modes as Xe2. Also matches the kernel
> side.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>

Matches with the kernel, LGTM,

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> ---
>   lib/intel_pat.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 7f175b057..156b1ee5d 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -19,7 +19,8 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>   {
>   	uint16_t dev_id = intel_get_drm_devid(fd);
>   
> -	if (intel_get_device_info(dev_id)->graphics_ver == 20) {
> +	if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> +	    intel_get_device_info(dev_id)->graphics_ver == 20) {
>   		pat->uc = 3;
>   		pat->wt = 15; /* Compressed + WB-transient */
>   		pat->wb = 2;
