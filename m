Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF679F54AB0
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 13:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAA910E6E8;
	Tue, 24 Mar 2026 13:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hI90hOnE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2279F10E6EC
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 13:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774360453; x=1805896453;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WMe9fmxW2YjipSwUpmGKwhso1f3JV0P2UZPxl3dauX4=;
 b=hI90hOnEvqHWeOeOW2vwiaWU+RJNY/oV4edB/x5Id61ZKYz61YlS10dD
 rEIJz5q2LeeS474gYet1/NXyR/MU8AGwqVnWTDoVu8eMQctmhVc9C9zLr
 YZBBo9disIjN8DJJJOtZbW1UMN23NuH6vXse4MI8Zx/vTawY8i9CUvnNS
 SU1jswbVFC39AQo84GQRMD+mt0c59AoBr8dje324FpRzpIRsuUc6Tfv7t
 NzqtS+ijVZSfqCbYHV2nBKLZjt//pL1Xq1jl3kypQijB20H/4iQo1wc1b
 DfwGIOUuHInoxejrfgx7rGo0pgBWb54T+R7oLQlUs8/9D1nQzkZ4tchnG g==;
X-CSE-ConnectionGUID: 4MLcjtvyTaK1JDIB9M/3+g==
X-CSE-MsgGUID: TRT5p5RnSlGJFA91lNFJWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75090150"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75090150"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:54:12 -0700
X-CSE-ConnectionGUID: JOdXq54NRQieFEPkqVPxRg==
X-CSE-MsgGUID: 04WsPRjiTHewpygM4yTaHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="247967468"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:54:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 06:54:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 06:54:11 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 06:54:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K50woyDHiIAMbJ3yWraeE4FWZ7FG8SGSoJrbNG5uB+fwhmEDEMkS9hJ9QULAMoBf54tlrXwOcmMPmpaLYY9tCxZtOz4gMoPN7+/plzAyuf4WmaZhOiHIVaTYY1twSbOiX50slElzCZlchsog1KFwqvDfZ/Wr7Khpyd353eXARBNGLW7H06fz6ZObTJlVEtfmMINxqAuWYA0+r+Fv9dx2k+vBVmu/Zj/51zWApQLWc2Cb3dE1iiY29So7AyPbB2OGZHLds24AdJYXJ4ka1hUEen4+WPQkN/gS2r3Z1JTO+zYVsjGnXuddVS7xAvu7TY4rvGjs88WRcq8RSeiJMPFDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HN1Z1JtVhRjgN2H1SmWUr4wIeY5LkZ8xdZjg5kL51HM=;
 b=SKaFc8dGyWup+dXXI08kpShfbYzcFg1TtsK8UfqP7CaxOrZhi4g4MqnHr30xsg9qmMrzEUGQSo9fbLY2Zkn9IS9euXw5NTJ6Mgyo8nLDzM40apS24SI2JMtvvGsT5pP8DBEDV59uZNJa4qDKWTnAVH5jhNX8R/tHT1PiPqZNaJsfSmmtszFGs4ObYQBpUW+Tg4Y/SRP8NNvAamfMNi4n5NZezfxk7ODFAuLcYp/4tabwb7cVxFYGX0B+hyUYXH1HiL4DbWk89JsjlU2iW43RF0H28RGXK7TKMUD3y6trMy1H4KGWSShbcjKlN/lt11jG2Qjk4nq695sIcBTZHpmWXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by IA4PR11MB8913.namprd11.prod.outlook.com (2603:10b6:208:565::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Tue, 24 Mar
 2026 13:54:09 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%6]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 13:54:08 +0000
Message-ID: <756e09f7-c2b9-4529-92b7-ad00ecac3d53@intel.com>
Date: Tue, 24 Mar 2026 14:54:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] tests/intel/xe_sriov_vfio: Add module
 load/unload subtests
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20260318161447.961840-1-marcin.bernatowicz@linux.intel.com>
 <20260318161447.961840-2-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260318161447.961840-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::35) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|IA4PR11MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: a5210737-ac2b-45bb-37bf-08de89acd1c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|7053199007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8DufeoSxc0xtaDlbBdmlJbaih7cLBgGx07JvTPYw4pGPTPnaisU2XYVZGO1W/LTXd5/lwhB9oDjWHu7ZAc1qr3sGT6pRlbV5kyqYjIbHMDJ3QLnKJnNJGEy3sewAwJFpCNSxjipZro6aqfaRuEtQ1CH/2x6kChPw77sfYqmGg8QwdDloq0rJDXjgqBzBRLMTvjuq2bXfQg/KCxZ0MwiSx//REp6RJdKo3gogIhj/YRyJRw+n5R4kJYg57nteoilNAVeRJA6bR0tpr4ZE+rqYb5DMt3i9bPhI+XjAkNBX9mLEY/iKUhIFiAGUBWPSiI0CUWKOhprjJmR5UZtStOfyybT4jPSiplUjX+Im4hmdTSf+D3tsYrJ+YdOcfrH9XEL+VJ0urXjhoAYQVeKNC8qShaBm0kQ8DqJIUf2lg85WON+C1u0VjKMQWQBRvVVVn82ysHlZIpxUtDUbh4uUjWimyulQGLHGVFe359XjXKSNupEVMxGNSrZQRlEhM22KFWk3nxI08Lv6z7DU8UKSXgaJibE6OEphBlW5GRWbGaKOxZOt26yrY3p0nFVpCcoLkMWPM/Q4pphWXg/HWCCGtMU2vVl5jWke8pp58kj93Dvf6uRkXiVKB9fc9/rXsmC1CrXPJOS24SO7mqSYyGpe1U4auelphnexYe5K9JnusqOf4i0WrgaAvViVHsru5X1bSwNOouIJIA2dade9nA6jUPuFYvNwoznWn9vODNY/JVNl6yA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(7053199007)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTB4YnJTdThyRDc5OE1XTXVFOTFZbklxU1B2U0MzVlptZ0VpcHdqM0I4Wkdv?=
 =?utf-8?B?M1h0VHE1SHBSTU9xUXI4S1pjSGJRWUtScHZ2L3RhRC92ZjkxMGdSa3FPUDRn?=
 =?utf-8?B?ZGk5aXdRV0pmRTIrbVRwSHpqWjBGWWZjTFczcFhFR3hZWU5Eckp3NkZjNzBD?=
 =?utf-8?B?OVFPQlVyKyt2cnVUbGt2RXhQdUJ5WHJBc2MxMG9PMjdVVlRoN3did09YUEN3?=
 =?utf-8?B?WjRobnR0K3Z2OFJqM3V1dm5wSERaSEhXd3ZLbGpEd0hCQXk4ZTJwTEJwVk83?=
 =?utf-8?B?SnRxdm0vUGx0WmlCZWFSMXpIQThHOWg5eGQ4eUVBVHphbDZLSUlkMlpRL1RR?=
 =?utf-8?B?MDViNUdscTYySlBKOW84MFQvTXpEKzd4VjhIcWdrMlZvOERTVVcyakJzeFJR?=
 =?utf-8?B?N3RobkFqeC9NakZ2Z0hSc1pnS3lRbExqMXFmSmxmU3VtZnZ2Z0I2Mjh0UUl5?=
 =?utf-8?B?SVZZVHlRMkJNd3IzNU1MSW0xOXFIU0QydlU0MG4zZVIzNDlicjFvUUlLVi8x?=
 =?utf-8?B?dkl5QVpqaEhmOWZ4WE9IR3hCWVBUdUxuTkNaQ09NVVgxYnVoWmpTY0xKazBL?=
 =?utf-8?B?MmRkbFFXVGp0OVNEalNmbWFWMmw4RlA0ZnpNUGM5Wk9PLzYwdE8vell2SGFJ?=
 =?utf-8?B?MDJPZ1ppZHpDOWpOYlVNTjNMZnV4WFJZZUg1SEdxQ0VxaWxHQ0ZYZ0NxM2J6?=
 =?utf-8?B?b1VtSVNsK29TYW5VYWtqeE5NMWxCSkNyU1J3TXkrTjI0ZkIrNHFwT1gwZ3o3?=
 =?utf-8?B?UEtHZHU1Wm1FSUJIN3hFZVh5dEN2MGsvazhzdWNNMXdlY3hMdnZCUzRhdDgz?=
 =?utf-8?B?UHNkZjdHcUNVQm9TQUVjU0xyb2RaN2xtSWk0TWdWZTNKbEw1bkdBNW90RmZJ?=
 =?utf-8?B?VnU1bjhIUlhjL1F1MFRkWUV0aXlOZEFOVTVHMTlmOXBkU1JVYjlaWVkzUmRG?=
 =?utf-8?B?S05qZS9MeFBQUmUrNXdnalJnODlKaU91L0g2RldoYUlCTVA0cGJYL1k3ZzYr?=
 =?utf-8?B?dW1SRlg1VUozZEMwUFl1QWs4K01ZOFhZeTFrWE5Xb20wRGtUVndWdStuUmE2?=
 =?utf-8?B?WThtWFR1dHM1SDNLVGNXeC9KMnVybXY0WUtGN1MvTkRxVnFnaGJDRHZhNEFT?=
 =?utf-8?B?dEhWZzN3c0ZNemxjZlkzZ25PSVZtUFgrYWorTmpKZHZ4VkdwQXljdjVMNXRY?=
 =?utf-8?B?U3IzVE43Ky9DQzRNTTIwK1ZudStyNWM0VVNZYkNDWjhIZHB1elcwYVRta2pu?=
 =?utf-8?B?RWpWNERzVnQ1dm1oWFpEVjdOY0dleFpOc1FDNTlMNE5xcHdUZ3J2QkRvVXZu?=
 =?utf-8?B?ZGhDa0xmVkd6bTZrTkNKN3pUV1hRWitZZVUwbGRraFNRVzQ0T2tvNC9aSGw4?=
 =?utf-8?B?WXp4YUEvd3dKS2lzMitwTnZpQWwrcDEzRlVOQkdWYUFHbWlqN0gwcHVIY3pD?=
 =?utf-8?B?V0s0SkkrSjRNZkhYTUZkaHB4RFFVdGRjSFQwbDVRSVYzMXIwV0pDUXpQUjND?=
 =?utf-8?B?YzNpS05oSWlUemFSVC8zNXhsY0E1MWNmalcyUmNJYWljNUF3NXgrSFV0UTJI?=
 =?utf-8?B?OWpLbWRud2dXekgrNnB6TVV0dG9tdVZzSzR6anZxdVZHY291K1lBZE9wZmMv?=
 =?utf-8?B?S1BtbGVtdkZ4clQ1aWFsalloR3Q3aXQ5WFVzV0NVNVo3VUxkSVBhWCtYanR3?=
 =?utf-8?B?SDVhaXh3NzZLZXl0eTladUluamJYWU1rVDF3WWdXSDRUck8xeVloMi9kczdZ?=
 =?utf-8?B?cDUxNUdMSVV5UEJ3NWdIbnlRcUV0KzhlOTNDd3R3TkRDMEtRRFhpSytqemQ0?=
 =?utf-8?B?cjNvcVJKdkxIbzFjSWxBWk1hT1BzQUdPKzF2aElRcUlKem8zamRWa1JDWE5p?=
 =?utf-8?B?ZVNzLzlHdE8rUWMrVE1sQnowaE5UQnJWVjdTejJoTzcwVVpRK0hTTUQxZEpj?=
 =?utf-8?B?bzRreVlJNDMyTEtEL2ZXRzhQL1lRUTFjWGl6Qi9ncmlFVkFvNVZ4L1ljcW9i?=
 =?utf-8?B?MWs1ZlNibmtYeEZRQ21WMVpya1ZZeW95Sm4wMVlVNGFYK1E3ZitsdEpuYkFi?=
 =?utf-8?B?VU9aN3NQS2Jrc0FId3Q5Mjk0dDlpbkxTMFFjRng0dkNPMk1HSlNNWjU1TWpI?=
 =?utf-8?B?aVFVb01qQXM5QXdCNXFGMFh5Q0Nqd3Nxa25tdHJJODMwU2VDZjhPZE5yWktw?=
 =?utf-8?B?ODZWMEUxSnhjSFdwQ00zUHRaU2dJT1pZYmF3My9UcTJKLzVxbWJteno3eGxh?=
 =?utf-8?B?blZOSUZsUFJtdnA3RVNxb3M1N3VSTmVRclFrNHgyc0k4NVpDSStRazR2Kzk5?=
 =?utf-8?B?Qm90bGx4aFdhOUd0WGdjeHFXNDhPVG9VWWJFbmZpcGl1eXcxbVdlQT09?=
X-Exchange-RoutingPolicyChecked: PbjhxgfKsakszTtZp5dtZorD19swk9P1yHQnePA8jiejXCrddS6j8LxABnGib1dwyl4DuXBroIR9F6j7ss+XraLWsFWY7VID0P7IfExDLOnZhJIZhC0YVDF6QuTnnWEa026q5NumW+LPeP0WsQepuk0XJ3G4XrEk0dfGhCZeL+xjR0Fi2r4289sC/dmMq2z4gAFF/6HWl/6a8fjwkv39EYXAooZA6GtTTKBN9qZbbiHg8xNK3uHUHm5SSJviR8ILzGB+iiP6Dq3uBv86L0Hk7O/rd3BJQ4VfKsAL8lh90quvpp8j4eG9ePOUQicyMQbzNsv4SzdPO7Rut2WDpwVJDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a5210737-ac2b-45bb-37bf-08de89acd1c5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 13:54:08.1026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gl+95+h1/CORBRvI0jtt1IPUKlHy0qbkgEsA4g+tHjst5Vs4Vr0nmcMu3IVtG57JGJC0cwV+oqbdJuCX53wT6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8913
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


On 3/18/2026 17:14, Marcin Bernatowicz wrote:
> Introduce subtests that verify xe_vfio_pci can be loaded and unloaded,
> while reporting already-loaded or already-unloaded initial state as
> success. The unload path still skips when xe-vfio-pci has bound devices,
> to avoid attempting removal while the driver is in use.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel/xe_sriov_vfio.c | 88 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build           |  1 +
>   2 files changed, 89 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_vfio.c
>
> diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
> new file mode 100644
> index 000000000..2fe0137e1
> --- /dev/null
> +++ b/tests/intel/xe_sriov_vfio.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2026 Intel Corporation. All rights reserved.
> + */
> +
> +#include <ctype.h>
> +#include <dirent.h>
> +
> +#include "igt_core.h"
> +#include "igt_kmod.h"
> +
> +/**
> + * TEST: xe_sriov_vfio
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: SR-IOV VFIO
> + * Functionality: VFIO module
> + * Description: Verify basic xe-vfio-pci module operations.
> + *
> + * SUBTEST: load-xe-vfio-pci
> + * Description: Attempt to load xe_vfio_pci module.
> + *
> + * SUBTEST: unload-xe-vfio-pci
> + * Description: Attempt to unload xe_vfio_pci module (skips if busy).
> + */
> +
> +IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
> +
> +static const char *XE_VFIO_PCI_MOD = "xe_vfio_pci";
> +static const char *XE_VFIO_PCI_DRV = "xe-vfio-pci";
> +
> +static bool pci_driver_has_any_bound_devices(const char *driver)
> +{
> +	char path[PATH_MAX];
> +	DIR *dir;
> +	struct dirent *de;
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/drivers/%s", driver);
> +	dir = opendir(path);
> +	if (!dir)
> +		return false;
> +
> +	while ((de = readdir(dir))) {
> +		if (de->d_type != DT_LNK)
> +			continue;
> +		if (!isdigit(de->d_name[0]))
> +			continue;
> +
> +		closedir(dir);
> +		return true;
> +	}
> +
> +	closedir(dir);
> +	return false;
> +}
> +
> +int igt_main()
> +{
> +	igt_describe("Attempt to load xe_vfio_pci module.");
> +	igt_subtest("load-xe-vfio-pci") {
> +		int ret;
> +
> +		if (igt_kmod_is_loaded(XE_VFIO_PCI_MOD))
> +			igt_info("%s already loaded\n", XE_VFIO_PCI_MOD);

I think it would be better to skip in such case.
And igt_kmod_load will print "Module %s already inserted\n", so this 
info seems to be redundant anyway.


> +
> +		ret = igt_kmod_load(XE_VFIO_PCI_MOD, NULL);
> +		igt_assert_f(ret == 0, "Failed to load %s (%d)\n", XE_VFIO_PCI_MOD, ret);
> +		igt_assert(igt_kmod_is_loaded(XE_VFIO_PCI_MOD));
> +	}
> +
> +	igt_describe("Attempt to unload xe_vfio_pci module (skips if busy).");
> +	igt_subtest("unload-xe-vfio-pci") {
> +		int ret;
> +
> +		if (!igt_kmod_is_loaded(XE_VFIO_PCI_MOD)) {
> +			igt_info("%s already unloaded\n", XE_VFIO_PCI_MOD);
> +			igt_success();

Maybe it would be better to have one subtest "xe-vfio-pci-load-unload" ?

> +		}
> +
> +		if (pci_driver_has_any_bound_devices(XE_VFIO_PCI_DRV))
> +			igt_skip("%s has bound devices; not attempting unload\n", XE_VFIO_PCI_DRV);
> +
> +		ret = igt_kmod_unload(XE_VFIO_PCI_MOD);
> +		igt_assert_f(ret == 0, "Failed to unload %s (%d)\n", XE_VFIO_PCI_MOD, ret);
> +		igt_assert_f(!igt_kmod_is_loaded(XE_VFIO_PCI_MOD), "%s still loaded\n",
> +			     XE_VFIO_PCI_MOD);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index cecb4a8ae..26d9345ec 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -337,6 +337,7 @@ intel_xe_progs = [
>   	'xe_sriov_admin',
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
> +	'xe_sriov_vfio',
>   	'xe_sriov_scheduling',
>           'xe_survivability',
>   	'xe_sriov_vram',
