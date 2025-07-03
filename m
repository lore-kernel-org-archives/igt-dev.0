Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3236AC83030
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 06:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAB710E7CD;
	Thu,  3 Jul 2025 06:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxuEEZ2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A6110E7CC
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 06:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751525590; x=1783061590;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y6wR7s/wYOBkLvzxHujFPRF5+0y7fYy6MxpyRSwv1Fg=;
 b=GxuEEZ2Azjgri3dYLL5GGIbqjYefxkDsxozNqvbb9k6CzdS2/SAijw2J
 PQ1UKbNuFUa98yLdwDl/9ZaoLLUIVHgTlY81XPYKW0myDLXgWPS56h9WM
 2gFKAxoHbE4XQCdgeASLZAPiOrvPGgHEPdDeldGVkK004cwwE5+anYxy/
 EUvv3bZiPh0kcBrsKZfJV0RTENj8Pe23KUt2PVVTQGAnWKGrWkp/T5+pC
 HAg+evwp6Du3I4eo99W0PnxLLAzoPrLFDhwlku7fxbkEADl8HUs7tiiLy
 6i2sthFEtHH9/1uZdT23lUYgwF2YaLxlQm4dgjBOd2So4GysNvk+qvTe0 g==;
X-CSE-ConnectionGUID: AEbtSm5ZSm6PXeGiVcfjYg==
X-CSE-MsgGUID: K2mT/YNQRoqfAuRXrDfucw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64534765"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="64534765"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:53:10 -0700
X-CSE-ConnectionGUID: Q4d+NTxWTRKIq4SvEXrIdA==
X-CSE-MsgGUID: 8gZ/bQz4StutUvEAlfmT+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="153922183"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:53:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 23:53:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 23:53:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.77)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 23:53:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtWlfC3PxKkBkv9v7jx2++GoxiWoqeGn3zINMZb5cqKI3pCMKgt/8jgfmMVzEo+y9kIADFcFaDO3i18ipLBltnI0yTGziZyyMfTm5JJAGh16VwJvUJ93e4Pi47MBLZCLzTh8vrLJkrUuoYMXH+jgTWOqgcNOcLhxzpDImQ9rH3crvwnwBaRMUDGG33fyCqo6Ykhg+lXYX4YwV+riw48bJ44D8I/z4XvAUJtqsrXqJUIUVCQlfMEI5NnzyLXoSobVIU2k+IZA+Vjx7tOoQuhYG45Os/phJPApp9w/bNwpa66O8gioC3m1H3Z5fWb9Qn5+PfGmNiWiuirPXKfkw+5Btw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtp8TDcXhop0uIwsw8Gf2AtAoqIIifiUl46ODhd4y5c=;
 b=eW6nv3NilxnXBpmydOzJQoKjqmgAp2LBU0uXCqAnp6mY3qQ5gjNd4qyKq1wVzgigb0eenBo1awZ6gqjZkAWqMLZfG6uzov5lpqSMMhy9ejfRE3W1UTMQ2DCDDQp8dAdmhKzX7LlcO52r7jG/g2ut4wo03KKOymMjfWC/MRnFW85XZMN/Jy0pSLEk548SkZ9PD6Byr7/1OOPQsv6Ho66EOJbeVTV+W6F2NJgXIKN9gkaFD6Xl6UJwvIZZAnQUSDtNHtVmxbbqFVgydJLsLH1HhPYmhDRzgBOelJDPwlWAwuoer3CdmJTGga1IBscdCJpuv+0r3DB08wjlU7tPDfBJpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SJ0PR11MB8295.namprd11.prod.outlook.com (2603:10b6:a03:479::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 3 Jul
 2025 06:53:06 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 06:53:06 +0000
Message-ID: <6b0b8107-d99b-4208-b184-8e215d5177d8@intel.com>
Date: Thu, 3 Jul 2025 12:22:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_joiner: Update ultra joiner
 supported platforms
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20250703062655.894129-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250703062655.894129-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SJ0PR11MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: 86373a0f-3b4f-4b0f-aee8-08ddb9fe4070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTFTWjJFK0xQa1ZLSXMvWkFuTWhNYTlpQk8vVnVQZEsrenI3Nk01djNzV2sy?=
 =?utf-8?B?V2pwdDExNEE5TTJYTm9BUFl1eFZiQWdxby92M3NwdEZaZ2JHb2dKdmhiK0sz?=
 =?utf-8?B?U3A3QVp6NzBRVWZBdFBaaDV6MHUrWVhIQVgvV2lWWG9Ybnc0cXRkRitjaWVZ?=
 =?utf-8?B?MkI5ZnpGL3BpMHVaY1VoWmx5anRMRzA4RTNDZlgwUmZydEg3bUlEN1piUnUw?=
 =?utf-8?B?SE9SZkdMUE9pcUUwTklVeG5tS0NHb1BOcmFPbnNLS2ZSL3BoUC9Rd21QbmIw?=
 =?utf-8?B?SUdHeUF1ZE12ZHZzLzlPOFRVazFIREtXaGtCeDdMS2RHaWFkb0JnZ0tMRG9N?=
 =?utf-8?B?U2x1dWhUQVVuMlVKMmtUMTJOUms2MnFneG5zQkRLSU9EcU1nb0ZlSTJvTFFn?=
 =?utf-8?B?VHlHcUp5MnphNjFrWDg0eVArWU91d2UydHNrM25MTFpiY0lzZEpoVmlkMHpY?=
 =?utf-8?B?aStWcnhJNFFpaSt2Ykp2cmg5cTRYdEUzT0NFbGVFSmlzc1kwMTZHSzJ1RStt?=
 =?utf-8?B?OHlzZnNRa2tlaGR6eEJZcElXSXFObSs0TDNYTDY0OUdSZjZ5RXNmNmtnVTJ0?=
 =?utf-8?B?UkFqdVpGeHlCRSszMjFPU25VeDhqNXZ3cW9GNzllRkxiSDl4Z2RhWGN0R1Yz?=
 =?utf-8?B?MHVxdG80VTloc29ETFRsTnpDTmMvdjMyZUhjYmJ5UG95MEcra1VvSVBOMWVi?=
 =?utf-8?B?NmpuZXB1a3FrcEUyUndZZVVxYkNrTWJxL1pvN0NkbTl1NkExN0dhaG92Z3Zm?=
 =?utf-8?B?dGFnbm05N3AxNThlOFpmdXdMMUlSbnJuK0JWdzRZOVF4bFZLTUpvaFNiMHlL?=
 =?utf-8?B?bnZoTWV4dzJXbDB0NEhjT3JyZm5vYnJDY3lSTkhUWnV5OVE4ajVXYW1iVjk1?=
 =?utf-8?B?c2JxREVpRTBvSFYzelkxdnFLcDFFSjNrVjM2emEzaGkxcFBJVUdaejlQSjBP?=
 =?utf-8?B?bTN2SmkyVFlhZ3pIZ0txQWdoWWcxSnNrREpHcjRmVVJsQ3BYclNkL1hmenFO?=
 =?utf-8?B?RVE1NThSNnNNZmxiS1NPTkdmbVBJdVNMS1JqN0MwQnpYaFlHcmVWN2V1aFlI?=
 =?utf-8?B?L1FVMW9kZ1lyQ1N1YUZ5UTZ0TWxQMUk2TFlFTGxuSnpnb0QyV3MyVUZlZEpU?=
 =?utf-8?B?aGt5SmJMdHRtMWdpUlAxdnR3ZGVmNXoyeExqL1FVV3dLMFlia29iRVdkYTQw?=
 =?utf-8?B?YjA5T0hPVlFOSzNQQ09OWTdOS01PdExmd2QrTU54cFdqR1V0NzQrUzd4UEpB?=
 =?utf-8?B?dXhKM2o1ZGpjQmsydHBKVktzUk84akt6d2FiV2pVMDBlZHFDZko3NVRkbVhT?=
 =?utf-8?B?aWVmSFg5MlRGcHYwRmVBdEx1TmUxemtWREoybjNCai9mQkttd3pXNlRsbUMy?=
 =?utf-8?B?cHBkTWp0QXBsRmtEMWpRNEFrYUtSeU40UldYWVpERFVDU1Z3TU93ZDhYSVlj?=
 =?utf-8?B?ZllKOWhWTUl0TC9TVTQzeWh3UVQ4L0JuM1pLOWhVaFZBL3l4YnlTY0FkMjlo?=
 =?utf-8?B?bHBJdGNZOEkzYjdxbzEzOTI0VEw0VlpiYy9vdzVacmZ3RzJxNldaSHI4bm5q?=
 =?utf-8?B?QUt6RVN5V3FIakNsd2FiZ2xiR2ZVbUhEZEs1UGdLVVI2c0tINE40eTBFM0dp?=
 =?utf-8?B?a1VyekJQdHJGY3dHMnV0YkJtRzNiUWNSbzR0TW1LZTNVeExNYjJQbUNmKzcx?=
 =?utf-8?B?Ri82Q2lnWGtxTmcwK1JldjY3cmdjSVlmM1JxZGhrVCtBQlMyYXlyTEsxK1Zk?=
 =?utf-8?B?ZFR1aXQwK3VCUU9TU2xMSGw3d3hnMHNoUGJ5VlowODl0R2Q1eit1NzZWSmFH?=
 =?utf-8?B?V3ZpS3h4SEdKT2J4bCtVbThOcmhVaWZNWkJlZWdKZ2p6WXk0dUtQaWh1T2dS?=
 =?utf-8?B?Ly9YZVpBeXBBeTM4Q1hJUjF5aGJTRTBnQ3FaRFV3L0VBVm1JekZKYU9wODdG?=
 =?utf-8?Q?EJFK+lxmlhc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk5ZbnhpbUd3dTdCbWkxVGd6MWFpT1VoQ1dxdTdQUk5YeklRODBtcVNzdlRv?=
 =?utf-8?B?RjdNVWttNnZwYmNYUURuVk1lR1dZc1R3NVhYWUFvNlQ5QmY0N2U1NzcvR0Uv?=
 =?utf-8?B?L1IvZDhUTUlpZjNPNCtsclVaaWFraTFOQVVtb3BoMmtIM2FyT00rTUFZMitY?=
 =?utf-8?B?U3V1bGRVU0xKM3pjS0NDSndsbFQzNjYyc24xSlc5aFFMR09lMFFNU1EvQ1ds?=
 =?utf-8?B?S0pmelhhRWtyeVJ2cE9FVHd3RFVDMTlEbFFTSTdycnhBSGkrZkxrSFpzVkRT?=
 =?utf-8?B?SEsvNW5PajlMUVF4c2lna0Y5NWtmdG15SnU3eWU3NVlXdjFNT2RkK2lzQ0JC?=
 =?utf-8?B?ZFBqb0g3Mkp5QUd6OHBzYWhoMHFLNmNhSE5aZDhLT0k0NCtDOXV4VzRkNk5I?=
 =?utf-8?B?UlRqSFlXYXpLNWpGaHJnYnBHbkRhc2lTemsxek5Xc3J0dzJkVkJMRmVvUkYr?=
 =?utf-8?B?SjJUQk02YnVKdUhoR1IyWDVXWUgwMWp6YjVjVTF0ODUyU0gzN0hHQVpCa2tv?=
 =?utf-8?B?aWYyT1Z3WnZYRm4reTlVd2ZBc3JiRnl4Nzdqckd4TnQvc2ZTbnJWUnZxaGw1?=
 =?utf-8?B?cGFiQ2hMbTlBc1p1YnRxK04vQW1pQ0ZabDlkK2ZrWkNyRVFFZC9aa3JzaHJN?=
 =?utf-8?B?Y0orWTJIemFLU1didTRxUWlEaXF1NVBMZEs3eXR4WHNJcksrZTFtN2xPdVVy?=
 =?utf-8?B?ZzVHQnZzMkpDdmNyQUs1RlRvRTdJL1VoNzJZOExDVXN6TTdhNVd1TUNxSjhF?=
 =?utf-8?B?cmZDWlFKV1hhZC9xSUwwOW01MnBxT3UwRnVDSHlJVitpazZVTlJCRzdzbjRt?=
 =?utf-8?B?MlZNNXNvUjk2Qk9JUVVPbjhuQjlBSzFSNXJ1WXk5T0t5a0ZwRkRHVkpReE9P?=
 =?utf-8?B?eXNSaEpMbU1iQmx6dWRuU1NlV2kwVWd1Q0VEbmlNSGZxdXZQdTRzV1VOSUdz?=
 =?utf-8?B?eHF6Nk5RRTJXTGJFRCtScWxHaDRQU3o3V2RyY2lncGhjU3BZNHVtOXQzVFA3?=
 =?utf-8?B?ZlQwVTBwNnhlTnJjdTBDTTE2NG1yeVhRY0NPN1RJVGh0SnNpbHJzR2RKZHcw?=
 =?utf-8?B?OVNrRGp0Slo1Zjg4ckFFZ1pxSVlZNGpacXRnWW9WV211N3pIdGZtNDZ3U1pW?=
 =?utf-8?B?VDJhcE5yMmRWL2IyKzRFY2w4K0NOdktTZ05nUGdlOGZtK2N6eThZMnZDc0U3?=
 =?utf-8?B?MmZIRzNnZUMzMjdlSTJEcVljcTVDTjhYNGNHTlZLNVQwOGJCNkZsSUJCdHBW?=
 =?utf-8?B?dGdxZnY5NU8veDQ2dU8zakY0d1drKzNFbHMxaGgzTUgzU3ZML1g4ZGJPWGxQ?=
 =?utf-8?B?RStYRXljd2tWQXByOHZkL3V1QjRKYnZVeVIvWXkvOGtldC9zUVk5K0d6Ry9h?=
 =?utf-8?B?UFVzU0hScWgzYUc0Tk5KMDNwQW9NTExmVnZBWVFNN1VrTEVnSWtkZUkvZTZQ?=
 =?utf-8?B?aEtsNERZU05pald6RStWMjcyeWJoZTJvYndyRkNMZDJObE1QdURxbktycWI0?=
 =?utf-8?B?Z0ozQUNQTjdudEFRTmZOV1dOMmZ3TklKQW1GQjVta1RLQkIrckJQNXJjYlRH?=
 =?utf-8?B?TnBSajk2SXhUVm9ELzBqT2tLaExsSkdPZW5kblN1bzVnVUEyQWFoZHJCdjJx?=
 =?utf-8?B?cFp0V0UvdjN4Q0ZyekNDRHlYeUp6RHE2ekpjNitoL0xsVzU0eWJRSmtCMUlr?=
 =?utf-8?B?TVIwQ1dwQkdUMkNOc2RWaHlxUEp5NjQ3d05IYW9qNGNtM0NRem5yc2ZjT3BK?=
 =?utf-8?B?cGdzQVhpMTNNMkxVYTIva2xrQmVENVlldDRpc0VOQUJsNnR2ZGlCdnVrZWpt?=
 =?utf-8?B?bXFUdmVMZUtQbTR1aFJPbzArWWoxS3QvNlk4SWhVT25zTlJuR3RCa2JPZk1o?=
 =?utf-8?B?Nld5QVI1R1pwampPRkd0Y1RHWGdIZXlXS0NkQm5GRlNRZmg2Yit4NDd0Nlpi?=
 =?utf-8?B?VEkzSTNta1lJZDMvZHhQb1lWVWg2VlM4Q2ltTFByMmNKRWE0ZlBOS3hkWFhN?=
 =?utf-8?B?SDdUMWlZRnYzSmhuZmNpZVhBSXJsckI5M2w4ZWpxRjlFMENHRWtveWV5bnA1?=
 =?utf-8?B?NG92MGI4SmUzSVBvRmFXdlBuRUtJSlY4ZFNvbmpYd2RpYVVBenkwSkIyRmZC?=
 =?utf-8?B?eHBYTUxPeVZQbjZ1MEo4MDVqYTlqbUFkbzdZUEgyTEZJK0xaYUc3TUFNVld0?=
 =?utf-8?Q?1MbmljA2lMY/GF0PLPj68bQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86373a0f-3b4f-4b0f-aee8-08ddb9fe4070
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 06:53:06.7701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkdfSvoOu51R+Hm6hdvNZAZEyPKQizJPESuKL6N9d+wH1RR213ksoGC1qRSNP+X30XCS+2J+5FUOV3/Qx4XguUOTFJYmzWfWQXWjrB68KmJbgWE8Ha2FotMHfN82Yxqr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8295
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

Hi Karthik,

On 03-07-2025 11:56, Karthik B S wrote:
> Currently, Ultrajoiner is supported only on Xe2_HPD.
> Update the check to reflect the same.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_joiner.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 22c7c6d85..d1ddbeb60 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -572,7 +572,7 @@ igt_main
>   
>   		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
>   		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
> -		if ((is_dgfx && display_ver == 14) || (display_ver > 14))
> +		if (is_dgfx && display_ver == 14)

nit: Would it be good to also check igt_is_dsc_supported_by_source here?

>   			ultra_joiner_supported = true;
>   
>   		for_each_connected_output(&data.display, output) {

