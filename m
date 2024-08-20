Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D31EC3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 18:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F5910E828;
	Tue, 20 Aug 2024 18:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RzvQ5ktm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70ACE10E828
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 18:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724177603; x=1755713603;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=DRo9SXo0sNg7kXGIFqHRVyw8g/s06L7RkLM+i7ZeP4g=;
 b=RzvQ5ktmw7JogHhQJ8doxl/X3DBgria47c++8gTw3RtecIupT5B7c8/c
 oyGmr6kRiV++j2ZAgzqf3g/yontkOXPszLCQduFq+paJZsCtI/1PPLQ6e
 jMr4TPBLp5WrrTjURFZ9c/h0dIi4Ed41izA47MuEyNuV0nXMfszd8u1eo
 vSV/wl91SpKlva9Rk+O7B6/aJV9rr/BOSrYwRCkxQMA9X1jRGTWhssFss
 G6EZagi++tUZvwHOpQbQev6QrKoc05T9XjUqMUpJzKrJEZVnMpoRZ3T4b
 TQgeyZFNBFTFnGhAeqTwQgNYpw+WqQdzkdl4aVCAXse2sdZ+NSMwBvtK7 g==;
X-CSE-ConnectionGUID: 2on4TsbTSm2gAGtLR1SOdg==
X-CSE-MsgGUID: 58UQaXJnQ8qEfKjvj7n2nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="47891322"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="47891322"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 11:13:23 -0700
X-CSE-ConnectionGUID: Wxg2k84JQ5qSOJhSWMjWPw==
X-CSE-MsgGUID: BfX468fYRVWeR0O8GfyGYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65511611"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 11:13:23 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 11:13:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 11:13:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 11:13:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxKHL/szFNsRUuEENJiUHp/qbNPcMlLjUk8ebB6pJxy5BdM5um/mKINDkZny4uszDADZsmQqb34+5DAdaVUJtzphyaBs+fwgsfHloni89xxMUyAlaUAgd104AYYfip3uZARu7Xv7OQZIcSFtFaBLcGf/NNKqfHpoJVcf9ZWIzzPc7zhUrlwaFuj6955BVnxRr+5qiB/4ehU2Y5R3x7cym3yvE+7wkm/0LS/INv2r85XMvFbi59gFZFuv5xNbdh/2D8qG1TwSoBlh1H+qdV7fZsAAWY3eMfxDXqtK1x9NJ9TIha+Az+QxKlPIMYzkAZF8sVVxhTxUhfxbz8nRvJJJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdC5UaXqtpoHqwpARzUcKQv+dgShTQvffCSnjv7Qots=;
 b=HLAYDJNi/mlrSqYg46Kwckj2SDb4JmWbVPhzX0YzJFyzCU2yde9DIBMvsWGzaAVzgOtAKd/y1d6XbT/tiXPw03JZC0tQZX5qJGkuaX+7tOLlk4aCHYuBxOix6p1XFRh7eM5cNoFvHjaL754+YmICRX0ow9Q2ZdgPh4g7Sclwj/kI+F4S58jQ32QNizcKhd10ptbc9irjQ1exLR9wsGP8/wA9reobkGHYyRYPsO9tjvrApPG/f9ZOiy0rn9lmk4d9sRfu6+vn9a1/uduMeNyaFhlehSXwxyMmj2WjhVa56jNFLs6TQxPE5vb91sYDMVQtLvxwSZGKjh7geISuwGcy8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4544.namprd11.prod.outlook.com (2603:10b6:806:92::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 18:13:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 18:13:20 +0000
Date: Tue, 20 Aug 2024 13:13:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t 1/4] tools/intel-gfx-fw-info: Annotate abstract
 method
Message-ID: <eya7a6vfytkbupvc724dsv2kkgqeybefau6y6f5qhi2zs2lxmp@f2l4ud63haq4>
References: <20240819195600.242767-1-lucas.demarchi@intel.com>
 <20240819195600.242767-2-lucas.demarchi@intel.com>
 <20240820173543.5mtjfoc73kh2sihz@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240820173543.5mtjfoc73kh2sihz@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MW4PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:303:8f::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4544:EE_
X-MS-Office365-Filtering-Correlation-Id: ff35e08d-4d30-406e-e011-08dcc143c5c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aqorNuttmF+lfcqcMmdHyaTYrFcPhOiiHqVGrC5NujnYLkpUqpGfqZ/5A2qI?=
 =?us-ascii?Q?WeswFbow1Lzd4RWYJ1tbck/DDXfSIE9tViXocxcD2IJwIZ+oHsUPm9I4K8MR?=
 =?us-ascii?Q?WsnDCZ9ngQIwKR9z8Vtt9uLOtWvOhAJyasOSREeXNxA6XzS1wao1pPfCL+Xr?=
 =?us-ascii?Q?2ALMocgeAk0fIurPjEev9R5bsQwGkdUW/QyqYcTSiEeSY3qi8e99DGaEMLT5?=
 =?us-ascii?Q?ICCsqxobxNNGx7mo7VZZ/NbH+rShw7T/i2TITg5997ncrgWhnkYn1ZjAB6aY?=
 =?us-ascii?Q?0JdRYpYXFmGhiKQFNE+uZbydUTrz3BAsJbq7u7sa4YK8HicpPws6lmzNNSJ3?=
 =?us-ascii?Q?lBqJKqnyWzUocwCIbJ0+Vw8aUipIOlE1sCilo7m6kWUTRD2snXnyP2PXmiL2?=
 =?us-ascii?Q?WB+UBaYTwbwMibBT21hsEQUkedxW5DUFmSgx8NaWBxucF4PfVrY3xfUhpTlN?=
 =?us-ascii?Q?eBA10g140P5ZdC3LtFXC9YlyIwB5V4uRSD3CGxYOUsuU4hpitRn+5Fqauu2M?=
 =?us-ascii?Q?RXgY3GY3ToQLBcW+qh/iLX7wZ9ChcPBKVZfTXoWYSSxgVMcYEqtPwx2f1Gh4?=
 =?us-ascii?Q?o2UsgAjLmzOfZ8vyNCQRSiIepH30g9tuLJeHE1ZJc+Y/xDWrtaD1zPkhUlXH?=
 =?us-ascii?Q?0OOvWtrlsARCR4J9l+Vac4kCXL2K4kRcMnhdp/1WPwz1pP3nVdAGppnT3UvC?=
 =?us-ascii?Q?g3QtkYm7BGCnThcVIt8Rl71MhCDEC5QznTheepciZK5YPbdH79wew1Y1nJnF?=
 =?us-ascii?Q?fgvUqPyAkDfo+PbP4dIZdgidxSul2fmYiX2Kag7MEtFoV2xb0Sgw73Y4VMu9?=
 =?us-ascii?Q?0shbdL4seqLmqXu2mRybNtJklpjACx9fu9/I/DF5mtsWZmSTVd/et+K4YsYA?=
 =?us-ascii?Q?CVnXFQ3gvSkwILItLM9zSv+w2DXUIkz1rCxHSFo/mvyX+vJx4B3y/RROq3mj?=
 =?us-ascii?Q?8QzjOMEq4SOD24ICXcubZRqGPyuNo6ZL62cmzAb3LdkJ31sexX+1C2nQNou6?=
 =?us-ascii?Q?jhCojLQ8dqdK1xkImU54XdPd8TWyMl+/eOEU1O0xLqYMcLtGVpSiDV4hkfD1?=
 =?us-ascii?Q?R1Aqhvu7zNwFIYeA7a3vsiDmVmEcaZ5wiMm58Pvq0yhBFc3GsOC8GBsjcszm?=
 =?us-ascii?Q?rv7SxPtcuq/gIAfLOMXqPCqNH98ZQfIuouQqYVMvE/xOfKL8oo++ywJ/csu9?=
 =?us-ascii?Q?7lQId9dI0XCHjOZtOMGGl52yCbWOQ/MIGzGUh8oXPP0it+r9tIfvnopoCB9a?=
 =?us-ascii?Q?92DQTUkDshNH3boRGnULLXHXUKHu37YWB0eP84N1XE1tP6xqG6diJaY+aguA?=
 =?us-ascii?Q?qyPIeOWl6XaUTr+loL3RVHeD6VlLkc9hSv94yIpwoVWbZA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0JudXa7wyzwus+APH/b4VLJTAJ1NongUFeIM8pdrmlZPIIJZwcol7/sn43cg?=
 =?us-ascii?Q?Vhu9grKP3mlQGxHyQVol6Da6EI8WTkXmSZjnle2pdGfaLsa6eN7FBeGiTABB?=
 =?us-ascii?Q?M9NnPMKg1zHyLgXTO2zAsqtJtBgDUywEOWRvvZGK76YpRl7E00NTEyimngo9?=
 =?us-ascii?Q?G9h+DGq5jQ16Iygqip5mVVBO8UnmYtZ10jwum780LpAn43IpNZ6SNWSMiBsQ?=
 =?us-ascii?Q?rMuVvVbDBA+ZqQDe1plCrF3MB30MDcgo1YIq4RRrxa7FXo2y304TtszYtCaw?=
 =?us-ascii?Q?g9tTIPPW40hIy7BdQyxUJMFACbiLkBuSLHR/ksWil0ZNgZMIROzz90jBF/w0?=
 =?us-ascii?Q?xM0Gznx7w4zkwP0VRVPN6Ms+2SeTfvMvrHpJJ4jcHj70OvGozS/dH803dQHS?=
 =?us-ascii?Q?wb2ZWK9bmC9CQAXMIcS2Gxs5cnQm185JwTDUGkIH+FiRao34wER+femDvz5I?=
 =?us-ascii?Q?fTuxS9ww476VZ/AsfgEt970/kVmASbJF+2GJcHF1Zbeq8va93zicW6OeakqW?=
 =?us-ascii?Q?DcqY5T1GM/CR3MxSZhxK7qHBAubsHxedWrsHH4zm9HWasQT9+EkqOofj2hVD?=
 =?us-ascii?Q?LCUTo96THbx5aL+qnIrFLSbCunHJqL99+xGw0iGSrtX3xjQbHlUu7N95sq8B?=
 =?us-ascii?Q?rFWqR81qn7fSY1zThLyXuWNuU6g0sCy6r3wVl2mVTPobbe4hvvCVPpMEJAUG?=
 =?us-ascii?Q?H6GiqkH6MWlEI0FdMPwjgCEo5pOhb0yZKh7a41aPHiWTjgpvG5xOJo2fK0jQ?=
 =?us-ascii?Q?mBb92Abkvh+UqTnFxXSDe1IAAxf7QSfPAjMRjtcxzli185LGIz3UUsZwVQS3?=
 =?us-ascii?Q?ptjJtJuDyARKbUAIWF1KjsUvy5kOEqsK+UPwK70DenFYbLsTH31m4WiHuqK/?=
 =?us-ascii?Q?ikBHlrsznnXTLuz5kyEFUdU/wiU0jJJiwNj5dhAbqPgnRadzidGCkdZ2Cjsu?=
 =?us-ascii?Q?ybDG4yUzosnHpYfa540xRWvF5A9gudmKE+IeYt9UVQ3b7e+cgPWr+pN2Zc/f?=
 =?us-ascii?Q?YvyO07AD5aRyh73Rw57+P/Ed8iwF7lsy/cYXQiTOvkIKQJn3/rBvQqdZrZw6?=
 =?us-ascii?Q?zO4FB8My3/p/Gx/+2vqk/uyRsMF56XAmCB4oWXm9aCWoclaioOVx63aVFipv?=
 =?us-ascii?Q?RJzezAexznyBY98GClIJK7GjzzE9nFn48E2Lo4CEqGHCgR6xmfyKlwMocyLo?=
 =?us-ascii?Q?J92sFj1fx9b0GnyBZljtFJc34hHGg1F0vQboTS9OPWPDL7rX6udEmnGOxRxr?=
 =?us-ascii?Q?nYnJ+qXjyDNPvYKwNDQ0ev9jLCOSBe71hdvpecHbV2NGXGd02t2r18yBA83e?=
 =?us-ascii?Q?7u1wFY8abmOJwo73nt6V6+WpJYcGGdlkComGpgk9uYxOByjb5ARUtrwTgeSw?=
 =?us-ascii?Q?QSf4vlP7/zlojeCudNRlvki8RVSM3wVkPG2K9mT69wd/vNATC+aX0J69m3PG?=
 =?us-ascii?Q?hVyoBC/0QXWI4ZcYBpYms11XT8mQLFWCSDW0POWozMI/nj6cE5D3S2PPWQYI?=
 =?us-ascii?Q?uddJcjieHOUCplEGq+jtUkWmaH3QopytUCwYjVPy4eQVyykR3v338rFfkc+D?=
 =?us-ascii?Q?dSZhOOHiNiaIXp89cOnbNfqyIP+9Iqw45kQVxaiSxSApfWY8wJM4p7MKrOVz?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff35e08d-4d30-406e-e011-08dcc143c5c6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 18:13:20.6386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RG6hCpl71VPbGw4ldTjXpKFMypxeKtvC/Cm3YdSoUfOQbtKH/UuQ65Ybpuf+ENsEWRnFeJ9ad8zjH+zaJgKKtWAvgzHOB+abO7U98w3R9Xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4544
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

On Tue, Aug 20, 2024 at 07:35:43PM GMT, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-08-19 at 12:55:57 -0700, Lucas De Marchi wrote:
>> Make the FW an abstract class and annotate the decode() method.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Please use pylint and address few issues like Unnecessary semicolon

black also warned about those and a few more... fixed locally

>or Unused variable 'i' (unused-variable)

ok, I can replace that with _ to silence the warning.

>
>Last line from pylint:
>Your code has been rated at 6.75/10 (previous run: 6.75/10, +0.00)
>
>I am not python expert so feel free to ignore this.

If we ignore some, then the code becomes perfect :)

	$ pylint -d C0114,C0103,C0116,C0115 tools/intel-gfx-fw-info

	-------------------------------------------------------------------
	Your code has been rated at 10.00/10 (previous run: 8.46/10, +1.54)

More seriously, those disabled checks are most about missing docstring
and opinionated names. Not very relevant for this simple script, but I
can add some doc on top.

thanks
Lucas De Marchi

>
>Regards,
>Kamil
>
>> ---
>>  tools/intel-gfx-fw-info | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>> index b0d41bbae..5156c724c 100755
>> --- a/tools/intel-gfx-fw-info
>> +++ b/tools/intel-gfx-fw-info
>> @@ -4,6 +4,7 @@
>>  #
>>  # Copyright (C) 2023 Intel Corporation
>>
>> +import abc
>>  import argparse
>>  import logging
>>  import hashlib
>> @@ -103,10 +104,14 @@ def FIELD_GET(mask: int, value: int) -> int:
>>      return (value & mask) >> ffs(mask)
>>
>>
>> -class Fw:
>> +class Fw(abc.ABC):
>>      def __init__(self, fw):
>>          self.fw = fw
>>
>> +    @abc.abstractmethod
>> +    def decode(self):
>> +        raise NotImplementedError()
>> +
>>
>>  class FwCss(Fw):
>>      def decode(self):
>> --
>> 2.43.0
>>
