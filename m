Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5965F109E528
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 23:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D634E10E1A5;
	Wed, 25 Mar 2026 23:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5F4yoR0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A95510E1A5
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 23:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774480296; x=1806016296;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=YcEcEHEhDUXAddW6KX7/bE/jP6bjOGqdwyro6Ywrv6I=;
 b=O5F4yoR0QWYSfX+braKmJsuW/T5TVrb56SvkG0XHCBNJnhU0i/D+VxzI
 O0VS5tWs8qe6N/3P+J783ifa8UeEDu+HtYUkOODF/80UTvyOSAgEVk2Mm
 UyhbtoGv3mE2U6tG6YORKl9FA+mXfAl/KsuGqJy4zbvepv8YbDD/slwiy
 bdahxWJj06PGekIlOQXEj3wGqztqqMu+i+HqNyaa9gOmU9HkMuXlFzDR2
 LBRMAfxcRgK/vi0eG/oKpJHClFQQqboEkw8X+Xglra+BmzCY+8Z6v2W6V
 5g559s6EulRHqjWeeIrpPnrEX3MGF312i3d9kKgWhOMEKYigksjrtxgS5 Q==;
X-CSE-ConnectionGUID: 5clKfRQNROSrX+c/teOOxA==
X-CSE-MsgGUID: vPgPMUFITPazzszJwwK56w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86907143"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="86907143"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 16:11:36 -0700
X-CSE-ConnectionGUID: bXV7iRuWTh6C2pZ41AXe0A==
X-CSE-MsgGUID: 77CwXlRAQNS+0A8dHX1yWQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 16:11:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 16:11:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 16:11:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 16:11:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEZVq80z7UQ/0gN7eckT46oI4W1FwzT+rtALgEUavsku7ACDVDL/Bx3qn1gbnEHeckvuaMKi0OMctXfGNrmPWJxjPzpCYuaiLp6cDzoY5Ew5WXoTFbfL50LYME0olK1Sgw5OcntoARdwkwk76FHUUoOhRyJIUx5VEcDOmN4iLzACvwPciddbMS8GzgMQZzAwrplYlnrcVnJEFTKE3ATx8dzcEIl+EzsQIOT0KEEzQ5xpYykY8irrcOAJm9kHhkQuQiSTz3lfpm85CjlyyVhqrrYWn1AVxJW+3YcRb1VzwJdYaKoA+zCeIeBThSq+T0PDD2VuNiKD8em5HA80o3q1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PE21eQaEWDLe+E1gZ6LQU+LERc2WUQeLV8B0JAtr6gY=;
 b=MgPXRZU5V3o8TGCud119UvupTeRAbDaxs5+026VfA1r4b1TOuO39NEof+kdfZ28FDpVWwubk9J07KZ2AKLFSr8j1eZIgOBkOKxu/TXXTfGLkZ3z6dRkQHO+tdMA4jdC4yBTulxt4x4lNRY0l491s+ISWFH0W5fKay10YMq26cDX8E6muKTysTV6i2pevgNJZGdZ6e/rY5WCiUYayb52pz6BwwjZccF7RymX3LuPKFC7Idy0CjPw2mYfflVFfkbf6FY4akEJJoGu6GzW1UmKZmXinGDpDrjMNo10CklMvCuIIh/UL6hcQMzCvMqmb2HRVU6YtRN2Qy8CaqAazFkrfqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7959.namprd11.prod.outlook.com (2603:10b6:8:fd::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 23:11:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 23:11:33 +0000
Date: Wed, 25 Mar 2026 16:11:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?=
 =?utf-8?Q?ss_for_tests=2Fintel=2Fxe=5Fdebugfs?= =?utf-8?Q?=3A?= Add subtest
 for reg_sr programming failures
Message-ID: <20260325231130.GK2729713@mdroper-desk1.amr.corp.intel.com>
References: <20260324-reg_sr_check-v2-1-7206032f6b26@intel.com>
 <177443719506.395946.17402770299463937790@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177443719506.395946.17402770299463937790@a3b018990fe9>
X-ClientProxiedBy: BY3PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: b41debc0-c854-42bf-7d76-08de8ac3daec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 1BDD/RLRD83etDnRbjSYR5nFdojYHZ3A/MCY8lMKQUji/SSmivR9zOaVSJslBlyMY0/I8UyV9TcrUG2PewkKvcxcVVNq317lGe6UHhVFi8WWSBHeLKvcK49ASQ8M2y+Jo6a7rnoIcr193IcZeEIrc62XewVYVPLUiVpRSU7D0X0OO/V9Nse9XlKNgomBljFFK78rr4KlEVCTn+2xhS4f7qFyVKZiXveLb1JY2PEr25e22mN7U8DtSix2klpiv+1zejaSr27zxgajHYNnHT1uq063UK1cFC4PkxZHNVhyNjqLwg4KRWwz7JQlwUu/lTXD3fYrgDzByGmBWaw897LrWUE/JJmAOUOchst9PSDFaRcT9UDX02lkP+3L3r+Tp6ENEvpKDuZ3Ibr2aDXalJAtz8I4nsSuyVbtb/RKTjvNYuyco6bc3Xx4CjqPac12cBKiv47Ozy8pmDkQeO/55pJcPQR+HrShuQ2ER4vuxlKDdl7d94Clhk+YAqhRWjIZQdOIaDhxEU5Qz+SAeQOF97RuBpiR9tOg0RSgPs24ly8omx+KVTdcY4ZaCsVtKrkJCke+yFJofenorRSjQOoTn1WThPr8rgEOL4BJxi9YkXbzhF1UIQnu/ZCNPKHWlERYmwwdA5C2PUsuDxgxhPTWdEHtA34ZbLmMuVZ6biPUdbvvPhw+OoWMZXJVAHEuzbRuS/ES
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bSb0sWWblBQAp+P4fuXpj0/IOHBYL2iSO5Cj9Q+Nf3VTs5bv5jTZxQlpCvr1?=
 =?us-ascii?Q?HoavD8SJmEHBe5SW2ApRly0da5dwxHvO6NwZvV/heTuvbeW0WPo2zdJ+x/3Q?=
 =?us-ascii?Q?+nANaDeE3L3yeufCQz7TYSfEr7FEleBrKnCKeYnEWzs/hd9MLsjgM4dnkI0P?=
 =?us-ascii?Q?RK4zGaFaaGbdn5FGIaEbMqY7+/qUFZ8PhzhPEmuvET1MZYTNQAHGeO8XJf4W?=
 =?us-ascii?Q?UNSOcfIEWAvSlaYdxpb/ViVLa5JpXSApX6az4svqXROaH/FBrGt6sYHx7oSp?=
 =?us-ascii?Q?uX/ilsIh25kSpeCN1gdommZpXc73Jxgakbm8TzVMXFR3sD7mWToz1S5SygSk?=
 =?us-ascii?Q?bYgGOibcl2hVcEteFv7iAE1M/vOha05tMB99OHnpaF+x/DcxxRBZlHT8oHmz?=
 =?us-ascii?Q?U0tbjKhKpBZX7qUZPwb8lJJZta6shRHnv5rqX2i/vmbMpc2T28GiE44ZPKSQ?=
 =?us-ascii?Q?+22//6ZXIxIVAgRpaeXnKUxKqtXlU/JDcQ0CPC2iN53wxSBKm7y2j8cqW2v2?=
 =?us-ascii?Q?/skSEQjFLwkVvCg605VfAdwDFKgQNchXiKAa7+dPnDTV44lOnB2zBMUINpkc?=
 =?us-ascii?Q?poTIu3sB512fUoBw+O6Z9Dcldm3nGRufw0K1AGO/TG3/qZGlLJfxJmo7WQ09?=
 =?us-ascii?Q?P+FCqhT+yoLZdZZK1ukAT37ma67TyJSmaY2ZibLExqxBWTgKqC3LHXZWwzfq?=
 =?us-ascii?Q?7vojkKNm7NOudOQEbqcO0BJgiEyu+X2FSYoVmOn+3a7Am3GkqEkvv9mzR1Sv?=
 =?us-ascii?Q?5ZnzeWVyj0Ghnx8TU8dFcZFl1G80i0ZMLJ9r/gPjZKV92rSdT9BnYr8Kt1Gh?=
 =?us-ascii?Q?YhZckrpntqBTU98YfVbL0mjKUjn02nybSBTcHGlGMGQ7j2klB+WfDpAEYXiV?=
 =?us-ascii?Q?yeu+fg8owMCkYI0066CF0blxIsXmdbZeZNBslLafPrC48qJCmTEBDD/FCrsT?=
 =?us-ascii?Q?6licKBtHODQDSnC1G1GR9vCIbBVnC81omZYW0idk1W977lp9UMF75RPZsUsN?=
 =?us-ascii?Q?/YFbMlte/kYygQYIejnRMuHVbka/ChgaroDo8rXS948+MNUuIJ8hx7YUStRB?=
 =?us-ascii?Q?SOMPG5eZsQeyj542sIHnP81BXzO+kQF2+BoQHxiJTlhzcoKIsMTN5jxOkaNl?=
 =?us-ascii?Q?Dk4LAJ13qh+YPRwSYEeO8COqSErO9q+kpQ7GsdwdHDbP/7BSZBzPAYSB/sK1?=
 =?us-ascii?Q?KrdO1Aprxwv28aEBsj4GerK+u38KxTxSCnqePllFY7T+4LGxzd5WAA8g7jYv?=
 =?us-ascii?Q?gYvC/HhE2SXcqgRJGtElFhjTYDFrY1wLjnycPM2RuHQmNNvdMO/o2ZE96oWx?=
 =?us-ascii?Q?pPX5Jp+s05njJY+xi+b4d6BiLJWO6JAxDE3O2TBbch49tCLa1BB4RXZaJ8M3?=
 =?us-ascii?Q?RdAddGQWUrCCIhhcZI5MO55RqjiQNKe4j6IW3WHMUAZBTw95ei2EBDR1vfPU?=
 =?us-ascii?Q?JuYqUjrELTSXNOfOwYQIhesLUKedri5zg/7ixuV9ZR6y4Uo4sZDH53PlmTGM?=
 =?us-ascii?Q?7mfpbmuq58icvFvUNJ+6BbsN+BuVTDsPAZ+i3m1MRxufhkhWvlp4p+nwCUJo?=
 =?us-ascii?Q?+Dg613WMcnR3FrYFXmkwFaYaNQKQd/bkknlQ+VYPulKqw8vqTeJcNaRDuXgu?=
 =?us-ascii?Q?JbEi3zCrqyeenvtALPjQ+oeSJgOGYbtW427HomAlryfv6JzcLEw2//80gLe7?=
 =?us-ascii?Q?NNNRBQU4ueDDLX71DYRQAt9qPKHl+Hm40FG/CCnysawC8r/bZa+wVzKjbx5D?=
 =?us-ascii?Q?ymhE0XUBFb80x9IxXlpDjYlzmMwoP3U=3D?=
X-Exchange-RoutingPolicyChecked: Y8HySuRlpijFUbIfLwJvkSBaWX4kItIy97SasQOOnuLqeBgCx911QUXZEZw9a801ZtCOUb7uR4S8nou1wR2dZ3nPnt7ExhI4j5pJMbgDxb5cZHbFrMXUmuf/URjx8FMf5l3/tE6rbq+EGPjihT8Ua+FGFV/AzxPdR5NT1lI6ufBQ9xf7gA7FvFdIj/crTO2qQEWC9d9YWTLoTop7ZhYF5yUj78qQDSzp8ybKN7ZcbzOX7mP1G1ZvImA0MwixGM70hcxI93viYPnCUNwVafOuF1OB2ykK1KGqevYmxTCs2oRKN7Y2aPT7zera37Hs5hmcD/OxSQscjHUBaUK6oIPAuA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b41debc0-c854-42bf-7d76-08de8ac3daec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 23:11:33.0539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUHcwCokRhzJ7y3oSXyIG4Ckm2X/4E2bj2S3+ckSWjffI0A1raxMUEAKWZsRhcDRqlS+NNMvx+xnpJ7pb2HEVkStOqJ702y/gTduoJQrKkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7959
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

On Wed, Mar 25, 2026 at 11:13:14AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_debugfs: Add subtest for reg_sr programming failures
> URL   : https://patchwork.freedesktop.org/series/163800/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8824_FULL -> XEIGTPW_14845_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8824_FULL and XEIGTPW_14845_FULL:
> 
> ### New IGT tests (3) ###
> 
>   * igt@xe_debugfs@check-gt-reg-sr:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@xe_debugfs@check-gt-reg-sr@gt0:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@xe_debugfs@check-gt-reg-sr@gt1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s

Looks like these pass successfully on the machines we currently have in
CI.  As noted in the commit message, there is currently a bspec / KMD
defect which will cause this test to report a failure on certain SKUs of
BMG, but that's something that will need to be fixed in the KMD once the
hardware documentation gets updated.

Applied to master.  Thanks Matt Atwood for the review.


Matt

> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14845_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#301] / [Intel XE#3149])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8824/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14845/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [FAIL][3] ([Intel XE#301]) -> [PASS][4] +2 other tests pass
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8824/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14845/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [FAIL][5] ([Intel XE#7340]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8824/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14845/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
>     - shard-lnl:          [DMESG-WARN][7] -> [PASS][8] +1 other test pass
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8824/shard-lnl-7/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14845/shard-lnl-2/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][9] ([Intel XE#301]) -> [FAIL][10] ([Intel XE#301] / [Intel XE#3149])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8824/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14845/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8824 -> IGTPW_14845
> 
>   IGTPW_14845: 415b08715f5e1c0b17a304dbe42556f6f1bf2590 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8824: 8824
>   xe-4774-0be244ee3139de3578e9acc56e1b917a4bd162cd: 0be244ee3139de3578e9acc56e1b917a4bd162cd
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14845/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
