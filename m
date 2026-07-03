Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAB0C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DE910F929;
	Fri,  3 Jul 2026 21:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmQ30M7B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A6D10F929
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112537; x=1814648537;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Gbcif84JH3eDINPVQHg3hn8km9VKfsNQRBX2ePq2ov4=;
 b=QmQ30M7BFtMGl5TVaL81271WLrc88Quijy9mxUvLH1JC9blDVhpFXSiS
 GUD8oHzyceOO8mWYcFYb7/lMlQsboPiDDMQoLe6m4VfTJW70sQuhVpAaI
 6sEIqsTNfNXweocetKycjjNtQpUMq855QUA0bihEg4DYmwLJl1ls96jxo
 pZVLMxzijlzBcG6ihPLfnWkq2/yn9PcBfmzLSXdvoHwKoFV3bCZEn8sT/
 IutwgMcKNLwZBki9Jvb8KPLdGJBQr8lrsz6JKEAi93bDYC5oL4Rqz6eV0
 drvItsi3460zOGzp8Wi8IWH259JeexidhHq8OGU6h3eUsnB6LetqzPrsk g==;
X-CSE-ConnectionGUID: dpz+W/XCSYaQ0pkM+f31Aw==
X-CSE-MsgGUID: D0V8bjyQTASUkYUnUuaQpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83894191"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83894191"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:02:17 -0700
X-CSE-ConnectionGUID: yZ4HnPEKRHGu9WXC8rZQLA==
X-CSE-MsgGUID: klr/OvflS5qxwATA+SafUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="253328074"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:02:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:02:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:02:15 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:02:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ns/K38dOUFnhlHg2AEIFR3l2Opxflr5nX1dyIJBVz1jS2W0i0CyeGI119PZ3FnACWLPv4FcE4mUAxudUWPLCuvaM6OtsLEzTjCj461loArsotKzxyc0v1CRPWC+4z7YCWXfwUpZUg4Yhwxo3GUcftFaHnQYv5d+4zyjMU+uivkTiogR/5V/6QOKxrEqeEjx+fGNahGmEwiImm/Yq0GBXUzKOWx2EF42izjO5jCvN95UbdPppJcIiuW0Rbbef8UqaBVL+fXDr4mx9C5PXknVOpDY5f1V6E0DIzLYguk7EMsu5H1EGQjhX3oyhmLyrn8R4rl81ZTawjZmoC6kDoTv3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qqcYn0/0ODq5l/ebS4cz5MfApcuE8kwxKoshB19UlM=;
 b=VpgKICO6qdwUAFlmQXWiw1zTyGeuzjk7lFJv4J562iOYLobbfCE0ShEWRYwTuBEpoCyFj2L9fzVPXsvDkSeCe8SaEpq1geFiGXgj0u5RcYOagxfVzYOIASMIeKUip5PAjwpYM/mQTl+nTwuZrQXJusun7/HxtdkavnVByVeT2WuEhlyKN3Lg285KVEcPyJpsl0xkoXMLAasmJBDnRPbPdGFbYnSh2DHN1t2/GliP4urzOZ9SQGn16Bp+WNV6mCTAmmGVTdp7smNm1By5OsMfk7MK2cd5wMx9TagTeyRbR3KvgfNreUJZzloW1vUBAdGlxBwvjCpCZUhd/j48g5vqvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:02:12 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:02:12 +0000
Date: Fri, 3 Jul 2026 23:02:06 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 13/31] lib/i915/intel_decode: replace igt.h with
 minimal headers
Message-ID: <qdnf5pfdptpw2cr2higufsih4wsplzkfmc6zjwgeetmokh6vlh@b7qu4dllbhuf>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <dd67797503576f6bec6d0f7cb7c10997987b17e9.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <dd67797503576f6bec6d0f7cb7c10997987b17e9.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0079.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::16) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH8PR11MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 2788bb50-ca2c-44a2-91ff-08ded9465a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|23010399003|376014|18002099003|22082099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: /3LPjPB0JLMkjHmfI1umxSu16ma0nuK7MSowtYVkRVJtLmO2LxUmPSK9HKWo+QM6E77h3rtkhVautwXFqQViEbccZy3fkDZyQqXD2zHSIojKV+TlNjCF2ZbH+TOXccTKW00oMTxMW4gjblLn6Q6aBZUn8XoTr+HuLFZkOF8/E81SZBSJnb9yORONLqDv8qEtHcPzhlx2xXlhw8f6iUuDIHXF1gwgG8g19ZyP3H4sLYHt9MV9ExD4xoTmw7zhfwtuM/ag1BctxL7KJ5euuWxiu6eB6SZFIqlXSuP/L6olep9rxdQPRo1unOpKXBm/z3n4VmCYwqHhqWa87uB+GaIiEhGFesREgESLaT6CZMWHO9X1zFTPj3a9UQEoBcwPSnrUpyUnCB3LpxW7p/j6/y6XSvxX5BAkQSQSliH+LHuBsiJ/lDV6QQnAc2AaA+bXrZep3IE5IiIkjCp/2Q4bnZfRocLM78fWaT4G/epCA7gcibiwC1aYBTRofuAxjGfkpqFUv6UAL0XqoE+c5HzgEoVX2yEeEw7JJ1I4+mkMhcKD6K7j26lTUxR8cJ/Qmup4JzWI1+rTu782Ngmuu3emr7Z8hAqjbWueNm0CoBBZ4Db5tHw8GXxjQT47vwOl87KnVAcqtwB3JN2raT0Ts3GVv/B4MpT7aPTezO11H734K/OHBPM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmxKcjIvUFJRVG85RDFNb1NMaTlCR3pxUGhLZzJTSlZkNVd0MTl5dHZLSDBN?=
 =?utf-8?B?dUltN3Zqd3lhYjMzTDFQTWFSd2lBbzdORFM3ZjhqOExzbmJpWUpFREFEd2dX?=
 =?utf-8?B?R0o1dm5TREVTZkNGbnczV1hDenFGeFhyYVJXMzl0U2Jieml5UU5tYUxqRmZO?=
 =?utf-8?B?OXA2RkJYU0o0enBaUjRWUmxIcjB1Q2xRZGllZExIcVl1Y0tGMzY1eUppNEUv?=
 =?utf-8?B?WDVTcnNEd09KcThRbS8rc2tLbG9CTEJKTWdlZGdLVSthcit5QTRYNURmaVQr?=
 =?utf-8?B?N3NOeDJpMUdjMjdBb0ZiTU1udVE3UHllQnRqOWNwdlYraTFXTTUvczFuWE5h?=
 =?utf-8?B?eFlkTVZ3YUpjRXNxOTNtUTQvck9xTTdqWkpTK1hrUXB3M0ZoQ0oxbTBPcTRT?=
 =?utf-8?B?YjFqSmtpb085T2xHa0tuU0pxN3lIM0wweW9tS0xwNHE4eVI1c25acmFZRUFI?=
 =?utf-8?B?K0Z2bURtQUtHbHV2UVQraVppYXcvV2VYRTlKbWl1Rk9KR1ZTTUZPS1JJbGw0?=
 =?utf-8?B?YW5rUURMUHQvS2JNdHdtZGJ5V2NzRExsYmdWVyt2akxyWTVuRkErd0Y4a1Ev?=
 =?utf-8?B?ZG9FelZoQnd6RExwaFluSzhaMHZ3dTNDK25JYWRidlI0Q2pvMTQxU3NsRjNk?=
 =?utf-8?B?cVZURzV2VUY5czhlQ0Y4ZTZYVS9nR2JLemdscTZOc0VPZUIzckM0Rm5iazNP?=
 =?utf-8?B?RVVDZURLa0VBVG5hbTdyNnJqUFBQOHdGUEZxNVBpNmd6RGJZRHZ1WkJ6Q0hG?=
 =?utf-8?B?T2lOUVhuaDltdHVnNkd6ZG95QzVkVVJZWUJVOWgvY2QwSjVRYjVienc3eEZO?=
 =?utf-8?B?TmNSMXVIVFNydHBIRXEyemQydnpZTFZnTXAzbXpCM2RCd1BDcndORG90QUQr?=
 =?utf-8?B?ek01aUxodlJUR3NRbzZ0N2R1VFJyVWd1MFh1SEFlT0psUUl2SmJHOENkeUI2?=
 =?utf-8?B?bUZ1Q3dpK1Y3TmVzaWxTdHU2RFF5Nk5ESjRGZXQ5NXZJUWhZVEZVTERWckQ3?=
 =?utf-8?B?VGZzWW1WVW52dmt5L2w4VllWaHdweWVNRnBIVE9qaldGVkZFVWJjSXZXMXF5?=
 =?utf-8?B?Y0tvY2NFZ1pYLzIxNGdkSGEydWN2WTAwTXFBZ3VUU2NuT3FLcEdZaDRkZVdt?=
 =?utf-8?B?ZTRwQ2VpREwvS0FwRm5RTlpISXF2L3BvMytwOE1QdEVSaTFlT0l4T0NFdVM0?=
 =?utf-8?B?bURnKzZRTVdBS0FMSFBXNWQwMVdmTnZ4T1laU3BLWEtSV1ltRUppTWtpRXBi?=
 =?utf-8?B?Z1FocXhqL1k2Ukhwckt5Y2VkNFJuMlBDbmpodktCdm1zODQyL0pzS1hDUkd2?=
 =?utf-8?B?amtpYTIvOC9zQmlSa01DclNjbk5ISThxTkpJd3pSbmdheU9qam1sNGpLNFBR?=
 =?utf-8?B?Ujcyd1VrZFE4dldnQ2t2Tk9VZnk0RGkxbVd2cUJzbzVmQ2E1Q0tnNjZIMFB5?=
 =?utf-8?B?TVZGVDRjRUlDaGx6aU9JK2VTTXNIWjlBSVpKSjBaUDdxcVNsOXk0VDZNL3RB?=
 =?utf-8?B?THhNL2djeTFrU1ptc29MZ3NrbmJHTDB0QlZVNWtBdVZNOW9nUml4TGZXdTZ6?=
 =?utf-8?B?dmZWZ2FnNTd0S216T0JXdmVzZlFEbU9FNTNSL1QwYXNYZnpBKzFZZTlOa3JP?=
 =?utf-8?B?KzA1RzlnWFF5aWRKZHR6WUZrcXlTL25UNVB1TkNFb0YzbUJFRFhMczFTYnFy?=
 =?utf-8?B?c1JZajVxSjdQV2s1OTBlMzNCOVNDU0IxV2J3enN6K0tidFI3eWwxK0p6YUdo?=
 =?utf-8?B?TUhKM1Mrd1BOTlNGQjlOekJobzBDaUJHbkQ2REU1TmExbjZOR3RObXFxZ1hT?=
 =?utf-8?B?cUJ4b3FhZXFnbnJGdmxuVkJmQ1dQZlU1eW1KZWNwamVtSkxZdUxjUXdmcEQ4?=
 =?utf-8?B?dXF0a1A4MjZNMWl2aStMYkg2dGNyR1JqSlptK1ZYYm9lWDlQOGpmam9KV2hM?=
 =?utf-8?B?eENDdFNjSmhzWk5TY1dmMUllWGVCQ1RHT00xS0RSZG5QK1RRdkcrQWFNQTd3?=
 =?utf-8?B?MzRFa2VvOXpobkhNVTUwNEhLZVNrZnc1SktlYXFtbUFpVDlIY0JFVVZTTXNT?=
 =?utf-8?B?REl5dEhONE5xeXQyYm9zd0JWZGprN3BXVjYvQzlSdk9nQmxDK2NLTnNLUmxv?=
 =?utf-8?B?T3J6dk1SemJZN1pFQzYzb2dZK09nUnd3QVBLeXRhZkxHakdqcTF0SUdSRWtE?=
 =?utf-8?B?VG5QN0x4WFI5WHZaL0JuTDFxRUFVM21YNzdCZFkyMEZ1aDl6L1dwVTJWVU1W?=
 =?utf-8?B?WEp2QlpUUytJRVNwRTlsTHEzdEVxQytnblhUMy9HT1NHOWIzZHRlb3NrZGhP?=
 =?utf-8?B?N2MxUk43dFJRRTFnTGszYjdXUE40RWF3SU1iWFRuZVE1RHNjWjF0WHBRVStm?=
 =?utf-8?Q?qAUhby8HWkBn5BCBIFja8UFFh02XpGshJOXkjhq0pIV1W?=
X-MS-Exchange-AntiSpam-MessageData-1: RK69vekkitZkZ6xfXble5A7qMEzz4kmpPz4=
X-Exchange-RoutingPolicyChecked: Jl/NN8lZrNFRhlsYdrbpEtZaY1e1j3Jnb7S3Pzvp2IT+qV80qruow85/MJrM5IuYZGlerQTGkrpKkL/AsFBh8rZeF6zgNG71wh9w/oNgMF1s1Rzp+Ff8nlTOXUL+zWY7YNaCMVcK4fE9d0qAtK8dckhoFe03vYbwwG5iM9w/5ZG3OaW+q6b+ADbV+zbYq3A+A8tKrunJbFeo/erDwdcG3KVL3i0j3Ve8jFDXp1d/hCj1FYGZJrJSjNK9/6FlFVUK98LS9mA4sei+muZ7aLbnelnP+cGu44NRKM9AhDlgp4b1iPJDwPOy3ZHcilyHIBaL8UeVWf4A+T5cL45ASMyrag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2788bb50-ca2c-44a2-91ff-08ded9465a91
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:02:12.4796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyY0CetcgQFfiH9QTY8QcAq+2lksZ7XPwIV7CA8fpN+baFjZD8cd5VrA0FRpLzmWLaLfld6bdwBfezrzCviZpoaqAvOZZWJCTsGcgKO3gu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8107
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

On 2026-07-03 at 16:28:47 GMT, Sebastian Brzezinka wrote:
> intel_decode.c only uses two symbols from the IGT: intel_gen()
> and intel_get_device_info(), both provided by intel_chipset.h.
> The DRM_PRINTFLIKE macro used for the instr_out() format attribute is
> provided by xf86drm.h.
> 
> This is a prerequisite for building intel_decode.c into a static
> sub-library (lib_i915_decode) that tools can link without pulling in
> the full libigt.so stack.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/i915/intel_decode.c | 4 ++--
>  lib/meson.build         | 4 +++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/i915/intel_decode.c b/lib/i915/intel_decode.c
> index b78993c47..d4a4da4da 100644
> --- a/lib/i915/intel_decode.c
> +++ b/lib/i915/intel_decode.c
> @@ -28,8 +28,8 @@
>  #include <stdbool.h>
>  #include <stdarg.h>
>  #include <string.h>
> -
> -#include "igt.h"
> +#include <xf86drm.h>
> +#include "intel_chipset.h"
>  #include "intel_decode.h"
>  

Nit: shouldn't you use a newline between <> and "" includes?

>  /* Struct for tracking intel_decode state. */
> diff --git a/lib/meson.build b/lib/meson.build
> index 43ae4ce66..aa8eae68b 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -432,7 +432,9 @@ lib_i915_decode_build = static_library('i915_decode',
>  
>  lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
>  				     dependencies : [lib_igt_chipset,
> -				                     lib_igt_tools_stub],
> +				                     lib_igt_tools_stub,
> +				                     lib_igt_drm_stub,
> +				                     pciaccess],
>  				     include_directories : inc)
>  
>  lib_igt_reg_tools_build = static_library('igt_reg_tools',
> -- 

With nitpick resolved:

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
