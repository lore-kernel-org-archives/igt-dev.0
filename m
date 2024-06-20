Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A9BC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 21:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B769110E16D;
	Thu, 20 Jun 2024 21:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUbMro3K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2402910E16D
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 21:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718920651; x=1750456651;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iwUqDBJThmmXlPlKVLWCWYeHosBUPhNPDjyL9d5ESIE=;
 b=AUbMro3K7KUqBZCeLTBWGGFmp4Dr2FLXFpG4EFp3JtYLw4WxTcZctm9C
 HjZuKAhtvwyNwXYorDukdmzljH5AC3UtIZe0yw/uoUVBlRX43555PeVrY
 h88XQ2Um4rRHzmDodhNPeU/ilYbchEfQBo8LPC/Ovou1VaMrjxA8ch55Q
 cAUV4YtFGHS8HLYrbjYRxUNp7px4JaJqWwpwoAV8AMaDZBZeIOUTIBXo2
 ahO0Qb+EWblF1V8q4dkemD3y0h+msF1CbBOcTxuS+W1eMP5+SRb75gVXi
 eBSIGAT1Brg/ZeWviEIOe7ghlEwWbu5IFWPuD7wWIJ39A+uUR1x4JHqTY Q==;
X-CSE-ConnectionGUID: uuSZHd+FTSipmMRcaKX/TA==
X-CSE-MsgGUID: afSeHhN/RLeUcCbo4O591A==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41339507"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="41339507"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 14:57:30 -0700
X-CSE-ConnectionGUID: pt9tQSHZTPS1zgutOtmw8A==
X-CSE-MsgGUID: x50XoxUcTRWM4A+jKYCWBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="43066438"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 14:57:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 14:57:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 14:57:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 14:57:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 14:57:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiUpRzdIDA9I7z8qq/9i/ryZ16hMvTICSGFWSKbISnuZv/+scUKNeAWF5RW7lEquuT3G0utRf6GdHlTb3J+D24dkyXu96BZC97IX7ctiBuY/oBAYPF4tDhdR6kjVDwJCsNX8QcMbdy4zsv3UtRPbM3L+RXQfUu82VwUQB3hM3lzwdPDCF36iZcmQ7wfccDogk/dgDegWYiGzzReI0fms5MwhXvUrDLo90E7/3iLLfF7fmpJfYXfgnZMdDm8nqDe+Sk+EpFPRbsPDOsZ8vGN9WdYSpl3XIrP40adGV4xOYVU7KNWgn8rH9Sjyl/gPLCZ1+E6siW/Ckwyxkbp+qLb04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpj9s3g3irTB+rw/EQ8Z2EQNuSbEVp5T4V5gnpudahI=;
 b=jaYSAuIUSBkMpzoK2H9I46cXy6Os2plIyOvS21gSXcWxgSCNf47YYk7PghlOvfKDFPRGsddiNzBsSgh+vqEoDmlOyH685XCfDGJbpNw2d0mP0lgGeZmYw4BNVS+hEbnVPRmfpr7tiZNGjyw6+JRVTxs4javGXWu65/zwI76/XmwHJF2omYDTM7zwwyVzlrd+8fL7BWMM5iaS+URBgCnt971JWei811UHU2JdFAdNuqaIxym7HIaT2V5arlUwGzR2pQ+1Ie24QgEKYD9xa1Svxw+xFz6gxghcmr8wEd4tFyA1zfDzxpja/LGthWZPhPjdhrR6uVDqln/m868UHhdFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB7853.namprd11.prod.outlook.com (2603:10b6:208:3f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 21:57:23 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 21:57:23 +0000
Date: Thu, 20 Jun 2024 14:57:21 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 04/28] lib/xe/oa: Add truncated legacy Xe1 metrics
 XML's
Message-ID: <ZnSlweYKYaWkHb+p@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:303:2b::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: f5bff387-cda8-4044-9fb4-08dc9173f6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk81U0NPRTQzaWdJQ3pTQUVBdE1XKzgydUtXaXUyYnp6b3poQkVwOGptak45?=
 =?utf-8?B?QjlIQlZxbWpUMnB3QThKd1NlS0h3dHFvQThuWU1iRERGRlB1RGlpN0dsM1dx?=
 =?utf-8?B?MGhFa0piSS9NcW9xd0FaQi8weHRkSVozZWx2bWFObGs2SUhuTW1adlhGWTg3?=
 =?utf-8?B?K3JIazYrODcwVUVEbFFDeCtESzdHRldmSVRreWYwUFNiUXA1Q21sbVBsck5y?=
 =?utf-8?B?c2dXZXY2Y1pSOEtCMVN3TGxiWHdMb2psMGhQSkRJNnZ6RWNIWlFsNWlzVXZX?=
 =?utf-8?B?WVU5allUVTV0TnUrSEZ6Si9YeGp2OEJyWDlkZHczUzRkdXhPT0daTjdFRy96?=
 =?utf-8?B?bFp5ejVYVEhiRHZONWNLWWRERnEvOHMwUXZHQzdadmt0aVM3eXErbDFwQktk?=
 =?utf-8?B?enZHbDZoYnhzcFF5NUtLNVYwYnVrR2I2WlZkR2c5S1RLNjlYVEQzTmFrTVJz?=
 =?utf-8?B?MmVJZUR4U0RqUTlSbi9rSEtIWGNJUE1WM2xncFdPUVkwSzZReUR5bmczbkdO?=
 =?utf-8?B?UUdSVFlJTTQ2MWE3eFBKOEU4c2lNeFBsa3FrZk5oajFKbDBCUU9MYXRHeUMv?=
 =?utf-8?B?UkVaYnRUNGRqNUIwbU96OVpsSEdJWTF3N3NXNjNJRXVab1N5d2pPQ2RORzFN?=
 =?utf-8?B?Qmc5MHp6Q3hGK1kvMXBMSElsaGNCTDIvVi8xQnNxcDlncFJTN1Nxak1xM25J?=
 =?utf-8?B?MWZLWEpxYUV3UVJHWkZNOFVJSjVFU0ROM2pqa0hrV2RmTFQ1bEFzcEJsSVFn?=
 =?utf-8?B?b0c4WTdPaEEwUGZCaWpzS1d2TVJRMmlxZGt1UWlQZEorLzM3UDlHL0dFYk5T?=
 =?utf-8?B?U1lCTGxheHNzSEtib2JiZ3ZYYXpvQ294TmZEaXBvUmpBby9mamFhVVgzVFF6?=
 =?utf-8?B?ck43YTYwZGRwNUpoUGVNOU9ZSmdSeVZjMEswbWQ3b2sxcGZwVTlDRVJhUnhX?=
 =?utf-8?B?UHl0UmtOdC9uRHU5VkNXSEhMdHp1RkFpSS9UNmliNzBTMTBqVkFoLzNXZ1lL?=
 =?utf-8?B?T0U4V0U5ZGF1eW4wS29WRmcyZHIrZjNmdW5CcERNMUpXZmk5UHdxTjRjVC81?=
 =?utf-8?B?V3BxSzJSdXdnUGsxQU5RTWFjRjlKSGFJL3J5T1ROL1dyY013eVdFTTBxL2Vt?=
 =?utf-8?B?amlwSUIxTVVCd0xNdklUTzBkT2dObzFvazVkU283TDluVThkamMwY0F6YkMx?=
 =?utf-8?B?bDV2eGVZYjZUSG9majhUVSszMXNNUnhkNVBPNkxQZllmZDdCZEpzcGMrc0Qv?=
 =?utf-8?B?c3JhUWJESnJmK0V1YnplbjJUdEZPYVRIOUlIOHA2L0w0dVB5UjZSdG13a1NE?=
 =?utf-8?B?bURGUEZyYmwvc0l3Y2w5REVMbWVIZllUbWpmOEJiT0JCaCtSOUYvVVNiUnVj?=
 =?utf-8?B?QzM0VkJnemorYTlwVUErZmhHejRKVDlVK1FEWWt2aElmR3p6bWJxSzJYQkNR?=
 =?utf-8?B?OTBnWUtDUGNsTXdVelhWbXZ4VWQ1NFpEdFIxV09wYnJ1MFlIMzd1RFZLTmxa?=
 =?utf-8?B?ck1ZMmdQZ1VsTUR0VEVRa1JnUTFwQy9XNmlCRG9TRTFobGtTSEkyeEJWZk1i?=
 =?utf-8?B?VmlVODd5Ym1Rc2wzY08zYWRwQWtET2p4Y2lrd05YSG9PVGRxa0tPOUlMWjNt?=
 =?utf-8?B?bkl6dXp3YUpVZkZLcTZNd2taN2ZvOEYvUEtRVTVjQjgzaFEydVZHUXpkSkVv?=
 =?utf-8?B?b01XVXVTTk42OXJLeklHN0lVVEdTL1cyYVlXUkVqZ1JDWGdBQit2WEY5djdo?=
 =?utf-8?Q?0pL1tG/d63WQNN4boUgRTH1ItvIJ91go2z5EUqp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnpzejUwTE9XamNpSWZycWo1bldxa3FJR0k4T3Y5VzF2T2ZzRXFWd013MXNK?=
 =?utf-8?B?RDB6dzdHQlUyYjlGUWFuYnFQbnJUV2k3NTdOTUZyT01Fb1E2S0M3VUl2Qmox?=
 =?utf-8?B?UGc4RFJ0ZGFNQW56TzF0MlJtS1FCU0JGVnF5YjBSaG9iS1BSRk9KMlBXbjEx?=
 =?utf-8?B?OEdrTlBRZGx5RWhFa1k4ZlY5ODFaYTYxNndYVm13QlFVcit5aHNVTmZUTEZs?=
 =?utf-8?B?WGtyU2JCRGxISUZHUGpSWExYQmZHcE1uNEdXN3UvSVl3bzZLaFpybXF1aGlN?=
 =?utf-8?B?V2Jyck1iU25TSVVQUHArSStsYy9yLzdOSSs2YW1HUkdrZDNSSnpaR1dLRTVQ?=
 =?utf-8?B?dEVpVFZlaFhVaXFrUVBTL0pSeUlpalp3OW9SQ096K3dicFdJSnRHSDU2RVkw?=
 =?utf-8?B?cGx0OEhzYzU5UkdvMTJyUVFCV3c2ZjFnVWg3TFZZMFY3eXFhMEhENWF5OEd0?=
 =?utf-8?B?QTZTK2UwbTY3VWV3ZTV5MXZtbkF6K01rTHJZQ2RueEFSSWJMNGRzUHc2a0l3?=
 =?utf-8?B?ZFBGZmlabG02VWoxV240ZENKbGdlVFNTMUhBTjFBdW1sa3EzM0paTzY5U0tW?=
 =?utf-8?B?cG5ZaldWaVdqSVQwWEZjMGIvTE9DajUycTFhRXRVNURMMC9Gc3RCRmYvNVZz?=
 =?utf-8?B?c1Z2dlhkTlpZK21zNmFNK2RQV2RndmxGeFF2Nzh2SmRoMy8xaWRiMTlma3Jv?=
 =?utf-8?B?alVJYTF4S0VtQ1dxYUwzdVVOMk5Ka2k5ZXpOdi9Zbm5VZStmZkw1M3Q3N0xF?=
 =?utf-8?B?NGNzOGxoSlMwaW1makh3K1NUL1lCWXJNV2M2RVRUL3k4eUovR3YxN0trak16?=
 =?utf-8?B?ekw5WXMveHpuYzZqbFZoWm1RUU1idEZIMzYwOEtDcTZmVXFaZkZOL3hDS3J4?=
 =?utf-8?B?eVhkaHQzOHBhZ3d5K2RubnlYSCs1Z2V2dFhSYzVHSVQyN09CM05EYk1LRVdO?=
 =?utf-8?B?a3F2NEZrRlhOaTF2RjdjM0JJb3h2VnpWY1FYTkRycDk1WFNrTS9vaHJKS0Ji?=
 =?utf-8?B?YkJoUHpLeUUzR0VOUzJlZlRZYnM1dllxOUNkSkhNM2Rra3prVk1STU1HWVkv?=
 =?utf-8?B?MzNwN1N1cWY3S2l3Y3pjSkRXbHlJdXVTUGJWUzdVWDBmbWQyL0MrYmJjVjFP?=
 =?utf-8?B?VFBFWUY4S1FkNFU4NlpIK091alNXZi9yb1YvL1hmWG82ZWlZWHhTSm9aN3d4?=
 =?utf-8?B?T2lEZ0tsSy9tUVMrY0NRU2MveFRBOVd1Qk1jb3pTNVE3ZUdCQTlsUXIrV05U?=
 =?utf-8?B?VGh1YytrSThmbzViaTVUZFVRSUlxT2xreWJ6YmhPQ2RNTFpTYUNKam9yak9P?=
 =?utf-8?B?bmJhdHkvc1ZVcjVFdTY1b3grTDlURUtXRTlaT3kyZ2tobFN2TjdvbjQ3Zmpr?=
 =?utf-8?B?d2ZWMUZyNGtxQ1MwaU9oNkp3UnVCVXMvMmVoSklJZkVtTHpPM1IwRG1CYy91?=
 =?utf-8?B?Mk1BOG94QmNSb3BjZkpidU1FVjdnUTh1eGJtTE1lanRlamxETmZiN2VwMExi?=
 =?utf-8?B?Mlg5K1FUN2NqM2N3WkRzQ3J1dGx4YVZ0L2xEaDdlMzdkTlJ6Z3BFaEpqQnc0?=
 =?utf-8?B?NGtYVjNUTzFmRFNEaXM3U2pYSStTUWY5R3M0OEVlN2U3aElESXh0VUtpS2Nm?=
 =?utf-8?B?ZVB6aDhzcmcrK2hnSHJYaURmT3orMEYzM0U1Tkoyb3lqQTdJLzNkYlpTVnpP?=
 =?utf-8?B?YnYzRFpuUGpaZmthd25RcVNwb3o2aXFPRy9wYi9RVTNlaytEMzBOVEVUMFdR?=
 =?utf-8?B?czVtTlB1aERJT3dNMU1SSG9WRFByZHBXQ0RBQzMvbU1tcHpsR2d3eFdpTXlK?=
 =?utf-8?B?RjlNWGxwaWd4alhGeGFFY1pHeHhaRU90ZnhxM2RoWjlSWUJaU04rZ0sxVk1n?=
 =?utf-8?B?emhFdVNvM2c1R3NSMUwvMk5IWExsVVQvOTNzZ1FlOWxQMUJxL3dITTFaV3NK?=
 =?utf-8?B?OVFZYzg4cXBYTFhQeHBCY0RKRnlGRDZVUHFtbUViTzc3azJ6UEpzSXliSHlE?=
 =?utf-8?B?MXZvKysyYWhJZDJ3Vkc3Y2xvNC9KMXdKdmZRdWhUMTlUdG4vSy80MWc3WG5w?=
 =?utf-8?B?bTFJTmJ5RnhaSko1a25ZSGhQMVdiTEt6cDNOVHEvSWFoVzZYclRWRGsvdlBV?=
 =?utf-8?B?aDdBL1RjRUxoVlBLWXJLSVdFQlZzeVhmVEFmWnU4QnRNVW4zZEY4Si8vdHpM?=
 =?utf-8?Q?6jeK64h+jCicFZV4BgDdmzg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bff387-cda8-4044-9fb4-08dc9173f6d5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 21:57:22.9287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqbSI202tjaF0KkgaLYi2Smt/Ke0C/EsL0kzfFcQhVpI4F+k08gUA4ZgvflxrlyMqlTtV8ftGyzIKtUNjfb5H4jOlOaK78id8wpBmj8109Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7853
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

On Thu, Jun 20, 2024 at 01:00:29PM -0700, Ashutosh Dixit wrote:
>Legacy metrics XML's allow testing with Xe KMD on legacy Xe1
>platforms. However because these XML's are huge and increase compile time,
>only RenderBasic and TestOa metrics sets are included in these XML's. If
>other metrics sets are needed they can be added by copying from
>lib/i915/perf-configs.

On platforms supporting ComputeBasic, we should add that metrics. I 
think I have at least a couple tests that use it to dump EuStall 
metrics, but we can do that when those tests are added upstream, so this 
is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> lib/xe/oa-configs/oa-acmgt1.xml | 710 +++++++++++++++++++++++++++
> lib/xe/oa-configs/oa-acmgt2.xml | 828 ++++++++++++++++++++++++++++++++
> lib/xe/oa-configs/oa-acmgt3.xml | 824 +++++++++++++++++++++++++++++++
> lib/xe/oa-configs/oa-adl.xml    | 816 +++++++++++++++++++++++++++++++
> lib/xe/oa-configs/oa-dg1.xml    | 823 +++++++++++++++++++++++++++++++
> lib/xe/oa-configs/oa-mtlgt2.xml | 789 ++++++++++++++++++++++++++++++
> lib/xe/oa-configs/oa-mtlgt3.xml | 803 +++++++++++++++++++++++++++++++
> lib/xe/oa-configs/oa-rkl.xml    | 824 +++++++++++++++++++++++++++++++
> lib/xe/oa-configs/oa-tglgt1.xml | 819 +++++++++++++++++++++++++++++++
> lib/xe/oa-configs/oa-tglgt2.xml | 818 +++++++++++++++++++++++++++++++
> 10 files changed, 8054 insertions(+)
> create mode 100644 lib/xe/oa-configs/oa-acmgt1.xml
> create mode 100644 lib/xe/oa-configs/oa-acmgt2.xml
> create mode 100644 lib/xe/oa-configs/oa-acmgt3.xml
> create mode 100644 lib/xe/oa-configs/oa-adl.xml
> create mode 100644 lib/xe/oa-configs/oa-dg1.xml
> create mode 100644 lib/xe/oa-configs/oa-mtlgt2.xml
> create mode 100644 lib/xe/oa-configs/oa-mtlgt3.xml
> create mode 100644 lib/xe/oa-configs/oa-rkl.xml
> create mode 100644 lib/xe/oa-configs/oa-tglgt1.xml
> create mode 100644 lib/xe/oa-configs/oa-tglgt2.xml
>
>diff --git a/lib/xe/oa-configs/oa-acmgt1.xml b/lib/xe/oa-configs/oa-acmgt1.xml
>new file mode 100644
>index 0000000000..c08b537123
>--- /dev/null
>+++ b/lib/xe/oa-configs/oa-acmgt1.xml
>@@ -0,0 +1,710 @@
