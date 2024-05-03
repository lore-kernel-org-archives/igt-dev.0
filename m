Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EC0C4345F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 13:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E3A1120E9;
	Fri,  3 May 2024 13:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I43xWC6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D41F1120E9
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 13:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714743562; x=1746279562;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wp3UO9oxrXJWGHY1ecUVRQixD9cqkHcWgq1hPcpco3g=;
 b=I43xWC6I3K5g3Dv9wxJ4II1M3EU2jHA3Qyaail48SkmrxDvz/Cotv5vu
 5AdAbSok8ZH/FkegQ50fAny5m05q6N2xgGaSIKU3PjTZlwH+BI+IUbZa7
 BRVdMKV+SDTQHmxu2GjIJz1u9CHwFBNhJIztvvEuty9enB8fJaaL0tkTQ
 klkOL4e4uo4p3/SUXzwwvEOX+jLSPDyqWvMHi5kT2j1PU7CatObqrvuXe
 d0c0hg7eXJO8dgoAGzBw9g+bYlRiQVlx9FMhbqlI8Sq3qAeH60cDQFsl4
 /JGF2qxBJU1yLKVUKr+vwJUlGH6JU+93EtyrfSvQEyboYu53PBW5qfzeJ Q==;
X-CSE-ConnectionGUID: IL7rlmpSToyPeQrJLpObDQ==
X-CSE-MsgGUID: q0EYBr0OQY6UCopF+qTWRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21103698"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="21103698"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:39:22 -0700
X-CSE-ConnectionGUID: UG0bQCprQh2XmqTNqrddsw==
X-CSE-MsgGUID: MlIb8hI+QYeFkWYN9Mg+jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27481769"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 06:39:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 06:39:21 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 06:39:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 06:39:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 06:39:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Av9b0c70nV5yzLvkoDDaMk5++YFTMHRyABhBKPl2XsAEwwcEasvM6bbJsOoxB9fKwltbxGV2m+EXkElyvJU4FKTa2dUn8m9iNeQBHceT2EkXMlqSAJobNo//S4ID/uu61ToAgafIh6Sn0r80QXl3xnTgSyVw6O/NHYvuyDFunHBo7yUo+79PIvBMLbZ/fdo2UGIVFWLClRKffQ4YN40iqS8BFRkPrytE+frk8tHBolVnDPnlViI0gzGD9ogIEmflSq6fl4d6x07/5e0WnrYBfvyV8MR4vEZ6VapO3MNLt1/CXFJkVJfhcoP56IwGcVmB4WdNCpeyIx0AuAx7kfx71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZiyGBuHREXXBLGsgJhKvM7oMnOYey+2zCfUPSsuGVc=;
 b=YjeYrtpUSurMoORYwS1dZ1JSyEuPvXcn8wXy4o0nXGesYGE17BdoZkH+gGD63CobuNN7Sy4jPuGuBoyH6ofJ7ftkSxzuX1w5rb3FgeDzdfXhIHdTa3FPnCcyG3bKyw4qH8bhyLXdIPfCzQA/tw2qswf9MORq0KvgWX5joYucBNtHb5XwMI/8FjjhbSYtuPcxJDtoUaqAJVeaFLGdNMQRiOFG1KoPMr7m52hGsPB2b0Xok04Ay/ltv2VCYHju+jtURHIJXuqumDhM5fgSKwkj6Nf2OpIglL2dV0EtuhL553jdkQuhUiSn41l7ipii7vlGaydvYOd/xcwI4gqX86UUYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Fri, 3 May
 2024 13:39:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 13:39:18 +0000
Date: Fri, 3 May 2024 08:39:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH] lib/i915/perf: Fix warning on codegen
Message-ID: <sxuwf3ay2dl4jxsk27axchizpsdin3fsye5yexmhbcoqne6unu@exdiegcm5ahd>
References: <20240501070145.49810-1-lucas.demarchi@intel.com>
 <171466694402.62619.1567379194886699598@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <171466694402.62619.1567379194886699598@gjsousa-mobl2>
X-ClientProxiedBy: MW4P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e6d020a-7ae1-47d3-3b3e-08dc6b766e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IXJ7yuee5YiG6Gk5QeiEdX73e2KWudpk7tPQ1NOI2DYf4HLsnrBTsgpInlYv?=
 =?us-ascii?Q?lY9umUNhZc++OSELHo7TZG67dnXieSvS6A3YBGqes+DbBqR4nrekUQHI2TYI?=
 =?us-ascii?Q?t8gTffpeYJMzQo6Wl+isdMmj1j5Wyq2A04pP8gOancheyFvczkBZBRegjNOm?=
 =?us-ascii?Q?HzjcuExSmfXIVHJ6xj6gY3EMLkbGalmAkNZWzyQ26HE6NEvs1uIs6cVq37eX?=
 =?us-ascii?Q?1MCNhxacf2INrNihIA6BoazxwibOU4K6ZXIhK78I1QWJn9VbprccwfMCkXjI?=
 =?us-ascii?Q?aagoEc03LmrpdP0i1LWsZq+1Lq5KCGRCRgXZCnb5pgH3W6rLx3WrJX+cXF08?=
 =?us-ascii?Q?Nt6G1b1Vxu4yRkEky2hcIB1/aMzhQNcR8+g5envKNXtTV6c82j34UjQmSUox?=
 =?us-ascii?Q?GGeb8FuJEaXodbnhGOhh3CfSwo7zyTb4wn9XjABBcnwhY+iyZaj1Cn1UxC3+?=
 =?us-ascii?Q?xnr1G+HYb2L5jtOhJNIqzok9pgWf0x8m9taUIKbQCG0d6lrpubzFa42chKbV?=
 =?us-ascii?Q?rV/V9U6+xJKww41bMKsK7X8NV+XXUOelDvpw8jxZZggLw3YEIyo+NcEWqTzg?=
 =?us-ascii?Q?Vs7UvgsyDIVjY2HnnPxOcKUVAoTCCpSIuAKFo9hCxL3vEbqGvwv4R+PKIsWO?=
 =?us-ascii?Q?pQQ9VqiKb2DeAwYcQjXRti/8eJVHD/dvL80sGQopOLCkBWksVWX9uyqOZTYY?=
 =?us-ascii?Q?NhLlozb5IrXPMeoFPAZ3pzInPzkCD900SR108nN7hve+Qd485vlJzLLYklQs?=
 =?us-ascii?Q?3AjBOBYbm2CkxZ+LmufnCvokCbsrEAKery5x+invcS7dCRas/Sr3xqFj7PgK?=
 =?us-ascii?Q?wxfLU8IuHJZ8CGwTHbm1Q5JwNT/MfFkddzh5AAVprfX+hu9Awlp5QYZwtpAp?=
 =?us-ascii?Q?dks3L2xLErt5pbvJw8vmxhY9VpW7BQovGUjSy3FNxUR1z88EYBPPtUB79vIa?=
 =?us-ascii?Q?UgIePBzMIjHUwp3jM8Ywa66FptS1xwGq8DB9hFNzhpYjsvxRyr47a/cZh97M?=
 =?us-ascii?Q?mtclhrzbCkSScNd8eGBoRUf8si47CZu3YonXoxBEV7WmjKQimD0tInIVH+xZ?=
 =?us-ascii?Q?hWXG/OsfET44gMyMJnGvUPj4aisJf/y5JELT1QL2IPjx485w/VmbBIWETGIr?=
 =?us-ascii?Q?uc335EIwVyhUKQlbh5ftAzuDS57KGnXByCMeZeDn+5ode7Wr7oapFLWUwoJ0?=
 =?us-ascii?Q?mIFQfqsoCJn+gmGXBib0igg9JdBVsmHOp75nb0JsQJR4fokflLoFZIVD08ET?=
 =?us-ascii?Q?SfRrYzVHgnIOJtTMMxGc6FONU8t4k+rrmqPQ0W4qgg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WHpYIjkXqIqUMhg4gwmMRH1SGhSgJOEkOHB/yLOR/BDE33HL+yJZKgoM7ke3?=
 =?us-ascii?Q?J0zG32JjwDYMQkurSUpDEgJedrCj/SRqQa+c05j2QzXF7zr3Ng2R34Ps1a+U?=
 =?us-ascii?Q?/S/Hd1DuZKSiIXWRomG9t0RnFmf3JboKaV/i2by1KVM9stoR8PilczXrydGm?=
 =?us-ascii?Q?xTloP72L7au3qeaohktYiHsEezfQWT/aWbz9qwPHkM6DVUU6T71YB9YrcjuK?=
 =?us-ascii?Q?+tlzxxqtF8tcX+M+CS24wuKPr61sxqB9c5OYuDaqywsaJ4MwVvqVcPLZ3BDa?=
 =?us-ascii?Q?kQG+Aohwt5KbfjP78k5loPiQCJyJoze0+Aqu1OgmmUghDkZiqjsEugZNyLMG?=
 =?us-ascii?Q?C56HzMNOXzeIXIlA9Wy4thq55oPJaNQELv66zl2p827Ay88yg8z0kg9hlobD?=
 =?us-ascii?Q?kF52WvzrzeOqWa5vH3cOge5LISvNYDjMvW+iVCjoQipsuemvyd22i68PFN6m?=
 =?us-ascii?Q?CM41s10TvPzZtlIi1R24Zjs8iEYSVp/+rvCCloONyhWmmEhor62jQHmGxgKZ?=
 =?us-ascii?Q?zDwV29RocFlS5ZPANpb6GqSlRlF6FefJfZGsZjEcBXXnxS1eES9mQkLjf428?=
 =?us-ascii?Q?m00N1LF2FMd78ltXbjrrliNcEA4+Hk+ENh8ASuKC1nynh9ReGgg6DlaAID6j?=
 =?us-ascii?Q?VWL/Y4wXzQff9PzKGCdLEGptTQR+oSQ0b0W6usODx/QvvK/dGw0yWAbncTop?=
 =?us-ascii?Q?YvQWVKRT+FPzPtYl0LvwyI5gocjzMO2rqieDOLv7t9l4Uxm+CttzkrPaBlAK?=
 =?us-ascii?Q?Z9iVQtSgqjqyo/uyBtpW4kLAAVwnEYsS/R/tkXtdlmWubFCghlcoyIvFJhf/?=
 =?us-ascii?Q?Q5hwyKOuzwzuG7l8bkz6KNR8+uEYCq1LZp1jiG+froJqfkzu3ZzHMc7hAg00?=
 =?us-ascii?Q?Saa9ixMh7Wc4LjyiIkuOi/JTPCO1PtMIOkDFQhlBZTsXqaJ5M4MpxFZsygls?=
 =?us-ascii?Q?0xAexj9M1oJ9ca7wgOhvWx60rgkJcCx7fdEShSiTYAfdv7e2ff+42uqTa98p?=
 =?us-ascii?Q?lCcUgRXP3bglk/z0v5e0+daWgIOz9JVZZRUwkirIytWT7zsUJxlfkD3Js6NT?=
 =?us-ascii?Q?y9h8e3BYU3mPSXA7IoWPWbcPqZVqtLGOsYmkjWJze7Mtg3f6jp5t8zdqKk9X?=
 =?us-ascii?Q?8w4yo7m9CH8KO9Mnw/VpoMtU3hnlntMLRMCV87UNszIl5qXcd2Pti8rN+RLM?=
 =?us-ascii?Q?pMxgLcSKJLQLUyxuIihSsqs8vPWYungvK8/v05IHJO4fCBqK3xmEw2esxkCw?=
 =?us-ascii?Q?utY7TzOTLNko2fmWS3sLaGN9fgotNVr2EaqhyT5+onR6LvJKl+KB4eQY5DVU?=
 =?us-ascii?Q?NfXvFBPfKERPkzZSmdAnYwo+QotO0Ud9nJiYQ7HKfes5WGbMN11g/3ZMyWtD?=
 =?us-ascii?Q?2/JFX0dPH09km0kPkeQ9AlXPcimfT6R23r60N6FPMWZU2AKx9xxgq0jZIsY2?=
 =?us-ascii?Q?P1+BRZvnbTmwGh4bURSB7MXm0lTGmg/bjZxsep0T6cBup/TdErMUPtyhm7IQ?=
 =?us-ascii?Q?HeOA+DQGHEIqmvD2xMxsHVoUmnh2YAvOojGOUcX1EbJG7z0wv5rM5an8nG3W?=
 =?us-ascii?Q?Z0qnmXVQ8u9ZK4gg4xWCOM4fSORHYb9AZ82G6svJ1z4tQcGuqZP1KA9WG1D2?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6d020a-7ae1-47d3-3b3e-08dc6b766e40
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 13:39:18.1841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKqHwHur4eSrPlEVa6ubau05rDNMOPoeKK6NrZuOEtc9btJlYkKQ7wD/3WyOabmucG49OPcqaNOiktqDJG2aeCrjOGU++jGSlvEgd4ir1lM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7757
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

On Thu, May 02, 2024 at 01:22:24PM GMT, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2024-05-01 04:01:45-03:00)
>>For a normal string, it's not correct to use just one backslash as
>>escape char as that conflicts with Python's escape. Use raw strings for
>>the regex patterns to avoid this problem. Fix the followin warnings:
>
>s/followin/following/

fixed

>
>Maybe it is worth noting from which Python version those warnings start
>to appear?

added that to commit message

>
>>
>>[4/1809] Generating lib/i915-perf-registers-hsw with a custom command
>>/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:165: SyntaxWarning: invalid escape sequence '\$'
>>  m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>>/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:168: SyntaxWarning: invalid escape sequence '\$'
>>  m = re.search('\$GtSlice([0-9]+)$', name)
>>/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:171: SyntaxWarning: invalid escape sequence '\$'
>>  m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>>/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:341: SyntaxWarning: invalid escape sequence '\$'
>>  m = re.search('\$GtSlice([0-9]+)$', name)
>>/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:344: SyntaxWarning: invalid escape sequence '\$'
>>  m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>>/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:347: SyntaxWarning: invalid escape sequence '\$'
>>  m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

and pushed, thanks

Lucas De Marchi

>
>>---
>> lib/i915/perf-configs/codegen.py | 12 ++++++------
>> 1 file changed, 6 insertions(+), 6 deletions(-)
>>
>>diff --git a/lib/i915/perf-configs/codegen.py b/lib/i915/perf-configs/codegen.py
>>index 020e76ef4..0d1847592 100644
>>--- a/lib/i915/perf-configs/codegen.py
>>+++ b/lib/i915/perf-configs/codegen.py
>>@@ -162,13 +162,13 @@ hw_vars_mapping = {
>> }
>>
>> def is_hw_var(name):
>>-    m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>>+    m = re.search(r'\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>>     if m:
>>         return True
>>-    m = re.search('\$GtSlice([0-9]+)$', name)
>>+    m = re.search(r'\$GtSlice([0-9]+)$', name)
>>     if m:
>>         return True
>>-    m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>>+    m = re.search(r'\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>>     if m:
>>         return True
>>     return name in hw_vars_mapping
>>@@ -338,13 +338,13 @@ class Gen:
>>             return self.hw_vars[name]['c']
>>         if name in set.counter_vars:
>>             return set.read_funcs[name] + "(perf, metric_set, accumulator)"
>>-        m = re.search('\$GtSlice([0-9]+)$', name)
>>+        m = re.search(r'\$GtSlice([0-9]+)$', name)
>>         if m:
>>             return 'intel_perf_devinfo_slice_available(&perf->devinfo, {0})'.format(m.group(1))
>>-        m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>>+        m = re.search(r'\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>>         if m:
>>             return 'intel_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
>>-        m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>>+        m = re.search(r'\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>>         if m:
>>             return 'intel_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
>>         return None
>>--
>>2.45.0
>>
