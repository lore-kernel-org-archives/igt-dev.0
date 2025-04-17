Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BFFC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 05:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4523F10E97A;
	Thu, 17 Apr 2025 05:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYNAP6Dd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DE610E97A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 05:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744868429; x=1776404429;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FyHU8VzT9zDYAz6+jvsDMllD/wlSkhxJknaaHx2RKjc=;
 b=AYNAP6Dd6Eb/vtdPd4iw8w/+Xtvj0NYu0Zf6516xgzQCDi+3FJWK1o+d
 GXlq+65VZzpn6Dv1xm0jeI+4zecVAQGr30+Ei/1AKjXzzQxDqQANTfTKV
 CWhV5CE1IgqRXlrhxBIpywbhQSdhwt9wv8nJP2P3cCF5wiGYW95GE3Ez4
 pQILnQDkHS9/KZAG4Z1VmbR92xnOhZn0dp6xUzdEVWsFvG8V4kGBvZVME
 lUxKscLqnI5JXEso/3SEwtY/vT9CfA6ejxgtLmBz6LsEg3JSJMv53UAlw
 HE4B9Y7ZmSnzW2tzcQ8UuOCkr1t3TM7QgBQADiOtHSnc5jtEioGWWMxZJ g==;
X-CSE-ConnectionGUID: taIJYsilQF6QWuFrG8zoPA==
X-CSE-MsgGUID: QZ4VbZd/QU28/RsklEYETg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="49135786"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="49135786"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 22:40:28 -0700
X-CSE-ConnectionGUID: g1nr482ERwaFAVT+RJEjAg==
X-CSE-MsgGUID: oIBAVgXKTPORzfbIp43PCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131676840"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 22:40:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 22:40:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 22:40:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 22:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRqN3Ac7M8HDaawalOQqLs+GLL2Bgu2m+NV29M/DQ4UWkoHcBy+wcfHj2VabErT5M2TUEjcbpHA7xf+IoFW/TWy7HH3oPzDVvsfhplESMA8N95zQQDr2ylMZDT5u8rjLvxdvvWB2NCfThwnua3bxhgJupmQNngjqMuZuuiKJJQ0eRxqLHM/CVlrg0Bbe/A8h0FZv+p/xfgpn3QYTMHAN7diLmoz4rKe5BPKy46NuwC95vif0aPPQQYhTAfMKTRuHVCt4imxQ3sh7A4vq63W3dEGUbB7ap8xnRV0JzYXcc4oKrMjkEe38nc3AqopXrziMKX59bva7EGhASUW3mKNqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcSqWpbLtapamMKIb4UKHiQ39QeM2EW0jFvzkaswVD4=;
 b=TOmej3VNSIzZNZGDd5OQMBkDRwyKTq80tbqv4p6Fn1lwoKve798EgoHqY3nh6x/mODBLKD2HAPSNC/9BbOGWM3HBCOAjQukRzIzU5f9Fr707GyOG5EJtqdzvnAlQmz2vMy9Drcx90YiINErbtnkOhqq/uNTDEPAnjiHj0k2OboGquKU1vr/1vXmubxrrbyhzhLzwP4B4ZvHuk2+6R5/1GpC0QjK37ukHI7G/UwhMwoKPYD7QwOyV7poalJj0uu/5FrBY3iDCjvVS+axjK/3KU10dtrSAM6qRiq+Y8KCZdntTjYYXivSAyRVF/KrumYZpwMDlPPBF6oUO56qQNz0iCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM3PPFE9E88246B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Thu, 17 Apr
 2025 05:40:25 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 05:40:25 +0000
Message-ID: <c66f9eaa-908c-49dd-950d-4405d88f7c04@intel.com>
Date: Thu, 17 Apr 2025 11:10:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: Prevent bigjoiner assignment if
 next pipe is already in use
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20250403104149.2033579-1-jeevan.b@intel.com>
 <20250403104149.2033579-2-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250403104149.2033579-2-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::19) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM3PPFE9E88246B:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0aac30-57a1-4a37-25be-08dd7d725a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c21ZRDNSSi9aUmFtZXIwSDFCZVhpUkRKNmcwR1FIazJGTFNMRWJ4aUlIUHlO?=
 =?utf-8?B?Y0gzbDU4N01QV3R0TUdCSGU4cFlPT3lranZWRW5Yci9pcytYTk96ZExraDJz?=
 =?utf-8?B?UHl3RGxSTXRja0xtMzY4bFNGTlJqZGVoK3I5aUhSSmpSN3k5dTVUMUdoellq?=
 =?utf-8?B?QW9MTzFuL3FTRnRQMVl1Zms4d0JPRVUyUk9ONytJeEZBL283M3dzUU9hQlpK?=
 =?utf-8?B?SWdnV1hRSkpxWmhqbTU5bm5kK21ZRS9SSDM4NGpMTTUvTjNDNjRidGZOWENZ?=
 =?utf-8?B?cnVVcHUyazE1UDQ2RmthdWZac294Q2xURHZXVmpMMmN4dlZ1YVlBVE8rYmpS?=
 =?utf-8?B?SHBrN1VSMnd5aDFlbVZoWE5oZjc0d1BIbnVCb1hRRlhaaXozdTd2Y3FKc3VY?=
 =?utf-8?B?R1B6RC8razlFWXVXTXV0VWlJMDBhdHdscWhLb05xVVZZZmM2blgyRlYwQnM3?=
 =?utf-8?B?am1sWFJoMkVXcE9XaERpNUZ0MVpNbDV1QzN6c2hLTm85NzhHMWFRSXhhQnpL?=
 =?utf-8?B?MUxKbUFzbzE0Nytvd2o3ZDBGOGx1ZkFsRFUrN2V5OTBEMHoyUGNSMzI4RGZX?=
 =?utf-8?B?WW1YT2EzWEJZWlF6SmNmV3VBeVBrTi9pby9SSEhheUR3VDc2RlJnaUhhL29h?=
 =?utf-8?B?L1JLZU1EcHh0UUxtV2xUMlE5NTlOb1FFOEF3TStZczVmY0d3ZnR5UERhVVA0?=
 =?utf-8?B?QWd4akZCd2ZNOHgwNldhYU1CL3c5d1B3K0VzMVE3akYyczFKT1EvYTloUmxI?=
 =?utf-8?B?QkpFME9hbkw4Q1ZWSnBzNzM3blhqUkNIS1ZWT2kyS0U0MHVxd2JqcEhaVXMw?=
 =?utf-8?B?Y1M5SENIaE5MbVNBUngrcGY3VUlodlVsNG1ONm93Vjl2SiszSGhjZWQrLzg2?=
 =?utf-8?B?RUJ5SUVMN0c5SzVReDhjOER0Z21ZUmVSWGY2NFFRcTMxM3RQMlNTTmxLMjNt?=
 =?utf-8?B?UUduQnJ2b2dzbEZsT0dUcVVXUGNXajZIcmg1RUVlYW9hMzBwV1AxaGZ5eTE5?=
 =?utf-8?B?cmlJTkliZVhaYU80VnhkL1lYQzd3Q2VlUUhRYkdGYTN4WEhtdlZ6dWc4aURI?=
 =?utf-8?B?QTMyWE03d3BzdHJydnhZR1NzTFV5VnJ2ZDNCS1NLeWlQVGNkcmpyaWJ6emVT?=
 =?utf-8?B?VkdHcy9ndHpVdDR4Z2lvUnBDeUk5OUhWNGhTUGRKTmdYMDVNWU5ncXIySVFJ?=
 =?utf-8?B?alo5NmJsVkMzM04yYlBUK3FiUklxaEI5bnJ5T3JxUUdXMmlZKy9YQXFUVFBL?=
 =?utf-8?B?ekdLWGFzTXRwUmVhTGQydWFPM2xsQSttYWdGOE45R3JsbkdGMmtVc3I5UlhY?=
 =?utf-8?B?T3VZdUpUTnFoQ2QwcldJYU94QzBmQ1hmSGRlMFhBbmtMWXNyQlFQdmR1cW83?=
 =?utf-8?B?YkUyWlRuaHd5SWNXMUJRRWtkWTY4amdDRXV2V01aUEpzMEZlSVk4L1N5eW1t?=
 =?utf-8?B?R0RDMk0ybzh2RWN2T25RVmtLMGFtZk5CMkY5aFdPRlh6dW05QUVudXZ4K1VQ?=
 =?utf-8?B?QnNyQllmRUZhZEZBekV5R2hSaDVEclFEck5HTHB0Wkg5NTgybXduQUhlRDFq?=
 =?utf-8?B?ZXVVaGtpUDNkQ3V2aEFLY0ZMYVhnUCtwRXdUVmU4NGJLdjJYQ3hzSDQ5dlBK?=
 =?utf-8?B?M2Rhd1RpbURZMTFOVVFodHRDTDV3NkFXd3JXcDl4aE5GVTJoMnhqS0ROeWtl?=
 =?utf-8?B?ai9oY1RpYjZ4dVJvMy9Hd2RFR2JqUS9oVjh6VzdJTHViSmFqalJ0cEpkYllj?=
 =?utf-8?B?aU5FdGx4ZjUrM3FFZkZyRmFmU1RUcVE0WFpOVjc3STd1Nk9uaDFtY29BTlFY?=
 =?utf-8?B?cGJ1dEVoRDBMTWZRNFB3VkQ3VkRYTzdPaXlIajdIbExVL21SV1ZsbElrY1Qx?=
 =?utf-8?B?SW9SRUNBSlJQUTF2TVg3QU9OL2dHSDU3dEZscUtncTllMFNlTzFrZFVvTHdS?=
 =?utf-8?Q?ciIsyKpNjQQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE5wbWF1VDRIK0kvRjVHRjIvQmFsdWFkZVR1QUpPNzVKZk5RRkJIN2tWekFH?=
 =?utf-8?B?b1FjUlpwSDdxdTFtTnowZ3RQdmlYT20xOGllZWphL0ZBMjg2bzNscCsxZm9H?=
 =?utf-8?B?YkZ1TTRIS0daMWhjTnhQQklRS2VVUFVYRlpyaTE4clM0QnNkbWJWdkc0Y1cv?=
 =?utf-8?B?MmhQdkNkQStQZm54b2hkS05QS2hzclBmWENRbk12UFczcGpSZEJWUUlWNWtZ?=
 =?utf-8?B?bFM0MnVBR3cwWU1valBCamJsSW1MeHVNRW5xYUtkSG9jK0hJMVhVU1pEYVU3?=
 =?utf-8?B?aXpmejh3dXZRZUlJYzhYczBWTHhtRUF6SXlPR2hNcko0UkJUTE9uaUpXcnRy?=
 =?utf-8?B?MjBieUo3cjh1VG9vYmdJa0p0Z2VSUlhnSGxZNmUzdlR4VFlGem1xWTlvMGJ0?=
 =?utf-8?B?d0NhcHVGNnZGaEpyTWRKL1I5SFNSVHlOTDdwYnRUMitPMWYvRkxVWTJKRlVi?=
 =?utf-8?B?amRLMXdyRHl4K2N0aDRrUWpqdlBZVG9raUZBV0ZVOU4wTm9Xc1RrOWdUQWJ0?=
 =?utf-8?B?UUwvT3o5UmRuS3FJbUwrbnlzem1ValZ0NXRXck1VRy9VYUFvbHZXQUZsOTZH?=
 =?utf-8?B?NVdEYUxtUlRSbkR1YVQ4YU9KTkgyMlhXMm9yTzFXTjhnb1VzTzBkNFRWUjBw?=
 =?utf-8?B?NTY4cnVaME96OXRScHVpcGJLdzlXL3VKQlpZYUhmOW1mK2EzR2t4R0FMMHZi?=
 =?utf-8?B?b2ZNalU4VE10bEwzZVl4WTJYS1FlLzBOMVZCaHVNZWpVQzMxQjJQU0tQcVJK?=
 =?utf-8?B?YjF3QTVEUXF2THR5Qk0zaGFWUWpHdjN3Z21SalJ4V0VTWDhUNkhHS3VEVjd6?=
 =?utf-8?B?OS94MVNTbGthTHJNRDZ1Wm0wZFRQek9QaWx4ek13UTJnUk83L1hTdkU1OFZw?=
 =?utf-8?B?Y3dOZFpHWnhOUkIyMXdPUER0bUVQNHdERGNkbnU4eW14Q3ppNWlSVjY3UktT?=
 =?utf-8?B?WU52S3ZFRzBBY1FhT1p2WjArbENsUkdRYXQ4ZGMvNEMrK2ZhTGptN0VwMzE0?=
 =?utf-8?B?a1ZYWDdHQW5uRmMzRVA3U0t0R0p4Y2VaVUErTUZoM0ZSWnJyaTFqYU1hSTYv?=
 =?utf-8?B?UnF4TVFnTHl3TjdlMnU5enRKVklsYjhGaGViMFdpcDNWVXo5L09Ra0RGdERy?=
 =?utf-8?B?Q1MrSktuSDcvV3h6OGVYYXVFT1ZPcy9QMDQxbG1sV3FoM0d1RllRL0xVSGo1?=
 =?utf-8?B?SlFoVTN4VUNjVVJCMlhnQ2RvL2hCNlF6dVdYeGU1ZUQzQW01N1FMbXo3bUxh?=
 =?utf-8?B?S3Qva1QrVytrckordVpOYUtyeCtXY1kwTGdJZW1GWGtNc1Nyd2MzblUwMzRj?=
 =?utf-8?B?Y0VjeGdoY2lqM1ZUZjhyRFBUakp0SDBGRW9CRDFQYXZ1cmg0ZVBZTXp1NytD?=
 =?utf-8?B?eWFpeEpRU2o4SjcwaWk1Vk52aEVHQzBPUlF1b3ljNWpsZjhKaG1McXZVU3hl?=
 =?utf-8?B?VlBzeUkvU3VQdnE1eXZqWFZyRndUMEJ6QjdPZEQ2Qk5EeWlqNnEyamVCbjZT?=
 =?utf-8?B?M0dWU2pEY29WcExVWlI4YnNQWjVFelRsQ2ZMeWR0RGhCQU5UZStBWjdrZmYv?=
 =?utf-8?B?TXpKaFl4N05YTm02WEtYbkZHbHF5OUNhMG9qelhyTDVlcFVrRnlGUm1LdHFM?=
 =?utf-8?B?cEg3bFBhclhTUGdiK3V3R3I3NEZlckQ0ODgvazJ2cnMwaHBDRE9lbDhFN0pQ?=
 =?utf-8?B?NlJPTkZYa3VxMlZlbUZmbzVma01rek10aFdFVWJEVnBCeTBkcEZ5YW05dkpS?=
 =?utf-8?B?WlhPRnVuY3pZa3MzRlZIOGxxdG9hWVV6c1Yxc3lFMWtxT0hxdUpFbU5GSHdT?=
 =?utf-8?B?MVY1UFdxblFueUlhQ3RBM3ZxK3pxdEU0ZFJETEJzMExObFB4ZkdWS3E5dnFS?=
 =?utf-8?B?dDlJcDd0QXJ4Rm5BL1pRb1NiV0NXQ1NYbTFzcXlZdnNQbFhDNkNWSzVWd0ZB?=
 =?utf-8?B?NTlXQkhrcG9rQTkwSlppS0s5N2pybG55dkZjS2VxcFZjdC9TbW5qVkZTMGpt?=
 =?utf-8?B?WnQ1UDZ5ODlHR3RMTnM2S1JRMUhPVGFjNFlmYzdqYmxjRERPUjVTV0VGSlZy?=
 =?utf-8?B?NG1acUsrb3ladThPd0tzTXBxUVdDYWRrNG1aSTV2L21vUk1KVXJ0dzdnVmVo?=
 =?utf-8?Q?wvmppr5cXUTePgLYfUwWfkbjg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0aac30-57a1-4a37-25be-08dd7d725a42
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 05:40:25.4176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/EQKhZaGuObDMeDxiJj5E9OJa/vVUqS3KvMc7fWCVnFKKruk9kYhBXZ2VBcd7xa40ED4agia9qUnZkCpOtTMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE9E88246B
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


On 4/3/2025 4:11 PM, Jeevan B wrote:
> Added a check to prevent a bigjoiner pipe from using the next pipe
> if it's already assigned, avoiding conflicts and ensuring pipe
> allocation goes smoothly.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_kms.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 99c8707c7..f3bc481f2 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6777,6 +6777,14 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   				return false;
>   			}
>   
> +			for (int j = 0; j < pipes_in_use; j++) {
> +				if (pipes[j].idx == pipes[i].idx + 1) {
> +					igt_info("pipe-%s: Next pipe is already assigned to another output.\n",
> +						 kmstest_pipe_name(pipes[j].idx));
> +					return false;
> +				}
> +			}
> +
>   			if (!display->pipes[pipes[i].idx + 1].enabled) {
>   				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
>   					 kmstest_pipe_name(display->pipes[pipes[i].idx + 1].pipe));
