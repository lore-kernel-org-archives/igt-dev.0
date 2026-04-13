Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E84F34C5C
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 15:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2556D10E4C5;
	Mon, 13 Apr 2026 15:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2mcTW+g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B43E10E4C4
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 15:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776093686; x=1807629686;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=idtF90fTI+UfY/bD6j0EC3cDw4PpF1O0r5K/ml5jvTA=;
 b=S2mcTW+g7LUPQh7jfxZoirvt39D0Rs/RpWd7PjWR9qzoEE3+SceOpcBe
 BGMeLKm1x2x0GFc7I889UQ0BClYixkuuvTTIvizZu1a+V//3SlssvXZAG
 EGDT2t20M0J/KuwUjfor9VcceLJyOLAzPuqnoQXNctZyu5R+ioiL7lZr1
 dWK0TLXKHW4cCAC620GnggTNDugNg3/G4O0oOICRtkOnxNRliiPZhEz38
 939a1Zx2/1Fj5KlO7qqE59qptrTa4PICG/yZyRsx8yKZdiPuPYdQug9d1
 qyvUnjlQ6HtUfqcvgatIvaMQs63r0WMTBwovfOmZSZ82GnO+SknQuksk9 Q==;
X-CSE-ConnectionGUID: rpZygenSRBigvZkaQJskfg==
X-CSE-MsgGUID: 0SAnmTRpREmnLP+nyRq95Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87330328"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="87330328"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 08:21:26 -0700
X-CSE-ConnectionGUID: 1SPmFx4sQSawWHdOiBxQSg==
X-CSE-MsgGUID: uzHsuC3XTkiJGHsO9pnceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="226655158"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 08:21:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 08:21:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 08:21:23 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 08:21:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUhaafORxqYHrlhrK0C4HB9SaMjp1yFzzsCgVTlZSjDEsBDmb5y6gM1cq0xElVzfqqUCNdDIpbxgIkqvF1Ml6/SGRSDwc5JGEXv0eFxmNySbCLgWf4Fv+QA4v5tvCTApFUcidpJ9OJUdXT7X95QZQ2bozGKc6WMD5vgGcB/pQ6ROHxTD3ZTwI4/uyH/baTZ1bLNtzFy5QN+RWJ+HXt02Bn2QZbh+4muzR3thNP1/YOGDqBAkdqRN9Ih9wsCIT/xQRjWTRV+lrCm3/81jP6Sd8U6Z2LsKqhHTr64HQy8T1FTzZTiTt+9Au3sEAXc3zxpVN15TPEMd0THldQS9Hipqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHnMoB7hi8vn8GccKYsm3KbLGtoPF6IE0GPenJOmaGQ=;
 b=FR7RZsiY+C0ifkZY+/NBHIe4XhEfRB5lDpkZ//6BxMikI3vcsJ/OaR9SqpLP/xeiNhGLFawGIAwZxlBV5YF+xdVBA/g/MoEWEhhDoMIR5x54G85ysH8PU37y1InykbAcKCviJLWKVx+2XiPDG77fJv92oim9hsTz1m/5rJw2i3C97gwfhuuRoBE6n+RuV8fYJHuz0Nw98pc36Iu0DB8V0bMUZhxfDIF+pi0Puz9cv/XgEPJ78nd4VfbVjOXTase9X/QvCyc4QBHzjcFeaWbRA8iNoyGBCvpR6clrfz8FDV0T9kvAt9o/Ofth3fZpzSVo85pvJcyndVbPnApHj1R/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 15:21:17 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 15:21:17 +0000
Message-ID: <0db970cc-f4b6-4999-9571-b835ddff5bf2@intel.com>
Date: Mon, 13 Apr 2026 20:51:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_vrr: Drop cmrr subtest for redesign
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <mitulkumar.ajitkumar.golani@intel.com>,
 <ankit.k.nautiyal@intel.com>, Kamil Konieczny <kamil.konieczny@intel.com>
References: <20260411175919.1135989-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260411175919.1135989-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0273.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::15) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: fd417f3f-3712-4868-3184-08de99704ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: LZv5nHbuLhdYQfHAsCcdEJG2stUa8y0pyT6F6H97Z6DX4IsLAkWutZ+G5ZjSDE/Tc1nLo8y5HAaGf0gDTSenVVXLUzka+QuzBRislF+o77gqtTmvf3cBloIanmlWwygjbyXF8cUMHwGwPY5FkplKo1VHVB730vWJJu4TjFo4YH1zk+u5xGuc6FSNHQr3VXal0SitTU3H8JEdYT48S11zM4KtygpZ8YNC3Y6s6+Sq9otdVxAni5g4LV2uVeBnQ3mfax/x3GDMrq9jxosFQsKhdiMNccXCTEO4RALguY2hfzLv7RISp6ymfzDF4sF/pD/Ar3v+uXIYGeS/0fu4n1DOe5BmkcjjzupacLe+k4rJ/Otvqad+gjbGunMWwbOm9mqM4OO7fp39q1VUtlkxSGWbTDbdFuWP27RG+gCtIwI0HAAgXQE60tY1t1Ym1izcCga5RBVPcylNsHOjWE0cBAGY0mIaxv57eqb9guSai1R7SWWnQK3P5BmddxHcRK/NJSb50bsKdvATaQgH5DJCrK7oRENxqv88iZ4ajde/PKuspCcKRjZcT3dpK/bFiDfSaAP4BOW4L4OCwixBl+oNGVtI2Jkkn6MqCyUrnfq65NIJW//xHw8NFg47q457sfmiXMGCkjHnGxZdjgXk7VHMKx+h9cyS67Dv9VKcRu0qw7flgXy3ClApPISyA/StETtSAwvY5tWtz7r4MfkDEk1ydPEP4tBb9AUkOL4dH1l9z9msXhU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clFHbzYzSzVwdmF4T21PVld6RWJUMzUyYnZlajFmeVh0WEg5VlZUSXVTRC9l?=
 =?utf-8?B?dTJuTUpOcGVpd1NtRHRMWEkyL0c3SmFyQzV0S1lKZEIzcmdmVjlNbG1UTU5Y?=
 =?utf-8?B?Mkl6a0FOWnRxK3dtd3BnV0QzaEtQOE0wQnRsTWNyRjZqU1h2KzBIeitOUk04?=
 =?utf-8?B?QnNma3krTG8yTXpWSjJTZVdpMFZwbWxJc0xPZzU0MGVGVXhOdnJ1elVUUTYx?=
 =?utf-8?B?VzV1UmRNOXJ6YTNjdUVHNkVLSEl0ZVUzU3dWWFJYUHlkRXZ3WVJTUE5JRll2?=
 =?utf-8?B?TUxwdUQ0VkRUZEszVDhuT0F4RTZZbWk4OWhKZE5EMmdtWWVnS2F4Q1l6Nkc1?=
 =?utf-8?B?MHBtcitjazNIbGxCejFUTEc5MU9kVmlFWUwyKzN5aUhqS3FOak1ySjc5SFhm?=
 =?utf-8?B?S2JsOEJ2MUVBQzREazMwa29renY2YTBCNU15aWJnZVJmVHl5bjlQOUszZWN4?=
 =?utf-8?B?cHJva0JlOTZMVVhXSkd3K1lneVY1eHRxWk5NRXFaT2VFd09qOXlFS0FFM2JP?=
 =?utf-8?B?aURpN2s3TUZzcDA0THhHNmQ0OEIyTE9qU3QwWWVRdytkZHJFaEpsWHl3Smcw?=
 =?utf-8?B?MG0xUkVmbnFGVjVyYXNPaVlTNUNmYVp2STBLQmxNbHdhSW1Va1RMZkFJaDlj?=
 =?utf-8?B?UUdHQWNhSjRWWnFwTmlKQW1qeUxMS0Y5T0JJa25yQ3RFOTBpN0lidmoyQy85?=
 =?utf-8?B?TVgrWkphSlQvSysvaXFiZnNnWGpSTmYxMWRHM1FQcFFXbzc2NVJTTVYxNjR5?=
 =?utf-8?B?d2V6NFBhVjJzcjd0QXpXdnNIRjdhbzFIeVRBTWp2eVdEZjlHNXQzL0I5MjNj?=
 =?utf-8?B?U3R3c282RElXT00xUmFMU2hzZ0hYdHZ5UE5IT2dkUXhkM2M1a1ROWTJFOG94?=
 =?utf-8?B?bjg3WTcxRGtjdzNscWxZcjhLK2tycUFCUmxMRnRzbEZBejlOOEErcVVLcDEx?=
 =?utf-8?B?NFFaWlpxNER5eStqV05Qc0s5NVkrMWppNXdwR1lDV2lWYndTT3dvWThxUEZz?=
 =?utf-8?B?Y3lQZk4xcEFyZlp6ZVJGdzl3c3IvZ2tRNW1NUHl0VVJGb2JtaUdVY1lIaEgr?=
 =?utf-8?B?enFHNGh3MnJxSVZsNXM3ekVFN1RRSkZOWXRvQnlGcmJJWlpMZ2ZrTlhxMmZm?=
 =?utf-8?B?dHNEWlZFRDFteGVPUUZ4dGN0eU5aRzQvWXdjVG9saWpyaVlUVzIrZ2tlZE10?=
 =?utf-8?B?TWUwZGtOYVRKckdrMzlYQkc0ZExyRDFRekhvd3hMQ0t4c2U1U0w0S0lyQjdw?=
 =?utf-8?B?UE1xWUV5SDhSZ0s5aG90OUxhbU4rd0R0d2VlK1JNWGxiUjlvdE1UYTJYQkUz?=
 =?utf-8?B?a2U5bGJlQnBtU2puK3pYYjdyemVSaWpGSlZCTDB5TTdjN2hUOWZRL29URnRt?=
 =?utf-8?B?QkFqYi9nSVQ3MG5QeElFeG80aXhqajdzU2MrSndQaDlyUUhQMVJFcTFHVFpS?=
 =?utf-8?B?bHpIYWNob285a2pwejh4a1AvTldSU3F5WUhXRGtDNDRQRTkwb1JpSTRrTlJP?=
 =?utf-8?B?eXJFMzlSMXhFL0xLU1BFM2ZySzU1RWdKeVlBaFRrSnNLVE4ydTMrMXM4YVVG?=
 =?utf-8?B?ZCsxT0FaUGhHa2piSmVZWVVZVW9ZMU15Y1cwRlR0RHp2d0pyVEhWdUVMbFFS?=
 =?utf-8?B?dkpaTGthQnc5WkdzTzVwbWhaSlNIQXRGbkNKblFRSlE5YUdDTnFxTU5lenZV?=
 =?utf-8?B?MUhIYnpOVjBsK2Y2Q2EwQ1E1WlFYMk9RWkZROFN0bHhwZHNBQWdETkVEUnUv?=
 =?utf-8?B?WWMySGo3dFpOZllJdnJrcFovS0tGMWw0aUdKQWkreGM1cDFZREsydUxxS3FH?=
 =?utf-8?B?V2p5QmtVL2NQRlIxUWlvTHoyK25sOHhXWmNMZUQzUVhrZ1pGTFBuYXpqTlB5?=
 =?utf-8?B?WGgvVkx1cGswcXQzeFo1WTBRWGM1Vmdpd09oaVlmMWxXcW9UZ09uVGs4alFV?=
 =?utf-8?B?ay9yRi9qTDdaYlZTdDFYQ2JrMmo2MXNPaTBSMS9UTlJ5bmoxV0dkcWd6dDBX?=
 =?utf-8?B?UWJCR1ljNWQ0TEdoZ0FzQUFnRFQ0enFVejJGNkxaOS9KdmJ2MzNwUnFuZ2tz?=
 =?utf-8?B?OVV5OWZxNmFtTWwzUis0eTVLRHEyMXZKeExxYlZhY29CV0wrSFNDTVdSQnd4?=
 =?utf-8?B?eUpjQnh3ejJpdWVnNmxNeU9LZ2FaRDgyNnhOVGlEWjI5VWFqTkJrOGk2WEkz?=
 =?utf-8?B?ZDJ5bzYrMmZRNGc4d3h4MkMxUEhnUWg2L3g5ckJDRElFYWpLOXZTclVJNkkz?=
 =?utf-8?B?S3pKTXNMWG5aUm9mY2ZHanN5ZmMzR01vTDZ6eW5hR0FjYzM5bDg0bXJhem50?=
 =?utf-8?B?bUFnbEJiMVpOZmgrdGx3eE1oVXdiNi9aaWYxc3ZnWXZoa2ErSlF1Zz09?=
X-Exchange-RoutingPolicyChecked: UDXehvj0Gep8jbWZFl6lWJaeJry4pSmdFJ9boZ2yBlR7VGtMkb7mdU4qrUI3s5YT6lSZD8/svREkLLikJ1BDio+hwX1pLyKDzz7hevlK2EWoLSxYCOdjEJau4kvOGprWbmYSIUf5Y+9QyFf75bjP25VuZtjaGAANogD/4oG/4PbwAq6060ollmd5iJry5KiJMEbyYpE8ROe5G4Ocgh4Krpa5gZ1pF06eF22Vkq9+3UcEEE/zU8J9T9us8+VXWw1DE8OUqejYQNi/Ikcu4mNvqBeMSqcYZpP9CGEfn598BnQwGnencGvCJikD6Geg+PTxORcJR0DZJZ03QsTntdqQIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd417f3f-3712-4868-3184-08de99704ede
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 15:21:17.5672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //P2CSp7EQuwOXssFLnmZ41MVj+c7LIXk/DP/9Y8PtsFrJHp/dacsa7lw4BufmiSbaFj+pwlyiuisak+Duv6Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
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

Hi Ramanaidu,

Shouldn't we revert 7f0a262891b7888a09e4a1838eb688ad9c676324 ?

commit 7f0a262891b7888a09e4a1838eb688ad9c676324
Author: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date:   Tue Jun 18 13:12:25 2024 +0530

     tests/kms_vrr: New subtest for CMRR

++Kamil

On 11-04-2026 11:29 pm, Naladala Ramanaidu wrote:
> Remove the CMRR subtest due to a change in test approach requiring
> a complete rewrite. The subtest will be reintroduced in a future
> patch with a revised test methodology.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_vrr.c | 132 +-----------------------------------------------
>   1 file changed, 1 insertion(+), 131 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index ec0692b2f..01f078d2c 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -36,10 +36,6 @@
>   #include <signal.h>
>   
>   /**
> - * SUBTEST: cmrr
> - * Description: Test to validate the content rate to exactly match with the
> - * 		requested rate without any frame drops.
> - *
>    * SUBTEST: flip-basic
>    * Description: Tests that VRR is enabled and that the difference between flip
>    *              timestamps converges to the requested rate
> @@ -90,9 +86,6 @@
>    */
>   #define TEST_DURATION_NS (5000000000ull)
>   
> -#define CMRR_PRECISION_TOLERANCE	10
> -#define VREFRESH_MODIFIER	0.1
> -
>   enum {
>   	TEST_BASIC = 1 << 0,
>   	TEST_DPMS = 1 << 1,
> @@ -103,7 +96,6 @@ enum {
>   	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
>   	TEST_FASTSET = 1 << 7,
>   	TEST_MAXMIN = 1 << 8,
> -	TEST_CMRR = 1 << 9,
>   	TEST_LINK_OFF = 1 << 10,
>   	TEST_NEGATIVE = 1 << 11,
>   	TEST_FORCE_RR = 1 << 12,
> @@ -252,21 +244,6 @@ virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
>   	mode->vrefresh = virtual_refresh_rate;
>   }
>   
> -static bool
> -is_cmrr_mode(drmModeModeInfoPtr mode)
> -{
> -	int calculated_refresh, actual_refresh, pixel_clock_per_line;
> -
> -	actual_refresh = mode->vrefresh * 100;
> -	pixel_clock_per_line = mode->clock * 1000 / mode->htotal;
> -	calculated_refresh = pixel_clock_per_line * 100 / mode->vtotal;
> -
> -	if ((actual_refresh - calculated_refresh) < CMRR_PRECISION_TOLERANCE)
> -		return false;
> -
> -	return true;
> -}
> -
>   /* Read min and max vrr range from the connector debugfs. */
>   static range_t
>   get_vrr_range(data_t *data, igt_output_t *output)
> @@ -600,57 +577,6 @@ flip_and_measure(data_t *data, igt_output_t *output,
>   	return 0;
>   }
>   
> -static uint32_t
> -flip_and_measure_cmrr(data_t *data, igt_output_t *output,
> -		      uint64_t duration_ns)
> -{
> -	uint64_t start_ns, last_event_ns, event_ns;
> -	uint32_t total_flip = 0, total_pass = 0;
> -	bool front = false;
> -	drmModeModeInfoPtr mode = igt_output_get_mode(output);
> -	uint64_t req_rate_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh + VREFRESH_MODIFIER);
> -	uint64_t exp_rate_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh);
> -	uint64_t threshold_ns = exp_rate_ns / mode->vdisplay; /* Upto 1 scan line. */
> -
> -	igt_info("CMRR on: requested rate: %"PRIu64" ns (%.2f Hz) "
> -		 "expected rate: %"PRIu64" ns - %"PRIu64" ns (%.2f-%.2f Hz)\n",
> -		 req_rate_ns, (mode->vrefresh + VREFRESH_MODIFIER),
> -		 (exp_rate_ns - threshold_ns), (exp_rate_ns + threshold_ns),
> -		 (float)NSECS_PER_SEC / (exp_rate_ns + threshold_ns),
> -		 (float)NSECS_PER_SEC / (exp_rate_ns - threshold_ns));
> -
> -	do_flip(data, &data->fb[0]);
> -	start_ns = last_event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> -	do {
> -		int64_t target_ns, wait_ns, diff_ns = exp_rate_ns;
> -
> -		front = !front;
> -		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
> -
> -		event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> -		igt_debug("event_ns - last_event_ns: %"PRIu64" ns (%.2f Hz)\n",
> -			  event_ns - last_event_ns, (float)NSECS_PER_SEC / (event_ns - last_event_ns));
> -
> -		diff_ns -= event_ns - last_event_ns;
> -		if (llabs(diff_ns) <= threshold_ns)
> -			total_pass += 1;
> -
> -		last_event_ns = event_ns;
> -		total_flip += 1;
> -
> -		diff_ns = event_ns - start_ns;
> -		wait_ns = ((diff_ns + req_rate_ns - 1) / req_rate_ns) * req_rate_ns;
> -		wait_ns -= diff_ns;
> -		target_ns = event_ns + wait_ns;
> -		while (get_time_ns() < target_ns - 10);
> -	} while (event_ns - start_ns <= duration_ns);
> -
> -	igt_info("Completed %u flips, %u vblanks were in threshold for (%.2f Hz) %"PRIu64"ns.\n",
> -		 total_flip, total_pass, (mode->vrefresh + VREFRESH_MODIFIER), req_rate_ns);
> -
> -	return total_flip ? ((total_pass * 100) / total_flip) : 0;
> -}
> -
>   /* Basic VRR flip functionality test - enable, measure, disable, measure */
>   static void
>   test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> @@ -946,54 +872,6 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>   	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
>   }
>   
> -static void
> -test_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> -	  uint32_t flags)
> -{
> -	uint32_t result;
> -	int i;
> -	bool found = false;
> -	drmModeConnectorPtr connector = output->config.connector;
> -	drmModeModeInfo mode = *igt_output_get_mode(output);
> -
> -	igt_info("CMRR test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
> -		 output->name, igt_crtc_name(crtc), data->range.min,
> -		 data->range.max);
> -
> -	for (i = 0; i < connector->count_modes; i++) {
> -		if (is_cmrr_mode(&connector->modes[i])) {
> -			mode = connector->modes[i];
> -
> -			found = true;
> -			break;
> -		}
> -	}
> -
> -	igt_info("Selected mode: ");
> -	kmstest_dump_mode(&mode);
> -
> -	if (!found) {
> -		igt_info("No CMRR mode found on %s, try to tweak the clock.\n", output->name);
> -
> -		mode.clock = (mode.htotal * mode.vtotal * (mode.vrefresh + VREFRESH_MODIFIER)) / 1000;
> -
> -		igt_info("Tweaked mode: ");
> -		kmstest_dump_mode(&mode);
> -	}
> -
> -	igt_output_override_mode(output, &mode);
> -
> -	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
> -		prepare_test(data, output,
> -			     crtc);
> -		result = flip_and_measure_cmrr(data, output, TEST_DURATION_NS * 2);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
> -			     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh),
> -			     result);
> -	}
> -}
> -
>   static void test_cleanup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>   {
>   	igt_crtc_set_prop_value(crtc,
> @@ -1013,7 +891,7 @@ static void test_cleanup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>   static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
>   {
>   
> -	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR)) &&
> +	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
>   	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP) {
>   		igt_info("%s: Connected panel is not eDP.\n", igt_output_name(output));
>   		return false;
> @@ -1226,14 +1104,6 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>   			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>   
> -		igt_describe("Test to validate the content rate exactly matches with the "
> -			     "requested rate without any frame drops.");
> -		igt_subtest_with_dynamic("cmrr") {
> -			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
> -
> -			run_vrr_test(&data, test_cmrr, TEST_CMRR);
> -		}
> -
>   		igt_describe("Test to validate the link-off between active frames in "
>   			     "non-PSR operation.");
>   		igt_subtest_with_dynamic("lobf") {
