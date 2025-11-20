Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3AECFA44A
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 22:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E6010E08A;
	Thu, 20 Nov 2025 22:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYq5fkt4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E898C10E08A
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 22:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763678157; x=1795214157;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GPb+T6JTaVzpdEJi6Qc1tWHXka5afe8+WwqFcg4oT2M=;
 b=GYq5fkt45oAZC04YgK2YP+mBsgbyEod74ehepfk/M10oWRLto5Ms6Ek+
 toOEtMqf751kWweW8T6EtFHgUf+WGdG+xr3TyICNvYZXfMDbvMJ5JG5hv
 DAqNqRcAuSr9zBH0U3rUbL10gAAvkD8VuUlFYn76ZWt34h5CEQk/uMPQz
 829Kc0fpiELTdv98FMSatHvQyzCvvIaEhuRFk1hb5Do6Kph15FxEpnIRA
 ODBS2EY2PcjKtQCrDUN6VHQtIEbOQYYAfa28yF8koivFu3KX1d2rmBY27
 KhFjSuFs7n5KnJ/Aujj17yPw9xsUVb476nbEb9K/sonB2zdcPfEV11kz7 w==;
X-CSE-ConnectionGUID: MPsKAn57TL6SFO8JnDEtvQ==
X-CSE-MsgGUID: M4m2oUYsTYSxtK76FbAhRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65795578"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65795578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 14:35:56 -0800
X-CSE-ConnectionGUID: gwckl4HESbSinC5Sa6DoCA==
X-CSE-MsgGUID: 352I4NN4R9qgBxVMukYU0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="190798171"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 14:35:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 14:35:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 14:35:56 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 14:35:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlLkOT0pbzpiYNP/pbv7MKu0pABAeo1HAQd3PVamVzPIetFqDVhwW6hD5xuUbZBev8OR/TLjLqte5mzyqjp1RZENEfAT149E6B0iEe64B1UWhSS11kkTxSm5WwZvJ/Wty9nyB23Rn8ZggwkNLivagXOfYoVBcpfqPD42lYQmVynbIa28715S3mHnDlXnc4Mkc/A9ZVhGNcV4rX2IR4y3kWuvDpgcUutntziuvuuzFnVzuLC0sIfgLvXmyqhR+ML+7JKoHLyYqM0sTr1dtPvyuqyQ7sKSTLTwzaE4XjbeSPrbBChn+nO9UuH0q4IbWx2URu2/75CsCjm6gUx8l/yyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jD5ZTifPE5krZcAiUp/EBoI9s05lQV1RM7To1Xah7pI=;
 b=cgd4O9FQDw66ef5S1BkL+2HI4jwpN50ISKZrv55tc+pfvcywKKlmd4/p0sdbXy7nIMfBQXC8la/IdhA3IscHVJKRXKMOUdS9bXsSlazl1lWb7WuGK4yMlueapmFbYZcmx9qOUc6UY1Vn+7qbewUfBxw0Fk1pBDt+ahtOEaGwUBy+qWgty3uWA7z1yKyBnwZh6nwj+s52Gc2rLX5+Us03Rf3A0fZhgqEO9GsO+HYRR5wB3lapyew6XFjIOA1vtB7Lk5De9fFx4SbvSrKnFITi4NmRmLmmybeo2UQTJHM9k4mrOrTa0zpuC+xWIlMkVGAzwzxmI6rnmmxZtsjHYOJQzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MW3PR11MB4745.namprd11.prod.outlook.com (2603:10b6:303:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 22:35:52 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 22:35:52 +0000
Date: Thu, 20 Nov 2025 14:35:49 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 07/18] tests/xe_exec_multi_queue: Add multiple placement
 test
Message-ID: <aR-XxXe33njob3Ia@nvishwa1-desk>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-8-niranjana.vishwanathapura@intel.com>
 <20251112175408.5v5262kluhmnxbue@kamilkon-DESK.igk.intel.com>
 <CH3PR11MB8434710EF04A9B8FECF075BA8DD4A@CH3PR11MB8434.namprd11.prod.outlook.com>
 <aR-SPYoEGUKE-ntZ@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aR-SPYoEGUKE-ntZ@nvishwa1-desk>
X-ClientProxiedBy: SJ0PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::24) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MW3PR11MB4745:EE_
X-MS-Office365-Filtering-Correlation-Id: f1fae678-d2f3-4cdf-4429-08de2885292c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SZ4XHKivBXKeCrPL7jAKXWEchlu8QYME4nnvvYEhyPIa7K4bWEJOJOjJw7BF?=
 =?us-ascii?Q?OIQPkyqRDSNMtu7MkxqEHgwApc9atlTSSEgaZHo5x3YZrkNCCJlY0grFxbyH?=
 =?us-ascii?Q?X7Ivff9FTG5ShVLd5hfxNrR4hJ2dEPQZJjLh26TxPsIUb7gJlemqERN7V36P?=
 =?us-ascii?Q?PFIgLRHmmdKNz3jq2HCaQfJk5ubpSvH4+VOUIXaSBu/VK4eIFbr4r2zUxIPq?=
 =?us-ascii?Q?5uOPNQBiO40kD4nEPzexEVmilWcIol5A1VVQGAKiGYKN+oDKnqkvaY7mFa+a?=
 =?us-ascii?Q?pTMD7fXsoAWgYoO5+HtlKdp5CTya9F8ZX8C15S+e5VLmmYwTRyduXm7lKgf4?=
 =?us-ascii?Q?/6ufh2nP+A8ng9dUjPPxTQOvQSbdcqPoknS1PZyqq+uFYxbVqPJzW5noHMS7?=
 =?us-ascii?Q?Fiv7M6db0d1t61Wt5RzlIBwLb7DrL9u4XThi2IvV60AdRYFWClPqvrS9NKbE?=
 =?us-ascii?Q?680SEsMCafg9UEXNlH6tUnU57qrVi/sP65d0SZ4iTegpa/ShdjQa+Y6CFvlu?=
 =?us-ascii?Q?uINJQSsZvyU3yGS0QsgY5TtkWSO6SNQQ1CFbwfBY4XnqHaaDzHfkdTuAGve5?=
 =?us-ascii?Q?krn7IA/flmlbohW5IdiVJTiXhHAsZb5MBg0VuEXL+NF8+2HQtawV6eRpIZFC?=
 =?us-ascii?Q?7e9BEdcLvm8tRiUF/mfnXB8PvC1K36U3KKAZwkm/W2sotzwyHlNdSQf99ZfL?=
 =?us-ascii?Q?6zx6Eqrxm+KF/+PH7mWqCqULvsbkOqeZbDEas6isOAqdo8TXroENoK9tkDEu?=
 =?us-ascii?Q?0HcpWryA/2sNKRvyiZgivhHO59wFAGki5pYA+mQGld4eXKCDNWhMkvPvQi/d?=
 =?us-ascii?Q?zqwa6wYG9nsuxRRzi2mwKmTQyeQg/U/RzfzorOhGobpKoNN5VRNog6tyDyvW?=
 =?us-ascii?Q?Pc2RwNi1QxQmf4wjZW1d6QmXr6gBa6XCzA/SNQ0sKCRzcfzNpCWFsdjg7PpI?=
 =?us-ascii?Q?6WQKisl6AelRc3EYnxYob+XtS+AMgXaEg8vYyl6AieCZkzvx/bAv9+ZgoDhG?=
 =?us-ascii?Q?6auVZW/4NGz1Z0GkCwIEqymOwbpIoPIWpE1sbCb9dtcEoKWbxZj5am0Dbini?=
 =?us-ascii?Q?IKrezctfp4ZGAod7VGcS5O3NKugTR1j8aK8NhmQNuxpE6iYh1G/+aYqXx2F3?=
 =?us-ascii?Q?Trx58XjJjE/y/AmgC2mUQgtwUbHhSlexI7emAiaeXwqL+ix+sB7rmuKNbjlO?=
 =?us-ascii?Q?WibHJoiCqNPMOPkpPhvtZEC6YD5J9SW9lMU6F1hRvQ4ACeBFYLzMk6Sb0Ep7?=
 =?us-ascii?Q?+uZHCKparvwlYJNs6Vvth9hD5EGEXLdUmNFrlEwmdTSEVBVjOjnrF5P0TkVj?=
 =?us-ascii?Q?YWslAgNkkvNOnalHn0F8HhIETQJnc5JkQXs2ACDx8H+f+QNpGvcuVFp3XADv?=
 =?us-ascii?Q?WI7SZrHcbky3YfOsVMPylgdWpALBe1WpgDzFRQrCz6oR4FJD5KpIw1dkv412?=
 =?us-ascii?Q?dckuCG9mPiNRLCPX4T8mn394jpNkiKn3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1fvtTRSiDJIgp5lK0ZVqJMo2KpsvNd0+5zsZwWHfplbk6/uJeNan1hnXi4aa?=
 =?us-ascii?Q?KjtQkwceKf6HwK8e8itgwQCyxOTzw8NwPFXcujilmmq1relQeOZG0Gijgo3N?=
 =?us-ascii?Q?l8MkDgGPInG/HlYnRjooAc0uM2XOBlE5cpEPY4zoCVojOMSS9vehuUwjvYkQ?=
 =?us-ascii?Q?cPuuJQtxgfl0Z5dMgKlN1HgG+GDpdnxfxVy9FZyjalYxm/4Ko00BrxUVyRef?=
 =?us-ascii?Q?RxZbioCNfP3GBl6liYsa1Epxg6tBVbskNiMDGe8RTIpMwkhONdeAuDO8GEi5?=
 =?us-ascii?Q?pSI7YCTzu3P/9tc2iO+9uecijFqtFr+BAAl+Wiw8sFgRp5NRmxQr1ZpM8pLX?=
 =?us-ascii?Q?MNez8Q+iYTLCK5IsH/O9dYURmNZkGabj/BYzYqSkRu9qjRX9ZGZWpEtQnVCS?=
 =?us-ascii?Q?3Ibo5CZZjq506TCAjKXTwG3CbR+TqS9PLVV7OBFIgFv609iZ00L/M1vM+rkX?=
 =?us-ascii?Q?p7Xwk072d/EjNUAfv8004emRp1KkbIIupn21MeWrVx+5g6pM9XgmBzdvD7DJ?=
 =?us-ascii?Q?z+HwjAYqqG8ubXXGg5v8pCtHtzW5da4Ry3vhAif7pGlZoZJhkyrlsOY++aFd?=
 =?us-ascii?Q?Vpdc57YGVyo+/5/VnJqNz7Pt0LBIKUm/X4CsrzBvcLaqm6I1a1vQTNq4Yare?=
 =?us-ascii?Q?n846dSKxfxQfI79dPn5oZY1t2HIWI1y9IzccPQiMNxEK4YfQWAzbnAubvlbB?=
 =?us-ascii?Q?J/fA+0GJk1Ww2rIB13V9W9NcnzSyu1egR1D0tVNTyAf5RkJm6gJ9vqSA0RNS?=
 =?us-ascii?Q?MKX8T0LQ0HTwLHsCs4+ShmfC120tkVuWmuSrIcpmYhnZOL4hzoJ1p4ePk/nc?=
 =?us-ascii?Q?1sh7uWVvgJXm8T96CW0f2VSWhuA0E5Gs4VpD/lFuewhcFO7dtk41FUBogoVc?=
 =?us-ascii?Q?cH7dnXO7Mu9qvU8lgO7lfqVobJodPHSAT29DST5mrJGzLG6c0jxVmjWvVRYY?=
 =?us-ascii?Q?Kz1AvSbYrGzpFKljtbB3dMtHg2FIIHFrQx2m5Za/96zzU50qjq5leSaAutXw?=
 =?us-ascii?Q?YOTbt2bpfT6G2JHmXkwNUi6d/G099NqbEtR8+tFNxN+gCEZuIi5ANR8S+zbh?=
 =?us-ascii?Q?6OWv4dx2ViGiJuHotJjzcNsD244AYeRtQCu3+iySUielnONtTup+RVXmw0UL?=
 =?us-ascii?Q?/1QAYo9lLt4cixxPSHDePrTD790u/sODGfAGwvJtrIHIZ6f2kN59eigPouyo?=
 =?us-ascii?Q?H3d0J/edl0ba6lE2/W1L+DmHzDqFVeiIsDLTe+sWKWhBhzxF/kjM79QOQMEf?=
 =?us-ascii?Q?tEskwDXsXx5S9aDX1evZnAHa3tD/BJonfwDN99YT+F2vrStMrMVMADv82YBs?=
 =?us-ascii?Q?enxnSHRwIHpeEkcA+QQTnbjZ/VYmwjK2x5elH7cJ5wVlUYxy3OcNKOpwhuj/?=
 =?us-ascii?Q?MVvU/otysaMaYzZXJ38VvIwK8CHPicoVkKE9USymb3UoT/0Sj6OfScygIQhO?=
 =?us-ascii?Q?KAE8QfHnsiwrAaHIQ8f68fmA3gfpvPEFtYWxlme3DGLKL43Qs7f6x8PQ/49q?=
 =?us-ascii?Q?ImtJ2SIZeg99GgL79dyjcvclCNhzj6Mf6/m5eb3lUEGzBkP8bAPvM+fYF4nv?=
 =?us-ascii?Q?zYwVrHsFPNvzI5yEBQolwyzpjrP612j5uJmvP6jDLDSYsWdEFMXMgCWvNzHz?=
 =?us-ascii?Q?zJWkx+0Qpb3CEdzZOD0h8/Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fae678-d2f3-4cdf-4429-08de2885292c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 22:35:52.3459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XYJ3U6Y6M503iAT/2mzG/x62bOMlauX9W+yejmh3WeB9MKutuggOe9AxvpF/DPeBIs+mwtdorM8Db+Y7sqEW6lWwCfX860+UO3l69qdjY1XnR3nvZay3wNyEGiZQV9w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4745
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

On Thu, Nov 20, 2025 at 02:12:13PM -0800, Niranjana Vishwanathapura wrote:
>On Wed, Nov 19, 2025 at 09:18:56PM -0800, Dandamudi, Priyanka wrote:
>>
>>
>>>-----Original Message-----
>>>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
>>>Konieczny
>>>Sent: 12 November 2025 11:24 PM
>>>To: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>>>Cc: igt-dev@lists.freedesktop.org
>>>Subject: Re: [PATCH 07/18] tests/xe_exec_multi_queue: Add multiple
>>>placement test
>>>
>>>Hi Niranjana,
>>>On 2025-10-31 at 11:35:44 -0700, Niranjana Vishwanathapura wrote:
>>>> Validate using virtual exec queues with multiple placements.
>>>
>>>Please add 'intel/' prefix after 'tests/', so subject will be:
>>>
>>>[PATCH 07/18] tests/intel/xe_exec_multi_queue: Add multiple placement test
>>>
>>>Also do it in all other 'tests/xe_...' patches.
>>>
>>>Regards,
>>>Kamil
>>>
>>>>
>>>> Signed-off-by: Niranjana Vishwanathapura
>>>> <niranjana.vishwanathapura@intel.com>
>>>> ---
>>>>  tests/intel/xe_exec_multi_queue.c | 30
>>>++++++++++++++++++++++++++++++
>>>>  1 file changed, 30 insertions(+)
>>>>
>>>> diff --git a/tests/intel/xe_exec_multi_queue.c
>>>> b/tests/intel/xe_exec_multi_queue.c
>>>> index c9ff25ffc..eb40e92d2 100644
>>>> --- a/tests/intel/xe_exec_multi_queue.c
>>>> +++ b/tests/intel/xe_exec_multi_queue.c
>>>> @@ -379,6 +379,31 @@ test_exec(int fd, struct
>>>drm_xe_engine_class_instance *eci, int num_placement,
>>>>  	test_legacy_mode(fd, eci, num_placement, n_exec_queues, n_execs,
>>>> flags);  }
>>>>
>>>> +/**
>>>> + * SUBTEST: virtual
>>>> + * Description: Validate virtual queues with multiple placements
>>>> + * Test category: functionality test
>>>> + */
>>>> +static void
>>>> +test_exec_virtual(int fd, int gt, int class) {
>>>> +	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
>>>> +	struct drm_xe_engine_class_instance *hwe;
>>>> +	int n = 0;
>>>> +
>>>> +	xe_for_each_engine(fd, hwe) {
>>>> +		if (hwe->engine_class != class || hwe->gt_id != gt)
>>>> +			continue;
>>>> +
>>>> +		eci[n++] = *hwe;
>>>> +	}
>>>> +
>>>> +	if (n < 2)
>>>> +		return;
>>If n < 2, test will pass successfully without running for virtual queues with multiple placements
>>Which is not expected, when condition is not met test should skip with reason something like igt_skip_on_f(n < 2, "Skipping test as number of queues is less to validate.\n");
>
>The virtual test is for multiple placements if there are more instances of an engine class exists.
>As the test runs for all engine classes, if one engine class doesn't have multiple instances,
>then we shouldn't skip the wole test.
>

But instead of simply returning here, let me make the test always run
event if there is only one instance of the engine class specified here.

Niranjana

>Niranjana
>
>>>> +
>>>> +	test_exec(fd, eci, n, n, n, 0);
>>>> +}
>>>> +
>>>>  igt_main
>>>>  {
>>>>  	struct drm_xe_engine_class_instance *hwe; @@ -404,6 +429,11 @@
>>>> igt_main
>>>>  			xe_for_each_multi_queue_engine_class(class)
>>>>  				test_sanity(fd, gt, class);
>>>>
>>>> +	igt_subtest_f("virtual")
>>>> +		xe_for_each_gt(fd, gt)
>>>> +			xe_for_each_multi_queue_engine_class(class)
>>>> +				test_exec_virtual(fd, gt, class);
>>>> +
>>>>  	for (const struct section *s = sections; s->name; s++) {
>>>>  		igt_subtest_f("one-queue-%s", s->name)
>>>>  			xe_for_each_multi_queue_engine(fd, hwe)
>>>> --
>>>> 2.43.0
>>>>
