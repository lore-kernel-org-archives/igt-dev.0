Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A821C27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 14:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A059D10F1B3;
	Fri, 21 Jun 2024 14:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kbO+NM+Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67E510F1B3
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 14:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718980119; x=1750516119;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e81qeLTgb+tggtjFe+oPtIqAXfVOeATgGrrkQMziZvs=;
 b=kbO+NM+YCrYB6eC8gZ+haWXnt1D/lzBiMRKM4fvJL4JL5n2xdkub4Wqh
 NtFhmteV2luI/sQM+iupvACgHCJ0SkeH7yzivxfiaO7rsddhT9wYgqhgc
 S5sSOng5avXRdO49LmYVXTW79Y35Qf2rUz3fq7nHEcw+gL0WI/yvRIBC9
 whcBt9B6SFb7/RvYiaHuzoM19BxMDT1mrEY0HZrK3GuJoje4fuqFe2P4Y
 i2lvKLOfGvA4XwcUZmxk8JZ8cL/mKBbqhC+ByO0daQ4y74H10xf/GGalx
 NF4IQ1Mr+RtcZA3rc+/05/zmj8psq64OKMAstuYbxPb+06ETQp7QMI3WF Q==;
X-CSE-ConnectionGUID: L8wMLGmlQXyMHyGVD676JA==
X-CSE-MsgGUID: CNgrBaTJTFusutN4q/aZ/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16131655"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="16131655"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 07:28:39 -0700
X-CSE-ConnectionGUID: imoh8G5ARuersXxP+DsdEg==
X-CSE-MsgGUID: yyChgCjxS3KUsixTmqoDnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="47792980"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 07:28:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 07:28:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 07:28:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 07:28:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1YQG/2DeWxbK5uptrhIU+5JI6bCFCH24Pb+gg/PvKrt6qqCCXyqzNu8rU0XMzHlPFijmZpkPR7Rj8SP7v9cU+ufGDBMOIXerakfn1esNGWYtvqdofwesfbHXRPSdGsL76oc9/PmlJH7UPWEXzs4eA3HiunMuMSfkctx+jwtEXewm7TC/1sUgYT81qO28E3oV5QmpJoMf6IY8duttbyceqI0EUt44yLyRoh1eFzSgOQ/RM3rRZkVMp1fk+4CHEP2xCEkA3yXOY/VLeOVZ7N5rbFzp3ZyWUlptVT/kRREtvbRrFkPMTDWzy9d8PWUv8y4tH77yh97KzvagxcSh1lzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjkXWIwXlWN7VJpQTLLWQDluN4z7qOIEA2HY8+qFQXo=;
 b=DzVVDQSHvVWDyX6Zf4+2/VwMoH8myyERMfK5BohZ7dO3q6p2ytOvtKXYGSf4OkvPOFvwzpOSsf47pr6oZLaJ/ZqjNQvDh3T/U4XgIZ36CNRIstJ2Q13k8FGIKm+LNX+X8RCXu6WPQg6pBNgdhOesz5eQKyIp472iCR7ydMi8A8EXil/ogtxV2QmScSxcLvmiPoYdsk5hY/TfshO83z7+xXhXb/6nO8+W1PvgjyH0N8wySBButeS1tS4wnn97+g905CjUqO1Xg0JtLlkgZ3T6C60soobuau9rSK5qf9H1vet3WW8d576sL/2q4tGVmjKW4ukdiP4RhjC+OPgopanuaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 14:28:34 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.030; Fri, 21 Jun 2024
 14:28:34 +0000
Date: Fri, 21 Jun 2024 10:28:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_spin_batch: Check duration of
 preempter execution
Message-ID: <ZnWODQqe4o8vhXaJ@intel.com>
References: <20240621115303.1772645-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240621115303.1772645-1-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR08CA0014.namprd08.prod.outlook.com
 (2603:10b6:a03:100::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7de1bd-6379-419b-c397-08dc91fe6e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YfY9ufm8+lfhldQOsQNourZcsk4hKs6xXMg5RyJLpmzCxtAVGzua0cvfgRAO?=
 =?us-ascii?Q?p8nYfyowD6KFkKjdlvkLZNkKY0zjCOJglUwppVgMldiQACyhC9fzLibo06gh?=
 =?us-ascii?Q?d0Aabevv8Ejwaw4kMqCczt4o0LM1ssbe0YhktxffV31vlSfkna2wLLqzZSS0?=
 =?us-ascii?Q?RxAvuLA2eJdAaOdgHOpHBYGs9DX+KaIxPY4O7LmABcGhry8aDLQdXFwqEnjA?=
 =?us-ascii?Q?9gwefGNmuiKdsZ+HV1R/ZkiyUx/y0tIPUM8gdHRQv90cFeNTlgmjv5VswVh/?=
 =?us-ascii?Q?IvKJ2Db87MR3sC6lkksEmKzU+ZlQnQzTLjYgrYdALa92Nhpe8HhXjAOvux2R?=
 =?us-ascii?Q?BF+XV+4If0PHl5fcHTN+Oz17D0ZfeDRxvBhAS5Ws3OuoafbXiAaFSA883I3V?=
 =?us-ascii?Q?rhl8mkOClzJgHbiqqUbeCPbByPf4V0p5F+3AjUN2++xWC3xNJQq1E/FCsUuM?=
 =?us-ascii?Q?ONUFZJRaS5/yEqAXLIpGcLd8wMapE2awtpTJNztZ/KcdbJzGqCkeewlwwztT?=
 =?us-ascii?Q?lEoTRFfKWVfPhYztkR5TFap7MZlD/HIiyMz/8gMZvoEB+Rbyk5ToTbl//JXe?=
 =?us-ascii?Q?fd+QJtzoHkU4eVP9ekjzESchhahuj44ITgIUZllSnj8RqH8HpKhoLfluktG6?=
 =?us-ascii?Q?g5oFg8JE5Dj3iMIO3Uu/5FyJwWzgcsZC6ifDIfiOV7QyBDix70FitequbZLg?=
 =?us-ascii?Q?UxTnRdEP+OH+hFCxYunXtBTOimVZnBbxGlsj5EQRR9swG5mfeQJDYnbkzLVC?=
 =?us-ascii?Q?yT8LAEXxYOPfYQgwfzxH+dGlpnIoKczbaUWRIJEXk8YGj1cEhV3RSVUI5ANE?=
 =?us-ascii?Q?Y9Y+T5UhvNHShKrj86E3x4OBxlWfowAGm51l4jsGE5DdXM3lUYsXY015iZf1?=
 =?us-ascii?Q?oLno8NF1wdaVElFr8sjB66YXJhKeaxbpF16ECy1JnYbzZSEup3GpNnyPsY/r?=
 =?us-ascii?Q?y0yQhuPnHG4yNA45aQCN7aVjevd3ep4gcVCgsQhjIZ9WPGnbF5QExdrDUfEY?=
 =?us-ascii?Q?4uzKT8xXwNSftFhR+pOmjdYZK3Q7SZXGoLnAJN+lp2DqZEfGdV6G6LgUU5n4?=
 =?us-ascii?Q?fZvyONG7VDTNQTNXsURFIl2AWMU/6xiYoAM0GpJV1DaE4ZJSawJM0sQU/Xxo?=
 =?us-ascii?Q?v2I1+0z99jSLr3sK7uba/kQep1ykLlGaApEA7EbpLXhlS0y1ceeehkAJKbcZ?=
 =?us-ascii?Q?kI12ZyWe2WAgC5DfZNb2Amo/bEbASSrHzH0oBKAUp4FUhDccKCIb58Pft6B0?=
 =?us-ascii?Q?e1sotMigYNKHOf5QhCGgqSl8qUboR7nEHg2SEh92x28BJpO1HbaROLsPdzL3?=
 =?us-ascii?Q?J5XR88+UnH+EC2MyWbcsbRfE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LbiJPqTgXdqhxHeoKWoQKFy16QuvJWVfXu2EFvtG2hYloxjS0254oUzUjCU1?=
 =?us-ascii?Q?7rA27XtSC9zpWHYiyba74UMslGs7pr9ho8/CWBKlxcWl0IEwW1feUDAo06cP?=
 =?us-ascii?Q?bQM1XRPPbRcNGsUl4w2BhOf4NGTlhWKU+Dihw2gCgRti2yD35hvpg5hyRJxT?=
 =?us-ascii?Q?xtQQQUSYWbBrp4R5NWCaEO15X9u5KLPXeR199E6vU5Luj5/5pgIqfvI6CiAC?=
 =?us-ascii?Q?lHo3mKCan1QXuOIG9X+o7VVVcw7D5OFJL+2d5fKN9eQTZNBfbIFlouX/lpBR?=
 =?us-ascii?Q?ukizES2ntndbMig05/Vxk5rmKxE0gSlZIaphGB73b/pTvjRoO9YQEXkkCJQ6?=
 =?us-ascii?Q?Syv8U+yxKMV/sXiFxgBsaA5uIbsIZSENTQRqvEMMvaodvj7bDhpQuyPlBtKA?=
 =?us-ascii?Q?CsQBnMufcFoeH91Qn6U5UsChr7Sc7uS03fWUiXRMbDRgbhRk1kbiqfAjroBC?=
 =?us-ascii?Q?1KqrkKp3tFNyjMgtDG7a4hvIhNVebhFXd/MPZGTwe9TGb8o/kd/xj2y2lbco?=
 =?us-ascii?Q?z033iVuEBBZwOqJQbYTlht0swh1olaBtiXCd5LavdwerMzwyhUdwTOxuRt/e?=
 =?us-ascii?Q?aRLndKD5huMFYTFzxXfese1MnqPnzlZntgbMtn4Vyx7De/Ypeoh1dKGe7amY?=
 =?us-ascii?Q?HfWFa8NxYjgHZIxw6pbzK3IbhyM4Rxx1mrZFKuXe0OjLi0eDxCADGCY7vnfQ?=
 =?us-ascii?Q?4uk3p3g9RamM3N5xsxduNFjwqK3prFE9+WSs+lHVghMLgjewqjLJkKj/nZ1L?=
 =?us-ascii?Q?XGE3/O+h0Pea+znLeQ6BUOwyhyyDE3Iam4KcXLQScuTnk+kzH+KpJ9Qch3NR?=
 =?us-ascii?Q?ZCwC45SuVGvu1U8vGIDWN+S0IN9Muev+NTpF+jJWZk3EddTazlpHk9U6GtsW?=
 =?us-ascii?Q?0oMn12Lsuvm6LRPj0KR4PzUMuARoac+xNXtj7S1do8ktc6B/ihBWPGq2bewO?=
 =?us-ascii?Q?I7pr8YiTkQLXYt+aMYBGcfozhv8KiE7LelmzML4DXHJY3hR1aOwgybvoDwxB?=
 =?us-ascii?Q?1Ihi4mdGEpraAiQBLcvexHLvNKtILS7K8NhIAy4z3JjESZGZJNT7loElqIEm?=
 =?us-ascii?Q?C7uzHrwCeLCqfBAS9M+h/qbseENE9S+hBCiSQ6rGp4ZafcPCWMyRXt+4ShMd?=
 =?us-ascii?Q?RJ3HmdXjLJHAx7kVdxMutQcOxTKosy6o8Sv6hFwKE0B3hGYN4HA6MLiPH8VU?=
 =?us-ascii?Q?BhErjEQrDbS2dqXHhAEbn9p5M8n9C+odJ+R5et1VzXQjWNg7pABgU0lshA9q?=
 =?us-ascii?Q?MsTQKCL+1OSPqrgw1qkdfahmREoFgRU/SUjEX/diMKR5OsrAbyQVP4+uuXi3?=
 =?us-ascii?Q?31uhFcoeBtEZjMB/gTlyuf3W484Wye6NQcrKW3XbxSQrReEX/j7VW4mzECSx?=
 =?us-ascii?Q?CP5LguzY0obB4CCVkwkVKWJgyxs36aW92VNawVE2/LWikJNGqlVt7AvKWQZY?=
 =?us-ascii?Q?0NWz4b62J5iiH1g+meVwZYCgkTC5nDZpcz9Oz5iBK5aB231T8tE2FzX4dxzS?=
 =?us-ascii?Q?tLTSRTnNNPxG9im3HpuhY/mGIigf9LYcBuLRl5YXO45XSojjguxDIZ0CcGxA?=
 =?us-ascii?Q?El3PR59Mb2Kk4tdZwC75kJTiUw7BzXnwZxmSJ2Ce?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7de1bd-6379-419b-c397-08dc91fe6e39
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 14:28:33.9894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKdESeu9OFUkhEQIAD3MJF5Z8/+2w7oqibQljc5qebzdp4daskDPae00DNTQhnlJor2gHJiSt/YxQVsO9urumA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7539
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

On Fri, Jun 21, 2024 at 01:53:03PM +0200, Francois Dugast wrote:
> The preempter is expected to execute without waiting, in a short
> time. The synchronous call takes roughly 1 ms under normal
> conditions.

is this true for any platform?

I'm asking this because sometimes we add things like this and this
becomes a 'committed KPI' and later when things start failing on
a platform we have regressions and escalations on a thing that
may be normal on that platform.

 This duration will be higher if the preempter is
> waiting. For example if the priorities are reversed in this test
> then this duration will be close to duration_ns (currently set
> to 100 ms) which was undetected by the test without this change.

Okay, so the goal of this change is to actually ensure that we
do not mess up with the test order itself? Any link reference
to this undetected case mentioned?

> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_spin_batch.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 4e95060d3..e57318801 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -253,7 +253,7 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
>  	uint64_t ext = 0;
>  	size_t bo_size;
>  	struct xe_spin *spin;
> -	struct timespec tv;
> +	struct timespec tv, tv_preempter;
>  	double elapsed_ms;
>  	igt_stats_t stats;
>  	int i;
> @@ -289,9 +289,11 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
>  		igt_gettime(&tv);
>  		xe_exec(fd, &exec);
>  		xe_spin_wait_started(spin);
> -		if (flags & SPIN_FIX_DURATION_PREEMPT)
> +		if (flags & SPIN_FIX_DURATION_PREEMPT) {
> +			igt_gettime(&tv_preempter);
>  			preempter(fd, hwe);
> -
> +			igt_assert(igt_nsec_elapsed(&tv_preempter) * 1e-6 < 10);
> +		}
>  		igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
>  		igt_stats_push_float(&stats, igt_nsec_elapsed(&tv) * 1e-6);
>  		syncobj_reset(fd, &sync.handle, 1);
> -- 
> 2.43.0
> 
