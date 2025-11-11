Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A122FCCFA1A
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 17:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F0910E63A;
	Tue, 11 Nov 2025 17:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PG15ZM6L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BD210E630
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 17:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762883288; x=1794419288;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EmwTG13ctv0Eo5g2xiJHTQGTMKq9R8JcyacN/f5WLi8=;
 b=PG15ZM6LpqBVqifmD1ic3u9neIg4RbiA3kHJmiA9T0lKHF1LOolDtHS6
 dzyBiXB93reQravC9qUf/ej1UAH0OST4x6D2G5xBzcOT5npdXs7Hz3CtC
 Ark5XJoahprz0idpJzI0WRlxY9AwRaSepKUKAgeclVI39x2vlR2wVexl0
 u6FZI2nZfrJrAaOryjKF8tAYQjX3ZageRgRWLxhcrqL9ZtenMQ3Ao4iE0
 Ps0MGoH7xgThRN0+n5d6m2a5uJvry1KmXpChZAFAqhj25kEZGcv8PIot5
 7eG5fJzpLO75JuBTT0rYUiaprhXcU7XzOwHyLilT/nBiSoZLwJH4spJr/ g==;
X-CSE-ConnectionGUID: rFd1wrt/RmafJGKUrjQvNA==
X-CSE-MsgGUID: QNbKlbM1SuWZkr1xfnlkqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="90420753"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="90420753"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 09:48:08 -0800
X-CSE-ConnectionGUID: x9RqKTW5QBu+0dFnisiDyA==
X-CSE-MsgGUID: /MSEFnHCS3SUF2b+Vwp50g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="219659569"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 09:48:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 09:48:07 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 09:48:07 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 09:48:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XueJHy2GfU0YIT3S0ejtjGohFbX1wrNIw8sxzjK8Zs+XCVTHnE7TF3jrNhqFJ0nPbYed2LsFUjGuLHn2oFa26+WIz5d3sHYET6YSyBUSgxH5dMv5EylzeWnDtRA77QA8E04QbGxKNfIEJ+2tKxLCPy3A2SNs5U4ixv5P0nhV2e6Hlu85L0GhvSJIQ/XoVoXdZPTTZKKCH4zjHnLqPBXmHdQk2EIh/81DSnJ/KNys5rFLoiGRHMglnt9RXt/Ajgmvd1VeZUv0bEvUyE6bcKhd+ETUsEv7Klcuc5hgXw7VobqWq0PsI2VRi1xnusYpFlcP6b8f0FBGt/GacBM8luUpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgz0NWKoq8ha6yf2C5JkjJkG/0Ce4FytEhAFM+XZxBU=;
 b=VbpAt305Vs/cu89qBHn8GJHY90gu4s3AgWPbDSyxK8e8c2AEUg3OqbsdwZXK9xb0WzAke3rOpFMvUO5I1t/DpCcT9fkRDPoCmbGtuPC5HQQZNY46bpBDbtAnXDOJ7mO8kHySJGEmLOsSSQObEbhqjcB3uaF+iJZlFzL0Cyu+tbnqr+LXMsLc9FvtlPsXZb2gVysNvql1Rh4ut9dgLHBoRlxQx7Hv1PLw6/jUeHCewJ83yTmJYQPP465YvPKjvNh360tU7SnhBmOlR4DoipSajpu8U7ASWKDTy7gLg3kX4va9JiIkaPo7g+OCFxZ5D8abO/jRvW7Va4ahe+BWdWAvFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by DM4PR11MB7399.namprd11.prod.outlook.com (2603:10b6:8:101::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 17:47:46 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 17:47:46 +0000
Message-ID: <53d71ee4-8d48-42fe-b6ee-a1c85cd7732d@intel.com>
Date: Tue, 11 Nov 2025 23:17:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_pmu: Refine engine activity
 accuracy test
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <kamil.konieczny@intel.com>
References: <20251104055129.3826274-1-soham.purkait@intel.com>
 <20251104055129.3826274-4-soham.purkait@intel.com>
 <yuxnp4bzgyjjkk4imiuak2j7rrbbkrxlczaezkzcwnlydshb33@4mscvrkq2en6>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <yuxnp4bzgyjjkk4imiuak2j7rrbbkrxlczaezkzcwnlydshb33@4mscvrkq2en6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::15) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|DM4PR11MB7399:EE_
X-MS-Office365-Filtering-Correlation-Id: 0955bdfb-84ea-4856-ff13-08de214a6c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlhDUXg1MzdwcC9uQ0t6QWxLNTVtM0o5OEdxMVN5QTFibzAzMTByakliam1Z?=
 =?utf-8?B?T2ZONjR1MHNFQ2ZPbDVYSFJoWjRPU2F5OEd5bmFIbVFhNHZsNHhoOUJFZHdS?=
 =?utf-8?B?Yk9tT1JscUZiSSt0TStxMTRVa3E4VjNlQXJZS0dnZUgrUlVUZG9udUFIc1N3?=
 =?utf-8?B?WGFERVdUMlVjWEppM016VndOTTRTMXZPOVd2ZFN3RWx5S01YYzhGaFdtTVQ1?=
 =?utf-8?B?by9ma2haNzlJN05ReTl6UThjR1N5WldYVWE2WW82dnpWNVZLVGtML1kzRmFj?=
 =?utf-8?B?M21DaXp5S0d5MzNNUk1XTGNXcU9rSEh4UHdGS0FnRXVzYUxkOG9kKzZLZWgx?=
 =?utf-8?B?a2lTOXVKYkZDUzhZbE9wOThIeFhUSGJrZUtWaDUzc0JGWXpYY3MrNW9ia0Nj?=
 =?utf-8?B?a1lUR2VPbWp6SVAwNmc4eGtpejhmUXI4QytMZGp2bXFEQnFCN2NZSXR3NGxT?=
 =?utf-8?B?QWlHZ3I0VjBkRTFTaml5cFNoNGhUZVFhRzYra0lXUzMrTXVkRWJrSC9iNmpF?=
 =?utf-8?B?NW5aSTlTZmw2WlRMVGZWVnVzM013cUtQdFV5NUhOV3R5Rm9ka1Q2bklFeGhB?=
 =?utf-8?B?N3M3ZURiaTRxT296VlpMLzFBbWUxaGRLbmtqc01ITUFvakFGZ00xMVB0Y0R3?=
 =?utf-8?B?Q2didXdlMlZRZTRla3hvSXNOT3VoSXZjcEZFRXQ2YWpxN3lCc0ZBZG1GTW5H?=
 =?utf-8?B?cVFxd0VnWW5iZVliM1JvYjhkMlBacmYzeElETlhNZ0dMMUJQU2tTbWMwU2xv?=
 =?utf-8?B?Q0U0ektuL3dIb3lEU2F6bU1oK2prVjhBK3BFTEEya3hrZ3dNMGFSSk5GUzFK?=
 =?utf-8?B?UDgzYUkvMWl4TmdiSTMwMDlqbmVUcHVBZm9aODQ4MVg5dU9sWUFhMC9sRHk5?=
 =?utf-8?B?MUNZSThZMGhUQzZRVllvWHJQSE5QL21FQlFKNU5kbm52bWowUDNIbGVud2Mr?=
 =?utf-8?B?YXpYT09rUkorSERoeUw5czhSS2VQaWMwZGFwUjBpRjdZWE1wY21wdXBiOUhr?=
 =?utf-8?B?T25DdzlGTC82TUVrNUQrY1cwUXF2LyttVVEwOFdVcFdlVE9TMThjNEtBZW1H?=
 =?utf-8?B?QitzcCtnKzlPU0xybXhWZmpMVmVhNGMvVFZxaE85ZVQ5bElzdEpqQnp4Wm5k?=
 =?utf-8?B?R1o0WERFYVA1SkdRMWk1QXduakp6SGNJYXFRNjBqNWJMTWF5VXVDbHB5SE9R?=
 =?utf-8?B?WmtmaCtRekdReEdHTnRPdkZmRmxMN3VlRWJ2MnJDOWY2Rm5CNnBqV3c3U3Rv?=
 =?utf-8?B?bVoxMFQ1Z0lRL29FZ3pJV3FLUFZESUw5QUsxdVlQcy9BU2FObE8rQzFHYVNt?=
 =?utf-8?B?b1NSUDNzUWhaNFI3NG1DMW84TDBpSU5mVkIybkxaTkxIbTV3cDl4RVRLd3Iw?=
 =?utf-8?B?dlk2SXpJdWhvY3dmVTVhUmtYZXZtcGJFbXFBeHdVQldnd3RiN3F6ZmdkdGtT?=
 =?utf-8?B?Z1h2ZWxsN1pQelg1TVdsWGJ6Njc4QXFlVVY0Z3FDWGYvVmtya1R5b0szT085?=
 =?utf-8?B?SDBMTEhCVmtVbUZXT2k4Rk5wdzdRd1RGWVgyRnhYbzQ5KytXbW81cXkwSXRK?=
 =?utf-8?B?TW5pRm5hZS9ub29uMVQxMmhHbFA1WlFNT214WkpoTU5zMmJ0NnFxczNxK1Fo?=
 =?utf-8?B?dW9lVlN4YVUxaUpyOTBUckErUTlPYlRVU0ZLKzhpeXFwaVI5akpiZFJEQnNl?=
 =?utf-8?B?Y3dHNEx4V3pzQXNqUkI5aHVjZ2g2bTN6U0hpNDdhbSthSG9mdnAwWnZKSEhD?=
 =?utf-8?B?MCt6U0pRK3JjRlFNUFZoWWw4cXZrYXpMNnhWcVZOQVMvc3kvdzAzWEsxc09R?=
 =?utf-8?B?eUpKb3hNOGdDc0V4YzVlUGRjSzBFVU5zeWxkUlBrWFZWcC9ZcmJQajFxcU1u?=
 =?utf-8?B?SHlFVjdqc1VNUlFaMm8xWElDZTlLVHo0UERBc3kxakZUQnBqS2Z2VEs2U2Vq?=
 =?utf-8?Q?8wIYYcwEGaFyMWbLJPXA0TjDS4YFPIDy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFlqd1N2SzU3QkJuSlE1R2M2Yk5jWWdxZ2NRYURtUDhOYTJXcFdMQUk1VmV1?=
 =?utf-8?B?dm5CanZiTlFSaURuL005cHg5dkQwNmpDR3VhdWVkNm5Ub0xsRENpb21td1R6?=
 =?utf-8?B?OHlDeFh6d3NkYnZ6NGdWMmZUQkJwYnlzNC9ueDYrT3lIaDM2cU5aeTRRSkh6?=
 =?utf-8?B?ZXZFUFNWbFJ6QW82bkwwR25FOHEwRERxNTRRTnpOaVl5NlV1azdZaFVNZFUx?=
 =?utf-8?B?eDEya1U5d0dIRHFiNUxSa01pYjZTWlFJTGUwWEtCa0JldTBkVTBNb1d3dFlV?=
 =?utf-8?B?dkdBb3pGSnI2RGVEVnJ4MGR0MmtpeE0zeGtEMG9WczZxYjJHb2NEK2xTb01q?=
 =?utf-8?B?dDlSemZsL2FGajNOTUlCYk03cHBnZ1RwN3M1Ukk3cGpIOGprS2l0ekhQMVlD?=
 =?utf-8?B?d1RmTGJ4S3FlZ3lDeWZ1Y1M1TU5CeXNJZGVqS1huRTV5Z254RjRZRDNocTVE?=
 =?utf-8?B?RzBXL013UVE5L2Jkc0l3UmlSZXUySkxvdThrbU5OeDZ5bEdxOXgyUXh6S211?=
 =?utf-8?B?NzJobkxsVlpBdE1yNzh6VWxvQXp5UFNNUTc4S3VKWTVEbk5EVklSSURVSzNv?=
 =?utf-8?B?RFdhdllBRU1XWFBhaDdaTkRKWEpQUkFoVFhIZGY0MmxQZFBzdFJmQlUxcWxL?=
 =?utf-8?B?dnBpQ3FnYXU2QU5rdXlaYzZvQkN3aW5wUGQ1U2h4RU1lR0FvUU84bi8zVG9z?=
 =?utf-8?B?bW9WZ3RTbnFBZDRNWFBWUWxQd28xc3JHT1pHeG5lM1gwc0ZZSG9qK2N6a2ZN?=
 =?utf-8?B?TWVob2xnN2Rzb3Q5REdBU0tWcjJ0NjN1WWJsNU1KNmRnZW1wbnlEOXlEUElD?=
 =?utf-8?B?bkJHOFA5M0ZoM3dpV0xHNkJLWXlqWklxZjdFWUQwZ3NTbUtQM1YvbGlreXQz?=
 =?utf-8?B?THlpTm9UNkgwZy9hMlFNb3JkcllhSldJeDY2czRYcFhsNTk0eTNZUEVKVFBU?=
 =?utf-8?B?MG0wU0NMeWVCcVRQa1h5aCs2Y1laenM1cU1ySlFPTTB2SVFTb1M5QUR1QzhD?=
 =?utf-8?B?OW94cUhiR0RGeGgrNnNZOHU5U2poeFdhcEVwQkJkUGt3QzNBVXJRNCtUMG9o?=
 =?utf-8?B?K2IxUXRPUnkrQThTMFk5c1JoMi95YlJhWng2Yk1XcnduWXhKSkNUSDJkcTh6?=
 =?utf-8?B?R3h5Q242K2EzZXFWTExnUVd5dG9HTXI4NXVSdkF3cTJyRFZHWDF5ajhNbm5Y?=
 =?utf-8?B?UGVQT0dVZERnaWhqVDJ2dWtQalR5Z2Vma1lIVjREYVhLRWQzOFJUenhjNEJ6?=
 =?utf-8?B?ODVVUXVYam92czhFRTQrRUE5THB6TEpuOHB3VmVBY1Aycy9hb3QzM3ZRcVRP?=
 =?utf-8?B?d3pJdHNnNzVzTTdrUm96eEttcjl2VHRJU1AyS2hkZDFYN2lmUDd0TjduYXhI?=
 =?utf-8?B?aitBeUh2dDdPVEFWN2dhRXVkbTdKSmJXSHNqbnJtRFlXUEZyMDltSmpKMzFs?=
 =?utf-8?B?UGJjM2RudzRWN3h2MVljQUsySVkwVnk3SjVxZ3hoK3ZtMXZCam81a29FVm5r?=
 =?utf-8?B?Wm5vSmNUR1lVMytTenlXcEJlNkZYbk9DK2IvRkk1SGtmcXNQeEpGWktudHBh?=
 =?utf-8?B?RzZmNENFeHlCOW1xckJrajlXam14Qm5jRjFjRXRtN3prdmpHbHEyTXNPNlJz?=
 =?utf-8?B?M3lVZWF1ZmxublJXMkQrSlNlUzNCbUg1Mm1Vb2EyWGdubjNyL3RvOUpZRHMz?=
 =?utf-8?B?ME5aU3RSZFNzdGFYejcvVDE0dVM0NXNRajJrVWFDcDNPMERSRVpINFJxN2FE?=
 =?utf-8?B?aStaNHBiUFB6SEYyNXQ1OHp1ZDRFSVU5M1Iwb3lqclk5ZndEbHZOV2hsanRy?=
 =?utf-8?B?MVlnZ1FldXpTWFR2TFJpRHBzd0lXbnBUOGRmTG1SREI0dngwYnN3VXlWMHZD?=
 =?utf-8?B?ZmdwNG93NEExT0x6VE9IUzR0d3d6MyszWnNJZUZNbkExcFJVTVRxbHdwajlu?=
 =?utf-8?B?dDFyRGpXQXlJVVpzR1BkQmcxMThva2NIbXkxMDh0OVlSZ3lrVHZaR3ZuLzdv?=
 =?utf-8?B?TlNNZzFIV1RuRnNnSlVJcG40WTFFUGo5a0JUS0lKNHNGZ1FPTWM5ZThFZUZm?=
 =?utf-8?B?dE5yUlZ4M0VPYVZLZTR3T2JpNFg2OWpUVDd6d3ZnbzRMK05KLzh1cHU3NHY2?=
 =?utf-8?B?RnJQbjJWSldDWTRNcWxFNWhRQVdHN0VlN3ppam5zVlJ3bzlDNGxxcUhQWjhn?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0955bdfb-84ea-4856-ff13-08de214a6c34
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 17:47:46.4407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilFYbRZcBjsUjzQb3Plp1HVcbtwnAl82vy5Oib8XBXYXNo2swcH7zMJRjpa32CWqWKgSA2MHTOtL7Oku3utBSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7399
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

Hi Lucas,

On 04-11-2025 22:03, Lucas De Marchi wrote:
> On Tue, Nov 04, 2025 at 11:21:29AM +0530, Soham Purkait wrote:
>> Create spinner once and reuse by ending and resetting between iterations
>> instead of reallocating. This removes redundant allocations and improves
>> timing consistency, leading to more accurate engine activity 
>> measurements.
>
> why does it improve that?
In order to calculate the engine accuracy, a small amount of time is 
divided into multiple passes.
During each passes, ideally the spinner is made to run only for the 
expected % of time, which is then,
validated against the actual  engine busyness.
Since the spinner not being created every time now, during each passes, 
so it is faster in case of reuse and the (time
consumed in creation of the new spinner * number of passes)  is no more 
included as spinner active time. This is how
it improves the accuracy calculation.
>
>>
>> Fixes: 477154cbad2c ("tests/intel/xe_pmu: Add tests to validate 
>> engine activity accuracy")
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>> tests/intel/xe_pmu.c | 11 ++++++++---
>> 1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index 9525655ba..af0c2dfe4 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -534,6 +534,10 @@ static void accuracy(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>>         intel_allocator_init();
>>         ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>>
>> +        spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
>> +        xe_spin_end(spin->xe_spin);
>> +        xe_spin_sync_wait(fd, spin);
>
> so you start and then finish it. It look like we need a flag to
> igt_spin_new() to avoid the exec instead?
Yes a flag could be a good idea but this same function is used in i915 
tests too.
In that case all such tests also need to be modified I guess.
>
>> +
>>         for (int pass = 0; pass < ARRAY_SIZE(timeout); pass++) {
>>             unsigned int target_idle_us = idle_us;
>>             struct timespec start = { };
>> @@ -552,10 +556,10 @@ static void accuracy(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>>                 igt_measured_usleep(target_idle_us);
>>
>>                 /* start spinner */
>> -                spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe 
>> = eci);
>> +                xe_spin_reset(fd, spin);
>>                 loop_idle_ns = igt_nsec_elapsed(&start);
>>                 igt_measured_usleep(active_us);
>> -                igt_spin_free(fd, spin);
>> +                xe_spin_end(spin->xe_spin);
>
> I don't see how this would make it anywhere more accurate. It may be
> faster since you are not creating a new one from scratch, but I'm
> missing things in the commit message:
>
>     1) explain why
>     2) run before and after and show the numbers with the said
>        improvement.
Sure.

Thanks,
Soham
>
> Lucas De Marchi
>
>>
>>                 now = igt_nsec_elapsed(&start);
>>                 loop_active_ns = now - loop_idle_ns;
>> @@ -590,6 +594,7 @@ static void accuracy(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>>                       sizeof(expected));
>>         }
>>
>> +        igt_spin_free(fd, spin);
>>         xe_vm_destroy(fd, vm);
>>         put_ahnd(ahnd);
>>     }
>> @@ -622,7 +627,7 @@ static void accuracy(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>>     igt_info("error=%.2f%% (%.2f%% vs %.2f%%)\n",
>>          (engine_activity - expected) * 100, 100 * engine_activity, 
>> 100 * expected);
>>
>> -    assert_within(100.0 * engine_activity, 100.0 * expected, 3);
>> +    assert_within(100.0 * engine_activity, 100.0 * expected, 2);
>> }
>>
>> static void engine_activity_all_fn(int fd, struct 
>> drm_xe_engine_class_instance *eci, int num_fns)
>> -- 
>> 2.34.1
>>
