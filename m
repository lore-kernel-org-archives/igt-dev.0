Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6810C5321E
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 17:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DBB10E26D;
	Mon, 26 Aug 2024 17:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGx6v7Y1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD7C10E26D
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 17:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724691842; x=1756227842;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z3VoNJYE7dYF6qj0+Rs8t/yba6f9m2I4ZJrVevMZBis=;
 b=bGx6v7Y1p2jId4eacWFTuc/hBRcVDzq8QQcSuIjdm2PqaFf4VtmygLZ3
 Y4fSGLL0HgObINapR5ItG0UfFDjqfcedIARah62XSAEkpkURdC0HWu51o
 UHc1eg6TVB0CriXYsYggJcA5hG1iunjMoxwbm7n0P9HDaRg0VbTgV5OwQ
 czGqJg6vsgruUVQ4YyMxNzswrQqp3dhvxass2o9WGis8SwXhE0GR6gBB0
 oS0klQmZ72h1WO+RLNfVd+tfHJhKXIgqrTCmnWYtZzTI2HNW1RJfkQVE0
 5qg+2dWy2QzL0BpA+Ot9N6RzvdS6knBVRDDAVAEzsj+aUmHHJZZgxfiZb g==;
X-CSE-ConnectionGUID: 8ermlBaIQQGhqx9aAkLrig==
X-CSE-MsgGUID: igaAWWfYQh23boCQlC1avQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26027203"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="26027203"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 10:04:01 -0700
X-CSE-ConnectionGUID: Pm5oUf0QSNiqV5Ecr+ERdg==
X-CSE-MsgGUID: GeqNav+LSyu51Uw65kGRXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="93372463"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 10:04:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 10:04:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 10:04:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 10:04:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 10:04:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bopCQjvulXv4Wjy+IWKF9/rfVoGsopDwWcZVfJkDTJFd6m1svdRqNey90l2d8onZGuDjqsFqYbZhOyzWEF09jmAwft3WlW1h91xP1EM0wIWc3Stpcgj80abf1naKHpeow9NaKq7HUhS+rS5L0FdLJj+WTx0J0HqQOvDrAx6G4141bG6p45bow0SX0GZa6o1gvBVYCLFhKscRLDS+AFkQxyiZKmbJ/dDPjKNLgiUkUNrONKWaRBlJdVr8utGsMRfK/+7Bz938jbA/EybtfXujVDNDdBgquznUd9UzrTeO1eAm+Cj729uJza/RLlpx46jcx0q4q5pY5SiVx8lE73xfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJtmrdX/8SHGUfCgeU+VEKZX3uBTHLkaJ7Jqy+tluew=;
 b=QpLW5XcfLZredh4/K1pgNbu+VB15Fy8UzhErPZSTMi8z8TMvJBCU1VIsnsj83Aqp7UZesE8mkX/ttMByl4jGUa3b1TDvP8HqbDnjOqzWCRHOBRfJhB7bpghpMuTOKPgNxgtQ3PD9eoMah7z4ji80slMQ1PQUigC8e1+nV168zTuVQDtLM9LS7dB8HIArpyElpgRs3VwQdUc5BrgAlqoFNdOaeysI4weaCirDUrxDVBvC8lugZ6GOCFOEQaq8lyBMkp5gLZLgGR0BVUO7Ux814CFsaD3hWtoW5P7yemI/zdr5Z/c74vJVQJQnLwur3tsCgHn0eF2rhywd3rZwTxZlUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 17:03:58 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Mon, 26 Aug 2024
 17:03:58 +0000
Date: Mon, 26 Aug 2024 13:03:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v5 1/4] runner/resultgen: Added dynamically ignored
 dmesg messages
Message-ID: <Zsy1ej7ud8czoPm4@intel.com>
References: <20240819103242.26527-1-kamil.konieczny@linux.intel.com>
 <20240819103242.26527-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240819103242.26527-2-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: MW4P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::26) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7cdb57-5d5b-44e3-b911-08dcc5f1128e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0daWyzu/CD1E8XXBvcd7NFLTYikbC0dobXIhhBWmW5KsiEYCrnRUcVX54mQW?=
 =?us-ascii?Q?EST94IBeYH8IAt86vNPBXuOXwaWCUKs3eaa1L+X1uiHwrEJm+U4ChrmyIdow?=
 =?us-ascii?Q?Ji95SaxfjUE7+/gGd0ErSNC6tuZwc0C3wSoW2fR3Lhj4rDdjAMy/krylx6OK?=
 =?us-ascii?Q?8hCQg+Mt3jou6MxZmwVQjPsPf7ErxCMgkHymfWP0PY7uUOw39I7qA8uEhgkx?=
 =?us-ascii?Q?jCJfWJN7U9c8bVPdDsfdkNJjJUvcfyIiUObMiEvFchlN9RoYak/JxKzQzBvA?=
 =?us-ascii?Q?RdYu8892M7UP26/nIApEB6Ezyx5s/3a0V5vGzSQpxjEQsFVUslLCoQoNr49b?=
 =?us-ascii?Q?yqrtEFclepd5Brr5raMSGw8jhRnYYFDEJtz/UM1MkDwGlGmbrnnfU3uXtyCA?=
 =?us-ascii?Q?Kj5z593CaRB4qzzVKSNPlXeiVSOOr0GhMYrLs2gJ5l1lzE0POqqKLPBiFMOZ?=
 =?us-ascii?Q?s+BZWKtwF9Z4V0yi0BUw4ECWvdex1aMWoJ2eErZXxKGJnxm/bmXZdM/Db2VQ?=
 =?us-ascii?Q?WZRbDfUOC3E79InuJ5+T3X/qo8INjV9W3cVefmgYz83+BMwC9u3wvvaiWQO0?=
 =?us-ascii?Q?538qPOGUB+Gc0TIbfGv3dk3fKtyl1cbl2QoOZVeCO8GFYrM0KT5MT8s9NqkV?=
 =?us-ascii?Q?jlolnX4mfmrZk406It2SgM8fhOKSKVoKCGG3Lh9xdQwwJzgw2RpLI8w3fSaR?=
 =?us-ascii?Q?SApfaeEpIXQlO9VUYeaJyri5vcvFaPcjpVx9s0DhvJlbRBqbW4o0zCBf5uRQ?=
 =?us-ascii?Q?ExTyX9+NXlqRuhyodtImSAFybo2MuACxY9UuJIFe5Z+r4RSBloxzgaQrbeO7?=
 =?us-ascii?Q?gDnQzGaEHyRbyFnoQ6Iqxz185+9FXLEiVCfb7/lwWS+UiMbv9y7gevXAsJ+A?=
 =?us-ascii?Q?qIxqixzshC7xsIYLIIj/Ua0rdxP0cAxrl/a+8F25fg8KsoUkT89O8lhPWJQy?=
 =?us-ascii?Q?PoLqsseS2DB1sRFBFTVFI7Qhk1JIrVI21qMHyReVvZVwy+cBYzu2xeaercC2?=
 =?us-ascii?Q?Q2lYWdT8FmlYA1jXPPVrIlg3KaxNigH0IIsh/OmZ2SkLX/drcysRNDa3oVKC?=
 =?us-ascii?Q?96vgJERYLYdG5livt+p6c5GDb+jureyRSFgDBNor75VPAz9COiBWIMDXRXFs?=
 =?us-ascii?Q?JwINE88tbgB5Y6dE+xruQv4FqYBAk5T9qqkm1AzndxBSzRnnqbwms2byV0bH?=
 =?us-ascii?Q?ygaRUA0fTK55dGb44iRPfZvjA8HZm6rEAifPTw6o8Y6ZKcnLC4/RJJJ739Z2?=
 =?us-ascii?Q?h585BY4p8NMirPSbwNAuYZRy93pg9iDgI0BY3nFfSOBteqGZNuScvVdDz+O8?=
 =?us-ascii?Q?KP69BaxTF1RYnlMqNeIwBVbXajmPJlGeZZE/yYefqVTc8g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?txsxxtgXMPSABJYk7kmIfLksVKIzQ0QhHeb2FRKmtMD9jysu/nXqQABJYDZE?=
 =?us-ascii?Q?ePQbuK8HQvpFHfpr+spgVBQaDHD00e08YqEJsbOzoUD5PDvWptio2zsMxHA4?=
 =?us-ascii?Q?a7bHluZNxyHM0ZE4WOkhs85aM2r5+PWdSYppQC4onXvH67f/JcgtibJ06I8v?=
 =?us-ascii?Q?kyxILYcaXD/AvIsmTy6ljmtkjv7SVyg2fzv6H4jbre3cRcNFTq3OJkbqAFBB?=
 =?us-ascii?Q?YmVzAge9tQUmxHnAaqXuOW8le8bPUBmoC0M65efMU8GztpBxiBYfkNWgIGBS?=
 =?us-ascii?Q?Qc7VHItbiiCOMyXMq5qRgnucp/kfCaqDnOAjdfMCfdyHehpQG7pghUko9ayt?=
 =?us-ascii?Q?JOuhcGVE1GwgKAG+YgXr1Ym8uKG+oNaT7Sb887cSoGparVqbc4AHghkk7//4?=
 =?us-ascii?Q?9vu0IxELLaRWtfK7FoA9fNi+DZdzRJ5eV1pAFt8Ji7Iec3pbhReCzaA7Yq2Y?=
 =?us-ascii?Q?mpwOvnX8WA1UMBo00Hpb0eUwkavZsEdcsa+x2JuoEpj2OoVJVPZiFkjYNITD?=
 =?us-ascii?Q?zL98FE6WWOBwuJ2Dd5yMXSMT0OoL6q21iTHU/3Pe+erw1GG6AFqH6Ffmf7k7?=
 =?us-ascii?Q?EMJFp0pac0p5a7bmSmfLSgB6okzwfnxq8XNAaRoL2U98j2bM+/STydCY7Qt4?=
 =?us-ascii?Q?uWw3syTVJwqpOQpPXKpaaFsnI7x1fDzUBCqPpsnMt1kWPrnLnZySCxACgcEQ?=
 =?us-ascii?Q?WcMgab85Ez4jJusPgtCKUm3SQ5j+rAX/Cb9DBRPzUVMnYjLaa+hRqsiIiC59?=
 =?us-ascii?Q?TuVQcbqIEkpCinLUwuSg93wDO1MQFdlYbpGoJ3zhceASWyosxuoqX34vkoUb?=
 =?us-ascii?Q?oyhT5gP7PsBSnLlSvJ05/b/HAwcjFlIv/C3A//QvhHxXOMrtcmRN7KjDIfqO?=
 =?us-ascii?Q?o0sEwPoiziMzXKRDC+Xikbony4QmivVbnRTMceoOooSLHV31FBqmBQ9WH4fM?=
 =?us-ascii?Q?VMexedMKTIVpco4ucQzdfRMuVpDz9lZH0QSnYv4rgAtDL25miTkYaCGMXVlR?=
 =?us-ascii?Q?SKe9VobpIjsI97gmbSslPnNBAK2POADeinsWrJse3t6DpEQmIf+DXY3TOATo?=
 =?us-ascii?Q?Auf8Ji2tcjHSVcfQl4F+eEPQ0TBsT7/AQzAsJXI/VEPr/5ygsRIab/nO7Kv7?=
 =?us-ascii?Q?c7zIvXYIeAh3EoOKxw1ffQl+7pZ9s0fsCxqF9y5GMFt7bhquka2r+OXgX6TV?=
 =?us-ascii?Q?zDVokgHcG00L0ltCpeuKQYGK53Zc33IN0O2h7CsW18KrS8qBg47s5ZhVcwxY?=
 =?us-ascii?Q?vHOBBacxw8fChetGnIbNWWPfE6n+tr7lf/9twSsYwwHG1z85wLExG/X+KSfQ?=
 =?us-ascii?Q?+9mlabrK8LzkxJwDJkuiTTrJ7MAhzbYDacCRh9kgfNbW68BVopaayQ75PRC4?=
 =?us-ascii?Q?oGksPQ7czKtJijCMt3b/64wz70jWKaqpF+LMEx1UztofG9hg1YFsPqTHtBJx?=
 =?us-ascii?Q?+8v1IhlPmDPkonySB295Hi5qOKsC/jGt2YJvv6uUaQHsg6RJAoNS/V/WWdMd?=
 =?us-ascii?Q?3q8uAkpcpwrnsWywsbF2Eu+Pi9luJMCls9H6sqnmKt44OOkpPM+PVIBMKKE8?=
 =?us-ascii?Q?q7X+U+PEMRQPSMCBDFbPdkX0o7GROC4vnyqffQRRq7Z2h+dRxP5MwtAXePz0?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7cdb57-5d5b-44e3-b911-08dcc5f1128e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 17:03:58.4542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/NEiUuoaA8NhsrrSgpbBuFvJ8ibnQam5ej8rYi6Ho+hU+8wYhUN1J+xAjjRmUoKRjpEeFtiCNl4PXQPsoGibQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7009
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

On Mon, Aug 19, 2024 at 12:32:39PM +0200, Kamil Konieczny wrote:
> Some messages generated by driver are triggered by test itself
> and are not meant to rise error nor warn within runner, yet
> they should be catched in other circumstances so they are not
> suitable to be ignored permanently.
> 
> Instead of hard-coding such situations check dmesg for info from
> a test and add such regex on a fly and then ignore next dmesg
> errors or warns which match it.
> 
> Ignored regex will be removed after end of current subtest, just
> before a new subtest or dynamic subtest starts.
> 
> v2: removed local copy for regex string (Zbigniew), clarify
>  description, free regex before creating new (Kamil)
> v3: print error when compiling regex fails (Zbigniew)
> v4: restore cutting regex string at \n, it was lost in v2
>  (Kamil)
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  runner/output_strings.h |  8 +++++
>  runner/resultgen.c      | 68 ++++++++++++++++++++++++++++++++++++-----
>  2 files changed, 68 insertions(+), 8 deletions(-)
> 
> diff --git a/runner/output_strings.h b/runner/output_strings.h
> index 892895ead..91ef5f2c3 100644
> --- a/runner/output_strings.h
> +++ b/runner/output_strings.h
> @@ -54,6 +54,14 @@ static const char STARTING_SUBTEST_DMESG[] = ": starting subtest ";
>   */
>  static const char STARTING_DYNAMIC_SUBTEST_DMESG[] = ": starting dynamic subtest ";
>  
> +/*
> + * Output in dmesg when a test wants runner to dynamically ignore error or warn.
> + *
> + * Example:
> + * [IGT] add ignored dmesg regex: CRITICAL: Xe has declared device [0-9:.]* as wedged
> + */
> +static const char IGT_ADD_IGNORED_REGEX_DMESG[] = "add ignored dmesg regex: ";
> +
>  /*
>   * Output when a test process is executed.
>   *
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 63f5b26d7..87847bf5b 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -829,23 +829,65 @@ static const char igt_dmesg_whitelist[] =
>  static const char igt_piglit_style_dmesg_blacklist[] =
>  	"(\\[drm:|drm_|intel_|i915_|\\[drm\\])";
>  
> -static bool init_regex_whitelist(struct settings* settings, GRegex **re)
> +static bool init_dmesg_regex(GRegex **re, const char *regex, const char *msg)
>  {
>  	GError *err = NULL;
> -	const char *regex = settings->piglit_style_dmesg ?
> -		igt_piglit_style_dmesg_blacklist :
> -		igt_dmesg_whitelist;
>  
>  	*re = g_regex_new(regex, G_REGEX_OPTIMIZE, 0, &err);
>  	if (err) {
> -		fprintf(stderr, "Cannot compile dmesg regexp\n");
> +		fprintf(stderr, "Cannot compile %s : %s\n",
> +			msg, err->message);
>  		g_error_free(err);
> +
>  		return false;
>  	}
>  
>  	return true;
>  }
>  
> +static bool init_regex_whitelist(struct settings *settings, GRegex **re)
> +{
> +	const char *regex = settings->piglit_style_dmesg ?
> +		igt_piglit_style_dmesg_blacklist :
> +		igt_dmesg_whitelist;
> +	const char *what = settings->piglit_style_dmesg ?
> +		"piglit style dmesg blocklist" :
> +		"igt dmesg whitelist";
> +
> +	return init_dmesg_regex(re, regex, what);
> +}
> +
> +static bool not_ignored(GRegex *re, const char *msg)
> +{
> +	if (!re)
> +		return true;
> +
> +	return !g_regex_match(re, msg, 0, NULL);
> +}
> +
> +static void clean_regex(GRegex **re)
> +{
> +	if (*re)
> +		g_regex_unref(*re);
> +
> +	*re = NULL;
> +}
> +
> +static void add_ignored_regex(GRegex **re, char *src)
> +{
> +	char *s;
> +
> +	s = strchr(src, '\n');
> +	if (s)
> +		*s = 0;
> +
> +	if (*re)
> +		g_regex_unref(*re);
> +
> +	init_dmesg_regex(re, src, "ignore match");
> +	fprintf(stderr, "igt_resultgen: Added ignore regex '%s'\n", src);
> +}
> +
>  static bool parse_dmesg_line(char* line,
>  			     unsigned *flags, unsigned long long *ts_usec,
>  			     char *continuation, char **message)
> @@ -979,6 +1021,7 @@ static bool fill_from_dmesg(int fd,
>  	char dynamic_piglit_name[256];
>  	size_t i;
>  	GRegex *re;
> +	GRegex *re_ignore; /* regex for dynamically ignored dmesg line */
>  
>  	if (!f) {
>  		return false;
> @@ -989,12 +1032,13 @@ static bool fill_from_dmesg(int fd,
>  		return false;
>  	}
>  
> +	re_ignore = NULL;
>  	while (getline(&line, &linelen, f) > 0) {
>  		char *formatted;
>  		unsigned flags;
>  		unsigned long long ts_usec;
>  		char continuation;
> -		char *message, *subtest, *dynamic_subtest;
> +		char *message, *subtest, *dynamic_subtest, *ignore;
>  
>  		if (!parse_dmesg_line(line, &flags, &ts_usec, &continuation, &message))
>  			continue;
> @@ -1024,6 +1068,7 @@ static bool fill_from_dmesg(int fd,
>  			subtest += strlen(STARTING_SUBTEST_DMESG);
>  			generate_piglit_name(binary, subtest, piglit_name, sizeof(piglit_name));
>  			current_test = get_or_create_json_object(tests, piglit_name);
> +			clean_regex(&re_ignore);
>  		}
>  
>  		if (current_test != NULL &&
> @@ -1041,18 +1086,24 @@ static bool fill_from_dmesg(int fd,
>  			dynamic_subtest += strlen(STARTING_DYNAMIC_SUBTEST_DMESG);
>  			generate_piglit_name_for_dynamic(piglit_name, dynamic_subtest, dynamic_piglit_name, sizeof(dynamic_piglit_name));
>  			current_dynamic_test = get_or_create_json_object(tests, dynamic_piglit_name);
> +			clean_regex(&re_ignore);
>  		}
>  
> +		if ((ignore = strstr(message, IGT_ADD_IGNORED_REGEX_DMESG)) != NULL)
> +			add_ignored_regex(&re_ignore, ignore + strlen(IGT_ADD_IGNORED_REGEX_DMESG));
> +
>  		if (settings->piglit_style_dmesg) {
>  			if ((flags & 0x07) <= settings->dmesg_warn_level && continuation != 'c' &&
> -			    g_regex_match(re, message, 0, NULL)) {
> +			    g_regex_match(re, message, 0, NULL) &&
> +			    not_ignored(re_ignore, message)) {
>  				append_line(&warnings, &warningslen, formatted);
>  				if (current_test != NULL)
>  					append_line(&dynamic_warnings, &dynamic_warnings_len, formatted);
>  			}
>  		} else {
>  			if ((flags & 0x07) <= settings->dmesg_warn_level && continuation != 'c' &&
> -			    !g_regex_match(re, message, 0, NULL)) {
> +			    !g_regex_match(re, message, 0, NULL) &&
> +			    not_ignored(re_ignore, message)) {
>  				append_line(&warnings, &warningslen, formatted);
>  				if (current_test != NULL)
>  					append_line(&dynamic_warnings, &dynamic_warnings_len, formatted);
> @@ -1099,6 +1150,7 @@ static bool fill_from_dmesg(int fd,
>  	free(dynamic_dmesg);
>  	free(warnings);
>  	free(dynamic_warnings);
> +	clean_regex(&re_ignore);
>  	g_regex_unref(re);
>  	fclose(f);
>  	return true;
> -- 
> 2.43.0
> 
