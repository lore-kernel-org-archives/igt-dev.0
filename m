Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E6DF433E7
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 05:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFA610E189;
	Thu, 16 Apr 2026 05:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ID36YTDZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7B610E189
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 05:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776318163; x=1807854163;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3A1rEv9Xna7Kz/LHrtYV/RD6klGhIlzLKmPGS87U7cU=;
 b=ID36YTDZAMqhMJQ+dhFhdn1zoRPjDyMnABZMVOdA0uGSrYuiDcgUbPW1
 t3pllnQHHPJ6AY3aybGT0/vPRpG+yqrvkYuFjnCsBxw27Bb/j1BN7hBFE
 GHN/Cs2dNhHpVIzVC8flHdYyMU5T4Krw8Sviy9gYQ//NiwdNNuE2faNhv
 Nnr9QRvm2egsTur1mMrzhMos5Z/TBOtdVc9n8GpMTnZLUtYdZDLd4lkyq
 bxvhUucqkuJ7iEHiBJAW835Ajjzo1/Aa1XGrGSnN5UQTWlbpseDxm5psH
 dmLPUAJRv1drVrzpk5hAQsojxch+cGyKTfhGpk+MeTLu5f2WgwwTmHR4y A==;
X-CSE-ConnectionGUID: XFA4KbraSUisQhxFRUpvew==
X-CSE-MsgGUID: l2XPzBLtT1S4leX2GqIIbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="87610459"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="87610459"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 22:42:43 -0700
X-CSE-ConnectionGUID: F2pe9bYBSwmZvB1ER03meA==
X-CSE-MsgGUID: dXtnq+uWRKORZeppNAxJYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="232365800"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 22:42:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 22:42:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 22:42:41 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 22:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjjFMJ7e1lhkpFIssXfiMvuNZRHHi2zXEwccDmb/nPsST37Zzgj5wip3nMM6rpUdvwSj5GghTkISmDtV2az++Z86NjOhstDol8x3iWiDnZFDxmfzee7W1A5GJeQK84GIYVHVMZJ7pejNxrfR8AhyWv7BxJobge+bLlcq3eobETztYTvW9ArArQ/MXO2rC+MAc/qOU9JBLUa8aHpA1cG2Q0ERtbUaOcUe2iNqTo51B9s2jLdGG7huriKhHqtJxqJDiUFakFK0CfEpHjnCNn8X9Q+roUnWqN9ejCpIgta1pnD7GmLo96mUv5m9iXjVdwx4mq6JFTtzxZc8+mp0wdAOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZ4u75+BhR+FnpchB7OJ20sBBQXZkzYjMpf/ttKiae0=;
 b=B0XXyjjFxfqPhROecTM3hX4gMdKr+mJmJmYIiwWUCDYAtp4IoBy2IUzaPZGVFj3T3VtBrzC1VSFuuY8ZQMm3kKYQ0khnOTJ4Pdpsf1kYcwtzHGof6xFAL3mSHJkiqtyU5Gu0lG97ABS1pMgW0iyQ0tU7E+fRKrrOf8YVNy93QKTcTlFMMwTMp7VTsmcgDOREUlsD/x31R7bLHgcI5+5eg9XbfiIjGK6i0vN/P6fuUzqMmk+cKop2soFa47FxfFm8bWhafDtaDDlsCWwkzECv7JADwZTNlZvwBjMvytgeUERntKv0hAUOu66tRHSoj2t7JTM4HT4uxOIcxWb7jdFCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CYXPR11MB8756.namprd11.prod.outlook.com (2603:10b6:930:d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 05:42:38 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9791.035; Thu, 16 Apr 2026
 05:42:38 +0000
Message-ID: <211de46b-fa09-4008-97d7-be5aa28c0fe9@intel.com>
Date: Thu, 16 Apr 2026 11:12:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu: Fix typos and grammar in comments
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <aurabindo.pillai@amd.com>
References: <20260415165324.918274-1-alex.hung@amd.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260415165324.918274-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CYXPR11MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c63270-869b-439c-20d0-08de9b7af791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|366016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: c1M0LJVa/W6EKk0TK4+Rdzpa3jxjlbTP1GYgtguDxEJ6PYD81DXtEqDU48Kes8Cf1K1GYyqO182YB1yX48hT3ycOCVrt7qGTuRN+gGpB2lGU+vN3PZbwgkA8w+AbsN5ACzVEhtSbvwFbtEcXg19C2Ug3aZl/Gj256dyuOt9qXP8OllGIGP2jokbnpLg4gYHAQH8ENEBVdNGYslgBctM/mTGFK8D+P8dAbbBgEFywAC6F4Yen7cw6jMga26y/wGlhlrMk7kW9D/RYQ2G40eoBySobkO5onG8HaY2HVCcYgybdOdS6MST9tVlOi2HtjhkjpCjTzg4CyHIlSJAqnCyYEsp4h7I+B5IUUESAY9l0bSIQCrSun3EQ8m7Bf7uScGYgHOKp8/mUu79FlVME306nCVK7o0n/MjsCud8InGL7Z3xNugWJ648eJgKoAzS5ZQRwfn++jeEl+xStlKs3ZjjX/l+AcDcSyowjrF5EDuW403taIFb5AStjseuZWPG1NhOZc6TiXUUN9qtcWvrdFfWZQGhxqiChCI2jgGYR02fuXSxC30NxNE7zDf0lB8JXxfiJ1HAsge6waA1f++uACFTMjhI17d78dO6X+/IVTX+Ni16sZSYjvgmW/3ncjFSrJGp5ld3brhLdQBXBdTKnLZ9jQMNsHoTVyxPMn4ixigDcgueLIteupwM0LnZU25C7If9YBmfnWG9yjhfIdYme9FYKKlgYt+ceQGK0mc5wi+VVwDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFl1SDFYWFdIVkxMSUgvU21XV01TMHp0c0V5Yi9tcXNmZzBLdk1BbFlmaklP?=
 =?utf-8?B?RDg4UXFKcWg1M3NDTGl3QVFwRXQxK1I0M2dLWnhpajluTGhmSS9XSTAzdE5K?=
 =?utf-8?B?Z2dxTDRUOEhwUm1JUTN5OEpEMjhyci9aRHdmQXJmS2FuNWlURGFQWTNIS2pE?=
 =?utf-8?B?VEt1UlNWbWlhdnRkbHBwZXZKcEhuSGpkdlBZai85MEUyM3NQNVEvdFVXTWc0?=
 =?utf-8?B?eHYxT2t1ZEhCa0gwQnl2T2RMSk5Zd2o1cjh4eE5nSVFnQ29GS0g3NHVrNUdE?=
 =?utf-8?B?S08weHN6N0U2YmFZM3RCRFZnSXhaL2FSeFpaSUVpVkRaRmR5R0oxanU2ek10?=
 =?utf-8?B?QnlERW9qcmpqa1o2Z09zNFFOcWJKcXNQYnBkQWprbDAvQ3BNS2FJNjgxdk1k?=
 =?utf-8?B?UzlMRW9uSXg5ek1OcTIvaWR2QWcvMXJqeEw0UVFFeU92VGpZSXptcUt2MVNq?=
 =?utf-8?B?cUdlY3NEUWEreHlaYUdvV2hpdVVPRkxBWE1kWERtdGF2QkM3Mkx6a0RyT3Ex?=
 =?utf-8?B?UjlhbTd4d1dVRzZjVCsvdDFvb1N0U2t3eFBFbTJhVmRuMHZiaGdwZ2dzalYx?=
 =?utf-8?B?SHR3eHhvcVdVemdKeVhnVDZqa0gzVmpQZkZRdXlqcW1ybHdkL0JQbmFJeEds?=
 =?utf-8?B?d3Nwd1N4NFFBKzFHZUJuMVFYellIZ2kwNjFBUVQydXVRdVdyVUplanY2ZEVn?=
 =?utf-8?B?YWpPb296di9sNnJlZ2dSOHBWQWtpbWtkdWFQN0lycDZzRTZmTUptc1pwN3pz?=
 =?utf-8?B?VG5tWkNIbThlMzNQYnlGNjJheVNtUkt4aUdrTHJ4Zjh0VEY0am43MXBmNFVY?=
 =?utf-8?B?aWhZSy9uVXFoQTBJRm1pd05XTDFiam5Ta0p1ZXhJNkJuRGVCUTRlLzRUTExB?=
 =?utf-8?B?NVJTazlBMWEwaEU0aTB3ZCtxLzFxSGRnaVFDMEtZMG5PTjFkQklsV3c1Rzhy?=
 =?utf-8?B?a3lqT1lYTzR2b0hFaTBLaHhqSGFQd1gxeXNIS2pxbGZUZDBOb1g4Q2xoR3Vj?=
 =?utf-8?B?L29JNDVPY3NxbkJ4VU9vbE1JcHJSQlVEdU5ZekhtOEJkMktSaTJEd3RRQndB?=
 =?utf-8?B?U1hXZjFJRVVIbXB4YkQ1VDZuWjZlZGhRdnhKa0pUaFdoNWZDMGxaSlNQRGJJ?=
 =?utf-8?B?NW8vSHBmR0V4M1hvMk5uYWwrWXhQZWE3WnRHWkRybGMzUmNzRDJIYXNxTSt1?=
 =?utf-8?B?TlRlblBER3BJUDIwaE5zQytua3BkdExGdjdBRXRhM0RVdWdrY2J6VU82Rlg2?=
 =?utf-8?B?YjRIN3NZQVRWOUdmNG5XcDMxb0VVSjRXbnR6QzZSVnBmTXpmNzhISitnVUhw?=
 =?utf-8?B?Nkl3TmpjY3FXbFpsYWQrTHdieTBXMEs4OFhGOWp1ZWRTRVRUM1ovTnhCay9W?=
 =?utf-8?B?NFAzS0J4Mlhkbk9kOWE4azVuWFd2SG9nVEZwWm13eG5VZGlHYWZpZkdhN2hT?=
 =?utf-8?B?TzhhUUhab2ZIMWpKZGpwMFN6KytMR3JqckNkMWJOeXJhQktkOW94d0ZNcUg2?=
 =?utf-8?B?VnIrYzFZWW1uOFpzaGYzNURKZUZ1TEEzUE5zZVlVdk1YM0MxN29PbFd4ZXRh?=
 =?utf-8?B?VUtldWkvdno5cDhGWjZjN0xjSld5Z2p5M3QwUjBjUnUyVGo5QkZXZGNyeGtQ?=
 =?utf-8?B?S1Q4K3JmZTJ3SHlrTUVMak9FTUZ1ZTl3M0RlV3dHWU1UNWNld2VlR0kzeG1W?=
 =?utf-8?B?bE5lTUJaSVRpWGdnM2U5bThJT3QwK2VvN2JNZEJnc2o3K3lwWitmOVN3aGpR?=
 =?utf-8?B?OC9WK3lhUThrNnRSVndhWllJbERyQXRHTk0rZXljMjl3d1BhV0g1dEZMYWN1?=
 =?utf-8?B?MGE0MUZzOEFSeFVMOFpOR3U4eTk2bWZsK3lMZnJHWTZyRjB2ZmZ1aFJkYWdr?=
 =?utf-8?B?K3ROOWYvbEpXbi8wbG55MHVFSHZoSzVsZFZjM0dxWktkZm5lUytyUUt6UWlL?=
 =?utf-8?B?aHhyOS9SMHc1WUFJU0d6aXE1cDVKQWl2OWZhTHVtd3hGU2xFa2lZSmJwMjRJ?=
 =?utf-8?B?LzZveUhNQ09FWHZvSUVRaXZNdjNjRE92aXg0SkpzRGZKV0xXRmdWdFMrTEZj?=
 =?utf-8?B?K09pUlp0T21OM2NHYjd2Y1BFVytUZnFYUGkydGZacXZvVERsN3dUbWwyc2Nn?=
 =?utf-8?B?Uk01L25vUzRERUxkeVg0Z1FOUWdPenBNMzZ3SWMxQnNGVEJjRjJLb2VKQXVh?=
 =?utf-8?B?QlY0SDdVeHhkM1IrUlczTjlZaUJSSk84ZlB6aHBJYUFGekhkdC9qVUFpWEd5?=
 =?utf-8?B?MHlJcDVyMEt5akNueVF2VGZhVmdwT2tqMlNNMWlHZjVIeFBUVlBsbWZjYitY?=
 =?utf-8?B?TDdSOUFFaVVodFJoK0t0Vk1VZWgzRXBjYnZxMWN3ajQvNzZTcWp3QT09?=
X-Exchange-RoutingPolicyChecked: fq88tBOCXBlENM26u8G656QEE8tTh9SwHMysV0yw3VWg55AJYqBkUYCBz68AymfOL2zmkyFzMcy5ggemWcNupBzxqEAzaX3ECTTPC78o/qPKrhqZTO7WlLjr7WYRsF/fCehXJdCtAxdg4LMuVLr36J02OBX04RIboVbE/8vyFTFb9FJjvWuN5dgOD3+bI0x8IzkD8UX0A1j9ypncetr41MNXlaMV1ijSGdJ2bna+DhSX9QXaAzV0/rHDYALkR9WdUlLnSznLn+bdQR9tGgUsAyO5CDZkP4BaJaml+RDAD+wrBRGAiu/7puZDhUWL73BcKG++CYCwX7IPDVxBu6d0lg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c63270-869b-439c-20d0-08de9b7af791
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 05:42:37.8649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPAvZGqjTu81x5+/WhfWwEYNaO/3r6KCjdPT/ZIVutmS9wcZ/nfPfPUra9XMjpoo6yWyuXMPfFXawPDL8q6mug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8756
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


On 4/15/2026 10:23 PM, Alex Hung wrote:
> Fix spelling and grammar issues in the following tests.
>
> amd_dp_dsc.c:
> - 'Maximumm' -> 'Maximum'
> - 'outpus' -> 'outputs'
> - 'horisontal' -> 'horizontal'
> - 'v_ative' -> 'v_active'
>
> amd_hotplug.c:
> - Capitalize 'return' to 'Return' in function comment
> - Add missing article 'the' before 'reference image'
>
> amd_mem_leak.c:
> - 'amdpgu' -> 'amdgpu'
> - 'memroy' -> 'memory'
>
> amd_vrr_range.c:
> - 'Maximumm' -> 'Maximum'
> - 'more safe margin' -> 'more safety margin'
> - Add missing article 'a' before 'golden sample'
> - 'Cannot parsing' -> 'Cannot parse'
>
> Assisted-by: GitHubCopilot:claude-sonnet-4.6
> Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/amdgpu/amd_dp_dsc.c    | 8 ++++----
>   tests/amdgpu/amd_hotplug.c   | 4 ++--
>   tests/amdgpu/amd_mem_leak.c  | 4 ++--
>   tests/amdgpu/amd_vrr_range.c | 8 ++++----
>   4 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index b84411636..1742c7df4 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -28,7 +28,7 @@
>   
>   #define NUM_SLICE_SLOTS 4
>   
> -/* Maximumm pipes on any AMD ASIC. */
> +/* Maximum pipes on any AMD ASIC. */
>   #define MAX_PIPES 6
>   
>   /* Common test data. */
> @@ -82,7 +82,7 @@ static void test_init(data_t *data)
>   		if (!igt_output_is_connected(output))
>   			continue;
>   
> -		/* Ensure that outpus are DP, DSC & FEC capable */
> +		/* Ensure that outputs are DP, DSC & FEC capable */
>   		if (!(is_dp_fec_supported(data->fd, output->name) &&
>   		      is_dp_dsc_supported(data->fd, output->name)))
>   			continue;
> @@ -236,7 +236,7 @@ static bool update_slice_width(data_t *data,
>   		igt_plane_set_fb(data->primary[conn_idx], &ref_fb);
>   		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   
> -		igt_info("Forcing slice width: slice width %d num slices horisontal %d\n", slice_width, num_slices[i]);
> +		igt_info("Forcing slice width: slice width %d num slices horizontal %d\n", slice_width, num_slices[i]);
>   
>   		act_slice_width = igt_amd_read_dsc_param_slice_width(data->fd, output->name);
>   
> @@ -293,7 +293,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
>   		h_addressable = data->mode->hdisplay;
>   		v_addressable = data->mode->vdisplay;
>   
> -		igt_info("Mode info: v_ative %d  h_active %d\n", v_addressable, h_addressable);
> +		igt_info("Mode info: v_active %d  h_active %d\n", v_addressable, h_addressable);
>   
>   		/* Save pipe's initial DSC state */
>   		dsc_before = igt_amd_read_dsc_clock_status(data->fd, output->name);
> diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
> index 83ad55ea0..c54288e90 100644
> --- a/tests/amdgpu/amd_hotplug.c
> +++ b/tests/amdgpu/amd_hotplug.c
> @@ -122,7 +122,7 @@ static bool is_system_s2idle(void)
>   	return strstr(dst, "[s2idle]");
>   }
>   
> -/* return the last hw_sleep duration time */
> +/* Return the last hw_sleep duration time */
>   static int get_last_hw_sleep_time(void)
>   {
>   	int fd;
> @@ -189,7 +189,7 @@ static void test_hotplug_basic(data_t *data, bool suspend)
>   					  "Suspend did not reach hardware sleep state\n");
>   	}
>   
> -	/* Trigger hotplug and confirm reference image is the same. */
> +	/* Trigger hotplug and confirm the reference image is the same. */
>   	for_each_crtc(&data->display, crtc) {
>   		output = data->output[crtc->crtc_index];
>   		if (!output || !igt_output_is_connected(output))
> diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
> index 1e55fe785..1d7aa3a2f 100644
> --- a/tests/amdgpu/amd_mem_leak.c
> +++ b/tests/amdgpu/amd_mem_leak.c
> @@ -45,7 +45,7 @@ static void test_init(data_t *data)
>   {
>   	igt_display_t *display = &data->display;
>   
> -	/* It doesn't matter which pipe we choose on amdpgu. */
> +	/* It doesn't matter which pipe we choose on amdgpu. */
>   	data->crtc = igt_first_crtc(&data->display);
>   
>   	igt_display_reset(display);
> @@ -167,7 +167,7 @@ int igt_main()
>   
>   	igt_describe("Test memory leaks after resume from suspend");
>   	igt_subtest("connector-suspend-resume") test_suspend_resume(&data);
> -	igt_describe("Test memroy leaks after connector hotplug");
> +	igt_describe("Test memory leaks after connector hotplug");
>   	igt_subtest("connector-hotplug") test_hotplug(&data);
>   	igt_describe("Test memory leaks with driver unload");
>   	igt_subtest("driver-unload") test_driver_unload(&data);
> diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
> index cc3323df3..4397f3c15 100644
> --- a/tests/amdgpu/amd_vrr_range.c
> +++ b/tests/amdgpu/amd_vrr_range.c
> @@ -28,7 +28,7 @@
>   
>   IGT_TEST_DESCRIPTION("Test EDID parsing and debugfs reporting on Freesync displays");
>   
> -/* Maximumm pipes on any AMD ASIC. */
> +/* Maximum pipes on any AMD ASIC. */
>   #define MAX_PIPES 6
>   #define EDID_SIZE 256
>   #define EDID_PATH "/sys/class/drm/card%d-%s/edid"
> @@ -249,7 +249,7 @@ static void trigger_edid_parse(data_t *data, igt_output_t *output, uint32_t test
>   	else
>   		igt_amd_trigger_hotplug(data->fd, output->name);
>   
> -	/* more safe margin until resume and hotplug is completed */
> +	/* more safety margin until resume and hotplug is completed */
>   	usleep(1500000);
>   }
>   
> @@ -325,7 +325,7 @@ static bool find_vrr_range_from_edid(data_t *data, igt_output_t *output)
>   }
>   
>   /* Check if EDID parsing is correctly reporting Freesync capability
> - * by overriding EDID with ones from golden sample.
> + * by overriding EDID with ones from a golden sample.
>    */
>   static void test_freesync_parsing_base(data_t *data, uint32_t test_flags)
>   {
> @@ -354,7 +354,7 @@ static void test_freesync_parsing_base(data_t *data, uint32_t test_flags)
>   			trigger_edid_parse(data, output, test_flags);
>   
>   			igt_assert_f(find_vrr_range_from_edid(data, output),
> -				"Cannot parsing VRR range from EDID\n");
> +				"Cannot parse VRR range from EDID\n");
>   
>   			expected_range.min = data->expected_range.min;
>   			expected_range.max = data->expected_range.max;
