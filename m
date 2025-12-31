Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0B5EE645F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 17:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B81110E04C;
	Wed, 31 Dec 2025 17:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFAq3iWF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3C410E04C
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 17:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767200446; x=1798736446;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qEBMYSeDlbX4eQas8k5R9uwfW82Z/KmVMuxt2wNFTNs=;
 b=EFAq3iWF2Mpp+gPXxOpfhsoQtJigZTndH/PkJe8dveFT/Ny1Fy81JgiY
 AYVMJ2ySXftfWo6aNXroYcQEqlzMlxoIuDCdEEhObyLbCS5KoJnbKmA/6
 0A2fs+UJQMy7YimX0m352iBE3Z+3DIDtE4frJNPzKDcQBcl52Sc2LoeNK
 mhV6k9vc/GtM04qhXFQIPUbOpEgr40CipalLFpDjTi5fivDXaTH8hFv8o
 1pDFQidZ3ET1dDDJ5f3U+jUJGvVI4yaf94UNlsYwl3Q65MtCw0AFjDHv4
 I/44NH1oWy+Ph+5FqiKpv3VaWXue7VCGLaHC5BLBcW9nQo+XO1jWeXF0L g==;
X-CSE-ConnectionGUID: Fa8zohy6ThmBrxzqw9QNlA==
X-CSE-MsgGUID: wLvOgaynRPi9P6cSdrengg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="94233276"
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; d="scan'208";a="94233276"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 09:00:45 -0800
X-CSE-ConnectionGUID: FmpPiNz8TxCByZ/vG8bt1w==
X-CSE-MsgGUID: 6eEuAkbtQH2bVBq0Z79Jcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; d="scan'208";a="201232793"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 09:00:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 09:00:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 09:00:44 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 09:00:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEnkA4ZQBsp4e2l9/WqxJG1Xffux8vSOVlrKo3OHr6XHy7bC2NtkAB2xonCJ5TCXjPbt3J+cK7haURcbolRP7AGm4W/oLjCyqULNGSg6c4CxHtI47xLlyUH2vTXsnuCK+vPI2svsQ373Ssy910Aj5IaQNN3lbwjlensO/QDYEHZHw5wEqf84OSPzKvVRZQavDz7QkTiajgHotttd66qhN0A9tIm5oP9xm6jc6inciiy+In5QlWs2DfmoHWYfKk1rLvlxNLhSg3JIfDGqQwf4DVbuEkZfmUItIW6mx1Pz/CqfmO9wb5HPyiNwUkSIvWFpk3QrfNKBDJSaazwm95EiDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTZDJ02t/LSN0gpMIipyBP/Hz7YNs3bPldMR7t+wIg4=;
 b=G85chMbJgrXUZ0nRumUwDdi2Od2aqzEZEDPp7GzbBpwK+BKz47T1fo8zOpbTTmUqcSH2FkaE5S8ODA7crzAukn8rPR9lAmBYvVv77X71SpesXJbQCb5A/Gi8nSyE5xJRgiDiPDv6zj21cztu1EZzZkPCdg8r8NvlMRwHiq1wr/M0o80s047Y3GxNFmMrYgpynlwWgWC6uPF/s+t/+oDZRoGn+Xr3PtwFKtTGOmfl/PDOmCean78uYLWDxklU8a9hWCQBqjF/I6iBdXY753vKIt0zNPGkw8fVoy6MkZUgK/Cfwdl6K9DhHLTgB/cAWyS7VpIqkc6C5TCzAp1YGR8sLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 17:00:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9456.013; Wed, 31 Dec 2025
 17:00:40 +0000
Date: Wed, 31 Dec 2025 09:00:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <alex.zuo@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>,
 <kamil.konieczny@intel.com>, <ravi.kumar.vodapalli@intel.com>,
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH v9 2/5] include/linux_scaffold: add FIELD_GET() bitfield
 helper
Message-ID: <20251231170037.GZ4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251231055525.51524-1-x.wang@intel.com>
 <20251231055525.51524-3-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251231055525.51524-3-x.wang@intel.com>
X-ClientProxiedBy: BY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 9674753b-f379-42dd-b4ec-08de488e20cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OK6qD/DKxvBw1udn3EvHdpajltwGpnh9nfbUD/RCOE1BDfWuTa79v8pU5gK1?=
 =?us-ascii?Q?Pj0NUhr2x7+a/atriaNKNGnVw4IsUxBnMLkNBvXfCOacmzB18qnedNxyA17g?=
 =?us-ascii?Q?Q34iMqohGGUX0SccvQdux0lECdhA4yb6Ge30YIupFLr709PRUSPmCX18hHsq?=
 =?us-ascii?Q?i8YpU1Oqn6MQLBA7n5TzLGxGEs7Lx+2X/e+XuStsT8THbdDPYAeWWJqlqofK?=
 =?us-ascii?Q?6tDbH5GdfBiKXjUUJEd0KtpRAa9hl4tpN/uPHlas6E7paO/pkGphq0iMLZw+?=
 =?us-ascii?Q?UqK9HMKw1bOtZitZtg+hdTGilJvbSKEbUgSRI96p60bsuJS/LUEoXJJZWNRJ?=
 =?us-ascii?Q?KAeWadZ0wZjmPvluAaKaALbwhvFad14WYQ88mKF0tRnEINlfpG8tsN0LzrEz?=
 =?us-ascii?Q?b/9Yh2UyBS43dOEi2oCyvAtnBFUqLPfVHhVpJmrVSAQAywP4XZxggzxpUwrb?=
 =?us-ascii?Q?EfEcnPQZvBskXkjlfStoBEtuHxtiTHei2/ychOlggkSwQh+JIbuCk9oaCOEu?=
 =?us-ascii?Q?pivebdNasQlz/+dR4ruci/8oQJkhPcm5aVdugT7JGZ5Yi8nwoz5Fjss/coE7?=
 =?us-ascii?Q?sqkf3sUPA9jjfv+Kkeykqaaf+fbBkz5R2FrXTWh1yyazoXJofsRwk6rUMwL9?=
 =?us-ascii?Q?olv4D0x0o7EjdlJ5yoqKKTzi4gCyWiJdGZyZGpHRVSPc0TiZPrcqRmHDko4f?=
 =?us-ascii?Q?FQUTP7fw/eAGV9S6rFFVevV9fSh7O6WCi4MeJkgPyLMukepdxNcaJkhjdszt?=
 =?us-ascii?Q?FKxoCbCPdvFRGTVsV+5Ccv2T/pwRACu/H0bS6JxKXS16fO5QYawMoa91F4kP?=
 =?us-ascii?Q?418GZ35HArISx6CaayshoKtqxlMnAqDoBL0AW5225Bri9TLSd+3f9uL2f3iA?=
 =?us-ascii?Q?oRFgwibMnPKeMsUFp1E+evRWGwOC0B9f5e1Z1n+hDnH7pHE4xG1TRESDbFjL?=
 =?us-ascii?Q?NH2HO6vUCIFZ1ABC55iNnIKmVZug+KSl/hZqL0pGzVPNkLeEoVl8U/x+KhOr?=
 =?us-ascii?Q?Ja3IQ4cEfqQtr/SOdEBWIdqpf2RF3vEBaCBuHQl+Sy2iihXrqnBOsDXDdexA?=
 =?us-ascii?Q?yBBYgnInRxZbvSYLyVE7GdgGCy+4EGD1jgnBV8aX65IdUiS2zmhq+jYB5lP7?=
 =?us-ascii?Q?fBEyGpxqgLexpC9b9ox13U8Sp/2jKc65wEItzSn853J/Gh0VCie7wxEsA47c?=
 =?us-ascii?Q?VJsU8EKjBKFSNqcigEY5QS6V2noQ1PcGLQ5KB89jMWFcJRMV7dk3IE5RWDXW?=
 =?us-ascii?Q?jWO7E18VUebNUptzdQNWp3R1ClF7YMIO0sD0mmpUAoYzxsVryGUCrL4sKqdl?=
 =?us-ascii?Q?O0bvxCwQv0VRCC6kVTiO5y+juD5cS6SDXKe5u3JUxs/4Ke7KDVPneEHNvVmE?=
 =?us-ascii?Q?oVxnPFbx0me2BSmsT1PmUsfCE8mZ9TkNtKD9X1efHQUwCkcpWRfufJNOaDhB?=
 =?us-ascii?Q?Dv1cFKj5OEKJIXcf6F66GtoYf8ckkvLy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rZ0bCgHCcvBabRzfgmZ4iFbYa1tnXS25UDeIulLWUc3Y9D4DM1+X8b4Xrpic?=
 =?us-ascii?Q?uM6lr5aTmGO76Xu3mNv7KIhAQGukT9qBUBxG64Bml+qZk+e3opVLIZqDi7AC?=
 =?us-ascii?Q?QA2MBYPtRe8OWh5uxDzG/A07Sk2fF/Zps5u8tkNGDtxSQ/ybAGtr104OaR+W?=
 =?us-ascii?Q?qcfaE2A5ftQuEPr+aEaKzSFqu4bl7aPkyygdStoqH87dHruIYQZpQP3gerRc?=
 =?us-ascii?Q?rV+SQXdEf7M3O8DBspEG1uPfxncCVBgB1U1vGVL//St8+sFwz8JvOdGZdX9s?=
 =?us-ascii?Q?F0ryHjsu1urokHmEEtKV7W0XAlln2ngwpdoVWFrVuRaARBUMA5bLD6rj2I21?=
 =?us-ascii?Q?4iDsjdAfFx3aA2mXvK2G8ZsLiWhqTmsg8xHMImqJ+WFkm/kyf6jGLM2mAHuT?=
 =?us-ascii?Q?6k0ZAEZkEl/pKXA9Nl9U94dKJWziSZP0nFJa3v2dVwpvj77fAhXr1/Tmm3ER?=
 =?us-ascii?Q?dWfcSjlK580HYFroiC1Qw2IaRdWFnJXyJES+z030FPc9F9p/XwIcw5TD6LkT?=
 =?us-ascii?Q?h93wYr2FTCY7BXj7XL0dTS6lJRwpAPQJWf5fK+Z6uTqyOBoj9kzIqtfzsNri?=
 =?us-ascii?Q?BglBfKmO2w20xIAOqENNn2uodj1prJv52It/rtDoko5VJgn6qTuU1Ol3w+u2?=
 =?us-ascii?Q?hgq2uB3CRVJftOWGa7h0k8FMim86n8umJ0cxrzKCxNpoDcq0Jn/K4p6WIdzS?=
 =?us-ascii?Q?tlsue5+8OLINBG3+Mcq9nZ+pLRQprAvkwK9m1/ixa0BHYUXcPAMMCWBP/HgR?=
 =?us-ascii?Q?oGfmXdzD4L3sb+yX9FSC3hcPYBm6y6aNbR1Oaerz8CJf9VQ7vHynfw2wPz7s?=
 =?us-ascii?Q?njElwUHO1C8AMuRsIbtZTmNrrgn0Okp72mTUzVWob5wcIBD7vLppy8kEKxl2?=
 =?us-ascii?Q?sQkcqTv1IKPn2eBbw2Xd4+m6zl/Lth6B8Hp5AWyg5HfnIzSUbrjEKj81HasG?=
 =?us-ascii?Q?hQ1FOjjn9TEeFO6jrPVLpXKsJBsZSWHeUxZPDoDfJ8G4FT6VBZzEjvEch2hz?=
 =?us-ascii?Q?kyKHZ2EjH+OTwOhavolEkTEaltYV1HPl8DgK56ea9xGGGT+ZvLVhTXsaTRYA?=
 =?us-ascii?Q?JdAjONg8+yKk0SrYOGrpojL/hkJv4v89QV7RsQdqQ0JXKYdfkDtTw3O8vr+K?=
 =?us-ascii?Q?W63zt7JE2RMVMjn4As7l63U5mU0z49BUTGGhpX77AKDuprE6tq67LmYRJDrz?=
 =?us-ascii?Q?jHHYnHJJUBKdDa3qbzUnharIkMn8X+NVd3CzfMYIy78U9HOoH2IAogFJgq7w?=
 =?us-ascii?Q?QYMa+meaJzCNxq2Re3W8zEGUWqiFLRX9x4wgptRAWvda+w98gBwfaUl0nyoR?=
 =?us-ascii?Q?e0KlCY5Ftf8ajclMM7HF2vZhF5MO4mI10FbFRtWkbg0xee+gQg44dX+i2k5d?=
 =?us-ascii?Q?Wi3N7wJGeo5xFqUEx+5kcbUC8o7ZTlgxYe3S+awMjMXrmV5rNeGYk0MllITW?=
 =?us-ascii?Q?Sga+Y2CIVPGjXK+NjdhegVz2lYxXJmWygFBMtBt7D/oq6oHsfBhOnZmuK5YB?=
 =?us-ascii?Q?OG6FTUJ3Q7YJHxLr5JK7KnceHwFZ+vU3EoWEkq0i+AcqqRKbDKOpOe69Ygzk?=
 =?us-ascii?Q?GEJ5nLS8NtxUBvBMwPsIDDr2xAg70U6J5kbCFvW/OKkJOI7KMgti0xdtW1/D?=
 =?us-ascii?Q?5OHsh85AFwcOvY2y6XsprQI3gzfgNFxP8RZxG4nUmc40ExnFzztXR50dakAI?=
 =?us-ascii?Q?DyQHVPsuOYlAvd//j6ex/PjE3QC0ywLxFFgUJcplyIsR5DbH6KgQ4SQvAEdz?=
 =?us-ascii?Q?AWLZ86udELfKcmk7DhbinsAzL22XQyc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9674753b-f379-42dd-b4ec-08de488e20cf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:00:40.8467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouL3QCGy5akNw/t9zdCx2NK8txmXDpi1H1CF7K5qQ2tMexWoUro3nQXQxwdRW3KHj5DAU4aPv6muBYjuRRLQgTYsbtP7h8x5+8mUjOp0Edw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
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

On Wed, Dec 31, 2025 at 05:55:22AM +0000, Xin Wang wrote:
> Add __bf_shf() and FIELD_GET() so code can extract bitfields from
> registers using a mask, matching the common Linux FIELD_GET()
> semantics without pulling in kernel headers.
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  include/linux_scaffold.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
> index f6620ad0a..bd69c1ed2 100644
> --- a/include/linux_scaffold.h
> +++ b/include/linux_scaffold.h
> @@ -51,4 +51,9 @@ static inline s64 sign_extend64(u64 value, int index)
>  #define BITS_PER_LONG BITS_PER_TYPE(long)
>  #define BITS_PER_LONG_LONG BITS_PER_TYPE(long long)
>  
> +#define __bf_shf(x) (__builtin_ffsll(x) - 1)

Since this is userspace code, shouldn't we just use ffsll() from libc
rather than going directly to the gcc builtin?


Matt

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
