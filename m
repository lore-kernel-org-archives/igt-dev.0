Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3469ECE579
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 15:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10E310E5C6;
	Mon,  9 Sep 2024 15:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbB07hZp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C1110E5D0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2024 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725897446; x=1757433446;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=h8tc+EZDXJT8YUcWFLykeu+LKVZ9A9Ig7VTon7ETa98=;
 b=GbB07hZp2+WQwftjuttFQeRFcjFG+GemKY1IS+UdIJNCL/BDhFQtQ612
 QLTCJd7QAUlxjjZsU1AuTflYvC97xiqfxbyubNhmJREHeS4+69fxAN6mp
 jGrou+gIeG75SI3QRFhSad5OztqczfmBhQgDx/6bF+S8IBDJQzMWFr5U2
 OuSz0LI8H+Am89nrbddi2JQ0xpAyRj5ulfTLGCWSovUwOBUsqHt1Dsh0z
 5RBsXdUJyUKbRYXm34eURm0Fj/MzwEkskaD0R9fcmdKik6dGtvbvC3wSE
 roYg9dLUiv+N1koYQbhaRcWABeGzs7WIi2bxq0CP1Esti2YUEx/aVWqB0 A==;
X-CSE-ConnectionGUID: jraEbCC4Rl2teGDT6P2YaQ==
X-CSE-MsgGUID: VRWeUXm7TCaFrssmUlipuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42080240"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="42080240"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 08:57:24 -0700
X-CSE-ConnectionGUID: KLUBGi30Rqqv28VIyS1hoQ==
X-CSE-MsgGUID: /Ib4fLlsTQqmtON9NueKqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="66964000"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 08:57:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 08:57:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 08:57:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 08:57:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 08:57:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USGcUyGtUz2FSryntM+fSoqrk1E0JaBxM8k7n6JvUG/RO4cQOCT2f1VYGbEofM6He98o3+z12bFPPBywsy2LH0sn0A7n1lAyRBXLEBlrS6SyYegFqYAZNOcjhThAy0MHV1wJPMvQZ3gt959VOpfb2dDeg5jG8o7H1IECDmlAmD+TDEuwe80DQMi4+1Cwa7S27o72HlR2T9ushbPM76C1aGXXwyxXGNy0NqO0MT7qtvw2YZXWa3bjgBe4f4h65bX5EGgBFBvrfL4ZfRXor4bcxPUcBb3IjhVfy/ysf8NSssXlFteqHKWOjSKMXikESmCiLlHvpcjLIxELyUVS3NJ3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsQE5lUaQBBQ0xBVywyixoXcAcUPFotT3NTOkVqukdU=;
 b=gnz+A2BaQktI+lqZlHyZUlPqxwVlhbvJtPkQQlvT/0u4M2Buy9jfzFYc4Vz+I4fcTzllJXBQrIn2RovmDjy0mw97Vh+IQsfS2WSFyDKVHl5Rjz5r6ewiGh2BdBtkI/rA/Hsd8Ch2G7AxuFvCtpZ0DFYrbM1kKJ+ArKd5mVn6bC0ER3DFN4OHA8TEFExe20jNFchezWEx9yWAeohWyMxRnVZ60Dy61NVi54IR89BhjsxCamjZqFrwZFZ8V654XCAz/WoPoJH7mUXSKTAnd+kVpAwDdM/jm17+A9EBGGVmwwtvp0ZX46xyauGZwAG3jXUPOvp9sxbsO/hG66HfnbxONQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Mon, 9 Sep
 2024 15:56:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 15:56:58 +0000
Date: Mon, 9 Sep 2024 10:56:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@igalia.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH i-g-t] lib/igt_drm_fdinfo: Handle (somewhat) amdgpu
 memory stats
Message-ID: <dfdzw4smlw5vxflg3kitvksd4lsedlvgksyooz2cnpkrznqqwa@5z2qwfywngss>
References: <20240904155919.74744-1-tursulin@igalia.com>
 <g4g7g32mqlhpz34j3u4mztsdjgmimne3srcwipw72y542mkweu@44rhdzyauoxa>
 <20240909152758.4ye4sbd7zgzmttgh@kamilkon-DESK.igk.intel.com>
 <f07b3e40-f878-452e-89b8-bc376bdf32e1@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f07b3e40-f878-452e-89b8-bc376bdf32e1@igalia.com>
X-ClientProxiedBy: MW4PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:303:8e::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4803:EE_
X-MS-Office365-Filtering-Correlation-Id: a5bef08c-fafe-44b4-863b-08dcd0e80954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cJ/VekiewNK2sg/zUQ9OipEJVVuFHfmnO+K8Dx3s6KBARXyHI8J6e082oE?=
 =?iso-8859-1?Q?FXIpzeeM0tX70kcJ8cdQnRybZK0b/3XFNVCGpVY+imTz/23w5H3KznbCLU?=
 =?iso-8859-1?Q?77hNhtXWsp0RtTxF15mS8lAU80ftaScaNieDHGnChGTlPFSFm1++3plqbx?=
 =?iso-8859-1?Q?ztwpLUchG48f5o24hfyhCFPhpUNBnAnszoYTBZTODbVVBQgjUZMmueaQ/a?=
 =?iso-8859-1?Q?sH050C5ujiXrHvpo4YMAH04QgutSDDSY66rcglbP9Np842mbpCWZRzl1s2?=
 =?iso-8859-1?Q?xnBNPQroRfhGPbTov6ZV2F60Bk7OnwTfbTozmlbaErtlKOodjN6m2vILBX?=
 =?iso-8859-1?Q?YrMpN1R+2anIrKGhGdrMH8gBPIv6Tqa5Cj80SERVM6eTlzi89JqmTxkPLC?=
 =?iso-8859-1?Q?sBC0pvGsiZUpLAHutqmHfXhkBC/2KF2pNVZVBdlrr7GThencN1vPzOn9gj?=
 =?iso-8859-1?Q?VEU8nNhdOsDfR2M/Ji9fs9cDgV3raUfo/i/ojAvYsImMl3zED8GJuXgh4M?=
 =?iso-8859-1?Q?khWD/A2GQHNWZos+sg73rYRjhQgMu8LLxZUmtopHjT0ixf+kmrpl/jjHaP?=
 =?iso-8859-1?Q?gCdgFyp9UA2Ie0MiaxaZ7fDicldXYLR+JlumallrJggGEJVWNnbbENY4nO?=
 =?iso-8859-1?Q?ZsXXLYdDswIa9XJmb/5B9QavXOd1ntrXntLSIqoyeJ+Y4tojhYN3RGZVXP?=
 =?iso-8859-1?Q?M1vps5zWEiwTVlc6jade7dCab6Arz7PR+FCxrLgHUCMAYVEBysdFGN+cMG?=
 =?iso-8859-1?Q?WjYl1b8ehmoLWxu2MeHvnzN+wpT/zmZwhYKwutA5ba1CzIwe26OoQ+oQ9/?=
 =?iso-8859-1?Q?CQTvcTyZn1uJAFvEvc+pPnyi2lMRglMHsFio3UDtiFN35YrwLlYwX/OyYu?=
 =?iso-8859-1?Q?H11gIDcvsuAiRqRiU4HWgrCYUfuPev9vQ1uVewoq96CjHc6nyGsgh693NF?=
 =?iso-8859-1?Q?w+B6x2AXUJObEliRWAmumTiWWjdP+oo9DQW6G7Cz5PB50vDmeu8Xo6MDXU?=
 =?iso-8859-1?Q?LuNwujZ2h0qNNe2J5EUDD/vTZKSfURmdkL4PQRfmwNZwAelH83AuokWkG4?=
 =?iso-8859-1?Q?2LDLlN5GHTiAw7qFZ8GVvRK4RbYUoxGc8iLqHCBJrDHZkKYEBmrrNqMRcf?=
 =?iso-8859-1?Q?iNLI/Qn/1XYo5UsocgVrh360Ff/40hsFQirJLN65PkjB71/kZzOnoKDl72?=
 =?iso-8859-1?Q?sr4tQ2MUygJwCva8w5Uhvu2bDd2o3zBAZwm8RRjIqlgQNNqidRM0oqVMX8?=
 =?iso-8859-1?Q?eLKcds0hsykZJefb6HNFzTjPwwucG8KqLQ94EQIHObPUp7CMQ+RF0x/KHV?=
 =?iso-8859-1?Q?nRKNVIoIa7CG4uId4ReAespoWe1fv8Ke9rWwDdlqEVBrzR2XCIDMflXdzZ?=
 =?iso-8859-1?Q?29aFMZrPanUqRN2AJEazkBwtEyZtBUgDXU5Jx7fS2GIzR3XLdV0Lw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sfUiIeJZhzBG9DPo4LK8mvVnoIoF5JAmZNfystgmDvU9nElxZKtK9gVKGz?=
 =?iso-8859-1?Q?xC3vNJKbUsrf7VwsD4o2bHDpkzTFGWB6An2xk0vsarLzudP9mWfCo87cBn?=
 =?iso-8859-1?Q?tj5nzzAEOmh2e27HxoV06bUqGCgucJpDyt9u6vvF1Eqo08QjOpReG4ivKU?=
 =?iso-8859-1?Q?g9iJmlc0zOEzYQQL6Wp17UDkyCU79LAHsKgwiBPO6VQOgp108pOkY2tAzB?=
 =?iso-8859-1?Q?6/9uA62rghVv3ZvhTr4mw1TXhx/KVUaNczAKvfCjh5cKEpaSNbaRDtbAf3?=
 =?iso-8859-1?Q?YcYy+zP3vmyP8xYLOpFReSinveOs7ZQXoRjDCTH75U1bOlR6WzT+o0+TKE?=
 =?iso-8859-1?Q?jOJmimlB9hfzoQDSM8FbkrJgFOERdtlc2zWAXDFXQS+ObnW2RaEetgJQPr?=
 =?iso-8859-1?Q?UkKEJmE0Q3to9amCtAZhxkoU1GZ7Ikc1bLbpNroSDA5gn749y6alT8MBZJ?=
 =?iso-8859-1?Q?/vRyl65QmHeXg5YCNmJiVfY+ktalObv1j/RtozZI1HFTE3KeMp4qHN1CHD?=
 =?iso-8859-1?Q?TmKzjrJdLJ4eP9mqoQrlrkRYWPQcm+TH/3s6MlwCWlonN577nxs/R4cEIy?=
 =?iso-8859-1?Q?YNyedtgHYCp1JnrOnOP+lFo8oYBVLkLxWZa2pFOGwpNRNzkgCR6bblZVcx?=
 =?iso-8859-1?Q?69u9+nri5XBy/lp0bgbp4GTGRZFqrPgDEtPbytWZibHBSBqr07mUvo04vr?=
 =?iso-8859-1?Q?RfLQSB28KXkmlzyXmICwlNXgO5KFomIt2m0/zcqFO/BuOkhJFsNQK8DPA6?=
 =?iso-8859-1?Q?KrwruyiRBSOrPlBLeAtdTL3zflUTuoS2IhdSK7YZmiTQPtioQ2JTU3+frF?=
 =?iso-8859-1?Q?gfGIKmyorsLUrUURn8vgfzwYTs0Pw0qpZw6RGWanjppqwX9HL4JRbFsWE9?=
 =?iso-8859-1?Q?8+Relb2lO6TtjDjLiICcmoRzRyTbWj1kjGfd58/XjxSkNuR5xHJWmPG3Av?=
 =?iso-8859-1?Q?+ke+fVPIKDqXfqq8BLQtRkv/7ePLGG3TbjNnoxlSMTbBSMebQbduO2iRec?=
 =?iso-8859-1?Q?0peDg51ycvyFpYnZBrj8dYK8bCM5H3NnLFGuKbDoWjlThX0yjWiBb3m6CM?=
 =?iso-8859-1?Q?Rc9KvKJjtvW1+S6Pam8tSAeB3JCRC8Ttu+cnQ6+paQaDDE1bdlWPqlDELq?=
 =?iso-8859-1?Q?EBehHYM9ZKQTCOaNlFTsVZJu3mgtVzWV8G1VeayU6CzquWMd1NfY/kQiQ1?=
 =?iso-8859-1?Q?dfWiMtutEq388Fn9Vmap/V1dmOHYrPPMnWtnBHoov85NUXV24+/8l2JPor?=
 =?iso-8859-1?Q?TiiP9rIMyVRGopMozvgQsl6b6vkCjv79llRip+Y58/VIoDvijU6DYM5U+W?=
 =?iso-8859-1?Q?4ez2eqQMykPqvWOzvXYSDo+sk94ctGz5lE8FUNOw96tL142J+UQHdybcHA?=
 =?iso-8859-1?Q?0Y91HthSY5TBAOAt2QEzSt5Sii7I3asy0FdWpbK/Pa6QCoiOT4i+V/9jJ/?=
 =?iso-8859-1?Q?SjjOEaYWiKN/WO/BsFyOld+L1Sb3E0neBcKNntq6qlsh2dGtVumgetBkn7?=
 =?iso-8859-1?Q?Lff0FMI4yoQWmbf0ucIvNvTD+6BBjjX9+FxaMd7qFtUAVO57amt2kmVpR9?=
 =?iso-8859-1?Q?0MktQvMcVtg+ZB4SJ4bTiFtm4CIwKVonk3jtg8s/ANb/Tsrjc1ptxXlJ/I?=
 =?iso-8859-1?Q?31yJX2xbYd6aPWnewZoYzyCx2l4u5E1LOlR/9QZVk6hhdCkTMavTkJAQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5bef08c-fafe-44b4-863b-08dcd0e80954
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 15:56:58.8874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qiRl4B49x+v1tQMOYSQo9WcGSTwZAZpxYRygYxzMRrDDcTgKQ5oTnQUDd6trODV1ijQdeH6lXXDFPnPKAndEXk6205hOlAuGPWq9ZzCkMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
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

On Mon, Sep 09, 2024 at 04:38:31PM GMT, Tvrtko Ursulin wrote:
>
>On 09/09/2024 16:27, Kamil Konieczny wrote:
>>Hi Lucas,
>>On 2024-09-05 at 07:55:14 -0500, Lucas De Marchi wrote:
>>>On Wed, Sep 04, 2024 at 04:59:19PM GMT, Tvrtko Ursulin wrote:
>>>>From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>>Code so far only handles the clients using the common DRM helper.
>>>>
>>>>Handle the amdgpu driver which uses a slightly different set of keys. More
>>>>specifically, outputs drm-memory-<region> instead of drm-resident-<region>.
>>>>
>>>>With this added gputop starts showing resident memory usage for amdgpu.
>>>>
>>>>v2:
>>>>* Semantics of amdgpu drm-memory- are like resident, not total.
>>>>
>>>>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>Cc: Christian König <christian.koenig@amd.com>
>>>>Cc: Rob Clark <robdclark@chromium.org>
>>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> # v1
>>>
>>>my r-b stands.
>>>
>>>Lucas De Marchi
>>
>>Could you look into a regression reported for XeFULL:
>>
>>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
>>
>>https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11696/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
>
>Me? I am not well equipped for that. But I strongly doubt it is 
>related since this patch only adds parsing of drm-memory- and this IGT 
>appears to have failed on an engine busyness test.

I just replied with more details and agree it's not related to your
changes.

Lucas De Marchi
