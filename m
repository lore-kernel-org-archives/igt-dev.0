Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C19CD3442
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 09:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E261B10E1DD;
	Thu,  7 May 2026 09:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfVbTiOU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986A110E1DD
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778144967; x=1809680967;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9uYzd5u+QcqhkKDzXn3XcLiKid+kun6E+6FAbFqUGiA=;
 b=hfVbTiOUIZ+lgNyzB7p0GBFQDFYiNVkF0kdEBDe58t1lqqGxcw4+gFAB
 pGXpFq/V3sgqQgMsaxgMrk2+v8qdMdFeNhB1Sz/m1nEqMqrJJqj/FAUA8
 0xwHHCXT712ffV7aI5pzjkoN/WOTW4lGv7L33xO6Wbd3VmDS2mm2zYhZ/
 rUOmXDE5obL0rP79MbtcpPHih3Mt2NvPSwPju90lnPDd1JckuKw3iP9gh
 Fo5xU+NePHKN9Ly/CbnUDHpXHmA7R4Gx7QB7uo8vje9ulYJ4K73mbRyEF
 qrLoG9eCo1S3dMpQLryhu9aUGJkgWpyklAv1s1tFOWr0MYrRufCwXWhLL g==;
X-CSE-ConnectionGUID: 27zRP9/USPmBajA5VCkg2w==
X-CSE-MsgGUID: tIDO0/vDTBOFFugt5uz8hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79274403"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79274403"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 02:09:27 -0700
X-CSE-ConnectionGUID: TwECNAMOTfmAxRmyT/LYOA==
X-CSE-MsgGUID: ux5avhPjSw60KI0fAnGNGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="235564974"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 02:09:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 02:09:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 02:09:24 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 02:09:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4n1jLBgRpnhdsUttJJrUTZ0YE9GB1JtaOWLxFlF070DRPshE8feiCpTSIV+wCTer9kGbkF/CT/aE/cShIq2RjYWxl1J7/FNhuU9kfCAy0LDOFbKs9dFYGKwJpNo0TyeF034+AXf4oRGJtqYPuz2uDE6aZCpkeyBO50Bf5MOVsnUJxkyu0BVW4kWx3o84OFAnM/xRPtv9LqPJrGsdnicTgLlpYhdoB5qfeA8xAbtwohUBkbNjMQhfpTwBxZgiyprIe0Tu6eFvIsG7xo1NyoCd45scrkKR1vhG9FbdHPLS3NSh2k1kG8rfXcTpvAl1YxcVyPv5iv5ZjIM/HOcHfIEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pt4XzTpMHR9jzn7NIwrt2PctSTJZU8sk47hKUaUvkXA=;
 b=LbvjfzIaFncPY1jZwUJd0jcECBPCKHqdUJbRrdg2+c4wut/kP4JKSf/XTRlNgGA+hguMzGiOE2m4Pkl93PV0x+2g4EsJ4MMVfr5LTWeoe+CKRtqPcmQJfF/CzEI+gRloL+QJnsGLfIk9InxzqJm0/3OCg5idE80vQfLxc3wXYY6ML/dVnAL5Tfg+M08DMyo4FCDDnsNTD3aA3lt74KVIEfMXn/MiaFiBQrMp6SZXJD3RD5ouJUZboRbNSexPfzMc67IsuzBeCp7nfOmrJI+WVo048OeMk4gwht0J7fUuiuG3Vt9TooGBz/IAe4rtDrAeE6wIaz9ItFPkWAaeDAjRrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:09:21 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 09:09:21 +0000
Message-ID: <b82cf976-a87d-45ce-94c6-6c32ab8a4618@intel.com>
Date: Thu, 7 May 2026 11:09:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tests/xe_eudebug_online: fix thread ID math in
 pagefault-one-of-many shader
To: <igt-dev@lists.freedesktop.org>
References: <20260128113934.707513-1-jan.maslak@intel.com>
 <20260128113934.707513-2-jan.maslak@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260128113934.707513-2-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::10) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|CO1PR11MB5169:EE_
X-MS-Office365-Filtering-Correlation-Id: 109ac4e2-a51e-47fe-e371-08deac185362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: POQ+al+WAX2PvUdqCvT1IA/TuDgpaKIrCRxKX4R9YACsb8+kiKhGiQU2e9AERQxPpB6bveGJkISkHfS2eZSkfUAM1P/70YjUSV+KCEbYCqw4y8ewL4kffhpYgWaiwIT8TlTpsK5fCK8SeK6FD6IL0yGdlt5zn1TVJtakGcD1nhOfAMV38xuhwv5ArV6NU0tZrLwk8USgo/J6ip+sbNcHJmld7gKQBp06uMi5suW730FL96Ea8Yus6jE0f+HXVFxv+9sA88PcVcadUc/SIByXxBc5jHex2ZAGYaL1B6PRoqZilDEGPdjqrOOUKQduH3jTfbzZvwINhgiaER/vYWVcCWeyLpbRT523WnmcGNqekt9IMwYG/+UX2Ct/ihcAoRmA+ay3Ghb6owqjW8a7aOIvb4e5OaHJYlVrqHmDMZufL4Pepl8dL1Emk5dNnD9PwWZE3Rlod4NS6Vyg4GEaoxazHGuJ/87SoiwmXNBN3TTxs8BoEo/lX6TsmWnquGH+8fnPaYmtlPg2nebu2GV0iL6NMwZjKPdj2C5T9QY/ZLyaXbnP1ahAZYc4V4D1uYBGdcbrpZ0J/UDlJdSfsPVx3CxJbzEUQIOP1QTZ+wyicqF5hNZF73RLFJY+1zEIrI7hCX9izL4ecG4UAZ7fc4MBaE4/ZlKI8tkL370l9tQDfgP9kBUJCw9os8W4N2B5TzWZIn6o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTNSalZFUVZHdTh4eU05OGJzWUJidGJNUlZoeFdkV2kwKysrdDd3bFM0RmFT?=
 =?utf-8?B?VzQvbTllMVU5bHVSZWROdXZHY1JLZmg1Y0RtNllEaER6TTV0QmtXSnNsaWtK?=
 =?utf-8?B?cXFxVzB1VTNENWJnN3JUWVZ2QktvOVlzRXJvRCtLcEkrendKTzRZYTFjMXdB?=
 =?utf-8?B?eE1INk5uN1ArWi9pQ1krK2FpSXBPYXhJbm1ZTzA1NE5HODVYOE5MRU5LdnAr?=
 =?utf-8?B?SlhjWFlJRExWNjBPMHdaQU1YNnlOUC8vemZCVU9NdXpFSlA5M3BwL29uMjBT?=
 =?utf-8?B?Rm11Uyt6OTlNWG1hVVZualpROVdKQy9vUDJrclVoLzJCb0V5RWNBd1RyVUgy?=
 =?utf-8?B?bHNlK2VGbmI4Ukh6TFYycjA2RTl3YW02YTRmbHlVT1dYK00rcUs3WVpBTmo0?=
 =?utf-8?B?UzJ4U2RaWWxKVWdraGU4N1JkNk50c1V6UzJUQjRLbHVoTGpVQlVDeGNkMUxI?=
 =?utf-8?B?RXlUMTQ4d2RRYzVYd0F5OFc2VWZVdk5OSjNnOEhDY0pQL0JRQ0JRbXl2K1hL?=
 =?utf-8?B?YnpoMkNoblhJQ0dPV3d2WXJoYTYxNGNheFk2VlN1VFIwSDE2by9KcjJXa1FR?=
 =?utf-8?B?K0NiWjAybkdFRDlQRGhiK0hOZW1zeHVRdXBPWUtPWGVjSkExVEo1Y2IzWlpW?=
 =?utf-8?B?a3N1eTVCM2x4d3REV0thVklWN2lZU2ttQzJiVlNLa0ZtS2F0ZHZjVno1NWZP?=
 =?utf-8?B?eGFDdlVLbjVZVjVDNVVERTZCOFl4SDNRWFJXa1RnSnoxMUxlaEJCOHc1MTFp?=
 =?utf-8?B?Z3hJOHZTNElGbXNQb1ZQdS9TUm9YbDYyajJLZHhaL1hZamdSMWFYRUduK2lV?=
 =?utf-8?B?TDJLVmt2YXVGQW9NUjNMMnh5Z0lXWXRCNFp3YWk1MXNKZVc1MnNhTWIyU012?=
 =?utf-8?B?R3gwU0xPM1pJZFZqNlJIWUxaQ0lucnM0dFhWZ2psaXVXUTRKUmRpMmorVktn?=
 =?utf-8?B?aHM2K3Y4QkErKzFVcmhrTmlZV3hDUmgxWE5rRElzdmZlWWlzOFFFd3JjZzFJ?=
 =?utf-8?B?aVdGb1dtdDd2Sm5CM1J3UXZHcFozSHlDbVU4cVl6Z0Z0T3hYdnl1cFdKRnMx?=
 =?utf-8?B?Mlp4TTEwbXI1WFNEUmRrdHM3amE3QmRZdVRhdEpjWkh0MEJOdlYya2c0OE92?=
 =?utf-8?B?K2J2NE5VZG0xeEh5d0dBdkRLUFBlemdoRXczY2xsbmFLZDZRMDA4WFlFSUdy?=
 =?utf-8?B?OG5Qa2VEQmJhT01OaERJQSs5azRGSlNmRDhhb3YwSnlOalZLdjk1eFdqeWt2?=
 =?utf-8?B?NzQvODNsMlA2QWNpWWxvMlNYaU5NWGs0Q0JKRTVVZ3pmSVRHalk0c0pCd01K?=
 =?utf-8?B?OXRNRWJVaXJpazRCNEI2cE1OeDIwaGNGVExPZmt1cHVYdURia3lRTStMbjho?=
 =?utf-8?B?K0sxRGZ1MUllNTdVSjNoK2hZWFg1ZEIrOWplcUw3WDdZNDJRalFzSU5zdzhk?=
 =?utf-8?B?amErMk5EMlV0TDQrRjk4MnNQN2VVR1Z4Nkx3bWhKRnBaaFYwVE5RZ1dCYSs4?=
 =?utf-8?B?SVU5azFjSEpEc29GZ25TVGRYZlE0MjF3RTY3NmhzUnBlcW8xMHIyR2pteTlm?=
 =?utf-8?B?QVF2K1JSZWtad1pJQWZCY2lVbllMY2YxaFBQaDUrVysrQ2VRb004bWlVb0R3?=
 =?utf-8?B?TTJYRk5Wbi9vWTRWZ0FyY01TOTE2NitLbDlZeTBnMmE0TlFwR2lpckhhS0tX?=
 =?utf-8?B?OHpRTmxlKytYUm9yRlJncXRXQkZMNkk3TzVtNkZjb292eFoxVmp4NGowTlFU?=
 =?utf-8?B?RTJyTEtUaVRyRGRqbjNZNDdwamFPZ1A1TGJrSVFFQ3IxZnFxekhucUJpbVFy?=
 =?utf-8?B?WWthYk12LzltYzk1aHVhRVVKTElFbld3RTZVVmFnVXlkSWs0U0RoOFVQZ3Yz?=
 =?utf-8?B?S3V6YzE2NDZtcHlUZFFGWTVlZitXZ2dSckpod05taDg2UFpyZDVQOGZiVkVF?=
 =?utf-8?B?cDhCc1d3Tk02K0V2a2xTTjdIengxVjYrOCtRWWU3dFJLTlE0UUZ0dkpoSWVh?=
 =?utf-8?B?ekhmTzZSMlZlUGMweEV2Z2R6dXcyYitsUDlNNExQcE9UekJxd0VlSzZRcFhr?=
 =?utf-8?B?M00vMGpLbkFleEM5TXh0bWZ5ODY1ZlZUclFYeWpsM2dpV2haZTV0QnJJM1pi?=
 =?utf-8?B?MnArcUJ2ODZNd1BLMmtuREN6c1hRUjdiQkFQVXBYM1U1WW9DZFYwTWJJck1I?=
 =?utf-8?B?dWg2RXVFTXlRb0ErOXJRM0xLeEdNVVJYL1NHdEFHMkVhdUF5cENqQUdqSE9T?=
 =?utf-8?B?d3BvT2hTbXpLNWlwK2I4bDNPMWgxNis0MytqbTNPWGwxUGFFcHoyT01wMlRN?=
 =?utf-8?B?ejJnRTZmM3hrTWdlTzJmbEZZaHlEWE8vSEQ4MVUzcnR2VDNWWjQ2K0duQWtE?=
 =?utf-8?Q?zaK+cQ8SvU2bLmVY=3D?=
X-Exchange-RoutingPolicyChecked: fQvmmhuEFrt30cCwp4inyo+1t6YTNvZs8Pcc55ravdY/2PPolW1U/EVXchh0xawgJPM2iasns/KDSwcHjvKWM16hdVl7daxAYOYkHsVhxGJL3KWNYJUVY3OTNIv95+ZB5O7h4xgVaBv7ZKtvo7DPk4nzw83AS6aY3fA00DrhaVFfkJz4gVToNE1uN74M6H0sDKPNga8lmw6r5arXEYMOjtxw0HxkXLk7tbBa4uhs+ITawJ0aCfWpGt/cZiRTBuY+axXEPPdxtUWKawRcAV6ueJVM7K4+bWyI+9Mt4YabkETsPXTS2EyvKPl53W6cX9jUl93KstkjTndVtxxHuJjUbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 109ac4e2-a51e-47fe-e371-08deac185362
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:09:21.4219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wRzyXN62e6TDq4luW6PEya48Il5I13r/7p8PRoI98vEHERBvYZkP3pWmjW1S+Xd1+eX7Wi9FwUbpMwqEBZnaap6hX3iY98Fo7zK0F0sAp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5169
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

On 28/01/2026 12:39, Jan Maslak wrote:

> Replace the incorrect use of r1.4 (wrong inline field) with explicit dim.x
> passed as an argument, then computing tgid.y * dim.x + tgid.x via mul + add.
>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   tests/intel/xe_eudebug_online.c                   | 5 +++--
>   tests/intel/xe_eudebug_online.c.gen.iga64_codes.c | 7 ++++---
>   2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 084bdeb77..9f736af58 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -267,12 +267,13 @@ static struct gpgpu_shader *get_shader(struct online_debug_data *data)
>   	mov (1) r30.4<1>:ud 0x3f:ud
>   	mov (1) r30.7<1>:ud 0x3:ud // 4 bytes
>   	// calculate thread id: r20.0 = dim.x * tgid.y + tgid.x
> -	mad (1) r20.0<1>:ud r0.1<0;0>:ud r0.6<0;0>:ud r1.4<0>:ud
> +	mul (1) r20.0<1>:ud r0.6<0;1,0>:ud ARG(1):ud
> +	add (1) r20.0<1>:ud r20.0<0;1,0>:ud r0.1<0;1,0>:ud

Hm,

mad src0 src1 src2

does the src0 * src1 + src3, right?

dim.x is r1.4, tgid.y r0.6 and tgid.x is r0.1

so it should be mad r1.4 r0.6 r0.1

Macros for those fields should preferably be used.


Thanks for the catch!

Maciej


>   	// page-fault only for arbitrary thread
>   	cmp (1) (eq)f0.0 null<1>:ud r20.0<0;1,0>:ud ARG(0):ud
>   (f0.0)	send.ugm (1) r31 r30 null 0x0 0x2128403 // load_block2d.ugm.d32t.a64.uc.uc
>   #endif
> -			)", data->pf_thread_number);
> +			)", data->pf_thread_number, data->w_dim.x);
>   
>   		gpgpu_shader__label(shader, 0);
>   		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
> diff --git a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> index 3bd5b0c5f..2fe6bb7d8 100644
> --- a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> +++ b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>   
>   #include "gpgpu_shader.h"
>   
> -#define MD5_SUM_IGA64_ASMS f0897ea23eff7ea77569eca6ddd16161
> +#define MD5_SUM_IGA64_ASMS 7ab1b0da138a90599e4086c2c40269c9
>   
>   struct iga64_template const iga64_code_store_sr0_0[] = {
>   	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
> @@ -24,13 +24,14 @@ struct iga64_template const iga64_code_store_sr0_0[] = {
>   };
>   
>   struct iga64_template const iga64_code_pagefault_one_of_many[] = {
> -	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> +	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
>   		0x000c0061, 0x1e054330, 0x00000000, 0x00000000,
>   		0x00000061, 0x1e054330, 0x00000123, 0x45678000,
>   		0x00000061, 0x1e254220, 0x00000000, 0x0000003f,
>   		0x00000061, 0x1e454220, 0x00000000, 0x0000003f,
>   		0x00000061, 0x1e754220, 0x00000000, 0x00000003,
> -		0x0000005b, 0x14040220, 0x02020014, 0x01440064,
> +		0x00000041, 0x14058220, 0x02000064, 0xc0ded001,
> +		0x00001940, 0x14050220, 0x02001404, 0x00000014,
>   		0x00001970, 0x00018220, 0x12001404, 0xc0ded000,
>   		0x04032031, 0x1f0c0000, 0xf8061e0c, 0x00a00000,
>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
