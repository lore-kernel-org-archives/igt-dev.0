Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018E3FD377B
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 18:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912CF10E7ED;
	Wed, 25 Feb 2026 18:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FuCjtErx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D25B10E899
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 18:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772042489; x=1803578489;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=deHsc47XrUiZwcJAR8GIV0l4Qfrf216C+owZ3fRRDZI=;
 b=FuCjtErx8z9M1DAd/fy1Yo4BkvZQR+4p/f7nj2vN3lRvcsG4LfdWDE6y
 d6R+OnO9sZEr2gy26GgKS4ZGKIV9jb4/7wRnIndax2BIwK3cUFt3TsrWY
 gdxTpNXnQtwb8m9y6MbGnCMBIpJ+DN+7N9QzG+wkQNF7sYPXfvA+4xFM+
 vOXkZ/BZpg6xwvQmpfvwdTGaEoiCWdXmeAwGXMCg9uRobLsUXXq2T4Gpa
 xI5s3I6jrUlDcQWkHWi99zFOpykXirOl30R6yp58MRcwvZOum2d6Dz+5B
 jg8ZYDMoo0B0sELti94evKa969VXzjDfrLCed3Os7YGmsbSxgGVSGJS1c A==;
X-CSE-ConnectionGUID: 7nl/sirQQ0GXLpsAP9t9rA==
X-CSE-MsgGUID: Hzj1LKWATm2gS8miOfnMcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72299829"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="72299829"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 10:01:11 -0800
X-CSE-ConnectionGUID: 3mF04eetTwajBesd8HQaTw==
X-CSE-MsgGUID: 676gt9q/Rs2Sa+Srm/Ohmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="215414978"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 10:01:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 10:01:04 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 10:01:04 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 10:01:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsf3v2E6X7gBGD38svrQzXeaE56O34DFeXo0mZZrjHpUHYPQd519NOS60rqQlBs/0EDPnFavm/cEU4W+0z0u9FFid/rWnTqmuDTMnSmhvRdI1TVFtX0wgGzuxQCada2NiKX+mJzW9PIi/d/DVZdE+C3BPKpEa59Wh9vNqlBNmTqPnIs6iXnSJKluHpWtvzc80njlplPTkbiTT+CxcPaHq/uPkPWxwBGv6TK0Z/Ttk44DwnmDyyJkgD2FMp0DUs2rO8SLBlrFBmYUBenyvfESRjgo/vzYNIkfGd6PevNXf+WSbrYOo87dx3FLSPlvpg/2cSqytK2q+08MVr2XLX9d2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiVGwfCmt2FOsCcqTW65eRV5e0WymbGav4Gn9FmmCBM=;
 b=dOH+gsmI5N0DZvaKDlLsrJ/Imj+jEa4u4vPoo4uvlV3XTBaNPnFhqYZ/Ddv2tnLPIZs9W74gUw7/LDHGfYbyJSyUV7xs99eg1bKskQqB6D8wqTULgmnB154nbwxpU4qPMXj003L69pvJhsSkiIg1MRPcGv+0V2qsSn/IJKW2cjji/Ei0wMj+pgxuoyRSqIujPuChlYVaOmtQZPcZuVEnuEVXPobmmgzGOI2C26oSuJByUGlk1dcpJ2HbK2CJMN+/HXrM01SFsi0O3wXev1B6EjkpM7c/YhPTjSQUKzube7+A4c9wd72gGJTQ2UyUVBAUqib6G/msZb+Kwjtd/ipLMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6162.namprd11.prod.outlook.com (2603:10b6:930:29::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 18:00:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 18:00:56 +0000
Date: Wed, 25 Feb 2026 10:00:54 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re?= for
 xe_exec_balancer: Report skip when test is unable to run
Message-ID: <20260225180054.GT4694@mdroper-desk1.amr.corp.intel.com>
References: <20260224211612.2944788-2-matthew.d.roper@intel.com>
 <177200960046.284987.3809795614817598530@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177200960046.284987.3809795614817598530@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3e63cc-b5fe-4d87-3d11-08de7497d31c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: ku/MKAL9dYUHCTw2+3ArLMAxqdms0FVxpaQhSgCpSszyD99BEyH3vVNRSVA8mxXWmFk/5TiNzOOlO+9st/XuXPBI1hs19f8JXmcZynzOVv68lunUDgf1bW54wbay0g/fB32jt2xKGcVEh9xYRkUTNiM9HkzD8CMkji9uQFOR7r8lWZqguyR3Mu7F/jQNIzIp+Mu14QdjKILnI3827bfVFhTFHkk9oOYne0KlKGvQKMLY5kUsmq64KlI0/TjA/mCSK8G5+e9wydEpOQag41L5AeJmUXe/XvtnCUMiAzsJh73VglezyQHTyx40PaqORlGg+6+Hb5VQ78J8zR88un8bey7hIMMME6dwSJ7tXUxdrdz8cKxMfWSX1Fu7eI1iCdTqEua/CLFYjVtDr/8r7pSpWE6KPX87jB7ZRwoTbAicAm0WijZmXTMPhbyiQyoUaMb25du3CsOTfHV+AoAYtZE4rGsL39QcjVGW94GtTXGzU0uMeF782rm/2OrIeC/eK8Mm9wcq9/yRT1LW9bNWz3b0HKVvzEl8wiRrxiQeR7hRD2KezHPCmKLUY7EGRWJHTBcsFEEcVOm0Daofnht0w8fnmblsb+w2+/677Jjm7UwmN9XXOUrbCI586Wr1B2MpXTDzxby/jT++sfnqgYKjglgk1jLJa5p81UdaFHsfxK26Sk616tEHb0hTem5vJ//gyEyG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qcTpebB2714T20PuIEqNmBOqptNZVl2A5R/3TumJ517De5Z4fxc11mgQX6EQ?=
 =?us-ascii?Q?v13Q9++c30mne1FoPYgvigFepEUiJ0SopwSSG/ZS8BWHMyCpnEynyBZNAdi5?=
 =?us-ascii?Q?BDT+5rrXaafeGSa0A5nVdFY7H1BOKJdCCjOFPfvNoWYLBpb60PcJ5L+6ojCu?=
 =?us-ascii?Q?L1MY/TnhcmdPqHUhwTPLUi2cCEMUd6DFuhuhj+6i9eS3wLhcuErcFAZb/4H9?=
 =?us-ascii?Q?oyk1I/koGbvL2zwdR2gjB0EzoYSsYxnCagAf0JH+BkrvdKjT8DoB8NW3KHtm?=
 =?us-ascii?Q?6iDD3/iIc0cSp7PPZ1vpsBU4N8djtCO1RpEBa6iLmW/WDRD4SUUlT0mUXBrm?=
 =?us-ascii?Q?p95g0PfXUyYGnNBeSUev8lju9ERkUvzUdr+hxcK0Ip1icsFkii9tH7PGtINP?=
 =?us-ascii?Q?2hqxd6GUNvZ/n8Rt9QHy1csvpdte54YNwNN23yDYyf/1oTuOXrUJ2A3M/FLT?=
 =?us-ascii?Q?dXRDKqbjcILGg/aaFwrTbiAx7ftvNxT0ljvreXUr1hkm4lDNjN1LVesVJYWG?=
 =?us-ascii?Q?ZOtLbnH+M6R9KGIjMdzewwDknPHm2QqaZ/3qxfwinqw5GzSaZ4aAQX5ku46j?=
 =?us-ascii?Q?JfE4Awrcm4dUjSJruEWDDiCqE4/nk0+8H0U+1VLte3VVc+wwe8IOHL7c0EyR?=
 =?us-ascii?Q?mnY31dEPIkN39OFK70nC3xC6g+78pAECWOwiyshMO5NnAkizm/Ti9J1pn4T5?=
 =?us-ascii?Q?j8pOLUScwynn5Ct3eqlwKu0jOEOo4l6hPag8WN+aVkKC27voLt55zjTwsNtS?=
 =?us-ascii?Q?JMUoi1Nv5QABjkAr+/e+i7PZkbbSBNYt7jHmjUk082+vJGcTrG+ApEjjBeLR?=
 =?us-ascii?Q?MRVTsEJM3JWVDF8VXT7zytkBw4nri7rqiA/Z5xmOO/0r6NDoM+/9NJeDm5DZ?=
 =?us-ascii?Q?XUF1bQc4mGg5g5xBU7+WADbapEj/lczMbK5m95moSwVcLhOGOtmmBvsiDmQn?=
 =?us-ascii?Q?uJuXE0qj13Rgcns8vDkD48Q25IWepOQQfCevaPSr9tj0Ik81uyPha2P2YQUT?=
 =?us-ascii?Q?Dl3QFFydirhG5K7v+2fKJb1did2YdueLD9Q4IyJ/J2WWeDk2Ug2WXuSIHs0d?=
 =?us-ascii?Q?aZtvv1YZP+na40RcUm6DKvH9d8DkUiX2Yz+/B78dNcJz4C4bvHZ6I6zqnxve?=
 =?us-ascii?Q?bd/HL4IXpRnRTphkx6iHsvjGFPJ/lfonx4P8Ok9731qRvV/8SyjPOyqtH9g4?=
 =?us-ascii?Q?64vJKFKVOdOXJd/eqcU/wgbPuE6DfJODhvIV0kHBRPz0p7Clci72j1kpMzf5?=
 =?us-ascii?Q?NhEyiPFH+zhP8w9drw6k84PmHqBusNKNqaRW5PwjZWZoZVqV70+r9QKrIxCz?=
 =?us-ascii?Q?zQEZsirhBfcJ0OHNt0Bjl6fFet1GQDClCqFB7HumqeD18LokUq1Qxi4HwS2H?=
 =?us-ascii?Q?JtJNUR+cNN7lBguo0pmVSn4vKh9ROwLl3PsO3i2beD4eywtwjz8TZDaZ1tyh?=
 =?us-ascii?Q?baWvJtUiCjyJm7S30md1zW4uQeoUiudTxUnSOJxxqbu0K5OIWwr6pBzW1dnZ?=
 =?us-ascii?Q?0IwJNRgOzgrlNNTUleHMfhJ0ZChLx6jAUh7W+yxKU8EubaV/SozslzjAXlRv?=
 =?us-ascii?Q?Oezx6psTRT3iSHDB3kJB4h9kV+/w+VMSdZlQiIJ+0/fG6dA6Mg6oGSVnhm1b?=
 =?us-ascii?Q?oUpkvAd6hwDybyKLBugr2GaBk+ag+FTNGVLJGuJs0viinSwOwY1CieJTRPSw?=
 =?us-ascii?Q?Grura597B6rHp9YtjPltpEyf09DKqeyNNo0lYYu9Z6FigfwzkIoyzArfJ9rA?=
 =?us-ascii?Q?rriT1mprQsReMOrtLR5UBO/yuVj+7Kg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3e63cc-b5fe-4d87-3d11-08de7497d31c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 18:00:56.5003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6knQ9S5kcxp/w4+Tgd38NMDcaOYHToT86uy+3Qcf4av/XPyD3lEXLFJgQCbYy+PlHdojd0rMo3KwdLLYjj4738M7ypY3emkJzc1eJ0klvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6162
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

On Wed, Feb 25, 2026 at 08:53:20AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: xe_exec_balancer: Report skip when test is unable to run
> URL   : https://patchwork.freedesktop.org/series/162088/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8769_FULL -> XEIGTPW_14611_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14611_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14611_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14611_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_balancer@once-parallel-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-4/igt@xe_exec_balancer@once-parallel-basic.html

Intended skip (cases like this are why the change was made).

> 
>   * igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap:
>     - shard-lnl:          NOTRUN -> [ABORT][2] +23 other tests abort
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-4/igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7414

> 
>   * igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap:
>     - shard-bmg:          NOTRUN -> [ABORT][3] +23 other tests abort
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-9/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap.html

Also https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7414


Patch title updated and pushed to master.  Thanks Kamil for the review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14611_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2887])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#2887])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#6974])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#6974])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#4141])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#656]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2313]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1469])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2352])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@xe_configfs@survivability-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#6010] / [Intel XE#7317])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-7/igt@xe_configfs@survivability-mode.html
> 
>   * igt@xe_eudebug_online@pagefault-read-stress:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#6665])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-1/igt@xe_eudebug_online@pagefault-read-stress.html
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#6665] / [Intel XE#6681])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-9/igt@xe_eudebug_online@pagefault-read-stress.html
> 
>   * igt@xe_evict@evict-beng-threads-small-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#6540] / [Intel XE#688])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-8/igt@xe_evict@evict-beng-threads-small-multi-vm.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1392]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2322]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-imm:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#7136]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-7/igt@xe_exec_fault_mode@once-multi-queue-imm.html
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7136]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-imm.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#6874]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#6874]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority.html
> 
>   
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7317
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8769 -> IGTPW_14611
>   * Linux: xe-4607-189174b3312588d97dc467dca7cfb9dce42ab81b -> xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe
> 
>   IGTPW_14611: 14611
>   IGT_8769: 8769
>   xe-4607-189174b3312588d97dc467dca7cfb9dce42ab81b: 189174b3312588d97dc467dca7cfb9dce42ab81b
>   xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe: 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
