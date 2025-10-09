Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C94CCD184
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 23:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931C210EB3A;
	Thu,  9 Oct 2025 23:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hLiXDlu/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7242E10EB3A
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 23:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760054267; x=1791590267;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WX9jBeAPRTvGczpY+53wkdIiiGcJvH+iV2zah9X1Jrc=;
 b=hLiXDlu/8ilRDWuOXoXMHee3Iix4uUX4hy02veu/ADPwvP/avIs0eyC4
 IZ3Oh/PLpJLCheWajyWLBWpyBWi0LpyztRglWap23DMFNHhXPb76EOGkn
 Ed43a28ErH992T4tAoUZ96mAfLhkLnBr/StugW7XYjWPb2f5wb+1crm47
 o9NeyodmigXWUpDbzKNwZQ4Ne4TZFolw75C1uisfdha7BwL1bZ3wAiDZz
 R1rwL1pYBPFu5q4h+pW94kFVD/osTISg483MBwzygx3n+fLEm/oa2mFEl
 M066IZDH9xYJG/7f9UxFo6RzheCGuvFNRXu2D/WPy7pkCxQSBPuZgFtaR g==;
X-CSE-ConnectionGUID: 4KaoKJBTQpOKhEy0E0/kCQ==
X-CSE-MsgGUID: KfYjzt+/QUWy1wU2xXki0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62212356"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62212356"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 16:57:47 -0700
X-CSE-ConnectionGUID: N46EdUjwQVaqa+nsi7Z9Vw==
X-CSE-MsgGUID: nKdVbi1RRjOnsOBXSIgWeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="185097339"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 16:57:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 16:57:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 16:57:46 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 16:57:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLW6eSwUozKydpJ2lZadE07rp1qPvM0UsL0BWM3eHEeHK2JmWaVXDmkMqQyZWLaznvDsOFOyjgrjZJkiEBZNyubmCjj1DjqK/3urSJLwYyZDQIhQCTCrJawVQEP8jbs01lg9eydTgLG+somYn//OXmKQBjisyGbEdZmRMqvntltTeyvtdaqAxfCwf+5Q4DYsAYf/nO/QVRtiiWSQXpGcsVp9PFy0qz/MFrm21KAyn+Q/soyglXhyCtl6KgjwTshF4ZhvWFCN0JEx1z+ytnkHYXpnQfa0VF9cO0lbe/YKiTrWReXxaj7NrrHaezUOFAZ8pgkMz0v8iiuhhm9fnRNj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dRjDzqyKrw/lM0OSM+v+WjawvVzU5Zv1tPIhh9GMX0=;
 b=i7wXdpQ6Hv3d0+iO3xrTtT+RKWsJ0z0v6j7Ii4u+gcYeeqNV9hzY1OGQ3Abk9bmL+fUpy4KRWqjnwZq9V8y1EpJHTRqGgLR8LrTFbUuVqzEcd/qTObDGvndm/xErQmIZVA8mUx24yYHg0n+EwRmiekMCjeWE6JaoltR2aorTPagh2innh7JbweyimrNEuPrpHja23GzmnMde9U4EoBR3J3iNjD/rdVtY4bOLs8uczlLLJ9BiFqYYR34hRulbVgfJj1n1WviBNet/edWIdt5AKCUGGl1xxnwwGXeuspdKzREpiFlb1gzlS3OgyH5q0LL5v6Xk2nP2xccZqwwa+abVnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5104.namprd11.prod.outlook.com (2603:10b6:a03:2db::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 23:57:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 23:57:43 +0000
Date: Thu, 9 Oct 2025 16:57:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Wang, X" <x.wang@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>, "Goyal,
 Nakshtra" <nakshtra.goyal@intel.com>, "Bhadane, Dnyaneshwar"
 <dnyaneshwar.bhadane@intel.com>, "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: Re: [PATCH v3 1/6] lib: Add runtime device info query APIs for xe
 devices
Message-ID: <20251009235740.GH1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251008210236.396859-1-x.wang@intel.com>
 <20251008210236.396859-2-x.wang@intel.com>
 <20251008220136.GC1207432@mdroper-desk1.amr.corp.intel.com>
 <SA3PR11MB8046071C5781D386651043FC86EEA@SA3PR11MB8046.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA3PR11MB8046071C5781D386651043FC86EEA@SA3PR11MB8046.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: 24072ac0-bd52-4fe8-1905-08de078fa350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p3/uMLA8e4eYBNzDySYxpxAMsXOrgPBnN2QrERZJHxoGuBn50G1s/2kQsPWm?=
 =?us-ascii?Q?FA5faBbkjwBnp2Qx/dIU1f5mDLu7qSNBYbjkGC3DQ+UZpKHNrClhk9PjwnGF?=
 =?us-ascii?Q?EU62KybR5Ezu+uXUyzb6kRKCXxncKLoSYG4dcYGoQg1WCGPP7vwfJa7ljHJz?=
 =?us-ascii?Q?nh6XuzvlQgXDtT1wnDjZ0ZXk2P4o3kJZS/fWhBkoTXyykJvIdsmkzV4+RLSp?=
 =?us-ascii?Q?lRWUjZxlL57c7RZpW4jsxJoh68LysUC2hhQ7RUGJUcdYLwvzjG4n9G1l5P39?=
 =?us-ascii?Q?4uY1RsxY4yl8R4tNCkvGNOh3WlTIPE/LuNxcd/KuGxdIkW2o0aOX6vxi/2K9?=
 =?us-ascii?Q?2g3+6Pzj53EzigvT9FsQUjCtl8hhVlJjXazA1gdwaY3NbEjI38T9VSugDAOd?=
 =?us-ascii?Q?aB/VsbKXt9SMV/w2hanuBje73XkHYZIzJjLk087X8kCDjIwEJE2me1mh8uMO?=
 =?us-ascii?Q?T+HtbQKS8K02suvxSXyw3Ts7LjObplCUGuD4LPnOqZ/VdnbWu8XFFwxiSkam?=
 =?us-ascii?Q?fe6l94wTpU2aBrCQPXrH611akdBeT4Bxx/ciPUDAUOzZa8pDpYuDqro4AW2S?=
 =?us-ascii?Q?3qh695/My0heEVtPJZlq0wnP3wqM0YDYcpxFOf2SIggg9pB8puvB230P5ymS?=
 =?us-ascii?Q?/LK5ZIAlfy4+eb6e8gwdVhccE86B6i11YQw8HCoPGdeOmgikrurv0ZQjYE8x?=
 =?us-ascii?Q?bBx6n2w5Jo+X/QBKHQemB2KUOYLrLmcDikCQspe4FavALHZ99ouHfIgJDPEN?=
 =?us-ascii?Q?cfJX9O4ei4sf4CIFDYEp58aCiAjbhM0LkpT9IS3qIZu7tyrvIkHewATHcXRX?=
 =?us-ascii?Q?+XdlQoDaokzvJcPp0Noiq+I77Md0XUyvRBYuwE7KDn/EuXe7snIukPfv0HqN?=
 =?us-ascii?Q?Dd0jYjm+SFqPOLrL5mt/n38RYjDtO+54NbC41S17p29A1tqpHWavkaaUPCeS?=
 =?us-ascii?Q?nyRANKMAv7bysMyvaLq43oN3+fuXNO68/uJkt4qnuAiiXxgfVQXswnF9jzUy?=
 =?us-ascii?Q?/36+UgEFHG0aH0KDTjBkEvrhMFsA/J7UCm0Xy8O1jc403G1O1YgYVJAW8v88?=
 =?us-ascii?Q?qDqzsKNlYkFB/ne2Vaig+/U3tA7+5hlF4+Ghz2jYbp7nrYOsYMI3iLPliTp/?=
 =?us-ascii?Q?DO/IO49Q6j1BEojzS8mQiFagK3pbrV/nzRUNroRr4j4qhOgqj84nDhBS6Lt0?=
 =?us-ascii?Q?NPxO/Upz+qY4j/vz6VFwg4/GiMuMRb3Q6Vi2EFNEdPLY16B1z7myk5oHb31Y?=
 =?us-ascii?Q?0CL1zRJQSlMV36v5ypQZhqkj03eHFl+r5d1uwRNiW+jXgbi6IJBBT3M8sLvu?=
 =?us-ascii?Q?SipnOaTzIJOOrwStZ9g4dhmhDriPQd7giydSLzJE1eNsXBHOv0IpkCE/HI2J?=
 =?us-ascii?Q?ZmiJrYaF8pyBD7YzohkNGjG2td7jvXeGl0lrapSin2NNr8swgmDd0EYVd/A1?=
 =?us-ascii?Q?1b1jkmDchTbPjc2Z7m0Mk/puw6KJ2L/p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rt206ILpT3+b22+RBcKGtXTL0qIHTkRL/Dk4RP14yCuJR2Z05aPUxIoQChP9?=
 =?us-ascii?Q?SDQzIP9hG8y351tlF4RTGExcVObNZZGgXAIPfiV8ghoZoXzjFiY3YrscBaTL?=
 =?us-ascii?Q?gXDdi0f+FkuslLJtKGrOY4MfbGBApcE3zOsoYQvmuZbPpmVxOjSuu7liqHb/?=
 =?us-ascii?Q?bVSk65OUyZQPVidzLYP3mMCQ0LdgpUC0SRLloQVAqwukdoaWp66s58/ZPj65?=
 =?us-ascii?Q?+2DqM26g6W67MgfTVvbdaccmjgC81VRU+pDXXOJVBJ129V1aE6NTeQEudhyS?=
 =?us-ascii?Q?KfZFJdmPbFD1r5SBIvnRnWKxhr/+e8iuOKgd87c3cKqW/FXAn8L9iG+ietdP?=
 =?us-ascii?Q?yuldhDnRR8ak9bfyZJYDWRERO5ZffBheA5f3KxlpY5rD2OXFu6r3XkJdC4nL?=
 =?us-ascii?Q?TPm+JGEcUZGNYkEe+amqVwIIrSXB0TKFvr/ClVF7ciRInItmpKv6q6dNUN3O?=
 =?us-ascii?Q?tOyXiA/92kN+9GzyFVZHIfdVzoTI+cIoey/DmWUBxE2uG+LBbbhCM8p+qJ8p?=
 =?us-ascii?Q?vmduUMnx8FRSjm5z/ePmhoFp8UqXPdg37rZve1l3SNcDzHoPhuMXhJ0bExo/?=
 =?us-ascii?Q?lVahUeIlV3FCOGR1doGFxxsSuUo2clgX5PYjqp4MSqaz+aBFqCyI1w5cq6tJ?=
 =?us-ascii?Q?lRx6oOJ1PB3JeGjK4RLaNiWX6M13ExXiU4OvZncYKQFAn2or8NyghPy4kBu2?=
 =?us-ascii?Q?qAD3Kn2SC28lTI7CdaCbTRljMFHGcYJ1ea5D5o9PE3DP+ETTQXGKuA8thr42?=
 =?us-ascii?Q?aNiONd+mQV73AGVWtk4frlDXdyV0UjRQI9hiuXttXQ/WNb8Gzc8ZFfmqrThF?=
 =?us-ascii?Q?2Soc5Mm91ZpVeQ1jqoaKKjctU/C3vish3ZXLwxT15x8se3rI1wNHaVE5IOKa?=
 =?us-ascii?Q?5BrRJYMmHiDii49+3b5yUZK1nyRLhoasS5gAmMlGNglCq1tDr+uuArwN4p5R?=
 =?us-ascii?Q?1D4MSG0uO6/12uoS3MPJdOjmUNLWtdez/TEEfoi6nsEmNWp/fSZzsjXm9pAJ?=
 =?us-ascii?Q?2Su2HUdsk5kvw7qPXo9nT7DOieX2LrqA0yTjzkz+qVgOUTUSS0yLc34Ws5Q1?=
 =?us-ascii?Q?tbwwR8iEdl8W+Vhht/INzmUq2m66E89HifWeNuk7YmvRdl5xcL5ASOqLPeGq?=
 =?us-ascii?Q?jqgurmR/FbeqPgkCxiktwTqfCZmzGkgYxf9JaU17n/1UuCDHAhxXbC5Jxe9F?=
 =?us-ascii?Q?lMLHfk6QiPB9fKKrxMRkXZwT+uDi9pZW8q+JgQV0zM//8dQWm9ujTvmIEptT?=
 =?us-ascii?Q?7R3F44ru8iwge59Ys/Egm0LccQbFt8R/PAWdI3Lsb+aRem0UfYrdgs9ZTAeq?=
 =?us-ascii?Q?BfXgITO+YiS4ZuKTWmRirbhd8+o0LuxHUp+0BaaRcNA1Vdq9WmX8T2hFC8os?=
 =?us-ascii?Q?XM0eoPXiPk61KwFhKWgIexM+BPq0DB2Q6NXqwOIIOaeaNhccm9b5MxZOiMyY?=
 =?us-ascii?Q?j2VUFhSyGhz8ecnJzH432Gb14SAAKHdxHjR8sdlcgGwM0Cc+xgFzn9kVVGn5?=
 =?us-ascii?Q?J9dvxRB98SQF0w6PmiGzJ0DPp6425xvujk3Py1vCwmv50aywlGy9ClKMIqwW?=
 =?us-ascii?Q?LuZQwbQ1MKWwZgYKTpQYsw8JQsI+b8hOdi7pWivEYb11v8wc6AEWAd5IHuYx?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24072ac0-bd52-4fe8-1905-08de078fa350
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 23:57:43.7160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7d1aHbqGJsXafbfX+npkA5OlDmD2QLWjYovEx4KkyAXkW+U8DgJ232LclDhVVjnMm8wY81H+3nmgGWM6FO9ZD4a28p64SbKDaj/sxE0IPMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5104
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

On Thu, Oct 09, 2025 at 11:00:57AM -0700, Wang, X wrote:
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Wednesday, October 8, 2025 15:02
> > To: Wang, X <x.wang@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; kamil.konieczny@linux.intel.com; Lin,
> > Shuicheng <shuicheng.lin@intel.com>; Nguyen, Brian3
> > <brian3.nguyen@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Goyal, Nakshtra
> > <nakshtra.goyal@intel.com>; Bhadane, Dnyaneshwar
> > <dnyaneshwar.bhadane@intel.com>; Sousa, Gustavo <gustavo.sousa@intel.com>
> > Subject: Re: [PATCH v3 1/6] lib: Add runtime device info query APIs for xe devices
> > 
> > On Wed, Oct 08, 2025 at 09:02:31PM +0000, Xin Wang wrote:
> > > Introduce new APIs to query device information at runtime for xe devices:
> > > - intel_query_gen(int fd): Get graphics generation
> > > - intel_query_graphics_ver(int fd): Get combined graphics version
> > > - intel_query_device_info(int fd): Get device info structure
> > 
> > High-level question:  across our existing IGT codebase, how many places
> > in the code truly need to lookup IP versions based solely on the PCI ID
> > and don't have any access to an actual device (in the form of an fd)?
> > From a quick skim, it seems like the vast majority of our code has some
> > pattern along the lines of
> > 
> >         int fd = ...;
> >         uint16_t devid = intel_get_drm_devid(fd);
> > 
> >         if (intel_graphics_ver(devid) >= ...)
> >                 ...
> > 
> > Aside from a few exceptions[*] it seems like the path of least
> > resistance would be to adjust the signature of our existing intel_gen()
> > and intel_graphics_ver() functions to just take an fd instead of a
> > devid.  Initially those functions could call intel_get_drm_devid()
> > internally to get a device ID and do a device info lookup, and then
> > subsequent patches could add additional logic to do a proper ioctl query
> > first, and then only fall back to the device info in cases where the
> > query isn't possible (i.e., i915 driver and/or pre-GMD_ID platform).
> > 
> > [*] From a quick skim of the code, the main exceptions that jumped out
> > at me as truly needing a devid rather than an fd were:
> > 
> >  - The printing/dumping functions in lib/instdone.c that get called by
> >    tools/intel_error_decode.c.  These wind up being a bit different
> >    because they're specifically used by a tool that analyzes error
> >    dumps; the device ID used during error dump processing either comes
> >    from the error dump file on disk or from the tool's command line.
> >    The device itself isn't opened and may not even be available since
> >    the error decoding can be executed on a different platform than the
> >    dump itself originally came from.
> > 
> >  - Tools like intel_reg, intel_gtt, etc. that scan the list of PCI
> >    devices and use libpciaccess to map+access BARs without ever
> >    opening the DRM file handle.  In fact, these tools can potentially
> >    run without the driver loaded at all since all they care about is PCI
> >    device enumeration and raw access to the BARs.
> > 
> > Since the exceptions noted above are all tools (and mostly old tools
> > that nobody actively updates anymore), I'd be inclined to let the tests
> > and other parts of the codebase that are actively developed continue
> > using the existing function names (intel_gen, intel_graphics_ver, etc.),
> > just with a signature change to take an fd instead of devid.  Then We
> > can create a separate set of dedicated functions (e.g.,
> > "i915_graphics_ver_from_devid()") for the special cases where lookups by
> > device ID are unavoidable.  Since lookups by device ID simply aren't
> > possible going forward, this will also help us figure out if there are
> > cases where our current tools are simply going to stop working and need
> > 
> > 
> > Matt
> > 
> Project-Wide Replacement Analysis
> If we search the entire project for intel_get_device_info|intel_gen|intel_graphics_ver, we find:
> 
> 136 files
> 483 occurrences
> 
> Option 1: Keep Function Names, Change Parameters
> If we choose to keep the original function names but change their parameters to use FD instead of devid, we would need to:
> 
> Modify all 136 files
> Update every usage
> I understand that keeping the function names unchanged would be more convenient for developers.
> 
> Option 2: Introduce New API Names for XE and make compatible with i915
> If we instead introduce new API names - intel_query_device_info|intel_query_gen|intel_query_graphics_ver - and only modify files related to XE testing, then:
> 
> We only need to modify 36 files
> With 127 occurrences
> 
> I suggest we should not modify the legacy i915 code, because our goal is solely to fix issues on XE hardware. The i915 code has been running stably for many years, and it's better to leave it untouched.

I don't think the goal should be to minimize lines/files changed, but
rather to do a full refactor that makes the codebase easy to
understand/develop/maintain going forward.  If people writing new IGT
code have two different APIs that look very similar, but have
hard-to-understand hardware and driver differences in when a specific
API can be used, or when either one might work properly, then it's going
to lead to a lot of confusion, bad copy-pastes, and bugs.

In the end we're going to wind up with two API's no matter what --- one
device-based, and one pciid-based.  I think the device (FD) API is the
one we want to use almost everywhere because it matches the semantics of
what we're really trying to do (lookup the version associated with a
specific device); we should discourage use of the PCI ID API anywhere
that isn't one of the special-case tools that doesn't operate on a DRM
fd.  So that means one of two ways forward:

 - Update the signature of the existing functions, and keep them the
   preferred functions to use throughout most of IGT

 - Demote the the existing functions the tool-only API and switch all of
   the other current tools and tests that currently call them over to
   using a new FD-based API.

Both of those are going to require widespread refactor across the IGT
codebase.  But I think either one is still preferable to trying to
minimize the diff.  If we just bolt on another API, but then don't
actually use it in most of the places where it makes sense, I think it's
going to cause a lot more confusion and bugs in the long term.



Matt

> 
> Xin
> > >
> > > For xe devices, graphics versions (both major and minor) can be
> > > accurately determined by retrieving GMD_ID via IOCTL, rather than
> > > relying on static intel_device_match table. Different device instances
> > > of the same type may have different graphics_rel (minor version) values.
> > >
> > > Implementation details:
> > > - xe_device struct now includes intel_device_info for compatibility
> > > - graphics_rel is populated from GMD_ID's ip_ver_minor at runtime
> > > - For non-GMD_ID platforms (ip_ver_major == 0), hardcoded values are
> > preserved
> > > - New APIs fall back to traditional devid-based lookup for i915 devices
> > >
> > > This infrastructure enables accurate device capability detection and
> > > avoids issues when adding new device IDs with varying graphics_rel values.
> > >
> > > Signed-off-by: Xin Wang <x.wang@intel.com>
> > > ---
> > >  lib/intel_chipset.c | 63
> > +++++++++++++++++++++++++++++++++++++++++++++
> > >  lib/intel_chipset.h |  3 +++
> > >  lib/xe/xe_query.c   | 19 ++++++++++++++
> > >  lib/xe/xe_query.h   |  3 +++
> > >  4 files changed, 88 insertions(+)
> > >
> > > diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
> > > index 760faede2..890b1e3fa 100644
> > > --- a/lib/intel_chipset.c
> > > +++ b/lib/intel_chipset.c
> > > @@ -189,3 +189,66 @@ intel_check_pch(void)
> > >  		return;
> > >  	}
> > >  }
> > > +
> > > +/**
> > > + * intel_query_device_info:
> > > + * @fd: open i915/xe drm file descriptor
> > > + *
> > > + * Returns device information structure for device @fd. For i915 devices,
> > > + * falls back to i915 device info lookup. This function caches the result
> > > + * per file descriptor for performance.
> > > + */
> > > +const struct intel_device_info *intel_query_device_info(int fd)
> > > +{
> > > +	static __thread int cached_fd = -1;
> > > +	static __thread const struct intel_device_info *cached_info;
> > > +	struct xe_device *xe_dev;
> > > +
> > > +	if (cached_fd == fd)
> > > +		goto out;
> > > +
> > > +	if (is_i915_device(fd)) {
> > > +		cached_info = intel_get_device_info(intel_get_drm_devid(fd));
> > > +	} else {
> > > +		xe_dev = xe_device_get(fd);
> > > +		if (!xe_dev)
> > > +			return NULL;
> > > +		cached_info = &xe_dev->info;
> > > +	}
> > > +
> > > +	cached_fd = fd;
> > > +
> > > +out:
> > > +	return cached_info;
> > > +}
> > > +
> > > +/**
> > > + * intel_query_gen:
> > > + * @fd: open i915/xe drm file descriptor
> > > + *
> > > + * Returns gen IP version for device @fd. For i915 devices,
> > > + * falls back to i915 graphics version lookup.
> > > + */
> > > +unsigned intel_query_gen(int fd)
> > > +{
> > > +	const struct intel_device_info *info = intel_query_device_info(fd);
> > > +
> > > +	return info ? info->graphics_ver : 0;
> > > +}
> > > +
> > > +/**
> > > + * intel_query_graphics_ver:
> > > + * @fd: open i915/xe drm file descriptor
> > > + *
> > > + * Returns graphics IP version for device @fd. For i915 devices,
> > > + * falls back to i915 graphics version lookup.
> > > + */
> > > +unsigned intel_query_graphics_ver(int fd)
> > > +{
> > > +	const struct intel_device_info *info = intel_query_device_info(fd);
> > > +
> > > +	if (!info)
> > > +		return 0;
> > > +
> > > +	return IP_VER(info->graphics_ver, info->graphics_rel);
> > > +}
> > > diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> > > index 2f6bf788a..8f3ea0ce5 100644
> > > --- a/lib/intel_chipset.h
> > > +++ b/lib/intel_chipset.h
> > > @@ -104,6 +104,9 @@ const struct intel_cmds_info
> > *intel_get_cmds_info(uint16_t devid) __attribute__(
> > >  unsigned intel_gen(uint16_t devid) __attribute__((pure));
> > >  unsigned intel_graphics_ver(uint16_t devid) __attribute__((pure));
> > >  unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
> > > +const struct intel_device_info *intel_query_device_info(int fd);
> > > +unsigned intel_query_gen(int fd);
> > > +unsigned intel_query_graphics_ver(int fd);
> > >
> > >  extern enum pch_type intel_pch;
> > >
> > > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > > index a89e0b980..3caeecf20 100644
> > > --- a/lib/xe/xe_query.c
> > > +++ b/lib/xe/xe_query.c
> > > @@ -20,6 +20,7 @@
> > >
> > >  #include "drmtest.h"
> > >  #include "ioctl_wrappers.h"
> > > +#include "igt_core.h"
> > >  #include "igt_map.h"
> > >
> > >  #include "xe_query.h"
> > > @@ -375,10 +376,28 @@ struct xe_device *xe_device_get(int fd)
> > >  	xe_dev->dev_id = xe_dev->config-
> > >info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
> > >  	xe_dev->gt_list = xe_query_gt_list_new(fd);
> > >
> > > +	memcpy(&xe_dev->info, intel_get_device_info(xe_dev->dev_id),
> > sizeof(xe_dev->info));
> > > +
> > >  	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
> > >  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> > >  		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
> > >
> > > +	/*
> > > +	* Set graphics_rel based on the main GT's ip_ver_minor. We should
> > > +	* use the hardcoded value for the none GMD_ID (ip_ver_major == 0)
> > > +	* platforms (e.g. DG2,ADL,ATSM)
> > > +	*/
> > > +	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> > > +		if (xe_dev->gt_list->gt_list[gt].type ==
> > DRM_XE_QUERY_GT_TYPE_MAIN &&
> > > +		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
> > > +			igt_debug("Setting graphics_ver to %u and graphics_rel
> > to %u\n",
> > > +				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
> > > +				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
> > > +			igt_assert(xe_dev->info.graphics_ver == xe_dev->gt_list-
> > >gt_list[gt].ip_ver_major);
> > > +			xe_dev->info.graphics_rel = xe_dev->gt_list-
> > >gt_list[gt].ip_ver_minor;
> > > +			break;
> > > +		}
> > > +
> > >  	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
> > >  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> > >  		xe_dev->tile_mask |= (1ull << xe_dev->gt_list-
> > >gt_list[gt].tile_id);
> > > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> > > index 715b64e2f..eefeb47dc 100644
> > > --- a/lib/xe/xe_query.h
> > > +++ b/lib/xe/xe_query.h
> > > @@ -74,6 +74,9 @@ struct xe_device {
> > >
> > >  	/** @dev_id: Device id of xe device */
> > >  	uint16_t dev_id;
> > > +
> > > +	/** @info: Device information for compatibility with i915 */
> > > +	struct intel_device_info info;
> > >  };
> > >
> > >  #define xe_for_each_engine(__fd, __hwe) \
> > > --
> > > 2.43.0
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
