Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAF9C2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF11310E870;
	Thu, 20 Jun 2024 23:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dtUERpr3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C3610E870
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718926995; x=1750462995;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/scnis0zloWJ/bfXz55AjDXU/7dfvMkbhQs7rZlMN6Y=;
 b=dtUERpr3KDmEc/M200nr4YU/G4uI6Wv9nI4fogjYs1KwgtzXE13QYqNJ
 +v6XmEO1H+XccW04jx6tSkUc10lFLPvzRUxwd5QXEXJlNCcU/LRt2WftF
 D6F2dPEIlkghnHFyvJC4PYniSvILIQI7mGi1X5Kq+gm0BJ/T8M+zRQlUq
 Z47M5es3FXQf/TFMjczGcB8pDPomYuv29Sz07TJlIjU4FAn0fFlkJXRC8
 iyekf6RQDKBho1tMfEXjXMld+Aqdz2yNn/vHn9R4pBpdbzB7wyoJfVM9u
 Zr7272nI293r1FUILLSwBkrD66TJQ0ZkFq/wO1FT/Vy7BvvyIC3gIqLHw A==;
X-CSE-ConnectionGUID: B40SgqAmQmmwOEN9irieqA==
X-CSE-MsgGUID: KQhsVYaoSs6s6tUR/ohYiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15774499"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="15774499"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:43:14 -0700
X-CSE-ConnectionGUID: kNh58NzdR06PrHrKoaYiHQ==
X-CSE-MsgGUID: NtMo6HhDQTibqGfbXB8Qzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="46938400"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:43:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:43:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:43:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:43:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:43:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIyiOHqZYBw6NvMWxxYW9ODnTwn3tJIQuxUVwe1qn8yWXA+YgHwYjBXethfY1PWFKgRuPlIPx6DTpnaAmEoeUC77joVpehLNt8hmZweazLZ7p1SRPytpoaXnxnn73cOIK3lR0tJJcVFdqw6ajIgLM8aKcGvOqHeNMqabW86ipGGUk1l73Wqm+Pp3GSW8sZahun98G92FwFm+sW73gQ0stu49YZ83uGkYHRszspUJTpi3fH2RwihQBTZHkxYuIQNF98CuhNhwuSrdRjBQ68A1zIPDY9d7y+iv3cFjttyzMEaw+EnMBmtS/8gk2KRIWrX/MCaOHmhNV9+UlKl26SDxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+n06RD/S2VzWguO6vZsNidG0aQBhBwa8P9ongaXxcA=;
 b=HMeiN1pZmZVMzx/INZJDpN0u6yTKWns42cFyxrdwQR/YWozo8noweY6rDeB7eZMW7NqxW9wPfI5uldJxBnjIAfRqIKU8BeS0sd1zJy8XvX//EYsnK8wpIhzYtOBcCTWJzxtec29CPC5d8jZ1+9f04GgiAPS7n0G3LXSNav2PQpYroI0Hu7xyIA1iZnLtBNEkzOQTmHmte/dasePBaOqK5I/po1R4by+2pfRp7CFe7cYgtZhZMnO0/6V+pToViLvG3lms7laiYIbmrnVZpKTCFV5YBdOSP7wSU3780RKT5iTpfK/9aOEc+qP/ecslrOggtRBZdeLCEKZHZuB1Hq6T/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.22; Thu, 20 Jun
 2024 23:43:11 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:43:11 +0000
Date: Thu, 20 Jun 2024 16:43:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 24/28] xe/oa: Fix invalid escape warnings
Message-ID: <ZnS+jVerM1Jynp7D@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-25-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620200054.3550653-25-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:303:b9::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: bffdf497-f49a-4f26-53c3-08dc9182beb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWpGQlIxeWZIOHMreTBsQldsdVhRTThBeSt6U1pPSkdJNGw3eHdWSE4yazNw?=
 =?utf-8?B?dUY4YjM5NXFSZC82b3RXamd4UFdraE5FZmdXVGxCNVpjMlg0QXZyMys3QS9o?=
 =?utf-8?B?UTU2b0xLUXdWSHJuWGIvNHNmMm5UNDZxdkY2T01WNk9HWEZYL3Y4SW85RHQ4?=
 =?utf-8?B?MlZENDJsRVowMWlEK1ZSd000aHI4U2FiN0taaGNtK1ZEbDNJQkxBa3Nnekhl?=
 =?utf-8?B?WXRhZXU1UTBQRnYvR3hZQlBoMEFSRGxZRFlVb0xmYzdwY3BreGRMTjQ0OTBt?=
 =?utf-8?B?Y29hZTJLMEU4Ukd3UzJYUkFpRDNvKzNmOU4wSHBrdG9JcVNQNndpenVWRjBF?=
 =?utf-8?B?VE9IVG4yaTUxSWlvWEltaHBhSG9Wcm5DUEFGbXZJbWduQklXSXA1QVZKMjBv?=
 =?utf-8?B?UnBtb3dNQWtMZ2ZnaXgyVDhaUlZuWXY4K0cvdGQ0VjIzNnMwVUwzY1VUTkpC?=
 =?utf-8?B?TlVyRHZkcHJqKzYxWHBMQ2VRbmQyYnRhbjVndWZGYUdBYUdZNEJFZURNQ1h6?=
 =?utf-8?B?UlpHOGxmL0xZSlI3ZzBEL2t2dGRXd3dXbU82b3VXTXhBZk84OU9xT1BUYUFl?=
 =?utf-8?B?bXpEWXVaNU1IeGNFUWZ5UCs3cHoxQy9FcnFLWFUxY21wOTRWdzhib0JRRENG?=
 =?utf-8?B?SG1BK1pYTEJ0VXo4Z1JDeUN3MWJrUktxci9HZVcrUDgrYzRsNWp6ZGEwUFNH?=
 =?utf-8?B?b1BmdVp3ZWNZQXlmelNQVGZpV0RlZDhtc2ptQWsydmZISUNSRSsyeTcrdmFD?=
 =?utf-8?B?anMrNlB2ZnRJQzlsMmw2NUZSMTduV2Fhem5CVlp0ZXBneWZtdXZCK0hyWWxN?=
 =?utf-8?B?VWJZUzlmbC82dlcreUxta0lhdW92WW9Nb1ZBYy9abkhqc0ErNytyeGNvSTFt?=
 =?utf-8?B?WkFBSFYrc2hVQTRGa3RKc3NvZGdMMkRMNTNnMkFpbUJMdWJmQ3VBZHJKeGtU?=
 =?utf-8?B?NjNTNS9VYlRFZitRSUJqY05yS29nTDl4dndCOEtyRUtCaHk2ZitlZk44YjFB?=
 =?utf-8?B?TDlSREpBZUdoY1lLY25lYkhRT3RLa0tSSnRYeFUvMjA1TVNNeGFEa3Zmdnhx?=
 =?utf-8?B?ZkhNT09oMmZIZWdyOUJ6RU5DcGhuY0s5UE9vVUJmRXZEL1lsaVl1d0wwNS8x?=
 =?utf-8?B?OXd3WjdzL080LzlsRlRDTTVXbGpKZXNIeWxtUW9ZbVlwaXBQNDJwNmFvTVBK?=
 =?utf-8?B?SHZOamZZRFVkd1BqdCtJRHA5d3JlOEtOYmxoUkNHb3NUS3daYXlTQUdDTjNK?=
 =?utf-8?B?cGE4UGFzNzBoeGNDZnowR2grUlc4VEhTeUNtcDBvWmFIaVVmdDdrUE5kbTU3?=
 =?utf-8?B?c3l0Uko1bEJuV2hCcEdRVXRXTVVLVUdVTzdvR3pZRG9Ta01PR3h6dWNPVSts?=
 =?utf-8?B?c0NTWUJlMFlXYzdnVjg1Q0IybVA3d2h3SWp6OEFjd2hzUlErcXM1emI3NW9M?=
 =?utf-8?B?NGltYUZsT2ZtT0daUWJCN0k3YzBKZUFubEtTTHdDVkJXVU1oNVMvaTFQTFg5?=
 =?utf-8?B?ZUNsWXdWVXZrUlc5SEwwQmhBb3J4c1QyUENMaHpBbGZ4T0luTmN0eFFEZkdX?=
 =?utf-8?B?ZnMxOHRFWXQ3bzZWRDhtVGtGcGU1VlB0ZXNhNi9ueTVjT2E2UXd6ZFcrTUw3?=
 =?utf-8?B?am9kSUtyOTE5NWh2YlJ3a09KQ2ExelRtL29ydjZEQlBNK1pGd1QzYjQ2aWZZ?=
 =?utf-8?B?U2VtRGlOUmx1TEo1c21pcDJxL1RvQTJmV0d6SVYrTHBvRXpZdkN2dmgvNXJn?=
 =?utf-8?Q?Qg1mHj+nmnd71OCEiYYl4y4v9OhMydLL23sML5r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9OTldSYjhBSUcyajlub3JoS21UaExhK3dwTXZMNHNyQ0dLdUt6dEJEeXFF?=
 =?utf-8?B?M1NBYlNvVnNoN2NFSnVlQnZnTExlMWZGV0JpQTM2OGRUbCt6STJCMDhqM3Zy?=
 =?utf-8?B?R3N3UFlNdWJXcnJHWUtIdUpUQWE2MDFJMTVUMkFuWnZBQkRqN2VHc3RJNWwr?=
 =?utf-8?B?M0FZSHZlTFF0aHg1YWlwRG1iRnNXNER3SUR5VTYvT3NkQkFTSTBwZTlBNXha?=
 =?utf-8?B?VHZPTWtZdGRMMnpaaUM3Q2ZRS2JjSDgybHJoWktDeENwb2RaTnMwWUUzVTAy?=
 =?utf-8?B?UDRzM1lMNGk4ZjNOaDdQS1QyZktXMG9nTDd1azNlaUZMZzRCbDVqWENRcVRF?=
 =?utf-8?B?cHAyL0tRZWtBZUlFNlJtYTl6UTdUUXg5NEN3Qkhxc0NlU2prVld6V1hmMUZW?=
 =?utf-8?B?d0RJMVN4cXVZKy9OTE5scTJMQTVSUWdlNGNBNXdvYWRFZURxaGtwd2ptdXFL?=
 =?utf-8?B?M3BqbGtvV0d3QnM2bFVORVBZYmtQTGhSTlFzTkRuRElubTZvSzBvUGFYWHM3?=
 =?utf-8?B?RHJmWHM5aXlERVRURWoyay8yUzNBSldVMXdVcmd0dzl1Z3llK2VtbGVMY3Bu?=
 =?utf-8?B?cHJ1c3E1RDNteXhVWWFnNkFSZk1jSWFxSjNveTh0azVKcWpCTUwrMnNqdnE4?=
 =?utf-8?B?UjFjam9LWjdPQlRjcmFqcHZGcjZXL3dtL1RzTWdXNGZnUFZJQ24xRmhJZmM4?=
 =?utf-8?B?d0xqaDNTdUVSSlNYQkxxNjRqRjlvNzFRVnJzUGpKdHZWblVTR0crMGpYOEtU?=
 =?utf-8?B?bGRFak9XR1ovYlBIMC9VM0lsN0hnR1EveHJ4TEFaYTBTM0ZmWklWYkZ4YVVp?=
 =?utf-8?B?VDJvV0MwVFU0a01yV1FEazNZUE94N2J2TUFPUzJLakg1b1JlUzcwZVFFUmdZ?=
 =?utf-8?B?WDNHUU05NjVBL29lMTJWMEdYZ1czcVpGSzhrUzlrbU4yNGNIamxzNjRGYnpG?=
 =?utf-8?B?QTVWWksvNmsyUnpSZit5YUU2RzUyS1J0RTE1SG5pZFZRNkZIcTFJZWtEN1N5?=
 =?utf-8?B?aHVvQTJIaHdPSDIvbzlUOGpyY0ttdXBjMTZkcU83Q2hEZDB0eXNOTVpXWDAx?=
 =?utf-8?B?YU42OW1zdjZVTjdkVHlDam1nbkpkRmE0aGRqNVJGdnFpNVRSK1RyZHZ3MXA2?=
 =?utf-8?B?WDBIYzQ0OEprVTE2WWN0UnRJUkRBdTJEeTFuQTY0Wk5WM1c1Z3N2aHFkckxn?=
 =?utf-8?B?OThrWWMwQ0ttejFjM1F1aklHOTZ6UFE2MFdaTFRKZlZ2S0RRK3QrMEMvcEow?=
 =?utf-8?B?Q2FpSTRCVUpKMFRQYnJqRC9NNUxpNVJ4THFuYkUxY0JGVGVtU2NXVjVGZGlK?=
 =?utf-8?B?aEN5QnFvT2FxeXFaejdaNjZXaStGN05qdi9GUEl5dEVRWk03MlVzYWg0QmtV?=
 =?utf-8?B?dDhHS1FtakF6bjVKcDg3VWdiVFM4a043aGp0WXdrd2NvOElTVk5xVzlZejZw?=
 =?utf-8?B?QmdqWXVmdmNpSmJXUk9XdDZoQVJ4TmxnajFSbXVwbmxmVE1jMnBXQ3V4LytZ?=
 =?utf-8?B?QU5BWFZHeUFWU2svTFE4dmxQK1F4ektRekFCaWNLRENOYzdHSUJ2RVhoMTRS?=
 =?utf-8?B?Y2ZnckorbjEyeHY2N2luQnZOQjN0MDlMREI2N1J3TkR1U3RJRHdBQjBpTnpz?=
 =?utf-8?B?QklyUDJmb003dW1MUFRMMTUvWDM3OGVjQmE2bkcxTUVYTUtPdmptczB3Wisw?=
 =?utf-8?B?VU1LY1l1WHV0T1YyVlJyM0tjWFNSWWVYaEEvSHV4ZUs3VDg1Mkc1VUp1VXF5?=
 =?utf-8?B?cTVoa1Z5QXNBSDNSbDBpS3ZtV2NoWk1GZGtCVW5TblBHbmRIcmM2aGdpYmpr?=
 =?utf-8?B?bkRpQUc4dWcrWmpaZDRIaE92T1pUR1pCTjQyT0NiWGdoQXRJbXZRMENUOXdh?=
 =?utf-8?B?Tm9qaDFMenh2QWVyVU12enp0MHUybkl5V0d5VEFjRW9hbk45R2V6WjYyenVP?=
 =?utf-8?B?SVFvaStONVBjbWZVditTQ0FsTnBJaFpCZjRweHVWRUVJZ2hQS2ZkZ1ZGWXhJ?=
 =?utf-8?B?emtGY2FjVmF5UGlRNzZ3SjNNdlVqQy9NWkpGVWJSZzdIaFBpeGhYeHA4VEJ4?=
 =?utf-8?B?NzZzZzRqVGJSZjZiUVhNSkU2QXhNdHB4S3NWMXFIMXk0YWtqNnNqMnN3Vjcy?=
 =?utf-8?B?Rm91Mm1BUXBMNklvR3hYaEZUNmFNS3ZRSzdSNUIrNThjNkM1bkJaS2h3WVMw?=
 =?utf-8?Q?I0mqBK4xp37fkznmLjAHjnE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bffdf497-f49a-4f26-53c3-08dc9182beb3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:43:11.1934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SaQdGsNAX8gwIZ9vL0O553N/wexhmTNHLWtLBgJCpahrcb08GQsHDnnKJeJTROLWK0JBuBwDfFBOSszSkXCZKXZgzs7htta3v2P960TNag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
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

On Thu, Jun 20, 2024 at 01:00:49PM -0700, Ashutosh Dixit wrote:
>From: José Roberto de Souza <jose.souza@intel.com>
>
>Fix this warnings:
>SyntaxWarning: invalid escape sequence '\
>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/xe/oa-configs/codegen.py           | 12 ++++++------
> lib/xe/oa-configs/mdapi-xml-convert.py |  2 +-
> 2 files changed, 7 insertions(+), 7 deletions(-)
>
>diff --git a/lib/xe/oa-configs/codegen.py b/lib/xe/oa-configs/codegen.py
>index 9a7d57a33e..f078ef9498 100644
>--- a/lib/xe/oa-configs/codegen.py
>+++ b/lib/xe/oa-configs/codegen.py
>@@ -162,13 +162,13 @@ hw_vars_mapping = {
> }
>
> def is_hw_var(name):
>-    m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>+    m = re.search(r'\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>     if m:
>         return True
>-    m = re.search('\$GtSlice([0-9]+)$', name)
>+    m = re.search(r'\$GtSlice([0-9]+)$', name)
>     if m:
>         return True
>-    m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>+    m = re.search(r'\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>     if m:
>         return True
>     return name in hw_vars_mapping
>@@ -338,13 +338,13 @@ class Gen:
>             return self.hw_vars[name]['c']
>         if name in set.counter_vars:
>             return set.read_funcs[name] + "(perf, metric_set, accumulator)"
>-        m = re.search('\$GtSlice([0-9]+)$', name)
>+        m = re.search(r'\$GtSlice([0-9]+)$', name)
>         if m:
>             return 'intel_xe_perf_devinfo_slice_available(&perf->devinfo, {0})'.format(m.group(1))
>-        m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>+        m = re.search(r'\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>         if m:
>             return 'intel_xe_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
>-        m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>+        m = re.search(r'\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>         if m:
>             return 'intel_xe_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
>         return None
>diff --git a/lib/xe/oa-configs/mdapi-xml-convert.py b/lib/xe/oa-configs/mdapi-xml-convert.py
>index ab4747ddd1..575b53e955 100755
>--- a/lib/xe/oa-configs/mdapi-xml-convert.py
>+++ b/lib/xe/oa-configs/mdapi-xml-convert.py
>@@ -228,7 +228,7 @@ counter_blacklist = {
>
> def underscore(name):
>     s = re.sub('MHz', 'Mhz', name)
>-    s = re.sub('\.', '_', s)
>+    s = re.sub(r'\.', '_', s)
>     s = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', s)
>     s = re.sub('#', '_', s)
>     return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s).lower()
>-- 
>2.41.0
>
