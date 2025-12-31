Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142DBEE6441
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 21:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FE010E69A;
	Wed, 31 Dec 2025 21:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwv4tXOl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0E910E69A
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 21:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767216676; x=1798752676;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3jTcXl7O4hKEdy0Q7srMNsYNe4/AW3d5VIko2w7baEs=;
 b=lwv4tXOlsXwX2Zz2Lr/GKVBOLc9mTm0XF6eduNPCNLH5Y3g0dkK2Hsez
 FIk3Bt2Ac6QpD79+fNBFpUGjVkRMrXp5Z1qRt58ADoaSFzu5MBzp6ToiV
 ow4hM/QydHTsrh47gSA7sb7kzyKReUO9K7AWCAXabXI6thdNm1cIW0hMK
 DgBB9DPQx4GxMJS0/OpOAoGqvJ0HV3BHmXg5QRNMduBXDQVe3dzcXHoda
 HuKUfxW0gfPpl6B0a/aDqUsnEIi1FdIPtbqNXDhtzVgsiDaLbSYf28euu
 UKd5EIUsHHQ7/WFf2KlpnmkbR319b7sbY5xuTE1vE40OtcSPraNHtz4bf Q==;
X-CSE-ConnectionGUID: 2ctjNn2LS/yqwXuC4eOnUw==
X-CSE-MsgGUID: j+ij3TUpSAOOQ0BNXIoxIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="56345054"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="56345054"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 13:31:15 -0800
X-CSE-ConnectionGUID: dHj4SwW0R+WK948vjkGMcA==
X-CSE-MsgGUID: Fu9oVNIfR+uXk4OQaRPvNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="206557692"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 13:31:15 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 13:31:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 13:31:14 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 13:31:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jh80q114bFz8fDU9a6FbWyPF3Ukq/gDOf0RVYOB2okpIAOX1xFzA4oNTo5Pbo5WsTANS+IpmoLdslOm0DhMm++qR0DNZoQhN8MmGfhMxxk8ri2RYskGZwrAZAf1mmdKFioNGjLE8xDm7wZlR0mWLn0U0sNQemx7E9sSmX4qBT/4cXCt4AB1utU+jGZADIqTAtgpN8uCV72hd/h6NEztFRUrqLIH3cFQP5QnacWH0xDEXOlkIl2/Sb/vwywVIqlxH+zkKs5g7gg4wWCf1e+2nLvEuFuDfoSrflb4hkNs5MEdtUwW6VjrCsZecq8SoYoDiD/t1MVZuwwatpwvXtbm6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6fO3KwbdAjMXKb1K0CccM2ojkYWPaH+BVyx2f2bqpU=;
 b=aHFZCCJ5X9wO3ilNDv21xT5FIWXNOCQcYI1WsO+nrpzNiEWBuIduVHFVWPHZpCIFf7fF6RdwOLjwSleXStjUcsIKMI58DJ3WNabB6H9eTPybiFXO/3vMpu6qUg6Pb0qryqzG1mW7SAhh4gJCiZRM8dmqAyHBOSvmfoTl6+PRjR8bh/LRFNZMOqOc/JC8yZrwpSQoZU1vHKcIcwzYLO0ah45Bwp48m62Tvt3WIgObVvh1Xe63kjYuAzbHz3TaZPvO+XnfIpB8hNFTNshncd01WRxKjbJpENaj22B4mXVmQqH4+SHyOIA+3dSvJjTpVhnxKiw55u0AQ1gSNFFzPYTC8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB8045.namprd11.prod.outlook.com (2603:10b6:806:2fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 21:31:11 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9456.013; Wed, 31 Dec 2025
 21:31:11 +0000
Date: Wed, 31 Dec 2025 13:31:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v10 2/5] include/linux_scaffold: add FIELD_GET() bitfield
 helper
Message-ID: <20251231213109.GJ1180203@mdroper-desk1.amr.corp.intel.com>
References: <20251231202010.115619-1-x.wang@intel.com>
 <20251231202010.115619-3-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251231202010.115619-3-x.wang@intel.com>
X-ClientProxiedBy: BYAPR06CA0060.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::37) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: e75a2dee-7f3b-42e1-6b29-08de48b3eaf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?plP291LctVC9tsrgcSKIgp4zJVI3tQ3tRYk80BRF7qulRojSw0lPvs4ZoHra?=
 =?us-ascii?Q?AAxdmsH6GszEuW9WwfS8x+78nRkgSOfoCku2Oril9bpx7qzNFsiHk6NkHzty?=
 =?us-ascii?Q?cxwGCzoxYlMOMBrpBxZdxmsMKBK/Q3XOlYP6fF1DXLzGytwdj2JoTa7EDZHn?=
 =?us-ascii?Q?pdQdxOBnHrdvkPBbWp6Uzx8hXIpjShmNoiiaNDQ+UsVUO8fWUjAwzfzFORb+?=
 =?us-ascii?Q?msQyveJgL+Pf0ZqwKgDTVWsiF3eeOz28ZK0Jnw3I4GwFOP3OAYPNYa4kyO0B?=
 =?us-ascii?Q?269iwn3Iww0b0HxCy1WYlXDW6zGPmacVSuzwEzHmrJvLxsvv5pnczacgt8w2?=
 =?us-ascii?Q?K7KLN4g1kRlkWc4jJAECcIrCNL7pq5N6jhe0gIJbehZHKi49t+jhhUJ/NIBZ?=
 =?us-ascii?Q?UEgpj/+3CCcwfOA2lyZIavtXgw45hVN7Pw75LbrBk0uqUuBtUUd87Ek1I1X0?=
 =?us-ascii?Q?bbMu+OcIA5cc8OqCQ/3TpFPft4FjMoMA0EKcLYZ62bwwEUAbjGeX/WZcLNDU?=
 =?us-ascii?Q?F6NbU0aOww0/0Gh8hnzzrgW/NbKlHtNWy1qbMANAtIjjd+qIgaSaF60gF/+n?=
 =?us-ascii?Q?qlDhEf8lq5z6qywt6y27wtQLLZcQ1DyALWmRf4wdZcbEQUjSVwB48xyQeqpL?=
 =?us-ascii?Q?tjS05IlR+ZdPpz5V3/XLhNDuyFKqgtN4SQikWpSuSQwgphfQimQ4ycj3nj/o?=
 =?us-ascii?Q?ZHiYeKBcL7Y13gNKWJj+Fsf/JO7RGLZauGFOaobw9EHgrPHCZvUPcWHll/Et?=
 =?us-ascii?Q?cNiBhtJmiRbDFjkSWGeOWNvzgj2VIFq/8sSbSBCp8lGzxm36hKDZNUp7PodH?=
 =?us-ascii?Q?OYJXrn0Dr7LlEHNFYpETtdXxP3Z7sPOLES11DdK7sefHFNmL8GQDzf+pBynY?=
 =?us-ascii?Q?hhi33LxFTI/UnXku+DdAtxm1Q6JUfJyZhgDBoM/T8FoJipC2yOdAkbW3XEeL?=
 =?us-ascii?Q?T9kYNCHG0hwK3BuMV6T7C1KUBAWfFFpRhYed6xCUFpGe9l/fE6bQaaivGBSC?=
 =?us-ascii?Q?Uvo2kOBI0ih8BU77xFOfc20pEC0HqWyyobEyO6Xthu2b+A5jHF0FmzuwBxOd?=
 =?us-ascii?Q?ihmBued0wI1Tp+r4r1Bcek4hoerzzuZGF9ggeytUIXYF7V27lpMp6jKXp5FM?=
 =?us-ascii?Q?F9Vx+6uNoML0AhPdrRqPkCyPsCb9UHoI+byC2pSDGmhEytJ0loTQKi1yPkMx?=
 =?us-ascii?Q?ZSK04U5t+aET+01wY5u0lm5oBfcV/9oRFoseYKn30+U2MnqbXR0Y6m2QzBtq?=
 =?us-ascii?Q?fH39zqGunyWi0eNY5yE30yBOMH/8u/IxdskSptz3cC9W9tGjDngr7SfQVQxB?=
 =?us-ascii?Q?w/+zlxhn81GlUwam3Ebicpl2lUgZEThVhnYurLmhtp//bXTp3RV5/Lyl/stz?=
 =?us-ascii?Q?YP+oAuj/Q2wd/OOo3EpM5ZhlcnUlHAa+u33P/aOYoYwCb1puL8Cfg33prvdu?=
 =?us-ascii?Q?a7CCEJICJ9BTDItNDxirHxPiA0C7z5mw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?06vSybpRr9xZXrCtf/oV1faKjoLhAsGhLwkXVgeAZ8RPotxhoaGew63WSJEz?=
 =?us-ascii?Q?LlDaEJkVrs0VXL2IQadgNbdrjm03htJfPDtvQns/IaTYX0HWNe1616pNL7xg?=
 =?us-ascii?Q?2yoAJvD3Jjj2q5Y6YJxtaksYsxX27MEtew5GH4XnlehRwIczT1Q77+YIELga?=
 =?us-ascii?Q?UysNZIf2j2+5zThJ7Mp3TRtf2z6yZAX3HxZxHc3nbIJsIGpzVaJ1CiV/ltH5?=
 =?us-ascii?Q?EPZPONt8SgqSDVPF4JqettvwG6G0gleI091wR0ZocjPCaxn4UX/XrgD0nn/c?=
 =?us-ascii?Q?zhgs0aRCbf0tgYeYrKhjbqhERyBwD7EdVNLsxbgoMcbl9zweOoYP1i1+qWiW?=
 =?us-ascii?Q?QTzNVhdXKbuaL5qeBCpjx/7DMnZJQAxpIrKZHjQZNzAR1nfVUF2BoV+o0BB2?=
 =?us-ascii?Q?Sp9gpy1SeoAD1aNlGqAPOjKqPcoMqJmTN+ywpFkLerzIeJSsq6h8I9tIXLHq?=
 =?us-ascii?Q?NsWPmXJ7oiLDHFluDsdU97x8M38cYzC3Gv4ZqPEmQz2Wp4nqRcHsEVvhp+v+?=
 =?us-ascii?Q?sGr97C71QnkvGEaIfQqlMFPOk5cLCvesCboKbUVJ1bFfgwGIqGSH3aHFjx9W?=
 =?us-ascii?Q?SLP+2oArhETRo5pWMFb/itGJNxm6bLw8KQEM2IeVLeXDfk6zh7L/prH+xgKJ?=
 =?us-ascii?Q?Kmn3K/H+VWqyGQlr6lxQaev90KZHXxWX67oKeP9jcMG9+hoUJlz3qmGUUO6j?=
 =?us-ascii?Q?9yhr2LIaPOLaZ6hiVmbhC2cGCcfn9K1v6t7SfJ7OvYsBVIcXh7VJbgnvBXRp?=
 =?us-ascii?Q?wCvANpsjBo3juAaM548HGLqa031sl6H6LL7ErKYuL0l8YTBhbFQVij8UWDfo?=
 =?us-ascii?Q?o7maNyaDnKMcOT35zVvDYg9WhkBzTLutg7dTF06L1e7v7QAOZiVCac6qrCKK?=
 =?us-ascii?Q?85J+Q/bsxL2QUPoyqOdssWzNhArR4qlVIrnmMMS0WWsDclFPPllFrJ2CXcGX?=
 =?us-ascii?Q?YVQH7DwVT522cajYrcxaMDrcmbEOFBerDtoVYiQDu2bCk2bf7ElyNoo4HePp?=
 =?us-ascii?Q?2UYEks+0646VBdoQgtmpuFJH1Q5HNBt0gu847ByQAgiu4h2sKD58/T5/l46m?=
 =?us-ascii?Q?LJThkXk1/TH21mr01vLNW1TB0SEBDIreHMNhpHaKJOOo6ee+5nta7NeTS9DS?=
 =?us-ascii?Q?C60c4bvtzmd232zOwL9aRQvOidIu3WE1QAWYqToS53n0CfABPGAadLpX+sKn?=
 =?us-ascii?Q?SyIpy5DdJN19hzX6u2cUhAxXncAYl5ur3dbIw0ztRVspdMtYYIdfSl0dZRWV?=
 =?us-ascii?Q?ayq/QBRo/zorLpelunZwGKMr+8z/j5DXGGTTuE4U1mTYsOXeSo+o7d05WTnU?=
 =?us-ascii?Q?ChlqMCJ1Uuu9BhQp2rpPVAWBFLpYMxaGlDPw6tPbUIiNBrtJf+MXlQrlY6RH?=
 =?us-ascii?Q?XTSQncYFJLDEoEu4CRkm44W301qoTU0+81zETu5GAVuMK0VbGawV4GK/jzt0?=
 =?us-ascii?Q?a+Q37NnXVYPKjr80Hl3y6mEnb3IUT6xC2eGEzBULx7aX3qZEYmfTsNXohNxK?=
 =?us-ascii?Q?f3d5Zr6sKA8WlrpABDNcl6ufZQaIruxAygU8nJ1o7/RHVlsH4aHfGf/yYwz1?=
 =?us-ascii?Q?zaKhagfr4qKnsj+W3MgWvEOv9iiyfQ9c/R5z3/OS131HW57e890AV6KOluuc?=
 =?us-ascii?Q?q70CM6MjEdT8M52csiILmRlrNq5ZQxBTK6hkFYuToL3oMkGRqN18V7eTCG0p?=
 =?us-ascii?Q?dhOz6PQJaL/BykCF9p/O6sJfcX+cY9DkVYhJlrko3uD8Gd7f34ahDU5GP/Re?=
 =?us-ascii?Q?450BBXnGdCI9wZ1iAVSiApA8Vs7V74U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e75a2dee-7f3b-42e1-6b29-08de48b3eaf1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 21:31:11.3824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qA3BNpMhcOv6K6rtWUo9aTIrIzjunro6rCnkZGEX6PKCq4frEh5pXzDsRJDXK49cYq/uF7eWviD9UagOlEi8UBIjwbWpFmdl0kYwbgLS/KI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8045
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

On Wed, Dec 31, 2025 at 08:20:07PM +0000, Xin Wang wrote:
> Add __bf_shf() and FIELD_GET() so code can extract bitfields from
> registers using a mask, matching the common Linux FIELD_GET()
> semantics without pulling in kernel headers.
> 
> V2: (Matt Roper)
>  - use the libc ffsll() helper instead of __builtin_ffsll()
> 
> CC: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  include/linux_scaffold.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
> index f6620ad0a..281aa5e73 100644
> --- a/include/linux_scaffold.h
> +++ b/include/linux_scaffold.h
> @@ -4,6 +4,7 @@
>  #define _INTEL_GPU_COMMANDS_SCAFFOLD_H_
>  
>  #include <stdint.h>
> +#include <strings.h>
>  
>  typedef uint8_t  u8;
>  typedef uint16_t u16;
> @@ -51,4 +52,9 @@ static inline s64 sign_extend64(u64 value, int index)
>  #define BITS_PER_LONG BITS_PER_TYPE(long)
>  #define BITS_PER_LONG_LONG BITS_PER_TYPE(long long)
>  
> +#define __bf_shf(x) (ffsll(x) - 1)
> +
> +#define FIELD_GET(mask, reg) \
> +	(typeof(mask))(((reg) & (mask)) >> __bf_shf(mask))
> +
>  #endif /* _INTEL_GPU_COMMANDS_SCAFFOLD_H_ */
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
