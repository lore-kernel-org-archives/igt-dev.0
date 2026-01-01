Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E9EE9410C
	for <igt-dev@archiver.kernel.org>; Thu,  1 Jan 2026 04:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8502410E1CC;
	Thu,  1 Jan 2026 04:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZE2aEJWb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D9710E1CC
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jan 2026 04:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767241033; x=1798777033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EoiqAoJ7MQjyEYnu73P6WDY84vzfAx4utGA/B58Jgto=;
 b=ZE2aEJWbv8SPEkJh1LAYi6iAFhlUWXACwUoHd4IRNYBYSoAJuI0jddtU
 3vtiDxFXd6jhoXMAM6YTjgS5O7oxROnFrhM6bdsbuxpNXtvzoBzK22H8U
 X/ZTeBgRb15Iq9E2JHf8tKV3+hbrFWtIib2NbvNSLcpkbJGYzvLXjdKuZ
 GZLS+5gauQkNcuNs9l60H7gewzcKqabxzXzE9dw284kj0RhWPinnj8x3T
 MvZPI965+K1Fh118fz7uShmsqFF8206ARRUxwiF9NpU/0yGFiWaM0Oecj
 vBVs4i7PPCF714vzmn570pfIHgnvQetfFmla86TIVtR+2XHghmoyz9WX9 w==;
X-CSE-ConnectionGUID: jySAl77iRwy5ps8R3Mvtug==
X-CSE-MsgGUID: JpV8AqRHRpamYM32Klvr6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68825330"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="68825330"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 20:17:12 -0800
X-CSE-ConnectionGUID: mBXEZF6/ToqWWWDaA9GVEA==
X-CSE-MsgGUID: 8fwGzG4xSlWLjQek1X94YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="201315805"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 20:17:13 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 20:17:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 20:17:12 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.51)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 20:17:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYbuDVpkEcO3Y44nYTxGLrLSC60Y+lA1nqDGWpuVEbJoyA+mXCqzZEQco137wX864TVqM+miHm0UtH/T+dRW022HsnZxxmSwU+TaAdBnVnBNMstEoUUv1CDMsC0E/wmDmI8Uh7etkEXkZlKrKCuC6aTo3sEiU7ldwVOpyYa/n26vu7KAm3nHvsKMqaWs/IyymH9lxeZIfRgG8cCkfwoFchTM9ulBlX9q2QhE4S/zyNNO9o4nJOn+hvqaQVep0YbQ2T+aQMaOhgnKFuCFhZawf+IyBkPj/xmqFVjSa8DQJrfwAIkIUBi3GWJ7yLukZ4zz56K9BqYLPwoynaAQ9cr3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvgwmRip8Dg65cpCbahbk+7CzIDXHe/5fx53zoRtP80=;
 b=aeclIPF2P2cAxM4mBc4I9RZ7njEkn6VGSMcF5Aud8bYMUq5xm5MX/IclcVqwf3r45ytgVpcV3F345WtSdT+w6aiBX1zEzy55uYIs0R57EDat7HmZQfe1/x5rl4V++YJSy9h+P8d8/CKmFKREQlEa77rqjPDoSsQFJdD3qk9nWkFECWqdsIvAgBsI8SzJmxELSUOJlYfqRSI8bmEf4yhx90bhzqOdUUAracvyHG3rjtheuASIl2q0z5R6aJCw4aMWurEwirImru4xHfjNrE7QCo7D0haUbE4MHXNvDn21d2+Z/EmDNPREt3uZ0BW8DwF3jlK9m0hcbrKTSy1on4x5ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 04:17:09 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9456.008; Thu, 1 Jan 2026
 04:17:07 +0000
Date: Wed, 31 Dec 2025 20:17:03 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 5/7] tests/intel/xe_exec_reset: Add multi queue
 subtests
Message-ID: <aVX1Pyb02_3hU6cp@nvishwa1-desk>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-6-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251219120154.695287-6-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BYAPR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:a03:40::44) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ0PR11MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c75d83-ba6a-4634-9ab3-08de48eca00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/8NNZZjqWMPCopve+ANj4VbXwGxwlKcoD4MtgAly9QIcHME+0wvwzLIIc1ls?=
 =?us-ascii?Q?8ou4dPo2doGvKDwquai6bfyzha8uelynvMcPecq6qn/At8m0zS7V0qIHHHu6?=
 =?us-ascii?Q?7HEO0cdzQ1wjgxI5T27HhShrJj6A00e6WDHmhRAZhIcGfqno34hiYmmH+Jel?=
 =?us-ascii?Q?iyXKm6P8E9lD8CV9Oz/1uoOe/wjnYkeD+bWnkg2XnCmMoAZdIckrP8B1jxWi?=
 =?us-ascii?Q?VXITlne6cK9z3JFWrs6AlXqPc3e9O2fHI1LL59k8eAUTm9F4kZMcb1CWW1SZ?=
 =?us-ascii?Q?uoxqxy2rQH71ad6noNk/XTibUJODJ/F4GB3/yeHzWDspRTuMjHQlyArWPjmJ?=
 =?us-ascii?Q?lQjNy20auk5AgSGM3iNYH8lCvv8yKQmnuHYWwCWJuyrpYFIe7Eb0njBxpz8z?=
 =?us-ascii?Q?uligUJXFWvZb+jajvHUDOd9Jv8HNQiUD2mYn+nXJvURKYw2+ObhEn4V0viZH?=
 =?us-ascii?Q?9uO36CAssfNyhRdvfq/fJ2xwPbC3oGyQkXL7+BF/2NBMmr7SqrC5SmPO+Z5j?=
 =?us-ascii?Q?yr2wSaxNNEFC4FhwdjeWkMUHZlGi91maBqL19w+AY4SWEZcZQkQ3QyF3pqPv?=
 =?us-ascii?Q?V1nWp7xrUpyId1aRdCwyDZ5qrAgqR9Xmhz7EhXSEQ7DWSjroSfRwIoir/YpA?=
 =?us-ascii?Q?48qClRKEuOyOybQK6kkWkuMOv9vAaJPmkGdj5lwVEm1UHqUJKVtbPhqkDrBZ?=
 =?us-ascii?Q?nARKVPrjkPoCdAEXbNk6Mblo1Ff2dmF2QbxS9uYXyejpM4caxzb6oAWGPl+i?=
 =?us-ascii?Q?vdRtVr3iZsXRN0wQolTOn29Zi1abkZLcBcuX324VgXydB9XkOI1bBdBmpSnu?=
 =?us-ascii?Q?h3uN4y8VEHHCLdAfDw20mZQm1aic88VKFqgFQEpSknEiYCEVS26F0uWzbn7e?=
 =?us-ascii?Q?HISWwTaor8HKN7koimVI3or5b6zvV84NTVooi2DtSiPItUtV9j9f9gDAddxI?=
 =?us-ascii?Q?xJTbOUHq/oQQPM0IpWgUfzCuTo3RwMGx8XdUHUiu5xki7tFFoVw5R5HWV6aN?=
 =?us-ascii?Q?Ue0iJiwaAAqx2me1hDVzIZ3wRbni0FsBR7mzuM0hlP+uSoY9MUfE+3ViA6tp?=
 =?us-ascii?Q?K954PjCLTMiw8BXDFAsip5N+t/rsDEnlbTdjVuD3aifm3uJraVSQJLFnq60r?=
 =?us-ascii?Q?fp8hHQGmiIscJrjfWjQ1/Ntknsj4Y5MR+ORAn+BwKePFt4YTNlFJLR0ykHcr?=
 =?us-ascii?Q?FL900LVn1oV8ww2cmi38gIsGdNPyifOIkqWdn3dbSIXqT+dTOUNlpyO0w7qi?=
 =?us-ascii?Q?ahQT9kKltTbWG8z99M7X1JNwYBV/2e+FThe2m9oSr8LVROsA3pvnoHHNhVC/?=
 =?us-ascii?Q?nuF9UEcB9eaKGbXUYTyBbXgXZOnfe+ldPN3tB+45FY+IjdjCXgStVPTHuA/h?=
 =?us-ascii?Q?ZAmOfCXqRzAXmkKGbOkSy3qo1+iZNF8SXIjziIVYaTIfcqxdJL8aMf1DFyow?=
 =?us-ascii?Q?4k9Hj/j7l5T+dXKQaS+7IfLnSRowfbRV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KNhXv85sJm2bLXlecbCDmtbfKtsGSSKVYM2eNgSJjnNwhutuy4jB0HfDn4M8?=
 =?us-ascii?Q?Ai8mCNDsJgqix9YrEgTs/t0asHGQPhxZf26Rn3Jjht69l0subq0dOUXE1Uq0?=
 =?us-ascii?Q?s2C/tFLEMop6JZkoobc0siJaUxlQ21NVh1fOTnQb+YpDlHBqlifqf8FlQiEs?=
 =?us-ascii?Q?/oThkXOC2S/2z9xYkO6Jr0Hz/rVhKNvU+CEhCigdEMZ9S59KeMQnBdjwweHw?=
 =?us-ascii?Q?ubutt81ZfUEcd8kObfN3iHCncTLbXze/mLZfzLBJw0liuZGihzQRG/iMZjzK?=
 =?us-ascii?Q?VksasJsp6YTiXgtjYGpy5T2Z27nsRYk5SeUW31mSQ3XT2RwZZj8ohFY8escK?=
 =?us-ascii?Q?eHOlPSkEIpxI0vpa5AKM5VQCubMrjRqbuanCAesdHhwssal9VeA126T2yX4t?=
 =?us-ascii?Q?6YwSdTXHKYPgw4liQjvYR2BLtKWV0aZsCuQ3uzJjg5euN+QVnALoTWktq4d0?=
 =?us-ascii?Q?VthZMUU7OgVrypGQUDnzN3Pm+nBkVxgtBTbUX282qKItIJtrOjruLHZCgs2r?=
 =?us-ascii?Q?RTM36grXzoJcHvLUHYLb/0Ok3BJaQUjbNddc4xqKfa9vKNXscBLqKO91h7eW?=
 =?us-ascii?Q?bGPB0SK8Hy8GF3N/0j2ZNT2u+78motMqSCfHl+QZ3Y7C/KFQhzKClJp/YZM9?=
 =?us-ascii?Q?0AvPsWQ0pS/D2T5krTFHT+UiAjNoflyiBvZ8B2djh0TdYruykDH7EBPQ0iPf?=
 =?us-ascii?Q?DSauFN8dvB3JOr62JSl1K+pCnw2LxY85zcAQEwx8spLgRbyGoA8Wyi4uKQ4i?=
 =?us-ascii?Q?h4Yirn7XMwM8UD/MAoXczS4xvZ1RMwfGP/cKllEdBSiNLoWuoHhX3KiyUFP0?=
 =?us-ascii?Q?5yd3O1iy9Ykfz8nTkaFx8s1gb7wuViMLC1UMPieAmvj/MKuBgwQkUYXz19M8?=
 =?us-ascii?Q?eVLVWXF9P5aLimwwVm/YqYW5DQvy1DkkvdsSmAF8A5OUBZjObLjZg5SPznhH?=
 =?us-ascii?Q?tQFg113o4NmeLbqIrP4HnlQsMcoBolOkMu7rJT5NIFEVsu7f2xrv/X0jWSEP?=
 =?us-ascii?Q?bGD9v4GDu8nd9hu8cFE1fCjF2cOXv9kDDdbctkMhvgpiy24Urha/h98LIugN?=
 =?us-ascii?Q?8uuKufNRPOysjqi3pODYSmKP00l8Z5jxVfcPIe40ZbH//ulPibxHV2mF5ORv?=
 =?us-ascii?Q?n3ogiGUqI4ZWmScZ9ngFazvNF5Ahgw4aU4N07DG0a4PI9vcU7YOzneIL0Nmb?=
 =?us-ascii?Q?vxtOUFKjErVG6ywMyFykSgYk0QzSFMf8vk5v9CaxeehkdflWj+AnhJKLCIGU?=
 =?us-ascii?Q?IfvWt3LRXqWKxa3et8CSa5H2phLjqjQnya/DtIY6XjRanxiwJv1AhtNqnJ0h?=
 =?us-ascii?Q?DHtWKZO7SKEqisnC7UfcE+/qHr4yVEtI2jHIY6eff4RR7TJDUHMFB7hhAiIK?=
 =?us-ascii?Q?bttYpCohKX4wkfXJQnnSB8HsCnQUq1MBOMkWUvvUNSF+VmSs2lcGCRw5s/gD?=
 =?us-ascii?Q?OKU7ntjY2PRCDu+Ssk7u46ienAnJL8bec78clvAbcflXDhiGSl8EZY2j6l5y?=
 =?us-ascii?Q?1ikvlGjlXEsbthkI6gsx6vlCquGZwVA3U+u80bkGp4pUhP9kFVyE1tyWyRcp?=
 =?us-ascii?Q?rXT/q8Re7sUmsp7/yif8TVHNEZs+BjZJavH5GZH/aDCgtK7xI04l7x+52XK7?=
 =?us-ascii?Q?BHrDXiOxaEsZBIwOBagEDbV4+EPRVL3u5O2wuMpg/BzzNO2jCEHkaJ5Lt/o/?=
 =?us-ascii?Q?EmJWBWumrB0OmgLf7rSbltNBqaenPi9a9rZIz4nw4FbplcHpnIgGCtdAjZ3M?=
 =?us-ascii?Q?ZEN9TG7+mm3pKbZBjSFgTVL34k8DNi5hAmbJ92Iiu0JMii9va9Va?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c75d83-ba6a-4634-9ab3-08de48eca00c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 04:17:06.9849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9pLgSwENt2SVIHpRLcX5vOhOwNmCo7+3abWCD1nk0Ktd3M6YanCbageygCzSHXzu6z/pdENBdB7VPgmbpqvnXXtsrvRKuD3zjSNZGKycAIELLPDJpaHILTN4l26b4HHk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
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

On Fri, Dec 19, 2025 at 05:31:52PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Apoorva Singh <apoorva.singh@intel.com>
>
>Add multi queue subtests with gt reset, engine reset,
>close fd, close-execqueues, cat-error.
>
>Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
>Signed-off-by: Fei Yang <fei.yang@intel.com>
>Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>Signed-off-by: Daniel Charles <daniel.charles@intel.com>
>Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>---
> lib/xe/xe_legacy.c          |  38 +++++--
> tests/intel/xe_exec_reset.c | 197 ++++++++++++++++++++++++++++++++++--
> 2 files changed, 222 insertions(+), 13 deletions(-)
>
>diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
>index 084445305..6572617fd 100644
>--- a/lib/xe/xe_legacy.c
>+++ b/lib/xe/xe_legacy.c
>@@ -26,6 +26,10 @@
> #define GT_RESET			(0x1 << 0)
> #define MAX_N_EXECQUEUES		16
>
>+#define MULTI_QUEUE                     (0x1 << 20)
>+#define ENGINE_RESET                    (0x1 << 21)
>+#define FAULT_ON_SECONDARY_QUEUE	(0x1 << 22)
>+
> /**
>  * xe_legacy_test_mode:
>  * @fd: file descriptor
>@@ -69,11 +73,18 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		.ctx_ticks = flags & LONG_SPIN ?
> 			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
> 	};
>-	int i, b;
>+	int i, b, hang_exec_queue = n_exec_queues / 2;
>+	int fault_position = 0;
> 	int extra_execs = (flags & LONG_SPIN_REUSE_QUEUE) ? n_exec_queues : 0;
>
> 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>
>+	igt_assert_f(!(flags & FAULT_ON_SECONDARY_QUEUE) || (flags & MULTI_QUEUE),
>+		     "FAULT_ON_SECONDARY_QUEUE requires MULTI_QUEUE to be set");

Isn't the ENGINE_RESET test also only valid if MULTI_QUEUE is valid?
If so, we should assert for that also. If not, then we need to add a subtest
for that only (without multi-queue).

>+
>+	if ((flags & FAULT_ON_SECONDARY_QUEUE) && (flags & CAT_ERROR))
>+		fault_position = 1; /* index that complies with index % n_exec_queues != 0 */
>+
> 	if (flags & COMPRESSION)
> 		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
>
>@@ -101,7 +112,20 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	data = xe_bo_map(fd, bo, bo_size);
>
> 	for (i = 0; i < n_exec_queues; i++) {
>-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multi_queue = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+
>+			uint64_t ext = to_user_pointer(&multi_queue);
>+
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>+		} else {
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		}
> 		syncobjs[i] = syncobj_create(fd, 0);
> 	}
>
>@@ -123,7 +147,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	}
>
> 	for (i = 0; i < n_execs; i++) {
>-		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && !i)
>+		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && i == fault_position)
> 			? (addr + bo_size * 128) : addr;
> 		u64 batch_offset = (char *)&data[i].batch - (char *)data;
> 		u64 batch_addr = base_addr + batch_offset;
>@@ -133,7 +157,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		u64 exec_addr;
> 		int e = i % n_exec_queues;
>
>-		if (!i || flags & CANCEL ||
>+		if ((flags & ENGINE_RESET && e == hang_exec_queue) ||
>+		    !i || flags & CANCEL ||
> 		    (flags & LONG_SPIN && i < n_exec_queues)) {
> 			spin_opts.addr = base_addr + spin_offset;
> 			xe_spin_init(&data[i].spin, &spin_opts);
>@@ -157,7 +182,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		exec.exec_queue_id = exec_queues[e];
> 		exec.address = exec_addr;
>
>-		if (e != i)
>+		if (e != i && !(flags & ENGINE_RESET))
> 			syncobj_reset(fd, &syncobjs[e], 1);
>

Why is this required? Even if we reset syncobj of the hanging job,
the new syncobj will still fail as its job will be stuck behing the
hanging job, right? Asking because looks like we are skipping this
step irrespective of whether that syncobj is going to hang or not.

> 		xe_exec(fd, &exec);
>@@ -224,7 +249,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>
>-	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
>+	if (!use_capture_mode &&
>+	    !(flags & (GT_RESET | ENGINE_RESET | CAT_ERROR | CANCEL | COMPRESSION))) {
> 		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
> 		     i < n_execs + extra_execs; i++)
> 			igt_assert_eq(data[i].data, 0xc0ffee);

So, we are skipping data validation for CAT_ERROR also irrespective of whether
it is multi-queue case or not. Is that intended? If so, that should be a separate
patch (independent of multi-queue).

>diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>index 7aaee31dd..fe496a538 100644
>--- a/tests/intel/xe_exec_reset.c
>+++ b/tests/intel/xe_exec_reset.c
>@@ -125,6 +125,10 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
> #define SYSTEM				(0x1 << 12)
> #define COMPRESSION			(0x1 << 13)
>
>+#define MULTI_QUEUE			(0x1 << 20)
>+#define ENGINE_RESET			(0x1 << 21)
>+#define FAULT_ON_SECONDARY_QUEUE	(0x1 << 22)
>+
> /**
>  * SUBTEST: %s-cat-error
>  * Description: Test %arg[1] cat error
>@@ -355,6 +359,68 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  * Description: Test compute mode close exec_queues close fd
>  */
>
>+/**
>+ * SUBTEST: multi-queue-cat-error
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Test cat error with multi_queue
>+ *
>+ * SUBTEST: multi-queue-cat-error-on-secondary
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Test cat error on secondary queue with multi_queue
>+ *
>+ * SUBTEST: multi-queue-gt-reset
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Test GT reset with multi_queue
>+ *
>+ * SUBTEST: multi-queue-engine-reset
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Test engine reset with multi_queue
>+ *
>+ * SUBTEST: multi-queue-close-fd
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Test close fd with multi_queue
>+ *
>+ * SUBTEST: multi-queue-close-execqueues
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Test close execqueues with multi_queue
>+ *
>+ * SUBTEST: cm-multi-queue-cat-error
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Test compute mode cat error with multi_queue
>+ *
>+ * SUBTEST: cm-multi-queue-cat-error-on-secondary
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Test compute mode cat error with multi_queue
>+ *
>+ * SUBTEST: cm-multi-queue-gt-reset
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Test compute mode GT reset with multi_queue
>+ *
>+ * SUBTEST: cm-multi-queue-engine-reset
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Test compute mode engine reset with multi_queue
>+ *
>+ * SUBTEST: cm-multi-queue-close-fd
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Test compute mode close fd with multi_queue
>+ *
>+ * SUBTEST: cm-multi-queue-close-execqueues
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Test compute mode close execqueues with multi_queue
>+ */
>+
> static void
> test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		  int n_exec_queues, int n_execs, unsigned int flags)
>@@ -383,10 +449,17 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		uint32_t data;
> 	} *data;
> 	struct xe_spin_opts spin_opts = { .preempt = flags & PREEMPT };
>-	int i, b;
>+	int i, b, hang_exec_queue = n_exec_queues / 2;
>+	int fault_position = 0;
>
> 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>
>+	igt_assert_f(!(flags & FAULT_ON_SECONDARY_QUEUE) || (flags & MULTI_QUEUE),
>+		     "FAULT_ON_SECONDARY_QUEUE requires MULTI_QUEUE to be set");
>+
>+	if ((flags & FAULT_ON_SECONDARY_QUEUE) && (flags & CAT_ERROR))
>+		fault_position = 1; /* index that complies with index % n_exec_queues != 0 */
>+
> 	if (flags & CLOSE_FD)
> 		fd = drm_open_driver(DRIVER_XE);
>
>@@ -401,7 +474,20 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	memset(data, 0, bo_size);
>
> 	for (i = 0; i < n_exec_queues; i++) {
>-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multi_queue = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+
>+			uint64_t ext = to_user_pointer(&multi_queue);
>+
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>+		} else {
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		}
> 	};
>
> 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
>@@ -411,7 +497,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	data[0].vm_sync = 0;
>
> 	for (i = 0; i < n_execs; i++) {
>-		uint64_t base_addr = flags & CAT_ERROR && !i ?
>+		uint64_t base_addr = flags & CAT_ERROR && i == fault_position ?
> 			addr + bo_size * 128 : addr;
> 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> 		uint64_t batch_addr = base_addr + batch_offset;
>@@ -421,7 +507,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		uint64_t exec_addr;
> 		int e = i % n_exec_queues;
>
>-		if (!i || flags & CANCEL) {
>+		if ((flags & ENGINE_RESET && e == hang_exec_queue) || !i || flags & CANCEL) {
> 			spin_opts.addr = base_addr + spin_offset;
> 			xe_spin_init(&data[i].spin, &spin_opts);
> 			exec_addr = spin_opts.addr;
>@@ -466,8 +552,14 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		int err;
>
> 		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
>-				       exec_queues[i % n_exec_queues], &timeout);
>-		if (flags & GT_RESET || flags & CAT_ERROR)
>+				exec_queues[i % n_exec_queues], &timeout);

Looks like unwanted indentation change.

>+		if (flags & FAULT_ON_SECONDARY_QUEUE) {
>+			/* exec may result on -ETIME for fault on secondary queue */
>+			igt_assert(err == -ETIME || err == -EIO || !err);
>+			if (err == -ETIME)
>+			 /* no need to continue checking once -ETIME happened*/
>+				break;
>+		} else if (flags & GT_RESET || flags & CAT_ERROR)
> 			/* exec races with reset: may return -EIO or complete */
> 			igt_assert(err == -EIO || !err);
> 		else
>@@ -478,7 +570,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
>
>-	if (!(flags & (GT_RESET | CANCEL))) {
>+	if (!(flags & (GT_RESET | CANCEL | ENGINE_RESET | CAT_ERROR))) {
> 		for (i = 1; i < n_execs; i++)
> 			igt_assert_eq(data[i].data, 0xc0ffee);
> 	}

Some legacy mode comments applies here for compute mode also.

Niranjana

>@@ -979,6 +1071,97 @@ int igt_main()
> 		xe_for_each_gt(fd, gt)
> 			gt_mocs_reset(fd, gt);
>
>+	igt_subtest("multi-queue-cat-error") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			xe_legacy_test_mode(fd, hwe, 16, 256, CAT_ERROR |
>+					    MULTI_QUEUE, LEGACY_MODE_ADDR,
>+					    false);
>+	}
>+
>+	igt_subtest("multi-queue-cat-error-on-secondary") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			xe_legacy_test_mode(fd, hwe, 16, 256, CAT_ERROR |
>+					    MULTI_QUEUE | FAULT_ON_SECONDARY_QUEUE, LEGACY_MODE_ADDR,
>+					    false);
>+	}
>+
>+	igt_subtest("multi-queue-gt-reset") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			xe_legacy_test_mode(fd, hwe, 16, 256, GT_RESET |
>+					    MULTI_QUEUE, LEGACY_MODE_ADDR,
>+					    false);
>+	}
>+
>+	igt_subtest("multi-queue-engine-reset") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			xe_legacy_test_mode(fd, hwe, 16, 256, ENGINE_RESET |
>+					    MULTI_QUEUE, LEGACY_MODE_ADDR,
>+					    false);
>+	}
>+
>+	igt_subtest("multi-queue-close-fd") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			xe_legacy_test_mode(-1, hwe, 16, 256, CLOSE_FD |
>+					    MULTI_QUEUE, LEGACY_MODE_ADDR,
>+					    false);
>+	}
>+
>+	igt_subtest("multi-queue-close-execqueues") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			xe_legacy_test_mode(-1, hwe, 16, 256, CLOSE_EXEC_QUEUES | CLOSE_FD |
>+					    MULTI_QUEUE, LEGACY_MODE_ADDR,
>+					    false);
>+	}
>+
>+
>+	igt_subtest("cm-multi-queue-cat-error") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_compute_mode(fd, hwe, 16, 256, CAT_ERROR |
>+					  MULTI_QUEUE);
>+	}
>+
>+	igt_subtest("cm-multi-queue-cat-error-on-secondary") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_compute_mode(fd, hwe, 16, 256, CAT_ERROR |
>+					  MULTI_QUEUE | FAULT_ON_SECONDARY_QUEUE);
>+	}
>+
>+	igt_subtest("cm-multi-queue-gt-reset") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_compute_mode(fd, hwe, 16, 256, GT_RESET |
>+					  MULTI_QUEUE);
>+	}
>+
>+	igt_subtest("cm-multi-queue-engine-reset") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_compute_mode(fd, hwe, 16, 256, ENGINE_RESET |
>+					  MULTI_QUEUE);
>+	}
>+
>+	igt_subtest("cm-multi-queue-close-fd") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_compute_mode(-1, hwe, 16, 256, CLOSE_FD |
>+					  MULTI_QUEUE);
>+	}
>+
>+	igt_subtest("cm-multi-queue-close-execqueues") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_compute_mode(-1, hwe, 16, 256, CLOSE_EXEC_QUEUES | CLOSE_FD |
>+					  MULTI_QUEUE);
>+	}
>+
> 	igt_fixture()
> 		drm_close_driver(fd);
> }
>-- 
>2.43.0
>
