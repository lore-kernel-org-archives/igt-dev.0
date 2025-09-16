Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152EBCAC592
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 20:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63A010E793;
	Tue, 16 Sep 2025 20:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbrsS4m0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DCA10E793
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 20:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758055069; x=1789591069;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SxsLpWGZhmg36CvDmNVUB63klkkBWMkpQ1MAOqZGCAU=;
 b=SbrsS4m0u1hvOQeD1h5RDcnUBFycyw16aXp+bJ8lqoeut+H/2wQ75J13
 vY9xDRYfXuJ875lUoPjaJT86tSnz+PxGcDQCtkVz0QIjev3+fxJ5xj7Li
 5aPpuBi2HSKwqSenQXzYmef2Qrk+UgaWK9eV4+ZWqaC/ExZUn4krOfTeL
 ZwKdp3Qy3ZDVGgNWGAbHIQlnEvVYNwqXEX69vjUYTT1tvYT8b/Y8q1Fwm
 H0MVzxZz2vwxBOojSiOJO1Y0juXE65OOpcqGOwqGZUQjZ5FqMtZjo7i8B
 Jony1N6LBRxp9RWFQgbKzOEma7WDj00+NAIW3lVOLuw5ygjyRdSh7K5PM w==;
X-CSE-ConnectionGUID: obGZTgvwToyzYx6VeYmHGQ==
X-CSE-MsgGUID: Sss/8sDVTRCSDH5ICwxLQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="77789811"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="77789811"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:37:48 -0700
X-CSE-ConnectionGUID: SgpkRoeWQ5WUO/pQiIYhUA==
X-CSE-MsgGUID: ud5QcEdASryn/8xYt+HA0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="206000831"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:37:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 13:37:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 13:37:47 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.63)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 13:37:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEPyvfweoTtuE4b3ihRnU32A5K7IJ/pLN/v22EHctud7FjUoLNoeyvkE837NmMkWAUzJ+vGujtDcmOrCK7dbGtfFkeJLZWQ3FhIMZOjdqI+db/tTNSt3bds7GWmyIvVayH0NTCW3gSmaXqidc9B33R5Wni5+/PnDHpKiLeikU+fAoff7QfSTQSXq2mmJSYuvPxwyerivzN9F4Vac8PqYmnuuwu0Gi219jloXttyiMzhSZkYCCbPHhWKh8l3JnscKLaLFR8cBzb5ftUcQsFc/ibVn/zYVA87aLnlhY9ZZh60/VGncnlZl84m83moZBU3FK9JnjX3D5Wfb7ZU9sDaVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kk/5H+T5JJoQMsud8snDReepKzi3Em8PJClLSvT6/5s=;
 b=l2Wka2RPn+SC3c62yfRj6wPs7BuDI+28gyWjestcN31JpyW7562sjAdNL6yCcptil9JbfhcAxfGROoZ8fOGrxwQrGlJow3jXYyNRM4n23ZcrVrYNh1tjTLGcGspSRghCUZMS/KSE9T/NliccpgnjsrQw6CE+NsBW9BlP9hrSnjvN+Ld5p/cpPGoax97pckndFHihqsUQ9Nj6/IQu941lyej2bbitEIvc6Cggy/HdujDSfoNyFR4DdWnlzAQ6AP0kYKNo9OWtvPsChYiyiryzlYKTgKgzBD1FsEt0B7kjtbmtPl//x8YsO3liRDPNkg7qiQi/NIJhfHBSn49r5BsVfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ2PR11MB8423.namprd11.prod.outlook.com (2603:10b6:a03:53b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 20:37:45 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 20:37:44 +0000
Date: Tue, 16 Sep 2025 16:37:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v4] test/intel/xe_pmt: Add testing for BMG crashlog
Message-ID: <aMnKlIjIYJDV3nJo@intel.com>
References: <20250904172625.1024127-2-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250904172625.1024127-2-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ2PR11MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 278104aa-18ea-4cf7-b8ca-08ddf560e375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Vn6W90tcmjqXOdHqLnd6R0WVaFXoBD8J74AKYlp+bUZY5Y5XvCm6mmc0yz?=
 =?iso-8859-1?Q?GBu/vcGizqy11iJFfr/Xdo/dQCEWYVsNdopuKR0/h1MrvamK/HtH21e37b?=
 =?iso-8859-1?Q?jc68hJB0+zKcomhocSya4tNtf9Qh7pa0/9iXaXYAW8SG/6iKIUJnFJlYaS?=
 =?iso-8859-1?Q?Vw4fYpgDTsZY1rBrqZlvC71zEfm8NSd2BCajo6WE7ttHggYsRLuwdb+c7D?=
 =?iso-8859-1?Q?q3Qu/2PFiHDWUVmkoOrn0DzGyn8uHHeXGVM1IDWivhwmuuUwbLJfWoMBB3?=
 =?iso-8859-1?Q?zAsSWE803S95BhUcfRtUK9M35i1E7UEpzu2Zne1eawpVckfSi3uQu3MQ6J?=
 =?iso-8859-1?Q?TWCnQ7keDw65JEFVM9AuO6qBwoEX35zdlBZuJJ5NyBTA6V1xNHrpOigOT/?=
 =?iso-8859-1?Q?x0k6jBKpwUQTXei5KzY/RRBZvyBouxH2lCvF8Vx87WBqLGX01tsttvS1hZ?=
 =?iso-8859-1?Q?j90IWfj/UiqzPDu08jitdD75BMMIJmXt2zaSl36Utqi0Ulj1/e3kFjH0wl?=
 =?iso-8859-1?Q?KztJMHGCRBgqbCI99YMgwOmLr5r9eo/ezi+yTVrSFwZ+SQF1vgysl2dlGq?=
 =?iso-8859-1?Q?ANGqB1PwMKPoNFpWXnYqFJMlJrSQnPeE1x4Z4N/jedXy+u+g0sKvZZ7g14?=
 =?iso-8859-1?Q?3z3KVd7QXNEIdvqCzHv2CgSd6mtRGOYcvLnKSDmIqcQR6Fwr/g7U5/Qb+w?=
 =?iso-8859-1?Q?rTE4iFQvO+m8AOirpBcMtpAEiOymW5G25/US57fy+9HCTHGu4/shGN6Ylh?=
 =?iso-8859-1?Q?STYhvLOxjpzDD7xcTFrfVdT/7QDAHLJNKV4YbjWSHvigSEbOMQYfDyZhAT?=
 =?iso-8859-1?Q?F9yIx7cikLnag2WRV0WPHag7i7kheXRcOXTHP3mjPLpp8t8RfeRytNX6qS?=
 =?iso-8859-1?Q?Nftoo2BmFG7ewG4jdPvSIa40oZyO4CZqlCzng5DkEKlA8aFFXIZQw2H5MP?=
 =?iso-8859-1?Q?UO3jB3eI1dmTa7DQNgFCtlkW5z5EzCugX4E28x9v5ErVFB7Unxi4Nhs8n5?=
 =?iso-8859-1?Q?GycHACrTuXIc4LQ5cdvyPoYETNL84t9wJQ9XCmMpygUk3kNyabVA4tI6kI?=
 =?iso-8859-1?Q?yR3kHv9Ur2iozTneULebK1PA//b3UZ2DxJH0H9S28eC+Bcxr8G9ZuhbyE8?=
 =?iso-8859-1?Q?hKQB9D/7V+0/zujg/EDML2ueniJT8m1ZTHvHNn4l1x7IK6qo/sBcjR8Cty?=
 =?iso-8859-1?Q?FV04imThnvM1naZtn+/3Q5vycwjxJOaiZO2zFTgNVTM6KpoIS8GpBt3IYZ?=
 =?iso-8859-1?Q?jPXETa2ruLWZjtliu/NhKHAcuVYu8OUV3ijmQI1iJ9SOuKztXqhNQ9ns0g?=
 =?iso-8859-1?Q?GQdSUsvpoNZrII+n7a/4ZI43zm7SLI3b6Ol6ESuBkeLhga/yCsgrv3Hjiw?=
 =?iso-8859-1?Q?HXGUWV0ghw8lTRghWV7thn/e90P46g1hYWeL4ZOEn8HfwRGJf5zg+7Axg8?=
 =?iso-8859-1?Q?yEFdfNet2J9utW6ImgZhpJmBD1iZwagkvbec69ftsRAcP3SgPIavOFGs2i?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?58HGR9d0O0oplh6FjaLUgYJj2ZcK3puJVzTvo3Ah2pFNegHYYgrTCLj83/?=
 =?iso-8859-1?Q?mAszVBFd2zBLPwje88MkoV8EspVfFs9JQvSea3mCVkxHBSdgUssOlrvn+E?=
 =?iso-8859-1?Q?3RluarF+Xn+fYYM1a8xd40WPv8Z+7+YFYBIemCqpXyf0N4qnpLhtxt57KW?=
 =?iso-8859-1?Q?UjVdvS/YXON5Sdqw2wXXmrw1xmgrhoPWMdJigq6xSaGWDruUm+xCdlHVs8?=
 =?iso-8859-1?Q?1wPJ+bDF0I+cQaw5zL3ZiRXDJEeLgwYvwi04yOfkBhcZPSs8WnKJfLtfkd?=
 =?iso-8859-1?Q?6jX3cKra6fzeDn/UZ/gwhyCUEHLAzEQanidISNkBs1IOMow8nnmxfnbD4X?=
 =?iso-8859-1?Q?xo/9M4dQ/hgPisXeKkqUXssEBsD0xgzANj0A/du4wqCI860ZfFTnY8p3BS?=
 =?iso-8859-1?Q?lz+U11a5ONxBP7EzTvPHkRJFcUODzYSf1+WdZVGqTnQjI1fJGNMapdBv63?=
 =?iso-8859-1?Q?6qTnFR7RIOrboFQpNz7TkDAJ1KgUsQvCl9BRDI8bNlETHO5iD4fRnm4D9Y?=
 =?iso-8859-1?Q?fKLFThgzdIFy1ypuuLlAr1iJpVA0h3LiDdOnj2bI3dmF+l+sVcQwRaJwiM?=
 =?iso-8859-1?Q?CWdHeybmQkfgrBNp9p8EO77RoVh7KycI+ZNlWQIwohFVq5QlICbKQSgFga?=
 =?iso-8859-1?Q?Aii/Cho2h68valNfAnBDHbuv1nw9RHEgA9mpFvuFOWKBYNv3pqBZYmBl+p?=
 =?iso-8859-1?Q?xvmI+4awzDEBv6+Ga0uKlGmi5N3KVRlawqIh+DRx4guLkaeiKK3cx+/g8b?=
 =?iso-8859-1?Q?AZH8LxliQ5uZrvqdRui40gtU065sTf046RWTi4TJKu1Ddidi5VOBlt6MbT?=
 =?iso-8859-1?Q?ej2X3M0rRJIeYVmmd0B/oejc8pTuUeA2H3gsqpgIOGIrynG6GPhSvohRUo?=
 =?iso-8859-1?Q?omIvWKO5YlopO+oq0EIGk78otzz6LZD0+9A0DBS2pVm2Tpg78XjV6UUyEX?=
 =?iso-8859-1?Q?uurJkbHmiJESUTyuMj1gSQUCS078zNFs4U37VOI6muyRwU7vUWBrdE4hTC?=
 =?iso-8859-1?Q?hP6Q/LfzEkgLj+cGae+TyZrSj30YmbciQZK4q62OO2YB1mAo1CrB+Yypth?=
 =?iso-8859-1?Q?y94V3jFNJqDcnx6G6KoU8WYVTfSfy2i3tV33vO+SH7j+6JbICoZGu46brn?=
 =?iso-8859-1?Q?Df3BCK2lP1bhqIqf0MyYHszmqMQKYiZD0uFBImcssvxCJgWbMHfZd9OWaX?=
 =?iso-8859-1?Q?dCtnJ7rHeNVLvKDiuoDv5mkx0SnBOiXzt61GnYNkryPFy5xihcN3J0Oyo6?=
 =?iso-8859-1?Q?PH7FedTcoDicrfJDyaPqNcnhH+K9yEkoGyHik8S/vwOfbRPFpbU0bSMMde?=
 =?iso-8859-1?Q?CGSBYK0mtNd/QUh2kOWy7Q1xdydNgBX9fA54gbS01Na861/SMN1beFs3hI?=
 =?iso-8859-1?Q?VNUw3cjtMU5k2XoB/DMjVeV5eXsjntygin7NGiX50y0vS/hSbEJifPZwF3?=
 =?iso-8859-1?Q?TxhgOJPxMM6AqfM7+TOBtomEmpD0xBXEz8TTw4ECFadxRQ50CllSwLF/95?=
 =?iso-8859-1?Q?2YAFgDVDphofB4LQgiLif076MgIPW+imq2Vxhwln+oVOuNW4E7NTOI/MIU?=
 =?iso-8859-1?Q?wGpQM7I40ODBRMqVuF0qaJlIk+sqPfHlKVbCuc0WNFolp4IGza+M8IKttg?=
 =?iso-8859-1?Q?i1hYFuYjXukhpgJhfDHLN9fw3u22xHM1M8p3CbHQvNNeEOKcspSEfMzA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 278104aa-18ea-4cf7-b8ca-08ddf560e375
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 20:37:44.0863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIFwfu89McKvDTVxQqKcgJGMNGVt1hEr5kVH5L/SBzD9dxT7XNdJyGMBDjIyyRx+nwKO/ofhy/eTB96UyWHndg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8423
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

On Thu, Sep 04, 2025 at 01:26:26PM -0400, Michael J. Ruhl wrote:
> Battlemage (BMG) devices have the Platform Monitoring Technology
> (PMT) crashlog feature. If the device present is a BMG, test the
> PMT API.
> 
> NOTE: the testing order is not flexible and must be done in
> the currently specified order.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
> 
> v4: address review comments
> 
>  tests/intel/xe_pmt.c | 506 +++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build    |   1 +
>  2 files changed, 507 insertions(+)
>  create mode 100644 tests/intel/xe_pmt.c
> 
> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
> new file mode 100644
> index 000000000..fe303b9bb
> --- /dev/null
> +++ b/tests/intel/xe_pmt.c
> @@ -0,0 +1,506 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: Verify Platform Monitoring Technology (PMT) files operations
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: sysfs
> + * Description: Verify that the available PMT files (crashlog and telemetry)
> + *   are created, are accessable, and respond as per design.
> + */
> +
> +#include <unistd.h>
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <string.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +#include "linux_scaffold.h"
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +/* base directory names */
> +#define VSEC_CRASHLOG_DIR "intel_vsec.crashlog."
> +#define VSEC_TELEMETRY_DIR "intel_vsec.telemetry."
> +#define CRASHLOG_DIR "crashlog"
> +#define TELEMETRY_DIR "telem"
> +
> +/* itemize the available instances for the specific device */
> +enum bmg_crashlog_instances {
> +	bmg_crashlog_punit = 0,
> +	bmg_crashlog_oobmsm,
> +	bmg_crashlog_max
> +};
> +
> +enum bmg_telemety_instances {
> +	bmg_telemetry_punit = 0,
> +	bmg_telemetry_oobmsm,
> +	bmg_telemetry_max
> +};
> +
> +static char dev_path[PATH_MAX];
> +static char work_path[PATH_MAX * 2];
> +
> +/*
> + * In most case there should be a single instance of the crashlog and telemetry
> + * directories. If DVSEC entries are not contiguos the structure will be different,
> + * and the code will need to reflect the structure.
> + */
> +static char crashlog_vsec_dir[32];
> +static char telemetry_vsec_dir[32];
> +
> +/* This needs to be specific for each supported device */
> +static char crashlog_dir[bmg_crashlog_max][32];
> +static char telemetry_dir[bmg_telemetry_max][32];
> +
> +/* telemetry file names */
> +static const char *telem = "telem";
> +
> +/* crashlog filenames and descriptors */
> +static const char *clear = "clear";
> +static const char *consumed = "consumed";
> +static const char *crashlog = "crashlog";
> +static const char *enable = "enable";
> +static const char *error = "error";
> +static const char *dev_guid = "guid";
> +static const char *rearm = "rearm";
> +static const char *trigger = "trigger";
> +
> +struct crashlog_v2_info {
> +	int clear_fd;
> +	int consumed_fd;
> +	int crashlog_fd;
> +	int enable_fd;
> +	int error_fd;
> +	int guid_fd;
> +	int rearm_fd;
> +	int trigger_fd;
> +	u_int32_t guid;
> +} bmg_info[bmg_crashlog_max];
> +
> +#define DEV_PATH_LEN 80
> +
> +/*
> + * device_sysfs_path:
> + * @fd: opened device file descriptor
> + * @path: buffer to store sysfs path to device directory
> + *
> + * Returns:
> + * On successfull path resolution sysfs path to device directory,
> + * NULL otherwise
> + */
> +static char *device_sysfs_path(int fd, char *path)
> +{
> +        char sysfs[DEV_PATH_LEN];
> +
> +        if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
> +                return NULL;
> +
> +        if (DEV_PATH_LEN <= (strlen(sysfs) + strlen("/device")))
> +                return NULL;
> +
> +        strcat(sysfs, "/device");
> +
> +        return realpath(sysfs, path);
> +}
> +
> +/*
> + * Verify the PMT directory structure
> + *
> + * BMG PMT directory structure:
> + *   device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
> + *   device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
> + *
> + * Note: different platforms could have a different pattern
> + */
> +static void test_pmt_directories(int dev_fd)
> +{
> +	struct dirent *ent;
> +	int index;
> +	DIR *dir;
> +
> +        igt_assert(device_sysfs_path(dev_fd, dev_path));
> +
> +	/* verify top level PMT directories */
> +	dir = opendir(dev_path);
> +	igt_assert_f(dir, "no directories found\n");
> +
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(VSEC_CRASHLOG_DIR, ent->d_name, sizeof(VSEC_CRASHLOG_DIR) - 1) == 0)
> +			strcpy(crashlog_vsec_dir, ent->d_name);
> +		if (strncmp(VSEC_TELEMETRY_DIR, ent->d_name, sizeof(VSEC_TELEMETRY_DIR) - 1) == 0)
> +			strcpy(telemetry_vsec_dir, ent->d_name);
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(strlen(crashlog_vsec_dir), "missing crashlog directory\n");
> +	igt_assert_f(strlen(telemetry_vsec_dir), "missing telemetry directory\n");
> +
> +	/* verify crashlog directory structure */
> +	sprintf(work_path, "%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt");
> +
> +	dir = opendir(work_path);
> +	igt_assert_f(dir, "no intel_pmt directories found\n");
> +
> +	index = 0;
> +	/* find the crashlog<x> directory instances */
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(CRASHLOG_DIR, ent->d_name, sizeof(CRASHLOG_DIR) - 1) == 0) {
> +			if (index < bmg_crashlog_max)
> +				strcpy(crashlog_dir[index], ent->d_name);
> +			index++;
> +		}
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(index == bmg_crashlog_max, "too many crashlog entries %d\n", index);
> +	for (int i = 0; i < ARRAY_SIZE(crashlog_dir); i++)
> +		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d] directory\n", i);
> +
> +	/* verify telemetry directory structure */
> +	sprintf(work_path, "%s/%s/%s", dev_path, telemetry_vsec_dir, "intel_pmt");
> +
> +	dir = opendir(work_path);
> +	igt_assert_f(dir, "no telemetry intel_pmt directories found\n");
> +
> +	index = 0;
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(TELEMETRY_DIR, ent->d_name, sizeof(TELEMETRY_DIR) - 1) == 0) {
> +			if (index < bmg_telemetry_max)
> +				strcpy(telemetry_dir[index], ent->d_name);
> +			index++;
> +		}
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(index == bmg_telemetry_max, "too many telemetry entries %d\n", index);
> +	for (int i = 0; i < ARRAY_SIZE(telemetry_dir); i++)
> +		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d] directory\n", i);
> +
> +}
> +
> +static void find_pmt_file(const char *path, const char *file)
> +{
> +	struct dirent *ent;
> +	bool found;
> +	DIR *dir;
> +
> +	dir = opendir(path);
> +	igt_assert_f(dir, "no intel_pmt directories found\n");
> +
> +	found = false;
> +	while ((ent = readdir(dir)) != NULL)
> +		if (strcmp(file, ent->d_name) == 0)
> +			found = true;
> +	closedir(dir);
> +
> +	igt_assert_f(found, "missing %s from %s\n", file, path);
> +}
> +
> +static void open_pmt_file(const char *path, const char *file, int *fd, int flags)
> +{
> +	char file_path[PATH_MAX * 2 + 1];
> +
> +	sprintf(file_path, "%s/%s", path, file);
> +
> +	*fd = open(file_path, flags);
> +	igt_assert_f(*fd > -1, "failed to open %s\n", file_path);
> +}
> +
> +/*
> + * verify that the expected telemetry file(s) are in place
> + */
> +static void test_pmt_telemetry_files(int dev_fd)
> +{
> +	int i;
> +
> +	for (i = 0; i < bmg_telemetry_max; i++) {
> +		sprintf(work_path, "%s/%s/%s/%s", dev_path, telemetry_vsec_dir,
> +			"intel_pmt", telemetry_dir[i]);
> +		find_pmt_file(work_path, telem);
> +	}
> +}
> +
> +/*
> + * verify that the expected crashlog files are in place
> + */
> +static void test_pmt_crashlog_files(int dev_fd)
> +{
> +	char buf[64] = {};
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		sprintf(work_path, "%s/%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt",
> +			crashlog_dir[i]);
> +
> +		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd, O_RDONLY);
> +		open_pmt_file(work_path, consumed, &bmg_info[i].consumed_fd, O_RDWR);
> +		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd, O_RDONLY);
> +		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd, O_RDWR);
> +		open_pmt_file(work_path, error, &bmg_info[i].error_fd, O_RDONLY);
> +		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd, O_RDONLY);
> +		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd, O_RDWR);
> +		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd, O_RDWR);
> +
> +		ret = pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
> +		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
> +		bmg_info[i].guid = strtol(buf, NULL, 16);
> +		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device %d\n", i);
> +	}
> +}
> +
> +#define ENABLE_MSG "1\n"
> +#define DISABLE_MSG "0\n"
> +
> +static bool send_msg(int fd, const char *msg, const char *file) {
> +	size_t len = strlen(msg);
> +	int ret;
> +
> +	errno = 0;
> +	ret = pwrite(fd, msg, len, 0);
> +	if (ret != len)
> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
> +			 errno);
> +
> +	return ret == len;
> +}
> +
> +static bool verify_msg(int fd, const char *msg, const char *file) {
> +	size_t len = strlen(msg);
> +	char buf[32] = {};
> +	int ret;
> +
> +	errno = 0;
> +	ret = pread(fd, buf, sizeof(buf), 0);
> +	if (ret != len)
> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret, errno);
> +
> +	return ret == len && strcmp(buf, msg) == 0;
> +}
> +
> +/*
> + * Set enable enable/disable bit and verify usage
> + */
> +static void test_pmt_crashlog_enable(int dev_fd)
> +{
> +	u_int32_t guid;
> +	int fd;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		fd = bmg_info[i].enable_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* force enable so we are in a known state */
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send enable\n", guid);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x: verify enable\n", guid);
> +
> +		/* disable */
> +		igt_assert_f(send_msg(fd, DISABLE_MSG, enable), "0x%x: send disable\n", guid);
> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, enable), "0x%x: verify disable\n", guid);
> +
> +		/* re-enable so we can do more testing */
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: re-enable\n", guid);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x: verify re-enable\n", guid);
> +	}
> +
> +}
> +
> +/*
> + * Test the clear crashlog bit. After setting the crashlog data buffer should be
> + * set to 0xdeadbeef.
> + * BMG supports writing "1" to the clear file, but writing "0" (DISABLE_MSG) to trigger
> + * file is the "standard" usage, so test that usage.
> + * This bit cannot be cleared by software (i.e. reboot required).
> + */
> +static void test_pmt_crashlog_clear(int dev_fd)
> +{
> +	char buf[64] = {};
> +	u_int32_t guid;
> +	int crashlog_fd;
> +	int trigger_fd;
> +	int clear_fd;
> +	int *val;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		clear_fd = bmg_info[i].clear_fd;
> +		crashlog_fd = bmg_info[i].crashlog_fd;
> +		trigger_fd = bmg_info[i].trigger_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* make sure the bit is clear */
> +		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x: verify clear\n", guid);
> +
> +		/* set the clear bit (0 -> trigger)*/
> +		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: send enable\n", guid);
> +
> +		/* make sure the bit is set.  sleep() to allow HW to set the bit */
> +		sleep(1);
> +		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x: clear set\n", guid);
> +
> +		len = read(crashlog_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
> +
> +		val = (int *)buf;
> +		igt_assert_f(*val == 0xdeadbeef, "0x%x: invalid clear data value: : 0x%x", guid, *val);
> +	}
> +}
> +
> +/*
> + * After a crashlog has been "consumed" (read), setting this bit can be done.
> + * Verify that it is set correctly.
> + */
> +static void test_pmt_crashlog_consumed(int dev_fd)
> +{
> +	uint32_t guid;
> +	int fd;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		fd = bmg_info[i].consumed_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* check, set, verify */
> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x: consumed clear\n", guid);
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x: set consumed\n", guid);
> +		/* sleep(1) to allow HW to set the bit */
> +		sleep(1);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x: verify consumed\n", guid);
> +	}
> +}
> +
> +/*
> + * The error bit is set when a crashlog fails in HW.  It is read only so only
> + * need to verify that it is "0".
> + */
> +static void test_pmt_crashlog_error(int dev_fd)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		guid = bmg_info[i].guid;
> +		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG, error), "0x%x: error clear\n", guid);
> +	}
> +}
> +
> +/*
> + * The rearm bit is set at cold boot.  It cannot be reset unless are real crashlog
> + * occurs (i.e. setting trigger will not change its value).  Verify that it is "1".
> + */
> +static void test_pmt_crashlog_rearm(int dev_fd)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		guid = bmg_info[i].guid;
> +		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG, rearm), "0x%x: rearm set\n", guid);
> +	}
> +}
> +
> +/*
> + * Set the manual trigger bit and make sure the data is not 0xdeadbeef
> + */
> +static void test_pmt_crashlog_trigger(int dev_fd)
> +{
> +	char buf[64] = {};
> +	u_int32_t *val;
> +	int crashlog_fd;
> +	int trigger_fd;
> +	u_int32_t guid;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		crashlog_fd = bmg_info[i].crashlog_fd;
> +		trigger_fd = bmg_info[i].trigger_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* make sure the bit is clear */
> +		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: trigger clear\n",
> +			     guid);
> +		/* set the trigger bit (1 -> trigger)*/
> +		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: set trigger\n", guid);
> +
> +		/* sleep to let the HW do its thing */
> +		sleep(1);
> +
> +		/* make sure the bit is set */
> +		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: trigger not set\n",
> +			     guid);
> +
> +		len = read(crashlog_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
> +
> +		val = (u_int32_t *)buf;
> +
> +		igt_assert_f(*val != 0xdeadbeef, "0x%x: invalid trigger value: : 0x%x", guid, *val);
> +	}
> +}
> +
> +/**
> + * SUBTEST: pmt-bmg-all
> + * Description:
> + *   Because of how the Crashlog Instances behave, these tests are ordered. Do not use them
> + *   individually unless you understand the underlying HW behavior.  Because of this behavior,
> + *   all of the test will be done in order in one step.
> + *   NOTE:
> + *     o Testing MUST be done after a cold reset
> + *     o Once crashlog is triggered the device behavior is undefined and requires a cold reset

hmm I thought a cold reset would be needed if we want another crashlog, not
to be able to continuously using the machine.

The CI seems clean on BMG where this test was run and passed. But I'm afraid with this statement.

Perhaps we should get CI team to provide some kind of flag in cases like this restart after
test?

Cc: Kamil Konieczny  <kamil.konieczny@linux.intel.com>

> + *
> + *  Test category: functionality test
> + */
> +static void test_pmt_bmg(int fd)
> +{
> +	test_pmt_directories(fd);
> +	test_pmt_telemetry_files(fd);
> +	test_pmt_crashlog_files(fd);
> +	test_pmt_crashlog_error(fd);
> +	test_pmt_crashlog_enable(fd);
> +	test_pmt_crashlog_rearm(fd);
> +	test_pmt_crashlog_trigger(fd);
> +	test_pmt_crashlog_consumed(fd);
> +	test_pmt_crashlog_clear(fd);
> +}
> +
> +igt_main
> +{
> +	const struct {
> +		const char *name;
> +		void (*func)(int);
> +	} funcs[] = {
> +		{ "pmt-bmg-all", test_pmt_bmg },
> +		{ }
> +	}, *f;
> +	int dev_fd;
> +
> +	igt_fixture {
> +		uint16_t dev_id;
> +
> +		dev_fd = drm_open_driver(DRIVER_XE);
> +		dev_id = intel_get_drm_devid(dev_fd);
> +		igt_require_f(IS_BATTLEMAGE(dev_id), "PMT supported on BMG GPU\n");
> +	}
> +
> +	for (f = funcs; f->name; f++) {
> +		igt_subtest_f("%s", f->name)
> +			f->func(dev_fd);
> +	}
> +
> +	igt_fixture
> +		drm_close_driver(dev_fd);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c01c64e9..46d36962e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -318,6 +318,7 @@ intel_xe_progs = [
>  	'xe_peer2peer',
>  	'xe_pm',
>  	'xe_pm_residency',
> +	'xe_pmt',
>  	'xe_pmu',
>  	'xe_prime_self_import',
>  	'xe_pxp',
> -- 
> 2.50.1
> 
