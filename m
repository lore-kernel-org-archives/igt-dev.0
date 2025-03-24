Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3131AC36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 14:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CBF10E416;
	Mon, 24 Mar 2025 14:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7G1yjFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90EF10E416
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 14:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742826124; x=1774362124;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h/UMsv8DH8J4wAMg0hoSlgL3bZOepV0js2xa8fVIMVs=;
 b=P7G1yjFIWmd7eyLYBk0lMAO/wSUy+j0SPvQ0FTVK5ePTsfgyxhh0LudO
 4NzuvEhKjXfjSFWwZ4LGkqKfeurqL3ICP3vzvfDVQgxyPJeJ6UUTBxAyN
 Svfvr97IeAShuHzTYcJ5cL/yP2h9LGmiQxGQQT/cx8xiRtLe18VcwrRYI
 HZbOi9zIr+X3GoxBpWUokJDPgrcaKfNgcwHDkcgObc/x2XJEXSU8Gdddb
 S8DK8GtS8LR3ao6PyZvUqTKeJRXuUBBn/PJcKFGUa85yV51aaB3LTtnoT
 SGtzpzK1u/wz/IcK2k4YmMqHDdJohFubKbFt7EqVoha4Ce1q7/HN+MYDl Q==;
X-CSE-ConnectionGUID: ODBoN+TBTEOx0H3MArkSDA==
X-CSE-MsgGUID: WaVIZYD2SxCqkt3BtiLdJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="61554869"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="61554869"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 07:22:00 -0700
X-CSE-ConnectionGUID: v1CE1Y7hQIKuz5+bhEjFBg==
X-CSE-MsgGUID: hmtDrwoaS3i7kKsQpuGn7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124585423"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 07:22:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Mar 2025 07:21:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 07:21:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 07:21:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XB4D4HQOVTclRnOsaurBs7A+SyWdiDdItgY3ksC+PDH4sAgZRBK+JV8laqM0pWVGpkfVYK8FOS6C7Zc93mv3EytONOM3ti7y6xIwvLP/ffBO49Lb7fFQg+e2vWue48vW/24gJlCLr9+FDWDGzyP9PNDATjjpHvxAsFQQmMuUeeJpsqMJuXzI8I9SkeD8c8YtD4ZkMlRBy+yc64NBf9qjudIEvU2MQT6D5y9QnvmqIG/4eCZ7E5N49gWyFTEYJldLgpuotF6Tp9NgZqsvIv1oW/QzC7BDn7Z6bTZPbJp4M1I/sWiE2420zAOS2k2UpS+BLO6YshHwzrEr72rNMD/R7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1il8B0IMxBK/NAm30Jz22F5TQRBO6xOlJUjfouL/8Y=;
 b=TOdKBwPgr1BoJnezP2JXgCOT+vri+TGR0wMJCQIANOZKd6qlT4XlP6h5QvagPgDZRX6W997Jc32fwdPA0GRGBUN6V6YpX4h7tMg3WbYczDdPKCYAlyhzzDPQg5AK76uu5hIFNQp8BIj0k1MtEkfinUAru2AU/4h0ycuIDohhrLyIKf9/ChyRWtmvCDhQz61hehuRUJAwBHugjlqcjByQTJ/ilHDmZ1zHLR3TQzB/TAb77i9HgSi4RZIahnXEBb+euSbEXflxYFBcGWqX8wRWK1TW3ewdwLTUY2FvmhbB8932fUyS9+SHNgxARzjs6hJarGv3z9eKEzwaWNJwx6QU6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 14:21:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 14:21:56 +0000
Date: Mon, 24 Mar 2025 09:21:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib/igt_sysfs: Remove XE_SYSFS_DRIVER_UNBIND
Message-ID: <oysvk55ukeurfrx6kxkemh5cjl5oilpxung7rxaxkh3ou3acmt@rxpgoe3mfxg3>
References: <20250314095701.581686-1-francois.dugast@intel.com>
 <20250314095701.581686-3-francois.dugast@intel.com>
 <ymljpacghshws4qbudrqmpp55sssjxggqevubeavimavqzgshn@575dnsxfj5d3>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ymljpacghshws4qbudrqmpp55sssjxggqevubeavimavqzgshn@575dnsxfj5d3>
X-ClientProxiedBy: MW4PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:303:b7::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: 900a881b-e4e8-445c-d75f-08dd6adf3ba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?meeS3sIKVL1kMxTxq8YH8pscAIOK0eMsT6OLWUR+xxi/5heIqG7UPue/yTb3?=
 =?us-ascii?Q?w9UUpDKaABoncidIfwvPuVh5cBZMF9JUnfqhASWe9DMl/afCK2KRK757/mBx?=
 =?us-ascii?Q?Uq63JAIY6pH2mInhtdMPdtgYc6ffbBaZOACWVvRiVPXMgbLlLKFfIDoIWPFh?=
 =?us-ascii?Q?vJmr58ee5K9hGSyv5/GAzsCrDyVwDi2gCXrBqGcGcgkQiLVAXPJTTEAKY0eU?=
 =?us-ascii?Q?B4AqHkruw2IUoo+Pb5Ced4x0HOmho4iBQari5eTASVBgmoRacvnZL9fZPMAz?=
 =?us-ascii?Q?SJdBv/8LSDWH4CYaGAFb7pXgLASNQCZCLYwK+62uAMKDNdQl6aBJCDGJuk6f?=
 =?us-ascii?Q?MyfRWjyi2YBSa4tr7ikD+/yzruGnDoTdkRHeYdN/Ns1xEIu1zSiWmr1kT1pL?=
 =?us-ascii?Q?g/f6AhsWypm7O5JVzrzstUxhmODemImTxtY0c4ERbEf2g6ZbswxVqq6R6SRg?=
 =?us-ascii?Q?yNFdaWaex2Z3gs0BYbZgS4iq4+9dtUssabdLtmzmqq6IXZFwTSFhov1AwU8C?=
 =?us-ascii?Q?Zeo3bSpUtsb7DiF/lfNSGbJh6dnDe1Oh+QPonOO8prmR1J67LgyN3tiRP9nF?=
 =?us-ascii?Q?0Ytw4poyyk9mJpAY93T55tP5sU3byEaFiuMtUyV0nO6U/Mcd+dJRbIH3sJNZ?=
 =?us-ascii?Q?bVvgtge1KAwjaPXrxofaamxtHW5iEzmirgrukhQgIedFvjc3y0y8qthxpfVD?=
 =?us-ascii?Q?TKTPjAQh+eCysDvTpikaf3R9DOKeXhQ5j1bcv4k0Uw1oUyPNOWur0s7QS6Kc?=
 =?us-ascii?Q?bUCcFOZzGnYq/gM6QZfj7BDwVU2J6HDatgJ6BuWbrbRlKd6zylmJrUdYToh1?=
 =?us-ascii?Q?sb1hw9JoL6RbvQ/isAATRHN7iUyCXZDQW6QH2wnFDBn1PpkUzfmxH2BIL+rQ?=
 =?us-ascii?Q?ENVa88EMHg11Z20KUGjzqRiehyt573ZIjGZmyZQYKChMLXQjEoNtX3tWXcKx?=
 =?us-ascii?Q?eJKcR0Cw68CYMCuAC8fe3r+F4ZIC6g4171q9bMmxt3Zk/0to5bbJC6AYNmdH?=
 =?us-ascii?Q?anLNgK9fX0rBdezhy/9U8DNxyfWVgfBTnw2tSWNTX2wsa2lQ5RGJrzQngNm/?=
 =?us-ascii?Q?qM/jO4PdP1r3ECa0Fus8YeasMiG6VATY6n0KvG9v+T350dagLxzaRI0AcgqK?=
 =?us-ascii?Q?hmpNNBvuenChVrWqLzQ/U5UgCmZ5VbKqkfapbu0y+sDe8urFWweOfmmUeoSV?=
 =?us-ascii?Q?pnHwIBAib0sgn9DPRoxWQu69CZ0JKH6iF+EMBjIcwpJTgiRRQJ6b47spAEKN?=
 =?us-ascii?Q?kaYi8Gum8oRbLM98llQWY19C27fhIi18hbgvOOo35V3y7N3p16FP7ctARftj?=
 =?us-ascii?Q?cuEYkXb4CPjKHS8dMIgbsDP8KtLPFdxbt+xgY4c9r1kSDJ9EXlhFOXAf0kOM?=
 =?us-ascii?Q?V+PVoM8xhWC/C0rLrpnmGsqdmGth?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hvHZ3DaPpFhMM2uGxhajEy6mLH2xvbSvjlNhgUCwyUd8ghjroUGiwSirggOu?=
 =?us-ascii?Q?CPk3rL0jLXlAcGX66eFoKlamti2ZkM9HcDrMu5GmAu0LDUgRrhLSGFD9/a8K?=
 =?us-ascii?Q?xGOmaacihu4yt5J4Gkn0eqtHehG+BU3e98VteHzmEUIbtxp0cppU2NzrvQs2?=
 =?us-ascii?Q?X+eZhrQ0scck+itu+Dclt73zFIPRSaby3YRxCS5Wp0O84ABnJyMuPGl2PXu6?=
 =?us-ascii?Q?3khI0/kgV6jRRTfybkTri9gYF5xowj3FC/06fGHaaGgiV8ifrpUX/fRE/3Ga?=
 =?us-ascii?Q?EaK1ovUUs4PAqVj+HAh48nyvd26RfygHsJBvePiB9zAOPtxXy5GT5SSxLDhH?=
 =?us-ascii?Q?DWDOieB5RP7ET7DPhNQCTXnGZ5L9k36KnBYhB+R50jGXvzu6x16gF601mtl4?=
 =?us-ascii?Q?xjLDi29X5je/MTQwnql0Xvq6W7IlQ0EjJxK+aSmk5gpM5XZBPf/oY4XXFsVS?=
 =?us-ascii?Q?Pcwy08GKUEbeqflbsylnJ5STARSRIe6OUXCa9EvQ/exlMircvJZRbhEIbm5P?=
 =?us-ascii?Q?7pEcEjX9yFKjk76VHyP1VW4sFmnzmRiJutxPsOiFjdAo6OMmW6QRU+ZEuFRd?=
 =?us-ascii?Q?xLwz3m+g8CYi/N3C/WmjpriHEyB3qymzQFx2RfjI5I4bEf2u3q1IGDiBMvQD?=
 =?us-ascii?Q?dlOhM4enrDHnCvvhtKwvx0qrJs4xTj6X1qNSi1xDQ2klDPhVtrQPCgC2TsFl?=
 =?us-ascii?Q?CDTr05sS6ULPaZRXXilockdT3LQEGQvcOkfMySrgcSz4Tl6+tncBs/b3NMa6?=
 =?us-ascii?Q?r0uOSFjWVvMeLJD+JihXnBWoljgHKv7SXK4A4nUfAT1XAQ9emiN3BEqGnhK0?=
 =?us-ascii?Q?VuhVulWwNkJqaUNIogl2oqoX9Lpt+cGQHJQyISZvED1yJyZYJuhSlSCPmnf/?=
 =?us-ascii?Q?OupeMk/z4syARz4cui88zFHqRrawXl59kRXpS4eI/CIYzhDgW6ShKBA6MydQ?=
 =?us-ascii?Q?hqQF58HlGfjhwyxcW6IgvX2S/yBurSNaNpxT/k7dzLZ17+iIVCI+ljzVN+oD?=
 =?us-ascii?Q?ivzjHasgn07aoqR5PA7tqMzwHPyNGUUKjzuMU0mN7Du+XAR/jeC/mwNMjGk4?=
 =?us-ascii?Q?oqgzgX25cQEh2qyuaJS7DqypjQW+KFaavWFngd7dMbeEVF0x5aozXylyJaag?=
 =?us-ascii?Q?SFx/Eo4+7sWrxa9uIKfHjaFpWbiAfsyyPvnR26FCphQ5ISyOcaVUp13TLrIR?=
 =?us-ascii?Q?5vqT/zWlpjlIGsyL98x8OGowm99y0LOHzXZBCbb29iwamxGLdmfaMD0D8Ozu?=
 =?us-ascii?Q?lQikz0bb5imiX6RSRFMMR1hC6Ix4YuGJGH/HN8c68pz50mezlyIUru5aeuUk?=
 =?us-ascii?Q?bE/X/bUgl0SDLE8CEpwTjDTUO9Y/UryLHD4l/lrETeVu6GDMRRHJ4tVSxS5s?=
 =?us-ascii?Q?PUPqvkXtHyvEzRUhDoaRq0pJTmVsmY0bd/oiFxNvT3svOILqm8DR8iWMHLcC?=
 =?us-ascii?Q?cLxd7Om91FuHdHTbpdYdWEh4nSzM/AhUYRjEe9khDyPw91WdIuhx78MZqpVG?=
 =?us-ascii?Q?OpLq3/7JI6gqXGlDWI6/gjD8zBS9DrZ0zxmH7Wxa+/+8yaxSWBSS+UBeIa4w?=
 =?us-ascii?Q?PhiIblYau0fIg3M7DFC96PklAqZWTPQKkF3eVbgp9stHhiNPdZcYPX22Lqrk?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 900a881b-e4e8-445c-d75f-08dd6adf3ba1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 14:21:56.9260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsxwK3vfwLuUbIgkeA34taaT3y799cwDk/q2svf1VBNMX0MSgY5IpjJnc1J5cvtIm3yIMdMHnTo+DFqTZE4T4KPKPrdHE5CQ/2L9s2AZ3AY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
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

On Fri, Mar 14, 2025 at 09:46:11AM -0500, Lucas De Marchi wrote:
>On Fri, Mar 14, 2025 at 10:55:05AM +0100, Francois Dugast wrote:
>>xe_sysfs_driver_do() will be removed. The XE_SYSFS_DRIVER_UNBIND can
>>already be removed because a proper alternative is already in place,
>>so use it.
>>
>>Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>---
>>lib/igt_sysfs.c                  | 4 ----
>>lib/igt_sysfs.h                  | 1 -
>>tests/intel/xe_fault_injection.c | 2 +-
>>3 files changed, 1 insertion(+), 6 deletions(-)
>>
>>diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>>index 2e4c2ee63..a76af54eb 100644
>>--- a/lib/igt_sysfs.c
>>+++ b/lib/igt_sysfs.c
>>@@ -1505,10 +1505,6 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
>>		igt_sysfs_set(sysfs, "bind", pci_slot);
>>		close(sysfs);
>>		break;
>>-	case XE_SYSFS_DRIVER_UNBIND:
>>-		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
>>-		close(sysfs);
>>-		break;
>>	case XE_SYSFS_DRIVER_REBIND:
>>		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
>>
>>diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
>>index 86345f3d1..5bc733168 100644
>>--- a/lib/igt_sysfs.h
>>+++ b/lib/igt_sysfs.h
>>@@ -186,7 +186,6 @@ int xe_sysfs_engine_open(int xe_device, int gt, int class);
>>enum xe_sysfs_driver_action {
>>	XE_SYSFS_DRIVER_BIND,
>>	XE_SYSFS_DRIVER_TRY_BIND,
>>-	XE_SYSFS_DRIVER_UNBIND,
>>	XE_SYSFS_DRIVER_REBIND,
>>};
>>
>>diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>>index 5409d19a6..6307e0277 100644
>>--- a/tests/intel/xe_fault_injection.c
>>+++ b/tests/intel/xe_fault_injection.c
>>@@ -394,7 +394,7 @@ igt_main
>>					exec_queue_create_fail(fd, hwe, s->name, s->flags);
>>
>>	igt_fixture {
>>-		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>>+		igt_kmod_unbind("xe", pci_slot);
>
>I think this was wrong before... for this test we don't want to unbind
>with the fd still open. So this should be:
>
>		drm_close_driver(fd);
>		igt_kmod_unbind("xe", pci_slot);

separate bug.

>
>But also, I'm not sure what happens with these 3 fixtures we
>have in this test. When are they executed?

igt_fixture() doesn't change the execution flow, so... it executes in
order.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi
