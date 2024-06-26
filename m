Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6ECC27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 17:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E2B10E968;
	Wed, 26 Jun 2024 17:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MveKbOvI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB51810E964
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 17:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719421248; x=1750957248;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9SzGUdhlPVd/nY0qbtEarGgaYpEldXODv8vnQzi2Mak=;
 b=MveKbOvIUNIHXAYkvuqjKJ+oGXtTUQvpc+obvJUvjHclVYKKkheubZML
 RoErOPFnBZPgcwesGmxCaFeKpJdJk68KezQ0w3dI+kyFO1/pOJQnUa69g
 HVpOEEBsHXTEHyeAspYP9c2mLPapC7tp9grPlirbyiBtWRAlG+CD+CxIC
 Q2f/1IPS8w3EVr+56TVtLKErVN5/iRfvOE+ZG3K2Dy16eo3uM6qwMs6xY
 aIXVjJxiFHyyi69FNIsns6OlBem0M9VEjdlSBdozMlFn4CcSvNWQXZB2V
 R3QPhBGEtH1qmPMPn+6QOv/Pd9kqK1PhIUOhQGYZg5b6uZ/gJoJrrrzJQ A==;
X-CSE-ConnectionGUID: tdlhGUYMQo+x/m8DBb3tsA==
X-CSE-MsgGUID: QKkatVhfR668t6Xd22o9mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="41922078"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="41922078"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 10:00:47 -0700
X-CSE-ConnectionGUID: ru2mdJ+FQJuV207cBnKxZQ==
X-CSE-MsgGUID: MLFhDumvTsatIv/ZbitW5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="43941542"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 10:00:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 10:00:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 10:00:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 10:00:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 10:00:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sbe9ndamyu8gs/lbrk322pr4xLlE95StALt5jnTaMv61qSOsIP8aO5UkTSZ4gle4fwe9cj0u5rUYuk8JZrD/5GVETidBpCkTYOkeeyxAJRhq25CJ6hSTEWacEuFNHr5ShQAE6tE4OFvk/VE5mEJDu8MD/tFcBKFD9/Kp5Tbf1ludXt5iPBIlfO6CXEJthFzzd2lpGtPh62IIxla4nh6azPFJ3w0iwKEuj1HHSHrl7VS/yZC2l0TJrtssG+xyk1y1VbmJwkONuMMlQnFDe+dT/OvjrP3pPZxrD6y4ZoV304lxlKqBjsPHGHL4wDs7aOhf1Huni2FsAPwaiDJHRfPUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXaZSNzE5tT2wXKv5NmJxG7W/56eWaC4lXXmStZP1Xk=;
 b=SniVDFG7p+KQf74Faj3iufVUhAhy8AW8SyNbLW68pRQlmYOD8aL5+MWwQxaINZeiC+bs+Rwz4jgVeW3XyRah0rFhGxKr+/vXfWtahc5kDOWlXzS8TjGscv5qJ31GEHC7C0xyJYyxQkDtsXUomFMowRtUAH6g+Y0NzIJA5bwoo3yxV3F48Kvjn1mIk+XxQm0LuwHeecarnfFgCinW5odM6CsAXospXMCLjb3E0hJXiuKVOqDa3sdmeF8tEvHy6Mi/v1RnwaV9A+DUdr/uGDq8EuCpIWCbWTC0kMJlQAteeoQbgaGn1bjGWark7BROIhBYmw+OS9MzNYsEc4WS2YFyWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB5827.namprd11.prod.outlook.com (2603:10b6:806:236::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Wed, 26 Jun
 2024 17:00:39 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 17:00:39 +0000
Date: Wed, 26 Jun 2024 17:00:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH i-g-t 0/2] tests/intel/xe_evict: Adapt the working set to
 memory size
Message-ID: <ZnxJEc0LC6i7NIhc@DUT025-TGLU.fm.intel.com>
References: <20240626123833.3164-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626123833.3164-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::17) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: f6503617-0a20-4970-2beb-08dc960181da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|376012|366014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?y3W4t/Lb5MjcbwY53Rh2mcYosdo8FhlE1CF1MQXZhfYY/PeG5sJNxDB23K?=
 =?iso-8859-1?Q?p2bWGhQdH6+dFHrDFg9B8XO77V3ceuZMoGwgptLAF+Ox9ciAcBv7+CBcM4?=
 =?iso-8859-1?Q?lUZFPYNzUHRT33h2IT5Ofckx3+9ktu73OPF+EVv+7ecl2qYV2ZWYxAmTRa?=
 =?iso-8859-1?Q?wciWRPBqC6HhF7OySq+ecGC2/zWCdsh4cQoKWtS0LioFe2YlDz/n9DcyHs?=
 =?iso-8859-1?Q?aXaC8TdRrhQqN1oNvcMPsEAobikjX51mDLQZzy/vQwIzR94FG+4Km0B7QQ?=
 =?iso-8859-1?Q?2o4AAgNrszY9rYo5YWYDfMXltP1JBblOK/2KVyqr0Jprj1CjJee/aNFsXU?=
 =?iso-8859-1?Q?iUq0afHYUkXjU+FhuJ43Nqf6Do1F0ypRJgTzDYxrfGuNh1aJznYu6iYdoG?=
 =?iso-8859-1?Q?NoqaCmteeWk/N/mlIyfptnHh6HkQripzUiIMPzqx/QURRhuFpbYlplViLy?=
 =?iso-8859-1?Q?XBYmp6e+1V49P5kxF0qN6/kp4GQctY4nxOarXRDnndsFmF9rZDa6bVMUKn?=
 =?iso-8859-1?Q?ZO0/lqRvEpCzDPMqmE/cxYERAPuSuLMoSTo7w+dxoabDlbV58PSXlui9IG?=
 =?iso-8859-1?Q?+ssZAbMi0C3SbtTJD1L5TjQTaf7ftOuYMqnyfIyqaN+wpuGPRmCoJ6lfq5?=
 =?iso-8859-1?Q?iqFRct7emJgjWyMGvbGuxzIPDVZjV2Mggw+cpS1a4nJUjibrecCgT2mnO8?=
 =?iso-8859-1?Q?SiK9nqVu6LTmTlZr641YhVFKWMZnS3qas/2WzUMlkcGpis0WhYGNz2YzMr?=
 =?iso-8859-1?Q?n0l+Xou8lkBs8Fm7dL5SRAK/89swmoo8UPCmLt0iDn7BAs+lsw+XZLEgRr?=
 =?iso-8859-1?Q?I72YSYMpWlIzovsgT2zEosr4k51NuzOvP4WUsAIxUS+6MVuRagsgYKN0Jl?=
 =?iso-8859-1?Q?33im5IIMq/xwTzoTI+KGaq+BooZjOKGcqTRdEHrScjtfRUJEaCah82TNhk?=
 =?iso-8859-1?Q?hNAvPm+jcK0JQPAqeMYpjUXktFCP7PViRIG9kcaN+JwnoT5rPhcUgkVNbT?=
 =?iso-8859-1?Q?jyBJKFNBdC49WwoJosXZ8bE9Q5QtcH5UiwynnPuGdg3CtU3OSvsaoThVMh?=
 =?iso-8859-1?Q?7uwtAH95b7EUOKfqng1rkCVXC/6ha92TcLho/2VMEN7nTOp63A7SkaQ46L?=
 =?iso-8859-1?Q?FaSU6g5atePr7TEJKOLS6YC8eATIp4PtHQnsonKLBr2wMt5tG1bhcGppJQ?=
 =?iso-8859-1?Q?HtX6q07xcPAoe5ls3+qOz658zF5xQY3NRd1oAnQ6rKoL96CE0jDFVQ248O?=
 =?iso-8859-1?Q?MDik3GDDr+93rtQG6K/lBPHcjQZvIDP09Z/UAHmmXqRVlaaQKd0G4QRqeM?=
 =?iso-8859-1?Q?HKqw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(376012)(366014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?APRRLuVGiQID75ccQdg1bW+v7RdxMrnRziWz4KNjxHysTpZyNqTd4fIAsg?=
 =?iso-8859-1?Q?xG2bvVh2Ki+xL5BsI8koZfX66sF9Uaf76oHDh+9oD8pXIK2v5mxPJpP30l?=
 =?iso-8859-1?Q?Si0vAeyBQDs3gbJfNvQiXwTeypOjSEby/Ymuu0f2kIOQdJKuOdjQXy9o8I?=
 =?iso-8859-1?Q?UX6aJlsMxAJiULy3vqHJlpQSv9G+jf8SeHrU9gSvg2MD/8KYlbJBuzOhjP?=
 =?iso-8859-1?Q?e9bVGQt7IzqNk6z7oDkHDGfNojLRx18pp8oSHRHFc4Ah0SjPho4v1uSpBp?=
 =?iso-8859-1?Q?FFKf88MD/pTm7rcZPr7jobx53EvgsTlZmfJ1E2VLH6gYj+2ExO2cW6Lk+7?=
 =?iso-8859-1?Q?+CYUbwwt7nE/g9nprI1Zr78SgjGKNzncdks1uv0wyNEBn/XCJCJ1ItB9TI?=
 =?iso-8859-1?Q?GXNnn0/NaTS3cbwPqZcFvmVUqMwBivm9/IUpjntDLpuyPFK0FBES2QjFOF?=
 =?iso-8859-1?Q?9OM58ql/ppdWLjVpgR69wPuzkNhxfV52kZCNx8CoAL9OLkC3rRb7jl7y9u?=
 =?iso-8859-1?Q?FP3iRWNwNR6DMqTFaW28ondT/BwRI4qsV5i2OzF7kOI4Y4bgdAGjOpuQkd?=
 =?iso-8859-1?Q?lOY0oKPuKvZ8zDQ/AAiMF86Sv3KL6JcC/0HKi7yeHtI6v7g3LLoHDvaQVk?=
 =?iso-8859-1?Q?riYnNZrczKMLw5Khip77nxFDgJO2Wt2+lAof6CiafruMMeNNksEK8J47ip?=
 =?iso-8859-1?Q?yTDVyEl9mSFaM/r/nbqWJUuYcmmL/su3wbkCmNvKurepuyvWo16EQHwGjp?=
 =?iso-8859-1?Q?zJlSElmQ25YdPntrBz/+1PNgMqcpN5mXR+SkjHZi9q1OLuEfRPu3jOQbZU?=
 =?iso-8859-1?Q?07OgHsu87LxEB7BYdK/x92E78eqmu16AyzylsXZybYochYQY5OsAo3yqjb?=
 =?iso-8859-1?Q?lZ5maE5pPOHuwG4SWHUw95H0PkEoR9MbkGzj45hVuH+MXEsqXcADAkOaqm?=
 =?iso-8859-1?Q?foOh+pCp1WHNw71+IeRh6zHLD0UxK7/8QryCREQKmoZ0pI183YCP+NebTm?=
 =?iso-8859-1?Q?/uHLKANFOzg8AQ+Ztu5COVVR6GFBmbhRCKpT5pHyEMgQ+/5ayzW19W20be?=
 =?iso-8859-1?Q?x4dV13dpAmdPjJB0niNN4/Ih0HTGORgRAX9x1lad61wBkSF9bVcNAhn8OQ?=
 =?iso-8859-1?Q?SHeu2jyTVXD7B8f2rekRSkliWxDCfA9bp8v+PCfwAdc3pZo0d5rJHSnxvH?=
 =?iso-8859-1?Q?yXHIwFjFQA83hvkyuk1eR4/BJy9jnBFOrV5y4zL1NT/xp4vxV0+mQlKTLh?=
 =?iso-8859-1?Q?SULfKJQanOYh1KiHcK7C6r90fTJatlX3s36KtKwpQQdHcN4iiZ1TAXHHl+?=
 =?iso-8859-1?Q?hIWvSpcKtAtmDhQeRJy+VPkdjXpo3QrJ7FLtgvQdLLWnCmyr9a4PCJggfO?=
 =?iso-8859-1?Q?mJ/kLEWe3gUH8WeDqlrlap7/zJ7WkDOfjLkvwGCHZgWbvHrJufXh1X2qLI?=
 =?iso-8859-1?Q?r/2+wgEEw8onp94STz+dx3vAgCIcJvOgRQXvWwLCpoFBrE3Au3QmYfr3LI?=
 =?iso-8859-1?Q?94257bDGY+kJ6DtpsIHdbPURhjipQtqHVPgDPjaCjGz7YVB8dOUk/2+Amx?=
 =?iso-8859-1?Q?MSm2QU+UxhWpCyQagyTE05y3R6hl9AQyiZjtbuIt5o9BBFp8esBNecOkOz?=
 =?iso-8859-1?Q?1aOuDeWYpD7yKM65oEFcMbwOmMcnI0sfPNSkfWbBZqt8R9MEoCZx+LrQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6503617-0a20-4970-2beb-08dc960181da
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 17:00:39.8309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7X+HOJ4D47h6uFH0OSGEAtfWkofiFvRZVl5QCH2uRaXHPMYZt8kTvrG6b2zDALeD0Od6sKp8XK60ZTamSZc1QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5827
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

On Wed, Jun 26, 2024 at 02:38:31PM +0200, Thomas Hellström wrote:
> It turns out that xe_evict in the cm and thread mode is a very good test for
> exhaustive eviction. But the test sometimes uses a working set that doesn't fit

Do to hear that is it is a good test.

Have you tried [1], in particular *evict* sections. I wrote this as an
additional test which also fully checks the integrity of memory as it
gets bounced around. I think this test has value too. It might have a
similar problem to what you fixing in this series though. I think it
worth fixing and getting merged if you may review. I can work on fixing
it if think this has value too so it can be merged.

Anyways will review this series as soon as I can.

Matt

[1] https://patchwork.freedesktop.org/patch/588613/?series=132251&rev=1

> in gpu-accessible memory and a total memory size that exceeds the available
> system size. Attempt to fix that to avoid false failures. With these fixes
> the test should pass unless in -cm mode or multithreaded mode. These require
> fixes for exhaustive eviction in the xe kernel driver.
> 
> Thomas Hellström (2):
>   tests/intel/xe_evict: Reduce allocations to maximum working set
>   tests/intel/xe_evict: Reduce the "large" bo size for threaded eviction
> 
>  tests/intel/xe_evict.c | 126 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 99 insertions(+), 27 deletions(-)
> 
> -- 
> 2.44.0
> 
