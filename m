Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69463CD98E1
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 23:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E9F10E29E;
	Tue, 16 Jun 2026 23:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZL1yvja7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7086610E29E
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 23:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781651394; x=1813187394;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HW2bELfreR7PQCSHZU5X3ijT1kwB6+JinREtLCXCF7U=;
 b=ZL1yvja79GZDb9GDKUGvhsA2JtDeBTYntfKqgIOB/+KN0beZoyH4O+UQ
 aPUrRTmU+DazXcWwFTaETx9ndzA5RtUpMxTHtO+1GcrNyevyGoKaES7hF
 P8X/ewKGwphvgnhCwY2Z0pJE6rnQ8OEmnG8JQZJdSNkNdwr/L4d8HMA9u
 l917D7eiK2pnOo04+iKnlBgT6q+nCwTwsWHkHg3VPG4U2tygWwlPbb3+D
 LoRIwI0cqCXNrzX323hrhbuq09TRAALJHmQL3pSe+ty2Z0uifcx3xAVZv
 p809JE/ZWjFzYCiOT4zrHVDI2u7xATFz7kN3P+DLx33ezARi6N0Zr8xZC A==;
X-CSE-ConnectionGUID: 3annibvHTwWeYIcLZsAibA==
X-CSE-MsgGUID: SEPfaaR1RuaQe0D4oRZIGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93553969"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="93553969"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 16:09:54 -0700
X-CSE-ConnectionGUID: L8KvBUsPTpCKzE9NH1IbBg==
X-CSE-MsgGUID: fqP4sFM8SYqTdvXQ1nFZMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247781787"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 16:09:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:09:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 16:09:52 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:09:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luD64IDsecl8mVKR3l6WlZVE0kKbYg9gnD0chhroXLtx1yrJrKXcZYV0RFzVEXFLXMxA40OyFjwjbDmQpOKYuz7ENWsSOA+jWFx/hnq9QWcMMrcFa6xWmTX+hztp4A5QBnQGejCHZ7+/d4bsUdexTuFKbPgap4h3XZ0+mBLPOBuSb/3wEw0CJYsYbZJpJyNbcXjV43qJhC4kpl+QhTbKoJtmyj16peBPTAYm+KTEEHS3kJhxWQXgu0HWwIuSVs2AskALXIpk8ivTo1FUd2XLeg829Y73uSzLXft8UKmTsZYKBmzg+odrnlh4BV92rRjh5wDNFrlAcgjX5PYHrBMcIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHRyBGLiN85r2U/y8UFFiPWv4eAn2ia0lOShJfSQ72s=;
 b=vzE6MUcQVSPoLdW2oiCmx2KiDOXTvVjR1CJ2RWzOE+T218pYrqHOtlQ7V6JYIR4qeMMLhL+qwR6Kmkte8X1xV4E9kMT/KBCka8IqAelUb1PfAHqSzf2QfTUQ1uqI9UVxBJpvoG5OeHq+1d8x8Wl9JClaRchgOpLquwCmdCiJK6La7sjtAVUXL5tT50XUOp5Ors0jInPVEsCuqsI7fonfLEQdWRXeMzEg4+qhILPrGsgildAhOcd0NTckp1HW9/KGcB8c66gFGYlIpL6yMABSDGQ9uithKw9v6+cQR109CIzGxPCU1WbsKQcNIqE8DK8jmzI8caXD8m1H8m4v+xj6GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM6PR11MB4739.namprd11.prod.outlook.com (2603:10b6:5:2a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 23:09:50 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 23:09:50 +0000
Date: Tue, 16 Jun 2026 16:09:47 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_oa: Fix checks for whitlisted oa
 registers
Message-ID: <ajHXu2syIXVyboh9@soc-5CG1426VCC.clients.intel.com>
References: <20260616020120.46894-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260616020120.46894-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0107.namprd04.prod.outlook.com
 (2603:10b6:303:83::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM6PR11MB4739:EE_
X-MS-Office365-Filtering-Correlation-Id: 25285d75-7d67-4857-2ae6-08decbfc5de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: ThsImWzIS0WV9YjIhcU3XuyRA4FcF21cHqfi32faCtdrxbFivDAThZL4WOcDqvAMelJL1NP8viTixZu+5KLj40cverwhEbe2PUTE7h2RakKzMjr03KHFNHU1rkYaV7jHOQoKB4GMgx6R5xOSZ/vK0dvJV4Jqm+vKL8E3tk6exo6gvCH1Rm4kzGtxqiyqW2QG5AMAZgN4X8Uds6rdi5MiqJ2+BeW7zrHUpRSfpi6v3HpbE6OGcDQNJwAxj03Cz1Dap8+i/yUOzs0GIlWfINWjuQzrSPfqkxSGI9nSEAAwRXTtpKZPKRXsRl1ML5raMgxFUIzTME6Zp1a+MT17uNMZX78z+f7piUjxa3p0F/nMws78imhzba0UIf8+HN8eDcyMjEa0ENWAxfdlseI9vUdl3ffSzqf1LsSaKxtnoTjyNaNDkwFtWVEzPSqGQjrsuICzxrkUayoYnoI2kQVHMHOobey7x/VykxUQeTn4Q9+fEWgOwWpCA3PNzLlUWx/5ZvJWcYzXLpplSBYhrHZ8fQ8wmROCxynHXijTp415QQFSDD30MALHJSRFUUascK6sqR4TzXLzwEQUE/v/FziG6TR99sH5Gbg4MA7YvHCP8PqdNv0VjEPrBOZQiNnAPvDIiYKqw6YvTAGXBAYsVDcvFkuN3OfL3fz/xo5nH3i4vB4SgLNlbVrD1/nH5omfU5LtOTs4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWdtYk8wYVVVK01YMTl0NHNwd0p2WXRuMXFGTHNLSUJuLzBxWHlaZWJXNDU3?=
 =?utf-8?B?SFJsRExIV29VMlI4N2hpUE41K244T3JaOWJ4M29EU3VLcEpLc0tFVytWbHRo?=
 =?utf-8?B?NlM4UU5QYmpRQThsY3cwQTJjN0RaclRSb1V0aC8yRjJBeDk5YXo5L01SV3ox?=
 =?utf-8?B?UXVrZWVFNDJPbWF5Z2swWCtWSzA0a2pPSTM5cnQwTS82TmlxcTFaZWtpV3N0?=
 =?utf-8?B?MjFGOUFwdGYvMDJ1d3JzWm5FaVQ5WGxzSitrTG1qUVZnbWd0NklzTDJLK3RK?=
 =?utf-8?B?VUtNZ2JQME1WMmxHcnNpUUVlaDZDcTdPSnRPY2pIdjFORDRhYVFNSU9xTFJT?=
 =?utf-8?B?dll2ODM5K1FtbDVjS1lZVEt6azhyUmY4OXQ4WW5kZHRxT3hBOUNMQkI5UU9T?=
 =?utf-8?B?eTVjcUJNd09JcVNabDBIWUFBYi9IaEpUWnhRaUlWVlBYL0J2NTgvRy9pT1BI?=
 =?utf-8?B?QTcrYk1IWktZWEI2c2srRDhEc3Z5d3RPU09HVCtFc3BPQzU5WUVqd2xSa2NY?=
 =?utf-8?B?NFhRdjhRZkkrZHFwcHE0WGFlYUVFSlA0akR5RWV6azZNSXVuV1A3bVpzajE3?=
 =?utf-8?B?WCtvZUxFNEluVlNhamdybXJUQVF6bkRXQ2NUdXd4dzl4M0JBN3BOU1IxYjJ1?=
 =?utf-8?B?K1dtTzdxN1JZNTI2NkU0SWdiM1BEM0FsM2UrZmg4K25TQzRUbm5JcTVCRWR5?=
 =?utf-8?B?ZTY4REFiTnNIMnZQQlVQQVlUclplT2ZvMUl3T3NMZlNrSnNBVmJQcG8xZ0Mw?=
 =?utf-8?B?eldSQkNyQ29DVW5TTmdYcVRtN2JEZVA1c3JtWUJBV2RsdzVrWEZqc3ZYRmVq?=
 =?utf-8?B?bjF5UmRKU0ZMaEM2dGl4RUJJR3hJUlhEeVI2ZjI3NnpaMVExU3duU0s0WU1O?=
 =?utf-8?B?dHR1VHh5TGpBQnkyUG1GUzUzSmQ1VmJJOE1GZDdpTExOdGdvbHBuK0RuQyti?=
 =?utf-8?B?VFI3dzBsVE1jUjRuWTNZS2s4SEp6cVdwZm9ZaGVyb0ZOTUkzejJNaFQvSTk5?=
 =?utf-8?B?TlN6QkRWRUI3WTV5SkFZZThjYUVuZFd5N0twL3Q5K0lWR0Q1ZVI3Um5oeDNC?=
 =?utf-8?B?T0FaR0h6WjRSNlVNenpwUk9oM0Z3WmxlUjBuQmdoRFlpZ3ZMSzJBU1ROTWJD?=
 =?utf-8?B?eFdmYmt0dmhBd2xKclRUUVVyVjU0TjFCOXlaSGdheTd0RDNERzNSNTQ2aEVY?=
 =?utf-8?B?NkZoNlMweVMva0tXM3RBQTJ3VnZuajFFRnZFR0pNSjk3Y1AwZEtjM2Vkcldk?=
 =?utf-8?B?NHd6dGZKcURuS1p5a0tzSzZYdjZaM2ZmN3F3SmtXSjkrbkdVUGJWUFFYMWJD?=
 =?utf-8?B?bnR5RFJQS082bnI5NnMreXRRQVlxS0VJUk5Dcyswb0JWTFNmWlZMSU92YXRP?=
 =?utf-8?B?S2lZRGRlMXoyQnN1UStyalFKVmRxcXhHUGNIYzNVZU5RNUo5YnlPVkI4TlFO?=
 =?utf-8?B?VXVwbVBIU2wwN2d5US84NGVITXpNL3lIL3JNaVlmK2tyRzNUQjdZS2o0a29x?=
 =?utf-8?B?ZXhKQ0Y3NDZ2WEJva3IzWUxtdXdHNVQ5YlZrQldDTytGRG02NTAvNW1RaC9U?=
 =?utf-8?B?b3R4Qkw3R0U0QTRqZk42eURYLzBOU0o5eFk5TXBzeXZIYW13aW1meERIWUxr?=
 =?utf-8?B?cDJJa1cwNTNkczlJbGI1MTlCMDVsaklKSC9IclVrbTZjRE5tWndXdUFKWDRI?=
 =?utf-8?B?QlNGM1RsTlM2Z1VJVVVHVjU1cEo5S1dEU2NXdUNuOVkvSG5IcGhWYzFMaktV?=
 =?utf-8?B?bS9QQ1p2QVYyaTZEYmZ2RzR1Snp4OEtRU3lIU2s3MGtrYnFCNHM3M21FT240?=
 =?utf-8?B?TVJlRURieWRxVGRqaEc5Q21mMFZ5V0lzN0Y5d3VHeVBPcFJ4ODM5QlR6L1hE?=
 =?utf-8?B?RnpnaWNucnlnTWtjdUZvUmlHckRzVTkza0Npd2lvd0NOaEY2N1puSFh1RkMx?=
 =?utf-8?B?SmlrTTdJS2JBR1F4Y1ZBMU1xU256emZPNkpIR0VHNW56dUJHZWpLL2lidUFn?=
 =?utf-8?B?ZStUK0txRzdCUnFCa04zY3RKbnRpOE5yMklEblNyT1dJRFJ2TkJqMGluVFZ2?=
 =?utf-8?B?TVNBMGp5d0VxTkphUGJYRlFvMzFJaVZSenFLVVVObDVWUTFGTnNEaXcraHZv?=
 =?utf-8?B?dXRTV1E2bUFxLzQwKzA0QkVSRlEwWlhTN0xxVVdxa29SVEtmbm51WEhBckxu?=
 =?utf-8?B?di9PUEFqNjlFVHM1d1VpczRxUS9MbFBHOU5sWjJRQkR2VFdiVGtDSXhVaXZL?=
 =?utf-8?B?K1REelIwTnp5MWcwci9yQWpWR2JZQVFmZFZ3Vzh4ZkVLTzU1TktGTmVHMUI5?=
 =?utf-8?B?RHVkbjVVcENDRndaMHBRcmZPbWRwODk2bjlxdDBCYUJJTTVIK2xEb29TR1Zy?=
 =?utf-8?Q?nPlUZnoJ256C9iFg=3D?=
X-Exchange-RoutingPolicyChecked: NgyPxrW5SxoUDmlBRM2lKaXRfDSEpyKyCNYLk93DhWhU/qcdi0xhQKylWTX8bJiROHPb6Vyz5AJrejACtkzJ1f0hnPkWAtG8fP7y/cdidsXxUXBxW+aKPqpw1wZfJ5KwATeOCeEZEewl9SHnDFVwaEV0Sy9vFs2ZRUHjRpUoGmgOevPLnFhjqlwGTjC91vANaVtHbDL+2QUnPGrN/N7CA5+7LF5Ojr5caeZfnhK/Ht3quWZGBBA+pT2EunG5PVjkJ8AVAd+ygr8qNyJy4Qiv/JOpD3fjrllNkusSu2OR0DuL8HgM9HJSdcbK5RcP49lnQS1Xv7UzFRAgQkoyGZyoIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25285d75-7d67-4857-2ae6-08decbfc5de3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 23:09:50.3088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCBzbWlZNhvp+5q3H7UZk77NIj8sIsuXuXh9GQkMJow4gyOUwimxyRFg3ebs0NnC1kN/fDt3vX98UodeF6RdU7NYaBhbLLvbhKXJevOp/zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4739
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

On Mon, Jun 15, 2026 at 07:01:20PM -0700, Ashutosh Dixit wrote:
>OASTATUS register is not used by UMD's and the plan is to discontinue
>whitelisting that in the kernel. Also, OAHEADPTR is written to nonpriv
>slots. So check that OAG_MMIOTRIGGER and OAG_OAHEADPTR are whitelisted for
>OAG and remove the check for OASTATUS.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index e59fe953b0..68c7537d38 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -3833,12 +3833,12 @@ test_whitelisted_registers_userspace_config(void)
> 	xe_oa_remove_config(drm_fd, config_id);
> }
>
>-#define OAG_OASTATUS (0xdafc)
>+#define OAG_OAHEADPTR (0xdb00)
> #define OAG_MMIOTRIGGER (0xdb1c)
>
> static const uint32_t oa_wl[] = {
> 	OAG_MMIOTRIGGER,
>-	OAG_OASTATUS,
>+	OAG_OAHEADPTR,
> };
>
> static const uint32_t nonpriv_slot_offsets[] = {
>-- 
>2.54.0
>
