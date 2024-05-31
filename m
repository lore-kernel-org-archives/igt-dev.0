Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB657C25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 12:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B01510E721;
	Fri, 31 May 2024 12:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QD8ay4J1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB57910E790
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 12:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717157284; x=1748693284;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yst5pq7bAYhA+rTGupAVwCkytu0JD7sYXywkCvom26s=;
 b=QD8ay4J1JsgPOOzPye8ZC3u/A90EdiXtYNliBJOdO1KNXyydrDWviRJT
 CZTW0gErxbLUqAh4rtIKTjYzz1Hdv92/VxU8gcd2n8nUexHjpRQF/48+1
 VZ9mPaQPBJg68JqVJXMs53TeaVi+sLzZ9ksBNhXcSS0RPKHMgaEgyYas9
 B4fu6W+RDUraLJCGS/jchrVignoxRmPDh/7X8qlcL19yjVogxkbd0E9h3
 mMWcj7jq/8E3Q9nXPWmYKyQg170ID2F5ffOWJSxMGOV7Rb6KuV795jSQd
 ehpW8V9G329/upKnEOljOmbwymU4fmFotyKdKkbGKmdkd1o5ruz+MAPOm g==;
X-CSE-ConnectionGUID: esmaiioVSaWraW2qkNEBKg==
X-CSE-MsgGUID: YhPtmAIqRn2jTOWwzfsPLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25101026"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25101026"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 05:08:03 -0700
X-CSE-ConnectionGUID: z4/os6gzRDa/PKRVWqU/vw==
X-CSE-MsgGUID: AXCQyIKrRde2wKQx8cUVdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="41216777"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 05:08:03 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 05:08:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 05:08:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 05:08:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRaBOtfbLDrzRMf7EtHYx/Q1+aShNHZ20GXVhlgq54M4qA00OKg8BS3Sp17sQ4Q7tn2inoiZVFRxT7QWt4KmQy/lRRSlqe63vrpPTClVZIh/MQFRvx9SZGGmdBoNOcO1wUvNNdLqpxdW9E3NT1JTAXt+6ojy5l2dui57nPbSJ8nsXPycl7bRsLnTJDIiooimVrSZufR9+znpDwo/nngyigj+1Al7IxM5L2wH36j/9sLkT3D7WftfhT8GyLz26vMdP/CTpK8FZo3wXtelsfbHaRS2xjQN0DfpqDei4fK9pJ/h6VSzQ/Ffgdc6T+fh1HD1NYf5RPGmSEfPj+JVkLW86Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yst5pq7bAYhA+rTGupAVwCkytu0JD7sYXywkCvom26s=;
 b=dM9IZ/cN87pbzDRIIUzNJHa91WRUTc3+o4XRnuWyClZ5wDzQ4HrCzH5fhA4acI6DZaGbg8rwqoThX27+WxVla/8wzp04xS6flRyyyCPYgzxJJXsTn3SeBDVk2ghr/3AsAyngVwQB7+TjSZ89o953hb8crEKZeuQNbznSK5uenbS9Q3kabu1MoLCxyHyP6NqMKSjelBcbCZVY0sSJLrC8It32//kRiSKWl7+Ry4TZ2rRFY24+71/UnnR76A6nC3wa/coSDlY8bapZ7vzD4/Cg1liOgVKdSsBR530E50dM797ttecibF7cy8drwoGYpBCCnJGobQe/TSnp8cBaPgh++w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7610.namprd11.prod.outlook.com (2603:10b6:806:31d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 12:08:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 12:07:59 +0000
Date: Fri, 31 May 2024 07:07:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] man: Add --decode to intel_reg.rst
Message-ID: <t27xuhcg4rbtsvyw5q3hwyuc647acpg4gurzxgoyuqawbu5m3o@ct3s3p7lemjp>
References: <20240530193325.1072381-1-lucas.demarchi@intel.com>
 <87bk4ngkdg.fsf@intel.com> <878qzrgkb3.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <878qzrgkb3.fsf@intel.com>
X-ClientProxiedBy: MW4P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 177349aa-e6a1-43fb-978c-08dc816a503b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7TIkWvCow2m9LZnRWQIpMw+dwSHY9bi4cFVQQsEMfBja+zLe3g9QiTSrVCZj?=
 =?us-ascii?Q?TXx7xpLp5mG620gwFB85d4YtkMKEBR3smUnn1dgBHq88lpbtPGJWUmApBmkt?=
 =?us-ascii?Q?/YvqlcuB5ZGyLoH7jQmCjqGHLxMwHZW1Bdbtx8TyHNwwuuEcHVTOT1nZ7LKq?=
 =?us-ascii?Q?VRfC4TCmAZjrF3UVtHP9T7ZJ+0AeP/30PmgyZPzXEzE6hqRQ1oHzl0uCAC1v?=
 =?us-ascii?Q?+8op2srThQ97QSKjISNtUfn5GD7pNO5VHzKoeKeh/64w8pqUO7Axh3mUgvNl?=
 =?us-ascii?Q?HcovQIzCAq+4CSCm3iVQDS+SHq4v4O/gs7JJoW2oJBFghWxpUfuFwvYjf84A?=
 =?us-ascii?Q?LapBhDxjBpRgN7JqCNqk2r3IEsHooryHuJCJUUVirwgZ7Yfu8I+85LK5F6Cc?=
 =?us-ascii?Q?6Czj7YUG7mbmJgyvFGOskLQQuPGJey8taXnCYxTnjTPlKC97Ym7mzuWfEA46?=
 =?us-ascii?Q?504VP1jg1tFdo0RuXIR99EvRdKuTBzmg1oeaZLwq4eU/WZmTfaCv7689qBVP?=
 =?us-ascii?Q?lX63fNVvJmNNSeh8bG/NBAr/kHCC6L0fizJa8874htZpIycOox98QSTmzFgd?=
 =?us-ascii?Q?UuQ9Lslhn0DKStRMr+mhDDCnPFDsMz48yMo410o0oaBpPn9DDH2PpeaMOAr1?=
 =?us-ascii?Q?5fXMzTZnC1jYg6ueUj0d0XOwYiopZIzRJyzyWGlqsTXvHlPqJNGlIGCbSvHH?=
 =?us-ascii?Q?1slz0hHx2c/yhRa04b+qUEJqqU0l6++teRoZ+brkjtywh9vitutsjiD3f1nL?=
 =?us-ascii?Q?a1gVjfyPGe/2ToPh+lEqifx+UWMz7Y9GY/V4jMvOM1gghY68wxyL/SBDlqB+?=
 =?us-ascii?Q?tcrqEWzCtZhjej9kUDUcNY7HfE1AVfvV2Nz276gKkqY126V4jaOL8MBm6FUd?=
 =?us-ascii?Q?hYCNPxXsgLXTwknIqWiHBH+LrNuytlXJbscXqk+nmYn0tR6KkAfEVC4XAOp9?=
 =?us-ascii?Q?ySJLHN55FesHMx6RHdT4FnXyV+CX/b48PB0XoTLiOBuNMv9+Mf4x7rZa0wH/?=
 =?us-ascii?Q?QSzChAba1xFs4cUn3tXhVTDfoD5Y7TQz7d+lI9ekqhxYPPqW9t7nOcMyAnIt?=
 =?us-ascii?Q?CWE54+OdjDmxwcys1+cRu30yNZoP/ywLaeEZ0VtMi+jtoLyyjuUYpvrm6XDU?=
 =?us-ascii?Q?2teNUaxNthmkL8UbUj3gzcG+1mb/4geiIYWsw18w755o6rmCzFJEJnGIuOhl?=
 =?us-ascii?Q?ttXBZLhzzB7Ad+NHL/aJ4uCrdWTGIZJ8Ac3dD2VP4VjTeayAMTUmxa6f133o?=
 =?us-ascii?Q?jxWmCoTJ4iGfExHAHTC1lUn1aY3s2zcltqlcqLEzdA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1fLezC66IGE4p3fAcT+nTK5HHOeEOfklGHYPEWegiX+vwNsWwklbUsTesThE?=
 =?us-ascii?Q?+Epjf8Eq/T7YL4nkKVyYFd81uosRtq/MYgxafUpFt6ops+6Zaou6yHlMbgnU?=
 =?us-ascii?Q?xtsA9YAYIZTq1chBr8oTmhxdjOM46pEU+o1sFl6G5Xl5i5gdZKAnUvbBRI4Z?=
 =?us-ascii?Q?CPo690lIIDDl9x1cpWT/DvF7JVJfVLMjGXIR8qrrTP1oZnTYHg0VsK87Iz8h?=
 =?us-ascii?Q?vx9GmEguCj1NurthokxsOmtNI0dRqYUFzbWmONZ4imNedpOg6VMdXMo7wMfU?=
 =?us-ascii?Q?A0tP0ix7DDE8I7IEdcZKn9Lt/Gw/lUDeASDOJxMAmIHdsLl6DSfiTUZJcpb4?=
 =?us-ascii?Q?I2eLEMZnQL20BqgMOiNK4yh9YE/HrG8AvvQ8TZIe93a+N3d1TCpDPQT7HrHA?=
 =?us-ascii?Q?Nii8xWuNCifTHWglh9ClL9YK0oYpS6vPUWa7AiIuusuC6bXNm/yfZkKOIPRm?=
 =?us-ascii?Q?67TgRLUfgy2enyHL5r4auDzl3oLmEgeTlhULHRZX94ZeVE3qqE/DdHoiFgKO?=
 =?us-ascii?Q?IulBVhPXvHBfXzYAkrsnZ1LHbyWqoGDn+X4z7hOWOeSTXtx5SDmHcVesSAIH?=
 =?us-ascii?Q?+huvWdpA4QqP4zgSOad5Dl/QL8yYqgJ8n61dmFIX6nF0AxskPRHiLl1iGzlL?=
 =?us-ascii?Q?obL/HDtE2hLtb5BX2Up4BjRIWq9ZkR8kj8s/0cj+PLKtvcVJzJ26xTPTcpsn?=
 =?us-ascii?Q?4PWSm1vESlHWDdZ1gx5pntBxscvc0+Kora5/itLyh2+UerPSw5iXagRAmUzi?=
 =?us-ascii?Q?Rf6CjDP6IVHlGJOEHNT3VcxoXa4E8fec3yg7o8DnG089ymuk9YQP3h6aiaKi?=
 =?us-ascii?Q?9DlWrOZEYecGULZLRZzG7dhmS8DDHjhDklpDDnpN3iolNDCyYCZAuJx7Tbty?=
 =?us-ascii?Q?zfK8SWHnjle/ZycqyIBZeeubLoUlG4Gp29yVjGYAWpJa5C9taZEojQHWYiWJ?=
 =?us-ascii?Q?a+bpB8tchv65lhaa8iIFmwIEOxmlQpZMbmQjJuyMbja3nBiKyCCts+6S/yf+?=
 =?us-ascii?Q?9BuS16AAhyuBlZG4yFMEHkIWFSxlVPfKwhNr6k+gzUvQWhgKYA+N1KAUQ+Y0?=
 =?us-ascii?Q?1mGewyWLkwWT7tKbCVv6XNgSQyH8o873Lc7+gNuEI8ExMGGc7D1favjYtdZh?=
 =?us-ascii?Q?1D327IhBibQAtakfPdRStmMLRT5hReMU/2N1N3VABMkPA6dczEUEgNwiiIkZ?=
 =?us-ascii?Q?/MXHG5Z3IzEMGhvg1TBbbtuxUxjVYPzQA/X/l57K7LAeE/fYeGvLU4Oiiqne?=
 =?us-ascii?Q?bcvGbthNlCy+rp2kMc31Rys/CkFKt0PI/ciwJttLs8x7rYPC/pVtuPvmETxx?=
 =?us-ascii?Q?KN8B9SSI3RUeRm5DaZwHQ59ivkk5V7trx5KpftVnXFhat7gmMRSyCxdYT34X?=
 =?us-ascii?Q?82qsxpkt4lccgbbBh0hoWE9bDV4+ODdZgIK5FuKwS1zNBEuvto/60YL6avbx?=
 =?us-ascii?Q?RugDQQcNDqEMfzOiMOMifcDvdjxbNsFDetfUZWK3D3tb5HTVO8AGQSQqMY1u?=
 =?us-ascii?Q?Fw1ktHqNZUSEXbDoPd5QL/o5mL4b19u2gM8JICgJSISf6MYQt7K6PALleiOW?=
 =?us-ascii?Q?k/XGeL2na7SJ+TQPJ0OR0m6JOg0nvHVEi5j1wSCdOd19thCODLU5gS9jG/0v?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 177349aa-e6a1-43fb-978c-08dc816a503b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 12:07:59.3470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECIQVmPfux5qTiicI9LNisGS2zYGx18z0IFJ0yPHB4yBl18g6Li5d+lWW5OOsrmPqQgSPZqZzM1oIyK2FKNgQwhstXPd/wePLZxQV2rdqFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7610
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

On Thu, May 30, 2024 at 10:40:32PM GMT, Jani Nikula wrote:
>On Thu, 30 May 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> On Thu, 30 May 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> I like to have a commit message, even if it's short, rather than empty.
>>
>> IMO something can be added while applying,
>>
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
>Argh, just as I hit send, noticed you need s/implicitely/implicitly/g.

ugh, thanks. Let me respin this.

Lucas De Marchi
