Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610CAC3DA45
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 00:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1999810E7ED;
	Fri, 12 Jul 2024 00:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jiERWTMd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD81910E7ED
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 00:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720743502; x=1752279502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o/gJvzTzS/8I1JAecYcJwpdXC1HcIYNfPIpH3RR4+R4=;
 b=jiERWTMdvnjeu3VBUaWxhWbnHN2h57FPU4uJb9itjEx8wJuXDnbZw4LN
 pWsmyb1YsFhlCEvruAEeXvN+ChjjOdUWCQ2AkTJJCVKGwX1Yu86C+npFk
 wpnVlRkaJDvd+Tewo1dUMn5tbm71wuZpIJqGQYnrJQc7eVg6V4PB2eFYQ
 vrzMNcpo68DKpktWf9ApMZGCCj0okF5LtcxTRk/rFSgujlEDgUmFBAUiU
 uQkeKMKf39dYYc9lIkavsKc6iFguSdF8FHdPc79wFByzYyX1DD8dlpCeM
 A6ep6PLpzqAThmQaMsyOb46X0wwW0yTxABZFmljBYhsdlldhYZ2QtYo2W A==;
X-CSE-ConnectionGUID: rj9h6wrVRMuWGnd7B3gW6w==
X-CSE-MsgGUID: gJTKbi9HQom3KrwTWe1IAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28768707"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="28768707"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 17:18:21 -0700
X-CSE-ConnectionGUID: dIwVaFHpR8KTHUWclnc0ew==
X-CSE-MsgGUID: h9OcO3+FS2WtyX8Km8j1YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="49504855"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 17:18:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 17:18:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 17:18:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 17:18:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 17:18:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6/FTTgROJbtsF3VmvMuLD9krLwnn4bXEWmDE1IXoKEJUu6eM+O96MCCEy1vC5uVt0PlASruVmDEvdlxPhcIJeAqLcxTnx6qEqetd3OePMr9ZBWF3IySk1nIy98EZrUGHUQeWyU7a7dyOfs9kXn+q51qiN9PMMHNxood8q1KhtAQKmRNv7c3YTBX3Iq4tJCjKCh65t7vwqU6hqjsaeqVkQ3rPGn4/VLm4ZGRXW/1kpYtYtQVVfWN94wf5WDHX7a3ZRoAHsTPxDIslTT59/fU5FP6PXBvJO+gd4sVsp26Kht/562SQ7/O5cOcPi58WoJPJ9xUI2Garrzb+97kgZ3zLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thoKWMHFY0MR/6TaE3dnfQdEZx5+Z8pvQHzKnXpkd2c=;
 b=bs8rb+v9FyTR2zmSbzq8rklRDpuzHl+Nd+Mt4L2Ly2hPoKZZ0KqsJw6QAoCyZjl/aNGjNJVM4el+RC1OUqP2YyOtWVXlEBLNi1sx6InNQ+Le0fLEdYe58DSUGxN6CHrcHnU29D49UGzivr2W82xcautCstKw7kYfO2okDiUpTmyPykssOvcAOspz2THO4cxLC9/Xtd+jSEuk0fwMckRZmrDfZtGQ6QAAVLIRPThy/azGsjmS/m0FSFVC/VZZVlX/I7fwKYNSxsNtEXzsfq2uwO5Am1BMQQZkKaVy7yWTFJG4654EfEB05ADgk9B/tl0jX9grbAVPLev2/XGs5O46Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4544.namprd11.prod.outlook.com (2603:10b6:806:92::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 00:18:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7762.016; Fri, 12 Jul 2024
 00:18:12 +0000
Date: Fri, 12 Jul 2024 00:17:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 07/10] tests/intel/xe_drm_fdinfo: Add an
 iterator for virtual engines
Message-ID: <ZpB2Fb5WT2uLGZ9/@DUT025-TGLU.fm.intel.com>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-8-umesh.nerlige.ramappa@intel.com>
 <66pm7xg62ide36jiagnsc7hb3hqo47wwadkisyqzokhtbobfsf@wsgxak5nmwzw>
 <ZpAlCU+y8hqTlF3e@orsosgc001>
 <qjpe4ruaijnkvh4ljfo4khessxu42i5ndgwsrhnxzqgt3do2yh@e43ewitauzbx>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <qjpe4ruaijnkvh4ljfo4khessxu42i5ndgwsrhnxzqgt3do2yh@e43ewitauzbx>
X-ClientProxiedBy: BY3PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:217::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4544:EE_
X-MS-Office365-Filtering-Correlation-Id: 61bae614-086f-4e4b-631a-08dca2081dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eHpqAhho/o8rrAGUBJcChGG6o1oYxOXmJJGKAu4cwVk/DJ8XwPtuesVeYbVB?=
 =?us-ascii?Q?cTSEMqHzO9WKZhNug3gY+oEKyyZPUNE3CrHyTLwoNiZkvwjqbhVn5gCBS/hq?=
 =?us-ascii?Q?pYpvf4+9+RdmSFNgM6WXLif/B3EVU8ZQdSU4gl1qySpbI+UswaGaBs9IZemE?=
 =?us-ascii?Q?3tZ5SKm7u8Ap6DJAxvF5crjcVsbyuyYKX2+LhjshMZtBi4SbrDDdljJxUhRd?=
 =?us-ascii?Q?ZxcLPY987138K01baovINJbdv0znprNK2a1BIgq4+VScAUBhSih7l1hvNOKk?=
 =?us-ascii?Q?xhOtUgAN4ll3aDdURpbi0eZsOpkjnlPhWqCQz5QuvrGIu7G6UQ5VJ/1/yWaB?=
 =?us-ascii?Q?aTZbxY2Nha8PTKDKBBHg1p3l47XFXd6ERU+JP+deqvfOOb67G4otn7Wpu1j9?=
 =?us-ascii?Q?UZzTYGjnDnln+HFvpaIXLew/r7y8h+Vcuu9B3FxxsJ3cD8avOs3cq2mOoBSA?=
 =?us-ascii?Q?WeqQrY/YWcvb9jfGPTHJJpnF2COgRSBuyI3xH+yEkPCls7k4NgXRa1Cpn0Lw?=
 =?us-ascii?Q?bAwDlBVUTvZtM0DuIqyyl8XhBCUuWDvqkqgKut6U9zS7kFhK0hIxYP8az61d?=
 =?us-ascii?Q?pmd8RBN9gvMn7AR2VjCJn62NrgzpItHJfdNNzJbTzY/jP57H+a6OfLCdUJlY?=
 =?us-ascii?Q?LpfZzqspbALcxGspAoewUWVQ5gbzi7OQxFUp4Gcd/6h70JeNwQLYDuzO8nRU?=
 =?us-ascii?Q?BG4xifkO5Dr5Nz5NfLNBaVvYUHfATGs/hGVV87bElllpaj8uKP39JhsDnwBp?=
 =?us-ascii?Q?L4JDrsGZMHpZ5MpoFMNmqd+u0VN1YJ3+/rcI79OvOaO1HAJAHKantEwZIPpG?=
 =?us-ascii?Q?DoSWL2k3LMzzDwfEBZNi3aikdXcFm0WlO8yK2tAc/NXYHdjVWT+VleW9q754?=
 =?us-ascii?Q?kkNfvOq168Y8XdWQCTjz/4Y20T0YU3hYcXkIODRT3KDEcMyv6JO/wafSB9kY?=
 =?us-ascii?Q?Q4O9RtbHAfI7uTitKZNJQzfix1CO1eg6hltyN2s3u4WhotYgxJ/9aAp0Gd0Y?=
 =?us-ascii?Q?r84DRhYmBvKNMkJfaEjm/VESUb1OFRFz/Bz6Pwmt+UTrmvYNE3MUlz5ii06F?=
 =?us-ascii?Q?4V20DT/isKX7QPh+6JqVZiXJf9e3zoY6nWYSs3/32whITFClAejIHVd10Se0?=
 =?us-ascii?Q?zNiefeyOGz9kOsIRGUy1eF1bmwmv0iQmXbCtrkZEMoukVCrDGNGEi4UMU7zT?=
 =?us-ascii?Q?QMuBH/AtIyMwBAnK4qga1ISWAsu2UzWu92X7XMYlJTT7Dfqnup1d/Q1v8IYD?=
 =?us-ascii?Q?JIaQ0ChZyboth5H7tdeJwq/ikBZWe4Tm+Eq7WvBgNYpK7KbfaRa6JhA/zNzM?=
 =?us-ascii?Q?AErSBL6YIWfegHDNGRRIhQiTLr6IqnKgE0jDGbBHdM0CFA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4pMml2/L1uByMRNjCq1CiC5bCyQcjMWdh6dq/xmRcyx6gWJuFQQwChhviBga?=
 =?us-ascii?Q?QTsjUc+uY4J+USdc9uFdPdX9q/Z16/6ZSuy1sPoR2JNvsDVmlN7VN69Or07m?=
 =?us-ascii?Q?8f7XpExY43G5PTijjwJITdBi774qFHyCtcErVHXHh6qtBG4RKTsVtQ+gPErJ?=
 =?us-ascii?Q?sqCnrZ7BZ94FKWlCgjDm4/HPVGPV1YuhkWjTfyqGvXmTn3Z/5TY9PDCVNc2w?=
 =?us-ascii?Q?6nn4X1i7Ybg1oxGAZRDQ+shaOXXaVnMyDYrEjU66AvZPoeCJh3BuLdmytVDH?=
 =?us-ascii?Q?BpfaKGoalMG2CN0GNre0W5wIKsIy7aPQuIsxksSSp/BQeSBS7iwyW2Janm9z?=
 =?us-ascii?Q?tEnT/hryxxDElPjghwfKGBHG11o/GEQkqsZUF65BNTKK8C3aaUR1OwwIdGJK?=
 =?us-ascii?Q?IW/MlBm2Okeg0tujFiE0Bv/05Tq5knZL/RNWeh/QkpXZ1gxW3aVGBhT3pOVa?=
 =?us-ascii?Q?IjV+bUbv1zW5GtXvwzRax+sJCMtx1k7F15C1YvRS/lZlBVHCMH+mUTR0JYsD?=
 =?us-ascii?Q?IeKd+tWnaI1U0gwt4q2YNqL8KzS9YX1E7s0JaoKUQS3vZAcEtXa27GKJEbSx?=
 =?us-ascii?Q?0f9CCOCHiNxZSNKqygl2GNJElyOBh05sPjFepS0zZOIN1EU/lKfvx+ZAFGgR?=
 =?us-ascii?Q?BEydrPvaYGDniBTd/zO5fqgT98KhoNNZteu88EIrWNF/ds8iJSHgrdmUrXl4?=
 =?us-ascii?Q?UpMBApLgfVTCPlEizq+T2dfPl9yuDRvuHIkahaEUL+fl//tp4GqvP7Tv6FE7?=
 =?us-ascii?Q?pDtk/zSPP43iHdsuwtPU3cuhV1i6XO/y1rU6Ib4Rx2ptmHQ2174ppnc7vDov?=
 =?us-ascii?Q?3TdU8YNgIog8qhJVut/wwtMwISr53xyCVPqrjrkVB6h4pcVZ8G0MPzFaijB1?=
 =?us-ascii?Q?kpHGXQgS8q4S9X1TNCMUwNye9zyiv9HCZQ9KZl/l2F9Tx4+d9esPUzzRfR9A?=
 =?us-ascii?Q?GIbKjvV7e2DWlUrquhEyl7VnDjqrID8uHBdZmVlLfX4r/oS7C3xNob8uq/SZ?=
 =?us-ascii?Q?axT47k/mR2GCc6VpVR6EBT3MGfa3BVOQTjtvXmmZd7mXYiNYjYLYTjRo402N?=
 =?us-ascii?Q?zG89JFwZHOOPw/SA5vJwfWuYkRr6uOy49xl6UmpVOtfNHCK3eekif9wOMsDZ?=
 =?us-ascii?Q?+uyul3EbVPNQqFmArGzgnT8OA27nTOV3TklQVG++rI3d4qpE3eE4dAolxhf0?=
 =?us-ascii?Q?0ZuAtjPJ9rSiJQPj58bHrNqHzWCsdrlFiGWvq/m2M+T0ZSVRYrrZUEDJGGzR?=
 =?us-ascii?Q?JUB8Aowxk2Um37rsS6n7s7UcM309aDweOcKP/9s0JlNiCRMf211OSgP3xHUt?=
 =?us-ascii?Q?u1cEtkcRQh94q5OwwEdkz5bSUMPHHjnus8N3AG6OBuFpkHZAjmX6aQLmkurr?=
 =?us-ascii?Q?cnEYbb9AYB/OuXVO3xhIBySbYOn3h26c+VuKT3Z3gHJzqVuqqI0rzFJ19Mz/?=
 =?us-ascii?Q?EnffAAOakYRXaRCSX2Mcl91ahL5q3jykIkDHSwAjmyh1F/u5oZ3dNJ/qrRfC?=
 =?us-ascii?Q?iIgosL28ZvwuzTVrA/cdL6cF3k7mTfV4tyTuCV6h2y7QaUiIkCJX9YL6aKH3?=
 =?us-ascii?Q?WblDNDJCrQWr9pi1rBxvy46W+nTQxeANwd/Ycw5Eq5cpd6TcjvplA7F6RopK?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bae614-086f-4e4b-631a-08dca2081dad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 00:18:12.2575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HihJ1TkVIxXPRh5FO66glPCo2ViGTeOMCCcNRhGLBvmIHpSSz22Z+G+g32vYygQg65WLE9MCCL5NfqxjKkTkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4544
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

On Thu, Jul 11, 2024 at 05:30:14PM -0500, Lucas De Marchi wrote:
> On Thu, Jul 11, 2024 at 11:31:37AM GMT, Umesh Nerlige Ramappa wrote:
> > On Thu, Jul 11, 2024 at 08:34:03AM -0500, Lucas De Marchi wrote:
> > > On Tue, Jul 02, 2024 at 05:25:29PM GMT, Umesh Nerlige Ramappa wrote:
> > > > Add a helper iterator for virtual engines.
> > > > 
> > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > ---
> > > > tests/intel/xe_drm_fdinfo.c | 29 +++++++++++++++++++++++++++++
> > > > 1 file changed, 29 insertions(+)
> > > > 
> > > > diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> > > > index f2051c422..9d3d1b285 100644
> > > > --- a/tests/intel/xe_drm_fdinfo.c
> > > > +++ b/tests/intel/xe_drm_fdinfo.c
> > > > @@ -90,6 +90,34 @@ static const uint64_t batch_addr[] = {
> > > > 	0x1d0000,
> > > > 	0x1e0000,
> > > > };
> > > > +
> > > > +#define MAX_GTS 2
> > > > +#define MAX_INSTANCE 9
> > > > +struct virtual_hwe {
> > > > +	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> > > > +	int count;
> > > > +} vhwe[MAX_GTS][DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
> > > 
> > > there's no concept of "virtual engine". I think this is something
> > > brought over from i915? Is it related to the width when submitting?
> > > 
> > > Please add a comment for the confused reader and it's probably worth
> > > this abstraction to be outside this test. +Matt Brost
> > 
> > width is for parallel submission and num_placements is for virtual.
> 
> ok... let's also s/virtual engines/virtual exec_queues/  where
> appropriate. Like we have in xe_exec_balancer.c
> 
> can we also use the helper in xe_exec_balancer?

I'm with Lucas that this looks overly complicated.

Perhaps this code from xe_exec_balancer.c can be moved to helper
somewhere?

194         xe_for_each_engine(fd, hwe) {
195                 if (hwe->engine_class != class || hwe->gt_id != gt)
196                         continue;
197
198                 eci[num_placements++] = *hwe;
199         }
200         if (num_placements < 2)
201                 return;

This code collects the hwe instances for a class / gt + calculates the
number of placements. Once you have that calling __xe_exec_queue_create
is pretty simple.

So something like this:

int
xe_exec_queue_virtaul_setup(int fd, struct drm_xe_engine_class_instance *eci,
			    int class, int gt)
{
	struct drm_xe_engine_class_instance *hwe;
	int num_placements = 0;

        xe_for_each_engine(fd, hwe) {
                 if (hwe->engine_class != class || hwe->gt_id != gt)
                         continue;

                 eci[num_placements++] = *hwe;
        }

	return num_placements;
}

Then your test function is something like:

int foo_test(int fd, int class, int gt)
{
	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
	int num_placement;

	num_placement = xe_exec_queue_virtaul_setup(fd, eci, class, gt);
	if (num_placement < 2)
		return;

	/* Do test */
}

Then your main IGT loop is:

	igt_subtest("foo_test")
		xe_for_each_gt(fd, gt)
			xe_for_each_engine_class(class)
				foo_test(fd, class, gt);

This is the pattern in xe_exec_balancer.c. I don't think we should
reinvent this (it is helpful if IGTs all look fairly similar so if you
unstand one, you probably understand most).

Matt

> 
> 
> Lucas De Marchi
> 
> > 
> > > 
> > > > +
> > > > +static void list_virtual_engines(int fd)
> > > 
> > > list? shouldn't it be virtual_engines_init()?
> > 
> > Right, I will change that.
> > 
> > Thanks,
> > Umesh
> > 
> > > 
> > > Lucas De Marchi
> > > 
> > > > +{
> > > > +	struct drm_xe_engine_class_instance *hwe;
> > > > +
> > > > +	xe_for_each_engine(fd, hwe) {
> > > > +		struct virtual_hwe *v;
> > > > +
> > > > +		igt_assert(hwe->gt_id < MAX_GTS);
> > > > +		igt_assert(hwe->engine_class < DRM_XE_ENGINE_CLASS_COMPUTE + 1);
> > > > +		v = &vhwe[hwe->gt_id][hwe->engine_class];
> > > > +
> > > > +		igt_assert(v->count < MAX_INSTANCE);
> > > > +		v->eci[v->count++] = *hwe;
> > > > +	}
> > > > +}
> > > > +#define xe_for_each_multi_engine(__fd, __hwe, __count) \
> > > > +	for (int igt_unique(gt) = 0; igt_unique(gt) < MAX_GTS; igt_unique(gt)++) \
> > > > +		for (int igt_unique(c) = 0; igt_unique(c) < DRM_XE_ENGINE_CLASS_COMPUTE + 1; igt_unique(c)++) \
> > > > +			for_if((__hwe = &vhwe[igt_unique(gt)][igt_unique(c)].eci[0]) && ((__count = vhwe[igt_unique(gt)][igt_unique(c)].count) > 1))
> > > > +
> > > > static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
> > > > {
> > > > 	struct drm_client_fdinfo info = { };
> > > > @@ -678,6 +706,7 @@ igt_main
> > > > 		xe = drm_open_driver(DRIVER_XE);
> > > > 		igt_require_xe(xe);
> > > > 		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
> > > > +		list_virtual_engines(xe);
> > > > 	}
> > > > 
> > > > 	igt_describe("Check if basic fdinfo content is present for memory");
> > > > -- 
> > > > 2.38.1
> > > > 
