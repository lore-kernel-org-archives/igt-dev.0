Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B89C0218C
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 09:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D273D10E214;
	Mon, 27 Jan 2025 09:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cy6aDEHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5C210E214
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 09:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737971409; x=1769507409;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tA0CrfnZMgtRbpE0y10X2BjG0Eflas4SY0Ddx7bsio8=;
 b=Cy6aDEHKCBvY22+k9IjASwVVljVbo57LRWX/u4j5C07qtMhadsxRhPXp
 uMX9j4WRD1e4ZN7SftqW6dWp/ixqySLDYZrvhCCP3kafJAur7BWiWZ+Gb
 T2KuP36zP263JdZfMMJBr1OThsLL/MjEHdICShvzVdm9S87snEY0zEyt7
 fWM/ezPvjqRhj/KFG6OiuNJL2FLcPHZPSBhzpZWkA55FdMO1EO22IJAmZ
 +sAuNdIqLP4kU6/Kg+kfqYMsDXvKrocgxVg3Ml5bWJMUCklQKfhtAVlbE
 AY++CwzU9obOTt0gHr3eZ8gUwpKi1GxhR7KDPmWUUqlMaX2SCZzIfgZSa w==;
X-CSE-ConnectionGUID: eRxGIkNLQjWkGcpnrThBWA==
X-CSE-MsgGUID: IAYKcvBYTHWKFOWx8Vr3fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="60892017"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="60892017"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 01:49:48 -0800
X-CSE-ConnectionGUID: V/3C2D8qSHWVIGgD0+qY6Q==
X-CSE-MsgGUID: I4VIjCVAR5SHDWYIkBAs9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113526065"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 01:49:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 01:49:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 01:49:47 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 01:49:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLEK9dndNlEazSKPW1XtgSFA6ZLlj3V73xgEA2+6rjFrWgmuT6jG2cTHXuo9dAqTpdTVQevbJXzMSIy2M83jx2m2mYhEMsdK3t66so4dMeggaueuCKlOM5VAbfx1NNIMCVlxlnkLuSnPro1pN78XiSIEXRsvS2+4FvGbFRytGXnswQGJn84VYuY3QMWtocvcGmk3TfNsy78IEW8lkSgX7dII0VLFaTy06NimxEFH4RRE27zK9PjFzBWukaFk6BGeFrxTA02QG3ONFt9TQc3o5x+4tyEXGhRMoQvHf8qTMtvYp4nn2uNGgA4SAo8+I4zjtBuMCJBU4oGFUAFVCgdTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyXog/rQltp+gwlDiT5vAYF3xeJkpTD9ifcIBzpfsM4=;
 b=hOIUYUe1LMCVac4/iKYN9ybqGROIDCYsWaa94fa5WgSy1kJanJ4ZPqM330gUzTZM0+Aq2B+g21IVe802WyZlqios/L8+2YdvxO8Dfeiy/ImITHoLrYbbNukI+7pk/BACdy25AOQ9xlzuOZH2Rww5UuvLeqAMZahrraNwlFcrNytlxSzlgdvdDiC1n9MEH3z7+GznQ2cqqp+tDnst6TZ/AKqLsknUSDIiM5wWp8jSKfiax8SkBCrYH2FMn7zJvW949GlRzQysEngLyPIumlR8tlX5o5Cf8d/00FOetI0NP5ZDJD4jhOXGXOnUSaGha5O5XVOils00WJR30MhBPhXuig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SN7PR11MB6828.namprd11.prod.outlook.com (2603:10b6:806:2a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Mon, 27 Jan
 2025 09:49:45 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8377.009; Mon, 27 Jan 2025
 09:49:45 +0000
Message-ID: <7255d0cd-fa92-4813-95a3-1fdf3c23a541@intel.com>
Date: Mon, 27 Jan 2025 15:19:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tests/kms_feature_discovery: Add tests for
 UHBR/non-UHBR over SST/MST
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250115073243.2002014-1-kunal1.joshi@intel.com>
 <20250115073243.2002014-4-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250115073243.2002014-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::12) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SN7PR11MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 61224cb3-7996-4ea9-a0a3-08dd3eb7ee16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGRYYTdLbjVzL2dTdlZxdjVHV0xjL0cyN2hSWXg3NDVHaEpYTTFxaXN4dWYz?=
 =?utf-8?B?aExFUi92NXNzbks5R0Z0cnFaWmg5ZGdDcENnVWkzMU1yeHJSQkYwR045djNW?=
 =?utf-8?B?OHJVUjFkbURrRHlwNXMxUUsvSTJMYitZMXd3bU9HczJaa0RFa2NyZGZzbkJG?=
 =?utf-8?B?b2NWZDdxbWlwT2FDK2hMRHJGY3lDaU81YnQ1aVlxbDloZ1ZNTlM2ZEtPMm53?=
 =?utf-8?B?WC9pUkNpWHFvOHVhWXEwYUhna1RMTUJkMlpSTEVRanVYeXlXMHpxd2pDV09j?=
 =?utf-8?B?RkNSNm0yOFQ3QmdiM2JybG9iZWxRcVJDMTcrYmUzUXNLSVhIOUN1cG83WWlo?=
 =?utf-8?B?K0dXNml0bGVCNjJsNWxCTzBLa1FhTGYrNHFFcUIzRTJnMHRobSt3QWdLN0xP?=
 =?utf-8?B?KzN5TnpTdUJhYXVzemxFcE9yNER4UTgrYzFkTkI5MVNhN29UVTc5UHRGQ2Ft?=
 =?utf-8?B?dHpDSjdMUm5hR3IyNTlmMG1UdnIzYSs2a2pyWWlORjhNd3dwZXVTWDh3M001?=
 =?utf-8?B?QVN2VGJQUjhYblFmOGZLK3JablFWVE5lU1VuREw5bFg4RjNqZ0tsWTNPT05Z?=
 =?utf-8?B?Tm5rMEhzWi9jcDZXZUVCVW1TaXR0em5mRkhINXgxMkRVSjZNb0J0WGJXRmVT?=
 =?utf-8?B?cEkrMGNad0RzdVE1K3Fxdk12U2pvTjFLbXFBM0RkZjZ5ZmZ0S2hza3RBcWlV?=
 =?utf-8?B?UzBtcmJKK0dxa0xUelhPMWJWSTQ3Qi9CK0E0Z1kwV09xSWRBYTE5blIwOG1R?=
 =?utf-8?B?Y2JRNWFodjg4SzBPSzZabktjN1BEa1A3cjdCOTAzRkxWaElTSjhudFNaMEt5?=
 =?utf-8?B?RVhqejkxMEp2OWUzbm1vUGduVGt2R2VmeHFNRmxpM01KOE12citmQzJuZ1hr?=
 =?utf-8?B?M3ZyOU5INzlCVXAxcC9IVlQwa3pnTzhNbkp0dDNEM1YrVXZnN1NlVmticGl1?=
 =?utf-8?B?c0R3SnJYcWZ0MVBpK1dTL25WNzllMjBQSDhTTldDZHBlOWxnaDZMcmtMaGh0?=
 =?utf-8?B?aFZmc2NpQUs2aSt0cFlKNWZ2M0FsRTFIUFdRYkoyQS9keU9BQTdMR2cxSUxF?=
 =?utf-8?B?VzliZUJEUHY5Yko2YWYvSFJseHVLL2lVKzJUZXRTTW5uczB2ZXNYdkFDY0Jm?=
 =?utf-8?B?TnBLa3hZc1hGY0NxbG9VeWNsWVkwL21udWNyRXVSUHl6ZnQ3Q29WUXg0SzIr?=
 =?utf-8?B?Z0lyWXVPd0dnc2JXWUtjZEhCM0hGLzZkZFRnRk9VbzdnWnVucjBzTnl3VU10?=
 =?utf-8?B?MGtJYklsckI4WktUTGl4cVY5S0tXaDJVU0JkUWpLaytUbDNELy9uUlY4OFlW?=
 =?utf-8?B?bURWVjFxUThSbml6dlRQV1dnTmh1d1djNUMxR044Z2IydDJjcW94U1kwdmFN?=
 =?utf-8?B?Z1liOTNBOFU5YS9XVSs1aE83dU1USTBCM2tJY0ZaS2gzMmhBTWtPckR6cWdu?=
 =?utf-8?B?bXQ2TTNRQndhYm9kd2dpUW9OSGJsbHo4K0FMSCtCalBaMVBlcnlzT3VxVEx4?=
 =?utf-8?B?bUFFQTk2aitKeGdiNzFreENLKzV0YW1jaDNuUUlzSEg5Z0taT2RsbnZRODJu?=
 =?utf-8?B?Z2ZYSFltY2QzUU5pNDltOWV1emFBSWp4cXpYOGhtRjlxME1aVGVwdHdlcjlr?=
 =?utf-8?B?WG02cHIzV0ROWWlKSWhiM1Y4UzJ0T1R4a2ZVNzV0cTVlQzIwNkxSMFU5eTBD?=
 =?utf-8?B?UmlyT2JsTTl6SjcxRW5ubytMWHMveUFic2lsVjdRRTFvTkx2TjVvakdPdDg3?=
 =?utf-8?B?clRNMFNjT1lOM05XTDJDeGpaQjR0YktDQ2h3bC9FVjhmQW1YTEVBS1VqeG9k?=
 =?utf-8?B?K3RyZXVjS1RJdm95TFBpV1dmU2lVVEFHZHZSeHZiTlIvWVFDUVYxcWZRSDFZ?=
 =?utf-8?Q?CrubLeVLhB1Zc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXB3THNkOGdSVkFvR01tN3l1V3d4cnRZcjIyQ1dHdlVFdGVzdFBQRTdRY1BL?=
 =?utf-8?B?bGIycng2Y21ielY0T2p6MDFUbXJ3aEJ2S2dFeFV2ZS9wNkdkK3FCaTIvdTR6?=
 =?utf-8?B?Vkk0TGlBQWRqMXRmTFZLODVEM1ZlQkloYnRieVN6RW1hWGJhS0tNd05HY05R?=
 =?utf-8?B?OGNsSkdpRVppWnlzdXFOQzA1UUlQMmRiNnBDTkFYSXhZS25zYWk3R1RhS2Nj?=
 =?utf-8?B?TjEzWWJ4UXR6MGdoTWNZajd4RDhGT0J2YTUwaFdWaUN2RXlnYjRTaWprNEVi?=
 =?utf-8?B?Zk9NSXplMVppc2dYNUlFam12MXJKd2pkQkdXeFZHM3RNYzZnMFBQVS9UK3NW?=
 =?utf-8?B?MFY4bW9uWVJCanFMYWV2RmFtNFZLcXA0QjlsNStQenhnOThtWG1kbzgyTkdo?=
 =?utf-8?B?UFp6cGNXUzdLTHo2Y0dzMnhGbmpUdytULzB4VEsraGEvdnJGaTFvUXBBZjBZ?=
 =?utf-8?B?ZzJLVmJVRVQ3a1lKdzVFK1ZxOXQwMHRPc3BVeGwydHFwOHVDM1BtTk1vYzZ3?=
 =?utf-8?B?dm1pSE9OdXdmVlF3MUxwbXUwZng5aHFQbTlOM2tFNHlmZEs2REFHTmxyWjlL?=
 =?utf-8?B?aXQvbVU4UzN4QVN5cU9XOVNDMTQ2T0J2Nk9QTk4veVdrY3FrSkRzTDJKUW1z?=
 =?utf-8?B?UHpkN3pMTVNJR0dQY3drWGsycWxTcElWTHh4MDQ3S25IcXNHVGhxdjM2Zk1u?=
 =?utf-8?B?OW9QazhLWXNTVGJRZ28rRGd5ZThJZUFiUDdEM2l6M3hBM1QxYjhZTnFlZmlR?=
 =?utf-8?B?RWtaUVMzYVlESmVSQmJId2UrYnE1emI3bDlpOStWR0tHdE41VEdsYmQyUTVo?=
 =?utf-8?B?RzlUbUtIaGZTYXE5NTIySzEyK0lidGlqSUtjcWk1TzlKb25rVkhMSzAzMjRG?=
 =?utf-8?B?S0x5TzBFa3NjREs2eXhOUlJyMEpuTUtmdnVaQ2F0QTBmVUhXVURwK0xHeFgw?=
 =?utf-8?B?ZEhpK28venBkR0REUE5GYURUVUVaeFRpZXFHNXFTSkNZdzhPTDdvbThlSlNp?=
 =?utf-8?B?Nzc1R0JvclRpa3NwZjdqM2hzaHpweVZ4MW1sS1pCd05DWWVpMExGNWZmKzdH?=
 =?utf-8?B?c1dOeWxxTW9wMHl3N2ZacnN0Y0JFajZwdzM3OVlyTVFzek9ocmhhbS9XdWZG?=
 =?utf-8?B?MTN4NUxXdm81dHhSYnU4cnR6eUxnbnBKamJ6ZFp4T0gwZ2FwbWszajRmTzdE?=
 =?utf-8?B?SmpzNTU4VTk3S2RtOE80dzBnbU9VREU4UnBRc0xxMm10NW9nUklhWHczSWt4?=
 =?utf-8?B?aFVqVVVHeVlSdnRDMDFMWUlyVElqb29zbXRYZU5wL2lNcVNIUUtiT09NMnhP?=
 =?utf-8?B?c0xBeXZlV2FlT0RNbkxlSGxBRVM0anA2K0Y2V2dNTG4zeFRMVmxvampJbkFH?=
 =?utf-8?B?czVZUFUrakNPbjlBZ1czdnN1R2tYWEwwVTllV0V6a1BmN0Y2V0VJQjgxL25F?=
 =?utf-8?B?eE12dnd0RjQ5MzNiNDQ1QzhuQ0lOSVNEclpVazZuTzk2ZkxtcjdVaDNSOW10?=
 =?utf-8?B?Q3p3dWVHVWk0UXVCVTZGMnpzbVArb1o0OXBFOUk3M1Z0NEoxLzROZDlreUIr?=
 =?utf-8?B?QUNvMWlMRDZvNVQvYW9hdUlUYnhOV1p5ODVjS25MVnZBN2ZPWi9jMk5ZaVRv?=
 =?utf-8?B?NTdQUmdCZW40S0VhdG1pRzhKc1hwYkMzRU92ZUNSQitubE0xYnNrQ29kWDhw?=
 =?utf-8?B?Q0Fsb1NqUG15Qi9lK0RsN2dSTVRuU05qZ2dxaUEwc3c0QjVVdWpvNHNvK2tC?=
 =?utf-8?B?NVBHVGlpUHFNWG5VNVB5S2NHSGdueFE0Q0NOWE9NQ0dVT0JpRzV0bVRaOFBx?=
 =?utf-8?B?cWRnY01Bakp4SGVzcFdFZFA1aHlJeVpUZThMa0lRbS9NZFcwdWpxMkFXWWpk?=
 =?utf-8?B?MDJsQnh1ZmNwR3BSdlRkMndDbk4vK1hjMEluakYwdWFrOU9ndnJHSE1iSnBr?=
 =?utf-8?B?YjZaNnpFUWR3OVpBNWFzZ2dTZFhXWXRETHpLNnJGS29ZYUwvVHdHU09GMy9q?=
 =?utf-8?B?akMzNVh4NnM3WjRDdHhrSDlpbUw0UkZ2d2J6dHc3d01IdTNUUkk0djlodml4?=
 =?utf-8?B?YWFRU3R2TW84ZWFOQzBYMUpJNUFNMC9ycTl5R2IvTy81aGIyRVF6eGhMMXcz?=
 =?utf-8?B?emFNOXp3THNGZmo1TTdKUlZIaW9ERk92b3VCcHRjalprcldvYnJ5RGdHb3o4?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61224cb3-7996-4ea9-a0a3-08dd3eb7ee16
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 09:49:45.3580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9D5bZBX6LKyFBFtaqkRy4RDdi6EZ2NL+KQGNXW+qTnrKqdd32KZ6OvlybiIFb2uMnsFjdS2tMANF4WkXVwuxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6828
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

Hi Kunal,

PFB comments.

On 15-01-2025 01:02 pm, Kunal Joshi wrote:
> This patch introduces subtests in kms_feature_discovery.c
Remove "this patch" from the commit message. Same implies for other 
patches too.
Commit message should be in imperative mood. File name can be removed, 
its implicit from
subject.
> to validate both UHBR and non-UHBR link rates over SST
> and MST configurations. It adds four new subtests
> (uhbr-sst, uhbr-mst, non-uhbr-sst, non-uhbr-mst) that check if
> the link rates match the expected UHBR or non-UHBR capability
> and whether the outputs are MST or SST. The new test logic
> integrates with recently introduced helpers
> (kms_joiner_helper and kms_mst_helper) for display
> setup and pipe assignment. The meson build script is also
> updated to compile these helper sources for kms_feature_discovery.
>
> v2: Add definition for UHBR_LINK_RATE
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/kms_feature_discovery.c | 177 ++++++++++++++++++++++++++++++++++
>   tests/meson.build             |   4 +
>   2 files changed, 181 insertions(+)
>
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index 5bca9ad76..48e655c6d 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -42,6 +42,8 @@
>   #include "igt_psr.h"
>   #include "igt_sysfs.h"
>   #include "igt_types.h"
> +#include "intel/kms_joiner_helper.h"
> +#include "intel/kms_mst_helper.h"
>   
>   /**
>    * SUBTEST: display
> @@ -71,10 +73,164 @@
>    * Test category: functionality test
>    *
>    * arg[1].values: 1, 2, 3, 4
> + *
> + * SUBTEST: uhbr-sst
> + * Description: Test we can drive UHBR rates over SST.
> + * Functionality: feature_discovery, uhbr, sst
> + * Test category: functionality test
> + *
> + * SUBTEST: uhbr-mst
> + * Description: Test we can drive UHBR rates over MST.
> + * Functionality: feature_discovery, uhbr, mst
> + * Test category: functionality test
> + *
> + * SUBTEST: non-uhbr-sst
> + * Description: Test we can drive non-UHBR rates over SST.
> + * Functionality: feature_discovery, sst
> + * Test category: functionality test
> + *
> + * SUBTEST: non-uhbr-mst
> + * Description: Test we can drive non-UHBR rates over MST.
> + * Functionality: feature_discovery, mst
> + * Test category: functionality test
> + */
> +
> +/*
> + * DP Spec defines 10, 13.5, and 20 Gbps as UHBR
> + * So considering all below as NON-UHBR
>    */
> +#define UHBR_LINK_RATE 1000000
>   
>   static igt_display_t display;
>   
> +static void setup_planes_fbs(int fd, igt_output_t *outputs[],
> +			     int output_count, drmModeModeInfo * mode[],
> +			     struct igt_fb fbs[], struct igt_plane *primarys[])
> +{
> +	int i;
> +
> +	for (i = 0; i < output_count; i++) {
> +		mode[i] = igt_output_get_mode(outputs[i]);
> +		igt_info("Mode %dx%d@%d on output %s\n",
> +				mode[i]->hdisplay, mode[i]->vdisplay,
> +				mode[i]->vrefresh,
> +				igt_output_name(outputs[i]));
> +		primarys[i] = igt_output_get_plane_type(outputs[i],
> +				DRM_PLANE_TYPE_PRIMARY);
> +		igt_create_color_fb(fd, mode[i]->hdisplay,
> +				mode[i]->vdisplay,
> +				DRM_FORMAT_XRGB8888,
> +				DRM_FORMAT_MOD_LINEAR,
> +				0.0, 1.0, 0.0,
> +				&fbs[i]);
> +		igt_plane_set_fb(primarys[i], &fbs[i]);
> +	}
> +}
> +
> +static bool fit_modes_in_bw(void)
> +{
> +	bool found;
> +	int ret;
> +
> +	ret = igt_display_try_commit_atomic(&display,
> +			DRM_MODE_ATOMIC_TEST_ONLY |
> +			DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (ret != 0) {
> +		found = igt_override_all_active_output_modes_to_fit_bw(&display);
> +		igt_require_f(found,
> +				"No valid mode combo found for modeset\n");
> +	}
> +	return true;
> +}
> +
> +static void do_modeset(int fd, igt_output_t *output,
> +		       bool mst, bool uhbr)
> +{
> +	int output_count = 0, n_pipes = 0, i;
> +	uint32_t master_pipes_mask = 0, valid_pipes_mask = 0, used_pipes_mask = 0;
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	drmModeModeInfo * modes[IGT_MAX_PIPES];
> +	struct igt_fb fbs[IGT_MAX_PIPES];
> +	struct igt_plane *primarys[IGT_MAX_PIPES];
> +
> +	for_each_pipe(&display, i) {
> +		n_pipes++;
> +		valid_pipes_mask = valid_pipes_mask | BIT(i);
> +	}
> +
> +	if (mst)
> +		igt_assert_f(igt_find_all_mst_output_in_topology(fd,
> +					&display,
> +					output,
> +					outputs,
> +					&output_count),
> +				"Unable to find mst outputs\n");
> +	else
> +		outputs[output_count++] = output;
> +
> +	igt_assert_f(output_count > 0, "Require at least 1 output\n");
> +	igt_set_all_master_pipes_for_platform(&display, &master_pipes_mask);
> +	igt_assert_f(igt_assign_pipes_for_outputs(fd, outputs,
> +				output_count, n_pipes,
> +				&used_pipes_mask,
> +				master_pipes_mask,
> +				valid_pipes_mask),
> +			"Unable to assign pipes for outputs\n");
> +	igt_assert_f(fit_modes_in_bw(), "Unable to fit modes in bw\n");
> +	setup_planes_fbs(fd, outputs, output_count, modes, fbs, primarys);
> +	igt_display_commit2(&display, COMMIT_ATOMIC);
> +}
> +
> +static bool run_link_rate_test(int fd, igt_output_t *output,
> +			       bool mst, bool uhbr)
> +{
> +	bool is_uhbr, is_output_mst;
> +
> +	igt_display_reset(&display);
> +	igt_reset_link_params(fd, output);
> +
> +	is_output_mst = igt_check_output_is_dp_mst(output);
> +	is_uhbr = igt_get_max_link_rate(fd, output) >= UHBR_LINK_RATE;
> +
> +	if ((mst && !is_output_mst) || (!mst && is_output_mst)) {
> +		igt_info("Skipping %s as test expects %s output and output is %s\n", output->name,
> +				mst ? "mst" : "sst", is_output_mst ? "mst" : "sst");
> +		return false;
> +	}
> +
> +	if ((uhbr && !is_uhbr) || (!uhbr && is_uhbr)) {
> +		igt_info("Test expects %s but output %s is %s\n",
> +				uhbr ? "uhbr" : "non-uhbr", output->name,
> +				is_uhbr ? "uhbr" : "non-uhbr");
> +		return false;
> +	}
> +
> +	do_modeset(fd, output, mst, uhbr);
> +
> +	if (uhbr)
> +		return igt_get_current_link_rate(fd, output) >= UHBR_LINK_RATE;
> +	else
> +		return igt_get_current_link_rate(fd, output) < UHBR_LINK_RATE;
> +}
> +
> +static bool test_link_rate(int fd, bool mst, bool uhbr)
> +{
> +	bool ran = false;
> +	igt_output_t *output;
> +
> +	igt_skip_on_f(!is_intel_device(fd),
> +			"Test supported only on intel platforms\n");
> +
> +	for_each_connected_output(&display, output) {
> +		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> +			ran = ran | run_link_rate_test(fd, output, mst, uhbr);
> +		else
> +			igt_info("Skipping non DisplayPort output %s\n", output->name);
> +	}
> +
> +	return ran;
> +}
> +
>   IGT_TEST_DESCRIPTION("A metatest that checks for \"features\" presence. "
>   		     "The subtests here should only skip or pass, "
>   		     "anything else means we have a serious problem.");
> @@ -177,5 +333,26 @@ igt_main {
>   			}
>   			igt_require_f(ret == 0, "No DP-MST configuration found.\n");
>   		}
> +
> +		igt_describe("Test we can drive UHBR rates over SST");
> +		igt_subtest("uhbr-sst")
> +			igt_require_f(test_link_rate(fd, false, true),
> +					"Didn't find any SST output with uhbr rates");
> +
> +		igt_describe("Test we can drive UHBR rates over MST");
> +		igt_subtest("uhbr-mst")
> +			igt_require_f(test_link_rate(fd, true, true),
> +					"Didn't find any MST output with uhbr rates");
> +
> +		igt_describe("Test we can drive non uhbr rates over SST");
> +		igt_subtest("non-uhbr-sst")
> +			igt_require_f(test_link_rate(fd, false, false),
> +					"Didn't find any SST output with non-uhbr rates");
> +
> +		igt_describe("Test we can drive non uhbr rates over MST");
> +		igt_subtest("non-uhbr-mst")
> +			igt_require_f(test_link_rate(fd, true, false),
> +					"Didn't find any MST output with non-uhbr rates");
> +
>   	}
>   }
> diff --git a/tests/meson.build b/tests/meson.build
> index 6418899ca..851ca8fa5 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -366,6 +366,10 @@ extra_sources = {
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_feature_discovery': [
> +		join_paths ('intel', 'kms_joiner_helper.c'),
> +		join_paths ('intel', 'kms_mst_helper.c')
> +	],
>   	'kms_joiner': [join_paths ('intel', 'kms_joiner_helper.c')],
>   	'kms_dp_linktrain_fallback': [join_paths ('intel', 'kms_mst_helper.c')],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
