Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254D8CD3439
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 19:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EB010E516;
	Wed,  6 May 2026 19:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KM67Nnhs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F5910E516
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 19:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778095422; x=1809631422;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+7oUwQI1FmOnI/BQxXaIcpKfxPWLWJppGpAfFJBZsiI=;
 b=KM67Nnhs4FI3yauZzkS9WZgZ8WT8Y8+i19MXS+D95m19z5E0mgAKBmVU
 et2LmTWf/pZ+Kerj65U85smuCeJXEyhAL8eaJ4NemUrBvl4vhTY7Ig9gC
 ks1ecZUmyWz6MTzQOA0kLUVgIDm8LwUx5xiZxgYJY7aeLqr0EZkyQpxDt
 qFpmoU7AOqj5c8Si2wFS8Vn4xMvPgvkiQBg5g9x6d1yNHiRfcdcud0aY1
 HbfkYEoxe1QjZxaahQRAWadkCsd5+VK+J+SwTS7tZDxuecjXwdYmCNgln
 F8cBLk/OiiMCK988NDq4sqYimTjsabffXWVbK7h3KiWID3X5RMVIlHteY w==;
X-CSE-ConnectionGUID: BoUxXHKWTlO0uw/XSG33og==
X-CSE-MsgGUID: mHA39aOxQM6OfGZ3Gb+6dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79054502"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="79054502"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 12:23:42 -0700
X-CSE-ConnectionGUID: Yywru1weSoKyVxdbxsdeJQ==
X-CSE-MsgGUID: BHE8nxDgRnK9mKBpCxV5Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="240220289"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 12:23:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 12:23:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 12:23:41 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 12:23:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAmWzTHtEwKZgvuhqM8IgM5DEZS4/rK+r3Sa7bPnZANdTCC1jqpxhJfpl3Faqbt/PzmzBPdqi5LlkQCv3t/2wXZ9fyqbbo0a5vwY0qEFwAfgkqF3Uty6T1I7K1TAqN9RGOsjZCbjjPKjUKe+CBxYra+ld4d0Yb2j2SlfKGoMokLH7v2V2wYSsA/JL3EXV3qM1DZwOPcb0DPDWnvakRsL9YUc8tCw/g8W1l204K8xpZy7T+yEk3LmH1gB/JANw/QOWyI5pvUV6277cDkm8IQn/TwMICdappaMClvD2F7c2wkOJd2LyaaYI8oswoRXUcnOT28F1RjsZGTn0H3ZN8ZfSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUHAmmzBs7+KLRN3nLzeiM7lvvf87NnYKbwjr26lcpc=;
 b=UfbzRRF94rbulBiMvO/LgE45p0OHOARukRfw4juEWKFmVeEB/ieaAv8aERAmBcMP36OhSF4fav8Jyox380aCB80B8Uls2SD7es1nnMRYKl/cxycA/fF+DCgczk98NR58L+6SYIdkjNANgbNbChA7eWBRbCNAtDcsU2tihrauORZLr5Nwenl3VDvonJB8VZxeX5CHmN+nAXeN1qQnklq0IHrGPqMVO51ECdJAbUIKDh+oVaF6lHOs/EtGdx0RXY0KG7cf57o4Zj2CJblnEu1OheN2ZTIHWtc9knBcQPcKHdg5VYXmh7K3m0mpqCMHr/JAXs/GbsxKbDZnV4sLB8l8ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 19:23:37 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 19:23:37 +0000
Message-ID: <442dc101-5f1a-4499-90b1-089ea92122e3@intel.com>
Date: Thu, 7 May 2026 00:53:24 +0530
User-Agent: Mozilla Thunderbird
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t][V2] tests/amdgpu: Add amd_hdr_visual for manual HDR
 verification
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <Mark.Broadworth@amd.com>, <vitaly.prosyak@amd.com>,
 <kamil.konieczny@linux.intel.com>, <jani.nikula@intel.com>, Wayne Lin
 <wayne.lin@amd.com>
References: <20260505205743.1839944-1-alex.hung@amd.com>
 <17d2434d-90e6-4824-87b6-bf9a3644a275@intel.com>
 <199a3ae5-812f-4286-8546-2347dbf8ee9c@amd.com>
Content-Language: en-US
In-Reply-To: <199a3ae5-812f-4286-8546-2347dbf8ee9c@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0123.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::17) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 3425ce97-cdb6-4465-e2d7-08deaba4f8f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: DGxTezOm2OByRN6WAXOgydvj5aPr9O6UqvFbGIt9/E+nCc9JZYhg+MvvS1Yn6twHV9AzIlkEDuD7w/6MOLv6Xp9ClR9DhkznFqP1KG9a95pROi7vUMld19ATAGHZM9fOgKg0uXl0kPC4R48PBTUgmfVMO8kHbTRukBtZ0b+aKNXszALKqZ44tm6pprTDSwl2iUznXondqy8FbTJsBtZbSWRd5yRCU10fY73eeVsUiiLS+DJhgjMevFuqBaQsBgciMGYuJWyfbqH/uDF1Z6jCRCkrG+viAQP1Qs7QXUdYTCKq6w2a4opni+y1Z+o3wWSt8G2RYFLgPXojGXolKFWCuqaSPNQQ3lazAsEkySjxEgZNlh6EqwNsDH2WHF64L80DkSB8ttcxsvXeaH2l1ekdM9b0/qS/lCJ0YC/sJZijAZdvFqszzjpPu8ayEh79Xg8ByXGt6nu0CfXIFsYled9GLnDu7CFE32Byjju8lNhZLGYSioRSun9zK+PdByrgE8Mrro54SmABV6nbWxEFTyiNO2oV9bRN/t9qepzqhKwWOOP13v7SXjkSPDxmQTlvspEXDE2AHgKNu7H3IKNL5rHomWNc5iAg/EtkJQaZaFqSJ/w3pEDq7xQz/U/nfTBCk8IrGLLGcf9Rvq7gasIaQTlhdbczc0vbl3Swal5uWYC7uxZZkQq+7tS/UP3UX3a1lgsb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnlzWnBnM0ZQbHpua0tXc1M4R1QvR2Z6WGRyc3RweUYzcFdKYmRpR0lOa3N6?=
 =?utf-8?B?VzhmQWdheURHT1hxNng2d3pZQitrTXY4U3MyVW5vK1Z5UEdUSXZyaFdKU3VH?=
 =?utf-8?B?YnlNRjJSM1pYWVJyZVcrSXROTkJCendWVjYzT0N4dTZMVWtXMmMxbkZ0cHhN?=
 =?utf-8?B?ZTZ1amZ0QTd2ZlNPNURBMmNPYy83ampBM1AzNzRpVmlnSVdCNnhFZG4wQ01P?=
 =?utf-8?B?SXc3TDBkby9kZFpmOEd3Vk5GRlV2aXpaYjVZRDk2MVpxYUxUMmVnT3B1NzE3?=
 =?utf-8?B?eWRjYW9iSnNxUitMWnF5R0NCRnEvYnZNbFFDM1FBcnVJenErQ2RWTmRzdDZ1?=
 =?utf-8?B?RW4wVVF2elExRWdiWDcxR0E1ZFR5b1FpOURzRWoxTzRyZDBRcGVwbnB6WkhP?=
 =?utf-8?B?YkdkYXVTbkxVbmdITDgzZmdOMTc4ZE1lVmovYnVJcE82UjNZMUQvNThGSThy?=
 =?utf-8?B?K0w2NXp5Um40UmRZODI4b0ptRXFPUmplNkdXRjRmVS9rRURSS1dmTWRmUkFN?=
 =?utf-8?B?ajhGVjl4bk5BOGJCYVE4SU5VVk0xUzZob2IxOHF2TDJ3TWFTZUZjR1BIZlVH?=
 =?utf-8?B?ZjJhWm90T0ZQZWJrQ2g3Z2hYOVFDbnRzMnRUSFovajlPRWdzaGNIdkNwSTFQ?=
 =?utf-8?B?M3IvSjZNRzhMTHo3NjRDSWZGRXI1ZlpoMlJGNHlBOTU5VTlkQXBNVk01bXNO?=
 =?utf-8?B?eHNsQ3JTZWx0am9xdlo1K3M3MDkyNHg0RENsb0Frdko5QW5DSVhLUHQxQS9V?=
 =?utf-8?B?WXUyVzZEVWp5L094TTF3VHpjdE8zZlZCNjZTV0VVQlByWGxSQ0hISFV4ME1L?=
 =?utf-8?B?dlBqd21BK3M3OTNwUkVzU1BLc0FDQytRekI5R0RJdCtwTEVXSW42eWJKR0FQ?=
 =?utf-8?B?U1dpS3F4NTlEbitkTVlMQWpmSHNRZFBzYnkrcTFmVUJadmkyU2xEbkpPT1ZD?=
 =?utf-8?B?NzV5Sk5obHoyVXBibk16b01BbEtrano0RWx2T0w0QUorOHE0RnNVYUkzK0lX?=
 =?utf-8?B?aldDckFPWUxwOTM5NDFMMHlycXZLT0VBaUdEVlpqTDU5R1BubU0vUy9rMjVJ?=
 =?utf-8?B?YnQzclQvU2lNc0FhUno4Wk9pQ0tFVi9NMnJEaGlva3c2bGpYdjM5WGVSNVVL?=
 =?utf-8?B?MjVHUDNubkVFMGJST3hYblRnSDdidUQ3VWwvY1ZQQU9hL0FLL1BSbmNOZWNP?=
 =?utf-8?B?V2o5VUVmZzUzRGpFSGI5ZVlRQ09Wajg2RnBaOG9naVh2U01WR2p1NXYwT2pv?=
 =?utf-8?B?RWZoMksvYyt5c2RtNHh2aksvWHIxdjRwMzYvN0tZRFBiS3pibWEvWEU1WU1Z?=
 =?utf-8?B?RU5FRGdQdDRmeHpEdHQyZFY0UDVKZlQrczE5V3Arb2IrUVVHMlhRSnhWai9V?=
 =?utf-8?B?d0l3VXhrbUdhZ2djemltTkRudkhqQ0FYV1NzTXk2K2FqYWVZWVAvTjFxODNx?=
 =?utf-8?B?c0xIaThjL2UrOUlkc3pFSlhkV0I0dUZsZkRGQWxSSGxIR2lCODI4VWY2OHQz?=
 =?utf-8?B?Ri9xK3NMMURSL0R3aUFJM3pVdTFSNFZ4eWpyUEw0aWxsd1JNY3Q5ZFJpd2Vj?=
 =?utf-8?B?Wm14MVlaNWVIZFVHcmE3b3MyRi93cFljWXl0YWxkVy9uUCtNaXhDelkvMFBO?=
 =?utf-8?B?bUJLZjhid0YzbTVJWFBTUFJrb0JjK1R1UUtIWDIzVEtpQzJEWlRoNkRKcnBy?=
 =?utf-8?B?WlozaWJSYlYxV2FBeXhlcjVaOGhQSTNSSnk2dllIQndsMm94dSt0YXh2Ulc1?=
 =?utf-8?B?QnYzNFJCWkphWnMzeUxqNngrb09JR3lWTzdKeWxJeERzTnNPR0JuZkFzVlNk?=
 =?utf-8?B?Z2dKbmt1YUdLaVhLSHJoS2RhMllNL2VPNUs2amZlZDhhbjdHY1YxcjE1Z2JS?=
 =?utf-8?B?SU5pM2ZNSjBKYzB6Mkx5T1FFMkFqajYrTEdzV1RmOGxRRGNIQUlrMkl6K1l3?=
 =?utf-8?B?aUdsbmFLcWxRZVg3T0tNaFNyeUFMR3BxUHh2Q0NsV3Z1SStDL2xMRUhUV3c3?=
 =?utf-8?B?UGk5L08zbE1pUXV3UHdoQ0pQNDBwUy9scGZ6M1FCdmU0Q1BiMG5nekdVc1F6?=
 =?utf-8?B?VnFmWjBlU2NYMjlrMkpwOHlYWUhuOGlDTk1HeHFUZ0hIWWZhbmlRc1JzemRI?=
 =?utf-8?B?YkZUNCtqZHZtKzRZc25SOCtUcEtpK3NwckNZQTN4c3hYN1Fyd1RKNUxZNGpC?=
 =?utf-8?B?bW45MjRzWExyVHFNdmt2ZldQcE44RWVzN3duMCtRWXF3SHhBQzdEblp2SDRF?=
 =?utf-8?B?TVczdlNlZTRwREUydHZBYy8zNWtVNzcxcDBmbGphYURKQ3FMWm1MRHlHMy9T?=
 =?utf-8?B?Q0NIMVVyRTl2NFU5YXdvalpIbDcxbTdiNWh4S0pPWDNTMVdnUHNxSHlyTXM5?=
 =?utf-8?Q?vt3kEUhC0TGezGd0=3D?=
X-Exchange-RoutingPolicyChecked: ZRXb67pQCTa0Z+tAsbRh/cXAp260X7tg0muDoP9IYrZW5FBxHzgBJ7B3Tm94EUdSG0iOqTOQtsWJet59wYKXQC9mYTBAaI2x0uq3ylaptBB/sQ/YeaVppZD9EYkIAT73foaeQih3xBv53dJGzb0LMJ36hmHF+v8xdICMJNHdUih5uVGBLdabbEzFrje/S3O8qq2fHA/RoxEgM+hRbf1M3p8Qxgm5drRewGVjGuiy+u5jyJ+W+LxC5S2DLVIMZ8dF2IhSSjFh9sjdlzOGbWrJ9G7GgkuJzbNYIZkdpClWnqIR2nRWE3WhvkU1aT22HFZy4HB6ciz9WEImnoXNuxIuMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3425ce97-cdb6-4465-e2d7-08deaba4f8f4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 19:23:37.4570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYWr0p5CcieZv6z4yN0rplPDoEQ3zNbODKDQDo++PoVPIny2Gr3h7194jJhWCzieeSNGspGZ+d7UwHYcVEGJxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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

Hi Alex,

On 06-05-2026 09:10 pm, Alex Hung wrote:
>
>
> On 5/6/26 05:43, Sharma, Swati2 wrote:
>> Hi Alex
>>
>> Can't this be part of kms_hdr?
>
> Hi Swati,
>
> I thought about it but it may not suitable for kms_hdr for two reasons:
>
> 1. it now checks amd driver and it has never been tested on non-AMD 
> devices. I'd be happy to remove AMD dependency if it works on non-AMD 
> devices.
If its okay with you, can you add these tests to kms_hdr. I will get 
this tested on intel devices.
>
> 2. This test is for manual verification. It pauses for a key press to 
> continue, so it can interrupt kms_hdr workflow.
We do have such tests in IGT like kms_dsc.
>
>>
>> On 06-05-2026 02:27 am, Alex Hung wrote:
>>> From: Wayne Lin <wayne.lin@amd.com>
>>>
>>> Add a visual verification test for AMD HDR display output. This test
>>> displays HDR test patterns with different metadata types and waits for
>>> user confirmation, enabling manual inspection of HDR output quality.
>>>
>>> Subtests:
>>> - static-swap-smpte2084: Display with SMPTE ST2084 (PQ) HDR metadata
>>> - static-swap-traditional-sdr: Display with traditional SDR gamma 
>>> metadata
>>>
>>> Co-developed-by: Alex Hung <alex.hung@amd.com>
>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
>>> ---
>>>   tests/amdgpu/amd_hdr_visual.c | 176 
>>> ++++++++++++++++++++++++++++++++++
>>>   tests/amdgpu/meson.build      |   7 ++
>>>   2 files changed, 183 insertions(+)
>>>   create mode 100644 tests/amdgpu/amd_hdr_visual.c
>>>
>>> diff --git a/tests/amdgpu/amd_hdr_visual.c b/tests/amdgpu/ 
>>> amd_hdr_visual.c
>>> new file mode 100644
>>> index 000000000..63eed937c
>>> --- /dev/null
>>> +++ b/tests/amdgpu/amd_hdr_visual.c
>>> @@ -0,0 +1,176 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright 2026 Advanced Micro Devices, Inc.
>>> + */
>>> +
>>> +#include "igt.h"
>>> +#include "igt_hdr.h"
>>> +
>>> +/**
>>> + * TEST: AMD manual HDR visual tests
>>> + * Description: Test HDR metadata interfaces by showing visual HDR 
>>> patterns
>>> + * Driver requirement: amdgpu
>>> + * Mega-feature: Display
>>> + * Sub-category: HDR
>>> + *
>>> + * SUBTEST: static-swap-smpte2084
>>> + * Description: Show a visual HDR pattern with SMPTE ST2084 
>>> metadata and
>>> + * require user confirmation.
>>> + *
>>> + * SUBTEST: static-swap-traditional-sdr
>>> + * Description: Show a visual HDR pattern with traditional SDR 
>>> gamma metadata
>>> + * and require user confirmation.
>>> + */
>>> +IGT_TEST_DESCRIPTION("Test HDR output metadata visual verification");
>>> +
>>> +/* Common test data. */
>>> +typedef struct data {
>>> +    igt_display_t display;
>>> +    igt_plane_t *primary;
>>> +    igt_output_t *output;
>>> +    igt_crtc_t *crtc;
>>> +    drmModeModeInfo *mode;
>>> +    int fd;
>>> +    int w;
>>> +    int h;
>>> +} data_t;
>>> +
>>> +/* Fills the FB with a test HDR pattern. */
>>> +static void draw_hdr_pattern(igt_fb_t *fb)
>>> +{
>>> +    cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
>>> +
>>> +    igt_paint_color(cr, 0, 0, fb->width, fb->height, 1.0, 1.0, 1.0);
>>> +    igt_paint_test_pattern(cr, fb->width, fb->height);
>>> +
>>> +    igt_put_cairo_ctx(cr);
>>> +}
>>> +
>>> +/* Prepare test data. */
>>> +static void prepare_test(data_t *data, igt_output_t *output, 
>>> igt_crtc_t *crtc)
>>> +{
>>> +    igt_display_t *display = &data->display;
>>> +
>>> +    data->crtc = crtc;
>>> +    igt_assert(data->crtc);
>>> +
>>> +    igt_display_reset(display);
>>> +
>>> +    data->output = output;
>>> +    igt_assert(data->output);
>>> +
>>> +    data->mode = igt_output_get_mode(data->output);
>>> +    igt_assert(data->mode);
>>> +
>>> +    data->primary =
>>> +        igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
>>> +
>>> +    igt_output_set_crtc(data->output, crtc);
>>> +
>>> +    data->w = data->mode->hdisplay;
>>> +    data->h = data->mode->vdisplay;
>>> +}
>>> +
>>> +/* Returns true if an output supports max bpc property. */
>>> +static bool has_max_bpc(igt_output_t *output)
>>> +{
>>> +    return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
>>> +           igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>>> +}
>>> +
>>> +static void test_static_swap(data_t *data,
>>> +                 void (*fill_metadata)(struct hdr_output_metadata *),
>>> +                 const char *mode_name)
>>> +{
>>> +    igt_display_t *display = &data->display;
>>> +    igt_output_t *output;
>>> +    igt_crtc_t *crtc;
>>> +    igt_fb_t afb;
>>> +    int afb_id;
>>> +    bool found = false;
>>> +    struct hdr_output_metadata hdr;
>>> +
>>> +    for_each_connected_output(display, output) {
>>> +        if (!has_max_bpc(output) || 
>>> !igt_output_supports_hdr(output)) {
>>> +            igt_info("%s connector not found with HDR metadata/ 
>>> max_bpc connector property\n", output->name);
>>> +            continue;
>>> +        }
>>> +
>>> +        if (!igt_is_panel_hdr(data->fd, output)) {
>>> +            igt_info("Panel attached via %s connector is 
>>> non-HDR\n", output->name);
>>> +            continue;
>>> +        }
>>> +
>>> +        for_each_crtc(display, crtc) {
>>> +            if (!igt_crtc_connector_valid(crtc, output))
>>> +                continue;
>>> +
>>> +            prepare_test(data, output, crtc);
>>> +
>>> +            /* 10-bit formats are slow, so limit the size. */
>>> +            afb_id = igt_create_fb(data->fd, 512, 512,
>>> +                           DRM_FORMAT_XRGB2101010, 0, &afb);
>>> +            igt_assert(afb_id);
>>> +
>>> +            draw_hdr_pattern(&afb);
>>> +
>>> +            /* Start in the specified HDR mode. */
>>> +            igt_plane_set_fb(data->primary, &afb);
>>> +            igt_plane_set_size(data->primary, data->w, data->h);
>>> +            fill_metadata(&hdr);
>>> +            igt_hdr_set_metadata(data->output, &hdr);
>>> +            igt_output_set_prop_value(data->output,
>>> +                          IGT_CONNECTOR_MAX_BPC, 10);
>>> +            igt_display_commit_atomic(display,
>>> +                          DRM_MODE_ATOMIC_ALLOW_MODESET,
>>> +                          NULL);
>>> +
>>> +            igt_info("wait %s!\n", mode_name);
>>> +            igt_debug_wait_for_keypress(mode_name);
>>> +
>>> +            /* Exit HDR mode and enter 8bpc, cleanup. */
>>> +            igt_hdr_set_metadata(data->output, NULL);
>>> +            igt_output_set_prop_value(data->output,
>>> +                          IGT_CONNECTOR_MAX_BPC, 8);
>>> +            igt_display_commit_atomic(display,
>>> +                          DRM_MODE_ATOMIC_ALLOW_MODESET,
>>> +                          NULL);
>>> +
>>> +            igt_display_reset(display);
>>> +            igt_remove_fb(data->fd, &afb);
>>> +
>>> +            found = true;
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    igt_require_f(found, "No connector found with HDR metadata/ 
>>> max_bpc connector property (or) panel is non-HDR\n");
>>> +}
>>> +
>>> +int igt_main()
>>> +{
>>> +    data_t data = { 0 };
>>> +
>>> +    igt_fixture() {
>>> +        data.fd = drm_open_driver_master(DRIVER_AMDGPU);
>>> +
>>> +        kmstest_set_vt_graphics_mode();
>>> +
>>> +        igt_display_require(&data.display, data.fd);
>>> +        igt_require(data.display.is_atomic);
>>> +
>>> +        igt_display_require_output(&data.display);
>>> +    }
>>> +
>>> +    igt_describe("Tests swapping to SMPTE ST2084 HDR metadata");
>>> +    igt_subtest("static-swap-smpte2084")
>>> +        test_static_swap(&data, igt_hdr_fill_st2084, "smpte2084");
>>> +
>>> +    igt_describe("Tests swapping to traditional SDR gamma HDR 
>>> metadata");
>>> +    igt_subtest("static-swap-traditional-sdr")
>>> +        test_static_swap(&data, igt_hdr_fill_sdr, "traditional-sdr");
>>> +
>>> +    igt_fixture() {
>>> +        igt_display_fini(&data.display);
>>> +    }
>>> +}
>>> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
>>> index d5a4820e3..7db1e2d9e 100644
>>> --- a/tests/amdgpu/meson.build
>>> +++ b/tests/amdgpu/meson.build
>>> @@ -90,3 +90,10 @@ foreach prog : amdgpu_progs
>>>                          install : true)
>>>       test_list += join_paths('amdgpu', prog)
>>>   endforeach
>>> +
>>> +test_executables += executable('amd_hdr_visual', 'amd_hdr_visual.c',
>>> +                   dependencies : test_deps,
>>> +                   install_dir : amdgpudir,
>>> +                   install_rpath : amdgpudir_rpathdir,
>>> +                   install : true)
>>> +test_list += join_paths('amdgpu', 'amd_hdr_visual')
>>> -- 
>>> 2.43.0
>>>
>
