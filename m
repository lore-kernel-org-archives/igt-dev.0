Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B6AE6FE4C
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 21:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB51110E0BA;
	Tue, 23 Dec 2025 21:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0UKp99s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536FA10E0BA
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 21:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766525281; x=1798061281;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bBGaX/X0Od/eIcIhWG0hPbaJ1tD6xI9D9B9/s8DTdnY=;
 b=Q0UKp99svp9EWYJjkk+8SL/lextyU66//9O8+uNCHHyr1icCZLYtY4/S
 tyqzTwsd9QV40iVoW4owqlekTg5W14FArl0cWATvdmAX1L27X/7Xb4/Hm
 rnGSiSUQUwTtW6PcmArY2FHzkUFysS+MyIBtRx4OT/fd97OwYQtExYPIm
 xZxtxEh/9ZudqTSdlqeiau7P8hFbKwtk5CS7RQItTptjNPZYSB7md95TO
 jUAy0XL9qa40dk1URVK8qbrHg1ACQ5dvncgTVsQXLHwiN5V4lUDD3nz6Z
 ZdEua8NjwLZ5n+EeMoBk9eUH5EXVsuoVjMtbxmnYeaq2E9wpn+3c+vpUV w==;
X-CSE-ConnectionGUID: 8H3USlOcTe+27Upboo896g==
X-CSE-MsgGUID: obsShHEZSxeubYr2WogUdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="91029997"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="91029997"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 13:28:01 -0800
X-CSE-ConnectionGUID: tV09LYYcQ9evP2YpxKuCtg==
X-CSE-MsgGUID: YIaWMOL9RGmza+aFC7Ewhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="204936446"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 13:28:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 13:28:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 13:28:00 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 13:28:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLCPi0aJ405gCf2TCGMuonBPCHhGPpJYNaYHfct3y4fjkr6tpu286O6wCxR4BzkRsBG2YlzCEwZoKJgaYVW0hzf8c4koM4Fv48WBXlxJTSpXCG43DY8PoZwswWRoMaRVZWo5DTdc/NnAes9mck0Jj7cUOjuDTxpnFP2Pr68mr5fDXCdT+0ee4xvwi2E1hYOp46gXbPRvXalivgRAxd7m3Qlehy1d6SsssHajWkVqVLFpu8+jBZ76jaAziX06H85wl8XFlA9HS6r8E+aligDcVpFFcOF/D1YyUyuopXN9Ux1jELBYg2b/sPXgKHFnV5T/3jjw1rB1lOy7awifK/qgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kz35zfEprPW2s6ThkUmI/N9osr3vvFaShGRUVGaDi0=;
 b=daJA0PhYKc5Fdf3tkAryYpADqRCSjQsBGNo9MF0B/BmhdstUN9cPOZ4yWuXW4pU/KLoYQJQvbS4GJmf4m7iiH+D3NJVOZXP3bNfpkyrgaoO4+PSv4/Id2pKrVDK6uJbBmMLgwPJqa6cQ48UCjgwDOKHmmS6Ojn59QA2oa1sq4j5q3i/FeeuGueslvAF3lRisjiq5aIXF1cM9d7dRYzAgUQ7BS8nOInOZfIVLL+JPjxX82GXxFZBCtnLLfwQGI5o4RDk/5ZDgP8tNzsbyAM3IMpsXmVoY3l8ND6GP+XRjqNF0jkTDA4aSNfL0axP6aDAEwv6fRUldQKucrZun9sFD5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7751.namprd11.prod.outlook.com (2603:10b6:208:43a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 21:27:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 21:27:57 +0000
Date: Tue, 23 Dec 2025 13:27:54 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <alex.zuo@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>,
 <kamil.konieczny@intel.com>, <ravi.kumar.vodapalli@intel.com>,
 <zbigniew.kempczynski@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v8 2/2] tests/intel/xe_pat: validate PAT table using
 debugfs
Message-ID: <20251223212754.GU4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251219234615.90213-1-x.wang@intel.com>
 <20251219234615.90213-3-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251219234615.90213-3-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 9efbf3ab-c7e3-4e44-78a8-08de426a23be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AEFOVRPpLwA7qtkyb919tG6fI5jXWTzb+oZVSq6Vh7tn3ZO643JAy47WuY+a?=
 =?us-ascii?Q?nreNkgN7S9hJjlV2+G7/PFV/KVLXma1nSZea3OG/xjnKlL0cyY6cvj32CEs4?=
 =?us-ascii?Q?1+dnTPswCJS8R2fZkKcWonJKcjm4M+IWtNYJHPfilAxdYswuXISuRDkFtYBO?=
 =?us-ascii?Q?VVWcSYQOstkGv8H3Olr6uOl6u6iyqJy7kmsFgCONbhQHF5+orpNFJaHUXBbU?=
 =?us-ascii?Q?gJ6hFCtCzLARZywgV+c1YA3NqvNhsDQHT1pnaCht+AdGXcpej2jmPKeB3L7u?=
 =?us-ascii?Q?aIOQgrO87KxwFh+iRs+5ShLYFZWptce6utg5yyj5Hpoej2G8fqJlD/PTwmHa?=
 =?us-ascii?Q?KkE/IFWMazP5sp5bUQIUdotMj74jMudOv3pf5jQQ8iEkH4EkTpEpjEEbmVQH?=
 =?us-ascii?Q?/FQPx7R89pCS06/dGsZTf9Ls58e1hTY3okAqwSDls04BDqibQLB9PlvtO9Bt?=
 =?us-ascii?Q?wPgs8HLytf0N5XIsHWl2Ey7HH9Dn7icF+1Dlzj+cc+26K9Bpv0U6KJmSss14?=
 =?us-ascii?Q?kCg8P+P/NROoe42eoWUs7p0hzUSMAtbGq5FWtOO2xf9D4sd+CGucyTr8estL?=
 =?us-ascii?Q?twkX4INi08dMyyJ7x9iQ1kq1ityxdciHbWF26u7yAAAIdaWNKNDjJg84EUoy?=
 =?us-ascii?Q?CRJcyeMy06BJg/yuliUYCsRVzvsWv4TXSsTBGQixcZWGamg27EdZ10ncYqJw?=
 =?us-ascii?Q?qXDMjGASx3Tn9601WrRBRqlMf8raU3WpW0phgaMl64jVOC3ofXzKrW7/LQi7?=
 =?us-ascii?Q?0WbSC6qwlUbqLz27Dc+ckjGRETpAp3lhk8WNRDHyZqJEusBTXmM2p93OBPG7?=
 =?us-ascii?Q?zqowS00ed1ENE/ymzA1GmfDFFzJcwe3FKEEip0VWF1Byk+nInRlcJJHTzzjb?=
 =?us-ascii?Q?vk65cRA5jO0DapZKhDG7Pq8ZsOLGs2LHw5DlNzpB97Pq1J2XHFmOJUmDKF8m?=
 =?us-ascii?Q?jmXEOSQPcKuPQ2IiQtqd9jbikg+2o/O42S8RRiimtl+1qdIK4Co6SEHZuMQO?=
 =?us-ascii?Q?x4B5bOZoEXM64HMzjFmCTRaTXdAErFwkZhJ8jpNa4dAO05qAvkDqA/++92uj?=
 =?us-ascii?Q?ARn+3z1xZ0adTo+AfEDG6eZfHLdJaucOUjEG3iSDU66fL6NXlBH0g5yIUdpi?=
 =?us-ascii?Q?Rlnw818gX77cwJ/xZ/Vlkyw1vWmOjRlo8zS6MojaFTFINFQEwjbyR1gkMbjU?=
 =?us-ascii?Q?RrDyXe6EvWPRiKXAaUHkjuZzgOpr/QvIPLQ50HVuNzTax1YGMwGuNvmjqiEo?=
 =?us-ascii?Q?/zH4PjxxfWWmc1RkNO3NRlC8R8381+u4gnFATg01+3CpbXMJAkhAsWHhupO8?=
 =?us-ascii?Q?bn2u8QzSzpl3nT302riGmWmhpZCZR3dZcJC6395w9MnuB38d4qpmVioucg4B?=
 =?us-ascii?Q?XBfd82Pq4bQ8PvMIYCiFt5p3vV5yk7G0an1W8jKPpL62clF+qk7sehF/1rsI?=
 =?us-ascii?Q?xUbOoTPD+WK8+uSojdBnZSr2S4TQ3F/q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rcNGo7EWv6LK5y0Pnz7zjmRQb88Cj/JVrgK6jpHWbz57ZOQevhbMjYMHUWV7?=
 =?us-ascii?Q?nV8vUPLmRdylNAFy6IRi++Jc+W/yyEsCZKq6xSeqjmHQtH/HPbUdmJNsWpNK?=
 =?us-ascii?Q?+rY3Qqjwm8W+IWdqX+SvHgYr/YPHKQK01Qcx7AM6E7VL3zjWKj9TdheFgFyp?=
 =?us-ascii?Q?7fVvP5kuxUQjgRWvRXspB/LRBRdnsTECN7co4K3dabkAnUvS5P+wFUittRkf?=
 =?us-ascii?Q?3JN2bMk8cwH7DOlXTAgRoE8YM+uuJyRid+10UpRqANg2syFLFO2G5OK2Lysv?=
 =?us-ascii?Q?EMz12qXTfsjNJl9+JkhUca3i7a6OKoEpHk0jVb5UqxlmAK48EKjZH+BkwtQj?=
 =?us-ascii?Q?axUIoDokrGs/dhqXoGrLmsd8iQbgaFtTg8KbQuAimGzvopTr9BapMP7Z6k4A?=
 =?us-ascii?Q?aDjCU+vFsUxlfSav6avorS0eQUrAmIMPdbfzbOMdinxBElM6uSkwfzf0N0hD?=
 =?us-ascii?Q?/cVMBE20v3IRDzeMtF86KcgBZBsEmjxamBLSJeVY6xjpk3Fk1O4MFNYPiwH8?=
 =?us-ascii?Q?w3aFcWYauj9jthlsIDVBu+W4lqvAaKjdTW85uf2E1kFLM69PWtoYIrSA1ToD?=
 =?us-ascii?Q?f7Ad6pe66HdhlnQi9DyR/EJkpZvGQlnODLAohdl6wwUrdbWtWZRezg2+7V4I?=
 =?us-ascii?Q?D7rxc36f/lb2m76s4zryiCC3r9BuS2nhrIiNUvdz7/tEM/mKNuDeByydms1u?=
 =?us-ascii?Q?H/O4l7nhS0yCkubI8qAYvT6mAEShpr4EOEF+yQu6IxiJ7GRNHl5VruUGcLze?=
 =?us-ascii?Q?1JMRMQNnI3QNMuSTCK/ibEynIA2VvmniTzhf9bbRWYOrK0mKxzZt2VMBB/gc?=
 =?us-ascii?Q?XuWkpSbXgsWswZ7yiPVOfwBVcFrVVaRvs8YCqBUCm3ccuAfBWqXYhrjRxf3c?=
 =?us-ascii?Q?am5fnuS0pIRgx1wmBNa9St2UuJ83Nt2sfM0TE2qRKmjme6m8CO3PG3gMrAwX?=
 =?us-ascii?Q?e1BD7y34sWJNn0WUVRYJcFOavBnVYFZJqGd7QFZ1cZm4rPuDksMJBsrlghml?=
 =?us-ascii?Q?Toovq+twGX22tVKF/+7Ar9H008bNOMQ95QENjYp5jMUneMHY73N8JKKPKmy7?=
 =?us-ascii?Q?BHvm/5/8FoD3eeXEPTsWVleP97/fotBEH/4E4OUajhjmFnEU6qR5YcoK7ozb?=
 =?us-ascii?Q?6ENTvGJ8gx8/4Kp+cHp9yAd+uXKUh//yM+0/CtmSsxgzrpgUaBrRScNAoy1I?=
 =?us-ascii?Q?Q3hRjTWPPSJlmC6GSKViiEcnIF8FpsBpPXjHY0rwEdzaexJh7NVHdcQFzV6M?=
 =?us-ascii?Q?PncVbf80CmqB+rRFGgciehYJWWBLKWBf5fr8rLRViMpRx25UsyEmiu5WUJKb?=
 =?us-ascii?Q?KyBWZ+peTEkst+Gq6tZrx/qPWf2tDP1sg1mwdHBs1YWsHV+KxR6wHLguzU9A?=
 =?us-ascii?Q?6DRm8MrwqenNvAMR4WmH9/sXrxM+PvGovb4qHdqHFvYFamPi6BowBBpZCJri?=
 =?us-ascii?Q?cwJkQRQvwAw/UHAqVeOpzDnTAI/sw+XApKz1cGMLoIK4y5PrVmIY88bGSY5G?=
 =?us-ascii?Q?sUGgERyhhQBnV3QVgtFF4WtjS913hks7X6NWAvbc7xdBj9f/LzdyQf9bZF9G?=
 =?us-ascii?Q?Ch/Gt7zEtK8DbelvnyNF+0auod4yTK/Z+9ZAnhF86977wxJBmHqo3kZaJXgt?=
 =?us-ascii?Q?56dOyhCHIQhiJqQxm6gqvPao5e7Tkm3yoFqoKWfZGFw8JPVR8huWhCepFehK?=
 =?us-ascii?Q?/dx9PLzwNyC0xwoLpdjlBmC8nwL1JWBaxRX0CCE99dZzcIlJGTyuxReVcdvX?=
 =?us-ascii?Q?DylBk1Uw5k5lEyFtgzXt8dVQVBXezgk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efbf3ab-c7e3-4e44-78a8-08de426a23be
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 21:27:56.9557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dl6jSvk0FwLZjHfEP36g/rzuMS0RMI/fFJsZqe6kYcFcTrntyQRu+uKEV1TTNvD+LkrpgFjTElMSSFJzY0kViZeKC4ME/MQmqpzQZO1PcOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7751
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

On Fri, Dec 19, 2025 at 11:46:14PM +0000, Xin Wang wrote:
> Use xe_get_pat_sw_config() to parse the kernel-exposed PAT layout from
> debugfs and validate it against IGT's predefined UC/WT/WB/UC_COMP mapping
> returned by intel_get_pat_idx_*().
> 
> This helps catch drift as new platforms are added, while keeping the
> common library path free of debugfs dependencies.
> 
> Also use the debugfs-provided reserved flags to determine which PAT
> indices should be rejected by the kernel, instead of hard-coding the
> reserved range.
> 
> V2:
>  - Validate the parsed sw config against intel_pat getters
> 
> CC: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  tests/intel/xe_pat.c | 48 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 2fd3635fd..9b8ea165f 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -77,6 +77,18 @@ static void userptr_coh_none(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +#define BITS_TO(n)		(n >= sizeof(long) * 8 ? ~0 : (1UL << (n)) - 1)
> +#define BITMASK(high, low)	(uint32_t)(BITS_TO(high+1) & ~BITS_TO(low))
> +#define FIELD_GET(val, high, low)	(((val) & (BITMASK(high, low))) >> (low))
> +#define FIELD_GET_BIT(val, n)		FIELD_GET(val, n, n)

It looks like this is copied from xe_query.c?  We probably don't want to
keep copying this kind of stuff into individual tests since it's the
kind of thing that a lot of tests may want to use.  It would be better
to add it to a common header somewhere.

Actually, include/linux_scaffold.h already has GENMASK / GENMASK_ULL
that works the same way as the kernel's definition, so it would be
better to use that and drop the BITMASK definition completely.
FIELD_GET could also be adjusted to match the kernel's interface so that
people don't get confused.  And I'm not sure there's a need for
FIELD_GET_BIT since 'val & BIT(n)' is pretty simple.

> +
> +#define XE_NO_PROMOTE(val)	FIELD_GET_BIT(val, 10)
> +#define XE_COMP_EN(val)		FIELD_GET_BIT(val, 9)
> +#define XE_L3_CLOS(val)		FIELD_GET(val, 7, 6)
> +#define XE_L3_POLICY(val)	FIELD_GET(val, 5, 4)
> +#define XE_L4_POLICY(val)	FIELD_GET(val, 3, 2)
> +#define XE_COH_MODE(val)	FIELD_GET(val, 1, 0)
> +
>  /**
>   * SUBTEST: pat-index-all
>   * Test category: functionality test
> @@ -86,6 +98,7 @@ static void pat_index_all(int fd)
>  {
>  	uint16_t dev_id = intel_get_drm_devid(fd);
>  	size_t size = xe_get_default_alignment(fd);
> +	struct intel_pat_cache pat_sw_config = {};
>  	uint32_t vm, bo;
>  	uint8_t pat_index;
>  
> @@ -114,10 +127,41 @@ static void pat_index_all(int fd)
>  
>  	igt_assert(intel_get_max_pat_index(fd));
>  
> +	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
> +		/* Get the Xe PAT software configuration from the debugfs.*/
> +		int32_t parsed = xe_get_pat_sw_config(fd, &pat_sw_config);
> +		igt_require_f(parsed > 0,
> +			      "Couldn't get Xe PAT software configuration\n");
> +		for (int i = 0; i < parsed; i++) {
> +			uint32_t pat = pat_sw_config.entries[i].pat;
> +			igt_debug("PAT[%2d] = [ %u, %u, %u, %u, %u, %u]  (%#8x)%s\n", i,
> +				  XE_NO_PROMOTE(pat),
> +				  XE_COMP_EN(pat),
> +				  XE_L3_CLOS(pat),
> +				  XE_L3_POLICY(pat),
> +				  XE_L4_POLICY(pat),
> +				  XE_COH_MODE(pat),
> +				  pat,
> +				  pat_sw_config.entries[i].rsvd ? " *" : "");
> +		}
> +
> +		/* Validate the parsed sw config against intel_pat getters */

I think it might be better to have this validation in a different, new
subtest.  Checking the built-in getters against what the kernel is
reporting a really quick sanity check that would be appropriate for BAT
testing and such.  Running the rest of this subtest to exercise a bunch
of PAT indices is a more involved test that might only be included in
FULL testing and such.


Matt

> +		igt_assert(pat_sw_config.max_index == intel_get_max_pat_index(fd));
> +		igt_assert(pat_sw_config.uc == intel_get_pat_idx_uc(fd));
> +		igt_assert(pat_sw_config.wb == intel_get_pat_idx_wb(fd));
> +		if (intel_graphics_ver(dev_id) != IP_VER(35, 11)) {
> +			igt_assert(pat_sw_config.wt == intel_get_pat_idx_wt(fd));
> +			igt_assert(pat_sw_config.uc_comp == intel_get_pat_idx_uc_comp(fd));
> +		}
> +	}
> +
>  	for (pat_index = 0; pat_index <= intel_get_max_pat_index(fd);
>  	     pat_index++) {
> -		if (intel_get_device_info(dev_id)->graphics_ver >= 20 &&
> -		    pat_index >= 16 && pat_index <= 19) { /* hw reserved */
> +
> +		bool hw_reserved = intel_graphics_ver(dev_id) >= IP_VER(20, 0) ?
> +				   pat_sw_config.entries[pat_index].rsvd : false;
> +
> +		if (hw_reserved) {
>  			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>  						   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
>  						   pat_index, 0),
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
