Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224BDF43858
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 16:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95D010E140;
	Wed, 15 Apr 2026 16:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNwNLieS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B0110E140
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776270063; x=1807806063;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=jrXK9chEldz80oLscwDGJDjnXF6+m5cphsg8VJfBCWE=;
 b=UNwNLieScDl0LfyRtyq9FrLSd/SysdMTi/TkEIGowND15y55eXUhJkWY
 nkkCLcpe98+UvmEGzggpunQaaRhWu+bkkTDlVacjSMossaH+1ZjSOZ6WU
 B8Z5lFwFr9n4QcTBI+E6b/5oigftu4OIKpFvDxScSHDLbiFhhcNm3Sj3x
 QJxKCmHRIu9coZV2VQ0SCj6iaF2OesWqfX4tSulDeQGQVElGmOFeBai3b
 OSUbfOxR5d4vE4qi9Fqaubo+/fCvNdg+awTbR+aZrDGq+znoyk/sopytJ
 0HMrUAwaZNmNbAvZ07TCkxpd/1ZYdD70QI7wd3DdRgE7dI4d6jmCZK5U9 Q==;
X-CSE-ConnectionGUID: 4PFyztlSSsO4Siq7LEOq9A==
X-CSE-MsgGUID: 0dks6QemRhSJ0lK/uq85FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="102714911"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="102714911"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:20:50 -0700
X-CSE-ConnectionGUID: aHJgoEqeQtKr9AVgQWDWEA==
X-CSE-MsgGUID: sZucLwiqRwWpJ2YkobvkKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253705519"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:20:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:20:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 09:20:49 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:20:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZJnG+bNGXIR+Q/7J7AIXrAFyyPAssAp1Ny/1tTXJANTFOuF+7OVMiwPUsDkkQ40Ltn1c4FhMqigD/A9QQd2w+kf6eSqcAEkql94NiMJHuZAbgMhBidFCbL4PBC0poZTLzgVaJqSvYkmRPY48ltRt8B15nCoQVcd4s7jYqFmfjqSNUE/DyV3TiYTyf818Hp8YSd7zm49ygi0gS4aod37PTNrSjmd3coIk8IG9Ch2SgA5gF3N6VAnOZ9fNxeCBRiOx4WejpU/S5V7EtBifaGcu+LMCSvpsnpfQnPJY5plz0hs4qGSEwpJFkJXUuMQ8BAFwq75zty5I+Cm0CDR6FFjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3KFYBHk03+C9BntxjYkc1x4N3rUWnSNxR30cSeANrA=;
 b=a8gih4Mk/tP7gpUH7SmwPOrEAR8/cpeG+r8lR317glALM2dUzQnvigjg2LaV8jVVlotnmdnHoJr+cvPsIIFRjdKHPU3G94/1sVafQVFp6MD3kF5vy5e23PkZi8JeRKl/NS4oCl5gR6jP6FzCdpqfLIZBpEkooF5EtjTH4EFKQJiJf2vzNUoYQek36MjzwDZDZfBysCHMLeUYpS6eR6tHS0V332BFaqEpT+6P7mlCbBO9pikaX8n4oP0smopnqszSBzSxH5/QfEcOs19qH0n9TVRbnRXZApJVYouYHWQZrtWJZzBWihlkhsZbOlXr1RIFV+lGV5X38rTtbr0pKcZx+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS3PR11MB9820.namprd11.prod.outlook.com (2603:10b6:8:366::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 16:20:47 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 16:20:47 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v3 5/5] runner/resultgen: Insert attachments list
 into results.json
In-Reply-To: <eq74fj354iicdqvutrsjcf52h2s7lbkfiyn3zunqx7ys6oxblt@3d7wrtjwfted>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-12-zbigniew.kempczynski@intel.com>
 <87eckhw7an.fsf@intel.com>
 <h75a4hpy25g4u6tge5kigkm4x33df47z4oj2yoruf3pem4lpe6@nwlnm4fhzofg>
 <87h5pczae6.fsf@intel.com>
 <eq74fj354iicdqvutrsjcf52h2s7lbkfiyn3zunqx7ys6oxblt@3d7wrtjwfted>
Date: Wed, 15 Apr 2026 13:20:42 -0300
Message-ID: <878qaoyz39.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR05CA0143.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::28) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS3PR11MB9820:EE_
X-MS-Office365-Filtering-Correlation-Id: d62ba1ac-6c64-406f-894e-08de9b0af372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18096099003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0fg4FYDht9i5ZvbtXTluf7+TFfh9O1DytaW0F9Q+Osmc/NpB8mkq7LepG47lbCbe2r6RMlm8i5YsF1IgVCGzWDzaQhY5Ej5B9GUsweW4BOgAI7gocBD0qk91Wj/Bug/wMaaMiCwRrgI5kt6Q8P00lD6D1t3aqFz/a+VpCRPYTywwsWNn3nGiZkvjDFFqa9COfXFsspiVw425LvVc9UYJbQhO0bI9bgZULZGUReNNJy5HyLzaO28fRC7ktMEBRA8HfRMCwLcDS7Ly6/aj4yuh9xG2ohzQrZjdu2VTbi/zmWVEG5wsk7c9dAlKx5gOQ1iAE4JV9TL92NzhAlmdVtSOnJBGLforH2jRlbS1XUoQ/AZkiCtZsB1PFc/Mrmzb+1e+/iWryslcBahloewlfWStRsEsoMwgEh4botnIk1/m782TqywSUwzYYS/tlhMf6rrLhxztqYiswWI9DcugpdygxdhbyvWhdypjVT1r2RkMZEzBRwxHE24akE7ErPBiFTGi1tIB8lvP9mv1gzEiTmVLkmw5VPMkmIImW3O4IuNq20gUy5jEe3AWOpZvioxsk37VP8o2iis1jtEovmgPy/RaClhyoIyzqjNsK9Olw6nP1SwxnorYYIllXEKwNhwK74SOERyZcvwGYaCvBJvAG2gJ2vXyeDCiGmwfQy0d6gPMQ3y6MY7yfzHA1a2RpGZirnsDjyfIal01Vu3Kdm8+Hvw4CtPGrCL9ihvQQeD1bxGtYug=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18096099003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHZnOTQraUlaZGtTTHlHMlZiV0pndTNBd1dQVGIxSkpuUjM0L2N6T3E3c1NN?=
 =?utf-8?B?eHY5YXBmeklSeXFEVjRCNDhwUGEzQWhYZUNWRjlkdmRSSEMyTHJ3NlNwa09v?=
 =?utf-8?B?dWFHdGNsOXlVTFVSWXBsV0RZSGF4cGZRaE9BcTNvNTQydVRHRmt0MThpbjNN?=
 =?utf-8?B?YkJiVTdUVm5BcjVzL2xWcW9VSFVlNm1sYWJnRTFpbk1HR2J2MzBHbVdMcTRy?=
 =?utf-8?B?V3QxNFlhWDd4cGVDanJLRTZNdG5iR0V3Rm82U1FaRk5iSTlhVWo3V0Rhby9B?=
 =?utf-8?B?aHcyQ3BRTVRGMWtocWZqdjFhRTlUWS94bGJ3MHcwejBONjMxMGorbzNvRGxT?=
 =?utf-8?B?WHJQMUtKTXNqWE1SZHduU1NMUUYyMmRqVWc2OVpJZS9CekE3a25XalowMUE3?=
 =?utf-8?B?WHp5aWh4R3ZieURodm1iVnUreEorT2J6YXMwWVIxUi9tNzgwYzV1TlhIMURB?=
 =?utf-8?B?L1Z6YmJUeSs5WVVJN2lycnFxN3NpMmZ4dVpsUHFDdkRnQWRmaHh0QmhLZVo0?=
 =?utf-8?B?TXpkZ0oyQk5HWnh5LytLa1B3QS9IUjdxTUhjckRUeHpSN2RDdVhWSW5zODFT?=
 =?utf-8?B?NXhua016M05IVVNoV2FwamdJNVVNL1V2VER3em1pWisvV0Zsa1ZlSkZsQVlC?=
 =?utf-8?B?QVJaM0JRNmkxUXBtZHd0SVZ0d2FRVmNQNDFPeGdJanhhTnd1V2ZVQ3ZYT0Vp?=
 =?utf-8?B?YlNkY3J6SzU0Y0wySDNPUFJDd0lWZTR0V2RSLzBqcmluaHdXK1RGVzZEd3dY?=
 =?utf-8?B?ZGg3ZmlpWm0vOXNwUVA5czVvZmJqTlczbzFyejlFQlNuUTBEd0tmZWJ2TkZi?=
 =?utf-8?B?dzlGUG1XNW5XT2tMNXZiUVhBMEZHZmU1RVl6WW45RmtOeUEzNXJUSGsxWDRL?=
 =?utf-8?B?Mm1OZ3NuanJHZEdUN0JJTVRwSnFFQ0dWSlh0a0krODVxUEtOK3VrY0ZCWTZt?=
 =?utf-8?B?ZEVEcjRHc1RyZVRVUW9iazVPOHZEaHg1aS85UjZOYkQxV0ZwaUo3UlZETGtu?=
 =?utf-8?B?emYrdW10dmFrd1REaG5zVFBQdDcwSmFUU1FKTjlTUzVMb3lFYjZQSG9Vd3RI?=
 =?utf-8?B?elZBM3VSUXl3TEFlaEw4OWFqUmhUQXpsTW5HY2dua0RXTlVjcWtaelFkR3h3?=
 =?utf-8?B?Q0MrWG9GN0ZnVFVITFByRkhWZm1YZnZzMStFVTlvaWxnRFJjZXJHZ2xncDR3?=
 =?utf-8?B?ZnlUNkNIaldGVmpQYkdHdjdqU3lTK1A2dllxamlwbnhGaDFQRmd1T29ldURM?=
 =?utf-8?B?Qm5Dc3J6WStEdDJSWjV2TEgyWVpkczZ5b2Z1UUU0UjVOYVliM3oyQ1cyM3hC?=
 =?utf-8?B?djVjSVQzK3pnTXQrRURTcWVjSWZRQ2pFUWhkQlk4WGgrV2lvdHQ3cnVJcklr?=
 =?utf-8?B?eXdOVHpvdktFK2tYM0xaczlTb0xCb2NaN2xXYm1zYzZIb2JTL3N6cUMvRW03?=
 =?utf-8?B?U29lOVFlSCtkOXIvR0hWYWdrWW11Q3d5NXhFUjFmSkRwWlRDVVNBUnFqaTcz?=
 =?utf-8?B?ZHExNHRxcW11WVZjclkwUXVicHNRQmRMWDB6alBoZ0tXaEdGVWE5V0xzWE1T?=
 =?utf-8?B?cDdqSEIrOEZOaE5tMXMvOU8wZm80Sk5oVnRRcFVDOW16a012aG9uamw1TGZC?=
 =?utf-8?B?UnVsWG5FVlU2SlVCSXVxMGI0eGdLV0NKL1hnczM4a2lhTXlRZzYzNE9sYTRR?=
 =?utf-8?B?dElNWkI0SC81bktCUDB5QTV3U0VUanByWHpCSDRJQnhnMlNtZGdPUytoWTl5?=
 =?utf-8?B?dUdxRElZTWprcXJmc24zKzlVdlQ5WnVBWFk0dm5UTVVPUk1ad1d2d2pmSE5P?=
 =?utf-8?B?eXVBSnZZSS9xNFVKWnI3TFN6c2ZzOW5Uem15YWpYcGQ2TVBWSlNxeUhPdHN5?=
 =?utf-8?B?OUdieVUrQVZobmlES0pSbitndTVZU0lGam5wSEhGbmRwNWV5enJEZ1dscUhW?=
 =?utf-8?B?VkJIemkvWHF4M0xmclVlaFQzY0hsWEVsT3FTaEVkRjkvT0V3d3VYRnVBKzdO?=
 =?utf-8?B?WmZHSGI5SWhidUFRNU00NEMrajI5SzUzN0RpVENPOS9kcFMzdXU5dFBTaEVm?=
 =?utf-8?B?d3pKUFhvNFJORnVhb2N2L080WjgrbS9iRHhEYWlqM2RZb0wyQ21VVnJFd0pq?=
 =?utf-8?B?aExYeEY5SG9mSmZJUEdETmVyOVJIczk3Qk90WjA5MGxhODg3TkZ4OW1vUG1i?=
 =?utf-8?B?UzE2MVYzek1tTEovZzEzUzJIcThkTE50V0NsUlRVTys2ZlVTVlE1QmdrUkRX?=
 =?utf-8?B?WGNuc1lpcUVZQUJxVDZUbHVKaExWV3dZZHJMVkt5LzJoZkhobURIUVVCZ0ty?=
 =?utf-8?B?TStwSzVjdmtiNy9KMnoreUx6NGw1R0dKUlF2c0xJSUlsRW1JNHl4UT09?=
X-Exchange-RoutingPolicyChecked: p3PpZ4FKF2wQ7vx8MvDPH/OPP/cUu102t9P7siwy7ZyLf5JFQ8qu+PMzmyUlSyQACImRq6jWJl4l5aPYPXg6e+MZB1+XBmAz8YC2Ki7IaoFwZGNBvw1qVYDy+wtTV8MSKBIBcWqiagSrIFb3Y7gQisIVTvEuLOV3aX2/B9enOIMVRD4/63H6N6w9gcIwWr6eMp1Z+dVGFe4rzm8fEsDAAVqiQlPZsSoJpLFxeuICvFDKzHOp4Yl43BQlk/RDq1Ry/aZnopaLVSyupmjGreH8mzT82f6ZKxtGhKB5YAF4MOVFdFNbWpjREmZVm8oUC17fb2esq/ut3cIcjc4rVliiQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d62ba1ac-6c64-406f-894e-08de9b0af372
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 16:20:47.1327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZscNdU9GgQmaTrxii6c1LfXBFOFXeTWqlsDmAS2uaanRF+Xb9By/mQSUX5i1jY8pvZDIHxKcR0lzy/TRi0kxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9820
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

Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:

> On Wed, Apr 15, 2026 at 09:16:33AM -0300, Gustavo Sousa wrote:
>> Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:
>>=20
>> > On Tue, Apr 14, 2026 at 06:39:28PM -0300, Gustavo Sousa wrote:
>> >> Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:
>> >>=20
>> >> > Add list of filenames which were created by hooks in attachments di=
rectory
>> >> > (like GuC log copy) to results.json for allow presenting it in CI.
>> >> >
>> >> > Due to lack of userdata pointer in nftw() implementation main json
>> >> > object is passed via temporary static variable. It shouldn't be the
>> >> > problem because results.json is created in single thread. This chan=
ge
>> >> > is not too elegant but allows to minimize the code change and is
>> >> > much easier to read comparing to recursive readdir().
>> >> >
>> >> > Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@inte=
l.com>
>> >> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> >> > Cc: Ryszard Knop <ryszard.knop@intel.com>
>> >> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
>> >> > ---
>> >> >  runner/resultgen.c | 63 ++++++++++++++++++++++++++++++++++++++++++=
++++
>> >> >  1 file changed, 63 insertions(+)
>> >> >
>> >> > diff --git a/runner/resultgen.c b/runner/resultgen.c
>> >> > index f8459385c3..d37f01a433 100644
>> >> > --- a/runner/resultgen.c
>> >> > +++ b/runner/resultgen.c
>> >> > @@ -1,11 +1,14 @@
>> >> >  #include <assert.h>
>> >> >  #include <ctype.h>
>> >> > +#include <dirent.h>
>> >> >  #include <fcntl.h>
>> >> > +#include <ftw.h>
>> >> >  #include <inttypes.h>
>> >> >  #include <stdio.h>
>> >> >  #include <string.h>
>> >> >  #include <sys/mman.h>
>> >> >  #include <sys/stat.h>
>> >> > +#include <sys/types.h>
>> >> >  #include <unistd.h>
>> >> > =20
>> >> >  #include <jansson.h>
>> >> > @@ -1156,6 +1159,63 @@ static bool fill_from_dmesg(int fd,
>> >> >  	return true;
>> >> >  }
>> >> > =20
>> >> > +struct json_t *tmp_tests;
>> >> > +static int ftw_attachments_list(const char *fpath, const struct st=
at *sb,
>> >> > +				int typeflag, struct FTW *ftwbuf)
>> >> > +{
>> >> > +	struct json_t *obj =3D NULL, *attobj =3D NULL;
>> >> > +	(void)sb;
>> >> > +	(void)ftwbuf;
>> >> > +
>> >> > +	if (typeflag =3D=3D FTW_F) {
>> >> > +		char *p;
>> >> > +
>> >> > +		p =3D strstr(fpath + 2, "/");
>> >> > +		if (!p)
>> >> > +			return -1;
>> >> > +		*p =3D '\0'; /* temporary for acquiring the piglit name */
>> >> > +		obj =3D get_or_create_json_object(tmp_tests, fpath + 2);
>> >>=20
>> >> For this to be trully recursive, I think we should create the JSON
>> >> object in the FTW_DP case.
>> >
>> > What for? Imo attachments array for test/subtest which contains
>> > relative paths from test/subtest is enough. I see no value by adding
>> > recursive arrays apart of increasing complexity to the code. Be aware =
CI has
>> > to present these attachments as well, so more we complicate results.js=
on
>> > more work will be on CI side to alter javascript.
>> >
>> >>=20
>> >> > +		attobj =3D get_or_create_json_array(obj, "attachments");
>> >> > +		*p =3D '/'; /* bring '/' back */
>> >> > +		json_array_append_new(attobj, escaped_json_stringn(fpath + 2, st=
rlen(fpath + 2)));
>> >> > +	} else if (typeflag =3D=3D FTW_DP) {
>> >> > +		;
>> >> > +	} else {
>> >> > +		return -1;
>> >> > +	}
>> >> > +
>> >> > +	return 0;
>> >> > +}
>> >> > +
>> >> > +static bool fill_from_attachments(int idirfd, struct json_t *tests=
)
>> >> > +{
>> >> > +	char attname[32];
>> >> > +	int attdirfd;
>> >> > +	DIR *currdir;
>> >> > +	int ret;
>> >> > +
>> >> > +	snprintf(attname, sizeof(attname), "%s", DIR_ATTACHMENTS);
>> >> > +	if ((attdirfd =3D openat(idirfd, attname, O_DIRECTORY | O_RDONLY =
| O_CLOEXEC)) < 0) {
>> >> > +		fprintf(stderr, "Error opening '%s' dir\n", DIR_ATTACHMENTS);
>> >> > +		return false;
>> >> > +	}
>> >> > +
>> >> > +	currdir =3D opendir(".");
>> >> > +	fchdir(attdirfd);
>> >> > +
>> >> > +	/*
>> >> > +	 * ftw doesn't support passing user data so *tests has to be
>> >> > +	 * set to some global for being visible in callback function.
>> >> > +	 * As results.json is not processed in multiple threads it is
>> >> > +	 * not a big problem.
>> >> > +	 */
>> >> > +	tmp_tests =3D tests;
>> >> > +	ret =3D nftw(".", ftw_attachments_list, 4, FTW_PHYS | FTW_DEPTH);
>> >>=20
>> >> I think another option is to use fts(3)? Since it is a streaming API,
>> >> you can keep the state (i.e. the current json object) as a local
>> >> variable and update as you walk the tree.
>> >
>> > CI folks want minimize changes in results.json, so according to above
>> > I would keep everything in flat attachments array.
>> >
>> >>=20
>> >> It seems it is not POSIX though.  Not sure if that's a real issue for
>> >> IGT, since stuff in IGT are supposed to run on Linux, right?
>> >
>> > And Android if I'm not wrong.
>>=20
>> That's Linux as well, no?  Perhaps just need to have a sanity check to
>> see if those functions are also available there.
>>=20
>> >
>> >>=20
>> >> Thinking back, I guess it could fts(3) could even be used for the
>> >> recursive removal.
>> >
>> > Question - do we really need this? I can live with ugly static
>> > json at cost of simplicity especially this is only result generator
>> > which likely won't be touched by next months/years...
>>=20
>> I would say: if the right tool is available for the job, why not using
>> it?
>>=20
>> Not going to block on this though...
>>=20
>> >
>> > For attachments case imo allowing recursive creation from hooks script=
s
>> > is an overkill.
>>=20
>> The hook mechanism is not something created for exclusive use by CI. It
>> is a tool for developers to use are they see fit.  That was my original
>> intention when I first developed the hooks infrastructure.
>>=20
>> I don't like the fact that we are making assumptions of how the hooks
>> will behave here.
>>=20
>> If CI wants a flat structure, that's fine: let CI provide hooks that
>> generate files in a flat hierarchy.  I just think that it is not right
>> to assume that all hooks will behave like that.
>
> Executing hooks out of igt_runner won't provide results.json, right?
> So all that recursive removal / etc doesn't makes sense when you execute
> tests standalone.

My comment above is not about running igt_runner vs standalone tests;
it is about the users having their own custom hook scripts, which could
be used as part of an igt_runner call.

By the way, did we reach an agreement about whether we should or not be
adding the attachments to the results.json?  I remember Ryszard had his
doubts.  I might have missed some conversation about it.

--
Gustavo Sousa

>
> --
> Zbigniew
>
>
>>=20
>> --
>> Gustavo Sousa
>>=20
>> >
>> > --
>> > Zbigniew
>> >
>> >>=20
>> >> --
>> >> Gustavo Sousa
>> >>=20
>> >> > +	fchdir(dirfd(currdir));
>> >> > +
>> >> > +	return ret ? false : true;
>> >> > +}
>> >> > +
>> >> >  static const char *result_from_exitcode(int exitcode)
>> >> >  {
>> >> >  	switch (exitcode) {
>> >> > @@ -2244,6 +2304,9 @@ static bool parse_test_directory(int dirfd,
>> >> >  		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
>> >> >  	}
>> >> > =20
>> >> > +	if (!fill_from_attachments(dirfd, results->tests))
>> >> > +		fprintf(stderr, "Error parsing attachments directory\n");
>> >> > +
>> >> >  	override_results(entry->binary, &subtests, results->tests);
>> >> >  	prune_subtests(settings, entry, &subtests, results->tests);
>> >> > =20
>> >> > --=20
>> >> > 2.43.0
