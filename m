Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBA3EF371D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 08:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC8F10E4A8;
	Mon,  9 Mar 2026 08:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNKc+aVX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B22910E4A8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773046327; x=1804582327;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XbkdCoDKYB7RGfL2IQ7DrqOJoG6pLHWdpUi3DvoejBM=;
 b=VNKc+aVXUI1JTyfr1RsNH6bmhkDYm69SUQLwEMJmbXPOU6rssk1IZvmR
 lxfyg1ej+ftBFa3MnRY6OOawfsh7bD9VMDc74mrQS4KEbsDjBJH/Mdjmy
 nboycNejCAY1Lrs/ZuvfTBIkKvW4gCo7y56HZMWG6oyKM7JTzdgKeeIvx
 9u8la0/6KqrrGGxkBlqcRGbcNHA/llIGOXxcR2iMHZYCRFzQYmY7EDWZz
 fJNm0g0ML2pn/eDQwtl61ANtDN16VGLpSWFxVqRLha+n7I1R0ScI0JFan
 r/+D8LnOr0dlJpPrEjD6nxRkPn2dToxBTCJFf1ulU/fx8qlc2iB/kKh58 A==;
X-CSE-ConnectionGUID: SczIDoL1T0CrGaaOZeGRFQ==
X-CSE-MsgGUID: Ji71zL0XQyiYPaXRr0Tvnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74142366"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74142366"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 01:52:06 -0700
X-CSE-ConnectionGUID: 3XcKoyWrSGSjO7AeazEFvA==
X-CSE-MsgGUID: IIyw7tpGQgOblNsBBtBjxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="218893232"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 01:52:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 01:52:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 01:52:05 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 01:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqmQvZbjEDnzR1/Vazw6r0AMqB+98E3X7CKD/EksmQFIWyc+b9yIi6Vkih1QWTpsazOQM+f0LnsYCG7LRcp2DwQLDMwGXT2Pj69q5LT5CJscG74Lvhw8RZ50en6xU9jbI7pNsHHStMChqq0SRIArbzHgCxxnceys7MHrlalBmJo7rkfnXz50MfAckHrOdZlEvVgXb5dPlVzDasFv8HHmbqxduGjE5UGqXKB0dY+KXQ3NJAS8U+nJ0QE+J6acQ4Y6tkVZ1KPVx5JFsMmttjjngP6aXdvMbC1QCS20Ayd+1GeVjcKhOPIbuO7q8ZT6Xvz67ERmIKMHCmTrr9js0pC/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvypGnvjAsiAYPWhcjHZMpK2ExdVVE0cpK9oCPMHzl8=;
 b=Spke8q26K0RR6qUyMj2+9ulMso0L7siximRKspTmY5zRa3Qx90+GdtsLfWfPy5dKPDDxhWIR2p9V9eKluaIwJHvIlIZ31BLgFRG4l9XOVgcXbeN+1zz37vQUzafY0dMyeetS7h+W1uyAtEXOjbatmhs2weTUWVGD4pRYXtLjcftkFPhTxcDiwA3B5wkigGDN0mSU9v7kGbzxNFiKYnWBYlOOsBGoUDd6OCZebqpG75Iyphk3Z2kiv81WdEb489eWAHUfNmC07/tvuNDaR8qZby1WwAJGmRlMKPv0BOwb7bc2LVegTC3vDI0vMzVQYTlZ4jJTGU7CUuid5iWJdbEgKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH7PR11MB6769.namprd11.prod.outlook.com (2603:10b6:510:1af::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 08:52:03 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 08:52:03 +0000
Message-ID: <51d65dbb-c79d-4119-b814-66b862caeb4c@intel.com>
Date: Mon, 9 Mar 2026 14:21:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/kms_sharpness_filter: Detect and
 bypass joiner modes
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260304081746.2083480-1-pranay.samala@intel.com>
 <20260304081746.2083480-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260304081746.2083480-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0111.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::6) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH7PR11MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: accc7740-47c2-4c35-8111-08de7db92206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: OSbNfH0zOu910DxqU+O28jGz+O9WUBaqgAtxwXkK68wGMJL41Yb1Rx99DhCA40fVlVfK3XmUZs+1pQNBOsnAOE9hz8jMaBCzOME4GJ20LmaswCMLpMoh8icpcYmetGBX5GKdEksSrFLgKzPrxtf6LlrZv7yGXKCWAPe4fVWF08nbxx8QfGjftVMil1J/C3kEHa0tjGSjDSskXtPP4OGYTXD6YDOMMCRVV3ZRydou98VFnvreLZ/EX7LEA6KDo1MTJJz5Rf9WtWBhoAjjC4TazcvG8QrHRwfnQyrsQR7prHVamQiIPmtj7+kYRWqBp5pLNdRPDbL8FuQLYzppehDR3eOt+wtfbCXKt7LA4J7AHDB7Zj0K3dpV7JW4stnw5IdSrC9CwaB95E4MXd02LdGP1u0mJqFQVyJNs5E6vwaRk75WPOCt6PYJhk+KjYuf8dtLdiliqGgXQGXDmwIv3GIjjBSkZ1iCgxofk83egkyOS2arQ1dtqCquA0TiUod9aingpGgxVXyr0rBM4Xeq9/zWPi+pzEzqbsEYQY2CyLultjS++RZVCVBNOy3hM6j3NHBtQPqK80MD+IXbYDJgLd7Cn4EdThKgEzhXQfIB3EHO9GiRKnmMCK1uXHrlGuomdwXCl/h4HUq52br0MjykY1rBkex9Wy2UliaLHMgQb3FL8oPtABudWoadxoFaOfuqEQ4/EKDQEuEJCvSuzc+YpEo40TKMA0TprD3J17xm5VWxoFY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHpCNDkxaXZvRnF1blA4Kzh6eGZxeVRiUks4eFZRaGZibVhhNC8rdlBXbHBU?=
 =?utf-8?B?c0ROeUhpYTZUTHkrVVI4S2ZXWjRqU2ZRYmw2UHVNUHN5dGVVbmlVSjhRVGdF?=
 =?utf-8?B?UXFxdERFQURuQlpsZEhZNTR2aTRVNGhNL1FmTkRHQmNzSUt3bkdoYjlYeldh?=
 =?utf-8?B?cWpDb3E4Y0NSQjZHVlY0bWtoZXMyN1RWVkFPN3ZSVy8vbWRiS0VuUi9UcUZx?=
 =?utf-8?B?NVVhdUpxYy9mZkRtd1R4cFBTOXlDK2cvWEJoLzB5VDlCUkt1d0I1RllidHBT?=
 =?utf-8?B?amhUKzFoOUd1Y0dQQ3FWYmtPbW1SSmp0TTZEK2sxaklubDBjTnJYQlRpUlF4?=
 =?utf-8?B?cHNERzJGdTlkR2FMdjlpTG9lb0JIYk5iNzdKVkdjU2RWZ1Uva1ZjNDdJWUwz?=
 =?utf-8?B?Ym5yQzc5Zy9rdnlsWTZwdzR1YnV6bExRMkxENXZWTjBpTjB4MEIyWnRnTmJG?=
 =?utf-8?B?QkZFT1l6RXRBZlQvSmdkVnRBSDZDVHhSYXR1d2NkNEpxamRBcXlFT0pmOGFQ?=
 =?utf-8?B?b0NzQUcwR1NuOWk2YTNzUFRqS0VwNHdIQVVzTkVGSXpTZS84R2x0ejRQZkx6?=
 =?utf-8?B?V0ljTG5LRUJWbDM5TU15OVVMMlJTd3R2WDh6Z2IzNkh1bXNzL1lPOWtvWnJ0?=
 =?utf-8?B?aWVQUE4wSll0VGErbzlrQS9tN0JWOXFkUHdaTDRCM2oyUFF6enRaNkxiWWZD?=
 =?utf-8?B?bUUzVGNFYkVQTXBjRGtmQXhTVWhnTWJncHNjOFZYVVU5dFU3UnEzNDdRT1Zp?=
 =?utf-8?B?S2FkL0l4NFU3MWJMNzZ2TXo3Qi8yeHAvVGdweFI4cy93dzZrZ1NBRmZKNFpG?=
 =?utf-8?B?bVJuTlBUemxEWUl4L1VabG1oNXY3MHpCWlJTZ0N3d2NYNEdNSzhXREVhek41?=
 =?utf-8?B?MXFtN3VvRUdUanBBNVRpc1dCZWR2MWxSWWEralZmQnR5TkhqKzJpeUdEclRI?=
 =?utf-8?B?dWZyM0UybVVUOUtqbEVOc2ltN2V1VWxWWmJQaUpTWktHak5ZcUFCdmRUOWpy?=
 =?utf-8?B?VExrbzA3QXhXaC9JMkNSTlU2enkxMGpCcytUd0RsL1N4UFovR2hnbGN5ZGJN?=
 =?utf-8?B?NFFWNUJwci8yZU00c3RjTkpUOCt4dHI1UXN4OGVPRkZYRCtmTGc2d0U5dXd5?=
 =?utf-8?B?RllFUkVpTzBza1Q4L0wrZXdVdGdjcXFad2ZHY25JSURiaHBodmNaenRKakl2?=
 =?utf-8?B?Y2ZiWEdzTG5yL3FxWCtqM0FZbGJ4UXY0NGF2VWNmYTE2Q1A5aWVJR2hxZDc1?=
 =?utf-8?B?dGNwNkcyb3A3TW9sYy96a2pMbXF1RTlwbmhmS3RKNkZSUFpaYjUyRFhYYUIw?=
 =?utf-8?B?TzhoR3h0amxqM09wUU1hNk5vV3JoNENnYktEYmRiMnlwTTdtWTFidldNUDdR?=
 =?utf-8?B?VjdpRTIwOUxLQ2cvemRiTHdTNi9LSWhuVXM1T2VOVkNOdjVxQVUzY2k0QnlF?=
 =?utf-8?B?VEhQeEUvdHFYelE1c3BNcitibzhWREpSUVhxQ1NjZ0xURE1abXRIazZqN2Er?=
 =?utf-8?B?UGlQUmc0cGNHcXdYNXg1bTZ5amlUTnI4UjlwL29vTm1xcXhJTHRlWTBWSElN?=
 =?utf-8?B?OFgvQjEwMHhzdzI0bEhnSkZnVHZDWVRsUW96NlFWMnZsSnh0TVp5YnlDOXRV?=
 =?utf-8?B?aHZ6cno3V2VzS2dsMkZYOVdJbWdFNjM5MEwwSVBiYUlxTzlPaHRWUTZVTnNr?=
 =?utf-8?B?Zm1NSm5UMmdJQnhDNTBuc08vdERId3BBamVOYmRWS3gyUWt6ank1UWRqRlY3?=
 =?utf-8?B?bGU4aDVNYTVpRGJxOWJ5VEpuWWU3S2FXeVhuaFFKQlZLZlRtaUVzU3kwSnAx?=
 =?utf-8?B?MjZURmZpZ1BhSlRZRllLcGxhZGNrSk9aUXVyRXFpZnR1NnpPTEZJT2wrVk4y?=
 =?utf-8?B?WTRiN3JveTY5bVZFdEZ4dHluNHQvT2VTakpJZUhFTWhZeUluZlVDdVNNK0xV?=
 =?utf-8?B?bjFFSmt4ZFRGaDFYeGYrdFp5eGttcGNyT093dWhoc1pkaXhlZE1sQWs2b2l3?=
 =?utf-8?B?akJCMyt0S3RmTldrcHJTUmRCUHEvckZ1bEwyNjFNMHRmK2o1VGxnenRzR3ZX?=
 =?utf-8?B?ak5QWG1VSlZVVW9oYk1oNC9zYW9SWXZVOUdQNDl5VUhIZzMrYVNpU1l4R0I5?=
 =?utf-8?B?TlJrVVB2YVFwWVFkV2ltZ1R0dUU3TDloN2RMZXdHbmNpemxjb2ErRVZEbHRW?=
 =?utf-8?B?em9vQmYwY0VxZi9FWThpUzc0K0wrdWdmUStoeHhXd0x6VnMwUjRaMi9aYlY2?=
 =?utf-8?B?SDI4NnNGYllrSFVSQ21hWExEcXZNZjlpYm5VWFpLenIxUG16WW9taU1MM3VC?=
 =?utf-8?B?MjI1REUyRStIRk5QbXlxa2ROMDZFT1FBQ09lc1FSdDU0b3dPVHp1SGdPY0hL?=
 =?utf-8?Q?cRMgcZpAcPOOig+JXCVlNW8nHcFFDgJ3vux8d?=
X-Exchange-RoutingPolicyChecked: A2XrXYh/ThdcMOQXMWb5efCT6pcHjrDmopcmeTNfwJrPhKJvyQWXmjHRMrTuCygNYVhRzaf2ZgkgMov4yrtDDn7n+E+yQ7U4jms6/AWIFTJjcZbzTIEDRvVOajGMkPU/ndNVQUGT7CzxXBBa/2UiLVyZqy/me+iDQAERUZUPpNxxeqT1IPtCuplGFtb0AkC7SMlivMPydZvTtQG4enuFw1jvTnoKL8drp0SAzrv/CciqPBfJiDn9QQGW7zFVvdOTptx1Wl7uHtdsnwLXXS5gilz46gtsHk4/B0xqQTZjDUb0nkIu6qJG9DB/RoLau9ejktfxQTQf+lZtY6moYaVs6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: accc7740-47c2-4c35-8111-08de7db92206
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 08:52:02.9957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /H9gnCNRxGcCmuFatYli1FJnWvJ2g+nsukih526KmCsbC1kG1hJj6/vRjNMQy/6WJHayuvFi0qaMhXfhUOOFOcE7Qby6Wdw+6CoeZD0f8lbbCu4LqC4kfLfCRat+iqgu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6769
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



On 04-03-2026 13:47, Pranay Samala wrote:
> When the output configured to a joiner mode (Big Joiner or Ultra Joiner),
> switch to a non-joiner mode before running the sharpness filter test,
> since CASF is not supported on joiner configurations.
> This ensures the sharpness filter test runs on a single pipe configuration
> and avoid false failures.
> 
> v2:
> - Add FIXME (Santhosh)
> - Rebase
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index ba325b377..f71038a9a 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -440,6 +440,22 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   			data->crtc = crtc;
>   			data->mode = igt_output_get_mode(data->output);
>   
> +			/*
> +			 * FIXME: Joiner + CASF currently unsupported.
> +			 * Remove this check once support is implemented.
> +			 * Until then, run on non-joiner mode in joiner conf.
> +			 */
> + >> nit: Please Remove the line, /%s/conf/configuration.
LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> +			if (is_joiner_mode(data->drm_fd, data->output)) {
> +				data->mode = igt_get_non_joiner_mode(data->drm_fd, data->output);
> +				igt_info("Executing on mode %dx%d@%d\n",
> +					 data->mode->hdisplay,
> +					 data->mode->vdisplay,
> +					 data->mode->vrefresh);
> +			} else {
> +				data->mode = igt_output_get_mode(data->output);
> +			}
> +
>   			if (!has_sharpness_filter(data->crtc)) {
>   				igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
>   				igt_crtc_name(data->crtc));

