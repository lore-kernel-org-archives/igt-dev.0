Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10934C54798
	for <igt-dev@archiver.kernel.org>; Sat, 24 Feb 2024 03:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9386910E13F;
	Sat, 24 Feb 2024 03:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZbcSPEp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EEE10E08F
 for <igt-dev@lists.freedesktop.org>; Sat, 24 Feb 2024 03:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708746105; x=1740282105;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+a3vCjENGNvYETRwJ2Dck/ISJh5Y1wKBwOTpZWrGTtA=;
 b=KZbcSPEpdmx0Sm5lQPs+m7U5CHnOnqlQk0eOXUNqMt3BHmns11JCNQox
 qTYQxFi1ofwQVjoRlyVOFmZ9fzoYl1NJRqg6PiiMWCZnpmR/rEX6JelqU
 FL+36uvPNBWqgs4o96k5BZtWszdDhB9Um61TLEp1ou5b7dhTYiuIxBUcH
 hKEuLtDR2YXbJzI8caXwhtjWccnFKD4UIz/PnAk/DmgcEGcPDb52k6XlL
 VT6zqRqzr2MkgzhtNT6+ei1W6KL8AS3s71UMkZAxjJKOvYmKCX3sPM6xt
 8DKuZHHdEu87TEEuvmuVvDlw93Uym53Kd6FvuNw61Hmxf8ShW9EHTjPB2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2951016"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="2951016"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 19:41:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; d="scan'208";a="36883817"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 19:41:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 19:41:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 19:41:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 19:41:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axSpxM5LJfHMfcJJYESJOmfwa6UEUAJFRSHOLXhC0ty+lVpy68VzKacT1k59NsAOvh2i5kgEgS/22Uc3DfQXJAMxgzEg25oa8IToCCv3vBmySjl3kFeGB0Rd5Ibqp5SLtt1hdPvPal8uGpRSBVtTILx2vz1asPEdpp3FxI+76pbM0A+xhdU/rlOnD7nH/PmR+ERjFMa/0ljjFZg9FbDsgeybyrX7A/QfSEhcN3scgRbz+LKu1Uj/54SRToukQE1iwvPCbhtZ8KSgjNYTf/HManeEjdVxIHUjzT1QKTr8gl4h9/SVASUp65o2qOIX4SLpn3KLpcRG5x+i7dGfN8A04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUy7OKeu1V7HjyDyKSkO07+QCCtOSLlAqwImLzJkglg=;
 b=JY0ZX+TKw+AUSSPc8I8waQs5OYgyiOoOfgEBlY04wCaa08RePOMCB9tBWS/46S3+yibq9bkgXLF3VoojRqW753MsxZe6opJOFEHONOfrbdjp/z7X1sGyxAhpi7FeDkF2ec1z0cu7Ku5eth79b4ZFpDAJ62WNBwplFi88bPw9MDQDcwy745blajAwunTUhW9lV+tA3iNoLk+gFOZxTEt3gzENlN+Vo0AAjcXvkZzIIlA5vX1/m8a/YXS9nUCFH1ZKjsxE7T9a6uxsxZZboI2fCyqYz2SspgCOJhPBWifXBNOXCdRtGznnAQ4Dj5M5pKW7m///FqavAf/4iE9CCXKl7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8011.namprd11.prod.outlook.com (2603:10b6:510:24a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.13; Sat, 24 Feb
 2024 03:41:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%7]) with mapi id 15.20.7292.036; Sat, 24 Feb 2024
 03:41:36 +0000
Date: Sat, 24 Feb 2024 03:41:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/xe_spin_batch: Sync after vm_bind_async
Message-ID: <ZdllTSAD60PwnZLA@DUT025-TGLU.fm.intel.com>
References: <20240223230407.1712361-1-jonathan.cavitt@intel.com>
 <20240223230407.1712361-3-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240223230407.1712361-3-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: fdbea916-b751-4251-111b-08dc34ea80af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZmdJvA2NjupkaIBvy9+qS42efJ0pcXjQS5aXGkJbEDyc4MXtk2A1iOyhnhl1l1fk3eaCLE1DFdL+557ncQveua8QhEEMNowmwyg1IUWJZcqjtu33tKvwePRDKlnNy0sGi53ws+otWukaZLdVvVxwaj9vj+iIEBNkb5soZzxrpNl2qxMsWp1/53WGIJCGtLz+i+r0+eC5Y5viB/SJfvIGLdmq5N5B8Jn76NoouzyGAEtwKjxAp3HJWn3YCKc6gtNavg1EYbxUt/28XlJWQvKRGEN/NmGsqPA2Y6yhAizkwqIN0a2qvoiESJ0+qmNg0IRd54NaaHxNLSTi3Rzqm4mTaiVvOxnuw6gGGVuz62iyBJ1/6R9ynNpY608KX6G6mFXOHH5L1txImgGQJVJ/pUd/L12PFR7/buz5mZGraM2eih85MYT2voajsLIvZvPgdj12jX+P30XCMleIfMGu9+rKUNyjgYQyrIIXZm0AR5BrvXrRwpmWeBZL+EJKYsmqHWxxI+Fsi4w9hHar5poKKHrMcq53DP3/nwV0uIh7NdmzwwQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vfxRsYeii3O+4u9dbNW6o9uOVEpsvNwKe4OPr011j7u2sD6+uGR5TwyB5UXc?=
 =?us-ascii?Q?l+0wk6ziP20y4/rmCcWGyAKT0QB7ZahAEeOGBfamI7mShswe+/E0EEbX5oRU?=
 =?us-ascii?Q?lDOT0pmrhpv6/WM/zUx2Dc+a5hD3xM0p78vywYFfGLTOvccU4BdI6podqaGo?=
 =?us-ascii?Q?G6zsJs6tUIGQppLskRzKklB21qZlvbBEuNdKtjor0QwOHXWojVw4J2b9ZbiF?=
 =?us-ascii?Q?HGPgkD1VVALZPliZ3rIebx5i7LEgIUivuP99/jxeEXY9z4/6+qS0p+118+86?=
 =?us-ascii?Q?C9bJNoadtC9SpOSFsDeU9nb8OgjTrjemQlF5dhukiqh4RFBtH55tsELHRR8Q?=
 =?us-ascii?Q?dJyvY1jXL1j7lI6a7p4KUZ54rvZwAZVnvcWPUHePCEv5zkqR91cT+ia6QUt9?=
 =?us-ascii?Q?rEGMFrdWw4UkekGP0/CXZqHjXDhvtxCNtXeY5jEP271xvCxYPC98ALEHrRW2?=
 =?us-ascii?Q?ie8Sayj0eHSd5A54o6Aibd62u0K+BfNVqQZxdUO0GQGVnsoXfFfY2XbQtAeK?=
 =?us-ascii?Q?5HmnjneMPP315msRPcj46SpZn65BFG9AAAh+CiH/w7ojK/mdCG3uqE4DyrgU?=
 =?us-ascii?Q?rwLzLOOZbqtAkmwSlTHt8lxns8BacSs+UCjP2J9pvUd5yEHEK9UDtK4+X9xn?=
 =?us-ascii?Q?2nCfa4Jm+V7DhbNkBB2CCSE4UWmwYKsbjjV+bg85VhxvuHPchLziwMGg1Fxn?=
 =?us-ascii?Q?+AFjMsLnBWFQThrmiH9xRwUeSJ4XRMWL+4mH5Vfly/1Ob/EfnSntRCq+OYsS?=
 =?us-ascii?Q?W8I6eVasEqWuU45cffI5mgwSOCN/GheKbJjsxKMIrqJWQhGh5MCh3rXLp9b4?=
 =?us-ascii?Q?O3uVD1DMKTcfkRcRG+dnyzUyRXBG+XGwJqoEJts+t9qVQJN82etp2AqXk2tI?=
 =?us-ascii?Q?kdpuFWO44LlA/hJuIDKDgeJT7pEyakWDpZMmWluTO1lBjZdiRAtOPHhaTuOH?=
 =?us-ascii?Q?dAgc+7lfi+ntTCtCUBjzHmnDlke80RpruCc4G2G3fIuScmDd+Gqx4touk2P1?=
 =?us-ascii?Q?czMIWjzOamAtVm+0F9CCgllx0I6EVxz/sdn5uaFNehFjCcI3I0gIfd6kU99y?=
 =?us-ascii?Q?FUYRBWBxaMAL9RusIop09AGNTg7oAt/bY2las+MEYZFoJflqSjFRTs3Ta47q?=
 =?us-ascii?Q?1JYHClGEaWK0Jx4qM0QgTbbRF+rYZmFmBHAx9rTXmCVDRVGAYutg4VFJK47i?=
 =?us-ascii?Q?0wG5NMRhCLz6IfshWaS74UhbR9Z4TIuL6o+8MXOJyY9IsITOSr4bzOkKpzn7?=
 =?us-ascii?Q?0IHxguu+qu3wLlQkHrSuemG/0CStzApElQngK3H9zR1uF445tWhzs3IX0gZc?=
 =?us-ascii?Q?4xEZ17S9SoZ+mKkwG2VtwfmSCmjFLOLvBuEeanMCIKyW3etuXvEIqj4eLbTn?=
 =?us-ascii?Q?b+H7dqJtcYLy1hmsApiw9Qqxt+/e5yNtbvL/k7BhSpTmYqTm3wJdZID27/MB?=
 =?us-ascii?Q?JZd72hM+4S5HRlAH72fms18kOvNWLvnEVrhJ2V9OLaeV/LGc4/uLp9KVjIbk?=
 =?us-ascii?Q?kbF5X2PYwcdLbp6dNFWtesK2udGJ1bnorwkR2zxJIPhspDAjSqVwPACSi7E/?=
 =?us-ascii?Q?JAW0LxOZ+nJ+2PtjpRQQ1iXxIQQ6DLzo/0qrybQcKvpGKeGE3eZuE8xEbl8C?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdbea916-b751-4251-111b-08dc34ea80af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2024 03:41:36.6779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKynwtRh2pXbKTt54UyQXh7UDOVOaRDi7H1amP5tocs3M2hEbO+hoqX3NvpnEwjR6CrVD1NXM4dEEq+zuM9KgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8011
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

On Fri, Feb 23, 2024 at 03:04:07PM -0800, Jonathan Cavitt wrote:
> Ensure that vm bind completes before the call to xe_exec occurs later in
> the preempter.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_spin_batch.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index faf569baf8..3bdc1e5e20 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -202,6 +202,9 @@ static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
>  	data = xe_bo_map(fd, bo, bo_size);
>  	store_dword_batch(data, addr, value);
>  
> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +	syncobj_reset(fd, &syncobj, 1);
> +
>  	exec_queue = xe_exec_queue_create(fd, vm, hwe, to_user_pointer(&ext));
>  	exec.exec_queue_id = exec_queue;
>  	exec.address = data->addr;
> -- 
> 2.25.1
> 
