Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853F3C52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 13:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4340810E05D;
	Thu, 15 Aug 2024 13:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hI7sMXMn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8985710E05D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723729878; x=1755265878;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=pmQbLrFsOH05GCcZZySk/AeY0dyVYYYZHWSv6d7gD+g=;
 b=hI7sMXMn5HV/v+W3dF4Ns5ADwww5JtjyHP9/lo4/CQKW+RdGZCHwbZnW
 BSSZJRhlgU71qvvB6onYM7NJDOo91LYyl4Q5uDs45JPrnbrbacbIElC8l
 fgjJepx/2m8OmwJ9rfROD1ETIHzMz8870P1mJhTJk5ITxmEx7/qtiRlo3
 nJhLMs8OXDwVmJmtxNfy6BEaRE9iUo55EoU2Oy0/6xasqIT4lKHEkq7sq
 u1kAVbaqK31K3Js64LRsToakml9QCcvU0nQ5u70zFIbAyDpBI0eeydI9U
 11yThmcOQp/AqQcziI8VzWEl9uqRC+pMHFYcP/DU/2yfdaCQjFBiktzLH Q==;
X-CSE-ConnectionGUID: dHusTU0zTpetONWUPvRmSQ==
X-CSE-MsgGUID: oBy2C+IfRuefP9W3WJDOtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21862480"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="21862480"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 06:51:17 -0700
X-CSE-ConnectionGUID: GhKFsqRlSLqFUIkMyMkcGQ==
X-CSE-MsgGUID: O3Wx48rpR2Gz/dI++H8ZdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59204414"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 06:51:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 06:51:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 06:51:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 06:51:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=woYdXnjUlDUcnesRKYWbuLISYg2W6xzX1uU6RZ6MAQ0Sg9EySDg/+kH9saZVkB9DfGnl/W3wesR8s/P2wiZeAd1wXHXHUswSUWnEqDraE6JwXX0ZExcJ/tw1uVFG8eRPAYTFOvA/laoBsQmmaQ5jF3JLRpHCTUSE2zFI2D39NWL3F25sW4FHu0Ah3pBfNthAy/eEFD9NjBt8qv1NujzkDnm6DBev0GgKxZivWkaZrdJE1yvWn5S52L5sT7PC5tKhiVgHaFz36N6gxQXsxXAgpv84y+YKj8MGRNq7ithXO9miwRN0T82kOySf8rukLWgAR0ENhhhb6JruQngDN1Wwuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUIx8PJLAAiUq16vhI7ekdQ7M8qEZuWkLRTl7AqOOM4=;
 b=cITywsookhL30KnMX1rq8JWMnLHE0LIpDMmg+wf61p4NsLEQIwewXKaEHEwUas+C7jsxnSjc8O2W2qhySBl1ON/VEdro9dDHLXLkeI7lx351P9WU9CcKTEaeY2egu3U+q4A2pdB6wKAzYc5JSRDK631Bn52pciQmCUWhoa30TQSNMCdn6ZfXdaAJYE5wQg03CRGU2/8aVbmwSFIODk3rMg3S3aSrH5/9nli0cjttZrN0Z53nwzcgJvAh1VdisBy/j5GvLUOpg3cF4xYtfHckSQXbOYnSW9TJVQGBgvQJoVQ9EZvCQOsv8UjF42TZytLO8obnCbTFNSfhGbRg0OZuxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH0PR11MB8235.namprd11.prod.outlook.com (2603:10b6:610:187::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Thu, 15 Aug
 2024 13:51:14 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7828.031; Thu, 15 Aug 2024
 13:51:14 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240814214705.3718355-1-lucas.demarchi@intel.com>
References: <20240814214705.3718355-1-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 1/3] lib/igt_core: Use unsigned constants for time
 conversion
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Thu, 15 Aug 2024 10:51:07 -0300
Message-ID: <172372986760.4082.8622638599813541302@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4P223CA0017.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH0PR11MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cfaa55c-3ee6-43e8-066a-08dcbd31541a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnhqVUU5TUxRa0Nuc3VDc1ZWTXdZRmZwaWltNStpenhNTlltWE9KNW1EOFZo?=
 =?utf-8?B?aGZ6L2NCT1pobUtDc0VKUkRleWdHTHNDckpLTDZFbk91eEd6YzZDaEdZVlJ0?=
 =?utf-8?B?NUVLMHhNbDI1RzBxV2hTc2dWQ2JodGd6MGRqbWl0MFBzUnZneWZXRVhmUkpE?=
 =?utf-8?B?dE9LQmJQM2FOM1pKZkR0RlpxWnAxRTMwckpUNndubnk5QlpNTTlVY0tCZURk?=
 =?utf-8?B?RmNIeG1ob0UzT2NnendvOHo2WXZBanZoNTJhNmNTMVBDWGMzT1VQZ1J3R1R1?=
 =?utf-8?B?VEVjcXdWWUlCNXhOZW5seVF3MkE4WkFMSHdnMXdPazBoWEFDcWpOQTNwMTJY?=
 =?utf-8?B?UERzS3RnQjRLVXV1cFNVYUI3WmFQSzNLNlVRMFpxWlhqSis0K3RmeWs4M0Q1?=
 =?utf-8?B?UHBxWjU0YWFOQ1NtVnNMeXJRTy80NHhQMk5QRFQ0SUZrWHBLZjJFQjNMckZy?=
 =?utf-8?B?V0lYZFRrNDJFTzJuY0lXZ1BxTGFURDdnKzJrdm1SNUU1VkRxaXQ5V2l5ZE1j?=
 =?utf-8?B?RzRweUo5RG9oc0kzY2U4MGpMOUswSlFuUnlzY2xVZXd0OE1YZUhQUkljOHY4?=
 =?utf-8?B?QUZTYkNiY1NWK08wcVY0U3F3dnFHRkMwK3RyMTdKd2ZSemF1eG5EbzA0OXlH?=
 =?utf-8?B?UytqZ1k2NHVLS1g4YmFmeU05UmZxRW1LNFZIT09qQmw5bUlHeEJQdzJRMTFn?=
 =?utf-8?B?VmFjbkgwcjVKaDJDQjhiM0VlNnROMGo4RUlXMHBHRTdLaXk1WEwrYVlEOGJD?=
 =?utf-8?B?WDExR2ZqVkhPN1NLRzBhaGFPRGFCSG1VTjdMa2YzbENtRDZyeDNwUit1M2xx?=
 =?utf-8?B?ZVord3l5TEJDckl0WVc3ZUVldEpNWlBDcmpyVVBuUWpLTmltdk1CR2pHVlox?=
 =?utf-8?B?TW1lU2tmRHZzSFY1Y2FFZ0lqNkZyQXFweVkxcitqdkhBcHdwUlNWMHNNSE8z?=
 =?utf-8?B?UFFCMjdmRUFnYy9TbGM1ajRaMkY2OGhTRllqQXMxUmI1Kzg4SFBJZzB5TVFo?=
 =?utf-8?B?ditVeDVhSnBoYkZ4dzFOd2x5UjYvME50Rmc4eERoSXFDQ2VxY1BoUktja1dh?=
 =?utf-8?B?Nk1VKytrUitzWDVlY3lIN2d5aGZSMjRGdDNuSDNVd3F3VW0rR3hjUUZwaDE0?=
 =?utf-8?B?NENMQ3E1aUJlb1ZmYUkzYTB6Z0kreVFOK2JNR1MvM0NvMXVuQkd0UUNMUHBO?=
 =?utf-8?B?ZFNSenZVNnlTNnh5RVlhSUdtU3N4TEJYSjhtTFJNSjR0VHZGc3BNQW1tRWYr?=
 =?utf-8?B?Y0F3RnREbkR3Ui9aN29LUEV3Zzd3Z0NCdk5WNmxYVzFLQVV3bm10blkrU1U1?=
 =?utf-8?B?QXQ2MnRvK0lhb3F4Ym8zQ284Wm50a3h5alh2a1Z1c0MrODlVTllvcWJxTTlE?=
 =?utf-8?B?K3dTVWFRRWFVdHhON3JJSWtqZWpLSDhVTGY1VXh3Y3hQSzJEVXMxRU1PVUtD?=
 =?utf-8?B?elBtSDJlL1RxSkNBY2h0Z08xOG9qalBwcjZ1NjNtUWpkVkNSVU5jUnNFd3Vj?=
 =?utf-8?B?RWlGY05EZk5xK1EvUTBzWWkzSUorU3duMHZwOVRNdlM0SlNHL1l2ZEpMUjcy?=
 =?utf-8?B?Q1QxOERERUlmbmR5bGU2b1RhVDdMenhFVEtUOTFMTlhuTzZvbmpvWlNZTlRh?=
 =?utf-8?B?NlorZFkrVzFSMWRyazFNV0hjaUQ3aXhRTlBadTVRQnVCTUcyZWdWR1p2TW9N?=
 =?utf-8?B?UG1IcHg4NmQvR3hhTWM2U2Jaa25QcjlVQkp0M1I3aFdkZGlTV3k4dndOWUll?=
 =?utf-8?B?ZFp1ZkJmR1pFanpGQ0RGU0NvdkZSYkVpWUJwcExkT0g5WGlIUmtNR1BNY1oy?=
 =?utf-8?B?QnUzUlV2MjZBWnR2aUtpUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djArS20zdnZOZXhNeEM4c3F4NGVOUkxsSHJVdDd3S2k1WTZpUk5CU3A0R0Jx?=
 =?utf-8?B?a3pJQTRWNGRxTmtnM293N0k5MlAvVnU1V295V0t4MFJGTDFxb3hmY1Y3M3l0?=
 =?utf-8?B?R2RmYkN3Zzk0OEFCOG8zYjlnYnBwZHJmMzZwL3M1Yld3Qkhrei8rMTVJL3Bo?=
 =?utf-8?B?V3FPWVl1c1dtMkg2RWhUaG5YZXFKUGVEZTFTUENZMjZyeExqb0pqeVpmNzcy?=
 =?utf-8?B?Zk5zSEpNVk1udnp6V2hNb21SdUlsQStzQVk5RlFuT3JSNFRBckgxeUxmd3RM?=
 =?utf-8?B?enJxN3poS3dUMzA2ZTZ3WVcyVzNxeVVJajBQbFhwNzcrY1ZxSzBZMk1idXhU?=
 =?utf-8?B?TTlybFNyUU9iZGJXQjN0SDN1VU1QWG9TTlJZSTRtUVVuRElFaTRuV21SS3hP?=
 =?utf-8?B?NncvM3ZJek0wckN4T2N0R0JvVHhEVGFpRXRpcWQrSVplTzlEOENlZGpJYVJC?=
 =?utf-8?B?WU5DUmNRbHYxQXI1TkEvb2ZtcXhGbFBkKzNoVXJjWkJlSmVpeU9ia2pWT3Ew?=
 =?utf-8?B?ZEhGc1NaVlBpdElvOXI5aWN5OWQrdmZOMFRVL2JJQnliYXBTdmFCU3dlOFdL?=
 =?utf-8?B?Z2NYc1VyUEhUTXViZCtnNnlHbTREWDJUQmUwYklROE1pZTVrT0VuN0dwZUtK?=
 =?utf-8?B?N01FM3NwMmNjQWtkMmx6RGZNdnpxeUtaYXFIU2VpN21VY2JPOEhsTmFoZTdn?=
 =?utf-8?B?ZWFQSUpBS1ZCZ3ZOWVZ4bUpITG5nTitpcXhCNkpyVno3RjN5c2NyWEI1WC8w?=
 =?utf-8?B?aCtGZ0FlTnFubm1iMHFaQ2hiUlJkTHVZN2RTYSt5d1BYOGIvVmx5Wi9EZUpz?=
 =?utf-8?B?dXAzV1Jaem9wZlVMQlZvNWNkUUJhT2liMVVqd0NESnhaSGNKUjZ3VWp4Y0dx?=
 =?utf-8?B?NlgyKzFlKzExclh4cGduN1NrTnVwUytXVU84WHpyRGk5U2FKZDVWZVZ2TW1O?=
 =?utf-8?B?THpSUDl5aVVLKzdOSlFlM2xSeTk1VjhwTE9NVWxWZVFwSHQ4a2xaVU1kb1cz?=
 =?utf-8?B?LzVmNld0SWl0emFHVHZtSXh2MXBSeG92Z1FkRHZrc2RtSE9VRHBGQ3ZSSXBo?=
 =?utf-8?B?N0p5VjB5WE5VY1h2QUlVZTkrVHVEMjQrekdZeWpBc2FlbGp3bjZ3MGExSGYy?=
 =?utf-8?B?NnJpSElweHpyYnJTb1czcWV5bitBQ1lyS2V0MVBUV2tTeTJDRU5kVGEwbW1t?=
 =?utf-8?B?MFY0WGkzejdpVC8wNmFMSUp2bkF1YXNpMUl1cVZmTHpLS0dTUmhheTNka1Bh?=
 =?utf-8?B?UkVLM3RzZDArNkxVdTRWeTB6YUt3WGJTcjJudG5xQjVaVUJmY0UwNkREVml1?=
 =?utf-8?B?eThXOTc2K3pNalNITjFvbDBLV1N0OWI2QW1IOVd4bXdxbXpydDJMMlZTdHhE?=
 =?utf-8?B?TThsMjcvZkdTdS9zRjJoUkRhS1R2TzAxQUx2ZzFFL0ZRNzFGbHdoSzNNc1VK?=
 =?utf-8?B?TEZLUGNIOHppbTY0TFg3R05nRitvbit6aHV1Z0daMDZCWmRtUFlKSmhDZk5C?=
 =?utf-8?B?b1ozUGozQmhrRWxGNEE3NzZ0ODlvUU1UYmVhTFBFR3p4RHlTQnhNbVZTU0t1?=
 =?utf-8?B?bm1CVkV2WlpDdHh4eXc0YldxWnI1L3BSbURmMjZMZDNqRnZvVEo2OHNrT21s?=
 =?utf-8?B?ZnJXbXVJNjd2elhiSFhEcUlsYkJZcGxQT3NIMDNuTFhMMWV0Y2VjNEs2N3lK?=
 =?utf-8?B?V1MwR1pXdjhRdllyandPV2tDeFB0dERRMUVKcXExWGJXVFYxS21OemdxM3Bv?=
 =?utf-8?B?MjZnVVZiRWdIVWJ1Kzk0c2wrbjNJbDJ1MDArWG5HcFZ4RzMzVHVZNm9rcGhl?=
 =?utf-8?B?WjhybXFFc3BMSm53SUxoS1dKaTMwR1l0NVMzL1BRZ1A4NkNXaE01U0RoSVRN?=
 =?utf-8?B?akRuc3Vub2pNNjlFNjUyYjFBYk9xWGNBMnl2VFJVenM5dU91dkg2aTBHbXRH?=
 =?utf-8?B?YkowU2NhUDluSmdHLzBVMGlhd2NjT2F2WTEzbXNRbnB1WDJYeTVxY2RBdElS?=
 =?utf-8?B?NUUwYjBXWUxrSEdYYmMrRFJlMzZwa0lSM29za1QyZU83c1VXMDkxdU5iNHBR?=
 =?utf-8?B?RXJTYmN4WHZtUUorb0VJL0QxYWtvbEZNTFFYam05WGlMMndhdE56dlBxelox?=
 =?utf-8?B?bkRKenhTTHVJUk9TdjZLek1zdGg2bXczblUyKzdaZmVhdFZpc0dtMHFqSzB1?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfaa55c-3ee6-43e8-066a-08dcbd31541a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 13:51:14.3256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Lzf53hmLM5MTQ9fI/P3zCdTwuxmguqfn1dP9AqnFeDyb7DEo6Wl2lkr9yYPTO5WrVWjE3RLdyy5fZvvKDzONg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8235
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

Quoting Lucas De Marchi (2024-08-14 18:47:03-03:00)
>Time conversion is usually done with unsigned constant as it could
>otherwise give warnings on signed/unsigned comparisons.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> lib/igt_core.h | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/lib/igt_core.h b/lib/igt_core.h
>index 82f474c5f..c83bcbaba 100644
>--- a/lib/igt_core.h
>+++ b/lib/igt_core.h
>@@ -1505,10 +1505,10 @@ void igt_kmsg(const char *format, ...);
> #define le32_to_cpu(x)  (x)
> #endif
>=20
>-#define MSEC_PER_SEC (1000)
>-#define USEC_PER_SEC (1000*MSEC_PER_SEC)
>-#define USEC_PER_DECISEC (100*MSEC_PER_SEC)
>-#define NSEC_PER_SEC (1000*USEC_PER_SEC)
>+#define MSEC_PER_SEC (1000U)
>+#define USEC_PER_SEC (1000u * MSEC_PER_SEC)
>+#define USEC_PER_DECISEC (100u * MSEC_PER_SEC)
>+#define NSEC_PER_SEC (1000u * USEC_PER_SEC)

With all suffixes using a common casing,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>=20
> #define for_if(expr__) if (!(expr__)) {} else
>=20
>--=20
>2.43.0
>
