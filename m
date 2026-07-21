Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87C8C4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 07:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5895210E2E6;
	Tue, 21 Jul 2026 07:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbTwoeXa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CB810E033
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 07:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784617308; x=1816153308;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SbgiYQqve7edZciGnHX4KaI7p5GUB6+mdkFOVS/2msI=;
 b=KbTwoeXaDJYKKFWMsO132ygqxEKdSjLvRqZdWVa4lVbj1QtBNuEM8Tzm
 HBiI6oySBe/Cis969hPxjtbzIzVqEjI3GL41qIn8Clhy5Bzd331NE9l+d
 FWZJ2vfQkpC6CICbrUpJ/UjRU8BodXkxQ2r6uyzeDJnLYFSwyWhIKB8ly
 JlgesIo2Ixvb8oqf6aYexojjnn/tfIuqTEVRYpLcKl7pgzi24xdst2uqD
 NWmcNwxGe7w6tYoES/fgwtYzDSgazrrrhicqxnX5e1UHmvf3NcQEeh93r
 cL6jzYlXYUiDu9X1GKRDr4wNsmxQP1k5+cFZ9EyJBEdjVOT04oS9lMKZf w==;
X-CSE-ConnectionGUID: n0UebAvKTX668tDQ3iL/zw==
X-CSE-MsgGUID: RD+AoXvyRuiZfMXZQD/JEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="107994724"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="107994724"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 00:01:37 -0700
X-CSE-ConnectionGUID: +A6kPZDvQfCctFnJPnUafw==
X-CSE-MsgGUID: UAR31594QqywPdKT6QuUIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="253332123"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 00:01:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 00:00:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 00:00:39 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 00:00:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIDYMaOYIF6IFJsA2vFp6SckC8lJs9GaQ9KmxJIpJRPZhEgVtU6+H6sQxSWJU5QMhEEcaTHL46xDna4LQ2h7vqrTqCWi2OqaSaOATwuH5OBFs0m2Gnsx6yzUcqrSrhOe9WIuxGld1zXwF/iXcs28OgA3BDdzQFVnhnZmcpiJ8Ix8qd6jfvfD9cg8bBKNc6DvrweH2EQsB7fGK1EuTClZ5hwBK1Y8+WJsfXFsZqjxQWD8arCBheOSru+PXqeAmRSKhgeJjvDLCNvDNWibVYoZhYj/stjgUVIzOWbJviKxsuxaWPK77E7ckRgxBIPCtcNfc92aQKyms7e+23erFVECpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqUxjQ7UnWfZYyIX+GB5ORofLw2qTseyoBBtG1UGJcw=;
 b=aw0uNbzcbZf5IK/QFnS+0+VOuKG/UBvPAJDycDoRehaBx7+Ty0gE3Lq++RlwLu/opqA+W5yaOf1cZPbo7iCsezvLKg4os7xcRwMkAM5VgLv6EaFOermtNPMjjQTwFpT0a1fwP2uI98FM825Mbt96iodAM6opXM1gKnpNDiL1euz11tNu1MjVscoTQXmpSqyDTcNxUoPMHKF0eKnYwgV4QIbZ88AlmivIgJXXMuhkdNqxu68QXT2LgVCjf1m6v921YNGU0/MxNShtmNux3QGvsAVcfASaX3t/zuhjzmUNbVpRvRwfCh7cx9OcbU9g7Ma+goUakUwJ7acFheUI8phxCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 07:00:26 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Tue, 21 Jul 2026
 07:00:26 +0000
Date: Tue, 21 Jul 2026 07:00:15 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 25/31] tools/intel_infoframes: link with minimal
 sub-libraries
Message-ID: <futjfwcfzzwh6qea6k7abnj6berja74idpmxxqar4pn2gwsmb2@lqcyslqcxkpi>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <354eb738edbe81f52225e6b4d2e6f50e19265138.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <354eb738edbe81f52225e6b4d2e6f50e19265138.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL0P290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::19) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|IA1PR11MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 89bf48f0-df08-44da-72fe-08dee6f5bdd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006|6133799003|27256017;
X-Microsoft-Antispam-Message-Info: MG6k4PbtsWsZeqrWXLZ7eh3HytnaGont8wwSwZlHO5akMrn9n+Oa7Ccugsdq132M/IydbMq4J5W2GZqLQCXVVimmJLhiRXxA2IVCQl7/Et/AI4P3o5QEyLhRQ7ZY4WfOiU5hOfAo0pAyzUgmVmq3iR/c2H0zFX41j7EzaAhla6AG38CedaCkn1XjVIy9AYdoHNhGDNVBLR5rjVdsHJtba5KTpbFdsoVABweaHspmPzHgofJ1eDQMFv8hKKGV+9z7MEltxni+NDEbvYPnTPiVbTRDR7tB9/Mt8CpOr1MGfiHY2/hHECd335aANXfF5Xo750QdDg1RDuWqeuc4EuPhqa5yY0dRStFJDLq0K/OkKxexaIFAOwz5uVQZ0078fIeOcntwkdviIvd2GEzKiQcG7wNAUSjEH7HDqiAQnQTnD1FkEg56Oe/JFQ325yQpDBgnll4H+LVdam+J45X+w0pALk7sNt5o90xNXeY144FB2zVj//aYc7JeAbC+L3NfbvCCaSaTmDyFmJfeWB6b/p8MsI1Oo4qD/l+vYEWzq0+YrzBco2IO7QrhmikFvliqFsXo+lASV9oBMWm2nBVLioYvT7/tIx4Ihz8NmU/Bfq7a9q57G2Fi0Ma6qzlHMwt0RPyfprvj+Zg98S4bA8JzqQT8twALJeUucCYM3Cl/muuKYSFO3qiom3eecHNIgFpxVuVRZMiWuhiuxmiATqe5fZdXjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006)(6133799003)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmpTTnZ3cnpEZVFEbjlOdmwrNzRjamtNYTJROFJCSzFiQlFsb0JOcWpabitC?=
 =?utf-8?B?UnhuVnp5VXA0eDVZUGtwa2w5VUZQYjBQbnZqaUlGSVR2a2dJMkp6M3Y3aHoz?=
 =?utf-8?B?REUwN0ZVVG1DczVsTktxMXo4WDAvTUpCd2pCUHhCMWZjSVdqNHVTNzFrTk1F?=
 =?utf-8?B?T1dFZ2pmOVk4cVdiSkhIekRXQVM4c3plMHFnK0JMdEdCVlJKVTZabEdlTGcy?=
 =?utf-8?B?KzBGTktXVVJzbko5Z0hadWhPaDM3VGZSb3dHdytkS2wyM0IxekpuR2sySGkr?=
 =?utf-8?B?UVZhcHlQUjVvdlpLMjRGQUE2dG9iVEZ2Z1RYblcrTkFPQ0JRY0dOVkZxRWpx?=
 =?utf-8?B?M3BiYW9BbU5WQS9BUG00MnRiUUJzcVFJRGlhQW5ZZUU3aDdYT0xDemc0T203?=
 =?utf-8?B?Y1ZHd2xRSkt6UWwvb1c0Z3RtTXlxU1VJakIwYTFYRWdjZEM4N3ErOHp3RXB3?=
 =?utf-8?B?aXlKNTlFSHRWMmZpajNRMXpuajNINHB3blVXQVYwMjhUR28rVWl2ZTVpNDgw?=
 =?utf-8?B?RWM0YytaZGRoajhrbXdyc0F5UFhFblZzbENodFlsdnBncTF4Sy9FUEdVUk5R?=
 =?utf-8?B?QmdYcUxsOWFRZkdjOGM4Rm9sYWkxVGREZU83b1dpQzZLZDhvV3piQ2R0TW9M?=
 =?utf-8?B?d05WY2FDZmswbzMzcTh0YkRwemRmd1NMdWZ5bGRJOFlNbE81SUEzZjVFbkJN?=
 =?utf-8?B?MHNMeVFNRHZRNWpHQ0pFZVNFaGJXeStzN1NGZUdQSkpuY20yVWRhcFBTOHV5?=
 =?utf-8?B?UWxTZEdCSm5OTzVpWGNBWG95QXRTNzg0MjZ5cm5xREUrbSt0aVZKZHF6dnd3?=
 =?utf-8?B?OFc0aUM4SkNXMGNrZVlPK3daM3ZuUmF1Qk1YYVBobGE0Y2JRVFpzdWtva2Fn?=
 =?utf-8?B?VFFicTFzeU84Q1VlQnhMcFpwbm0vUmdIY1lzNFpoMWlLRWc1WStkS1h4YlZr?=
 =?utf-8?B?QWlKOUVSd0RPbFo4clg5TmNNSnlLMVVjSnNTOUd4blh0N2dNN0oxVnRia0tW?=
 =?utf-8?B?ZytZV3VPV3Z0ZlludHNLTHZ4SzlUTWVIS1Fsb1RHZm9xdS9zZC9NNnlRRjZN?=
 =?utf-8?B?NlA1ZUp0ZWZ2OVRRNnB4blJwb29Hb2crOFpvbHE5aUF2QUJ6emhOeCtXU0t0?=
 =?utf-8?B?b1hjRlRFYkszd1B4cWJ5cWNRb0pXUTVKaHdVdlZmcm54NXUxZm5sOTFNQ2NR?=
 =?utf-8?B?N01hdml4Wlo4Q3dUQnFkNEpzZldZUWd4cTd1ZncrR01ZNWJLVlhja3JxemRW?=
 =?utf-8?B?YlY4Z3ZFVWhOT3BId3gwYWJtcDVLOVJQRHVyZDQ3emtnY3IvU2R5OGh0VkN3?=
 =?utf-8?B?NEw3UlF3TW5CY3VRMFJNejdoUks0ZHJxVmIweVp4QXhYSUx2VVcvblZxSE9z?=
 =?utf-8?B?Y05paFdtK0N4T1VDazNBWDRjdWZWRHBKWE9HZTdlc2pYMUk4Qy9IZ0NMWnUr?=
 =?utf-8?B?MlNBNHdla0xjVnJJUG9iajdVK2NmbjBVRjVwMEhjL1dCUDZOQjlFUG5oekFL?=
 =?utf-8?B?ZG9UeFhLZUxPZXFuV1Z2Wng0eGRFL2QzTDFRaFdQQWRSK29UV1lteTIvTWE0?=
 =?utf-8?B?WHJzamtWY1VMSHJkKzgxNVhtV0ZIQm81L1o1M29udHNhcHF0cEkxTStBdDhM?=
 =?utf-8?B?ZWlhSDE3dlFwUmNpVktHdjdSbE1Jcjk4aWxXbDNPemJCUk12RWZodHI5K3Bw?=
 =?utf-8?B?K0I2aGpSMklTSWFTWFBmaXlxeTFmckpkeU4wd3RickZhV3JqVTRzVS9KUmRI?=
 =?utf-8?B?Q2RzanA0M2xzZHNoOXhMOGIrR2JNYlBSOU1oVEJyVmZnWjJhb2F0d2hpaDlT?=
 =?utf-8?B?T1JrVDdFZmxQdnZDWERwQkNLZFphL3ZMd09LL2phb3l3SjFxWGdlWGVnRkRq?=
 =?utf-8?B?Rkpvc2tSVzU4c1ovSG5sMzRSa1dmUXYvdTJhU3NhVHJReDd6ZFdaaisvbFVR?=
 =?utf-8?B?Z0VKdm5JSmZQZVdkUFRUUmNuQVhtRDg2ZzRtak1nNGk0L09JMyt1a2FBZitn?=
 =?utf-8?B?UGVEcDRScXZaRUhtczZvMmMrMWRDeForSkdqYkwxY3A4RldtblpDK0JEdStV?=
 =?utf-8?B?MGRVQUM1SjM1N3Zmc2dUSGpVS3NVSjhveXM3Tnd5czZxMEg4QWowUzlsbW5r?=
 =?utf-8?B?OUVBdS9LTDRRNmd4VUhnbHVUN0NYZnVQQUZKd3JDajV4Z05laGw4YXc4YXQz?=
 =?utf-8?B?T0hLNFRqSEZnVkRXMnhHSFVsUWhETEJwZ1pVaERBSXpDNGZyTlpFZG9KM0h3?=
 =?utf-8?B?RDRyTjVBM2s5dWZIOEJQdzdFdXFsdHYzTUdabmRBdzZLRXhzZjBQNThTMHVv?=
 =?utf-8?B?Q3p5V0JJcU80WFJBVllXMlZRMDdBTC9DMkprRlJ2TDU2eTFlWDEvMEpydUZY?=
 =?utf-8?Q?ZZWYgBMnELfzpy9s=3D?=
X-Exchange-RoutingPolicyChecked: ePFo9xJT56ovPow6zw6+keYtJ5J241jinkqtrW5bC68GPm/8x5RNyk9wRSyTNsT+725wJu1PhinIzCarWdGQSte1TDVOayvJ14FZwLDJ8H2Z66RLoMcFN0OjNQI8eHULXlCXswwpFaSVfZ+l4qDFVwz02WVK1X1MGuvLZR7TJaPSt9n3SacNc9zq+16NR8PwCTQU6O+uxgUeugzCottp/OJDm3HQCTzflTDZcRJHekZwuf5waJkHqbioyQATPioq3suZeLEiRfC+/2oyu4+CdjDsM4PoHIiRnAeA+PomdwyY8TIk+otLsrTMFlhzmkks1PsoqbT41pPvv6Y9nIjp/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 89bf48f0-df08-44da-72fe-08dee6f5bdd1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 07:00:26.0501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1u9anQJ+H7n7x2Nw15vndm7qsUdl+nMCP7cUAafTcb/agpUjH0YgKm6/oOrJv6EXcmC9XdbPQS9HklI0Bq7hbvm+NWqDh41CqEJe1Oheojk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
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

Hi,

On 2026-07-15 at 14:15:35 +0200, Sebastian Brzezinka wrote:
> intel_infoframes only needs the register/MMIO helper subset, not the
> full libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 32a345e9d..a31b6d0ed 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -20,7 +20,6 @@ tools_progs = [
>  	'intel_display_poller',
>  	'intel_framebuffer_dump',
>  	'intel_hdcp',
> -	'intel_infoframes',
>  	'intel_opregion_decode',
>  	'intel_panel_fitter',
>  	'intel_perf_counters',
> @@ -116,6 +115,11 @@ executable('intel_guc_logger', 'intel_guc_logger.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_infoframes', 'intel_infoframes.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
