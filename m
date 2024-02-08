Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6713C4828F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 17:43:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF0B10E722;
	Thu,  8 Feb 2024 17:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UhIUGfcj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76F710E9B0
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 17:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707414217; x=1738950217;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=sq9pQDWVzfcSZadiOr1etVx7+2ImNQgvZz0N/7iIoa4=;
 b=UhIUGfcjaq/hz+pzhaLhtILxd0zg0QhwFQVBD/WDwI4F3pKLs3Bu5dBW
 IGjv0jVQgPAp6bxe55UZwzfiSriP8DUI0frjfcVpSA6J0Tn2AS0UeSxPf
 2moM+rTfmShLFGtRTBIlUHI4HTQ0AQwQxlWsy74c1selvIQybG5znTVWR
 dRu54oaYGRdjkjxcTbmAD489S4Hjyl5vi3b9mW48i9aM3oLYQPItQDjOw
 Hy859luPCuYxC5nSgAu/BYH8P2eqEX2z3ann97pykuR8OCJmjpFnllT88
 nxy22dtz+YQvag7GbMYk1wbTdaRnxTAR4+wwxn2/VpG0YxVMJqxqKpbr3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="5093152"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="5093152"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 09:43:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6353257"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 09:43:32 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 09:43:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 09:43:31 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 09:43:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUZbW70OzxY+zRB3BfUk/r+yKB6EPMVG3nGq7D1dgAip4Ht1L631ZI57dhC7duSYUh3NNuggNhWOAi3F7A0vNfpe4IDh2ScouigGkuvs/05mRK0jt51pjMXEwpCXLAUDHTDZOaT5GmemoZoHnQrntI1hJi2rE2TLW3AtsCbiyELfz61z+Nmgr3tAfEvpskOZ7tMEKJ2xjalNx+9AgxrMJ2Wked7UMbmJ+4k8w6cZCqKa1lwpyb5bP0+Awmjlyu0qPQviR6KaW/Hm5d3OPDfuSeFumsvhT5DvIHzP9NqzTTgX+sR31JmGY3la7wa8LONGp20Qn1iyoT/yRTxH/ZbkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3PfpQ3V6OLew52eMZ/B0mNnXB8xnMXh8fdkGZt1lk0=;
 b=nmMssSY/+p1LAAwyXhIgSWm4odbeYxmu8HZlVSdyRpLGWWfVpN5onhuzgg9V1R3HiQ4SkhQnN7oqMikBbmT6+76zwlIK1Zg4XbpNyjBy2RmFpi+PePAkc6EpyfNYui38Khgzv5O6mIkKmv0NqzqwyprTC73HIIN1BJ/+1MLQ7j0IW5re9Ik36LGPy6tEk1rtucAxy8xbosp7CuWMJopEjMpk5mEGLemHhR0EteEUj7n9wcYkIQvc9Rtnw3NdgcdFHQgQ7QFoEdTA4Mp72CA0DiU89BBIeVtoDXBGNOibBYpnPJYk61iWpQS2EsMPcp/4TXwCrMkEHhyi99Y8JXjnew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4521.namprd11.prod.outlook.com (2603:10b6:303:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Thu, 8 Feb
 2024 17:43:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 17:43:09 +0000
Date: Thu, 8 Feb 2024 11:43:07 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting?=
 =?utf-8?Q?_with_=5Bi-g-t=2C1=2F2?= =?utf-8?Q?=5D?=
 tests/intel/xe_live_ktest: Rename subtest to match suite
Message-ID: <f64mrhpflgejxgmqhoufaf2jqlqp7x5aeijqagjnm2aohlepop@l3lte6qnwcch>
References: <20240207224643.250958-1-lucas.demarchi@intel.com>
 <170734989082.1088348.12208925069675822562@5338d5abeb45>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <170734989082.1088348.12208925069675822562@5338d5abeb45>
X-ClientProxiedBy: SJ0PR05CA0137.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4521:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a01f6a-d3b8-4fc6-3e32-08dc28cd6a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dtgePS/JSxZYCEpNE6632H1KEf8n3VqBeq6+Nhj5oE3VjotQJGAW5cZMdv/jS9fkyO7uvcO276i5Y6vPAHNR2+bGhoT97Em1H6tseVUHnQunpNH8HBcojtyatcRfihp1SHuiImoe/B5ZVtIMto2bO/cQrszhAE3und5dGYR7dzh+x5GrP88KAecSg2APDKiX5Gb0+81mnQPhH5oVJ1E+0sRV9GoxBE+muP0Ru8EZehzwXEJa/5h5f4yaLGAWozdq6+pZM5xCgqq1AeyarIplYL7ANTaJzazklTE+UW8Zja0DgbwMB+v8upM8zgi+/eIsy9dS6Vpqz64EDs6iGovYFOAiOrdkRVBm7PeXB6/0BVnuJJAWoiarLGtD2vAMoSWveC04Lsxgj4fbEmoXAtgSb7iDrZ0s0plUQHoUuGMJox6c/H27PMnCtx0dttWCCFh6gAj5k3nWvSJCQ/EuNGZPsTQ6JN8nOTApjGIc0yVQla++OlMZtdWCJTt2eyFMEvgKrKr7veGE3hfUaech47P91a6XvpPtF8DItOzctPTi6A2ONprrQebycSa/9j8OkWQ4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(316002)(41300700001)(2906002)(86362001)(26005)(38100700002)(82960400001)(8936002)(6916009)(66946007)(66476007)(66556008)(6506007)(9686003)(6512007)(478600001)(6486002)(966005)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WsKbcdgvvz25t/QZ5RsmiJQtCVV/lGLngMqSp8QmYILudgGBXpS3AE9I4pKu?=
 =?us-ascii?Q?5Syqt+ruhv5ncAUcqyLIi4gYWqjRj7jvQmsqCRGrv++s+juhNhTuZ7JjY0bm?=
 =?us-ascii?Q?4ibOwNj8yTeTo4OarTk+KOaEpV2s8KvPr9SpsOrwgy43WKCI3FM7vQuGe4tM?=
 =?us-ascii?Q?TTQ8uX6w3QaYacr6YgcbeyPFIgw01MTIZN93FYEFhVHTzRtiWHjcwqO1Eu24?=
 =?us-ascii?Q?dXY3U5r0UylbzcdhRrxBshM3rmv45nbeoHBhkXIK5yQiyAE5x/F7raoMOWpR?=
 =?us-ascii?Q?1A6YYWSmGXfrTyv8Z0ge7rRcpf0snSwC2i/zx2PjcnvEUXx1QNQaTE/20sUs?=
 =?us-ascii?Q?VCGnNuIcih5x/oWEniDoWo1kqfNYL029A2A8cVtsHXvUy8itp7Qbq7BkfvZL?=
 =?us-ascii?Q?oToTeBhr0Zj95lR/Uze945j0qzzFBa2KODSjMnh5M6sQ9pvnuxgkcD3SGgl8?=
 =?us-ascii?Q?S/SfTfqgJeK/o7kSr/CngGqEPjPvfYyKCauUkiMq6FVUGaxQH9FJ1CNvgBZc?=
 =?us-ascii?Q?HqIvmDy8/pVm+53dfzUSreIiJN8Gb6S2l7AW0aMVBWK38FEemalHc09orG53?=
 =?us-ascii?Q?fpX3P1QClf5Bgw5GEZKfD5J1kIlcruGRQFjmlzjhrqxyy8Uc7FSobHoYJmds?=
 =?us-ascii?Q?1lL5djNACHjm0Dm1lRuHSuRNGrs4ZyGY4NYimUywGrrKDHeGLR3ATFPwfyAJ?=
 =?us-ascii?Q?PWT4YH6fLr3dX0qhlOfic7DKj9F2lE0WDx8vSfpis43QbP+6NtI0lPuFpTwI?=
 =?us-ascii?Q?r8L+R+mOCQ2+VGKQf+89aLj1uLdjT9kMf0RGSFKFKpSNLqgVTwVai9ISUEUb?=
 =?us-ascii?Q?Hi8gCK5BNMmiwY5Boi0ZDAIYAkhlnTwoMAJweeWlsQBW5EUPR/Mj2i88OQgt?=
 =?us-ascii?Q?/oRNTddq6X448yHiVD3d9t+V9sMOCcehQX0y+fpfCsy57f/JNAKwyJce6w2+?=
 =?us-ascii?Q?TCmKjSaJTVyWULf1g+DwPjyNSoOgCbzESwOxCjkQPQ8RimLnuWo7x3T82hmF?=
 =?us-ascii?Q?KJ1rEJbtqB/rUl/SW+4J9351yQimzvLxhhl+rpsEquiM/Z3U9eSJBXY2HFX3?=
 =?us-ascii?Q?e7hbXjMjQufX+vp1YYo9eUvkp2k4DcIR0Ft9p66yeaPzDM3hUy1b00fp13uD?=
 =?us-ascii?Q?ue+JkuaG0np2I7qWkKtTha1bQoS5CrlFBSsXYPUggB9oRmfiZ/dWf0vVkm8W?=
 =?us-ascii?Q?5Ke0dy1whThrSBg4kWN48+eIRmm1B9hFXc3H9FyyLC5FF0VFMcIil5ihGb84?=
 =?us-ascii?Q?BtqHv/dde1DOWPSxWMQsBakfw1N6T8uIqdVUAa23lrM35Y7Er1aBPvWS+zuG?=
 =?us-ascii?Q?HmKGCWxNzwPD1QOufLHPOfBFiuMkqowe+OKNhS9jhQSnzXU4oTDUUHHAqSz4?=
 =?us-ascii?Q?z69MuXd8abrMTUp8rmwU/8hXcVZkzpO+qv2S1m7XpsmlC4knVoHFF9ZReFCq?=
 =?us-ascii?Q?kReHDMcOaClTqQqvhQNGouGuT7z+NFfg9j/ZNM+coz8JZVCg4Tf2N+BPvHrv?=
 =?us-ascii?Q?YFjEq/IgGrDggP3GBRVWGQQYrowV1/eKEn+cHfH106bn3wb+9TMFL+8EgTK7?=
 =?us-ascii?Q?8neYpGVwa3wD+JPlkGzLGjM+YRcy2EOpuUmGlUa1x1pDRSzyPiQz+mryHtFr?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a01f6a-d3b8-4fc6-3e32-08dc28cd6a17
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 17:43:09.4121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTQ2K8Uj/RwW3fwY00H6V5rY4+MxrXihMcG4hNxOvev8/QYupHaF3k8ChsKmpfSCv5qkALARvadwVi7dfOzruOppL1oZKqWE3lMGUjnlAC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4521
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

On Wed, Feb 07, 2024 at 11:51:30PM -0000, Patchwork wrote:
>== Series Details ==
>
>Series: series starting with [i-g-t,1/2] tests/intel/xe_live_ktest: Rename subtest to match suite
>URL   : https://patchwork.freedesktop.org/series/129652/
>State : success
>
>== Summary ==
>
>CI Bug Log - changes from XEIGT_7705_BAT -> XEIGTPW_10649_BAT
>====================================================
>
>Summary
>-------
>
>  **SUCCESS**
>
>  No regressions found.
>
>
>
>Participating hosts (3 -> 3)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in XEIGTPW_10649_BAT:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * {igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit} (NEW):
>    - bat-dg2-oem2:       NOTRUN -> [FAIL][1] +2 other tests fail
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10649/bat-dg2-oem2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
>
>  * {igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit} (NEW):
>    - bat-atsm-2:         NOTRUN -> [FAIL][2] +2 other tests fail
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10649/bat-atsm-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit.html

this will have to wait as it's failing in DG2. I believe it's because
it's checking for a register that can't be read, but it needs more
investigation.

Lucas De Marchi
