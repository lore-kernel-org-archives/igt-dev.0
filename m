Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06142CA1007
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 05:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DFE10E4C1;
	Wed,  3 Sep 2025 05:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FHoKrWOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007D110E4C1
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 05:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756878652; x=1788414652;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kP7Z7yTsayulWrB2L2BBNK3vXgtqyfKPAR1scXD7q+g=;
 b=FHoKrWOCmpCwe2qdEkH3hd1Zafu9h/SiOo6if1KcPvp9hD8MmkXoNIbq
 bEp01e6hD09B9OMeURPcrS/imNq8uXW5f+Q9zipDOAWLyLgny35KitwbY
 6FPvLwYgTMwpyBJGXu0ub3G+OOOvYDHW+PowMKvsWdcmzfgYjzx7DcECG
 OFQOW8KCoTqMIBP4P0uvcH2KvDkbwchrhZp5IxDyJDVvGVeFOLuFpEXN6
 vXO2dxQVMAnSMxv5AYk853WeKLTQNMN5cnGjLHicjk4otUFjBoD8QDMnA
 31ILYkR7kKRr2+HNeF3/c0kt1BfVc9qqommosogSJMXsHGiMUGBjq8jrG w==;
X-CSE-ConnectionGUID: qECOkVdFSWajnDt0ElYMLQ==
X-CSE-MsgGUID: QtcID+l5TI+Y+FA7OOhPyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63014764"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63014764"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 22:50:52 -0700
X-CSE-ConnectionGUID: 7JHpI+3zQIyQkD/QU8bAug==
X-CSE-MsgGUID: Njpcgk5JReGzK0UX3YVHvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="202382467"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 22:50:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 22:50:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 22:50:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 22:50:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4/SLerTFnzHBXIA9cXQ+AS8uZXq4y27cjrhmRnjQ7XAfUHjISYuYqLWZWOzpT2BaNxCRSRk0eXiGhPKMkKJuz60okByCtzfothf6jKhmcf7aZbtE+BcbocFouwtSuDReoKbAd35dHGixpAruFgdhgHeG+xO5VkckhJmzhPtd4kWR3B4qCSK5aPLL8GrDYTT1EjQM7OCO+z/efJHdmqRT5/S+oB8gUrA/vvuQmbfK1KtcOk0NBu3wC6sVHwo9O05Git/nSkOtJRXdrXj5RIsULEDXZWXbQC4YJji5gdI40waeIAyFS9COPruMC41NfeJBtW6P6cQtXXDD6+R2u/ySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7eju01Mrpdnv/SO8O5YLClx63JQ6Hb/GcJizdwzzf4=;
 b=RZXsG5UWupDq6+EUHKPonBHekZPjlCCIXovWLfptRxtvRl384/qsEpEnjIvlcUUKH4zsdjXBlUHJgXPD5w53t23bNQklpl2YTKZjPQwltEiV66XeNenU04c9plXGz6EHsLms/0MKP0h2stuO5mfvebCSA1UO2kDTRRaFyE6KiW9bGycxAzg73VIpIFJj1M5h2Spf9ZnQsoFQt18tLkLrbbWYsO897edph61PIsX65ZIoSp95R+T05Bz0kdGZcrk+ppjK9kSi+dt7StBiMDEuW53ay2u48g4cGUMgbEHOItyXmnoLx4rRFLBlYeGqE+G8uglI678lw4v+rT1vIEG+Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4566.namprd11.prod.outlook.com (2603:10b6:208:24e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 05:50:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 05:50:47 +0000
Date: Tue, 2 Sep 2025 22:50:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <nishit.sharma@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <pravalika.gurram@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH i-g-t v8 4/5] tests/intel/xe_exec_system_allocator: Add
 madvise-swizzle test
Message-ID: <aLfXNF7wCREv6LQS@lstrano-desk.jf.intel.com>
References: <20250902163051.1470191-1-nishit.sharma@intel.com>
 <20250902163051.1470191-5-nishit.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250902163051.1470191-5-nishit.sharma@intel.com>
X-ClientProxiedBy: MW4PR04CA0137.namprd04.prod.outlook.com
 (2603:10b6:303:84::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4566:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e9df24-c5dd-40de-1c05-08ddeaadd462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QL5mUq4XVtoNYAefhXz6gzxJSByiS/pWe0fqajskFEjSb9KjflmyGrTINDUd?=
 =?us-ascii?Q?yaQhe23QlSj3eObiX5wMMMoMD8ZMoE2NZuZq4yNId2w9o7eO8jfcU4SxKMV+?=
 =?us-ascii?Q?Uv6n1KDKONrl+4YtMS2Ai7Dsz4BUEVIceUJM64heyjdjpxEdowGAcTZ9u6vG?=
 =?us-ascii?Q?5WujPFDy4C6rjv+75Xc2/2hf3piK8p7gI5aDfx/0KHvrZccG/uPBrrpeEhiL?=
 =?us-ascii?Q?Tx0JEE1t7FHI5QTdaF8DNJyRt7vt7ndzBTjaBz+TXndY+4LOiBtsOL3clPG0?=
 =?us-ascii?Q?JW2Ywh91/MKduUFEc39ZMP36v8lbxU6oaJWbBBU+YGrB4FyNtoGyj4dGggKf?=
 =?us-ascii?Q?fZgoLyhWsB2YhUredK3hHf3mtjs3H6V/lmfME7SkeY4fjhg+btpZY1IxqMDf?=
 =?us-ascii?Q?/dSnFyGlh1r1hN0bcjrK5kT+oq+2zz1xFwG4oJbsypyHL7Hej+eFEokASD/a?=
 =?us-ascii?Q?vI4DMyc08sRNK4CNGoWrwkyzZTXL2nfTWMRO7HTWJA/ATcRFTdTg/tBpxpu9?=
 =?us-ascii?Q?BmfoVFKdy558/9Xbkaig97apgYbAuWLguk2M4KVggJdHzbiKgXcsYdsOxoq/?=
 =?us-ascii?Q?mOUGNFHBCaZvSA/Q4ML9yL2f8Ek218q90go+6UYxXaEHOigf9e9kixyF+QAS?=
 =?us-ascii?Q?He7dCQmwmdeSS9p2VAQUvq5zB9NICGeeYVYoanhJYZlEOwf7W/QqHL/QzY2n?=
 =?us-ascii?Q?FTTjxQVqYbP1A3/6MjGQteTUrmwX58WmpWq/suB4c7a9vqWHx0Ox8lZcUMdO?=
 =?us-ascii?Q?tYoEQTzSqFsgr3qWU8UUpJFko/gOdAd1H3Qqltjl++fKjSl4BAFn3BLMXtnA?=
 =?us-ascii?Q?1ege6OKmdgb/6hV9+3eZE4APrdSF1qQTkIEszIrjxcLtEeuGblP2TN0TLhe5?=
 =?us-ascii?Q?tDStBp2SygyvISHluu5rpjje+jpeRzpbbGjoi0meAZx7ZkaP+INzRvYyCv5i?=
 =?us-ascii?Q?iK0EpCDbHwyLxJOGFh4oqk3Gg2eoLsctJfNaFjf7T22uQhRm9QE4X/m3jRaG?=
 =?us-ascii?Q?MrTaq0eaT+M588LBdRY3fBqkPyKb88nntXL72e6zTHXcSmQFn0xFRUbXaAjQ?=
 =?us-ascii?Q?+gtDq82HNG3kamyi15EPZl7ZJRGsmlW2oHy30GhkuYBlPvJnUTHHdv11qS+F?=
 =?us-ascii?Q?5S3kJJWETWf7eBJj99m+ajWLJgbxV7ymlzMZnQtSU+WCSK1mRlKMEmPZ0UBI?=
 =?us-ascii?Q?xcpqBG28vdDkvwN6cZOsxO95koWzd/LXWbOEc+GhLtR7sa75dc4MZ+6JDbPf?=
 =?us-ascii?Q?1My3zOD3hLPHrmOmoSqv6xJDd5VGNWwiHarTAUO1g18BRmeq5/PPliXz1/xH?=
 =?us-ascii?Q?usyD9Gxm8QkZ4nsJtu8vmwOuHRd5PKxQ3mVirhJGKNu11aVAjdfKp5H4ejnv?=
 =?us-ascii?Q?ysgW8k0gt8b8OaZ3CrxYT9gfozMQGNR3G6ORLPX00f5CmqECYeACGf9eunwC?=
 =?us-ascii?Q?BzncV2q/4d0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pXip1VAFm24792/Z8q3wMmpvj/k1hZ1BSWYCDeRUixxZ8EQJpe+AGXwhJ/MW?=
 =?us-ascii?Q?XVcX7iMmJyVa+IdkLf6TfqrGyzh9otYMwn1WTi6+2NpRD9CnuVXuGjWB1m2P?=
 =?us-ascii?Q?UPcCyO+XyvMMKyfuegg9E4ZI/3oQLWzdNenZUbjwS09GOdg3SKdVH23GV+Eg?=
 =?us-ascii?Q?Pe1me2cUoyrN084F5oM+l/Ai91bnkdfq6M3VLkYfDaUwcQpdnSsLyQCFazly?=
 =?us-ascii?Q?NNDpvyhARzeKbSgftqN9n3nnP34OuPfMRjC4BihF8uzFJ/mjWgpz8T/4TnSE?=
 =?us-ascii?Q?7xcbMU1mGGwgOBXSERrFtaVEK6wEOpE15mJ90hR1hczKfwyuWOQwXcd7Jsm0?=
 =?us-ascii?Q?IkORUukiiBeepLxoqd6q/kMrqkumpYBYZiebTJe/WwkFduiu64RFb9zv2D/k?=
 =?us-ascii?Q?pm8VLWLGaz/0kbAIDYEPfg5WT+zBWp+ssM/dTrN7haaZjTI9uZEiV6rFtJR1?=
 =?us-ascii?Q?qa4afLNCqrd12NrLHFP9LWFoeLduQhyRLgdJ+DCw9/iD93S1YHL4obaZvN0D?=
 =?us-ascii?Q?jvqVT5IO3X9xEmuf0isg8kgbKJ8ReDTgs0CgdARXihIT3c6EmhxkWEaSS7CK?=
 =?us-ascii?Q?2hL+u3s8y2V7P3OYZJo1NWlmbNXeI+UWrRMJHujTtHWfkZzjmY2+oQc/DAit?=
 =?us-ascii?Q?SzXG3kVMJrs7+Ym1EENK6TUJNLuJcyhlQymPgftFVySJav2X+oOTJEC+NV3j?=
 =?us-ascii?Q?BkHecGZtSqslWT/lRibms+p/lnOsdNxGN5lvIfXIg7pUYzziPrkfCZHqdBWD?=
 =?us-ascii?Q?E/ttoheDElfTVOhUKkjSU8VBjvXg+qq2Sgue1ltLBPlT2m1wUEQMcLSQW+ui?=
 =?us-ascii?Q?oT9wc5wO9JNJRxkLHK0gKNzHF3gfSEAsBgnd8RvhQBlmJ92x4XEcIgBbel4t?=
 =?us-ascii?Q?+n8wbVC8wgmYBS6gP+V7rKk8r41oPw8kxfLgob0PVAa1inm2ReJ0ZWMRRzH8?=
 =?us-ascii?Q?LaUZdvjqNiFXe+hsRXrB60Ls0jq3JLIQgOwOcAfBtocpdxs1lJ8gGEMsqhzQ?=
 =?us-ascii?Q?EEy8E/U/PCZBZu+4SFNsy2IRTcoQv53sx+LrrQD0cxtEXy+Q+nG0zVtH8P29?=
 =?us-ascii?Q?Uu8bsHGPS6pZRHtqiXUJGIQJinypY6K/lbUTSSwNy2ohgzsWQ0AoNYMGHzAX?=
 =?us-ascii?Q?aU+RwN6X+8+2YV3ecnxQ3UMxnPVnZdHO8j6FtjOrrsfDZYP1BtUd/Pmy0kgx?=
 =?us-ascii?Q?hBPa+OvEp4f0jngE2ewSePsVGg4jr62KQZJrtfhqObHMupnqYRtfyVhPs+XE?=
 =?us-ascii?Q?+Uij0dEs5H4GjWVdSur3nWgiYVnNy56CtfvA+emhfYSXP5efWd2894cuC4Px?=
 =?us-ascii?Q?akcohrCeE2sWk3Wq0BXEkUw3AuJA9OmW4sMT2bHKnn3eiu/cVafckeKglwO4?=
 =?us-ascii?Q?pfLit6e7m4iq9PNcJW0CO2ISlB0xOJsTH1l0BqyeGM5XrHgp4dMru1yMWJ7o?=
 =?us-ascii?Q?Y/QNfapLxuGNtq8ItarSA+mmRAaM7WDiGnQw7mTs/sI6Hm3xy2rGBAkxfOej?=
 =?us-ascii?Q?Zz2PuKlcEjk3cyCK4r//u9hBtuK8X0OKHNnwF0pS5FUU5p9DYyU4UmHSFAaK?=
 =?us-ascii?Q?FgTvEFXY5OhNx0PYe6f1T00BWJ1mxwDG/XnZQwRjf8deEalTfjs7IKQqdUpP?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e9df24-c5dd-40de-1c05-08ddeaadd462
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 05:50:47.1267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXdYxILf4AlQ4IR4SSMLg1cUV+QVdM5ULghx1YDAByuVtJKoyZ1qaG9zQxDOmgyXpkrcqRsTYPpH/PkfvS33IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4566
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

On Tue, Sep 02, 2025 at 04:30:50PM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> madvise-swizzle test introduced which is called in combination with other
> tests as well. In this test the buffer object preferred location is
> system memory.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 39 ++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index e7f3d423a..16f907ab5 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -777,6 +777,8 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>  #define PROCESSES		(0x1 << 24)
>  #define PREFETCH_BENCHMARK	(0x1 << 25)
>  #define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> +#define MADVISE_SWIZZLE			(0x1 << 27)
> +#define MADVISE_OP			(0x1 << 28)
>  
>  #define N_MULTI_FAULT		4
>  
> @@ -885,7 +887,9 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * arg[1]:
>   *
>   * @malloc:				malloc single buffer for all execs, issue a command which will trigger multiple faults
> + * @malloc-madvise:			malloc single buffer for all execs, issue a command which will trigger multiple faults, perfoems madvise operation
>   * @malloc-prefetch:			malloc single buffer for all execs, prefetch buffer before each exec
> + * @malloc-prefetch-madvise:		malloc single buffer for all execs, prefetch buffer before each exec, performs madvise operation
>   * @malloc-multi-fault:			malloc single buffer for all execs
>   * @malloc-fork-read:			malloc single buffer for all execs, fork a process to read test output
>   * @malloc-fork-read-after:		malloc single buffer for all execs, fork a process to read test output, check again after fork returns in parent
> @@ -897,6 +901,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * @mmap:				mmap single buffer for all execs
>   * @mmap-prefetch:			mmap single buffer for all execs, prefetch buffer before each exec
>   * @mmap-remap:				mmap and mremap a buffer for all execs
> + * @mmap-remap-madvise:			mmap and mremap a buffer for all execs, performs madvise operations
>   * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag for all execs
>   * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
>   * @mmap-remap-ro-dontunmap:		mmap and mremap a read-only buffer with dontunmap flag for all execs
> @@ -916,8 +921,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * @mmap-file-mlock:			mmap and mlock single buffer, with file backing, for all execs
>   * @mmap-race:				mmap single buffer for all execs with race between cpu and gpu access
>   * @free:				malloc and free buffer for each exec
> + * @free-madvise:			malloc and free buffer for each exec, performs madvise operation
>   * @free-race:				malloc and free buffer for each exec with race between cpu and gpu access
>   * @new:				malloc a new buffer for each exec
> + * @new-madvise:			malloc a new buffer for each exec, performs madvise operation
>   * @new-prefetch:			malloc a new buffer and prefetch for each exec
>   * @new-race:				malloc a new buffer for each exec with race between cpu and gpu access
>   * @new-bo-map:				malloc a new buffer or map BO for each exec
> @@ -999,6 +1006,29 @@ static void igt_require_hugepages(void)
>  		      "No huge pages available!\n");
>  }
>  
> +static void
> +xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data * data,
> +			    size_t bo_size, struct drm_xe_engine_class_instance *eci,
> +			    uint64_t addr, unsigned int flags)
> +{
> +	if (flags & MADVISE_SWIZZLE) {
> +		for (int i_loc = 0; i_loc < 2; i_loc++) {
> +			uint64_t preferred_loc;
> +
> +			if (i_loc % 2 == 0)
> +				preferred_loc = DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM;
> +			else
> +				preferred_loc = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
> +
> +			xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
> +					DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +					preferred_loc,
> +					0);
> +		}
> +	}
> +
> +}

This isn't quite what I suggested in the previous rev. I was suggesting
in the 'for (i = 0; i < n_execs; i++) {' loop, call madvise toggling
between a preferred location of SYSTEM / DEVICE on each pass of the
loop.

Matt

> +
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, size_t bo_size,
> @@ -1134,6 +1164,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	addr = to_user_pointer(data);
>  
> +	if (flags & MADVISE_OP)
> +		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags);
> +
>  	if (flags & BO_UNMAP) {
>  		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  		bo = xe_bo_create(fd, vm, bo_size,
> @@ -1790,7 +1823,9 @@ igt_main
>  	struct drm_xe_engine_class_instance *hwe;
>  	const struct section sections[] = {
>  		{ "malloc", 0 },
> +		{ "malloc-madvise", MADVISE_OP | MADVISE_SWIZZLE },
>  		{ "malloc-prefetch", PREFETCH },
> +		{ "malloc-prefetch-madvise", PREFETCH | MADVISE_OP | MADVISE_SWIZZLE },
>  		{ "malloc-multi-fault", MULTI_FAULT },
>  		{ "malloc-fork-read", FORK_READ },
>  		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
> @@ -1802,6 +1837,7 @@ igt_main
>  		{ "mmap", MMAP },
>  		{ "mmap-prefetch", MMAP | PREFETCH },
>  		{ "mmap-remap", MMAP | MREMAP },
> +		{ "mmap-remap-madvise", MMAP | MREMAP | MADVISE_OP | MADVISE_SWIZZLE },
>  		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
>  		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
>  		{ "mmap-remap-ro-dontunmap", MMAP | MREMAP | DONTUNMAP |
> @@ -1828,13 +1864,16 @@ igt_main
>  		{ "mmap-file-mlock", MMAP | LOCK | FILE_BACKED },
>  		{ "mmap-race", MMAP | RACE },
>  		{ "free", NEW | FREE },
> +		{ "free-madvise", NEW | FREE | MADVISE_OP | MADVISE_SWIZZLE },
>  		{ "free-race", NEW | FREE | RACE },
>  		{ "new", NEW },
> +		{ "new-madvise", NEW | MADVISE_OP | MADVISE_SWIZZLE },
>  		{ "new-prefetch", NEW | PREFETCH },
>  		{ "new-race", NEW | RACE },
>  		{ "new-bo-map", NEW | BO_MAP },
>  		{ "new-busy", NEW | BUSY },
>  		{ "mmap-free", MMAP | NEW | FREE },
> +		{ "mmap-free", MMAP | NEW | FREE | MADVISE_OP | MADVISE_SWIZZLE },
>  		{ "mmap-free-huge", MMAP | NEW | FREE | HUGE_PAGE },
>  		{ "mmap-free-race", MMAP | NEW | FREE | RACE },
>  		{ "mmap-new", MMAP | NEW },
> -- 
> 2.43.0
> 
