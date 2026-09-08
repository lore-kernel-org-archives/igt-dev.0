Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8426C79F82
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 17:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696A010E5C2;
	Tue,  8 Sep 2026 17:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0KweAjgn";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013031.outbound.protection.outlook.com
 [40.107.201.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B624E10E530
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 17:34:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGr9uX0lRSbwCnkasEUtSKAk9xemzd7gXYdfzI3E3vJAu0PNK/Hi+oYvckgE3Tb4ZXuk//RStgwYdESnvdQzJ303T9wRYlw/tBaptaQ1gckWcQWsHXOFEpxaqdfn74eMrf1gj98X410ez3pBkA4xRh5xTTLxqMogHhMBBE9Ts+b4HPZiB/Zndb2KQqpF3iWLF84ulxockW/PPEgTawFt2JwOAJL+kCEBZbFouOoin/XGgSox6MwrDQKyk66QW59i6rED2tsXo3I7ShtnFS5MnpjSUQ5VPvVl0ekL2SKgu5JSJiKbLR4qiiX168Hro2Lfv7guRCJ40eDimVWnzAoPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNJ7mcPXxmUwwBj6YUzjST8ne94SAMs7CSscilg0tyA=;
 b=mAvrJRLk3mZOSdKxLGyxJNrmtV83G6K5XTXKmx21bR9iySXKaFj6R0Kg5cOTeoWBoMgpP2iDzae54bupMDpaPbP5ZgUTsviUiu3IRONR1uGbQ36tmRmCpTu3uVLM6rb+buIRgJ9L+IphOWTmwG+M4KzdHyrTbQ5XGPrV4KrQtLG6Y4Qvs6Pn5oMG1JO3P3bhNCgPK7yEGwT5KNF4eHPJ9kUzgP/toejQQuWTJsaoAKnuqerFW9VJRC+cbJ+szHQXX9RUiu5QZybhrmTFnG+kbhXBHN08liieS22TNg5wj/fAipb61eVuyZPu0fIx0AXC4ZMkUIw0qeTuLXYPrUTHLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNJ7mcPXxmUwwBj6YUzjST8ne94SAMs7CSscilg0tyA=;
 b=0KweAjgn3UvxvcX4fu9kt+0sJcmlvrFTMHb5STsFBbEAGslpsLX1pNg4wlBxyggiQieByvOrIrb+PDLSYwrBL5Syktp2TmHPjJpuPKzxu8MY4mY97GQM1UHT03wp38tXWDPkEs0zh/JNs6gvbTrF5cpOGnLAIIqemmAmpuUwLkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by CY8PR12MB7289.namprd12.prod.outlook.com (2603:10b6:930:56::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 17:34:47 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 17:34:46 +0000
Content-Type: multipart/alternative;
 boundary="------------O6iATs9D4EJySbI9kX0apPhL"
Message-ID: <12110712-7775-44ad-90d1-e01b9288ab3c@amd.com>
Date: Tue, 8 Sep 2026 13:34:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] Add GEM_CHANGE_HANDLE test
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
Cc: simona@ffwll.ch, kamil.konieczny@linux.intel.com,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 sebastian.brzezinka@intel.com, "Francis, David" <David.Francis@amd.com>
References: <cover.1788309579.git.vitaly.prosyak@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <cover.1788309579.git.vitaly.prosyak@amd.com>
X-ClientProxiedBy: YT4PR01CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::12) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|CY8PR12MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad2652d-f8dc-4dfd-7563-08df0dcf7990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|10067099003|56012099006|11063799006|22082099003|8096899003|18002099003;
X-Microsoft-Antispam-Message-Info: wGzSaAsspij7izRp22Zy/XnkTLcKEcObIkWS4ORj+4j2ctpLS6RF/AmrIM6ZJEZZwmxKlKOiBMi4lJbkah1kTwUExjCOCEIkU+joG5flFCtc7hNi4hHnEDZCl3YkszeB0CPm1sn33JdT9vUFRayNcekgn1sWDu9rWzUp1jn2FxsKf+BHcycHtgjy70sIeEb9t3yXYWWkPf8Xc8rtmxdlcCQF8ibnyLzgW/N7uTFjahAB9QBJmtAmb0M9riVmchMDD7Yob/dGzCH3khxXmIa3/ALcvy09N8uaAnmzkBbmZOI0DJQmsbqxdTst+Aql4Wl1eUaR7LioAmE+NOMs0myqh6BId3CCfTNeg19kP2Pt5QvKiaMFRt/lHW8OPLpV7JFG8ymow0wiJ2ggnDtejjqbnjUr3IdGKSlKckEuTM9S7ohkhMl8uLR2KJQYlAJJnHgEpb0f1VUbXr3xdDyMAHYBJsXD5NQOIi7gzlfAYpv7ddU7/MMrVTgrfjckuteiSx57U7YN40MgZeOx8/EJaQCNvpqYlBwlbbklN/b3t0x8KUhjQ5nG5poWzFbfD3vzyb4ojciAjlXfzBh5jxumTPEcbFblVlx9H8bTgv62VcuV0u7vrA9xEs+5ezFLX1TjZPHJ5n3S7RdUUVlg950RjF2QXRAJw9+c8cMsArwmxaAB0ls=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(8096899003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0NyYTlDWjFVQThNVDBtOWhUREVUSkRvOVI5WFc1ciszQ2FWekNTekxxUnVs?=
 =?utf-8?B?akhWREcycXZ2bGNTZm9uUEttWWZDS3R5blJNb2wyUVlLUmpad3hIOFlITVgr?=
 =?utf-8?B?UE53V0V1ditYb2pUV0VPN1c4ZkFYb2xQajFCRXgvb21vSWxRL2diWml6VE1U?=
 =?utf-8?B?dkxHeFUyTE8yZDlZOWl4RzZhbVNCTUJmQzZOa2FMVlF6TWZHZTlteUZGc1dp?=
 =?utf-8?B?ZUxyWHJneUFFdEJPTFI1WGxjWmRWeFJORU5uWUszeEsvdkNSZVc2L0NYSXNQ?=
 =?utf-8?B?UUN2NWV6RW1MSkJOWTZIdTRwRmhJbzNYMG9zR3Juakg0Q21IYk5IcXpyYTJH?=
 =?utf-8?B?OWlUa25oT0lmdkpiTUhMS05ROXovK0NnUnhpazByTE9NS0RJMFF4QndIVkhJ?=
 =?utf-8?B?Z1ZFMUJKbkNleGEvc1ZCaU5xZGZsS0R4bkJVTHkzMVV3dVRVVm9XMkh1ZGNp?=
 =?utf-8?B?SStGSjFqRUdpY1JJWERGTHNUTlNLcktlRk5kZ3VtclFJOTRUMkJKRDlkR28w?=
 =?utf-8?B?YVJGWDJnNEUrSTdObU5EMFVaOVlBcStXNzFJeVk4MHJzSlVDNXpZRk56dE9l?=
 =?utf-8?B?c0ZPQWZBTlR2UWZyYytURE9Kc1MyckFvMk50K2tpQng0V1Y2V1FNNmFhL2dt?=
 =?utf-8?B?YytPNUxzcXN6aHNEUDNoT3h5djdzb2VzUVQ2eHVXNWZlbjN5Q1hNVnZneVV2?=
 =?utf-8?B?eXRORGJMLzlhdnoyZGJEZWp3Si9Tb29jbVlTNWFFYzBNNWttMUJxVmxaSzJu?=
 =?utf-8?B?eTJkOWVCbStsNkxwRHFSeGhmZzN2cktXZkFXeUc5b1h2RzNBSWIralluTTFy?=
 =?utf-8?B?aDJqeGZNbXJqVWxiZ2J4VHV4RVNKdWVnV0ZrMTR2NW9KVHVTSUE0K3d4V1ZF?=
 =?utf-8?B?eXF5eWZiRXhHVm5RM0o2OFpBRk00OTAzMVdpc0ZhWW1Ldng3RmM5TDhvaTBq?=
 =?utf-8?B?NXJTckJMWVZBMjZuKzhydHdlQUMxcWRBV0tvb3Q0MXdVdGxxV1RCcGZYVFVu?=
 =?utf-8?B?S0NXbTdkczZaY0NKc08xNFEzYXc1NyswSnNLMys2eGFSMDZKcVJhUjlFWE5Q?=
 =?utf-8?B?OXVDLzRqUk9xQThXb3F5SGs1aDhXd2Z6dWZ6aDlBV2VITU9icWVmT2g4Wk13?=
 =?utf-8?B?M0lLYVlaUDBXSXRlcVVDbmthb051SDZiU0x3bWkrTWxJUXJ4d3lWOFoyNmlC?=
 =?utf-8?B?MkhobEhEMElxYWFESlR6WXZFSkp4RFIvWDVLem1zM0NVOXdBYmZzOXVpenBN?=
 =?utf-8?B?bUV6bFg1TDV2TE05cTY2VEhsNlZJVW03amZZK0NmaGJuZ0Q0ZVJjcVVhYzVZ?=
 =?utf-8?B?d1JDVW1wcFlqOE8veFhYcXAxZWdLRWpzQzRnUzIrQlhGdEdZZGhXU3N6aHgz?=
 =?utf-8?B?U1E5a1dxalI5WW5KSldLN2IxRmVDV3hyalhuVzlUSUJWcUlRRzhqNG8yNkQ5?=
 =?utf-8?B?aEJ5MFB4Q2ZBaWpmUThyTUx4b3NlY1BhT3ZTUUxEZ3RNeEFEU3hFRUJSVUo3?=
 =?utf-8?B?aW1DT2xTZUVPMHF4cVhBRnhrR0dnUkF1M0RoQnZ0NmVPZ2ROSnJKZys3VEVW?=
 =?utf-8?B?UGNKaFJTakR3S1NRNWtIWG5PUXkzRlBrYTNRQzRYaDd2ZFc1YWZhaHhtQnp0?=
 =?utf-8?B?K09IczdiYk1wWElqWmlmMXNuR0N3bHVMbjBuZzluaitGTStoclJrVVZaR3Aw?=
 =?utf-8?B?MjVyS1RTVzhnYWJyc2paT1VlSDhIM1hoOWlHcHpuTlhKK3hMUDcyVEIyeUxS?=
 =?utf-8?B?VGlvZ2x2ek1nSVRCODlNN2l4OGdqSnhVRERCQjA1ZG5QR3pFQjF4dCtkSFZr?=
 =?utf-8?B?bThUYmhFd1dIV21HbXJzK1dUU0xxTWJCMDRsczhmM3c5ZE80K0Y1SmlxMGYz?=
 =?utf-8?B?TjFYa3RkOHl4MzdCMkpHZ1RsbGc0b3BTK3QyVXJ1N0FNQm9LdDVTbzlQenZ4?=
 =?utf-8?B?eXZPc2ZRUFdVS1poMTY3Z1k1b1BhM3l3ODM0Z3owZFJGbVV5QnZxMDd6WCtP?=
 =?utf-8?B?MlRBTUd3RHI2KzNjUVg5K0VNeGNwdUdaVW10Q1M2VE52TDR5SWFtdkZKbkw4?=
 =?utf-8?B?LytWeFRZS1Z2ZFhGRmplNkNkU2ZhLzdBemVZdnY1blJmY1ZDZHBvRnFuVGR1?=
 =?utf-8?B?Nk51aEpsUG9aeWh4OHdTTXorQ0lreE41MkZib2dONDJKL2IxaFZxZEI4VXdJ?=
 =?utf-8?B?YWwzcVE1eVdSYThGY1l3V21WdUE4OWlVejdKeDhWQmREVmdPVnN6dVo1Nzk4?=
 =?utf-8?B?blRnYWFRdXF6alVJTGU1SzczWkxPQ1dZQlFVdWJSSzVkVUhMcVE2cFBURzZW?=
 =?utf-8?B?ZkJSNTdVQjJnQUJVZXdkeXJPeFVFQ1EvdTA5UURmWFl5eHBvTEVQdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad2652d-f8dc-4dfd-7563-08df0dcf7990
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:34:46.6564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxpnLuJtXv2VjP2sytBe+TbHyyVYxHC04tz/3Llo1wVu7PNm0FeYDAXlYHGR644a36qFtGyl+91Y7UdcnKcUKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7289
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

--------------O6iATs9D4EJySbI9kX0apPhL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kamil and Sebastian,
Just a gentle reminder to review the latest updates, as all feedback from v6 has now been addressed. 
Thanks, Vitaly


On 2026-09-01 21:03, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> This series adds concurrency, edge-case, and functional coverage so
> GEM_CHANGE_HANDLE behavior can be validated across lifetime races,
> address-space diversity, and boundary inputs before kernel-side enablement.
>
> The ioctl is disabled for security reasons, but it also lacked a systematic
> IGT testing process for corner cases and races.
>
> To re-enable it:
>
> 1. Land working IGT tests for the corner cases and races; this series
>    addresses that request.
> 2. Handle `idr_preload` in the kernel and kernel-internal tests; this does
>    not belong in IGT.
> 3. Define and validate `handle == 0` semantics; this series adds the
>    corresponding IGT coverage.
> 4. Define and validate `handle == new_handle` semantics; this series adds
>    the corresponding IGT coverage.
>
> Requirement-to-subtest mapping:
>
> * Requirement 1 (corner cases and races): race-change-vs-close,
>   race-change-vs-change, race-change-vs-prime,
>   race-aggressive-change-vs-close, race-exploit-single-thread,
>   race-exploit-random-handles, race-close-before-lock, object invalid race
>   to random offsets, set/get race for random handles, all vmas race to
>   random offsets, all ppgtt race to random offsets, and all objects race to
>   random offsets.
> * Requirement 2 (`idr_preload`): this is kernel/internal work and has no IGT
>   subtest in this series.
> * Requirement 3 (`handle == 0` semantics): invalid-object/invalid-input
>   coverage in this series, including object invalid race to random offsets.
> * Requirement 4 (`handle == new_handle` semantics): same-handle/no-op and
>   functional rename coverage in this series, including set/get race for
>   random handles.
>
> Review feedback addressed:
>
> * Kamil feedback: patch-by-patch buildability is maintained.
> * Sebastian feedback: GEM_CHANGE_HANDLE is currently wired to
>   drm_invalid_op; prerequisite IGT coverage is provided before kernel-side
>   enablement.
> * dmesg precondition: require_dmesg_access() prevents dmesg-based validation
>   without access.
> * arm64 portability: the sched_yield path avoids the x86-only pause mnemonic
>   issue.
> * checkpatch cleanup status: style cleanups were applied; known
>   volatile-related warnings remain.
>
--------------O6iATs9D4EJySbI9kX0apPhL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAICBAB" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Hi
      Kamil and Sebastian,</div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAICBAC" data-complete="true" aria-owns="action-menu-parent-container" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Just
      a gentle reminder to review the latest updates, as all feedback
      from v6 has now been addressed.&nbsp;</div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAICBAC" data-complete="true" aria-owns="action-menu-parent-container" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Thanks,
      Vitaly</div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAICBAC" data-complete="true" aria-owns="action-menu-parent-container" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);"><br>
    </div>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026-09-01 21:03,
      <a class="moz-txt-link-abbreviated" href="mailto:vitaly.prosyak@amd.com">vitaly.prosyak@amd.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:cover.1788309579.git.vitaly.prosyak@amd.com">
      <pre wrap="" class="moz-quote-pre">From: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>

This series adds concurrency, edge-case, and functional coverage so
GEM_CHANGE_HANDLE behavior can be validated across lifetime races,
address-space diversity, and boundary inputs before kernel-side enablement.

The ioctl is disabled for security reasons, but it also lacked a systematic
IGT testing process for corner cases and races.

To re-enable it:

1. Land working IGT tests for the corner cases and races; this series
   addresses that request.
2. Handle `idr_preload` in the kernel and kernel-internal tests; this does
   not belong in IGT.
3. Define and validate `handle == 0` semantics; this series adds the
   corresponding IGT coverage.
4. Define and validate `handle == new_handle` semantics; this series adds
   the corresponding IGT coverage.

Requirement-to-subtest mapping:

* Requirement 1 (corner cases and races): race-change-vs-close,
  race-change-vs-change, race-change-vs-prime,
  race-aggressive-change-vs-close, race-exploit-single-thread,
  race-exploit-random-handles, race-close-before-lock, object invalid race
  to random offsets, set/get race for random handles, all vmas race to
  random offsets, all ppgtt race to random offsets, and all objects race to
  random offsets.
* Requirement 2 (`idr_preload`): this is kernel/internal work and has no IGT
  subtest in this series.
* Requirement 3 (`handle == 0` semantics): invalid-object/invalid-input
  coverage in this series, including object invalid race to random offsets.
* Requirement 4 (`handle == new_handle` semantics): same-handle/no-op and
  functional rename coverage in this series, including set/get race for
  random handles.

Review feedback addressed:

* Kamil feedback: patch-by-patch buildability is maintained.
* Sebastian feedback: GEM_CHANGE_HANDLE is currently wired to
  drm_invalid_op; prerequisite IGT coverage is provided before kernel-side
  enablement.
* dmesg precondition: require_dmesg_access() prevents dmesg-based validation
  without access.
* arm64 portability: the sched_yield path avoids the x86-only pause mnemonic
  issue.
* checkpatch cleanup status: style cleanups were applied; known
  volatile-related warnings remain.

</pre>
    </blockquote>
  </body>
</html>

--------------O6iATs9D4EJySbI9kX0apPhL--
