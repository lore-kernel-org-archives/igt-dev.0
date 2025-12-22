Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A72E674B1
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 14:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C25910E34F;
	Mon, 22 Dec 2025 14:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cls6HLqM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A8C10E34F
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766412179; x=1797948179;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zmL8CS2deUUmHmlFDMKVqLhh8SnJ3NA8rbnhcm4MSkY=;
 b=Cls6HLqM9YklVZ8r0B81v03q2GKFB+I1YJTgj0GwayD0b9CQNmPBo6tq
 3+S10hwKlwKokfEEUytD12SMhP1g+Z2z81BDjK2bg+VX6St/EPVM9gE4q
 //d8RTCSibGFPzAquRvPcs9z5vhgAww8VmT8Hy+N9OqD2ITEN2ki66ITs
 uge/E0hSI8I8R2XgpFEP/0UYaUn+ijY6zDFJqgv3cOtx6swHUC5MDrz5q
 /HPKSxDaJ0XQOdB6Hvwb2NCGs4fSDnkLv9v9H8y1yEap3sFjq253BlTHG
 YedtBJCR8kCia99fG5ZHOdj7emz1OqQaDU6CdHqdqoxPGvRSkz5c3kWUl g==;
X-CSE-ConnectionGUID: NdZqgEaET+aK0bT0sLpH2w==
X-CSE-MsgGUID: oYm27oYoQe6U5kRJstUeUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85848506"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="85848506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 06:02:59 -0800
X-CSE-ConnectionGUID: hxo70y5sS3moBYjvfnriEw==
X-CSE-MsgGUID: eI7kxT97QmeiLeDDqbS7lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="204003897"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 06:02:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 06:02:57 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 06:02:57 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 06:02:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1FHVAl0FmsbQuZ4NJIPnv/dokgTH+sJS+UgBbqMbID4DGYL69PbQwHpnI5+FhzSZrgmB4aVqFIz9rM4WxJl5yWKXVvoWKmyOtvisNn+C++ZdbNoADas9WDTPwB6CSG6HHcuQiIwhfkGoTDqBt0Vx6rerum/N+LNw2u7oVvm75cxRzGIKZouIc0u3bbIR+75hMPdjCJoHrXu3zN/ulr+9jcHjvQ15NIr7DEQnR1jpkEFaUyhK6UYWnsN/ZzEIqChx3pay/KrBul89GQwAK3MNMa/hlgHLllmvEE7NTaFAxmPV9A783pcx6WeR6vUs2/JggbHnaKeQG9kiiYu+0sFxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOZfhqgmDtL5fLqWAqPwei6iCy7QGU8y4J+rlAwNTNA=;
 b=WPhnk1mrEdvW9iq/e/r1UJiS1uejcYSqcQHeFhj0Ji4Ml53d9Jhzfzs9M5z+8DJxM+g2mVAmpxJo7GMEBkFxgORXtNmE7GJkGmEj4rIALq1JZCcT0a1eSo9NiE+VeOiCAB/CMhJsNO+y5Tflg8ARTpOU4fSczhG/BfG6iU2eYcXbYf3QRlPUAWZhZ7WcDY1REB+vfG0pF14U6uYbgiQGXiaWrU1g2AXCvJxeW5f9A1UhyqoMbEE8pwen75o7VLImgltNWi0wsCdVeXxFdRuVOozr6kpOPWQI5qGLCe45KubybiTKWU7BoWR91b9Ej+ibCDHtHdlSwYlmNxVdmQebJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by DS7PR11MB7737.namprd11.prod.outlook.com
 (2603:10b6:8:e1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 14:02:56 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6%3]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 14:02:55 +0000
Message-ID: <d5afc14a-9835-4fe4-b64b-5b4bf80a237a@intel.com>
Date: Mon, 22 Dec 2025 15:02:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/intel_compute: Unblock NVL-S compute and
 preemption tests
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20251222133724.221995-2-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251222133724.221995-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0502CA0018.eurprd05.prod.outlook.com
 (2603:10a6:803:1::31) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|DS7PR11MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ed48df-7428-4d8c-a297-08de4162ce21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUhneUxGL2MvL2lHWTlOOEc1ZDlQUkxLQ0hyTDhtcUdqN0NISGZucmMrUTJt?=
 =?utf-8?B?S0dxOGM4YThkSWtLYUxDQW9GQTFSc3huNGgxay9aYkt0cEY0ZHVBZ2NHZXU0?=
 =?utf-8?B?K1JGWHo2OVFRN3NtL1dIalJQeEYwSUh3cSsxU0p2Y2dmM2ttRFI1bXJHdVkz?=
 =?utf-8?B?Rk9MYWZNMi9tWFZsenBnOFJVbklSRzhuYWplSitYM1ZTWWI2THJSR0w0WXlz?=
 =?utf-8?B?T01zeUQrbURhYlpYTHk5OTJSZ0NJWlh5dk85R3A3Mm8yZ3pOMUpzZ0RMOTlQ?=
 =?utf-8?B?aEZsUlJlS1I1OHRYTUc4YnA4NUt4Rys2ZnNmbTZwTHNTdU1BcVFLTVR4UG03?=
 =?utf-8?B?TUFVcXdJRjkzSXFjejRIRVlrN1l5L1diL1ZTZ0RpK2YyaDJlRmNVYklnbFN5?=
 =?utf-8?B?Z2RlWTRRd2ZQOUQ4aWRJU21ET2RoOFdjS3Q4SGR2RWl6elpzazRxMmQyL3RJ?=
 =?utf-8?B?QjFBTzlmQ0g1dGdsNTNRUzlBVm1KSHB4bFhlOXRlSVdlSzl4SkM0U2x5alZT?=
 =?utf-8?B?T0hRUmlMTVdNQ0F2cWJlbUZFQldTcG0zUXVkemZkaDc2Z0l4QnZ3YWQybW9K?=
 =?utf-8?B?TGN5Wlo1TmY0cWxleVFJUlVUekpSRGJXakxTaENERXB3eEI1N2RnN1MrZ1BD?=
 =?utf-8?B?UFovV2E1R1h6dGp5aUhBT0ZVelg5QUQxNzVXR2YzUUcxOWpYeE1EbVZ6WU1n?=
 =?utf-8?B?SWpFekMvN0hObE9aSlNKeHNLVHQ2YTk2VmdOMkh5Tk9kYnROWVZibVhFMHc3?=
 =?utf-8?B?U0ZOSUhkOHBLTDIrRm1aQkJkTExRYmtxMERkSzRQY2Y2VFVPTG5GTE55N1NM?=
 =?utf-8?B?RmVodGw2ZUZtRURhMmFWb3E2OW1ITGxxN3ZqOFdpNG5TTTd6NEUzTEZJaHJn?=
 =?utf-8?B?STRJTDRCa2gxOHBZR3owbXpmNDdVbTV6M2xQeThzOGZqZXBVaUQzbHJqNUNN?=
 =?utf-8?B?WEpKZ1lDR2tZZjlNRysvaG52SU9BS3U2M1Q1cXlSeFFjdE44aHJ2bllUTWpT?=
 =?utf-8?B?R1REdStWMjJlWHlpMEIrTzRxUzBuektvdit0K3A4dnFURFdQWTdEeE42dG1G?=
 =?utf-8?B?c2FQVmdrWU9DakVZZlhQY09qekNVQ1BRbCtxM2N0Q2kvY2VwRTllVlZuNDBN?=
 =?utf-8?B?UFgwa0d4bGtIYlBZN0E4QTc2OFUvZVVVcHozalNoSmc1Mzd5YVBkcG5vMHFM?=
 =?utf-8?B?UExmempBSHNzVHU1NitmNGcrK1pwTTRtUnpPcE1lZ1BQTTMyd09jZjhwRlRT?=
 =?utf-8?B?WGZtNWxGdDZDOWJaVzgrTFZWNjYrdUozT2VTM0NnQkpybzFzWllaUS8rZHVa?=
 =?utf-8?B?KzlReXhGR2FlMWRLdTl4QmZRQkJtVEFQbG5YRFV0aHlKVFArd0lZNVVwQW0v?=
 =?utf-8?B?R09NMW0vdkpqa1h0L2g3ZGZFdTNFTUx6Tnpua3Ywck5Fa1JsSTIvQkZURldo?=
 =?utf-8?B?dS8vYysxUGp5OHFmS0dpL2FTY00xQ1VMZzN5Si9SN2VuVW1tTkRCUmZEeXhW?=
 =?utf-8?B?djdYVTY4YmpVQm55ZWxRekFvZHJMNEZ1NnQ3OW9NdXR2ei83bjl5T0ROejc3?=
 =?utf-8?B?VjlPeFJibTY2b2s5UHNtWU8vSjFCdUJRbnYwaEJiZ3JLZWYxcnpocFNBcGdL?=
 =?utf-8?B?TUVaZXdVaStuKzI4aUIrbU81R21IQk1EeGFjVWVnNWM3b2hWNEoyclFrZ2tN?=
 =?utf-8?B?cmRQdGg5MnBBS1Y0bWw5YXFFSHBGK1VCYXgxdFhNVk83YnV6NDY5dWFHUVpy?=
 =?utf-8?B?b2VRQ1lwOXlYckdrcUhvMHNTeXNxQTVIU1poWEcyNytHdnFqTUsrZUdNYVpu?=
 =?utf-8?B?T1RrWHVTVEE3OFpSMy9uQjgrQ0cyRFlQUTI3VjhCQncwQXV5TmtDVUFKd3Fr?=
 =?utf-8?B?cVRzY3ZIUGMwQTVlZlIyMXRRSGZNQ3RUQ0twWUtHSldHMjdNZzNuWHF6eTEx?=
 =?utf-8?Q?toqr+dUmyqlgDTT0rz2IQHjuxOzzu5YH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1ZKNDV1TWQzcDZMc2R0KzRnSTlsMVZDa0xxREtXa09XU0FBbjJqK1VkRTZI?=
 =?utf-8?B?MUYvZ3UwMS8rTm13UHpCck5lcDQxL3JaN2NoQmJlWnRTdXE0TlpVbFFKMHlN?=
 =?utf-8?B?YXM0K3NtWUJqWXh2NGcvZWpJQzFuVk1KZXRDZjljR0Q5WUdJN002QmNuSjhn?=
 =?utf-8?B?dkJlQkNoeDR5KzhsVnlNUG5MVnJQV3FYNkRVdTRhdXVvSXFvSkNKRG8xbGdr?=
 =?utf-8?B?TlBsZDBhL29hWThBdWVackxQZWlWS29sQ2syVGVQMW5QMnVlcFludGNoaFJi?=
 =?utf-8?B?M1JwYXora3FiYUJaMjkxc0JpQTVxTDBmNWM2MXQ3VnF4Qm1hTjdCQkUzYnhQ?=
 =?utf-8?B?WVkvbWlyajZ6eUhoZDBGU0dtRHpnaHc2bGxBazBIQkYrUHMrODlvREFxaExz?=
 =?utf-8?B?OFVla3JJTzJzNWhQWnFuRWlKZWsxZWZXdVpoSFVlaHJMbmMrejkvMnJCQU9a?=
 =?utf-8?B?RHBJM0hqbTlVa2o4UVlrbXRZU0JBcWUxSXloM01ROHlzbUExWE1PdG5hN2NV?=
 =?utf-8?B?WmJkdlJmK3piTTE1Y3JNZ0FDVXFVenA3Mnd2QXB5OVl6cTI0QXh5blRxVW1i?=
 =?utf-8?B?c25IeC9PVktHMi9BazM0TmQzYVFRdGxPUlZtcDkyUEtDRE02Y3hpUUo0clk0?=
 =?utf-8?B?SXQ1a2I1YVU2d2Q2WUtYV1B4STRLQVAraFhLLzh6Rjh0RTRvNllHeHgyeU5I?=
 =?utf-8?B?Y2U3ZXM2WmYzWFVlNHRPQmVWSW9JL2RGUWdIZ2REc2NFSGUyRUppOE5Gb2k5?=
 =?utf-8?B?elVaQ2wwSVRpaXpWdktpS1RDa2VBdSsvSnRNSTNaZUMxZEdQRHBOQWZBazRO?=
 =?utf-8?B?cU1yUDc1NUQyOVlPUks2T3phYk8zb3F4MWM2VjZxVzNYQVlQVmZQY1I1SjRG?=
 =?utf-8?B?RUU3eFd3TnpFVDUvMFUyczlNenJWK2w4dnpsSzVQdkE5T3NWcWZXdG5ZamRV?=
 =?utf-8?B?VVdvUk51cTdITGRUTUtrU1Z1NnMvMFF3c2ZmUlZZZm0yMkIwaWI3Y1RYWkNq?=
 =?utf-8?B?eERpcDlyVlVwMVVVcVUzcG1pSTFra3d1Ym5hRC9xMmdqa3RLdWxJRVZuSUZG?=
 =?utf-8?B?T2sra1gzdWFwVmU4ZGNpRHVyNzVlUFRmcnZ4b2FrZDdqTnh6MzZtZFh2Yjgx?=
 =?utf-8?B?SWVuREc2L1ZjeGVKN2U4MmRiSDlocFMwbGJMc3ZrSko4cGc1YWNFUkJBRGk4?=
 =?utf-8?B?TzdpZm9KTDN4eEZaVzJ4MjM4OFVmMS9MQUE1Y2FZK0QwZVc5SzhYN2Zjazd2?=
 =?utf-8?B?M2tESWV5R2Nham0rKzlNVmR2VWdXajNERWlkbjNTRE9NWExLNDRNOVdaempN?=
 =?utf-8?B?U1VNTHdGd3VtMVpCTWFscnE0dDZ5OW9weTNWRnh3TUgrd0FwQS9jdnNIbmhq?=
 =?utf-8?B?QzZqQ3dlMXJEN0NVUGZ0Y0lDNnJETk5jaXVIUFpxWmV2QndtNlU0RVBrMUpU?=
 =?utf-8?B?UEI4cjZ2RHpFeUgwVkdXMHQ4dkE0K3RCaWRuZGE0YnNidTQ4WDh6TnZPU0V3?=
 =?utf-8?B?UCtDcU5GWnFBQ2xkYzNXbVRkWGhhbFpsdFhyK1VEL3U5MkVaRVc1aDlISWJ6?=
 =?utf-8?B?L0p5Y1lncDViNGxzWGVCdDlQNitJQnYzbDIxMmQzb3hkRVVoNTQ5bGdwUi9o?=
 =?utf-8?B?TS8xM25nNlhXTmNvQlNHWFMvcGQ3dnN0a3RvL3J2Nkp3dzZicEcrY1RuTE0z?=
 =?utf-8?B?THQ5UlgxZDBaM01jVi9aaEVVOHRkcU9GWXA4TmZmUlAyb2JxZFdsMDUyckVN?=
 =?utf-8?B?VFdmQ0NrNDI3WWNsSS93OTZHUVd3eEFoWThIc1kxM1hjYnZyS0RaRHlqRU1S?=
 =?utf-8?B?ZW9zWmZocy81OUFPUEk0RVVycVpKb2hJVENRU29iRU5IRnYzOUltRXpHSGhm?=
 =?utf-8?B?VG4wZmVNTjQveGdZMXpJQXhVWWFFTSs4M3NFSWFJa2N6RldpakU4cFFYYjJn?=
 =?utf-8?B?N3hvRENOY3NsQjVqV21Ta2JKWG0za2NzOWpBb3dOWjdsa3dpYmx4TkNJNGRX?=
 =?utf-8?B?UXRrTlhiL1p5VHhFd2Z6c1lWRVhEam5RRVJhWFhlYVhPemtQMWQzWEhreEtj?=
 =?utf-8?B?T0ZoRVJDNURQRk93dXJ5TkdIS09rb0JScjVnTEpJbkl1YkY0SHpzTnVaWmhz?=
 =?utf-8?B?YzZ6Z0dpNkh1Q3lTZFlWemF1YWRIai9ITjc3MDhYWmVQOUFsdE85eHAxWEF6?=
 =?utf-8?B?aVlmNkVtWDdveHBqRHZVUlpRdC82Vk1NZUN3RWViYWFsZ2VFTjh1bFg5ZGda?=
 =?utf-8?B?eG5KSlBaK0I5eklLcXd0enZSbHdNQ2wzOUpnUTg4VUtxdDhweHNHWXVFL2lj?=
 =?utf-8?B?eTlRMElQZk9PRTB4UmRrZTRHS3g4enp4Rkp3RHFmWGFjYWFwZ3N2dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ed48df-7428-4d8c-a297-08de4162ce21
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 14:02:55.7981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEKZWi9OT5DuWDwf4wqC1FjNHNq1SJuGkl5cPbLns1aY5LCUPzO0PRjZOJE52aG1ru/WVR6xrijhWKH0EwqtkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7737
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

W dniu 22.12.2025 o 14:37, Zbigniew Kempczyński pisze:
> Novalake-S uses same pipeline and shaders+sip as Pantherlake.
> Add its definition in compute lib and unblock compute-square
> and preemption tests.
>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards

Andrzej

> ---
>   lib/intel_compute.c                | 11 +++++++++++
>   lib/intel_compute_square_kernels.c | 11 +++++++++++
>   2 files changed, 22 insertions(+)
>
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index e112e57b5d..16f2c76498 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1948,6 +1948,11 @@ static const struct {
>   		.compute_exec = xe2lpg_compute_exec,
>   		.compat = COMPAT_DRIVER_XE,
>   	},
> +	{
> +		.ip_ver = IP_VER(30, 04),
> +		.compute_exec = xe2lpg_compute_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
>   };
>   
>   static const struct intel_compute_kernels
> @@ -2293,6 +2298,12 @@ static const struct {
>   		.compat = COMPAT_DRIVER_XE,
>   		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
>   	},
> +	{
> +		.ip_ver = IP_VER(30, 04),
> +		.compute_exec = xe2lpg_compute_preempt_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
> +	},
>   };
>   
>   static int find_preempt_batch(unsigned int ip_ver)
> diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
> index 7bf35d1f4c..3c888ebd85 100644
> --- a/lib/intel_compute_square_kernels.c
> +++ b/lib/intel_compute_square_kernels.c
> @@ -75,5 +75,16 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
>   		.loop_kernel = xe3lpg_kernel_loop_bin,
>   		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
>   	},
> +	{
> +		.ip_ver = IP_VER(30, 04),
> +		.size = sizeof(xe3lpg_kernel_square_bin),
> +		.kernel = xe3lpg_kernel_square_bin,
> +		.long_kernel = xe3lpg_kernel_count_bin,
> +		.long_kernel_size = sizeof(xe3lpg_kernel_count_bin),
> +		.sip_kernel = xe3lpg_kernel_sip_bin,
> +		.sip_kernel_size = sizeof(xe3lpg_kernel_sip_bin),
> +		.loop_kernel = xe3lpg_kernel_loop_bin,
> +		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
> +	},
>   	{}
>   };
