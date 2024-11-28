Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA5ED690F9
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 10:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E0710E31D;
	Thu, 28 Nov 2024 10:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+Awz/EW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B691C10E31D;
 Thu, 28 Nov 2024 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732791359; x=1764327359;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DGw7/7GrfqAuMxI8hcM/Cd/4Ik5+wxElHMDVDpeAsCo=;
 b=T+Awz/EWH/BUmWtNoW5Nv6n0Ll6GTR1Cn0yJH44fcz1ylTYHsHW8UY2B
 eb+CRqtbBrufmUdZrgSQeusMUzwHE94F4t4598Mn/5qyDsY2aGHp8FTi+
 rSwmqymAptbwo0hxpXwZezKBOX4X/4h4YB2hg9G5KMrz1m7CzZtE5SpEe
 Im+sUV3vJfl5ODXTA/xSFqQsKO587RSDghj/F5puKh+/jFTFqWTTz8h2A
 YJvpxdz1qdrx4X5LFyycM3W8IhX52BwXCDcxGzgwGosJUqQhfQBGKqR70
 qIrkvBjI5u8KySFDPuNv86Aq9bR2aKMw2a4zCRBVNnlqNEZVtefHgNSnI Q==;
X-CSE-ConnectionGUID: zmjq5Xj4RVquduf5sRrUgw==
X-CSE-MsgGUID: TqX8NmpxR42PXVMuNejW1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33149828"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="33149828"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 02:55:58 -0800
X-CSE-ConnectionGUID: JeS7IlefSIOcR9sBilReEw==
X-CSE-MsgGUID: 3Ft2cz0+RSOSYeu+8jZewA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="96634645"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 02:55:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 02:55:57 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 02:55:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 02:55:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGFMe2ZXRA6OVV6PooenxyV6bRxZDq1A+ey3dcXBP4oSXzU4ICNKuaJNFva4HWfHZZEURcgTjFSWFjsph9D+2tKYq9052MQzLKemo7PfpHqjxJFbbXD/cQZvZSqzceVZp7lLrT80UWPFBLhSigErBGNFPkmb7fwznqanTzyuJuPIZz6GSeMywFo+jjjOdPMCXAm0rYibvk9JvxJtiNNI6HLHdkjuIlhFXZlQbDaA5GTvhq0Mv+xQjbrs86d6YQytKO2y74GfNFcXRdeZODIwK4z08AfXxmuaxWIPx81pNkYjqxZN3q0PpAvCb5Yo4D73/Mc52QQWJsXkcLMZoKy6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h18AuSq3E7PXNtArLTbFF3nrI4Pv6NVKzjHBqwsRqlY=;
 b=nx6lOlm/h9sdsEGgsAINLo/r8BmwSgkdysMHX2FxQLPeks9YI6khFA2rFHTSgKx9dI9zVdsu3xY0d+xqHnrv6tpWa68eTR+xr5r3YmWb9Codo+3DiJ8wDkQFIEgFzCn9JrL7VMOz83zQSDMriQRLxs/WOF9918cZrJF7War1PHZn5PKhoPncnZ+VssxwcCRhgzkuHxn7dlNaRkyGWayNyuO2gf6iylk79l8bwmlq9aOKYnTjOTfYOiIu5jkxjtTVRb3ElBjRvCUHlLJ0eBbbNwfokSHapfMzKkmbDRuxjC2UHz1bbE6/ItxW5mSu0iltdIjE8q386GH/Hgsyd8735A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CYXPR11MB8664.namprd11.prod.outlook.com (2603:10b6:930:e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Thu, 28 Nov
 2024 10:55:55 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8158.021; Thu, 28 Nov 2024
 10:55:54 +0000
Date: Thu, 28 Nov 2024 05:55:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
Subject: Re: Regarding CI failures not related to patch
Message-ID: <Z0hMNAyr6QWr9EEv@intel.com>
References: <SN7PR11MB74892734BC8E144BF7602F2285292@SN7PR11MB7489.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SN7PR11MB74892734BC8E144BF7602F2285292@SN7PR11MB7489.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0238.namprd04.prod.outlook.com
 (2603:10b6:303:87::33) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CYXPR11MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d475e4-df5e-42bf-243a-08dd0f9b3b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Xcybr73OEv9Q/N6UUaX1svTS+Ud+m98HBzEghJ/Vm7t/WejlJAJaEcIiqB?=
 =?iso-8859-1?Q?7eV1NyMZuulm5MSHSg2BHByWOIymCgxBDk4TrwITHEPpHlCBM5A9WR1kc9?=
 =?iso-8859-1?Q?Wnrjgi38chbHwvIfTGRORi5XSflx369n0i34yoheeozv03fhrSw9kgHMn3?=
 =?iso-8859-1?Q?1esOQ6RtHPMBRjcE3j3sjWQIMZipVwNyivMDxo5VVaEhe2UV4SD8woX8KP?=
 =?iso-8859-1?Q?KuZ7HYwYhqr8WujgMcQhYt4HavGfKl+/luybtQEUkUNg+KvyjXOPonCXbj?=
 =?iso-8859-1?Q?7NqEzcyPzKCOcH69nCL93Tr4E/bd9ol5GTdAEGAA0XbEqFEQ4uunel5PnV?=
 =?iso-8859-1?Q?BAcN2d1ek7hUlU2DmLFEqG1Ds5w2Q+zyQD3ka/VBFcaIjPJGZPOQK/+j5a?=
 =?iso-8859-1?Q?EDYVq+17V6nfaysceGoObN6JFLliNdt8j/hi0eFUQf5b+66m3e+VAB76yc?=
 =?iso-8859-1?Q?qcLrBNxP7vvjzrU1m0JmamXsDbDJPTHiDepJyEgJrbLerO8AzXCSeN/yUx?=
 =?iso-8859-1?Q?UZqBk+sL4PfPVgakkgAs8lIwkMaLTO2k5/tbnht1TTqQ0fnpuXtK2zxVsE?=
 =?iso-8859-1?Q?4KGZ9yIO9p7ELaZ9GPu52L4EQqNhv6pQj+undMdxQ6mpOtXbIoV5rA8FI+?=
 =?iso-8859-1?Q?DJEFUs7dlIl0VqZRktGhlLRCKQyEC5w7ZKcJ6ef2oINbr/JW5Gq8C13eiz?=
 =?iso-8859-1?Q?R17AcY9envUC7unoq56wDMe3pQBfg5MAYANtewNYxBYDjxh5FHG6y+YHXf?=
 =?iso-8859-1?Q?XptyfsP6nl9oUsQwohzg+AsaN9eoP5wodYGzJc51fdYwkSPUK6LHJ+FofR?=
 =?iso-8859-1?Q?8crku3AgHLqY0zpoRpgnTjq8Ot0u9/J4P6l/uhKgULngylM5j2VTN4Ykas?=
 =?iso-8859-1?Q?h9J+qSyB9XtZXIf2sfC/iHivHkbYru9gj7ip7URycX5r3zcuZznCsENanN?=
 =?iso-8859-1?Q?HCV514WRE0olxGUmbyCnMngkwWbocpuWQaq/5RRZmit+B6UlklCVEmebzE?=
 =?iso-8859-1?Q?osQoaDSxEq1QpnA0QvO/ep885ykPdXgI6hXCECE9qA3UpvOXBAoLT6I6dx?=
 =?iso-8859-1?Q?4YEQwRG7Wlbu23fRYbCwVDsvuUXU/ehojfSiuxK+ovye5hc14tNiKMT4cf?=
 =?iso-8859-1?Q?YVY0W951BDphxQZVojv5sEgx3IgT2VJTb1dn7Ig4LQCHlV8eEoTL3+Iq1x?=
 =?iso-8859-1?Q?YTrKxJukN4Sb3kq4WnIuzt3StJeEOVJuMZQQUaQvDfr2UvxgD9EBfFxoLF?=
 =?iso-8859-1?Q?qq6G2fwceEcty5lP352753of8TEKCvaK0n8tKUfnBPDtY/RfIy7fWPM8ST?=
 =?iso-8859-1?Q?MCN4DIfFqd5L4Qf1YIeXsvR2YQoTYeHLZpytdvIqQuaf5LE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eFs9let2g7xCXwufNeevOMcu2fzS4LARtK6dUDZCUGCLtq7nWm+VGR0sbd?=
 =?iso-8859-1?Q?PJ+79y2jaxlmaWtQnDkk+CIL6uVxRWOkmXzxTh5EM27VITsjLeJwXGdMkQ?=
 =?iso-8859-1?Q?vuQYRVRjDlav2LwVP89zxKjp9jrcRGwjzUrRWJTcuUIeyftiIFTbVcySo8?=
 =?iso-8859-1?Q?0OI08ajZmWfqNfw3GzuRADPlMY4Oc5ZO0rJUyl4OhjanIgqpgF4l74LIsg?=
 =?iso-8859-1?Q?OxSh9Ni/FN4cpliQxdEaSNLK6cYoqQCKmwAH4WOf+QOFO6Y2WchSqkzUnU?=
 =?iso-8859-1?Q?0KAIOApdpLQHYrcY2TE6feesV+9/5ZsMhTzBsm39EAyPb1ui/Hancnu0ou?=
 =?iso-8859-1?Q?ZsUmoyvfqgpPq0rFKRzvekb8PPUBUPEp+XO84R3K3jQ2F5Hdu5L2wIH4cw?=
 =?iso-8859-1?Q?I2L0MurOn/kZqnf18wh8aUMwRjjyTAS97e85/ZfrAbZSfzTT6ob8KnHfOI?=
 =?iso-8859-1?Q?NdjbwDq58FwnFvIXtVJyKT/z/2yEXYgUBc5rsD8+AL1rvOhMbyppDl2Wf+?=
 =?iso-8859-1?Q?dWHhn9x58ofQiQAhnP0siHc+bHPbzrjiyY9GfptdxOXXrGg5rtPVoHij6K?=
 =?iso-8859-1?Q?/x6N33HJxn3L7PF6Xp5/ZD9QeZ0VxAEmmukpYcVxSnK+AaJO1EV4IuEq6Z?=
 =?iso-8859-1?Q?WdjKhLrqk//Skz9++NNu6Ha6L/cH+6L4N8U4EnIc8GSe6twfEz9vu17DfK?=
 =?iso-8859-1?Q?wtK+dl1AvfAMggdBdhM4yP6ZaPa/uGZ8R+mqlkkGr5sznUOHzN9G6sBO9E?=
 =?iso-8859-1?Q?ftHkP4WSuaopfCEKceVxLr7C7Niel3vD/Hu55M6CmwGoGJkafDAi3b3mY+?=
 =?iso-8859-1?Q?RzZ3O23IcerVirQQ2KYtEXZ6z6L/yvUkXhTUlOJvo2FmFoTPmmU0gz4oux?=
 =?iso-8859-1?Q?8NU3I/pvkKnt62/5pyncT7XSKUIB/u524fgIbde3r7KoNm0X1Av3wVADX5?=
 =?iso-8859-1?Q?dNr8lO9ejyTeAmMiGh2jh0dXvZRBJ/Xnf+smJomrbwXJqK50hFFsVptQok?=
 =?iso-8859-1?Q?sfFyBflKQQ5Ouz0We69knphO+jYynGHOVeyNSKJFM+WeIWSJxtR5qTzBBH?=
 =?iso-8859-1?Q?kTdXEAsfQE7+gVs/r+SeyxSwO9OsboekHhuqt30Scd/rcpvx7DOMKJAmRx?=
 =?iso-8859-1?Q?OD1uY6dLchqbKMwEvRcd16DELIkGxDOp5/RCi6mvHFuOorHnkrbpQxD+iR?=
 =?iso-8859-1?Q?9dfxbFZ0/7MxDsEDWFazvwUQG5KeEzsLejbMMwZXbGDCk+yavxTK/qM+LI?=
 =?iso-8859-1?Q?S9uKDNCr0Dh+J430NeFUx66Eb0f8xPvIH2+6IqF4srFeRNTt5Kdx4qXY07?=
 =?iso-8859-1?Q?IJQCKWlM3fMMEzaylMOu6Kn8SZjEa2ZPOP8Q4yPvnilG9xJxFNlrz9u4cV?=
 =?iso-8859-1?Q?BsiIPyE2xspwpJ7Nxt1O2IpbzYQYhWth2QD3ouiK+f/V794TufKNX/vZlW?=
 =?iso-8859-1?Q?Ver8kAoSk83i0SgPLHjehhYIkyRYkPg26BiWwcA12KcSXcexqAlilImI6N?=
 =?iso-8859-1?Q?v4tPZOVNXXd4roEaXnhb59rlDldYrtH/y7qHqLVxmMdVO/3gLvlzgW5/nj?=
 =?iso-8859-1?Q?JXCIGiXG8l2Fvn5kaakH95lI6QLU9XvQwGG1X5zODEOC50gz2tjoGgPiMz?=
 =?iso-8859-1?Q?mYnGSZ3J8fsQv3XgPE8dcBVDZ6Vx9mRZViaa8iyzMdIQfunv1hTEl4cA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d475e4-df5e-42bf-243a-08dd0f9b3b2c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 10:55:54.9199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1C+o5XnIoLBx27r4CESql1dqAKbz82EHpVlYB6lJ+LMZzlQuyCwCUl+J4G7G4oaUlJtIG6XUnsklGj+Wt8Ljg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8664
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

On Thu, Nov 28, 2024 at 10:25:36AM +0000, Goyal, Nakshtra wrote:
>    Hi ,                                                                         
>    I am getting CI failures for the patch [1]IGT - Patchwork, which are not     
>    related to the patch , here we added new subtest i.e                         
>    gt-mocs-reset(xe_exec_reset.c) , in rev2 , it was getting passed , CI.BAT    
>    also got passed, after that just changed few comment and description ,       
>    nothing related to code or test , but still got error in last rev. So we     
>    are going ahead with the merge.                                              

Hi Nakshtra, I agree with you assessment here, but the right way to report is by
replying to the CI fail email report, rather than creating a new email thread
in the mailing list.

Thanks,
Rodrigo.

>                                                                                 
>    Thanks                                                                       
>    Nakshtra                                                                     
>                                                                                 
>                                                                                 
> 
> References
> 
>    Visible links
>    1. https://patchwork.freedesktop.org/series/140575/#rev7
