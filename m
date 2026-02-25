Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8103BFD377A
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 17:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D8D10E7DB;
	Wed, 25 Feb 2026 17:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cx9QUR9G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6292A10E7DB
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 17:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772041677; x=1803577677;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=fEoTbt6+3rzCt6C1kITnkltCFOnEhoJvCYv/Yn2z3S4=;
 b=cx9QUR9GHLYAKHGXRFWR+BhK7k3uP1qlnuwl7Sm1hIz0W8CBcqEYd9JX
 bqfiSmrV5wOv8a3xiNbJrUBDW3VntQrjlSTi3EGm3YwtDgZK2ORmbxfAU
 qvEUasuQQk+8EZAJ1gTJQmucaj7YpenKW6Fmy7+ABKwIM7zLwdLrUjrGi
 DPfBGWiJ+kkjlse1tFIHccbfBFV4hRe6BYGQsjLVrKqLHOMp+1MnpZdAP
 o9EBwacWYxQfUReNk2KH+/SF78qdqMxhkePMufxgSg4W5xHUnDn9qhIzn
 nWi9PlQt42Yk6QyR66EXbJTSxWyA3fP/mdcT4/lXlHlocl5x1SaE5tgR2 w==;
X-CSE-ConnectionGUID: JU9U4J3/ToG8wj/E4dCpoQ==
X-CSE-MsgGUID: T85+81oFSuaeZ+GGP4npVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="76960520"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="76960520"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 09:47:57 -0800
X-CSE-ConnectionGUID: gbvDPz8/S5Sv5o/b2cCXOQ==
X-CSE-MsgGUID: 1jT5w56rQjmdgoZ5cjxGZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="220808496"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 09:47:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 09:47:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 09:47:56 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 09:47:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HeEkFUo2D/cuYmUhLyUWYHczgx+WUef8Z9QJlcI4Ln5r7sp9JaGGO2ntKwh9q/+UWur0dccErup3Zcrs6r02gEQTKGFRLH/azXBRGxh18E2Y8T6YhJKiRPA9NvZe+EZ+2eYJccT1jHuWT7qTwUVU0zteGL7F4p1IlLoF+8Ha470ruENwM58md5ngq5MAe+gpkMMHm0FDgf+dQ30YqZ+DB5Hf3qIDECIs2sdxqmJwW/tw40WTbHh040uG8QUBXMPoD2EUMCPcW+Kvpklo1DisPyUim22gwDh9Z3ChvPmNbyyhT74lr6JPIvnJP+C5P/xik80T12rlw+WCA1gH7Wi/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrPOC48TdV8n+2F3a2QludfuSLVQdyJb+bzXpk433VU=;
 b=MqAQi4McoXgcVNiCnDvaeS2ikjMiBrAs+aqML3apmPxglu4kQSFcDuUb6hyu08TTdI80/mAuFVXMat4RY0OS5hf5gI/9fkjYDBPhDt1voW+6MOTFEgXFWHGaSiqRNASIGjT/xtk4wYT9AgqLZXew2xpezL5yaM9V+aDprV21v7NIiRG0edxRtZumtEsqafH7/HCQ77MwKsyhIIFiVfElCG1+RFQebaZ4exwR6oS+m1VxchSSrbxieF48BriVHli5VW37iTvEbPoIi6xKkPEg//HqEUzw4Y9Iur0cLPB+jYdu1Dhud0VSmFZNvdZWtjSrEYphUSvN7y1i6GHR62G3ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ5PPF1170C8165.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::810) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 25 Feb
 2026 17:47:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 17:47:53 +0000
Date: Wed, 25 Feb 2026 09:47:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 xe_exec_balancer: Report skip when test is unable to run
Message-ID: <20260225174750.GR4694@mdroper-desk1.amr.corp.intel.com>
References: <20260224211612.2944788-2-matthew.d.roper@intel.com>
 <177198120270.284008.13356809810795604967@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177198120270.284008.13356809810795604967@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0214.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ5PPF1170C8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a13624-f5a6-4d7b-0b34-08de74960067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: wgtDwyoJJ24fvmfMaXhU1ITjQL9QSwnuIiKiJk74DP4L+yZHGEQf8Wqb6/G3UVqzeEADnkbW0x7vyCBUok+wWXi2cKECPGCcrarXFSI2sKp6vV30DlIMDHZCrInYDmPUOvDweJsTdgkkBNsKqnUIeRIXIEJPEqeoxzvMKWHPsx4t07+smy7YXHlAXGnsLl4Yr5Ys9nDF0PjnIztkUV1W73e9dh/ODHa0b0cTt2CnqMyir4PdXxtJJWBkWUO+JIhmy6WvXgz3Kp80hQu7bUcpNwdDm+Z2BH2snAjoTOhLkC/bW/xFd77X/yWTUHpO1x/LfTzbAYkx6qQ9h/FTxPt+z778f4xjq9TpUjMm2nF0VhulMjM5ZnkbWJYWTDFb+zmp+lL9GVoovwmx9t2Gnjz1usbgGPT3a3lkL9niN6jysrtcy4bGTSbcupMTA2dNxeomIAOGRscrHNR7i+QnrnQVWiU6PGgeCnKLy+q/SXe1Xf2PbUmfDM8BhxO+GyCO6isRwIt0/7oSTyEp8bpMykQXb7PyrRrCmEycnHiYnrVR1DUSu2zMfczG/LHeM0WmkDEiGL3EoxwRpkdQ2+IULNcWv9m43gxzTt5K5WFTo5mrfX1fU2jO7dKOGJMcTy2rev00Ws22oTdiUgBSM35r5wSKEEVdx8XYh2TYdJVwpsabUBCd3e73r+Lo8Xo0Gi4LcHzi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gkPft+nPisO90pqP8VG92AP7IL+y85tUxiwMoq8wEQ99yBkN5wCqzuYa40op?=
 =?us-ascii?Q?squq/aOMxhPg68VOeIsOHLfX/myurW08CnXJILkuN/v+PyeHatg1NcVxX+Np?=
 =?us-ascii?Q?+96Zvl1m4xLmF7imvDX1NduszP3w+iXaPXyPggDQ0VqnSq0foSAJoJkeoReP?=
 =?us-ascii?Q?7XxjEdPhoWQFuIc6rE0F2wlivSqdrxP5KVxozIcyGvrSeh3uK5OkV0zQIxhh?=
 =?us-ascii?Q?bJbhXwnNIhpxLj1H0Pr7EqQcv3LHfepHKhQ8M6O87Gw9i7Mv/Kyyf1f9qcQo?=
 =?us-ascii?Q?8vi0zrMy52Qz7kQBp0rJnsdJUaC31HkGSYGpgtLVs7jwuEUD7lQBzOOgUOk/?=
 =?us-ascii?Q?JWJ9RfLNvT2iOb1dtA0o2hZJS8/qZvGcV9GfavOwmDDJPk7rvji826+looO9?=
 =?us-ascii?Q?vMQsFcme/oEijBblKj3aIBONT2IEaoQk+oNTE4LaJbdd9C04bhhixXiQoj8E?=
 =?us-ascii?Q?1tuK70KlFm1V0u95Ad5dN3zlecJImy6Uk+RxyMLe+A8hm9JF+L09CPoUZcUU?=
 =?us-ascii?Q?KfPPRhkHMQhbCNvdx9TXF0+9RpQjFSvuHC8XDU2rLICDJXKHb8PjscNQ7kRw?=
 =?us-ascii?Q?IeAbBVlO5JubLDxzOpiQNECYBtD305HUrQ5grzDqgFYGHxhc5IY21ntLVskz?=
 =?us-ascii?Q?S2tPJqQy7l3ZedEjne8AtthnsoC+q6N3XLo4tEyF1A4196RJuLJULpMAO59Y?=
 =?us-ascii?Q?VICU/iPxDLNZ3PdDQSKXsFNW+iItj7LHHAUqzvSy2ozDyVCH8rO6u86K1Jm0?=
 =?us-ascii?Q?7fLrQ98UW6eekk6FSFNro7AtBYNNmoEMuEsfdFXeiFom5OCLy1vhng0DkHpG?=
 =?us-ascii?Q?PaU+U5lSmtQb1caCN4Wb8PGT5cFNfodwWmPiFtBiCfI91dt6c4hMGA2utffN?=
 =?us-ascii?Q?NnXrKVr+g4jPH07OcmiD0SxnnsTSIP6QxoW+vpgKM2oIWCxcloi76HdyQ3Rt?=
 =?us-ascii?Q?914V6qHW/0GToZDAw0MsXxTrQShE0TXHqei1VUbgD+m9JOHJC7CT5nJJbP0Y?=
 =?us-ascii?Q?XVbAcxWtgsCrItVJLCcHv6JnYSTwW4ZlEwIXZVjpfaJrjlYRjZkgDPyiH6kx?=
 =?us-ascii?Q?FAcXeQF6IJxW0vyXmx0/L1BRXRb+uDeKMJ+cYxFBx20SMq+LkmCyWH6A3YYa?=
 =?us-ascii?Q?5UNedz0SMvqGFAksjWRguWNusTRK0/D6B8DR28nRWa9fu+EjtzD4YHbciwxp?=
 =?us-ascii?Q?UT80JVsCZBmjgiqznEltG87eSduz55Go7+0SRPa8sBTnTr+Du4J23qxlVm3h?=
 =?us-ascii?Q?IIJv2v8rWyv1wk51IY5sYiOPvv9YzxM6BcO+09r5v0N/a5gcuJ1rO85NbD5g?=
 =?us-ascii?Q?vSxsnGcgbwUq4KznXAN407sYf5BpGxlq2gidao3E5hXBOrJyOITHzD0pUbjD?=
 =?us-ascii?Q?nJsefYrcwFlhDIitqPX5eo4E2ryyDicqIsWLj00hYEYx4FZ9fLBMwApZReLT?=
 =?us-ascii?Q?dSCyqJa+NqB6Uttr0Wn6Q3fvq2pxRSso4TWMMkQ0+XOzlw++B6HvaSVZx9OF?=
 =?us-ascii?Q?knmTOLMHT96Q7oURyy/kxowh85bEUHRBTbkOBJBlu+S94nezHgHcNnGMfhUE?=
 =?us-ascii?Q?bxM+6Q2zN470d6pndN5b1QquEm5ic9h5RvVYWVmHTZOGBwRbhxauMAoaMaM9?=
 =?us-ascii?Q?mweJX465uwLkeKGf1xNcN7mesViLuEs5hvaJQ3c4l9xuwnv4Kq7Pd5CvPeVR?=
 =?us-ascii?Q?qKGg41RP5eSI4eXzFE6QPDZ7kgTMf5SKwUWSEWWeNwNfwis/czqi8GGEeU64?=
 =?us-ascii?Q?ze4wIFd1jZCQpx2AXP4bx/7pm4U6d4Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a13624-f5a6-4d7b-0b34-08de74960067
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 17:47:53.6654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L392ymFRyzw5xipi/9ktcLlQ/pFk27kz/+cWAhAThslRHpn6kqrdGhVqY1CYhjz+OIBg4wzHfoRLf578m+rG+5fnUhsaTo3Alj8aaKmXrog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1170C8165
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

On Wed, Feb 25, 2026 at 01:00:02AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: xe_exec_balancer: Report skip when test is unable to run
> URL   : https://patchwork.freedesktop.org/series/162088/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8769_BAT -> XEIGTPW_14611_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14611_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14611_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (13 -> 14)
> ------------------------------
> 
>   Additional (1): bat-bmg-3 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14611_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
>     - bat-bmg-3:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

Known issue https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7414
(it can appear on multiple tests, not just the compute-square test the
ticket there indicates).


Matt

> 
>   
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
