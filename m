Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F44C4345F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 13:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEB210FEC8;
	Fri,  3 May 2024 13:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilZ0GRW/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB44210FEC8
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 13:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714741677; x=1746277677;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yGi/MQ2f65zXcANKrFhKw71P/2iKMJfsD8mlw18SLbk=;
 b=ilZ0GRW/Xo7y2mu62cchnmToU8vpg6mkz/5sMsoLvewNXRZ7E1v8TAZY
 hpqQJdtCopRA06ZkiZ12v6NMnTirIC+1j05colndBCVnzP7DxtIGNkCDd
 eF5fCVa7Wftx0ZLgEB04rmeiwYCx/NIdlpl397fcmHwUNy347GliNpYDw
 F/rKXrxrlzxsMwhCzB89lDS+M6TsOjQ4gsjwMBeGkmIKeY3CBmJR29w7T
 52OMwCa2FprLWpNBMm/7hfyscH/4BAgsmWgvVvfRW7+gqN5nZk7qOgRHV
 JuYCEXFPVYKmy6W6psDF9epPj55ZQk1mpWry0Jo+yzzT9zzdK6lw8G5N5 Q==;
X-CSE-ConnectionGUID: d7LfOGlQTjiIdI+90YxwnA==
X-CSE-MsgGUID: uiU+d51HSB+1uo6qn9OW9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10674870"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10674870"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:07:57 -0700
X-CSE-ConnectionGUID: 8ppwkWUIQnimDP584DZ9xQ==
X-CSE-MsgGUID: tBKnpMZERkGRaMr8HyR10w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="32063914"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 06:07:57 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 06:07:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 06:07:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 06:07:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuNXFDXyNDqGyqLYRCMpq+dY0Q69qIee8S+fawUMFCFSRU5VrTzTgggZNA7tZ3DUYsD8PVB1kaEXBQYFHZ1FbL+TN98o5wb4SIxMWLbR90hUq5jQadqE0V3T3QSsRlrlhRkUXE4RukDtOUDJNvH2LE6cAt+9lp/ilfK4Gpxqsx+8atz/aqzQE1lqfbrTpN3FLivKl3osrZvFFaPaRpvZuA28kjabEOVYW6iUWhUeL96ka2Bv8PG/M9zmYkM3mBcK19uLyyk/ODipzHXpVcbtSIlqrZ72m+bXvZeORH/PDVhmaw+to30ECwNgJZYj/s+w7ZwAR/CmnG3LoTYKIKHHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzbcGffUipPjP/twZeClA5Z98etPFyMmqjanHE4Pfj4=;
 b=OfN95h3Sw6rF+TjIvI6j7Um30asY/O+YPQ3PfZkQkBxURq4bQp0nCxtA+SRte9Ol2z71w1FEKqexiP1IUcSS8bUif57cwkAEmxPvMbfEutdXgFDUO5N6p4miFZFC1bjyy6fI3mxGBzJFkg+dq8308wGOAIAggRKTf4xUS3n4D8wkIUcDgDzj3rsmgipl2MX2LXoeKt65arjGReqhoca3/WS4wBIR6MkQT3kNeDuZXDugyJddchKRXXEhIsiC4cNm1jCHLqgEi804MgNVHNkmlDrVfRL4fZIqk/2oXIRpZrZYVpyyalysIBFKLS1Sm7Ee1ECKCDRQ/yJB79JNTkxvmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6178.namprd11.prod.outlook.com (2603:10b6:a03:45b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Fri, 3 May
 2024 13:07:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 13:07:46 +0000
Date: Fri, 3 May 2024 08:07:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <igt-dev@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH] lib/igt_drm_clients: lazy stat process
Message-ID: <gz3jrzek5zgu25happzhneli2bl5pal75cmfsgrcy5n7j5uzyv@7yl7vvvafbpa>
References: <20240501174001.121324-1-lucas.demarchi@intel.com>
 <238aa521-ba0d-47a7-aba5-67b88d75c758@ursulin.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <238aa521-ba0d-47a7-aba5-67b88d75c758@ursulin.net>
X-ClientProxiedBy: MW4PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:303:16d::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: a3920a76-fb30-4c0e-dfdc-08dc6b7206f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5nabs3aOXzS3e9TUj7Fjvga2rXSZrcMvvICgCNkU/mQ4W/bg5/oLROuTeG1S?=
 =?us-ascii?Q?VSNtaEwjPMOuzT9CGaH0I44Ez+lUnvqERDrhvVGIs+X+GIdowrdLn121r/yb?=
 =?us-ascii?Q?F+FviyHmJ+hOJPOviuONEMJmvwkyiPVhJMRe8C/ihWFzbd3zgpEq89EY7cx4?=
 =?us-ascii?Q?sZ7mFCp9goUEYKxkHo047ho2u/a6PLiMM4Xwc+KfuYKjfHy+LpFsQqpLZ+2r?=
 =?us-ascii?Q?X0Z/Gy4P4KHRkRYtcqBFGthSwn43YyqMqjm+H8wPism6UZlEXsADuR8p5TFo?=
 =?us-ascii?Q?jupXFGTjFd/qLo5n1BAdEGYs+t2CxWSmcpWdBzKwmIp6SxoI8MZnmULpuhpg?=
 =?us-ascii?Q?Pn1jGWLjitSY71Idz2jVtdGVrnb7Py03xOmUIbAq6C2kUmVlpicnnma08ToF?=
 =?us-ascii?Q?tUPJUZQ9GVjBaoX5nHsHbd+VPgbqG7lyG5Gfs3fqB1Ftg0ixOePykiJ0mWM5?=
 =?us-ascii?Q?aRzM8x9GYZlK37VKIArm/mCf4ngkD7l/LVwmHJSUqzcf79l9UK7rlr68+8A1?=
 =?us-ascii?Q?Lc7CxDjfPvNnWBRUghOXXs9euIx904GhzMM1gGVW6IoIabqK7+WsGr8oYrES?=
 =?us-ascii?Q?AtP3AUCiTBJo5bvMxIla1ZkKRM+q/ZRWLKP3ViQtSnzqc4PK4vR5WbapSVjC?=
 =?us-ascii?Q?fO1+W61Xv6NgyUVjpBhiRCg/S6Z0Dyw28EN4lYMBbyP/arCUWsFjwHSLMvlt?=
 =?us-ascii?Q?P4pJ+ptmMyfJ8dvf98rwmL6dsK2v9iP/vbIplCT1/cb7m7hlAo/5iLr6K2hg?=
 =?us-ascii?Q?sG4BdbFAAVEJFYDNxyV5XQWs3z4L5yOLnFfmKgpGGPNtKsXELnmZZCn/T6Fy?=
 =?us-ascii?Q?P66PwuhSKSayRuPUX8uGXRgCVEOaufgsL1YSCn3m9JrRBOpNuwCF1i6YFRCb?=
 =?us-ascii?Q?EXb4nrbVYTsqhfGzuqmydEX6qYDqkbXoFudMlXA0LR2U1C6kgSS9gX91G+kB?=
 =?us-ascii?Q?ym1t91A/DRtVRIAxdxnKHOnRcUfuOVXSZHimHkBL0BUFkYCBsSRasTqyBZBW?=
 =?us-ascii?Q?HOBXtIdg9zA2sotAu/KY4bUQx/Uv6cxi3xKi6OJTIgoJxuaFgdsSYhjyiY4/?=
 =?us-ascii?Q?d8WgDL8bqFwEOej0YX1wKc4jyEkw3XPuYjvJjYnifuoujWFmHv0EyZ+/WNsx?=
 =?us-ascii?Q?qMX9AlVU4KZUn3LxYuoSLDahPJwKkwMDQYiCtFEMbmLn2oqEuIfAP7Vo7yvE?=
 =?us-ascii?Q?Kf5UPVp95T1xx+dzYBf4jLmiRKA7q6IVxzRyupvfiZOYFJ2vWdKnDyD9GaY?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b0CBiOI+603HXLo21q8nPjhTyyMXFazr9SmveOXsi+FX/mcl1ovxfUuFsF6K?=
 =?us-ascii?Q?2lpKqefbKx+CX62mfGI36PmG7neu6mk3h6vsT0iqO+mQpeDO7q6nf4m7HuWs?=
 =?us-ascii?Q?EW0HcTjUPIOSTiFkjeTJJTSY4zwBuqBmE4KCBPRFob3vDFdP91a4Q30l7oVj?=
 =?us-ascii?Q?qut/rn0e/vFZ4W55O3M46iwxfobZeH2jJT+PIDJ9YsiYcG2RXzL8cvX06lN5?=
 =?us-ascii?Q?yMOSzANNvX0u8KUAJ07HjF81DYInaiImBlSOGfiOa97xju2ZED1BNq981B3+?=
 =?us-ascii?Q?anj/m7jJIJEMktvGaaMwp3OFZJoQ4xqCTbqY6993oyVYDdnWHZ/HUPjpUbjA?=
 =?us-ascii?Q?p/rfNewmRtcfBZfrYRgQnGQY/y/5fAY5edFj3NT0a8Z1+C0gjxSwSSXS97mG?=
 =?us-ascii?Q?mKtplb96kC6NNo4OUoUkQunORqqoJhuoGdQJWZWUAKXLfbNYHynOBqQGy4lW?=
 =?us-ascii?Q?tpGs1S6Q70Cgns0AwIs1hR+J8wHIYz9zs8OfPJcSVpXg5FFRf9uRsPTeZuLS?=
 =?us-ascii?Q?GrxljTPF34gGui7dKZjuDv77/7y+AViv+Y0oEDxLwUBtQ4WOm+lwvyXlPgHr?=
 =?us-ascii?Q?TQuWyFqxgf4BfipWz6eSPNg9zbOE8AYwsvYB8YCezrH89EjwxUTpqoGDKl2M?=
 =?us-ascii?Q?ImrjJ9hIoyYW0O87LssjVkgY3v8r64Gu/LZNEsnW4RIFkyoFUDIaQafeVenU?=
 =?us-ascii?Q?L+VEXWbzNFAIm3YFmiOrpoHzUv+q3v0pbF+CESt7GrnIcgQ7g5AEkzBnwfi/?=
 =?us-ascii?Q?TJRDB/1EqN+u6DwdtJbZs8y5r5NHb8SdIhkg7amMMysCB94aTdmZJm9XD9bf?=
 =?us-ascii?Q?3JZ3gV3tguY+lhDN8FzQOYzVrT4mGSmY658MBmdqf3ek/rMrpI/c3pUoFCfM?=
 =?us-ascii?Q?u8VOUP/QBFUHtJrlLti+IXW3YItuQMmjRzxF8a31aFN/ciAWIkEEky7l1ZE5?=
 =?us-ascii?Q?EgwW/Rsd5q9gqFs7BKd2hqcoDBV96PXixWJv6Cj9N6INHUoCukME1jCUzrLL?=
 =?us-ascii?Q?Cwl41Xl2A2JgA7fDaHX5Ax0y2uB10hJIWMapnJnavDjn8oVsLybwVTE2lsOV?=
 =?us-ascii?Q?C7XtjpYZeAXdoSKbRR+BJsPNAy7DXjztBmthjFqOekhT7MmSf7WQwM5lB2J+?=
 =?us-ascii?Q?cHAX128tenPB+hILtDsC+jbYZ678ijNtGU3rmc5J0I50CrW6Ad6PKfoHM0iy?=
 =?us-ascii?Q?xX6LUdpP9VjXTsHAfvqWIOOYlnZd4mU+8WccssjppKM/ZEqBFYVU9FI0fdKX?=
 =?us-ascii?Q?67dd5qcCitgEOuAuuh2lvhnBUaOwYfRL20rTYYyGFOsm0r+8gHayw+P0tisY?=
 =?us-ascii?Q?zone78LusXtJpx8f4aISnoh4+wKEqQWK3KEXxDXVAyGqjiLpO+JgPgV0f4+i?=
 =?us-ascii?Q?PRNVuiogRxKpVyKJOydKVz648No98Wgqwmn2KH6AHCP+SvFC5uHpeDk2mdUR?=
 =?us-ascii?Q?mQOZOkyXxOuc8MUSVYGdA2EcPGtjTgTr1AnnIVHlCWQrbyfOv5EdtICqwQgR?=
 =?us-ascii?Q?sJ3Fvg8mR9ormgx30waqo/Nu58PefxY6Zr+CMDB2VtW2xldAtFM023hiUfPe?=
 =?us-ascii?Q?x3Djbug7P+jJqCmK46cFUgpkDaFXHmNt7LsuyzMRaJgup+GRvLkf9yxSHh2N?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3920a76-fb30-4c0e-dfdc-08dc6b7206f3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 13:07:46.8772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjHWcr+A3gt9kKGImjk+0yp3lj1CgUwz8c4G7Oh1InhAiedi2puypKmPY2Ihr51ydWq17L7FC3CYzrr/fxL5qoCNVQG06Q7/b/W0MOK8WnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6178
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

On Thu, May 02, 2024 at 11:20:48AM GMT, Tvrtko Ursulin wrote:
>
>On 01/05/2024 18:38, Lucas De Marchi wrote:
>>Only try to get task data like pid and name when that is required.
>>Typically most of the processes in a system don't have a drm fd open.
>>So only open and use /proc/<pid>/stat when it's needed.
>>
>>For the data below, system is running with just a single drm client:
>>
>>Before:
>>  Performance counter stats for './build/tools/gputop -d 0.1 -n 10':
>>
>>             507.19 msec task-clock                       #    0.334 CPUs utilized
>>                 29      context-switches                 #   57.178 /sec
>>                  4      cpu-migrations                   #    7.887 /sec
>>                 75      page-faults                      #  147.874 /sec
>>        (...)
>>        1.518253637 seconds time elapsed
>>        0.007989000 seconds user
>>        0.503351000 seconds sys
>>
>>After:
>>  Performance counter stats for './build/tools/gputop -d 0.1 -n 10':
>>
>>             384.01 msec task-clock                       #    0.275 CPUs utilized
>>                 17      context-switches                 #   44.270 /sec
>>                  1      cpu-migrations                   #    2.604 /sec
>>                 74      page-faults                      #  192.705 /sec
>>        (...)
>>        1.397640800 seconds time elapsed
>>        0.008106000 seconds user
>>        0.385048000 seconds sys
>>
>>Looking only at the execution time of igt_drm_clients_scan() over 10
>>runs.
>>Before: 47138890 nsec
>>After:  33978388 nsec
>>
>>So in both methods it shows a ~25% speedup. It is expected that in a
>>system with more clients this won't be as high.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>
>>Extracted as is from https://patchwork.freedesktop.org/series/132059/ as
>>not really related.
>>
>>  lib/igt_drm_clients.c | 50 +++++++++++++++++++++----------------------
>>  1 file changed, 25 insertions(+), 25 deletions(-)
>>
>>diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
>>index 40d494441..ab0c2cec2 100644
>>--- a/lib/igt_drm_clients.c
>>+++ b/lib/igt_drm_clients.c
>>@@ -368,26 +368,33 @@ static size_t readat2buf(int at, const char *name, char *buf, const size_t sz)
>>  	}
>>  }
>>-static bool get_task_name(const char *buffer, char *out, unsigned long sz)
>>+static void get_task_data(int pid_dir, unsigned int *pid, char *task, size_t tasksz)
>>  {
>>-	char *s = index(buffer, '(');
>>-	char *e = rindex(buffer, ')');
>>-	unsigned int len;
>>+	char buf[4096];
>>+	char *s, *e;
>>+	size_t len;
>>+	if (!readat2buf(pid_dir, "stat", buf, sizeof(buf)))
>>+		return;
>>+
>>+	s = strchr(buf, '(');
>>+	e = strchr(s, ')');
>>  	if (!s || !e)
>>-		return false;
>>-	assert(e >= s);
>>+		return;
>>  	len = e - ++s;
>>-	if(!len || (len + 1) >= sz)
>>-		return false;
>>+	if (!len)
>>+		return;
>>-	strncpy(out, s, len);
>>-	out[len] = 0;
>>+	if (len + 1 > tasksz)
>>+		len = tasksz - 1;
>>-	return true;
>>+	strncpy(task, s, len);
>>+	task[len] = 0;
>>+	*pid = atoi(buf);
>>  }
>>+
>>  static bool is_drm_fd(int fd_dir, const char *name, unsigned int *minor)
>>  {
>>  	struct stat stat;
>>@@ -481,13 +488,11 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
>>  		return clients;
>>  	while ((proc_dent = readdir(proc_dir)) != NULL) {
>>-		unsigned int client_pid, minor = 0;
>>+		unsigned int client_pid = 0, minor = 0;
>>  		int pid_dir = -1, fd_dir = -1;
>>  		struct dirent *fdinfo_dent;
>>  		char client_name[64] = { };
>>  		DIR *fdinfo_dir = NULL;
>>-		char buf[4096];
>>-		size_t count;
>>  		if (proc_dent->d_type != DT_DIR)
>>  			continue;
>>@@ -499,17 +504,6 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
>>  		if (pid_dir < 0)
>>  			continue;
>>-		count = readat2buf(pid_dir, "stat", buf, sizeof(buf));
>>-		if (!count)
>>-			goto next;
>>-
>>-		client_pid = atoi(buf);
>>-		if (!client_pid)
>>-			goto next;
>>-
>>-		if (!get_task_name(buf, client_name, sizeof(client_name)))
>>-			goto next;
>>-
>>  		fd_dir = openat(pid_dir, "fd", O_DIRECTORY | O_RDONLY);
>>  		if (fd_dir < 0)
>>  			goto next;
>>@@ -542,6 +536,12 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
>>  						 minor, info.id))
>>  				continue; /* Skip duplicate fds. */
>>+			if (!client_pid) {
>>+				get_task_data(pid_dir, &client_pid, client_name,
>>+					      sizeof(client_name));
>>+				assert(client_pid > 0);
>>+			}
>>+
>>  			c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_PROBE,
>>  						 minor, info.id);
>>  			if (!c)
>
>Nice improvement and well spotted!
>
>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

applied, thanks

Lucas De Marchi
