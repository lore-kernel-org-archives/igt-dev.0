Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D10CCF9E0
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 17:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E35010E4FA;
	Mon, 27 Oct 2025 17:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULmx+0qR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5F910E4FA
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 17:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761586346; x=1793122346;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=ZEpSyJPFIQgYpeZ5+wjYTIT+ztwVcdYILCgVqKWGbLQ=;
 b=ULmx+0qR/sSve9q5qdjLbe2NGJ1QBnzMqcTWIfUiHx/34w5yqTcqSnLC
 TrwxulvobraHTMlmyFRg37UDXGJ0kyH5h0DRaJhcobdlcQf9iKXabTg6n
 t2VKT4jJph8GhhD9FRm/dn7LeR+Dt4kbmx8UZAxbtFTQJH+HBPN4QcmD2
 /kBvsBRGxbLeCaT76ixdEbUeX/z7QmX6dAd+rAaE4aizWAiec1jjYhx8r
 l5Yt9p2Kvc9F8TJZfODLsYJSNs5+r5Mbg1NghoFVVF7R089x+lymQy2BL
 lUFgVTZank2eXjuES5E+ZtJmQzJ+GB/Y6IEcQiJAeK3rfwix+j6mEKzOI Q==;
X-CSE-ConnectionGUID: 0+GEOPotRXqrrQw2JYINfA==
X-CSE-MsgGUID: Wb1QvvKqTla0JYEBYJUKbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67540877"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="67540877"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:32:26 -0700
X-CSE-ConnectionGUID: oSUl7mHgQXKoS7zxAhr9iA==
X-CSE-MsgGUID: epbKSMLYTlWrsn31/jAKqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184335651"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:32:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:32:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 10:32:25 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:32:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJoWj0QkdC+cU0EuukuyQmWR4y5uLAVBVDCkQPhI27RZxNGB8Wcd5NZE7aN4JBK2W7ak5iKbNeUam+QTiEIvDO2/cbUun/mDmEhyFvuu27apJARmDpkTJLtjJMS/dZ4DYWHzj1heqkCXTG+4otqrSq++PoS3wcUbKKX54BwoZpVuwOSj7l8snJXMqefKYVfjGdeAYhUn6itZjelGwG9vyoTEl1qh8RY/5sT012HV30V654maylYmLFk6grLMNL9enxlwhH40+6P5iTDEzDtbboKxIETc5Fc6sJfOfI3qyRoGfuFZkM8dOKXGC8yzt9lLc8ZmBBrbIjaFRDRifbzs3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTgNkreHQzLym+N2jqWqTLQrBwuQSWkPE5ZZwid3+Zo=;
 b=HAP0YWVAzron7ySSMFBWEVlmweJ7jXddx4dLsWpWZwTtfB2/oVbDaPDThvRcD+9qbzQHkSTzSEi+Yl3UFVHujdyCv6EsQONMJ04Ute4/6+E6OQjeLZYGrC1LZNnI2JoVM16rYYHjX4MtIUQzRn4x62XL5Jx+ouNp6LuY02hvj6BZEik0doLGywuqFAU4yiF4cFqLVhaku1spvaJyOWo1uEOxgvIOtR1116fTkWQsoFQ3GeZRmEyDi1y0S7TBdHEjJBZsZIu7tdW6h4ufBL9VZT+wGg+HyquGUfwygGPKlDt/LNrnwQLIsnz9XkqlT/OEr8plPe2bvFPfLEcTo68LCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7296.namprd11.prod.outlook.com (2603:10b6:208:427::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:32:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:32:20 +0000
Date: Mon, 27 Oct 2025 12:32:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH i-g-t v1 0/2] Sync PCI ids with kernel: split BMG to
 BMG-G21 and add NVL-S
Message-ID: <r3qta4cvqmq7j57d3kseoxxhm6p2d7miio5qnm3cgoznrisnzc@buy3awhexq5o>
References: <20251024121517.73013-1-kamil.konieczny@linux.intel.com>
 <3loc66jqittg2apyos7jvnn73r3p3jkcdlzua5icxlgxuncxev@fve2uvhiqyt6>
 <20251027164322.ht4lppo5cmnjxmqb@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251027164322.ht4lppo5cmnjxmqb@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: c73cee48-0f74-41e0-b038-08de157ec867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C7i1TkepRgWUKh6K2Y0XaFI1ePjplI11DYSN9eN3Zf78/m5/hc5J8pBvC0MF?=
 =?us-ascii?Q?dbagkMP4Z4hn6MR5vlPIHM0OyiE+Tqdw6ks8PMnxCaY2ZSrr3bsiX5GiwpO+?=
 =?us-ascii?Q?EPymFIaTRlgAvUQnWSNmHaFG8rgn22VU1oP7rPbm+YlkD0ccy0Se/0zDH7Lc?=
 =?us-ascii?Q?Ias5ovDb2aSwRFQSnhVLsMrlWM4s288cRxNptY6vd/7qvNneV2jiICXM9edV?=
 =?us-ascii?Q?q0wgEYDVm+2mnvqxYjrwBm0B1HO8BQzfa1OIi8bQSl973is2pz0OuSAWrE8R?=
 =?us-ascii?Q?sYi01kok2imZ5GvZkOgyO5s+VIdur3att4d7DA1G1JHVnBuFj/Nkn13eWkrR?=
 =?us-ascii?Q?Sic00oq79XZliUAdNOLSsyTaAC1G3Yib7i4zrLJHwEKl2FAw6yXJDCZ2Ox3Y?=
 =?us-ascii?Q?BIhcCRyBCEPojJE3fQPeEeb6XSGtBJxrdZZ6mtaab5AJc1zEmYXzxsTIYRYE?=
 =?us-ascii?Q?t6QsMwCV7c0WJRckXK3rXc7QqrZBGU0kKP6KUjIe0yZWClTp+Zu/0cE41NCD?=
 =?us-ascii?Q?T9fWo9TRao6qaOLhpXjrNuw1UpLTC1LBbah1mx8fYaJijBOy6Cxlx+YEiCcb?=
 =?us-ascii?Q?da81vWzsaOGrx8kUa20toqZV9EVxG3WkZA+miuj5RUGT85Hp3YzC5VzlhCPH?=
 =?us-ascii?Q?gX9zql8+o1J9YX84UYQR/9ZqjArxVewq+UrfgSB0d5HppyuvBV7yBRkJeRwp?=
 =?us-ascii?Q?mpSlGCVNkxucoN/XLzjd042195l5BsY1KvJs2dHwGWvMBX6IyVfsIWR2rHSr?=
 =?us-ascii?Q?zXuPclOvO/809WQQYm2Og6e+XIy5i8DJg+ZiXDxiBP/HBd6In6fiWHjJxgp0?=
 =?us-ascii?Q?b7hlhT2KE9Bbkbm8be7TOtoPYF9HBJEJUJ2/pVncn1U/uAdA3WS7T2efl2y5?=
 =?us-ascii?Q?RBsRaR7g5augo8UNXl3YXLTB76knQyUKpF2w6uxPO6GooGFFQKvLvAOWwH8U?=
 =?us-ascii?Q?iYt/zwVy9V/nkKXtBWM5+JTWRLWUwGqcNg+EdaGyP4+cTP8oKGYLovklGLbk?=
 =?us-ascii?Q?IGTEF0vls+m+TjBvHUylhDQe0R0DsTbFvRIUuihUCugHh0+hT7A93v4w4n6Q?=
 =?us-ascii?Q?pykSMn7qtkuuUdIcMYRLWUdQhSeyXvz4L16A+hKDmLEWcq2gSj2pxfrWAxb4?=
 =?us-ascii?Q?CgD0mf8DmpgWpUKXPFPiRP9k9Krm5COjUwsa3wwPzUlHvkXeb3oZaPtTCYK8?=
 =?us-ascii?Q?LJ2fO44noX09kRbntFl0vnKcwps6Drk+xG8326rkcjz5o7B+vrcaSXgglmCg?=
 =?us-ascii?Q?6rAGKcq+KojpL2glIpnxTmbfEBbI6WJaNM+KYDZyRZJZmMR9VvlusWfd/mpE?=
 =?us-ascii?Q?jDrOFGgxIVku2fnVJEfq1YWm7Tx7JZ3t8NtaSyjBpW6HsFpMHyaGNF+/5o0m?=
 =?us-ascii?Q?NUqXQFyS0gI+trQ7/gmOe5PCja/yFtFENuBFGAsQh6xA5RMe0fzWNZ7PMtbw?=
 =?us-ascii?Q?ixI46Q81lnEbpDDhGy11VDLYGxvAZ2iY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v2iFLaTsHHIXVx4r+PiIpr+0MhuCGa5pngQ5T0it29kB/5ZfoGf3m+kA6C8u?=
 =?us-ascii?Q?ubzMje+3lpFjbrtzdkBqb05sXMpsWoxmd9ZbnxVkro6Ba25ES2VbR76BOlMi?=
 =?us-ascii?Q?ECHWxucpVFD8+2v/sUUKmC08FKUHea9djnqTIF97fVUM6UhF8QxQLW5/bMTG?=
 =?us-ascii?Q?IReYsmYq0+SEbf0Q9Q7gdmveBpSKlDHrPikuzAUavR7vkxAqp4Udm2bgcu7h?=
 =?us-ascii?Q?YGD6S7aB6hD9jFwMl1NXcdhdoqp5HsDbw+pExF291zQNfXasqJi4c4BdtFRm?=
 =?us-ascii?Q?b+y+1e58rZkTJKvWsl1fa0Et6IFT84Ln1SEtgWPjs2QBi4SolaBhdcZlZlyf?=
 =?us-ascii?Q?PptvlHpOZMKH+kZbWN0x9qiJPXCoJLyj7wnf3A1rFbh42ITa40sWKBfn6EhO?=
 =?us-ascii?Q?UiEf2MDBqb1AA/4PLte55juYcFSzCickfSy8RCatRAroYsAjRtTg/qQtHFfp?=
 =?us-ascii?Q?YOfxNdxHOSoPUg2ag94fmXRo8b6vFDhmp3EkaEAHXxAc+oNGB2Dgww8yFPKc?=
 =?us-ascii?Q?oRz5BfD6zkq/97I1qWqqJri0NOuGJ1tFTKCzefLQw/UAvJ1gBNoR+ym+DzW8?=
 =?us-ascii?Q?OLLB05ZaPuaX8xzSVeYPcdwN9NYZMzAgiwxQ2kK3d85iOzG/2I8ZaTVb1zgN?=
 =?us-ascii?Q?5qtv9cAxHaRHQyKNmq9bKUL+IfDLaL2GVLzlJUKTJi0el16ci0JRlYEBrSmv?=
 =?us-ascii?Q?ytyC3M0yyJxRKggHam8bO1QikuF9sxMUs7fapTEVk/w+mZFXfhwYWKIaEcqt?=
 =?us-ascii?Q?/8qjY/gxFguQ5fknfN65+fMbu23CmmayawRo548dTxW9uKUPe26P2NcjC1L/?=
 =?us-ascii?Q?clh6fWAToG+ixfwdMW3GpCKTTePchfeeAnVUZ/k6VBM8SRa6Ma3XjxOL6TK8?=
 =?us-ascii?Q?JzjPMNHGDS2STVq0o3uCRTYlI/VF5euto+Cf3NObDmj5HcFuaN7nqaWamue1?=
 =?us-ascii?Q?GxugzQA5GPcBpEDage/3Hz0dciaNUUqBVPb2ESXZEzwuZV3R6nWbNWoKBfJ/?=
 =?us-ascii?Q?8hnTY+SiGQmHBTnACl9Jk9srALby0U5E3biwj72Bt4/IS8Gs6fdbtYC5880g?=
 =?us-ascii?Q?nkiPZLtC+aeWH/B1K/DHfCp0mdKTJvU0TLZKihln3ZYKn6rF6kn1z/MvO9bD?=
 =?us-ascii?Q?cryCDDd6oo/7kEnIwRNbNcMKdHhI1PDOiLYbn9FOYF4c70X4Cz8igMFR2zF/?=
 =?us-ascii?Q?EZPtSTJqJP/3r/HZ3m/OhsLcE1tQ60gjpnhS4nciG7hYAgfMvuPn8kd+fTpR?=
 =?us-ascii?Q?HQTluTrI7eHR6jKV1dhYVYnOd6/JRDd/ayaVcuVRbWKfhvwx7iuuguQQOZGO?=
 =?us-ascii?Q?mXiR2Gk3BbcZJm2lci4f+P4iVxlxHlq3Jk9cLB2UNwDh1eAFhellJDCJBrJi?=
 =?us-ascii?Q?5zfNs3rK89k7urHmMro0QHp7zDRXfsuiSs1cq6uEGQUZMInsNcE1DAQyGuM7?=
 =?us-ascii?Q?VK/Rz/v27e0MIR7Ma3YkWaNuhYsMDxwRfxIqj5Nkg+74IERCRAeDVmMDhfMn?=
 =?us-ascii?Q?mW7xwNsQB063gen+0faZ4Hc2H8cTCsDgRzRha8Z/LvJElC12X4wi29T7qOM+?=
 =?us-ascii?Q?+mk50kYS60/1viI6f8L8E7Ss6t6d3Y7sdhlbbQ/9DX7cgSyIx7BpvCPPHz8o?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c73cee48-0f74-41e0-b038-08de157ec867
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:32:20.7463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vMfozWifa6If6resJ97wUUoATcHIxqw9vV6Qd0T2Fh6/NVLxlsRZGuvFDv8B/i/vzfc80md2lWosl1uKcEKQTmeB6Z1f/7KifjA0U5ubbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7296
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

On Mon, Oct 27, 2025 at 05:43:22PM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2025-10-27 at 09:25:12 -0500, Lucas De Marchi wrote:
>> On Fri, Oct 24, 2025 at 02:15:15PM +0200, Kamil Konieczny wrote:
>> > This syncs Intel GPU PCI ids with drm-next kernel commits
>> >
>> > edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
>> > 78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
>> > c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
>> >
>> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> > Cc: Jani Nikula <jani.nikula@intel.com>
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
>> >
>> > Kamil Konieczny (2):
>> >  lib/pciids: Split out BMG-G21
>> >  lib/pciids: Add NovaLake NVL-S PCI ids
>>
>> any adavantage on splitting the sync? I'd rather just have one and
>> already go with the tip of drm-xe-next, which also contains the PCI ID
>> for Crescent Island that we are also upstreaming:
>> 5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")
>>
>> thanks
>> Lucas De Marchi
>>
>
>It will be a little clear in git log --oneline, but I could also
>squash them if you prefer it.

since this is already done here, I don't mind either way, but we do need
CRI in igt - no need to wait the commit propagate to drm-next, we can
use the drm-xe-next since it's in sync with drm-intel-gt-next at that
point.

thanks
Lucas De Marchi
