Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780A7C47DD3
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jan 2024 20:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3B610EDAF;
	Mon, 22 Jan 2024 20:55:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163C310EDAF
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jan 2024 20:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705956904; x=1737492904;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p3nu4VIltIuUKV53tzdjSlc3cq98K2LZEJshZFN07Vc=;
 b=Rhf2GlN8q58vCjyLrDRCrdcIzr5eHqq2sfKozMkSAeODOqTqILLPDJjN
 QD20d9eT06UCG1eUcSRA8EvNH3RgTxG7J4VS4Aqb5zZ2byGECQZMjx6aW
 xGpaRq3KUE03XlQh6vpBkSOEEEqga7TdOVkRsHNIO+GA6DuLX96IVS2Jp
 Mwi/bex7ncqgREVJbcZ3bcj/24gu1rTsEdJSi1G/OYl5TW/Z6iRa48d3K
 3+yZEMQ3sSEN2yItC6HGKwr1kJkKZg7JLZim8Sm5VWB1qlbOIE0swmSIW
 Y435SjdMFgGQuSRFK9Bf5DAwfloybQKfx/GKPSPM3mJtuEghdJRH2N9ln Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1179885"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1179885"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 12:55:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="27776584"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 12:55:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:55:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 12:55:02 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 12:55:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ylxx5E7FO+eDGD8PRf2f14o9SuGTYARYMZnG6t1XhrMXVPZ1UmDIIKQRxxTG0FEUqYpoW3IkprnHsroy16kIYHo025up8Z8gjXU9ViGZTULQYPWxcFS98DqAmUB77pcUEGyMt8ZUi4BC4cqMBqyjmCB8lfRS+WfwxlqOerpF16AD201O+dNPs97jhgti7qXGw4Y9BMf3aHiwfV9r0qg7ZOMMSiV0a536PgCd2p65XIKJ2W1KdIZ0hH0LKcrZfCtzo+mK/yZCezxV/Z/biq4WmVEKljBK4rrZ5OBp7c76YJFNBdESkqhQdQXlupzwwhvrmp8Orf25UnXZLftfspZA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxxHVCviugxggqT+Ls5eojKYjk0ZdyacdHrjpzAJbbY=;
 b=NVdi+kExSkf36RXiiGVe3OAevR2bzKuA1zzUIOm+nE6Guo4XtOHYerDpqgeiCGzs3BotNZyp44UG+z1nBAwrVZxLTfJFw+W6+SUpHGNb58SjOxMiUxR66SDsELQqE4ehgZrNQh41oOJM1sH8KwFRV5lWMcPWFnJNIfVDhkUFh6f+U48NdqG+HksJIMse1iBdLkFJ1fjXeH2cCA/uJL9J2h4ENR2kyKhw8844joThH5E0CEAioeZbgJmj7VC+t4tYke7ef+lZPCxYgUwcives5Yreug9DDdpbBmR4CxliSRwjVqvPqLuhCItl/YiNvgibTAv8g0MBzVSSzKw19uRM2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8432.namprd11.prod.outlook.com (2603:10b6:930:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 20:55:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 20:54:59 +0000
Date: Mon, 22 Jan 2024 15:54:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: Re: [PATCH v4 3/3] tests/xe_waitfence: Removed duplicate code in
 waitfence
Message-ID: <Za7WIB_rK2yTBgYg@intel.com>
References: <20240122024543.456795-1-krishnaiah.bommu@intel.com>
 <20240122024543.456795-4-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240122024543.456795-4-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: BYAPR06CA0030.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: a7fb6a25-d726-4275-0c19-08dc1b8c65c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JdC8TsYFJt3SXou6QA1jVF1N7HggTWxKAJbWTNw/FhfDD7szTE5H69+LLA/HcSfdqwp6+FvxAiDBYMmWA0lxPuiCH6sSxQdwljiLFhGGReopg25+cL0cx3/Mo05uexJVmYrA9opMehPOoEsNTmTTpKH5l0l2uZTd4ESjuXShYgTp6Sj6fHMoiO3Xp9jcVJtSHpBfKyRQbRpLR6EU91L9/k1P/fcStC+g7ov5i7rM8wMuXphPtvI39wZxbvr/zQHBbNQ2SmOq59+gsxYdXF3wlr9iHocHVuCXC3u225MLe/X6q0bfPsnbLDy1TjwtEiAI5Wuq71MwMoohqDQZwyg6HGKaqXWSmb1I6ztNFIIITd3+/vPOgpOr5snKRNwZS09KqToqjH+zycBblBsBIhjcvMU+u0ncBdM6WVg3ltHLfEMmM7sE7pRPLG8gzV4R1ZmCY57IQhTzBJyss0hBhlpVrwUGhYATw5sTy+Fpt38/ubaJRZZdWN6XR9GYOyDxLT4BX8aVk7dv5k/xjKdnSdIX7qoLeB/CacUYxanOQ9e9AtN0/E+32KPw/Q+jeiHh/UK61dbf3sbC7zd63titupSSFBjVJPE8CJoDMhr4ibJTPK+xsFUfaDazMo9w3NtncwwL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6666004)(6512007)(2616005)(26005)(6506007)(86362001)(36756003)(82960400001)(44832011)(83380400001)(5660300002)(2906002)(66556008)(38100700002)(8676002)(41300700001)(8936002)(66476007)(6862004)(66946007)(6636002)(4326008)(6486002)(37006003)(316002)(478600001)(25096002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TPi89JMgGVgRpJmkmElo6VDmFmKTC1FFu7LTW0n76GZQZH2wqNTVt/Kb9g2I?=
 =?us-ascii?Q?arnqHz/V3ivTOGLEYVqZE0wkdto+w/kO4zQPynXwVmrRPgX5xG+QOx5j2fV+?=
 =?us-ascii?Q?r/Fn2U2qT5AS2yFowZq+sKvt64DlKMyapmlUVn+QctrDwQhHFYxzyC3RPw8P?=
 =?us-ascii?Q?KObKQQtLyIkPI6LNQgwtcjyWzdSCeV14KXjoFZadQK7B4LJPwUQD0Tr7eLvy?=
 =?us-ascii?Q?UiK+gMGkbROi8WDPl3v7wGyANfnAmMJjLc0cB0n5o+lV0RBg635aqDxEE5Vz?=
 =?us-ascii?Q?8Mz/WhoZNsvThNjPjvosRjhLgdcZMpFTdGodr8Ba5uxXI+Im4Kc9fHRFMoFZ?=
 =?us-ascii?Q?9YVT8Zz13oFo5lqnrk3dTIMiFBO4k/i9sFBxFDyXgr+QMHy5RmvY71y+ESev?=
 =?us-ascii?Q?9JXbZNHIearkg0mupfBq830hdWXCkMgLW1/x2jymVXr9477dvIkupB+P83mq?=
 =?us-ascii?Q?WWFyFRzNtIZFAFDrVoO2vgsTnL62s47yyAyiXdryPEpI4cLFu9Ex6VLtetOE?=
 =?us-ascii?Q?Ohs0qhHH6NGfkYmVVbbnYRL3hfF24RsOgU6GePQmyJZ7CQdXYiZptoRWUIy4?=
 =?us-ascii?Q?F/8vThHMgwlA+soos4Uik9E2nDweFgUdHs2DjjCpouE3dSSTrw+UYuFjfQ8K?=
 =?us-ascii?Q?ta9PFP7d0oBqLAcgLnOxLrqRkdXJpkhPvRKGXBIkse+fUf57rg5rqMnevXcE?=
 =?us-ascii?Q?ok6Hm5IzN1zmeiU/MnCOU5QRsCoC3167PfD+oM/+8zB/iAN+R363bkFQN2nq?=
 =?us-ascii?Q?s8NqeYT5Wo9JNVuGODOoxxNBD3ymgt3XwAh6UOXv/yhTKQe/QtXyneT7lWO4?=
 =?us-ascii?Q?8usVSElnJf9zVxNxzaQZmqtxx9CBfD0lZS2kK+cE4dthFIKNkV6BTbl4EhTc?=
 =?us-ascii?Q?/zHPSXJ6lQBOK0Sq6t0cQ0xRJdhql0cmKeFWcTX6BkIAEr5QLH3vaawExd2z?=
 =?us-ascii?Q?KTutLQ4qsfXFwJuIfj5OmQyPko9b8S+0Zrm3UIMcfzMshPA0PyL4sSLMPLB7?=
 =?us-ascii?Q?hgh2r1F78i3/l+muNlOh4Auqs8tPwSaq8D4rFtxgbJbEsdJi6H5SiecSZxZI?=
 =?us-ascii?Q?4UjJM9a9VGY8bysNxCKeea/HbxjNObQGjhJYWATiRNZ0iaqQa31OJuYU3xXk?=
 =?us-ascii?Q?1LEZYhxQIVQCsjGSrdddVDuI+0OoWa6T+PDTnP9me7GVFg4mnRTl1ZzfUBA6?=
 =?us-ascii?Q?BPOBA74Wu19k1wOXiYKSEZyGwo5sg0RdNgG9SNjEGCAXBOvd9AYpWE0h9i+d?=
 =?us-ascii?Q?lertILchITRxuMqFG5pTGdevLOQIWqdnRv/rTMej6+KK9kC1K8/cmo84RXvs?=
 =?us-ascii?Q?tyE8tKKjmuWgqObWpivjXUmRriGTn0AwAQY1hnZGlTPVRnF3jVrm7zlApbJb?=
 =?us-ascii?Q?T+vuG+CbS5zLi6juD9HKeiDaTApH9ajbQWsSSSrPgOeqAt9tTAVxfjD3O4cK?=
 =?us-ascii?Q?5WlhaDlpKpqNU0T5RVGlj2J8/41FzYzw4JLWr9fpxbHhYEap9v7zsIJeve+D?=
 =?us-ascii?Q?ZSBIfHVD2QKAt+jd//FEuitj0N5rbYX+74dwfPe5hjoc/eg9LunEjidLaGaC?=
 =?us-ascii?Q?iV+MsDEeO/ySEqpe4eSetPTD6YDAmFrpv23RJqZOhbpj0niIIxjQx0sBPcL3?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7fb6a25-d726-4275-0c19-08dc1b8c65c4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 20:54:59.9156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9nvNs3R5JWi05dAKFGyA5dA8+vlZyVBymoMH15TTpqzNr58GsxQG45JMe8SAT8nnI+cQNwer5Wj2qPbA4dYsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8432
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 08:15:43AM +0530, Bommu Krishnaiah wrote:
> Removed duplicate code in xe_waitfence@waitfence
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/xe/xe_ioctl.c          | 35 -----------------------------------
>  lib/xe/xe_ioctl.h          |  2 --
>  tests/intel/xe_waitfence.c |  4 ++--
>  3 files changed, 2 insertions(+), 39 deletions(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 39605a019..49c5d359e 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -523,41 +523,6 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  	return timeout;
>  }
>  
> -/**
> - * xe_wait_ufence_abstime:
> - * @fd: xe device fd
> - * @addr: address of value to compare
> - * @value: expected value (equal) in @address
> - * @exec_queue: exec_queue id
> - * @timeout: absolute time when wait expire
> - * @flag: wait flag
> - *
> - * Function compares @value with memory pointed by @addr until they are equal.
> - * Asserts that ioctl returned without error.
> - *
> - * Returns elapsed time in nanoseconds if user fence was signalled.
> - */
> -int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
> -			       uint32_t exec_queue, int64_t timeout,
> -			       uint16_t flag)
> -{
> -	struct drm_xe_wait_user_fence wait = {
> -		.addr = to_user_pointer(addr),
> -		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
> -		.flags = flag,
> -		.value = value,
> -		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> -		.timeout = timeout,
> -		.exec_queue_id = exec_queue,
> -	};
> -	struct timespec ts;
> -
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
> -	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &ts), 0);
> -
> -	return ts.tv_sec * 1e9 + ts.tv_nsec;
> -}
> -
>  void xe_force_gt_reset(int fd, int gt)
>  {
>  	char reset_string[128];
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 8a92073b0..03932561d 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -90,8 +90,6 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		     uint32_t exec_queue, int64_t *timeout);
>  int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		       uint32_t exec_queue, int64_t timeout);
> -int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value, uint32_t
> -			       exec_queue, int64_t timeout, uint16_t flag);
>  void xe_force_gt_reset(int fd, int gt);
>  
>  #endif /* XE_IOCTL_H */
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index e6354b3ff..6ed9d56f8 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -36,7 +36,7 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>  	xe_vm_bind_async(fd, vm, 0, bo, offset, addr, size, sync, 1);
>  }
>  
> -static int64_t wait_with_eci_abstime(int fd, uint64_t *addr, uint64_t value,
> +static int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
>  				     uint32_t exec_queue, int64_t timeout,
>  				     uint16_t flag)

No need for the 'xe_' prefix addition in a local static function.

with that changed,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  {
> @@ -117,7 +117,7 @@ waitfence(int fd, enum waittype wt)
>  		clock_gettime(CLOCK_MONOTONIC, &ts);
>  		current = ts.tv_sec * 1e9 + ts.tv_nsec;
>  		timeout = current + MS_TO_NS(10);
> -		signalled = wait_with_eci_abstime(fd, &wait_fence, 7,
> +		signalled = xe_wait_ufence_abstime(fd, &wait_fence, 7,
>  						  exec_queue, timeout,
>  						  DRM_XE_UFENCE_WAIT_FLAG_ABSTIME);
>  		igt_debug("wait type: ENGINE ABSTIME - timeout: %" PRId64
> -- 
> 2.25.1
> 
