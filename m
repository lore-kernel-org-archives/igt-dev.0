Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD41ECD1296
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 21:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5CF10EA81;
	Fri,  5 Apr 2024 21:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCIOxEph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D236810EA7A
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 21:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712354223; x=1743890223;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qSKVHlXcLsoy/JUGVMm+rRiv5lcLSOabDgPcQEJFOKI=;
 b=aCIOxEphFMEeTUejlVWAg497XhA5OHxwfIgQYCJkG1qNWb7hamUUoZbN
 yNWfZIy5BaHxJiYePKLIkM/V2nWDh2HNVA9fGM16X9rnDxvkVUqM7BI1D
 n6LO+oLU8cl8ASYrcoJjUT5QnNQ3ipIh2hdMrz7mpKsUXeaDyImBiFT8U
 KY3jNFJqTeIOpxX12d0ukTLQcX7rlhM5q4YRq1j4T6niPngMEqreiHrtt
 dqvJ8wGb2IsVSo7xlshCEVhBtns5sD+9bfxhq8d5d4SpXk9TSzbChUJKO
 Qs8iprY8PEFE1F4UohhhN3n4m6LhxgbWfH9fOKM6wQDwuahTGvWlIWcBB g==;
X-CSE-ConnectionGUID: U7mdyMHtQWClVR5WjjQErg==
X-CSE-MsgGUID: 6mHs94l/SLiPAf8T3p980Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7604822"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7604822"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 14:57:02 -0700
X-CSE-ConnectionGUID: HZhn4ShSR3OoVFvRnC8IpA==
X-CSE-MsgGUID: syqPKB3JQfqcV3AXXtmcFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="56773319"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 14:57:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 14:57:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 14:56:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 14:56:59 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 14:56:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dl9YJsJQKyG/cUOaChGdBLmx19PK0AgF+hdCUVx1bUv9A1l6Et2LDZDkZz8/EJj9Cun5J8/ElSEKu/vNly4TB7+5EfgpVY0quVqOupbu0od1ztKECSwFjnuB4iO/FuFkj8AMwxf0U+TT6Q1cYK0khBKIamKkDczvaBz/pXgrwuhX6CvasHzsGbmMQTSnnvsv+fx+hYDTX0olAaevxGTSMUZAJugnhNoQ5fqFcPKSavlPlo0Mtz6PoYkDwnu3GFrijqRMci9cF7P9htpVnZdIcEPUDeIeJz7KUIZvh8+banIm+6X/rSk32dcsETf66FWCBdiKBHFF6M7xaU1wjxn1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ReedqKoy2oLCBS4PTmClPa/6aAQo+i1Jtq65L9GLWo=;
 b=euWBmH16UbB5Wa8crLB27YjLLr82ammPuJK0t7ZJZ/oFvfK/3YNYjsGaUF0dDcetveP6vdok4bsjowso0PjtLfdHE9wg8J1y3BvqlEeMZPwv7JWnl5zXsjQ2GF7+GUBSET04X/dkD5s8PV9g0J4Ds1sjxTD6hkSbjXct5Ib82FqmkObdvqK4kU3o35BvsNt2VzbHLt9myGefz5j/gOHVXoZTERvl4iAR3+mhmSqEPy+t31PmIJ7m+L+R3g6t9QIMO3vJWeNslhMn3q+cU9qQOIhqcA3WCl5FI0EnCgopHY1Yvp02lvGWYBkXAP4uJp92jbm2fZH03aQRkeZ3OmUciA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4583.namprd11.prod.outlook.com (2603:10b6:208:26a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 21:56:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 21:56:57 +0000
Date: Fri, 5 Apr 2024 21:56:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_vm: Fix Sync Issue between Unbind
 and Hammer Thread
Message-ID: <ZhBzlaOywBje1xeU@DUT025-TGLU.fm.intel.com>
References: <f845a357442bd285ffb26cd0288a97819cd9d470.1712350676.git.jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f845a357442bd285ffb26cd0288a97819cd9d470.1712350676.git.jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4583:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0eHJfWL7mnvVopdVqpk+eE2NGMM14T10Cz/pHUI/X1XlGM4foliO675L1QzJGam/22OFbbEQziwByLKW8XIh/sc14RGaPoAUkvaUIMjiVnW1jlY16ji+Yi0mrZ0GzzWKWdfZQNgld4CDRorOiXgmortgHnB1jNgFAIGEhcJo+U12hKSP/l051/+5ucN+iPlCRUJwfJkXF9Y7gl70fpkwKCp4l5kiQj4CP0COtKYqi/LtZm9jE03cpwwpcPoCgyueBqn3Anb8vQnROpksn8Pjr56XOsQytbdqNJKSLkj5lrvcoB62kkG5Ckv/RM+YPht1FBIyHj1Zfzal5U21d/tLHpjhRPf4TnluUJMs8SXnopySOVMEr7h0MeayKSIutzVSpIk0u7w90yJ3Z/+yyKdPD5C2Z3GMwPE9j60/2QeILSWybzqRG6fgqagahO8Yxx6uK/qKlcYw0N5dkHeGt85O78LqTiZwmaAt52n6dN9I+CW4yA4BxyzvYHmejWCwo73lCTew1NpwcI93XrII8INWfo5GbqoodlvXQomzz5hHGPeI6JJa2GKVVxqXV0dyuuEgmXYzoV/RXUrsLlhkkQlySgYzXBdc/J2qN4FdxsCKjc9yON89vCECuSznmQm5ENSyUfe/g1tPO/1fxTaoqY9BLCjqIKQNBn6DBtLsS61J8+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hcYeDNaaIYDRJIcvJT1a+GLTNpdte8Ap3r7uQcItytMXSmJwxwjkTWKufLuO?=
 =?us-ascii?Q?1TcU2kGGsJLaR/JTyQk1sQRWZ/buCBci96ssXcraYg/pozVacylVmFvgQpgm?=
 =?us-ascii?Q?sciGOQH5iyj1rojRhtCjzS/gaF+5a1Huocs1fA9NPo7IVFuH0GibPVt8zAUH?=
 =?us-ascii?Q?KGcLqrrXJVwCljJ7oAq1w0x8cdixrmAuwxkLP6CnFEbJmGxJH+o+VmKHCbD7?=
 =?us-ascii?Q?9QwTv5qg0IM7tDsgt5pObSf9Yfz+3G5ftbxR1iXGABwYZWerh/yE92l8lJoQ?=
 =?us-ascii?Q?pu1kT3OBkPIxkg9a/+kBFhxkB24CGJHjsNx1ahv8YbK0jbEokcQEjbefcvCs?=
 =?us-ascii?Q?FnqXX4om0UE2MwPqfltbMwhZ1cnNJKZ61KoouhfH47ohhV7yYqWyQOdFAs6e?=
 =?us-ascii?Q?NKoT0MAQAV3ZvfUry2AYP1wGSyolkfJucWB2NxKcqZtmYnIWXbBOlwZCNuQT?=
 =?us-ascii?Q?mpxufcP5kT6YqvLCF2TKy/WAmaIJaF/dyOCauP924LIAyu9Y8nONs971yz/O?=
 =?us-ascii?Q?+5F6ktp6I45Efm934NUxOw62a6tkTaf9jd/tsx/bGxJ7853FH5aeDICexSc1?=
 =?us-ascii?Q?NEwy8mpBVWpzxbphimM75tcWpkBzaGNmM/AR2W2ohwAXCJc+7I7vLQG4YVUG?=
 =?us-ascii?Q?LQxKfEvXue6aGAcphFxY4vaMbG1cvHpxg66CesoYNIpkCSDJFGtWAm1lwLVQ?=
 =?us-ascii?Q?DORmaIwUsLk1Izj37/7uBiCz5TO3hnl1UZULL9CerSuKPrNyXonVKr0ulEli?=
 =?us-ascii?Q?ge0MQTQGPBxwEFPh+ArrAB9lxy6mg7dlRozn/6UlLpLGMnLTgZ1DAhZEw3aQ?=
 =?us-ascii?Q?PzybmwjosUJVgGfK1xD/jBfSkhjr/frzzTiNX911SZpw2B8UVTVG+cLclZIu?=
 =?us-ascii?Q?tj0MPsEGXRmFnSwaR7DFhUHc0uQrqvT/dS1vHAUH1BLLhh9ecZAAX/PCUFPM?=
 =?us-ascii?Q?yV+hAIzveThUesBYk1zY5NIcR1hSi7ABXFeB3CrCxLX4EFm4aW1NfCH9cHYL?=
 =?us-ascii?Q?VtxV/cKys54YV1M9zbbGX0ZtCC9UzLpnGFJf/0DiMCelTAT004xh9F84p8Az?=
 =?us-ascii?Q?IyB9g66jowHw6YAeSicxm1aPzG+444QNL6LKdbY9UAxrQ+QsUBS7unGudxLM?=
 =?us-ascii?Q?QhztqJ6zPI4U3aA+7JFkuYcqpzCJudR8xnZFyfFvb50DGOXgi+yFTBpwt9L+?=
 =?us-ascii?Q?RCwZiI6mL08wyGctjsbjW1K+sxXgsViH0xWfUmMTDhjYsKlqD3cRLTWopeb3?=
 =?us-ascii?Q?eWD5QvCHkcDP72oaVPEw1kNA+yoCxzshBqbsZggnJJIgeUo0MgUm3Gis/AcQ?=
 =?us-ascii?Q?pmAxN1Rl8yteevpZW+hhIfgpwIjjRCl6mhLLP8lp0uOWbJKlbiXlvFHplZ7J?=
 =?us-ascii?Q?IGUGBwenFXhMdyd0qeJsWediiFJzBYDWIAs02MFd0LLh/jjj4zxucdyjPMO0?=
 =?us-ascii?Q?XEFV3APkQmoLpBBW3wWyZMO5TSbO8oJy4ZrXHDJYnPA8V68JZ0ijCutlaaVM?=
 =?us-ascii?Q?cHXZqIH7OclnCIJf9ORR5n87AuHcKlTET3JRoHfQx+ar0SZUdqCHNjIyop8S?=
 =?us-ascii?Q?1zcdQjvH1IdhJ8WSaO4KiW8Okvfr0jijlNCo3TIUkMQuSuovAtfD1epM0C4r?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdd35c4-f49d-4e21-acd9-08dc55bb5004
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 21:56:57.0625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqWfV7B2GRElhJB771+88xlY+dy0qsLqmLcq0gbFQbWoBE98os3S7dPMlV3AwcBa4ZaCYpUrQMRt3amB7oubyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4583
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

On Fri, Apr 05, 2024 at 02:06:08PM -0700, Jagmeet Randhawa wrote:
> This patch addresses a critical synchronization issue
> between the "test_munmap_style_unbind" function and
> the "hammer_thread" function. Previously, "test_munmap_style_unbind"
> would proceed with it's execution after launching
> "hammer_thread". However, the "hammer_thread" in it's
> initial iteration encountered an error during the syncobj_wait()
> call halting its execution prematurely. So we never returned
> back to the "hammer_thread" from "test_munmap_style_unbind".
> 
> We resolved this error by adding a syncobj_signal() call in our
> "hammer_thread" function, allowing "hammer_thread" to send the
> signal to "test_munmap_style_unbind" therefore ensuring the
> seamless operation of both threads and correct synchronization.
>

This explaination does make sense, see below.
 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
> VLK-54352 and VLK-55620
> 
>  tests/intel/xe_vm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index ecb2a783c..a25878cd8 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1153,6 +1153,7 @@ static void *hammer_thread(void *tdata)
>  		} else {
>  			exec.num_syncs = 1;
>  			err = __xe_exec(t->fd, &exec);
> +			syncobj_signal(t->fd, &sync[0].handle, 1);

This doesn't look right.

This thread is doing execs as fast as possible waiting on every 32rd
exec. The main thread (test_munmap_style_unbind) is modifying the VMs
bindings in a way that creates scheduling dependencies between the
threads. The KMD is designed to enforce these scheduling dependencies
while both threads run fully async. If syncobj_wait hangs, there is
likely an KMD or hardware issues here.

This code signals the syncobj from every 32nd exec in software bypassing
the hardware / KMD signaling the sync. This breaks the design of the
tests and makes a likely KMD / hardware issue.

Do the VLK failures occur on every engine instance / class?

Matt

>  			igt_assert(syncobj_wait(t->fd, &sync[0].handle, 1,
>  						INT64_MAX, 0, NULL));
>  			syncobj_reset(t->fd, &sync[0].handle, 1);
> -- 
> 2.25.1
> 
