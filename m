Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033C7C4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 17:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B23010EFAF;
	Wed,  7 Feb 2024 17:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFZW9ANy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF28110EF99
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 17:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707326818; x=1738862818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=btvXzHPflbhaIEMllqybySPelJ5F3ewzfc6yBziK1CA=;
 b=fFZW9ANyUUlEgYUiN1fBed3XFeas6AfrdDQj90lTmwLVwC971RkauB5W
 Sw/lrDkeLKgNPbcyeIot+zOTYkRtu+JlGmREMJDlfS4MReOO9jz898sh1
 qCyfipP8ZAMfH6pCsn/TFW5kILGV9Gh9FjkFnG2hwhAjP+py/TDklbC4n
 1+v2AV0jwNnmOw4SYUkBbEoPBThALZDD8ts6TLKpKci/HgusrsXN6op+S
 X3ZUH38lKzi1I8CWvK7Q7sUizHx56KC6Wg9ZYdlFvcFCrJw+Bb5j2+DLF
 DEbN5rRbmsV1vymDKj/RLqDTH3gv3gtlotJ0p3J8fBaSGkri2SIv6vyxA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="918127"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="918127"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 09:26:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="32470852"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 09:26:57 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 09:26:56 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 09:26:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 09:26:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 09:26:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6qrX1NOnfX/JQWcKPxmarEdPhd/uuaPwdqt/9wtZxIqmBk1qeqDN7pQgzsqCuFbTqutiTKworBobEwe8YFA1wQtoGSkOpIJI5BTea36eEV5Py+UzwOPkLd771qByBGP7Y4Gx/pPavgvvHwT9zIxT0KbckMDrhejqMua9iMNRbTyi4rG+DsODi2WAGGpsOr82Nelqo+NWftXsUNqvvex50QcB3UCgxESqbMswsFXY2Pv4ebyV+Lyw/qecP9wUJzDu7yW5Hm4nVznH/vmOGlJXUQjzSpRZkZz42vrKIqdjGZwBRQpuhv01jKf0N4So5OvBbDf9HklE/l1/HNr/uKm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btvXzHPflbhaIEMllqybySPelJ5F3ewzfc6yBziK1CA=;
 b=GDEYHCN8tdu3oVP4CICi87hHr20+yh8RyXTKVKPXf92qgdAmMyVGX2dZFGLO/NBFowauqNn7L/Sgp0S7FsbCoXwe8vzPdg6KTBdSZEFZlQiw2Jr8OqIuxo61o5nH3zOf9k0aOXREDfNRn+rigMj5F6Hd6KmYInqFh4u1fP44ZFllBV367JmgXduod5DMUxtSDgilXFfLWkBXj7ur9eAIQxtZdLhK5XGxXwR0tO537X0fP93sVvYJyLx+laTqwctGdUR184JnPb/e+bIX7kW0c8B/EsoJFh1XXDi9E+zgvcg7oIyD0g0goaII/nMUXpNciWqNUlONkLtBaQyJ8j1dhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4916.namprd11.prod.outlook.com (2603:10b6:303:9c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 17:26:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Wed, 7 Feb 2024
 17:26:55 +0000
Date: Wed, 7 Feb 2024 11:26:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: Re: [PATCH i-g-t 2/2] xe_live_ktest: Use xe_live_test kernel
 module
Message-ID: <mfqfe7r6n26cfdbkv2vvyk5oe5ba36jdublmscyuyvwyhqpkdx@jd3nqwyzh634>
References: <20240202004529.552806-1-lucas.demarchi@intel.com>
 <20240202004529.552806-3-lucas.demarchi@intel.com>
 <1760950.X513TT2pbd@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <1760950.X513TT2pbd@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4916:EE_
X-MS-Office365-Filtering-Correlation-Id: 839937c1-a147-4c12-346a-08dc2801fadc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IqT3uTumNLy2SH50xaazzk2PwlGBHQCh0o3ZNbN6k1u5DEk1m8eK1Ddpqaz+Djxai8xlDE5VgFpFRNWb22Ry79S4KOsTc2qyOJIfKE05+gQ9SzDjIDYTKB+Zo5aERuuxI7KkxDv6xyypLoIYVaXqKzfzkb5j9szfjc3P6F+cerVNh3KU07dpUhUK2fvY8nrCia5FqKw6SUc0GQdzEy0aB2jKkWWpHk2Ix8IpFZEKQ0hZOUs5otFWPJJtePdmwePpOOi9YabNhkOznV9Jcv3ox+WTi7TrOuAkIqDOSifu8AorFueT/DVOBnndcZEWyNPuZQc47GjB5bhj9L9BTyPeH5jYEsG4TTM2UOiBw/0+ma9G0LWRv9aG+5sDVkSWve6lLaXyS+Wcjgf/DRk3OgJ7r6FqycYfboZ36PG0nOa1srlwbKcfdlQO9onH029mHFM5HT2BRrQDnc+qxAkAFY1ccuQrC/MsoNcDoumFjZ8WTO1gzKNFeWhbyrc+guM2SDUiNuC1KnB09xLyTBWO69QGmCLq0PQiSAsvIVQafesC4rxUwxipb9SR0Xd3RUlSpR2469S76jhClh3WL322cJN/cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(396003)(376002)(346002)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(66556008)(54906003)(6916009)(66946007)(316002)(66476007)(2906002)(5660300002)(8676002)(33716001)(8936002)(4326008)(82960400001)(6506007)(38100700002)(6512007)(9686003)(478600001)(6486002)(966005)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6geRpsR9FQa9bh8V3wCCkpFGlR54+50yjPwqwoyWxAj7xYV16pespCb+9Bmr?=
 =?us-ascii?Q?srHt62xNC8eOlFUdbpKAP2kuyjQwnx5ycnJ1MwAAC3jzqIUsxhSYxV0ErHvF?=
 =?us-ascii?Q?j5OJUTVyLEjqDxt1ILNLeByM1QGkZ+XMgWI1boRcwhKg3uMUf4ZUCmeCwdyq?=
 =?us-ascii?Q?nORRTJHXo5P4wXLp1WEGJveembFBCr2Ncd6kphyzZZ1b0N1mk0OTTlmUTKg+?=
 =?us-ascii?Q?RkuiVHyVnrtQd8TiMvhNd3gVRc1hIKO1mF4h4lpBJCcIp5A9I/7HsCfJ9eBL?=
 =?us-ascii?Q?JAoOOmpYQ4KuZlU5qauPW8vQoY2H2D44h9RSHnm3vVE7OwUG+09SdPPw1vlJ?=
 =?us-ascii?Q?B1InPilvYH2THuBeF/bl5WWvH7SySOmYxipuSyPcD8NFNrV0L57tiAExEQQK?=
 =?us-ascii?Q?lUxvHPQe2zcHIJjTSGNHVZacYb1FisMSosziBA/I20YsBiqeXe5UN8rrC/+2?=
 =?us-ascii?Q?N1l5ir7664+7svtsqGGiPG12XNb4hxefTnMlq8nHvNs3n7JdXKN2R5kJEBje?=
 =?us-ascii?Q?7q5ovbdf51J4JhDF4J6fWBr380xIYr5EcG6R7GEmoF4ex59e1qQ2YonOMhTy?=
 =?us-ascii?Q?+vSm+LnC6SIn6iC5iT0PHaOZFEQkPvv/ndNcz+duLrwftbj9e2nRCTqUzaZM?=
 =?us-ascii?Q?N7CmbgABkONLXRjX/zCddj5zZlacEout5zBMs1Eg41YELwRQLvQ0Ruk9Qdrk?=
 =?us-ascii?Q?tiXZl2O7KS0CY5R7YQGV7pyBR4l6tc42yoVvm7S6AfoTeSi/3SAhLLu09287?=
 =?us-ascii?Q?ftHv1BkTr7GzHow3a49g/xK1/58upji0y1OxL57zDf5onQ1/3UoJYLgAwudS?=
 =?us-ascii?Q?AkilDb/RYZjEwjtHWpEqsZm9PswOXZaZOKoDs/zuUfbZzElf0GADRKYPrVT3?=
 =?us-ascii?Q?w1lpE+mTjS4MxI7PTfT2jCgBnaSk7h1IKiycElbhqebHGHBh9SvJVuIG/+Is?=
 =?us-ascii?Q?btXLI7YO8sGY/1FwXUpOQ+vM0tZKU+e9J7hjqNGQbG77TjZAMkP1iDNDDEGL?=
 =?us-ascii?Q?0ZvcN0FRcDJ6C+mztOjwbUq6DTowOJ6iwDppLrLEApe4PEXF8X1BHb/zolxJ?=
 =?us-ascii?Q?jf0cZ5KA3hMqK/01qVbwQeTP1gzYwgxEHaGuyA01mdMxdhUVNSwswotXzp7P?=
 =?us-ascii?Q?Ag7f6yNpp9QzK+sbD1w4Vv/9TSctAwN2CLYXjBx0tjWdX8xk6YC3lQAQ8lW0?=
 =?us-ascii?Q?swnHLg2yVHfavPnJs616DZJtYa8myFUUrnCa7QdobQyMqY4gqJn03+AiMa58?=
 =?us-ascii?Q?W5HqJ/4H3wsmt/mc+/jHyeyd+3vr3afUggHV4FomcNVz5tSPABSiPXi2O7z/?=
 =?us-ascii?Q?cgooVV0A/IoYEWEW6nqB9PBUBrQp818DOK/wNkH5Z5HT9orSjzYaRLMA1O8Z?=
 =?us-ascii?Q?MinrgxsN3zen+NhaYhnP0a8aiP6o0lwBrqZweO/5b3PK2cm6TMZ1YN7PATq8?=
 =?us-ascii?Q?EanUBlAlmnhq32Gjotn5t01qJZeaUYk1szXN75E8g9ZGUKgex0+hYeCyQKCI?=
 =?us-ascii?Q?+mtOZ1kln1FrA2J8f2NabjSMfi+ox510gbHmaUYO+j9KP4QGnplWp09KAWZe?=
 =?us-ascii?Q?YQD+5POyWAdHxmd1OhagDUrZMjq07qkcBS9STuVh+ueLoP07XDJJVfII5Vg4?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 839937c1-a147-4c12-346a-08dc2801fadc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 17:26:55.1133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hPyr//39U51RjfuGKPW56eo0UiDUyeDz/w4lSZb58wQM68dDXPN+yK08FquXEc9SMNMVGY7pA/phExAHomoEhE7WjxRuVGoDWktufsQgGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4916
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

On Wed, Feb 07, 2024 at 12:27:48PM +0100, Janusz Krzysztofik wrote:
>On Friday, 2 February 2024 01:45:29 CET Lucas De Marchi wrote:
>> https://patchwork.freedesktop.org/series/126786/ groups all the live
>> tests into a single kernel module. Use that module to run any of the
>> tests triggered by igt.
>>
>> To make the live kunit tests work, rename the subtests so they match
>> what the kernel uses.
>
>There was some discussion on this patch on today's XE IGT status meeting, and
>the conclusion was: can we have these split into two patches, one for subtest
>renaming, and one for switching to single module?

that would break the test. Wouldn't it make more sense to squash the
subtest rename in your series since it's changing the logic
for filtering (https://lore.kernel.org/igt-dev/2202702.NgBsaNRSFp@jkrzyszt-mobl2.ger.corp.intel.com/)

If we squash the subtest renaming there and leave the module rename
here, then we don't break anything (although this part here needs to
land with the kernel side too).

Lucas De Marchi
