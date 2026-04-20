Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5AFEA71BC
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 04:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BC310E02E;
	Mon, 20 Apr 2026 04:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoLoQULd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F212510E02E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 04:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776661125; x=1808197125;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sBUpGqoOhdfbbEJBvPpdOfhkZQqM7UocBQMa26f5slM=;
 b=BoLoQULdp7rGZp/FSNJQRqIo7yjJwZGGfWNH8SCJ+tiaOgl7VQ6NU7rW
 0+qxnTjbTlT8k8fMY28wAY85m8EPw9hQWKRlAJvjq0aI9Nqq4dRG5yn2f
 PglWv/Fn5bpz6ulf0yNWEIncmey8jKnv+1uPu337zDLQhXMJ/AsrT7fVV
 snQszTjEnaMC+zEHJhY68nFpoEqlAEfddZoksJI2lmd7fJ0qo8Q3l6XOg
 ETteDNx/a+wSkZlWvzjulUbFl9AKtFbDoSDMTraewEKXK7bqTDnnS9ah1
 mrTQ+ODv+kLJTgk5jCYF6zHFKuHdTu7tUDo3c4y4nKEs9llWn5Y51ULN2 w==;
X-CSE-ConnectionGUID: 1kzMpal/TKuUQzk/EkxmUg==
X-CSE-MsgGUID: gUG3D3KPRaWDan2skhOb/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81446888"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="81446888"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 21:58:44 -0700
X-CSE-ConnectionGUID: 488f/v+6RgKovmGsOyGcdA==
X-CSE-MsgGUID: 2d+3rIM4S/yOVUCKVmYKPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="225113330"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 21:58:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 21:58:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 19 Apr 2026 21:58:44 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.62)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 21:58:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cs/I6Wlzh6HqAoN3sWKMLGeymIzjfkr9SuC5H10igP1N2uV3ch3hDmFmLCwLuiTW/YyB9tq5+aW67iL1KHmB1IcRCHUk77Pl4A3oGmSMye7rtH48W+dkXdn2CDCwMo/2DQRN4C5i4d/ZhmlUB06HuypvTV5Rc+f5S99lRR7AI6HTTs/hYgQrUUtQ/xe8gxlXrf/NsmSCg3WoTAGX6LWXY0QnUYo/XhriqLPfUIDAAJAkeJfYRX8Lanf2QVkU+oSWWJgy1tEBtyuLza33HQYlG9RDOjFMFMdTWncOcidMPedBSz1bPxFle6iFYPJOd0SWtMGjJXXoopWSBdUb3IIiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHGSc1+Et2MWFyuGsb1aLgMgqe0UIEHlsx9Qpc1h4rw=;
 b=T6lklauMdvYdrRjk7RXXpJC234O/zWZC5Xq01IuLg4veYoqWTFqms2oWXAxCuyqQ0RRtR1uDJ1gtylj0rUPTv6wh1I8VkLxzw7OdbCjdNE1m26RY4rxh+H94/7T9oaSeemul8ENCbx0KTm+ru9n/e4Xrb0DO3q62k/oqEnn9WFwdldtBV3Ey88A1KKQZ1xs8ibhOqfbx3BkI4yJ0aum5I9Ew8XS4L2LoNm3GX8DhHxWl0foLe/qYZok6xdZ85xpZAxSolWKxCLGd16LQpk4y1V8FbBetm/f2g/wITPHffsCAqQMaWKI0fIV9lt8ZEKQ38bBnixzjz47MsppJLeZN6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by PH7PR11MB5796.namprd11.prod.outlook.com (2603:10b6:510:13b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 04:58:38 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%3]) with mapi id 15.20.9846.011; Mon, 20 Apr 2026
 04:58:37 +0000
Message-ID: <89ca0bec-9d56-40d8-922f-b7e38a81ca4c@intel.com>
Date: Mon, 20 Apr 2026 10:28:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/xe_madvise: fix cross-compilation error on ARM
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <varun.gupta@intel.com>
References: <20260420044339.3171967-1-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260420044339.3171967-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0158.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::6) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|PH7PR11MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b564ed-f6aa-48c0-a954-08de9e997bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 3+A3SQ6jvJB+gGP/WrWAF9MLBbghli++W4ddoYSCRbvB3krLeCo8V0EP6V9XHbnQbrKE7kmBjecaIlcvWOirLKdQCbfJAlmSgJuih1mi/dbg93tFbKWNLw4C/F+ZEvj5eCGIOt9qM8LLGBO0vQbQqS/A+7dmUpoCnXGBpa8gn+NgBY62KvBOktI+1R9jjMMurZJGlc5RK4bbEz1ZsxBgJUmbWqjBZGtsGc9ehFLuFho1T+0xYHOW7Q6j1M2cIWq3ZMtZ+TwOTfgO19dAht8JWKLkG6WQwrnDwMwahxKQ347w5RoFs23dwMAbAABbn2tzNMDJSsRLxrI/P6rLmOMtMkN3zN6RIvppmrhcnf0quOcelgAtEiVmnepx1cYiQ6DqT+58dbEczI5xSs8HCgxu+KhuZDD2KBIsn9PJZszXhWnXjU3qbK2c2RrYYOyZxwgY/jWlZj3miQszvoAOBsQKFtw+glnVjkGeUMSvyS3YutR3dwJgjK38qOqEZRbw5r9CLoMZ1A0HgepSSrY6NsMsTuQ5ndgbqzwThlF+Dfwu4URYFtAWoh3q9FRTv5TvXxzfG6iCTik1S1f8eEiWQughfQ0/NRXqgBvOErtj9ydyR/kbJkWbPMrKPtCLboQYg7hZgEj1gtqCp7NywAafoyDlVP5gpyfuuOphl9ewe/keFSmdhDFwhchRDrepjDMrtcTB4af0j1Csf4Y0raYn0l78/RxCvvTfyqsShTsr1EReNnc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WklmYWlDK3htbTMydGdIOG01b29oUVNzczNHV1Jmak90UmUrM1pMS1h4NGZ6?=
 =?utf-8?B?d0RJaUhsOG1EN2tTYStFaHVuUzlNSUo3SGdrUUZMcmoyRFpGRnlYRVJZSW5S?=
 =?utf-8?B?ejN3Yk1MTnZVUFZyZTQzZzBnTW00ekZqMkNDbU1KalVsN0tPZUd0VkRlMmZY?=
 =?utf-8?B?S0hCa3kyRnRlN0prRnhnTEVGZGNHOUhkc3lhWEoxTC8wUncxMys4emdxRWhK?=
 =?utf-8?B?bExMZWRudU9aKzRLdWd1dFB5L25CcS9TODNXMU5jNHlqQzVPUVdtaEpzWmE0?=
 =?utf-8?B?dkZCVmFtM1IrOUJpRVV1RkFoaFZwSHJsMmZ6TTZycVowdDcyY1I1MVVXSmFv?=
 =?utf-8?B?ZnZOZlZFcEc4RTVoKzFSajlZUFJUUVJoSkUzUFlzWHZ1S3FvUGlLdVR2bFhv?=
 =?utf-8?B?VDQrSWkxZ0JYbnpUNkw3ZzR6VE9TY2VUb0FnM21zMHlBU1lZTlQzR2kvZ3Zk?=
 =?utf-8?B?QUZhNCt6K3dNTFc1eDVwNFAyKzhCTmRsOU92TkdBVllsMGlhVGFzRktRais1?=
 =?utf-8?B?aXIzODV5MFJSMXEzcUhCdWdURGlqT3RxTFk5NVNvQlppZ2JGbzhGaGw4Y3pQ?=
 =?utf-8?B?ZFdJVUhtcGpOMkQ4VWEyT2U2aEMvZUtTYmM1OE5kcGRoNURvejEySU51VE9M?=
 =?utf-8?B?dmJ5bTNleFRZc2prKzdOUU5UdDR5RFAyckFFYXlGSHJldHJjVDlCckVMOTRk?=
 =?utf-8?B?TmtFQ1RtaFpFYXdhY0hVMWd6Qnd0c2RacVFiZDVEaUhuSW1wcFJuMERFR1lx?=
 =?utf-8?B?bFVKeEw2SkF1NUVyS2JVZFl0ZUJVRFh0ZU5qVzJHWkQ2bTA0NzNMVWhLd05W?=
 =?utf-8?B?ZDBJWEk4ZHExN1BNODRkYTRVS25DK0tqVTJac293RitSSVd6KzBNVzh5eHpE?=
 =?utf-8?B?UHYrQ3pIWE1zOGhHemZKMlJqT1NweHFWOG1QNFVEMkFDTmdwbkFmMzArVTdE?=
 =?utf-8?B?S1YwbE1XdmpwRFNteWtTWW5LTmgyUHVlQ1RqZ2hEQjROMW9ScWp5N3VoYStR?=
 =?utf-8?B?MWFObzhmK0tqTlM1UUdta1h4enAvazZxZEUxSFJBUm9wMjloK0oxMjFVZCtk?=
 =?utf-8?B?K2JzVlNTODMrUnNScllMY212eE1MUHhNaExsOWdKeGREb1hacDY4NWcwb0xO?=
 =?utf-8?B?eXJrcDhQcjNBNStQNXF2S3Jtd0VkcEduUDF0a2FIN3M2K3NnOVZRd1V4TVlm?=
 =?utf-8?B?RXdqeEYydmQzMzlPdUp3SmV0Tmc2L2VqbnJOMkVxd2w2WkRUazBPUWNNS01j?=
 =?utf-8?B?QzRCZnpqNzhrc0hiRFFkK09FY3NQd1NsVy9PbE03WTVJREl6RnlpTXBIQWpN?=
 =?utf-8?B?eDJ1ZnFxbDNWYThwemFPV2lFTEZNMUNJK21VL3ZCMVU1VGtKaVNhV29EUHVI?=
 =?utf-8?B?WTFJMlc5U3dqOXRaSkdrQUdMZzF0UHM5dUNReXA5ZWVhbkx4b3NnOHRvTlIw?=
 =?utf-8?B?R0ZNK29iR0R5VEdQNmRYbUN0OHRqYlVjNkpYMmhzbVcxVnpuTDRUMHliK090?=
 =?utf-8?B?R2pid3A5OUVBcTV0Q0ZXU01TTkFNd215Y2tpUXcwU3ZKbkt3T0F6MGVFMUts?=
 =?utf-8?B?VitpdHlnZzE0ZkxwdFlaUE1KdjZnVzdZY2xWc05uZ3duOS93ZzNndXFweHU2?=
 =?utf-8?B?RFlpcWVZdXgrcmJ0L0VmSU1qZWkxRUozRW1MYnpOL3FBSHRzVWRBR3k0Y21S?=
 =?utf-8?B?K09VV002VXpobUF6eW5KT3hieEg5WmlhMXhFa1BkVTl3dUorZVZvWXVaWHY0?=
 =?utf-8?B?Q28wR0MyTlc5N1dZTk4yUXl1V0VsaVdGWVBXN2NmZks2SGsvNHJycTgySnVs?=
 =?utf-8?B?anIvbTdFL3lWZGVYcUtONHRjV25IaTY3aUF4R3YzM3QwZjlpUjdpeHQrdWdY?=
 =?utf-8?B?QWpUcVF2NE1WLytCRzB2RnhPcTFScEUyb254Wmw4dnlCcGlSMWpSc0ZJQzV2?=
 =?utf-8?B?MG5xZWxNTnluZEcwcEhocVp5eWxPTVJzenFiSlFySkZGbHViMFVaRC91cmNM?=
 =?utf-8?B?Rk9Ram9yalFGdWpQUDRFU3BrTnhsdDZmeW5kQS9uc3E2UDFBVE9xaDVJUFBP?=
 =?utf-8?B?MWFtOHVWbUljaXY2am1NL3p1T2grcERVSGRNYTN4TE16blJGc29yNUswYzhx?=
 =?utf-8?B?M2QvL053OVJuWHJNc1liaitVWjlwbDZtdWIzWDNyUWFVR2tkcnlXNjFXMXND?=
 =?utf-8?B?OW5iVmxxMGV4VVZtRW14MjdiVUlUbEVNV3daSFB1SlZsSjB2Z1d5bURHRDBn?=
 =?utf-8?B?QU5EVEtsRjlsSENwcGdhS1lyNlJjaHhYRWwzWEx3U1ZqQWtXRlcwdGdWZG4v?=
 =?utf-8?B?bWFGSlVxVGpJa3djTHRMaXE0b1ZkTW1nUmlwUHYvd1R2eVJKc1c3Zz09?=
X-Exchange-RoutingPolicyChecked: C+j9hICqO8+avEqBizfj6DOiunzi0YRnLvJcyR/uUIhowUoz5Q2CSa540L1EYNrZeJnop38c1UvMJ/2lr4ljzvH0uJRU4Pkb3cZboAAadrDxjhzECg5tXIFGjAtIl91mW9sMg2pfvqmG59tzaqWT/mzb5rDvfhpkt2sq1lnXwfarzHYgDONptrbOelNYZKZAxo2pPqcJ0mAaLVYwF8bvm0alwAI/UXGL3eSbETFG7ME2k7zGRgeRGDAESOXEHbCXxn67/kDscUdkePpxRy56VXea9dpQO+zo/O888TxTgsAI4aESvjUwecoMp6J2TWPlkCiv/em2vwh14EfUFlZ7dw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b564ed-f6aa-48c0-a954-08de9e997bb2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 04:58:37.8719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKfvSjjpyYBz61ZohngFzAHKcCzgSBKNJD1KQ26ZqfQPerDpABueffvKwQ/++WqLZV+BoTHkWkISAvD1/jbPfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5796
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


On 4/20/2026 10:13 AM, Arvind Yadav wrote:
> Casting a pointer to uint64_t triggers -Werror=pointer-to-int-cast
> on 32-bit ARM where sizeof(void *) is 4 but sizeof(uint64_t) is 8.
>
> Use igt_assert(ptr == MAP_FAILED) instead of igt_assert_eq_u64()
> which avoids the cast entirely.
>
> Suggested-by: Nishit Sharma <nishit.sharma@intel.com>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index 805de793a..c728cc5c0 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -198,7 +198,7 @@ static void test_purged_mmap_blocked(int fd)
>   	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
>   
>   	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> -	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
> +	igt_assert(ptr == MAP_FAILED);
>   	igt_assert_eq(errno, EINVAL);
>   
>   	gem_close(fd, bo);
> @@ -340,7 +340,7 @@ static void test_dontneed_before_mmap(int fd)
>   
>   	/* mmap() on a DONTNEED BO must fail with EBUSY. */
>   	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> -	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
> +	igt_assert(ptr == MAP_FAILED);
>   	igt_assert_eq(errno, EBUSY);
>   
>   	/* Restore to WILLNEED before cleanup */

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

