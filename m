Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C004D116F3
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 22:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67BB10E42A;
	Mon,  1 Dec 2025 22:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPRypD1B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35F510E42A
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 22:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764627888; x=1796163888;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rT1fRd4laE4dT5Ffbm4e/+CfeKN3u14SprWV1299dc0=;
 b=DPRypD1BqEnXWII0weuWu86eDxex0/XQlW4pdZAN35CYykUMz6KMx2CL
 rzlgmxLZ3dg4WiNKVtlBZaTwfFgXkofdCGX6nwgwtdUNydI/eUEZuYdLp
 BNrAltvWYHc+MdsqarAubTuZf9uSMepWin1TzXriYbbn/Qw5yr03pSgY1
 Mz5ey/IS92aTez8yPtSRxkj1X/Ex6DKl9KLL0xjEfSD2pYuo4BDq3GNVT
 /1fTKyhaBe/Im1jVNY6W0612KXTNt190a9ZWuxezIEKaz1f0k0Qh2mhV+
 xa79LLqWKvB8TjxJ+4al258EILD0wH11TKgwIFZ2Xevuc3gCKzYyuEAMj g==;
X-CSE-ConnectionGUID: o5dILgvlTEWL2ttHWoV/gA==
X-CSE-MsgGUID: geTJisucR6u2vhzqeNeU+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66658997"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66658997"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 14:24:41 -0800
X-CSE-ConnectionGUID: 268xzgE7R02Y6PJzDiBYDA==
X-CSE-MsgGUID: qZGgW4O/ROWt4L/EXA70Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193867500"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 14:24:42 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 14:24:41 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 14:24:41 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 14:24:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tb6HofgmLQwk0ua14mD0g2K0Xdd4zp7hlG2+JiLTyXZXZoG4PY8lQfBVXnlpL3SXAp3bK9upRvHmyj+W1+OM6wiqI+uxJrmAF6BdfqsIyT5O1afbEUOPBwsAOimQzRHBjo0QtdKP8rb+kp9xC7/gFqxsMQNuPul1mjm28xLJgTCTV0CPAMTRqujYmM+xfYXxozhTB5EorsXXnmDLGJrgWAPFyzbYCTXMm9PSOpbfHDp9t4GvRjAMSby/EQ1monoAaWz9bbqieu/N1v78iduXQJPuv7qivHtAeSS33aEKPgGTvFm3yHrRRJU7vA7+rI6j/RMmrBVJ4xng2N+uqtUCEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9PI+srO60tJ0h20DnjR+niCaP7XAWvCMofsUfKb1fw=;
 b=MREeClHCnhaVCEuWiDor3AesrYfEHx6eEN/aoTiO7eBB94QRylVOqyB0RXpUvbBwBQ5NBIvKbiy+e/ozbogNfMPlbLyg+hTjm+usnSoXhs/C8ZeKh5vv8EsM/zAKSvWw49ByCUhTWZvj7cn52Jx2f5LUM2kcRtNSbcTS0lmZqvsreB3ebJqv4sArvMxfU0rdeq7MAoRym4GS821J6D1gh9wEUVajHhYj7zr0R1ahQqIoL8hglYvkAKvsXHVYtpsHgEBHPo8njw2a5R/U6yXMY4m+hsGns39kuKWFTVbRBxDZBYENGqrkH0SY/MU2NWMen7kRRQnXT/g8lD4qPag9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF6CF7B12C6.namprd11.prod.outlook.com (2603:10b6:f:fc02::2c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 22:24:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 22:24:33 +0000
Date: Mon, 1 Dec 2025 14:24:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] tests/intel/xe_exec_queue_property: Sync to latest
 KMD properties
Message-ID: <aS4Vn+EhJvVMCRUV@lstrano-desk.jf.intel.com>
References: <20251201182114.851967-1-matthew.brost@intel.com>
 <20251201182114.851967-2-matthew.brost@intel.com>
 <20251201200807.GH4065316@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251201200807.GH4065316@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0125.namprd04.prod.outlook.com
 (2603:10b6:303:84::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF6CF7B12C6:EE_
X-MS-Office365-Filtering-Correlation-Id: d6ad63bc-3122-4c16-7d8f-08de31286752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dG2tt7H+5O6bDqT5CxmDJv5FadLd0AL+ZxvNQFJKrLEF0Gk1zkqHCTfm6k6t?=
 =?us-ascii?Q?0/mWzlA9osNlQTWi9BA818YDhXJy2rueeYGVUR1PQu7bWYjOmU8hPFxxbcQU?=
 =?us-ascii?Q?TJuM2OZ/1C2RFAzeVwhK7tdJrmjNcBveOv9EVsO31ABhrTAKA/Wr9bH8yr2D?=
 =?us-ascii?Q?rRuWwp/ceEH/Y3I27b4elPVk1OeGMAQMEAMd7LRuUYd87q9OtF4TFmrf/URH?=
 =?us-ascii?Q?A7mhxIxxIyG5W+fMJSynHhyGt1XKYXr81N34dqpInIhEqNyd7kjPyvDd/BkA?=
 =?us-ascii?Q?JaL4uMKjybVXLpXYS3nExdMSLbtRs3xTBnOt8JUWv+ERp7nEdDDkmY9GSxhV?=
 =?us-ascii?Q?rV78u+SJ+2wuCTKPoHEW3KLhYNZzbM4v3EF3uZA1LzMrPTO4BSMtqCuYrfiS?=
 =?us-ascii?Q?hpMo46gckGxQWV2i+ofzfkpLd894AcUnVvQOLtz0GK+rVKtXYNMjqaS/1mi4?=
 =?us-ascii?Q?7KZ1CMezZL5A+VKS9HMh8N+FO5UZemTPZ3X6zjp3IH/wyOyi7YWZSQJNYqqh?=
 =?us-ascii?Q?iYNDmZG3Ifu6Uw77HosA/6CTFLxvBeyqLKhIomWc7widQVzYoloLZ89DG3M2?=
 =?us-ascii?Q?BoDn+3tdSrzWvgh9CCjvjDV0cygDhuZDb3TdymPiH0ibit4MEvdOnbAL/ZR/?=
 =?us-ascii?Q?2c0OAd07IocmgGsthOqMQavH7bojkDpYzqMTR8IGbt+zns6crm8jAmqKnOBQ?=
 =?us-ascii?Q?vPiGV+1eN7vagCMgvbHztCAEhL+/7BrnCbd+cJhOyPTcwp+ozafvmUgaJdpA?=
 =?us-ascii?Q?BbrKTPxErY4UzjzZZpLjj2WbC5e3vkoe8aa3zmVR22cNtXiTJBQih6gSS3E8?=
 =?us-ascii?Q?8+gwrLq5/Owz5GGs1PoKWKcec5yT4Q11OT5aviXbAJgPqxueL6oHHROOKK2z?=
 =?us-ascii?Q?vT+XwmgZbFyJ4zhuzhLl0eYkZUHM9Z1bU9cKwfynKhRmzO5Cr1EgekQ8pnHm?=
 =?us-ascii?Q?j54F91YK4cXE1mH5Qz1dMSL2rQprTQbJ00WHYXhqyj5ryh+EvQYPXhXtpOsU?=
 =?us-ascii?Q?XGmz9C5WbnCDtmp023+Q+S3SZoJChczUVmGkyjGxxvafqVuRgmqJgBSkMXqp?=
 =?us-ascii?Q?/UwB7oTo8sQCBr53QqUYzGgB+l1irN5sSEO87dfLOoENlCwE9dV7iJKptqv/?=
 =?us-ascii?Q?TODr0nRRwNwlM0/eqOhyPlIoT13a+neaFN6H9kktKPeJc+xNmNR9jzaTpi4s?=
 =?us-ascii?Q?2GuvLcqGFYlgpek+c35hEEMQNMW3QO/lombpvqEmr74ftc5kAsKwR3SVxMTH?=
 =?us-ascii?Q?WDKXFDiZ/1es9Wp19t90ULkKpEXDIwoDGm/rF1CByl0a7mH5ngMagbwwJ4o9?=
 =?us-ascii?Q?ut2uYZblNacgPe+j+0RkE52gMNqQLDCSI0hqHbfCxWF9OVC087r90qNteYF7?=
 =?us-ascii?Q?Q24WNUVI7MTOb3KL/MQVPsdQ0a5jMm9eBorIFz7y99zdxNxsgXJfe14+FXYN?=
 =?us-ascii?Q?5X0LzKvZhHe58JGJU5Lq0Rw/dgA+94kQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V9xtJyZO9YTFTvCU+s9XY0HR2b+oNz7SQp7MDKAIKThy9KoaFJ42z3sY/WfC?=
 =?us-ascii?Q?KZKayATMnP3YRCIP0qdUk1Xk7eNQRLnAat1OoebExqmihSI4L0SrPEGYuqXq?=
 =?us-ascii?Q?G0yQ0o1fsYli1qP2L5KO2jimO6HR+q+4tWLclh95kNiOZLTS+wOVsiKlbDEM?=
 =?us-ascii?Q?6Pu2K2cC+17zYnDLg1mgZ/cVRea9VibBo1s2uUz9/+Hm+3KCM6hbk2ApIK4A?=
 =?us-ascii?Q?KGzS5JwjHh39IpQfBlvPCjh3XcGiUgTLRJkEOLP4d1EqehQyJJiUz9FN+1/E?=
 =?us-ascii?Q?cGf1jgJb7iYdo2npqrD6qQrpWm8GC7sr4IwbPilCAaUphX9bnmcliK/i5OhI?=
 =?us-ascii?Q?rcYLQPD1VIrzIIpBJvBsS22Qk6X75AzChEXsIFVS3j4WPgmFR7XMhGtoBjnT?=
 =?us-ascii?Q?Odm6gGtzrhiJE+voO7G5BFH9FQ//xTAZh19rQHaYRfRahXcSsP9P+anePPdD?=
 =?us-ascii?Q?xlg79xzI8Yj8eJrBcCsV7Qw4wGcQI8JBn200pJTZq/GXHB5Zcgr3cpkqMGe8?=
 =?us-ascii?Q?T/1l37ed2v1LhTCQcCWidoQUXfNrKax+vKUEEhg19psAcFUbU9C75DbGdoF5?=
 =?us-ascii?Q?EVgKrg6Xaes1BV/y2cy0MbIp+9DmjTEzrdUeybofEm6xFtAuwIxCHcz/uOxz?=
 =?us-ascii?Q?S3e3zasRpllBcV9CQqsmyLWUP5fkr0dMC/amYU8Oz9p9Cn2mSUmFDwAG1vlW?=
 =?us-ascii?Q?CdavwcoB2ZFfwYE692+W36bioH2KCUqWO6TweQT7NPoVtcPnoOPoqhJcQ9Vm?=
 =?us-ascii?Q?DE+ENzNhrnYdsl1AehatyBJNRV8U/1FDYyhUlLjitcMDUdSPV1dEG2DYwkfz?=
 =?us-ascii?Q?0d28hSEw23zsJScQvctxMvy1ShWUEH4JQj8FtKoPlwPnADXJe0MRxB6WhjlR?=
 =?us-ascii?Q?CpfSemoWyCvzomw2gMsb3lINzJCd8AIOI2cJAClkGmavKKGe3OSZbX6fCAf2?=
 =?us-ascii?Q?62jlITC5u/XdwR9Rn0SboyMUQ02mRn6z4RbLf9OmtT6is8JqEYOtNgxhYLya?=
 =?us-ascii?Q?OvzhpjOmhaIsSHQ2N3eRyIyHBc9p74DuLxJcjl2YTKRmrsGuvO0Lb2EhfaWa?=
 =?us-ascii?Q?taGsIyg5nDjMycgv2z9qIbwG3fC2hnWNRoqv7H5gBUUd2D69CXiPhWQn2ROs?=
 =?us-ascii?Q?Qufcgl7Au0UzZtxs4EUBi5n25ZQ2+Y7vOhI4+fKd7yFTOO6NZ3UVsCy7mm9K?=
 =?us-ascii?Q?NDiHdCXqwjeYNkgorBNFlCJ6kJMS+QHRuKrBI4OaO2aZCXEXUaYLenC2AsPE?=
 =?us-ascii?Q?m0MwJUopbNbYyQBEwz5BNEPRrR2CxcTgYEQYtN+q6jz5SoGsisBaGHzvKanH?=
 =?us-ascii?Q?+aZN07KqrngsmAyI0TLTCBU8JfGQklydlku7rCU/7uNpbFtgh4ec1Vu7XSSX?=
 =?us-ascii?Q?9qVbE6wHy+DJED5KGEj4bgPeBfy2lk8EmmIoyltwnuRVZOPZLrEWjktBxWc4?=
 =?us-ascii?Q?v8RRRFxTdNbx9oZNMYRgcALl6YrHyJRuJkdi4MSnSFLo6aOkzzz+N0N9tgnu?=
 =?us-ascii?Q?5aXXDZOAiAzLDdw0mM5E14qKv6QEYi7Fu2pgWR7Eg+sAkCeaAJnD/4nxQgQ4?=
 =?us-ascii?Q?5zREGFk5NMLnz2DTITdzTHNKHNp1vF2bDl/aGH2C5MFOAmfh3L5JZowwYOS6?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ad63bc-3122-4c16-7d8f-08de31286752
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 22:24:33.6412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2C8N1dKoJRhgfpsNkzj2pTjwCopW6Js1VTpoPD8wX5p3DMMsXcdThwbKyQ3NH0UHOOxLtAkll2JijZNyh3aZog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6CF7B12C6
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

On Mon, Dec 01, 2025 at 12:08:07PM -0800, Matt Roper wrote:
> On Mon, Dec 01, 2025 at 10:21:14AM -0800, Matthew Brost wrote:
> > DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE was added in b80961a86b40
> > ("drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE"), update
> > invalidate property test to reflect latest KMD exec queue properties.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  tests/intel/xe_exec_queue_property.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> > index 4dfcf09e26..7a2fbdeec8 100644
> > --- a/tests/intel/xe_exec_queue_property.c
> > +++ b/tests/intel/xe_exec_queue_property.c
> > @@ -172,6 +172,7 @@ static void basic_get_property(int xe)
> >  static void invalid_property(int xe)
> >  {
> >  	uint32_t valid_property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY;
> > +	uint32_t max_property = DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE;
> >  	struct drm_xe_engine_class_instance instance = {
> >  			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
> >  	};
> > @@ -189,7 +190,7 @@ static void invalid_property(int xe)
> >  
> >  	/* This will fail as soon as a new property is introduced. It is
> >  	 * expected and the test will have to be updated. */
> > -	for (int i = 3; i < 16; i++ ) {
> > +	for (int i = max_property + 1; i < 16; i++ ) {
> 
> Is this loop actually providing us any value?  It seems the main thing

I don't see a ton of value in the loop.

> we're trying to check is that the error value for invalid properties
> comes back as EINVAL instead of something else, and that setting a valid
> property after an invalid one stil works; it doesn't seem like a loop is
> really necessary to check either of those things.  Would we lose
> anything if we dropped the loop and instead just checked a single
> (really high, more future-proof) property ID?
>

+1, let me just update this test to do this so as we add properties CI
doesn't keep on breaking.

Matt

> 
> Matt
> 
> >  		ext.property = i;
> >  		igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
> >  						     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
