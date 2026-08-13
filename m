Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ACCC5B572
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 06:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1071410E39D;
	Thu, 13 Aug 2026 06:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R39KAA0N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D460510E39D
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 06:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786601237; x=1818137237;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K2libai999+hGjuBFkziBGBcpt+K9Smi8xKBmw25w6E=;
 b=R39KAA0N0fOqYmqYYS9N5lPgvj8ZGXg2ijolr5OINNcI/NxIqQIGEKt0
 p3ePBTGLdEwiwxmw2DCwQeYqtGO5iUpCMyH8tdCwPxxDv3qpEwsRxEURM
 9GvFmW9cp2+xIQYbUz5GhprmiaCYEQy5X0W3KLg/euDH84Z3xNNTfUqiN
 0CVmSRyRSj8Bt6Ta2WJ3wF4C9gWm1bglxLrmf1z7IiCtueX6zlK4ohT9Z
 6m3CxohDxnTCSmhrgSjMvU/sXhzFMzSoNMNqF9Ymos58Cs6l+FtFR6aSi
 GtubiipbcymXOTWKIKMLiFRwYC+KufFlj1Hj0k4YdvEx7Q9NytA0ZqEXF A==;
X-CSE-ConnectionGUID: nsfhGuamR0GcfAyj8DvIKA==
X-CSE-MsgGUID: b08vUkg7ReK2wZ8wbXJQMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87188095"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="87188095"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 23:07:17 -0700
X-CSE-ConnectionGUID: 5MkWQ7q6Qp+nCpi1iY9ShQ==
X-CSE-MsgGUID: wxZtq5nuSXC5ea9rTZCjOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="264429176"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 23:07:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 23:07:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 23:07:15 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 23:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpN3g2mw08zubiePWfvtYI4f2YWXiaDG/pF/33VY54P0/tqkKs48Rkk2lD/d38V4yB3TK2mSavOSonXHfuY9E2KFqf2pGYQhAO9/QvK9Pqza/5XlN83WfHCE0xg+ZMf08M66iX763N4YigKdzsRjgVs584O12WoEOq50pgKk1bTIsu6MR4x3IUmv6ozE4/LdrYVGtKhCagvV8I8cNaR6dLzQ03UrtQGXtx4PPI0esc9PXe24pB0y5EB2eV0efsRz1v4RNzjR6CAKDi0Nzr3vdXJysAeu+MLUCIQc6TBHEIztnePjBW3/dtS0D4J7uxxZIK1KnbscvRD7gEtFpAbxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KllD1KU+GI/HA7cjOmDnlMz8X3hXEeY7xsC3kpkrnt4=;
 b=ICZAz7D4wiXt3q+SDH2nOtar2BHl9u9HMdvLH79gYAZuyzCAeE0+vFQTfYiwH7nNj8Ek6lxNZ4vnrFSV6PTfiEIGerCrxLiGLh2Y90tje3Y8g0ERbIEXIIzRFZ0KufJTFuhuX6lTEk1qIK1SlS2QaOwjerJwnrKhpi2N0zL0MNV9+Ph65reblblPW7IkX0aTlRoW8W/0hRoabLWXBm+b9azBgEWHegVA2XgmETAtq2bLx84/Avb3PWxrdSQFJ+QtRucNxqkQ2dwD/HpARQE4E1mjKUSgCRhZp7uc1QE6LLaLhTuWupFSBaOPmRVeeGhoJZr/fcZtg23Dxd16j/cIwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 06:07:13 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 06:07:13 +0000
Date: Thu, 13 Aug 2026 06:07:03 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_params: add
 invalid-offset-multiple-buffers test
Message-ID: <h6tzc43owgmsr3sjwrhqvk7wkoz7t6c3phlrofkkbkpofylpya@rpz7inrczaza>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260812144331.41158-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260812144331.41158-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: WA0P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::25) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|BN9PR11MB5228:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb48216-904d-48de-04b0-08def9011e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|56012099006|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mv2Em3bdBRjh886d17U2eMd6G9Pc8cj4wogt2Op7bAf6qcWrVbixVPhJthJikHWDSlrMktWJ7VkfI58CFqrspJe1naN74uXpC/G6gdHf7i+tbnWuSG5zwHTBhKTAH+TAXjgBkD4UsxxNR/gSOQSoimj99smmQSLcsMBR67QAdrwFaV5bmThLqLONYj3GUBB/2gyWsP8vPJML6/lsfTUDdWBUs3WXH6TzCEgTcUIIaIEdTEUH9iTmQiKpE9GwQh540/C8ksAwA8WgrFRf7zYov7n4r2YmjKjkMuxu6iVol7rx28HeQPb1KKGcH/2dqzhvKesoCWrcE6BOqE+WqBrmiy5R7eAH0Yy9FkyUb+ssYf2TU2Z8brE6sW6aReJLsFnIEC8OBV8Tdwt6fcsNUG9DHEEQc5GtdH2XW52UwCrdmBZpxISkoNa+ZrOfliRQN0sMPBsyIbNuOuaLF6VgcJrspNq5S68WFce7FFnrfu926u6ViDbbDKjXB/ir2+RDNQMAjn2gWADzUjCPog24K5maXexARTyF7sRjM7IPhnMyctleTB0ETq32LRyeDVG25xN1RfVLDA67se4N9o+Tvzp5bF9CzQ1JmUzgcrPyV6fcZcZBz/Wod914xbN2y4IkRybbQckL+DRXy9i28GPI8TiN/MMahkWGuoUGcrBBbKnnlJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alI5eHRpd2w1NlRmUFJicStSTjU4dm45T01yQnc4VGFrdkw2OGgrTWZNQ0Vm?=
 =?utf-8?B?NTZMWm1RYkhPZzdpaG1odWp0RXVtT2c4U2dpMlNuVHRjVWxadE1aSVN6NnNx?=
 =?utf-8?B?RTNUcXdxaklkWUJZMjVoRVhxYmhzWEYxSTVPRyt3eXR6bW9HZktGNkRlSVdW?=
 =?utf-8?B?S1d3RVdYUW9BTlZGejNpdjIzL0hQa0RvaUlwZk4xSjAyd0pSTGdzbzZ2OFl3?=
 =?utf-8?B?SWxpZEEya3Z1eE9Hb2FPaUR6WjNEekNpV081aXRzUDVNdVlJdXdMRlpseVpz?=
 =?utf-8?B?RGNzMXIwVTd1ajlWb0RXVnN5bHo3VWpXNnZtVHFySWlHT3M3clczVzE0ZmhF?=
 =?utf-8?B?Tm13T2djNVBaSFF1Z1VJQlVpdDMvbHVUMG0yYUEzeEFqcTBPdmkvZFNWVW9o?=
 =?utf-8?B?dzN0TjdIT1k2TmlVZE4wNzFiTU9xUW10M05zbTk4cXlBS1R5WEJtZkxhSmpP?=
 =?utf-8?B?ejgyWW9wT0VnL3o5VDRTZEJkM2NiNFB5Z0x2ZVczQUFCU0QrMFlKc1pFVEFP?=
 =?utf-8?B?U1RoRDZEQkgwelhqRThzWm5qUVpjeDBUZGl0dmYxZFdxZlpxTmZ4QUpWOWcz?=
 =?utf-8?B?YUgrL1FhbWtPS3JiMlc3aENkUUo5UzIwQmhmYTd3S29PL1NGbEdydXhjaldZ?=
 =?utf-8?B?UUZnT0V4NVdzdVQ2MTU3OUtJWXQwUzFYTDVLYjBCdnExS2Rab0dCQlBFb0xm?=
 =?utf-8?B?NW92WEZhV3hGWE5jelAvZ1NkbE0xUmNpTFdsREYxeGJzdWhKT0c0UkpwUkg5?=
 =?utf-8?B?aXZGN0NmWTJNeloxVmF6QS9BM2VlZDUvQmdXQ3ozTEtMeHJWaG1HYk5kd2Zs?=
 =?utf-8?B?TWxUK3NDRVZ5WHpUcTFpSWtPNG9RNDloOG4yNTB2VmduVlE2cUNOT3ZsRU1X?=
 =?utf-8?B?eUk0TjNrWkhscW1VaHNCcVE1eEpWeDYwelJYTTZkMzlCRjA5ZHdVS1ppMDhO?=
 =?utf-8?B?RlgxTDdHcDJ6THlBWTg4MTN5Q1hwY0Q3U2RQUWxHWjRFK1YxRTlsZU90SVVi?=
 =?utf-8?B?T0JQck1WVVVyM0xUaVZ3TDhLYmM2ZmRrNUFLMUNlUE00SVhrOE9NaDVieXVx?=
 =?utf-8?B?aEMrTHArQ0VNTDdTcUZxaFhsb1kyMysyaDNYTDk3ME9NODJkN3h3RldyQVBV?=
 =?utf-8?B?cytBQmkzK0VhcGpsT2dzRDZVOVVudHJuRlptSXhoTFg4a01aV3lXLzdHWnRR?=
 =?utf-8?B?bE93aU1KVUFqVkhXSnZNSWxaUHpwelJkaGp6Y1NCdUFnOVJUcmtFY3REOTRw?=
 =?utf-8?B?REhtSDVCWldNUTdFZS9pZ2pvZzRNd01lNWRxb3lQS0VicUozUXFDb0dMRXZr?=
 =?utf-8?B?blFuWU9ZOCsxT09KNE9PNkhQMXZGVE5ib3VVbm5scUx0aGxTSElFM00xQVd4?=
 =?utf-8?B?TDlMdlN5ZHpVVUQyS05JMTlQNW5aSVpaSzZ3ZkxEd3hDUlJDblNIejM1YUdH?=
 =?utf-8?B?RVdsYTdZNkZqSEFqUzVaZk9LSk5ZRDdMTTEzMUh1YWtmU0hwc3dFY2ErOXFI?=
 =?utf-8?B?TlJFRDd2QVZzaVo0VmlHUm82Y3JZbnBsZEMyT0hsbEVzclllMmZjb01pTjlo?=
 =?utf-8?B?M0ROWVFUdm9EekRhN0NIRC9qajIxTExyc2tyUFNIR0ZWK2cxUVRIcERyZG9B?=
 =?utf-8?B?SFNTUjdvRnpNZG1sVi8zUlViaWlUdlYvekdIQXN1R2pDc280WUJDV3BCNlhn?=
 =?utf-8?B?MlBuSGdZQkExMmtlWFFVQ3J0OWt5UlZMNWhFQVZIbWlmNDczZEpXR1c0cm1x?=
 =?utf-8?B?Q0xNUERuSDNmN1NLdWlCOFl0bjU1Myt5Z2JOeFZqNWVid3ZsaUhFMVpXMFdM?=
 =?utf-8?B?c2s2YmhKQk4vYm5YSTFMZzMxVEN2cWFLeXJDZjdmRllGVTU0amRreWljeDM0?=
 =?utf-8?B?WXd5NVNQZlZCcVIwNVpOTGdFNFYwQzAxVWhCdkczOW1iVGVvY0J1aHJFVkhk?=
 =?utf-8?B?TWcraitlQ2NwSDlZNFo5ejV2a0VYU3dsMnVrVyt2ZUE1N3UyTk5GejgvaW14?=
 =?utf-8?B?RnJKYVdDUkhCTCtERXk4S3NqN3N3SVZ0L0tSRUpFekxTNkVNK3BLQ1UrdGVO?=
 =?utf-8?B?NnpySmlHMncwZDRCYzczWXMxbkZtdEtreU40czk3UUM3ZkZ0ZlVDeDQ3ZjNl?=
 =?utf-8?B?eFVxNlpkb2x4Mm00R05odTdVdlpwcDFuRktzdVBLVW1nL3NEUGdnYTFFd2pJ?=
 =?utf-8?B?NHhGQVI1Ym94b1h0OU5qUkt2WTYzL3Z3YUx0T2ZDRmRPb2wrUXlqQ0krMllq?=
 =?utf-8?B?cDUzNWEza2h5TmdTR2tqWk02Z2NNVTUrbnJyTGdZR0JSanVQYVN1a2QrTTNX?=
 =?utf-8?B?VzlqdmZUMTZDRHBUazIzYjl2N2Nqa2tVR2pWYnR0ZnNxV0VGV0lhTzI5YXc2?=
 =?utf-8?Q?sXvLtvnA0HNL5xeU=3D?=
X-Exchange-RoutingPolicyChecked: KfAX+Bffv2oWbIIgFgAD4ER9t0oSwpYUkOW9BdJhvLUrJRe2yZerOwplKKABLWN/2lvihJUyyAjLg22Yffx7I1DmsnKUtK4cbW5xgCWwnbHB4imgOngV1d2v7PHLf0PQCeXscrU/uvp+6D3FdYY+QLQJmLHvxie78GXXAylFHYR1KDgn90uTMJDKUR+BO65jFNHWQUM5BuS0KjQtdyXS/dj0X+aSl2sGRTvzO7CiuwBjuDYMNCCY+WvOLNwFcKe0MjYk0HdtE1YjMopncrlY97Ym6Cbu7CB6VIfBY7vvdOgIJc0I+R/R4Gdfif72Mv2QgJp8FULkiNSDMPw4Rjs2PQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb48216-904d-48de-04b0-08def9011e40
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 06:07:13.2438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhUrFKxpbAFWq69jytbwFbMiEsPDYJjqCq55LfjOTs5c/+40zEr71U13+AKhFRdHDRTo6OmRi2zfLg0L+O3bNF2pp76OWLHDOo/h4lHGDd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
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

Hi Krzysztof,

On 2026-08-12 at 16:43:32 +0200, Krzysztof Niemiec wrote:
> Add coverage for the case where the batch start offset is invalid with
> multiple BOs submitted, which was buggy in the kernel until 4fe2bd195435
> ("drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffer")
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tests/intel/gem_exec_params.c | 48 +++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
> index 3ba4c530b..757115a21 100644
> --- a/tests/intel/gem_exec_params.c
> +++ b/tests/intel/gem_exec_params.c
> @@ -85,6 +85,8 @@
>   *
>   * SUBTEST: invalid-flag
>   *
> + * SUBTEST: invalid-offset-multiple-buffers
> + *
>   * SUBTEST: invalid-ring
>   *
>   * SUBTEST: invalid-ring2
> @@ -404,6 +406,49 @@ static void test_invalid_batch_start(int fd)
>  	gem_close(fd, exec.handle);
>  }
>  
> +/*
> + * this test is checking for a NULL deref in eb_release_vmas()
> + * (see 4fe2bd195435 for kernel fix).
> + *
> + * this is always going to fail with an EINVAL but will trigger a crash
> + * in the kernel on affected systems.
You could be a bit more specific than "this":
"the test is supposed to trigger -EINVAL on __gem_execbuf return,
which will lead to a crash on affected systems."

Otherwise, LGTM:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

> + */
> +
> +static void test_invalid_offset_multiple_buffers(int fd)
> +{
> +	struct drm_i915_gem_exec_object2 exec[2];
> +	struct drm_i915_gem_execbuffer2 execbuf;
> +	const intel_ctx_t *ctx;
> +	uint32_t size = 0x1000;
> +
> +	/*
> +	 * clear out junk from the argument structs, since it makes the ioctl
> +	 * fail due to invalid flags, which is not the failure we want to
> +	 * invoke here.
> +	 */
> +
> +	memset(exec, 0, sizeof(exec));
> +	memset(&execbuf, 0, sizeof(execbuf));
> +
> +	ctx = intel_ctx_create_all_physical(fd);
> +	exec[0].handle = batch_create_size(fd, size);
> +	exec[1].handle = batch_create_size(fd, size);
> +
> +	/* this triggers a fail precisely in eb_add_vma() */
> +	execbuf.buffers_ptr = to_user_pointer(exec);
> +	execbuf.buffer_count = 2;
> +	execbuf.batch_start_offset = size;
> +	execbuf.rsvd2 = ctx->id;
> +
> +	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
> +
> +	gem_sync(fd, exec[0].handle);
> +	gem_sync(fd, exec[1].handle);
> +
> +	gem_close(fd, exec[0].handle);
> +	gem_close(fd, exec[1].handle);
> +}
> +
>  static void test_larger_than_life_batch(int fd)
>  {
>  	const struct intel_execution_engine2 *e;
> @@ -705,6 +750,9 @@ int igt_main()
>  	igt_subtest("larger-than-life-batch")
>  		test_larger_than_life_batch(fd);
>  
> +	igt_subtest("invalid-offset-multiple-buffers")
> +		test_invalid_offset_multiple_buffers(fd);
> +
>  #define DIRT(name) \
>  	igt_subtest(#name "-dirt") { \
>  		execbuf.flags = 0; \
> -- 
> 2.55.0
> 

-- 
Best Regards,
Krzysztof
