Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C046FC7115D
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 03:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0282988C3D;
	Mon, 23 Jun 2025 03:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JsH3/kRh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9052110E0AE
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 03:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750651103; x=1782187103;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eocpIHNlfcF3Skp/gWZVHUJGY8rBBK3oMD38x9V+19c=;
 b=JsH3/kRhsgNNCxRhbrvOPOefFBTLkPs+n4sVulC7wIm77Jvj/BOvJQRW
 lVbdzp14nUT1mvc9gWobsdfD2+vvuCZ8bZmTtwWQ0gKkh8V4RmCWakm1F
 DyP7hgPUZBvVNkig3i06Cfw80Sc+GtMYUdlFH+9JaT/vv9/Lekran4kng
 brJbhBtYN+YNxaDZnUeUNSYpC6wyZwI1PBObw1pyBtMhI4xx4F8uN/XFY
 +NMjmi0VEigqT+nlTe+ignO/5/EG+lqI1SOwirmdn50F5OBCKO3B1FSu1
 b7//gWnmHztczJfJIygVEAsOz0P83ZxzsOEKywp1WvJ3RBEczXHq0iSIz w==;
X-CSE-ConnectionGUID: ZXJOBpL2SI2KJ4X0+yJJpw==
X-CSE-MsgGUID: /EhparR8RAq8Q31JoxZ/7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="75376938"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="75376938"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 20:58:22 -0700
X-CSE-ConnectionGUID: F8fVYzU2S96jBKAiZuQocg==
X-CSE-MsgGUID: AhmQ2lT9Ss+Dey/Sx4QyZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="188704924"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 20:58:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 20:58:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 20:58:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.83)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 20:58:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHv6BQI0OFUDg14YXIV4gmIv0a5PB6Sd1yM93CBMnXdXFt6F0u7Wk8s9+VH853Edx5japnaUHtxDjOfyr23DaIv7dhN4LLJ+XfhP/gGhu2JCwlq0dWg+gzSUNix8NYC0EbbttiRplnsWiDQO7EyiYlRTJ09LPmoows+gqFi4L919BQBC9HJaz7kTvvmw6E5sljFtRy4PXUbjW3C767ayZlp98YWBmt1jGQcAJststtHQK5D0pn9NgO6RTi98LmilmfdWAZNwdxVUJg0I/VHBLgUn3pDvwTND9MxvfVmcY2Swmj2bUQvee/yL11HYookYWOPk3Q9pS+PPuW4du4nZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqJDXYslYjsXFg7yJNFD04IBxfAsGmRwcu9U/zHwxCI=;
 b=oK9tvGOViNGWZUajQtThIPD4/Zwl744hHvhekFcEe31Q4TUKif4RO6x5LvGVg08J79HYThWq+6byxg/r8UvddUTin0UsiflJM/hayNahetF810QEeYZiIUgU2FX/AsPyhPj2Igfs8+OKjMrth0+Kg4uEW57Lmox73N/bJEJuk+AfyV+2oI8OcTgL5ahksmihcG+DaS63nXOxE/0qaYaqyOu+ZF2LtsM3BLNSQKTMhPuPxF78xhmVCsgunPQkELj/4rcGonbFOk12aJ+RewCHzT02sw03zxnFGQnKUPMYxiCOPTWyUgrcWuAEqmFhKUSyOaVLpD/Uf3vJSDXn+3REPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 03:58:06 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a%7]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 03:58:06 +0000
Message-ID: <45d873ce-6a31-471e-b4a8-d41f6a2ba389@intel.com>
Date: Mon, 23 Jun 2025 09:28:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/intel-ci: Refine regex to accurately match
 plane downscale factor tests
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250619082436.56220-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250619082436.56220-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::19) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|MW4PR11MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a29112-3304-4826-f857-08ddb20a2893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXVrOVdBbkV2ZDZQUzl0Mzcwc1lOeTdVdktMUzgzMEE2OWI1SXN4YXg0Z0FX?=
 =?utf-8?B?RkJhVTVLbEpmakNLY1EyWHlzS25NSHIxQTN6ZzhBOGcvclFVQkZDalRiWFE4?=
 =?utf-8?B?NEtGaXlpNmxTdVFkQ2krRnlpYVZ5ZWkyZGh3VGQvZXlhd1FWWEEvVkpxcG9L?=
 =?utf-8?B?UzNDY2o0Uy9pODUxVkljbzBjN2wrWHV2MjY5eGNHVmU5S3l0aUNwYnlPZlRv?=
 =?utf-8?B?dTd1ck50bG02bmJLVGV3YnRuQTRIU0ZhVWVmcnBUK3k4TW5NVnhNdUtJZUxV?=
 =?utf-8?B?bDFBQ1ZNOUo5M0ZpMnQ5MXpWUldZRGdlczhwcEJTMmgxWFY3bUNlYytYaFNy?=
 =?utf-8?B?alEzdklOU2t1YTlzUmJGZVQ2RFkySGVLZ3MrZWpPMmxhc1ZkSHN1c1UyN2U5?=
 =?utf-8?B?My91UXgxcXFvS3VUZ2REWnFydlRIV0syejJrMDF1L1hzczkydTQySGJhcjFV?=
 =?utf-8?B?c044d21xSVNjZ3VUZ3FLcFEwc01tZUJJelRtUUhYV1dQd2o0VnpZeHVoOGJB?=
 =?utf-8?B?Z055K0FrUmZXaVJpSVdkenFJVWtTNE1hNUZiZC9LbUFHYXZvd0pMMkE4Qmhy?=
 =?utf-8?B?cDl2dWpkeTYwSThFM09tWVNNQloyVTJqVnd2OEpvZEsyWWRtT29ZT20xcXFw?=
 =?utf-8?B?TjZISk01d3htYVpSOVJVblYwbDh4eG1TdW94RXVCelpjMVFPZHUwWU1FZVVJ?=
 =?utf-8?B?ZVlTd3hPeVRqUHY1WnhUUXBUR3FDU2Rab1JCVExraXl4S1kwdnRXT2F3TkFo?=
 =?utf-8?B?c2pwalNta2k2VVJuMG1OWWsyR2FhVy9ZeTk2SDh3c2tLN0hIRmpzVC8zYWNT?=
 =?utf-8?B?SjQ5K0JkT0Q3bTNGMlpZY1lNc1cxTXRxQ0dUclh1STNYSDdrS3VmbFpzM1lQ?=
 =?utf-8?B?dzBvRWVzSWRDanBIQ3NGd1pqWXJKcWg3QXMxeC83UXFrbU1MeWNXbjRCWjBR?=
 =?utf-8?B?VTNiR3BOWE1aaFNnYjBTT1hBaHc5UFVJME9qUUF4eVBNVjd2MGNNMDZrRDRs?=
 =?utf-8?B?TVdsV2hDQ1NTc0pRVm0wdTRxU1ZGRUZGZEpjS2o0Q3J0eUtjQ3lmWDQrREh0?=
 =?utf-8?B?a0VHYUorZXRMN2oxemFiUkhxRC90c3lTbXhzaTN1ZkNMbDR5aTZkYi9naEMw?=
 =?utf-8?B?dGtWMzRPQkFHTk80bldYYm1iUzQ3UFJiaVNURmFCUmpJT0JIU2tUcVIrMWJu?=
 =?utf-8?B?SVp0emtGTTJKbHdrSVZJSmNjaVpJOTg0clBqRkpDLy8zNWxkNUZjN092c0px?=
 =?utf-8?B?TGlFcHlQbjdkSWNWeDh2NjkrNURDSGZ4MVlEVEVyN21OWkQrSmV3UFp1SUZO?=
 =?utf-8?B?enRSaXdieVV4Vk1mRTRCT1hjb0JMbWJ1dytjQmJBd2hkcGlNY0JGSEVFZlRE?=
 =?utf-8?B?RjA5NHMzVlpNWmVpMWtIWk5VUUsrcTg4U245SlQ4T3dEYWg4SVVKcnVUa0c1?=
 =?utf-8?B?Z1Nha1pvc2RtZnhEWlVtQnJybk5McmtqRUZBdFMzZFBjU0RYWE1mSStrNUhv?=
 =?utf-8?B?UG1Ib0kxS0paYUJncjF2VVc2Z3dRSThuSTNmeTRsQ0t5TUUwUmFsb3BIc25t?=
 =?utf-8?B?eGhtQUtqOUJVeFd3TVV3dlJqQU5wZGxLajhaU2VjdUFUenV6UGFZdFBZbDV4?=
 =?utf-8?B?a3J3QnV3b05Pc24wUWtuNkQzeWlSNktUa2V4dmpVLzlRcWVyUGNHb3QxRVB5?=
 =?utf-8?B?UjUxRWdMZ1Vtb1pvVVI2N0xvcm9qT01LbGYrSjlCUG9Ha0FPNCs0QU5lckF6?=
 =?utf-8?B?ZE81Q0ovUEQ5WnEzck1qYk9IUkQ3TXVWaW9CSWY1dUJST3Q1c3ZUY0dsOHky?=
 =?utf-8?B?RVRqNnNaejljZWswdnhzZE4rb3hmVjFYNXdjaXB3QmhaaytnQzdyMks0d3E2?=
 =?utf-8?B?UWxTODUzTDA4YkRQRXcrVDc0bmtWdTNWZ2VHNVBaNUVYeEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3g3QTEzcVhUMW5zQy85SkpMa2owaUVEZ2lKTTB2WUtkSkwvdVRmVmYvYW9J?=
 =?utf-8?B?SVBKS3Q2d0Yyb0JaWm05YVUwdUs1dDlkaXgzb0ZaZzZtcTBEODdPLzcvcng0?=
 =?utf-8?B?WCt6bksvNTVRbzNFS2VocFRkNjBWcDJwZG8xeDhSR1RzTVNSVitkKzZCYmVH?=
 =?utf-8?B?T3B3SmVhQXpYNjZ6TmFDTmhjWllpMEZoVG9oMUZIVDV3dDQyWkl6dFFPVGp0?=
 =?utf-8?B?ZkpObkNkYWJxUkRZZ0ZvaDJVaFRhVmxKREtDYnFHU1hxSFRndWN3Z0dIdkNl?=
 =?utf-8?B?RFpUMzVLVnhocnp2N0ZDL1hVUU5VTENPVTJPb1VKNXZDVngxSDdvdDg2NU0r?=
 =?utf-8?B?eE9qUTVQU0hZRFNyaE0rWXN3dVZmVG5yYTVUdnpkTmlRLzMwdDVqUlROc29D?=
 =?utf-8?B?SXNVRFdZYk5PZ1Z1U1VIM2hqSVBGWHBmZW1jYVJqdEVyaEVYUzIwU3NzK3dN?=
 =?utf-8?B?Ym81dWNyaHJqVWNLR09pa0NoOVRZaHRFMStvQ2tEbThWRzVON0dxOUxhcHRE?=
 =?utf-8?B?alFoWlBvYlpOaG1aRVlBT2ZUeXcvNTJoSHpXb20vR2gydmVHS3JYbTI0UEp3?=
 =?utf-8?B?SnRjNm9wMnFJUFJkNlc0UzN3TWx1aGRYSlArbWVneVNOWThpeHFDUjRoclp6?=
 =?utf-8?B?WmRtTHB3dTR2ZFFiT0Z4NTBkSFFxTGlCS2p1U3p2ZjJNS0phMGZLNXR5d0lG?=
 =?utf-8?B?OStKWDRCYkMveHd4dy9uSVFKN2xjR1RkdVk5bGhGMURJTTVKOXBxbGowTVpF?=
 =?utf-8?B?SVprTXdBdEJWMmJnR1JhQ3VkaXRBeDd1QnVDUHVKS0dBQVdLRGk5djFRSEdR?=
 =?utf-8?B?dnVNMGhSL1haNjQvMXNHQTc0RktPZnU3dEpYcG11cWRrdVYzRVpuMEdDZWRY?=
 =?utf-8?B?ZGlpeHFDMitOYnBUcU5jRUlvdVRxZlRIQ29MbUl5Z2RveWNUUWlJQXZMKzFy?=
 =?utf-8?B?Tmg0dDhsakU3aktMY1RiaUF5amU3WlNTbnFCR3phQUlEZmxPVm5jMDN0b1Jv?=
 =?utf-8?B?MG1lL0trSXIyU1NtbFJlZ05WM0ZxMUw5VTQ5WWFXYjJWZmJIMWE0NGp5Vjda?=
 =?utf-8?B?SXVPRjhZSW45YlNOSkdBYzM4SEFlL3JtWUFMZTN1QjFYWWpFRzNOaGpCTW8w?=
 =?utf-8?B?MXJQaGl6dEpjZkpyOVkwc2VLU1ZqM1ZZOElXWm5Xa0hISVhMZlNPbTdTNG8x?=
 =?utf-8?B?MWxpamdvQUI2cmxlSkJpV3RPL2MvbjBOVXg3RWE3VVc3UzNIbm5kdGdKOStO?=
 =?utf-8?B?Z0JheXI2K2ZZVFlDTzFnTEVld1hQZU5IVVFDaEkzWHVFVEhHZ091eHJiMWxx?=
 =?utf-8?B?QlE3YnZIVzhrbHdNVXJDSEF0S3J0d28rbkFKT0ZweXhQK2ZXNzlMT2o0eGFi?=
 =?utf-8?B?WERYRzMwN2hDOEFvZ0k0cWFJNG1YQng0Vzl0amdwVTUyR0pMMFViaEg0andK?=
 =?utf-8?B?YlJuNGh5SWJialZjVURWdzF6UUMvZSs5Z1gyMS9OYmtxbXZjVFVpVVJ2ZlVz?=
 =?utf-8?B?NU1Vem8yOEdMZXdNZ241TUc3eUhQbmE2WEZ0cXB0TmZwd1U5bDRmV1k3MitH?=
 =?utf-8?B?dFozN1BZM1NqMFdFdno3a3BTWXd0dDFnTmJ4d1NkQ21Xd0Yya0JIQ0J4bWpt?=
 =?utf-8?B?K0N0MkVvbXVZKzhaRmp5NE10UVZIV29KTXFoRjBmMmNHY0hYbHB5VkQ3bWxt?=
 =?utf-8?B?STJ5ZUNNVEpXMmhabjF3ZW02VzZsaGFHY3pLeUNkYms2dktvTHUzQmNzK3hC?=
 =?utf-8?B?S25oS0lxUmZaaFhHMUhkQ3NybEhMbnpLNVhtbTFwZVJMOUQvZEFNVm9ucDVx?=
 =?utf-8?B?VW9ZTzFJS05yQU1nRmt4cGpzeU1lNUtnSGhPSmQ0L0NRNTFnc1NtOUJMMFln?=
 =?utf-8?B?dEwxeTZqbklnZlZxY1MydUVwNHVrWUF0YlZBalVaZUZrRGZPZGNtRExjVVNl?=
 =?utf-8?B?YkExajJCdmZlLzVJS2p0WVB6cTJKRFN3SVRxSFNkeWtwM1FkTFk2cGw1bUow?=
 =?utf-8?B?T3EzcitVeG5yZUtDOEZ4RUVmVVhZTTQ3bXlxc1dZT1pjUkFjckt1a2dXME5t?=
 =?utf-8?B?dFZNdWpaN09ScWpydldXYVpDYlZubld3aVE4MEY2VlpRUDQ3U2tDRHVHRTJL?=
 =?utf-8?Q?I+kvX2qmdjZ3WQjKswHl3rAEv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a29112-3304-4826-f857-08ddb20a2893
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 03:58:05.9933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCzPiMT8LccPz6ehtAHquQsMOEZ1yqKPJ5KPdc/jErrQRlIIQV/1VnKBSaAC9VWm6ydAHB1P+j0qbFbfeY3YbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
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


On 6/19/2025 1:54 PM, Naladala Ramanaidu wrote:
> The previous pattern was overly broad and potentially matched
> unintended test cases. The updated regex now accurately targets
> the intended downscale factors.
>
> Fixes: a0d787e069ce ("tests/intel-ci: Blocklist unsupported Xe scaling tests")
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index dcdce8b20..1eabd4232 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -82,7 +82,7 @@ igt@kms_pm_rpm@cursor.*
>   ##################################################################
>   igt@kms_atomic@plane-primary-overlay-mutable-zpos
>   igt@kms_plane_scaling@.*downscale-factor-0-25.*
> -igt@kms_plane_scaling@planes-downscale-factor-(0-25|0-5|0-75)
> +igt@kms_plane_scaling@planes-downscale-factor-(0-2|0-|0-7).$
>   igt@kms_plane_scaling@planes-upscale-.*downscale-.*
>   igt@kms_prime@.*
>   igt@kms_scaling_modes@scaling-mode-none
