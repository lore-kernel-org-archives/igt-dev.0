Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2236C0218C
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 07:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B31510E497;
	Mon, 27 Jan 2025 07:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmqhxJ0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB8E10E497
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 07:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737962296; x=1769498296;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7S67eBwPMy7yG7lbgN98DNmQh1/4b2RkkRJeKUdCmVI=;
 b=MmqhxJ0CsMl4RScFUGVuLbtBbxK8OxYw180Xi2c6pZvBM6bI5NNk930I
 Eiw1kwnYYEhBteTHf8xcEYbIzNvbDcmQ5+njJ1dLQkmRA6NiY6RiCwh8/
 Y21Zic270WTaCouEoxh+dG/TfygHfFtzmF5ew+x0nKadUWspTSzorhyLj
 THczEj/uBV/EFoq0YnGeR+FpzL526D9JQXsIuV4Rh5bhAkStIpJGzjIx/
 9K2tzwwb2o7eKXDU1jph3hC1z0jWEgpz2Yxt2ci/tT66KsIdk+4gz4gQs
 ehK7tDJap5W4cNHkf4lDUizZHsYk2OXMMSYNjCpQt8tle+qT/dpN5Acxa A==;
X-CSE-ConnectionGUID: MXSiBr7SQXCHVHUYhbEeeg==
X-CSE-MsgGUID: irqeRkhtTQCXO7pfbsJGYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="60879509"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="60879509"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 23:18:15 -0800
X-CSE-ConnectionGUID: qZdY+seMTJGDEj8qJy2aeQ==
X-CSE-MsgGUID: 3/U+YjQdR0CXc3b/r2+wng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109265411"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2025 23:18:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 26 Jan 2025 23:18:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 26 Jan 2025 23:18:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 26 Jan 2025 23:18:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZAm/kZdd7xoNIS+BsSzHPSMCln7KQjx/+hoeXDscvybyxYaVgsNzqUlla83ZaxsD5rKrOQ8/D1If6GraxmZa6qjMNsDUbGeyctyBUagpoN9V5EM2FeRcZj5XT7XpWpy4ZSlyYp5MEYWhZO/tWXCQc03Xe9VSiR/mpdVwu8Mjbvq+54mlFbQQrC3u6VGTYOaZN+HpCP8yTrLwGJ0WlktvaSsGWJcx3c7eR1TVzDhb7QIH5EYC5EvVmuccIEQ9mkxZifjE4SQjHLDRv054644LivlzfrsLNwwvTfxMtaryIxAK3D706tc5jbeS+ldklen7OUuhKhDIgcuSEiV8lCvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rDn8Vi7jha0iv6D2SUOTnzhBYTHas6SOQwfpLNqwJI=;
 b=OKegIIPBEDztcIrCnMnpuABKyMopOEn6E8//iQLP3gqP179k/HFUpKrKnfrGWOfoP1UD5hqZQESrRu5c4sk1wNskPiiqo3jL4+M9RM23DXz/Os+SOftz9nkv2wMQ291353TbhUAZuXuU1rBjfTyPXSvnqYjeyVN1wU4pHwAfduJ7WnrXLri22vWARison0gN5WArLOvs/ncLwsDKir62O5tFL+C2NiHuq7ERD03Jz19JLWn44LYbcWg+u7PqTLXoGU4DG7ongcvvyRK8J1xp7X1M6aSk9O0FVLgGpGalvAC7tKSzTIbay7HF9v7HXsBH6CywVRKQbU9sbUPNaVLAqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS7PR11MB6061.namprd11.prod.outlook.com (2603:10b6:8:74::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.22; Mon, 27 Jan 2025 07:17:26 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8377.009; Mon, 27 Jan 2025
 07:17:26 +0000
Message-ID: <8ea8a081-453e-43a2-874c-c4f5c3088d32@intel.com>
Date: Mon, 27 Jan 2025 12:47:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/intel/kms_mst_helper: Add helper for
 MST-related functions
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250123073701.3113428-1-kunal1.joshi@intel.com>
 <20250123073701.3113428-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250123073701.3113428-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::19) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS7PR11MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2e3296-110f-4efc-ab9f-08dd3ea2a6a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WllDeXBvb2JrTTdDSitnWm5QYWRBZ3ZqdUFONTJIRGJtc1NjaDFzaUdRUWoy?=
 =?utf-8?B?TC9HYWtVMG8vUnlsM2gxYTM4ZzFKT09KVVRIY2RJaDVDSmNCb056TkQrSzBD?=
 =?utf-8?B?bWNndTJQQ0ZjUzFqdHRCaUsxeUhBa0NzRTBnWUswSHZjSnEvSnUxVUN3eE12?=
 =?utf-8?B?aHpRb0xFVTZ1S2VrUzNXS2MrYWh5NGFXd0hPTnNzMzM2eUs3L1RjZ3k2S3pJ?=
 =?utf-8?B?TTN0SitjTHJKUVd0cVRzVjVWbkJ6WmlDY1M0dHc1NW5UbUViaEJ0KzhidkdG?=
 =?utf-8?B?Y3pmQVRleXN1dXNCZkhnSVZrUGxOSktLZE1tL3VGeTJpbWgrNmRMb2RtZ0Nq?=
 =?utf-8?B?NWZWVXVKeER0NE1KYTlQRXJQQ3R5NnJJVVhwM2xiOEpGenp5RmJUYUlEWGFR?=
 =?utf-8?B?UkV5K3pUdXZhOFVQVzNtR2Fpb0lsMnFkUVFBRlQ0SGRLM09EMHp2ZzRVWHNx?=
 =?utf-8?B?QVVXU2NVT1BPczcvbldBb1NENzZuOUhXaktwMkR4bmpOZ1l5Z0dQdU9jSzVN?=
 =?utf-8?B?UElHNHl6RWlEb2kyTGVlSzlzRFJBbFhLTGYvWjJsNTJFSWtVKzdqa1RwT3dR?=
 =?utf-8?B?ZjBuZ3AzZEZtMGlVUVE4RXhzYnU4YWFRNnZlR1hWOFNtdlVZNy9zU2pDQ1hY?=
 =?utf-8?B?NWdnVDhxZEhyVmFGaDA3UnJQWGl4NGRqNzVHRDJwRVFyQzJrMWlDRmt0NU1m?=
 =?utf-8?B?N2FkTWR3SFpYTG0vRnMvS1BGSlViaGduNXFOK1FYam1nMHdvN1FvdUxtejRs?=
 =?utf-8?B?TzJSZEViTlI0S3p3UXZZZHRoeG5GR3dlTEIzU1Z6ODFES3lrSVBYVDc0RjRQ?=
 =?utf-8?B?UWpvNHpRZzQyUmE5WXpQZHFmRGxFM3cxUktqVVN4WThveHQ0SnFibWlmeDE4?=
 =?utf-8?B?V0JCc3BSNmJ6bHp2M3UyY1dlY1ovelluaTRlVFF1Zm5ON1JxWmZIMCtBNzFh?=
 =?utf-8?B?NzlNZzl0alh0WGJUSXcwdE1uYnhKa1ZpdEdPWTN5VW9mbnNDcldyb0JhZ0I5?=
 =?utf-8?B?SnA3NmVwUHJkWkxuOTBWaGdVNWhCZmhUVXc0enZtVjQ0alZDWmdCMVdVWndq?=
 =?utf-8?B?eUFBc0pJNlJMWUhlVHhWM1JYSnhBRXQ2R0E3T0ZMSnBWVkVDWFgzQ1IwRTdw?=
 =?utf-8?B?STYxb094TEc4Nm1oMTlvM3o3K1dTNXZ2aFBVTnpjR2psUkZzNWRnOUtYajND?=
 =?utf-8?B?eE5UYW9Ud2EzV3UwZ3FmdHdyeHA5MytFeWZrSm1YSWUrNTFqc3VEek1wRG9V?=
 =?utf-8?B?R3BSUGJUNVI1eHJYMEZYQVFqdkllSDlIbmh6alNyZ2dlR2EzNjRQejNHR2JW?=
 =?utf-8?B?U29MbE0rNk1ENFVueWxEeVFoZ29vc0x0ZUt4dmk0eTBZUVZ5a05GbGEyQVJy?=
 =?utf-8?B?WFkvbWhZVVlDcnZJYVJWZlVzRTFBWEtQVDZoSk1UamhIZkNYWTkyL0RFb2RR?=
 =?utf-8?B?cnAwbVR1SjluR1NaM01DRE02SGdZWWxQVlljRlVjc0lkWW0yUiswSzdZNThE?=
 =?utf-8?B?SnJad3Q0VURpRFdWQ2pXcG1pMkhqdERiK1JzaGJTaGJiRENqMHM1citHTW5D?=
 =?utf-8?B?c0JYZzdzMTJ1SS9JU2tYV2t6cS9neThYRWdReUVPZkhLSWl2RFZIOHd1QzhI?=
 =?utf-8?B?N3dpRVZXVDdrV2VvY2xKRmkzNnowRVhPUHVtdUIrYzhwaFRTUU9YYmo2UGZ4?=
 =?utf-8?B?OVNYSk9vUHZGWE1UcklVMVVtTzY1U1lPV2tlV1lhZFFuRzQvL3NIeHJ0clkw?=
 =?utf-8?B?dGQwcEFjWXB0eG9tcnJxOFZpWngrQmZuNFZzbklNYjVoMFZOMUcxV0x0SU9j?=
 =?utf-8?B?YWJ5ZUxER3hzb0NqOEFqZ2VjT2dGc3FyOUxaMVl5SU1BemtZZlRVMmhkMTVz?=
 =?utf-8?Q?LlnubuFPuQkYn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MldJZ3NSMWZySklFK0lFYmUwbksvbjVCQlVyalo1Z2pobFVFd003M3B4cEUv?=
 =?utf-8?B?Z09qNHdNdEcwMDEyT25scGx5b1lLTXJvbFRVWlZrQVN0eEt2cE9qVEV2LzB4?=
 =?utf-8?B?Mm93UUxCSFBvVjJGSG1uT2pQUzR5SVh1VUJWYnMvN3hyTUVnQ2FodlI3OHpZ?=
 =?utf-8?B?dVdJVXZtUFExMWZoSjhqb3NIeFZZR3NrcUYzdDNUcjQxUUVIbENFc0M0enA5?=
 =?utf-8?B?TXR3blU0RXB6eGRqKzEwOGRiVHg1eUNNalRRaDkveU12eDhpUFVSK2RYcUlo?=
 =?utf-8?B?Wk91bEtRZlN4SUZ3YnNKdFBHdDRxSEp1Sy8yMzNybjZyYjcxaUJMWTdQSkJF?=
 =?utf-8?B?eStNOFdzRUlSYUFnZXVMSG04Q2ZhZzZBQklQTVBwZmQ2YmdBSzlWRWY5R09o?=
 =?utf-8?B?NUJPNjd3M2cydDArZVIzNFlmVWFMMmJzRC81RDczd040L0RsUE1zSWpXbFNL?=
 =?utf-8?B?TlhYYWlmQ0tQZ1dBQ21KYm1UYlY5V093K2QwOUhyTysxWE5VUTdkZjk3MGcx?=
 =?utf-8?B?dUxjSjltYzJydzVBK0dLd2RhWVB1a3FkUm5ETEpBckpoazVIaUhENU9YOVRj?=
 =?utf-8?B?dU5BOVIvZHBGbVViY3g3OEZHNGRMa2lCTStKc0JaNzJQUGJLN3BMcE9BK1lu?=
 =?utf-8?B?Q0pmOFJzaTFuVHJQQk9RSGVHclpidnB6eEhSYmhLdzNFdlY4UHJDbnR0dFpx?=
 =?utf-8?B?bnY3STA4NkFKWGtlL0hlY0pBbmRzMW9QWkVzNWdZS2pYV210Q1Nqa2lvdXZ6?=
 =?utf-8?B?c2E2S1RGYjNTZ0RxM0JTN2xLR2g2UmZBOXNhaGV2UG14TEliUzNNSDVnNFNJ?=
 =?utf-8?B?c0FtU255c3RLVW9wNHozczVURk5iU0tBZGhsS0dIWk9BdVZwLy9IOWtFY1Zt?=
 =?utf-8?B?MnVtUDdURDhoL0Mxelpsc0h3b1lld3IwQ2ZsTmJBVzAwOWJCaTlVeGJZekx6?=
 =?utf-8?B?NGJNQW1PQ1F0b3dHT1g1WVRiVnpDWVdDeTVnd0JhV0V3OVphQldVUWdLUDlX?=
 =?utf-8?B?SkgxTTE5M2lKTG5nOXN0Wm52eTBScDVram1oMFBuU0lIYndiNUVhL0l6czlo?=
 =?utf-8?B?VWltUzVwUFVyeWNpMmQ5L3FhakRuZFJ6ZVNFN0RlNGtXdjM5WER5dzlLMElp?=
 =?utf-8?B?cUdUelpqc08xSmk4bjhJYkJvS3YwMnM5eGRsYjA4UUtBaUFGbGxwVm9rbEJj?=
 =?utf-8?B?K2hkVzZhckN4OENxeVNzN244Y0k0bnBZNjJiWlVYejZwcVNQNlpWMFkrNFhj?=
 =?utf-8?B?eklOV09QWG42cWIvMFVERzNBV21sVVowTStKWjJGUzh5Qi9lTHVoODJYZ2xK?=
 =?utf-8?B?YTEyOTRuR3c5bXMxaVFhTndmZFcycVNTWkZENzBqN3VYOVA4K1hRc3lXL1Nz?=
 =?utf-8?B?R2ltY1hJanJrYmNNbXBnLzlhZnRyZlhiZGV6TzRWc2p6VmhHQzVqT2duRWI1?=
 =?utf-8?B?OXBYVzdCUlRHd0RSMDE3WFhSOUJhZUQraTdsTzlVUjYzZ245d3hoL2FqdUpw?=
 =?utf-8?B?azVwcE1yNktZYzFNTXk1RlcyblBIbUErNFYwTWpjcngwTG4xcWN3MmFkMUxv?=
 =?utf-8?B?bmZxMnhnaVBPSWV4eXpSK0tieGpqV1hrVksrTWxTSUZvakNJTUMrYXBkOFhl?=
 =?utf-8?B?L3YrS1hkcTFDSS9CTTRFOW5CeDFrM0g0TFg3R3RvTDVPVnV4TVJlN2RlSmsx?=
 =?utf-8?B?OExvMUoybXU5VmI1cC9IV2tiR2Iwb3ZVVm1uTEp1anBkVFZUUEVHcEVlYXJt?=
 =?utf-8?B?OHNsQXM0dFlZZ3VqajRwWjBNL21wdVk2RjV0OUdoSG9jQWNXVjlPOVRJci9J?=
 =?utf-8?B?Y1Jjek4vMnQ4ZTMvMU1VU0Y4TVVQUEE1UVRjWlpQOWFLdmhaeWlDVndTQWV2?=
 =?utf-8?B?dDlXQWZZZ1VEZUd0NFdZTTVYeGRBOG9oS3lhVDA1R0lZZ0d3bzNIRUdNMnRw?=
 =?utf-8?B?SUhwcVJEZDN2Q2JtT2tkaEF6N0pqN1FieTU1d0w0b1JhUTBTWTZxMEJTYTd1?=
 =?utf-8?B?eWJHQnRLYmo1M2xhcUpPdURmV1d3K0t1dlQrR1dHcDMraER6eS9TS3EveEVF?=
 =?utf-8?B?M1RONzBMQ2FkbkdIUmJlcFF0YW1JbE9CZkp6YWh0Y2VHVEMyeDZKcEFWOUdk?=
 =?utf-8?B?YVJuSmFkRXVPYTRsc2VMMjJUYnFrNjdrMGxwTUF3bVB6cjlkWlkwdVFaS0hD?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2e3296-110f-4efc-ab9f-08dd3ea2a6a7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 07:17:26.0975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xelK2kS+KkggfFzp8K8UWtUy+/ybayQS6xEZN6SO4tlnBZIlGIPnNbdrmQbE/r2XDNhFNwI2t/u1Udj9J3B3JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6061
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

If new helper is introduced, please move dp-mst related func() from 
igt_kms.c to

kms_mst_helper.c

On 23-01-2025 01:06 pm, Kunal Joshi wrote:
> This patch introduces kms_mst_helper.c and kms_mst_helper.h
> to centralize commonly used MST-related logic.
> The new function igt_find_all_mst_output_in_topology()
> enumerates MST outputs that share the same root connector,
> simplifying code reuse across tests needing outputs on
> same MST topology. The existing MST-related code in
> kms_dp_linktrain_fallback.c is updated to use the new helper,
> removing duplication. Additionally, meson.build is modified
> to include kms_mst_helper.c in the build process.
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 28 ++++---------------------
>   tests/meson.build                       |  1 +
>   2 files changed, 5 insertions(+), 24 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index a05e2015f..b10946781 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -16,6 +16,7 @@
>   #include <sys/types.h>
>   
>   #include "igt.h"
> +#include "kms_mst_helper.h"
>   
>   /**
>    * SUBTEST: dp-fallback
> @@ -47,28 +48,6 @@ typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
>   
>   IGT_TEST_DESCRIPTION("Test link training fallback");
>   
> -static void find_mst_outputs(int drm_fd, data_t *data,
> -			     igt_output_t *output,
> -			     igt_output_t *mst_outputs[],
> -			     int *num_mst_outputs)
> -{
> -	int output_root_id, root_id;
> -	igt_output_t *connector_output;
> -
> -	output_root_id = igt_get_dp_mst_connector_id(output);
> -	/*
> -	 * If output is MST check all other connected output which shares
> -	 * same path and fill mst_outputs and num_mst_outputs
> -	 */
> -	for_each_connected_output(&data->display, connector_output) {
> -		if (!igt_check_output_is_dp_mst(connector_output))
> -			continue;
> -		root_id = igt_get_dp_mst_connector_id(connector_output);
> -		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> -			mst_outputs[(*num_mst_outputs)++] = connector_output;
> -	}
> -}
> -
>   static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   			      int *output_count)
>   {
> @@ -83,8 +62,9 @@ static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   		    traversed_mst_outputs[i] == data->output->config.connector->connector_id)
>   			return false;
>   
> -	find_mst_outputs(data->drm_fd, data, data->output,
> -			 mst_output, output_count);
> +       igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd, &data->display, data->output,
> +							mst_output, output_count),
> +		    "Unable to find mst outputs\n");
>   
>   	for (i = 0; i < *output_count; i++) {
>   		output = mst_output[i];
> diff --git a/tests/meson.build b/tests/meson.build
> index 33dffad31..2cbd21c2a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -367,6 +367,7 @@ extra_sources = {
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_dp_linktrain_fallback': [join_paths ('intel', 'kms_mst_helper.c')],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }
>   
