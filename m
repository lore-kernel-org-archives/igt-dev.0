Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388BEC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 14:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF78A10E9C1;
	Thu,  6 Mar 2025 14:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dtq6BA1T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A2910E9C3
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 14:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741271623; x=1772807623;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CTz4tMQ60MEgLb2qqvZvbgIet7HUrGds6vjF2dBZf/k=;
 b=dtq6BA1Tz4gzvzh+cyglz5XNB0pbrrKhq3NRrg0oNHdyRn9Ab3kBmp4o
 XJLWF1WGLwthhV3qPAcZdZb+aD/TPsQtXTSROeKlrC+MzSHUyUESTdNS2
 6iVwmZF51POSurVD467sc6I93qkmNXaIr+filvy9+HdMZzynvGkYvdvwA
 TzXzY1wu4oC76f1gCjnzve8aH1oeRyvdDHBkLHwZWuh88elHcnGClGNht
 nxc8GMoYVNHUwaj4RJ7O6cNQm6ZdrpyqWHTVI9AXLhitbIHlLwlEKWtTx
 h8Bu01OJzfPcgZw5FHy8lnGMnG4lOVQE88AuOxRkwUmQxVUKRotpfKgFY A==;
X-CSE-ConnectionGUID: NZfXd8lETW2LXKWStcmwcA==
X-CSE-MsgGUID: VrK/xxEAS42vun/xPFhURg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42416918"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42416918"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 06:33:37 -0800
X-CSE-ConnectionGUID: sYXantpNRguaHKUBkgy2sA==
X-CSE-MsgGUID: 82IvL2cJSdm+/TjzmDSJZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="119539085"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2025 06:33:36 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 06:33:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 06:33:35 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 06:33:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvZ6JCZ3OjUXdYWBdu2OpMkbIK65FQI4HZ0hQrBQwbV5Hz8xcBwiyxt9Vv1VIpETbaVYU3Hqc2ObsyL7hSn0cvKHtxplpeG6TGW92N8kZNQj98d0OI+pCnHD82NW4OUsJt+FApVagRV7/V7AaoQnHJBu9gajVHgvZa1OzBQ6CETLNdjwe+nES1i4WPZJ/cbwgjfBu5ad5/jM2B/d1VXI1Ixwn42Zo2ptT1EQhThPuJhr7HxxJXqlHEPy55TdYqDktO+1XlkFfKUKUi1mfZAmIPiZQaab9Vge9rXQ0I1ggsF0myRPS4puoGuS4bYnOZGGYepKZ8hmbNwsHEUoPTwtQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSDELnrxAVuc1BlgLDmQeImhKEvqgyY7F3dP0kPvKcQ=;
 b=mD7sxW78VOth5IuripbIiFLw0s74gVkcG8d3Nev7t2Eywa/aqfKMTYXHEWxpIaFSCNsuuehx0uaxUtnqN2ka/WLA7w9qBObOWTDqjFxTZDxO6UhX9RsTUyXMQjs5x7dXDGTNkex7kga/PmkxDDekmSXA1moCrkQ2jb3x9XfPkAOVCa0iqPUKVqt1dL6M/oh1Vz1vZQ6Kj0AVMTQr3S3qv1zxrFGppj7vjK9qL6RmyiYfrFKX+nJKC0KHYqpQ1kw2Mx4gXBElpPbCutJkMQR7MYLnWHSexaxBor2Ur9ynllji+g4Zh7P3vUsu0//6OoG2bhzEOn71alUIgDkslPOp6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DM4PR11MB6407.namprd11.prod.outlook.com (2603:10b6:8:b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 14:33:05 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 14:33:05 +0000
Date: Thu, 6 Mar 2025 14:32:54 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ewelina Musial
 <ewelina.musial@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v5] runner: Parse results harder
Message-ID: <cqyyb5cdajtgvawd2pjpfyk6ndiwrruikzsaftyjabtp4brfi2@on63orggjlux>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250305193137.295162-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250305193137.295162-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: VI1P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::21) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DM4PR11MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: 961f13e3-d738-46b7-03d4-08dd5cbbce73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXVwM1ovSFlpdDlsQzJtcUFPVlpRTzNMNDlkbEFKSzQxQW9YVmt0TXlnaGMw?=
 =?utf-8?B?UjNNZ3l5bHBNajV1RXRYNVprWjh1bVFhVEM2S2huM0RlZlF2MVlHdThDOUdT?=
 =?utf-8?B?alZObmNVS1RhNHB4Z0NzV2tCUG42NkpsSEFvNkdlYm1sQUJJYmRLVWI3TjBT?=
 =?utf-8?B?TFhtZy9Zd2U2UlRXRElvbndML0hPKzRSUkRXbWJCZS9LbExPR1U0aHRtdEVH?=
 =?utf-8?B?SWRLc1ZhdENMdnluNWFoQ25VamJkTUlEZlpubjVEQjhzSm82dDdWbzlxeFV5?=
 =?utf-8?B?RTZNMjd1Tzd6WHNjak5STmFYQVFjNHZwbWgxb0d1d3lkdGRhWWtNc3U3TE9Q?=
 =?utf-8?B?RGxkbTFFYzlrcXdLdTlqYnEzY1RnajBnaktPT0ZUTjRQZ2RKK0pZRythTU00?=
 =?utf-8?B?cDlKT04zZDNVUG03YUJGTkxqaWtBbDlVWDg0RE9ETUVVRXJNSGtHTkFIWmdp?=
 =?utf-8?B?ajVFcFdOZzNSRnJoV1NLYWswUkNCZnl4bDVNVi9SRUNTY090NWUyU1FKZlI1?=
 =?utf-8?B?NEFMeUtldnJSZ1VYdHVhdUUxTkUwOFdHWnloZks5Q01tOUM3VjkvOEI1OGlU?=
 =?utf-8?B?WHllV3RiWHAwNEtocFZmeTVVNm92akVLUVgzT2tmcFJpWWlqMEZON1JJK3Q5?=
 =?utf-8?B?bHFuNTgyK0FwSlpoNzY4UUlScEtNeTZuRkxVS0tDVUxnWGE2M3lWRUtDUlJn?=
 =?utf-8?B?cGJRL2xDcTk0ZUphQjkyVXFGRWF0ZVFSaWNhOHF5cXFuNTFzdTY3OEphb28x?=
 =?utf-8?B?WDY3cUFSdmdDUHdyMUR1RlNtTHExY1YrM0YxYWFKY3NjWVd6Zk8xcUxqMUFu?=
 =?utf-8?B?cDFhTElIWVpUaE9ka1RGU0JhdjQ3ZWs3ZEdXODNSdXlFMDVlcWhFYTBlWUZ1?=
 =?utf-8?B?ZnVNQ0drTmwveGdNUEoxdmJOR3hOVmsrOWVLMG9qVkZrZnVkTHpJbFdMcUV4?=
 =?utf-8?B?bThvMEVMRjgrZjZLWnlQQ3krQlJwWVBCU2R1VmFEdTNmL0FvT1k1OXlDVmtz?=
 =?utf-8?B?WVRNdlJmakxDLzlNVTNYdVUrYmpnekhyeFBzYmFQQzMxTHo1WC9KazBpL0Zh?=
 =?utf-8?B?d3d2TTJpaTN6aFZqYzdYaWxuVkJlY3FpVFdFL21acTVFM2I4R25wTDFlenUy?=
 =?utf-8?B?YXJITmtZZ1JYMyt2cm4xQTlGTWF6cmN0N0JnV3pSVTh5cCswRExnOVdzUTVs?=
 =?utf-8?B?enRESDljTkNjQkkzdEwvSHg1N05heG9SWHRxMGhaeTkrZTNzNlVTcjlya1do?=
 =?utf-8?B?dGVwOFozK1lWTEVOdkZST1BnYWpveFhTYkNvNlhRNytyL2hqeDU3RXlLc2Ri?=
 =?utf-8?B?M1lVY0w2cEU4ZEs2Nms2c3pjeHRpSWYxSUhwdXRZTk1UemhGdWZ3RTJXeHFI?=
 =?utf-8?B?bjNiQVlzVzlPUkx3MVk1WFVXQXdlRy9hT2J1Vk9VdEVFL01QZTY2U0l3UlNs?=
 =?utf-8?B?WVRIY09iaU81SnJGRDg1V2FJMXordEpjQVZnOER1M1h0TFowYVRlOHVLcXM4?=
 =?utf-8?B?QVJwZFF1OGQxRk1WSERmczh2OXlBSTJvRmUrZDU3MW9ZZkdjczJvTlJkWWlR?=
 =?utf-8?B?WHh2SWIyNER0UjJKcFhEdXNUUjZjbk9BaWEyUzdWdkRDcTRiUEZ1bjBLS1pw?=
 =?utf-8?B?dGN4QXFHaC82WlF5Sjk2cEZ1OCtheTRhODdaSFhkV2d5ZVpKVXJ6TTFoMnF3?=
 =?utf-8?B?MndZZ2NuU21iOTExNTRYbzZJbWdVUFRNV3IvNlJMS0RpUnc4MC9KWmF6b0pl?=
 =?utf-8?B?c0JPR2c5NkVTSmhlbFlZY0NUNnhYVkdSQ2UvS3g3Yk9CRHczMWNVK1M5NlRk?=
 =?utf-8?B?azZRMHljYkJNWU80NkVTbGJKUUtuV0VaRjI2bDkxM1pWMVU3SXB6QUNIMkhi?=
 =?utf-8?Q?sAv76ZAhD9A+q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmlZKytIOXBOckxLcURLR2hhbnQrQm04aGdqMW1vUUdjWWRPN3BPcElMSkQ0?=
 =?utf-8?B?QjNCV2MyOHpUUVhIRkQ3UXJwd0liSjk5VTdJU2RFdmxNbGFhdW1KejlkdXY3?=
 =?utf-8?B?YlB2NnErS3lQVU5CNXF3aXpydUhwVTYranNMVlpUNG90eWhWcVpDWFlvSWJo?=
 =?utf-8?B?Y09EWU1zWEw4eEN1TjRnRkE0NENwQklObHprM3krTGpobFcxNElxK0d5Z29h?=
 =?utf-8?B?QmFVclRTS0FKSWhOZUlnY0Y1dXVhMlk5ZzFsak1WeEhDa0lmTjZKclp4WjND?=
 =?utf-8?B?Q3cvRm5pY21TRzI5dHg0ck1qV0JweVN4a0hYNGJUY3dkL3Exc3crdElZeHcw?=
 =?utf-8?B?OU1oamE2UWM3d2t3Ym54eEJQQ21mbzdNYXNpa2dqbEFwcWNsTm5qaFh4QmlF?=
 =?utf-8?B?MnJwN0RiTFFGaFVjRTdyMTFwSG1nenFqQUkwV2VWcjFQRGU4cC9xalpacmFo?=
 =?utf-8?B?NEhoa0I4a0lyUjFWc2tnSktabk9NSVB1VThhSVVPdkJLZ2tkRXZKMjBrdlNQ?=
 =?utf-8?B?ZmpXSFl3WnlnaGh0R3ZPeDV3S216ekhTb3E3NUpwTjlWSEhOeGo3Yk9ZSUZO?=
 =?utf-8?B?OEYrTUh5MGtuWEY1OWZYTWlkSzVESDJnMUlHMlp2a0p5ZVg3MGEwdTUrSmI5?=
 =?utf-8?B?SlU4NjVoamIxMWFEWVJsRnlFRGZaR0RkZ3Z6dVYxbk9JUFlSSWcrWDcwLys1?=
 =?utf-8?B?NnNGR1R6b3lkOVdjQkZtSysvdmgwQ1lld1NuVHFGWWl0NkhOTWM2RmRvSjBy?=
 =?utf-8?B?Ly9Hc1Fyc2dDc0ZQcHpuLzBTTVhUL3M4Sk5NbmpwSi9tbEczV2ZLbExGV3N3?=
 =?utf-8?B?TDdzTGtMMnd1QkJRWEFqRVV0Ym1rMzRBZXJMTFlFeEZuT0VabHJLN2xmamJq?=
 =?utf-8?B?RGFZUGFsMHc0dUtHQ2ExVGdXaHhoUEhYb2x2YWJOVjY2c0dzL1A3dVVBdzBu?=
 =?utf-8?B?eGtxSEFoVzZURVJtUldtQXMvL1NzaEU3WUhqNEtJb25VTkJpVTdtMmdjaGQr?=
 =?utf-8?B?c0dpVEVRd2YrMWFzZ0d5dy9RNU9jM3oyU2JOTkovZGdQODA5cEc0R1R1bjh6?=
 =?utf-8?B?Z3Y2MkJ0ZWdRQzd2MFVpUGRSMGhCWThDZnh4dDdiTzl6bGlTRlhrMjhMY2ow?=
 =?utf-8?B?eHRzUjhNSnk2VzdpeEZwU3BiejhiQ1pwdWZYeWZZcmdsZHo3WVl5QiswY1BY?=
 =?utf-8?B?V0RJc1VwQ0hXNUNja2Z5SEhMTWpFM1J6VGtyN0crWDFVVXBJSXliK3FGZkFz?=
 =?utf-8?B?RzZZZzduL0hqU2R5SkVrbmVMTnhpam1WMmpkcEFkc3VzOVZ6aEZDQXhodmpx?=
 =?utf-8?B?Z01wdTNYUDRjaXdOQjZ4TXVBZHZMc2tOaXM5RzJnTEpNQisyWk9jV3gwWklC?=
 =?utf-8?B?Y0dVaWlDUXJSVFk1ZEJud2NJamh6ZlRQc2ozNEU1S0ZTYkkrWXJGT05YaVJS?=
 =?utf-8?B?MThHRUdHMFlGQXY1R3lWZk5KdkpVWll5WVl2NzN4eGwxeExuZ0dzVTJLV3ZP?=
 =?utf-8?B?ajlXajBMNklrQmZxS0lSaEZnY1RLOTFyb3U0RWpDMGlOc2xmSDVFaG1JTTFt?=
 =?utf-8?B?eW9ZMXFZYXlldzNhWmRFaTNiY0lWSUZuM0JJdG5aZFhqWnMycmxWanlHUWxo?=
 =?utf-8?B?V3E1UXBCNGNrcXNudG1kR0pvQ0UyMnZ0Y0RNb2RRRk5KUk04eS9oekl3Wkg3?=
 =?utf-8?B?RWNBL1VUZ0R1OW1aVXM1SGJmc2Urc01XQkkrQ3VPS0dLSU1wbllFUXJ1KzhU?=
 =?utf-8?B?dEd0T3BGUTRrZEJUNS90VjN4MFlzYTRjaExCcjc3aCs1dHBCNFlUL1VJcktL?=
 =?utf-8?B?cDF6K2dJWnlEajc5OEFoRlIzejJrT3FqUEZKYlNtU2gzUC9kTitLZnZMVVFP?=
 =?utf-8?B?dTJpUVNZYUxXWTBwNTZEUE9OaHRFNkpWUnNUWERqcnF4aVhiTmRPZXVvN24w?=
 =?utf-8?B?cnV6bXJrRkxkMk5nbFdzYWdrVXcrUC9rQTNUaHdSKzgvRjEwRjNwQlA5ajFj?=
 =?utf-8?B?aTArcmFOaWV6dDRqWU4wd2Z5eHlUQjhIZmVuazZ3ekdGMithYnFTVUhnV0pw?=
 =?utf-8?B?Y2IraE9OZDE4V2dOc3pIeUQ1QjdITnJKTTVhK3YxMWdjSStsU2ZsN0tUbko1?=
 =?utf-8?B?OFdUejdBMTNiNFM1MTU4YVRZbSsvbklkSkhIeUI4ek9SZjJ1SThBM1M0SCtO?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 961f13e3-d738-46b7-03d4-08dd5cbbce73
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 14:33:04.9823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5WSm6D1umfLgKSh/PFak3afo2e65XETrpniq4QJuMM5IVClj1dqPngPtJYkDxnnXa7BZGkQS62/ZFWjAy0ahCTHsiiY70Rerbp+4cHNloc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6407
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

Hi Kamil,

> Sometimes an error happens in kernel or in test that leaves
> output files in corrupted or incorrect state. While runner or
> resume will just move on to executing next test, when generating
> results it could end up with no results.json
> 
>   Try processing outputs a little more persistently and use any
> output file left there, even if only dmesg.txt. Also, when no
> useful output files were present, instead of breaking out add
> notrun.
> 
>   Inform about processing results for each test so a problem
> could be spotted more easily.
> 
> v2: removed ')' from 'notrun\n)' (Kamil)
>  using bool var, added more prints about errors (Ryszard)
> v3: reused open_for_reading, removed bool var (Krzysztof)
>  closing only positive fds[] in close_outputs(), checking
>  file sizes also if all opens succeeded (Kamil)
> v4: reverting to v2 and addresing review comments (Krzysztof)
>  closing only already opened file, drop early return when empty
>  output files as this changes run status (Kamil)
> v5: reverting to returning false after any out/err/dmesg output
>  is missing, simplified later checks and printed logs, fixed
>  closing outputs (Kamil)
> 
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof
