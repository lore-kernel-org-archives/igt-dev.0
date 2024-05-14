Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C122FC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 13:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510B210E0D5;
	Tue, 14 May 2024 13:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ta+umHH5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CFB10E0D5;
 Tue, 14 May 2024 13:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715691877; x=1747227877;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nhGNbXGHgvMgIX27YC4JICFbdqaulRnECnuN94wTMAU=;
 b=Ta+umHH5wJ+QcpSuzt4UDNPingI0Y0kEN1WYCyS9PnVRfahSOK0P/sbr
 Ij5Smfm7o2KRsuSSfr6PRlzrt1xqmPEQhaveN7P65LUIW6E6v8hU3+ADc
 y9xxHRl6oC0CAac2YdJ9nbWRfNVpeSQs061kydK6QdyNbuc9QKG5B3Qef
 1RL0KCnnHI4fg8jI5YQZm3B4sqkceMY8vgcepUwKQu2XlhgoEu9mkkFOa
 jciAJMZSDLz7fF0tbDimDDThbkkLbTtxN3gXuqTKP0nHDL1slhAula7px
 +IGKgWkQlmGcSkYWQxTJsXhvYIGKY/HF7OMxBPj7E/QYEThXDPpXMRnv5 g==;
X-CSE-ConnectionGUID: fnNAYxGUS6G/vFjP8eYEig==
X-CSE-MsgGUID: kyizi6r4SP2j7VdxkpEEeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11793171"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11793171"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 06:04:37 -0700
X-CSE-ConnectionGUID: lDYlD1bJSYS92dCl2LaafA==
X-CSE-MsgGUID: urU6vYbwRXW4gmEkcPqNXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30754488"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 06:04:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 06:04:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 06:04:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 06:04:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 06:04:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXwgqr0tUyi214OK4pREIFjAgvvXA39ss3zDTC9lN9zDwp57vw1jCROBVbNoO8x3TQKfsNoAqclDVUipyilFeGEBuyA+Bt4kCnHRG7q1FpUpWVO8GfNo9mxKoQ9QM5TR+NvjMnwA7jUzUK2DySGXGB2EFVDJUpZgyKpSBeFpGg1en2h+cH0uaIC1Kk5BEBM4nPN44NvzAOm1S9ElyjF8Mmwq2yroUt8JPEQTsRUjF7jYsdURav74YozPkpASOuri6iZ1kkh4HAZFDjotTfXGlyvbiCQWM4AjEso/+NIiFV9rb3eOhDRaxA/mRDiRlrfpQv8vP70rKAEegu8WKASsjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udpNJ6HpU+j/fAcAO3m7PMr+O6TtgPManS+32eOi0SA=;
 b=Y7+/LO7NCgbVZO+q97VGF7VLdoSTqvJ8bUBEOIW51xN/TQ+/dcTWNnBpCnuvLkqHhmWNRynzkGMh7p9NmzWc1pyDPO19Dt0C6c6Izq2MmM+sd9sdzKpM4gCPmSvL8sNLTUPBWv67ul1EN9HMhLT6tVR02gSaaO5zLUnLEbaxXeNT5OWzFDm35diBijtpnj41w0e82UdYd4SrvcXMRIHB/OhnGOv3c8F3IuZXvG5OjZBohbh/wUPhW3IoSYlx0V8jLKVpWV0ytbDgBNFJR2jjn/fhyruS45MAEmFKv2JUgwIEwMP6a4p9Z67XWj0/cyFtQLlP8S+0AEdiiJPi8PovWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7340.namprd11.prod.outlook.com (2603:10b6:930:84::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 13:04:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 13:04:19 +0000
Date: Tue, 14 May 2024 08:04:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <I915-ci-infra@lists.freedesktop.org>, Janga Rahul Kumar
 <janga.rahul.kumar@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_series_startin?=
 =?utf-8?Q?g_with_=5Bi-g-t=2C1=2F3?= =?utf-8?Q?=5D?= tests/intel/xe_pm:
 Rename and clarify mocs_suspend_resume
Message-ID: <7ymf6gl6rsq5akpimr25dtkt5ta6jeslfrrt45tnphdlyahce7@dqhegy7glcp7>
References: <20240513162435.952578-1-lucas.demarchi@intel.com>
 <171564775280.2095830.4929537543373542912@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <171564775280.2095830.4929537543373542912@8e613ede5ea5>
X-ClientProxiedBy: MW4PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:303:b7::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d5dcca3-07be-4e86-b2a4-08dc74165e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K87UJCFQziI2H5jLOtlNt4CXMUwDKRh2HS8wxIT5nvFhuHgKY2f/FHF1ZUng?=
 =?us-ascii?Q?SWiFgS71LdLAsaMcMsFlWTysvlH2N1qblcJMTDaou0Q3DZgZpnqjBOl79KtK?=
 =?us-ascii?Q?cuRQvjO2Bt1pa2JoyLBEsPB4YtedxNZmG0eiq9qQXtYTi+vpx+/how1bClXo?=
 =?us-ascii?Q?Fg7VJ58teDs+l50nmUx0scYelYvAvbVcjc6kfDcu+vc1+5ufri/X1mCQXPYo?=
 =?us-ascii?Q?bS8GQlKHU6qUTXhKpdjHLytXycXzg/2DwuN0vZi1o+XitiJqmBbosLrhBnKF?=
 =?us-ascii?Q?8aCUDMjaOa1hfz/+4FLIbeq9+XdYtx+AC5sdGSHGCp4zxSKy6EVwfHRCO3Pn?=
 =?us-ascii?Q?JNTuSi5Lord39axfkZxap8+U6Ta/AfSbOKvH7C0wdxaq2GDwzuGPj+UDfrBT?=
 =?us-ascii?Q?Q8Uveg1QNfrVrs/yuWWbGyL3LsZPznkF2sGwLT/H+6GmdMvd3PqkL1vwLOVs?=
 =?us-ascii?Q?/Z0ylv7juF/UtRd4u9EYm43aVX15vbKHKQj+g5ENerst65IJWz7yUOSa+Rmi?=
 =?us-ascii?Q?ErVBLtlf5ymcZqEfbkdfdl73mPtu09iczMScGPJ5rnrBymRFeJM8F3i9pVZR?=
 =?us-ascii?Q?OqrHyDxILX9jCpZD5YBTRn0HYiV8hCKjaoQT7H6WA6F8fTDvk2fHU7t5n2Dn?=
 =?us-ascii?Q?pBrjLW1DMuren9m3MdEsR5r8wYn8fzyXQ4dXxM0uUEXyYIeL9Vs7aEOa4IuV?=
 =?us-ascii?Q?RQgNH5ypJs1Z5SSy7dN0VB5f9eJOI3YwKbYgIb1ddNfRnzLqHCW54+hJGtHv?=
 =?us-ascii?Q?gq6tJucnFm+0kD9dxfHfDLaKJAM5W27Q9K59olTaaLmdUpzBEmJHUFacMq7K?=
 =?us-ascii?Q?LjFz4Tb0Qs43Fqqa56DyokkKNgJWcE08JNLRjHi15LmfBsHK1rkFJq1AQDJk?=
 =?us-ascii?Q?WCUsAD0X4Yq34J2ZakudDex0mntH+0jcQRFB/6QjYXEdEXo4CgxZVwQ44+IE?=
 =?us-ascii?Q?KlgY4vZWwHrzWfKnU44GKupsFdvUkJuqC3bUZmACrwiba6GMhor83Put71GF?=
 =?us-ascii?Q?6N1fNP3HmoiLZSMJ0UyLqPtWW/4ji4mX4hPKI79k8P9VHppdDQGWt3OlRgS7?=
 =?us-ascii?Q?1oN2uA8PLOSUbima/qu6IN+FNKDAj5PT2M/k7tCX1jpX3JvBrbmdmYs/I8JH?=
 =?us-ascii?Q?Bv8NohzJhDpUufMaoUEEQyC0AGbvNt8OAFz2BRfnu8pmJVEuK9Gst9dYgv3t?=
 =?us-ascii?Q?rmhF+SXMBiuB9O4kLSPE8W92ZvAmzHcN9g5+y5KFExtqnuHz//U13/a5wfI?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/AVa+sGJVsejKrrlWioa+GecaDj9aTEKGydVr1CXbv6n+Z/O4nJGmLoa83GE?=
 =?us-ascii?Q?VXfxeFe71S65HRK+M932jJZQt2TOLaqPd11GivdGfqlgolEt9vUQ8pS402Ps?=
 =?us-ascii?Q?wgnx4BF3x/AT2WTAid114muGI/Atx7vU4BbGHQyfdIxvrYZTX/YqbOyatvxr?=
 =?us-ascii?Q?QRmLt2zaWBNLBB6NRvRntPrFhGhQW4n9/BAE96LFvfRWzu8UwXZocC99Eejk?=
 =?us-ascii?Q?sOTGOP9h5NXmfS/ZKnui0qSwlHfPGKCtSl4ITNCjxMSQNulZpgCsH9uMIMSd?=
 =?us-ascii?Q?oK5soSdLsWtJ1dy7vLheg8AGoM9HETWuZMfSiHWSsx23SMRHmlIeWz98UAts?=
 =?us-ascii?Q?6BTy05zfCypVRzhNF7J1X/qub2ppHmpvJKZwx3DydPFDDvznxeyWdlXb+7eX?=
 =?us-ascii?Q?PG5bZGQH6gDDMLcc51JLYa/2NhYzcwHKesjI8ePj7LK0VasatNGliaj5M0Dl?=
 =?us-ascii?Q?hAxRq462VoXZkyX1QwNKcMQaW/PJI6coKX/xrYvcWrf66XqcLimIgFdTqGhb?=
 =?us-ascii?Q?UYq2bjGCc1zxbRwekuwsP6ItMcA4dMvqy+Jl3Pmwo7xQ2J1WTxdstrs0l+S8?=
 =?us-ascii?Q?j4x1y97GNEXQnQoqCdGR+TYWLZUjWZedL4I07WpuKulqnRenpbLLLuQ2WNSy?=
 =?us-ascii?Q?4TkN1mRFVHC5P5vXKawS8MP9ss2t6zhT8YqPms1mvDek4Kq/FRx/bxsTgR/b?=
 =?us-ascii?Q?4UmpOgWE+JE+faKby9ewu/7aHKJkNb87RJgg/RhuKnYGanvw1PCgXHTBaVGI?=
 =?us-ascii?Q?/DHubxxDSVbrB5VEw5RKWSox49aYbBVLaVM6nwfvFXZ0FLJO9kq6L1SOyb+a?=
 =?us-ascii?Q?OoRTT3FL3SHBnzV2D2RCbMCs+JcYYvw6mX8KUB/rqawWOaoGMdVcjO1jv+xY?=
 =?us-ascii?Q?ZM2GLQPFm9NU4dl5uRc+YdDv7GDt7YalC0cWedzQ+HjuKdWMH9RSdbpiXvjg?=
 =?us-ascii?Q?mCNQecyHU0Miw72iRifFk98tdf+3InDSxkJyGBeRHqm/ZKq/VOyFWxs1jwc6?=
 =?us-ascii?Q?xs76Q48qAmoGWCYAKm3/0ZjzKp1YV3+r0OrN5N4De/GYjLojcszuvML80lBR?=
 =?us-ascii?Q?T7iqspR+btJQ3tVDJ0ztH3XWDbU7J7bbB8hOl+7+qG0/qKLS5IqFJfulZXNt?=
 =?us-ascii?Q?AQlk4xay4j1SpWTUNbzJ8tRoXURHry/9dhqgJB3Do0qvztHAUXKd0weJ+XrE?=
 =?us-ascii?Q?vM09VvvsWmohUKChP1FU1Z/NdnKQyLcbDguvvS9d81Bv9HrBfJgAb+95rkHD?=
 =?us-ascii?Q?pjs1gkpl4wSHk2m3GAGMtrhyoZUHZMdNrSK95WB3OEXUO5V6I/hS8Xn/ijlK?=
 =?us-ascii?Q?K3bG/XUPW1/YvToT4Bt2tMuVUjCURlSHJ7+GKYJhgY/orq5fwngXvfkM7iBs?=
 =?us-ascii?Q?pt5ADrGXqQ+PVz2MApWE8SoH4hQVzcuP5+068tnQgdBxzdY0mH2UO/xen6DZ?=
 =?us-ascii?Q?nRaGxVUY7P1faxQ8m4kmveOcLxEiEviiCvN+kdAofUDI7Zak2HY9vt1H7QG7?=
 =?us-ascii?Q?H+Zc/mmW3NNHKhL9ebW5+JisWJ4kGH4TA+czdsxectCu8X9oNW88JDf8W+61?=
 =?us-ascii?Q?wniVt/BQTPJA3VuNCTnf0gtmDPqh6Ga1boMTLsPuZVu47yZ9q9bsgfnWF/UJ?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5dcca3-07be-4e86-b2a4-08dc74165e1d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 13:04:19.9365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6xR4ulcVVZ/BSbfSpRx8BMJTrQKZmJfay1mojWOP6qsYY1V4QcxaDfH/1jS8KJWUAJcn3+LJ8ibxQu+yuXrCoPoP2h1eGvVLOEMie2MaXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7340
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

On Tue, May 14, 2024 at 12:49:12AM GMT, Patchwork wrote:
>== Series Details ==
>
>Series: series starting with [i-g-t,1/3] tests/intel/xe_pm: Rename and clarify mocs_suspend_resume
>URL   : https://patchwork.freedesktop.org/series/133562/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from XEIGT_7850_full -> XEIGTPW_11135_full
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with XEIGTPW_11135_full absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in XEIGTPW_11135_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>
>
>Participating hosts (3 -> 1)
>------------------------------
>
>  ERROR: It appears as if the changes made in XEIGTPW_11135_full prevented too many machines from booting.
>
>  Missing    (2): shard-adlp shard-lnl
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in XEIGTPW_11135_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * {igt@xe_pm@mocs-rpm} (NEW):
>    - shard-dg2-set2:     NOTRUN -> [FAIL][1]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@xe_pm@mocs-rpm.html

the failing test got renamed.

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1818

still the same failure.

Applied.

Lucas De Marchi

>
>
>New tests
>---------
>
>  New tests have been introduced between XEIGT_7850_full and XEIGTPW_11135_full:
>
>### New IGT tests (1) ###
>
>  * igt@xe_pm@mocs-rpm:
>    - Statuses : 1 fail(s)
>    - Exec time: [10.53] s
>
>
>
>Known issues
>------------
>
>  Here are the changes found in XEIGTPW_11135_full that come from known issues:
>
>### IGT changes ###
>
>#### Issues hit ####
>
>  * igt@kms_addfb_basic@addfb25-bad-modifier:
>    - shard-dg2-set2:     [PASS][2] -> [SKIP][3] ([Intel XE#1201] / [i915#6077]) +1 other test skip
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_addfb_basic@addfb25-bad-modifier.html
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_addfb_basic@addfb25-bad-modifier.html
>
>  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#1124] / [Intel XE#1201])
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
>
>  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-7:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#787]) +49 other tests skip
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-7.html
>
>  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7.html
>
>  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][7] ([Intel XE#616]) +3 other tests fail
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
>
>  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
>
>  * igt@kms_content_protection@legacy@pipe-a-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][9] ([Intel XE#1178])
>   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html
>
>  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>    - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#1195]) +2 other tests incomplete
>   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>
>  * igt@kms_cursor_legacy@forked-move@pipe-b:
>    - shard-dg2-set2:     [PASS][12] -> [DMESG-WARN][13] ([Intel XE#1214] / [Intel XE#282]) +8 other tests dmesg-warn
>   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html
>   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html
>
>  * igt@kms_cursor_legacy@single-move@pipe-b:
>    - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1214] / [Intel XE#877])
>   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_cursor_legacy@single-move@pipe-b.html
>   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-b.html
>
>  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-7:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#455])
>   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-7.html
>
>  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455])
>   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>
>  * igt@kms_fbcon_fbt@psr-suspend:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#776])
>   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
>
>  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
>    - shard-dg2-set2:     [PASS][20] -> [DMESG-WARN][21] ([Intel XE#1162] / [Intel XE#1214]) +2 other tests dmesg-warn
>   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
>   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
>
>  * igt@kms_flip@busy-flip:
>    - shard-dg2-set2:     [PASS][22] -> [SKIP][23] ([Intel XE#1201]) +12 other tests skip
>   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_flip@busy-flip.html
>   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_flip@busy-flip.html
>
>  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][24] ([Intel XE#361])
>   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>
>  * igt@kms_psr@pr-dpms:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
>   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-433/igt@kms_psr@pr-dpms.html
>
>  * igt@kms_rmfb@close-fd@pipe-b-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][26] ([Intel XE#294])
>   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_rmfb@close-fd@pipe-b-dp-4.html
>
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>    - shard-dg2-set2:     [PASS][27] -> [FAIL][28] ([Intel XE#899])
>   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>
>  * igt@kms_universal_plane@universal-plane-functional:
>    - shard-dg2-set2:     [PASS][29] -> [SKIP][30] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
>   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_universal_plane@universal-plane-functional.html
>   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_universal_plane@universal-plane-functional.html
>
>  * igt@xe_evict@evict-beng-large-multi-vm:
>    - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#1195] / [Intel XE#1473])
>   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm.html
>   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm.html
>
>  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
>   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
>
>  * igt@xe_module_load@unload:
>    - shard-dg2-set2:     [PASS][34] -> [DMESG-WARN][35] ([Intel XE#1214])
>   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@xe_module_load@unload.html
>   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_module_load@unload.html
>
>
>#### Possible fixes ####
>
>  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
>    - shard-dg2-set2:     [SKIP][36] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][37]
>   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
>   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
>
>  * igt@kms_cursor_legacy@torture-bo@pipe-b:
>    - shard-dg2-set2:     [DMESG-WARN][38] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][39] +9 other tests pass
>   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_cursor_legacy@torture-bo@pipe-b.html
>   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-b.html
>
>  * igt@kms_dp_aux_dev:
>    - shard-dg2-set2:     [SKIP][40] ([Intel XE#1201]) -> [PASS][41] +1 other test pass
>   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_dp_aux_dev.html
>   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@kms_dp_aux_dev.html
>
>  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>    - shard-dg2-set2:     [INCOMPLETE][42] ([Intel XE#1195]) -> [PASS][43] +1 other test pass
>   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>
>  * igt@kms_flip@flip-vs-absolute-wf_vblank:
>    - shard-dg2-set2:     [SKIP][44] ([Intel XE#1201] / [Intel XE#1226]) -> [PASS][45] +12 other tests pass
>   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>    - shard-dg2-set2:     [FAIL][46] ([Intel XE#899]) -> [PASS][47]
>   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>
>  * igt@kms_vrr@negative-basic:
>    - shard-dg2-set2:     [SKIP][48] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][49]
>   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_vrr@negative-basic.html
>   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_vrr@negative-basic.html
>
>  * igt@xe_evict@evict-beng-cm-threads-large:
>    - shard-dg2-set2:     [TIMEOUT][50] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][51] +1 other test pass
>   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
>   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html
>
>  * igt@xe_evict@evict-beng-mixed-threads-large:
>    - shard-dg2-set2:     [TIMEOUT][52] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][53]
>   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html
>   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html
>
>  * igt@xe_exec_threads@threads-hang-fd-rebind:
>    - shard-dg2-set2:     [FAIL][54] ([Intel XE#1256]) -> [PASS][55]
>   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-rebind.html
>   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-rebind.html
>
>  * igt@xe_module_load@many-reload:
>    - shard-dg2-set2:     [TIMEOUT][56] ([Intel XE#1093] / [Intel XE#1206]) -> [PASS][57]
>   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@xe_module_load@many-reload.html
>   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@xe_module_load@many-reload.html
>
>  * igt@xe_pm@d3-mmap-system:
>    - shard-dg2-set2:     [FAIL][58] ([Intel XE#1221]) -> [PASS][59]
>   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@xe_pm@d3-mmap-system.html
>   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_pm@d3-mmap-system.html
>
>  * igt@xe_pm@s3-basic-exec:
>    - shard-dg2-set2:     [DMESG-WARN][60] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][61] +8 other tests pass
>   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
>   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
>
>  * {igt@xe_pm@s4-mocs}:
>    - shard-dg2-set2:     [FAIL][62] ([Intel XE#1840]) -> [PASS][63]
>   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@xe_pm@s4-mocs.html
>   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_pm@s4-mocs.html
>
>
>#### Warnings ####
>
>  * igt@core_hotunplug@hotreplug-lateclose:
>    - shard-dg2-set2:     [DMESG-FAIL][64] ([Intel XE#1162] / [Intel XE#1548]) -> [DMESG-FAIL][65] ([Intel XE#1548])
>   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html
>   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html
>
>  * igt@core_hotunplug@hotunplug-rescan:
>    - shard-dg2-set2:     [DMESG-FAIL][66] ([Intel XE#1345] / [Intel XE#1548]) -> [DMESG-FAIL][67] ([Intel XE#1162] / [Intel XE#1345] / [Intel XE#1548])
>   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html
>   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@core_hotunplug@hotunplug-rescan.html
>
>  * igt@kms_big_fb@linear-64bpp-rotate-90:
>    - shard-dg2-set2:     [SKIP][68] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][69] ([Intel XE#1201] / [Intel XE#829])
>   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-90.html
>   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-90.html
>
>  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>    - shard-dg2-set2:     [SKIP][70] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][71] ([Intel XE#1124] / [Intel XE#1201])
>   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
>   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
>
>  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>    - shard-dg2-set2:     [SKIP][72] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][73] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
>   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>
>  * igt@kms_big_joiner@basic:
>    - shard-dg2-set2:     [SKIP][74] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][75] ([Intel XE#1201])
>   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@kms_big_joiner@basic.html
>   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_big_joiner@basic.html
>
>  * igt@kms_big_joiner@invalid-modeset:
>    - shard-dg2-set2:     [SKIP][76] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][77] ([Intel XE#1201] / [Intel XE#346])
>   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html
>   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html
>
>  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>    - shard-dg2-set2:     [SKIP][78] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][79] ([Intel XE#1201])
>   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
>   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
>
>  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
>    - shard-dg2-set2:     [SKIP][80] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][81] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
>   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html
>   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html
>
>  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
>    - shard-dg2-set2:     [SKIP][82] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][83] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
>   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
>   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
>
>  * igt@kms_chamelium_color@ctm-red-to-blue:
>    - shard-dg2-set2:     [SKIP][84] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][85] ([Intel XE#1201] / [Intel XE#306])
>   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html
>   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html
>
>  * igt@kms_chamelium_edid@vga-edid-read:
>    - shard-dg2-set2:     [SKIP][86] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][87] ([Intel XE#1201]) +1 other test skip
>   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_chamelium_edid@vga-edid-read.html
>   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_chamelium_edid@vga-edid-read.html
>
>  * igt@kms_chamelium_frames@dp-frame-dump:
>    - shard-dg2-set2:     [SKIP][88] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][89] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_chamelium_frames@dp-frame-dump.html
>   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_chamelium_frames@dp-frame-dump.html
>
>  * igt@kms_content_protection@content-type-change:
>    - shard-dg2-set2:     [SKIP][90] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][91] ([Intel XE#1201] / [Intel XE#455])
>   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_content_protection@content-type-change.html
>   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_content_protection@content-type-change.html
>
>  * igt@kms_content_protection@legacy:
>    - shard-dg2-set2:     [SKIP][92] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][93] ([Intel XE#1178])
>   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_content_protection@legacy.html
>   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@kms_content_protection@legacy.html
>
>  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
>    - shard-dg2-set2:     [DMESG-FAIL][94] ([Intel XE#1162]) -> [FAIL][95] ([Intel XE#616]) +1 other test fail
>   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
>   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
>
>  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>    - shard-dg2-set2:     [DMESG-WARN][96] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][97] ([Intel XE#1201])
>   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
>   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
>
>  * igt@kms_cursor_legacy@single-move:
>    - shard-dg2-set2:     [DMESG-WARN][98] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][99] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877])
>   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_cursor_legacy@single-move.html
>   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_cursor_legacy@single-move.html
>
>  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>    - shard-dg2-set2:     [SKIP][100] ([Intel XE#1201] / [i915#3804]) -> [SKIP][101] ([Intel XE#1201] / [Intel XE#455] / [i915#3804])
>   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>
>  * igt@kms_dsc@dsc-basic:
>    - shard-dg2-set2:     [SKIP][102] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][103] ([Intel XE#1201]) +3 other tests skip
>   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_dsc@dsc-basic.html
>   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_dsc@dsc-basic.html
>
>  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
>    - shard-dg2-set2:     [SKIP][104] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][105] ([Intel XE#1201]) +4 other tests skip
>   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html
>   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html
>
>  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>    - shard-dg2-set2:     [SKIP][106] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][107] ([Intel XE#1201])
>   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>
>  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
>    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][109] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
>   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html
>   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html
>
>  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
>    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][111] ([Intel XE#1201] / [Intel XE#1235])
>   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
>   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
>
>  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>    - shard-dg2-set2:     [SKIP][112] ([Intel XE#1158] / [Intel XE#1201]) -> [SKIP][113] ([Intel XE#1201])
>   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>
>  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
>   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>
>  * igt@kms_frontbuffer_tracking@psr-slowdraw:
>    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][117] ([Intel XE#1201]) +2 other tests skip
>   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>
>  * igt@kms_plane_lowres@tiling-y:
>    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#829])
>   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html
>   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_plane_lowres@tiling-y.html
>
>  * igt@kms_plane_multiple@tiling-y:
>    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#455])
>   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_plane_multiple@tiling-y.html
>   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html
>
>  * igt@kms_plane_scaling@intel-max-src-size:
>    - shard-dg2-set2:     [SKIP][122] ([Intel XE#1201] / [Intel XE#1226]) -> [FAIL][123] ([Intel XE#361])
>   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html
>   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
>
>  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][125] ([Intel XE#1201]) +4 other tests skip
>   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
>   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
>
>  * igt@kms_psr@fbc-pr-sprite-render:
>    - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-render.html
>   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-render.html
>
>  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][129] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>
>  * igt@kms_writeback@writeback-pixel-formats:
>    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][131] ([Intel XE#1201])
>   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html
>   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html
>
>  * igt@xe_evict@evict-beng-mixed-many-threads-large:
>    - shard-dg2-set2:     [TIMEOUT][132] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][133] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>
>  * igt@xe_evict@evict-mixed-many-threads-large:
>    - shard-dg2-set2:     [INCOMPLETE][134] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][135] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
>   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
>   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
>
>  * igt@xe_evict@evict-threads-large:
>    - shard-dg2-set2:     [TIMEOUT][136] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][137] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@xe_evict@evict-threads-large.html
>   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_evict@evict-threads-large.html
>
>
>  {name}: This element is suppressed. This means it is ignored when computing
>          the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>  [Intel XE#1093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1093
>  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
>  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
>  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
>  [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
>  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
>  [Intel XE#1345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1345
>  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
>  [Intel XE#1840]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1840
>  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
>  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077
>
>
>Build changes
>-------------
>
>  * IGT: IGT_7850 -> IGTPW_11135
>  * Linux: xe-1280-3d00e04692d45ab076e9e493252361bb18373a0e -> xe-1281-5f823e6608065c42909c6a41adc7ff448cbfbfc5
>
>  IGTPW_11135: 0cbcb9a97b616168c1ac621e9ecde25f2286364f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>  IGT_7850: 7850
>  xe-1280-3d00e04692d45ab076e9e493252361bb18373a0e: 3d00e04692d45ab076e9e493252361bb18373a0e
>  xe-1281-5f823e6608065c42909c6a41adc7ff448cbfbfc5: 5f823e6608065c42909c6a41adc7ff448cbfbfc5
>
>== Logs ==
>
>For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/index.html
