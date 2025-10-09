Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC75CCCD183
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 08:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AF210E970;
	Thu,  9 Oct 2025 08:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eX/Clikg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE2F10E970
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 08:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759997672; x=1791533672;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ph13lo+SxgFSwZKXy5sV/Aay2g5CvSESFkie3iHBZ2g=;
 b=eX/Clikgto30xE3o3GBjZh7goAJ9lLMJVArKn6hOQ/LnOaC/4TXH0Kx6
 ANBdgdTCwjT+dT2jAmKlY0aJFtGKcdvWCTBlVi9A8GJRPGwT2VCn3qtpj
 4tZiD+oZlhdPqSJuAZbv/7kXsU3/vQgZXDasPbQBJI93tB6VvOinW975j
 R6wbsKwplKvfVfS7gZR1eNbtQkFC+LMoBLhHGA7zaIN5J4dW4SElQipct
 od5fCm4hEOFaLPWMKNkHt3Xq2qfba+aYWC9SQt23TAY3VDtWNE0yNrh7z
 EZLr4VAnd7VK2wjArsa7wJLh4prMkLmKoHBdI7rB5Kz0GMBxJTrr+Ty8C A==;
X-CSE-ConnectionGUID: d2DXkP32TgOFqsAFbshUMw==
X-CSE-MsgGUID: bJFCZBb3TEqR7d/F4IhNgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61411212"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="61411212"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 01:14:32 -0700
X-CSE-ConnectionGUID: 84aacU/VQKySXkhvyZaFXg==
X-CSE-MsgGUID: 8Wt7PiHZRb+6HbVScsI1VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="184684676"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 01:14:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 01:14:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 01:14:31 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 01:14:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1Ty3oeDrv4BjsN4F4N99xKzJofm6nhg5EkRwJ4RPGzD9zxV4n9hRRWU7XOtRnYmBVnSRSDwwfUfgE7jg6cLnSv71c07CLVxXWHnApkvCBMPvm5yRSwiiwpoaJA66jG5aDGJhgKPzDqaOBPcJFEUSpls5+Tx3WMfrdJ1ibks/KtEX1JaUpS1QX0KhB3wOFt/jdOf6rXM2MkgxVSf/eEy/B/Wle+QPt7B+5UJlyNLirQTFjbMAF/Y23mCWtOxoNKfe3Q4LpsqTSu3KbdDCcdnUBzWMEmLMkpbGvu66diD2bUPjwKpE2qfn0G4EkIQoT4uZQ1lWM1si8dgju8LrBgNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6sccdZbrBR823CpugabdYDpVoD+gpzHXC+M8hO+wxA=;
 b=eVzm8gVu+k0isGGw3BhkdZA5DltnLf3+d1m1rJM2XXMwGuvT5bXtpe5ik9+SmiGqrNSNDBfmgrLxb3d4a9a4Ec+ALFG5+A+bbIokDLuQFVQtimfES3E/o0SHm2n/vZ0RrSDEqOwxug+TneISRCBwV97sWOSlYz4DIpAQ1QcHBkR+Bv4hj6d9jxqByim4zXYlg48hSC+hp4R3kc3nO++tjX7LFQl1n5P2RVEPbFDiQugNrxKrz3jFUd7nQWC583iuoqjQhBv93S1GD4aFtbqfoyUocR3ZDYoybvtr0kI9Ogz8+ZLWRZlZFI8uu3Wx8rjntlYbK1m7IJp5qm7WzLQXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Thu, 9 Oct
 2025 08:14:28 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 08:14:28 +0000
Message-ID: <33e79e94-1022-4f55-97d2-96de31522058@intel.com>
Date: Thu, 9 Oct 2025 13:44:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Block DRRS subtests
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ramanaidu.naladala@intel.com>
References: <20251009060457.1559432-1-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251009060457.1559432-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MN2PR11MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e081364-4605-44ce-b20b-08de070bddde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|42112799006|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlVDMnZOTU5KbXdDZ3g2UW85MWRWTHJQSUlwMXZjaXh2Z3BaMmNNMHFYTE01?=
 =?utf-8?B?c2QyalAvakkrL2c0OHhIdU8zMFRhdW16R2IwNndNZmpjMloweGdENlpKVDFu?=
 =?utf-8?B?R0pXVE1YYVlCSlFTM0FpenE4MS9hQzhYZlh2YTk3Z01kRDYxbjZFMGNyeTN2?=
 =?utf-8?B?UXVXL3VRSXRxd2xnRlo3TGVWNG1vWlJOc1B5ajJiTm9QS2R2YlE2QWFQUi9G?=
 =?utf-8?B?MXJCT2d6VmpmRms1ZGR1S2U5OU9ZelNNSzFmU1BSZWNkb21zZG5nS0lKejBU?=
 =?utf-8?B?eHh3ODZGV3FmSTZvNWsxMDAwanRGYnEvbFRjWFVhMjFjYlhaalA5b0c3WVJt?=
 =?utf-8?B?aDVrZEpsYzQ1RzZXcm9VVGM4SU54RDV0M1Y1djRmOUF5UkgxWGFyQmtnaHlU?=
 =?utf-8?B?YWFKV29GdWdUclZQdFBvWVF4MExxWjVnem5KeXNlUWxROHFYZ29UME1SVzJy?=
 =?utf-8?B?VXBHNitOamsxeXNzQjB6NE1haUtLbUZsYUhjRndZTEpHWWdmOVVqcW80U25F?=
 =?utf-8?B?UnpGWEhGbHZKSHRqbGVMNU9ZNWdvSzZVNFAxbVNEbVJqMGZscS9KMmg0Qkk4?=
 =?utf-8?B?b292bFYzb3lFMzZJK1Fxb0hzWmF4T0pNcEY2WjN0Nm5jV00yajk2ZkhQZGhy?=
 =?utf-8?B?VTVESjFsY3BIc3MzbStTUEhkcW5xdzMwc0tnZ1J0WEJXbGVqbmcwUHc3V2Uz?=
 =?utf-8?B?NHNnc3Z6d3kydHdLbGlMaGpMMGVlTFFJWjJjbFJWMzRJbWU0MGE1VXVjS1Rn?=
 =?utf-8?B?R2hUSEhRMTVxU2czYU9QS0krWjhQbFZFbkdDMjFId0d6b0dqd0JTc0RSK3FD?=
 =?utf-8?B?cHlpT28xSUxnZjA1YjZ6NkZ2eVIwU3BBQXppMjdRQ2pWVVE5Z3AvUzJBMldD?=
 =?utf-8?B?YnlqSkVJY2VYRkpXVlNFYmFQMlFhMityYXJZcGRnbTlRVFMzS3RZUmJBYUJ6?=
 =?utf-8?B?UGRidXB0Qko4RW9xMXdjRTFDY3dYNzh2SGxNRzFvbFZoaXB5M1NNUmtrc1dW?=
 =?utf-8?B?RDEvOFgxanA0dnEydWQ3ZUlVaEF3N2lsTlJNMjhrU2lINTg2amlObUhjSFVO?=
 =?utf-8?B?eDA3ejMranB5Qys4UUpQbTlVZzdSSG9zT1RpQ2ljVDBGcm4wTldESE9nbUJl?=
 =?utf-8?B?YmR1ZUl5Y0NQcUlUeTVack9hc25nbVNnaEo3WDg4Q0NLNlVrR0pkTm5qYnlm?=
 =?utf-8?B?Q1lRSDA3bmxqd3UrNnBhTEo3T0VBZlNuQVVuckgrbjMydWRYRlZUODZUVlF0?=
 =?utf-8?B?aGMyS0U3ZVBmVExZVTA1SE1pc1BUNGMrWENBdVFhOWgvaWpXcTZJSHU5ZjVG?=
 =?utf-8?B?ZmJpNm5ManNsaXdjZTJWWFNMVWk5VHFzY09DazBuN0Q5cG85NXkxMFI4U0Zn?=
 =?utf-8?B?Ujk1RUJ2UDNtTW9xclV4ZW5VRlpIV0ZoeWJOMndvKzYzOHVpc01MZDZPcE8x?=
 =?utf-8?B?SUxQcnBCS0FyTGkxQXBHTXR5dDhBaGhGdVJpSEc4UEZoYy9ud2k0STh2Rmti?=
 =?utf-8?B?UUg1Z1dGdVF1ZzZpTHIvNVNFRWlITWlzMXN5cCtBUWVqUHBJNjVaQXU3U2Fh?=
 =?utf-8?B?YWNGRU9KUitIWVl0TkpPT1cyZzFUNjc2dGxFV1RMb3Q0Smt2UGlhM0xFZ1RC?=
 =?utf-8?B?OWZRSlRmbGk5UEQ0RWpwZzNVNDZ3UFRVaW1EL204OTRqaXhhRVhZTWRxN1FN?=
 =?utf-8?B?Q2ZXQUhkYVB0TEd1YlgwZEhBTTY0bmYvK1prYXRZcDgrY2p1dWlyRUJDTExV?=
 =?utf-8?B?OE1hZFE1OFJ6ZVAvVVUyMVM3RW8wNzRkZ3ZRSkhMY3BUMWJvcDFQUU0xNy84?=
 =?utf-8?B?bSt3R3FFMXNMK3NHNmpvYi9idTc0TWtLWEV5U01LQUFXMEFiZCtrOVh5OWww?=
 =?utf-8?B?cTNpSWhiR292bUdKcDZVRWJKSXFPMjYxYVYzQ3RTMXlwQnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(42112799006)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU1iSGpxU2RjVllDd3RDY21jZHI1MXhzWWNjMGhWVVBxcDM4UEpIaUxXWHp3?=
 =?utf-8?B?MXhWWUxvelp1bWZpWFlVMlpJbEtoY04yVWYvUFprbE43S1pKc3hPazhqb1p4?=
 =?utf-8?B?NTNYVlB6YlNHM3RQZkd4MklPK25VZWd6VExBMXYwSldMTTd5T0xmellEblhq?=
 =?utf-8?B?dUo0NmxhcVBCRy9TeEt2NGN1NFEya0czUS9aRDJqTURFUTg0K0p1a3Q4Z0Zo?=
 =?utf-8?B?TTJ2Z0QvWXRVcVN1VVlWKzRSaVBJTEJCWkp0dFV5MmhSWlBudmpGRmpHUHdV?=
 =?utf-8?B?Z2FldHhlNUFBYU9ZODkyNVB6aDNhTWxXOGNTOSt4MmdQYWh4bEt3aUhhUTcr?=
 =?utf-8?B?Nm1pS2xsNkg4eGhmS21tZ3dGVW5JK0l6UGcxK29JSytWTHpKZkxFeXNXUFdm?=
 =?utf-8?B?Q1NYQ1FWVm52ejc5SzVMYXZhUnJFRVJZcmw3LzQ4UWdGWW02WFA0ZHhyMk9x?=
 =?utf-8?B?T1BCNnJLeXNvK04xcWQra2s4dVh4L3dLbDFoTHA2MkUyUjBkZDVCRCszS3ps?=
 =?utf-8?B?SFpOUmpFSEs4SlJCcmFObHdEa2NLTU9SL3FlVUVMeWxpS1VMUkoyQ1RUU2t0?=
 =?utf-8?B?VEV3L3h3aVJqN0VuZmtjSHpsS1lCalJZWG9ZcXZRVVFHeXk2cmozdkwvZDdq?=
 =?utf-8?B?MWdIcGRBZjgwQkx0RHdVaitQVXZhOWcvWlJRWUFCOUhpNzZDQmt3MTdyVFhB?=
 =?utf-8?B?Q0p6TzZPRUVYREtvYVJmQUhlU1VML0g1SzM1WjlIM1NwVDNIZExleWp3eG9y?=
 =?utf-8?B?OU53ZWtkQndWZldCRWhtci92Ulh6TjZwNk5oL2xZdncxb2w0TkRzQ2ZBWS9I?=
 =?utf-8?B?MkRkRzRqYWV4bWpHNTJ3ZHpzcEMyRkpNYmo3UkFTeU1XWDB3RzBCTUVQMHBt?=
 =?utf-8?B?d1FMTGdGUkk0aWNjZmJJNEc2bUllZmxuK2pkbmVCUmFWNlhwcjdBREpVRi9U?=
 =?utf-8?B?aW9BTzBicG5PNURER1RYV053WndING1UZE5EeFFmZ0VwYmxsTGd4U3FHVHJh?=
 =?utf-8?B?OEV5WVFnbnJzUzhWdWRzbmpiNVgzYlRxYitad0JONVUrdXBpUlM5VXBpb3J4?=
 =?utf-8?B?VW5nWk1EODAzS2Z0anUvbGFsbU5sa0VNeDFaM294K3VhenBSNFJUNzVFMzcw?=
 =?utf-8?B?KzRIeHRUMTZ2bXB1RkcxdG5jdGVKTUpuTUI4NGhnNHRzaGF1eWZyOHI4WjVF?=
 =?utf-8?B?MUdUaGszbSsxQmxPbStBMlNxNkErb0U5c0VJU2Y3QmhaSlJWUlFLNW1rSFhJ?=
 =?utf-8?B?c3ZKWmdIZGsreE5DQldDV2lFYlhHbW00RVlxZWNSK1pCQ0hEU3dHRVRLVHND?=
 =?utf-8?B?anQ3Um14QW5tajBOeFlNOEhTMmdqMi8vVG5mVXpVaFBZeFpLOXQ2eEwvY2I1?=
 =?utf-8?B?U0FoV2hVWUtHb0FsaU8zRk43UTJFbTRMcFdKZnFFSm5TMHdQOW1kK2JScFJo?=
 =?utf-8?B?UDF0Z3NrdUpSQ21LZXM3VkFOdTdiL255ajlmVTkzMVl6eFE3R2ZPMmpETTFy?=
 =?utf-8?B?am45c21rNklKUlZadHZFRmxTaDR2eFlXV3h0RFlwU1l6QytUa3lBb2JNMnhQ?=
 =?utf-8?B?dEEwTTI2UHo1WWg2eFBJSElYOFdHRjFvMkxqRUFvYi9BVCtINStsYVdFbzNw?=
 =?utf-8?B?bkNJbk1WUUFzOFZHNXBtY2orNWpRR05wTldxczVNQlpNTUhMODkyTmFFVDM2?=
 =?utf-8?B?eGM1SUNtNEkrZTZEZWh6RExrM20wZnZVSDRMblF2dnQwNm5FeXRzM1Rsa1NK?=
 =?utf-8?B?MTllblVCdDNJTmUyQ2VSK1czeCtQTVBHUVk5dHduY3ZkSEN1Q3M2N0hSR242?=
 =?utf-8?B?aVh2OCtqL1Away9YbmpWWFpmSWxhRTlRY1UzSW1jNVBCb0pzTnNXOVd5ekZk?=
 =?utf-8?B?TlZZeko0QnYrSkpMeFVOUmRXeWdWemRoMlVWU2dZN0tMaTRWZTB1bWN3bDBP?=
 =?utf-8?B?Tm5IL05QM1RvMXU1TWI3dVFVektyM1d2T21DZE5qbHJ5dVlZcTQ3QUdrMnN2?=
 =?utf-8?B?TldvVy85M05HdEJPNHFIVlVXSnZ1a05MZUdLbXZTQ205NmMvaFZMK1ZvcWRV?=
 =?utf-8?B?b0QxOHBWUWtMcW9pS2x4b2hORmxsZFBXN3dsdDlwZ1RtTXFiYnFjZ2V4dzhK?=
 =?utf-8?Q?H4j5+eokHtuH9wB82Yi5qjyd/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e081364-4605-44ce-b20b-08de070bddde
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 08:14:28.6158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4+ClXjfwfMwhcpjj1kAK8nk0YMoV4hU5X7zV7LycMpfNVVSOVVcKnHfvPcW/sQakYgG9wGVfJTewiFRe27UQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
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


On 10/9/2025 11:34 AM, Jeevan B wrote:
> Block all DRRS-related subtests as DRRS has been defeatured on LNL+.
>
> Link: https://lore.kernel.org/intel-gfx/20250912135926.18910-1-ville.syrjala@linux.intel.com/
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/xe.lnl.display.blocklist.txt | 7 +++++++
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 6 ++++++
>   2 files changed, 13 insertions(+)
>
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index 7ae7081da..edde67d75 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -169,3 +169,10 @@ igt@kms_psr2_sf@fbc-pr-.*
>   igt@kms_psr2_sf@fbc-psr2.*
>   igt@kms_psr@fbc-psr2.*
>   igt@kms_psr@fbc-pr.*
> +#########################################
> +# DRRS not supported on LNL+
> +#########################################
> +igt@kms_vrr@seamless-rr-switch-drrs
> +igt@kms_vrr@seamless-rr-switch-vrr
> +igt@kms_dirtyfb@drrs-dirtyfb-ioctl
> +igt@kms_frontbuffer_tracking@.*drrs.*
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index 5802c57c5..12219f89a 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -168,3 +168,9 @@ igt@kms_joiner@.*ultra-joiner.*
>   ##############################################################################
>   igt@kms_pm_dc@deep-pkgc
>   ##############################################################################
> +# DRRS not supported on LNL+
> +#########################################
> +igt@kms_vrr@seamless-rr-switch-drrs
> +igt@kms_vrr@seamless-rr-switch-vrr
> +igt@kms_dirtyfb@drrs-dirtyfb-ioctl
> +igt@kms_frontbuffer_tracking@.*drrs.*
