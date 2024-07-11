Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E0CC3DA4D
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 19:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D0A10E300;
	Thu, 11 Jul 2024 19:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJoESg/Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C1F10E300
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 19:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720727698; x=1752263698;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WfvlZ23rpJpJtqunzdi3dftJHi9QhKyDx6Yb0oB/Fl4=;
 b=LJoESg/ZeoxRo1+THAMWEKQJm62HX6ISqb6K9uiZ6YeRdlgzsCvHXPG1
 C9qO/AB9ZK5RLvMay5nzYuJX742MX2lhSFlSnXGmB2GF6mpReOuKnxDdQ
 x6vc1iN4qvt4Pz2iCyftRqRgNQDqo/PBI6Bv0X2B04B16qQhUa3mp4609
 LNnGtu2/QWLJOiCl12ErEELtqN8RdSNM/alEETPWU85Wi4DCh9qpbASqG
 Kr3/O8Wj5PCcfhMTuhOTdwYn8vv/0dMrEUNBljEAIT/MR8cl1lZmKgRIM
 F+ohAABq36XCkfF9iEESvCMZ91CPNXjbvb7GYS4lE52qqShg4Y8N3gkY6 w==;
X-CSE-ConnectionGUID: IEfdDDncTGmJkSTuUr1/GA==
X-CSE-MsgGUID: OdNCyd6kR2i/zT6ak6stQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18258823"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="18258823"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 12:54:58 -0700
X-CSE-ConnectionGUID: h3BLyKeQSgSVMoTtQK2arg==
X-CSE-MsgGUID: TCVzqMm7S3i0lDyeA6mYoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="79798614"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 12:54:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 12:54:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 12:54:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 12:54:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAu5s6oiZNVOfyxaoONJbGDIckUovIykokAOorTyVCdTMHfNkDUPP5vgwQptQNbWSwi9iVEpQitP3wCG+XfIRSyR6S5FbgeZWjtMRfSxnYp3vkqWmWzgbhqBUrVITH0HTzx0c4e2inu2mGi5S8P2ygQ8xuoDgALCu9RuUsIyf5RBHJ8zAScxo5lnMVgmITD85waMpcGUe1s53/bNY+ly3E0DXDWYnwW/ZTt+8azKIauVNceFrqTHAJNUMCUYPJsxbIWsJ2TBsPuUkYrkb2X63PEDw8hMVPacPvV8/bYtCCqPYUQJ1fSGoRDZfVyKQvEkA+WxGlwCL7YOCKx5tXtfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxIolLxdJoPzcTSmD2sB/8st9ILI6Bgr+Zm4QaOI+90=;
 b=B8whPYXBCWPonxIvN9pL1o2AKans2QP/uKvq62jMEPuuQxzweU5eEpYG/1gi2vGIIiMrYylncK+0AToSeThnGL+5P+Fchl6R1FYdNEvVI14ihsNSDEeuGYQxSJ4QqSBxHOicJ+iNIKPdBg0bRLOTQBgZvcZoyJLegATtceqkGCRVXkyOyQ7Ice/22SliO/gtImDKYcEJskEI3LXodJFwKGxyyDMhk7E3xd3HlSNuVW71+v7Hcmhm+WUS2h8fVJF/4U3ic6zVyVcoxk4V33hYTmAK0NOQ19MYXayzkdHKPptDAnRP61AKuXDHueyNTSab08T3FKW6yVcbh7t64qWafQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 19:54:54 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 19:54:54 +0000
Date: Thu, 11 Jul 2024 12:54:49 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 03/10] tests/intel/xe_drm_fdinfo: Add helper to
 read utilization for all classes
Message-ID: <ZpA4ie/7N6GwM/BB@orsosgc001>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-4-umesh.nerlige.ramappa@intel.com>
 <lzcmgzn5o7gqpzalda6gs5kahgawiuofrimvqjdlfbi7j2syn4@mchmw5yfpqz4>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <lzcmgzn5o7gqpzalda6gs5kahgawiuofrimvqjdlfbi7j2syn4@mchmw5yfpqz4>
X-ClientProxiedBy: SJ0PR05CA0183.namprd05.prod.outlook.com
 (2603:10b6:a03:330::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA3PR11MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: c008e6c4-3244-45a1-aef9-08dca1e35587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0hHRHFmdTNIWkpFTHhFRUJmN2hqYVIydVF0UmhVY0U0V3VRUlA4Vnk4eUJq?=
 =?utf-8?B?SUZLTUZWNzVnMWh6U2YrSG1GbzdIR3BjQmpDbmhPc3l5YTdKOGZQOURra3VG?=
 =?utf-8?B?TXZQT0dFNFZzL3lwWkowZGtKcFlRb0FMYUJCSk1iRHRMeHJWQWY0am1DYS9q?=
 =?utf-8?B?VDZPampPV0xKeTZmMW9UaUE4SG5rUlNIclVxcFZGdzJzOEN0MmFnV2YzMFpB?=
 =?utf-8?B?VXpnQjl4OWRkdk9scnlGWHNiMzFWeUZiYldKR0sra1Y3akpoT21mSzFVc09X?=
 =?utf-8?B?SWd0TnhxZCtSZ21vSFF1QlhIeWxPQXJXc1F1T0ZQRUp5eE1JMko0NE5pdDFU?=
 =?utf-8?B?S2czZHd3dG9Qd2RUenNlWEJQSkhwaTZBbkJqRGF1dHVmV2UrV2VJYTF3YkhW?=
 =?utf-8?B?bEZXVEF0aDFsRlhENVlpR0p2elRPWXdoL1JoN3RWTFdCVGsxaFhRMng2L3FW?=
 =?utf-8?B?Z29TQUhjMVZFTUdhK256LzBjNkVyYjdOM3h2TEJxQzNFR28yYmJpZHFTdTZa?=
 =?utf-8?B?S3U1cDdCRUVvc3I3VTB1K0Mybk5XUERWZE5OTE5rVlRTYVlqeTdkVTFnQTRk?=
 =?utf-8?B?cFBjeWI5T0o4ODIzM1ZIbm0vV24wY2dVRmFmVGdoVFY1UGJiemIwV1BPWjBO?=
 =?utf-8?B?NmQwcVhmc1B2SkZYWW5OUE1mOGY2VVdSQnE0NjlKcXl3R1VITUsrYUVsVmN5?=
 =?utf-8?B?ZWoxZmpuSFF3WWRTNnVOR1VWZ3JUOUo1Nk1tQytlR3hOQVZDejIyZEdlVTRy?=
 =?utf-8?B?Q0szOUM0MXIzMEVaSnMvQjR2Y2pkblQvT0tyUitkcXAvZFo1cUJ1SDRySnFn?=
 =?utf-8?B?dWwwN2VYWXdiblJYS0NzWi9xZlh3UHRFZFRhVUZHckJtRGtOdEFIK05ZelpW?=
 =?utf-8?B?UXNGV2RMRHRubXNyRnQzMkpudEpubDF6Q2VjTUpVSENOSHNpc3Q0QWd3cHhx?=
 =?utf-8?B?S0NEclZMRWFKa3J3MGRtNGI2YVlrbjdaNGJaR3prZEVGb1lvZ1FYd09PVmxT?=
 =?utf-8?B?bUxUUC80Q0FHamdpU0V1SFBJNStqOWhXZVhOdWlsbHR6dTVHQ05pajNKc09G?=
 =?utf-8?B?dXk0eVdnQjc3MUw2UjNQWFo1UkpXSjJKTzk3TERuSmJhV3J0bUR2SktOSlA3?=
 =?utf-8?B?WTU0cUdIQnhzTG1QaEpXNnlwd0EyTVdGTTNJQnRKMEI3dVpFM1JDWnNSSnZK?=
 =?utf-8?B?S1Zpc3ZWZFRRTlhPOUp6TXFUTWM3N05Kck5BOUQ2ZkpxOUIzWHdxaFdjRFdy?=
 =?utf-8?B?YmRzc3lyaThYTGhKRW5LYi9LK3JNNlhZTWpxc2RJYVAxUW12Wnh0ckhFZUow?=
 =?utf-8?B?N3dzT0VpV3dPUE9tZVV6aVdMQUZ3Unk5Y0EvdXdJV1hadStWOFIwSlJZREhL?=
 =?utf-8?B?Wlk1ZHNmQjBTV0I3RjkvWEQ2aGlRWCtKZ0JZWUI4K3N5OElQTWZFWGVHWGhO?=
 =?utf-8?B?WHlSQ0h4QnJ6a1pnQXZrN3NBNnlRYWlNeHA3ZHlOUFhNRFpZN3NOTUxBK0xN?=
 =?utf-8?B?eml4NzZxSXpMWDBJdlJJVVRUeGMxZm9hZmVJNW5xR0FGbEtPQkVHNEZ6ZExp?=
 =?utf-8?B?eDVmMzdaTWxOMmg2RFUwb1NrejMrblhOUFdSUUZhcitjREFMQnlTbXJsNjZP?=
 =?utf-8?B?VW1HaG9CTVZzb2tkQ1Ezazk1NDhGQVZUOTY1QXptdnZEWnZjMGtaSEx0M1lU?=
 =?utf-8?B?UlAzK0tCNjFlTzVYMWZNbDBDdDh3eUhob1U1OXlYYm56N1U3QmVSamdSNHhr?=
 =?utf-8?B?TVdndjNQQU1jWUkzcVBBUUU5RVo4R3pzNkZIRi80U2ZNT0ZzWlE0TE1oZnRU?=
 =?utf-8?B?WnV6Yk9YMTVzeHpNNkZtUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWExU3pGYjY1d25lZzlJeDB3Y1pYUU9PbDMxU1JUYU1QSFJ6WDJPNTRkTUJx?=
 =?utf-8?B?V2Q0Y3J6ZlB5UUpkWkRzbkNoOTBzeU4yVTF4eW0xVzExbkdzTE8vYUN2MURZ?=
 =?utf-8?B?L08zUVN3MW4yMEU1NzhpTXZxSDN1Tm0xWGJJelQxZE0wKzNudlpzWTcxRmJq?=
 =?utf-8?B?aGlMaC9hL3ZaN0ZBZzhlWStBOWdpcDJhVWlRb0o5WkpFd3haM2JteWdSZVQv?=
 =?utf-8?B?MmszdFBhQ0hpN01TODVQeXJGVWZObCtsMG5BZFlzQkRYNVZrUDI4UWdrMlJa?=
 =?utf-8?B?QW8yYjQ2b3VnSEx5VmswKzlDK3ZXazlqNnlmL2dEVG1GTFhkOGs3Y2tjR0dX?=
 =?utf-8?B?OXNJRXJxVExkV3AyY1M1RW1uakNvWU9EQWNTNEFsSk9sYU1MSmZGOTN0RG41?=
 =?utf-8?B?NkluVFp1UTlESkJ4YkxJVzVkRnB2alVtcERUTUxXY2ZVTEp3R2U1a2VjaFZ6?=
 =?utf-8?B?OUFrcG1ZTi9UR1kvbVN3aUJSYUFaU09VQXpkS2NQZElOay9FcFBDUTNZdktI?=
 =?utf-8?B?TUkzK1NERW92enJSTWtiZ0dqd1JRdWlob1dReHErTlRpUWR2YzFjSG42OWtn?=
 =?utf-8?B?VTZHZFVqb0t2b0l5MnR5TExQZk5sK0o0am4vdytjSi9tNUhQQTNZaS9hNGlB?=
 =?utf-8?B?RzgxZlR5aWVxTlIzdkgwbHVBMnZ2Q0xkMElTT0ZYRDh4R1pFWU5YOUhpeHJ4?=
 =?utf-8?B?MzZya0tKSm5PVVhlV0lqdE9yZXp3YjJkZkxhQ2FJa3kzenA2dWhLTU1WY0wx?=
 =?utf-8?B?aGVnWmZVR3dyaEswcytlK3JuODN4c3gzeGhrc2JBRkgrNmwzekpIMzZSUElG?=
 =?utf-8?B?eWwvTnZPVkJ1emRjUmxTQWdrTXNwcGo0WWdLcXc3clVOUTBFSWtFYnYzTlc0?=
 =?utf-8?B?anMxbHRSUWozN3dtVXBOK1JaNW9nbmFOL3FtYVRFc3MrMURMWXlTVHhBeVl3?=
 =?utf-8?B?TGZlOU5xT1haczFGMllmaEFQS0NBcWVDMGJhYWVTMGRwS2x2Tyt2V1NLWWVi?=
 =?utf-8?B?UGt2QXZOUW5yN2VRTnVRbVc4WTVwNElValR1RVIzSEJGaTFPWXA1Ry9PbTJD?=
 =?utf-8?B?RjdPVDFxUFpXaklIOWJRUGhJKzVHRFNQV2RtV2RjRkxZRWRFTzVpVjJOVlAy?=
 =?utf-8?B?NW1XVmEvWHN6OE80cTlGMWFwdnVHNDNBT2NxelBBMi9NODQ2SzJUQ0J4ZFZk?=
 =?utf-8?B?REl2VkpOS2toN08vK2JsbWp1RXh2N01IeXhxUUFkbEI0WnRSVW1oMjRJT1Q5?=
 =?utf-8?B?WnVaUWI2WVFYTm14dnlmL2pSaFB4bmtVT21nRGJMTDc3SFZKSi9TbVJmMFlt?=
 =?utf-8?B?NkJkZ2ZZanA2OWQweXJBektPVlJXdjdkdzVSN1c3R1MrWllmNWVvaHVEcklM?=
 =?utf-8?B?L2JtUFZHWXovbW9HdlJ5MnZ1UFpxNVc0cmlqaUppWk5Mb1czNFRrVW84bndQ?=
 =?utf-8?B?KzduVWN3ZmRvREtTR3podXVWSFpYMXArRTVCS1ByajNoWngyVkFVL05kc05I?=
 =?utf-8?B?czFvTm5VMzVtNFhCVjVGSHRLejJFSktSS1pIa29mTjhhR0Z4eGwxbVlNY2Ri?=
 =?utf-8?B?dkhZUHpHYUR2c0xVM3pmblhzTTlZQnEvQWxWSU5CZUxQSWRLSnpDbjdON0Q4?=
 =?utf-8?B?bHFRd3lQNFlKbXhnQk5Md3VGSHZscHp0dUMyYkhXejd5WWpDWnF6MmM1UzlR?=
 =?utf-8?B?NFJLeWEvZ0k4bTlrQUZvYUNodTczOXFEN001ODAxaWlHWnNuUjB6bDNqYmRI?=
 =?utf-8?B?ZEUzcGxkTzZTY0JaQWI2WHAyVnF6NHk1bnlhK21SV1pDUDZ2cGFYSGxyZ2Vq?=
 =?utf-8?B?QlpLT1diQkdxQURpY0NJeEpoK3FXQlpxWEFLUmRNczJ1U2JiVGd1TVcrMlVF?=
 =?utf-8?B?SWFWMmlmTFdGU0J6T1J4YnVwWjBYUU9Vbk5UdUQ5Rmhsd2lWWERWd3d0VnpN?=
 =?utf-8?B?NG50Ym5iSGtuWU95b0Q2T1Z5QXUxZ2dzaXJsbmRhT0lpd2luN25KRG9kYnhy?=
 =?utf-8?B?NFRTUUN3MGlEUDlhaXZ5S1RuYjcvWjlkZHN5SDBSMnp3TmFVSjZtSGlmWVhz?=
 =?utf-8?B?eEpDcW9TRHgwNTdPelhLU3E5dEFjTlNBSm4yZERtdXY2RkljNjEyMnVXSktq?=
 =?utf-8?B?RVFsNGtrbHAvTEJkT1MzUWNrNkdQbHg1N3ppUnZNSzYzcVZQdUZ2RGNHekd4?=
 =?utf-8?Q?0PKkE3rBqnAFWSlt3P0P64k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c008e6c4-3244-45a1-aef9-08dca1e35587
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 19:54:54.5768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQtcC0MNWeqMU/HD2b69EVazpXfzqESG20pZUysFuVy0LNFkIJmGydrDnAYZph97q4Ph/eYM7p/dja3Ca61CmSPfc6Bc6W7NPtw0C90PBWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7556
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

On Thu, Jul 11, 2024 at 08:40:46AM -0500, Lucas De Marchi wrote:
>On Tue, Jul 02, 2024 at 05:25:25PM GMT, Umesh Nerlige Ramappa wrote:
>>Add a helper that captures utilization for all classes.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>tests/intel/xe_drm_fdinfo.c | 20 ++++++++++++++++++++
>>1 file changed, 20 insertions(+)
>>
>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>index b64bef339..c697f3e53 100644
>>--- a/tests/intel/xe_drm_fdinfo.c
>>+++ b/tests/intel/xe_drm_fdinfo.c
>>@@ -42,6 +42,11 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
>>
>>#define BO_SIZE (65536)
>>
>>+struct pceu_cycles {
>>+	uint64_t cycles;
>>+	uint64_t total_cycles;
>>+};
>>+
>>static const char *engine_map[] = {
>>	"rcs",
>>	"bcs",
>>@@ -49,6 +54,21 @@ static const char *engine_map[] = {
>>	"vecs",
>>	"ccs",
>>};
>
>nit: missing newline here, otherwise:

will add

>
>>+static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
>
>I think that would be better to give the compiler a hint about the
>size of the array:
>
>static void read_engine_cycles(int xe,
>			       struct pceu_cycles pceu[static DRM_XE_ENGINE_CLASS_COMPUTE + 1])

Never knew static could be placed there. Will add.

>
>(it would not be a bad idea to have a local __IGT_DRM_XE_ENGINE_CLASS_LAST
>too, but outside of the scope here)
>
>Otherwise,
>
>// Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks,
Umesh
>
>Lucas De Marchi
>
>>+{
>>+	struct drm_client_fdinfo info = { };
>>+	int class;
>>+
>>+	igt_assert(pceu);
>>+	igt_assert(igt_parse_drm_fdinfo(xe, &info, engine_map,
>>+					ARRAY_SIZE(engine_map), NULL, 0));
>>+
>>+	xe_for_each_engine_class(class) {
>>+		pceu[class].cycles = info.cycles[class];
>>+		pceu[class].total_cycles = info.total_cycles[class];
>>+	}
>>+}
>>+
>>/* Subtests */
>>static void test_active(int fd, struct drm_xe_engine *engine)
>>{
>>-- 
>>2.38.1
>>
