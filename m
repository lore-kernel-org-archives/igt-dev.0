Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E603EC10F1A
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 13:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564D51121B0;
	Wed,  1 May 2024 13:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUSRUTTQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8A810FD76
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 13:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714571975; x=1746107975;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5a3p/Jw90gCbCzSyIf9wWhoUJbeydqUVRKQt7lMVRJw=;
 b=iUSRUTTQlUas8nGLoHXaXWpoNalruX54xTmizyU/bB/HcTQ9fKzOsA9f
 XMxTe5ZzcK75wI/tJI//hZAJBHBxPn/k3TnjgV5G5h+qLx5+YqFW2fHH2
 o4uswp+vsB39RkC5TdxYnXFqMwNN8zccdx401Zxr3gMChWoVu4XA0bLKr
 PG/uq9TMJpOAbwbZTVT0RLyPEnvdRCi/b9qvRTpmP28ws0IC+2mTvQODZ
 NKocYsSmBG1JEz7NobkQ7SjfJQr8fNQsfD2ry29MBT2MSpUmWNwYlvCib
 +PHZh0divXrPZ3QZvJHp7T9cuAfGWVEUjwaUaOudvIDIB5hzzB2BRB4GG w==;
X-CSE-ConnectionGUID: xoc2Nrf6SBy6qrdZNw6iCQ==
X-CSE-MsgGUID: Tk8v+cQJQvOlnwwVr9ZGzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10149937"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="10149937"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 06:59:34 -0700
X-CSE-ConnectionGUID: OgksvcORTDKBnrtHRbkljg==
X-CSE-MsgGUID: L/rXDmk7QWy+yiQt9EVAcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="57681751"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 May 2024 06:59:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 06:59:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 06:59:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 1 May 2024 06:59:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 1 May 2024 06:59:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5Qq9daJLzt3jmxcFLeXflqh5irUzAfFKPm+NG0PMhew+lpY7YkC2giODzvVQ3uVffmj/eGNUUpnts3dYwI7Eup37C/USxuTqNQlddjRIVGcTkUdZHT/I1n5P5dDgcVTxHNL2m6LSMU0LXdZ1F9VvzYdiON91ip0gvNrZJjAp3ALqLtdyvsmhqEd6lOhO0kGIREKqQzBRDgFLhxWPyVyGiHVg/YlK83VHFQLWRrIsKWRISd+AjSGBK18uKBSXolKq9vt4a+W9M95RL4/m51avYoZEUzjztq3aUDtD3kpdBpxY5d6Hiahmo4M9MsirNepCxHgcPwqSITNW9cdeAOP4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bwj2QNTi5XY4tTMCTqpxDxL1IwAJE3TDvGddJYjXbFg=;
 b=JfUgAG7pfxAy6fi1+SvUI3K3yojwgMVdVQsNca+OpFX2tbyOqpTLn96NdT97DfG9YX4JBgt4ONaJ1a0TfmvjBGgmiBittFeSSFJblcD0OlnBUWVNAu2PNgRbyxLg29owDlzQFl0Iv53A/oJ9jwSgO9UnlpnQJgkk2BfK/tneFTsxUatcEdYVqaWAFLr8mw7meFbNN0yNRDl+9wlXfVBO/8IhHEvbETjMEBoYyw71RnZx7LVPA/JH3bZLv5UUsZFBEktA1A3yokqE6Ay/79T/q3vCE7WLaPRvR73RxachtCYpztBMk6OT72wnLX5yvNXOPEZd/fRWp8e547gtAr8ZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7037.namprd11.prod.outlook.com (2603:10b6:806:2ba::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 13:59:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 13:59:25 +0000
Date: Wed, 1 May 2024 08:59:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Subject: Re: [CI 1/6] lib/igt_drm_fdinfo: Fix wrong name len assert
Message-ID: <iyxvnv7a6x557opx4f3432l7nkkotyodw6r4wjiaa4ieqg63yj@snmmugsqmmyp>
References: <20240430190150.3654507-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240430190150.3654507-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:303:8d::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 835e3723-1549-4be9-ef60-08dc69e6e935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007|27256008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/r7Dt2+pobI6lPniwqdr5urrPnW2P0nuzCyowofqhIiqBnWkJZKZjHF6llvd?=
 =?us-ascii?Q?LHzWT7ht986EWcR5B1EkBi9oamAhOgLOouk7j3uD/Z6IDqswnyS9ueJtbT8S?=
 =?us-ascii?Q?6x3tHpglvzESW8Q8TuP46CNgYgJANEEcLrex3EX3BmilUzYHmPJ5LTVeVrc+?=
 =?us-ascii?Q?UUM3iKqEDZRWg1dbVLNcgQZIOLQIj1l4GAcJu5/xifzDNcyZa0fswp2gfbWu?=
 =?us-ascii?Q?pNny8gACLBSzXQhajNTJBaB3Jyz9j9VJ/X7uvzc5OnocJWPxEygLVAL1v4/A?=
 =?us-ascii?Q?7PUYyzfOKgdLqy6KI5ZEYdI0utEdGILGJsFefEESD/naWxVPO6pmKY6E1p1M?=
 =?us-ascii?Q?uExsM/8cq1jovj3qr9Rl4KVgs2wS0V3ccjYrrCQovCTyIk1XEg3JufB4QnSJ?=
 =?us-ascii?Q?7c0zz9yvfVdiRmDBcRDL4ye9aDipHBnLlkk0OajFMNokoMDeDPPLaJJxp1pk?=
 =?us-ascii?Q?H7UjEeQCyg9Lwn7LP2OB6dfdfLoAMj2/75pEHsOOqnUemaToGFx2nueiseJa?=
 =?us-ascii?Q?yrGT0uDxbXqhja75ctHWGiA/pW4b4BoGIX0MjnMdEiARB/3NS2mXbeWmzEJi?=
 =?us-ascii?Q?rbVVy5IajCWP8E3HwXX+VUk5czW8wYu3M5mS1iiZ/1UPearBnV0mWIGeIEuZ?=
 =?us-ascii?Q?6f4rjGflPQnu0bbAINx8WLJKNvHeKCOdCOarjBNnEYMw+LbplaJxNKL1q+zX?=
 =?us-ascii?Q?VGoteDNscQgQmsu38iU6ta93YFu0mLrhXbPt7Q0qdupIFtxYbhehpAhfHHHF?=
 =?us-ascii?Q?w24+Le/i/9FY5+BrM/vy45STt2URLQhoCPFtQI8Qyzb4vAo3ojqi12B+ZtoK?=
 =?us-ascii?Q?WdWqTIb8QuIPNtqtrcd41hWJpA9jc6gTgNGxQEgyerRB/bhvxgcgtOHA/taU?=
 =?us-ascii?Q?a8cpCU4Q4DGqEQuqDQuPc9MDuVURSkyFUj15aQnBbIW4Ks4kWJXxx6qxQAHh?=
 =?us-ascii?Q?UTdmAd/nHigUNT7gbf6lnsEJ8XiKxny8d3V/GktvBkW60CWFoUoT63v1Thn4?=
 =?us-ascii?Q?SE7biTll3hhX7uQW62RUpwaTnmtJv+EPoamgeZcWsg9SBdWat8EE8nvJdlvE?=
 =?us-ascii?Q?67X7GmOMa/fjGJAU63kdOjNnxcsW3kMQIGMcq+Chtl1SrIKXbGYQg80mWGSm?=
 =?us-ascii?Q?Ms2rVD+mr7Ydpll5GKd0+BfgyMxFHrdlbFMr1l0UEs/WFGrQ9A5AY7rRZHrI?=
 =?us-ascii?Q?0IYb+2nJGBAKF1/jdtCIVrGiW5Z6WSK8if5HH4bka1Dcm2L04j/2qUBdLVad?=
 =?us-ascii?Q?xO+GTof0Gi+LkbV2kpSij/4E6wXWNkpQZfrbiXxHzKWTooa4svI1H4KoCLg7?=
 =?us-ascii?Q?g/9rRTAXPf52pzmNzPjig8LGPUyqzfljuUgfVVYzI0+TJQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k5sAPdi2bdiMZr0NlYyfVjoYTURZObx9DcxWQ8mqdp23RN8FmepjNPR5veyD?=
 =?us-ascii?Q?6vKuYNtI/dvduh8QR2fEgmwspHhDr1zVlp9hIAt04oKGmFWQlVgFHvjzgHaT?=
 =?us-ascii?Q?fAJFzoQrpuuxiz7RhhqbeE7jNKKzPUculiBd4Nz2w0j1ON8O2z7ybwzJ3izs?=
 =?us-ascii?Q?pE+XBJe8mawwkBMyg2URcaAEkZ4EGfKeaHrafUiiV31+M6wYmn2YUHT213mP?=
 =?us-ascii?Q?yApVl6HoHZKrfvjC6VZH2CVaAWjWpkVya8dJ+9C5jWXwT6k2oS//ZrSyNbqd?=
 =?us-ascii?Q?63nr+M7685d6Nl4ugUdnZga/ayyUqYdvjNa2WW0w9YzYhIzUYfQwWOuLiH8v?=
 =?us-ascii?Q?dKt7rpj7hr/CQztQjfz0GggDJ5nlcWdQOg779SDv5Aw1+U36m6htNWLx/u6P?=
 =?us-ascii?Q?kDGl8vtsBSegekuIu0syTlsEw/xmCeG5IpCTmIBo2tMNw3olpQdwt6M2tc7q?=
 =?us-ascii?Q?J7xYzodvcVnuozz7Zd10hTsMLs2UzSMZDTcQm6ho9qUpAOt449Q0uiZyvMFr?=
 =?us-ascii?Q?gb4mc6RS/evur6zPuG+k0uGnZb92DdRGSvOPSCLxB3A5AEcrIc4a3r0DafTP?=
 =?us-ascii?Q?3nDgUZen4XsfhyaXBdb5g+7YnPGo59q7/Pmef1V3ikSQJcR8F2pYBW4XWaBa?=
 =?us-ascii?Q?CFMYFLp0FQLCoMuaw7eETYmVgA2WrSv1bL5KvPiUl/eVzG8nJLZZDaVOQeAw?=
 =?us-ascii?Q?x22/QI2EYOiqEP9ARgQk0CjWFMGnhGSQyQHC20RSjDXptSu91VbyiU+Fnz+j?=
 =?us-ascii?Q?bUYw5SVdewJQtgEcOXZu8X4dqXnYc2u2RULieqSWFT4X7BLjcLxi8ImBtsXY?=
 =?us-ascii?Q?17BmhBSMjFdWFOvOjU41rBpAY0AHrRONn4AgjWQMHZ84yz6goIhh/nxOjHiX?=
 =?us-ascii?Q?hdgPR7yMAFha5Ef46pgh/bsKVGtRkmp6C0DfJrdm9DFNi/O8Rz1BP6h3n7AM?=
 =?us-ascii?Q?aDMYZda5KUuuT56YVuRP0up3aRtDCwitqbWSu84IwwnJtQXETrtOQey9w/Fz?=
 =?us-ascii?Q?M4W9qjUoetbXvC8n9RW9jN+hGMvs5ZT2IbVYW8oAzWdUBRdqhjT5sb4SzHeH?=
 =?us-ascii?Q?F9ExzaAynpedWsZUkAKDQmQUijCCvi/xw4S+8kk1C5Nqh//LUdCOYsavaRTB?=
 =?us-ascii?Q?/tDqmNnBSLNnv4EKWSezl1R4otDsaaBj7q6KT84SBfwJzY1GrYp+5YrXGQpD?=
 =?us-ascii?Q?JlRoEH853dQEuYO6TVuIFo9NnZfk1UZWQlj4IESHEyFO3omb48oZwowjFmxN?=
 =?us-ascii?Q?tzZuXnf5LVEq5yTC3tDyYq/FPQ3r1zNiq2MCDPQNNzmhQLE182aISHXjIQ1+?=
 =?us-ascii?Q?18wRjG02QQPeqjqdJdTj9JT/V2gKgr1gnXYLxGYTXI9optZoURQxKgNuWt/Y?=
 =?us-ascii?Q?AdcIqh78ruhmqkvdUhTO92hbfgfkJbTUFYDT2R/AiXMdRcjaqn4iMAcRNXqK?=
 =?us-ascii?Q?8hEToH7XD21gRRd2DqDuomDee+QyyvF/P3tJOtANFjVw2qVSr3GCEgmvBDo6?=
 =?us-ascii?Q?vs2CcISiyn5TqjDO0tU2B6SR9yb67+AfbTWHVntiQKFgns0WdSTW3QGeAe8e?=
 =?us-ascii?Q?nwYaFeozZqznM9R5jDhpc4Md1vi5Dy1/EifZt4aGUoR6P4PDODjbBlh+plrm?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 835e3723-1549-4be9-ef60-08dc69e6e935
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 13:59:25.7953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQ8i5Puds8EL6t+WfXX+qAkl4YdXcWYULPi2CkrV6f6RV7FdfiZP3bKMZz1Ci1bt7YCcmSdAqujI467xg+i8AqbW2aow2HvWu80GB0/RGCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7037
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

None of the issues reported by CI are caused by this series. Pushed.

Lucas De Marchi

On Tue, Apr 30, 2024 at 12:01:45PM GMT, Lucas De Marchi wrote:
>When parsing engine name, at this point we have something like:
>
>	"drm-engine-render:	232409619162 ns"
>	            ^      ^
>	            |      |
>	          name     p
>
>We are copying the engine name to the final destination, but
>strlen(name) will actually contain the entire string. Since we already
>know the name length, calculated previously, just use it for copying the
>string.
>
>Since each name is 256-bytes long, the assert doesn't trigger easily,
>but it's better to be correct. And more efficient.
>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> lib/igt_drm_fdinfo.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index 18dbb5d0b..a1f4ad10d 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -90,8 +90,9 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
>
> 		if (found < 0) {
> 			assert((info->num_engines + 1) < ARRAY_SIZE(info->names));
>-			assert((strlen(name) + 1) < sizeof(info->names[0]));
>-			strncpy(info->names[info->num_engines], name, name_len);
>+			assert(name_len  < sizeof(info->names[0]));
>+			memcpy(info->names[info->num_engines], name, name_len);
>+			info->names[info->num_engines][name_len] = '\0';
> 			found = info->num_engines;
> 		}
> 	}
>-- 
>2.43.0
>
