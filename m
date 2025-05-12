Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DACC3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 09:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431F910E0C7;
	Mon, 12 May 2025 09:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4yN6Qf2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834EC10E0C7
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 09:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747041258; x=1778577258;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=wfG6kzejE0U3cfTPTIPRbzMD04j87cYFifV+qY5JaEw=;
 b=l4yN6Qf2sp0ZTBoWKDhIG7FcuR6w9WeR+9Fr1XJmE39TDr+NgkB56dPi
 2Lakw9HEfz+d7QT4Rx7HoL9CMRrikuCfMlKx7YftUDD8uljyuVWD2EHB0
 BxFmm05xx/7Usd+nczTGcGklBvsiW17kHKzcz/a5LHJsGyONqOIAqxSzC
 YtxpTWrYGmsCRZxzBSolS59TB9iKvfRFeJg8Eka8cICXwf5VpipU5IfFO
 5AXThPxjZXqpVIkjYrHF/7cOp0jyuRm5qrpXB3r6Abwfw5NYsiJhxZRlW
 d/Qp11pYCfUAtyUAlLod3zufuc+W9y4jk+NP59XprgKxVSSR+u8XMYqDE w==;
X-CSE-ConnectionGUID: t1vX2l3PQGS8i1vQGSRzPA==
X-CSE-MsgGUID: 4EArmCr9Ss2zi1FM8qcFVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="60170321"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="60170321"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 02:14:17 -0700
X-CSE-ConnectionGUID: e6uaAz+FTNOywepkkBELxg==
X-CSE-MsgGUID: rk5wMWGPS+WmbSA08OI10g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="137238005"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 02:14:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 02:14:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 02:14:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 02:14:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMjbhY8Qtj4YJKsYLB0B557gbGCkbqXZ5IuDUMkZbamxt7wpYY4UTzIUnoqUHVxRKnq+mowYSc/k6De5VJIMcGD955r7ND8vRS6X9KKJsYMpz4winuwHElejx0ZRD6xn9lnR5dlxzMlLTSQ0yBbPYPMcTAjgj6NpzG+OogXrj/pCWklXDE/3aYxnikVhpdIZIOb6o4Z2vWYhZBkTFjk9hEhj67Do+P6aCikp70GYH2sqWwBafUqWxw+fk6XjpmMb3GjqHCmydXHL8bVmPveTJV1YbxoKRwRilzByHCwi4ZZeXKw+M03ej8d6YxgQ7hUHSgxuC9GfE3zy8eUSyttkKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SywCJQ5Pr+r9a7RhUIxa8brJA3wopN9ud7SJ66UYXiA=;
 b=Iw9MfC8PQxs7N7cviBh6XFbIB31BpwzoJM9sPFAw5P+1UC5P0rtzKxlnHSzTaRm44Oy+ixGcIaBCYXCBxQBbkphTzFaYAsuwWjglkis6Kwnoy5IER6/yXMWq0ZWzyVG+xctBeeoEEQArY9HszWe3xhdIP4qApEsAsZJKm5hAHECCwZyNl2zmvQaJCDE4YvPQ0Yftb27iXAVnAmi/PlawyipBjZgEwfchaMuFxz6l59y/4jQVwc13gTRKHnEXvx+qvD8muxYwuMRVOJltaFNhmTAcWcaPPe2jC0/9mzQH7YM56wUE3XDfLdcy6eyJ0Ea9f5VBIIqjxiBLfdVQZv6EGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BL1PR11MB5285.namprd11.prod.outlook.com (2603:10b6:208:309::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 09:13:32 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 09:13:31 +0000
Date: Mon, 12 May 2025 12:13:36 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Saarinen <jani.saarinen@intel.com>
CC: Jeevan B <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWls?=
 =?utf-8?Q?ure_for_tests=2Fkms=5Fdisplay=5Fmodes?= =?utf-8?Q?=3A?= Fit modes
 within MST bandwidth constraints (rev7)
Message-ID: <aCG7wPheJ8qV4y7L@ideak-desk.fi.intel.com>
References: <20250505161217.484268-1-jeevan.b@intel.com>
 <174703044021.67539.4153090071917892715@c664b1dc75d1>
 <DM4PR11MB63120B63F29AAB2E0772BAFF9097A@DM4PR11MB6312.namprd11.prod.outlook.com>
 <DM8PR11MB56559040C2DB42E8127B4136E097A@DM8PR11MB5655.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM8PR11MB56559040C2DB42E8127B4136E097A@DM8PR11MB5655.namprd11.prod.outlook.com>
X-ClientProxiedBy: DUZPR01CA0184.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::7) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BL1PR11MB5285:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d005dd-f494-43a1-0065-08dd913541ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zsjmpdnyeDmwLT7ZgGpmjbwFyM+Ql98UCzMlXwHro7vuetWgn/BQhJ8uW2xL?=
 =?us-ascii?Q?67yFP+wd4ttzLzaggXQJw1rqoEsjTSKkI3QrFj0X98pmfEcoTbz6zHhkUOSS?=
 =?us-ascii?Q?ZyOjGna7aTJMn6/BfmO7N/adW2Iv0HsLzUbkyHMFgUVHLirWCU6iCn2H2Jzd?=
 =?us-ascii?Q?zSaSAn7q1wPphUHDMkEhkoj65rIHT0F4PnMWurCyiDKIHgieRQrekYfQP5wy?=
 =?us-ascii?Q?5m7V3T1SVJP+ymJYwF4HHgzkxMeZn1Qkoym832HhsqMv8bwqYzIa44Zf+PM3?=
 =?us-ascii?Q?iIyD6flB1DqWshQbGE1UnlKG3ng8GohHClWTMaEE5VU2kpGLkYrJNKdR2T1u?=
 =?us-ascii?Q?D/pFrPoeMGzS6aw5E4+qLPBjCSKBeczOZbGRYksBj8LlJySsMaeFm7aScvHi?=
 =?us-ascii?Q?qHW7uLGzum1hIWhL/wsDbNg5wKzXftvSDJqQ1iB653ku8+DLI9fhxIPz9imy?=
 =?us-ascii?Q?YH4QZis0oAQgfQNg5BrZV5eauczI5GlLJccRxLYRMLD+Q7Bum6ET1fw1+bE0?=
 =?us-ascii?Q?qCsQrizBanPeHLUh7dBc93a8nSW1wRot5YQffh5yys6MhGlWs9PkDZYBvLMY?=
 =?us-ascii?Q?YQY8nyh4w+7Gt9l9zbNKynOodF9i0hy/B7mMVxSIf/sN6DpXBStXAAcs1PjA?=
 =?us-ascii?Q?sSA3zo++LKl36C5f2pG2TJZzcM0JQE2+eF1JonCRApak70KAQ3AQxMfBHuJK?=
 =?us-ascii?Q?F2JviK0bSRzifBJ6OP+n636xoxWUTQcgJyPOaYlHCbrtxMon+/uYNQoRCR89?=
 =?us-ascii?Q?i4lUejh/XRidCG6P0GzQf2b+RvmknhkM066Cghz8Ke4qWtrIFyGL6LAu1/Ko?=
 =?us-ascii?Q?T+KCP7rv7Z6NzQsscRfrQuwdb4YYgSpm6P61hLzQaolD2/mPHuMIJHGv+WXB?=
 =?us-ascii?Q?xlAqP1WICqRNBw+L9iAgMCao1Bk2fl/9kwCfLCQbCQtwzqjzW1WlLbweI9r7?=
 =?us-ascii?Q?yXuSXxgTYbal5cvYYL8COwd8uHsvok7zT1ZV7TUl5/xXDsYj9WO/SkAXZ5h1?=
 =?us-ascii?Q?EyBPH3MjzXXbNXFyJw7fNzdYPQRd/G9bGkEa+LibnEC6F24jjyW8MJL0r7w/?=
 =?us-ascii?Q?Dh0AcPGE0njIsZXoZN+gMvKdKDSsppu+/Ocmdgk+zTU2wpr+S94+8qRTCSYG?=
 =?us-ascii?Q?ptL5Dr+Sn7Lc22LXmEv6DuNwHVURnsJFZ+mSOKBEKCP7KzFq1qj48tXr8opQ?=
 =?us-ascii?Q?NwKlRAbpCsCSci3Q+B5gtKjcNWWbrcKx9m+g6ak4q3kPk3a60zvaUq2btq1Q?=
 =?us-ascii?Q?wSQpKGNiIuRfumLBJq/uvcXReF26pJA+SeIGU1rt/niXHj8+rqyUH1va/iMp?=
 =?us-ascii?Q?gQqebEg2gKugr9hwp29sWrK9Ft9xtJtAYuf+pOKIHygN9wi+dF5jWQeJq7qT?=
 =?us-ascii?Q?qP737Nc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Icp02m1/r3TVniAm2qOmUOPYDxDOSoFXLmialNSP1+GJ10Yxvwb7BbsOTDaq?=
 =?us-ascii?Q?btpCvEPdiXhG4Lg446j6uBwgDHUAnEgIsirjtAoNC1ZbQctARuZ9KgDfTOEw?=
 =?us-ascii?Q?2fdzd2/jAppcnmNf2gk2fuP9FXVUMicJPKyC4Dkp33VW3XUI1tEpkWWK1JVI?=
 =?us-ascii?Q?PQChzdYnQADmJ8UK7EleFcmVI1MRge0QzTL1vjHaIKOrwl/ZBGBhAjeOGv5+?=
 =?us-ascii?Q?/AWubK+VRaajgrDg+F/3Zi0LdIpdvS3dHzRa2UKU/hslxV0KSjGb4QncjUTH?=
 =?us-ascii?Q?6RsmlAMZOvemVi50305yGSZk8caWflLk4OdlDU22caG36D6ejUkCYwkHd9B+?=
 =?us-ascii?Q?vkn0F+G4Mu/OJJXMmV7kuA7BaInSasSQ+zhN1KR+uMKAz+RvLxHqjWpp3XM6?=
 =?us-ascii?Q?9gPkN0qUPuB6buF67TrNoeXrOmvi8AkV6uBQ3zHnXBR2JMgAX90N1mHPzM7n?=
 =?us-ascii?Q?J68cpbPt8n0rvro+PWw0CiMtraT8RcJO5IR1a5OT/3BtHAatwcXMiK7Eu3bR?=
 =?us-ascii?Q?JD1mGkTgQJsu/G6uJHPOM74lqsbikoL9ePSJOKgEQLLRTyX5R4KYPdBnyOjQ?=
 =?us-ascii?Q?qyEpoRcz99bSMu0DLrEh8Pn7GkpI2UgW/R6VSYjte3F6Dr9UnA1Ar3llu2HO?=
 =?us-ascii?Q?iEoZitJdJX9wlLcoB6soWXb/r6GReSn2pCEnUOrJiUXAraEMRcSaDh12BrVI?=
 =?us-ascii?Q?/VtuItIii1W/2iC9T+CkIN64ECnNE/h4srYxhriaLH1pHoFPB7HK1OYmmC8r?=
 =?us-ascii?Q?IIfwHokOM7aKYzK/U1rwQSD7+O1QRQJNP/CTvU3A84+Sh3Gq5707GtFU5gtL?=
 =?us-ascii?Q?oWOg0L/tp4/9dCVgYnsoXjkah/1BYz1W1aSqeOKRruCJguscA24UzSOJLPt+?=
 =?us-ascii?Q?UmZCCnhW7+rsCxdUw1D6jyBxqVPfaEFU+VdCD53Tc++rbbMwdp69yIaOx1Vx?=
 =?us-ascii?Q?zKyYBe7/7fG0nGQ3gWeWlQ3FbfwhLC+wRXpB9pVwV/s/v84RpcNEXlzAa1fe?=
 =?us-ascii?Q?6JYzoAVkxRwlwrDCI+OBLGFbK38UbYQNNoyN+31vow3o33DBH8BhfycNSO25?=
 =?us-ascii?Q?nny7dRACPSW7yubirim1ADM/M4ISGBTUzzOmQveeDA0002uZmEJVTFCB25RN?=
 =?us-ascii?Q?9mUNir2R1t/qqlWTOZcwu356chZY5c2T7tKoqJ/vOJzX/Zu+Z0UK2ANN0USM?=
 =?us-ascii?Q?Xh5LDo25RkcXa5knZ015d19YElZjAq3wGwiehGSoQs6no2VAJ0A7Ht78rbT7?=
 =?us-ascii?Q?PMKZo346tQc70RszyKhW7dblL4k8j6WcLa+01bWR4Bum6DXyXi8LE5gHmc86?=
 =?us-ascii?Q?VJviz6kfWZeZsz4/tKLzqwawr6+lU/0ajDIHmpdiPZRbfy7UQHbj9R0THM74?=
 =?us-ascii?Q?kp2Zu16NYawjmF0hV0XqYJRlGPBpp5Bp+I5/NKTo2ZJ0w5Yn9Jpq1q55qVw4?=
 =?us-ascii?Q?4V7m20IFeC9f9acPpTbnsnVX3vBXrRWfEM+6EUjMew1+QNbyelOx4zkHES0F?=
 =?us-ascii?Q?QbDsbDHMl3izkSB2wUF5JlAWQQRraZ+TLQrTpqoxdivAXQVXP/PgbTiitJGY?=
 =?us-ascii?Q?JLofahjWdZcbBn0WsKhmrPf93WM7VO73OQ318gM4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d005dd-f494-43a1-0065-08dd913541ff
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 09:13:31.8833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRaP0o/LIckuwPPHtcqLjTVzRBcYIQ0QS/02znDpaRAuJefCgRdPdXbLUspdKaYsXvOa4CeDwW+Tiqf0XlSjJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5285
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
Reply-To: imre.deak@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On Mon, May 12, 2025 at 09:45:00AM +0300, Jani Saarinen wrote:
> Hi,
>
> [...]
>
> > tests/kms_display_modes: Fit modes within MST bandwidth constraints (rev7)
> > 
> > URL:
> > 
> > https://patchwork.freedesktop.org/series/146653/
> > 
> > State:
> > 
> > failure
> > 
> > Details:
> > 
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13109/index.html
> > 
> > [...]
> > 
> > Possible regressions
> > 
> > 
> > *	igt@i915_module_load@load:
> > 
> > 	*	bat-mtlp-9: PASS -> ABORT
> >             <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8361/bat-mtlp-9/igt@i915_module_load@load.html>
> >             <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13109/bat-mtlp-9/igt@i915_module_load@load.html>
> 
> Looks like this https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494 , @Deak, Imre should this abort? 

This issue affects only the first modeset after booting, so I don't
think the whole test run should be aborted.

I suppose the abort happend due to the
<4> [41.290737] i915 0000:00:02.0: [drm] pipe_off wait timed out

WARN which doesn't always happen vs. the other related error messages
earlier starting with
<3> [40.411150] i915 0000:00:02.0: [drm] *ERROR* Timeout waiting for DDI BUF D to get active

which do not cause an abort (filtered out as a known issue).

A previous instance with the same WARN is in
drmtip_1838/bat-mtlp-9/24/dmesg.log

which was not aborted.

--Imre
