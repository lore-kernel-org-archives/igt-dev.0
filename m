Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D558EE77188
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 08:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBFD10E34C;
	Thu,  2 Jan 2025 08:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKv6kmJo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AA210E34C
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jan 2025 08:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735805597; x=1767341597;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=spXRKXb9k4cNSBi7/x1rn6tdOAIpYIqHZYpO/6YvHx4=;
 b=YKv6kmJoyaz9AIdyeDMqRM2AJS0wWLdDyLW/WAzmNtohlgLh0N2y/o2W
 GgPbQXgKGxpRwYExXSsFnnRIgi5ufmBiP0zBNhMatQaMRpaYjmy4m857+
 o7+Ad67jhxS1AHMbmkfOLWKgYOzO2x5B0J5d8rEupa2VFZtDEupDiWKaE
 RpQCNYOaTN2oyC+hb12dF4+EcsjaBEJOUl1sOhCVb7xFMtYMZoqrvceFR
 kBEi+JCGMrTrI9gFBoR36F9iwlLSNU4qbmHCyeO3IShyzqECmAqLDQFP/
 Ykgn00W6uyWQnCdFR3d/UvADWXnZUj+RsNvkinA4cUnJLRVVufFEsdhb8 g==;
X-CSE-ConnectionGUID: jDvx84ISS92LXNPVATFNMA==
X-CSE-MsgGUID: 6z4xzqcPSoaOjL5kswrIlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35937809"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; d="scan'208";a="35937809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 00:13:15 -0800
X-CSE-ConnectionGUID: zGAzEVIGQ0yw41q8X3P2Cg==
X-CSE-MsgGUID: asSM79KqRjyqcI2xJeF34A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; d="scan'208";a="101876824"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2025 00:12:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 00:12:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 00:12:54 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 00:12:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koQfhYcIRo4ZDjJb3Jhh8A5cVdRy5ZGEU2LrHh9FkZwvrIjkjwOKZwugoG0CeO/s+UJocubZRHn5gueCXjDhFwobcR+GFvjirj1z04ynNXyJ+5f5xpu1w9mViHVq82ajIUSuGLJtB6xclVRjhwr+4NuP+BrGOszO87ISN36NOYVOJdG52gTt/LRdGMaAdwtoamamUt2kRMsPSklNnpNMWAPTraGDrQFZOwVi/x8DRdCli86eI9wWjaxBTWyzEUho0cgr83dZK+ZkbXMMe/MW4F8ZGbrpgFG46g2k3qvjNpdsKvB0sjtdfMurNf1+HBqdi3PXh3QRw8prWfgQBDnvUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5k4Dv98KcWmBf9DkVcjlIUJd2/41a4pUKYUgc/xdl3s=;
 b=OSGQ1Wiz0R/kqJzDL8NtKomPmNQgANeVz7ZaYhzu6v166q3514Eym5jntXRW+nATzVchQ3InIXKhIUyAbUkiWzZxf3nJxktkg0AW1kO2f8MCEXQac6fcFUovLGXfnIaNZM6HNYxPA3ShKItKu6pUWeUiScN+jcEiicoDzdz+in1FNdQTKaNpxd/7ovj+uOu1RJAhzNEfWLwd/urQA2e3BCVLItAhkTjQMYp9HsiAe3+SdM9y+9ZqU8ZulT7plFj6OVt30LoLrEA5ZePJOKhPUalzDckzb3hS15jmDi9ZdTOh7ehfgnh/kOUVACEgAczGUh7/Y/Mm4e/myeEuoCEUcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 08:12:48 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8293.000; Thu, 2 Jan 2025
 08:12:48 +0000
Message-ID: <b8b3757a-00db-4221-9f7d-b06b70c826b7@intel.com>
Date: Thu, 2 Jan 2025 13:42:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v2 6/9] tests/kms_sharpness_filter: Add dpms/suspend
 subtests
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241231130241.69689-1-swati2.sharma@intel.com>
 <20241231130241.69689-7-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241231130241.69689-7-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::22) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd2532b-dc1c-42f6-96b7-08dd2b053eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmtnQmVYdG5nZ255ZUNRYlJJUnBCdWJ1NDgzcFhsMXlBU2ZSZ0RXc0w4RWJX?=
 =?utf-8?B?U01sbi9iVDlsd0NKSVZkci9zZms1b2tKcXpyS1ZneWJHWDBuVFRiaDlSYlNp?=
 =?utf-8?B?V3VlNkNvUmtGMm80U2VHcWs2Tk5wVG1QdVY2RUl6dTdoNE5RTkU0OXE0RGJ1?=
 =?utf-8?B?KzVCLzZ0UHYycGZsRnNHcU5FOCt1dDN5OVlUR21RQ3JZS016TUVvZyt0N2Rv?=
 =?utf-8?B?M1NwekpIaUhicmFmQ3NRK2JSNTZnZi9TN09PNDlEVGo0bHh5Mk4yQmZYZ0ND?=
 =?utf-8?B?MUhmelV5cGtsVCsreEpNd015VGNnNUFwS3E4WHZjQ1ZGMnc3M2JyTXF4UHdu?=
 =?utf-8?B?K2NCTVVGaWRhZmJsejdFWUQvTHdUajVOeGt0WGxRbHRHQ0EyaEZkVkhTdFJS?=
 =?utf-8?B?cmRwMnhZS0ZWVUs3MTVubmRJVDVqdVoxNEJZd2lFRGhuaGswZ0UwcTZEUlhy?=
 =?utf-8?B?V0I2U29STm1sKzFURHd0eWk0bEpjSU40RzU3YkE4eGV6WGEwdjRUMWN0SldT?=
 =?utf-8?B?b2ZFc2F2T1RQRUc1Z2IwMzlmZFRFQWMya09HWDE2N05obE9Xc0tOMDFrKzB3?=
 =?utf-8?B?Q1c5UnF0dUxCNFdtL1pjelRuUFJhYitlQS9BbHhGa1Z5eld2eFNuTHhjbnNy?=
 =?utf-8?B?NElIdk03YWlNemtzekxqYUFJSWxYczh1cjRnRmY1eGRKSDJOTE9yYVkxYkNi?=
 =?utf-8?B?MWFTRTh2TzlEM2NIZ2c4cWNRcGVPaUFSTGFjb3FBazRxU3hzVEpuUjRKK3Jx?=
 =?utf-8?B?blVNU2xMOFA4aEtVdllsK0h5RDFWK2Y4c0d5MG1hSm5qQ0VNV1l3TDZ1SXlZ?=
 =?utf-8?B?T2xiVkdIeFpLbjY5d0hwaUpsLy9HT2UxUHRkaG91MUxsbmRNa29ib1R0Y1l6?=
 =?utf-8?B?b283aFRXQWtMRHlIazg4akxJOHcwRTdjd1luM24rQ2Rralh6aFJwd3IyYkRV?=
 =?utf-8?B?YzVOeXFoNWFEUDFQc2tSN0Fka2VBQzhjLytNejAzdVUvM0tsVHowemlTd0hF?=
 =?utf-8?B?MTZHR0FKa1o2RTRUMG1HVWdRTERNTEJtL2srV1ROenpDelQ0SVJvQTNLR1JD?=
 =?utf-8?B?THh4cDBFTzRhUUtCUFVGeTg2VnA2elNNMFJYYW5jN1ZROWZXQVo0a051Zkl3?=
 =?utf-8?B?aGhneVNiUGxYb2Q5eEhCNXhoY3hCMWhoVS94SDNibU5uZllmc0ZlSFZlTkRa?=
 =?utf-8?B?WER2R080VndKWTBXamNtNUhrWFlEcXYvUnpPTjVUTHJpMnFiV1RCQUpYOXAz?=
 =?utf-8?B?UjBnamZaSldGWnJ6YzRUamRDM251OVBhTEdOZ2NrbXptWjgvdTE1K2tDQ0kv?=
 =?utf-8?B?YS82bys2QjJNVnVPNlM2czZjRnpvVFh5NWszUm5Dd05zSms5WnFtSUhaaHpy?=
 =?utf-8?B?MnJXVWJIN3hDdEpXeEo4THYzZ29pVzhxR0tQeUlIUE9TK2ZaelhpaWl2RENL?=
 =?utf-8?B?aVlad3B2VXpoT3dnOVd1bGc5VUdCS3lhNllHci9paWxhVHMvZ2FHVHVnRm1M?=
 =?utf-8?B?ZFpzOElCSjBpN21XdFVGTWFqR3VaZ2tpRE1nb1ptMllQZlVlMzg5NWRzaGsy?=
 =?utf-8?B?cWc1dWxhd01Wc0pQSzRKMDRCRkVIZFlGcDdERldwa3hqOTVQWlJTMVVHUHBV?=
 =?utf-8?B?SGNOUTZOMnhmS2w5cnFqRnVROWRkWnFSNmcrSnVkanRKcllIRjJqZUtCb0Nl?=
 =?utf-8?B?UlY1WXVqMGQzSVptVDlEM3YrdXQyZmVCeFY3aW5OR3BhSVpIejd4K2lxbzlq?=
 =?utf-8?B?R3lXN05xQlE4Slkxd1hmc0FpNWp0dkpxaEtkbmRHVkRScTRrZEw0OHZKdTVT?=
 =?utf-8?B?V3B3UEpUZzBiY0dLUmdzZDVTK3VHWjVtU1Y2enpleEpvMXY5ZUc3WXpvODVl?=
 =?utf-8?Q?UScZBF/O9KFUE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWpQYWViTGtWRWVjUXRvYjlNUE8ySnFYQXgyRzJIbW1oL3U5VDl2MTU1SXhp?=
 =?utf-8?B?R0VsajFyUk5jd1FGWVRhcXN2bkExeGRud1JTT3ZhQVVsMXlXZ01VUzIxcG9r?=
 =?utf-8?B?aEFUOFFaK1hXS3RueC9td1ZDMEtFbGNtZGt5VnRpdUVGTHhEZWhFU1ZWNWUx?=
 =?utf-8?B?WVJsYkRSc3hFRnRQQzh1eENHOWhvaHJCa004Y1J2MXAxeXhwRFh2TVF0Z28w?=
 =?utf-8?B?bnJ1clU0WlJ2UnR3UXN1UTkxbzFESG8weFAxY01YSXo3NVVlZnprOXdyZDdH?=
 =?utf-8?B?Z051c1VuNXcvRWtYR1lYUG8wbWRJK1c2WXllY3owWTF1bStlZjB3RlIyaW5p?=
 =?utf-8?B?YkdYZ3ViMnZvK0htOXdMU1ZGbTFUeXE2OHd4ZmFPZUJHMHJESUN4K28xYUZO?=
 =?utf-8?B?a3JSNEpDemNTbU1FbEw4dS92bTZXUUEwbWFjTG8wVkhXU2E2WGE1T1kwMnRZ?=
 =?utf-8?B?WDJibVJMVVA5VmUvTDJ1a2psd0NzVFRsTkFsSzlvdkp1a3YxM21sd2RiZGhW?=
 =?utf-8?B?NFN0R004YW4xckRWNmdZV2hySU5Ga3VzbG43REYwa2pGWldXZ2diU1ZSQ3Nv?=
 =?utf-8?B?TjZCeUNDdWJkV1JrcTNGNUxYSC8rZ3JUbDhsWUx0eWxSMlZpWTBXRG1rUElj?=
 =?utf-8?B?SHBTc1VVaXRIWkxBbWxDbjdoR0xBWGYvK2JoQXo1TUVYTkd2NzVzNDlSbVN4?=
 =?utf-8?B?YWxzcTUvanNxZjBBWWJhbEM5RytsL3ptM1hZWWpudWU2czdTMGU5ZEhqanpJ?=
 =?utf-8?B?SHhsaDVIY0pRbldCQlZmOStON0ZrOU4rSE5GQ3VRUmhGSlNjSm8vOWpjVmdY?=
 =?utf-8?B?T3ZlOWdnVXRpNGFQOEovdTlMSjVrYkRydWRYMVNKQ2psTnVaYms2Ri90YnQv?=
 =?utf-8?B?QWlvZHdkS2hPemJMYnE3Z3F2YmFCVGI4UWtrMGxWL1ZQWDFMejJ0ZzBCSzJJ?=
 =?utf-8?B?QTcxSitDaHk1M0pFUTJoSXU4THRSanZ0R1UvQUhFTVZZL0lUS3ltVHJPVkNN?=
 =?utf-8?B?SE1CcmJiNkh3bG16QkpyRDM0MG91bFJqQnkyUjErV0JudlZRMWo4WjlpTXlp?=
 =?utf-8?B?M3BVeFR5ZFlaWEV5YWtuREcyb2daK2FXQlEvSFF2R1dscU92SzVyV3dRZjdr?=
 =?utf-8?B?TFcrZXpoL3BsZ0F5djVXbXlKdVowU0xqRDRuSHZSOWN1WEJkeVQzQmhtVDNP?=
 =?utf-8?B?REpsN01nT2dOTTNYcndHeVNXWXlSMW1udEllTWR3b2I5ZCtzZW1QZ2dGQWht?=
 =?utf-8?B?dXNnMktoZmVnbjEzTUwrQVJtNnh1ckhyVEd6RFA3Q3VvRmhEekVtbFNJK29r?=
 =?utf-8?B?Yi9Dd1gxeFUxRmIwWUN5MXdNUnNuYmt4MlJYdGtLa2ZtencyTjYreHFYVVU3?=
 =?utf-8?B?eVZOWGMzVTdQaVhMK2NDQjE5WUZUR01XWTlOZG5KOWh2R0s1NXBBTGYwNkRL?=
 =?utf-8?B?Y2ZLZUF3MkhmM0M3cXBqUm9KNTF2VTVHNnA0SzRrUmlGdUxwam1yUkI2Z0t1?=
 =?utf-8?B?VkpTN0dnV2RxUnNiTWh6U0xoYzdDUVkrbmtsejBGbzNpSWtoUDZoWjE3Tmx4?=
 =?utf-8?B?TDVhOXFvM0p3bTF4YTU3TUdDTU1FQ3l4aFBvSlNmREYyTUhLK2g1NnFuSVB2?=
 =?utf-8?B?YmhCU0l0eTViWjYvNVNjUnl2aEJRQjE2eG5MNTJBQzRWOW9CcVN3empUNy9W?=
 =?utf-8?B?QnN3T2dBVWMzcVFBQTRRcHVidkRNSS9SM05iY0FwRURLMFJsQUZyMnd6VkpF?=
 =?utf-8?B?bHF2YmxSbzBVektLS0Q2K3Z3Y2VXRmdtTDBCclUvblpZK3hMWEZ4dk1OaGVa?=
 =?utf-8?B?UkhVRlM4d3pWdjZVSWprMUovelhkbHgrVHltSTF6MTdpb2RyYk9Ta21NOHUw?=
 =?utf-8?B?MjJqaXV2QjdPSEVkUVYxNUI1RWkyajZIcVVqREdjUkZ3ZXR6RzBySGxicHZW?=
 =?utf-8?B?d2dhZ0VrSmtDSmpjUDY4YUVMcnFSbVdxd3JvRVZnMkJJQ2I3UkYrbXAzYW9n?=
 =?utf-8?B?L0NZRWNXZWRJK292QW1vTGJqMFBzRW0vUml6NTFkd1NaVnV3bEd1akFZZjkr?=
 =?utf-8?B?RHFsc2hlUk5uQ05EWTQyM1Ewc3JvTTQzb1VoemtBc3RhM0Y5Q3NVRWI5Q0FM?=
 =?utf-8?B?c2NIUTlUQi9xU2puQ3AwbEhYYmtoeHBQd3lNTSt3RGsvMlFacWdNVHMzWlE1?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd2532b-dc1c-42f6-96b7-08dd2b053eb4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 08:12:48.6909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPCWq1MGlCnSesMzlmvu5fzg7BfN0Peg5k5zQBEZ42yT/jncEpygVJYvUXZl3F3YCe8d86WIRYDFNpKFKEFMHKts26AxI0Z0dnylTSWMDKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7551
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


On 12/31/2024 6:32 PM, Swati Sharma wrote:
> Add subtests to verify CASF with DPMS and suspend.
>
> v2: -Added CRC based verification (Ankit)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   tests/kms_sharpness_filter.c | 67 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
>
> diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
> index d1d6558c5..32ad7a752 100644
> --- a/tests/kms_sharpness_filter.c
> +++ b/tests/kms_sharpness_filter.c
> @@ -41,6 +41,14 @@
>    * SUBTEST: filter-tap
>    * Description: Verify content adaptive sharpness filter with resolution change, resolution change
>    * 		will lead to selection of distinct taps.
> + *
> + * SUBTEST: filter-dpms
> + * Description: Verify content adaptive sharpness filter with DPMS.
> + * Functionality: casf, dpms
> + *
> + * SUBTEST: filter-suspend
> + * Description: Verify content adaptive sharpness filter with suspend.
> + * Functionality: casf, suspend
>   */
>   
>   IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
> @@ -70,6 +78,8 @@ enum test_type {
>   	TEST_FILTER_STRENGTH,
>   	TEST_FILTER_TOGGLE,
>   	TEST_FILTER_TAP,
> +	TEST_FILTER_DPMS,
> +	TEST_FILTER_SUSPEND,
>   };
>   
>   const int filter_strength_list[] = {
> @@ -212,9 +222,12 @@ static int test_filter_toggle(data_t *data)
>   
>   static void test_sharpness_filter(data_t *data,  enum test_type type)
>   {
> +	igt_output_t *output = data->output;
>   	drmModeModeInfo *mode = data->mode;
>   	int height = mode->hdisplay;
>   	int width =  mode->vdisplay;
> +	igt_crc_t ref_crc, crc;
> +	igt_pipe_crc_t *pipe_crc = NULL;
>   	int ret;
>   
>   	data->plane[0] = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> @@ -238,11 +251,37 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>   
>   	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>   
> +	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
> +		pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
> +					    IGT_PIPE_CRC_SOURCE_AUTO);
> +		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> +	}
> +
> +	if (type == TEST_FILTER_DPMS) {
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   output->config.connector,
> +					   DRM_MODE_DPMS_OFF);
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   output->config.connector,
> +					   DRM_MODE_DPMS_ON);
> +	}
> +
> +	if (type == TEST_FILTER_SUSPEND)
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +					      SUSPEND_TEST_NONE);
> +
> +	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
> +		igt_pipe_crc_collect_crc(pipe_crc, &crc);
> +		igt_assert_crc_equal(&crc, &ref_crc);
> +	}
> +
>   	if (type == TEST_FILTER_TOGGLE)
>   		ret |= test_filter_toggle(data);
>   
>   	igt_assert_eq(ret, 0);
>   
> +	/* clean-up */
> +	igt_pipe_crc_free(pipe_crc);
>   	cleanup(data);
>   }
>   
> @@ -328,6 +367,12 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   			case TEST_FILTER_TOGGLE:
>   				snprintf(name, sizeof(name), "-toggle");
>   				break;
> +			case TEST_FILTER_DPMS:
> +				snprintf(name, sizeof(name), "-dpms");
> +				break;
> +			case TEST_FILTER_SUSPEND:
> +				snprintf(name, sizeof(name), "-suspend");
> +				break;
>   			default:
>   				igt_assert(0);
>   			}
> @@ -462,6 +507,28 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		run_sharpness_filter_test(&data, TEST_FILTER_TAP);
>   	}
>   
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with DPMS.");
> +	igt_subtest_with_dynamic("filter-dpms") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with suspend.");
> +	igt_subtest_with_dynamic("filter-suspend") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
