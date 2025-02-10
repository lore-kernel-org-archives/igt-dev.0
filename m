Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4EEC02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 17:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E38910E5D1;
	Mon, 10 Feb 2025 17:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJ3SQ089";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D70C10E5D1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 17:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739208082; x=1770744082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l//FMxjwII4z50SUqei1veE9KbTG1Steg9Ba643ntLA=;
 b=HJ3SQ089c/zPoQ5S0hjSirZCW+UuTNarxmc8otNUDoN6OlueqpgaHeVS
 mU0x81NSoaj1xLAes7a4lgra/fkPmYiZbnvyat4wh/iiRFH3nvby3cpic
 7nz/mU1lMEEcb1g+tVGVrTyxx/4BWLHBLkIoIh0QzN0EpW4SHTsLu2qdw
 a3YifgN/91TQiMZRTA8odi57/uCCH4Eh/BskLIgFUl/tnL9YwKv8yzceJ
 bLxROHIKqqc8f6EvfL31uAEtr4TGNqwxps4jLwDxZDW09WBf7rW8lAnoT
 ytrZ9UzDMGugDVtpAyLXeQU1xlKq/g8d1ThW3ezDCSZJYL+HW8uENzpIz A==;
X-CSE-ConnectionGUID: esDqgLzHRmyDTJjl2wc+QQ==
X-CSE-MsgGUID: Lv/RTDi0Tv6SGn0Qnpg+2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="62274645"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="62274645"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 09:21:22 -0800
X-CSE-ConnectionGUID: 9s+TJJ23SKWZn6f3VvoNcA==
X-CSE-MsgGUID: 6/ah4XjgTw2YKsU0fCtJEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112766544"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 09:21:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 09:21:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 09:21:20 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 09:21:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lo1KGfU1j9lodN+aBgdNeHFH2+GC6IZ9K7RJCxNw7OsDeGClewNnvRVPTLsdPPua5taEetSdRgS15aDvZdCH1w93Vw8jK/NM9rhzItal5E1H2wg2zixDuCo3tf7Ip9Tflx2XEcGwcKgRVR3PLbaZEe+5N6mTSffH3feyBp2zPJjzYMo6C3fpcLhncU/03mSmczdReND2Er5nFcme4jInGwGo9ireW1nHMaAdW2hFMXx89RQJj2CRCrYgLBpz7YFtTngKIidyIup6oaoosuEK5v8+U6nxBOCQN9Uo5UN2ydOd/d3FZH7nn1ji58IHZYK0skkp9ItpmyA+0/xVPaEvog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8tUgFi+q8o6F7ZnqOg7enzfJjLiDhf5Ls2vi3fNXcY=;
 b=h9nSlhVPZOlZJehL49FsB3U8qUU13coUXsqDaQ2LEwf4GjgPqO1PTEAACQbnumjGO3t/A+ELdWP6+Sfj5ku2smmAYbimrkKUDHxiqiJdjsgokxHxPlBuRZdTkEXxpLjlHlYy3n5YrEOSp2kBtBUGlWZLEs6CW77BSWgvtWIoOKLLzwurnWSWB1olmlAEbxAnURA4a2sAhN/lLli4x9y9dwfU3uEfIHHnxivPSEn63z86MUtGNbK8xRjQg+uRpyCNr2s5vkYUTieruKty7EljEDvW9HVvIE2dHSHNeyPBl6jM69pnqrEOyB8+QTlLe91PzvvpaAyJ4BAurOomgVG70Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7809.namprd11.prod.outlook.com (2603:10b6:208:3f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:21:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:21:15 +0000
Date: Mon, 10 Feb 2025 09:22:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>
Subject: Re: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Test scratch page
 under fault mode
Message-ID: <Z6o1xkp5oErv0daA@lstrano-desk.jf.intel.com>
References: <20250204181742.4055152-1-oak.zeng@intel.com>
 <20250204181742.4055152-2-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250204181742.4055152-2-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR04CA0060.namprd04.prod.outlook.com
 (2603:10b6:303:6a::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: ccfd776d-6d98-4878-b644-08dd49f752af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GZs2CPBi7H2Hjs2QoSIeiYGN4ZDIgXTbfGedCVbFm5c7Fpf/zjrzTG3Qado5?=
 =?us-ascii?Q?0WTsA5rb25iLtQaO0gZqCm2T9ag4FUWTBo5ixaLEAvq9Vzo2rwi3i/6NXfoc?=
 =?us-ascii?Q?OizshWQGAGgYJZ4BdqUZA2ETLu0073fwDD8xUMs8qpNQXk7yyAEsP5UA0qq0?=
 =?us-ascii?Q?qYtEExUiBVesAHO64RgYZXqxPPOYSR9l0iEqv8KVATNQmmioLuQUMmumBMaF?=
 =?us-ascii?Q?p7kUG4qLRpyLEgL52fGuXvDRcFyV8tWb5ZOBeUxiqS/3w9kYj6OWCKs7F463?=
 =?us-ascii?Q?ojG7cvSu1zOHxFkGzPspr9GNXt6a34I4200J1OXrnSPohTC/lVnfoDPx0fCA?=
 =?us-ascii?Q?/J9wEktVqU9EMJZ1awZmhySGTHzVZ9ora4Bwd/XYdwYk5kaXOMzlGHwo+Tdc?=
 =?us-ascii?Q?KCNJqtb6p9yi1StZcMT6Q5twSGeRxcLvVXm0yj3kscGMJe/kgfNJyN5oRwk3?=
 =?us-ascii?Q?nVnaje1WFAqeDHMe3YLv1313Pl/0hGphcnybRs2WmdY2w4PfQZ5HHiWYq5rq?=
 =?us-ascii?Q?0kqhFxG+IkuLeg42V7zjcBuOFLpQsgt0eeqrfiq8tkDOxtHoAYA7dcDbl2dc?=
 =?us-ascii?Q?YUf7X9MoBgZ+LzpRiBtJfAOB6sfaEpkiIRSYqXDWb6RSejjDmICnLrzK0YdH?=
 =?us-ascii?Q?AoUS4Y9sCk+iUXiANDpX3LGCBy+Wca6+npl29aUpvUTbg+/ft0MqI6IJrP+L?=
 =?us-ascii?Q?px9VRW2UiTOMWglKAVjccjEtyIfxNy0Dq/tQxCF35iiH7G9RWGdB1vU6oV2U?=
 =?us-ascii?Q?nEm/fbIw+Eilo6MHK5yzXDSfKVEW+t3JAoiBfJktuvSzxrvvrC6k6acnVfu4?=
 =?us-ascii?Q?LFwc2zbeo4XxEmIpo9vfTpRUpz3Z641sOIwh6BOYOb/GnaviM0V9ak571Y6Q?=
 =?us-ascii?Q?9fD9qytYejqwjDN2xHhs5qRoo+ZiOpA1P9uij3jlA7zJFNhhEK2MnzlCIDof?=
 =?us-ascii?Q?4b/NJqy9SFAHXiaC2ejdFpneDaUEI5E4EGGYlF17YNguXHDZyj9zpH7quKsv?=
 =?us-ascii?Q?k8EcY66SmUlsIYW1ufTRy8F66GAGCh5i+FLZHa6ocOFmvsC6dH/eaDSK/MgM?=
 =?us-ascii?Q?6h8LLXzUjvwzMUbra2QoIJjAgagn7SnBX7gZm7oFU04gkW4Rq/CD9MuydsoL?=
 =?us-ascii?Q?VQcInNOv3E/jePlDlyyjZM8o0BM6faVDbxTAQsCr5IX+xHdPJ2ZlMfRiJJvJ?=
 =?us-ascii?Q?7vE9q0ekM5B/vCgbhw7g7PqkxdiAD3PymjpGXdLOuD2WvFM8KAvxtMmyrMnQ?=
 =?us-ascii?Q?kbf5JZUw3RSNQbuKDUy614bXKgGywjxNvn0Romf/jvJn4yna0yZoWntzS7nt?=
 =?us-ascii?Q?f+0rav0IRc+Qr4bpfJ+Ws/w2G+33dKTPFdF0l6wHNxILd/VOEtLb29oVhYdE?=
 =?us-ascii?Q?uM6mMzp9uN2PLwYEvlDb+qMVAksA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rRqWf9yeyTN+6poiId2BgJ3WloEonnq8K4p07g8WUcH4G/hZBH6crmsI1N32?=
 =?us-ascii?Q?slm4e8fBCEnfhNJDUju7hQI+reaDeLzRxFk8Htch/0hgFa50tdo+ZidNv2aO?=
 =?us-ascii?Q?XWv1ngKohX4aNE8tV8vRwtzRl5QLs1b10D5Lr3nvcAU9rEutGqVDO8mXFHLO?=
 =?us-ascii?Q?SMnNTCuSpfQnX8gAxIdMylneGytttZajdwWCd7s6GSvr4aO5eL6KgwNHlNvs?=
 =?us-ascii?Q?xPCdr/q3kOQ0211sNNe0oSJ57xCngqCncERq0FgCa6dHbxvfCFeMrcL2MXec?=
 =?us-ascii?Q?5I4+j2Bt4EtYnZ8xVOzPQempROTVv7H34mZt5Zxw5CTOzOuEHwiLI7+U5e9G?=
 =?us-ascii?Q?87VnUsjfxi2c+xcdKR4cJcIVinRXX3jeSwZqQqJn3ddTELRCTdhs9rA6ldUd?=
 =?us-ascii?Q?secQqEJzDaxbtSyISvwVkN+qsf0ia7FTWPijh6eBHEl+9fFOcVBozgDSXZ5/?=
 =?us-ascii?Q?jlPEyjipskAtMsRY8naWC6BPuEVEDSOeE2c+NWQ3DVBIWF8mewGqT5lM1mIV?=
 =?us-ascii?Q?oGQTnF2qRpi9Ski4PeOBcZ8TYvaU0cQ+dhXyc+kgC2vkrKcbjBRKDJkEv1ZX?=
 =?us-ascii?Q?MUYfqlYOo1Lvb18HuQKUWnAwCp34r+pIpOM/5REI+BLpJwhlBnIXCspYgesq?=
 =?us-ascii?Q?cK6sX5iiBmmWFMYZAtiNXUWNLeCh03xJBnkjEV3+akQACsCzbaIMDukPCU1N?=
 =?us-ascii?Q?P22jq1GwXZIWnqhkEYCc+fBXEEHihvJ+yw7oetlVAE+H4FBexsazXj7gfB3C?=
 =?us-ascii?Q?I/Cg8vfEGbuO5h1Q3IlEYruLvpw4W510KpR8yQ3yoihZ6AOtwzk163uiNwQg?=
 =?us-ascii?Q?IE6adqxC7wo7MKI9U1tAp9c6Oiclv9EbREr/WPa3F+bKxH8MyxkGNIwNJv+7?=
 =?us-ascii?Q?jfPQh8QB1xZ66l63+f1CfOmb/7TwQRShcP6fU54Mu9tDfI8YccwP71uOnzjl?=
 =?us-ascii?Q?zhmU+kYiX2rub+VITAT17TWKpnIMOKIqzgnhoqMsDfFfF91bku2jfZBwADaA?=
 =?us-ascii?Q?ddzYA78m1Wf59+bN9QpnUc+eFU4XxkTS6tflcO5H7A1doZuHT6cNSJwAcTI1?=
 =?us-ascii?Q?sYI9tdpO2YSMKyLKG+tCS3RwjL23X+6Cdz3GlVRQ5uc2dHZ+MzQ8oT40PfQq?=
 =?us-ascii?Q?xP+zhb2KRjLugPiqyVBx8KsIwmzgFDuK5++T2yZ0aG9kCYh/FM2gc16psuOl?=
 =?us-ascii?Q?XP1Y7c48rqfLeJ24zNZ+AVuCiAq4fKZ9zruBKIae9GgZ+Q0lalI0CmnY1XmS?=
 =?us-ascii?Q?X6emDQ+3U8cBC3h+bbbWhBT76iRU8vJrM9+3weWCRkIJ+U95PCZ+1Oxu/6Bt?=
 =?us-ascii?Q?IVB4pQ27J8Egl5gVtL9BRNmPexXRUDbHtI2klbwWXNgu2raI8MqfpR3XyHI8?=
 =?us-ascii?Q?q1/A+Os0iOCtnQBGh6HwD+HrnaqAC3NfRN0+f/+T+g7+yiXu8X/Adjhx8k9x?=
 =?us-ascii?Q?k/NYw9QxhpxSV5PD4jYzE23QGHPUXRHGpK4vZwoww7sScM2hlITN1jzco11x?=
 =?us-ascii?Q?jxJvW5qW/uKPsEv0PW8mCBFUD9TQVbdHYz9SVoDlBmlz2juh0WyU0Tze8f1i?=
 =?us-ascii?Q?aRYMdO/1pt/49MAXzPJhz4Mwd/s37aamy8Jl9zwvVVIiTwuEhIuWxTOVF4mx?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfd776d-6d98-4878-b644-08dd49f752af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:21:15.1537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sarPf726dq7tXRlcLMSrAr2Yt6RCH5pBFj3+nQAV4tj5LDvKbmBovONuR4IC0Eeaor6RYtpy0EfWANGI12M01g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7809
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

On Tue, Feb 04, 2025 at 01:17:42PM -0500, Oak Zeng wrote:
> On certain HW (such as lunarlake and battlemage), driver now allows
> scratch page be enabled under fault mode. Test this functionality
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 128 +++++++++++++++++++------------
>  1 file changed, 79 insertions(+), 49 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index ae40e099b..935e6c044 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -35,6 +35,7 @@
>  #define INVALID_FAULT	(0x1 << 7)
>  #define INVALID_VA	(0x1 << 8)
>  #define ENABLE_SCRATCH  (0x1 << 9)
> +#define ENABLE_FAULT    (0x1 << 10)
>  
>  /**
>   * SUBTEST: invalid-va
> @@ -45,6 +46,10 @@
>   * Description: Access invalid va without pageafault with scratch page enabled.
>   * Test category: functionality test
>   *
> + * SUBTEST: scratch-fault
> + * Description: Enable scratch page and page fault at the same time.
> + * Test category: functionality test
> + *
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] fault mode test only once
>   * Test category: functionality test
> @@ -115,6 +120,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, unsigned int flags)
>  {
>  	uint32_t vm;
> +	uint32_t vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
>  	uint64_t addr = 0x1a0000;
>  	uint64_t sync_addr = 0x101a0000;
>  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> @@ -145,11 +151,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>  
>  	if (flags & ENABLE_SCRATCH)
> -		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> -				  DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> -	else
> -		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> -				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +		vm_flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
> +	if (flags & ENABLE_FAULT)
> +		vm_flags |= DRM_XE_VM_CREATE_FLAG_FAULT_MODE;

This is always set, right? I wouldn't add this new flag then.

> +	vm = xe_vm_create(fd, vm_flags, 0);
> +
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = xe_bb_size(fd, bo_size);
>  	sync_size = sizeof(*exec_sync) * n_execs;
> @@ -405,59 +411,76 @@ igt_main
>  		const char *name;
>  		unsigned int flags;
>  	} sections[] = {
> -		{ "basic", 0 },
> -		{ "userptr", USERPTR },
> -		{ "rebind", REBIND },
> -		{ "userptr-rebind", USERPTR | REBIND },
> -		{ "userptr-invalidate", USERPTR | INVALIDATE },
> -		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
> -		{ "bindexecqueue", BIND_EXEC_QUEUE },
> -		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR },
> -		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE | REBIND },
> +		{ "basic", ENABLE_FAULT },
> +		{ "userptr", USERPTR | ENABLE_FAULT },
> +		{ "rebind", REBIND | ENABLE_FAULT },
> +		{ "userptr-rebind", USERPTR | REBIND | ENABLE_FAULT },
> +		{ "userptr-invalidate", USERPTR | INVALIDATE | ENABLE_FAULT },
> +		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE |
> +			ENABLE_FAULT },
> +		{ "bindexecqueue", BIND_EXEC_QUEUE | ENABLE_FAULT },
> +		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR |
> +			ENABLE_FAULT },
> +		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE | REBIND |
> +			ENABLE_FAULT },
>  		{ "bindexecqueue-userptr-rebind", BIND_EXEC_QUEUE | USERPTR |
> -			REBIND },
> -		{ "bindexecqueue-userptr-invalidate", BIND_EXEC_QUEUE | USERPTR |
> -			INVALIDATE },
> -		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE | USERPTR |
> -			INVALIDATE | RACE },
> -		{ "basic-imm", IMMEDIATE },
> -		{ "userptr-imm", IMMEDIATE | USERPTR },
> -		{ "rebind-imm", IMMEDIATE | REBIND },
> -		{ "userptr-rebind-imm", IMMEDIATE | USERPTR | REBIND },
> -		{ "userptr-invalidate-imm", IMMEDIATE | USERPTR | INVALIDATE },
> +			REBIND | ENABLE_FAULT },
> +		{ "bindexecqueue-userptr-invalidate", BIND_EXEC_QUEUE |
> +			USERPTR | INVALIDATE | ENABLE_FAULT },
> +		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE |
> +			USERPTR | INVALIDATE | RACE | ENABLE_FAULT },
> +		{ "basic-imm", IMMEDIATE | ENABLE_FAULT },
> +		{ "userptr-imm", IMMEDIATE | USERPTR | ENABLE_FAULT },
> +		{ "rebind-imm", IMMEDIATE | REBIND | ENABLE_FAULT },
> +		{ "userptr-rebind-imm", IMMEDIATE | USERPTR | REBIND |
> +			ENABLE_FAULT },
> +		{ "userptr-invalidate-imm", IMMEDIATE | USERPTR | INVALIDATE |
> +			ENABLE_FAULT },
>  		{ "userptr-invalidate-race-imm", IMMEDIATE | USERPTR |
> -			INVALIDATE | RACE },
> -		{ "bindexecqueue-imm", IMMEDIATE | BIND_EXEC_QUEUE },
> -		{ "bindexecqueue-userptr-imm", IMMEDIATE | BIND_EXEC_QUEUE | USERPTR },
> -		{ "bindexecqueue-rebind-imm", IMMEDIATE | BIND_EXEC_QUEUE | REBIND },
> -		{ "bindexecqueue-userptr-rebind-imm", IMMEDIATE | BIND_EXEC_QUEUE |
> -			USERPTR | REBIND },
> +			INVALIDATE | RACE | ENABLE_FAULT },
> +		{ "bindexecqueue-imm", IMMEDIATE | BIND_EXEC_QUEUE |
> +			ENABLE_FAULT },
> +		{ "bindexecqueue-userptr-imm", IMMEDIATE | BIND_EXEC_QUEUE |
> +			USERPTR | ENABLE_FAULT },
> +		{ "bindexecqueue-rebind-imm", IMMEDIATE | BIND_EXEC_QUEUE |
> +			REBIND | ENABLE_FAULT },
> +		{ "bindexecqueue-userptr-rebind-imm", IMMEDIATE |
> +			BIND_EXEC_QUEUE | USERPTR | REBIND | ENABLE_FAULT },
>  		{ "bindexecqueue-userptr-invalidate-imm", IMMEDIATE | BIND_EXEC_QUEUE |
> -			USERPTR | INVALIDATE },
> +			USERPTR | INVALIDATE | ENABLE_FAULT },
>  		{ "bindexecqueue-userptr-invalidate-race-imm", IMMEDIATE |
> -			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE },
> -
> -		{ "basic-prefetch", PREFETCH },
> -		{ "userptr-prefetch", PREFETCH | USERPTR },
> -		{ "rebind-prefetch", PREFETCH | REBIND },
> -		{ "userptr-rebind-prefetch", PREFETCH | USERPTR | REBIND },
> -		{ "userptr-invalidate-prefetch", PREFETCH | USERPTR | INVALIDATE },
> +			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE |
> +			ENABLE_FAULT },
> +
> +		{ "basic-prefetch", PREFETCH | ENABLE_FAULT },
> +		{ "userptr-prefetch", PREFETCH | USERPTR | ENABLE_FAULT },
> +		{ "rebind-prefetch", PREFETCH | REBIND | ENABLE_FAULT },
> +		{ "userptr-rebind-prefetch", PREFETCH | USERPTR | REBIND |
> +			ENABLE_FAULT },
> +		{ "userptr-invalidate-prefetch", PREFETCH | USERPTR |
> +			INVALIDATE | ENABLE_FAULT },
>  		{ "userptr-invalidate-race-prefetch", PREFETCH | USERPTR |
> -			INVALIDATE | RACE },
> -		{ "bindexecqueue-prefetch", PREFETCH | BIND_EXEC_QUEUE },
> -		{ "bindexecqueue-userptr-prefetch", PREFETCH | BIND_EXEC_QUEUE | USERPTR },
> -		{ "bindexecqueue-rebind-prefetch", PREFETCH | BIND_EXEC_QUEUE | REBIND },
> -		{ "bindexecqueue-userptr-rebind-prefetch", PREFETCH | BIND_EXEC_QUEUE |
> -			USERPTR | REBIND },
> -		{ "bindexecqueue-userptr-invalidate-prefetch", PREFETCH | BIND_EXEC_QUEUE |
> -			USERPTR | INVALIDATE },
> +			INVALIDATE | RACE | ENABLE_FAULT },
> +		{ "bindexecqueue-prefetch", PREFETCH | BIND_EXEC_QUEUE |
> +			ENABLE_FAULT },
> +		{ "bindexecqueue-userptr-prefetch", PREFETCH | BIND_EXEC_QUEUE |
> +			USERPTR | ENABLE_FAULT },
> +		{ "bindexecqueue-rebind-prefetch", PREFETCH | BIND_EXEC_QUEUE |
> +			REBIND | ENABLE_FAULT },
> +		{ "bindexecqueue-userptr-rebind-prefetch", PREFETCH |
> +			BIND_EXEC_QUEUE | USERPTR | REBIND | ENABLE_FAULT },
> +		{ "bindexecqueue-userptr-invalidate-prefetch", PREFETCH |
> +			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | ENABLE_FAULT },
>  		{ "bindexecqueue-userptr-invalidate-race-prefetch", PREFETCH |
> -			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE },
> -		{ "invalid-fault", INVALID_FAULT },
> -		{ "invalid-userptr-fault", INVALID_FAULT | USERPTR },
> +			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE |
> +			ENABLE_FAULT },
> +		{ "invalid-fault", INVALID_FAULT | ENABLE_FAULT },
> +		{ "invalid-userptr-fault", INVALID_FAULT | USERPTR |
> +			ENABLE_FAULT },
>  		{ NULL },
>  	};
>  	int fd;
> +	uint16_t dev_id;
>  
>  	igt_fixture {
>  		struct timespec tv = {};
> @@ -466,6 +489,7 @@ igt_main
>  		int timeout = igt_run_in_simulation() ? 20 : 2;
>  
>  		fd = drm_open_driver(DRIVER_XE);
> +		dev_id = intel_get_drm_devid(fd);
>  		do {
>  			if (ret)
>  				usleep(5000);
> @@ -508,6 +532,12 @@ igt_main
>  		xe_for_each_engine(fd, hwe)
>  			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH | INVALID_VA);
>  
> +	igt_subtest("scratch-fault") {
> +		igt_skip_on(!IS_LUNARLAKE(dev_id) && !IS_BATTLEMAGE(dev_id));
> +		xe_for_each_engine(fd, hwe)
> +			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH | ENABLE_FAULT);

This is a good start but we really need this section to roughly do
something like this to get good coverage:

- Run a batch with a scratch page access, wait for batch to complete
- Bind scratch page access /w immediate cleared
- Run a batch with access to newly bound address, wait for batch to
  complete, verify access worked

'access' here likely is DW write.

Matt

> +	}
> +
>  	igt_fixture {
>  		drm_close_driver(fd);
>  	}
> -- 
> 2.26.3
> 
