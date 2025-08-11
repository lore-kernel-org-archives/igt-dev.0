Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C69CA0EC4
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 18:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C399F10E044;
	Mon, 11 Aug 2025 18:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="caa3bi88";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1954A10E044
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 18:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754936703; x=1786472703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g9+8vnGvtZ44/yCL6U4sy0RooGwIj8a1byzNC25bWwQ=;
 b=caa3bi883TwQue5gJ3oh7241nlAVgaacM5lbOd2YwXewKkmjimgk5WrQ
 Iq2PQdJ8qGXBwhXMIYmSkllMfq3E4R0DDadDo2qmW07A3tWP1FzGHGMmb
 QBtIteZmKIQ9Ypkw1VhpdHVdIAMbs5rT5q5LDp6cYp5u+5rbScJ3pKN1X
 i+rPCjWvaX6bkyX/X6UCEmFygHD5RPmZ2Y6wd7Ppt53HHQTMsWuruBNiZ
 Mf0VNKhVKgyf8fF77l38alK/mNBk/HiEdUVWYepfgCL7A7P2iVvNSAaM1
 pT4lxjjuqTEAmdkx4orTdmbrPjoIjFiMMp/1LihBn1fa8jLWTnG6g4yA8 g==;
X-CSE-ConnectionGUID: mrW+B9E1TxGm/fkJ+3onXA==
X-CSE-MsgGUID: 4W/nFXrcS3iI7batyQX51w==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56407301"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="56407301"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 11:25:02 -0700
X-CSE-ConnectionGUID: Aly5TsFwSVaFgW2oYm2skg==
X-CSE-MsgGUID: TTi52d2lQMCZ5o2cL+wr6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="170122485"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 11:25:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 11:25:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 11:25:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.78) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 11:24:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdHjUnWqLGzY9q2DA3ZW3pmQ6izMjLJXqbnTlVQXQ7b2ALoBc0XGYE5DmGWolo7IgZmQSybrnTaQorNrlUL+NAukdP2/ChYH6l7jUDrNMP/uNoREMPikQJmlRw3cvvhsdhkg/axcAYewZ3CpHpXW9/wpRdvZ0uuRyAjrXapiAbYVCfqHzjbKOS8p84tDDTlPImYqeFg96WyXR6o7luR30TNcCvXIvj/GR4HywwJJLcndl0Xn8CvCtGiYpXEljxa+SnO3sK8wsmRbKUhndnuuWwCwKaoBS9A7KZjs2n+gmDWuI3iFvut6WWLTWKTMOnSvMj0G1mFkfMgm+4mdjQu5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JEXAPbeS03YRBKxJNI62woWJnygVaU38Si6KaOsBMg=;
 b=ClmV7jt7PvRIMPaiG08tT0gkdLcznZ+3SmDxroeBlrVgc0rQl52lU5AFEIHKQf/ZBPdGEmZD9Q9mDU3VsqaCPVU++fO9GPwSqVZ1KOZImjcEZuM6T7pB7cZtJcyb8K42nxnzYH/ZVsQVGGegn/o1WEZdDcxOsKhCTa+HjcVbRd9/doxgi0T7e9nbM6hjfoJqq9MtClupITpllEzfQn52vV+z+L6SGi+blI54i3/v+6IfiGt/vmbbdm9GV5v0MEjx2WxVh/kAQ7hprHWUG/n0mVaiSh4GHcOBPSB8j9ppgpMoPEJvtTac6E8Dl7zLfjkoHK1SGQOD6jLAjGTGMUPYUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by LV3PR11MB8555.namprd11.prod.outlook.com (2603:10b6:408:1b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Mon, 11 Aug
 2025 18:24:50 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 18:24:50 +0000
Date: Mon, 11 Aug 2025 15:24:44 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: <himanshu.girotra@intel.com>, <matthew.s.atwood@intel.com>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] intel/xe_fault_injection.c : Update function name
 for xe_wa_init
Message-ID: <sjx3rrs2lyzkx3mx44tvcharmkkssjopl3w3jjfv42ivdrdys2@qezyd5277azl>
References: <20250811130137.4006-1-himanshu.girotra@intel.com>
 <3392051b-0e36-47fe-afac-fb3b5c55979b@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3392051b-0e36-47fe-afac-fb3b5c55979b@intel.com>
X-ClientProxiedBy: SJ0PR05CA0157.namprd05.prod.outlook.com
 (2603:10b6:a03:339::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|LV3PR11MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: db614da8-131a-4be4-fc74-08ddd9045baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fKvCO13KNAKKjx69HNLwanln3TdMLvIGlfOwC3ruKokR96DhvX6tvKq3k+/W?=
 =?us-ascii?Q?iEE4AsmiDGbtpmX8X02xmRbh3Xc5Ijg6iHUB6V81ZrOZ6B2tYlFR+4fCtKUS?=
 =?us-ascii?Q?Lz7wXNceG1VH6W4FRzC0gvTG2wEw64sNuKlY7fA0f1l9pYy4MpJzASSPS0Yk?=
 =?us-ascii?Q?OFIrcjDohb+nn5YBdQzHa+y2xLTOhpVCjuAZDeuNVouQZDJcCzA6yjCfufgZ?=
 =?us-ascii?Q?JofpyIxgNxTP00YEkwQW9uN5xst2lSSUi0GDcbm2HYjSUDm/7ULXpXykjVcf?=
 =?us-ascii?Q?x3K5sWnyGwnuaYMhcB+RjFYHHrgUvs4umN13zy3o39h/iqWoi5ObrdBRdHIp?=
 =?us-ascii?Q?X7O1bUs45jKgouVBCWnGfeMps5+wsKRVz6FinrJTuRVAxRcHbRXPE45oXjah?=
 =?us-ascii?Q?vj4jnKNJNyM03Nothn+2eLIH7LKftbpFtdf8AB6xl0Q9K8BWgXF4/jl89C/p?=
 =?us-ascii?Q?+fc/kpyysCuGLm6IcIeVaJybVfCMaJt8oZK0t+K4jXfsuQRweBIvFfhvqVxo?=
 =?us-ascii?Q?U0IuzhVG3muNJoBa0nRoHWJpqatBv3qey6GNBiRZJIQtmLVx9SVbrTKVzMq4?=
 =?us-ascii?Q?aQWl6v/w53vK+EWGiIqscTD1Rp48PTw3a/3XEULTn0qAO8p67jUl6lwUHfii?=
 =?us-ascii?Q?vpCCdUqvqFO0ix3nxzKUUTSaQvXLo9y7ZseiuO++1m5jEP92hEqmjjIIEPyt?=
 =?us-ascii?Q?8odAVjwUqA0pyAxUjeCy1wx74CLmAH4LZJJj0YiIymX84OCU2h5R1MKTaowe?=
 =?us-ascii?Q?HdkLOQ7sZjAVF/t2Ow3mOFMQm/cnO5np3H7D6LXJor/dBuzt1JsuFdr2aQxP?=
 =?us-ascii?Q?peNYhyHS3qo5IJckNEzQJ6qufxRRrrH4kgZGwd/wiAV6p5yAIhbCkTupBvKq?=
 =?us-ascii?Q?VrtzDTK5gZPFqGMskWbqZReEzqqZNhOScLLPgccMUdEyVOznk5phNS+MsLu7?=
 =?us-ascii?Q?ksMJ+hpciBQeN3KYDwaKuWCOUm2nc5hVweEyKzltLKiCo/fsa6RruRunrOK/?=
 =?us-ascii?Q?XlZA6WbIIlourdcfHS47BrgIDKx8sXqjdIojkYDyK/eeAfkhUdYTXEMYU3+8?=
 =?us-ascii?Q?xOFRqBYAfOhx7CyWkMfsrtZAiWR+8IdiGGG7AvF4oVzTk1Nlidj/JlVyj4YD?=
 =?us-ascii?Q?AD2EH1EX7AwTUpkLqP6HgRI3xyywMBwsfZFitrjIAYnBQod+gCF2u7VbKuZz?=
 =?us-ascii?Q?VeJRLkwl5kPugBz3vissHAx1L04llTO5TSpD9/hZTZ1WXGtzVfiutpq/69Bc?=
 =?us-ascii?Q?zjTUyx+Yg147usaKd6d8x0r5UIaY/jEqkONdnEjyNptcQjZ/KSjl0ZzC7uQP?=
 =?us-ascii?Q?P4eZkVKjxgRTRVhebK+c3hoJeybqL+Spdcg1Y/fq0XM1ninbtPkqwCwpJtc9?=
 =?us-ascii?Q?+aH62SxtfhVhAqHzGxOmoZRCPREu0OjVIwXFsM+HAJAe+E1x2ipp+LAvyn1t?=
 =?us-ascii?Q?HZEuGVstNmw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nbgujnijC9qEqvvNgiUx1bHUqP3AuR+955tB6mFg/trAPm4xBjGPPICqmcsz?=
 =?us-ascii?Q?O9EC+xuvnwKoGQpV/LvSovPV2H9Di2Fi/e789OqXKNHtCfXUvTNuZO2mdSqb?=
 =?us-ascii?Q?SdjvOzXjKxwVeYkwbfG+47jfbLvm2F4slFPuTH5Sp2OktCqKuN9wJtvSC0bb?=
 =?us-ascii?Q?sBmCiae/XnzVECf7+9Y2lPiYx5IBBjp9dqFHTOnSKMr4mfx65MO38sB6dsgh?=
 =?us-ascii?Q?EXqkjYflP7gY3YLRmEWaP83LrgGNXGviCLgZ5xnyQBDjeNh5CwUG/w5jTmn1?=
 =?us-ascii?Q?LSg8YXOPMfUxzinDUvhTzMAPfVpf7kXEJVyuy+ZiJxKiKIa3AZYPV2k6ZCFy?=
 =?us-ascii?Q?m633z5DXz11hRe/XWkYXmX/F1eC9WqajRpGJ3UlYhewggHbL8cG/NrD4VdGS?=
 =?us-ascii?Q?ESW+b+Akx/m3HEJTC7stjzCWWhqWsnHFiy4zcGDqzP8kWBV2uIMPWnZ5kVVV?=
 =?us-ascii?Q?FU0w3g+9d+xYJAD6jlLeumZ4a1toao2r4mXZRMIIKqIJP7X1bqK0SE9DIRko?=
 =?us-ascii?Q?nHwatReazOdAaocfPho4McXkxk9+Fz0VGkFWXyST/oiYiwTuWSZfyVFKl4i6?=
 =?us-ascii?Q?UhHySWf7GY9/+Qhco95yW/v69bOf4H1Ic4QOsMm2x7VPvory3S8z9/Y4y0p5?=
 =?us-ascii?Q?azDho5wLfZgN5/1Zx/TlKLo+BB+tvHmppBuJcRm6P0mvVYdDiPZEhT85cTQa?=
 =?us-ascii?Q?cDq9DDM/usJp40DJvcxtld1RptqzUK0nSCE/FdQi5ocNRlhsyTOiOdrAoKXw?=
 =?us-ascii?Q?ZoGJlcG+KOOreldrIxrK4LkpsCPO4R9KQtF9KrxufbuvDGHpwttpd0oK+pHi?=
 =?us-ascii?Q?4qzGIAW1+LGa75kIKZqeFgSS2U1UMyqSFMR+PPNcJnNav6mS5GTCDD8PqpKC?=
 =?us-ascii?Q?aslHbqwBpFctA91NlqTYcL8DGzxbsprnIxUaSoCjY9clFqUZ6GwQh7aFvw0D?=
 =?us-ascii?Q?eB6huve2F5xTkXR6x2f21UAsdb/+FFtj1HyOr5LQeY0h4OhcPFwXG5/h+f74?=
 =?us-ascii?Q?R3A4RS5HA4qT4vYU6blG8NukEp+8oDcdS67tBSpZsRlhtzWBiye2OGSIS0tn?=
 =?us-ascii?Q?VBwSqS+HXnrSwEOU2/nwYy0Xj4yJWHHDHmKONwQLVEMRgQ4COXGYkRPiFsXw?=
 =?us-ascii?Q?6LkKcZOb1XGQBfatH3i84RJdFWRR8inD8QJiln8qREstlk51aH3iPtCzI0mr?=
 =?us-ascii?Q?64mxseKjtawxi+dey/YW34fy1eXDvSnLReUuSiaS4lyylKgpzRChKJRTLBrt?=
 =?us-ascii?Q?s+/wWfZPl4jsJewftKgaAnp+FMaMbwAWQ/7PlWFUNyY/2P2HLwNWseD24XNm?=
 =?us-ascii?Q?ar9lM5h9oSj7FPNzFZk8U3xpM/HRJsHaHkmx0CNThCLj7jGuOAmV2nnQYQe4?=
 =?us-ascii?Q?h+kATsgfQdyvUQFWDdDFyyCZGPzdKmcL+OJ+nF8bYUpSY8w5idu5WRBZ8bz9?=
 =?us-ascii?Q?8KQfqvM++zOJFrntXKxa4A9veB1jrDSv3pW7Gd4PHLaIJbxmChEFQ1dq8q1d?=
 =?us-ascii?Q?YH/ivF/3KtX7niNELQvG8zsjH9xkAl6bQ4uL3ACsBbiNX5rfhOB7vq0C7zIV?=
 =?us-ascii?Q?ziecYsyTkH/XDUq1wUQCkSKnGrbUwOwYHUCOJEDigZkbsmtUx+8hbUmfWdCw?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db614da8-131a-4be4-fc74-08ddd9045baa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 18:24:50.0005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4cwoWBFuuAaWyuJVrCcxCTHwRO0ojWAifQNtWRCyoban4eyKsNZRkbzh3/2SFvmXIKi56JNdzN7NESLq3uXnmGyRHj15nIjveaTnNhfpYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8555
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

On Mon, Aug 11, 2025 at 08:15:33PM +0530, K V P, Satyanarayana wrote:
>
>On 11-08-2025 18:31, himanshu.girotra@intel.com wrote:
>>From: Himanshu Girotra <himanshu.girotra@intel.com>
>Patch looks good to me. Please remove this statement from the commit 
>message. If you can remove this, then

that's for git to know what to put in the Author field (if it's
different from the email the patch came from). It should be fine to be
there and when we git-am the patch, it won't be part of the commit
message body.

Lucas De Marchi
