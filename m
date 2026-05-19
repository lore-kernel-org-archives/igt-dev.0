Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D138ACD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 05:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B2C10E121;
	Tue, 19 May 2026 05:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+mwbBTP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5820810E121
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 05:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779167387; x=1810703387;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mFPU0cqUtUzv1F+CxVnKvnqooCXvtBrSxvxhwVZDzz0=;
 b=M+mwbBTPA/tZmEL2ojPzqs6Z8loGT/FpEeO+HthHfnjDScFJa0tMLyaq
 TmoHLPLSADXgPWmsxlFuihnQuKGRZr9QDX71zRvYOLjQyadlrde8CpBM0
 oLDCSHFVaoHY78F7TFafczcvveDVd+3ChPU8HSmXY23Rw1hnFwb4iw9Bb
 6DIBc9gkVAH4aIPuE0hdOXUJmr3Dix3pRFvjc5juKzj9oZRGZb5stG0yC
 EEf8RuKj+AtDvbZdmuVHOU33Bf7Q2W6MeBejfobcZvhfRHdcwz2055aKD
 IROKkvN+J/p+RizmTQBygbmQhplglkD2iHMJ1Dkn0mi0knEfPtZOTxr28 g==;
X-CSE-ConnectionGUID: u58QcqSqR8e2lB06WTujUA==
X-CSE-MsgGUID: KyaxAZ8tRneI3Zy8yyO8vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97603258"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="97603258"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 22:09:47 -0700
X-CSE-ConnectionGUID: RSubTnmyTgeO0ml1trx6kQ==
X-CSE-MsgGUID: 4loScNXySAKYcNcT5LvD3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="243635127"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 22:09:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 22:09:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 22:09:46 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 22:09:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMg3cmy6PUzM4MoWwgUfJb4DqOwANIxxMCN0npavKfGe6W2C76phZnl4cHBBX835sDgVduFCTfjjELH8DMgRSJ1Qf/arKpiwT5jgX4Bwc5E6QeOnG9y4hU3k10ibo8Rr3UzKhCD9dFP1vgwMofGOtUqHarW7yMM/XfivRxIXjRQrLSHHZ3KPwcFYEkpxdi/2tYKV6+XDv1Sn2t8S7yCJVoDbToD95d+fo1h7q0VsXxUilRun2RdK+mOMTBMj7SJhasTsULSeRvFLeY0sv2U5oscF6gqmiEg4jx3t7Qym70G6XQJq3ORingltQIQX7Zjya7WoMk46S2FBgVL58jXoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRn5AI4Tylgw1meTc7tklrzJec9cB6hh1RVvOWXpIwU=;
 b=gGxgwsaff5eK4MJpgi7jEg7hkiMYOPO3q3KvP43dTyMCeJydhyq+9oZSh2jQ0/w1luJDi4nTex/fFCdSACyniZvFzHCYqmLKsdZdNvrvV4mACSgemmQDhCxcAlmHRZUqEniw1e/U1Et2VcFYtqmGJ+GyvBu1Bp1S0cmuGg6obsBgHWg9yOMbNnYoD0rc6qno15tWxDkFg2xMLvZo2IHSNep3suErX3+UVhMveXqu+KE7C1Yt4CBwwl5r+qLTZUD1j5oQv7LY++tSufioNp1ux9ixpE95qbSiwh+vs/7f8XzwHNs782CW1nuZXVMBD+wE7h9eLjAIQeAxNTxL6FL/9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CO1PR11MB4995.namprd11.prod.outlook.com (2603:10b6:303:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 05:09:41 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.21.0025.020; Tue, 19 May 2026
 05:09:41 +0000
Message-ID: <f29a093d-4ded-4310-8c13-6d59afb4da4f@intel.com>
Date: Tue, 19 May 2026 10:39:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/kms_setmode: Add HDMI 2.0 clock limit for
 mode selection
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260519041750.1199802-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260519041750.1199802-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::6) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CO1PR11MB4995:EE_
X-MS-Office365-Filtering-Correlation-Id: 5246d3dd-4a9f-42cc-acf7-08deb564d51e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: +QNwi4Be7DgBvNr02743IQ7Kfb6NqvoIllW2DIyJEY75KVKWKrEpj6S3uQ814PpOOuQErxoAmwti5r7S7m2VAQlXgd6xwP2l9v6z7lesVOduXYtNMk4W1FhWz4+dIDczRSh+oYDTOFtXKARy/jBP66nfUBPT8NyYb08oYSq3J7voML7H/x3sTRnn2Bn5BE/d/aAr/WW53mHuTakHXDwci73Bc/zJj2xHijwhK57ZouG34n9lszH+YjXtyxPMdE6kDkAxPnM+5cmJkq/mMzvYqEfzfnTv2ZMi+61mBfMHnAdqvpw8e1F1q6vn0A7tc6lyVBW1YV6+R6g5we7becLuqIGZZIaly9H7QscF3Q5rmbBR9qSy11Zz8wjpGc+wDr04JIROCW1KiF/D93yQ0QhlYAX00Vfr2kbjOV2PUbYc0cN89YDXKjfkpD82YsOJ3nA77l0UMrsORzJSU/QodT0USU782zw8vMApY9sBWmiSB6Q39KmhK5mVWlLSQ1226H6Gi6TzVJKmEggbOopvbrvqks75/TatA9vx/aoMC/1lG35yzrPxBbq5LZ9TUBnJTmmgNsUq9GazB6K29E8lmILtn7J71o/4Rh6C292lfejAxbSYB4q/0kFioc6XZKH9qoMHcLOGVi3lpSpo84Gz9cFsc2XbXChTpZRGjyYLmweh4855rDLBLjWoh3GcZltA3dW2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1p0YlNuczFNTTZDYmNjdGlDQSt5R2Q4QXQyclFETk1IYjhhYWh4cWhTR0dN?=
 =?utf-8?B?QmJ0VnVpTUNPeC9TMEhkMWpoaGxFbldSSWZzdXIvQkloNVF5Q3oxdWp5cWp5?=
 =?utf-8?B?MEdPQi9OV0twZG8rb1pEZUkxalkzRHhjZVAxRUVudFMyRzZYdm5GSU5lWDBq?=
 =?utf-8?B?b0Vhdk0xY1YyQmkxUEdDOE5VQjhkVVM0WFBlM0VpVlFkMzZTUkhoZHEvemtT?=
 =?utf-8?B?Uy9pSEg1dW9OdUFqUHFKTFpPbW9SY0FRbEs0VmhkV3N5LzF3S0tXNkV0emJ4?=
 =?utf-8?B?UFNxZWpQaHUyVnBsYUhrd2xnREZRUFdhTXgrclB4Y3BzSTY3MlYxd1lyNGhO?=
 =?utf-8?B?TFdsa3Yyc0pGNzZGVFNUOTljQ3BDdWp5dit0ODJTRzllV0J4djZyT2lmMWNK?=
 =?utf-8?B?N1BIa1Qyc3YwQkt5Rlc2Y3hXVnhaNXZCcVd1dWR1U2ljM05GL3pOa3B6UHZu?=
 =?utf-8?B?VytMbFp5TUZOdmJpeE5ZV2tYeXcxRk1BaUJDSWFuTmRyQ0JDaWNBbkQ0K3RZ?=
 =?utf-8?B?WExvYUREa2NoNlQycTkwL3hIQVNFSVFpcXJXNDQyQVpPYlkxNGlJWW9mREJh?=
 =?utf-8?B?aVhvRWtEVFVQWHJndForZ2dzUXgzMFV1aS9BZ2dJSmo2N0xYdm1ISGVmaDdl?=
 =?utf-8?B?MUhLaTVEdTlZcUxaNXlycE1NcVpZSzBuTmpqdUJZZlpGbHhHZmdLTUZjTDlm?=
 =?utf-8?B?QkJ5RE81Qm5tcEt2amFkMGxBb0pjbkhuMUJTVFpFY1h5OGRTSVgzamgyWjRh?=
 =?utf-8?B?VUhGeXNicFVwa3dmaWppMmdqQXgySk15UWhHTzh4Y2xYT1JkM2M5QnJLWU84?=
 =?utf-8?B?anhhU1cvZWNrT0R2YTRqWkhnMDRwNlpESGV0VEYreGJRWVVjdjlOU3lyWjA0?=
 =?utf-8?B?a043UWtnMTZ3bjhvMnptYWYrUUVZalhDeitXUjFqZkJpZlBvWlBsUUNCTGdn?=
 =?utf-8?B?cytuQ2orTlVybk5haWRaVnlLMVBDZUNOSG9LMHdZNzgycGtQYndTc29oSDlB?=
 =?utf-8?B?alZ3dzJteXpTVGhsT2krSFlWSjhjTk1SaDVvMlNLandvS3hmTnZQYXcxeTBl?=
 =?utf-8?B?RHgxcWxiNml1VjdlcUFoajM0WklMMEFweDE3MWlXdVVvVW05Z2hpVDhaVTRU?=
 =?utf-8?B?czdySDhmeCt4MTRwSDBiOFR0U0pwSm9YdGJCNnN2WXNYUkd5SDhrYTBDQlpV?=
 =?utf-8?B?TC9LNnJHNy9sdDlIOGpvZ0FWVThjaUd5ajhicWtpNU51YVltNVI3QkJMUmFr?=
 =?utf-8?B?b3NLRnhjWEl2SERkRlNXWkpEL0Y5UFlwTERpYjdWUUMxcnhka0djVmlLNmtS?=
 =?utf-8?B?cXJscnprTy9lZkh5S04rUTg3OVVJamh3U3VqaDYxSWdKYyttNFdQV25HNVRO?=
 =?utf-8?B?OEhYeUdPSHQ1NFlOSUFhT3FIRXpzOEhkbEdTcXBkcjRZVGh3dGVxUk15VzFB?=
 =?utf-8?B?N0tkVlBoYWRWK2cwUC93aW92TTM4OHdod2NQSjc1R1V1MklUeG9FK21uRW52?=
 =?utf-8?B?THVDbEQ3eUtYT2Zxb2VVRUNpVVVkUG9nOU8zMTBOTEJIemN6VFVvODdKWG5w?=
 =?utf-8?B?eEhsZmpiUzlWcmZSM1NCM2prV0U0cG9HSm5DWktyTlVrcCtNQW9EWmdqSEVh?=
 =?utf-8?B?bEN5ZWZXNlRrZDFBTXI3SzJtYnFOYStNTFVOWHoxMWxFNmpJRmVwbWU4NW9Z?=
 =?utf-8?B?M0d5bm1NR3J5TzNhZEQwNkM1eTNqMHNvMGFMa1BvRkg2SmxXVG5FUjg5U2to?=
 =?utf-8?B?NUczWVk5dHZZaUtBQlZvRncrcHNrdXNUR21lTTNJcGlYWjdrak5QclV2Qmxa?=
 =?utf-8?B?eVgvVm5BdmRyU2dvaGhyVzRoNzd2blcrZUdtWVVleGdSU2g4ZWM0ZHV2Rnc1?=
 =?utf-8?B?bmREWHIwVHBJRFlrWXhpNUhYSCttTk9LNTAwY21tbUl0UU9FUVh3bFFJTUF2?=
 =?utf-8?B?aW82TFRSV1lHOTBvMXBGdU9HWnk0MUhxcXRxU054Z3lrWUN0ZlJTZEwzYkRQ?=
 =?utf-8?B?ODFiNzFaTkN1SGdwbXgyVGpMcEZrRWNhanFncVNZNGg4ekV6dDdHdzY3Z2Vv?=
 =?utf-8?B?VVloeFdYZVp6U21PZUFnWEFoZFlXYVliOEtNWHhmTmFuWi8vc25ZZG9QV2xU?=
 =?utf-8?B?UTVwT2dDMU01ZCs5bWwyVW9nZjM4N0R6MUk4US9GRXgzbUtnNnlBbENndzR6?=
 =?utf-8?B?bnQxcTVXa1dSL1htT3lQc1NLbVFtZDdwcDFpbThkYXQxcmdJWjFUaENaZDBK?=
 =?utf-8?B?ODNUNFlOMWt6S3BOWHN0ajZtR2RZakhEbnNRTHBWOWRrWTVKM3dyVGRuODZT?=
 =?utf-8?B?Ui9vMWEwd0duNjc0QWt1OHdPUlpMVkRRRjlYc05UaGE3UngxY0VFZDdCcmZR?=
 =?utf-8?Q?aXX7GRqz+PIxleKM=3D?=
X-Exchange-RoutingPolicyChecked: p/XUbZXQh+2XNptuqjPf1u6NQwlk2VXDWDtHauuyrwnMbVOQSTC/Z8vv/EuRkL0745wZ68kCkStsUfK2J3l81KOo4ekjz4MzAXiaMOvWVkoPt3sDobZ+6MeI+Mz66St8qHcvgoQH5BbWvvg9Li+vaGNyfF7aFr7N/TaIx1FYItR2s2KhQNbYt4adTuvyPX4D3XbPOMgGvnU1XomR778jUemvsUiGjUuxOC+2ADa8sw0GsYEqJZqKZmsqpBaLmP2hu5HoIAQDR5PqiDWqUuxd2Qh9s0CAoxW7viAh12OqrR9mk/GU4GRVHpRwV3AvRi8WWuvPBIBWKXH0sdk+pukcwg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5246d3dd-4a9f-42cc-acf7-08deb564d51e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 05:09:41.8100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AfdkdlUx+h6eQAgTCj1c4ZaMbQUDf0i61dfivWzIcEyaetsvrXj+xp5KebmW916kI6Dq5+506zePjSJ7panXvLSBGygTNTz8Gxx0qDERlCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4995
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


On 5/19/2026 9:47 AM, Jeevan B wrote:
> eDP modes with high clock rates were being forced on HDMI 2.0 displays,
> causing kernel to reject with EINVAL. Add clock validation to skip
> incompatible eDP modes and fall back to supported modes.
>
> v2: Add HDMI 2.0 clock limit helper, drop crtc_supports_mode(),
>      and ensure per-connector compatibility to avoid invalid modes.
> v3: Refactor connector compatibility checks into helper for clarity.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_setmode.c | 39 +++++++++++++++++++++++++++++++++++++--
>   1 file changed, 37 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 1f2849bc2..4d4f980f6 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -79,6 +79,9 @@
>   /* restricted pipe count */
>   #define CRTC_RESTRICT_CNT 2
>   
> +/* Clock limit for HDMI 2.0 */
> +#define HDMI_2_0_MAX_CLOCK_KHZ 600000
> +
>   static int drm_fd;
>   static drmModeRes *drm_resources;
>   static int filter_test_id;
> @@ -165,6 +168,35 @@ static bool connector_supports_mode(drmModeConnector *connector,
>   	return false;
>   }
>   
> +static bool hdmi_connector_mode_exceeds_hdmi20_limit(drmModeConnector *connector,
> +						     drmModeModeInfo *mode)
> +{
> +	if (connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
> +	    connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
> +		return false;
> +
> +	return mode->clock > HDMI_2_0_MAX_CLOCK_KHZ;
> +}
> +
> +static bool mode_compatible_with_connectors(struct crtc_config *crtc,
> +					    drmModeModeInfo *mode)
> +{
> +	int k;

`i` can be used as iterator here.


> +
> +	for (k = 0; k < crtc->connector_count; k++) {
> +		drmModeConnector *conn = crtc->cconfs[k].connector;
> +
> +		/* Check HDMI 2.0 clock + per-connector compatibility */
> +		if (hdmi_connector_mode_exceeds_hdmi20_limit(conn, mode))
> +			return false;
> +
> +		if (!connector_supports_mode(conn, mode))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   static bool crtc_supports_mode(struct crtc_config *crtc, drmModeModeInfo *mode)
>   {
>   	int i;
> @@ -270,8 +302,11 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>   				if (conn->modes[j].clock < mode->clock)
>   					mode = &conn->modes[j];
>   			}
> -			*mode_ret = *mode;
> -			return;
> +
> +			if (mode_compatible_with_connectors(crtc, mode)) {
> +				*mode_ret = *mode;
> +				return;


As mentioned by Ville and Jani, this test need to be modified to handle 
the external vs internal mode better in long term.

However to avoid noise due to test trying higher mode on HDMI, I guess 
this should be okay for now.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> +			}
>   		}
>   	}
>   
