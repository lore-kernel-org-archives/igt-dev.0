Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E813C021A4
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 21:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E490E10E99E;
	Wed, 12 Feb 2025 21:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TXBUwWNX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511BA10E99C
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 21:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739396654; x=1770932654;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lr0PLKLF2bRVjs+mVYFpna1/69MyeixV4weyZv+4cY8=;
 b=TXBUwWNXbfJhIdDiu2hGtwmgUbnIfie5ErYb3AJ51EKvPKY/Ex9vApdA
 VdMgGIaZ94Ytd9qdZsZVc6zYWjnmmqR0xwfbKoGSxzilJ3Vee58OTYfw9
 OElU0EJJFz8DLrDKULwAsbRklL9tvm7extYjfRdtQ4JRH7cbUQp5kYclI
 wV45sKR2QEC5ssnZ5enoEYngLdKmESGG1Q6HXLMOqrXpxTySeYF8sxN20
 /230FSEwU5wF649roWczX/lmSIhgL7V/1pwq4as3CQG0SvF0qKKHKwry3
 m8YnCa+pmlLCT7HvzmOJEVGG5F+DJfD+dDxBD0f74kFFZkIBH7zBjjZET A==;
X-CSE-ConnectionGUID: +Qkpmbs+Qsq9b7kfnmykQQ==
X-CSE-MsgGUID: rGYeHD5pR9uybr5wkdmvZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50725100"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="50725100"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 13:44:14 -0800
X-CSE-ConnectionGUID: 8G/IM+ehTAamcYysQS30Qw==
X-CSE-MsgGUID: 4C3fJD8gTo6s0TxABxf8Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="117949680"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 13:44:13 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Feb 2025 13:44:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 13:44:12 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 13:44:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URAuXANXpkqRG+vsjC7NvV0csUEAMUCJrpd/xo7lhVVjeagLVreSeJQSwlZQWc70NrGNrlZvCXkWu8adXv82p2CCNDn8xGd894YVnoK6qIjwLJelpBKdhJ8j9dF+CTNp40fDruixSuuaKooO/tkwkhxU4jq1o4FYC0Gtbdm1QurO3RBt8Qw71mdixvlH/3hediUVg1RPIrLn8LsWqnbBx+57iCN41FJsyrMf2cYlBdxJ2nNoEEynbVLEMtG704NmUM8z9pdaPFbBIfwu1ldndBknf3UI2b/Gz12ilQx3MXHRvyiqkCCK+REttdXgqSGIgTXseoKa47NIz1RRL66SjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIB+j3j+7yo8c/71+OvmTEj5pqOW8SWftfMDxXKvuE8=;
 b=GaRRAXm3+7DMJDecHc/b5k70RxG3IbczM62Ch2/+bMC7+rytcfgYrjRFevebLBoLaYIYkyRBHU0oLCqIIzWGckuV8lGYJj9uGbFgnV2zQE5W0CKROJM2701VGnGkIDYP0W+kREJnclP0K6kUhqZCcJr7geXQYWo1st30UlX2Bg92LvJtlfpE57Ng2Wzl81s9Jj88BKpd8hLeXjg+kMNO6Jelsa0LnYY2KTrjumJ77TxDLw1T7HhZkXTw69f2F51qaCdXrf0YcDYh6i3eAd972tpqp57ZmR2JauYGbGEvKKgOLAa32PCiL6XcxDzs0Uank5r985QdehbsuWH22wH/7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB6404.namprd11.prod.outlook.com (2603:10b6:510:1f8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 21:43:28 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 21:43:28 +0000
Message-ID: <09631161-7956-48ea-8936-f10def51d0ed@intel.com>
Date: Wed, 12 Feb 2025 16:43:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tests/intel/xe_exec_capture: Enhance test to check
 with DUMPABLE flag
To: pravalika gurram <pravalika.gurram@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250212153252.790029-1-pravalika.gurram@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250212153252.790029-1-pravalika.gurram@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0162.namprd04.prod.outlook.com
 (2603:10b6:303:85::17) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a267abc-05b4-41bb-dc7f-08dd4bae4970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnZVc2V0L2ZsZy9KY2VVOURWNEdlRmdBb2RrZ3FQbUNFZFJ6MWtabWFTMm9a?=
 =?utf-8?B?bjl0UjdhMHFRSDZYd01YcFhpQXdFY2RFSjRNMEpKNUg2RUJJOGZ1RXBrTzIz?=
 =?utf-8?B?UTFNRGFDV0NBUm9BVEdWUStrSk5VUXJmTlJBbGdwV3BicW0wd3lSVVJCRXV6?=
 =?utf-8?B?OXhYUytHNlNWWUI2akp2ZUxGU2o4L1lNcXNQREFiWDZPYlRzclEvcnlIc092?=
 =?utf-8?B?aitrNW1ZOEY3RFQ4cUFsZzQ5NlpzblNJR3dFQzl6dDEvS0V6d2xmRWg0ZzBE?=
 =?utf-8?B?bHlxRXovM1pjcEFaMWdzL3BETnUxYXo4RzlTMmJ6Yi9oblBkb3lyK0FZVmFi?=
 =?utf-8?B?cHBmVmFDRk5DVUdLKzFhaWQwYk1iOGhhTGFnaXV3U29GVDhZMS9sS05tUTFS?=
 =?utf-8?B?cHdMYUFNWG15Z255d0Nqc1lxYmNFakZNVlRseFZja2dOME5LZFFlaEZTaUxL?=
 =?utf-8?B?elFpaUU4RXlRWGRWYVJlUldCU3hMNzFFbGNDVnNPNzZmMXY1eXJKZGVPNnNS?=
 =?utf-8?B?aDNpU0c2L3ZuLzh5Z0tIenVraGxHL1o0MEtCWDQzVzBFTzFIYzY2NVluenBz?=
 =?utf-8?B?QmFoanU5WXdTRjZCcFJ6V21mMkZ2eWsvb3BtT1lqdFZWMklHQmhaT1MvUE5S?=
 =?utf-8?B?bCtjNFJyUExnZTVVN2kzKzAwMk1GQ2ZFMDVFNXdKSkVLdUNKbFF2dmlpSEEz?=
 =?utf-8?B?cU5YdEVEUVR2Z3NIMjNPZXF0a2Jjbk1ab3NiSnF2Q1hXd3MwZ2ZUUy9GbWxN?=
 =?utf-8?B?VGdzdUY3dFI4YXBLR2JyRElIeE8rS0U5Z3NlbzFQOEFaRWpUaHhjOFZPaVRK?=
 =?utf-8?B?MU9QY1hjRmhDb0lNZlhEUExWZkhzbW5QMSsrdGdNUDZCcWlqRWNwcHhnVjR1?=
 =?utf-8?B?TWh1Q01IaVJHNGxwWWVuSkJ6RjVCYTJVUENDQ1NzMWRSSFJ6ZHZEMmRKKzF5?=
 =?utf-8?B?VW5IOGdWdVRnaG9NT2ZZUXJGY3hCNVdVT1ZqNC9ld3Q5aEUrek5UR1loQmY1?=
 =?utf-8?B?SHNQdVVlYi9wNFFqWjFmVDF5QmNsVk5XdG5xVHZwaGpqQkhnZnZlZ1ZDc0Zq?=
 =?utf-8?B?c1lyRWNqaUk3Tll0ZGhBeUFsU3g3RDNGY1RZUEI2VTVwdzNMQ0ZISnFid3po?=
 =?utf-8?B?bkxRZUYzUlBobTBNMnhrSTlVTG83Zms2NFpiVHBxNmZnTFZuSW5RSUlsM3NE?=
 =?utf-8?B?YmFoYlV0Y0dGMnNBbFU4ZWZpK0VIa2FyeWY2QXNKbXkzakJRL3I0NUZzKzZ2?=
 =?utf-8?B?ZStNczNSL1FuSFhlU1RBMk9jOFdlOWVsODZ0TzFTZWtvanhwYzZEbUxvUVhE?=
 =?utf-8?B?TXVpY3JrVDBOMVpETVg3RzVNSGhnMUVjWGJJVjdFUmlRS0J6eC9SY3F3TTFC?=
 =?utf-8?B?WncvZkw3V3haM2JxUnZhaTA3YXV0S0RQam9LWkt3dE94Skg4bjd0NktqaDVC?=
 =?utf-8?B?ZHEveEZHU1pFaE01dmxFdVNQQVE0V2lRUnhHMnRTYi9kN2lxOTlQTTFiQkwx?=
 =?utf-8?B?UUFjNDdwVGZWOWEySVgvS2JwMkFhbTZXVFJ6Ykc2a2RGZ2p5UlI5WlFxalpk?=
 =?utf-8?B?bVRGSnhtNk5FUEZPa2pPc1NjSGFITzdZTE13bVNuTGVseTVRNERoZW8vVzA0?=
 =?utf-8?B?N1V6VW9pbEs1Y3FVUkgxNkIyK0hEOFZYZkttNnpvUTZlUmlaMlRkUjJKS2NO?=
 =?utf-8?B?RmI4dTZDNTFaQTJTUDhLUmdtdG5SNnVtUU9VMkYrMndnYzd2b3huaGM5Rzgr?=
 =?utf-8?B?MzcvRkNhZGpoeEZ3Z29aVERNVjV0TUZHQ3ZNNzlCOFhWYTlFVjVkN1g1NHVt?=
 =?utf-8?B?aVAyRXNKYVVYcEdHMU5XdFhQVjNqcWtWMkpJVldDTVZRODFvSDcwS3g0L2pB?=
 =?utf-8?Q?CfSbCAYhJAq1E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkRvZEQ0allsak1sZHgxcklDVURycEp3eXA1NXBaSkd5TmR4WjA5WXRTTktt?=
 =?utf-8?B?ZzJhTjUrZWNjVHg2SnViaEZqWG5oOXd4aFFGNjZJYVBnOGNzMlo4NkFTL01s?=
 =?utf-8?B?aHFJZEJwT2cxd09aa2E3YTJiMnRYejlDKzVYZW1VZmh1dXJnZTg2akM3SmtO?=
 =?utf-8?B?QWVLMkg4OTExTng4VVVTdlA0amJLMGJQaExwYVY2azBuU2NXMEE1N0dvUGFx?=
 =?utf-8?B?Qis4Tmhhb3hYUUJmL3NnMVJieTJBZWFheTJHdmFhRTNlSFNBM2ZJMXhaRVMw?=
 =?utf-8?B?R2lVUjRITHZjaHdNNWJEWVQ2ZmM1dmFURTBGeTJZME52TnI2U3YvQUdaTHVO?=
 =?utf-8?B?cnBFNXZCcHVKTlRIZjl0eDkrMDRGdnEwOFNIUHFPNjZEeG00WDhzZSt0b1lR?=
 =?utf-8?B?ZU44OHhseHF1UEwxZU9jaUpQZjI3RUJHaDNIQm1XZFE3R08wdDc2eHBiQWQv?=
 =?utf-8?B?R09zNlJUczBPUHNHeGUvbzFiTkE4dlhCTFpla3BJTnNUN2hBbUpWeXdoNnFI?=
 =?utf-8?B?eE9nMzB2Tnc5S3RYa0dvYVNvL2orU2pOODBaeXRRTWtWR0hDUFNSQmdmV3d3?=
 =?utf-8?B?ZWowdFYvMzl4Sm1TaXhZd3RteDhkVXN3VjMxdW05dzVveUlPOEpsMWZMY2gz?=
 =?utf-8?B?TTAzL0F0QjhmaDdWNWZMMHFQaUdab01yNXppUFh5aFhadG9UbHZPQUR5cU1R?=
 =?utf-8?B?YytTc3pRYW45eE03ekh2cTJJMUpnTVFLRzJ6eitSeTVueDdPVytReXkzOVN4?=
 =?utf-8?B?cjZTcmdMek9NLzViQ2RzdGlwc1hWbG8wLzdUSEtSa2hZdUwxL1BTQ09VZWMy?=
 =?utf-8?B?cGdONmFCVWJMRVE2Y1FybjVTUXlHYUcvMHY3bks0SU01WFlVUjQwTFEzalBm?=
 =?utf-8?B?V2RkRmlqeVVtWHArTVU4RUxGM0Nad2R3ZjUvR0JyOUNqN1ZhcVhlT2ZnWnlR?=
 =?utf-8?B?SnduR3hlcVgzNTRuUTZtS0NNdy9WMXNVUjJ2L0pBUkFrRERLam9razN2cVVq?=
 =?utf-8?B?eWlBWlFteHVtUldiM0Z2VEVwTDFaaUloam1DRkpRRnN2OUo3ZnBwSUVidDYy?=
 =?utf-8?B?QnZhTHU4K2dldzdkYlBzT085ZWlTWkh1K0VoRU9YQklvMW9HM29pY2lldEd6?=
 =?utf-8?B?RGZtdnFtQUtSTDRZNGVVdHkwOGFLR09xTHg0RU8zM095UmYybzFZSk1UZ0k2?=
 =?utf-8?B?YjVLb2Q1bWxVTkZNOTRIMUxCWGV6bHQ5MUk1WUU4bkhSZlk4Y0Q0T1A0Zndj?=
 =?utf-8?B?dktRMllOdUVXK2JJa3hrVi8rWXNVbkhxdDlCbWhFcmtBMVlnUWF4TFZnQVFl?=
 =?utf-8?B?R0kxZFpMOXFDT0hSRUlndkExcXd0WVhobmE2Vk9uN0V1RkVqRVkrMlowd1cz?=
 =?utf-8?B?RTY3Q0x5bFNTdEZXSSs3SHFTbTNsQTBPaW9McmFHdDNIYkxRMjRLcjRCNmNy?=
 =?utf-8?B?OUZId2dpVDRvK2Z4ZmIyUks5RnM1SHlnTWpBZHp0LzZueE5ES0tzbnhEQUlX?=
 =?utf-8?B?WWQySnRpMFZNU1ZrSW1zcGNIME8zUnBDaHl5MnkrSDhvcHVOa2hIa3cwdGZU?=
 =?utf-8?B?MWRDckdPTGwvOGl2cVcyYTdSbWRuaVRJZXBVNXNwTE5LWWFNRzJrVzJ6RTRs?=
 =?utf-8?B?QzVoWVZyRW82TGE5bWRpcmRYa1hpZmZ1VXlmZHQyd2dTV0ZGUStSclBVdEEz?=
 =?utf-8?B?ZWQrdHh4MDNkYzFtS1hWcUVoQkVHb2ZZaTRCS1RDQkRNYVBiLzhObUE3WFR3?=
 =?utf-8?B?b1hQRzZwa0pXdWlZWlJNcGNYdGI2SzNSeTNFNUxDMDR0UHJ4NDBNU042azdG?=
 =?utf-8?B?bjdhbUp6TTNWa1JLZlRBOXhPang2SXJrL25sNUdiVmcxY005cXpxV1Bid1JM?=
 =?utf-8?B?NHlneFpzdUdhZGI2RVhPMGEzQjRZL01aejJ5MzYrZkZ0cmVaQVFiNzMwUFNK?=
 =?utf-8?B?eWZxWFRRKzJjT3F6eVFOMW0rMDlZRUkweHZTV2xTS1ZVNkp0SHVtZ3dTeHhJ?=
 =?utf-8?B?Nkg1Q1lOUWdRRlN5NUdabnNvNmQyWTY5TFBZWHRQY1ltZHdvdGMyVzdMTTdM?=
 =?utf-8?B?NEVvK2tMSFZLQVF4VGRGcUpmZk1QdjE3RTBXMnBvV0NHR25HcDQ3dGRjTU05?=
 =?utf-8?B?eFNkaklTTXdtL2kzekZPVnI0QXBvbStyNGVVc280Y1VFbE1WZ1Q1TEl4aWk0?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a267abc-05b4-41bb-dc7f-08dd4bae4970
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 21:43:28.6586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0t3tS6E/r72ch5iVkMhdqMlp3OO5Bg3uWN2AsAFCUTrRwdrhFLSIjPgWim5Gs4aCgIn+WS3Xw2c0J7zVpyPRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6404
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



On 2025-02-12 10:32 a.m., pravalika gurram wrote:
> check if the VM is there when DRM_XE_VM_BIND_FLAG_DUMPABLE is set
> in the generated devcoredump. check VM address within the range.
> VM address is located after END_TAG and is at the end of dump, that's
> why "stop on END_TAG" is removed.
> 
> Signed-off-by: pravalika gurram <pravalika.gurram@intel.com>
> ---
>   tests/intel/xe_exec_capture.c | 63 +++++++++++++++++++++++++----------
>   1 file changed, 45 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
> index 55ec3d4bd..4cc58928e 100644
> --- a/tests/intel/xe_exec_capture.c
> +++ b/tests/intel/xe_exec_capture.c
> @@ -53,16 +53,15 @@
>   
>   #define DUMP_PATH			"/sys/class/drm/card%d/device/devcoredump/data"
>   #define START_TAG			"**** Job ****"
> -#define END_TAG				"**** VM state ****"
>   
>   /* Optional Space */
> -#define SPC_O				"[ \t]*"
> +#define SPC_O				"[ \t\\.]*"
>   /* Required Space */
> -#define SPC				"[ \t]+"
> +#define SPC				"[ \t\\.]+"
>   /* Optional Non-Space */
> -#define NSPC_O				"([^ \t]*)"
> +#define NSPC_O				"([^ \t\\.]*)"
>   /* Required Non-Space */
> -#define NSPC				"([^ \t]+)"
> +#define NSPC				"([^ \t\\.]+)"
>   #define BEG				"^" SPC_O
>   #define REQ_FIELD			NSPC SPC
>   #define REQ_FIELD_LAST			NSPC SPC_O
> @@ -77,6 +76,8 @@
>   #define INDEX_ENGINE_PHYSICAL		2
>   #define INDEX_ENGINE_NAME		1
>   #define INDEX_ENGINE_INSTANCE		4
> +#define INDEX_VM_LENGTH			2
> +#define INDEX_VM_SIZE			3
>   
>   static u64
>   xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
> @@ -177,7 +178,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int n_exec_qu
>   	};
>   
>   	sync[0].handle = syncobj_create(fd, 0);
> -	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +	__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
> +				DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
>   
>   	for (i = 0; i < n_execs; i++) {
>   		u64 base_addr = addr;
> @@ -287,10 +289,6 @@ static int load_all(FILE *fd, char **lines, char *buf)
>   
>   		/* Only save up to MAX_LINE_LEN to buffer */
>   		safe_strncpy(lines[i++], buf, MAX_LINE_LEN);
> -
> -		/* Stop on END_TAG */
> -		if (!strncmp(END_TAG, buf, strlen(END_TAG)))
> -			break;
>   	}
>   	return start_line;
>   }
> @@ -351,7 +349,6 @@ static char
>   				value = &line[match[target_index].rm_so];
>   				line[match[target_index].rm_eo] = '\0';
>   			}
> -
>   			if (key && value && strcmp(tag, key) == 0)
>   				return value;
>   			/* if key != tag,  keep searching and loop to next line */
> @@ -361,16 +358,43 @@ static char
>   	return NULL;
>   }
>   
> +/* example i/p : [1580001a0000].length: 0x10000 */
The comment right above a function is typically for function comments.
For a static function, function comment is optional, but put example 
here without function comments is not a good practice.
> +
> +static uint64_t
> +compare_hex_value(const char *output)
> +{
> +	char result[64];
> +	uint64_t ret_val;
> +	char *src = (char *)output, *dst = result;
> +
You might put it here.

With the comment corrected:
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

But I have question about the text format, for:
  [1580001a0000].length: 0x10000
Questions:
1. About [ ]
    How many values inside [ ]? From your implementation, it looks like 
a single value, then why put the single value inside [ ]?
2. About "."
    Right now, we don't have any float values, but if in the future we 
have it, "." is no longer a delimiter.

So the text format could becomes:

Block(or whatever name) address: 0x1580001a0000 length: 0x10000

which might be more easy to read.

I know this is out of scope of this review, but I want to raise the 
concern and if we don't have much tool is processing this, we are able 
to change it.

Regards
Zhanjun Dong

> +	while (*src) {
> +		if (*src == '[' || *src == ']') {
> +			src++;
> +			continue;
> +		}
> +
> +		*dst = toupper((unsigned char)*src);
> +		dst++;
> +		src++;
> +	}
> +	*dst = '\0';
> +	ret_val = strtoull(result, NULL, 16);
> +	return ret_val;
> +}
> +
>   static void
> -check_item_u64(regex_t *regex, char **lines, const char *tag, u64 addr_lo, u64 addr_hi)
> +check_item_u64(regex_t *regex, char **lines, const char *tag, u64 addr_lo,
> +	      u64 addr_hi, int tag_index, int target_index)
>   {
>   	u64 result;
>   	char *output;
>   
> -	igt_assert_f((output = get_coredump_item(regex, lines, tag, INDEX_KEY, INDEX_VALUE)),
> +	igt_assert_f((output = get_coredump_item(regex, lines, tag, tag_index, target_index)),
>   		     "Target not found:%s\n", tag);
> -	result = strtoul(output, NULL, 16);
> -	igt_debug("Compare %s %s vs [0x%lX-0x%lX]\n", tag, output, addr_lo, addr_hi);
> +
> +	result = compare_hex_value(output);
> +	igt_debug("Compare %s %s vs [0x%lX-0x%lX] result %lX\n", tag, output,
> +		addr_lo, addr_hi, result);
>   	igt_assert_f((addr_lo <= result) && (result <= addr_hi),
>   		     "value %lX out of range[0x%lX-0x%lX]\n", result, addr_lo, addr_hi);
>   }
> @@ -435,7 +459,7 @@ static void test_card(int fd)
>   		igt_debug("Running on engine class: %x instance: %x\n", hwe->engine_class,
>   			  hwe->engine_instance);
>   
> -		test_legacy_mode(fd, hwe, 1, 1, 0, addr);
> +		test_legacy_mode(fd, hwe, 1, 1, DRM_XE_VM_BIND_FLAG_DUMPABLE, addr);
>   		/* Wait 1 sec for devcoredump complete */
>   		sleep(1);
>   
> @@ -451,10 +475,13 @@ static void test_card(int fd)
>   
>   		check_item_str(&regex, lines, "Capture_source:", INDEX_KEY, INDEX_VALUE,
>   			       "GuC", false);
> +
>   		check_item_u64(&regex, lines, "ACTHD:", addr,
> -			       addr + BATCH_DW_COUNT * sizeof(u32));
> +			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_KEY, INDEX_VALUE);
>   		check_item_u64(&regex, lines, "RING_BBADDR:", addr,
> -			       addr + BATCH_DW_COUNT * sizeof(u32));
> +			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_KEY, INDEX_VALUE);
> +		check_item_u64(&regex, lines, "length:", addr,
> +			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_VALUE, INDEX_KEY);
>   
>   		/* clear devcoredump */
>   		rm_devcoredump(path);

