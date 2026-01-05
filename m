Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782FBC79FAF
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 18:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2548E10E402;
	Mon,  5 Jan 2026 18:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecEtDnEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0560288EBA
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 18:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767637319; x=1799173319;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V89OJlkmDwODUDBcW1ZQeg5US+tUBwotGqt0Gyo7+/0=;
 b=ecEtDnEFNUPXcb1YvlxFtGYiROZCNLs0MbF12tNfbQcRLx3vZpLFT11N
 0DZfvxCZtkQMIE5wQdpRGaeAW9ypt6alQL2IwcSti534mK9fIOZopSD9E
 fQFgQYv8/FVZkYbv8/V9cjgIx/1Uw2NZpDCJ/E7Cq1B0u/hUWB4CE0Dkw
 bHyrJr+6+XUnSqr45kVi4pvnP28A9+hwGWXoPEAuSwCzAByXtZT1FLPLu
 p3z5xFQ3rQC8bKRhLczClJOc3ESHyjdnErt2kNzsh94wBfNqckAFnn1RP
 tJdfxzgRUXpklDLKX54qrlKaEPQA5/xLHJNBMnCH5VpmfyZGYmD54Ck5H g==;
X-CSE-ConnectionGUID: oQtrLakBQEGW5stvkOmgfQ==
X-CSE-MsgGUID: 8tJmGhRoTASj0HIKJlg87g==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68985821"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="68985821"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 10:21:58 -0800
X-CSE-ConnectionGUID: RdLFPPcBTNeEkQz43kbECw==
X-CSE-MsgGUID: 7QgsFPCNRYeLAhvtx2ic7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202071661"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 10:21:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 10:21:57 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 10:21:57 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 10:21:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/AjB6TuO+n42JTRMyN2a5Dc4kuuwZRBeYmuo6KWkvp1Yg5JiLIoeW+YIxMy0zj61FJjixmueQSX63fsfk0X2eqxWE6FbPXCr0zG3S68OVGG34K9FtkgwSk8tr0HwxX/XJsIsl6bTU8iJwiWDrUSDpNuXJF67yvgwHR++RM+q+bKGUtPBQMjM8gN0oqX4x+yVcjrKbZvWvYBNHdmlDtwO1xWjrMApKyMLY9Yk1ljgHJpJPbJ34lkWbsAcXyJrhkNu96nKP5JdYmcvntuLt29Pm4uuaem6mru+wrEeiWq5NfxChr7BqU7Xz2X02Vq5477TXpm8KTaLBdfIQPRIuEbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GL0WRx2mVETDes1epKJd80vzrvPeJN1M84c8Qm+epyw=;
 b=eHTthtOAvd7UlYXyy9tH9/74FvHz+g2EubQCIU4P3CDpVsy57iqtWtrYb4P8g29sGMlrNakI91jaa/1zk+Q8xyzbz5ydBK7qntci3rDwTC5oK/D8DyiPMWfIsYDZktP66k5ILFx9nZxDSvMU+d1s2hYvFAtDwgnviZ/7BIWBsCUbUJJive267FYB6bcZ/bpLIFTpkwrh6IPkjIRZNK+kps6LbtMbhiz9rycA//RRzrUSE8sy7MPtWOhzVBQmupnYV9I0R9dcqybEjuTFExA3OiwD4cJc7nMEAHb9SF+yS9mWWXEXKQNhoRPMoUwWeBaY/vPdC/lQOQpgtkrvpwgb7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB8864.namprd11.prod.outlook.com (2603:10b6:208:597::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 18:21:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 18:21:55 +0000
Date: Mon, 5 Jan 2026 10:21:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] lib/intel_pat: include fcntl.h for O_RDONLY
Message-ID: <20260105182152.GC4164497@mdroper-desk1.amr.corp.intel.com>
References: <20260105181936.231376-1-x.wang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105181936.231376-1-x.wang@intel.com>
X-ClientProxiedBy: BYAPR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:40::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 4691ed29-9021-43df-e2c4-08de4c874e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FKj/NEBAcHkNhLtbhoxYdcUn0STZnoFUCh/8Z3eLuv5dOdtimnkP0iZYux?=
 =?iso-8859-1?Q?/IdrbEd6HqS7+UkCbS+Kmbo66xfQEAydwR6hB/Fzr6hmMNIGt9M+IOcTWY?=
 =?iso-8859-1?Q?jjUSMF2ibCQesx1w+AINd1AOaSVcCV94JqTCLvfi/ko0khEKHzCnDh7ymG?=
 =?iso-8859-1?Q?ZbTPEDjbhplvIEiJVcENINow3jOsvXMnLAoCptWNxZUVJB3mZiYU5kEPgh?=
 =?iso-8859-1?Q?BbzRg7mvl6T4HtQcxMmgtfNwHvFMvTxbDlCySn6YgWxeChItCyv4xFdKLh?=
 =?iso-8859-1?Q?KW5709cdxA4PT4gcQHV3zkaUlZq9lu89Q3Dh5shXEzPzTFqXWgv5QVGExF?=
 =?iso-8859-1?Q?QmAYaIJLfORkY8YO0C/eT/H0KKVOOVNqYSkWH9ngkcDkqmwQrNZw42iu5J?=
 =?iso-8859-1?Q?70H5cVs0wN/6EGw8tgHBfhh399OZ8NG9urJ9Dy/GI9+7hU9N7uC44CO6uq?=
 =?iso-8859-1?Q?S3GoqqmyPB9Q6DytBFsJaHP6YrRqSuBM2TYYmkgfVreUxYzCdAFIzNUmeG?=
 =?iso-8859-1?Q?mJjiI0kpimrTU0Wpqxf13LpeY/FdKnR24Pjn/48GRDEOhCZNakHdkTFfAs?=
 =?iso-8859-1?Q?w5MLnfZW3CcA8f0Y+UY7lbHOR08SstgOXn0/i/0bciSNJpskG1golC2Pe5?=
 =?iso-8859-1?Q?PKPBe4+br43uDvxgCxfI9jHbdegKxl/g0VAtsW4Wpiy3rV29KAQVs/xLOE?=
 =?iso-8859-1?Q?yd2FllEhi7OKeiukWp4KFI/nN0iyPe5pHImgRehAVecoZTDK1Tr5rqkY7P?=
 =?iso-8859-1?Q?W5gYgqE8hVjb4ncH6mZpixfsmYFSYg0B/bEJjlK85P2baHTKh3+1njZL61?=
 =?iso-8859-1?Q?5LtvPMS9HUqd2jR9urnu2E/4u1grGeJKk6IghOOsKeE+XDB3WpDR5ZXteG?=
 =?iso-8859-1?Q?wdSrMMgmroXolWEnMqi6gum4nZCYfG3I801PLl4QF9UxYjKftYWGjIsDYF?=
 =?iso-8859-1?Q?K7leczkncYsSSbd0ct5Mq3yD2NTrM/IHKto0FeAbjS4OjzAxt7dYzvBale?=
 =?iso-8859-1?Q?WG1ywT6Cfhp8PsHLwCWmlgICuzZvIdqyq/XcWh+V5NZWgLRDDXEks73doo?=
 =?iso-8859-1?Q?9gXkpLYwm8zoGvXeiNezXdTzpsqoaMxPQPNolq8P06vby8d84ZnLa8dPaU?=
 =?iso-8859-1?Q?8tkzlYpMTEagdq6geLFLbYtITbAVT58NFJYkT3JTnlDfL95GvdJv3okIE2?=
 =?iso-8859-1?Q?I7hDZykABqnBlnD1RoNoxE2AlStZYGYd8IyGvYjon98ueuKZ40dU+sUohY?=
 =?iso-8859-1?Q?4yznpZQgGkpxnay5YJGcijCmuDvYC1ZFm3lAOCQPs4g7l9lkXikv/KPhM+?=
 =?iso-8859-1?Q?KbiyouD7NXlItLliaQTCtLBTLOG3Ykhls40FDnhjciQAlrnDDQ95y034dS?=
 =?iso-8859-1?Q?z2QJyE0iiiiaWnVyPilE5Kk2WL6DD7vxrFs3lHiWnHhTZVd2q5Tyk8NxFC?=
 =?iso-8859-1?Q?q4A8OtxK/PZ2awzfKWy+GYoHvhFWcLhgB+eZpgYl5EeKmwNdj9y2SvuhmS?=
 =?iso-8859-1?Q?mX6PDfMWHkYOcrGiaguhkjQQLL5K2j5xvr6ghljq9p/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?A1wnmLa61OZN0ZP4yyKSEtJy7vRTngB3If2OAbPRaDPjOwJxVhPINDczsO?=
 =?iso-8859-1?Q?RluiDtK+7YJt6fPiQV6DLQO1wvGdfBGVxDxqQfhkSSM0nYjj0dYJFAehCY?=
 =?iso-8859-1?Q?UTLFmjzfExZZyDh4kLy+8KXcp56ZWIyRAaLd+wHccL2zYqksma9homZjKt?=
 =?iso-8859-1?Q?GmytQeUbwXnuKqS3/f6mq8nNoFjrSrZ2XaPTAdePLMOsHwDnXRIi1Jd6Ol?=
 =?iso-8859-1?Q?gm6MMwJwsDN9Haa6kMTw0b0c1O0uPbr/ZmLt2gDu23fIdA9E9SYsSIPSZ0?=
 =?iso-8859-1?Q?wum9kGYmfU3DT3l/gmw+AfLwNgKpxcQ6DLwrf/TX3BNStbQpBOEgphyvza?=
 =?iso-8859-1?Q?kCRt4iBTo3x7I2BIv/NO7edfoZguNTuEsldNMv3BBY/6fZcbVZmtsuUdSA?=
 =?iso-8859-1?Q?hSe61jRxLdWuy5bgBXkchu/2j8QXguD9nVD30N1RKjNtjeulESQPtdd3G7?=
 =?iso-8859-1?Q?BEBS+ZvFwmTbOIj7RBxnhh7OC3Caj0A3vIY2A0jOyZH4iXuqL1bx4613VV?=
 =?iso-8859-1?Q?NWcg+ZPIXhjBkihSAZRYoQc3fg5j91xdMGuQB32h/Nr6ksSN3ioijmlGJS?=
 =?iso-8859-1?Q?BfhwvEJXTjdU7YOhJMJAZ4INBGOr9mFsRfQw/kN4p7S9bjRmc/vvKShwlg?=
 =?iso-8859-1?Q?4Ow/nF5aJ8cyBSfcwsm5qMcDbjs7BC3v+qcSgpYVfHf8VHadlMBC3MpqUp?=
 =?iso-8859-1?Q?oX1B+FZlsFf+hdag9ZLVuOvrru6V0wHoNPwCJTbHmhac5At+MYKH6Sl0U+?=
 =?iso-8859-1?Q?j1PpJQm6w44rMh4YO8PlCkqiqykk31WMVYcp4Xcg6w0HTzKGYQypL3to87?=
 =?iso-8859-1?Q?EN8SM4WzNrAQ4uHp98vDjedcG23gUKtKaanDCMwmSS0YVolG1bhBJyEGO3?=
 =?iso-8859-1?Q?DlENjxKwGCxqJ3tfWxWYi3IWGGkQT9u7ln1jaTOzgF7peOu2NixXZ7/d9a?=
 =?iso-8859-1?Q?nu0q0Zrrv0k6RKATSriTuK1ZX6f+JB/ZRzivEc1hTytxtUaFJco8Fzr/US?=
 =?iso-8859-1?Q?2uLnSuRFldykJx71Bjbeg/F3qFcvMJTKtEb6RkRNNM/4BVZPxANyyg4m/G?=
 =?iso-8859-1?Q?6WY/yO5mb6ei/XUljQdEmJb92B0T+FObEtxUDHhWlauWhRLNVKNcsUzpsk?=
 =?iso-8859-1?Q?kDngHMyr84Umlq5WEqUUuqKJYdKZYH7TWdgqscQ/AZ7tmhPSq+B6UzRIQE?=
 =?iso-8859-1?Q?v6pDR/4pb1xvuKXi8Ek8M+BmKfdFN9lk+TXZR0orIYHdNEky2UxSu9DJ5j?=
 =?iso-8859-1?Q?ZZOVvmzGCGBO9ki0H8fM5xBac4EAaHRCyPIgKY7Zyy+WDiSnwsiIUlunCG?=
 =?iso-8859-1?Q?uM1l9jUPNpz8hNWKjH1b8HXcxwdfT/Z2hPQF49yC/26ZwLSiuWJZbNW/68?=
 =?iso-8859-1?Q?DJF6MuSPWqgbXswakvT2W6Vpy5q4C9MxZmUHf3VtwP3naxQ0qZPLn4UNE1?=
 =?iso-8859-1?Q?nB8MUIrSFL0NreKQCsEWJlnbJ1IlpEZyn/75flPNX5u/0tAnW4Hp8pdQyU?=
 =?iso-8859-1?Q?a83/RP0B5GGL/CzdjAKZ+G1YVvWpeMKutTtEzUaSiYh+dDI/pL40oIBfog?=
 =?iso-8859-1?Q?FQ7KnSgo7Os9oRyHbFvDLWCbRNNuuW9R1jqwnly67nK1ww11WWuLXNJz3l?=
 =?iso-8859-1?Q?3px8Qw0mdvo/i+1rvrdq5xiBXUNIRlUPI1lr/u1T4PSL03q5vzc/Ey+UuO?=
 =?iso-8859-1?Q?BMAcTmmfQUSj9RMUC56oc9PuEaZT2ZJTLf4WUr5iMf7Iso0T06cp20mDDg?=
 =?iso-8859-1?Q?Q7BDHtRP3Eb/0RAPl5laWywZzyAWHfXTCYFtrx6+B0Nzeq3MpZ79UlqnqS?=
 =?iso-8859-1?Q?gnfob9NW9g02Lb2Mx3WS8yEjzBx6bgQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4691ed29-9021-43df-e2c4-08de4c874e57
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 18:21:55.3107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kv5bgYW8YiKeD4uBpBqvRG2aOuL27o7Wphykx83/X9uZWGISEAmfgX33yFrGG5/CNIZ3DIHEFA6mpnoNL9vlsFhsAveyMoZfJL0YjNKQqpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8864
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

On Mon, Jan 05, 2026 at 06:19:32PM +0000, Xin Wang wrote:
> Add the missing include to make builds reliable across
> environments (e.g. container/CI builds).
> 
> Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines/1577836
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/intel_pat.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 127f2160a..9815efc18 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include <fcntl.h>
>  #include "igt.h"
>  #include "intel_pat.h"
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
