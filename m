Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDF9C35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 06:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E0D10E03F;
	Tue, 25 Mar 2025 06:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n00XTjL+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF4910E03F
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 06:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742882505; x=1774418505;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ybRyKF5u/8QzYSWMggYzkRNC6w/38EPekpoNw1On6pA=;
 b=n00XTjL+0lBIyJt+jAM1u5JKhcM86oU8H8AI2GqpAJ4L3FOisUk+g2D6
 D3X6ldBjMhx056iPv7CBCZqOkeZae/84n9BXM1hpdaUxkjANShDDJ6eKl
 M0Yookfr8OONmxMBOpjgPbRTcOa1yfO2796pGY8W0gxJBjU0ZHpsqCwkh
 K7UTzqZz6tezyKMl3tkskUSEE5G3jA9WP+pH5nI8Yt6bcjRe4aGXCOmps
 EHS0GsyOW/BnYUk/zQDjBWvTS/tLYvwVUjaQuZGu4wDOvmla9XJpuJ9Mm
 O+RAldLYXav1cLSEkCHDolxlRa3ACTWQT7t/+BVPRMUbqYmQsa/+Pxsd0 Q==;
X-CSE-ConnectionGUID: BBJ8qDlRQ52FBwIjjb07zQ==
X-CSE-MsgGUID: AswfMDr7Scye6SxqJJZRTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43347746"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="43347746"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 23:01:39 -0700
X-CSE-ConnectionGUID: w/JaanoJTaeBmiIVWAtizQ==
X-CSE-MsgGUID: IlLLKbhWQ0OjEFeMPN6oVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="125054845"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 23:01:39 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 24 Mar 2025 23:01:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Mar 2025 23:01:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 23:01:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEJsPjSJAk8haeYjKD36NOxh6LtoDT9Cbl2Vm9fAiEFZFtQ3fNsPilnJS+vBlXpMD4iyVBdepHIpY/yJiw4jW9+85CMtMbk/ov1NApC6FbB292aM0qMTDGGQHZruG7Ghkr9GU+HKa9Z8O8k6iMjeGS2/YAVrO9QpC+bKLi121N0Loh8GmyyIGmLthGFnKaPqwyTUWCxk9lEBDUDUMLsHlDWOW5Rhlc/UQbrsSjrI+cQ7zvYxUsVAxuWnlnufExHK2dW2/qajZfHnNvabF62oyPvHs5saLBCxKTUwN9XvYNiNu59h1/pRtoczkkGlQoUh1hg+r89ScXdVwv75TgbPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yc7pQvuwhPVahP5gYvxbzkN3t00dpJgNVfYSxlRgMoU=;
 b=MrMopX/DTFyVJwGIrOcgtCeN2vwXI2EKmQIYIfQX3W+IxUQKruS1T5apr4OgVnCH/hUVnvsPu6bUgDLpqUV8aP1v8qsX/JN9kpgGneibT8Ua6KLdo9HQUPXPTbaNCrLuTm8UyjDypzw84SiuIkkqmq9UhwwwvbPDuvchCR2GM4OHKJ5vhDJbhf6rp1H4OzlUPOs3/AvwM6Ftnx+tRDu8+p9UU0X6Q+SVT4j1Zcj2AJdqcMnbWFDpzGZjxsebek9DpZyF/y19M95DHBOdcjTqRVpMgDwN/3UNhhikMIbQf5RQCicXzV2OOzTZFSjs/UxftLagb0CAn+MwQ3NB2X+sMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 06:01:35 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 06:01:35 +0000
Message-ID: <2e9ff80e-b7f3-44c0-8d37-fcdbe85d6b68@intel.com>
Date: Tue, 25 Mar 2025 11:31:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_color: Enable ctm-limited-range subtest
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20250214161011.363157-1-swati2.sharma@intel.com>
 <Z699roJnvD0kO4Ne@intel.com> <7f66b930-2061-4204-934c-fee454992ae9@intel.com>
 <Z6-v-I4F2Os8vXCa@intel.com> <0b46c164-bc94-46ce-a6be-50c18d95a718@intel.com>
 <Z9QqZTuTZKiK_4CJ@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <Z9QqZTuTZKiK_4CJ@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::15) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ0PR11MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5b2fac-ae0d-4e3e-50bf-08dd6b627fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NS9FM0pIaTNiV1ZndCtjaVkreTVtbnFPZTlxaEFQYnphYjc0R3RtbWlRTVZx?=
 =?utf-8?B?dTJUWW4weC9Rd0U3djM1am5JdnpyRFlLOW9iM1Q2OW5DeUtOd2lzcUJLYlBR?=
 =?utf-8?B?bWFoeC8xLzF5dE9qRXhwdGh2eFZ6bVorWXVMM0lsT0xyRjNKZUVCNTd1WnVx?=
 =?utf-8?B?RHN3RkgxblpFeGpUdVJlK3orM3Ayd2FPVkpoUHpBLzhoRTRPOW80Y2pkemV4?=
 =?utf-8?B?TklMTlkwU0J0RjhiZTkzWUhJc3ZPdS9PKzdta3lTWGsyQUl2dFBuaWlock9O?=
 =?utf-8?B?ZTc0alp1V0NUc2w3MVV6ZzA3QTVwZm9tMm9lMHdaV01hZkNYekZSY0lDRDlW?=
 =?utf-8?B?dzYxcExRdTV1WHhvL09RcGNCQjhZakk0c0VxUUVZeityZ0JxT3FCUTNIc3hK?=
 =?utf-8?B?bkYvdXNWSjk5cWFuYlJ4cFAzd29lRU43M0ZlRzkwVmN0a0pQZ2dzOFgxZ2l5?=
 =?utf-8?B?WFgva1MvOEk4bmJ1TUZEcEdlM2lVUjlLMFZVMm5LL29vdVNIa21HQVd4Zy94?=
 =?utf-8?B?b1FUOXRMOVpyc1ZqbnNMVVU2bjFjdm5mV2FwSmZwbEEwQjliZ1J5VVJFeDZZ?=
 =?utf-8?B?ZURmZDBMayszSWpTK2VLeisxb2JmRmtCeXFNT0ZBUjFqV3AwRVJvdEFMeU1G?=
 =?utf-8?B?RWxEUElPVkE1MkR3anhlR3haQjVreE5MbzVUbWkwRWQycDk5ZDNRSzNZVHpI?=
 =?utf-8?B?eGJ0aW9tMFNkdnRpRTAvQk9ValNvY2Vvd1lBU0pvMUVwMXZ4NFJqeExtMzUr?=
 =?utf-8?B?MVRxMlVoR3ZHRmFzTnpvMTRDUEg5SmZyYlJCazVxa0hCT3hyYlJQbFMyNGcv?=
 =?utf-8?B?NE9ESi9MZ3hXZWsxUjZpME9nOTcwaDJ2MytOdUF6VWtUY1FWMU9GbEg1TWR4?=
 =?utf-8?B?VHluVjBaUm5TdmVDVU9USWhrM292RW8xNEZRaStZeTgzMEJpQ01hZWNOU1Fx?=
 =?utf-8?B?M1JndGJaWTRTUGlsUytMRGI3R0dhM3NWRi8rMEdoVG40WVNUUUl5cTBBUWhV?=
 =?utf-8?B?K1RyZW5QdlVSZVdoRUZ3WjRNZ01ac2lnaEpSaTVEYnhvMTc0aDcwSS8wNUdn?=
 =?utf-8?B?UTZDNXVpNjlKMWo3QWRSZHY0Sm9qRGphbGNTenZnNENRanNBTnNDK3pHN3RB?=
 =?utf-8?B?RklSTWYvR0x5QTdEbzRzNlFOWWxLZDVYMzhaR2NrZUdtTFhiN3JmZVdNbDJT?=
 =?utf-8?B?RlZXdUlIbFVQak9kVzVySndjdWtESzRWQ0FQZ2hxS2dJdEErYTgyczYvTTJY?=
 =?utf-8?B?d01YV3NmQmV3MkkxSnlPcHFBUzhqYStHZ1VRcTUyUzBaVzZrYVhPWStFdlJl?=
 =?utf-8?B?c01GL1dTNW1CU3BGL3AxbTJQa1ZudFYwY3dqWndnajlPaTRzWW1JbW9leHor?=
 =?utf-8?B?VGdMRjRjZlAzc0tVNVo0U0FVVjVoOUoveG8zVHRvMUZIblFDZklCbHhWU1V2?=
 =?utf-8?B?YjZNMEV0QUQ3QzJhaC9uTDF4OUpQd3RSajhEYTJMYzRBemtYdEk1Z3k2VVJV?=
 =?utf-8?B?VHlyZ0lway83dUF2cTY1V09MWXdWNlA5Y3hOcUp2dERZMmNFOTF4U0kxYndt?=
 =?utf-8?B?SXQvK0VyVzd5M0RsMXNxZ2R3MDRSZGpHZnZiMUhkeGFMOEV5cVgvNjVYaEJE?=
 =?utf-8?B?ZkQ4YUpsbGkycEJkUUdLN0dCMndHOXZxSFJWaHlsREhmOU9UMm9hbFRUZXgy?=
 =?utf-8?B?eEh1L2txQ04xSUdhUUxROFRwVE1NeGNaKzhOM0h5SGZJUWZxSzFucEoxem5K?=
 =?utf-8?B?VWpKNjY4d2tEbC9IK0hjN2JWaWlUVm0xdTVybitvdEVZa1gxSUJOWnpxNTlo?=
 =?utf-8?B?NkpqWXRkNkVvMmk0Y0JQZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVlrdGhtU0tmaU1uU0FPQ0RIZENHZjZralBBVGRoRWRQSFd4bHVvYi9vN3Y4?=
 =?utf-8?B?UXM3dlpoRmJRT3hIbTNnSGY5bUxCcThySWp3cDVwWkV0MVUzUmlZWFgzM3Vk?=
 =?utf-8?B?UDlzNzNwak9ISGR1TTRnS0NjYUxWMnF3RHZMbTlnTUwrRVptaWRjQ1dXejl1?=
 =?utf-8?B?RGNIMHE4WjZsamkzUG9oOGZsV3YvMG1qZ2F3ekdPc0x3dE1OYjlZeU9lSVJL?=
 =?utf-8?B?bUg4aTFBZjJleUZjYTYyNkVPV1g2NFJBbVNnWTNOZEFXV3F4RzRGUFd4RU9t?=
 =?utf-8?B?VmVJWDdhZHZ2TVBqZGY4c0sya2IwT1ZIanlCbm56WmhNbThCc3RmM1c4bUJv?=
 =?utf-8?B?UVYva1V2SEdKOTY0L1VMZlRNYkVZWlNMV3RZa2ZHdzFGd09BM3RmZi9SNVNp?=
 =?utf-8?B?ZGJReldzVnVMNW13VmI3ekMzOE43cHB4OFlZZ1FhNE1lVjIyY1hCZnBYV2VF?=
 =?utf-8?B?cDVFeFFGRTNUVHF2clJubnNRVXBzVmlYTVA0TXJJUG9lOTRKU2hZK1B0RTlP?=
 =?utf-8?B?NmtUdjl3T0Y5RXlCQmdhOE9Zblo4cHhoUkRYK0Q5eE01TDhGb3ZUbFA0SHZX?=
 =?utf-8?B?SW5ETk55Z0gzcXhTd0xGcDNYV3BMSnlmRG4yd2xmMG54MEszMTFvdExucUdy?=
 =?utf-8?B?cThCaDI2TUl2WThwUm9FV0lDN3Vzbi9nR2FxT1d4aTlPVjFaNjRtV1NtV3Zh?=
 =?utf-8?B?b09NR1NUemJhekRjM3NpQ2RJa1VkMEI3cE1pQ2Nzd2JDVkZ4WFBuQjZtZFdn?=
 =?utf-8?B?bHVWM0xodnpjTzRtMllhNEpNZnJTYVRYT2tCWFhGQmhmNW9ibURzZk5IS3Vn?=
 =?utf-8?B?My9oOXRSVTdkTXhiY0tsMSs3T1ZpaGM3NXFEM01JZGQ2ekZxdDRHMHBaR0hU?=
 =?utf-8?B?RHdrVlZ2Q2FNMWc5aDAxekNGWjdiT0lYWnJReWdGMlE4dElVVzVoaG8wbU5P?=
 =?utf-8?B?TnNyc010d2lRVUZhSXdXSUlzWmI5RUFPQnFJdHhRb2NhYkhaZ3FzN09yMTc5?=
 =?utf-8?B?ZVArM1BTWHkwVlBkWHZoMmVpMVFDemw3SWRoOVZOaStBZ3pxdFp0MGFadEVa?=
 =?utf-8?B?Yk90NnZmS1c5cHpLQzQ3dG5mVGlJK1JweVl5aFJOcjRkYnZhOUEydXBmbDV4?=
 =?utf-8?B?c21xWnBINjVaU2NFdmY3YlQ2NW5Ud3dFQkJHZm9VMjUzNEdxRkR3TjR4OExS?=
 =?utf-8?B?OHdzL21iTFdoV0pFekJRT000akF2VVlLeFBsbkJ2azkva0toclZzK002cEpL?=
 =?utf-8?B?WWp5Q3NtK05ZTGcyVmMrYjRnUXpsWnVTV3hmTkVrRm9FSW9ad2ZldGxEZmJj?=
 =?utf-8?B?S2pkZytzQW5DUFowQkp3YTdNU294RGhSVjNnaWJWZkZrejc0bVN0TjJvS3Vx?=
 =?utf-8?B?TnVPeUZmYmdlKzdPbXVyeVVtTU1mbjlJcEdZK2Z3eTRNOGY1cDZVSTg3c2oy?=
 =?utf-8?B?cTZoakI3bVkrMVlHTElVclpFSWhvUkFoZDVjM1AwZkRnNXM4Q3N5TGhpbVFa?=
 =?utf-8?B?aGpZU0kzNVlsekhWSFdrMXNySXdXY2NqVFIxTWhzekZJa29IeXJ1N2ZPdG5X?=
 =?utf-8?B?UzlGVFcwZlN1d2U3cHlHclZrM2lCM3RpZkRHTERtRlpRT2RJdWkyMVpWSDJr?=
 =?utf-8?B?REJxZFZyaHh5d2ladS9FRTQyWThHQzJ3VkdVaWFhL3hheU9wQkRFTWxtYjdS?=
 =?utf-8?B?b2FJV0JYdGtVN2JmM21lNVNDWUN2RElhT3hBRDF0QTlsVW8xUy9HQUxabUJa?=
 =?utf-8?B?UEJORHRjbk1wOHRoTSt2L2s0VFBZL1dzSXBQY1piVERuMnV2MEx2c3JRQ0Ra?=
 =?utf-8?B?N1lxWlpMOWtqMERFSWRJNk1sVTl4M0JxRHRldGZubmRJK2szUGx6enR6ckQy?=
 =?utf-8?B?aDJPWms5RGo3dnFhVGdnaXJNZTVzZktQdXBFQVdiU2JzN2NHOHlSTndkc0I2?=
 =?utf-8?B?eDkvOTVwaVN4NWZaN2piaEpxczIxcnZucHMydkZCTWNnRVkzeFdmbEdpSVNL?=
 =?utf-8?B?TnRkMXQ0dHRwT1hWWVVJeUxwcGdwNjdvREREcHRWcTJQUHg3dFZOMS9sUTNV?=
 =?utf-8?B?QTVuNWlQcTZKenMyUHo3R1pGcG15UlBFYXFxOFRNRjNGZnNzZTBZTERFaVd0?=
 =?utf-8?B?SlkrMkQrWFQyWjdtdld1enkzRTMzL0J0eTV2NXBaUDRVdlY0YVVRK0hEcVBr?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5b2fac-ae0d-4e3e-50bf-08dd6b627fe5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 06:01:35.6595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: di9DMj8frIaydaIYoaxLhxV/ql+tI+8M1GqRHEZXsfLXN6wzRkW7H6Paoy5hmW3S5yK7WPFtYZ9+F5fbqZrrzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
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

Hi Ville,

On 14-03-2025 06:38 pm, Ville Syrjälä wrote:
> On Fri, Mar 14, 2025 at 06:04:07PM +0530, Sharma, Swati2 wrote:
>> Hi Ville,
>>
>> On 15-02-2025 02:34 am, Ville Syrjälä wrote:
>>> On Fri, Feb 14, 2025 at 11:56:27PM +0530, Sharma, Swati2 wrote:
>>>> Hi Ville,
>>>>
>>>> On 14-02-2025 11:00 pm, Ville Syrjälä wrote:
>>>>> On Fri, Feb 14, 2025 at 09:40:11PM +0530, Swati Sharma wrote:
>>>>>> This tests is currently disabled since CRC computed on Intel
>>>>>> hardware seems to include data on the lower bits, this is
>>>>>> preventing us to CRC checks.
>>>>>>
>>>>>> Let's try to enable it back and check behavior on newer Intel
>>>>>> platforms.
>>>>>>
>>>>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>>>>>> ---
>>>>>>     tests/kms_color.c | 166 ++++++++++++++++++++++++++--------------------
>>>>>>     1 file changed, 93 insertions(+), 73 deletions(-)
>>>>>>
>>>>>> diff --git a/tests/kms_color.c b/tests/kms_color.c
>>>>>> index 4b71d3dd3..c3b285b4e 100644
>>>>>> --- a/tests/kms_color.c
>>>>>> +++ b/tests/kms_color.c
>>>>>> @@ -58,6 +58,7 @@
>>>>>>      * @0-75:           for 0.75 transparency
>>>>>>      * @blue-to-red:    from blue to red
>>>>>>      * @green-to-red:   from green to red
>>>>>> + * @limited-range:  with identity matrix
>>>>>>      * @max:            for maximum transparency
>>>>>>      * @negative:       for negative transparency
>>>>>>      * @red-to-blue:    from red to blue
>>>>>> @@ -623,107 +624,97 @@ static bool test_pipe_ctm(data_t *data,
>>>>>>      * This test is currently disabled as the CRC computed on Intel hardware seems
>>>>>>      * to include data on the lower bits, this is preventing us to CRC checks.
>>>>>>      */
>>>>>> -#if 0
>>>>>> -static void test_pipe_limited_range_ctm(data_t *data,
>>>>>> +static bool test_pipe_limited_range_ctm(data_t *data,
>>>>>>     					igt_plane_t *primary)
>>>>>>     {
>>>>>>     	double limited_result = 235.0 / 255.0;
>>>>>> -	static const color_t red_green_blue_limited[] = {
>>>>>> +	color_t red_green_blue_limited[] = {
>>>>>>     		{ limited_result, 0.0, 0.0 },
>>>>>>     		{ 0.0, limited_result, 0.0 },
>>>>>> -		{ 0.0, 0.0, limited_result },
>>>>>> +		{ 0.0, 0.0, limited_result }
>>>>>>     	};
>>>>> This whole thing is fundementally broken. We can't generate
>>>>> limited range output without using the CSC post offsets,
>>>>> which are not exposed via the current CTM uapi.
>>>> We do have its equivalent test in kms_color_chamelium
>>>> and it seems its passing
>>>> https://gfx-ci.igk.intel.com/cibuglog-ng/results/all?query_key=af49bc8e4e7d1c69ce04f9a1196c167456e8344a
>>>> Is it wrong?
>>> Hmm. Looks like the test has nothing really to do with the
>>> CTM (despite the name), and instead if just uses identity CTM
>>> and puts the limited range equivalent data directly into the
>>> fb. So I guess technically it could sort of work.
>>>
>>> For the chamelium version the port will chop off the extra
>>> low bits so I guess that explains why it works.
>> I recently dumped port images of this test on chamelium. Since this test
>> is consistently passing on BMG; however failing on PTL.
>>
>> What i observed is
>>
>> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-A-DP-1-capture-ece4-ece4-ece4-ece4.png
>> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-A-DP-1-reference-0000-0000-0000-0000.png
>> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-B-DP-1-capture-ece4-ece4-ece4-ece4.png
>> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-B-DP-1-reference-0000-0000-0000-0000.png
>> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-C-DP-1-capture-ece4-ece4-ece4-ece4.png
>> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-C-DP-1-reference-0000-0000-0000-0000.png
>> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-D-DP-1-capture-ece4-ece4-ece4-ece4.png
>> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-D-DP-1-reference-0000-0000-0000-0000.png
>>
>> CRC of reference and captured images are not same. Ref is all black. But
>> still test is passing :/
>> Is test broken even for chamelium?
> Looks like it:
> 1. creates a bunch of all black fbs
> 2. manually draw limited range equivalent content into one fb
> 3. set the output to full range
> 4. commit
> 5. redraw the same fb with full range contnet
> 6. set the output to limited range
> 7  *no* commit
> 6. capture the frame and compare against the all black fbref
>
> So looks completely broken to me, and I don't see how that could
> be passing on anything unless the chamelium frame comparison code
> itself is broken.
Tried fixing the test. Can you please review 
https://patchwork.freedesktop.org/series/146647/
With these frame dumps match however CRC differs as expected.
>
>>> The crc version is more tricky:
>>> - g4x presuambly won't work because the port color range
>>>     bit won't affect the pipe crc
>>> - ilk-ivb/vlv/chv won't work because TRANSCONF_COLOR_RANGE_SELECT
>>>     doesn't seem to affect the pipe crc either
>>> - icl+ uses the output csc for the limited range conversion
>>>     so the gamma LUT lsb chopping doesn't do anything, so we may
>>>     get some differences in the low bits
>>> - hsw-glk maybe could work if we do enable CTM+gamma since then
>>>     we'll end up doing the limited range adjustment on the gamma LUT
>>>     and thus it can chop off the low bits. If we didn't enable
>>>     both CTM and gamma then the limited range conversion would be
>>>     done on the pipe CSC and thus it would behave exactly like icl+.
>>>

