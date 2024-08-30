Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B49CA1008
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 16:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FC110E3B2;
	Fri, 30 Aug 2024 16:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2YJtxMI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BA810E3B2
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Aug 2024 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725034805; x=1756570805;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=miCxT+Y3D5Th/vDcrO4WTRK9YC1Oft5d4EdCxV8b8vk=;
 b=E2YJtxMICuyt4kkKPVAn8SWuuQGFvNrjYj+At7tSj1jNNIRaoMvLBxsE
 J8iycd8hM11BLLdAu7H862Fg9fmgeJVPXhAPU+dy0nIicRSvdGHpUf4HB
 Hf/ROt39IDPmpJC/5wK85o6szSOCZF+gkO0v6xg4bRugOoZetdhbKsebp
 KF8Wht0YT/IIsmBUiqAdgFc8QwZRSTVirxo8p7JNuYU4PmtiQ1OTvVww3
 57eLqRdUVWqQaJ3blOCCdbnozpwiHsI/+rRm6zOqSsnM0oUjgUCm4e7eg
 Tt2dWztjZKrwvm7MT9YAm5hG+LB2Yu0wHHeBbMXEbg2iBtNC32von021O g==;
X-CSE-ConnectionGUID: gkWSSyrJS0G67Jd7NjpKqw==
X-CSE-MsgGUID: ql83AaSUTMCMthAa23Mnrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="13301525"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="13301525"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 09:20:05 -0700
X-CSE-ConnectionGUID: mEhDNaMgT9aqe0gyYNYVMw==
X-CSE-MsgGUID: zjr5QmMCT2CJzIaa+oPsoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="63562855"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 09:20:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 09:20:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 09:20:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 09:20:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZ+vxap8P2WcaLRECIRSSuaFDfI10pzHRuuus8XyrxfVLAx/LuYD7PZVw5vA9CJJn+Bmktg/WjpRIW2kD3UxfoVZLac1j/g+OHcgRfJ6uN+10twGDUBsK/SiPQ2CB1fTou+hxOvgmZR1Sui9W3ma4pjXaevBuRSGaAsd2JSs24oa6ZembidOc1N9e/k1DCbhTV9eYMWGvBPO2nhSjmRGAPEwzvA14ourQ5qqlTb1pfyC9fZaEp1pniVJ/olAkXqMXzvqnhAxRulqgxDvSZWWrJVldVyAJ27aNMNVqb7faI6Z3eSAhjvjpN0Q99DEjOozcjMR3Lrt+2073+55PTdCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhezflSR0uTiOOajQyIfwO6z1CchySPX+tWWOI+wYtA=;
 b=tf6jvZNrU8rnSls204X78UNIb02iPS3PtvjaqNz7RrTc2rjvN7B0AjpKUPADc7vlBF8kqBI30Rr0fE8LB9Bn726Z6RG91TXj4mAI0g/mrRNBtNaTdQH0MtoLiTpVuioP1pSD8RRHKNZ4xljkFaG8MvwJwf2n+b+dt9ihxJb8rdfhjelDFSgz1vH4KWjoOpM/OrVcV9uwThXSIrqvccrarRaxssuyyj5CWFXFX8SR/rQinb42Ss3pt2+TDwgxyJ26YVQWWmgGHl58AKYFBB22IcKghCFF7cK9zCcx+1uE0CW2UwdSI8nJLPy1D7esV+dKXOikjcndwR3NtcDYjpZYBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7974.namprd11.prod.outlook.com (2603:10b6:806:2e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 16:20:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 16:20:02 +0000
Date: Fri, 30 Aug 2024 09:19:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
CC: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>, <juha-pekka.heikkila@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms:cdclk: skip cdclk tests for bmg
Message-ID: <20240830161959.GI5091@mdroper-desk1.amr.corp.intel.com>
References: <20240813110736.68690-1-vinod.govindapillai@intel.com>
 <089b88c8-0d44-47c1-9898-df567a475389@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <089b88c8-0d44-47c1-9898-df567a475389@intel.com>
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cce04d9-bff1-480a-56a6-08dcc90f99b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YbNNtn4XIkMRgJeBTjTg1hLZtThVuL/7IO9Lif2HS1LVhbynFVZhcnm8/8GZ?=
 =?us-ascii?Q?6ercv+3iLfeOCZGWHQ9cJRKitYFEXeU/S6uy2lOsbW4XBrqwskjlJP3wMi1v?=
 =?us-ascii?Q?NEwvvTuukLBkfoxw9ok5WZtU+JiD/JTwm0Jur7JRDiaSo9p49p+gVyjKnqs7?=
 =?us-ascii?Q?FraxcjzEMjnZV3xBZ+2IFWic8NEGpMWtHFwAEapvTfCJ0gKUBcXZLDUxNFSZ?=
 =?us-ascii?Q?vYGFXWhgI878UTvLhdIjxdE447aoFf4WnopUoBWNh0aP0nN5Lf91zvdjnAFu?=
 =?us-ascii?Q?qHMzEBq+LPw2NAP3GdK2D/WzUd4+sv+ZOo6o9PAOA0eXlxLvJMizuLw0uQh4?=
 =?us-ascii?Q?Xb/9bMLgMWvjHngk3nPcDBCHVo3cjX8NlMwEyNkPyaXqdr12r1VXbvbSAHDY?=
 =?us-ascii?Q?FtiGHrHckvx0j1ildJTtAY9E4aOtM/xd/RQVNHId+2aLN01SoeHOgcCVTJez?=
 =?us-ascii?Q?HVMfZIKzCtAfoPx/sM2n+sJgA7o7hrFQLxajFmxGYH1CEoXYax38N6eFQTpJ?=
 =?us-ascii?Q?ZNHbsIgYLH4bHtMZCaMFJauefboyY4ZVmtCn7P7RIgqm30K5ZJQAYASaEeHI?=
 =?us-ascii?Q?CsNuwIslJ9pIVhp8CxM1uZ5tzy20C9oZtIrfU2l8STGJguNcs+xDI0dx6hG8?=
 =?us-ascii?Q?oCNdhQDioijGkhMa2y6kgGySQuW9ChFqLqpR0uyGDKIP946/PRvTEhzEr51S?=
 =?us-ascii?Q?FeHyTPELk3Ksu++brYeQsl8+bCj3YfE/0aSWQIdd/nk22egQBEDf8qhQPJlS?=
 =?us-ascii?Q?2MQFFKSzSvniFIeaS9MmV3ebxtbkTNDqgb1/gvx12BmnpCnXXmZCW4lTcr1W?=
 =?us-ascii?Q?p0ohs5WnTAd/yX6lHaFwVnS1WyD7H3i61vEd+/Tc8GHBlwdvhXTb7UmEfdOV?=
 =?us-ascii?Q?hMJpYfH8W/CkngAgS8SmVsAhThUfge50M7DubNjzTYM67CvURo5hY+8DZ3WA?=
 =?us-ascii?Q?MF0GoAeNGHvwqyyXuU7801+LxNyNl3etuTASE/neCWBin7qxZRhN/El94dqx?=
 =?us-ascii?Q?pPQ3DYKHUVGcsqCACpta1yHtq1i9OGoc39AAcf2+JUX4m8Cg81RFjONgKgiu?=
 =?us-ascii?Q?8fNcljljX700LXc+76PEkLnp758VKyVksuQNPBgC9a9gsTLApL4SGAPZP63l?=
 =?us-ascii?Q?km/Khr4eZo5H2bh8lH0FZEv8xBL4/FWM8xicydVg5JliTYukIMZZA3c08Nyn?=
 =?us-ascii?Q?U5qHBUZlnOqvZwMRyZRcl6Sl+1RHxPmBJOaZgYy8GFrIz/DDAmSr7GqLBwZg?=
 =?us-ascii?Q?4OG/Kai4g3em516pDTfl5S+LrBgM9T05NsOylzmn1ukhNQT9WNfxXVC22X01?=
 =?us-ascii?Q?z6GRpjkni7YsCrOV6qMbPWPr5wkUp6C20/2zkBEOiwaLnA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8UqWYDpjxOqItFafoioxadMSLb9kwdWvCkCfCDq0FA1cFLbSw/1PNeUS+owU?=
 =?us-ascii?Q?6f9D6pvYaAy4UI1vJaVXihNRwtc7Tn4DRD3KuumJ1fHI5bk9JWBwouohE66O?=
 =?us-ascii?Q?18diMKRazcuJXnHdsKMr5UGE7plep9XSPYWqs6gBPUgBX5W7ykN73HK2c93d?=
 =?us-ascii?Q?Tx1B+2oWN9Pnp2JEvWqHls0hra95pyBvDrU8TfON6qyDCQ5xGX45GqDxtSpx?=
 =?us-ascii?Q?T6PdApjD7Vh8xSRR0pZezAlwzpiIWUlgSfxwVtse4ugaS3puR7exsP4bZfBb?=
 =?us-ascii?Q?UdZOu8uuTPFOeOScYlvC2SDUOH28Q10s90LrD9xSNBBG3wEnG763Rk70KTJx?=
 =?us-ascii?Q?fAhL7hRGl9s20Sye5bf9Pa+cbbcWWgKiWW473XssrdTPwZncSU/8QNUR44+1?=
 =?us-ascii?Q?EbVnyFb0YBlzj51B+jB0hLotb4ShhQDyNNO6EFD+CIssdkRg81Gpo6EWuywr?=
 =?us-ascii?Q?8v830FWiDP6/97umlVY1I3C1fNt50bCI/c/ZqJ+MsMsh/R3Y1N8cycPqcBAV?=
 =?us-ascii?Q?V0pP/mxz5gH7/Z3L5henOIiYq5/J4ZbF7mvrCEfT+38N8WQh0BZdIf6c6WYp?=
 =?us-ascii?Q?5Hl7Xw917ceo3mLGL2JRZYET9Vimu/0YoagjHafxH0jmjMy60JUuj/eZLKeO?=
 =?us-ascii?Q?NvMieP1dWd5iEqJz+yZ7PxVl0SmwdGA1+ouQs0x0c0NHbahGYb0KvBZV75f7?=
 =?us-ascii?Q?bu12rjADcxMhjsdoDEA/Gyr3w4SHZLRD3ACfyPJyXRBWSY9JFTe0P87OuWC9?=
 =?us-ascii?Q?b0OMUenOeaeKOkI8xdL7J056zI4dBm143xWsIFegVSgpJwlcoV9PM+S1qXye?=
 =?us-ascii?Q?pesRN8Gf0CGtFw1q3k8YDH5Z/SRBWDrpXyoh4o1/vJc+aGA7ApS2un9pEIUC?=
 =?us-ascii?Q?EAyVl8bN98U0sRcU3kyuI9FijjCszaQBGsBxgF5KtLeVqjz6+z3o3/Saxwxn?=
 =?us-ascii?Q?kAQcYwEknpzAu8QquOmKn22biInpo96j82AvkwC6guarYwNT1cWc4NLIcxrq?=
 =?us-ascii?Q?uGABtSsW8W52Z3/tX/r8ecKcB7DugX/IqvgkIWrKTMvi3mTlYiBFkJUeQdPo?=
 =?us-ascii?Q?tb8kBIrSKIJMoQZPfEVVapZBNTX53mS4lascrdVUxTbii5+mL0U64yvBsnMr?=
 =?us-ascii?Q?427z+rIJK7/3q2CDUx5iJEPycWjC7DhLb96tBSLXudSm9OcRlMJv2qUOEvei?=
 =?us-ascii?Q?lcIGhJ3ooUK2eQBZFAC6IAzc7/FnOIZnnIqwub0yVhQhFDLqzok21m8GiBwM?=
 =?us-ascii?Q?tu5PWH6W8fUecDpTNt/HJl8Wd6P6C58shyT76NLkFTccP4SILYP5sp3zYYiN?=
 =?us-ascii?Q?SwrM1KXfSjlb5CGrunpWCct+HVgI02drJS1QiGkZq02NdCYjYk0vmTAuFTOj?=
 =?us-ascii?Q?s0w0v7jLm1iygACwhM44UEwKXYdiyGUjQ2bWjFrKRaZjWquLliZPTQcCyjau?=
 =?us-ascii?Q?bqGgXAq4ejAIH2JUjD/S1SQ3qi3ikgGJxDA0kPB1O7hVWqVRPsETEQI6lH64?=
 =?us-ascii?Q?5g9a9ILuc7TY9DXkjHA7R6yaxCdQU1pmtc+YYlw82F/wvS8Vptw5DRDyL42k?=
 =?us-ascii?Q?gd/1C6s4Go0zBA+3jhgHq6t5GD2XNf+q1H0yNyHBDcGHjfxZ0UXO+HSiwgQK?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cce04d9-bff1-480a-56a6-08dcc90f99b1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 16:20:02.1134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Q5XnbousbXT/+yqHx4xlJHooCTTXAcKV6uE02+q3XMla33DUvg6p2nng1BSZS/rzR6CR7hCfrQEa6qEBIfofXGA0XzgvAvCUCfH03Z9I8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7974
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

On Fri, Aug 30, 2024 at 02:27:05PM +0530, Sharma, Swati2 wrote:
> Hi Vinod,
> 
> Please fix the subject.
> ++Matt for his feedback

Yeah, due to Wa_15015413771 there's only a single possible cdclk value
on Xe2_HPD, so we won't be able to trigger any cdclk changes in igt
tests.  It might be worth actually putting that workaround number in the
comment to make it clear why BMG is special, but:

Acked-by: Matt Roper <matthew.d.roper@intel.com>

Matt

> 
> On 13-Aug-24 4:37 PM, Vinod Govindapillai wrote:
> > As there is only one cdclk option in BMG, these cdclk tests
> > which look for change in cdclk frequency when changing
> > between high and low resolution mode will fail. So skip
> > these tests for bmg
> > 
> > Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> > ---
> >   tests/intel/kms_cdclk.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> > index 6fe6e6c3f..24a0c4547 100644
> > --- a/tests/intel/kms_cdclk.c
> > +++ b/tests/intel/kms_cdclk.c
> > @@ -402,6 +402,9 @@ igt_main
> >   			      "Hardware doesn't support crawling/squashing.\n");
> >   		igt_display_require(&data.display, data.drm_fd);
> >   		igt_display_require_output(&data.display);
> > +
> > +		/* Only one cdclk option in bmg. Skip all these tests for BMG? */
> > +		igt_require(!IS_BATTLEMAGE(data.devid));
> >   	}
> >   	igt_describe("Plane scaling test to validate cdclk frequency change.");

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
