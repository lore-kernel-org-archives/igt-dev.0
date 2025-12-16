Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E11D5B87C
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 07:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F9C10E5AA;
	Tue, 16 Dec 2025 07:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PxvEhU8M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A26910E5AA
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 07:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765869515; x=1797405515;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NrwAvC7x48iPKnJlKeMJnVrVEn1kN16le4j9dzbLhlI=;
 b=PxvEhU8Mt6xekNVeiHpi+GzMhwTH42WWPunWHarHz9nWLDt65bhTk3fe
 gwP29VJZ718Lp7zc+1ZSIVd9OoM1k3FZyKznoPkDmaD96Bv7EYjjZfp8I
 ztryqwnfFVX6Nu+512R63XZ6hqoJzCaxukfzGvIesmbRbNC8tgbze+qGx
 Ko3t5iwp8cXf5ZHViHGdFH/HnzanZ+lol4Va67tPXPwze1qrVK7BtdepM
 OW9wYi0IkoWx9Fr+YbzoZRy62pVi51/SN6YfFl+y0tkFSHtvwSC0fM+Qw
 I8DJVtS/GIeCJ/SmzEJy1JGtSm3idgYsuftPnt2qr1x44YD2MENURfdpE w==;
X-CSE-ConnectionGUID: O7XPM5utT9quawoIvbiaZA==
X-CSE-MsgGUID: nnfINuCKRSeaXpfLitI8gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79148885"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="79148885"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 23:18:34 -0800
X-CSE-ConnectionGUID: 4RJQ0pAlSnSrBkCrKXfj2A==
X-CSE-MsgGUID: wKBm/HiURUyBkIl5pqdznA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197994686"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 23:18:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 23:18:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 23:18:34 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 23:18:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rT2utjk4JOYPwsWPmqFUFaqLPkYsw5PNMLeUlmCyq47roLbMVvFgpYEPk1gxq3L/B98faj8J3W/f3rbGzKclkiaSND7TqvAqiy7888dAIoUFDmLbC+R1OIFwvvaIgeT6RnI7S6b+SJaf2JKZIiEN1NEoamA0czarjRwGDpEV/wS9kRPs5tdZBl8Mg0FuI+4I5kpeDhRzn6bagEFSjBZ4SakmcYT6Ku+PA6ywqqlSSrX6K4e0B7Vr/fPgLlxZEojLFfIrrZwZPmwvJr5cVtI6J0ai1WG+JqZyg38zoqYLJuH6/NMIhimS9qMZuRWDorIZolIHxpJv9o1AOJrqMhLx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4hxiXFhS7HUctlbFhv0zfFTjuuEXyqATKGKqM4Hu6g=;
 b=EyuXx55Dw56AKaAadfeiDQjrlbEMcn/JsK6BFUXi62cT/Rr1u96paBSFK/raiqp3f8mxcpeE3DFnxNG27DePDvMh0PQzUkDybW1iWUty3UE/a3pSwbHMMO1iQWJI4kafmuFDIxCzsg7COH9HlNk8a8vVT5sz285VeUntz3GiyTZUVPzbqklS0ASNaxHZwe2NNZ7PSnfc8mI3bLoXwMa+kKi4iZdrePgHy4BL+hZbE2d1AqBDESTChmmsZrG+cDnU8NxiAGlvfEI+Pm8U/vFGECBvTRnRpqFUfRk7JRT2P7+WH1nZEeX3SeC/tOpQglQnZr8JTl00dJVPFQY/0CQAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ2PR11MB7574.namprd11.prod.outlook.com (2603:10b6:a03:4ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 07:18:26 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 07:18:25 +0000
Date: Tue, 16 Dec 2025 07:18:16 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: prevent losing original
 pointer on realloc failure
Message-ID: <6b6nme2rzjkprk2sdnqfxtlatr3eefnwqrmj7xcutuhax5irkq@tys5xjkii4m5>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <dda88be9f499aec000d32ea52b4baf18751d9de5.1765809053.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <dda88be9f499aec000d32ea52b4baf18751d9de5.1765809053.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: LNXP265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::16) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ2PR11MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb0df52-30c9-44ae-f33b-08de3c734d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlRQdkxjWWZrc2kwWE41eXJFQzRKa0FVZlZpemFKZnV3azhQdjFvc2xDWlRU?=
 =?utf-8?B?OHpkM1lneDVXREpnOEY1amkzQWtNNUU1am9GMklvWmM1TnQyZ01yRUFzY21r?=
 =?utf-8?B?VGVEZ2EwVmxmYmlvVzg5VXpwZDExdmF3YS9pdFZmUXR2QUt0eHJrQkJnUTJr?=
 =?utf-8?B?MS9WS0VCbDFDdUVVNVhCWXlWMWxKNFpsSWZyTmlDTnNEQ1Q0NGtUQXpwcTJr?=
 =?utf-8?B?RVMwRFhXcU1HNFQxUWh4RWU1c2lZL0VjSnBvU1JQN0ZRcTRvR25aREg5cjNx?=
 =?utf-8?B?ZDdMdVdCNHRBOWkzNEh6eXNqSEtEbEhLYlprZWljai9YM3lHQmlPcWN3azd3?=
 =?utf-8?B?eHp2YzBVckc0c21BK3ZkTldJT2FGaVBtaU1sK2JJcFVPRGVlbTRXWlZiTHQ0?=
 =?utf-8?B?SGVnWHJpRGxFZ1RFdjA4U1QwMEI3THBzOXJ3NWk0MVlNWGk4MjZ4dFE3enVo?=
 =?utf-8?B?WUtVSUpsa2h1R2pSV0tpTGxrU2JxMG5YbFMrNjFzaVdzNUxQd01ZbVpPcmo5?=
 =?utf-8?B?U3MzN3N3aERweFhpTlI5K1BLVG02KzdBeEVyMDJnbWRJbW5QVW1ra2xzTlQ2?=
 =?utf-8?B?SC9mQWVsbDdmTjRoK0Y1M2ZKb3p2N2NCZFVPYk4xcFhaa3l5WWZRRkVYOWRr?=
 =?utf-8?B?Wll2NFpCYW1UNTN3RkpueWtnZ2R6d2cwOXZjbUpLS3VUVmlHcHdKYkNteVpK?=
 =?utf-8?B?VWFtZmtxeSsvbU85MzVHQTFsS0VuaThiT2p4UTVZUWZFVURPREkwTUdPalpm?=
 =?utf-8?B?aGI2UHVDV1VqZUsyQ3UvK3Y2UnhOdzZmQkVrb01mYVErdC92RzNDUEhXNmRO?=
 =?utf-8?B?K3NYRFhOVCtSeld5RHdlNmgxTHVWMXlER3ZSU1lVQ0RGcTZWNE9qTG1vK3p2?=
 =?utf-8?B?OGZEZUcvLzQ3ZXhHR3R1aVZFVWNEakR6YmpZb1pCYnVQNHpZS1hVaWlzT2lp?=
 =?utf-8?B?bkFqSExodG1tOVZaWFp5alBuSi9PWXJWcE1LTG03d01sZmZLaDVRMFJYMDZy?=
 =?utf-8?B?T3dEeGhTTnFTSW1xeERlVFRYSll2UkVKY3RydEh2ekFnQU5ZTmVOYmFScDRI?=
 =?utf-8?B?ZTN4VytzVXE1MTNDcjA3aXhySWVHR21VaHFXVndkT1VGNGN6eEJEK1I0Wk8y?=
 =?utf-8?B?eFFqK3ZGUlN2MUFhNklNTGlabDRrMXVpZVpMQjZ1OVFIVWlyemltT012SjhI?=
 =?utf-8?B?U2pBWE0yMXRKbGlhK0cwcEh2R3BpWFhyZzdPdkVSNGk2SkJDK0NRZEZnaGVo?=
 =?utf-8?B?L3pGM0ZrbTBiS3ZlSnFjcnVWdEhrRnYxQlZzWU5RSGRKQUVCUm5SRk5uOW9F?=
 =?utf-8?B?THdOK0taUkVsa1Q0WEhzZ1FsSXRTbjZDWFZGZUgvcHg1a0pGTk9KR2JXQkFr?=
 =?utf-8?B?aXlzQWUvbzdGd3RqUUdYbXczMDN0M1NZL2FMalF5Z3JxVUUwQ1FUL1pYMkFz?=
 =?utf-8?B?S01ZeFYwVlVwY2JLcUFuWVdHaDNYemZDY05id2dQNFVIVjlWeHlmdFVIUlAy?=
 =?utf-8?B?YlBTMHZkR2pHd2Z6eVFGSXkrcjBKWE5mMEpFR2YyVmd3WkJyQWI5SXc2dkhE?=
 =?utf-8?B?bDgvQWx3N2tFZXdMcUhrenUxRDJJakRsR0VKSzg5WmpBTjhxUHlQTmtsSDdK?=
 =?utf-8?B?K0h6b0dVZm9ERkNaeHZkTXZSUDlzVkV0QVMzWSs0aUpFWGZJY2NweThLcVF4?=
 =?utf-8?B?ZXl2dlpmaEpURk9keGNnL0Z5R2lSdmJETWFxOW03UTZYNEVGbUswdDFKMEJl?=
 =?utf-8?B?cFFVbzdlUkVqWFJEdXdISmZPUHZDbkpJR01tTU9pczZxRS9oN2Uyb2NGUzBn?=
 =?utf-8?B?ZTlpbnZBdy81T2R4aW45L2UvWVloNms2UmlwNWtHeE53SlptYkF0djV1V3Z1?=
 =?utf-8?B?VXA5MHhJcVp0QmlrdlgwYkhwRStNMWx2djNJNlhnUzd1cUxET05rMXdEV1JQ?=
 =?utf-8?Q?0ruxauo12IsmCOmC6Q+WTenzWHJWH8zy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vkxja1doNEljMnErMTlBanRqRnQvRlpjTXhNM2FFZVZBZzZrdzZ1MmMvRGov?=
 =?utf-8?B?bnJQZzlKbmN5VDQ4UFJJbjNhT2lEWHJBSFB4SXo5WG5TbDd4bWdtclFRQ2w0?=
 =?utf-8?B?dURrNVN3c3A4ZndZZWo2VXlpU1BSTFd2aTJoRk5uNTVFVFJadUZZQUtHZU5L?=
 =?utf-8?B?cUFuQ0Jpem9OL1hENkZjZGExY0x2V3RTZElPS21BWGwrNWFxYjZFTDlQS0tY?=
 =?utf-8?B?TW9kQlpKMmswZUJSdVppRDBOMmVLQWo2SnZ4ZVhzWWhEdDVNa2k3MHI0YWdw?=
 =?utf-8?B?YVN0UFRCMVZaMGhreUtUdXdxMEhWMEx2TjFoL0tXUVdTZC9qbjUzTUswcXYr?=
 =?utf-8?B?NG5zZDF0SjBHVWNtdlVydXI5S2V4Y0VxcGhnN0tQQnU4NUlpcGVDZCs5aTM2?=
 =?utf-8?B?MDl0VlFzVEt5RXg2Mmt4cFB6MkJnMkduUjR5cmpEUXlMbk1ta1Z1dXYzcXdG?=
 =?utf-8?B?VmlLeDhEUWZ3TVdyT3Q1ZysyYUdrWHdwQ2lCUmc1ZThXa25RVG5ranZsVGcv?=
 =?utf-8?B?MUhxTjhtTVczU0IyU0FIL2owbkh3SXpqalF5cjFBUGt2bk1PbkpQUDlIUW5p?=
 =?utf-8?B?K2IydnZuVC9jNEJ3emphVTZYVnVaWUpmOStVL3RhOTNoT3IzbnpJMy9Qb3NN?=
 =?utf-8?B?TDZoMzNIN1BHVVN6MUxOVGJXVk04K0ZSZ3ZrUW1SUTNHbnJ5RWEzMzRmSUFh?=
 =?utf-8?B?d3pKeHZFWTRXUUhqRnJRVEtHS0dDNnltUUZyaWVHK0EwUDZsRVBWV3dYZVhR?=
 =?utf-8?B?UDVGNTNyOFdaTTYvNlZrUXA5d0hFVUJzQUlrMWI5SUZUWUpna1BmUHZCTGVn?=
 =?utf-8?B?MkVKOVZKSmUrQmxRaTBqRjE3RytDTm1sd0QwSlBHUHFGWXpMYTBPTnNRTTNV?=
 =?utf-8?B?Y0RBaXJMOVcrSnduSmpWMXBWK0dHZ29ZM0g4L0ZNYW94V2pZdGU3SDM4VWJx?=
 =?utf-8?B?UEt5WllSOENVakRTZEc2aGZHakNZSmlDbUVyd1Q4MFZqb1pLeHdEUldYZzRa?=
 =?utf-8?B?OUpCRk1KMVJBcEQvUy9kZ1lKejd3Y0JnM2hidjJ4ejUrVkl6VDRQZFZUNjJV?=
 =?utf-8?B?MFlocE00U013S2I0MFhINmtndmszbmJ0NDZMQjJXNVdPMTF3d2JCRitERlUr?=
 =?utf-8?B?YjNkUlRWZlNjaS95eGd3R2NhSjhoY1NtdWllQ2FQUGRRdHdOMnNtV3g2Y3NV?=
 =?utf-8?B?QzhYeDFSTUVqRDlYcTNXRkFnUW5BRThiN1NlVWF5c3ZjQnpBN3hHOEh2emU3?=
 =?utf-8?B?b0lQbE5RVjZHVkxvRlF5ZkNjY1dRTGVtc0tJdnlXc0UxNnl4TlBaaXdRa0dH?=
 =?utf-8?B?WUU1OXpyTDJaK2ZMTTVOUzlPd0dFcTU2NWNEUDJsSXR2SFY4MC9TQlZnV0lq?=
 =?utf-8?B?WmhGUTYyaFJKYS92UkZPU1I4K2daTUNEQ0tYbVNBL25ja1AzWTBxVDlPTHJt?=
 =?utf-8?B?OE51OWxwNGNEUm9kMmh6dXRrbWxPM3FqLzBteGUyVGVzNmkzZVdqbWNBQUFJ?=
 =?utf-8?B?QzBSRTdnZ2l5eHJDaVgrNENpcjRnTHMxNkFqK1luQWQ1dVhXbXd6YlArVjVX?=
 =?utf-8?B?bDZMSmhncUMwb01HTFZ6elM2YnNEWHIwNGNJN1Q1MFJBdUVFblFKdkhQcVk1?=
 =?utf-8?B?V1pOWkozWlFRRE15MkRUdTFIR2g2SlpjMnhJdGFaRDMvTEoyODlCMm00Vk91?=
 =?utf-8?B?ZzF5dFpiQTdEZ2c5dU01YmlOS29CbXlleTYvemJoL2gvVHN2NlowTDM0VVZk?=
 =?utf-8?B?dmxBeUV4dkJIa1c5Nnh4OUhzQ3BNOU5uUWRhTE9kL3hWUzdOWVFOKzlVZS9u?=
 =?utf-8?B?dDdiYjBDOUtQMWxQMHdrUGwwb05lc3o5QU1qREVtQXRPRjJHOGlFbUJZNkV6?=
 =?utf-8?B?T2U2SHV1bXJDdHRSUXdpQ0t4bVBFQk0xSXh3UFFKRDdOQzJsSlFJR05VdElM?=
 =?utf-8?B?Z1B3T251VE4vd09ia2EzTFlWZnhnVEpjNmRpYngwOS9jK2lZS1ErV1BBL0sy?=
 =?utf-8?B?V1N1b00yM2k0R1BUMWxIeTdLUk0wcnFTc2VnR3hVeFpNa2RGVVE5aWxENHRv?=
 =?utf-8?B?bjFNZGRyTWFNVnZYS1VPcmZPWFdma05udnA4QXQzUCtaL3ZNbW5aQ1BwY0Fq?=
 =?utf-8?B?QjBKN2pER3AyQ1k3NUQ1MVBxdExSQ2hsTkl1WkZyRkZPdGRvc3ZtTjNGVi9z?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb0df52-30c9-44ae-f33b-08de3c734d9d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:18:25.6683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkiN0+OYAOoAINmzQI7qUka7ocxUJpYDiMNmegs2+q52RkIjwWFI31OeroI/tfNVj25szDCkGQGyLP6TFHpL8cleiOc9CPSGTEIXyxMw38I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7574
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

> Previously, realloc was called directly on engines after incrementing
> num_engines. If realloc failed, it would return NULL and overwrite the
> original pointer, causing a memory leak and leaving engines inaccessible.
> This patch uses a temporary pointer for realloc and only updates engines
> after a successful allocation, ensuring the original pointer is preserved
> on failure and preventing data loss.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/intel_gpu_top.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 1bd88ba7c..1d0d11585 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -378,6 +378,7 @@ static struct engines *discover_engines(char *device)
>  	while ((dent = readdir(d)) != NULL) {
>  		const char *endswith = "-busy";
>  		const unsigned int endlen = strlen(endswith);
> +		struct engines *engines_tmp;
>  		struct engine *engine =
>  				engine_ptr(engines, engines->num_engines);
>  		char buf[256];
> @@ -444,14 +445,15 @@ static struct engines *discover_engines(char *device)
>  			break;
>  		}
>  
> -		engines->num_engines++;
> -		engines = realloc(engines, sizeof(struct engines) +
> -				  engines->num_engines * sizeof(struct engine));
> -		if (!engines) {
> +		engines_tmp = realloc(engines, sizeof(struct engines) +
> +				  (engines->num_engines + 1) * sizeof(struct engine));
> +		if (!engines_tmp) {
>  			ret = errno;
>  			break;
>  		}
>  
> +		engines = engines_tmp;
> +		engines->num_engines++;
>  		ret = 0;
>  	}
>  
> -- 
> 2.51.2
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
-- 
Best Regards,
Krzysztof
