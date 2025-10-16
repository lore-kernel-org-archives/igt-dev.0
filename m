Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB30CCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 18:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658B510E332;
	Thu, 16 Oct 2025 18:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLnZvtJp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBA410E332
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 18:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760638552; x=1792174552;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UON34ZNgPRxoLb0HszuwvTTVQ6oBn1nSLmdLNxsTELo=;
 b=TLnZvtJp1Ae1iLoY/6TJJKo3yZ7jEDAr7m4k4yTxuWgoP3AjuA8JQ9sD
 j4c2TMZiGJ/OiuOWYdrSz9+bCN5kD0GxG161bGo8Ez8XH3FOUbIt+PAd+
 VEEvlU6OsmH0/Eid/gPaZnb1o1qIilApHMrsiOi7P2zTMwMZ5uKB8wBk4
 kOjZzCCzFLJC0S9IMn4ptHuvVrmcTGLQC52zm6JJRSd5VkDiU4q8WrzqS
 RjdTeeOnbQzkTnUSpgpxQIFxm0OZCjAw19HzmVhhyaqfuVe/mUsIae0tb
 osEYKpotLuFd5xj+WUTqy1mF1i5mF8htkeyvTbDXRw+ZadNf/B8yDxMfR Q==;
X-CSE-ConnectionGUID: M8vncQ9QRYKruN1CpUHqBg==
X-CSE-MsgGUID: naaTrXaZS8aVat7pB3xiwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66492005"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66492005"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 11:15:51 -0700
X-CSE-ConnectionGUID: P/y/rhvAQoCVcIhpMantHQ==
X-CSE-MsgGUID: DAObm/A4Tbe2Vl1KPxp/OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186542192"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 11:15:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:15:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 11:15:51 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:15:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9DZ2vOHM120vu6xllmzVLnEvAFXPWKUafhQc3kXZULq+2npQBZR+PgVYQLinhQcgbe+Rc/O0azsAYy8cQoNrdW0oDelPfEvL08DKU2wb9tAnXeT2qHb6h+4UTlTN4VTBHReemgU24OVX7CboWs/eg6rO4uwlBhoyad3IsH9lVrRj+WWuKcoqkNZnL4CUForsQxtZ2vHNXqUFNUvmUgr5R0bZAP/vWxHyVyi8obNLUK8wECFyGlmTFfj9ruG99wtdKuz534PFi37uGtGiK4myNvoPt/TTpJKo18pEb1Cb4Mm9oOC9iwVRD9UWTjzwz2EG4wQrsVScdugXnK+0TmOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GbI2fCeZRi0qrczu60eC2bQUHSgUVyOZn7OsmrgXnA=;
 b=eZL+HYx4nGNjFlRK4UjBB8qcYRUAhgiytz4bJIkXGFoonV6J3VXmLIdgiQss9HNllf/zqdiHxhNpW5S4dgCmHFYy2/EL4CLm+TWrT0qkEQYi4ljQLwks50sDuUFJjgLNLkjIU3lc5V+SvVKgaEts/MkrjMfj4gRuw9BkCAx7554Obx9NDqQlLBS31Fa3iTbFCZ7yO1ANMbF1ZNKtmZuyTSNScdET4AF9CU/N/wiiRUdz1zJiABa1zOrTPUAOSoKTpuRiaqQxuSW76LUqYsa6SrEa1LpT3yYk9n5sNF9EZV9+KD6n57NRCx++lmodZPC+YhZkmjqiOU8XKT8+IEWZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 18:15:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 18:15:43 +0000
Date: Thu, 16 Oct 2025 11:15:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_reset: Fix LR queue not running in
 cm-gt-reset test
Message-ID: <aPE2TYKysB9Pao+d@lstrano-desk.jf.intel.com>
References: <20251016160619.96782-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251016160619.96782-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:303:6a::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV1PR11MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 863ceb4b-a422-480f-06eb-08de0ce00549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9nTlkafIZWHNFxDqf3Mo+1aJbo7Pnf7zpLHjvjBPDXcCl+wtn7II6ElgjKr3?=
 =?us-ascii?Q?8CvKbrFqIoYl64S5orEXTLD5qB4LyMcE1lm0G2yCqC6L6dL8cv1RsfmRIKer?=
 =?us-ascii?Q?+4HpY6P8og5LOYNf5sgaEWptBXCgEXqDqMqWdr4pMiTtOdruhxnMFGFHQO4i?=
 =?us-ascii?Q?5QBTi1DxpXfrabkL+f/hTzMYJdVaYpKJ76cmP2n3stz8XQ3CxRaGh63t6H9V?=
 =?us-ascii?Q?2TNCT0kjl9MJgMy8+LrDKDYNGswwof8ux39UnVoZY5G/VZLe/M4iieSxWSF/?=
 =?us-ascii?Q?7DOafzXx5PSC8ZPa6gLqCLkw4X6C7yM/ctKGdtJhKSGz6bh6GjaGfkW9Tdf9?=
 =?us-ascii?Q?MJtx6X7rlur6psXzDgUIKcOzfxKbeBJoWcZhjasSRf8vS3yjJliIRL3Yluyk?=
 =?us-ascii?Q?5VISu9FqrNWBRFYHSM7kdyvgnmjClA7DSZ68ahO2xG4rAUGVzThMeAVYaahN?=
 =?us-ascii?Q?U0adBkI3y7+cTfImO8zqElu0ZZyYH3vOa9Q4FCbnuRa/683rY24BHybKWoi5?=
 =?us-ascii?Q?5Zvw9GAA1rsjb4EOyFZMqppAj7Co+GtWv8rxkmYeiqIQ887wtQUt5v4UAH7K?=
 =?us-ascii?Q?pATkawHjzQQvXL31mycmYC+cPu9tj3ZI3YjWRtzTn3+a9MsSYxdhobG3q4Ab?=
 =?us-ascii?Q?0DR8Dsy4Sh5jq2YR/zeMkew/8HQPY5yrfEDoOL3R7Y4DBEnGYILhXw//bHFv?=
 =?us-ascii?Q?NYDUHgBpAQW7ADA9oMaohxcpb47cMUrqJusENq/2hz6Tat5sdxYdrSJylxsw?=
 =?us-ascii?Q?MVQwbNF0NkPfJ7q6cMgkP6UThw4qh+eY8cNBe3ONI2dY7dnObCOqDNG5q9Bs?=
 =?us-ascii?Q?9902fauFrU4zcgs0VHnAJfs0eRZ3kZdjgMIqSH6q+NJDkd/s6BG10ppIviNx?=
 =?us-ascii?Q?JKyIo1G0KMd+btYexAqV9qZ8gdSWaPZ7by7PCyCLVTQYje7QD8LabJsFjqwZ?=
 =?us-ascii?Q?9Wj2UgE3rqngSbK5WSSZXnVTzGzk5muRrtEEg08DH7Eem5NulyX/M0O0vukR?=
 =?us-ascii?Q?ZYqC2k5PEliK4LZbKo50qMtQSSg9UHZkz0gDBxgXSER8h1JUjsoYAaGLqpGA?=
 =?us-ascii?Q?7U4gfu2VNNtK7u6sMQFt+7oPaPsF9pWjkouVYT28eIyIFXfIY1QjfI3TZ5+u?=
 =?us-ascii?Q?LWRAYxMUS6oAKMW3b62zih84TNeaDMhTy4U/cvhM9V73dF4lTPDwtk/aH1Ed?=
 =?us-ascii?Q?9RfjJcN7/ApAj0Fns57ylcDiyj6irWnJJjjNmVcKKlph3h/CD8UdMLJT8wOL?=
 =?us-ascii?Q?b9sc93RajMtfhQNrr3kXQCa9atf3/C7zMIBMWfa4UQ3PXKfQfYTdq3MNe8cp?=
 =?us-ascii?Q?dgKCpDnS+glcos/xwaFBCXc4quKrzcQo3GLydUUGI+XOIvxLgUAB6mrzYXYt?=
 =?us-ascii?Q?OMzqmg39CxO/G4ueziLbNsmWCYQWir5Eju102fI9DKVXT6z9Xw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OAj5GufiZ9hsgWRWPZIEDhQ0wV3ekPt5+/4KFidPQuyhDIK0Dh7yEI5/Ua90?=
 =?us-ascii?Q?WaMQTSX3WS7VElKapEvTXie1/OOtmXGa9ckAxzRVBXlpzBAmrCsYutMtw4QV?=
 =?us-ascii?Q?NJoiSwblqujQMhMdlF5sd9CHySVV9tRvwnLF3HoMDTY144CdyD3i8/qjmGEC?=
 =?us-ascii?Q?nELQB0whOiwC0UXnaVqYxImWmApLGUlTKdnnG3obk49ROYU6ZLG2xEhhJnPW?=
 =?us-ascii?Q?WFZWa0V8b9qHNv9wZ9Esl+z7gMnDw96GJnfwXQZdSg2ftQKpTRWBL2o0gcle?=
 =?us-ascii?Q?2tryvwFncSt8MzZOEstoRtog4qk2LspLBO5IAvUk8ZlIXoMdWCcZfDjZQh+1?=
 =?us-ascii?Q?YopPw6BKBjg21rRH0Hw+1ZfcwQpad7r27NpuG2jElPNyUqD5NFmgF6mHNVYL?=
 =?us-ascii?Q?wouTG836iV92JCR9A1cYCXCPMGcNFSJK8tlFxHEYVn/DZjqbR+LBbZvQdRPh?=
 =?us-ascii?Q?8uITrVfLAJvwrS166YWWB/PV5d47jggy9BOB8Oxx+ymHwjoZRuImSVAx7QL6?=
 =?us-ascii?Q?s2tXVuXGOEMlSCvHdliXHB4A2uuxkhjLcgYyifxE60MCwqcTYwdAutWOYpU1?=
 =?us-ascii?Q?sLc53yB9Zqc9vn9nagUg2vzNdDlfEjoYngzz9uzfYS2CiKx299B/hUSRChP2?=
 =?us-ascii?Q?sJ9SA1dZgCEUjJmaI7rpvYYJOnAN0t4bt0WoLfRG1o1rSicgn7czzVQjR4C0?=
 =?us-ascii?Q?FsUzr27I7tiscm6G2sXqhgxOTBXOwggZbN23XUOi5u3yBdM+ytAmf7RVT2gU?=
 =?us-ascii?Q?ullyGaLKg4lPvNYkHT6xSTk4sQ+G5gqCJlXvccSdPFb1FC+r3EDzlY2dgBXf?=
 =?us-ascii?Q?7C2gxi8RNZFolbty5fdwoyLhT3ZmPWqsw8bHxNYAnirLNj3NQVgj96KjsaBL?=
 =?us-ascii?Q?yj1h38Q2THwanzKk/k/jV0FHu5ojIKIVGsWqcLUm2lDJwt8AFit5TC2dyuDI?=
 =?us-ascii?Q?Td3uML9EkJpS7zzgJJXvoWW3U4e9UlFSlk4wg+4PHUKVPn1y3AIOsAlNyVGf?=
 =?us-ascii?Q?eYUqS7s+i1LzhptQcaoVDBD/sqhWZqZknSe4RuUvCYNCDe/1c8dykvxHbkTB?=
 =?us-ascii?Q?2y5pZPE+JALidDlw8PLyAz6gfj+oA03jkbSxKy93t9PIO/RpxVZ4GJF7St6J?=
 =?us-ascii?Q?dqhMEfb/oL5yzU/8tpQCwUZ8yNkUNT0VeVSyFL2Wc2pHvWfFZPfgcLpSsLc/?=
 =?us-ascii?Q?tvX3+O4WVyi5OtWeh8yVpRd70YSfMefiY263FUM9inOQtGtqKFQLOWMxM2l7?=
 =?us-ascii?Q?dv6QTp8zP2+4EA0UUZKum+wgiDq3P5vS1DeaeqggTf3uE+5PenCOONKfveNX?=
 =?us-ascii?Q?vp+MfBeDYP207AHcDnRb5iKkEh0uczoyP0MZIUc7Rv/1q7mghwXaO4q+ReQ+?=
 =?us-ascii?Q?7AyOKyB/SqyKd27XH+lM2pOHb1yRI6f8+L9RGh1dkUjNftxbz21Z7lD3tHGR?=
 =?us-ascii?Q?pe1VVJI5fxmbdh1y2KdY1AsYq9H2mFFpaUIBd9j5M4KI0WM1hOuBSpoeKGU9?=
 =?us-ascii?Q?Apm9sa3UgTTQZbS1jBCgL59Alyarjgff3GgcoI71wMGwX40cSEGiwTEnlXpw?=
 =?us-ascii?Q?lPY31S3JBri0XLEP1Ysnsqp36S7DDSYU+WXFaelzxPHbymYcZTmbCOrgmx3y?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 863ceb4b-a422-480f-06eb-08de0ce00549
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 18:15:43.6422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCNc9GBiD6G0Rb9lXM/eYfe2nVXO//B2sGa/HVOaHjK2xJFFA6gBT5zJrMcfD4AfD14YIqrEZsbjxyvoZsnoJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849
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

On Thu, Oct 16, 2025 at 04:06:20PM +0000, Jonathan Cavitt wrote:
> Long-running exec queues don't get properly reset during a GT reset if
> they haven't started yet, so wait for it to start before performing the
> GT reset in the cm-gt-reset test.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6325
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_exec_reset.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 9bed79af57..8f5c32389d 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -445,8 +445,10 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  		xe_exec(fd, &exec);
>  	}
>  
> -	if (flags & GT_RESET)
> +	if (flags & GT_RESET) {
> +		xe_spin_wait_started(&data[0].spin);
>  		xe_force_gt_reset_sync(fd, eci->gt_id);
> +	}
>  
>  	if (flags & CLOSE_FD) {
>  		if (flags & CLOSE_EXEC_QUEUES) {
> -- 
> 2.43.0
> 
