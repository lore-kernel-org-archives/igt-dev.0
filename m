Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F5BD12674
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 21:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F59310E6E3;
	Tue,  2 Dec 2025 21:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0nrfEK8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2BA10E6E2
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 21:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764711446; x=1796247446;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TnejUJLla7qccEndeW3J36Qp7L9fM18yZfmXzckKHx0=;
 b=I0nrfEK8dwsf1j3OPXCUlWh/WiK8JvjM0V3CQVqwm4XH6uzss3ErKJJ7
 4Be5GrwyTqHk8VBG8dTJ8R0gVIY2MbTjCsJxeJuwSA5EMCQD3wvEnhNf1
 oZDMkX1XDeoYSZiuJLk9D/RGCkR7+dfqtcuM7DGJhXD6lGdcvyWbJnspQ
 8zKJ1p0Y8wITVnRy24KO1ct7hn7ObYD4nHAQ38jdqIXWXlZiIdZjC0XYn
 PxEeK9cKZrY5nxYI3GZHsFgqEm6VB7/0gavyujWxIsbo2MBJWJBGlC2+k
 hQe8Q5QSu+qxA21aysop9RjaEmjYsdD4QsPIiLIEiSTHh6nQNfBUDem/B A==;
X-CSE-ConnectionGUID: WJ+4WrwrTuSR1KvTUNsKYw==
X-CSE-MsgGUID: HVOnpz79QuOItO5vT7TpYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66654668"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66654668"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:37:26 -0800
X-CSE-ConnectionGUID: 2iwfKqkzT8ifY27vFps0HQ==
X-CSE-MsgGUID: c9gDtFdOSy6ZvWlTjbiCjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="195283626"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:37:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:37:25 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:37:25 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:37:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2cpPpCGM8xNkgeQIbWHLpCtj7cFgVrnW1lTkYXds3y29B3mkdfY+hk5Jb/VvPUez51vDIHpRzTyTz5MIBWBSb8/1S6ZhOuPFzJoxtkc3iIy3cbQ0qGix0swUmzvfHHeejq17rhEY4BVuRorJYYq8J9+H8KRWIg//SYc8qqvbLf1TKIc/GFw+nDgfkg0wAac/RU2lMH61WLIOTCqH55EAb505oG5MH9NrL6YC6csXbqNXidf4GxZvfMYpoL5zj54ONn9w+wvcszYEhyJxdDp3L/he8FJ/M20f6QkmvdjxFmtFKgc1+r2PZMfMK3KseZPYbbcZkqg70VP5/of/dkkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fODXfF/77ch/+casGTByiwo1zcdusE2Mc6uqzq5t+/Y=;
 b=OevBaOSam7gqAmmfgszq8kPlWOSKlvNW5+TyVlDTp8R7QksQaaN1i2nmwZMsWKA/QUjDHc6jgXeKKae9VT2JVcuyOgwwhb6CQtK2itz+yVdi7/mdRa1eTLZntuMv5A7zAEEhPup13Lq0ALR/YjDNCT48kMHhCrWcVLmEhavqX0tcS3vjOcdS3nYQczm+yjcd3Wms1dgw6+AzWd4xMGGwL6NV7RacN3SqnsYpPzgrIX6ouO7n8jz5yAyX7WaD7rXTBkxYn1UEYr+YqrgceZvX/gg1k7NLhXfyH6tmotVXw6wP4nj8RBMWgZRr+xy4T5wH8BXmpwoU7zkpzkJszjkykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB7482.namprd11.prod.outlook.com (2603:10b6:8:14a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 21:37:23 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 21:37:23 +0000
Date: Tue, 2 Dec 2025 13:37:21 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 4/5] tests/intel/xe_oa: Run mmio-trigger tests on
 all OA units
Message-ID: <aS9cEab+ZLht/1HJ@soc-5CG1426VCC.clients.intel.com>
References: <20251126035012.12967-1-ashutosh.dixit@intel.com>
 <20251126035012.12967-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251126035012.12967-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0386.namprd04.prod.outlook.com
 (2603:10b6:303:81::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: a017dbf7-7872-436c-a1ed-08de31eafac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEd4TzUzTFA2RitBU2FCOFllZUt5RG5xSW1tdUV0NnA5b2xub2VqVEF4L0lR?=
 =?utf-8?B?aGZQODBHbk1BV0xQTHFhL3lQL3hJNXVWVVgrSEJyMlEzL29hdmc0ZEViUUhK?=
 =?utf-8?B?SEVDL2pxNGdTVDUrTGRnbElsVEk2ODRCWTRHY3FwZGZTcGZHOEN0ZkYzbFpQ?=
 =?utf-8?B?Qkc3bU1SZVN1TW9UM2gwcy8zaGhHYyt0cjY3MFIvRXgxbHBvbW1STUxwREVk?=
 =?utf-8?B?WlQ3L0J5RjVkelV1VWQ1YW5MNFczc1lHbnB4WE1RWForajFHTlo4amtwMVJ4?=
 =?utf-8?B?VjVuMlh4Z1VselJnY1pBZDJoTHllM1dRZHZEMDFFanFENzVSYzNveE93NWt3?=
 =?utf-8?B?TTVhdGhnYUNtdXdzRFdROHZHcTN4bWVBbVRUUEVscG9UdEYva2VyYkN2cXJL?=
 =?utf-8?B?c25vRFZlZmRDUGxuMStqVVpTeFZtVlY4RjBURWt2Q01NZ0FtY1l0WERlTEdi?=
 =?utf-8?B?YjRMZlVLODhlY0NUOHExZURFRERZd1NZaEFpc0pYUmo3amNZTHhYUGpaQjcy?=
 =?utf-8?B?NlJXL2lhQ0c5UCs4V2NiTFpiQmdUK3ZtZmtvSEJwVnYzbkJ3YTdueGRoMjRi?=
 =?utf-8?B?WjdRM0x3cTltL3FlZ0xzMDhHc0NVUnJ1aWJXL25PRVpnQW1FZEZVS2hnMFZm?=
 =?utf-8?B?VXdiSm9paXNEY1Q2d2ZnNGZxQnVUQ3NXWFpUYWU2NkFUR1B4ZUJwdURSMkxl?=
 =?utf-8?B?d0wxU2N1SXVRVkdOZFNZeTRFcmxCL25YLzljL240b0t6L2g0Q3RRMUlCbC9h?=
 =?utf-8?B?Zm1hZ2ZzQ1QycHZKTWZ1WGZqNTRSYWRML3VMSjhOZzM4dk9IVld1RXBBY3FR?=
 =?utf-8?B?WDhqckltcmJ0WWVMTk43QXBzSTN6QTRWT3p6RVlscXo5RW1RSGN0Tm1NTlNQ?=
 =?utf-8?B?Q3gySW0wWDRlRDNwcmJuUXZzME82SG9kRHYzYW9SaW5wN2RDd29iNjVKV29H?=
 =?utf-8?B?UVFhNEpPR2RSRS82MjRnLzVqVnJ1SU9mQUd5V0tJMXN0b3hWSFNpVEJsSkQy?=
 =?utf-8?B?NjhaOGw1bmFhMnFYWnA1TEFyUlRWcE9vTXVRS3lUTjIyb05hRDYrY25EYXcy?=
 =?utf-8?B?dVpVSTgvYlE1TjU3MFV2YnRqbDZScHIyK214TldtOEZiZG1ZVDJZbzc5Qm9r?=
 =?utf-8?B?WmNxQkU3cnlpanVHRCs2dFRuTUNReUg5V1ExNHVBZGFlTGxwRlhFY1FrVVls?=
 =?utf-8?B?elFQbGx4U2NMZkhuc3pXaHAxdFJVcndtckNoSHEwWVZJaENTZmdmaVREUVVY?=
 =?utf-8?B?Yy9MY0VvUkdoUDRKelZ2V01RbURwM3pMWTFHY0V5OUdsR3VRbU9Id0JMTkdr?=
 =?utf-8?B?RjR5dkkyVWcvWUZmM3pITTBNbGk1c0dPV0VreldINGtVeW5QRHdGMDVRWVpH?=
 =?utf-8?B?U0VNb0FKTCtUNVRxcnpnVm8rUFYvNUtHNzZ1cEFUNXJDZ1draEkrYWtqQTgy?=
 =?utf-8?B?SWxwZVZrRmFiMGJqN08wbjdTVnVUZVZCOWxoQXMxSnM3Vmd6QUxxZHhkZTZj?=
 =?utf-8?B?L0RjLzVWZmp1MEJnc2RhbHZlZ2tMOEE4U1R1L0QwMXJhQ2I3SnR2V3RlS256?=
 =?utf-8?B?WEoyeHVtVVg3NzRLNkF5L1Z0THFrZ0hDYWxKNVpvLy9WRFYxRlNnbjg4bDVu?=
 =?utf-8?B?QlVxbjNXZ3lMbVdvY0JMNkptcXVDTVVFK25iaXdxRi9JNmc4SnprZFlRTzlE?=
 =?utf-8?B?TG0rTzVpcE1HR3gzSUljZUgrZktnMHZSQjFxU3E0anM1d0RWbFphZXlFd0Uz?=
 =?utf-8?B?U0FlWE5ueUFyaE9VbURibVRXL1dNRnFZanBESGd5RVc0WEdFUXVsa0pUU2dt?=
 =?utf-8?B?MCtRK1hXM0FrL3JOOGM3QTB6b1VyZ3VoTWRDSFJlR2ZMZUJPM3NsN2F2M0JX?=
 =?utf-8?B?VG9uVHhUWVNONTZ4dkNIQ2ZoQ2VnM3lpd1lhZTdWc2QxR3QzWi90V2dzWHVW?=
 =?utf-8?Q?fcr6afeGe75CRh8znQzEfR+lmJkCCESS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym9OVmZuYkpMQWFrZE52QXBMenlZdDNjdEptR1l3Mk1aTlhaa0NnYlYzRE43?=
 =?utf-8?B?SkM5RDZjTkVvQnQzaWczbXJrZFRpQXNwK1ptYzhWZXhHYlk1UEpWZk1qWlBF?=
 =?utf-8?B?M2NESkpFWVRqdDQremg3TTRWUzQ2d2RueVFYWWFCNVBjWk5DL0tHbHBtMlpa?=
 =?utf-8?B?WkJKd3NYOURna1RHYndYWXdpSktsUVJLOFpmNEF6VUZhQ1pKc3lHTEZBL2Ra?=
 =?utf-8?B?Y2YyMjZZdWVsV3dzVnFuejhjN1ZGb1QyR3VmazN1UmIwbmJJbzUvYkh5bmNo?=
 =?utf-8?B?ZTlCU0lMU3NGbzBKMTFQbWVXQklWbjV1SHdhWXN5SGhxM2hIcXNqREdsWCts?=
 =?utf-8?B?NGdiZzc2RFNHdjBsaTRBLzBBd054VFdwcG84WDJ4ZlhycStVT1dSV0pzMDA4?=
 =?utf-8?B?WjdpSW5penVzQnBQbjByQ2wvSVNXQXNUVFpuWnl1UUFQU00ycUlFbmpxV0s0?=
 =?utf-8?B?Wlp6MDRNYW50aDNxYVQrSmFIRDR0NVJISHRtZThuQm1sOU9USCszWnFaempm?=
 =?utf-8?B?NlFQQWxNVGl6NVJzMWQrYkk4WmI5bjkrME9XR3NnSVlRTkNCcGJJdjBHTjR6?=
 =?utf-8?B?c1BpaHhKck9yVUN6NXpqVHZ2cjFObWthMDBuZHdXREdFSHlmYWVnQ3FENFFE?=
 =?utf-8?B?N1FqTVI4WERjNzdVTUlCWFRVa3YxbVcyTkpyUGJ6WmtUU01wMEVGK2JpZE9V?=
 =?utf-8?B?bmRIam5jY1JQbzBvT3BUOHdETDZVT0d3OEsvYW9wa1hmTGVDQkZvSDdvbklZ?=
 =?utf-8?B?SkgzQUhLdFBHRFJhZjhVd2RpRkxoaTFWbU1XaFBlbU9xOHFEVktCN08wejdi?=
 =?utf-8?B?K2JXK2ExOCtUc0x3VGVQY2xKSzVrNWVsV3VhbFJ1d1NzNmZrUFlpcFdRdm16?=
 =?utf-8?B?STIveWVCVUdDNjQzY0dmcEtoYmZ6N2xubnZBL0JyRCtoTG1IRFprMTRrZGZG?=
 =?utf-8?B?QXVDSmtrOWJQUHEwakRoUjZuVkp3M1ZuelFxNGdwWXExU1ZuSUNEemhQQVI5?=
 =?utf-8?B?cEpkbHUrTVBqcHVXNk1uSklZSWdwcFBMeXVyQTQwMXJudU9zMG1rLzZNQlN0?=
 =?utf-8?B?NVlwdDRYZlFrZklYZEZMeHcvMWtqSDNmN21WYVFiQmhBN1hIL2w5MWh1NVUx?=
 =?utf-8?B?cC9YdDhTcW1UVkNWdmwyWUVuT0ZvUXBmNFQ3aWJBRHBBbHRPRXQzajk1WFVL?=
 =?utf-8?B?cWpOTzFwQ1V2c0tKQWFwUlVOQ092L2JzZjg5eExrQ3BzVXg2aVgzd25ML0VO?=
 =?utf-8?B?YUVnWk9mMUxCdUdhdTZsU0s3YmRvK1I1YVNDWEtqVHk0N3lybTdHeXdPRUJt?=
 =?utf-8?B?SGwvL2E3NjBhRXA1dUF0c0hJMmtvMmRWSnJCOHhTT2d3ZHl0RHpiZ3FjK2xV?=
 =?utf-8?B?WWl3MjFMbkR4eWNROWIvWk5yQWszaTRGbEpaMTBoUkRPejZPcTZieTlxbE5q?=
 =?utf-8?B?RHptdklrZUoxMDhCWENseHFMWDRsK29BTlg0Z0dUbnlKempPTWpIOVZEdDdp?=
 =?utf-8?B?Wll3R3BsSmNFSGtDeUY0OHpCaGNmdU5UL3A2aUpENTNmQ0pLa1k3N0cvckZX?=
 =?utf-8?B?YjRKNThxVzdEZW1NeWFobXNKZFYrRGZzOExxVWI1b2grQjg3a3VUNW5TUjlr?=
 =?utf-8?B?MGFRUGp5eUxLb3UrbXh5b3dFMHpOWFIvRnFHQldVL01zY1paVGlMcGVaOXdP?=
 =?utf-8?B?Y25lZU1WWEk5TnBibHhPalRSZm9vbzdYY1psbENQMnlIMkFoejZJU05WQjB6?=
 =?utf-8?B?cEl2SGJoSTJ6am9CcTNPb3NwL0hTOXlERWR5cWZzcFZGSzk1ODU5MW9KdTZw?=
 =?utf-8?B?V1dHWWcrMFJXcU5Jb3E3ckp2c3hjMDJsNGMyM1huVkVnUVU1N3M0K1gvM2xv?=
 =?utf-8?B?RUdRcDJmN1YxN1dNenhWUHBZc1BSWnJFd1NodVNIZW1DcDhud05FdCtIVExl?=
 =?utf-8?B?SExqYnFvejQwUG1MVUVxcm85MjZZVnI2VkJXZFFPTFIydzkvMU96K0VTcTdL?=
 =?utf-8?B?Ty90WkU0aEZ5T0ZWWU9LYjdCamlvTkN2Q3J4YW9pbUtNV20wYkxuVmJmSHNE?=
 =?utf-8?B?V1dhOFlFWTRMVUVUVGhLbjd2eG9QRXZYWXNvSW0vc3Z0SnlEMHFqSGZXQlFz?=
 =?utf-8?B?anliY0l6aGdGUXM5cGp4Sm8wVUF3WmtRS3oxa216dU9OQ0NMOU9aSlhNVVhM?=
 =?utf-8?Q?dawbeozHVjsmYqEMGT0zmUE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a017dbf7-7872-436c-a1ed-08de31eafac4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:37:23.3779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuDcVIsARsc1B15zmUdTcEetIpynC7MQdjUvqUHYwpgIXBFpInbKD/GNUwuhlK2t32LqS8Dbwj8H4O3j0XINaJ5gyXcGw5moekQbsNRcXoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7482
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

On Tue, Nov 25, 2025 at 07:50:11PM -0800, Ashutosh Dixit wrote:
>Expand mmio-trigger tests to all OA units (rather than just OAG unit).
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Only the oa_buffer, oa_tail_ptr and the oa_mmio_trg are needed, but if 
you want to retain the definition for all regs for debug etc, should be 
okay.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_oa.c | 102 +++++++++++++++++++++++++++++++++++++-------
> 1 file changed, 87 insertions(+), 15 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index c8475720c5..2f966e808f 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -73,9 +73,7 @@
>
> #define OAG_OASTATUS (0xdafc)
> #define OAG_PERF_COUNTER_B(idx) (0xDA94 + 4 * (idx))
>-#define OAG_OATAILPTR (0xdb04)
> #define OAG_OATAILPTR_MASK 0xffffffc0
>-#define OAG_OABUFFER (0xdb08)
>
> #define XE_OA_MAX_SET_PROPERTIES 16
>
>@@ -93,6 +91,24 @@ struct accumulator {
> 	uint64_t deltas[MAX_RAW_OA_COUNTERS];
> };
>
>+#define MEDIA_GT_GSI_OFFSET		0x380000
>+#define XE_OAM_SAG_BASE_ADJ		(MEDIA_GT_GSI_OFFSET + 0x13000)
>+#define XE_OAM_SCMI_0_BASE_ADJ		(MEDIA_GT_GSI_OFFSET + 0x14000)
>+#define XE_OAM_SCMI_1_BASE_ADJ		(MEDIA_GT_GSI_OFFSET + 0x14800)
>+
>+/** struct xe_oa_regs - Registers for each OA unit */
>+struct xe_oa_regs {
>+	u32 base;
>+	u32 oa_head_ptr;
>+	u32 oa_tail_ptr;
>+	u32 oa_buffer;
>+	u32 oa_ctx_ctrl;
>+	u32 oa_ctrl;
>+	u32 oa_debug;
>+	u32 oa_status;
>+	u32 oa_mmio_trg;
>+};
>+
> struct oa_buf_size {
> 	char name[12];
> 	uint32_t size;
>@@ -3901,10 +3917,10 @@ emit_oa_reg_read(struct intel_bb *ibb, struct intel_buf *dst, uint32_t offset,
> }
>
> static void
>-emit_mmio_triggered_report(struct intel_bb *ibb, uint32_t value)
>+emit_mmio_triggered_report(struct intel_bb *ibb, uint32_t reg, uint32_t value)
> {
> 	intel_bb_out(ibb, MI_LOAD_REGISTER_IMM(1));
>-	intel_bb_out(ibb, OAG_MMIOTRIGGER);
>+	intel_bb_out(ibb, reg);
> 	intel_bb_out(ibb, value);
> }
>
>@@ -3979,6 +3995,58 @@ static u32 oa_get_mmio_base(const struct drm_xe_engine_class_instance *hwe)
> 	return mmio_base;
> }
>
>+/* For register mmio offsets look at drivers/gpu/drm/xe/regs/xe_oa_regs.h in the kernel */
>+static struct xe_oa_regs __oag_regs(void)
>+{
>+	return (struct xe_oa_regs) {
>+		.base		= 0,
>+		.oa_head_ptr	= 0xdb00,
>+		.oa_tail_ptr	= 0xdb04,
>+		.oa_buffer	= 0xdb08,
>+		.oa_ctx_ctrl	= 0x2b28,
>+		.oa_ctrl	= 0xdaf4,
>+		.oa_debug	= 0xdaf8,
>+		.oa_status	= 0xdafc,
>+		.oa_mmio_trg	= 0xdb1c,
>+	};
>+}
>+
>+static struct xe_oa_regs __oam_regs(u32 base)
>+{
>+	return (struct xe_oa_regs) {
>+		.base		= base,
>+		.oa_head_ptr	= base + 0x1a0,
>+		.oa_tail_ptr	= base + 0x1a4,
>+		.oa_buffer	= base + 0x1a8,
>+		.oa_ctx_ctrl	= base + 0x1bc,
>+		.oa_ctrl	= base + 0x194,
>+		.oa_debug	= base + 0x198,
>+		.oa_status	= base + 0x19c,
>+		.oa_mmio_trg	= base + 0x1d0,
>+	};
>+}
>+
>+static struct xe_oa_regs oa_unit_regs(const struct drm_xe_oa_unit *oau)
>+{
>+	switch (oau->oa_unit_type) {
>+	case DRM_XE_OA_UNIT_TYPE_OAM: {
>+		const struct drm_xe_oa_unit *first_oam_unit =
>+			oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAM);
>+
>+		igt_assert(first_oam_unit);
>+		if (oau->oa_unit_id == first_oam_unit->oa_unit_id)
>+			return __oam_regs(XE_OAM_SCMI_0_BASE_ADJ);
>+		else
>+			return __oam_regs(XE_OAM_SCMI_1_BASE_ADJ);
>+	}
>+	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
>+		return __oam_regs(XE_OAM_SAG_BASE_ADJ);
>+	case DRM_XE_OA_UNIT_TYPE_OAG:
>+	default:
>+		return __oag_regs();
>+	}
>+}
>+
> /**
>  * SUBTEST: oa-regs-whitelisted
>  * Description: Verify that OA registers are whitelisted
>@@ -4034,6 +4102,7 @@ __test_mmio_triggered_reports(const struct drm_xe_oa_unit *oau)
> {
> 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	const struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
>+	struct xe_oa_regs regs = oa_unit_regs(oau);
> 	uint64_t properties[] = {
> 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>@@ -4078,18 +4147,18 @@ __test_mmio_triggered_reports(const struct drm_xe_oa_unit *oau)
> 	buf = mmap(0, default_oa_buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
> 	igt_assert(buf != NULL);
>
>-	emit_oa_reg_read(ibb, dst_buf, 0, OAG_OABUFFER);
>-	emit_oa_reg_read(ibb, dst_buf, 4, OAG_OATAILPTR);
>-	emit_mmio_triggered_report(ibb, 0xc0ffee11);
>+	emit_oa_reg_read(ibb, dst_buf, 0, regs.oa_buffer);
>+	emit_oa_reg_read(ibb, dst_buf, 4, regs.oa_tail_ptr);
>+	emit_mmio_triggered_report(ibb, regs.oa_mmio_trg, 0xc0ffee11);
>
>-	if (render_copy)
>+	if (render_copy && oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAG)
> 		render_copy(ibb,
> 			    &src, 0, 0, rc_width, rc_height,
> 			    &dst, 0, 0);
>
>-	emit_mmio_triggered_report(ibb, 0xc0ffee22);
>+	emit_mmio_triggered_report(ibb, regs.oa_mmio_trg, 0xc0ffee22);
>
>-	emit_oa_reg_read(ibb, dst_buf, 8, OAG_OATAILPTR);
>+	emit_oa_reg_read(ibb, dst_buf, 8, regs.oa_tail_ptr);
>
> 	intel_bb_flush_render(ibb);
> 	intel_bb_sync(ibb);
>@@ -4141,6 +4210,7 @@ __test_mmio_triggered_reports_read(const struct drm_xe_oa_unit *oau)
> {
> 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	const struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
>+	struct xe_oa_regs regs = oa_unit_regs(oau);
> 	uint64_t properties[] = {
> 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>@@ -4174,14 +4244,14 @@ __test_mmio_triggered_reports_read(const struct drm_xe_oa_unit *oau)
> 	stream_fd = __perf_open(drm_fd, &param, false);
> 	set_fd_flags(stream_fd, O_CLOEXEC);
>
>-	emit_mmio_triggered_report(ibb, 0xc0ffee11);
>+	emit_mmio_triggered_report(ibb, regs.oa_mmio_trg, 0xc0ffee11);
>
>-	if (render_copy)
>+	if (render_copy && oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAG)
> 		render_copy(ibb,
> 			    &src, 0, 0, rc_width, rc_height,
> 			    &dst, 0, 0);
>
>-	emit_mmio_triggered_report(ibb, 0xc0ffee22);
>+	emit_mmio_triggered_report(ibb, regs.oa_mmio_trg, 0xc0ffee22);
>
> 	intel_bb_flush_render(ibb);
> 	intel_bb_sync(ibb);
>@@ -5195,13 +5265,15 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
>
> 		igt_subtest_with_dynamic("mmio-triggered-reports") {
> 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
>-			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+			igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID);
>+			__for_each_oa_unit(oau)
> 				test_mmio_triggered_reports(oau, false);
> 		}
>
> 		igt_subtest_with_dynamic("mmio-triggered-reports-read") {
> 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
>-			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+			igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID);
>+			__for_each_oa_unit(oau)
> 				test_mmio_triggered_reports(oau, true);
> 		}
> 	}
>-- 
>2.48.1
>
