Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8E0C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0363010F929;
	Fri,  3 Jul 2026 21:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLm5+ZWO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4937110F929
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112436; x=1814648436;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GAH5SpGIVn381DHdZu5aV67mjQc8nIvG7sZV/6eAxm8=;
 b=BLm5+ZWOcUV+YkFOtZAR1emMEdGusS0jOSGRv+h/HgZj98UPkuHePqS7
 yif7zaNuwUE9/lKRneK7bMJWcp6V2sK4m+UQxqj1mZNRbfuuDxYHSbWPC
 MF3cq/BWt4WdvtEmWhbmWdyupThnlhcMIuIANjdU06lRAKoIalojCCSkV
 sbTV7nffHqho2DjqdcstJgzyWhJ4OQUL26P+Osgj6scRYtTUy53MaCAHk
 xa1pgJ7epTsH4sRicyd5g/l1NeMD7v8B5N+/oWy0RIMvFyQUjWysAfk2d
 jogq3qVYOlF8NJB8KFLR9Br5sMBhD/2JyyH452OpzbWiKgBiQNvGWHvKs w==;
X-CSE-ConnectionGUID: CamFzuuWTOW0b0aFIeQmDA==
X-CSE-MsgGUID: 2Fon8Z0kTKiYWVefdx6miQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83988815"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83988815"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:00:36 -0700
X-CSE-ConnectionGUID: vvbmfzuoRS+yFbzHyuliUw==
X-CSE-MsgGUID: z/7L7sE5TdSmOu1Y0mGNCA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:00:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:00:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:00:35 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:00:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fa7A4x3XvqSwfynT/wRDzt6N8tbd5B75Cf4CUCl48IH2RL6Ibl4FJ0Qkrpv7xOT9CikKq3HNERgKt7AP3oEu3sGrVLNuAnnvFWgrGHIF3spF6Hj/vynJVF2T+hdefXIxBwk012QW1g5pDgBMRpN/tS+muFB4pCdEEebO97rilVz0LltTW3aGezPo2P9XN7LOM9dZThcMzubmxGXfDEN++5hCnPj+HdnHtRxYYFuZglgO0RhLnEUWNTZfikCpehIUxR5LGjK+N+rteW48g22VuebanyS7n0p90z17/5uhQE90zUdDkbJC+A65JCxHIE+kEDM3V8sW2l2O6KE67vNE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNJE5bd/5N7XKPUXC8pjVxu2yqXXUBTjLXwoYGaHlbw=;
 b=JTxyUK08FEOkRnk1b4U3I2VkYbRSZRChj7U9pzquUm6VS+f9XvW+x/iEiSuDLvGku5niUrxegN4/CpastfeqQJF6kpr0jdlobNl83x+UDUUBLz7z9YZE17MaeEmYv5QkGVRtOjWfh3veWux8uATV6es+U5DnbGsVKrOQQbsKER7tbqdPJL3BrDkE02oU0VQwq/KlShIkQco9shRqJDfztLamI/7oY3feOhYLotkzeYFbm6dBYde7VOZV+K6s57Tnv8bNjraPa6ARGMXzgKkUEMAEWRSoA6xDWqMhPxiW698s1iUVXBdR56IOzto8oFqc4JlYK8m+ly4Tn+2b716nUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:00:30 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:00:30 +0000
Date: Fri, 3 Jul 2026 23:00:24 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 12/31] tools/intel_gpu_frequency: link with
 minimal sub-libraries
Message-ID: <iiiiwljp3pwkwbfmtlhjwf36e3rvpd44uawxh27bzdb7xvezet@catd2i5ow552>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <33850636f7e24839aa2013cb81217d5306c8504d.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <33850636f7e24839aa2013cb81217d5306c8504d.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU6P191CA0042.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::18) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH8PR11MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8aa0df-b99d-470c-ee2d-08ded9461de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|23010399003|376014|18002099003|22082099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: CO5ypv/kHaFs4GOdvyjCEmX3r7mxcU4sV0Tca3wxOk5wEvZr44wOTXQf2Rgw7NrbjjnTTMbsZM7Z6Dis0L8nlIVjjKGwnqVjaWycv2m8HfwXcFJl91RNc8JwbU5UxElea2E5CmWA/sQbF+0H/fwa9pZZhIa/vSgtsZ78MDevBYvyC0KTpMPSCxl4nYbTYaAD5CQ0Q0ydPofmloWfYmCWjQGhBCPz5DWYdpu09vs1Bg6xH8JTk+nIYu2FKbYPTzIIOuDeALFxUVboCjIs0HhkrOvCN4nyl6BPa/SAZo17lYRdsgWWuXC4guXmlou5exoOxJyoT2eugCasFlOFsGx7Jqfr6mu1E5QXZLqkCUlKlcSN1X6naeLuQ7MZiQP+65+IxI80uGCxh4ravxCu3Y7VuwoAx8d89N3epYWFBEhwMOl3W/LDyrA4+NsEnV4Xim6Wl3/lrejr5lZE//b3A5TAhi5Bji1mt79xCEpau39utZcClVyc74SIwDpoeEE9aDGTxN/FGSQ8h3zsZ5va9H/2eJxfXVK60lzgqU6LDT6wadfJko1bTIQpMqD9dAUEQVH8QI72Yn4OMmqgd0so6r6R5sNyyqjyydEd8ujAMpwPC+hH53srSEmaaIS09CkuF3s+0bY92W4FOFj4C0joO1wiH7ZovpiHxrwDeOG3NG/1Uk8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUZhSHdVTkFBM1F0WkR0REN3TXQ3Rk5qWXZQUWw4OEV3VnZJUWVMbjMvSjRu?=
 =?utf-8?B?UVljTmEvUTRPUjR0SGRYYmFQb3NBb2Evb3hPMGQ0TkNwY2RjNzBkU0ZEMzVI?=
 =?utf-8?B?QW10czdCcmZVTmMrSXVFR050S2ljbUdVdUJZeWJReWloaG5TeDhMSyt1WnNi?=
 =?utf-8?B?ck5CUEJnQ0dmamVBZkNId1pTZ1N5dzhCKzd5cUFVZnZScktjWTBrZ0lDZFVY?=
 =?utf-8?B?eGFZYW9PbHdSQmR6eHVmT3FCVnlTVVJRTjM4OGdWMWsySHJpOWsvT0FEajRJ?=
 =?utf-8?B?cUJib013S1Nxd2p6M3pjUUxBc2xiVktSWmJuTE12S25jN2RsOWxrbFl6cmdF?=
 =?utf-8?B?c21DUkdLY1d5eVNaZGRVeDBjRFhCV2lQMUFHQnE0eGZobGQ4MzJxQWdzVERv?=
 =?utf-8?B?cUJ2M1dXeGpkZWpiZFhJalg3Ly8rWEJGVVc0TENSTTFobjJKcmZERHNIMUNG?=
 =?utf-8?B?bmpKRi9CUVlaRy9lajM1bk92aS9GVDFsaktCR1dVRlgvWkVMYW5lSkNWaHNU?=
 =?utf-8?B?dHovaS9jb21aMGNaODVHeFBRczJMZWtUV0p2UDVnRU1UOFJLeVlsNHFlUS90?=
 =?utf-8?B?UnY3cmN0UGVCT2RNR1lnWldxMnRNKzgyc1VpdmJrOUhBVlZSd2FzRi9udTdr?=
 =?utf-8?B?cnZ5RDRjK3VTUlFkcHFzbXZZajhkUTE3TngxeUZLNnMrdXV0UitxTWdwMUxi?=
 =?utf-8?B?cHVKZzk1QmJQRzIwT0FHT2xIcUZaU01QVGtMcnI5djBSYUZ0Y1Nub1pKdHYw?=
 =?utf-8?B?b1RVVnVyU3dvdW03RW1HQWtVWkRJek5KZ0ZhMDlWcS81eDV0d0NGS04xVXRp?=
 =?utf-8?B?MzlyRjdzM0xqeUhaUkVLTzc0NmZ5UC9sY2kwbmtoSG4rakM0bnhQUjdySkZu?=
 =?utf-8?B?aEo3RlZSWUJSdGM0SUZOaFlkMFMvd2MxcWVxSk45c25sNjVWYkxrelJJZU1o?=
 =?utf-8?B?MHNzcmVFZS9FMW5VSnFoNjFUa3RiOFdsdXRKalhOL1RVdEYxQjVGbnRsbEJI?=
 =?utf-8?B?YjV0M3JFK2d3TGdxdnZmelRJTi8yL3R0NHNrVlNoSENCRzBqdkxOZm5HV1dv?=
 =?utf-8?B?SWtiVFNXengyRnJuNWM1eC9iR2pkS3JkNnFzNDlGZ1pzcm9yU1R4eFBwVi9B?=
 =?utf-8?B?RVp5YXlmR1ozSU56U0JObjdrNjJSQXhMRUFZa3FnT0tsZk45TEowZDBPUURF?=
 =?utf-8?B?YWNNbW95UUtwRFNURkxXMFljQWN1K2ZsWnpGM3pNWCtTTnBRcUtDcGlKMlZJ?=
 =?utf-8?B?WGF6ZUdSZ1lSeTVUc3NsMzBMTlc2ZXp0cVVqOTBzMTVQUldWNkhLOEVkdUEz?=
 =?utf-8?B?c204L0xERlVraDBKNkc2Qk52MFZZVSt2NkwrNXRrcFBtN3lJQTFNUHJKWjVm?=
 =?utf-8?B?OHk5SDJwSmpMQjl3Vk56U2RFYjlQRmk5M2lVVVZIZEFFRUJVQS9xTGt3K1E2?=
 =?utf-8?B?N1hJejB0aHNqSjYySlQzSmsxcXMzbzBTRWVMcjN4bkMvL0tnTjRtbFZRU0NT?=
 =?utf-8?B?emFzWUd3RGJxU2MvRHg4ODBVK3doQUduTXRjSzVmbjEyS2t5N1lVc0p0a3pm?=
 =?utf-8?B?M25FRTdDdDhQdnIxN09oaFJab2x3TExEVENxTWt1Sm5sWTZiVTZWRjF0TVI3?=
 =?utf-8?B?NnlvMXpiWjNnS0xxNVUrcWY2dlpHOG1heFliOElaM3VEQ1J1cGdSM0cxWnVC?=
 =?utf-8?B?M2hjbXp6YlVkNTN6UjNSelNsdm81bEp2dEQxN21yV2lONG9rdlVzVU1ScW9a?=
 =?utf-8?B?YmFSWnh0NEw2amlPVFJ5dS9VcHh4cEEzR2trd0krRlBDdU1YZ0gvZy9DQnpG?=
 =?utf-8?B?S1ZiMGJOcG1XQk9Fc3N6RzJnM0ZxT1djTmVuN3k0VHQ0QzBiL2hKaEwyTnd4?=
 =?utf-8?B?MU4xLzNCUUhRRXFHUnRmVFB3RzZmWWllQUpQenFNbFZQaEw1YUNIRWFVSkZN?=
 =?utf-8?B?WVBhZDY3RENuMlJTMi9SMjNsaDF3YlRTaTd6UGJhMUZIei9LNVVMaVFzZ3RM?=
 =?utf-8?B?eWcvc3d5Nkc4TUJEQ3lqbU40WUl0NEJ1bCthNy9YUlRvWjZUNHVQUkVyYjRL?=
 =?utf-8?B?MXZoSkE0L3Q0SWFucjZDYzFJT1lCVmMwTVJSUmlUWjcvOEtzTlE1b3pxcTF1?=
 =?utf-8?B?VjU1YmtQcmY5UHdQZGxXOW1VTjVqYVdZL21iYlJSd01idHU0NmpKR3pxbUFF?=
 =?utf-8?B?Yk5zM2phRWNTV2NHY2NXT05PcVBPVlMzbWtLNUJiNzkwTkRGbnJyV0M3dXJr?=
 =?utf-8?B?KzYvanNOVW1sMm84SjIvbmMrRms3OXpxeWszWG9OaVpWdjJkcHBSMUxoRXNs?=
 =?utf-8?B?VEdzeVVhVnlxM0JieExpcDhWSW1nMnpuc1ZYWEJ0WGF6SGJOWkxMYzN1c1dH?=
 =?utf-8?Q?IxVbZt4rG15PyfgzfPq6JPtdxxNkkwuJfJI/OtmltJXjy?=
X-MS-Exchange-AntiSpam-MessageData-1: GtrErNXB7QAI3a8O2zdM+s6DTQyJLw9rAIs=
X-Exchange-RoutingPolicyChecked: PwqlUnwEcM9TEYVtkB/lIRJIltkar6um6gxrWH+Vk8IB4+QTwVLWa/+AiTtm0K0P2P7hJJZ25hv26uYnW+lXEb//4ZMLNITYMpd25wVpIZhuChvxHHWhqmBOwpbOw44YchdArjedOs6kxRrp/nz0kOkubn+GhmQilnJV4R3giXP6EZ8pWZxJ0dizX3+Jblgm7Grir5EaDAoLLz7sNAJHvlHI/1Nl+FjU0HVXqsprQLPP9bH6tg8usesVKrsaGRy+57sl7PKhNHhkzSSR+wo4Jv1clPJaM1Oq+1GXsigwf34+JzsytAhaOTWygqFIgF9L22O+IDSy6mABSQ5cj0CQXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8aa0df-b99d-470c-ee2d-08ded9461de4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:00:30.6769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IlrMn1dkDNMrbt8TuTGpSBHWd75ScbcJeQIfFyRAm7WcJj3fK1AfXDVBoAJ2azswaJt9r1hzm39kS2DddJshZboROrUPoGJURldnAcn2Ndw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8107
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

On 2026-07-03 at 16:28:46 GMT, Sebastian Brzezinka wrote:
> intel_gpu_frequency needs only intel_gen/devid helpers and a DRM device
> opener to query the GPU frequency.  Link it against lib_igt_chipset for
> the devid helpers and lib_igt_drm_stub for driver detection and device
> opening, instead of the full libigt.so stack.
> 
> ldd before: 35  (ldd intel_gpu_frequency | wc -l)
> ldd after:   5  (ldd intel_gpu_frequency | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 53aa31056..01400f53e 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -23,7 +23,6 @@ tools_progs = [
>  	'intel_dump_decode',
>  	'intel_error_decode',
>  	'intel_forcewaked',
> -	'intel_gpu_frequency',
>  	'intel_framebuffer_dump',
>  	'intel_gpu_time',
>  	'intel_gtt',
> @@ -66,6 +65,11 @@ executable('intel_firmware_decode', 'intel_firmware_decode.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_gpu_frequency', 'intel_gpu_frequency.c',
> +	   dependencies : [lib_igt_chipset, lib_igt_tools_stub, lib_igt_drm_stub],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
