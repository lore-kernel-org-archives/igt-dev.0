Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D77FFB5175
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 22:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2124D10E302;
	Mon,  6 Apr 2026 22:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUYTXmPm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D4C10E303
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 22:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775516027; x=1807052027;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1u1MsZa86KhQA755IV2yQLT8o10rxQYQ9EW8W7mAn1A=;
 b=BUYTXmPm3SRcR/XSx33st3wovNqANeTjUs92FGASOgGdMHZ3k3mX9pr/
 QFEkFE5UVyw4VO2I0h/7oPgZQ/hAHuICtNpYf8HbaWp0IVSQNBTDT7AIj
 eDfOT9rX5F3HQuw/WUYNQYc6lU7XdsNSjGKKlocABz4sR+T5Z92jPDFYa
 W8ViwUhTIQ6vnQIjOD0x0nZllFeFI1pTasoscLxWktX2I5EnNWrjl64ki
 g0J9uYx1K36h7ULJquYk1yKTQghE1ForG+4fUHfMqrlPn+teS+36pAt2h
 y0ha1mW72pqWBODjs6CEqn/4jLMPQV/fYGKAl2SFKiakRMFSAaDT9qoIp Q==;
X-CSE-ConnectionGUID: wCILSww2Rp6YQxhTDVVmCA==
X-CSE-MsgGUID: eJMbv9kOSRiY4bRNPpvpxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80329135"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="80329135"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:53:46 -0700
X-CSE-ConnectionGUID: 9zWkyGVZQT68z/Bsb+iAUQ==
X-CSE-MsgGUID: Q4ViZakWSHiz8/g7BJX9Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="227905015"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:53:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 15:53:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 15:53:45 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 15:53:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfuuX7npa3AFELPPN+fvwE3Gs35UNEjYWVV/hYffuv4EOiPoBshTE07coEHHqLF42EcOHveA5qZmyDlpNPO71wTOPKuyEpHntbVwDG6cSZI7HnMBvOe/oyaTCLetiQkPMNvowpshsscT3Q3Vy2Lg+xau6VGm1yM4qzDy9cRNOnS1KJCWIryUwSkSr8QdaaZ5rCByBPrkFGFnSlyU7r89z59R3QPOeWndpphBlt8+5My+aOZgUwc5Nh66mwDFvxz/bH+Y+wQWmuzB3tx8fIEgHxJuxlOm6pq3VLbF7ZGr+vFNdIzZIBLHl2CmRhNNDcEzz0eZO57/UQMck2bxhwx5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1u1MsZa86KhQA755IV2yQLT8o10rxQYQ9EW8W7mAn1A=;
 b=m2kENXS6xUeSy82tSLoBoZicKAUZ3RSHIWBxBPFIJIn7RKnLXScMCZj6FPmGiZy5FGzxCjHBPqTFmEGSbgKAimY29+KtEZYvZqR6kFgIDChPqNFi6TZP+6lotQSdsrK2mgWBjJO/LkyG18q8n50Ti/7RuPCo7/RGJ/pzI4cJzmo3YQrDSFiaBZabXxnFwqM+eNelSFJ7AxbQojQqiDNMgP9MpIgjsFdt3CGz2AQo24p6LPoH35gF8YhXcL4MUBxmss3h+3vPAJ5FuW3cEqoFYzbLkXhDS24N2jutu3yXmOd4qrZXfGG+faCUdloa4hYg/8JIx19i3Luw1BrI9aWmuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6683.namprd11.prod.outlook.com (2603:10b6:510:1c6::9)
 by BL1PR11MB5286.namprd11.prod.outlook.com (2603:10b6:208:312::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 22:53:41 +0000
Received: from PH8PR11MB6683.namprd11.prod.outlook.com
 ([fe80::a62c:97d9:446:ccca]) by PH8PR11MB6683.namprd11.prod.outlook.com
 ([fe80::a62c:97d9:446:ccca%4]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 22:53:41 +0000
Message-ID: <1cec892f-2394-4fa4-a653-e19720502a8c@intel.com>
Date: Mon, 6 Apr 2026 15:53:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] fixup! tests/intel/xe_pat: limit number of dynamic
 tests
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <x.wang@intel.com>
References: <20251119231900.3797119-1-zongyao.bai@intel.com>
 <20260406222703.3217769-1-zongyao.bai@intel.com>
 <20260406222703.3217769-2-zongyao.bai@intel.com>
 <87h5pnd82z.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <87h5pnd82z.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0072.namprd08.prod.outlook.com
 (2603:10b6:a03:117::49) To PH8PR11MB6683.namprd11.prod.outlook.com
 (2603:10b6:510:1c6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6683:EE_|BL1PR11MB5286:EE_
X-MS-Office365-Filtering-Correlation-Id: b8723b78-53e2-4050-19a4-08de942f58d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: sz55Pfe32pqfnjEnGsN3Lth4dOT6TZUFryrVTqhboP9jJOtpc73H6iYfSfYs3diJ80xjYMVftYQ4aGSi/Ndso3AKxXcHxBXJljcHucohIWN5fU9E6cGh9iCORoKnoHqLfsQ35GlWT0GHRjWmjoEJnx37e7LxaoxfTI+A/iTENgHAA7m4LMz0biq5KfTUMIysFB/MwFGukBsGQ+ttDGtsfG/1IHppVYfG3qdt0WqalEFNxklD8fyHZuhtG1hVcaqijEhIjmR0kWITgxWVxvZXDOhhIzWpHBMymqluC8V1QN4/G0jjYmpol9bLK8BHcU73ng4EIzLVmrwZkeuIbkSQ6aMbRhU6o7Tz19zvLMGy4gZXXtNXNeYc4nyIWwANLPtuEsnGZpbxEHFKMzxZmaoH01uQD7inq41vnjsKZ5wqr6pPyFi495r+wCZv5neOLAqVZlpWGHiy2RCLpbg+F66KmbyY2EBIbPpyPGrpozskbWaRA7nu3XwxP5PZgPemxxaiiaa+rl8HrREyYlEF6LdJtXOiDJln86hVQMb2+MS9235fV2IvdGnXkymnDA0RXF49y+UymqEfPiC3FK3PTHFR2dsOuZo/BKF6SBHUxTUOShAapblvd0kqTgV2mdB6GVtkXnr2WPVOz69QZ1C/bZpWLzp7ETS52WC+BLfW8pK+OM6cTFi1dRTdb5vXIZ5G9eQ5BH1IIG8KBTPNmrlmvXKVbe5QG6uaIq6Dw3EbFyMkSAI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6683.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUdNMk4xUWtkb1Q3bzlPdm1GMEMyZjVUNHAza1BSdkdFT20yL3k1N09CS3dk?=
 =?utf-8?B?RG45OXA5RFdwc0IwdTI1S2pGa1Nid1J1bkwyVGI5K0RzOTlvQ05ha0tXQjZQ?=
 =?utf-8?B?b3ZDRzVYTXloaUFLK2lZWURMVGI1bUlZU00vQTNMaUFWUnlYREpENlE4MURl?=
 =?utf-8?B?TkZtRzB0d0Z1RWJVMU5ubXBXUTk5WThiYSt2NlZKd3ZlTmFsazB1ajFtS01H?=
 =?utf-8?B?WjFkd01uK2FIMlU1SmF3S3ZDcnF0VE96U0pHQVRwd2loTStjT1oxalZBeHpx?=
 =?utf-8?B?MW0xMHRXMndMMkZyaVRpWmhWUGw3N3R3aUJWTGpJcFBhTHlHbUJWbm44V1hL?=
 =?utf-8?B?R21TZ29SVVBvdk05SFVtMkxFWE41a3NhUlpyTVV2QStOenl3eDhKTGxHVTFk?=
 =?utf-8?B?T1ZPUHY2UDE3VG5IWnRPZDc2enZYcVF4dFlCWDdYQlZJWS85RTdWU2FHUi9M?=
 =?utf-8?B?TVBTT1ZjdHdRSmsrbE10NDRZQnhTMjF1bFU2N1FCakl6VllWWWQ2dFpqb1hP?=
 =?utf-8?B?cGZOaVdBRTM5dTl4RUl4K1JOdDQ2YXppbmRhOFUxa3V3NU5XdnlGeWRMdFVL?=
 =?utf-8?B?T3dXSnNTZGlFZ1cwS0NnRTRyLzNmWEo3dUJPcUNsM2pGbmY4YVNEcWRFUGJL?=
 =?utf-8?B?YnZ2emlWUi9NR0FQNHdSRy9zWVFyQURzd283d3ZWWk5qaEp2aFBiZks1TVRr?=
 =?utf-8?B?cWtDbCtFOEl2eEROODJqMUlNcVdBZjhHSmtnSHFPT2ZLTFRmQXZZUmNzcTRi?=
 =?utf-8?B?ZFdhYStBSitBN2lHWDE5RXJhQlR5cWh6b2FoZTIyZFBYVG01MFRoZWZhNnhr?=
 =?utf-8?B?cmJDQSszSDdDbm5UKzVKd1VRWHJPNDZ4ZmhURlp6VE5GVk1VL0x2SHFDM2VC?=
 =?utf-8?B?Q25WOUpicHFuMElHVEtnWHArMitSeXd0Q0E1Z2htZC9reTFTYXVlRG1aUC9D?=
 =?utf-8?B?ZTZkVkdSWDkwTFlYeUJ0L0hwVmNKb09VdU9RVlBibGZzbHkxblFITWg1TDl5?=
 =?utf-8?B?cDkrYUlyM1RvcUlOU3c0UHpaRmNGWjBsVDFpYzBBYUE5NXU0YllkNHM3bzFh?=
 =?utf-8?B?QTVoRW9Zc0s1Y2xSeUpqN3U5SmNxQ0Y0SjU0V1c3d1VRUTRJMVNRSng4VkhW?=
 =?utf-8?B?L3h6WGJDSUFnTllSaENoNmlHS1lYMFdaQWVjcWVtbTd6RzJKajE5UmVYTFBa?=
 =?utf-8?B?VDBjbUJnUDFJY1NGTHhEVEhPeGV3OXp3ck4rU3dUOFRtZkFHUm9KWUtub015?=
 =?utf-8?B?MXdwYTNmM1VybXJzaEg4ZkJNbjZkckZpdHNRdVFUd0tHdEprMUdRcFBGejE1?=
 =?utf-8?B?ejIrK1lRdVhYRW8yZGUrNHJvOXhoaDQxaDNNOEFaUjhlSDY4QVlrWTgzVlRK?=
 =?utf-8?B?cTJyZkxyLzh5L1dQSFZJSkk5am0wdmd5YVYrOUx1NGc4akZiUU1GR1hLMlhC?=
 =?utf-8?B?ejlUMkNwNURNSWxuWG5vcC9XTi9iQU5kOVZ5THU2bU1OeUtlTzM1M1ZiR2V4?=
 =?utf-8?B?VWlxY0tZR0hxNEcyVWhIL2FuMnp2VVppQWZSWkU4MDZlWkU3ZHFoZ1V0bC9F?=
 =?utf-8?B?TDVhUm93SnBTSUxZWU1BT0VMdFBkSkY4ZUcxNVZCQnZvS21Qb21tV1Vrcldx?=
 =?utf-8?B?UE5GYnpMT1RtZnpjTVkwYnpvL3c3VUltNThYNGI5UG9MNnROY01uSFllOTRN?=
 =?utf-8?B?QnpRdTVLaXRFSlFLVS95TUdPRlA4b21KS0N2S3BTVWlCNFc2VE11RjhMcWZp?=
 =?utf-8?B?RjcxNnJ1WFhpUnFEYldXQnVJZ0k0UGlGemo4WlVVOCt1WmU3RVRkYzlUak82?=
 =?utf-8?B?N2NuNXBZTFpMZytlUm90VFViTGl6Tm5zSjQwNG5uZmZoaGxhRHNTcDdvWWkz?=
 =?utf-8?B?TEUzZFRERzBwMkhJR0hsanJkV1VPYnRmN1U5RVZCOGNyMDdTcVNiRkRpVzZQ?=
 =?utf-8?B?SHJyMTZ4MitUVGppQ0RCMzNuMk45aHlscVZmdWdZME9hNkFQL2RDcUJ6a2JJ?=
 =?utf-8?B?V2ViVitqWjkvdm5CVlZ2RTBkSlg4cG5NZVZKaTFBZGQ2RTlFZ1BSb0J0cVZR?=
 =?utf-8?B?QXE4WXoxaUl4NVhpOG93SVljd3MzOU9VbUMxZjRwN1dSN0Y3Yk93Z3FGdEt1?=
 =?utf-8?B?ci9oTHh0ajkrd1AxS3djOEtNZFBSa1c0eVNTemhHZmRPMlJLM2Rnb3lwSzhQ?=
 =?utf-8?B?ZWlQT1psM1U5R2Q3YThWMS8waHc5dWEwUnIydTJHb1g0cTdQUzFPaU9LM1M2?=
 =?utf-8?B?K29HdVNwZkRxRU5FQjNjd3pqaTNtNU8rMVFReUFLSVJwUkZRd0xrQVVQaXNP?=
 =?utf-8?B?aUNKTjJWNmJtLzB4YnY5RHlIaE5DMXI0TitIMlBWbTZuS01ZUCtmQT09?=
X-Exchange-RoutingPolicyChecked: o7L6jfkQwpnmUFGPtR8KQfoelhsvIVN3s5FXUplerFbVjdvV7BXtJcVjPGLOJsEhRVGwpwZnufT4S1IChL9kpnp8U51JYViO1efDfmOV0yv+UGmHwOH0aMszlJCjkU/QGtPwDbEyfkjzXR2YuAM8DEUBayTh6HStyCHxvUo56CSnQgQv8uG4PhKERPGNwff3/igwrPALcfkn4q2xANZVXPyNGKg/sRiip9DcSE+u5Fmu47YfxMlYaZXOWmlefEs/k/s4RuMwYcFZW3iQgg1zHCRHwaI8hu4ySTgItKYyC13Zk6rtSXL01ktPwsyEqXG/2NX12dl0XFv9DynR3Hrx+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8723b78-53e2-4050-19a4-08de942f58d7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 22:53:40.9822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVa+emAvOI6DJcgVPST+vgDfhQ7hj4FS8b5ItY+txs+9V7vTpUiHmG3WxQumAcbTVY+F2sYeJGgAS2O2ELiFeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5286
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

On 4/6/2026 3:42 PM, Dixit, Ashutosh wrote:
> On Mon, 06 Apr 2026 15:26:59 -0700, Zongyao Bai wrote:
> About: "fixup! tests/intel/xe_pat: limit number of dynamic tests"
>
> We don't rebase upstream branches so 'fixup!' doesn't make sense. Please
> resend as regular patches (with a different title), when you send the next
> version. You can add a 'Fixes :' tag (similar to kernel) if you want to
> reference the previous patch being fixed. Thanks.

Got it. Thanks!

