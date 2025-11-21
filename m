Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9E4CFA464
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 01:16:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA16A10E07E;
	Fri, 21 Nov 2025 01:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a81GUwlK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A5010E07E
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 01:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763687811; x=1795223811;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lCPyon9bRgAJKhyKF3tX7PH+JVo73oOndVaAG5G2bjs=;
 b=a81GUwlKysRKkWV9PqV+ryPBYTZtklTWrHjLvATJddH3Ltt5q7MR28cy
 k7CwQ8XVTccsIvNxqBKf15e/oD4LTHrRam8+5TbbYZ0X8+ha/jNQ4JYGu
 oL2imIaUwJzZvwXZKyVhKRpzjvvccu4eoLmzx51Aw0u7t21khX+loR1J2
 LeNgN9L/DPi/E9zE+mbhVX7nzfbiOcIR9IPrQ7nHP/OaKbIel+2VgpcQy
 RL0CrYxPLz+ND0+/MZFP1pdcC7WTpdqqkd7WxOKxcwrN4bWRBUxXj30HB
 97wpyj+DPflBo3pvkEFziIlq5aZo/guYN1OSqwN5E263yuHxYbuEveipR A==;
X-CSE-ConnectionGUID: 34S29DAITFWXlEO+kEGcpA==
X-CSE-MsgGUID: L8A1gfL7Tym6rknBS5nEaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77244415"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="77244415"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 17:16:51 -0800
X-CSE-ConnectionGUID: 31KbcHxqQVCsKlDnKbt4QQ==
X-CSE-MsgGUID: WeY+UZzlSAGzldoygm10BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="195822114"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 17:16:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 17:16:49 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 17:16:49 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 17:16:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H43SS/qGUexjHbZZqaepWjzBLyF4La5Azpm8WaGfvWpmFyXMuEjYQeKFLRdopG9H5zbgnfpyv0Uzf5GVylFXgzdohXGuzLKZtbxBfCzRdDEqk++cFlAQ94R9+5na25Em6e8XODdqQE0YLk+qB/71zcRDWe95rp52L2caYSOBzJ3noKBjUoQ3njqSMF9i5eWbig7hoNru/J/5zg8ksf0CerhyyU69Hjnn1d8BKSFWuHvCz0v/IUQzrwJxB1tOFBFLXF2i4YUkYAtAn4zrM68OEMqI3JWFtnqnhwOBx7UUALhkTezBAZ8tXe2S5BW4Z9asWPZ90+uUX4q1CoT+Yn3s2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRg8Yeg9HWjjNUGYxhfha32Zbm48J0fhxgb0A2KqF+M=;
 b=nbVkjyTdjWrBiJdcI3iRhTFLjET6r9hb/H/07He1spciVIJmZ//Dzth/ZL6RDlCZNn0LJaT+NsVVOxh0067cD+bdglyZEbSU5ekl5vqkwfD/AhJxP1Gpj2Rfg65qksFPXjibOlP9K/veE6hTNiSgv2CMcfTB+NHxijrj69T9TlpugQHuBmjiCsJx9MZceRiQwO4+OkUVpXAxaC121ZSf55os1FbyJ1fDOWG/TwTDPDmSjPkpiCyWyqnIXqVpErfyuvl9HouFQrHBVsSw6noCyOtV/p07BMo2wWS8dGA2QEmHktXtFtyNqOELV6Tp0/FsAQsLpATy8cW09ZJpA5FF1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS7PR11MB7692.namprd11.prod.outlook.com (2603:10b6:8:ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 01:16:41 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 01:16:41 +0000
Date: Thu, 20 Nov 2025 17:16:38 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 04/18] tests/xe_exec_multi_queue: Validate exec submissions
Message-ID: <aR-9dquvgE2VmEJY@nvishwa1-desk>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-5-niranjana.vishwanathapura@intel.com>
 <BL3PR11MB5747BC427D0369D4E078B285D0CEA@BL3PR11MB5747.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <BL3PR11MB5747BC427D0369D4E078B285D0CEA@BL3PR11MB5747.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0155.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::10) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS7PR11MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: 209d8aa5-f30c-4228-be5f-08de289ba07a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?taI0cCpS2cunQMUUFMDvTJMsMldwqLn3FG6GOTAeAgZQuGkoRJw2er1AfU9Z?=
 =?us-ascii?Q?1LEmzi5yv2DEGoPHwWuFM1pQl1EcUQ+J2NGOwzuDryAXHL1Q+/zXF9jQjhpJ?=
 =?us-ascii?Q?RM0o3tp7vH//UVtcyc0IGX1NOJgpTODLjxV4BxzMCRYX/ibiDbl6pbcCoJlI?=
 =?us-ascii?Q?iHlEKb+0H6qUh8ZW69jhK1EvMseoZcW/oIBgYCYBZGeIq/j4iUWfrYUjU/NL?=
 =?us-ascii?Q?qpjzgxLAyoGYzy+sIiYLIdXYtpsa8scXWlOMORr2Ct94CbAnQYlkGsd6SSua?=
 =?us-ascii?Q?s//kf+XvOwv2I8keZ3IWVGIUiiVYV6E54kEjH9PZXGkqVEsB7CRWKUmNszM+?=
 =?us-ascii?Q?cr1yBNREACE6tqd8GzvzVm6S7sVdQZ84A4UYiHDS9X1B96zs4sgghYfX4KHv?=
 =?us-ascii?Q?nmSBjvEt9yxjOVTgYRGaHqHY1Mwgj3sw+jitx4XLkH1HX0FJ1vfJQLzllbQU?=
 =?us-ascii?Q?JJeVx8EckKOcQLVYA0aPwiz/poZVX5ct7qeKBuWt7oNNIsQgQ48Z6N1d2+0r?=
 =?us-ascii?Q?0Ve/Pl7p/jwfkPF/Ed++QXApcnM5QYNLetCIMSKu6ykV6tn6traEJu3GclEb?=
 =?us-ascii?Q?L08/MaZNmEgRrbgX3U+R6KvxKk7MIR6ou8W4t1d2MYFGu5IOOkqZtmJuSJNN?=
 =?us-ascii?Q?EewqTvPSW4ShcOwrWSU7SwWR/bFcS8uEs606/TqW9gvrTrrpNa5k7PMJ4lan?=
 =?us-ascii?Q?QkuLj7H5/9l0EnkWbB+ot35or5O17LfB6AV9x7kq+UZuAzVisrLSAhPdzNTB?=
 =?us-ascii?Q?oqnJ98dnwQMuU919Nd16VxSzLYhDahmByMVgYpeDGKPyRRTOwovQ0R6LTFZC?=
 =?us-ascii?Q?MYH1MxYkfYgvxFb3OfSKi6KjAeiU4oParMUGfa1il8YfiAPbkOkwD6JInhQS?=
 =?us-ascii?Q?UryBZQj8UX+rjLvPcD+LMiS8mtqtjlvaRhzTMn5O+YdikxCToNs4djcRrBgC?=
 =?us-ascii?Q?UZRdiocwuoVdaMsdbVeselgebo6ZPotBpXZvLufc24HVhM3pSXaACA20b+Vg?=
 =?us-ascii?Q?XzIlrCNhaxZNdcgcJIs1U4uY66GkWlliqikuhVIj+yK0wU7RSnJ/qc0dNrco?=
 =?us-ascii?Q?zhhqKQCUaR7gqZ9n4LYW7iOoZN/P2K3aWhzjXMB8qgZ18gDOKkgBVEedyrxv?=
 =?us-ascii?Q?heVpNvsUQos+s6vb3XJgSBlGkffAy+ARsHFpAlo9umxstKmrG6gQkHnI9fPU?=
 =?us-ascii?Q?wpl3mEUu7gQM9rzrY0EsEjWLinuLw+bFsdg4uhbcSEEvLny4BYtoqZul+ihj?=
 =?us-ascii?Q?x9nI/AMc3+jMbEwA+27gkRavQ1F/jKjUaI6U/Rn9m1yPaUBPmKZdICGGZVlh?=
 =?us-ascii?Q?0iJBXn+aMf8ad1SqgKwRnbiM+vqIXpm8VJymvYyN0tMnG9ByYrBRK5hdpH2x?=
 =?us-ascii?Q?YL5ai4m/p13f2SDd+AB+GI8I/zgR3JDxAMyExrN/7qHeEGDOFLjoNcFVT+9B?=
 =?us-ascii?Q?JG9jF5MPLN92KmxWUE2sKqbBXTkl9QM6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XLqwcwUTNLisBPjF8gWXDCslTG7hmUTe5CZoGPqpsXTBm0B4oOSF3Dw351Nj?=
 =?us-ascii?Q?SIc0QmO83vv28D73acXeS+qP7zWS7gM4T0rGweDvhybTPDXYbOOfO4rq/2py?=
 =?us-ascii?Q?nvdX5JWXTnOsbmTtqhPjq4z86V2FOa3y+44h3cbO3SeF3YMunNvxi8B8/u+Q?=
 =?us-ascii?Q?4ex/NxhKSufok02V9PyerBadgSnBuLBX86Gs0/dzzC4aJItNt8qvM5AGeqj+?=
 =?us-ascii?Q?LY/Co6YVaPDs1A0W6KoQhMAZ3NaDeNLlBW/WzzWXS2gYxkJ+175dLHJJYUSx?=
 =?us-ascii?Q?CV4yVLwRe/R5FTQ/wVAXTjmlre/DYrOsYyFkYM9z0ZwPyQIUjyJe1sVBDpOo?=
 =?us-ascii?Q?/ZcmK/rngcFyh/7kbNIDNG+g6Y2KnBMCVZ/Qrawme/6m9XCafWtO0OQbqQpc?=
 =?us-ascii?Q?TX2l9BvbvXG0Wvk7+JVkwFiImhAYw4XGAY8BjXxMq0jWEI++Mdcat9LnT7lD?=
 =?us-ascii?Q?m7/fFy4KZvMIiF+TI1y6MkP3Nplbpfn09EtUDd5bOxi+Ti3BWppymqPuZt7j?=
 =?us-ascii?Q?512iHC9fSWSkJ3O3RwgaWuPBGC8c13v5nuv5hrOABkWbwHMTewCllyioaVSl?=
 =?us-ascii?Q?R42Wk8/ulDTkq0LXPtG5CAVpDxC267N2atF95nJ2NyqT2/tgRxe+3ujW3+78?=
 =?us-ascii?Q?a1S1iTaCamyNErwGm0qa2FO7NwaZyUbWXamIJ4wQaiUPfdPP4gX1oHiKu+9H?=
 =?us-ascii?Q?df+NcY6zK6h2KO0oAASPnMxw9o0X6EfUlio+KSvncCcD4PcXVfWe+iqZ4IG7?=
 =?us-ascii?Q?jgqlC8DrngdfXreCMUnyGKFJtmR8IeuhBh8WyT6pWu1aHGfngbIA4Ejg6V/N?=
 =?us-ascii?Q?YBdXZDtJA/tbj0tV0Vf+zOAGRmDaOo5fL45HhwvCLMcSSJoIqkNynd+wtFai?=
 =?us-ascii?Q?N70R0wj3/G05RPTirlET7nhpdaRVZXIR1Sz9W5b9k2KMLYDrKnOQnCyqhmmV?=
 =?us-ascii?Q?KwleRYK+zo7m36wlQRlcjUox0HKunUdrXYq6I0LCYwFgdog+/NZlBZFOy4Qq?=
 =?us-ascii?Q?xtZ9BjJGtwLrvBs0P6Pxx7tOZE6Kqq4rCj1fM2X4mhx4PaOU4GB4afmM8QrL?=
 =?us-ascii?Q?kPXr/M7GspPdXCsqHmTjSe1oUCt4r5hPBorTY8W4ebFr6eQCow63qNBWvyCT?=
 =?us-ascii?Q?+ZOIkjeTcQmKyuxLgpmf2MLFFls6cr1XoulYXCR2tiyqGuxU0wr5xKvG148l?=
 =?us-ascii?Q?GHN8opS/Ent6aNJTU+4OdeBsD5jjBNaj/rVdkH4amt5E25RzdouqxFfLrKrv?=
 =?us-ascii?Q?nKok4cABbfzKhZoGOnrrRHKhxXVuTUev60yO24wqRRYOkobIC7m385Rw42YH?=
 =?us-ascii?Q?fQYDOD2kxYqLAON3QuiF4OlHY0/VnDYBRCjLlHcwbY8i6z1Gx2CGhZ0N83uj?=
 =?us-ascii?Q?hHKkm6CgFT6a7hXly34xBrra4tk8bjH+dJ7HxAPOL6xUb4isNDHsUuEyT9Os?=
 =?us-ascii?Q?PTRNYxFUtgAdIJbmHVHg9zq8C7CdVzH9M+JSYCulhzPC+lbGvfZ7Sd5T2AEX?=
 =?us-ascii?Q?lW99ARZAZQv1oykClsOGxIZDb1ltS8PAPtpHOMM0+HJxeNCmh24hhPQ2L76y?=
 =?us-ascii?Q?w1nXQkYDyTCH+LYy0N7jzaiff6LjRq5xnAQgiD0EMmCevKOi5zHTUNiIsLzW?=
 =?us-ascii?Q?IY/02FYZA4JCoADAbno/MZ4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 209d8aa5-f30c-4228-be5f-08de289ba07a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 01:16:41.2820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8xk5TdWMRmvxHyc9VySknVABjMkRXygnbdD91p/oGmMovu9We7iWVXAQDh6rxs2GQb6t2MVUFrFOBT/M/J+G6gX3GiUNIdPw/cOh0EI/XL9CDsqd7iMaZ7w2A1b5K9q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7692
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

On Mon, Nov 10, 2025 at 10:30:07AM -0800, Ch, Sai Gowtham wrote:
>Hi Niranjana,
>
>Please find my comments below,
>
>>-----Original Message-----
>>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Niranjana
>>Vishwanathapura
>>Sent: Saturday, November 1, 2025 12:06 AM
>>To: igt-dev@lists.freedesktop.org
>>Subject: [PATCH 04/18] tests/xe_exec_multi_queue: Validate exec submissions
>>
>>Validate multi queue feature with different queue group size and with execbuf
>>submissions.
>>
>>Signed-off-by: Niranjana Vishwanathapura
>><niranjana.vishwanathapura@intel.com>
>>---
>> tests/intel/xe_exec_multi_queue.c | 197
>>++++++++++++++++++++++++++++++
>> 1 file changed, 197 insertions(+)
>>
>>diff --git a/tests/intel/xe_exec_multi_queue.c
>>b/tests/intel/xe_exec_multi_queue.c
>>index 03b920dc8..de2aae8f2 100644
>>--- a/tests/intel/xe_exec_multi_queue.c
>>+++ b/tests/intel/xe_exec_multi_queue.c
>>@@ -13,12 +13,15 @@
>>
>> #include "igt.h"
>> #include "xe_drm.h"
>>+#include "lib/igt_syncobj.h"
>>
>> #include "xe/xe_ioctl.h"
>> #include "xe/xe_query.h"
>>
>> #define MAX_N_EXEC_QUEUES	64
>>
>>+#define USERPTR			(0x1 << 0)
>>+
>> #define MAX_INSTANCE 9
>>
>> #define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
>>@@ -144,8 +147,175 @@ test_sanity(int fd, int gt, int class)
>> 	__test_sanity(fd, gt, class);
>> }
>>
>>+static void
>>+test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int
>>num_placement,
>>+		 int n_exec_queues, int n_execs, unsigned int flags) {
>>+	struct drm_xe_sync sync[2] = {
>>+		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ |
>>DRM_XE_SYNC_FLAG_SIGNAL, },
>>+		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ |
>>DRM_XE_SYNC_FLAG_SIGNAL, },
>>+	};
>>+
>>+	struct drm_xe_exec exec = {
>>+		.num_batch_buffer = 1,
>>+		.num_syncs = 2,
>>+		.syncs = to_user_pointer(sync),
>>+	};
>>+	uint32_t vm;
>>+	uint64_t addr = 0x1a0000;
>>+	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>>+	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
>>+	uint32_t bind_syncobj;
>>+	size_t bo_size;
>>+	uint32_t bo = 0;
>>+	struct {
>>+		uint32_t batch[16];
>>+		uint64_t pad;
>>+		uint32_t data;
>>+	} *data;
>>+	int i, b;
>>+
>>+	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>>+	vm = xe_vm_create(fd, 0, 0);
>>+	bo_size = xe_bb_size(fd, sizeof(*data) * n_execs);
>>+
>>+	if (flags & USERPTR) {
>>+		data = aligned_alloc(xe_get_default_alignment(fd), bo_size);
>>+		igt_assert(data);
>>+
>>+		memset(data, 0, bo_size);
>>+	} else {
>>+		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>>eci[0].gt_id),
>>+
>>DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>+		data = xe_bo_map(fd, bo, bo_size);
>>+	}
>>+
>>+	for (i = 0; i < n_exec_queues; i++) {
>>+		struct drm_xe_ext_set_property multi_queue = {
>>+			.base.name =
>>DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>>+			.property =
>>DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>>+		};
>>+		uint64_t ext = to_user_pointer(&multi_queue);
>>+
>>+		multi_queue.value = i ? exec_queues[0] :
>>DRM_XE_MULTI_GROUP_CREATE;
>>+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1,
>>num_placement, eci,
>>+						     ext, &exec_queues[i]), 0);
>>+
>>+		syncobjs[i] = syncobj_create(fd, 0);
>>+	};
>>+
>>+	bind_syncobj = syncobj_create(fd, 0);
>>+	sync[0].handle = bind_syncobj;
>>+	if (bo)
>>+		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>>+	else
>>+		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data),
>>+					 addr, bo_size, sync, 1);
>>+
>>+	for (i = 0; i < n_execs; i++) {
>>+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>>+		uint64_t batch_addr = addr + batch_offset;
>>+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>>+		uint64_t sdi_addr = addr + sdi_offset;
>>+		int e = i % n_exec_queues;
>>+
>>+		b = 0;
>>+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>>+		data[i].batch[b++] = sdi_addr;
>>+		data[i].batch[b++] = sdi_addr >> 32;
>>+		data[i].batch[b++] = 0xc0ffee;
>>+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
>>+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
>Batch buffer construction logic can be extracted into a helper function that can be reused across different test scenarios

It is only a few lines and in 2 places. I don't see any incentive to
abstract it into a separate function.

>>+
>>+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>>+		sync[0].handle = bind_syncobj;
>>+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>>+		sync[1].handle = syncobjs[e];
>>+
>>+		exec.exec_queue_id = exec_queues[e];
>>+		exec.address = batch_addr;
>>+		if (e != i)
>>+			syncobj_reset(fd, &syncobjs[e], 1);
>>+
>>+		xe_exec(fd, &exec);
>>+	}
>>+
>>+	for (i = 0; i < n_exec_queues && i < n_execs; i++)
>>+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>>NULL));
>>+
>>+	igt_assert(syncobj_wait(fd, &bind_syncobj, 1, INT64_MAX, 0, NULL));
>>+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>>+	syncobj_reset(fd, &sync[0].handle, 1);
>>+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>>+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1,	INT64_MAX, 0,
>>NULL));
>>+
>>+	for (i = 0; i < n_execs; i++)
>>+		igt_assert_eq(data[i].data, 0xc0ffee);
>>+
>>+	for (i = 0; i < n_exec_queues; i++) {
>>+		syncobj_destroy(fd, syncobjs[i]);
>>+		xe_exec_queue_destroy(fd, exec_queues[i]);
>>+	}
>>+
>>+	if (bo) {
>>+		munmap(data, bo_size);
>>+		gem_close(fd, bo);
>>+	} else {
>>+		free(data);
>>+	}
>>+
>>+	syncobj_destroy(fd, bind_syncobj);
>>+	xe_vm_destroy(fd, vm);
>>+}
>>+
>>+/**
>>+ * SUBTEST: one-queue-%s
>>+ * Description: Run %arg[1] test with one exec queue
>>+ * Test category: functionality test
>>+ *
>>+ * SUBTEST: two-queues-%s
>>+ * Description: Run %arg[1] test with two exec queues
>>+ * Test category: functionality test
>>+ *
>>+ * SUBTEST: many-queues-%s
>>+ * Description: Run %arg[1] test with many exec queues
>>+ * Test category: stress test
>>+ *
>>+ * SUBTEST: max-queues-%s
>>+ * Description: Run %arg[1] test with max exec queues
>>+ * Test category: stress test
>>+ *
>>+ * SUBTEST: many-execs-%s
>>+ * Description: Run %arg[1] test with many exec submissions per exec
>>+queue
>>+ * Test category: functionality test
>>+ *
>>+ * SUBTEST: few-execs-%s
>>+ * Description: Run %arg[1] test with exec submissions only on few exec
>>+queues
>>+ * Test category: functionality test
>>+ *
>>+ * arg[1]:
>>+ *
>>+ * @basic:					basic
>>+ * @userptr:					userptr
>>+ */
>>+static void
>>+test_exec(int fd, struct drm_xe_engine_class_instance *eci, int
>>num_placement,
>>+	  int n_exec_queues, int n_execs, unsigned int flags) {
>>+	test_legacy_mode(fd, eci, num_placement, n_exec_queues, n_execs,
>>+flags); }
>>+
>> igt_main
>> {
>>+	struct drm_xe_engine_class_instance *hwe;
>>+	const struct section {
>>+		const char *name;
>>+		unsigned int flags;
>>+	} sections[] = {
>>+		{ "basic", 0 },
>>+		{ "userptr", USERPTR },
>>+		{ NULL },
>>+	};
>> 	int fd, gt, class;
>>
>> 	igt_fixture {
>>@@ -158,6 +328,33 @@ igt_main
>> 			xe_for_each_multi_queue_engine_class(class)
>> 				test_sanity(fd, gt, class);
>>
>>+	for (const struct section *s = sections; s->name; s++) {
>>+		igt_subtest_f("one-queue-%s", s->name)
>>+			xe_for_each_multi_queue_engine(fd, hwe)
>>+				test_exec(fd, hwe, 1, 1, 1, s->flags);
>>+
>>+		igt_subtest_f("two-queues-%s", s->name)
>>+			xe_for_each_multi_queue_engine(fd, hwe)
>>+				test_exec(fd, hwe, 1, 2, 2, s->flags);
>>+
>>+		igt_subtest_f("many-queues-%s", s->name)
>>+			xe_for_each_multi_queue_engine(fd, hwe)
>>+				test_exec(fd, hwe, 1, 16, 16, s->flags);
>>+
>>+		igt_subtest_f("max-queues-%s", s->name)
>>+			xe_for_each_multi_queue_engine(fd, hwe)
>>+				test_exec(fd, hwe, 1, MAX_N_EXEC_QUEUES,
>>+					  MAX_N_EXEC_QUEUES, s->flags);
>>+
>>+		igt_subtest_f("many-execs-%s", s->name)
>>+			xe_for_each_multi_queue_engine(fd, hwe)
>>+				test_exec(fd, hwe, 1, 16, 64, s->flags);
>>+
>>+		igt_subtest_f("few-execs-%s", s->name)
>>+			xe_for_each_multi_queue_engine(fd, hwe)
>>+				test_exec(fd, hwe, 1, 16, 8, s->flags);
>>+	}
>>+
>Not sure if this is worth changing, but I noticed the test definitions are quite repetitive,
>May be tests can be configured more structured something like
>struct test_config {
>    const char *name;
>    unsigned int flags;
>    int n_queues;
>    int n_execs;
>};
>This would allow looping through test configurations in minimal lines of code instead of the current repetitive subtest definitions.
>What's your opinion ?
>

Same here. It is just a few subtests and I think it is less complicated and
more readable this way. Currently, I don't see much value in defining new
structures & lists for it.

Niranjana

>Rest of the code looks good to me.
>
>-----
>Sai Gowtham Ch
>> 	igt_fixture
>> 		drm_close_driver(fd);
>> }
>>--
>>2.43.0
>
