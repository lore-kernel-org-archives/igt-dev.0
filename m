Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01789CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 17:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97FE10E87C;
	Wed,  8 Oct 2025 17:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKvTlTWe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1568210E87C
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 17:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759944530; x=1791480530;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mKKbGhqJcVVmAvBPCbeeGAt8nUs8Sjd0gQvyfNxgsBY=;
 b=kKvTlTWep9kBksR45K6PfJCUD17HdGbjCda/LHzOj6JYknH1HYLLUUGq
 gJ8C3W4TuSDmg9OR2CX7xOR5mR3D9GEFkRDhEvzZKtbcF0BIn5cAK/ZnX
 5+s89QIZMSgCvYiBNOgCXmCn47K8X67iywjLCGoK7G8KIfSu/71438eoJ
 cYY0hderAQrgcQraZ0WvSwT5mNk0tUBBk2Pj/5caaeRY4rwdSETMqihti
 6MVmPzi89MVyZv6YnCRDsIST6si988zNt2uoex066CV8lZRZ3VXU7qZ9F
 mz6DGUQ9XFuy0v5iR2nto9qmkL9ZGOXSMEuBSI69LyPjRt/iQtKZN7u7s A==;
X-CSE-ConnectionGUID: 5LhYeTtBRySU2Ar6GtVgnA==
X-CSE-MsgGUID: R1+9GOrISkWdF0yyygBjmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62051136"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="62051136"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 10:28:50 -0700
X-CSE-ConnectionGUID: 3jqxKBW3TXmT0uIyfq1yaQ==
X-CSE-MsgGUID: HaHeeHiERmOFlGQH/3Il9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="181263209"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 10:28:49 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 10:28:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 10:28:49 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.34)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 10:28:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHYDdZwPz2BQc6sm74D70D9VYD8ycL1K5zIPhAvcWGWwL9cyjIHnRRZaHmyfqTWrA81QTXAI185rpPEdGPTzg9IrkQSUW4EEB8JMqRiFLczOmX4XKP+6+KcC9sMunap8WL8BkRI54VdLJMuzjnBHzQkWQqzNVLmIwXCDBp9Em96B1RpOxFsy6nXG1wok2Yq/AFn97ZKRz7TNSDstD6bc+brk5WIPiT3e7l+ek7WswCWkHnYf3k5ZhLm3kcAq/NiUohHYE4WFZ8NCiE2tNPzV1LVGTSVC/w7oFA5+H8TxeHy5PrINbnXaL6a1O8zR52RYY2yDeaYtL1SGDWC7tfCdng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y28QU/6xjihtL6IibF2gFbne3cxzvediraQpNQpzVAw=;
 b=Zx6nxePYlJV6qkyD00RBllRiQWI3gnkhfxUBgycDwr8Irmp5sqUJvXYJ1MdsxMySH+/Kwlx+YZ+wz9aWHZpZ/yMLBGrqdAClM4vGLW+myQHziJQ2pILjXWA0vKR9dp1Kv0Iqz1kmAKafg27HM2OH8QAf8Z+eSztlHnc8XWdP0IVJXsckO898Yqyk/uJFWqyA3dpGlQhKNxwRUcaFfHEaSit8IoaltmhenDQ1noEanpKA3TBEJUBwIHi9/J1+xM43PK5JcLCgn6ciIWAGBpeq7aBR3NLG22r/z3v3BMMH9YqDsmr2N8hJ9Tu7nwo+Gm0q3usASFGUMI+MLLxjBZCMqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB6004.namprd11.prod.outlook.com (2603:10b6:208:390::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 17:28:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 17:28:42 +0000
Date: Wed, 8 Oct 2025 10:28:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t] intel-ci: Block one Xe subtest
Message-ID: <aOafR6iI6Qr8ch/q@lstrano-desk.jf.intel.com>
References: <20251008172635.100091-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251008172635.100091-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0260.namprd04.prod.outlook.com
 (2603:10b6:303:88::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: af506bd2-18e7-4c21-9657-08de06902099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KfnEEGkrGGVws9GrfW3VtfYHeSPj4UH6ZYQgCkJvej+cR+rS8i9zbUWpVfWt?=
 =?us-ascii?Q?DQHHOmQjqdisPeKfvrnbgOZeakFqMCKgYb/GAC8vRSOq62jKQkZSvmwFPAj5?=
 =?us-ascii?Q?qHzobx/XNte+s1xrelzxmnxq8cQFWLgv4nWEFXLNVy5DfBPJ25o7d6XKG8LF?=
 =?us-ascii?Q?BL9D9P9mCUKxOYmEeqID1Kx4EHtulMB/mSCKBgj4wGkCLgMGNQsVygdT+2sn?=
 =?us-ascii?Q?BxOgVskCQiYjpPbyHOkVCAFmXSWUdaGTt7UOGfajZiFzpVELm9GO1QJcXzh9?=
 =?us-ascii?Q?IEMBlKBwYHAiwSbdue/Uj/hQOBHQPZcpXbYrOsD+UqvdlAP77dQlEagU1KzK?=
 =?us-ascii?Q?44q45+L1FiTaMMJ3wGpbDeCGNTj3RUAb7R5izb4SHLHvQgjoZS3amy0grfzE?=
 =?us-ascii?Q?Cn8/8eB7p3BU4d+0tpoz8ksNMj4zRKX/Ie3wQw1Ud8BmF3KyptYpc+Vr05Ug?=
 =?us-ascii?Q?Rm2Na2/dFkJdms05ChXWDdIbCPC7hW7g3pS/6SHerARFb17gR+BNTwMGmWAF?=
 =?us-ascii?Q?jH398Suw3fIF1pJve/uGR+PWRE0qH5VEDRqcbSM69FuiAr5mOr6fnaKFBbCq?=
 =?us-ascii?Q?caDC7aNm06f0Ak0VsioO+5VQLB9Djp4cQV2pAK3FoaHLps/ZYO0jhfMl7r+n?=
 =?us-ascii?Q?B+a1PFDjeXtgLJZlkhGccJd4jC4GZlvCCv5MVVbLwlRfCQnjeDcAmnRZNtOe?=
 =?us-ascii?Q?0jlKxhDq2JwWeJHkGWTee/NWLrzTF9mp7fyQDd8AXPisXJK0NTtLG8K6Oh3W?=
 =?us-ascii?Q?lJ8Rglb8CPifeQEP33YYY/5NAfkd2Vz6ifptckmPomMSLB0fxNuWF9ATAhqx?=
 =?us-ascii?Q?peritXREo9Q/s3Fy9M3fNbgEzXACRzpRRJBNyUKhgjZU+mNSxhkAoeUWQih/?=
 =?us-ascii?Q?e7lYwaMHG+S8w5B2W0/jqnjJSH366anE5x1EkSOrN6JUTz6dsRZpFpWCrAN9?=
 =?us-ascii?Q?DPEhIWn/GrhF2vHZs/ik7d8NwRa3NNTcSJF1fH2VbikjcdBA0gmyuGg0Aq04?=
 =?us-ascii?Q?HORZ8FUI4JyXTFVKb5I9EZHfxrjPQif12h8cRX/8QijngjGj52jbBLpcD2kW?=
 =?us-ascii?Q?erEl0GjDI4NyxYZjO5+JNLVmGF96RPErx9Ckc8iL4r8rTHAYM9ajWVekSjDd?=
 =?us-ascii?Q?8M6okSPT9DPaqQbKV6maSIZyIO1bIGwZzKrQ42c4onF7dZcoQDYo3b7S5eG3?=
 =?us-ascii?Q?aLXqy4fg6peDr6KZWwcFUi761L4LgQzgaoy+j/9XJtcmXhk6kF/iSUSxwrPs?=
 =?us-ascii?Q?Z4vZOkypKDrJTFCeRv7gMw1ZZcIo3L+e3SNOboYVbWZ0yu7GGd/+QLAERv3+?=
 =?us-ascii?Q?tSbEu3Ulc0V3qtjzLoXwjh2PvIownFXpXoah1a2zMFA91hyZ9+YG1BoXksfL?=
 =?us-ascii?Q?wu32jAzmM2g9xb+vk+fckpuAv9/o7ZeILSLWtzMxOInQF/pw4An6KtywlT+X?=
 =?us-ascii?Q?D9FvlCWyxjv6UkDwMuTKJxjOVDoRlDhD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vbrtp6rUwnHtRwFHy79fU16qqcrqmjZBMtBYI3dquoITm2OaGv4ScZz4PwNG?=
 =?us-ascii?Q?Oi4b5fQ/X6L5w259Q4CQ0Q3k5OWej+QwlRXm7sguFnzQQmiUei8h5pIPhHjt?=
 =?us-ascii?Q?17qWAJGi54DRUtRNpYx2EjSmGA+yAZ6MpHGZjMKB8TXVlZHGv4c9ODNCa2F/?=
 =?us-ascii?Q?uJ4Td55l7rvjsMQKuXhrockj3YSMKZCn/trbQDOZsPC/guHV1RlgsT38MT2P?=
 =?us-ascii?Q?R6mUwq9qmqOWm+0Mq3m1DVK7GhX8MY0WAv5s8pHlPDvn8J1mQal753hAA4fs?=
 =?us-ascii?Q?OUHR4XPGFzT1Ye2Ovc0eaXDUC4kV+tPaKf5zy3jUCwGps+CxdPe4GG/mvffk?=
 =?us-ascii?Q?/8wco8wastt8FDm1kJliyzHisgnEx2zudrjfPSTei2TfVNXU8fUhdvQjva3D?=
 =?us-ascii?Q?7re9XBd9XRro/xtvOhlWTJteehZSMBvqa0io7ZOQ/rIDDtFI5wxx3yy0pe70?=
 =?us-ascii?Q?jch9SHR848IcNpj0yJ8eo1quGlLto9VyjVJOC7dROH4s4tqxTcyGwBplqwCM?=
 =?us-ascii?Q?EKunCE4Xxloudh4Svyh89ytRf9NcpUErR2kTFacy7+n5IoHi+6PI7ctew+o3?=
 =?us-ascii?Q?4H09g+WAu8xgwv0opv/yGsGaldjxF/ecIhfrf9VbQrvLFDc5DL8C80ukWHmz?=
 =?us-ascii?Q?nIVOdGzwZ57Xk0PCFmaQBrszv0O5AZ6sfN0wwT+JAaZbKpGPGfof5Q9JqQmE?=
 =?us-ascii?Q?gGV2lXPYSOdVKluFToE5YvBR8BUW3Zp8VxUpw1qhgqeAjuG5Chnbb088JQUC?=
 =?us-ascii?Q?vD7c559KTPDSEQTqABo8B74bdQtDykE6fLhgiyU9WU7maVS6fXmTD6kOH3Un?=
 =?us-ascii?Q?PP0/e331YcHdgrXmO+sJP/2nqjbDVPppEGF3xfOsut9sEoj/3hgpAHJCiyp9?=
 =?us-ascii?Q?0EmI7oMg8dxRY00E8T5rEhkTqSkwV6hvMHpY4+nHDXzrq1bq4VsNtpKN+WjV?=
 =?us-ascii?Q?9fBVTpb/GgxYr2+enR4HkWjUwSGXty04VwYqzxzqVFghfvZ4tSzcZvqbPWwR?=
 =?us-ascii?Q?CEd4pHLpHKiy2Z16EDEK6RDp/hDnCJE8iOnC7HZNWshQk3LftPy7PzkqwyN2?=
 =?us-ascii?Q?pMtBAJ6tFn0nA+nAndhKxM7FdWlsI3u/2ceNpZok4c3dL+B9zVv1vLpc6wZf?=
 =?us-ascii?Q?y+k5JzZM9jKOl2OiSOpvzeX9+kRW/Tmy1bNoVvTxxnvt9tOHcsQ72vLOkexz?=
 =?us-ascii?Q?+Mos3t5LMYyrh4214Fw0evWqhxIDqH4QK4cJqM1pCxrTLafvw6t7swRRAJ9G?=
 =?us-ascii?Q?R8Hq8z3qHB+OcOZbXxIFDgPjxhN1u10uCIB53b9e782oaKr7ux424b/lt/Lk?=
 =?us-ascii?Q?HIfF5EkKjFV5bV/i4GJMqcpVaKgP+OZzKAcqnrbYipop6HPLSBIM+JSGSQqC?=
 =?us-ascii?Q?t0BQ7tZK1GOTCxERPROB+pXtBiJkdYiLng5tHrZF1GsMJ2S00pvgZ4OXpwTf?=
 =?us-ascii?Q?FwRi95YNU3ARGkF4QZ3wTrzFiY/Mzlefmp4bj1Ga+XDaXiLCoe7EMb+GlLdx?=
 =?us-ascii?Q?MlDnKiUcNcV1/ZBv3hasQkHSNsXRV3+cKx9f8Qqg59LHTJgkxrBWJ2pniLf4?=
 =?us-ascii?Q?n4ZvaT1lkNjm0Lih2hEPoLpyZJgw2scfPbrt6RgJ1xyUlIKVTPTWyNeFwer2?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af506bd2-18e7-4c21-9657-08de06902099
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 17:28:42.6742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nlpj1kEBHvptz14UEXEEx3RbmaI/aIRZ5opfvasLgyZ4xJXCFLtHjCoXL5aL0xi+ydUE/7C7zC5R3vWt9JwtlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6004
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

On Wed, Oct 08, 2025 at 07:26:35PM +0200, Kamil Konieczny wrote:
> Lets block one compute subtest to unblock CI.
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel-ci/xe.blocklist.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 2e1ebf299..ac28da774 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -124,3 +124,7 @@ igt@xe_evict@.*-threads-.*
>  # boards (which support 4K @ 60Hz) are available in the test environment.
>  ##################################################################
>  igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> +##################################################################
> +# Exclude one compute mode test
> +##################################################################
> +igt@xe_exec_compute_mode@non-blocking
> -- 
> 2.51.0
> 
