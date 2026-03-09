Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E9BEFCD7C
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 10:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF71D10E11D;
	Mon,  9 Mar 2026 10:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDAhbjMb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B290F10E11D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 10:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773051611; x=1804587611;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LkPL1mdmap0DUkCf3DMPr672OwERtaLs4PPux/4lRYc=;
 b=aDAhbjMbyUPqc5PbmclYjy1pWN75X2PBtXpVl3kabtz2cnStd52/oLmO
 MfbOD929gmSlNlouxWt7vj8wXuxFhCYzXmRhBHp6gzBNI6lQ94y8f9Mc5
 iYt3wAPpzKo/7lWJXWRXxYEwdlQhsnkow7jHfcaB/oaGKRLi+saimuxZ3
 RE+WX9/hyvQo3jN3LqjShqd2G1oCj1Ku7nd/pC6MS6437Omo7xVz8RmlD
 xW8TBBul8lyE0EaT0SetJ1i6zjmKjunSDNcsoF/CLTR5qr0yUi60+M2NS
 TXQEWtrySHu8HZL4bjk5A+gGT5aPRksR5PTxmih7qZe8NpE13XN2ANTth Q==;
X-CSE-ConnectionGUID: hNjZxbEyR7mQPyPNL/QFuQ==
X-CSE-MsgGUID: RCP94QKAQKGsBcoWjcKEqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73265258"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73265258"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 03:20:11 -0700
X-CSE-ConnectionGUID: i/9z+D+tRQKyQzE1ltW8lQ==
X-CSE-MsgGUID: kGQltOXSSUKBrezMLHfRTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="222382451"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 03:20:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 03:20:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 03:20:08 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 03:20:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBsEwiPTjNYKNYeFC6tZa5o2SCelIqbtbG1qxYxJL0ArG5GWNPDvDSQDZInZRIqQ9JQn129btMM6d2Y9bjgj8ZWxU4jFDuaFOz+Kv3J2SVM4Gbl4uOXrhCjWg+fFqWFE/N7izWC/cTEHkzU40aLU7z9fhkwDE+lGmkQTDSvDrxNygFiuyrkyQHL2cLPDzze+G0AkbHJFnGjAAW929aRlkDtQpmm+dp19i515EwZ1Hp5sz0N88DOR72gN+ve/LchPEYzYf02cmvTJv5r0UpsangJNPkJoWFXlWssj7/phxENzzstC3+mCRISM3KxJhVxhxPEw1dQrBf2q1/6d9VvkKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54q8456zeBs4lMuQIfKOewy/4A0AoRGhqupAebwU9FU=;
 b=Yzb3iPzi/oc8wjyCFOllsDgtKWD50JsQtYtgKopjczAYvLV0vzqdLekm75Zllk/DPFu6untZpcXWJEY++dLNB/DSi05p/MGf2TcXVkf3R7JL5KqlBMQI0y/LmONEmTpqxjuepTRqO3TGuWpa6e65NXmbJG7lk/C8Sdj23dgTeYTJdavK9THTeYts+xIwyv4Swx7r9gtjXhcxhmSH6j6PNEsfZXRrQjTJqyMBRneikvyywzcZdPtZ+swv+XFZciDsO8LCKShjC2FgjKoQEQIeZy5G9TCFntEP6NJ4ZI/VzjubIKaODlb0oIEulaHcbHMhDjTQLVRr/H1ZhYF1CGc1Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB6556.namprd11.prod.outlook.com (2603:10b6:510:1aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 10:20:06 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 10:20:05 +0000
Date: Mon, 9 Mar 2026 11:19:58 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Enhance SVM
 compute test
Message-ID: <aa6ezm6f_hNqdqo6@fdugast-desk>
References: <20260309043400.2280535-1-nishit.sharma@intel.com>
 <aa6ZELD9LR7TmcAS@fdugast-desk>
 <MW4PR11MB7151CD8C94745B49C62A8F3DE479A@MW4PR11MB7151.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <MW4PR11MB7151CD8C94745B49C62A8F3DE479A@MW4PR11MB7151.namprd11.prod.outlook.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0151.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::6) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e4ed01-2cce-4c45-bc4f-08de7dc56f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: gjk2q9ntuqp5k5VFMbHccuJlr5S+QuzMyXGBSGs+KXbdEdNc8FY55RbbRB95bX9IHpQ2I5A7VPQx3F/1a1siyAPh9YAp/4SzBgXZKJF+5hpGBv2IyjIn+TY7vtay4tl6/94t/xyqIvQmm7xCxqTpl8YSFBLMz4A7jOEE0TM5y+GWUjQi0GbBfbqcMucVFZFgjxxrFwxaR7Zmoc/AY9CGKJj+c5inbYAUsO9rzuXbK7cKPf+iCKCTvRf7c5oxEz5V3mKNMI6wAzjRH9ixWvXTgUX2J4zYsYxpgw2+Zj//ZCSE9ehwrsMDNh9gPfID00aQE2o3CKvtiP4PSKo/VMAwKkESVgxeX2g/1dvYuadLvPAaR8LVRtjekNLIQaolIiXPneyBkJhGKld4SjpfqkL8KCExg6jcs6uumP1XDZ3Yi63PQt86VP+UbEJRYv0s7yP2xUo2Zi+88YOF59LqZDhqo+9WmK9Sri9pk15Mm1PR7lBuI/pSMoqJ0HbyiGmuMmzY4XCfcsvW6Kb2K9D+GUCL7br+zZWCpURD6ipZBJ5+PLcgPAGxYzRfYpz1kVNrv6Mku2tkIyXfFQKqyNodw0C+H5bftpKWVivb2sELU3ZJcpxJROFFc2q+J4cj8zSmCTl2P/dVaUp/o3GjJvOcdhQyx7mJ5t5fD7Mr2yF+lhwNeEGaEYykgrfHMyem6fBEfSIn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sIyIWhs8R6vDKVpNPciz66NwUhIlJcF38Oac649dinbFuYHcD2JWd8FO5laR?=
 =?us-ascii?Q?fe189ECqRAOFfGOzX6qvq9c6IkTPKfueTfDscix1DIvStyrAlkhJpyI7fAoL?=
 =?us-ascii?Q?C3HLK14ESxHuYDlSMP1QCU1agN0U6HwqlAEAhyJ8fZy/BEMQaGMc1FoGNwPq?=
 =?us-ascii?Q?5CYb8PzewA3YduhCvHKZEtciaAS0Ui/7G8zNGAojZobs5YsVgzd6gTkw+vp1?=
 =?us-ascii?Q?2G/8UJ2NgMsrAZARJxfOMLHlhQv2YfWDKmfBHMbr6UADrh+oFxQMACHdMUXu?=
 =?us-ascii?Q?V3HHBjQgLjuTZqB5pEnS8YcI0t5x2T2oBcMM72Auqqlv0ljWc4tuHNcW7Ly5?=
 =?us-ascii?Q?Lr8d2Yvq7mkpVkqQKl0kcbybgcWCjNq7ROnbVMStrtFQVDNnCow0L5PmFgWr?=
 =?us-ascii?Q?WAj0VnuZLpSKtuTZanwNm0eq2ZTy8vLPuq4Mx8i91tKple47Gosdw1zs5hpB?=
 =?us-ascii?Q?roSuIyTeJPtx1vsJaFE9xnp7MHS9L+/ScLElcnAgnIHCR5btrPfpMWUyxqYO?=
 =?us-ascii?Q?prMbAWwpZG7lCAhyjyLdjDCZHpW9NdZtSxZqLqzwBofPPNmT7aQVELKH1LjK?=
 =?us-ascii?Q?rWaVZzfpjZCBJLGPeUNkt4s+j8QAf/n2WWa+xoMEi9hdPi7evEZWM2+sq0OI?=
 =?us-ascii?Q?SnSNqTjM2aesYJwKDifmElk0Tx5IV1lqGwaoZh8wptNDSpXVUN6LcokAacVm?=
 =?us-ascii?Q?tdi7uG+dDXBtwI6F/snwGuSWNYEqmeW0k8ZANrnJva7EfXHtmYOswDpXRUON?=
 =?us-ascii?Q?ca+p11psvkYO/2TA/fS7Vge7u1aNEUdUWYynFowatnP2mLqa+f5mYBHrZ2Gv?=
 =?us-ascii?Q?SiFaQL2ZQINljwIPCWmeEWylArnIr1qc0Y0xwQW+fjQafajEQ3LB7vV1zajA?=
 =?us-ascii?Q?3un3ERampIz66dKMAGE+m1eRFl9RUCHK5AbVwCV43QJDyqJgMHDSnUXGm/R7?=
 =?us-ascii?Q?4skRjftuvruB4MHRui31Qa2wEYloVUcF4kN9WsbwAh3mdPh4UrjezZTvrCNL?=
 =?us-ascii?Q?0kM5YPP/kIknz9qXezW+KrmAH0gExDtKzONRVFGlBqME2YQqRyaI2AuQI9P2?=
 =?us-ascii?Q?97Xr86pJklGLgqV0fBENv4rwAAIwlQIQAvYJ1M5ZT5tlekmp5DVdA9765d8s?=
 =?us-ascii?Q?M+Jvb88b3ijmZ31Py5GPSvS/M9b6J5r3R5u8NkxFqYSA2ogXtAOJzHQEwtfK?=
 =?us-ascii?Q?rYIQLWRydLLqiiP2GEw2Wzufzu5BE2eqO2rauqie+B7tIN+iLEtmBPTT0SBR?=
 =?us-ascii?Q?AEjMdVzZaODmeQH/MSYdDDVsmyyR07GsE6FNGpKzGzTFcO8HewGHtgO+LuCE?=
 =?us-ascii?Q?8rt8GZWarkad4wxkkDFulxZNOqd4nAnoWGeo8mTuAA1AfVG4+/x5Md6cmCyY?=
 =?us-ascii?Q?tR+NaU4/HRm4Uq9q/65wiXT1Q61G8l3Hck7hh7zJSenSQvE2BVuCWin0Lx+l?=
 =?us-ascii?Q?mw8HyFDAtGM41usEay3ysqR6SgjlRsnke6aeacvCFZuRNejowA/rGDswJ0PL?=
 =?us-ascii?Q?dIi4VCTknWDI/p9E0/7Z9MKn65ZbW74i61M8qsU9W7VmOyfB7s5QfhiRH1iI?=
 =?us-ascii?Q?9Pi7cQjmTLKava7D7LZKDP9Z0HeR3GQBAmA9mCH/ScXd1QzUfhFtlRWXUG3Z?=
 =?us-ascii?Q?Nyi5sW8qdfZ8WHL1jm0IKwschweMH5/O73b8ObEmsc7w89E3P8YQTmakRAGy?=
 =?us-ascii?Q?k4eioHdFvcauZWwBHd3j9NyvHEfC8gu6f3hNMTrNTJ8x7DRx6ZkyoGbBEzgX?=
 =?us-ascii?Q?COXcTfiRr4TT+zECdgTBPkDOBKQY3X0=3D?=
X-Exchange-RoutingPolicyChecked: Vy8rA5CkV4yhKlonodI+ZS4/lewSnETDdee6taXFOImiIq6yCRu7Kh29hIOkPRDiTFeO81/W+TQK9BYay9p/CWOFOG9K4U/+sXZ+m7Vo0bFAt2UyNq5BEHeCl54jaS8P1HpbF6qryRulzdYtj4fnctyLmwWDNRlVDYMQ1wQW9npZBceh6xDdkEeRqZ4E34Atsu1jRH4WcKo1X4Pz9tpQ4s0gpdv814RqBf1aFgzARABTkjY0vx76RSheOtPpiNeKPeG/Tq0KydNGYkevPnbK5bPiX5SxKodWapEi0EWyHvZxbBSjdU2LiDS0/DVX2ta/nkPeqbdhx61eI7qy54xoCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e4ed01-2cce-4c45-bc4f-08de7dc56f01
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 10:20:05.8927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRSME8ExR0iFW0mV59WEivuXOAxeTK+5xLaeVfXHj1TxyeVXrjnL88yLdLjsq7TLEtJBFKt6RCmZXKAY7Y7r6jUFS4blTZXmaZ6vg77b9qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6556
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

On Mon, Mar 09, 2026 at 11:01:25AM +0100, Sharma, Nishit wrote:
> Hi,
> 
> This test is giving assertion in one of the platforms and the reason it lacked output buffer support in lib/intel_compute.c
> Without SVM buffer support in lib/intel_compute test executes just on GPU Buffer objects not on SVM buffers.

Not sure what is meant with "SVM buffer support" but one of the 2 arrays
touched by the compute kernel is a host allocation. This is why execution
triggers GPU page faults from execution units, which is why I added this
specific test. One way to confirm this at runtime is to monitor GT stats
/sys/kernel/debug/dri/0/gt0/stats such as "svm_pagefault_count", which
increases in the current version of this test.

> If output buffer is not used in tests/intel/xe_exec_system_allocator/compute then SVM buffer requirement is not fulfilled.

Can you please share this requirement?

Thanks,
Francois

> 
> Regards
> Nishit
> 
> -----Original Message-----
> From: Dugast, Francois <francois.dugast@intel.com> 
> Sent: Monday, March 9, 2026 3:25 PM
> To: Sharma, Nishit <nishit.sharma@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Enhance SVM compute test
> 
> Hi,
> 
> On Mon, Mar 09, 2026 at 04:34:00AM +0000, nishit.sharma@intel.com wrote:
> > From: Nishit Sharma <nishit.sharma@intel.com>
> > 
> > Updated test to validate output values against expected results after 
> > workload execution. These enhancements improve test coverage, 
> > reliability, and debugging for SVM compute workloads. Updated test to 
> > validate output values against expected results after kernel execution.
> 
> Using a malloc'ed array for output and validating output in this test both revert what was done in this commit, for good reasons:
> 373a6dbfb tests/intel/xe_exec_system_allocator: Cleanup compute test
> 
> This is because the test is used to finely trigger page fault floods from compute kernel context (EUs) and we want to avoid interference with 1. extra GPU page faults and 2. CPU page faults, so that we can measure the exact impact of KMD optimizations on page fault servicing latency. Please see:
> https://patchwork.freedesktop.org/series/160784/#rev2
> 
> This change would bring us back to the known previous state, which prevented those measurements. Can you elaborate on why we need to revert?
> 
> Thanks,
> Francois
> 
> > 
> > Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> > ---
> >  tests/intel/xe_exec_system_allocator.c | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c 
> > b/tests/intel/xe_exec_system_allocator.c
> > index 14f5e358f..e670ee007 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -2257,7 +2257,7 @@ test_compute(int fd, size_t size, unsigned int flags)
> >  		 */
> >  		.array_size = size / sizeof(float),
> >  	};
> > -	float *compute_input;
> > +	float *compute_input, *compute_output;
> >  	int i;
> >  
> >  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | 
> > DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0); @@ -2267,19 +2267,31 @@ test_compute(int fd, size_t size, unsigned int flags)
> >  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> >  
> >  	compute_input = aligned_alloc(SZ_2M, size);
> > -	igt_assert(compute_input);
> > +	compute_output = aligned_alloc(SZ_2M, size);
> > +	igt_assert(compute_input && compute_output);
> >  
> > -	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> > +	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size / 2;
> >  	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
> >  	env.input_addr = to_user_pointer(compute_input);
> > +	env.output_addr = to_user_pointer(compute_output);
> >  	env.vm = vm;
> >  
> >  	for (i = 0; i < env.loop_count; i++)
> > -		compute_input[i] = rand() / (float)RAND_MAX;
> > +		compute_input[i] = (float)i + 2.0f;
> >  
> >  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> >  
> > +	for (i = 0; i < env.loop_count; i++) {
> > +		float expected_output = compute_input[i] * compute_input[i];
> > +
> > +		if (compute_output[i] != expected_output || compute_output[i] == 0.0f)
> > +			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> > +				  i, compute_input[i], compute_output[i], expected_output);
> > +		igt_assert_eq_double(compute_output[i], expected_output);
> > +	}
> > +
> >  	free(compute_input);
> > +	free(compute_output);
> >  	unbind_system_allocator();
> >  	xe_vm_destroy(fd, vm);
> >  }
> > --
> > 2.43.0
> > 
