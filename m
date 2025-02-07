Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A451DC02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 21:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1FA10E02F;
	Fri,  7 Feb 2025 21:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgErHWve";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E5610E02F
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 21:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738962294; x=1770498294;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MPws2dYIOjAJ3HBABlTCG9KHV1rCjDqUMZCbZttBKRU=;
 b=jgErHWveNoC/BmWCp4lt/DqwXT/4lpakothLXbcFTiVWBQMNr7qxKFhA
 udvID3OPi5gM1E1+H9sKjvQ9GaT7oZp7KBpkuRCc/4neNAnVkgk+gEUWM
 fCNpPjE8zqkxeybbl5ohw0TNE9Ra+0fdknaPdkCEOsh4MduYim9l8J0Jm
 yhPSWEjr5KKK5ummwreXrDIs35QkUzkfQIbURlNgpouVfHZ4BXHgU1hZz
 Xp516NNpmCoBJMnAOEhvglJxLOwfgHfuXoWUQ9IrMSAlpOTOPgK2C4Kw3
 u5kwZmeUEDbb54pnwHod8+QA9TA1pQeS8LqmBB6I0xOdHLAnDBHPTpB0q Q==;
X-CSE-ConnectionGUID: hDrv6T4pSd6wi6EVQakFBA==
X-CSE-MsgGUID: FEw+iEEGRlGigY5B3DQDeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39879845"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="39879845"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 13:04:53 -0800
X-CSE-ConnectionGUID: Ig/Ih17mSEWgemXq278Nfg==
X-CSE-MsgGUID: dn0ohkZyRrum2FMQjSdVJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="112143573"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 13:04:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 13:04:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 13:04:52 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 13:04:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGRTB8qab8Ny9ZfEHBWTo1pOnH1WPr37gf1Heafx2RpOA3tGt5J9PUwfLsvLdezipIbU2RotIQaEvjC8YHVownJGE4aqtJ+3/Wwr1P1DMEg5jZmS6KueSrJcQY+smZF2hy0jIxL9MWG/9waMc5+TCnmlwBITnOG8RxlR9aobrj+oMjytNwGXlepIkZghG9IYpFRYKre29+mPGTwYe2TU0/4UdgqjyNRavJfLKHlIcfD3c4tMsTRn7ba0MAIJrzi/W3mQL9HFxYJ4ucUbTuNGESDy/5oOIRJZLbQwBO8vfaYh6heVh/EzzschyiCQO9XpFtBXEd5MpKFq6b3b4LrRVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7A69UwzpuN0MZhXg/FgU/mhbKCt9s/VioooVbJKKqco=;
 b=ZO8MWRu8rjKOleecA4sHSTiqyE2lUiVyI0rtAM6i50QAnhGoxqiclvsayoTZ4Mv3zR/MXsXzYxJ8d+NzCQ3Zc7iL44h4Qb7WLorClS+GvAnNHLxfc6pCKyODJXwpEK9IIIDUZTBWSAxtMHzxUeM308E2Q+9r48WlCKwuhc2QJBmYO5cliB4Xk7spgx9W79EpVT9IuvAmgW7VS6r0y2sEHp5Yf0gPJOmVAESSWTkXOirQY2AK7dtmsmzvvxP3c0eixQsOgAc33ZAMv2p4Y3WxdLFITwsSmVhSuOiNOnlx1PWnotYnKyxZyVCcDx34mQ1KsEHQ/GqLtdlkfkJJ012BtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7024.namprd11.prod.outlook.com (2603:10b6:510:220::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 21:04:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 21:04:47 +0000
Date: Fri, 7 Feb 2025 15:04:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Atwood
 <matthew.s.atwood@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL
Message-ID: <y2wm334262gpb2vj5axwxkuyjkmbfjznmhnsrrd4w6bdgyuyrj@jcwf7vhsf4cw>
References: <20250204175302.18147-1-matthew.s.atwood@intel.com>
 <20250205233055.GV5109@mdroper-desk1.amr.corp.intel.com>
 <Z6TsGM6LD26qIcRY@msatwood-mobl>
 <20250206180113.GL4460@mdroper-desk1.amr.corp.intel.com>
 <Z6UMzbDHC9vMPRI2@msatwood-mobl> <Z6UPA-zaG1AwWAlX@intel.com>
 <20250206194447.GM4460@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250206194447.GM4460@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:303:b6::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: 83355952-f578-485d-2249-08dd47bb0dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9Qz3iv4GuE40axGb3t6JSt5V7frWFKpsyXPcX79pPvGWOXK8CpAWxKslQRgv?=
 =?us-ascii?Q?XC1GfOsLuIODBfoep5L1RTlKQ8mOgBkeQTTKnCqCSGEE8rmNRcBRT4zZfHYI?=
 =?us-ascii?Q?Q8DyNfr0OrYW4OQ/66ZnM1FOPly+KHA9PIgn2yPNU/pW/jTy7X8jkdWYl1qy?=
 =?us-ascii?Q?c9KhnWVk/hzVH0a6PWb9DuewYaNrkfJPDMxO8yzESgp1QwjIZM8t9OGX7ip1?=
 =?us-ascii?Q?J9K+poWTTIO5nTemqLHZmgf0dU8J6eq1ybTMtnL1ZLWhYpeatmNNwDvno/jS?=
 =?us-ascii?Q?ryQVE7ubRoFpXvVz5CwWszJ+ISvKkuKJTynB7nE3cZUqdtB3EacRSD6Uy5Pf?=
 =?us-ascii?Q?Cerc+F2f+3IVEz8whgRwX7MJrVYf3EoL0+Is7YV9d5UcR0Gu2ocgNx4mDWNe?=
 =?us-ascii?Q?iHVq/UlMQV18vTP/7csip06EFzLQrvy/fvrt9aWHr776mW4uZLNbR/0X95c4?=
 =?us-ascii?Q?Zn2k7CBB+RjyNiB3RScvJueyjvGYofVU7c0kfJi7c3dpolPsWE/e78aRfXGe?=
 =?us-ascii?Q?Q/PS6hL8kTVhgNKrFE/2VTH0u6ENXTd02u9EX3cxhdRe2dppybvvE+BzTcUi?=
 =?us-ascii?Q?s4gno6Jx47aToNutVv9Dqf1HoYTv9OAhjfcwWqTuuA27FwcoaKS4edNB4Wzz?=
 =?us-ascii?Q?FZ4IbonSZIJKkbcPxfww/T7ocSD9mcG+hy4OtMmgYV7UPO9/o3whmzcMfk0G?=
 =?us-ascii?Q?vRbQ3gJqIT6rwsskgLLppnRqOt7z3IAjNSNGaNs0M3QoV3lTCQM1o6llggRA?=
 =?us-ascii?Q?yEL/0FXCTuePEy+hquvbuWw2beOP+vkGfAg2Uctcr9eEEQfnCf/iWrIHI8LE?=
 =?us-ascii?Q?89jGD9NjAJabporGe2lz6K1FDImNXUeBhpZIEpmedKvcHsgL1QzggloyMOBe?=
 =?us-ascii?Q?czgz07PDtORhPM7g92vet3En/hU1FarirAj+zKP6Aq9yG0OP84xgW10ICp19?=
 =?us-ascii?Q?fM9TQlammaVj/xR05xqsSr3dEHm81TEsmPA6LSZMzHWmxmWL4NrY7BdN9PGy?=
 =?us-ascii?Q?+ytLaeg31t4fzvkEbQrAEm1PADrWGdFrlZLcexeXf4ON3ZaJFtn+sSRHxNWp?=
 =?us-ascii?Q?oxs0PYQCNWxd6bUYhJlK4tg55wnDNIdN95y5W3IAHrySu1nBLelFqU4yb+27?=
 =?us-ascii?Q?nFVNdVV96XZxu6wkdUsKAWJXyf1M5SrsI15dR8NFeWsW87wlX7cV5gfZ+ijy?=
 =?us-ascii?Q?g3O32d96hRwzAjtUwxE0ZiHrXZGlD8cyK779js6ClPPcdHTjnnXnwvEX84AS?=
 =?us-ascii?Q?uHtBFxmla1Ssmpr+sBrvU3qhrL4qY8iFsULriU72l5DTIN0ZPkjSErTzGGJb?=
 =?us-ascii?Q?CZcaulSmMvPfcwmgvgAwegtVp9NoZGlvHMs1zoou2mUwLw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TmUJKcPJYr/TGzRWLQFhH4qFuJW0DjYhNz1rz2Q+sw7wjeSoGoy+mXCyKYzK?=
 =?us-ascii?Q?RTnGsj/qEmXE/xXu/E3k1boZ1TgoaY8CrM9ncZXdl8u0bi56CEKjj1vVdsGo?=
 =?us-ascii?Q?gB6Mycok34IdSrm5UsMb9biyFoiyyKtDf0Twsy5cY+MBfaAoI9Tun0HoJwIR?=
 =?us-ascii?Q?3YdGrOAsxf5mW3NzkkCMuRf+qqjUwjlJ2px+lOmFYMb0p4ljMJ/Ax/fegwbP?=
 =?us-ascii?Q?B/4NZAnucYSSCPur6Qu0p8OyesikKKTJ5skwscPS5GxGwTgI5xenjbSZ0Hk3?=
 =?us-ascii?Q?dQEh4vfHB+Rl53/2HP6H7XbHvXu8cKzpIgTRAcgCv1d9JouumniOCiNn/FSX?=
 =?us-ascii?Q?GoNKqGhZiK7/co9zORP+B9AAKmfDaBW+w7zvKinTIE/xsbH894UXeO9rPu49?=
 =?us-ascii?Q?TX13owDSkVq8FtykwASE33ktNbbIBEC8foMZ3mVccnFL7SNN5xBTkzWiZaNp?=
 =?us-ascii?Q?N4LegTej7vJw4RFLiVLWjrGHtpOVyPhJuFNVSf7vEVw+Ni/BvFkrpaHD2JmI?=
 =?us-ascii?Q?TFsWD/l4I/QKVao0AbzMFKwQIlPfBIWnyk0ybTQI5uWDFT2cbf27sIvzl+HL?=
 =?us-ascii?Q?x7QHu20SrdCeJWq38nUjUbrsu+kjYJVAmS9V5CCI5o9J4P3vgBqoqi5itKRN?=
 =?us-ascii?Q?rC17YGrXw1dZLwz510WeP4uVOiL6uwgtoSNcK5R54L+ywRZwX/wlNxZLhe1x?=
 =?us-ascii?Q?LT36dxHJVD7R5l2dPzWbnDsH1ykvVFjO8S5shHckmAghM0mhb5CIQ933Dikp?=
 =?us-ascii?Q?PZkYJD7mX7QaQjbCEOeP2g/B8eH3kNkEXxImEp4hJmDibKaM4HUgT+tSaDF0?=
 =?us-ascii?Q?KdeOvuwgaXdEZs6Ok3KrAgXMcsq68v4N5WXnYsXal3DelAmNkxcFwB6f26yg?=
 =?us-ascii?Q?cTN2AostAiQ/Uc1C5tbw/3qQgnIpq0cYCCH8YU5B2NYMhm0texr0MMVXf9Ts?=
 =?us-ascii?Q?Uka/1o7aotzI3CFAOlcv9Po3+SBQGaesHf5LC+rR1afhmpgs1QZ97uKE8MBo?=
 =?us-ascii?Q?hyOazxxsXyWbzOggtg9VSnxwfbGz7+lhXkGUodcDnuLdQRgmkB8AJBjO6TiU?=
 =?us-ascii?Q?WuDQlbLmYhBf0XIWqodw6ixFuVmHj4ZQO/0wEtE2EX1BDAjANjFUe1z863oY?=
 =?us-ascii?Q?a7gkYOYqnilx/Nqh2ND/0BS7FGGHupJc4ZCBrd6i/xW1JcIeUJkM5XYVlAY5?=
 =?us-ascii?Q?J0MvCR5TrXHojtqFlzNhLyoJq83FD1eKPInqqGNxi0oHQpW8KyGFnmfVjqhe?=
 =?us-ascii?Q?QoI3lp6bhZFIG9UFno6ULAVf/1a/i+I70BJITQl+7Zgkk8XYalXOJ+0gtkQ1?=
 =?us-ascii?Q?76bal/KUeFw10T1qcGtJkKHCj89l86OWROVAMe63V2y3u+6zTypQMuELmbBN?=
 =?us-ascii?Q?YCEI6OW2UQYzsSb+oRnMgbebHdn7WeKBWl+6n8MA19WsDC38+rELJrC/NOsd?=
 =?us-ascii?Q?+jyXypV/qOOV7jaw3+Z3mwWmAA7YzGHUKRVD0NF/I7txqBXyO32ueSovcMQN?=
 =?us-ascii?Q?6czHzlydk4ZQfYUxsrm8/hsE3hFiPoU5kg3QahBN2S8sBBEzd+QVMt4D9cCt?=
 =?us-ascii?Q?kKEF5ifG43QmV8Bq4MATNtOpmIcOmPEFtnt+JhYn8LDexrUQbe0C9MIfcMGH?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83355952-f578-485d-2249-08dd47bb0dad
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 21:04:47.2356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjvjAJ/6v/8fhKgKj97yIBVTaXbWW6dfzAr2CsUMn+WGauwt/PDo/fCnnOSDBjaUxQAuO9Ni4zb+3sb4kojdfkxgRlXnQnEpSYCKJSOJ5Zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7024
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

On Thu, Feb 06, 2025 at 11:44:47AM -0800, Matt Roper wrote:
>On Thu, Feb 06, 2025 at 02:35:31PM -0500, Rodrigo Vivi wrote:
>> On Thu, Feb 06, 2025 at 11:26:05AM -0800, Matt Atwood wrote:
>> > On Thu, Feb 06, 2025 at 10:01:13AM -0800, Matt Roper wrote:
>> > > On Thu, Feb 06, 2025 at 09:06:32AM -0800, Matt Atwood wrote:
>> > > > On Wed, Feb 05, 2025 at 03:30:55PM -0800, Matt Roper wrote:
>> > > > > On Tue, Feb 04, 2025 at 09:53:02AM -0800, Matt Atwood wrote:
>> > > > > > There have been several changes to pciids upstream that need to be
>> > > > > > sync'd into igt.
>> > > > > >
>> > > > > > Sync with the following kernel commits:
>> > > > > > f9a15b968dce ("drm/intel/pciids: Refactor DG2 PCI IDs into segment
>> > > > > > ranges")
>> > > > > > e35ecd95ecf2 ("drm/i915/display: Add MTL subplatforms definition")
>> > > > > > fa8ffaae1b15 ("drm/xe/bmg: Add new PCI IDs")
>> > > > > > 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")
>> > > > >
>> > > > > The updates below look correct (they match the kernel header), but the
>> > > > > commit message here is confusing.  IGT updates to this file generally
>> > > > > specify which actual kernel commit you're synchronizing against; none of
>> > > > > the four listed above match the content you've copied here because there
>> > > > > are additional changes not present in those.
>> > > > Because there are now several out of sync next branches, saying as
>> > > > of this commit idea was not working. Hence this approach.
>> > >
>> > > You should generally be syncing with drm-next after things land there.
>> > > So which drm-next commit are you syncing with for this commit?
>> > They hadnt been in a drm-next commit yet. At the time it was just after
>> > a next cut, at this point we can probably just wait for them to land.
>>
>> I agree with Atwood here. We had changes coming from drm-intel-next
>> and changes coming to drm-xe-next. In the kernel history the changes
>> coming from drm-xe-next are on top of the drm-intel-next ones. But
>> they landed first here in the IGT.
>>
>> Now it is in a situation that individual patches from drm-intel-next
>> would conflict here badly. The safest thing is to keep it simple and
>> use a single patch like this.
>>
>> This is the final copy of the file directly with the proper mention
>> to the commit ids. I really believe we should just go ahead and push
>> this to finalize the alignment before something else gets in the way.
>
>But in that case we should be explain what we're actually doing in the
>commit message.  I.e., we're *not* synchronizing IGT with a kernel
>commit like we usually do.  Instead we're manually rolling up individual
>changes from various kernel branches before they propagate into
>drm-next.
>
>As I said before, the actual patch is fine; we just need to fix the
>commit message to more accurately reflect what's happening, especially
>since it's not how we usually handle things in IGT.

I think being explicit of what was done would be: 1) show what was the
drm-tip used; 2) mention the changes that are contained.


Example:


lib/pciids: sync with kernel

Synch PCI IDs with kernel, up to drm-tip commit
a293777d70b3 ("drm-tip: 2025y-02m-07d-16h-56m-38s UTC integration manifest"),
which contains the following additional commits since last synchronized:

16016ade13f69 drm/xe/ptl: Update the PTL pci id table
fa8ffaae1b152 drm/xe/bmg: Add new PCI IDs
e35ecd95ecf28 drm/i915/display: Add MTL subplatforms definition
6a04bb5a20460 drm/xe: remove unused xe_pciids.h harder, add missing PCI ID
b99dcb91ef551 drm/intel/pciids: Refactor DG2 PCI IDs into segment ranges

^ this was obtained with

	$ git log --format=short --oneline --no-merges \
		3c1d5ced18db..HEAD include/drm/intel/pciids.h 

If instead we want to show the commits from -next branches, we could do:

	$ git log --format="%h %s" --merges  3c1d5ced18db..HEAD -- include/drm/intel/pciids.h \
		| while read -r h x; do  echo "$h $x"; git log --format="   %h %s" -1 $h^2; done
	f28030b19c846 Merge remote-tracking branch 'kernel/drm-xe-next' into drm-tip
	   5b380838930f1 drm/xe: Add stats for vma page faults
	ea9f8f2b21795 Merge drm/drm-next into drm-intel-next
	   2014c95afecee Linux 6.14-rc1
	220ed690436e9 Merge drm/drm-next into drm-xe-next
	   1c470f4f61f3d Merge tag 'amd-drm-fixes-6.14-2025-01-29' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
	0dc853865ab52 Merge tag 'drm-xe-next-2025-01-10' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
	   6a04bb5a20460 drm/xe: remove unused xe_pciids.h harder, add missing PCI ID
	28eb75e178d38 Merge tag 'drm-next-2024-11-21' of https://gitlab.freedesktop.org/drm/kernel
	   a163b89507786 Merge tag 'drm-xe-next-fixes-2024-11-15' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next

Lucas De Marchi

>
>
>Matt
>
>>
>> >
>> > MattA
>> > >
>> > >
>> > > Matt
>> > >
>> > > >
>> > > > MattA
>> > > > >
>> > > > >
>> > > > > Matt
>> > > > >
>> > > > > >
>> > > > > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>> > > > > > ---
>> > > > > >  lib/pciids.h | 62 +++++++++++++++++++++++++++++++++++++++-------------
>> > > > > >  1 file changed, 47 insertions(+), 15 deletions(-)
>> > > > > >
>> > > > > > diff --git a/lib/pciids.h b/lib/pciids.h
>> > > > > > index 23f349f65..4736ea525 100644
>> > > > > > --- a/lib/pciids.h
>> > > > > > +++ b/lib/pciids.h
>> > > > > > @@ -717,37 +717,66 @@
>> > > > > >  	MACRO__(0xA7AB, ## __VA_ARGS__)
>> > > > > >
>> > > > > >  /* DG2 */
>> > > > > > -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
>> > > > > > -	MACRO__(0x5690, ## __VA_ARGS__), \
>> > > > > > -	MACRO__(0x5691, ## __VA_ARGS__), \
>> > > > > > -	MACRO__(0x5692, ## __VA_ARGS__), \
>> > > > > > +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
>> > > > > >  	MACRO__(0x56A0, ## __VA_ARGS__), \
>> > > > > >  	MACRO__(0x56A1, ## __VA_ARGS__), \
>> > > > > > -	MACRO__(0x56A2, ## __VA_ARGS__), \
>> > > > > > +	MACRO__(0x56A2, ## __VA_ARGS__)
>> > > > > > +
>> > > > > > +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
>> > > > > >  	MACRO__(0x56BE, ## __VA_ARGS__), \
>> > > > > >  	MACRO__(0x56BF, ## __VA_ARGS__)
>> > > > > >
>> > > > > > -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
>> > > > > > -	MACRO__(0x5693, ## __VA_ARGS__), \
>> > > > > > -	MACRO__(0x5694, ## __VA_ARGS__), \
>> > > > > > -	MACRO__(0x5695, ## __VA_ARGS__), \
>> > > > > > +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
>> > > > > > +	MACRO__(0x5690, ## __VA_ARGS__), \
>> > > > > > +	MACRO__(0x5691, ## __VA_ARGS__), \
>> > > > > > +	MACRO__(0x5692, ## __VA_ARGS__)
>> > > > > > +
>> > > > > > +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
>> > > > > > +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
>> > > > > > +	INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
>> > > > > > +	INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
>> > > > > > +
>> > > > > > +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
>> > > > > >  	MACRO__(0x56A5, ## __VA_ARGS__), \
>> > > > > >  	MACRO__(0x56A6, ## __VA_ARGS__), \
>> > > > > >  	MACRO__(0x56B0, ## __VA_ARGS__), \
>> > > > > > -	MACRO__(0x56B1, ## __VA_ARGS__), \
>> > > > > > +	MACRO__(0x56B1, ## __VA_ARGS__)
>> > > > > > +
>> > > > > > +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
>> > > > > >  	MACRO__(0x56BA, ## __VA_ARGS__), \
>> > > > > >  	MACRO__(0x56BB, ## __VA_ARGS__), \
>> > > > > >  	MACRO__(0x56BC, ## __VA_ARGS__), \
>> > > > > >  	MACRO__(0x56BD, ## __VA_ARGS__)
>> > > > > >
>> > > > > > -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
>> > > > > > -	MACRO__(0x5696, ## __VA_ARGS__), \
>> > > > > > -	MACRO__(0x5697, ## __VA_ARGS__), \
>> > > > > > +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
>> > > > > > +	MACRO__(0x5693, ## __VA_ARGS__), \
>> > > > > > +	MACRO__(0x5694, ## __VA_ARGS__), \
>> > > > > > +	MACRO__(0x5695, ## __VA_ARGS__)
>> > > > > > +
>> > > > > > +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
>> > > > > > +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
>> > > > > > +	INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
>> > > > > > +	INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
>> > > > > > +
>> > > > > > +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
>> > > > > >  	MACRO__(0x56A3, ## __VA_ARGS__), \
>> > > > > >  	MACRO__(0x56A4, ## __VA_ARGS__), \
>> > > > > >  	MACRO__(0x56B2, ## __VA_ARGS__), \
>> > > > > >  	MACRO__(0x56B3, ## __VA_ARGS__)
>> > > > > >
>> > > > > > +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
>> > > > > > +	MACRO__(0x5696, ## __VA_ARGS__), \
>> > > > > > +	MACRO__(0x5697, ## __VA_ARGS__)
>> > > > > > +
>> > > > > > +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
>> > > > > > +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
>> > > > > > +	INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
>> > > > > > +
>> > > > > > +#define INTEL_DG2_D_IDS(MACRO__, ...) \
>> > > > > > +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
>> > > > > > +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
>> > > > > > +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
>> > > > > > +
>> > > > > >  #define INTEL_DG2_IDS(MACRO__, ...) \
>> > > > > >  	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
>> > > > > >  	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
>> > > > > > @@ -782,9 +811,12 @@
>> > > > > >  	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
>> > > > > >
>> > > > > >  /* MTL */
>> > > > > > -#define INTEL_MTL_IDS(MACRO__, ...) \
>> > > > > > +#define INTEL_MTL_U_IDS(MACRO__, ...) \
>> > > > > >  	MACRO__(0x7D40, ## __VA_ARGS__), \
>> > > > > > -	MACRO__(0x7D45, ## __VA_ARGS__), \
>> > > > > > +	MACRO__(0x7D45, ## __VA_ARGS__)
>> > > > > > +
>> > > > > > +#define INTEL_MTL_IDS(MACRO__, ...) \
>> > > > > > +	INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
>> > > > > >  	MACRO__(0x7D55, ## __VA_ARGS__), \
>> > > > > >  	MACRO__(0x7D60, ## __VA_ARGS__), \
>> > > > > >  	MACRO__(0x7DD5, ## __VA_ARGS__)
>> > > > > > --
>> > > > > > 2.45.0
>> > > > > >
>> > > > >
>> > > > > --
>> > > > > Matt Roper
>> > > > > Graphics Software Engineer
>> > > > > Linux GPU Platform Enablement
>> > > > > Intel Corporation
>> > >
>> > > --
>> > > Matt Roper
>> > > Graphics Software Engineer
>> > > Linux GPU Platform Enablement
>> > > Intel Corporation
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
