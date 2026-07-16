Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89A4C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 13:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8975A10F314;
	Thu, 16 Jul 2026 13:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2UGabC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B0D10F31E
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 13:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784208873; x=1815744873;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mkr70v/4gG2NiL/5iY/Igh540mVAvV39y8z90eRGL9A=;
 b=V2UGabC178+f8v3ETIhjSAM2jJR4rbkNCR+XKfV8rL0gRUq7kkTolIhb
 V02/Lf+XvSdESKdOmJrF71HLw4lmWG4eML0gHziKRJV6dj+V01eiFKZOj
 sPKyVgT4jhYgOOVhfGn8olpH16yevfhrawkfsPKHde+UadH0FGbcMz9w5
 FflAhK8ouyCegLxpzbJDsGcJy/9zbhT/2HRIKnUvCHr7KLoRmpnuakT6r
 UW93dXr0JrcG/KW4WvvlKhI/tH0evD6a8i6BOP0toWBDGhjIQb8/DG2Zd
 pGe0KJ6cGwg+7PZ5hQM2r4JqOOABrzHgO5x7z/m6le4uguE98c04WYT9r Q==;
X-CSE-ConnectionGUID: fRQXYbyWRAqGWbGNrhiTJA==
X-CSE-MsgGUID: K4qviWKkQQSIDuuGuOr1AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96235991"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="96235991"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 06:34:32 -0700
X-CSE-ConnectionGUID: FBXK3x0KRuC84zfqmDHoqQ==
X-CSE-MsgGUID: k2ehGxhRRiuX80abmsOQow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="254760085"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 06:34:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 06:34:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 06:34:31 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 06:34:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUuigyrorrSIX0ATWh3Linyzgv1OIZIC43dLPcy+gRKo7kICCKZuyysn6TKaUAXp8W4CsdIwPWhfBF9zh3DCwQ1Nuw9wFvkVOcuaqIgTD39kvPgBqfcXKoLpvzWANnAu/+1EBf4RZp3N4UXPh+PmnuPShO27d+hkgU08+/1z3qyXjpX8L1y1eIS3jt/xjScFVaB2zDDs98+QMoodsqbc/TFearU5AV76+tQwGnV5HSYqqkNy92iq3XwSDXanrouGpOiMeq5E7cj7W1EeIZEXnlOj73peKjCQI+FqECVdlb0yJfTnLEH//DiBf6pIWn1wfdmOpc7Tr1Fp+3YUkcVk6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6Rj2nzN0Lu7VQlfQSWWHafhqAASqA80SBfCpAUoEVM=;
 b=WWxHWOVWiV1LgO6u50ZgXG7QGxS0T01MYHZAD8WmSKHP9SWW+mHPfCSjG/B65wHg71SBPESOVt+GAPmLDOlQzcfKGIJO1ChMJvNbVmt1jVU88z1HaCIZzERLG3vVxPox+VbJ5ijQBVJZYZIqXagrhVIo0N5ohp323UM2no3rVUuoak3hl6HG8rmnEdJ6p/MqSYHbmxwl+0M5UiHzW+bLgqIOcutKdWznNwKG7dDWHNRA+Qzjp/lj1Nvx1Wn6r8n2f3PYnfVh/tQHU2Hlmv7WRtmk0SFnioihUtagHf26+n4MfsgfPWzJ/3K39ZxlXOwGgHeUSE9VJ4ZNcIlZOpSn6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SA2PR11MB5212.namprd11.prod.outlook.com (2603:10b6:806:114::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 13:34:28 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 13:34:28 +0000
Date: Thu, 16 Jul 2026 13:34:16 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 13/31] tools/intel_gpu_frequency: link with
 minimal sub-libraries
Message-ID: <dp4xsy32ofjrxwuoxsqtcniunvgoeeg5b6gbqbxtgheude2qqo@2thpee36g2p5>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <e70c0920805053f3255a1a1a3784b76958aa895d.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <e70c0920805053f3255a1a1a3784b76958aa895d.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::12) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SA2PR11MB5212:EE_
X-MS-Office365-Filtering-Correlation-Id: 52605482-6c2d-43ed-0b77-08dee33ef56e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|4143699003|6133799003|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: MbHTU7dcQLGaZL9BJO8hNkkL7q54ryv9d4+I45cTq0mxfyzRupri8gng9BqXO2DVrAc/MYn/ErE3vE06MWT9eoAg9DBJ9BYKRoc03MHaRqefM7/2m9Gz+vPI6J+XfOTQjnTCQyg/le1ro4DeNyYBw759eVhh3L/fkMGrHW1C3wJFlhFxvVrIUOxOY7DUD9eC6WNB5rdepAOiBDRCSib4ZPIzvxahIPHKlxy2IizXvzpVxsFK94ALZRo1VqeU+9q46I39wSljaeS0+PpUSX+peDoslHG6wNQO3KAV1rgTbFzTJmDdgTCECrTidaP5QOBAEyhUiN0Lg4bLbVU2/JdC0eOoybXkfBKnWGBk8Ob4Vk8OvXvGLyNVp8Z33DAULVGmJpzC4wMAzYGtAR9bS75gcj/7xrDAO2TDlJin9NGiXpbr9qCZ20ilegjKIVWTPMUE7NwvbYeLneKT3zXulfDFc+VnrFOXIg3HMrunRvGW4F71SRuNdCTDxf3u5eQDFYhEUWVhdWW9OXh0Dt+fT5dUNjk4BrvcK4HaL6KAicupevvTvlLodtk4sj3/NEeVDgu1WW6q+uuz91CK2Cy0UhChU1SPPmHYgCNlSPiX2jD5f5BEdkahxGAqFBwioW4fplUiusH8pVYGd8JLo2cGEef7pLYStLgvJawSwzBBkFO7frQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1E1S2ZpNXFnZ1FYUnFxWkZ3NXZld1pqMzFPbkVjeWI3bE5PZTlxK2w4bHRw?=
 =?utf-8?B?WlE3VTUwODVOSmdoeGFBbUM2WUpibTNHODd4bGpXMThyK3IxR29BaTdIZnVl?=
 =?utf-8?B?b3FhMzdieExkdHNjSkhXdXFZcy9NZmlTTTRTamRReks0dlBMYWtYcndyeFJx?=
 =?utf-8?B?bnYrNmljbnAwQ0xXTmxuM1ROOUozN2JSRENxQVA4OStqSTBxa3VReW5lZDl0?=
 =?utf-8?B?bXNjZDdCNTRmVlFtM0w0YkxCeXpEWDdQWnhIV2srVk01OXRlYnhpem12K29R?=
 =?utf-8?B?ZUF4Y3plVDRBdnA0RnkyYUF3UFpLMEhLV1cyWFczUytKdjdEZkdicGlmMit3?=
 =?utf-8?B?aW44bjV3cWhpZTM4N083S2lxZWZ2RklVK2krK2NMYmZlaEwveXJVUFpjQm5D?=
 =?utf-8?B?V3JJUFZsV0oyYlR4cnZzUGlVMlY5ZHZ6OVRSb2NJTzRsbEdnVjhrV0E0bEF3?=
 =?utf-8?B?YTlnMGlsRHNmeUlld2xlUDhleFRsS21GdDZYRUlxeEowVFlnNFBoc05qMnhp?=
 =?utf-8?B?TmFXNXZqWGxLU1VHSDJhdTBQWFYvYVF4eENkRkpRWkhrZEhQZElqcGJ3ekd5?=
 =?utf-8?B?cFRHQlR4OWtjd2Vma016elJreFdSNTdBUU4zZVBYYWFrbEZkWWN0eWhNdlNq?=
 =?utf-8?B?b0toNmFwa1ltVllkQmpvMVp3NlFHRzNrWExRM0RIeVB0ejFwWVh2a0lZbHNs?=
 =?utf-8?B?dnpFUGZoRWNYT09yQW1hUXdJdlU1bHJNZzYralNITU5xRExRTklTdUF4SWVz?=
 =?utf-8?B?c00zbFFYZ080b3JKRFcvTXV5eVpURWZXT0pEa3B2bVE1L0xobzU1QnV3aWRh?=
 =?utf-8?B?dWplUXJ3ZW1jZGpTbTdqOHpIL3gxWjRzTGduZnNicG1NWXEveVRVSGZjZ1Bp?=
 =?utf-8?B?WjRNdmdpZTZSeW5Bc3RyNmozeGRDbkMyRWNMYlpjSHh4Q2lVRHJBZk9ndnpt?=
 =?utf-8?B?a1VvSSsyQTd0NkYwN3lZVnJ1bjVuUndFZG5OU3BCQ1lJVTRkQ2p6eElrQnVB?=
 =?utf-8?B?SDNvc3UvNnZsMDEzdTZocS9ydUFSbVFzUU5kR0FtUW14WkZyMUU5OTlNcE9C?=
 =?utf-8?B?eHhWRXF3R1ZPVDBqbHFFUlBRRXN2Tld2Ly90N3llRHdBdnlyRmYyamlZa1ZK?=
 =?utf-8?B?UjFYeFoxNFBSb0RFcnhhMHNPMEN6UzNYNWE4dmlkQnVCcjZpMFdBVDFZTGlj?=
 =?utf-8?B?SGFhRmNPdk15NGorNml1cXBBdW5ldTJvM2tXQjhnNHhrRlRTaGlrR0ZxbkJh?=
 =?utf-8?B?V2tHdTVHaVdKQ3ZacHNLcmtXU0crSmJFRzhvekZJeXBlSmlMQ0d4bjRmWmFo?=
 =?utf-8?B?bC9nZUFPczNNNG5RdFAwZFVaMkVRNDE5clhDN0NKaHdHZnZ3RDlvdlZ6NVlv?=
 =?utf-8?B?Myt6eEJDYndQWFdIb0QveEFQZmp1VUVvSzZqTjNZdTJxR205Qy9UWGtBYy9E?=
 =?utf-8?B?Rm9YdVJkTm1ZMnRjOXdTODRVcDNJMS8yOWVKTmdNTzE0TE1XMDgzRVZqSzJN?=
 =?utf-8?B?YnAzTVdFbjd0Q25SZGFtQ1hlTzNYa3ZmTkZvZU1GazVubWhDdjViNW4xc2Fo?=
 =?utf-8?B?NjhPdW55Zm8zQlFhOXEzenFTSXB3WW5DVXlmcmkrL01ObnhCdzBpaER0dzNL?=
 =?utf-8?B?UitaVHJWRTBFMituNDdQVit2dlNoTmEvSndQZVgyODRsNzZQU1VFWklHbkNL?=
 =?utf-8?B?emFySWdrZE1RbnJlS00vUGVSM3NsVHh5eTEySEs2eUMyTG1TWlB0NGgxMlJs?=
 =?utf-8?B?bzRwMThRWDlSampUL0dKV3llTzJ6Q0pGWDBPamtCTmEwTHZhWVo0THdzTEJF?=
 =?utf-8?B?R042eVB5S0tWWDVKYytPbnhsU25iczg1N2VzalBkTkNaeXlVaUpjT285ZXpM?=
 =?utf-8?B?d2hmdXp2dGl0MjdTSUNaeDBTZjQzWndTUGZJMUtvN1BSd1FwY3FiNDk4emJ5?=
 =?utf-8?B?Z2VZRURwc0d1VC96SVZ2ZmlISnhkbHVFUkoxOU83cXJuQnY0NW9IbHk1eS9N?=
 =?utf-8?B?dU81VS9Db0lEYmRnbE1zekMxYnVVejlwbVBwOHNFK2xkMnlRN2lHSmJ5VS9j?=
 =?utf-8?B?QURLNjRwdVliVEYrNjhVaG4raVB5K1dBdXFveFdPUXc3YmNCKzczOVZYNDN6?=
 =?utf-8?B?Mlh4TExYYVp3WHV4SkIycWJqZjl0WmxwdDJDYkNGSXZ1cUc0OG41cDNNb3dF?=
 =?utf-8?B?K01kdVJkZ1hWMVlUVEZtNGgra05wREZIQWhPZGluN2pIWHlsUFRWZC9nMjhV?=
 =?utf-8?B?U2RBcTNDNHBnRUdRZzBteE9GdHMrYkdVcUZyeWI5ckFMbEtmYXdpSGNaY29o?=
 =?utf-8?B?RkMzTFp6ZUtMS0RGRHV2R2krSWhHYVdrWDljV1hpSE4wWWhLQ3M0WGsreGQ4?=
 =?utf-8?Q?kcRta4kZgs1xu/KA=3D?=
X-Exchange-RoutingPolicyChecked: bQ4EgDcHqsGOX8OTat9fJL2nqTHLWNbxuw3bWDCihjt416G/uZN5kCbEGb4bFui/PapD8RhkCHRvUoNt45Yb38iI1t9JhYh1UCCjb6NtIHgAoVSj+TOwZE+QqjmX/dO0B3/vYf2RoFPteqAIcNdM3UuJ+9UA0bOfCslxowFgAHLRh1JT3C6nsOVV+Vbqko5T93YkrX31Qo7vNpsup0uZXoS86ooBWyDwTAH6djC8HhwjA5FMYRBYSRVmImRMez7o9ktCdzw2Tn00rvKN4kVcW36bD7nWmOwNwpHA5GYsvv3323uJSwfcvb3Dycu+FdBvV4oWxVryMFoIR1X3KtNe7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 52605482-6c2d-43ed-0b77-08dee33ef56e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:34:28.0113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLOAWh8gI+b32DA3tI73TljJ7puAKklPQGpXKhlHuN5R76MJa9Ka3vFYlT7CcZTNinphWtKe2CL3FHmZWrbH054SloaWVZqfB8URjKTuM0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5212
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

Hi Sebastian,

On 2026-07-15 at 14:15:23 +0200, Sebastian Brzezinka wrote:
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
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
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
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
