Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07076F327A9
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 06:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F1310E72B;
	Tue, 21 Apr 2026 06:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MdOsWWNZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C438410E72B
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 06:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776752003; x=1808288003;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Q2JG7h3L2E7j6Gf73c1lu2Bq+DpXnBhp4L1PUzbpy9s=;
 b=MdOsWWNZdMUM/Lcya3SGWKns1EY8hXx5FWOyR4aQnBJYTJlbdGgJSCXL
 iuUtwM2fdNtjV6nJrQ3FokamCGLBX5ekRtBHAb4197pR2NZLZqb3CKWmw
 aF0bZs4WK9g67KIItijhdxyziqGL66LhRIiGoximbWQOl/DcuXIyt+lAw
 gp2PV594n/fHKS+6PHTpgOXJi4OSqSbe30H++RgosDaY53oTEIpXmiHGH
 nKqFLx4/XHokuSMs77WdAkAMAlv0yLKyL8iimqu5M5R2KFjufdQF4mYf2
 MvLPMt1b6NW6q+4UWzl0Y8i6KooMLlzLUv6+PlC0jXnnBakKEFcH+0GSL Q==;
X-CSE-ConnectionGUID: O+XrY6/KT8G5SRdw3BEGFQ==
X-CSE-MsgGUID: oRUXNqHESHmkHzG4ZqpIHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76707734"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="76707734"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 23:13:23 -0700
X-CSE-ConnectionGUID: b9Rhqp6AQ66bMaM1WeVNxw==
X-CSE-MsgGUID: gyVimHryR1ikWbDgmlip5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="236305629"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 23:13:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 23:13:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 23:13:21 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 23:13:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1DQ5pUDjXT9W59LeUyDFWOM7Dqu6wfDJDRSjXA57kbfWtsPj2N7Fhfj3z6mHVMTLr4GlP60Dc4IiSm7r7i6bJe34c7JhDT5c3WqXe8aoRB9PERR03EuCJWB0UjHvG//lLcjHqZela/Qs2RbCCfh0gGCKliZqKwKs4lPwsDQr1AVzbJSV5ECYBzIa+/Tv7+I86gp8ofzDM/94kSRuwAimmHzbefVEsrJQeWX56gzqnKk/MWsWXo2h2ggQlIfkX0bmu8VlJeFpSeWGY4aafDX/S1f1g8Mo9B/jshcU2Djt8f+4CilPJUJAUH7DqpbnuW5jG66oTvj03d8OzhCrbLKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dy/mZ7Zq8mdKSm0UA/wXABPL0b2qDaaemVlCB35TX+A=;
 b=j+IBPC7gbLNRla+opJzxqPUcR3+8lLW66g6a4/G33Q6KNjpl7/ORPZ1tDPIw2+oNdGM1Z9fb0nWyRV98Z8/HOCGxkLPXkIvIUzCClbHCxLThQkhC8+GkfvsciN4KyB6OH0EKXLgoigzGaXYUdoORlr7RyDuoObCU2OM7imQ/T2/cxFmyslMLI0JjlNbH9MhFzDfde+WwKfpd4WnigODzht+H0DBKRlE0O7griiWDSEj/KyDw5T9UBBcw43g/znWXU2PE/10e0GZ7b/vApKvUBKEMG6VR3wng30jRgMKZZrr4dDLiVsXbcRjUZATaSceVoKf2iw8hfTsCimcTAr7JeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH0PR11MB5783.namprd11.prod.outlook.com (2603:10b6:510:128::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Tue, 21 Apr
 2026 06:13:17 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 06:13:17 +0000
Message-ID: <b4757a01-6cff-4c92-b7ba-5a6578c7c06a@intel.com>
Date: Tue, 21 Apr 2026 11:43:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms: correct index validation logic
To: Jing-Ping Jan <jingpingjan@google.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Juha-Pekka Heikkila
 <juha-pekka.heikkila@intel.com>, Swati Sharma <swati2.sharma@intel.com>
References: <20260420074925.1710024-1-jingpingjan@google.com>
 <20260420181651.ox3divkbdpmuvj2t@kamilkon-DESK.igk.intel.com>
 <CAMYCwo6_=W8reh5s+Ne6UZxDXSHdLRzraPbZk8BEJuNfcVUa8A@mail.gmail.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <CAMYCwo6_=W8reh5s+Ne6UZxDXSHdLRzraPbZk8BEJuNfcVUa8A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH0PR11MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf18172-2b1f-4c7b-1f82-08de9f6d13e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: CWxiZjR4Bt06px/Crc1p756nA9vbB9KC70H7ohAHEuPcmUrfQGSvJ/ZcrALtSNlIwkx0Odv/BY6krWMBYw1BprbZemX8F6muJcvbmz8hl7UBTMNPsnXMZkYdM2FCJcCipgRa/56zWnbgDMCk57KPf7TjOuZNVe8gn4+j9QrN+acm3klAdWALYqU62fpzPASBFvL1nTv6M4RfTxEYtYaFvPba/5MHYqRu/cTBSrH4EggQp8IHRmg3ntkFfraZoWk5H6wk05JOYfjgjkoj0sfHYDn+1cJgnwMNhEKeiMXtUUQJiUcSC/OtkctoCKSlwthdg/khzhUsER2drgNwZmPxyHAXDeTxysVv/zO+Odfp9n/HURnXHaC3NvQc1l21FelyL2s8hQNQ2WYzRqoxo7g1qZn4Qt2N6KTvBxhbIyTqf9c/gPNtuhOWVK1VGkOlzmDMjTn4/yEVvqgG3iJn1lY0bqOfDLEJHm0s1J46AFA44j82M5KPK9Nu7+P/yaVeShPF+UM3bMr4wYB6INZDU5fw5W41BzQeYZahAqINdpqGg/CNFbm6LwQl55Pl4pGFn62H1WfSnfSma0ETC9LwQ3fMDLpscvBt1dG90MaVZXRLzPqaUFG1iFfp89qXj6871QdxUcIibnBwtTTa2/bHudGe3T9gL3J7L2KgaWjKmbm1hQHavN6yD/3UmBKTUb599Zh2J8iEBrwW9KNmifriAaz1r1TWnbR2CqxJWRQX325SyVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0RMZklRK09jT0RqZDNvckwrUjVmcVVhLzVBWGpaMkMxVDBWb1ZnNHREbmVh?=
 =?utf-8?B?UnNwc1ZrNnRmSnN5SmpLVzBzN1hGVkNXVHZBTDNIaGU2blZ1NDNvSmdUSG1i?=
 =?utf-8?B?TFBEOW8wdVNLT2QycDhjZGYvVG9qbldsYnFhcmFGSlNXc3BtL3pzRkZLR0pH?=
 =?utf-8?B?QXd1bm5oN01RSTUrWURyeGRxL3o3R1YyUm5lak8xVU4xM2RnOU5TODBpczl4?=
 =?utf-8?B?WnB5L09ZZS9zb0NSQytiZCtCcjVWSGhMZzdjRkFBNkhhY21oMUUyTThocGc1?=
 =?utf-8?B?Q1hjY1VrUmN1QkhWcFdrcnZQTUhyUHlZRnUzMGFVbnRIcVd6d2RZUFdVbGVV?=
 =?utf-8?B?S0lpNG5pUTE0RGhGdUJvWjNwWU4zbGhlWWFzOVVSUG9ROThmRlpZTXhReWly?=
 =?utf-8?B?eGczTTA4MFBZZjdkUy9pb3B5bXV5VlNOVlI0SktqRGROZk9yUjhDT2ZoSjhT?=
 =?utf-8?B?cVhzckVHYkMrR0FCSmNyWUFHYy9POHJYdVpyb0lOOFBWQ1ZnT0lmckdEY0JD?=
 =?utf-8?B?bThNMExmZFJsdTMxRTRqUDJEZUtBaVZ1ZmFlQm03LzMxVFVmWTVXaUhiclNK?=
 =?utf-8?B?N3p1cVlMS001Qit4RUpEUEVuNHNGSVhoT0dNK0NIVW9JSkFIN1V4WFpCR2dv?=
 =?utf-8?B?ZVhhSWtTeUEybzlPbGRHVGlZdldvMDdZNDI2d0NPeGMxNDlmV1ZENmN4cDVp?=
 =?utf-8?B?bHB2VFkveENteDV1SDJra1E0bmVKOEhJZkFhMUtwd2xaN2xuY3Q0YzJRUUZl?=
 =?utf-8?B?MUNvc1crOVMwcDdpVzBHS0tvQkxCcFpzTGxzT2ovMS9xZEpBcDZaM040R3d0?=
 =?utf-8?B?eUN4Wll0cE1zMllCSUtVKzJROXBMZDFOaVYyUFA4d2F6cmVhTlU4eVFoNFJh?=
 =?utf-8?B?VXQzQ2lmemI0bDlRR0NNTnZZWDdHU2hiTVZoUTJqQTA2YStIbWlFRWdzVGhr?=
 =?utf-8?B?YzFNMDY3eXpGTW01Zzc2VHR0VjVZdDhMcjhFcDVZWFJ2dzNjTzh4ZGlOVFho?=
 =?utf-8?B?SDFhZEVSb014cHUzdnMvaHhRTWFDZjg1UGNMQkdYSXVlaHdZWXNqbzlPRDhF?=
 =?utf-8?B?Z3BjakV6WG1ZOWUzdDZNUm4wMkhsKzc4aVUwQndxM3JCcHM3WkI3Z3NuRWdV?=
 =?utf-8?B?TzNrZWlmYi9PSklwUXBRVmNHZC9GTmZMU0FqTFZ1WVd1dzhKYVJPNTVsUHZT?=
 =?utf-8?B?RnJ0MFNSZUhlcGU0NzV1WlMrQ1JJc3JTNGR3aUNTN0NPdUdBWWl0L012bnR2?=
 =?utf-8?B?bktPOU9JWkJ0NDlnN05ZS2gxQlE4R1FnZmdYKzg3NnBJRThNbXgyekc1OERB?=
 =?utf-8?B?dVV2bjVpTlowTS92ZFpmeHIzWUVwbk5Cc1JXTFJhU1VOK0FWa1FRUGp3aG8r?=
 =?utf-8?B?QzVhbDRuQ1JDVFZTK1Yzd2VqVVI2bnhzYkxkMlIvTTFoUlNpNkZNYzU3bmht?=
 =?utf-8?B?dE1rYUJZZmcyL2Q3SG9yNVF0QjdWOEc0bDc1eXkyVXZncGxTSjQycnJSeXhM?=
 =?utf-8?B?UUJCaVZEaGRLR0FWVkc3ek5iUGpMbGpVVmIrUzNVUEUxdG1BTzExdEVNTkMx?=
 =?utf-8?B?YmtidExQZ1I1eUlLV21RR3VsYk9TakwxRE1oMm5DRHR1cWRkalcwcHpTTkRk?=
 =?utf-8?B?dzJWQVJsRXkyRGxYbmZQaHc5djRsbTJnWHdhNk5rZE1GWDE4UTRta0toM05l?=
 =?utf-8?B?cTNiUzdmL2JpbVRrZFRrODI4aTVWQk5TeEdGSW5qYmQvRVZPZm95OUJKZTg5?=
 =?utf-8?B?VkYxOVdLVEw0VTFNeENidHp3MERCT3JaL081TElJdDh5bTZzVFpSMENtVDFr?=
 =?utf-8?B?dDhVTnFreXV1UFczdnZ6aFlMVDFtd1RYTE9JQ2pYZnB0WDF6MDluams5WGZl?=
 =?utf-8?B?Sm80SUdFeXdjK25jaVNVQ1dKMUUrWXNwc2pheElUY2JxWE1LdjkvNW92SjJE?=
 =?utf-8?B?aUpZQ3RiQzVCRXR3cEpVYWVPaUdmeUlIS0xoM20ySkhEa1cvVzk2QmdwWXY5?=
 =?utf-8?B?RkY2SWRGYm9Tc3kvSlNlbEpGRXhQUkFaY0RVQitSSnFlejcwTkRBSmxkeWNZ?=
 =?utf-8?B?OVVGVWtqYXNpRGltS0RUZHY0SjhHUEd6U0pWclA2STVzbllNZHRoNWw2cXly?=
 =?utf-8?B?YlpXNGdDbE5BUlU1Mm4zakxkSEN6Q01jUFRYYmYrbTZxbzBXLy9rV0dwam9X?=
 =?utf-8?B?OHU3WmRmZFQyQ1BYN3pSSW1iaUdaclMyOWRNRndVNnZyZUxFMkx0NDF0R25z?=
 =?utf-8?B?MHVwcUpMTU5RVHhoTk1uVXZvcjVRMytFWXRsNVN5d2xwSytWd2dSRVJNTEtK?=
 =?utf-8?B?THdTQUlIeGR2TGxzN2ViTXVrQ3NoV00rWlRnWjhPRjJzQWNaTjF2UT09?=
X-Exchange-RoutingPolicyChecked: i4vO5scE98QGNduNdU6UvHSaYSNeAWx1x/2zmo2GpGCLXEYyYRORPTGSEaqtoz+VBwXcYG+2jGkk/gMIgbNTBZY94Ij1y1i/JlQ3YpUYEQ/MMdtFkOCx3JWFzgGxlrHNWVRS/gi9aBuG0GVcgu+4bx/+N/HXAf64Oqi/NCt7oF1j+3lEJTmoIG49aLxSTh6u6U9W1wTsHrEcWuMNkiD5gqNv2ZP/fVKTmDjgsSskUfGBWaoHSFGMbl9x5EtBLGMfacwsGdq9/5/XSLIXDR5IzFZHp86XKozQ8I+1kdkvDXY6nFDV3z7TNqExRD1sahs/02YyUcA6kSt5IjmaNz5iVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf18172-2b1f-4c7b-1f82-08de9f6d13e4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 06:13:17.6628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ig+kGKyEZqlIO7aeZowoIlyQlIHQquoeBSE9wkC/aef1y5dXe0tBbu/zrgCXKjslKhLks6/Ck1mQvIXBH8MaOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5783
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

Hi Jing-Ping,

On 4/21/2026 7:37 AM, Jing-Ping Jan wrote:
> Hi Kamil,
> On Tue, Apr 21, 2026 at 2:16 AM Kamil Konieczny
> <kamil.konieczny@linux.intel.com> wrote:
>> Hi Jing-Ping,
>> On 2026-04-20 at 15:49:25 +0800, Jing-Ping Jan wrote:
>>> Based on the original implementation and the comment above the function,
>>> it appears the expected behavior is for the plane indices to remain
>>> consistent with those in crtc->planes. Therefore, after swapping the old
>>> and new primary planes, we must update the index in igt_plane_t to
>>> ensure it matches the corresponding index in crtc->planes.
>>>
>>> Therefore, we should expect the indices of the old and new primary
>>> planes to remain unchanged after swapping them.
>>>
>>> Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
>>> ---
>>>   lib/igt_kms.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>>> index bec96f267..405a04640 100644
>>> --- a/lib/igt_kms.c
>>> +++ b/lib/igt_kms.c
>>> @@ -2982,8 +2982,8 @@ void igt_display_reset_outputs(igt_display_t *display)
>>>                                igt_swap(*old_primary, *new_primary);
>>>                                igt_swap(old_primary->index, new_primary->index);
>>>
>>> -                             igt_assert_neq(old_primary->index, 0);
>>> -                             igt_assert_eq(new_primary->index, 0);
>>> +                             igt_assert_eq(old_primary->index, 0);
>>> +                             igt_assert_neq(new_primary->index, 0);
>> Do you have an error report for this? This code is lib
>> and should also trigger in Intel CI, unless it is a dead
>> code.
>>
>> +cc Karthik, Swati, and J-P
>>
>> Regards,
>> Kamil
>>
>>>                        } else {
>>>                                igt_assert(old_primary == new_primary);
>>>
>>> --
>>> 2.54.0.rc1.513.gad8abe7a5a-goog
>>>
> I do not have a specific error report available at this time. This
> change is based on an issue we encountered and the existing comment in
> the code, which indicates that plane indices should remain consistent
> with those in crtc->planes after a swap.
>
> Regarding the lack of Intel CI hits, I suspect the bug depends on the
> primary plane not being the first plane in the driver's index. CI
> likely hasn't encountered this because it doesn't test this specific
> plane ordering.
>
> Please see the following output from our testing:
>
> (kms_getfb:20359) INFO: IGT-Version: IGT_VERSION-GIT (arm64) (Linux:
> 6.6.118-android15-8-g34da635f9b82-ab14801981-4k aarch64)
> (kms_getfb:20359) INFO: Using IGT_SRANDOM=1771906178 for randomisation
> (kms_getfb:20359) INFO: Opened device: /dev/dri/card0
> (kms_getfb:20359) DEBUG: Test requirement passed: !(fd<0)
> (kms_getfb:20359) DEBUG: Test requirement passed: has_getfb_iface(fd)
> (kms_getfb:20359) DEBUG: display: init {
> (kms_getfb:20359) DEBUG: Test requirement passed:
> igt_has_drm_cap(drm_fd, DRM_CAP_VBLANK_HIGH_CRTC)
> (kms_getfb:20359) DEBUG: Test requirement passed:
> resources->count_crtcs <= IGT_MAX_PIPES
> (kms_getfb:20359) DEBUG: display:     DSI-1: Selecting pipe None
> (kms_getfb:20359) DEBUG: display:     DSI-2: Selecting pipe None
> (kms_getfb:20359) DEBUG: display:     DP-1: Selecting pipe None
> (kms_getfb:20359) DEBUG: display:     DP-1: Selecting pipe None
> (kms_getfb:20359) DEBUG: Test requirement passed: !(pipe >=
> igt_display_n_crtcs(display) || !igt_crtc_for_pipe(display,
> pipe)->valid)
> (kms_getfb:20359) DEBUG: Test requirement passed: !(pipe >=
> igt_display_n_crtcs(display) || !igt_crtc_for_pipe(display,
> pipe)->valid)
> (kms_getfb:20359) DEBUG: igt_create_fb_with_bo_size(width=2152,
> height=2076, format=XR24(0x34325258), modifier=0x0, size=0)
> (kms_getfb:20359) DEBUG: igt_create_fb_with_bo_size(handle=1, pitch=8640)
> (kms_getfb:20359) DEBUG: Test requirement passed: igt_has_fb_modifiers(fd)
> (kms_getfb:20359) DEBUG: Test requirement passed:
> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
> (kms_getfb:20359) DEBUG: Test requirement passed: !(pipe >=
> igt_display_n_crtcs(display) || !igt_crtc_for_pipe(display,
> pipe)->valid)
> (kms_getfb:20359) DEBUG: Test requirement passed: !(pipe >=
> igt_display_n_crtcs(display) || !igt_crtc_for_pipe(display,
> pipe)->valid)
> (kms_getfb:20359) DEBUG: igt_create_fb_with_bo_size(width=1080,
> height=2364, format=XR24(0x34325258), modifier=0x0, size=0)
> (kms_getfb:20359) DEBUG: igt_create_fb_with_bo_size(handle=1, pitch=4352)
> (kms_getfb:20359) DEBUG: Test requirement passed: igt_has_fb_modifiers(fd)
> (kms_getfb:20359) DEBUG: Test requirement passed:
> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
> (kms_getfb:20359) CRITICAL: Test assertion failure function
> igt_display_reset_outputs, file
> external/igt-gpu-tools/lib/igt_kms.c:2985:
> (kms_getfb:20359) CRITICAL: Failed assertion: old_primary->index != 0
> (kms_getfb:20359) CRITICAL: error: 0 == 0
> (kms_getfb:20359) INFO: Stack trace: not implemented

This change LGTM, thanks for the fix.  Looks to be a miss in the 
previous update. Please add fixes tag.

Fixes: ac37e1174cc4 ("lib/kms: Pimp the primary plane swapping")

With this,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> Regards,
> Jing-Ping Jan
