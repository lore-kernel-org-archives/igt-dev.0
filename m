Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C882ACCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 09:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7491D10E866;
	Thu,  6 Nov 2025 09:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaMKM8QD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA32E10E866
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 09:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762422364; x=1793958364;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zvEPlQk5lShVd9Drp8CzolwsRdLTHIKxcZmjIPD2Mvk=;
 b=OaMKM8QD7U3CFt9VbsLtNTF2lX5hNJY6nACkgmMYpeP2wwrCZMVuOhlN
 khHVZAR6VBw62LH6EtokgirSBpcRGHkfpIF7U8ZYQgBMmqHlhLYn78XKT
 t+oE8tJ488gC/86tE3ir2wwDT4FuLnGDPRKTn3wa8URXIENGg+g/3iOYu
 DqqLKsitLQAfdfG+9F8TWl6FhpDP2tbmMbIuHKWB6eT+lcvq+BPT3xKdI
 iWREl9x0RA3DSj/CALXvhI/Uwp/ugEfxPZHR9xXh+NBuG0gmUiEUO33ZP
 hkMvz9jb0lnMpgqGdC4qAfG7mFVkh4qzmzFcNyIdzN1cxTq8h3Vgs8iFa A==;
X-CSE-ConnectionGUID: yd2FCNWoS160bzcw0t/FeQ==
X-CSE-MsgGUID: FfTmLVglR/+umegxrrvdPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="76004312"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="76004312"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:46:04 -0800
X-CSE-ConnectionGUID: 7y05gNKYQw2vyw0y6CXSLw==
X-CSE-MsgGUID: nHiyeZcZS5Cjrwqa4g2A7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="192070888"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:46:04 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 01:46:03 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 01:46:03 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 01:46:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuDfmadmg+IeqGvoALN+eKHHhPwAdJ120IvTJzMPuyrAT8Y/aCq0XiQ5/XtBgLxG+O0XgCyl2PV49t0Ss/Sb+SIKa0j0yeD/Rl/sK1WgfHaFW0ET1h3SLrwNWc5GN/YuECpCfI8ja1rwI4ITV49JXpJMCTnr9I+cL1jjBF0ZEOON7l8L9WF0suJk/YhVwm3Qiq57xVT096cnXABoni+VNtgo/zu0GqjqWoO3r+alERC+d05qr/a0jc9RKRIPbhKC6+Awih1XNz6X6cAtHr8blJ7wjGx+/Xz8d7UgRT2zzZwjoNgfd7Mz46w4cPXwlCohkb2Zc5O6LiWC2tSuXNKshA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKelXsB4bwZgtKBC4TrnTCQMcFW8mXM9LEd2/6Bhygg=;
 b=y4Yq9unRGBj913ljfWvKHZEDl3vwUZ2EcqeY+m3HS/DWOnp53YFbprq4r1JihUgxbfKIanQG5pvXy9O/1Jt9iC3+ljx1Zs3PXy3SyHzI5XLv05b+eqmAs5VBZZPCXGoG6MnBbeeCmptqRAxR0mY8GFTnflk2Ey2Q0EGN4igPdw+cOyhOOXY+UJNfhdU7ne6U+a+vUBPuuU3TCcD+Gxy53XeU4e2YZK207sXWGKpWom2OAAkPnI79sk7KvLz+PNv3Zj6lhDbs0TcwexhDt44EE88L3nQ59kZ7vQF+R63qYR4nluBOv14H2aR6lTOeyaSDencc4hESW1FsCpv1narvOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by SJ0PR11MB6791.namprd11.prod.outlook.com (2603:10b6:a03:484::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 09:46:01 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 09:46:01 +0000
Message-ID: <a105aff3-5fe2-43e4-a8dc-82c3ef9ddff0@intel.com>
Date: Thu, 6 Nov 2025 15:15:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_vrr: Avoid NULL dereference on cleanup
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20251106050851.1502869-1-ramanaidu.naladala@intel.com>
 <CY5PR11MB6344132D4932373CCD3C4366B2C2A@CY5PR11MB6344.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <CY5PR11MB6344132D4932373CCD3C4366B2C2A@CY5PR11MB6344.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0119.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::16) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|SJ0PR11MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 075c3f6e-6d25-469c-fbac-08de1d194b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnhYS2MzSHJoeWw3NWNDVW1RZy9QdVRGV3B2bkIwRWFLemtDNkZqVUdPWlBM?=
 =?utf-8?B?eTNvanBicEJGZEhvWXFpOGl0QnlTeVUzWjFSdlIvVmh3OGxiVS80NTM1VGQv?=
 =?utf-8?B?eER4M2NkdTdNMHpGM0grQXFBTlE5bUdPVDN0MzRUcU5VaEt0TUlxQ2h4WW1R?=
 =?utf-8?B?Zi9Nd2laT1pqYlZVQmFhU3FIWm4vYkNsU1ZBdGdJUXUzZGpnYmFuNFhEWTJk?=
 =?utf-8?B?U0hGRzVwbk84clNGY05DSXppbDkyVkpMWEk3YW9qTFU5SzhyM29jY3lSeXZQ?=
 =?utf-8?B?TE5SWDYzdFBSOXAwYjhkeE81Z3JQdEJxRWFZbStxUDRPOGFxemRpTzlSOGNQ?=
 =?utf-8?B?c281UkJrZGEzTEhueTZ4S1NWd2NjMHB2MGxBOEVaa2hHb2tabnlRME1iOFFn?=
 =?utf-8?B?TkF4cElpR3FEcm9yQWN1WlprNnhXeWp2Nm4rTFNrMm1sbk9qQ0djK0lJWmx3?=
 =?utf-8?B?aitSRTg2ZVllZmNlNFRvZHJrT2lKNzRpOGNhd0szNlptcXVaNnN3NE1ub0xR?=
 =?utf-8?B?eFZqKzNUOEJ2MGNSMTlJSE9SOWRYY3VhdWVjeXVwTEhQVFhxQUtwMjVCZGs0?=
 =?utf-8?B?d2tlRHNUT3lBUG1DV3ZZdHpVZFB3Nk80K0duajF3Q2pVUTdWWEdWZTA3eVp5?=
 =?utf-8?B?dkxGQ3AwQ3c4T1VhbUpaaml2NXNiT0JlSlhHTFFqWEhBUzlIMTNQWjhsazhY?=
 =?utf-8?B?Skt1RWMwYVZtZFcyWEVWeDlKZWt5TnBXSmVFL3JYWW5XekY5N1lWeDlkQVFT?=
 =?utf-8?B?OUJ6WUJVVmFhbXJNSHAzbXBTSSsxSGhYeTROYVg5dERYV0E0UklqZGNxOE5F?=
 =?utf-8?B?RzFjU0lyNEhjbno1aFlXWTFjVWhJeEFvYkFLUXB2ZFhTVVNIUlhUYTBSQ0xF?=
 =?utf-8?B?UXNwTUNzVjRlQnROY0QwNmJqa3hHeEtUc1BhdTJLdjFkRi9WaDFnTXNlWHlC?=
 =?utf-8?B?U0xTWlJwVFFjRUtNNEJHZ21najU1cmhKODlEVkVSYUxyYit4MC92aXRqL3pI?=
 =?utf-8?B?T0tVWGNxUE0zUVppcUZjZVdSTk8vaHkwQS8vMFR4WTJqMHFQQWIzZnFhK29G?=
 =?utf-8?B?YnRrcnV3VlUrdWYrbG9hQkpMcURVZUllMU1OY2pMRk9JalEvUnZxQm1aWjRS?=
 =?utf-8?B?UzNLd0tVWlk0cTR0VFlZeTZRN0RIUjk4R1U0ZzBEN0tNN0x5czJMWmt6N2NV?=
 =?utf-8?B?L2Z4RXJRdFVIOE43NDQ0bGFDSzZ6NTFRL2ltNk0zOUJSaTZwVEFkSmNWVmlH?=
 =?utf-8?B?aWxQUmlKRTZ0NzJkUU1BcmgrVE05YVEyTmp4Y2lSWk44MUY5dUorQ0h1d2Vq?=
 =?utf-8?B?UzRXU2dueXlHbDh5bEJ5V0ZZU1BNdkJUK1cvU29YQllNVC84OGRuSDJod05n?=
 =?utf-8?B?UTBXZ2FqSDBSZGM4c3ZjR3Y1TWV6OGJPR1FTeEZncmtSWDU0cnAwMHBIczhh?=
 =?utf-8?B?S2gvc1hjdEpQNkpPQnRURDNiSkRmMHdBK05kNkYwdmg3dGJGYW1Jck1SQ09q?=
 =?utf-8?B?dk1EZnJKeUhmOG1XcW4xMDRvSnpjam0vSEtKbEdyZGQ1V2pFa09Janc3WUFv?=
 =?utf-8?B?Snd4WitBUlJZL0JTN2ZVZjNXdzNHTkdiOFd5bFZYWWo5K01KRE82eVhLa2lv?=
 =?utf-8?B?d1kra3ZDWkliUU02bjRBeUFxa2p3UngwQUxWd2FtR2lwUEhEVEV3bnZkMlQr?=
 =?utf-8?B?YTQra0lzaEJtTUErRmdsRHF1M21FMmZDR2NpYjlpd2NNK0hodUY5YmgvOWRQ?=
 =?utf-8?B?U3Y1bElnUnZlcndVbE1LVzJKMnFhWWVqVFJYT1BiRjdKWUpnVVNQVjAySjRt?=
 =?utf-8?B?V2NYa2JvaEYzOEswWVpLdk1xdUl3bThpbVdxWnhSSUFuSjBuRlJGcENQdjkr?=
 =?utf-8?B?NFdFWmkxMGNCNTNYOTY1VEltRWt1R1pvMkIrZDFld2h1a2VQeUxJZHl0MjFv?=
 =?utf-8?Q?obSUnmhXFTMHOtPzfknGtKQ/gJ4JFCy5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mnd1anR0a3lHcGtsSytCWFZSMEMyYnZ5UWtkZGhvWlF4aDdtTEhuT25mUTFJ?=
 =?utf-8?B?OHBuV0RwNHZwQmluOEVyajVvUzlBa3VXRVN5bXhkWkU5bm1aSjhGT0xYWk5z?=
 =?utf-8?B?KzN1OElRMnQ5VXU4dkFaTm5vZnpaL1BRVldqZHdjTHFYd3pMcHhKTmN2MzZS?=
 =?utf-8?B?V2J3TitBRmFRaUtGdUcybEczR3BUdCsxWjNFeWw4MDF3STkyYWJ0QlU0TTN2?=
 =?utf-8?B?b2xnWFl3OG1tcHErR2ZLbmxVSWtXM1pLaDVDdzExbjdCUHBGWURmYkZBaHlC?=
 =?utf-8?B?WFdsTThUaDdDcXFVRHB2cHRmZUhEY21tR3F2WUpDY1lGRWJ1c3dNaXV6clM5?=
 =?utf-8?B?T1hJbUlNQmk5NmdudHB4WjlZNzkxT0lPeVAxM1A0SjhEczcxVGN4SkVWMlE3?=
 =?utf-8?B?cUVDS1d6QjkrZ250WXBiMS9IbW91eisvS1QrckIwVWZGcnY5WGxBK25wQWpB?=
 =?utf-8?B?YzhKelRIWkFuUEZ3cGlpc1U1Z1Q1SWtFbWl2d3h1UTVtZ0hlaHZLOXZyR2Fs?=
 =?utf-8?B?M3BLZzBxODVuNHF6LzIraVNLa3h6b1oyQ2J5ZExycnZsR3RWb2RYSkkvTlFu?=
 =?utf-8?B?cDN1RENJVGxNTlNKWEpCVnlwaTBRMk9IRnBmaEdFNlhkS1ZRSHhrajY1NTVS?=
 =?utf-8?B?cEJjVnRDMjBpVGpybEdCMUwrbis5K2FmdDh2b3JnRkQ1RjZtZC9RcnJzTXhp?=
 =?utf-8?B?Umh3ZEx1bmFFL2Zjbms3dEhyQkZuNUZ4MUJjVEtTK0QyQTAweHE2bkpLOEht?=
 =?utf-8?B?ektpZjc0SFVOTEtJRjVxRjdSWkpqT3JrQXdJSDYyVDR3MzY5d1pXVXJKZHlt?=
 =?utf-8?B?RGRQYlJWYVRiOFpJcitkVGZFRERyWXN5TzRJTHNhOHVJMG5UaDRlRHExK3Fx?=
 =?utf-8?B?LzRSb3RYSmRUaVJlU0tuS2YvTzFmR1J0VmQwbURONllVUXZPdGExY3Fuam8v?=
 =?utf-8?B?TTJUUUgrRTNnZ2ZROWplZWJhU0U0bVdlRE1mVStkTnh6VzAyeDF4ZGh6ekk1?=
 =?utf-8?B?Q0k5R0NKOEFlUkhUaDNlbFVzelpIWEc1YWVWazBpenk1M3NQODZLeDdVdHFZ?=
 =?utf-8?B?Ly9TamY2YUVzaGIvWklxQkR0WFJ3RFRrMVhCb1k4UmI1T1k1OXUySjlBeVRI?=
 =?utf-8?B?SXVCTG4vb0NxOEhUdXdrQnBuWlY1eWt6WDZ6emZLY3kzajFNeEErTUEwaFpY?=
 =?utf-8?B?ZnA2anBGVmFRVDREbzg5U1BXeUNrTFlEMXhUSEtDUGV1cVRnNVdONjJ5SDFP?=
 =?utf-8?B?RVgybVZOT3BrLzE4Vkxzek5FeUhjdW03cXRFd3NKV3pRY1RkUVlLdHFWRCs0?=
 =?utf-8?B?NVl6R2FCTGV6SU54M0dMdkZNM2Z5VGwvZXVEUkhNbGJZMyt6WTV3emJaVkhJ?=
 =?utf-8?B?UTB6V0grbUdrbC91UDA5ZVRZTzJoaGU4YXZGd3FFV21LYlFzR0ZXSUljM29X?=
 =?utf-8?B?RDR0cENqMFMrbDR5MUtaclYxYXE5MFlKdHJ4dDNGN0JDVmRFQWxrUWUzSlI2?=
 =?utf-8?B?ZkphMkxLMjBsNjZtNXViVWJ1eU1KYU9rb1NjWTNicHBKQzRMUjlnRlMrTUJh?=
 =?utf-8?B?R2c2SnJkSE90ZitnRzJLYjZoYTRiY1NQb3greXo3TW43bWVkdjY2MkNwT0Fm?=
 =?utf-8?B?TDYrSkhFUStXeDZLL29EMTgwRGlHSW9GQnc0RHBscVF5ZEJqT0ZrQ2M2clMy?=
 =?utf-8?B?MC9HUkc0cEVDK0libmF2Y0lWdXNpQnZ1Q2twNlBqTDl5d0txNFFGRVBzc1Qy?=
 =?utf-8?B?OE9vdkhuNmhuODRKQ2IrZElUUGVzbXdSRW84amNFci9VL2ZSSUVkRmZGeVhu?=
 =?utf-8?B?MjdlTlQ5MFU0ZDdqY3ZNY1JRMjNyUi9rRmV6UGdpM1kzK2UxWkNQQlAxbHlI?=
 =?utf-8?B?S1oyWUkwb0g5bS9YYW9BdGc3YnAzdTkvWlRxT3E3bWhBR3JoWG9sT0k2V3hi?=
 =?utf-8?B?d1ZvazRVd3lZNlFGVHJaN1ZzWFp3blBhMkExM2hXU21JZ0gvMkV2U0svditk?=
 =?utf-8?B?aVExYmtqZFlESXMzc0Q5bDh5ekVxZGM1a01MSEx0dE81eENTMFZJYkVKRUx4?=
 =?utf-8?B?ZTZBSW14bER4ZVlJemxHWTgrN0Q4SmFkNGVHZkRnZEZFNVduczJZWE1rTDRB?=
 =?utf-8?B?SzU5b2tjMGJyRm1hTkRXUElFU25rQWdYL2hOT1kweFZ3UUlSRHUrSDVtNDIw?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 075c3f6e-6d25-469c-fbac-08de1d194b67
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 09:46:01.2748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8uGsVx+rOrgckX5TPumgvXDa2DTOHmK2uhjCd6rmPf/bmmHRRCpIEUUAaSrCCLVpiv39q3t7QCFqTAJIL1C+W8x0JgGofaKVyKQG2CeGKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6791
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

Hi Mitul,

Thanks for the feedback.

On 11/6/2025 2:57 PM, Golani, Mitulkumar Ajitkumar wrote:
>
>> -----Original Message-----
>> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
>> Sent: 06 November 2025 10:39
>> To: igt-dev@lists.freedesktop.org
>> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
>> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
>> Subject: [PATCH i-g-t v1] tests/kms_vrr: Avoid NULL dereference on cleanup
>>
>> Add a safeguard to prevent a possible crash during the cleanup phase of the
>> VRR test.
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_vrr.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index bcb756202..a403de473
>> 100644
>> --- a/tests/kms_vrr.c
>> +++ b/tests/kms_vrr.c
>> @@ -961,7 +961,9 @@ static void test_cleanup(data_t *data, enum pipe
>> pipe, igt_output_t *output)  {
>>   	igt_pipe_set_prop_value(&data->display, pipe,
>> IGT_CRTC_VRR_ENABLED, false);
>>
>> -	igt_plane_set_fb(data->primary, NULL);
>> +	if (data->primary)
>> +		igt_plane_set_fb(data->primary, NULL);
>> +
> Please add fixes tag before merge.
Sure. i will add before merge.
>
> With that fixes tag looks good.
> Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>
>
>>   	igt_output_set_pipe(output, PIPE_NONE);
>>   	igt_output_override_mode(output, NULL);
>>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> --
>> 2.43.0
