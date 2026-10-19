Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD10CCF2D3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 05:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D0710E0E7;
	Mon, 19 Oct 2026 05:04:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F5910E0E7
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 05:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792386215; x=1823922215;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hdt5OZGzAJHUG0OPdqH5CJHdQ/38jCFDzbi+yZ3E7JM=;
 b=End9+c4o6s0U9F7iTeODzR4g/Ldqbo2MYNJrewvB6rCOaMUDp1A8Qmdb
 tZ/Q5GHczy3XAxNWC5R7eOZm3OKhuvE07ZVbQc7Q4IICFkkFBA6Yhfh6W
 ZIfrylOgRu6u96XsbAzIbr11g1DSXVMAGa/0n752fsAzXaKNUzET2mxdU
 2RwxjrIMwULpdO4Gg0GvD8bpgnXLxauPaUEo0rWTGbL3YlTAglAKa+u0l
 iY42KJ27H9mjzhaLh9larU2XTBp07bZM5Da0C12wOK85qc3b/UqDV6Da9
 anq9JrZZTfv44wLUde04AQRJlDMomYwzQpPjUhayc76cRMTXpRe1xCDR8 Q==;
X-CSE-ConnectionGUID: +xFbtQZASbidhA4+63lp9A==
X-CSE-MsgGUID: i3+ErowgTcW1cF6ZL0Amlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1095581"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1095581"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2026 22:03:35 -0700
X-CSE-ConnectionGUID: NyPsc0uuQaCNtWarYf6dHQ==
X-CSE-MsgGUID: WnK5sQ91RGGT1Qu8Itycrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2494093"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2026 22:03:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 18 Oct 2026 22:03:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 18 Oct 2026 22:03:18 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 18 Oct 2026 22:03:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnGp7kB+ZvnBhYvFTybP3IcYRL9iJX2hiumldBkZuaR0VFhtsDqmq1ziR/Z5qfPJ+xxEHApEtzPDRGSDHHCk8wqrKI/YjhFnpWRWfR7hEWrkdGGgF76S6AjwhQzSh8ynz59/FhL7GVRQEjtOPRzm8xTDBmbpfmEJs4HrxupYonvzzMjhHN7ODywndNyQt4YGzHFIx8PUCgIwyaiXFjgGAyncGWkCVKmpOs4AEHwrg9TlcvjSPN+t4q3sPhMHkS+Ja0o/zjUsb++xbm7jyWbgIr5UvOthLYq924wJW46bc0y2VW6SXc6Hr0pVmtZPnjxgFfsGiRcwH/C31Yd9C3rMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LO1LBVb4wFJude0uUChd6sthkJVWj3qZ0YgG/oN2x20=;
 b=HIFP8j1DalS5FLM+JmX5cUyl7fJlsTkrjMdKPpsi/Dg2YNFngG9VuiljBS4CatS47IzKzTb8rc/QgQyAeSSh0Ai3kjjGmZ527s6paeIxESknHoAsf000CKE9sw3ZZqHVmyAydKT+StmZOrXGBOBJCZWRVWu7tBsBmRSN7+nnVv5Zt+WXX4klPVI/DSgNDNe46fiDNE13ItRtbMwCdmFrlwLpWJluGxr5uQlKWyThl+v5xdAU+w/NP+/H4fwK0VlsbMkDxtix9xZI2dSvnmxk4Ecql/+PvsoFNwMXvQYEVQrk90JMxzMEgjSOw3rqxJRcDqQqayBfsZOZhzoOcGyiJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by CH3PR11MB7938.namprd11.prod.outlook.com (2603:10b6:610:12f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Mon, 19 Oct
 2026 05:03:15 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 05:03:15 +0000
Message-ID: <696e602b-d3bb-454e-9fbc-f1002abf83cd@intel.com>
Date: Mon, 19 Oct 2026 10:33:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/xe_oa: OAM has broken stream on Xe3+
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20261013044215.280639-1-shekhar.chauhan@intel.com>
 <atKRVBpFmlsPy7gV@soc-5CG1426VCC.clients.intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <atKRVBpFmlsPy7gV@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::8) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|CH3PR11MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c61bccf-cb87-47a6-d4ec-08df2d9e4881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: EOcM/r6B7DGFlV7ifhXZ5AH/eFCmKS4j0r3VHwIE5Z8fYob3sQL2CkIEwamVGeX04cgmVf0yu9YD7U10W1UBOUTcKoOvc0hKxU6YaR5KXoci9z+lGg7j3GNjSf+px70FWPbX7qxtwiKvwv6cg/zsvW8UuBB8JXwaOQgd7jMcnj74iI9GFg9OTFqGUz5Qdb6xF1iKXJftWZd1b306YiOQAk/431npJeFYPIvUtIFwMc03gALduCDaTEMIM/wNFoHoaRGgEjMijwdGzqA3aSN6ysk+pEqFwgrQjVJbo8Jww3g9qmHO3/9c+npo87RtZsaEYDCoQFouE5VJyNyb5Xduf0lxYSfnIF+PwDGjHUaq2JKC5s7QwmFXh17xzK/EyiIhVVsALf3Ghk4lcimadtxapTaodqPBZmI21Q2jaeioeVRymWzCdxhXd+g6s64iCdfsWWlQlFRGu+xv23UfGLULuNk6dEDldytFl8laYbh3rObuND2L5/6Jcr8KpoWYfUr6PJWwJaP04q3gABeFuFqpJbglNlh9300V1FWIQf+SCiwZvsuXtdvlOypREPFJYKowr1jgEvE26BgZMcLEZak/TerHuxln9PgyQFY4j4Yfh7AlvfgzgK38flz8icUT9foQZqfaGyD2SuEKvrmLOE3SEpayhVr4Gdj7OBPS8H49s34=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjhHdWpoTi85NHFpdWdCczNsUEFraEZaWlZ2b0xSRDc0bVp5anpxQzhVM1BZ?=
 =?utf-8?B?d1VWQlYrcmFlQk5CVUZ5eDl4bVJZZUxqS2xTNktzNmJDNU1LNE1PdCtSM1cv?=
 =?utf-8?B?UGRPZ2VQYy90N2FLL1EyL2tOdHNMNzR3STdKQ0NJc1NHeWZ5d3Bvb3lSeEtS?=
 =?utf-8?B?UER5a3pta3U3Nyt3Y1JWRmZJMnBuVkhSTWUwcmZGd2ZGU1A5Q3FXemgyZnJo?=
 =?utf-8?B?VjhqcW8zQ3BBNmw1b0VBUmpPck9NT0dIdVZNa1ZhdUhzS2JralpyL3ZUaXdF?=
 =?utf-8?B?MmcwWWxJUWxFQSs1c05qT3NseWMvMjM1dDRMK05Bd1dzb2lDTWFxdEtINVdN?=
 =?utf-8?B?dmtiRnYvMHRrNDFOM3VPWWVsbndPMktXbitmNE4yNk1pZy9IbXp2eG0xdmZR?=
 =?utf-8?B?OUt5TlMxOTNTZitybElGWlRiTHdnRFFKYzNWcFlua0RLQXBiS2x2VmIrRDk0?=
 =?utf-8?B?KzJzekEwUnd1RmsrQkRDa0l1WlFCQmhJMGx1S2FHVEN5dCt4QURmS2lMUVR5?=
 =?utf-8?B?NDN3YmRFVUU4ck5DMjNweHlHUXM4TFJWYVc2NFlUZWFHVjg3eFNOb0RLcHln?=
 =?utf-8?B?NXNZTkdmMkhKNkJBZEhQTnFMbGJYS0t4SG5LMVN2aVBXV3Q2aU1aaUg2YWRp?=
 =?utf-8?B?VUQ3Mlo4NXN3Wi9GcG5scjJjQTgrMFBISkNBK0pkZ1FUN000RUR0WWRHblNj?=
 =?utf-8?B?RjZXOStPNWZvRm0vSjJKbm4zWitEd2JUeVNaSTgvOUNMQWxXd1hQaXB3dVdN?=
 =?utf-8?B?OXl4S2U3K1JqSTFnMGIza2VhcGNGSGZZbWExeU1GdkdmMjIyTndseXVjK2FG?=
 =?utf-8?B?ZnpqbjZmSERNMURCVzhqQ3dobTBxMVV0UlhKT3BmUXp3YXlzcmdzMEhKK1pv?=
 =?utf-8?B?djl1V1dpUmxIRTFETzVpREVDQWE2cUlUV003S0ZLMmR4Sk1HN3FtemF4NnEv?=
 =?utf-8?B?Si92akY2UzdKY0FhV3YvemZQNW5uUW1zSUxVeVh3NktpL1IzUW5XL2YyWWtn?=
 =?utf-8?B?OUVxQ2xkVExUS0VNVlh5am9BVnBEOGhHajJhY2xwUHNMdXhRcFdmN1lWdks2?=
 =?utf-8?B?d0tzTXlMdnhRa0xDajZWNzV3dWlSczBJSkJUQjVUUEtQRGNIZjZGVkREeEc2?=
 =?utf-8?B?YjZ4V2MvTVVGT2JjSHd2dXd5NTlTUndxa2x3MWNHbXhNUGFBY1JGMEx5S2Uz?=
 =?utf-8?B?ZmVsZmVWTk4xWGc2Z05nV2tHWkdTOFRyaDJGRVk4ck1NSk9NQVhEUnVld2xS?=
 =?utf-8?B?amJOYzMxWjJ5YTV6T1dBanZrTmtQTzYvR3VxZzlJRUN3OGJzSEF4MHhZVkdL?=
 =?utf-8?B?cTVoeU5KWE92Z2VOT0U1Nk5zYitEREJQRVo0RkhJUjFMeEloSFIxQnNtNk1J?=
 =?utf-8?B?VnEyRjNrTkl0Y25MdHNXTGNPVkd6SWMxVUpqaXF5RDd1ZjBmS3cwQkJnaFM5?=
 =?utf-8?B?VVN6c3NOaHg3bzhzWURnQ2Zocmg1YnR0NFJ0UWthVG9nZjB4L3ZGRGc2WkxC?=
 =?utf-8?B?Q2NMZkJzRlpmRysza2FVL2ZLZTJEam4yYVlkQWtBdzdnRFhIQUtYcGFDWmht?=
 =?utf-8?B?RExBRldUb2RRcXJYTFBvMjdqWVRzeWFHMllBNWZEamdiZkJJcDFrTVQ5ZnZn?=
 =?utf-8?B?ckJSU2N2NTVyNlpNSFBlZ3o1SGtDZExacVZPNFBhVkhvQnN6OHgxRlRudTJp?=
 =?utf-8?B?TkZBK0VjeUd6MVhPSjgyUWhsOVVMUUJoOXQ2WUZjYWFkM3EyN2FtdW9HK2Uy?=
 =?utf-8?B?dkZkajRuVUpCdzNFeUNnY1VZREFZNklzenRtRTdlSEt4cXdQdEJza1ZkWXRj?=
 =?utf-8?B?bWpBL0JtUjUxQllWYXlXYStwTXp3SnRIdldEU1FZRXJLNnJLUGJYODg1QXRG?=
 =?utf-8?B?aVFSNWNnbGJWa25hMy9kRWtjYjA0ajBXSDQzUlhrWURURjZCczdWaFQ0eEls?=
 =?utf-8?B?ZGtxVVd0ay9GWjF0QXAyTVdsOEd4eWhIQXprZUJzMDlncStORlNFZksyRWxI?=
 =?utf-8?B?VTdkcHUydkc3SzZIQmcwQWtBRGhEY3JIUGQ4VXFnbVVRTzlKZlc4TTZLWFZ2?=
 =?utf-8?B?dUFCb1Q4Mi9pY2hGaXRsZHVjT0VUSmdhM3NUbGYzeWNmTFVsVGdNOHJMYWVm?=
 =?utf-8?B?WENPc3AvUmQ1Z3hXQ0xLTCtjTnAyL25VSzJVQ2pKelF3SnVROGVuc2UxR1g4?=
 =?utf-8?B?elZKbTBTekdCR0tjQ1hYL3ZmTmJTMm5xU2hMdjAxaFB6MmtySnVaazcyTlEw?=
 =?utf-8?B?M3B6OXQzTjJOcFlaYWhtazhDWFdsWU1SSXBkYVFpdW5ib0taaklGMElnUjhU?=
 =?utf-8?B?WnhCYTgvNnlQR2JteTd3NnBYWkdjQitqTUNsaE5vZElqc2YyN3VmbE1tNVR4?=
 =?utf-8?Q?3OPXeS9IUKbPDR40=3D?=
X-Exchange-RoutingPolicyChecked: gM2lVHp9QVqNae2fo382SVqn7tc35uHRPltVKZjIiogH4V4G7/cyac0Ts6lG+H0fXW0h3sDZaP8ynVKs7jlqCA2Rq+/SNX+AqJJh5a3oqr/vBNLE6SzN31/qvNYtE7iHssBqbd3P3NQE27JmPb/kBhlPPXm3UYa/y8moFYWezzQX47cp7BZifnVr5qz3smJhKVQ2QC6/ABx9iZlRp1ShbruaviQoh5xyKq/jjze0opiiExCKWN6sYPvn+iJ/CFq7qm1mo60z0HaVWeekT0jZ04jBIxHunNjQL/Z9QrZpe6DFW19Mw9HKkLBvrdgrg7326oWIzDt/3J2EkwAhhJ4lSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c61bccf-cb87-47a6-d4ec-08df2d9e4881
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 05:03:15.6099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BganQwrUppj4kVo/+3qQOZRuBWpRXiTqu4bhejGjESZrS56tq8dQ7cqU73oML5FMMeJYsqkU9IOXjmvW0IbxS8M7TSgC7rSZaixUcbgu5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7938
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


On 10/17/2026 2:34, Umesh Nerlige Ramappa wrote:
> On Tue, Oct 13, 2026 at 10:12:15AM +0530, Shekhar Chauhan wrote:
>> Extend tail-address-wrap to all OA units and force the 192B format on
>> Xe3+ OAM to properly test it since other formats on OAM don't use 192B
>> on Xe3+ platforms.
>>
>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>> ---
>> tests/intel/xe_oa.c | 31 +++++++++++++++++++++++++++++--
>> 1 file changed, 29 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 9ebb18690..d6c3c4a6d 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -4516,6 +4516,29 @@ static void 
>> closed_fd_and_unmapped_access(const struct drm_xe_oa_unit *oau)
>>     try_invalid_access(vaddr);
>> }
>>
>> +static bool oam_has_tail_address_wrap(const struct drm_xe_oa_unit *oau)
>> +{
>> +    const struct drm_xe_gt *gt;
>> +
>> +    if ((oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAM &&
>> +         oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAM_SAG) ||
>> +        !(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID))
>> +        return false;
>> +
>> +    gt = drm_xe_get_gt(xe_device_get(drm_fd), oau->gt_id);
>> +
>> +    return gt && gt->ip_ver_major >= 30;
>> +}
>> +
>> +static int tail_address_wrap_format(const struct drm_xe_oa_unit *oau)
>> +{
>> +    /* Default OAM metric sets use a power-of-2 report size */
>
> I think the comment should instead be
>
>     /* Pick a non-power-of-2 OAM format to verify tail address wrap */
Will take care of this.
>
>> +    if (oam_has_tail_address_wrap(oau))
>> +        return XE_OAM_FORMAT_MPEC8u64_B8_C8;
>> +
>> +    return oa_unit_metric_set(oau)->perf_oa_format;
>> +}
>> +
>> /**
>>  * SUBTEST: tail-address-wrap
>>  * Description: Test tail address wrap on odd format sizes. Ensure 
>> that the
>> @@ -4530,7 +4553,7 @@ test_tail_address_wrap(const struct 
>> drm_xe_oa_unit *oau, size_t oa_buffer_size)
>>     struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>>     u64 exponent = max_oa_exponent_for_period_lte(20000);
>>     u64 buffer_size = oa_buffer_size ?: buffer_fill_size;
>> -    u64 fmt = test_set->perf_oa_format;
>> +    u64 fmt = tail_address_wrap_format(oau);
>>     u64 properties[] = {
>>         DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
>>         DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>> @@ -4879,6 +4902,10 @@ exit:
>>     for_each_oa_unit(oau) \
>>         igt_dynamic_f("%s-%d", oa_unit_name[oau->oa_unit_type], 
>> oau->oa_unit_id)
>>
>> +#define __for_each_oa_unit_with_arg(oau, str) \
>> +    for_each_oa_unit(oau) \
>> +        igt_dynamic_f("%s-%d-%s", oa_unit_name[oau->oa_unit_type], 
>> oau->oa_unit_id, str)
>> +
>
> Maybe I did not think this through when you asked me offline. I think 
> we should still prevent the tail_address_wrap from running on 
> platforms with OAMs that do not supports it. See LNL failure in CI. 
> With this patch it runs the test on LNL OAM and then skips it because 
> it chooses a power of 2 OAM format (so area_size is 0).
>
> Otherwise we have the SKIP noise in CI that will need occasional 
> addressing. Now it flags it as NOTRUN -> SKIP. Thoughts?

Okay, fair enough.  I'll address this in the v2.

-shekhar

>
> i.e. __for_each_oa_unit_with_tail_address_wrap()
> ...
>
> Thanks,
> Umesh
>
>> static int opt_handler(int opt, int opt_index, void *data)
>> {
>>     uint32_t tmp;
>> @@ -5146,7 +5173,7 @@ int igt_main_args("b:td", long_options, 
>> help_str, opt_handler, NULL)
>>         long k = random() % num_buf_sizes;
>>
>>         igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>> -        __for_oa_unit_by_type_w_arg(DRM_XE_OA_UNIT_TYPE_OAG, 
>> buf_sizes[k].name)
>> +        __for_each_oa_unit_with_arg(oau, buf_sizes[k].name)
>>             test_tail_address_wrap(oau, buf_sizes[k].size);
>>     }
>>
>> -- 
>> 2.53.0
> _

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

