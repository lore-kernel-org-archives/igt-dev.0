Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B7CC52D7B
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 12:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6726A10E077;
	Wed, 14 Aug 2024 12:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzvSGeAF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9566310E077
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 12:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723636935; x=1755172935;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=cIueKvXJLFt8sGZyg5QeOdEU0EEEcHCWXZUa7AoLltk=;
 b=GzvSGeAFiOP0GYurd0plOtTs7JDysHaH1gNA82R2cLYw1bVxh0BrSI0u
 G9Ar6+WBt1O64aBVLS1KKTA8/pchX8jhScSJ7G/XsIF/dmtd1h6g7iCpx
 BD+Vy5OGY+eA0rjZKpk8deOITz9iaFtunarsjYeaunLIEaJWA9U4y3Os6
 NTfv2ZZPwXJvfItnIYwbyHvDeUO86vAKEY7rutjUb+M9fJKG8LvS6PYv+
 AKke2upWACcxde6acHXZuItvlYxMOa9ba2VDiOLfSMaAnmpi5IxZegRSV
 thuMnBnnDcCboMvBa6nQItD4j/BxlpqnMARDRB+oBlOY6mXVSLdzOO+z8 w==;
X-CSE-ConnectionGUID: WCW/7UfcTe245f4I4SueNw==
X-CSE-MsgGUID: EI2N2NvxS76y4R+Of0/oKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21814669"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="21814669"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 05:02:14 -0700
X-CSE-ConnectionGUID: qe9tZqzzRousDfujlp+vnA==
X-CSE-MsgGUID: 893Oq/+pSJayNP3DiQmEtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="89684896"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 05:02:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 05:02:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 05:02:12 -0700
Received: from outbound.mail.protection.outlook.com (104.47.58.177) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 05:02:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfQ0FCPKq9Gc6v3gG9ddyI2dUP8rTEm3Df/gozAOSdKlWPaxxbp9Lz4PBHhKDibBDUfTXLhZDaMiJgIjAQjqCRVLDlR9Ws0K+vgfVuLcBEqdjj4XqI8CL8xUeR6oWAQcv93h0y5U3d/K0ds9GN0RYMWI6cr7jH82u+YYDhJ95Euamy2p0Gkv+x+OsrdydtwxRRrdwA1jwsR8T2DrVf/OFqmAb+lQK8vyEWkauzT1PIFBaX5LhPEeb5Kcm5eMaC3Bg69pm0eGfr/ekhsaRN19b+hHOJDcOQJsnfaeCtI+ouYxy6z0WWDF6069HSzs8EUQizLz499UYs4LT9sRJStaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ved+oSkLMOsGEAXjZtydQ2z9smX375yR/tr8ftrMxkk=;
 b=T+HCEiFpbEKCIlmW+B2NtPO40ZzTr17ArGCvRjIjzji3E6lPWEznUwsNXEkLvodlXhV7e+18dWxRnn09naFDmcG+jjUgjEfw7xL8sZ/ZG695vTTfobrI3jv1ewokLlSjrqAvv3XUJ25IvOvKZ7ZhEymZOyS06sgQPzJnTPGEX/3xfAUaR/L/9GtuLu6VlfLTyoq5PN5cKVenSoCktjJhlAWfE61zuTA63gOhYJSNYzsfhlw6VFolhKc8bU5rIT9SOqkuLoy+xKv8DNz0tGzrASYGrJujh0ySYB8ZXB7zxi6nYIQm7nG4OT5tEVi5QZQlu5MoDCAGGfEQWo8ybkDv2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Wed, 14 Aug
 2024 12:02:10 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 12:02:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240813152141.3151865-1-lucas.demarchi@intel.com>
References: <20240813152141.3151865-1-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 1/2] intel-gfx-fw-info: Hide raw dump behind a flag
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, John Harrison
 <john.c.harrison@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 14 Aug 2024 09:02:04 -0300
Message-ID: <172363692447.1939.13186327848686414030@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:303:b4::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0fa96d-7f8b-4ff3-7aff-08dcbc58ecfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: C9fTl5hnSokwqRxcLNjuMH8YPM2hMAwaCFN/WTBNfiLZtN5gqb6VJkblIjwSUfB8TRDGo6TKRVKtew37Qc+KLaMMVSqMuAgaaI7IVkBVq//eJIJ97UK5W1XhGOmGVVSIlbtJIxNeZuU7NKb3fzog5TkLWfgpAoL8YczNaYV6p87+6isI5ra18gzuUd6FaxeUtqjwD8NyB1Ua+FehMg46vWKLtQ316Ce4o4+i+Df1ekdssyEmEVNvFO4p4ob+G9+JiGp/lH7aeqLblo+X91a9UZFEQZAk2CfW3cIa8I3TklLPMVLCnsOG8RrCyDqsrcUVnHQMp7EZdvvh09uj1Ywpc4MA7ZAQqJpsLwaymqBqy7wJOARImT+g4VgGxpfe8KR7jxdrOGZpz8NYz30u82a1ucNbxbYZXhVzvUhmkNAaMhuEe3OOGnvoptp3vD0ApM0JHBXUpHtj6kvuKxDPyeKI865wf6unAeSrt2ktPVxnZXGsYDDGB1PbbJrDZbMfxAqfGqfAa70SXcAfh/jE0sOVUxAeErGuTfWUnr2ewNiadM5CVst82CzUPU8ObcgG43fPpXC/rdOM9fOBQFnCzuefCE55YR6R3Uf6rzLrl934LykD6jBwCTjzWdV4Z0jfuPzoFMkc1t8PFVa6DrZP/Wlb8afgzksYn5HXwBbDl7i3LLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWZ2R3lLVEpQRnUzOVFuTHhHWDNtMHpVc1dLbmR5aVFmT2lZa1dsSS9HZzcv?=
 =?utf-8?B?bkNDTTBDemZMVjNlMVZjVE9DdFgxMU1jZ3gwU0xqVnpMbUJXZHFONmxpS3JU?=
 =?utf-8?B?Szkrb1JBKy9PVDF1eVF3VCtlOVJBUGwyczJSa3lUcWM2UncwcE5oYitBNDQr?=
 =?utf-8?B?L1BCKzZwSG1lU0FNbFZlY3FtK25XYlNENFJKZ2VtOUh0dy9XOVZBOE1aem1v?=
 =?utf-8?B?TFNUVEk4dU9VU1NmMXdlMFNBVyszKys1anBCY1Ird3dranhmU1Q2MlRWYjVW?=
 =?utf-8?B?UU00SjZ0RmpSelF1NnZia280NWFJcVVqNmtsTFBIKzBNczZHUUttRWljS0dB?=
 =?utf-8?B?MU5hUCswSlRYb0VFSkdQeitYbGF0K2NXY3dwL3dWQ1prRnFRVStDTXMwMU01?=
 =?utf-8?B?c1dvUkY2c0lWNUs3RW5QVlVpL1Nyb3ByeUxNTWNWWFpYMVd0bktETlNJTUs4?=
 =?utf-8?B?U2x3OGptSmVUME5HLzFpdmdmU1FTV21YM1NvVU9UOUs5YjRGZUgrT1BlWmln?=
 =?utf-8?B?REdTeEZKMi9zL3pkMzkrbXNLazlXbXV1cVJDL0NDNFRISUZJOTcrbGpNZXly?=
 =?utf-8?B?VzZsWEVnQTlGcGVGdGV6RlBLQUhUWitrUlJXQ2hBcDJFOEhlZEkwQWxSbDF1?=
 =?utf-8?B?SzJaY01tQlc1KzZtTmlTZ3ptTHpLektIbytPVEVTVzQzTnRzVS9oMUxxSW8v?=
 =?utf-8?B?R1dON3phcWRXdHRLZGtvRGNyZndBWUJOQlc4NUloQm5WQ2QwbDFpdUR6K0Rj?=
 =?utf-8?B?OHhOdGNIOU1IUG1QQ0FCVDdZZVk2aDgyR2dCVjRmMkV5KzhRMWZTOG1pRXpG?=
 =?utf-8?B?U2xtTDdYMStWdThnQUMyQjh0ZFAyRWcrZVl1MWpCVjJPT2pTMUdqZmc5YUhW?=
 =?utf-8?B?SkxCSTZTMEZISU5na0NGSzd2MVVOUU1lZDFPREYyc0VHNmNCVVFCTTl1Vkpv?=
 =?utf-8?B?UjFScC81RkFvTkc2ZjJiZzlBZWEyS09oVTNvd0UvU0FlNXhmeUVCV0wvQ01J?=
 =?utf-8?B?TVRpTmhHVnRidmFyeno0Umk4Mk9GZWZoMVQxbVM0bjBIc3kxZUo4cnhyQkpQ?=
 =?utf-8?B?YndQZGhRN1lhbWhjb2VjTlRwWEhEeGhPOFFoNnJkREFIS2dvQXArOEE3Z2l3?=
 =?utf-8?B?WGkzbktPb1Y5Ym9sckZ5anJMWmRCQ1VlQ1d2RUpFaHJDSzVjbXVDSUxDODE1?=
 =?utf-8?B?WWc5SU5jR1Q1Mkh1M25rUE02bGJBQW1MSkNBeFZGOVVVWE51Q2hOVSt2RDVM?=
 =?utf-8?B?dm9LYS9UUDQxTjByU3hZenF5Um4zWWFvQVdOenlFT1N2L0JiRGRubldJUzhG?=
 =?utf-8?B?Sk93MjBxTDNxOEVQRTljWEhLRkhDRlRCeUlDL1dlNitZV3N6K1NRL05Bb0Mr?=
 =?utf-8?B?cTdDaUI4RE8wbm9QbFVwZVZFYmovRjcyVEZKb0YrWWNYNjRTUGFyeERlcDVy?=
 =?utf-8?B?SkdDZHczenVmMzNaTS92a0pJTzlzOHNhUVdlYjBXM3EwdGFodFRmZHd2QjMx?=
 =?utf-8?B?QkJ4S3FLUlpKSXFxQVBFY3ZOd2gvNlZYUXpBYXFNUG83MlpUZnY5VHNHYzRV?=
 =?utf-8?B?WmtlbGlKZmZhNXdBUHZxTkZCNllEVkZnNlkwU0NreEFlRTdOSVhKTlFMcktH?=
 =?utf-8?B?Mit0UjlDeGxSUmJZRGRNVTM4a2VudjhYUlhwSnE5THJlWU52V1dBOGtoVFBU?=
 =?utf-8?B?QWJhcjd4aERGTWFDMWhWNzJSM0ZCdjZwVkdHNDU5dzVRVFZJZGJIajVhYmVz?=
 =?utf-8?B?ZDhTbE5EaUV2VzlJT2MwdU5oamZWM25OYlRWNHVZa0dhdkF2UEx2WVQ4MGdN?=
 =?utf-8?B?YlZVOHExL1ZMV2lzQnV3UTRVcXpreGx4VlZGb2ZhNEIwN3IzejE4a21iMC9y?=
 =?utf-8?B?REM2Zk1tQ3VNalI5ODRGV1A5ajFEaXZJZVd0ckxMNDhrK3BIV0l6MUk5QWU3?=
 =?utf-8?B?N0lGeU1LOXQ1NnpIUXlyNzNRWExocnY5WmkzdnRuanpsU08vYkFQbGNFSDc0?=
 =?utf-8?B?cEMycWd2cElRcGk4ZHRhTXZXYlJaWUZ6eXdkQzMydUhpQm9lY0IxRW5tYm9t?=
 =?utf-8?B?Z1RIWm5EVEtWSkxUaFFTOG5YV2FjZ1ozQkZKaFFRajgyMTdaa2xuZ3ZQK1Q0?=
 =?utf-8?B?OFVNc1N5bzZrTng4aWRuYUZVNzA1UkxlNUxybFcvaDJvL29tK0NSQXA2THo1?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0fa96d-7f8b-4ff3-7aff-08dcbc58ecfc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 12:02:10.0042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7KDtDEeGvwvpAdPmiECTvP+4JMrOKfGHWJFDhypHP2gy65vF2a83bVUGJ4oOOQ6Tj4OMgLbWiSwiTZFJIzlZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
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

Quoting Lucas De Marchi (2024-08-13 12:21:40-03:00)
>Usually the decoded part is the useful one. Hide the raw dump.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> tools/intel-gfx-fw-info | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>index 5eb733120..c0d9b00ac 100755
>--- a/tools/intel-gfx-fw-info
>+++ b/tools/intel-gfx-fw-info
>@@ -149,6 +149,9 @@ def parse_args(argv: typing.List[str]) -> argparse.Nam=
espace:
>     description =3D "Dump GuC/HuC firmware header"
>     parser =3D argparse.ArgumentParser(prog=3D"intel-gfx-fw-info", descri=
ption=3Ddescription)
>=20
>+    parser.add_argument("-x", "--raw", action=3D"store_true",
>+                        help=3D"Also print raw header content")
>+
>     parser.add_argument("filename", help=3D"GuC/HuC firmware file")
>=20
>     return parser.parse_args(argv)
>@@ -173,8 +176,10 @@ def main(argv: typing.List[str]) -> int:
>         return 1
>=20
>     print(*fw.decode(), sep=3D"\n")
>-    print("raw dump:", end=3D"")
>-    cstruct.dumpstruct(fw.fw, color=3Dsys.stdout.isatty())
>+
>+    if args.raw:
>+        print("raw dump:", end=3D"")
>+        cstruct.dumpstruct(fw.fw, color=3Dsys.stdout.isatty())
>=20
>     return 0
>=20
>--=20
>2.43.0
>
