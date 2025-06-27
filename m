Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D41C77B7F
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 21:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE8F10E033;
	Fri, 27 Jun 2025 21:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmdw0ski";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A956B10E033
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 21:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751060164; x=1782596164;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uVJSN8yfPWa4uXYs56J/e+B3N9+42GFmMKeDiTvE/eM=;
 b=bmdw0skizffHhrqB/ZazQH2UUNlIL3Fta9lVCI9JaEmW5JBIw9r3F7lC
 Askev5G8CoUbOjCeI1A9F/2+qgudGX66x2ZrKOyX3I1TlTbABA7n1i/Dw
 3z3TfpLCMbSJ/HsNRzLvDVmB8SfGb28y6Zzyw+zyBrEfO1gH4PplsHb57
 h4SYXbp/kpQw3Q190uDsvbkGxryMYu937vo93Magp0DmfkIDVEEBX5y41
 pxscY7pAKuQFYGHuYI3BRI85SbFMoOsG0DxFz0Em8RE+HvpDofCWr4XS+
 jCsL3K7fR1+sf8D98nX7wg8ylaDTsowrulnpDmzN17fFdJlG+CE8Eb0nz g==;
X-CSE-ConnectionGUID: QT6f8C8jS360ju81e5qtzg==
X-CSE-MsgGUID: HEMJCEedQOCRKAegnmXYSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="70814975"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="70814975"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 14:36:02 -0700
X-CSE-ConnectionGUID: JQroW71RTJ2S+As+FloWhQ==
X-CSE-MsgGUID: gQ2Dyr4SQhyygu/AHPr/Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="153209887"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 14:36:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:36:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 14:36:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.63)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:36:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8EMlULDzaPCK3M+m+Gm3ROug1nbt7iUTpbPJwZPdx6P5ie8DNtDUmrnkqDsSdZ9fCPcWV0UvuLIpcgRTzYAZxdBrQ8dJZ7yBdSmiDO26Vlv5kYhrpo0xp2ZAxBq9V07TKJLlWnb8Kae2TnwAx4xzITgk0Pcysn081sQBnYlURvHlXi984/11J55F1ccxvg9wYbIIrkZInlv4Bof4R00aINtssi3de6yuCU/K/JyMFZ+zeKq1+NYfVic+6RoAkOQxrBiivxv7bTzTgvOfIQRPjKowvyoiTgy8h1vRR0Doelp9aNJ3B+T7hYE8Qyk+AmripL8GhMAPkdVSKvpkuUlfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgQ4OMTe0gaVGbszm5h5jd/h20nSYAwyM44vJxzBewA=;
 b=jqcfl1m5CZyfMdNqN0tA74iCgVjS/dcxzc0JWHY2ukHG/MWkrG/A1GtzQQeCOt4G1SqLJ7PUQNzoRQ+dPlv7lqd5P/ORLSQSZHW2ijjywxPqQG0D9skViTOFwhDnTjjGhnyWAoogM0ke2UcGgBga6N9u/pc6tAfDJX3Mk0uvHJzNnf42A72BMC68IhiMMXXVSlQLAzjUl3TQVsgTnxHRweYFnDsWXe9d5wjwFKBDp4WXQTZ43yoJHpc4x++OejXBEuu1Gx2HFGqiRDhQzeH0Wvszi5CoUEH7bCFSJZ/75TQ7C2YTJcZhg4DQTvWQ0uORs16+LPE/ssQYFTnY+A4f5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Fri, 27 Jun
 2025 21:35:41 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 21:35:40 +0000
Date: Fri, 27 Jun 2025 17:35:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <david.e.box@linux.intel.com>
Subject: Re: [PATCH] test/intel/xe_pmt: Add testing for BMG crashlog
Message-ID: <aF8OqgWWgPT1PE-I@intel.com>
References: <20250627204846.521691-1-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627204846.521691-1-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW5PR11MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: 66753662-fce5-4b24-0890-08ddb5c29065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5Fit5kRL7oaPjpFXSQJLpOeVoXeD7JzcyAQ6AW1AA/TtipOafgFipnUScX?=
 =?iso-8859-1?Q?FWHWXHnTstnuOcz3yHbk82p+P6pcWTy4VTJerEXoLzxsALdMq2H3ZF1gCQ?=
 =?iso-8859-1?Q?OX7BC0gOSG+l4a18brrA7WWu57Pnar4wnoOrF8HVGShrxyuaEdz5MvGHg/?=
 =?iso-8859-1?Q?o+PWan1VW3DxAbo/Z8jvmqBdSOmGN6pwVuTS0ZG/1/cD9OMQhf6Q0dMeah?=
 =?iso-8859-1?Q?eJlC7eTX89VaHEZV69XXDj5+C86pyKKbLAJWO3QQELwVNcU9rKw71dVM0W?=
 =?iso-8859-1?Q?4RKiTJaS9wUpIYFDItlIyd0ZAJN2Hyw5pRkO0IT16kHU+wCvZAO3sg5Iyq?=
 =?iso-8859-1?Q?TW5zxhG6C3VCgO4yWT6PePSI7pm9Hmr/2eCEQk9IXI45e5yOGLjfDmbBht?=
 =?iso-8859-1?Q?yBJ6OPPxi8dKqi5N7fwAMhNhQ78BUEyD5dZBupSqOYHTlFYQHZVn+hHdHb?=
 =?iso-8859-1?Q?yb+CVihctg3Qq6bCiznlbosbnJ0eLMBy/dr9w0SB5ku5KR2PD8M9B+iLpf?=
 =?iso-8859-1?Q?3JY9CzxExByF8Q1ZcrAuWOdgOnoK9iKH3y3FgwRQEBjqIgbUMFFDScFri5?=
 =?iso-8859-1?Q?ZUXxm0MkR6x9YChidMLTCXbP5IP2pq0olkS3Y03lXp9EM5DAnqBuDNKWLo?=
 =?iso-8859-1?Q?3Q895oKfyCHv9htL2Yzhl/+IryMOqNCH91j0fZIV7tcnKgfVDjpzhCh//p?=
 =?iso-8859-1?Q?2v818RWtvIr7zWNZCFve65cwoKkU0wFsJt/wVEyFW3ANdlPL4EUwtdr4v1?=
 =?iso-8859-1?Q?CO07nBcN0Lw0eUdCAnlzqO9U6GSFSxgo4NrNo7r/AgCFOIhMFuzuJJ5KS2?=
 =?iso-8859-1?Q?ekTmtXtHNzCQCxoJRz1Qv2gleSmAKJTsb6z5UkGAv7YUxuQBCogISne3c5?=
 =?iso-8859-1?Q?16iz6KAQHlYJ+AKYHevfh12hSh52xwiiOBFVkGNMSlI87afqp0J96COzvf?=
 =?iso-8859-1?Q?TX8WMQZP8hYWFi79XSdwugA9xbKELlibxiRyNIAiRsuAbEsLiC+erNDxzu?=
 =?iso-8859-1?Q?yK+SxlqbwykUfs1ZvatzfZssWWo1slOCr6L0Cs2XeMDyGoj1PjABqJh8US?=
 =?iso-8859-1?Q?jHIxNnOb/AlbeWWSr8YkgmDovndAR4QCC9BSHF8GL+JQ1ztJVmYduRvFA0?=
 =?iso-8859-1?Q?Tcel0Ec7KTS+26ncmRo7tOeZncLKjbJHIexEgIKxFm7IsCQstOeHqBTLIx?=
 =?iso-8859-1?Q?i4/wL9FqttkZt8WLDJxqPuL3unU66vS8tBdQ+SK3t2rNK+dB9usTCD9gEB?=
 =?iso-8859-1?Q?9dqiKdFXw8sMhDH5uUoZzWrKD+z9eDt2uEzxL8pU9UBYuxdwcK5tFZGWaw?=
 =?iso-8859-1?Q?ofbErOhbrW5fpsLq1UNbMEYyYJ/TAlNxFplAAQ7qOrOqDaSbSywnkiZr5r?=
 =?iso-8859-1?Q?VbSApGNiN1CAO8ynUndOMynPcfOlwoq9cSqvMe1xlLUrEa03jj/gXlXgYG?=
 =?iso-8859-1?Q?sKLEqPEZPvg7P5dUfvIrwDtBIJA/bPGg8Rb0zmCABfd/o1jPOUB4oB1orj?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?w6YQ8S/WWPqvvgmwYMZOW456VI5s+ZzQ6c4ayBAfmwB0bAaqxX2qEoHN42?=
 =?iso-8859-1?Q?N6wpjdauqe0vzfuqlqgf6OCiG8UHK8QRZj9zOQleWLwkGMnb6CJ39q74+D?=
 =?iso-8859-1?Q?jjbnZ6au3T3Lo/wIHAI9W3j8IeMZV24XZFqU5/mTISYdkMVYnUVU2DKPyu?=
 =?iso-8859-1?Q?ddilvFWmf82/r6JWt8AL591WHGCs8OCwnEDVI5SY0HPmRiFYt9+UgmxhV/?=
 =?iso-8859-1?Q?gOu5MxBshJuCOOKe7IQ2d9OW1IDpfZAQEDpbdHZ7StOJiyIdUXO08U2NDj?=
 =?iso-8859-1?Q?WDetoYpLbILi0SQ3klYzHc3nshb/ZFp2FTul5bxi9tu357ZxDuSjK/l1vs?=
 =?iso-8859-1?Q?DeqmPYhMojPEXByXKeKHKOb5I/axZzEPkHBWTle3AKHrSUAQ4Tk5YXW2O8?=
 =?iso-8859-1?Q?ppMp35OE685dnM0cuT6ADTV3e5qmEfYgn2FgODvQboeytti6WGPI/qhGoH?=
 =?iso-8859-1?Q?xm6PwRPREZfvFEbWogINreM8JJl+8nMKapS0zNfxLUzXZGPP+qGbbmoPY8?=
 =?iso-8859-1?Q?Zew6F87/j29tlkum+9HS4Zs3UiOjOW2VjmoN8zuQL7wHNcLdm95S/p6mop?=
 =?iso-8859-1?Q?9RyKUZw50cCOZ2gsIcq2lwX3KvcyWuGFDIRx9xytHHevV/UVuxonTRfStL?=
 =?iso-8859-1?Q?Y/sClnSZQwg0OCBPR2lDyArajZryMtirqLso27bFGyoK/uTUn20s3ajz9E?=
 =?iso-8859-1?Q?NlNwbBkXeeOgy6bw7vUyRpEse/blRQptgmjozG1OGXN9eJOCtjvwNW4F+O?=
 =?iso-8859-1?Q?ckTJIWQVk9OgfQlxF1sFUi3Jtr9eH+6kwT1YByoHm/b+DG4u4PED8HVXcC?=
 =?iso-8859-1?Q?6WsnGBu2kpG80dkDq+8ZUoB6EOZdpgYskgKBZxPRHgTEyoJ885eB2ING0+?=
 =?iso-8859-1?Q?UcveLFhFBz2ZPScgya/cUM2H/m9WV0N8Itx3E8+4fkBBRSLX/a9UmZVoq7?=
 =?iso-8859-1?Q?1ZtozCl7plLzMrouCz8hP7M19s+/EkF6UfbJQ/aD8PxNl302rfG207J7mI?=
 =?iso-8859-1?Q?3ucd9BH8ZK73xi+RwA9yPWjczcbznPLexqOhjNTbF99qW2IdzQdW5iZAy/?=
 =?iso-8859-1?Q?6kPdcztldgmgP5EYpnTUOGZirtSQ/3/oMOn6R5iURXzWyI+0xew4fYEJfo?=
 =?iso-8859-1?Q?9t+csNHlmkl8iYFrRIIY/JoRInp0nC7ZGekdJ6hxLo+o5eoFBm0NXEpDyF?=
 =?iso-8859-1?Q?3U8uu6KqcVT8RQRdnAe3oEkSLHlKnxBoTkZmDj3A8GP5gUy2HFOz9eTet2?=
 =?iso-8859-1?Q?MUDh5+gl4PBFBUpx72Yf9lweGpPFlLQRCizXCuSQLxk/JYjbQsVcdXM+KZ?=
 =?iso-8859-1?Q?T9rsrbnCKiws/90vebE8CsN97eqdZLlFvWv2utKgkHUYeBnc8fkeGmHETb?=
 =?iso-8859-1?Q?OFt0HnJS1DU2/D6NLzCezMmsOzMMBF/TdtfwvQLL7GM/0mnwZgs0A1BcHf?=
 =?iso-8859-1?Q?C0JnKrSEvl4NSRZCFTYRzTOXN0Kq5EuAcMBTmOYNcwDHJZRf1kfth7yTWb?=
 =?iso-8859-1?Q?3sp1fWiPPpeVjtIo0GKE4MFSCaVwBgBKMaFY5KBmRpjJsVs8YDrY56TONS?=
 =?iso-8859-1?Q?RiQw2CohqA231McwCn+W5Dv62HgmvRjMVHN5pHp4fWANv3Ggj4D1EbZjfj?=
 =?iso-8859-1?Q?Q7D/nd2zvmt9xI6Z8WD/WIG+WgJ/pAuARJMI8gcCRuZQGeXMzEwb68sA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66753662-fce5-4b24-0890-08ddb5c29065
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 21:35:40.9447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTbRUAm7EV/qRRfgSoCUS6szrWSw800KwAS35Tz588D6BNuEM0S6Pj9IPmmwC5aSQcgcJ2quWTXRrjeh7s0w8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
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

On Fri, Jun 27, 2025 at 04:48:42PM -0400, Michael J. Ruhl wrote:
> The BMG devices has the PMT crashlog feature. If the devices present
> is a BMG, test PMT api.
> 
> NOTE: the testing order is not flexible and must be done in
> the currently specified order.

Hmm.... I believe it is safer to create a single testcase then,
without subtests, or a single subtest with the right order only.

BTW, this current flow here is okay to go without rebooting the
machine and running this entire flow again?

> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  tests/intel/xe_pmt.c | 561 +++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build    |   1 +
>  2 files changed, 562 insertions(+)
>  create mode 100644 tests/intel/xe_pmt.c
> 
> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
> new file mode 100644
> index 000000000..21a2e74e7
> --- /dev/null
> +++ b/tests/intel/xe_pmt.c
> @@ -0,0 +1,561 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: Verify BMG PMT files operations
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: sysfs
> + * Description: Verify BMG PMT files are created and are accessable
> + */
> +
> +#include <dirent.h>
> +#include <limits.h>
> +#include <string.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +#include "linux_scaffold.h"
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +/* base directory names */
> +#define VSEC_CRASHLOG_DIR "intel_vsec.crashlog."
> +#define VSEC_TELEMETRY_DIR "intel_vsec.telemetry."
> +#define CRASHLOG_DIR "crashlog"
> +#define TELEMETRY_DIR "telem"
> +#define BMG_CRASHLOG_CNT 2
> +#define BMG_TELEMETRY_CNT 2
> +
> +enum bmg_crashlog_instances {
> +	bmg_crashlog_punit = 0,
> +	bmg_crashlog_oobmsm,
> +	bmg_crashlog_max
> +};
> +
> +enum bmg_telemety_instances {
> +	bmg_telemetry_punit = 0,
> +	bmg_telemetry_oobmsm,
> +	bmg_telemetry_max
> +};
> +
> +static char dev_path[PATH_MAX];
> +static char work_path[PATH_MAX * 2];
> +
> +/*
> + * In most case there should be a single instance of crashlog an telemetry directories.
> + * If DVSEC entries are separate the structure will be different.
> + */
> +static char crashlog_vsec_dir[32];
> +static char telemetry_vsec_dir[32];
> +
> +/* This needs to be specific for each supported device */
> +static char crashlog_dir[bmg_crashlog_max][32];
> +static char telemetry_dir[bmg_telemetry_max][32];
> +
> +/* telemetry file names */
> +static const char *telem = "telem";
> +
> +/* crashlog filenames and descriptors */
> +static const char *clear = "clear";
> +static const char *consumed = "consumed";
> +static const char *crashlog = "crashlog";
> +static const char *enable = "enable";
> +static const char *error = "error";
> +static const char *dev_guid = "guid";
> +static const char *rearm = "rearm";
> +static const char *trigger = "trigger";
> +
> +struct crashlog_v2_info {
> +	int clear_fd;
> +	int consumed_fd;
> +	int crashlog_fd;
> +	int enable_fd;
> +	int error_fd;
> +	int guid_fd;
> +	int rearm_fd;
> +	int trigger_fd;
> +	u_int32_t guid;
> +} bmg_info[bmg_crashlog_max];
> +
> +#define DEV_PATH_LEN 80
> +
> +/**
> + * device_sysfs_path:
> + * @fd: opened device file descriptor
> + * @path: buffer to store sysfs path to device directory
> + *
> + * Returns:
> + * On successfull path resolution sysfs path to device directory,
> + * NULL otherwise
> + */
> +static char *device_sysfs_path(int fd, char *path)
> +{
> +        char sysfs[DEV_PATH_LEN];
> +
> +        if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
> +                return NULL;
> +
> +        if (DEV_PATH_LEN <= (strlen(sysfs) + strlen("/device")))
> +                return NULL;
> +
> +        strcat(sysfs, "/device");
> +
> +        return realpath(sysfs, path);
> +}
> +
> +/**
> + * SUBTEST: test_pmt_directories
> + * BMG PMT directory structure:
> + * device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
> + * device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
> + *
> + * If this is done for a different platform, this could be
> + * different.
> + *
> + */
> +static void test_pmt_directories(int dev_fd)
> +{
> +	struct dirent *ent;
> +	int index;
> +	DIR *dir;
> +
> +        igt_assert(device_sysfs_path(dev_fd, dev_path));
> +
> +	/* verify top level PMT directories */
> +	dir = opendir(dev_path);
> +	igt_assert_f(dir, "no directories found\n");
> +
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(VSEC_CRASHLOG_DIR, ent->d_name, sizeof(VSEC_CRASHLOG_DIR) - 1) == 0)
> +			strcpy(crashlog_vsec_dir, ent->d_name);
> +		if (strncmp(VSEC_TELEMETRY_DIR, ent->d_name, sizeof(VSEC_TELEMETRY_DIR) - 1) == 0)
> +			strcpy(telemetry_vsec_dir, ent->d_name);
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(strlen(crashlog_vsec_dir), "missing crashlog directory\n");
> +	igt_assert_f(strlen(telemetry_vsec_dir), "missing telemetry directory\n");
> +
> +	/* verify crashlog directory structure */
> +	sprintf(work_path, "%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt");
> +
> +	dir = opendir(work_path);
> +	igt_assert_f(dir, "no intel_pmt directories found\n");
> +
> +	index = 0;
> +	/* find the crashlog<x> directory instances */
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(CRASHLOG_DIR, ent->d_name, sizeof(CRASHLOG_DIR) - 1) == 0) {
> +			if (index < bmg_crashlog_max)
> +				strcpy(crashlog_dir[index], ent->d_name);
> +			index++;
> +		}
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(index == bmg_crashlog_max, "too many crashlog entries %d\n", index);
> +	for (int i = 0; i < ARRAY_SIZE(crashlog_dir); i++)
> +		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d] directory\n", i);
> +
> +	/* verify telemetry directory structure */
> +	sprintf(work_path, "%s/%s/%s", dev_path, telemetry_vsec_dir, "intel_pmt");
> +
> +	dir = opendir(work_path);
> +	igt_assert_f(dir, "no telemetry intel_pmt directories found\n");
> +
> +	index = 0;
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(TELEMETRY_DIR, ent->d_name, sizeof(TELEMETRY_DIR) - 1) == 0) {
> +			if (index < BMG_TELEMETRY_CNT)
> +				strcpy(telemetry_dir[index], ent->d_name);
> +			index++;
> +		}
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(index == bmg_telemetry_max, "too many telemetry entries %d\n", index);
> +	for (int i = 0; i < ARRAY_SIZE(telemetry_dir); i++)
> +		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d] directory\n", i);
> +
> +}
> +
> +static void find_pmt_file(const char *path, const char *file)
> +{
> +	struct dirent *ent;
> +	bool found;
> +	DIR *dir;
> +
> +	dir = opendir(path);
> +	igt_assert_f(dir, "no intel_pmt directories found\n");
> +
> +	found = false;
> +	while ((ent = readdir(dir)) != NULL)
> +		if (strcmp(file, ent->d_name) == 0)
> +			found = true;
> +	closedir(dir);
> +
> +	igt_assert_f(found, "missing %s from %s\n", file, path);
> +}
> +
> +static void open_pmt_file(const char *path, const char *file, int *fd, int flags)
> +{
> +	char file_path[PATH_MAX];
> +
> +	sprintf(file_path, "%s/%s", path, file);
> +
> +	*fd = open(file_path, flags);
> +	igt_assert_f(*fd > -1, "failed to open %s\n", file_path);
> +
> +	/* TODO: match flags to file attributes */
> +}
> +
> +/**
> + * SUBTEST: test_pmt_telemetry_files
> + * Description: validate the expected telemetry file(s)
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_telemetry_files(int dev_fd)
> +{
> +	int i;
> +
> +	for (i = 0; i < BMG_TELEMETRY_CNT; i++) {
> +		sprintf(work_path, "%s/%s/%s/%s", dev_path, telemetry_vsec_dir,
> +			"intel_pmt", telemetry_dir[i]);
> +		find_pmt_file(work_path, telem);
> +	}
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_files
> + * Description: validate the expected crashlog files
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_files(int dev_fd)
> +{
> +	char buf[64] = {};
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		sprintf(work_path, "%s/%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt",
> +			crashlog_dir[i]);
> +
> +		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd, O_RDONLY);
> +		open_pmt_file(work_path, consumed, &bmg_info[i].consumed_fd, O_RDWR);
> +		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd, O_RDONLY);
> +		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd, O_RDWR);
> +		open_pmt_file(work_path, error, &bmg_info[i].error_fd, O_RDONLY);
> +		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd, O_RDONLY);
> +		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd, O_RDWR);
> +		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd, O_RDWR);
> +
> +		ret = pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
> +		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
> +		bmg_info[i].guid = strtol(buf, NULL, 16);
> +		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device %d\n", i);
> +	}
> +}
> +
> +#define ENABLE_MSG "1\n"
> +#define DISABLE_MSG "0\n"
> +
> +static bool send_msg(int fd, const char *msg, const char *file) {
> +	size_t len = strlen(msg);
> +	int ret;
> +
> +	errno = 0;
> +	ret = pwrite(fd, msg, len, 0);
> +	if (ret != len)
> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
> +			 errno);
> +
> +	return ret == len;
> +}
> +
> +static bool verify_msg(int fd, const char *msg, const char *file) {
> +	size_t len = strlen(msg);
> +	char buf[32] = {};
> +	int ret;
> +
> +	errno = 0;
> +	ret = pread(fd, buf, sizeof(buf), 0);
> +	if (ret != len)
> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret, errno);
> +
> +	return ret == len && strcmp(buf, msg) == 0;
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_enable
> + * Description: Set enable enable/disable bit and verify usage
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_enable(int dev_fd)
> +{
> +	u_int32_t guid;
> +	int fd;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		fd = bmg_info[i].enable_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* force enable so we are in a known state */
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send enable\n", guid);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x: verify enable\n", guid);
> +
> +		/* disable */
> +		igt_assert_f(send_msg(fd, DISABLE_MSG, enable), "0x%x: send disable\n", guid);
> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, enable), "0x%x: verify disable\n", guid);
> +
> +		/* re-enable so we can do more testing */
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: re-enable\n", guid);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x: verify re-enable\n", guid);
> +	}
> +
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_clear
> + * Description:
> + *   Test the clear crashlog bit. After setting the crashlog data buffer should be
> + *   set to 0xdeadbeef.
> + *   "0" (DISABLE_MSG) is written to the trigger file to set the clear bit.  BMG does
> + *   writing to the clear file, but once the bit is set it cannot be cleared with a
> + *   reboot.  "0" to trigger is the "standard" usage, so test it.
> + *
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_clear(int dev_fd)
> +{
> +	char buf[64] = {};
> +	u_int32_t guid;
> +	int crashlog_fd;
> +	int trigger_fd;
> +	int clear_fd;
> +	int *val;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		clear_fd = bmg_info[i].clear_fd;
> +		crashlog_fd = bmg_info[i].crashlog_fd;
> +		trigger_fd = bmg_info[i].trigger_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* make sure the bit is clear */
> +		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x: verify clear\n", guid);
> +
> +		/* set the clear bit (0 -> trigger)*/
> +		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: send enable\n", guid);
> +
> +		/* make sure the bit is set.  sleep() to allow HW to set the bit */
> +		sleep(1);
> +		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x: clear set\n", guid);
> +
> +		len = read(crashlog_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
> +
> +		/* wa punit issue for first crashlog (NOTE: this is fixed)*/
> +		if (i == 0)
> +			val = (int *) &buf[32];
> +		else
> +			val = (int *)buf;
> +
> +		igt_assert_f(*val == 0xdeadbeef, "0x%x: invalid clear data value: : 0x%x", guid, *val);
> +	}
> +
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_consumed
> + * Description:
> + *   After a crashlog has been "consumed" (read), setting this bit can be done.
> + *   Verify that it is set correctly.
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_consumed(int dev_fd)
> +{
> +	uint32_t guid;
> +	int fd;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		fd = bmg_info[i].consumed_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* check, set, verify */
> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x: consumed clear\n", guid);
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x: set consumed\n", guid);
> +		/* sleep(1) to allow HW to set the bit */
> +		sleep(1);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x: verify consumed\n", guid);
> +	}
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_error
> + * Description:
> + *    The error bit is set when a crashlog fails in HW.  It is read only so only
> + *    need to verify that it is "0".
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_error(int dev_fd)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		guid = bmg_info[i].guid;
> +		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG, error), "0x%x: error clear\n", guid);
> +	}
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_rearm
> + * Description:
> + *    The rearm bit is set at cold boot.  It cannot be reset unless are real crashlog
> + *    occurs (i.e. setting trigger will not change its value).  Verify that it is "1".
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_rearm(int dev_fd)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		guid = bmg_info[i].guid;
> +		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG, rearm), "0x%x: rearm set\n", guid);
> +	}
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_rearm_after_disable
> + * Description:
> + *    After a disable/enable sequence REARM will be set for PUNINT instaces and
> + *    clear for OOBMSM instances.
> + *    Verify that the bits are set as expected
> + *
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_rearm_after_disable(int dev_fd)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	i = bmg_crashlog_punit;
> +	guid = bmg_info[i].guid;
> +	igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG, rearm), "0x%x: rearm set\n", guid);
> +
> +	i = bmg_crashlog_oobmsm;
> +	guid = bmg_info[i].guid;
> +	igt_assert_f(verify_msg(bmg_info[i].rearm_fd, DISABLE_MSG, rearm), "0x%x: rearm set\n", guid);
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_trigger
> + * Description:
> + *    Set the manual trigger bit and make sure the data is not 0xdeadbeef
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_trigger(int dev_fd)
> +{
> +	char buf[64] = {};
> +	u_int32_t *val;
> +	int crashlog_fd;
> +	int trigger_fd;
> +	u_int32_t guid;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		crashlog_fd = bmg_info[i].crashlog_fd;
> +		trigger_fd = bmg_info[i].trigger_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* make sure the bit is clear */
> +		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: trigger clear\n",
> +			     guid);
> +		/* set the trigger bit (1 -> trigger)*/
> +		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: set trigger\n", guid);
> +
> +		/* sleep to let the HW do its thing */
> +		sleep(1);
> +
> +		/* make sure the bit is set */
> +		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: trigger not set\n",
> +			     guid);
> +
> +		len = read(crashlog_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
> +
> +		val = (u_int32_t *)buf;
> +
> +		igt_assert_f(*val != 0xdeadbeef, "0x%x: invalid trigger value: : 0x%x", guid, *val);
> +	}
> +}
> +
> +igt_main
> +{
> +	const struct {
> +		const char *name;
> +		void (*func)(int);
> +	} funcs[] = {
> +		/*
> +		 * NOTE:
> +		 *  o These tests are ordered.  Do not use them individualy unless you understand
> +		 *    the underlying HW behavior
> +		 *  o Testing MUST be done after a cold reset
> +		 *  o Once crashlog is triggered the device needs a cold reset, and some of the
> +		 *    tests cannot be done.
> +		 *  Only change this order if you understand this feature.
> +		 */
> +		{ "pmt-directories", test_pmt_directories },
> +		{ "pmt-telemetry-files", test_pmt_telemetry_files },
> +		{ "pmt-crashlog-files", test_pmt_crashlog_files },
> +		{ "pmt-crashlog-error", test_pmt_crashlog_error },
> +		{ "pmt-crashlog-rearm", test_pmt_crashlog_rearm },
> +		{ "pmt-crashlog-enable", test_pmt_crashlog_enable },
> +		{ "pmt-crashlog-rearm_after_disable", test_pmt_crashlog_rearm_after_disable },
> +		{ "pmt-crashlog-trigger", test_pmt_crashlog_trigger },
> +		{ "pmt-crashlog-consumed", test_pmt_crashlog_consumed },
> +		{ "pmt-crashlog-clear", test_pmt_crashlog_clear },
> +		{ }
> +	}, *f;
> +	uint16_t dev_id;
> +	int dev_fd;
> +
> +	igt_fixture
> +		dev_fd = drm_open_driver(DRIVER_XE);
> +
> +	dev_id = intel_get_drm_devid(dev_fd);
> +
> +	if (IS_BATTLEMAGE(dev_id)) {
> +		for (f = funcs; f->name; f++) {
> +			igt_subtest_f("%s", f->name)
> +				f->func(dev_fd);
> +		}
> +	}
> +
> +	igt_fixture
> +		drm_close_driver(dev_fd);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 9b87a0d24..4276e6967 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -315,6 +315,7 @@ intel_xe_progs = [
>  	'xe_peer2peer',
>  	'xe_pm',
>  	'xe_pm_residency',
> +	'xe_pmt',
>  	'xe_pmu',
>  	'xe_prime_self_import',
>  	'xe_pxp',
> -- 
> 2.49.0
> 
