Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF5FD7494F
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 00:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E98610E012;
	Wed, 30 Oct 2024 00:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLryFvr1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EFD10E012
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 00:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730246896; x=1761782896;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+4ZX1Ev/C11W3PJ6DSAPO88HxksiXYItzrbqlWkNVoc=;
 b=GLryFvr132Qk9dUnAxW9YZ+F3N4fUkcto/tNWeiOI4jZI0meXL3eXZCP
 9c+KTz77wivoues6zMGJPS+NohN+KRJIg6IuMGpmccN/WePQvCgAZsqkw
 iOy1wH1zTiyU5bMJheXVK1caXmqZ+9Ymr4CYlh6GG0wnZ7xeAr9CkGMN6
 C1IduobglPbZyXQQ1J6GuiN0+elPNaaKz/jogt5Hvna2jIhzFj0VDV2qB
 tL6NJWYdhua540Q5ZGWHJ4Xl5muZutq3occ3aPCf31Cc36mAoeAFRhs0s
 Zr64utHL8rxLsewf1i9rMe8LVdKwYn+LxuaH8vG6jE0XnRvcC5eq3jWwT A==;
X-CSE-ConnectionGUID: GUQzc/2iTf2o0FS3UKiMSg==
X-CSE-MsgGUID: D4kkZOs+ROi1dqfZlPvoiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29770959"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29770959"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 17:08:14 -0700
X-CSE-ConnectionGUID: iexfTW3nSTqEhAIAZTqiJg==
X-CSE-MsgGUID: 6q9ateKUSiSyUqz4soxa+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="105451893"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 17:08:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 17:08:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 17:08:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 17:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdH3qMPYQPbZXF9IM741G9ApujPTxH2IZ4pL1IMihlOFtwl7+GUOl1r7WHFbFRrP7+2H1PUU9Z0GbddW40zsu6SBm0Z0FKplJPpsuIm2CSH8Y3PFiRGkuT5OfytGCYkyirJ8vc5BFQcYALavTqkPXJwe35BdRqWTxUfpeg4xGYQER5CMJllBV3Vn3dLAuBIFOcWTSriJQ41EwQidFJuI4BN/x2GJwol8b3SFJ1ITNzrgZ3PzBNK/BmdTfSH2QNLflhKmkVpClIQ+PQlHROMhGfnFSCPafUIT2SH4r27m8LMUupa6w+FBJMpRdlUEJUzhHil+OYtOB/ns2HXGO6dxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtmNwRViMALhjAAz3B9xPCfbVbaiQYxawR2HbfZVAVY=;
 b=I1Hygs5LIe232EDP/0wTLtQiZqBkXn6e/nePmUqMAsVlYDEJkJ/hjIFW4p/z9OvbThIgFTwN7gnJ152799CToaUIRU8hP3K59Rf83RB5mQPS1CrOuLnBsnZn/scIOzrIW1VoA/4F+BF42g0qbydno25TJrrcV8GbVkSVNoWL1k77ACzpGUjPLe91QxinofdU6KfLpZg0/oJ0+/qx36YKz7goFbk9B/eXVpdsC6DJSX1i6KXx/UMgCCSptuOl4jlFeqse27FLb1RlSbsktN3fhSTG/qbJnATraZgApQRkB8dnf/WQdn1pQVL4E7df9iQ3Woo7Q0V9lBozRhUf60zDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB5264.namprd11.prod.outlook.com (2603:10b6:5:38b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 30 Oct
 2024 00:08:09 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8093.018; Wed, 30 Oct 2024
 00:08:09 +0000
Date: Tue, 29 Oct 2024 17:08:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kmod: Export igt_kmod_unbind()
Message-ID: <ZyF450skb7ukCuaw@orsosgc001>
References: <20241023050502.3049664-1-lucas.demarchi@intel.com>
 <20241023050502.3049664-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241023050502.3049664-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0166.namprd04.prod.outlook.com
 (2603:10b6:303:85::21) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d460841-fe0d-42e2-2535-08dcf876efcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R296VFF0UVlmaWZtdFdaYUJtcmxmMzJoVDM1bUpvSFJiYnFqNWFqcEsrV1Br?=
 =?utf-8?B?djIwY1JJV25JUHdaaGRsRGREYU5YWjJqc2ovQVpvbkNaZXdzNkZKTkhMbFdo?=
 =?utf-8?B?eTVWWnZUcXpuQjJtQmFWVzlOUjVKT0FKSTl2eExvVWc3cncxcXlnOWlLZjdp?=
 =?utf-8?B?YUVaZWQxcU52eE9PK2prR2RRRTE1TWpjV2M5dVQ0Q011Ky9wdnNyZE1FUi9O?=
 =?utf-8?B?Z2ZmS1RJOG5KZ1J3dUZyZGpVaS9iVXBScG81b1JtYnNXeElEVndOZ29aNFVz?=
 =?utf-8?B?U0tPUWs3QTQxM3BWSk8wR0IzclFXdmw4cTh1TnNsNU11a3phd2p1ZTRkNktG?=
 =?utf-8?B?bjJlc3lTNmtDbVVYakt3dFdLZjduVktnMnpobXdJUk41MnU5YnF1ajE0T3BK?=
 =?utf-8?B?TnJjeStiQUxpdmVxcXhKL0E2VWxzR1FocnM2VkVQdVBoREhRVktTcjJnNnlu?=
 =?utf-8?B?T1p6VlNOWkV6NUUxeDkvN3ZoU0JlVytuaHgwTkRiSDVWTHJTb2lDWitOWTZS?=
 =?utf-8?B?aEJjc29MeXpuQUtVbFJMaFZtaWtvcW0xUmhLTjdWUkpRNWQ3NVFEelNDZTQ2?=
 =?utf-8?B?ZmdJQTlXTVRYT0YyT1hjbXAwa2gvdFYrVi90VXlWaEhDTmtIekNjZk9kS0E4?=
 =?utf-8?B?dzRKSFE2akE0WTNLREZsNUdpL0lXWVlIYXN6K1RJTWlnRkhYQ0xiZTRWbTVI?=
 =?utf-8?B?UCtrTmN4WG56bkViRXBBSFVtUjRaZHg0Z0pSU2M3WXFBMlBVOE1vL2RsZmFU?=
 =?utf-8?B?QnpublcwQnB4RlduOHZ3NGtuWFRBNVpwdmZ3YTRZeEZ3N0JuZno3NkE0WHJQ?=
 =?utf-8?B?NUpUK3FWblVjVW9TYVo3dERabkUxY2tQN1VheEF6WC9pbGlPODhmRFlZZTNT?=
 =?utf-8?B?MFIwNjRBbFpIcnFoTmZVMmNvaDR4RVdydUJpODJwaEtTQ1VHN3FlR2l3QjhP?=
 =?utf-8?B?RmRYd29SbnRnNkIvbncwUFlzWjBiTUNPZkltUkU3SC9QL3ljUCs0bktkcFZW?=
 =?utf-8?B?S3EzWFRERmNOU1cycGFBdFVramduWlB3OHhNOGNIRGF5ZVY2MmpBWWNSSll2?=
 =?utf-8?B?WkYyUTFlbGVvYXhycTlOZjkyVlBlZW9FcllLbmhMbTcwTXR0L0VJS3ljdjR1?=
 =?utf-8?B?TGREb2VZU240M1Vaa0VrMmpYMloyRkg2bjVKT21WckpBQW9UUjlOM3FZRDFB?=
 =?utf-8?B?dWdlQ3NteTA4UTFnQ0ZaS1ZMbjZSTExMdURlM2cwMWdzR3VzTGN0d2FtQ1FT?=
 =?utf-8?B?cmVRYzNwMGFzWE1wdFNqNzlmWjIxaHA4Uzl0Um9XeWEvNnRib0M0enFpdGFP?=
 =?utf-8?B?THZkUXA3QUl1ZVlKSFVvZzczTW1nV1E1cDNOS2tsUFJWTW9zelQ1T0lhSGlW?=
 =?utf-8?B?akNJVmVYMG96MkQrNmNlb1plQmdzbHRNOC8rTExXYW1UeXJueHA1cnBZZnlM?=
 =?utf-8?B?aVIwbXhUT3k3bzY1Q1QzZnBubzk0UTFyWG5WemJ6NklqeUJwcTBNYWpLeUxs?=
 =?utf-8?B?WTNsRElaMmVSTjBUS0ozUmdldVUzTHBFY3pBS3d2WVk1Y2hwZjhnMFpFcnJG?=
 =?utf-8?B?UEtZRzhWaW11RytkYUw1SWRySU5SOW1mdjZpNlJSRVhOdkNlSFJPaUFuak9q?=
 =?utf-8?B?QmlBdndKQTFPVWlRMkoydUJzMFZBMlpWSlhLSFdVSlJGbDJtWCs4V3J2ZWps?=
 =?utf-8?B?YlFsemVZZHVVTGdObVZkYzdsWXpvZHhycEU5THhrcWNwblUvNzRrZkQ1T1l6?=
 =?utf-8?Q?M3dbNHLpIJxx5Y4ZHlBStkYPC23el6ycv61jdRT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wlk2aGlQMThZRkJCWDNUNEZJckNKQnIvc0RiUzZWQ2JJVjBlQkRjMjB3c0c2?=
 =?utf-8?B?MzlqeSs4MjZrUVNGdUZRYm4wZVQ4c2FRWGh2eDY4d0JUS0lnSHZjWnBabWZR?=
 =?utf-8?B?UVVseCtnaWZDYTA0YXkwN2N0b0VON3ZycWRJMGovaGI4cVdCTlVqRG1QUnZv?=
 =?utf-8?B?UmthSXNnUHhMNWdJamJRZkhvaUt6SkxlK3luRDNBMFZVT3NUYXBEeWYxUEF4?=
 =?utf-8?B?VEZxNENRNHhNcjhwbTZGM1RocnFrVERFK0Q4SUhta1ZSQTh3eDFaeTZZTVN6?=
 =?utf-8?B?WXl5NlIvaHZFdU1Ib0lzTnlwUE1haFcrd3FsaGUwNnlCTnBCbTdqKzYwbEFr?=
 =?utf-8?B?SEIrblZic3VCQTdWMzBaemhzOFlPaEhlUWRWWTk0T20zTVdndWtoQ1FmQUhL?=
 =?utf-8?B?N0RCQkNWVlBQUDBvVm42aDZYeHlpSFNpS0J2bUpucVFqVVRsbEpPR2d6cmxq?=
 =?utf-8?B?Qy9pL0lpelFoZU45Z0MrMEtDYWZIZ3ZlZDRBMDQ1UEdkVVE3Mmw4eWtRN0tT?=
 =?utf-8?B?TTBxZTg2OVRoRmJLZzRMWU0rU0FkcGZqN05yQ2JKMDBjT0VtbmpJSVVuc0VY?=
 =?utf-8?B?d1Q2RnRjZ3pHdGJ4NnpPR1V4SVNHSWc5MDg4QzBKKythVGkxRk9LOXNGR2s2?=
 =?utf-8?B?VEhkb3I0dE5CazAzY1gvN1BHZ0pLdEZhaWxYY0tOU2NKZ09HZllGOTM1VzM2?=
 =?utf-8?B?YU14U2I5Q1d0TzE1MUNUQm5Ib2YrK1dUZGdSR2lvL3pXNldTQXpHSDYwQTl1?=
 =?utf-8?B?Y1NUZDZwVHROSEYvdUJJdWtUTld1Y1JVd1hrZDhKUjY0UkJDUU01MU5mNUNs?=
 =?utf-8?B?U3hVVUFGbytrZVdFSU44R3BWYkVQVWZ0MitqWmJPMUlvZ05LWU1zSGQ1bnpr?=
 =?utf-8?B?c0JGcElDdE9rZWNlSjltYXAxaXNuVENUU0pLVmRtVjZZR1pzVytaUm9DU1g3?=
 =?utf-8?B?UEFEMmN5VGYwbm9SM2RSWU9ZelMyZlhKQUpqQmZvd3pGcFZtQ2lJUElGNEFG?=
 =?utf-8?B?UnZ1TGhBRmJwbEcwTzhhdFA4akRYZnZoMXlvaTBaTUhRQmJlVjF4d2NoOHRF?=
 =?utf-8?B?ZmkzdEZGOXNwRStBOEpLdEsyN1JQYmhuQUdtVDlIZ2FaNTdSTVc1T21OYlFs?=
 =?utf-8?B?MFQyaStwekEyOFczUjBCa3Byd0xwdDZXNkpHRjBJQnNOTWorNXBaTktPREFq?=
 =?utf-8?B?ZHdkd1ZlR0NLcjJSd0dBUWlUVGF3Nm1XYkpvZ2xsL0RYNXc4ZUc3MlpwdlJK?=
 =?utf-8?B?enhpMHhGOXhNUGRLdHMxZnpkQy82SHNmTWlOeDdnMVFVZTExUDdWM1pSWVpE?=
 =?utf-8?B?MXRHL3BrMVZHL3RnTEwrUXhuV2RmbmZhdng4L1R3NDRSZHM0VWdNV0VzaHhn?=
 =?utf-8?B?dXFmbVdad3hKYWI5WG9GWTk3bDR6STBjSUpwNW4yaHlqQUxQNFVEMUFWTHZ4?=
 =?utf-8?B?NzRZRkRFaVM1ZVVPYTF6aGRORjN3ZllvUklYdTN1eWVJNm1NWW1SaDdRQkhT?=
 =?utf-8?B?SDFiU3B4L3BwOU9ObVFuZ1IzUnZ4QzF4dnY2ZWRFdjNkNU9PSVBSNXpFaEEv?=
 =?utf-8?B?Qmc1R1RBTTQvdGpaVTJzYlFxMXE2T2M5MXFjdFlTbmJQMFMvUU0zbnVQc1gr?=
 =?utf-8?B?dmVCM3M2YVpvTjkxQktXQjVJc21kUUxhWDBWNEd3Y0xIV3dvblBPZVNRakhk?=
 =?utf-8?B?VVJFSURWemJsU3hUL3g5N01qZzJSR2NlZFRsNHV3Vmc5UnVJQWtFWlVuNzUv?=
 =?utf-8?B?aHhvS1BnbGlUbmpqRVY4WVpUT3lZa21uWkRnUXV4R0ZTenBnYWZIV3JZVXNj?=
 =?utf-8?B?blFJWVo1TlY0VjdnZlgzbTM1U2VwcG5FbDBlMGxtSFczam04NVRlSHhpSGxt?=
 =?utf-8?B?NXRXVWtmNVkzR0pGUWhvWktJRVZ5WWpUa09MZ1B1RTBMZ0dKcXhJeG1ZRXUw?=
 =?utf-8?B?RCtzVUhsWW42b01WZDhpNytsUWNvUEx0aHk2SDVsODdVbVpJTFlxY0NsR2p6?=
 =?utf-8?B?UFJkWXljZE9CWVovZFZ0d2h3V3FqOER4Vi9xU2xrODY3MXU3YVlZNHJ1d082?=
 =?utf-8?B?RWUvcGQrTVZNODhxTktQZ3Z1dEErbXZ5YlUrSmZsazJscXN4V3plZEprTDI5?=
 =?utf-8?B?SHhaakVIR01nUStOQUxmL0pWb1hQWXNRdmV3cWs3ZmlOQ0ppVEdWWElOY3FX?=
 =?utf-8?Q?umUh/KNZz4/yK1kaCk89Lpc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d460841-fe0d-42e2-2535-08dcf876efcc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 00:08:09.4184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMKq+7Lsh9fzQJ+lip4wB8sIxi7XwyAsWyUutWmTM6mdKDIjkyZIQLBeRoK9z4eUAo7kXGuEovl3f4hHT0vAXPA++lWAx58rwXYg6ATJFPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5264
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

On Tue, Oct 22, 2024 at 10:05:01PM -0700, Lucas De Marchi wrote:
>So it can be used directly by tests and other libs.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> lib/igt_kmod.c | 6 +++---
> lib/igt_kmod.h | 2 ++
> 2 files changed, 5 insertions(+), 3 deletions(-)
>
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index 75a0d057c..039309328 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -663,7 +663,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
> /*
>  * Unbind driver from devices. Currently supports only PCI bus
>  */
>-static int unbind(const char *driver)
>+int igt_kmod_unbind(const char *mod_name)
> {
> 	char path[PATH_MAX];
> 	struct dirent *de;
>@@ -671,7 +671,7 @@ static int unbind(const char *driver)
> 	DIR *dir;
>
> 	dirlen = snprintf(path, sizeof(path), "/sys/module/%s/drivers/pci:%s/",
>-			  driver, driver);
>+			  mod_name, mod_name);
> 	igt_assert(dirlen < sizeof(path));
>
> 	dir = opendir(path);

Maybe unrelated, but another issue I am seeing in this path is that 
power/control attribute is not present in some kernel configs. Can we 
add a check in igt_kmod_unbind that would check if the attribute exists 
and only then set it? If I do that, then unbind does go through and the 
test passes as expected (with this series).

Thanks,
Umesh
>@@ -744,7 +744,7 @@ igt_intel_driver_unload(const char *driver)
>
> int igt_xe_driver_unload(void)
> {
>-	unbind("xe");
>+	igt_kmod_unbind("xe");
>
> 	igt_kmod_unload("xe");
> 	if (igt_kmod_is_loaded("xe"))
>diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
>index ee1719a8f..193b95627 100644
>--- a/lib/igt_kmod.h
>+++ b/lib/igt_kmod.h
>@@ -36,6 +36,8 @@ bool igt_kmod_has_param(const char *mod_name, const char *param);
> int igt_kmod_load(const char *mod_name, const char *opts);
> int igt_kmod_unload(const char *mod_name);
>
>+int igt_kmod_unbind(const char *mod_name);
>+
> int igt_audio_driver_unload(char **whom);
>
> int igt_intel_driver_load(const char *opts, const char *driver);
>-- 
>2.47.0
>
