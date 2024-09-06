Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F76E6FE48
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 21:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C8A10E1C8;
	Fri,  6 Sep 2024 21:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRXS/qDS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4BE10E1C4
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 21:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725656826; x=1757192826;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N47iw1tTxosREiHmTvif2cwdlr3Vr3l50+ieplXqHaA=;
 b=XRXS/qDSqpZXhPAygv7tUq9u3l5Giwfu3g+yf/5/NyVlS7UFrAlI9w1T
 kClEM8NHje7Ox7+1nKjmXF5pz5ckXR7Ox1BAFNLMmHjhUze7T0WCOzBF9
 B6jy3dwQ6UmffqWsLpVjCFqLBvOgaGkP+tJwN73SvUquDzHHF+8WaIGlY
 CEm+hk02etOuH5kUsEA7B0dQG3ywLqs/ydzG4M1ksiHHHLKCfehzwwajJ
 K7ouL9wxa3EqQZN60atrcOi7rRcHoBnhwoO7lI16qa9hz4eTgPpGDBPRr
 cbbEgqsV0LmZLXcnrC1UnU/qd4UT8IPf6RzK7iwOfPPpxyq4nXZw7u/V+ g==;
X-CSE-ConnectionGUID: qqjIRNpBQ4atwvHlwIgHaQ==
X-CSE-MsgGUID: BZ3/NFvQSHO4rJPTL46aYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24538391"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="24538391"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:07:06 -0700
X-CSE-ConnectionGUID: DL4juj8BRHi3nQtVSrfE7w==
X-CSE-MsgGUID: LOmVkBFYRPCWGntP6c49Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="66806118"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 14:07:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:07:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:07:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 14:07:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 14:07:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8CRQOyrjfMRDGjw/OUwmOifw6L10edRzMSLqFKEkmC+gxAVwePfMP67el33sgIJ102kb6kPaySk7As96ARefq74kDjlBB2U8k6xfw/Z7RF+kUzn/7n8eCwjZa0ySSRO6dUSCgX1xYKusB3TqJ+3tEym4oyCqw1+QgabP0wkZyiMb642GXha/k5za4m3tGO30oPBl+1PXqwmsKfMi4j32nCVOzpbHbn5UdOqPk6lB8v+W9upnVs3D6IV6IYk2RRbFD1qZaX+9tYtEQMfhHKmDQON+rcFBRFPNHuzC6M5aSphHL8D11S8Fw7w03ejW78a088YNVvsLK5eGyxlWtaMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0P7AReUDuS2rwQh05ADPtpARC1JxAxrru5j79ZO/VM=;
 b=cxWutTfu4JEWypLLNw1zBRy/gYebK/NlvtdnnSJ513Qcdm113AG6+mfwVnK9xEn4Z7ljzhUNadpPdfxfK3YVWNFEvmU9Wo3+41AnlTPOy17HQNs3uqTsupleCANFWK/LtsYy/jns5xDo16nCJgjTX4ANbP/m5xDAo4Q0Zc5oLexNECL9zlRBgby1e1bRh16VHq5SE4DFqvS2cD+1A8gn1pHgSKlx5u58OMlHdYMua3ndV+WtUOGnjsJAZJK3Dfdpmc5cAAhJyMCLZVJlOTBxzoDNb56SUIt6VmVwljy84xWFFKQpi3hAcsOGQqfXPGgRQJs+a5my7Fej1mSWLXEQIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7897.namprd11.prod.outlook.com (2603:10b6:930:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Fri, 6 Sep
 2024 21:07:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 21:07:01 +0000
Date: Fri, 6 Sep 2024 21:05:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_drm_fdinfo: Wire up
 parallel/virtual submission
Message-ID: <ZttufWJhURmdvXY1@DUT025-TGLU.fm.intel.com>
References: <20240904225746.2857448-1-lucas.demarchi@intel.com>
 <20240904225746.2857448-2-lucas.demarchi@intel.com>
 <ZttCa6mrfuBa109s@DUT025-TGLU.fm.intel.com>
 <maccwdzt3b446du6nud6lewox6irkscu3ermdrteqkfakv7xk6@7ov3teecnqss>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <maccwdzt3b446du6nud6lewox6irkscu3ermdrteqkfakv7xk6@7ov3teecnqss>
X-ClientProxiedBy: BYAPR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:40::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d70809-b132-47cf-d212-08dcceb7da58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a6QMSaFyWqq6F9sim82LaEsR7U5KbCSdwjGEW1hBvRwhAV+od7hMlVt9g03Q?=
 =?us-ascii?Q?dkS3teeESPijvbu9HHOwUa4bHixuds4FYq1aAdgOnxScO8YlSUCbVBIaoEj4?=
 =?us-ascii?Q?GWKjMhTW14cI6vcL8bzjYUrgDPpvVQSmx5W8G6w65/zvPfmqOeWStGPBba1L?=
 =?us-ascii?Q?URiuaMjBk1E4HPHZIBktlPgRiUoenwT/0z7EhONROedakXaXisgUhXo/7+IX?=
 =?us-ascii?Q?eIFgopP2g6wQWlWxfcLSZGFC9W27Gl6Gydqxjxjz3FilrgX6WUDaighfgBnE?=
 =?us-ascii?Q?X9KAzoLl5fsiq2CxTKNjNgpQidc+l6uAtQR6K3WT2LFfVDyHghWy7ynY1yQb?=
 =?us-ascii?Q?3j09pO0IQqPc8A+D86wox5HxxKxJ5Czo7gIIikpxeJel4edn4VEJOitDysM7?=
 =?us-ascii?Q?pmcfLYXJv83UtbRK8UWoqnmmBnU931Oizyr2sRTchyhDaD6zMC7ISaJ0sYdi?=
 =?us-ascii?Q?OnA8n/TvmZLHPsC1FzgiTJaSlLs5VMZO7aq5JiuM9lXAyjfj4Xi2BntStlSQ?=
 =?us-ascii?Q?JVquQR0ze3n0XzxnO0BO+P23Panh2a0obMCGBVXkh/H++Nlu3JFHY2Y1Nezs?=
 =?us-ascii?Q?80EonNLrFyQDlRK+8ZhCG47D9Zp1wQzDVpQUPoew+mz2/2Kq6C6xGJEnGPTd?=
 =?us-ascii?Q?tlztj8Ve5OduZCRZfNvSwpAoMTOZeouEL6Ek1GiCu7v11o9YGIOT9jI3UnlW?=
 =?us-ascii?Q?9+IlSp6R5vfO7D3K6T/JNvldvgVKN1zl+iVobHv9diOQjqEKALzJ88LuNlJw?=
 =?us-ascii?Q?+DVtYxDDqorJXkAPExbEt0/H0gzgTjp8LuB2KjTFI6sG3vBQmy7AUouGOpl1?=
 =?us-ascii?Q?VjvNprMZ90P3CV4tdRVA4xvnJWJN7wpsdXCX5S8CJ7QqmpM1gJXVloQdl7/L?=
 =?us-ascii?Q?wpLZrrNehCmxUrzCSF/B5DNtv1NMYPmarlyYwoswvhTx6/YY6woDjWmtMfuy?=
 =?us-ascii?Q?FGtQa6sZxKcuwJsECHcYt23w94+Dy3FkEmmbhZQvJYAf9JcfIC2R44Cm+x6t?=
 =?us-ascii?Q?PqWsqRllQziAKffQSBi5SHOzKkSqo4QZJpRTrw6mAP/8be4asWTUGfodAohI?=
 =?us-ascii?Q?vZLKewq40UAfg1tsvQFnMpqyR1NEQ4hBc7zrOu5pHOWjprv3Kn3QHTKUn21c?=
 =?us-ascii?Q?Y6PQXsxI45bo9Vo0JpsEbLXxuuuiiX+gDg/hg3jFCuVA/s1CUxpkXVN6YmFo?=
 =?us-ascii?Q?/5gaeY6gMQow2WrgDR9bOcOUe8U8GHfggF13rG76JDMg/pGsKulnslsPbbpS?=
 =?us-ascii?Q?OnXhSnXU+bbzHKWKehMCQRZ6ixMwyAO/6278DohUaq26QzdVtcRXZMOJwCN/?=
 =?us-ascii?Q?QbMIBn7Fdfl5spDLW/0O7KsLK3CM38z9tJyUi5gJKj4eJQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gBTxELk7zSJIxrmUKf9DjXS1eakO1JQN5XFxw95YvWbZhUPZKYg2K3kdce+Z?=
 =?us-ascii?Q?HmExu7owxKix8Oujclhuw2DcdGC39evPiMyE2+Pff/pVxPdi0difmjHY9GRs?=
 =?us-ascii?Q?1LezaSAKJc9WAg99ytmX/MJu2dk1XoWniCUVOXLAhLK68ZHSBZPTdFF/A34D?=
 =?us-ascii?Q?HfIp3pVRrXgOJZfYKZWirAP3yG3HbtmNchO2gPwtYhWfRSex8PVQPnFAshB+?=
 =?us-ascii?Q?un2q58lf6ImNqiUlhSU8MGmKm/pRNy+TB8ENi8cMSmuXU+aAQuJ0wMuOkyxZ?=
 =?us-ascii?Q?C0Z4cbDoxNbTezboRIwXy580SxQIIiKNEsYb2Dggqa99eqyNDYf3QGXBHFeS?=
 =?us-ascii?Q?1V0g3g5k+9+JiUpYaDDsnUr2wAtTog+QTVLZSi0CtKotTAfU7Dr13dUTV9pi?=
 =?us-ascii?Q?dWAT2wOlJ5yRsqgs/TZ6V9sW/HIOC+XqUPOT2AXk33U2D0y+lt0WNObenpZj?=
 =?us-ascii?Q?2kc0rA+RgeIUOsE7pAhaXUDbM/HzXyoc1VHrSvIxxbtXBXhymItTQXsGBACZ?=
 =?us-ascii?Q?WzViwI/i4YgfPQRe/33/yvnuUlyv4MqQAywLLOo4ZZnSG6GwM8eaWC8rXdhI?=
 =?us-ascii?Q?2d9UCpA7goJ8b3meq1B2XAWROnsLyorkXkeaqFs5SZN8abn5HCnOUrEuDmio?=
 =?us-ascii?Q?AVa2/ZbGe2Ub7/vhHsAwyqFyKRFK8V/J/EtYng+iTgLRcwvAxoi9/7UqUU/K?=
 =?us-ascii?Q?Uj9VhWPNvw8XpUIGF59OewREJpjAClddEUj9D0yp5bOoxCWPeiice/yO6EpN?=
 =?us-ascii?Q?w0TYluk+V+/AM0nwwOa26PhUOmLDzguWpcTb/bNQJqSm2t/BfXV2TubeXn8C?=
 =?us-ascii?Q?Qqav1LpRpYtaFNvH5LzRSAAesCC6BLB6A4mLX9aqoDE1CTibKa6SoXqBgp1a?=
 =?us-ascii?Q?hi64IVKLUwTz3rnSBQXandx3dWEJHAYBcKMFCBW02zhQs8o4u9pJ3g9SmZHx?=
 =?us-ascii?Q?8ObI7fLS97GSW4t05ATnzNhNQlJ4sKOmb+brPcrTZpFz1VXJGryQ6coNQ0bo?=
 =?us-ascii?Q?AYEYGAQUhFjTpb4Sdr3IBCexvqInuTeRZynXVKsEZ6fXcgUN4Zv0bI+4pTWN?=
 =?us-ascii?Q?hU4Oj2ebFAo95dQs+2/F7YtwL1Eez58HqM0gtlf70jamAmlnX15pQbLx2jK3?=
 =?us-ascii?Q?1idRyRJSJ2xceqGLfrIvlMg7g1pgig8FMH2lUSKusEkzmJ4soYUTqKIfd19c?=
 =?us-ascii?Q?9FZulvb9slNgtfwu+hgK1DX1tXruFkjWjReSNWrs8xrao8HKUrPqGBuBlOoB?=
 =?us-ascii?Q?/4MURda5t39fFerjfRhFQC7P/7Xy76oklWvgm/pJQVj2dc02UJ2NUwzMwafa?=
 =?us-ascii?Q?42Yw7Vj8NyQZWU+kehg21+sc4kaTWaVjMOGvj7omWd3iddC3R5kFXiPywDQy?=
 =?us-ascii?Q?NijiaH3MjvWea31fGmWMVKgqP/ohF18Vhh931OWtGOn2YNmRh6rDAvn0o4iN?=
 =?us-ascii?Q?CptGzSDxHoK/pW3CI36nTd7WdoAh8troCAv2c8q//i09i6InJnJ5hY0g5isw?=
 =?us-ascii?Q?mvFxe3PMsVnhnCYpluxFK7FOPCNHhee/2/Dl1IUyz6SHSKs2ipv+iHTsXsvw?=
 =?us-ascii?Q?imd4h+Kb568naVucw5Ys+Satf2PR190zcxYXC2rjX41eAPlfNSCgVBCh1D6B?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d70809-b132-47cf-d212-08dcceb7da58
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 21:07:01.8769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnTJCYeH7nsR6FO2YsFFXS7j2uxxrob5s0IYwyyTdnqDeIv+PPXcO7oMHmQjYksIX6t3Kh4s3kic3kWvUHoQsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7897
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

On Fri, Sep 06, 2024 at 01:54:36PM -0500, Lucas De Marchi wrote:
> On Fri, Sep 06, 2024 at 05:56:59PM GMT, Matthew Brost wrote:
> > On Wed, Sep 04, 2024 at 03:57:45PM -0700, Lucas De Marchi wrote:
> > > Add the boiler plate code for parallel and virtual submission in the
> > > spin_ctx_* and check_results(). This is based on previous code by Umesh
> > > that got simplified before applying.
> > > 
> > > Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  tests/intel/xe_drm_fdinfo.c | 61 ++++++++++++++++++++++++-------------
> > >  1 file changed, 40 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> > > index d1ed0fcaa..8acb95040 100644
> > > --- a/tests/intel/xe_drm_fdinfo.c
> > > +++ b/tests/intel/xe_drm_fdinfo.c
> > > @@ -365,7 +365,7 @@ static void basic_engine_utilization(int xe)
> > > 
> > >  struct spin_ctx {
> > >  	uint32_t vm;
> > > -	uint64_t addr;
> > > +	uint64_t addr[XE_MAX_ENGINE_INSTANCE];
> > >  	struct drm_xe_sync sync[2];
> > >  	struct drm_xe_exec exec;
> > >  	uint32_t exec_queue;
> > > @@ -375,18 +375,29 @@ struct spin_ctx {
> > >  	struct xe_spin_opts spin_opts;
> > >  	bool ended;
> > >  	uint16_t class;
> > > +	uint16_t width;
> > > +	uint16_t num_placements;
> > >  };
> > > 
> > >  static struct spin_ctx *
> > > -spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm)
> > > +spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
> > > +	      uint16_t width, uint16_t num_placements)
> > >  {
> > >  	struct spin_ctx *ctx = calloc(1, sizeof(*ctx));
> > > 
> > > +	igt_assert(width && num_placements &&
> > > +		   (width == 1 || num_placements == 1));
> > > +	igt_assert_lt(width, XE_MAX_ENGINE_INSTANCE);
> > > +
> > >  	ctx->class = hwe->engine_class;
> > > +	ctx->width = width;
> > > +	ctx->num_placements = num_placements;
> > >  	ctx->vm = vm;
> > > -	ctx->addr = 0x100000 + 0x100000 * hwe->engine_class;
> > > 
> > > -	ctx->exec.num_batch_buffer = 1;
> > > +	for (unsigned int i = 0; i < width; i++)
> > > +		ctx->addr[i] = 0x100000 + 0x100000 * hwe->engine_class;
> > > +
> > > +	ctx->exec.num_batch_buffer = width;
> > >  	ctx->exec.num_syncs = 2;
> > >  	ctx->exec.syncs = to_user_pointer(ctx->sync);
> > > 
> > > @@ -405,10 +416,10 @@ spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm)
> > >  			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > >  	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
> > > 
> > > -	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, 1, 1,
> > > +	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
> > >  					     hwe, 0, &ctx->exec_queue), 0);
> > > 
> > > -	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr, ctx->bo_size,
> > > +	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
> > >  			 ctx->sync, 1);
> > > 
> > >  	return ctx;
> > > @@ -420,7 +431,7 @@ spin_sync_start(int fd, struct spin_ctx *ctx)
> > >  	if (!ctx)
> > >  		return;
> > > 
> > > -	ctx->spin_opts.addr = ctx->addr;
> > > +	ctx->spin_opts.addr = ctx->addr[0];
> > >  	ctx->spin_opts.write_timestamp = true;
> > >  	ctx->spin_opts.preempt = true;
> > >  	xe_spin_init(ctx->spin, &ctx->spin_opts);
> > > @@ -429,7 +440,12 @@ spin_sync_start(int fd, struct spin_ctx *ctx)
> > >  	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> > > 
> > >  	ctx->exec.exec_queue_id = ctx->exec_queue;
> > > -	ctx->exec.address = ctx->addr;
> > > +
> > > +	if (ctx->width > 1)
> > > +		ctx->exec.address = to_user_pointer(ctx->addr);
> > > +	else
> > > +		ctx->exec.address = ctx->addr[0];
> > > +
> > >  	xe_exec(fd, &ctx->exec);
> > > 
> > >  	xe_spin_wait_started(ctx->spin);
> > > @@ -450,7 +466,7 @@ spin_sync_end(int fd, struct spin_ctx *ctx)
> > >  	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
> > > 
> > >  	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> > > -	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr, ctx->bo_size, ctx->sync, 1);
> > > +	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
> > >  	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
> > > 
> > >  	ctx->ended = true;
> > > @@ -476,7 +492,7 @@ spin_ctx_destroy(int fd, struct spin_ctx *ctx)
> > > 
> > >  static void
> > >  check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
> > > -	      int class, enum expected_load expected_load)
> > > +	      int class, int width, enum expected_load expected_load)
> > >  {
> > >  	double percent;
> > >  	u64 den, num;
> > > @@ -490,6 +506,9 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
> > >  	den = s2[class].total_cycles - s1[class].total_cycles;
> > >  	percent = (num * 100.0) / (den + 1);
> > > 
> > > +	/* for parallel submission scale the busyness with width */
> > > +	percent /= width;
> > 
> > This doesn't look right. Wouldn't a width submission be busier?
> > 
> > Maybe I'm confusing myself but everything else LGTM.
> 
> the thing is... the fdinfo reports the number of engines of each class
> (drm-engine-capacity-<engine>) and expects the reader to scale the
> total_cycles according to that number.  We are lazy here and instead of
> using that number we use width that was passed as input.
> 
> Example, with "*" denoting when cycle is ticking.
> 
> 		s1		    s2
> ccs0		[**********..........] == 10
> ccs1		[**********..........] == 10
> total_cycles	[********************] == 20
> 
> cycles[ccs] == 20
> total_cycles == 20
> width == 2
> 
> Calculating according to check_results():
> 
> num = 20
> den = 20
> percent = (20 * 100) / 20
> percent /= width == 50%
> 
> which corresponds to the reality that this client occupied CCS
> for 50% of the available time.

I kinda reasoned this after sending my reply. Thanks for confirming.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> Lucas De Marchi
> 
> > 
> > Matt
> > 
> > > +
> > >  	igt_debug("%s: percent: %f\n", engine_map[class], percent);
> > > 
> > >  	switch (expected_load) {
> > > @@ -522,7 +541,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
> > > 
> > >  	vm = xe_vm_create(fd, 0, 0);
> > >  	if (flags & TEST_BUSY) {
> > > -		ctx = spin_ctx_init(fd, hwe, vm);
> > > +		ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
> > >  		spin_sync_start(fd, ctx);
> > >  	}
> > > 
> > > @@ -540,14 +559,14 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
> > > 
> > >  	expected_load = flags & TEST_BUSY ?
> > >  	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
> > > -	check_results(pceu1[0], pceu2[0], hwe->engine_class, expected_load);
> > > +	check_results(pceu1[0], pceu2[0], hwe->engine_class, 1, expected_load);
> > > 
> > >  	if (flags & TEST_ISOLATION) {
> > >  		/*
> > >  		 * Load from one client shouldn't spill on another,
> > >  		 * so check for idle
> > >  		 */
> > > -		check_results(pceu1[1], pceu2[1], hwe->engine_class, EXPECTED_LOAD_IDLE);
> > > +		check_results(pceu1[1], pceu2[1], hwe->engine_class, 1, EXPECTED_LOAD_IDLE);
> > >  		close(new_fd);
> > >  	}
> > > 
> > > @@ -565,7 +584,7 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
> > >  	uint32_t vm;
> > > 
> > >  	vm = xe_vm_create(fd, 0, 0);
> > > -	ctx = spin_ctx_init(fd, hwe, vm);
> > > +	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
> > >  	spin_sync_start(fd, ctx);
> > > 
> > >  	read_engine_cycles(fd, pceu1);
> > > @@ -579,7 +598,7 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
> > > 
> > >  	xe_vm_destroy(fd, vm);
> > > 
> > > -	check_results(pceu1, pceu2, hwe->engine_class, EXPECTED_LOAD_FULL);
> > > +	check_results(pceu1, pceu2, hwe->engine_class, 1, EXPECTED_LOAD_FULL);
> > >  }
> > > 
> > >  static void
> > > @@ -593,7 +612,7 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
> > > 
> > >  	vm = xe_vm_create(fd, 0, 0);
> > > 
> > > -	ctx = spin_ctx_init(fd, hwe, vm);
> > > +	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
> > >  	spin_sync_start(fd, ctx);
> > > 
> > >  	read_engine_cycles(fd, pceu1);
> > > @@ -605,7 +624,7 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
> > >  		enum expected_load expected_load = hwe->engine_class != class ?
> > >  			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
> > > 
> > > -		check_results(pceu1, pceu2, class, expected_load);
> > > +		check_results(pceu1, pceu2, class, 1, expected_load);
> > >  	}
> > > 
> > >  	spin_sync_end(fd, ctx);
> > > @@ -632,7 +651,7 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
> > >  		if (_class == hwe->engine_class || ctx[_class])
> > >  			continue;
> > > 
> > > -		ctx[_class] = spin_ctx_init(fd, _hwe, vm);
> > > +		ctx[_class] = spin_ctx_init(fd, _hwe, vm, 1, 1);
> > >  		spin_sync_start(fd, ctx[_class]);
> > >  	}
> > > 
> > > @@ -649,7 +668,7 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
> > >  		if (!ctx[class])
> > >  			continue;
> > > 
> > > -		check_results(pceu1, pceu2, class, expected_load);
> > > +		check_results(pceu1, pceu2, class, 1, expected_load);
> > >  		spin_sync_end(fd, ctx[class]);
> > >  		spin_ctx_destroy(fd, ctx[class]);
> > >  	}
> > > @@ -675,7 +694,7 @@ utilization_all_full_load(int fd)
> > >  		if (ctx[class])
> > >  			continue;
> > > 
> > > -		ctx[class] = spin_ctx_init(fd, hwe, vm);
> > > +		ctx[class] = spin_ctx_init(fd, hwe, vm, 1, 1);
> > >  		spin_sync_start(fd, ctx[class]);
> > >  	}
> > > 
> > > @@ -689,7 +708,7 @@ utilization_all_full_load(int fd)
> > >  		if (!ctx[class])
> > >  			continue;
> > > 
> > > -		check_results(pceu1, pceu2, class, EXPECTED_LOAD_FULL);
> > > +		check_results(pceu1, pceu2, class, 1, EXPECTED_LOAD_FULL);
> > >  		spin_sync_end(fd, ctx[class]);
> > >  		spin_ctx_destroy(fd, ctx[class]);
> > >  	}
> > > --
> > > 2.43.0
> > > 
