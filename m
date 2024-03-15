Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90366C54E58
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 17:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189EF1123A1;
	Fri, 15 Mar 2024 17:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EiJqprC+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED75D11239F
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 17:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710522117; x=1742058117;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b5R2jQ2PsOW4xdRVfpDw3m2FcUGovMLVoUwocRqIixc=;
 b=EiJqprC+D8uC+mntp+7XQlx8OjWoJzPbrppihr9iCOwjzQ0rUiC43eWx
 9BrzSoi+LEUUsk52mNLg8X46eHQxCj352UjVvxn8o+qzc2d2xV0G96bxM
 9XEpckGca732R0m+z2GOFxpCDM9BC/cAlUcwTmPHhqp5L7tsd3EqHDXuz
 B8bs+mS5IYEIpRil7gM5iUBN5aB9VcJARjduSyAPOyLBTCrz89a6itAHh
 LYF2HIwV6jVg3wx9pxl4geVG7XVSuQipI74I75o8DGIsxOWk5fBXctdcv
 toj7z/F2u6dPlQgQXWt0j+XLf6M8aUpAIUACmaWDgAXLbDitvZrYrXJ2A A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="8343287"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="8343287"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 10:01:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="43647566"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 10:01:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 10:01:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 10:01:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 10:01:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBEYNFVBry3nICWARXtwW6Ka79+p4l22f9bolbbjk/YQJfqd72lzn4TK769f3WjUt7ze9vv5CopeEah6MsDeGPDlgP/9PdSIZYpo3NycjergbdhTfQ5tNUNvhf08Tk2Xt8SciRC+yxo7kBEvSiqyH4Jc+EqkD4dpXPN5l7gkJMc0JojdG1QQGFZXKU5/fqFqGeYZ17tR5m3+8ou02Z1siB6dLMNyQMN5qKpKwA/KgpZdN6NsSrGBsmenIfMAGKBiwPj4+++9XIT2rP3QXMdi2ZsRFZiCR9Hkjm6QQsSw7kJm+LMBqIyZ2PLDJi6NjAnccvgthRejeBQtbWStJqkY6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tBLsj+OnTZZZe4pVphx2/9L3jbjkZ0hUGYr6d5Le0o=;
 b=dB6jWzKdPBzmGe/GPvar+wajs5EnEhAMaMLrbsD0ZuZG6iLNrwtlFF5y6jspIuhcfADD8ekCNONlAp1XbGWGxBUP3pWCu+AgMvgRCE2qbx7RC7/yGqdIMK0TPyrNWc7+Lr9oDoEPm81wZIlmNsmoIhsNDCiBSXh4K9fsPMxDTD/dZSdsDVxvLqClLE1Zdv/pdJgULxXWM+bcV0Ku2uJ4JcrHnlwBB+xqejw0Ko7DgICtsi2gpbybvQfrV2kx8tPWrl3CndY0EC7BPnjqUZjZbm8hNoYRZyg1+Hd2b6cYPnrn4Aeeo4F5/bPLjxRZbiYt2ebLV094+3Pj3hwUYGiY3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV8PR11MB8584.namprd11.prod.outlook.com (2603:10b6:408:1f0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Fri, 15 Mar
 2024 17:01:45 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7386.016; Fri, 15 Mar 2024
 17:01:44 +0000
Date: Fri, 15 Mar 2024 10:01:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v4 09/25] tests/intel: Introduce FDinfo subcategory
Message-ID: <ZfR+85zIE2QYnEeM@unerlige-ril>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-10-katarzyna.piecielska@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240314143455.1436688-10-katarzyna.piecielska@intel.com>
X-ClientProxiedBy: BYAPR01CA0029.prod.exchangelabs.com (2603:10b6:a02:80::42)
 To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV8PR11MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: fccc852a-2e69-4f44-7da6-08dc45119807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WedtDneijAeX08t2c5Xo14Sh63KbP3KnbpreehpWBKyYC2CQ0p2UaDj9C3xvVsA+sd8W30Hh/dw/CfiaQwwv6N9Kwnz0nV4B2bUS4uRpXH+EJHEqgQhiqEUDd9JftmJc0o+n3PGFKqU0ANy0I1pVD+wh/O3LuqbU496UcO8c1Lo7VAOPnnSNh0IJlbmCN/odje89W0e+Yc7mm+tduRWg44fDf2yz59WjeoNCm2WGxV7fqsechMeIMFWlUGPmlkLamBxyBQgSQe76rnXEJUIJkxx6kkYSLuUuzihMpN3qrlb4aVUuIg/cuD/mFMJoNoM76Bkg4fnKx7gwedTAOPySNUtEuzj4Ox1KlWj3WRrh1X3m6Td/uJ9uNFgiy9q3WCVG7ei1ZDI46BkXQBHV8xRP3F8QZu/AbkX/Ofq5STkpReP2BcUhTYJv5SeHofMg44OAc9MlabGn8EunQkWek/96BizGbnJd/d17paWT0nDBV78gilXfwL+H+OaZPOC6UNKC8QMs8my8W7l9ThwfOCk6OAZzojgeRZQ52rOc3EwsEjO9vAYWkW8h/VBo3M94COaeSADeLpT+yM+ey/PyZBQwr+oly/MEyObPCZpOg0O5D5mBpD1hDfGkoMeELLIRIUbt4J+fwYrrgLDU409vzp9ynyLZTpgoQoftacPZ5HbpuHI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTVWemNMSldBV1JCMVlVVHN6SE9hbUxwelZ3KzQwZ3pEbXFqS2FEdFB2SGpV?=
 =?utf-8?B?LzBiMm41L2VxQ3ozc1RKM0VIQzNqaG9zK3puV1o0RnNYTnM0ZUlZckthdVdp?=
 =?utf-8?B?ZlVxSUd1a0NYd0lHOFdrYy9SZkI4TXZwNjRDcmorY0JRWi9BTnhxb2lHUmpD?=
 =?utf-8?B?RzFacFlmS3V1ZjUrazRJYTBKUjJUOUVlcFNrOStYWlNMZ0gweXJnVTliY05h?=
 =?utf-8?B?TjJ6U0VrcDBoSFhGWkFXOTZncnZsVzJVTllIQ29EcmhuUkJJN21tM0VNTkZS?=
 =?utf-8?B?dkxpcWp5UTJqMXMvZkVkMHhMa0hsWlZaUVcxalhUbElEZlYxei96Y20yWXpq?=
 =?utf-8?B?bTJ1VnpsY0E1YlhDUTJOeUFEMWd1ZHMvNUxSc25ONEZYN2RMSS9TOEdVRE02?=
 =?utf-8?B?RlowZGN1R3NtR0k2TTFoZk9jaEQyWHFaWWx5RWNlamJPaXZqdllaZm5yUXhk?=
 =?utf-8?B?WWN1V1ZiZ1hBRFFJYWI3VmIxNXBIenpwMlBBVTVlS1hGdGdtcVFNcm95SERK?=
 =?utf-8?B?dFFvbjFZNUY5TUVwdzZWbE1UZndtckNnQnJKKzliSWhZLzdUWmtmV3pBUk53?=
 =?utf-8?B?MkJqVTR2NWVCTVRGdWwvbGVJSVZuVllVNElkeUYrTlgrT0dZbjdKRzA3ZTR5?=
 =?utf-8?B?N2ZUaDArU1dLWWJRbWdDdVJtakRwaHA0bjhNQ1R3S0RhQ1RPVUhqMXNkMlJi?=
 =?utf-8?B?K2lwMDIzbDVMN0R1UnkyUTRyOTBSMFNZVWhQQ1kxNnJRSnRuSzJGZG1OU2VB?=
 =?utf-8?B?bW5lZm5vd1RmdG9DZlJXeWQxcTZacEVIZGNwWk9TeWh1ckRMVjhvcll1UEFw?=
 =?utf-8?B?aCtPL3ZJOTh1dXVUMGdWbmxNL2c3MC9wMHk2UEx5SXRMN2FYbEVNQTI4Um9I?=
 =?utf-8?B?SW04Y1BzY1pWUXZoY3NoZzhNc3J6Q1htLzNHdWYyQVVVVU5JUkhqTTJRRjFN?=
 =?utf-8?B?c2paU3EwSXRCOHJlWWlOVzYvbVZuWk56VndBNU1jQ1pZTnlWZERweHBLN09a?=
 =?utf-8?B?d2Iyem9qU2xTMm9yYXAvR3I2UjVVVmhIS1RzenlOMUptckRvYmJkRXNDOS9y?=
 =?utf-8?B?a05kcndJNFhYbFlzdG9IdUx4akJLTlFnSjcvNXlUem5VVklRK0o0STBhalcr?=
 =?utf-8?B?Y01wQlJ4Nm1wT0h5bFlqVS9FTURDajhBOU1MeUtqQmtPQkFkTVJQQW1WMHRH?=
 =?utf-8?B?eDVVanpnSkh4dytrZ1k4RXFhd01OUmVrMTE2Q2IrNDNtUzJGRXhsNmlNNkFi?=
 =?utf-8?B?WGNuOGVLTitvRm1iZ0c5bE14QU5MYktiQmtJTjBmN3FxdTNpV1BiL1lLbUJl?=
 =?utf-8?B?Uy83SS9FbWxIcVg3eXNUaXZwcVkvN1FEazZZNDVNZ1pqNGdONTlCSUJHekhG?=
 =?utf-8?B?NWUzRDlaRmZ1Wmd1TGU5eGJvYUxQYUdsNjRTMGdsZUpQbVhSVGE0YjAzdmZH?=
 =?utf-8?B?bzZXOW05R1JHSHdjcVhhbEFoUEFnbXQ3QUFMcTh3VWpNME41dmVITSsyc1d3?=
 =?utf-8?B?VDFQTm8wOTNmTkNnTkdTcUFoQkVNa0h0b1g2Zjd4dHZETnplRUlseE11RFBs?=
 =?utf-8?B?b29SVzQrOU1rOUJ3aW1jbWIzcmliSWEyd2FNdHFaQlFvYTdxU0pFYlRIT2ZG?=
 =?utf-8?B?USt2VVB6L0IrTXQ3WGVpQnl5TjFmRUxGTXlwYnczeUVNeVRZTkFDS0ZEVGlB?=
 =?utf-8?B?OTNGVWYxOVNEM0RFM2hleW1IMzRlcFBwSGtnT21ldkVaSERRbGlCSDdSWFc4?=
 =?utf-8?B?aFp3b3FoVzlBZVVNaG1BSDFaUXZ0aGtPZFU4R09rVCthcUhneE9mTFRsWmlR?=
 =?utf-8?B?aDJoOW9VNDNabEFMQWVXQTdLZGhxZHpMKzFRdk9BRVpRek5MRzlkUFJYTnVx?=
 =?utf-8?B?L1FkRjJrVzcrY3g3RzA0Z2Mydk9qV1ROOG1EQWlXZHZneC9HNGJCcDl5UkRs?=
 =?utf-8?B?cWpseHVrYmVQMDZpNllXa0xEbUtLNmRkcWZiTEJna3JWRElGV2ZrTTd3SitG?=
 =?utf-8?B?V0dUTUNBSlBWWS9MNkN0YmRyNndOYXYxeENWMEhHVkdUUDU0NDFPV2J2U3dv?=
 =?utf-8?B?TE9GdkM5ZGZjTkF3Zi9rc2ZwYmkvTGpLaFdhR0ovYnVUTDVRWVNMSCs3Umdr?=
 =?utf-8?B?YnVXbmV2UEtYd25SckhlR3Q5azk2UnpqUmo5blF3TVhGRG8vT2Z1enEzREc5?=
 =?utf-8?Q?+ijs9sdaa/1wkrdgOBq3FgA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fccc852a-2e69-4f44-7da6-08dc45119807
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 17:01:44.9024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +U+gflsonNTfn31XgAnz02Wuqdqgex+4L7k4xzq7HsCwxAMcSISkHGDEM/L7mtOS9iilcKpiiDXn34saxaw4jnOCoSWFkI2+ZsH4J+l31Tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8584
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

On Thu, Mar 14, 2024 at 02:34:39PM +0000, Katarzyna Piecielska wrote:
>Let's introduce FDinfo subcategory.
>
>v2: Make Sub-category/Functionality/Feature unique values. (Kamil)
>
>Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>

Acked-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
>---
> tests/intel/drm_fdinfo.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
>index 3ced658f2..aac2fdb6a 100644
>--- a/tests/intel/drm_fdinfo.c
>+++ b/tests/intel/drm_fdinfo.c
>@@ -36,7 +36,10 @@
> /**
>  * TEST: drm fdinfo
>  * Description: Test the i915 drm fdinfo data
>- * Feature: client_busyness
>+ * Feature: client busyness
>+ * Functionality: client_busyness
>+ * Sub-category: FDinfo
>+ * Category: Desktop client
>  * Run type: FULL
>  *
>  * SUBTEST: all-busy-check-all
>-- 
>2.34.1
>
