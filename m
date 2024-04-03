Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C38CD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 15:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3431B10EC1A;
	Wed,  3 Apr 2024 15:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njYdJKe/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFD610EC1A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 15:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712158108; x=1743694108;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dv/VxvDxB9/ghmzM8jJ/xZnwHwx9i0Rl13DwI++tquk=;
 b=njYdJKe/0RAHbGa/SMMhV53tE5JDFqRaHMLB/W5U1Y2TKiGZ+rBNfdY4
 IzXn3yuZ/LJ/j8olCmY+XZYHyPQYED7qGG0sl/DTbWeEy9u1nUMO4Qsew
 TgdzimYhnAVfauyznQPXLE2JK5IjHaCUArg5wwF8+yEWJiBaZUBYrkvdi
 b1OVIx95utyeyX8aj/YZ3KCv5CpROdFJd5iAlDKoUZdjtzNOLSvMw/Ckf
 F2D0PFVWneC7IjX54B/RzB8BKTdRogP3ntMQ2DPZGD7EdiCBu4T/YUj2l
 Svv0GQQ0v/uI3own3yo3HpnYIdCyM/zH9ARmbVda3oMMA9umJiJJ2IpNl w==;
X-CSE-ConnectionGUID: vaFgmAoDSJCVcnMe4h702g==
X-CSE-MsgGUID: 2ipew513QPaSS5VlxX4UWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7268561"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7268561"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:28:28 -0700
X-CSE-ConnectionGUID: OSuYiH+aRyWhtV8PayD8sg==
X-CSE-MsgGUID: SORCxJHLTdSL4UaFfnXcVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="19070638"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 08:28:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:28:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:28:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 08:28:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 08:28:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0uuMSQx6RKgnKuYSVolLCNnL3+9Kgh0QzGjBKX1fLFcInRv+h60n9+xvvdy/y8FRTHVPOR6me78+iIO0WrxAQnEBBdNgET1HsSwVG1+1ZApc90dce3Rpcitj/KcoezSCOPFI1XzZTOAD4uwXaSBXchBG6/+xKlPE6yodON1aBSIhS06Me9tZ3sSVfPkd6CxjPZPcKr02YOg+94JsKQ4EDGF7vKxLxnb8TyoJMDLVOaunxSryJ9UqoVUfqdCrvEp2z6/gUjsOiJRo3TD1vshbNlgYytyQvo5NFqVHZNy9rZ7LteHH9e/ugpwl0pAZM05gbqjyWno7ZGo09JB+siM5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqHrp+8ArW2ZzwiYcxh6vvssjKbzgb9pmsyE4Vtqax8=;
 b=M95K1LHmqAW9qV0l37TWHz0/pTYjMB+Jsz1CSCRByIaPLTBNDKQXW5qx4QZGu9Y/ZVgkTV8Jdta4DJUOdFaHXoJiF1h15d4ykHiSwfl5BcpfdNxeror1oyYrjyR9dQd5SZCBL2VtYN7+sxDA0DDkAMLD+xzcRo/nQyRR5QT/HfpY6E1+xHldgRe7/5c+IUmt71lghUBPYRaQSKbS4NAAoBhr4TcAt7CAnomm5zgZHLVWsPp907xIX+gDSkcTwAbMYGaQidCwSxm+8gbz4zj3zWd/x5sFmjhWPtkP4VcChmSYuBCAE5UELrnf/MSisBv3Ht0ORnSwyQDRhFhhDoAYLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 15:28:19 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7452.017; Wed, 3 Apr 2024
 15:28:19 +0000
Date: Wed, 3 Apr 2024 08:28:17 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t 2/8] lib/igt_drm_clients: Fix sizeof calculation
Message-ID: <Zg11kT4GSypKfMqf@unerlige-ril>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
 <20240402221716.1840148-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240402221716.1840148-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0373.namprd04.prod.outlook.com
 (2603:10b6:303:81::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6335:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /vZHIBVpsOZ/RqYqgxVGGKj8xC0PHP0LGtx28XVrl3V+c/ee4RUW5JJAlgEZFB1uyUVhtpYZO8Q1Cji5pv3SyQBlDTEAq5KCCC/YlFkoth6ZyWEBdAgMKXeSFF8x7hWmlfq1ydNbN0m42tzLnPqEvs8yUXnqBiejXypL52xTWToDvEPtGeYetlG6E3u/+9293dsv4y5iOZwkTDjQZVhIrtwFX3LaPNV1jO5iYOtYtcYZGaCBHc529MlnZlZRc0MLACdX96lhC1yfyRpCqbTS5IH9BI58Y1mP/oOXuA+Ds/iRxZOwoXlAS9eYs18JSA4p0Pj90rTbH53m3S/ehUcVw/8I53wqR365LAxDEC/wfBobUb/fd1SomNp++Vw+MgUYbQlyMzCrWKhsGHAl7Lc+0O5U855ILdt1m8xjtSR8RIQCG/EcuN09QXWZv+mx/Jb1ifJHjE3B5X1UQVOacuM5/5FvRFZ/8jIROaHGVGE1ekT3COOmdPesT3N04HbpCgoad9+ek5quD4m/eswIchPkTWBX6qJSeh+xGVkdJx/34Jyv2PJC7noJX2FR+P9yO3KK2/0R91nVT8ZWSqpO/A8YApMvuql4+u8gPeYlIvGYjs/RFERfBsYImaC3u650yGXBY98kgBUdcvkrOiCpHb7ms7YxDX0Z0ZKiGWXX03AuQoE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTFvUDB4ejAza25nZGhVNmJsSFVtWTM2eVNUSjdsbDFsTW9QaHNFZmVObVRs?=
 =?utf-8?B?WFJtQklPYiszN0ROTE9MTlo0WUVTSE9TZkZ3d2lUbTZGTTI2bTNxQ2lKV0E4?=
 =?utf-8?B?c0RqMkJ1TmkxeFAzQTBWaW92bkNPenNZUzlYa0hUMTJKbEZkcUFKY0RiMXk3?=
 =?utf-8?B?R3lBcGFtWHFpakFPZDc1ZnU2Y2xDTit1anJSSng2bG9OSk9OQ0w1WVpaUkVB?=
 =?utf-8?B?bGUvZEVUWlVGU2VDRzlzWnlOTFpKTHlPRi9ObmJGdC9xTGYyamNlbklWc0hy?=
 =?utf-8?B?VVI0S1lQQkJmQlRBcFJPallQZW5RYkl0VkFoeW1zUC9CVzZ3R0NEWjNoU2tJ?=
 =?utf-8?B?UmFJR09QVzBSak1RZVhBNGw2VXZDWGlLOU1LUVFjUkg3TUtTa3RhZ0QrMjlM?=
 =?utf-8?B?bXd4Y1FLcjFyNElYa2tocVZRbDJNa1ZkN2pHV0tNcXRmZEdlWmIyYWJkejMy?=
 =?utf-8?B?RHg5NHhkNmljSFEvbGdpbDNzMngwZHN0M1NLdGllNWZRcEVCWXI3K2xjZWZm?=
 =?utf-8?B?eFJZTHhyaUtWMzA0L1drOXUyRlJ2em9abHczODUvdUN4eGpvd2szUm4vRTFj?=
 =?utf-8?B?ZjZ2R3BiNHpJSW4wclhxL0RRd0k4bXZmUnhlNHQ3bGMrUW5ERzBaTG11RVdW?=
 =?utf-8?B?SEJlNWJ0eEtQRUQ3QzI1YU13cE4yQkt5QlBVQWVWekwrb2YwYXpRWGVXTHZY?=
 =?utf-8?B?MzloTEQ5RzRvL3plRkp0ZVF0ckhZaUgwTXNra2dOaldicVN5S0d6QmtYeTdX?=
 =?utf-8?B?aDcwVHc0NEJnTjU1bnI2dTVucXdkUlN5Si9nVnB5UlBCRk9pMnBqSW1XZjNF?=
 =?utf-8?B?MmhUcWlZVTA3RTNhYmgrTnFLbGg4YytjWGpUZDhQN0pqajg0Zm9pTFlra2JC?=
 =?utf-8?B?QlFoQm04WlcyQm5ZS3RaZVdKOFJrNi9IQzJSWkR0eWZzM1N6WnVXY092aHNO?=
 =?utf-8?B?SjR2RXNvL2YydGZvcEVVcW45L2VEYWpGY3hiM1JJK3h5TWxlaGJ6UjVkS0tB?=
 =?utf-8?B?UEk2L1BBd3FRRS85eFVBRk41MmJGa0ZBRXBCaTFlNlp5cEEwY3pURnpzbC9F?=
 =?utf-8?B?YlZRS2dKc3N1SStENy9MdDd3TjQydlYvRXpmS1lhZ2RrYk90anVaYzJ3VVpQ?=
 =?utf-8?B?c2VteFRiMURYbXNjMlMxbVV2M2JHSmRoTC8vQzJNZHJlMWZaM0hRVFdVSjZr?=
 =?utf-8?B?UitpNDNYSXNrY1BBT2pkTS9uOXU1OGxIcmVrdjR6elNma09lbExxR3VNTVJR?=
 =?utf-8?B?VnV3NVBPUjFRRWhyczh4a2YwcWFKaVh1UXEzUDIydFlRWTVHaW56SWI3RWgr?=
 =?utf-8?B?OS90LzdLdlZlVzYwZ09rcWc3NXBMSmthTm1EemVUKzVIa1lDdnBjSmNQVXV2?=
 =?utf-8?B?UmJqQmlId1RvQjkrQnZWbU5NTlRTSDhPQU5RY1Z0K3p0M1NRMkRXVFFBaUh2?=
 =?utf-8?B?U3I3VlZxSVp5cmtyZXJsa0VyWHg5L1pQck1QV3Bwc1ZaTXR2b0RsTVdEYTA5?=
 =?utf-8?B?emhUcENwdWhwek5HUGJ6MEQwSUNRc1UwZEhnNUd0RUsvaS8wb3Q5RmozSllH?=
 =?utf-8?B?YXNrN1dlTjJzWGJFbEdnQU40UE1nSFQxNGNDSCtzTzlTYnRxRy9SWGVMcXRs?=
 =?utf-8?B?eWxibmJLNm9YYjRYaEUrRnBNMWF2bjVVRjBTdVVpM1FoNDBBUW9mb00yeXRT?=
 =?utf-8?B?cmd4dVIzOUVUU3hwRnJtYk9XVTVtbUtubkdpUkh4OGZPendYUzJ4MzhWRmly?=
 =?utf-8?B?d1NPSzBLaDUxdjhrQXpibzZEdkpmN2lzSU5LT0NIb2FkcW84SDM2cjNiaXFh?=
 =?utf-8?B?S0lCdGUxaHY0LzhGWTdaREtybFhZOEIzbmt4WnFockZ6VFFuOG00VExUVk1U?=
 =?utf-8?B?K0VyUE5zMm5qU2ZtS1ZBZUgwZlVjWUF5UWV6Rit4R2NxM2I2T3dYa21vOG9N?=
 =?utf-8?B?NDBpV2VsZkJMUFkxUlZhbUhycGpiTnVqWERvdHY3eldxcVFURzZFWEhzbjFS?=
 =?utf-8?B?bjlST0hmb0FXMFlwbGxiVWYyaTdFL2djaWVOMk1SWnQvT25FQS9rUGJ3K1Rs?=
 =?utf-8?B?b01jeTAxcHBHMHdxTS9ZREl0bVZ1b3dGRWJkUTBvUkx1SVU3M1FRNmVsMnk2?=
 =?utf-8?B?ZTYvRytVQkgwYzYxMkVlZ2UySUthQWtMcWFKQkhLUHc1b3d3QjVmdUJUMzQ2?=
 =?utf-8?Q?O+CdL+rokPKWixhxwUEy4Rw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c93394-4c74-43e4-d0dc-08dc53f2b0de
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 15:28:19.5708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BNftqve758O7JxVtRRz93FpqO71E9riMLd6YJnMDlE6Je1c1nMtejc+F79W7FM4WxpOnfcRmVB/2zaiACozm48igjJjs4lUOUZCHBxnAZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6335
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

On Tue, Apr 02, 2024 at 03:17:10PM -0700, Lucas De Marchi wrote:
>val and last are arrays of certain types. For the latter, it's
>underallocated on 32-bits since it should be sizeof(u64) not the size of
>a pointer. When running on 64-bits, no real bug.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM,
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/igt_drm_clients.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
>index 90ca6d61c..c8dc21d6a 100644
>--- a/lib/igt_drm_clients.c
>+++ b/lib/igt_drm_clients.c
>@@ -182,8 +182,8 @@ igt_drm_client_add(struct igt_drm_clients *clients,
> 		c->engines->num_engines++;
> 		c->engines->max_engine_id = i;
> 	}
>-	c->val = calloc(c->engines->max_engine_id + 1, sizeof(c->val));
>-	c->last = calloc(c->engines->max_engine_id + 1, sizeof(c->last));
>+	c->val = calloc(c->engines->max_engine_id + 1, sizeof(*c->val));
>+	c->last = calloc(c->engines->max_engine_id + 1, sizeof(*c->last));
> 	assert(c->val && c->last);
>
> 	/* Memory regions */
>-- 
>2.43.0
>
