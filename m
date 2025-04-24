Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD09FC369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 13:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4F810E0EE;
	Thu, 24 Apr 2025 13:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQ2v4FwX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC9610E0EE
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745499637; x=1777035637;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1WuiOo3jJ2157KvyBNUwYKGhFTlVRI8HsPmLHL2csJ0=;
 b=JQ2v4FwXqh4ipgP/ialegOyhn3DI1JUGpBiQOR1RatOnLL6Ysl42++X2
 n9PIyP0m+M4RVDiPc9rCK3jtD5Bt9git9EUipmVUW/YWLcpaSKkuWMMwl
 d57EdguffCY/0plSJVSTx+WOjAm1G0Vd4fHDh1THBDFCM1RK2VDDDCztr
 rOmDlcFeGiBIPZJRnPGlcN9slzbq+i+NVKIKz8skITlH/Pnl1Z4GTKJ18
 xTNs9vegHfpz09tWqAp4pKlUCichuxRIu9/gz4v3M6Ykjj8wNhbwBq2vF
 E7J/buapWpbXb1ms8yjjorVOq68gLOaKBkh0Z05FeahDqP1h4uLo7LGPz w==;
X-CSE-ConnectionGUID: p35y/id3Qa62Bt7j/STy1w==
X-CSE-MsgGUID: nPV8AyuZR8KiGxvwaUEzoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="69616061"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="69616061"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 06:00:35 -0700
X-CSE-ConnectionGUID: 28Q5BjT3S065Ki6Yd3ic8w==
X-CSE-MsgGUID: fpMqjAtAQTKFJV2GOG8YDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="132919893"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 06:00:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 06:00:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 06:00:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 06:00:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4dQRmEzTqfDqYUGf4wPWne2vhhdRvHQST+awoSYW/v4MGzGDanaOADcpdzWGfr0Vbm/MHzU1BYJihsoZZgaACAPK7i/uU/mI8ODMfv9V4lSSqPbWtvu2eb3jTn+wITAjAln+mQe5mhMId4Dk/col5Pp5HJi9nG0ZZ5UP/Hxx/uFhqAuPmyqlwgj85b1Wu1BjFBtpQIiu+4D50WMD+30tsFc5G7seeGxZ8o6b0IsO7Pmshjsqy828BoEuwREC6rHCh9ivlbzupa88gNxJ/714X6S2tEU/sMSPkiU3X8V1cy62x9cjxggwHqPwr0alVPJwcUSNJJuZcgHx3G9w/NPVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyIVMob74bMaKpJU13yQpTw0FMQyAP8Vj6S4ddKvNzY=;
 b=hH9/RfS6Z+EP08tnX0NufdO1Z5Qr9HbqgnB2AcqJR0Mj50ta/pXom0aEBcWEOG0P1GthtGHRGyQEJMgrTb2Alch2W6eP+ql7hc+0t76R3+PD9JkByJB+STTmzj57TqAF2UfE0GqivlGv+Fxtwn99UPMuBpyzbv3Cz9H3IgzoUUgDEsLemcIQ4L4+DNoBohrG1e5VQv/aqrUoRbdcaD30rCQ4htuPn+vJsZQ7WWI1ZeysXtG1s1e2rzT+iSujdVKzOyvHZOeuUpscgO0z9awqvM/xUuYqOdNR9l1cOTg61nxSO9JKV9DtHvPSYO0etPyUrTZxnH4RLLrW91NWWxSGTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB6776.namprd11.prod.outlook.com (2603:10b6:806:263::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 13:00:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 13:00:19 +0000
Date: Thu, 24 Apr 2025 09:00:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <kamil.konieczny@linux.intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_configfs: Add test to validate
 survivability mode
Message-ID: <aAo14Cz7qkrha4ug@intel.com>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-6-riana.tauro@intel.com>
 <rxwug7vusfk3npmlpvad43qhgo2rqa7jwi4wtfbhnei4f46sty@wjylvkykbjgr>
 <aAfuM25ln-ugZd_W@intel.com>
 <md6mljnmwsujfhv3up22l6rqhlmfyhg4qicqonkhfetabsako6@z5drpnypwqyr>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <md6mljnmwsujfhv3up22l6rqhlmfyhg4qicqonkhfetabsako6@z5drpnypwqyr>
X-ClientProxiedBy: MW4P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d544017-54b6-4992-2d7b-08dd832ff77e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bk2NwzJv2aqUx8Uso/8vCPBG1smg2XusgmoN9Er0GjYp0GSJWWwreKgXWRFB?=
 =?us-ascii?Q?wL529DBAhd7VD2FBbkC++MbBxW9hcc7qChiuIAYjt4TV00jcnIp5a8bPAOfo?=
 =?us-ascii?Q?qDHew96+YlDM2J9K2ch5QUHVy6GvgoP5FMNwelx3Gp+fd7oxLWCNrdbGZGSa?=
 =?us-ascii?Q?zjh8Y+KbclX40EZn8XLHf7OJ75c/92dXiH3OiyP89054nWx4gTmBgYFHIA6a?=
 =?us-ascii?Q?twtIkQ2D/Bti7GV2kZffCZzf+7znYJPIuj9aPsG6SoX9QhNxVUjFe35W05rl?=
 =?us-ascii?Q?eAGYiVAwZiefGmBu61rDrEY96+QUGNn7fYBCqSBlFis6ZmoCBB4ClQZ34ZDn?=
 =?us-ascii?Q?Wi026rQYU+ahlkHCOv8T8H/tnddjCSvbqciI6nJntAVi9lM/DPnuv2lRrJnQ?=
 =?us-ascii?Q?5enSElie+Qj/3id5J67wYZnoBgCZrYOFi3CMKtrVfra5hD/WC+t+fO3PAk6Q?=
 =?us-ascii?Q?hD7l+O6MNVotPva8cA8KtY2f54ev31KmEhOg/A/1otRrkE0PHjCAqb3+kHqs?=
 =?us-ascii?Q?krmw/2//88hRnX4tDZzBLLC9TYQEXp3PLxux71reBrfiQkvksafKteFdCkxC?=
 =?us-ascii?Q?axT2kun+EoNx3YccaRcyfAPPum0VT2Bmwuvf8WcD35owIgK5sUpQoXLOZKot?=
 =?us-ascii?Q?IttOiYhNsQ6x5DzMtcB7O6sdcWchDLCD0l4EtJ1HQC3obQ+NryiV1RGo+Oq6?=
 =?us-ascii?Q?YDEEL8G3+PE011xer4vPBaBBvX0aIVxAd4MawA6XwXGED6vpEiHPtyh423/Q?=
 =?us-ascii?Q?FVfFF9avH+P5oux+2vLJqhvWlLfHRdNhFEo4vD8YvcbjbC6aOHu7C+SGe70J?=
 =?us-ascii?Q?cSI+/+KoIy6JDbVm4bP77daF6gwhYpJ7coLbOpk6hRW5JXZBwQ0hPCOlS1BA?=
 =?us-ascii?Q?4eLXq+nC6+5IwFdp8koSTqJ+0zl6Myp6GaF00TSrx1tzyDF6C2ExTeSnxDxU?=
 =?us-ascii?Q?VIYtH9S6JhXKm9LnMMj0nkYt1FxdnN+pCYWnQt5DitTO9NDoayBrG5PcBNO2?=
 =?us-ascii?Q?tkHNT+Yuzd4pbJwN+H3az3Sg6VcuznETQAX/kAxtp8njA9UnkhXjx6mY6U7W?=
 =?us-ascii?Q?UKvfgvdpbp1Ty2fmb66xGXatqgOGH7rwbB3qutVGmYw68/BpXZjbrViShT2k?=
 =?us-ascii?Q?++vd/SagZeOahJFa3RibkhfOq+9iTLBWRj8oXFNsgd/2WUEF29d/JnpZo0cu?=
 =?us-ascii?Q?p3NcoOga32DSi9ElW05jjLwcmFo972RQLb25vMNHqcDdDtprLth8+daXdLPf?=
 =?us-ascii?Q?KDyn5Qvnks3W+gF9ESM+TPG9fkJKyjKl3+cl1Lg5O+acz1+z9Sq26vW0Kgmf?=
 =?us-ascii?Q?/LQ1E6UxppCjHEGsNjNgvXdj6KB49CR068px1dUG5CyCWjMIbjjExr6hU1MY?=
 =?us-ascii?Q?jiEGrru9sv8YCd6a1YogXwsLDE1HOVZcFzcgiQ1Lb2H6XIoEzQ51VjyvamnQ?=
 =?us-ascii?Q?+NL/Y1cL3zw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zW3Oc9uNoAZddj1/koXMuO0xjXVRaQ2SdRQX2ADWbg0qLFlrTW+5Lho6TTbf?=
 =?us-ascii?Q?xBjTbEWiDa8aVdq8mDlBGn7YhnXwQhm3ffZmFcb6QwqdnTm3a7oJOdUZxP1/?=
 =?us-ascii?Q?NeIxQhjtsU+N4z30Oo3OKH7f5RWz30FHco3xEt7TJto5MUrTKz27DaHZtWcP?=
 =?us-ascii?Q?SCQm6KkF9JyekNdNOZFQdDdU+TVwKr8cbVgo2bq/ndeqRecyuwv5Uf1PCBvW?=
 =?us-ascii?Q?ijzpxBIjTtyH6anNzWeFN3UrnDrQSMfIF8euzT/DpaE6d92WlSz4NEJs1Z5b?=
 =?us-ascii?Q?mOzZHxGbYh77wsSLx9tTpeAlO2Y6NNlO8suPlIrpU2025Fw5+I7Vlu5eZsHp?=
 =?us-ascii?Q?SzYZ3FOgXuGKEDYDGF+hrmjdOsRdxhm6kT+kszR94MG2zOhTEtdWwqys8XSK?=
 =?us-ascii?Q?DEJPVyGlB0RVi5Rln/vq6Uc9PuJmNMavLhDkl+qc1posmavg6fAkkjDrTZ4P?=
 =?us-ascii?Q?rW/CZ8mFtwvE/SEuW16gX9/k9Bo1HlhXJmi1qZQRHT2Xp7r0z7rS4KuVJkuK?=
 =?us-ascii?Q?QUldLHMGXXJUjhZBeAbyuBLWTN2vExENoX+VIkuOwiiZR95D/iPXywg4Cwss?=
 =?us-ascii?Q?mJZn4kUrSscvKiK+4b2SS1iVpUni0y5XZYYb1rSPAZ+xlH1gpXLK92xkySCc?=
 =?us-ascii?Q?kqvxQDHmYaIkO9Jhf12wrTaaMAKQd+DDffLcyN9qC2TdUd46p0cLx7LNGQhZ?=
 =?us-ascii?Q?CPmvkY34uo6GnxQADjsVlWhXlkSjjwHkFyAyuFuyDchzz6OdTXYbZikXGTzE?=
 =?us-ascii?Q?Kqerokpu8DB5UNApEhPE30jwMQuQTNOYGN43Qa9/9TnyD4xQZsSL1G/P7rkK?=
 =?us-ascii?Q?d3LqFronDU9T+qb9vPQmFOlOBMuQ96TAgilzIfAmb4B4hMsS966S2Q4O7TwA?=
 =?us-ascii?Q?R9yJPpOLgYVV8vvS2a6gZAQWysE0FA0kgC4iqGGsc+WxKn8WfUz+UpEcgCuz?=
 =?us-ascii?Q?wJZw/w9zZUzBCgmbzi7xr4wU4C8sMrRGg8xH+cOhF0gVw6PIxZNeL3IAkGBI?=
 =?us-ascii?Q?G8mJL0gGcSPYhRzYBvlSXtIZINpInhIVFsH3sCnIi3Jm8URKDzGngZiviEKA?=
 =?us-ascii?Q?fyBL+94n3nQ22YnmcyyHOatNE0TNRAoKftHicfEGexkHJ+rLNro/VnsNWywK?=
 =?us-ascii?Q?aahe32kG+uOCSvXOKG/Y1rt2xgBqzOhkcOBOIfdLhY9xWnbEC9mTfIAIr214?=
 =?us-ascii?Q?TKi1sIFSx4mUIx6eJVdqXgkcNgBT+lna6ducYvAW18r4TMSzrqhK7dObGSwN?=
 =?us-ascii?Q?IRLLYReg8NgJmUGXS5VWS8+t93LCr5t7r4Bnj+cB+2HfWeZW73qi/sccSz9n?=
 =?us-ascii?Q?gTQfxUdpxMQK/ozM1x7UqAnDt+H7rwaHGxf+U8FhYmm/aNuPcPoZnKnpmTRc?=
 =?us-ascii?Q?NL7PuviSYgSxsUeUbshN4HSs3fPOJf/aVxlC8CxaHJF3kva1sX+r598tne8h?=
 =?us-ascii?Q?I2oyhwFnki4xHKZntqmfvlhikXgh3NDpiUzqJZ7Fd1PQY21OdEvkybcrGwAL?=
 =?us-ascii?Q?S0LL0oU8hYrDgqI4W4G+nK5ZuhpXKKNouUc/j1fCkArnfrygMvuRNBVqz0GK?=
 =?us-ascii?Q?vlzh0+YMUZg2eY+DGSq5fUy4mZiKA/KnrwIJj8Du+SDmhjiO3AjSDnRstPeu?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d544017-54b6-4992-2d7b-08dd832ff77e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 13:00:19.8243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4w5wEo2LsKEaQP3XVOALNVFEu8skMypZkQqtP9xGjp6Bbk5MczYMi1hQr4GIGNNa+keFP5mBRn6QB2T/OZ6Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6776
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

On Wed, Apr 23, 2025 at 11:17:33PM -0500, Lucas De Marchi wrote:
> On Tue, Apr 22, 2025 at 03:29:55PM -0400, Rodrigo Vivi wrote:
> > On Tue, Apr 22, 2025 at 08:57:35AM -0500, Lucas De Marchi wrote:
> > > On Tue, Apr 22, 2025 at 03:26:01PM +0530, Riana Tauro wrote:
> > > > The test validates if survivability mode is enabled on supported
> > > > platforms when configured using configfs attribute.
> > > >
> > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > > ---
> > > > tests/intel/xe_configfs.c | 112 ++++++++++++++++++++++++++++++++++++++
> > > > tests/meson.build         |   1 +
> > > > 2 files changed, 113 insertions(+)
> > > > create mode 100644 tests/intel/xe_configfs.c
> > > >
> > > > diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> > > > new file mode 100644
> > > > index 000000000..414af4a86
> > > > --- /dev/null
> > > > +++ b/tests/intel/xe_configfs.c
> > > 
> > > 
> > > humn... does it make sense to test survivability mode in a xe_configfs
> > > test? configfs is just the way to trigger it. For completly different
> > > areas of the driver I don't think we should bundle the tests into a
> > > configfs test: we don't test if xe can be loaded without display in a
> > > xe_param.c test, or if we can inject faults in a xe_debugfs.c test, etc.
> > > 
> > > My suggestion is to have a dedicated test for survivability in which
> > > configfs is part of it.
> > 
> > Well, that would work for survivability itself. But perhaps it is good
> > to have dedicated entry points for the knobs we expose, like we have
> > a single place to toggle all sysfs and debufs. So we don't forget to
> > add new cases and we have a single entry point to quickly exercises
> > the knobs.
> 
> humn... dunno. The problem I see here is that the answer for "does it it
> work?" is quite different for each configfs file we implement. Some may
> even be honored on probe only vs others that can be set in runtime. If
> we had a generic way to test the configfs like:
> 
> 1) write XYZ to file
> 2) read file
> 3) make sure it's XYZ
> 
> then it'd make sense. But for these tests, checking that is not testing
> much.
> 
> For survivability we should test:
> 
> 	1) bind the module in survivability mode
> 	2) read something to make sure it is in that mode
> 	3) flash the same firmware... possible?

I don't believe it is a good idea to make our validation here to depend
on many other external components. Our role is to put the device in
the survivability mode. So, validating we put the device on that mode
when requested it should be enough.

We could check if the sysfs file is in place and that drm/card is
not in place. Then it would be enough imho...

> 	4) unbind the module and remove configfs
> 	5) bind the module
> 
> For possible other things coming to configfs:
> 
> A) Extra Workarounds
> 
> 	1) write a {gt/engine/lrc} regiter-save-restore
> 	2) bind the module
> 	3) check for each of them, via <debugfs>/register-save-restore that 	   the
> value is correctly set.
> 	4) repeat test for write types like rmw, write, set bit, etc
> 
> B) Fuse off engines in software
> 
> 	1) write a file with the possible possible engines that we should export
> 	2) bind the module
> 	3) check via debugfs that the exposed are at the most those
> 
> C) Do not attempt enabling display (i.e. a substitute to the module
> param)
> 
> ... etc
> 
> Are we going to shove all of them in a xe_configfs test even if the
> tests are totally different? I think it will be harder to maintain, but
> we can always move to something else later if it becomes overwhelming.
> So.. I'm not sure. Any additional thoughts?
> 
> Lucas De Marchi
> 
> > 
> > > 
> > > Lucas De Marchi
