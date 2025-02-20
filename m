Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F33DC021AD
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 06:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A0D10E8C8;
	Thu, 20 Feb 2025 06:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2zi7mlg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1053710E8C8
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 06:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740032166; x=1771568166;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vtvl9WlVuxIpwEkf/SATRsTkjmcHEKVygcGkU6AP7io=;
 b=j2zi7mlgSpwEE2y+NYEqcRML2IcqPgMqmdaHW/LK/TQf6MPKb1nmlJXu
 OamFqaOt0bz9vGhEQXZnhkpZOP+FYAC5ltLDZGRwg/C7ffk5IQlLBM+HM
 zGU8p4czOVPNwQP6uG6fMObbjz7OuGX4+RY+rQKL03NnshiDfxkGiuXaE
 e1LEGA+U696IEH5bDQwthKQa3cGUT+C+8aXQMl1P68uQEQ5eOdHqEeBNo
 eVKGTQ41re9vbdynvfbX4lOvzVPKavzyv1VsXkfA9ZiCVdkljtQlVDpLn
 On2YNR80cNN8e8cDYno1IMtDYIN9X2Ey2SOfZ3Tins5M0YsOSLZZ4W49W w==;
X-CSE-ConnectionGUID: UIxuQsfoQ+OLnZn8HI647g==
X-CSE-MsgGUID: Bv6PGy39SXiKE8SBhkDrwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="63274420"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="63274420"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 22:16:05 -0800
X-CSE-ConnectionGUID: AqcYUTC5TLq0tsdVlWcLWw==
X-CSE-MsgGUID: skNA7WGGRpC9KjhFkgxxew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="114670833"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2025 22:16:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Feb 2025 22:16:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Feb 2025 22:16:04 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 22:16:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFFrfzcgY9Iw3MuxgWumhtDyd0e/cDg+IXbe15F7Ty8ExrtadN8wWfwndkrR8asXK+WVytyrfjhuQPSwnNYcY+QQ5c3eijhOwmIqqVcKKMkFYF9lreK6kamxz7kefdFDdImO9u5WSoeorBMSddMHXzOGNVcvAqtTEHKjW9i0SuE5gEEt7dVhObXw8efLMoS48hJ7BnwgCJBgcbkqTymY7UX4g4JLiuc/snAsoA2LnFGrNLsC65ZLjGnLQQ0Uxo551+fanx5gMWpAld4znRdBwyh8r93zifouRUuaIScy8AJm7NT5Vyp4T4l2bmhMaDCBYQhGqbbXd1gbjPR5KIAOBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OYMhlT4Z3YNTR5PJD8WT6gJ7qwVHT8XSp7ebg9Ywt8=;
 b=Oc/g/3f0hr1GPDppX1+k0DnxAu7tkAk0cIMMITdUhnqvFzdHzY6ImaXOdjmBybonYWr2oz1kb6nOsyCUZxNAm0IqTWz3yroaPKFU4LsXGhN6N3LxI8wqkLcp6cY/GbvuIYDA8WYtoblmGucRth+J4UvSTupzKHN0e2Fpfo47z0XoMwua0F6PxWDltWNq8E8zWTWnPk9azW8y5Vv7o9WKKkhA7JrJsIC/L6MaV0pbYBsKTrcoYd76vPosWEo4PuRY4QZSRpNPbqku9ajqWlG4ZWZRwy2azP+1+6Wupt7L0v8w0Z2weEQ59vRoVd2FOu0GEdmdlCOJ6NV8/09P8qcung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 DS0PR11MB7407.namprd11.prod.outlook.com (2603:10b6:8:135::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.20; Thu, 20 Feb 2025 06:15:47 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%7]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 06:15:47 +0000
Message-ID: <437e8f9d-ecbf-49c9-8f07-0e30d469eb7a@intel.com>
Date: Thu, 20 Feb 2025 11:45:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/intel: Update sub-category of Xe power
 management tests
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <katarzyna.piecielska@intel.com>, <jari.tahvanainen@intel.com>,
 <ramadevi.gandi@intel.com>, <kamil.konieczny@intel.com>
References: <20250213155740.361646-1-karthik.poosa@intel.com>
 <Z659i7WFEcPS8qbQ@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <Z659i7WFEcPS8qbQ@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::16) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|DS0PR11MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3e29d8-9648-48a6-a18f-08dd51760424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUE2ME5KRnFTWkx3MFUzQ0JtWWFjNm1CU1IyaTA0QUgySjB6U0Q0RjZNODdR?=
 =?utf-8?B?L3VxZmM2Z3EvVEY1S2pKNWxYZnJvcjhLejR2ZjJ6bTIvRG1KaDlSQ29ZWTFY?=
 =?utf-8?B?MzRma0tjeEtuOUMvUUJSOEl4RXo1S0tvUHdQOXgxVTNYZUVWR0N2YjBqcmEy?=
 =?utf-8?B?MnZFMUZlZVEydVZHSFU4U1VBWWpyQ2hBOC9YaTRwU0V4U3EzOU1lcVhuaDZk?=
 =?utf-8?B?d0luZFltYnRqRDZVZTBXNTFUTXZZN09KWmRPcU1KRk4yZzJZYmZLNXZSMzdL?=
 =?utf-8?B?NHlEaVMyb0xIMGkzUmkyeCsydFo3SStKUFdoSTlMMEF2ZSsxRzhJcXRWdVFo?=
 =?utf-8?B?d2cwTStZVVZMTUl2WDl1cjVaZVUvMnhLYUVwbmVzYkU4QW1XRmsyT3FsVFZh?=
 =?utf-8?B?VmlPYTREUjkxN1cyOWtQa256eW9lcFBHMkJBQm85SVU0T3NMVEUweUdvRVg2?=
 =?utf-8?B?WVBwdGRoOFdSVmRVa0VKYk5tQUlEeE9ZZ21mcHVCT01yUU0xNDcxYm92SGo3?=
 =?utf-8?B?ZFZhYlB4SkZSUWZEc0tJTEN3a25BdUxVWVVBR1NqWE0yV09udks4UE83OFU1?=
 =?utf-8?B?TkJhUS9WSWwwSGQyWExjWUJMNXF4L3AvblJhV1NWMi9YM0xRMG9ibklvZHZF?=
 =?utf-8?B?RUIvS09MU0dPdUJueFFMeHYyQkp5UzBMSVlyRGRDMXdWbE9aclI1ZmxXbGJC?=
 =?utf-8?B?MThoZk1YNC9iYlJGZENrMEgzOFlxb2pDVXBNVEY3RmJMUHg5MjMzaVhNd1I3?=
 =?utf-8?B?cTdmNVJreHhMd3JQa043bHpKVUdablp2VGdyTnJJVU1WTnhpek5WeS90aTkr?=
 =?utf-8?B?TGQ0ZXBGS3FVc002Zzk5enBxY09mVy80R2NtdVFmWkNQb0dUZktBbDFvSHNj?=
 =?utf-8?B?cnp4ZkFuT3ZVZWVNN0RoS2xmWDlXOTlOOGJFVGZ4Q0hPMXhtc2RvdUwvaW1I?=
 =?utf-8?B?MGZHc3Vod2lvUjMvaElVODk2d215T28xcDltbEhwMURNZ1JvSFZtUU8vK3B1?=
 =?utf-8?B?NlVTRk1JZWEvbURpZlV1QkNzTlB3REtSK21TUTRWSDVhMjdPOGU1bnRKWU5P?=
 =?utf-8?B?WUFHNDVCM0oxUkIwVDNFbVNOY0I5YVJwbWZvV0V6UE4vdUFValk2OSs0cVlq?=
 =?utf-8?B?MjU1eExwTlRQNEYzNmQxQmhvRUVxTU5jV1l1ZlE0NWJxQWdWRldMb3cwZUUx?=
 =?utf-8?B?b0F5ODdRc3dCRHgwQTVadUJqZ0wvd1hTOElNbklpdkhieU1GK1N2Y2UwNzNJ?=
 =?utf-8?B?NE5LZGF6eUdPaWRRQitjcHlodmhjbW1IVHUxci9EYzMyQmhSQm1nWmhjRkIw?=
 =?utf-8?B?NVBEV2IwTmN6VDFRcjUxNy9jbkdHZ01ocjdBeVBPdkRITjA0QzZ5cFJqN0Zy?=
 =?utf-8?B?TzhZQ3hvQVI2c1hnNDR3T2ZxREVFMzRuUStNWVRJQUFZanU1dlFadHVFancv?=
 =?utf-8?B?SFRPWHh5eG5qTXZxZXp1cG5iSFoySndjTjNPVXBQL0dUZXR4anl1NjBaQWt6?=
 =?utf-8?B?bzJBNkFwK2w0NGh5QmV6OVgxMTVmRnpxam8yMkovVWRQbllBSkJ0RHJwenI0?=
 =?utf-8?B?UG9LcC9JbUJtVTB3OUJuOUJONkhIQkExV1JReGhMTEdTVjQzL1B0MEhhemJY?=
 =?utf-8?B?Ni9zMlM3b0d1aTJ5bnJtenM1bjBpWEdsU2RSODJod3NTTjRsMFJVSkp4UFk2?=
 =?utf-8?B?NzdDMXJjQjVjTDJkZ0ZZQW9hU1gwTnN1SHZpQVpJSDloVFduOGRPMlhhSElu?=
 =?utf-8?B?ZzFWWkJ3RW45U1pmVkNOUWFrU28vVUhXZFVqTUEzYzRtR0dzeDR2UE5FTjRw?=
 =?utf-8?B?d1ByUWw3dVgweHdDTERpOHhXN2NOeHlHcGlEdnVRZXpka1l3UWlPUTRSZjhL?=
 =?utf-8?Q?XWy2LaJyDrRfF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE1jeWFDbTlYV1kwK29vd3F0RFhyRHRVak5jV25yRHdLa3gybFBDejJYVkRE?=
 =?utf-8?B?blcxRDl6OSs5WkFmV2VFWkUzRnRpZGF6UUgxTHBSYXpNVU4zbTg5SjA3MTVo?=
 =?utf-8?B?R0hGa0Zmcm1PRm9HZm1jV2ZRTHE2a0VkUnV6dVlyVjFuYWpqTVp4TFdtcTB0?=
 =?utf-8?B?UkFqUnk0RmtzcURoeUplSTJjeU5QeHhVZnA3OXdNUi9NZVZBbkpDVzR0eXE5?=
 =?utf-8?B?bU4rQ2ZkQnBpUU1NVzNWY1orYTFrc0ZXbUQwZkFhc2FFdEwzMDUvZzBNMVp1?=
 =?utf-8?B?NzlYazMxb3U1b3BvUklTOFBHMVdIMU1LT3hRczdmM0h3cUNXRE0zcm1NZ3Na?=
 =?utf-8?B?YlFJcWp3RHVrVWR3N2x4SlZtRTZXUUFlV1kybGkwcTBJWEFxSnNZeitHSk9D?=
 =?utf-8?B?VVJsSlAwMWtLNVErMElISmx3UWtUTjF4YVZ1TUdDVUt1YWpiWjdHZU1WOEJP?=
 =?utf-8?B?aHdhc1RuaFRMYUdnMFd5MmFDaUhYR1QxMFhQUXAyYmlTMUcxZ25WVk0xVEEw?=
 =?utf-8?B?SDhUeEV5cUtiMUEydWROV203RjROR2lkZXNCSHZwVVh6Y2pybExjcWVmUFRO?=
 =?utf-8?B?M0JOR252Z05OM1pOb3NNbnR0dzRuVkxlTHcyT0hNTXZwTDlseU92cnpGb3Nm?=
 =?utf-8?B?U0JkTFZVZ1FVZGREbzFheTV5WGlybzdmU0tzemJGajR6TVUyakVTUmZQZkh1?=
 =?utf-8?B?cXVjVHpxZGFIeVRSNHFyVW9DVzVlZDJuelN6VGJvQkJuaHYrREpNS0w5VlFj?=
 =?utf-8?B?QkRZUW03NktqTmIrTWZUMVBFVHRoaFArY0pPUDJBMzAvaFZockVIS0RUcVZX?=
 =?utf-8?B?UWhoKzh4VktSbGFqM3RTR1FSSFkvK010TUZvRC9PMVU1djIrVGFmL3AxMHJF?=
 =?utf-8?B?c2hWNFBUcFlCUG8vaDJPc1VwTzcwbTJYNVp3VkNoSlVMc3dpdkQwL3BHb0hp?=
 =?utf-8?B?dmxnV3gyT0t1NXZRdnBIL3Z0aEFGZEhFQ0pqWlE1MEIzYUZVOXBCUTArbnN2?=
 =?utf-8?B?REhYU2RvY3BnbmpIeWs1SVBtM2VwMWhtdmdHbk5NOXY5KzR6aEkyeStXU1FP?=
 =?utf-8?B?LzBmWkJtU0V0UGF3ZlVFS3lxSk15QXZKTDJkRm4rYVd2c1hJYjlvMUVsTmg1?=
 =?utf-8?B?aXhHaVMwZmRqMFN5SnJ4MUQvQksvYzRqeDl6aEloVGx4QVNsUXcrc3FDTmcz?=
 =?utf-8?B?KzZkWm91c3hGcGxIemJkTStza2wyeG9zMURJb0pFZVlibDdXanQ5NVVva01x?=
 =?utf-8?B?K1Y4QWNLamNxU1Q1TTAxdVFSaXM0ZDJWRHJsZGxWdFZGbGdDeHFjYmtUNEgr?=
 =?utf-8?B?NlYrNHR3ZzhpVVQ3ZUlMbk5la2Nuam5WZkQySzhDUDB6UVh4SGdmNUtGQytX?=
 =?utf-8?B?bktkUEprUHcrenQxQWxQNGFDMEl3YkJhYmRFdTVlRjdqbDgvSTA3QndzZEF3?=
 =?utf-8?B?T3pUUER3cjQ0Q2xIUDNXMXYvaHlNN0ZobE9PMy92eVdXYVdDME9jZTM4Kys2?=
 =?utf-8?B?a3FWR0oyc1JaS1Y2bVVyVlIzWWVlc2t1SWIrdVZiV1RoSS95a2Y5UUU2ckxn?=
 =?utf-8?B?OEp6SGVtZnhWbWNQak5WYzJIQVR5dVVxZm82MFlrbnd2SXRvY0dlYjR6bHJv?=
 =?utf-8?B?aWhNdFNlV2c1RzJKek5QZTNwNi9HWndsSmRMYk9RZVl2T3dnbm1sTEd6VjZ4?=
 =?utf-8?B?cXhnSDNLclhFNWduV2wyZjgrOXd1VEl1NU93UitkbERjc0xqNjYvbFpwWWNC?=
 =?utf-8?B?Mk0zTHNWeTBodzhuUThJOFUrbkZJbnNjckd1Z1g3YTQxWWdyRU8rcGlWeFVl?=
 =?utf-8?B?THVuaFpJaWgvNkZlS3B2ZEJZcEw3QVgzUmtWSTdjQ0RjZ3V2WUNPSC96bktO?=
 =?utf-8?B?TklneXV1bWdXS00vbi85encrWGRTYUUwaWZCTzdrRm83dEJYV0FFV3RqNVZM?=
 =?utf-8?B?RTBXMmZtSGdTNGQzWm5iL0ZXN1NWdG1tNExpZ29uWlQ0TXI1bFNXaHowV2E3?=
 =?utf-8?B?dGJzU3hJQXE0RWVzdGFrWTdkb3RkMHA0MUdYdFNIaHNGTUJOcERYbzZiN05n?=
 =?utf-8?B?NSt0N0VBTkU2ZkZ0S1ZZQXdEajRLZnlsZmFLTEtnK3IxbUF5Y2lSUEsxRm9M?=
 =?utf-8?B?d0dVc0hYaTNIcGxSZjF1ZzAzRXBlQ2JqVndHL2NyUndZbUtDMEpKYmlETXRS?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3e29d8-9648-48a6-a18f-08dd51760424
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 06:15:47.7805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yIYCfwT+mvpYQD4vAE/cldjenPmJd90LfvZaomQHE8EY9PbdfFL6GtwWRuER4oDhSle6YINiSuMzM+UagiQOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7407
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


On 14-02-2025 04:47, Rodrigo Vivi wrote:
> On Thu, Feb 13, 2025 at 09:27:40PM +0530, Karthik Poosa wrote:
>> Change sub-category of below tests from Power management tests to below:
> Why?

These changes will facilitate tracking of sub-category tests results in 
visualization tools.

>
>>   * tests/intel/xe_gt_freq.c to Power DFS tests.
>>   * tests/intel/xe_pm.c to Power suspend-resume tests.
>>   * tests/intel/xe_pm_residency.c to Power RC6 residency tests.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   tests/intel/xe_gt_freq.c      | 2 +-
>>   tests/intel/xe_pm.c           | 2 +-
>>   tests/intel/xe_pm_residency.c | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
>> index 1fb6d2b53..e97195b1e 100644
>> --- a/tests/intel/xe_gt_freq.c
>> +++ b/tests/intel/xe_gt_freq.c
>> @@ -7,7 +7,7 @@
>>    * TEST: Test Xe GT frequency request functionality
>>    * Category: Core
>>    * Mega feature: Power management
>> - * Sub-category: Power management tests
>> + * Sub-category: Power DFS tests
> well, I know that we are not changing voltage, but DVFS seems more
> used.
> Or in other words, why DFS?
> Why not Frequency management?
Yup, Frequency management looks fine.
>
> What are these categories getting used for?
These will used by visualization tools, as mentioned above.
>
>>    * Functionality: frequency request
>>    * Test category: functionality test
>>    */
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>> index c2026474d..644680893 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -7,7 +7,7 @@
>>    * TEST: Check Power Management functionality
>>    * Category: Core
>>    * Mega feature: Power management
>> - * Sub-category: Power management tests
>> + * Sub-category: Power suspend-resume tests
>>    * Test category: functionality test
>>    */
>>   
>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
>> index f9e96d608..f0833eb0a 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -7,7 +7,7 @@
>>    * TEST: Test gtidle properties
>>    * Category: Core
>>    * Mega feature: Power management
>> - * Sub-category: Power management tests
>> + * Sub-category: Power RC6 residency tests
> RC6 is old terminology... It doesn't make sense on the Media GT.
>
> GT-C6 seems better...
How about GT  idle residency/C-states tests ?
>
>>    * Functionality: GT C States
>>    * Test category: functionality test
>>    */
>> -- 
>> 2.25.1
>>
