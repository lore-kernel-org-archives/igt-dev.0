Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA8FC79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 18:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E789810E17C;
	Thu, 10 Sep 2026 18:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlPkB0wp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6A610E1D0
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 18:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789066333; x=1820602333;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EMp/0cwmwxpzjUi1mWzEE2aeftK5hxsDiNqBHSkaqXQ=;
 b=DlPkB0wpEYBji6ytcxo2A+W1JpxOR7bIeqIfa3kJVFYtFgZE+eP7GSAE
 IST8LH/QT/dWPV6kBrYcNJZUD7DlkwsvVk2P8+nWYGNhB1w8aHmXMstS3
 f/tNTUj0iBkyABAAWaoJ211cnkzku/KuY21n6lGtOjmQrzWGqGBYXv1vS
 TbgQ2GzUZk8FW8u37ZIVPjaR8ahHyybM1N7WMNwE6NHIn5Flclw3MjhB4
 zkkzQCUgdHINoSYdjnXJU4wmmnZGmUIRfmIr0pz0q1EzIVJ6JfUxnEXnC
 QLXCaNhT9pmcKvtovINw3UMF/GJvdxKMNTY3O8ldBA9BU5m0Yj0wzgD3S A==;
X-CSE-ConnectionGUID: mbdny3KRT3uu7I+RNWWKUA==
X-CSE-MsgGUID: ajwvijr8SaulwbhPzfzb3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77085826"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77085826"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:52:13 -0700
X-CSE-ConnectionGUID: sL0vOHlBTLW0yvdv8gAVdg==
X-CSE-MsgGUID: p1mNzIIJQcmX667BGgPq/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="268426374"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:52:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 11:52:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 11:52:12 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 11:52:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQ8LXa+tJtGoOBIAi7nBCQG+W3ELlRWZz0rwaPq596CNWRuvdy1MmOkmG7zQO29qZHn8YpWRKmyDVKbJSZIGdQ1qVmOnHZnEvqgVWoCAs4BQbmaEZ2GtlaVGDPaXaCrIufbdlcQ8ylNuivpzqZJ1uf87iOImA+I4o9eePP9gBXk3DUJEbeiOSlBUE7GsXQTMtmc123bn4HSTEOm4IS82jbNawV3MIQja447EigmJBzrJZs9+3nSrFI1ok/K7V22/EdlAXD0h+B9eQssU74jXDLiKuj2kB7bjg8zz+12txk80XH3neQq0tCKdMYyuXhejf9s0y4ls0WkTr/MiOA4qSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ll4XkdiXa7GGOu2uO3PbjyyxrJ9rWhZYdgmGbBFPMn0=;
 b=rtWIhsc57lJ7oQiQUb7SUn4acWMhrAKppsIYSeLo5CD7EEyzJlTWv4fdXNFR0QMJp9K6Ict36L4HDq/WT6WGzQpihFPY1H0jSfmwuLT7vv7zky86eh9Nz+XNUlgnMS+RJKQpaAVhdCRllfltQl20EoWfXvg2Wfkxi1oJ13EmSPwejfpeB5z8w37W0wahkmXPs9ASkGfdbuIdkYAw8T8dxfMYVcuz6zwlO1Lm42jdLxi0KGIwodhgGkVmuH12JSyewBc9stNHR1bXst3uGoTK/i8sPlNoUJF9r7SwkQhNYGgq/flWy3XFSGA0uGI9SwWRvlgKC1R+uOJwYNfLcP0yzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) by
 LV8PR11MB8605.namprd11.prod.outlook.com (2603:10b6:408:1e5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Thu, 10 Sep 2026 18:52:09 +0000
Received: from DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd]) by DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 18:52:08 +0000
Date: Thu, 10 Sep 2026 20:52:04 +0200
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Nemesa Garg <nemesa.garg@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v3 15/17] tests/kms_ccs: limit #outputs tested
 during suspend
Message-ID: <lkpioyknmx2j5m3of2m7fvwykzacvaszq3gzsbn5zbaagn6vpi@6pgytsixdu42>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
 <20260821124834.1974029-16-michal.grzelak@intel.com>
 <ef627eb6-a33f-4066-bc96-2629f6ee395a@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef627eb6-a33f-4066-bc96-2629f6ee395a@intel.com>
X-ClientProxiedBy: DB8PR04CA0014.eurprd04.prod.outlook.com
 (2603:10a6:10:110::24) To DM4PR11MB7256.namprd11.prod.outlook.com
 (2603:10b6:8:10c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7256:EE_|LV8PR11MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d80da35-ab7d-4af3-b028-08df0f6c9dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|18002099003|22082099003|3023799007|10067099003|5023799004|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: bmP/78JdDjyuewVbUtFWcKCh0ofYu5fpsHTRpRIy6hfqT8usaMHiNbLFVw1foghyu0cDJO22926jMpxfy6Tk2gCXAlzJkspNCHhbGkp7hVZle6HKuRygctB3Ipxuv1iGqKbKM+x68SMOrMR3BaK4NZgR1GRNXyLvfEKAFZiKbQJMsMPnLNSsZhII0sftqDnGqyKvKq4Ll6EBdpIVG+h5AAzDD0PBHEf0ixFMbwJ/LH1+vx6JuW41Xx7PMhhivOnQYuyiUhloJjgygTWc14MjPfhqSXSNef97k39LgaKwOsEhcd04Q8T+Le+kKh/a/EF31ij9JUhMwVXe0dH3JMO4ZRJkzNiZHK+KwSQxLIYvaju/Pv8gA5iK8M4yeGTs9V18mFEI5Kji6FPxmFf2/7UTKdLQmyJDC5qCRuDU925gkkWCFG5QH6r2Sy7Sh0xK+kNQU3c69W/WJJpL+66crVpegou/zHIMjsTDVkiGVTk7hVa3hQz8bixnuSTLMOI/UOb5cQJAmXtWhQ/cWqC46c4jkmGwqwjiYWpanNHxcyE/jBU8dt2LDFRaohMojplZnt75/qxOTKQZhHB+OpeatYpIUxdBhjYxFXyJQswiA33kA7pA/k3dU2fO1FMhyeIHG6iuBF8uSY71W3nY1BxKeR3R7tDp/etFTNxhyDQUAqKJlr0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7256.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(18002099003)(22082099003)(3023799007)(10067099003)(5023799004)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1RBc09PbDlXclViNmlvMVpubUpaY0Q3Y1A3TFoydTdCYmE4RVMwb1RjMEdn?=
 =?utf-8?B?NDhzVWhkQXphVDBBNy9Uc1dRL3ZiSVVzZUMzMFB1ejdsbjgrTjFWSUNoZ1U1?=
 =?utf-8?B?MksvUWtNaFJZU1E0d3plTThoODVTdXFXZHV4Vjdzd1VjRlpyT2xsYnZuUVIv?=
 =?utf-8?B?RDFhMVUvMlZBU1I1UFpFZW5vNXFJbkl3N0F0N0FnU09UTFpmR3NsNGVJUmdU?=
 =?utf-8?B?QWNlaWVIbDYvTEg5UkNDM3VHVzVGNWtLbXFFN3dLWHRlbjd5ODJqNEh1MHRy?=
 =?utf-8?B?VVcwL09KdE9OWFozTEx5Yk1SRDN5aGZkUm8zZjAwdk1nZXVCakVhbEtFSTRF?=
 =?utf-8?B?Yk9PcDN4TW4yV3E1OFIzTm91M2lVMmhnN1hvZnRMRHgzWTM4dU5wR3NQZmw3?=
 =?utf-8?B?N2JCLzhJbDAxams4TnJGUThYTGMzVHlvL1JmYWo0VzlpcjRWNkg1Z1p1VlhP?=
 =?utf-8?B?emIxNUFKZzQ1emNsNllxUUN5U3YvRmI3K2xKOWhTb3Y0UVp1Rm1oakFRbk9W?=
 =?utf-8?B?SGZSTWZMTEJwNWtqY0VaVDlKZ2Jab0ZvQldGcDVlUEFIbFVYZjUzVnNjUFZZ?=
 =?utf-8?B?c1gwK2NhYjk2RXdZR1B1UWxuV254WitWRlhmT2R2a2NTKy9QM2MrbENOeTdX?=
 =?utf-8?B?enFPbUpuWUk1RnFleWMwMXlrbG95QnZUYW9YQWlKZGVNc0hJcVg2by9tVHU4?=
 =?utf-8?B?bWRkL0xkUUtwbDV3SUVrSXlRZTkwVFhxMXJYdVhzdUljaHVzcEk1eGF1dzQ5?=
 =?utf-8?B?KzFod3RNQldHV004azU0RWg3VHRLTVlGQmZ2cUo3MnFQSStkK3QrZzZQQWpH?=
 =?utf-8?B?WFI4NmUyN0JYc3M2aDFJQ1NvZjJWVTgzZmx3ZlpObWhZODdPcDQzVW1TdzRD?=
 =?utf-8?B?L0JSbTQyemZQa0tLVTI2TkdqUGUvUk52bm9aeTNaM3Y2WEtwdVhBbVRtbkM5?=
 =?utf-8?B?dUZGZ0c0V2RsNFA2TnZTcHZSR0tpVE10UlFia0pBR01zRDRibjdGaW42d0R5?=
 =?utf-8?B?RGJTVnZPQXpXZ051MXh2cU94ZzZEZ0NmMUZkYnlYZEp6ODZScWxpNFdXNVBG?=
 =?utf-8?B?aXdnVWRDSGl6bW9KZmFySDJDYWMyczdmL3hXbU01QjRwQ0J4bGIzbVJ2S1JQ?=
 =?utf-8?B?d2tPV21yVVNjZzdLbkNtTy83VDkveEM0dDYrci9CMklTQVVoK0NiYU5TRVFB?=
 =?utf-8?B?RUNZY1lEdnJTQXlQZFMwS3ZQclJZeWUxT0pJcVRYWnpodndHbnZwYmRVc2JH?=
 =?utf-8?B?SmZySDExUm0rUXl5cUxkTW1IZ290eCtGc3kyTC9JK3pqQUxtckREU3ZSSnVO?=
 =?utf-8?B?dXFPVERKMlNjYU1ENGQxZVBnNGMrNHNjS29DUkRBc0RPN1g5UmIrOE9INjBJ?=
 =?utf-8?B?NG9VQUJnc2FjZ2ZnSysrOEVZQ0U5UFlmdU1JOGEvbTRKOGZBMXNVREFzYUNt?=
 =?utf-8?B?bUZsSkt0T3hUcWFGTzd3dDU4eWYzZUlIQ1RQc1BSRFJzbUZmSjUvY2Q1Qkg4?=
 =?utf-8?B?c28rSndKU0daUExXWkxSWmk2bGNMbkxzOFVXbndOdHVOZlgvNjd6UFFuSmlU?=
 =?utf-8?B?L0VucHZwRytXOUVmTERWN0grVEFCNnlKOXYyalVzL0lHWWJQbUhWeE9kNUxX?=
 =?utf-8?B?L0p1N1VkVTA0T29RcjV1ZVBmWSsrTmt3enZuQ3o3b0NjTHVYK1J5N1pkYjls?=
 =?utf-8?B?OWhhRDlXNVgrYVJyMlRwa01TOTBPT2t4eUphNHozd29xTnRGeXpNTEVaWkpw?=
 =?utf-8?B?elFqcE43NmtlMEJZN3VYbm1IL1BvMzVrQUJIcGgyUGdGM2V5T2g3R1kxUTIv?=
 =?utf-8?B?YVFXOXNjRGRod1FhdnQrODQ2U2tYVEp4MU93eStqZk9GN1RiU2hGblpmOFk2?=
 =?utf-8?B?a29KYlZ4VHBtQ2VwQlp1bVpGZHE0Vk85d3hzb1k4UjlydEsxWGhlbjFvQjFn?=
 =?utf-8?B?ZU4rL3hOZ2dRZlhINk1RK1ppUERESkQwTjRPb3hwc085ai9EaURlWDYwSURr?=
 =?utf-8?B?bjBnR2hibzJRN1ZZYXZLVlhKSjloMGRGNDduamxaRForbE51MFRSN2JwSlVa?=
 =?utf-8?B?V1Y3R0FOVHAwdXBJTVBHcXc1SUZEVjJrQ0hwUkM4cXc0SGd4VWVISHZHVEgz?=
 =?utf-8?B?b2VNUnpDUGZJRHFiNWFoV0Q5cWxuUFJ0V25ORGk0ZzIzMENubHJDSno2dWY1?=
 =?utf-8?B?ei9WUExVN2FtWWt6Y2xxMnB4VDBpdkRCSG9xUENZSi9GZVJFc3lXV0lUcnFv?=
 =?utf-8?B?Sm9jS0hnUDcxZjJtOFlaeU9sYktwNzEyWGlnS1J0dFZINTdXbUFkUkc1dU5a?=
 =?utf-8?B?SDNiejRqTko3U25QRTdOUXZuRS94WjN3ajhhV1Y5SGU1Y1BUbHE4VnRqNk8r?=
 =?utf-8?Q?R7zlSVcaYWZ3ZoHI=3D?=
X-Exchange-RoutingPolicyChecked: 1/28fOLJXTWQX2wTiDRav7wIzbGypo/CoMq7O+lmqi3VpS0mOc/i9CoMV6Q9UGuE7gripnyfVydLeTi/qkilxvrU64dNBCaNT0pS+47y6nsRNDTEqc4wuV10ff50KwlqNiHwL4HDbaFb92Yx0ybptdIwCjfiXjsyEAIG6naMsvBuoyTgbss4pjeWKi4WHn869alsA7pFNVopZOFGXHXMoKyH1GwLhVMPAHojyVO4jjBDt+Epc/uwGa0q2sXpaJ+47TjQrL32OG7BOuubTnVk/OO8dxD0nm6vASW01vQwutG7JAZ82AvOtoImSn0zgvf6VZyTuZte8hpUqoHZg68//g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d80da35-ab7d-4af3-b028-08df0f6c9dc6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 18:52:08.9223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mHpL71YHl3XvxQnr4T1ZDoNtJ2AEt+vJw0GtQsEgrdhpBsLnQy8jqUUvJqJ0ZJsHwgpzGHILYHoEeDVkelnMML4PaEvo93KFdPBjnd5v9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8605
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

On Mon, Aug 31, 2026 at 01:09:36AM GMT, Thasleem, Mohammed wrote:
> 
> On 21-08-2026 06:18 pm, Michał Grzelak wrote:
> > Each suspend test is executed per output. Limit number of outputs tested
> > to 3 by default. Add command-line option enabling execution on every
> > output.
> -->any reason setting to 3 outputs?

Wanted to have output count as high as possible without hitting
igt_runner's timeout. Here 3 outputs should still fit in.

> > v1->v2
> > - fix off-by-one error
> > 
> > Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> > ---
> >   tests/intel/kms_ccs.c | 16 +++++++++++++++-
> >   1 file changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> > index 9ac0ac8e2b..11bc30769c 100644
> > --- a/tests/intel/kms_ccs.c
> > +++ b/tests/intel/kms_ccs.c
> > @@ -141,6 +141,8 @@
> >    * @yf-tiled-ccs:              YF tiled ccs
> >    */
> > +#define OUTPUT_LIMIT 3
> > +
> >   #define SDR_PLANE_BASE	3
> >   IGT_TEST_DESCRIPTION("Test render compression (RC), in which the main surface "
> > @@ -188,6 +190,7 @@ typedef struct {
> >   	enum igt_commit_style commit;
> >   	int fb_list_length;
> >   	bool do_hibernate;
> > +	bool all_outputs;
> >   	struct {
> >   		struct igt_fb fb;
> >   		int width, height;
> > @@ -1128,6 +1131,7 @@ static void test_output(data_t *data, const int testnum)
> >   {
> >   	igt_crtc_t *crtc;
> >   	uint16_t dev_id;
> > +	int output_count = 0;
> -->IMO: Seems output never reset between modifiers iterations, check this..

Yes, will do as per your suggestion in earlier patch. Thanks for
catching this.

> >   	igt_fixture()
> >   		dev_id = intel_get_drm_devid(data->drm_fd);
> > @@ -1153,6 +1157,12 @@ static void test_output(data_t *data, const int testnum)
> >   			}
> >   			for_each_connected_output(&data->display, data->output) {
> > +				if (!data->all_outputs && (data->flags & TEST_SUSPEND) &&
> > +				    output_count >= OUTPUT_LIMIT)
> > +					continue;
> > +
> > +				output_count++;
> > +
> >   				for_each_crtc(&data->display, crtc) {
> >   					if (!igt_crtc_connector_valid(crtc, data->output))
> >   						continue;
> > @@ -1221,6 +1231,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
> >   	case 'r':
> >   		data->do_hibernate = true;
> >   		break;
> > +	case 'n':
> > +		data->all_outputs = true;
> > +		break;
> >   	default:
> >   		return IGT_OPT_HANDLER_ERROR;
> >   	}
> > @@ -1234,9 +1247,10 @@ static const char *help_str =
> >   "  -c\t\tCheck the presence of compression meta-data\n"
> >   "  -s <seed>\tSeed for random number generator\n"
> >   "  -r\t\tOn suspend test do full hibernate with reboot\n"
> > +"  -n\t\tRun on all connectors. (By default suspend subtests will run on 2 connectors)\n"
> IMO: this should be 3 connectors as per description.

True, will do.

BR,
Michał

> >   ;
> > -int igt_main_args("csr:", NULL, help_str, opt_handler, &data)
> > +int igt_main_args("csrn:", NULL, help_str, opt_handler, &data)
> >   {
> >   	igt_fixture() {
> >   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
