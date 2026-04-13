Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0C9F531CE
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 22:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B334A10E15E;
	Mon, 13 Apr 2026 22:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAg4yNsd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9C510E15E
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 22:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776118524; x=1807654524;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uoF1eEP/Ux0WYMo1p40iOr3l0k5edZyLEq9S57Cz6G4=;
 b=DAg4yNsdhfwVfVHWHYPbTEizdBmv5otArzVRJ/j0avJSOvUgTX9LkW0z
 /3cSj45oMS00NEKCkLxNqMmm4nBFcMtH2PxfLIRY5p/qaQnRtA/C1QmNl
 NcEGkUFGEd3F2JNX0ZrpdL32IpfKQv54qoKfztUz5tyMMLnV9gLtcSy4Q
 /TkL5Cd8niVMozj5xZwo1SuX8fqKxyagP5lPv0bTi702jdJ8pA/rdg3Ey
 9yAE1zjKj67KXJqmTtI160vHBObKXyLHacUM8smZfy5Y2eR5w0I9LKP6Q
 23H/HkyEf65BSgREf4C5EP1T6IdYCl51elnBM/7UkzZvtA/uExsalkJWD Q==;
X-CSE-ConnectionGUID: 2u6bOxa3RXuhGtkjGDRKyw==
X-CSE-MsgGUID: ymShh9AoQXKoon6aJNxQag==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76096575"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="76096575"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:15:24 -0700
X-CSE-ConnectionGUID: jy4j2k74Tx62uIpyZwsdhQ==
X-CSE-MsgGUID: EdY48+OnSsePZbQShKA8ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="227233913"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:15:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:15:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 15:15:22 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:15:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuDtyidxy/5eRmzgC4am4mHcg4nkfkByNdunq8QO5Zkz3OZA6SrQ2LigifPf0sgwd+tzfnbxhl1N8OYQXpVy+mogEap/FRBmUjoHNzjpgheqV7FyEnQ9ZFTtMsnt99xCkzpnI83SmDSluNnnabIcw2bppzny/7kHEBdlY/4gke4KDCeKJFiEk525x5fwrLYIUCOZGWVLLyErr68MUKyviF4V+xJKwodC1PyTWiQ7bhp9z9VAInTQHDgtI2sBINihX3955bfVwpjDrf6IJUyBAl9wBtSBjcPWxbOSFtBA+lN+eWthatJkS6MhjDNht77f9AM8UyKfX5r+XZMTyY9E6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSliqT+nP+N6w6ec1Am66WmRTTd5XjnP5mujntRC0Kc=;
 b=fr1vGMhB2oYWxGapulCeT88eladQeqnJLM1bD9lTbTNjM96AoRzovP350BU8UpOy8xJtlXJm1KB2ll4NT8QNH/KP74DHw7UDfE4163Yaf8PQX59LqvQcQaKuCVIr69I2cyMfwQEiLmZCRPd/B4z+JAhq1IDrFgqDdb6/tWeF6O0ogF+SP6MVYXWy1t2pZmJGE6RMBcO7j0oZ7xG1YJ5KWkZxuTwNROgpMAxhAE3Bvm/h9fz3/p3xKAUv9hoXMaCr/sXaKp288fxnhDxiPYrYPxbFRFBxG2Q2FjjG/GEJwHbbCOVEioME2Nf5xMczrPSRkU+Jlqal8kdC6nXmIe8yVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 22:15:19 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9818.014; Mon, 13 Apr 2026
 22:15:19 +0000
Message-ID: <809f75eb-280b-455b-b3b0-1d8fdbaa4fe5@intel.com>
Date: Mon, 13 Apr 2026 15:15:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tests/xe: Add transient display PRL skip
To: Brian Nguyen <brian3.nguyen@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260406184226.1294486-6-brian3.nguyen@intel.com>
 <20260406184226.1294486-9-brian3.nguyen@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260406184226.1294486-9-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SJ1PR11MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: 938033c2-5d39-4f5e-292a-08de99aa25d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|42112799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: G8zDgNhMFeIJmmHzq7myWdxcyvUm7nsZUN1vi8I96skH56cdnGwxxso4P4Zz/9W/DV5J2fNMxOMS/p+Z+gAmLkapccDSy6msk5m4l9EofdTbHClRorsjA7HCd0H2iwAx2H7YJI3npEVkc3Y4993WSzoGctSeeY5tWrLsAAgr2jMQ/Ku4xnzwtCbYNp6f8rf8ZEYuNtI9r+HAjTzPmJMxy9xpFUj6sOinwkQwwUTlkxMpaSUiwZqW/BZzqXWDJphvelfl4sOww3tMLYZdxphBaOaPEBnSX31xpClIvxuyCw/SKeCXhys4FwHIFeuCpXy+n+RDzBSphfU3CU+ao9BMN3JM+3MYSsM/Z46y7OCdfuwrsFmqR1v2bWGOiVq3pUU0gOTT03hYwQTerbdLk1KAThXQgIwDE0cqj9OPiZ9VZxQMMmsspE7OfX1D3nitJ27YKL5HV3xVGpAbHr1xh93Jw0yvTmRG7yFJCoAyl8G0j8CYOb0BKAVf+LYV64nWxuhyLuDmrBR1xLGBZhlwY3cvPop3bkcn0gCZddQny4UoIQWk2Cy3sHUqjIV6UYJt4aPlaTvqFtEi4OmixyHBCTZeZR4P2evRR+rSpHmx5GS8TuHo2Kbe/rLlPztWSRYmNZEkjsfS26aqEk40pgsx8jojEtmRZeVeNLZ0efzPbk/akedP68DkbA/zZCdgFhcalXSgosWGaF2qad+t+Eta2QMStJmhQrdONI90xRlmZWuKd+k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(42112799006)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDJxTjFML1dWVlNJWDBxU2x3cGhyMko5UW0wLzlNbTNwU01TZjlITk5lUVln?=
 =?utf-8?B?NHcrV2h1NllaYnR6WVZ5VnU2eXN5Yk9hdGU5Tzl4OEZIY3FrK29iM0EwMFRh?=
 =?utf-8?B?Ny9uM0hlZmFlUW1Td2dDRFBRQlg1ZTlMMFhIeXhWVzl3eVRLak13NjRFQ2ls?=
 =?utf-8?B?dWtISG5ZekIvc2xJN1ZITzhYKzhPcE5VQUozZGR2eWVaNlZYaExsT1RDN1dL?=
 =?utf-8?B?QkJ4Rm9DMnNpNzltNTduTWJvUjRsZnN5TTdIOEN6ZmJzT3l1cnlGVDhQb3dS?=
 =?utf-8?B?R25NT2N1MzJOcEJVMXFKRC9KQ2R3VGJUUHJnSnlXMDJQc2RHSWJ3U2l3OHlJ?=
 =?utf-8?B?a2RuSDJBamtZYzNmTUN0Zi9HTk5iOG82S1VOaWt1blN0SEp0T0M1d2pGODUr?=
 =?utf-8?B?WTRURWxLNUlDVHY1NUMxRnlZT2ZSaEY5dDJHcytKK0xiK0xPRy95SVBhUjBT?=
 =?utf-8?B?aXFpMVc3ZkFqR2ZMTzZyRzdiZUcwRElRRnE0c2EyR1NuNTYvYUhTVEJQaXMv?=
 =?utf-8?B?YjRkQmdMcGxvaUk5SFdlakJ0SEJVUWFjTStoa3VONVRNWWJiekJ3RGFENVNJ?=
 =?utf-8?B?dFhCYWM0NTBuTjVoSmJBNHVsYTB4UVRwb3IvSG92WnFRb09NYmhsUktBNUVj?=
 =?utf-8?B?SHZ6V2VLV091blJIRnhWY0JudEJ4MFZsTlJuam4vUUhXd1JCUFNRcnZkNlNZ?=
 =?utf-8?B?b3FmcnhLR3lOMlUyd09ENmFuekpSWVY3Qm11Z3hqRFRDbTVXSjZSVU13ckdC?=
 =?utf-8?B?M3BYUkNPUG14bUN5WCs5R3g3TEk5MU54RXZBbWs3eS9Ub1NSSklERlY2dzBQ?=
 =?utf-8?B?K1FqMEdYQmovcTF5TlJlTmZjZnF2ZTlvbE5UV2tIYWF1dkdTTjJtcDM1Q3BK?=
 =?utf-8?B?R2pleVBnVnQ3UEcyN1lhMzQvN1pFYTNIa1dyTGR1ZWs3OGQwdkFDajZrWjU0?=
 =?utf-8?B?dDF0eFBRUUJncEl5bHRiUVp5aVBpT08wY1VuZWpyL01ySHVjR2gzUjJZckt2?=
 =?utf-8?B?b0QrRXRhV1pBd3o2UGtuYTV4THlxTGgza2luTUsyOVh1dHZ2am9TMXRhUTAz?=
 =?utf-8?B?WWZvL0hEdzVwcjFkd3ZjZHRlK3c2bUd6WlpyeDFxWk8zdzFGYnlwcHFUeHN5?=
 =?utf-8?B?M3l4UDR0NEFZUUJudVppZm13NUxFUVhGZS9uaWRCRWZGYWtaR2M1Q2p1THZw?=
 =?utf-8?B?VmFXaG5Tek9lMkN1NmhjTEZDc29XcjE1d0pZeGJvTm5yYk92eXNGUVBncEZ6?=
 =?utf-8?B?ejBzM2hRTkNoUEtUOGE0WEpKTnk0M3JCZmVFSGRMQkhUMDZqeGlEV1VFUjRk?=
 =?utf-8?B?T3NRaUIrbmwrUDlIZ2J2Yk5UM1lXTVcwdThlZmpDU1RDZ01PNWxIeGxlM1hN?=
 =?utf-8?B?ZU1KS2JBcXBpb1I5ZzVwbnNMMnpKNjA1cEZtMWYvRHBtUW01Nkgzb2xKbk9U?=
 =?utf-8?B?M2IzditWRUhrYitrSG1jVFpVVTZSWGZ5NzJxdFFHdC9nUEZwRjh1TTlsdFlD?=
 =?utf-8?B?ektTUlFlRG1idUE4NFlsM3dBUm5jZWgycFpMNXhGMTkzYkNQYTczaWRDYnBl?=
 =?utf-8?B?UVVmVUIvTGxMVnU5QUdhNjFnYXFSTGlWV0hMcXFxa2FEb1J3cDU2OTB0OFl4?=
 =?utf-8?B?eFk5eUZnSzdwYzJNb1RNVTJPYUtXTWJ0NVc0Y2VXMWRSWVh1TFdkb2c1ckJu?=
 =?utf-8?B?VTMyVUZnZng2OGxITnRkVU1BSVBzbUw4Z0NCWXNzMHBPdUNPOXljOEFXblg4?=
 =?utf-8?B?S003VmVjRVk5d1F0T2tRUG9WeEIybEQzSFpvWGxGa2RWZ3FqZGs0Z05jMGpK?=
 =?utf-8?B?R2N6YVU3YzZIL2NYNWxaUHhSWU1YaVcwSlV3dUZiZXk1Yk9KV1JBakQ3ejNP?=
 =?utf-8?B?UngrT2o2dStBQzFhdHFlK2F5QWNyMXFWVVhEeEFlcm1oZTFhby9iL2NNc1Bh?=
 =?utf-8?B?dXVNYTF1UGtUODEzblgvQ0VUVTJRTmdFZmhjdWlwczY0UFQreEoyVW9CWHdj?=
 =?utf-8?B?bEhsd0ZYM3o3YWFFcWV0TFF3dnY0blZzMWhIS3ZzR1BPZW5NWHBUREQzeHBH?=
 =?utf-8?B?WS9sMXpBektvSDJkenUyNGxoVmw2RjVIWTBiejJseE5QNEtlZXBkR0tJTTky?=
 =?utf-8?B?WG0xZ3ZEaWhqd1czV0MyYmpXSTgzK1VDaExTTHdqV1hGd1FseGRrMmFzMTJP?=
 =?utf-8?B?WUlvWm9URTMzUnFWdVNQcjJyOGEzcEVjWWhPbFdDVktmZDhJVXFPWStnSkFq?=
 =?utf-8?B?aUlhWmpnV0pJdi9OenMrV2NoOVdrczk2Zlo5OWcreVYraC9TOUhJRmtrMEl1?=
 =?utf-8?B?WWhxWW1udXdRbWRYNVpvR1BkTk9MeERWT2h6VE92UjB3eU5pS2cvdz09?=
X-Exchange-RoutingPolicyChecked: K7LoeKBhlruoAWRlM0AlUQh4sw7DT0b6tHwEhjGAM/+rLJl1h4+yf3E6rX4GQGyxjAIQX9DRYxphnIOyIVI5S0pk/FyJLD+GVVrb3MaVRoyIPKjWWBFBF05aDzl8Fkfpu5CBSEATrCNMnImyauBut7gJRtjkXgw08VxCh5bDBxj+VOO4k/mtnEkfKlfJpjA6aZahxfLteQe4gtbXCwl5NR0nxiskzADojkBJtMD5Abd85Kftx7JndBgsrgBs0PgC4wbLXgBnKNp+rIMY1nRHfZkwZiYA7qiIxYTDXI6VlKwFrHZ3ZA+oFTFp6dQise/onBoCVIGvS+YkDRr5loTZjA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 938033c2-5d39-4f5e-292a-08de99aa25d9
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 22:15:19.3547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkQwsj1cX3DHhb7QCRetQA4muj4QMdU2hIFC01x1TFne9IqkIv6MlCAWBfYypEEZqmOnavgvgKA788ECqZYoRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6201
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


On 4/6/2026 11:42, Brian Nguyen wrote:
> Page reclamation may be suppressed for various reasons. In this case,
> transient display vma ranges will not use page reclamation, so ensure
> that behavior in this subtest.
>
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Suggested-by: Xin Wang <x.wang@intel.com>
> ---
>   tests/intel/xe_page_reclaim.c | 87 +++++++++++++++++++++++++++++++++++
>   1 file changed, 87 insertions(+)
>
> diff --git a/tests/intel/xe_page_reclaim.c b/tests/intel/xe_page_reclaim.c
> index 7741063d2..6cc29d8d3 100644
> --- a/tests/intel/xe_page_reclaim.c
> +++ b/tests/intel/xe_page_reclaim.c
> @@ -4,7 +4,10 @@
>    */
>   
>   #include <fcntl.h>
> +#include <linux_scaffold.h>
>   
> +#include "igt_syncobj.h"
> +#include "intel_pat.h"
>   #include "ioctl_wrappers.h"
>   #include "xe/xe_gt.h"
>   #include "xe/xe_ioctl.h"
> @@ -44,6 +47,33 @@ static struct xe_prl_stats get_prl_stats(int fd, int gt)
>   	return stats;
>   }
>   
> +#define XE2_L3_POLICY		GENMASK(5, 4)
> +#define L3_CACHE_POLICY_XD	1
> +
> +static int get_xd_pat_idx(int fd)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(fd);
> +	struct intel_pat_cache pat_config = {};
> +	int32_t parsed;
> +	int i;
> +
> +	if (intel_graphics_ver(dev_id) < IP_VER(20, 0))
> +		return -1;
> +
> +	parsed = xe_get_pat_sw_config(fd, &pat_config, 0);
> +	if (parsed <= 0)
> +		return -1;
> +
> +	for (i = 0; i < parsed; i++) {
> +		if (pat_config.entries[i].rsvd)
> +			continue;
> +		if (FIELD_GET(XE2_L3_POLICY, pat_config.entries[i].pat) == L3_CACHE_POLICY_XD)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
>   static void log_prl_stat_diff(struct xe_prl_stats *stats_before, struct xe_prl_stats *stats_after)
>   {
>   	igt_debug("PRL stats diff: 4K: %d->%d, 64K: %d->%d, 2M: %d -> %d, issued: %d->%d, aborted: %d->%d\n",
> @@ -535,7 +565,61 @@ static void test_binds_1g_partial(int fd)
>   	stats_before = get_prl_stats(fd, 0);
>   	vma_range_list_with_unbind_and_offsets(fd, sizes, count, (1ull << 30), SZ_1G + SZ_2M, offsets);
>   	stats_after = get_prl_stats(fd, 0);
> +	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
> +}
>   
> +/**
> + * SUBTEST: pat-index-xd
> + * Description: Create a VM binding with a BO that has PAT INDEX with XD
> + *      (transient display) property to test page reclamation
> + *      with transient cache entries on XE2+ platforms.
> + */
> +static void test_pat_index_xd(int fd)
> +{
> +	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
> +	uint32_t vm, bo;
> +	uint64_t size = SZ_4K;
> +	uint64_t addr = 1ull << 30;
> +	int pat_idx_xd, err;
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +	};
> +
> +	pat_idx_xd = get_xd_pat_idx(fd);
> +	igt_require_f(pat_idx_xd >= 0, "XD PAT index not available on this platform\n");
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo = xe_bo_create_caching(fd, 0, size, system_memory(fd), 0,
> +				  DRM_XE_GEM_CPU_CACHING_WC);
> +
> +	/* Bind with XD PAT index - synchronous operation */
> +	sync.handle = syncobj_create(fd, 0);
> +	err = __xe_vm_bind(fd, vm, 0, bo, 0, addr,
> +			   size, DRM_XE_VM_BIND_OP_MAP, 0, &sync, 1, 0,
> +			   pat_idx_xd, 0);
> +	igt_assert_eq(err, 0);
> +	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_destroy(fd, sync.handle);
> +
> +	/*
> +	 * Page reclamation should skip over the XD pat vma pages.
> +	 * PRL is still issued because pages are still valid, just handled
> +	 * elsewhere so no invalidation required to ensure not squashing valid
> +	 * PRL entries from other VMAs.
> +	 */
> +	expected_stats.prl_4k_entry_count = 0;
> +	expected_stats.prl_64k_entry_count = 0;
> +	expected_stats.prl_2m_entry_count = 0;
> +	expected_stats.prl_issued_count = 1;
> +	expected_stats.prl_aborted_count = 0;
> +
> +	stats_before = get_prl_stats(fd, 0);
> +	xe_vm_unbind_sync(fd, vm, 0, addr, size);
> +	stats_after = get_prl_stats(fd, 0);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
>   	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
>   }
>   
> @@ -587,6 +671,9 @@ int igt_main()
>   	igt_subtest("binds-1g-partial")
>   		test_binds_1g_partial(fd);
>   
> +	igt_subtest("pat-index-xd")
> +		test_pat_index_xd(fd);
> +
Reviewed-by: Xin Wang <x.wang@intel.com>
>   	igt_fixture()
>   		drm_close_driver(fd);
>   }
