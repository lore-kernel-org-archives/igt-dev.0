Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ACACF9C60
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 18:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FFB10E85C;
	Fri, 20 Sep 2024 18:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdZMcQ3e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE58E10E85C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 18:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726855467; x=1758391467;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WLQyPxQ10e1nRbdoOPuLflWLbxKfP1mNHc73ee8X22Y=;
 b=XdZMcQ3eEngI8MyeYrUKybU7KVE2wQuGCEhwKnKF699JKVgtVS9qJ8xt
 i4NYBlsTyBM9DYzxm4GEf1ldIU/gsTH2KyTbAOMnaCJgPi8UjXdhmS0q2
 zq0Magnqf2CaEARnaPpmWiJBKoGch6cjHwuRRFSKlUTTIzJrOgJKnLgC2
 acx5RzIY6MVv1m23bzAWkurdTX5jzgP3FTZ9Wyvada8BoROMTfdJioAiW
 WGrcjgzCUw+3/rlm/RmbQnleUlK2GhiumNixxuJkSJg417xyWDKjfA76e
 XAMCIK9UOZDIyHSCP9dYewGEfa1/ohDdUpkhuHXFULqZr1HhJcc63+Pww g==;
X-CSE-ConnectionGUID: 1F8ef5n1QGaDKbZVBf/O8Q==
X-CSE-MsgGUID: sYaNu+j+S3GI6nUUGzp0ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="37244018"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="37244018"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 11:04:26 -0700
X-CSE-ConnectionGUID: Tb5EYFX6R7CcMPHOK4T1EA==
X-CSE-MsgGUID: GrBIbPJ/Rg6AQ/QPhX3kCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="93706788"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 11:04:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 11:04:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 11:04:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 11:04:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 11:04:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaBPjJYb6wqrr5PUQ+Gxqu50+WdeyTDMrvgPIIvhbheLhSM2ywsyJuux+ImDKZEUyBt5KYfwrU/Hipd3+ZtNclkdxX/h5BJoUF5XH1+pu6K+sPTtyHOEGxk5yzT1FsXp2PoXgUp8Bm+sPg/UF1har+4qvU3lLUpCeF7AUigCin9CQkuI1OS102Wrs1ojbrZX16tJUiI75j+i5LlZ0vI+ZUlO5MGuylFMmj/fzSKKv1FjAwBrMkeHEhj7wRJhCxyWJtuwsawnX184qEZtWvsOhZ4RFT6/HdO1SqEh8D1zl61N8Y7b+VJ4p4Df8zLVf1k2VBVpmS6eItQotroGHstAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2R3wQkuOQyAOPYgOUE3Muc2K9BN+ZICcv9ado7Cxhc=;
 b=c6RZqMaTgqRYWxpkP1TRAsvNMRXjenxaPM8nDKXodwh3Tjvk2HmwgYAwwrNuZZJ/3yr/Fsj7IuZU6iE9QVtnuGeAAXP7r+6+7fU2aQ2TgN2N2TgtpdgggZkPJhuiCGV3fnXrAaCfjwlUV6KwTjM/v6vQMEA4imSlN3sY/ts7sTIG4AyO0Ep1X/jdzcQYR06B+GdxgVvZIf4jGzs70wD9lQbaPGPrfAvT9/A0GZjCImg9/5H/daaJDw9V0H98dN/gZmEZSrk54meEdlRi+E6sYU5cL+gMbJ6KG9WOBMvYf07ZAH6BTxw/uWYk4On0IKOr3L9xPlieAIWVPSLlfggtog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by MW6PR11MB8389.namprd11.prod.outlook.com (2603:10b6:303:23d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Fri, 20 Sep
 2024 18:04:23 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 18:04:22 +0000
Date: Fri, 20 Sep 2024 11:04:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 6/6] tools/intel_reg: Add forcewake support to xe
Message-ID: <20240920180420.GS5774@mdroper-desk1.amr.corp.intel.com>
References: <20240918163629.1186314-1-lucas.demarchi@intel.com>
 <20240918163629.1186314-7-lucas.demarchi@intel.com>
 <20240920180135.GR5774@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240920180135.GR5774@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR20CA0007.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::20) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|MW6PR11MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: dd18d9a5-d257-45b9-3da4-08dcd99ea7f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aB5NFxnflk+E4znDs9bljaZHG/2Xh9H4u1gpxoJszMjuOtvDzrR6dVNwBPHT?=
 =?us-ascii?Q?MHefb7BftHLLKklLvpxVWNzvBXLjzAFb/QYL2KgD15xFmcETgyi8lju3xzle?=
 =?us-ascii?Q?dJqG0lqvLVaCovEyW0YXm6NrYXIaF891nbfurFySDXWq3JZirsck9t410444?=
 =?us-ascii?Q?acq+hDwXth8ytxf9Ifw9gphhhO8mAWl06EjyYF6CjzUL1XA7nHLLWszxMls3?=
 =?us-ascii?Q?kSjLLExBuKsGMe5ZwSc9m5cQC8pkDeNiN5H0FfJz/2QrQpxbLmR9vBe05ZDH?=
 =?us-ascii?Q?NRiBA3pUPA/AiH0bLs46b9AzXTX2IknDVZL2uHzsczMPXoNWngHHeGHjJhe3?=
 =?us-ascii?Q?Tft/N1cn17VU+4p+XzWDvXweDDOgOnN8O+KNvVkfvsfL1Ks/Ncuq5fKdQvzs?=
 =?us-ascii?Q?ZIQUmIszbKdHFomSuq2qtW8LgqdHF7dEeW1tJabnMiRn8pPlSEDU7dpIObVy?=
 =?us-ascii?Q?tCrPUUDKWVi5kwuwHVtxiwOu6prtHvZmmvwbLeARkUozr48kciH5ISTcOVr/?=
 =?us-ascii?Q?Jt3X1CMSniU11ObI6tJM+QXvakXbwx0SVlqQn/ZdLK74svaYe3Xm3Uwx1vzu?=
 =?us-ascii?Q?32q7/OABouu8q7aXpFJkoilcxUAAewxCQE/4h9/gh50E3iYVg2yyxXDAZY2/?=
 =?us-ascii?Q?pketYBMkYQfNeyMYDl8QphKR7MsCxmvS4hj7+ReaHJkqY8bkn83SYmASwJ9L?=
 =?us-ascii?Q?3McEoMj5IEFzovG9Rb3GG7BeJ5tytR3R1uAwMBfwU6jYT5dBfgzix+Xiy+kl?=
 =?us-ascii?Q?sLJtEKzZWFtZASdUqDvrVB9ckW7W5SMPqi6cdHaH6knqVzLPRsHrFVU+28mY?=
 =?us-ascii?Q?HW+Ze7OSQ06RCJCLaC56j5HBG9hgkLU4L4iPJwPOCuHTUK5+b/m2TYNK5cOJ?=
 =?us-ascii?Q?84ak59mIuqR1c8z+zSXpy6pDxDe6njcjZRGak+ccRxksCGbqpvAeve61Pjj3?=
 =?us-ascii?Q?9+9keiwPDfDjFoK9XHfGVMEK1GRocyaUy+TD83ax26G7dnZKuU8lxgP9BEn8?=
 =?us-ascii?Q?11fRpwzoBodnBOgBslYNL1YSbOJcAlOooYc/MN+6JL8oO1IQ2FsLFRT0NmSn?=
 =?us-ascii?Q?om6ymJSeho0AoYaVk0akE8bsE2e2ncozrPQM9aPvn8UG47zYkPHcBxcK4t+9?=
 =?us-ascii?Q?l3qMr+mkqFrV/oGCBPTvPUQ8UunkRU9W0V39JyQ5NxaoeCosW2YLTh5vqxzb?=
 =?us-ascii?Q?5hCYDz9V5Ocz86+Zkg2WNIR0K66gBOCKoJoYYNdS/2XTTjnqnCpZX/U+A/Z9?=
 =?us-ascii?Q?JMf+BDjl9gHtp3okVBYn+3/cqNDqJgXE4ypEMmiYRZO3Y60YDtkwmtYa8rai?=
 =?us-ascii?Q?4Clrn3JjXlZZD2GWKTYEIAnmWThAS9dkfeN8ts3Gy932jA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ylw38gNvhJ1tItTpCopr4cRhA41Vr52WoqjpieGjB67kzVXg4yeYSpwx5ipL?=
 =?us-ascii?Q?Re3fxBkQaFCpze0Rlh4Ktw5sNaVJTsbELlXP7iLINgQFOE2wN0tjYCV9xtxE?=
 =?us-ascii?Q?eH6xczvqzpIaHP5Oo3dzrozakTFfm76davlMSwvRZV0sNQ2TjFyNeirGS/R5?=
 =?us-ascii?Q?hBgmvpWXlELB489t/7a/J1CEHALFoMhm9+a1mlDjg0MUdazO/Al97uS2cevI?=
 =?us-ascii?Q?l55XQk5t5Ertah3P3fUu6M614keEIYwVqjWDW9sXU8oWJP6xeUi/3X2aR+qP?=
 =?us-ascii?Q?uSSMdwBMr4X817QggDJUfO29i0Vkd4+kqcnA2SWsvsXLmGgLWUzVzRDayGPe?=
 =?us-ascii?Q?hNlPMrvdqOqTKubnQQbSt4PWuBFMO4Fw6U248yEWI4C9Xo13p2xjPkbidJ98?=
 =?us-ascii?Q?sr1jNZSbmJuogEhWxFD0QQhEAfYYBPctbX+Jj8wudXcEBQ+/4coXdnkNGDN6?=
 =?us-ascii?Q?JcCvhaReSbGL80e+dR1KcDxY+tzTILAdxEKlyZSZlBW64CIltU6+ix3iDuAe?=
 =?us-ascii?Q?FI+GQXJvgemopv94RcVZIAhvgyuQi9TsO1gP4PekYabXVM7Did4ktinyu7TL?=
 =?us-ascii?Q?JE/VGm4Ei+/maERn3a3tI3NUC6Rl5hhj96Brky/EJ4tfBNeh8gcWUxsZ8ouD?=
 =?us-ascii?Q?DkdbRsfJJycbZwVOnyZGgY/5exgLozbmbe7LIQYxRjevGBwx0g1MYHH+DIIE?=
 =?us-ascii?Q?ZRocgGi4qqmCSgvCXdlDvboFicrYEO4ok186Uh9s1mTK5b+pf3deOpVt/Sdt?=
 =?us-ascii?Q?xn+dIYgFBG0FIYc7vpnDxWkvg/EIZ33UTlxmQOt4h1nzCLHI0dVVHDbRoA+h?=
 =?us-ascii?Q?zY0torq5nIh53OJn0Ia/lDHbyPJH6B3EEhjiLO6iOzPwtb17c01KYGlDkCkD?=
 =?us-ascii?Q?su/PlELjGH/5YIzH1OBlnT2X7zns9MUPHvcuVbDoNo2M1uJe+zAsXzMi6FQ8?=
 =?us-ascii?Q?TMtAjV0LigdCgHzr0CNAzt5XoUp76CWVZrWtvaHdsH44UEVMKLyNxYmRvWxb?=
 =?us-ascii?Q?8UJ+zJ+23EMypEaAG+jh6ZlmchcWtafdKL4oppc6xt6gza5geU7195uGdBzf?=
 =?us-ascii?Q?iHt4cxgOzzIsckNoyvdiLTHReUub3D8fEbh8uhImvEj8opGsEMpiIdGOak/f?=
 =?us-ascii?Q?A34Sbnw2xrKp1Jt/ePh4RTc8+eH1WSQsHGNXk+0G3WNdMaYkbLxc57HK7mMp?=
 =?us-ascii?Q?o9YFNZVdCP+vJg+VlMkBGjJdJtvcxf2YYCx6QFIXPAiM+FKpYguZ2pCgo/23?=
 =?us-ascii?Q?+YFYAQHe+xDaALAxz9lhuSXl5iW5tZQYmdEeSOakl92IPoyvk9Kk8T220hL4?=
 =?us-ascii?Q?kYBoY1eBoIl7BwGmq67FQBrNByLwWHIXKk+P4DXRbCeq1H37Y3bCgqV/gblj?=
 =?us-ascii?Q?yKhBVJI3TGtS/FsJFmaxI/T0tJ0IIbRli8B49IqT70XTTDBCBhedIA+sVWks?=
 =?us-ascii?Q?lyO8t0+ueGwkClOoaOAxYYJq1VwcQ90zFdwVFnXUjgA4q1i+JcZbYMUivknQ?=
 =?us-ascii?Q?5I0z7O6S+Vd8KMH/oNTNRRz/p+Wb1D2975BNgjMeFw6A7pcXb3kK13Afr9zu?=
 =?us-ascii?Q?X5riR7WGBn120rr2ewSDdeTfV3tQ/Tz9hsHNpZuFM4zttCRZ3389x6SOREnx?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd18d9a5-d257-45b9-3da4-08dcd99ea7f4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 18:04:22.6919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evxLO8oHdJwfUiQTD/S4/hHkk5ouGK5H4Yob2JpyUTTQJ5MDOTiy0Q4ocXIiv9qMpwPi4VyUFWONgOOfqBlEPEOne6XSoqXIg8qeye09sSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8389
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

On Fri, Sep 20, 2024 at 11:01:37AM -0700, Matt Roper wrote:
> On Wed, Sep 18, 2024 at 09:36:29AM -0700, Lucas De Marchi wrote:
> > Now that the igt lib is prepared, start passing the open driver fd so
> > the correct forcewake is taken.
> > 
> > Before:
> > $ sudo ./build/tools/intel_reg read 0x2358
> >                                     (0x00002358): 0xffffffff
> 
> Hmm, this example makes me wonder if we actually should have called this
> top-level "forcewake_all" debugfs node something else.  This example
> shows that we're not relying on this interface solely for forcewake
> purposes, but as a wider "wake everything up and make sure it's
> accessible" interface.  At the hardware level, forcewake deals only with
> the GT-specific ability to exit+suppress RC6; if we read GT registers
> while in RC6, we'll get back 0x0 as a result (which isn't what we see
> here).
> 
> The failures we had here were because the device itself had gone into
> runtime D3 (so register reads come back as ~0); using forcewake
> indirectly suppresses runtime D3 as a side effect.  But if you'd wanted
> to read a non-GT register (sgunit, display, etc.), those register reads
> also would have failed before this change due to D3, even though the
> registers themselves don't need forcewake.  So we're in a situation
> where we also rely on the "forcewake" interface for reading/writing
> non-GT registers that don't care about forcewake.
> 
> If a future platform adds, for example, a new sleep + wakelock system to
> part of the sgunit, do we want to make this debugfs automatically wake
> the sgunit too in case we want to read its registers?  For that matter,
> should this device-level "wake up everything so we can read registers"
> interface also be grabbing all of our display power wells by default?
> 
> Anyway, I'm probably overthinking this; we don't need to worry about it
> for this patch series.
> 
> > 
> > After:
> > $ sudo ./build/tools/intel_reg read 0x2358
> > Opened device: /dev/dri/card0
> >                                     (0x00002358): 0x91e59eeb
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  tools/intel_reg.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> > index 906ae9b84..b650c3697 100644
> > --- a/tools/intel_reg.c
> > +++ b/tools/intel_reg.c
> > @@ -802,7 +802,18 @@ static int parse_reg(struct config *config, struct reg *reg, const char *s)
> >  
> >  static int register_access_init(struct config *config)
> >  {
> > -	return intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
> > +	int drm_fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
> > +	int ret;
> > +
> > +	if (drm_fd < 0) {
> > +		fprintf(stderr, "could not open i915 or xe device\n");
> > +		return EXIT_FAILURE;
> > +	}
> > +
> > +	ret = intel_register_access_init(&config->mmio_data, config->pci_dev, 0, drm_fd);
> > +	close(drm_fd);
> > +
> > +	return ret;
> 
> As noted on the previous patch, if we get here, it's always a 'return 0'
> since intel_register_access_init() can't fail (and should probably have
> just been a void function).  But not a blocker.
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Actually I just saw Ville's reply and it's a good point that this tool
did used to be able to run before/without the driver loaded.  So we
should just skip the "wake stuff up" part and proceed without failing
for that case.


Matt

> 
> 
> Matt
> 
> >  }
> >  
> >  /* XXX: add support for register ranges, maybe REGISTER..REGISTER */
> > -- 
> > 2.46.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
