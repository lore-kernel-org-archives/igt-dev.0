Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89A8C83F03
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 21:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A62F10E8F2;
	Thu,  3 Jul 2025 21:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gt3XS9Sj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B9910E8F2
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 21:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751577818; x=1783113818;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=O4CjqmQhGxsNhF1FwHQZiI62TAzH2X2D+HHJVfTYlIc=;
 b=Gt3XS9SjLaQcBSu8PI0Jh/oHbevoHJJcFKuAkw3i3e3xeIIwmjGUFidg
 Wa8KZIwkgpInWOEoKnlFfgGU/WPh8QStbdys0j6WflyFvIT3zA8z4x4Ik
 WOFb0Vog3XMB3F8rAtQHDfHm7Jk5F8XRHIawEs9L8H4kxUCcLuESqjLuv
 Zm+krVu71rBH7BPaDmPczaNre9XpXdInkNLKQuU99JjGbiwykqnE15pWy
 zLt9vfdRyULhB6Dm9U6L39+NO8+ku6aTHL3nHI2JsmulqP7CoNM1yicMV
 IEyKVzZzhE3IYqTAzX89IkrKW5+lzZcJMVEg6UbxZiVWDm1YLwzc4jZsT A==;
X-CSE-ConnectionGUID: PldckRljRrmrMaA4hKLS8g==
X-CSE-MsgGUID: ecQv1dNfSSOgxG/i0y+r5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57589752"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208,217";a="57589752"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:23:37 -0700
X-CSE-ConnectionGUID: tfJYlqvGRdSc2TK0tBVUUw==
X-CSE-MsgGUID: 5qvGZ3boTOegH4n7o1Q20Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
 d="scan'208,217";a="153902556"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:23:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:23:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 14:23:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:23:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfB7L2AdpRbOEksV5BeXcIUuQ9WL1s24rSolT7LG3kze0PyZAPkIydz7j+fcUq+UqymcS6+aKTlbfRFnjFlvXFfuhUFEd75arWQLH2mlz+mIXqt8a9MBBFXHsh9k+r3Rp1OKy91HADtErOBGg7hgma0gaf/aqDhhTCP2PLNpgQokDX8IYhiJcIXJl4eEHv3AC4Z5fkC1UIows63bw6AsaoKGK+ZFo0U3HIyqwtr4cqEnRjIyOr+ghc9EtmEhd2awgsK04tiopjv6JbpNQeXloFm8kAcZq/2Za8yYoZN5Jaxzdy1R5MKt9QRk0wsl3P09LDNm/U/VFkA1t8SPCqGK4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfZfOgJKwb92Qb/FEb/PAz+5tswP2bz/OPJetnzHndE=;
 b=fai0pQczTR5AaZ+1zODRTWCC1+5amIB0fc2vtnbQpLJPzNhtwO6q6cNRM3kzyZdYKMyLgMoyCmjmMC78YXsp7F3vNhDPFH5ScljEmxGhBiJ/YTXhj4vW7JFngDv+40EW5NDL1FRjidNK++7Gm9TmeoMLxa+1l12vsTiTiuoTRuEe4wt9TP94ZNQc3e+30hHCVv3XSn1s4lfk2vfKtc+HQbGNTjTrklpLOISVo9IbqFWAhFCOPSC8gjh/HqQpsun+wGclrKzA0t8MYMeX+a3+mo1k/XKdGZ4x5oqw1LsG4da/bFtU5BEvQ+ghIZ8mmQ3N6D6rrgPJBygzuQV1C1dpbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by DS7PR11MB7738.namprd11.prod.outlook.com (2603:10b6:8:e0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.21; Thu, 3 Jul 2025 21:22:53 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 21:22:53 +0000
Content-Type: multipart/alternative;
 boundary="------------Cso6Ct0ojQbBpj5Z0iDHl9Eo"
Message-ID: <9438f600-9351-418a-9acf-c99bb45d98ab@intel.com>
Date: Fri, 4 Jul 2025 02:52:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 3/5] lib/igt_sysfs: Update new debug mask
 requested by user
To: <igt-dev@lists.freedesktop.org>
References: <20250604053046.1702233-1-pranay.samala@intel.com>
 <20250604053046.1702233-4-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250604053046.1702233-4-pranay.samala@intel.com>
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|DS7PR11MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 565fd322-652f-43a1-47a9-08ddba77c577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUJDNlZieVhjeXBjZmRVS0hvSEpYZU1vUUx2aitjYVdGdGwxWkV3MjA4elJi?=
 =?utf-8?B?R21DYlNzRlBqTldGang1RDI4Z2VkT3d1ckJ4d0I3WEpienp4OFpvSXdxSnF5?=
 =?utf-8?B?TkIwb1VUZVhaeHFGSWNaM2pHekF1Q1BqYk9ZQW51citXeDFVUEZFWFBvbWVD?=
 =?utf-8?B?QWlSMXNoRGFNR3pBdFNGcWxEL1FHQkJLZ3NiM2RtLzNuT0d3UkorNFIza1Vk?=
 =?utf-8?B?azBNRmhDRXJZbi9pU0tJTE1FazVRbWdXTTBHNEJOeE43UjdCSE1iVmppWGl4?=
 =?utf-8?B?YmFIMzRDR2xQUHlsZ2xuRzlOY3U5Z3Z6MkE0bVRqeUNSWCtwUG9MNWlvM2Yv?=
 =?utf-8?B?QkVLWEovWXY3cmxBN3hraExmRWc5UC8rTG1GRnN1a1pLdjJ1MzRkYm9NZUNa?=
 =?utf-8?B?U01jNm1pZDdoQTB0UEtWUzdMTk81TVVsaVRaaktEbG12UzB0cy9YaXExSTkx?=
 =?utf-8?B?MUliUXpMN0xiRkJ6d2hJSmYraXlGUUYrdnVzaVRORGxSVmJwTVFCNkdoVisv?=
 =?utf-8?B?dElOd3QyNTk5T3d1amlFZWVDbjJxZ2Q1M0tLdk8zUnA0WTdqanZsUXZEaFRC?=
 =?utf-8?B?ZkdLK2FYTXM3bmx2aHdWK05PRGNDUEt4SndOU3czaTAvZVdBK00xdUorZUJC?=
 =?utf-8?B?eUIrL3lPSlArNnBocDVFSEphaHRvczZ2VGN1bkQ4cGFXaGZZanJ0SHhxYjg3?=
 =?utf-8?B?N2R0MzZaZ2drOGc1S0hGaWtSbkFLN1dWSlBKRWdFdURPMVI5VFlHNzRia2dT?=
 =?utf-8?B?U3ExUlBKY1pJOU5TR1ZBN2t1MHZqQkxHL3paZWJpelJGU1psVmdxUER4OCtI?=
 =?utf-8?B?S1BHa1B0VGQ2cUEzem5MN1lCb2krTS9uMlNEamUwZjBJbEd4R0VMSzYvQVBq?=
 =?utf-8?B?b3pXMnJUTW5BZmZDYUFvaHZQVnlRLzBXWDZmRUtNSjc4NEQ4UmxIeVp3RXZV?=
 =?utf-8?B?NTByNFVZSXFHYm1WNzhGeXgrR2tCWWhkdFFITE5nbzk4T2xoMGc2WUg2QlNS?=
 =?utf-8?B?K1BSaWZ5V29SQ3NPUWpPNGZRbHJicHU4Und0ZWpzQ0p2bklIMFVQcERXNjJP?=
 =?utf-8?B?Y0JGY2E0L21lb3BZRllnMWdCakdUZjdjUlVKYThhVWg0WkpmekpaMXNNUHdk?=
 =?utf-8?B?blNlb3JYSWYxTzZrU1VoSC9aRW5JNGxILy81eno1emJEZ0kweHJFalRHU1hR?=
 =?utf-8?B?OWMzaStGSzhxWjdCS1VYang5bDVOcFUwemdjL29CQVRIVWpuTGRpM21Bemtl?=
 =?utf-8?B?VWJ5emc0RnA4SnBDNnJnSFArK2lzSld0N2NiV09GT0tnTE9zN0NEUWs1NW5z?=
 =?utf-8?B?b09ZblFxMHB2NHlXQW1IQ0Z0Sys3VWFpZXh5emFRZGpJREdjZWpmT0dvUGdQ?=
 =?utf-8?B?T1NPZTZqd2daeW95YjRISldIQ3JrYkZ3bGM0UTRSQUNMR2R4ZU4yZGVNN0RN?=
 =?utf-8?B?WXcrYXNNYUNGeEp2b3lGWmQ3V2VoWHJ0VHFnOUtObHd6UWdpcldlUGtWRm9J?=
 =?utf-8?B?UHB6U2JpaFQ5UmVTVGZhSEQ0RDg0KzVEcUJkZ3BrWEZJOEs4Q0lwVzNoajJl?=
 =?utf-8?B?L2Z6dGR0S0ZzbkRLUXRIdW9FNGJNcE9lT1ByL3hNWCsxUmFhMkJOUWVMTjlN?=
 =?utf-8?B?RUpGZzBLQ0lBSTlsdHhLYjlISVlpTHpKMXROQlc1Z3BrYkR5ZUpCOHhQbGtF?=
 =?utf-8?B?aGk2TThDbnBNRHphR2FCQ1o1a3RBME9BSDRMUFZKL0pYUVZsYmJ6TzFhR3FN?=
 =?utf-8?B?eDdXVUNLbTMvT2gxK2Rpb3hqK2RUeGFCQ3RCTnFzYVV3aUdSOTBXRHNqa3lx?=
 =?utf-8?B?VVN2MXJycmh1K1hzTFMrQWxYd0hDM1lCK1FkT1VhdFZReWVNZ0wvK0ExQk11?=
 =?utf-8?B?MHA4RmpKZHVBd1hOZlFVTkNaNzlhVmdQLzV1ek56clRWTFJBK20yaVk1dDRL?=
 =?utf-8?Q?hTKnI+33EJY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXNLZHFMSllTUkpsTHo3SlZhUzVBREhhUkRRSVFUOWg0dnFnSHlnOXJBVFRn?=
 =?utf-8?B?WmxPdCtaTUg1eEh5M2ZxLzhCSkZWRURmT0hTbWtmMlVjR2NOMnVLc1daaVBM?=
 =?utf-8?B?bzlOQ2FPTzJBRURSWlBKem5NdlIzRzByWmp6bk1HSEN0UVdnclF1VFd3NGY0?=
 =?utf-8?B?bmZ4VUdCRWR3Rjd0UnpjaUZJMytFTGtLTGNUUW42ajNPQ0g5MXZpb3hHZWND?=
 =?utf-8?B?Q2FxeUZyWDFwakdtYWswT3FuWTRRczdpMHRsc2pwVmRzQUQ5cmRqUGdjWkha?=
 =?utf-8?B?eGlLbEVOeE1XczlLVVcxd1d4cnZORHI5OVJ2T2VvZ0NjUEMxSVI0djMyTW43?=
 =?utf-8?B?eE1FVEhuaWc4WkR1cTZxTFFOVUJHZjdTYmM4WkF5bXJZd0p2cmFOd0NIVTh1?=
 =?utf-8?B?MjMyeGxxQ3pkaXUxaVErNlZObklCR1dxWnNVV0c0WEJ4eDBEZ2V6ZHlpbWth?=
 =?utf-8?B?bnBzNkRJSUxBaDM5dmZibXowa3hWcVZ1V3drdm1ia1pQYzROdXFGendrbFJy?=
 =?utf-8?B?L3VweEFYdWxKL0I5N3E3NXF1UlhTL1JMUzc5SkttQm90VjNZbXBzc0xhSktU?=
 =?utf-8?B?MjdQSXFjOFBHakZHSXNsbUdtU1FlSFkybUpWKzRGMVdnL1B2c2FUWkl6bE9F?=
 =?utf-8?B?bTBhdFdKOE1Za29aVC9za3N1SFg2UjRxRkU1TjhVT2JBeUFpM2tCUlNRVkFS?=
 =?utf-8?B?ak03a290elRsNVI4T21YNUV5cG9GUXJxekpQcW1oTURDTzRWbTlYSXpJcVky?=
 =?utf-8?B?dTVkWEFBR05KNXYyZUVkTFBXQXVJMEVSejI1Q09JRkRFS05Sc1RqcTdJb1hH?=
 =?utf-8?B?RjczMTVLOFFCUVhaSUFZTG9NeE5lYXN6eFB2QVJlSFFxSFVuNFVwc1lyNGp6?=
 =?utf-8?B?dzlGNTh5TWVkaS9sRWZTTnF1Vi9jVUdmU1p0VVdodVhjWFRlVk9WUHBwaE51?=
 =?utf-8?B?NVowcHFhTFNrekVqVGE0NHNlb21NZThVWG5BZ3pJYkZkN2NBejdwNnRMOGF1?=
 =?utf-8?B?dVY2MGFuNjV5d0xkaEVja3hsNWVlU0N1VzFIbm90STMzcDdPSGhxeXpKZEV1?=
 =?utf-8?B?clRmUXo0V3RTNXNRR21vb1paS215S3NhbjJ0M0dpN3phVVdOZ2I5STF2WE1j?=
 =?utf-8?B?RE5vK3RKR3lXRHAyNTFlRzdSV3dGL2U0L09tcW9kTmpZWlVRVWQ4RjBmODF2?=
 =?utf-8?B?SkJDaVVLaVlWMFRabVJEcHU5a1c0YkJROUtrbklaWnpVTzFhY1ptZEQ5bG5I?=
 =?utf-8?B?T3had3BZNENJYTZCSzB2ZlNWbEhhYUtjck5iN3NkM3dobVZESk9PQkMxT2pP?=
 =?utf-8?B?V3Q1YURCM0hhdHB0SFdlb08vOWR2eWxmcWhnUHdIRnVmU205SDUrd1ZZWmN2?=
 =?utf-8?B?VWZwN2tURjB0MTdwQUdyZ0RoSHowWGZwV0tVTEgzdklIQVBtRWJmSUtDZ1F0?=
 =?utf-8?B?bmJMSnhNRXVyOTdUR2hwb2oyMllqZCtJYWlpaEY3UDk2OU5HdUJ0YjhBL2sr?=
 =?utf-8?B?bDRMNHNGS2ZOWmV1emF6bzJISS9HZjdoQ2Z4OVZwQ0FNSERnaHRCQ0dGRnhL?=
 =?utf-8?B?VXNRMGpXRVovZVlEUkhlTlFKekJyd1VJUG5YTGprblVISVlvNmRpTVFVSDZ3?=
 =?utf-8?B?S2V0eDQ5alRDam5EWHBrQzVFNzZKZk9WR3lqVWgzL3c2Z2RaZG5GT25PL052?=
 =?utf-8?B?cHVaQmd0UlZtRXBNY0g0NmpBT0ZkZVA0U2FXRk9BYXV1Q1FxSTNPSUxIV0lT?=
 =?utf-8?B?Z0hFMUNKem9xTWk0MkRXSU54NjRJZDJ6ZmxFMk82SFNvTDAxallOdmUzbGRT?=
 =?utf-8?B?eFhldnpzakZ2bmtLeXh2M3RtZVZ6RHZoV1dqVXdSbHdoOHVUcTZPNFhJa3ZM?=
 =?utf-8?B?SDcyTU5PSEV0V3ZaM1o4VTlTMFVVekI2UGkzbDNOdHlpbkQ4cm5EV3hRYnFz?=
 =?utf-8?B?WER1RUdkeS9nS1NURU9vbDQrVXJ0d2dET280TnEzVHdTU0JsTzNjQXF3Y0hv?=
 =?utf-8?B?UzJwUHNkbjhsa3JuVlRXZnpjNXpJdVRtWm5SRTJLQklOM1ovU0dZRVdwSHpa?=
 =?utf-8?B?VStiaTZkblMrdVltMUlnN2ZwcjR0aHBjeUJoL1JOS2dvQjBOK3BqZXgrQXZI?=
 =?utf-8?B?M29BaTN1b0Uwa0JSVTNjMVl2Y3dhamo2Tlp6aE41TTBJSzBtbzRyNHZ6SWRL?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 565fd322-652f-43a1-47a9-08ddba77c577
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 21:22:53.6874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KloQ0qrUWn/KQFtknL/m0OERokOyg+bZ/nJ671o7njnpqpLitck+ljg8AglPW9NHwdoskUBPPLX06KuTyWMm+zHEQKhXaE7zfx5E0SVm82w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7738
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

--------------Cso6Ct0ojQbBpj5Z0iDHl9Eo
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 6/4/2025 11:00 AM, Pranay Samala wrote:
> These below changes will update the required debug mask passed by the
> user as per the requirement. Before setting the debug mask, it stores
> the original mask which will be used to restore the debug mask post
> test.
>
> To handle nested updated, update flag is being used. Using this flag the
> original debug mask will be read only once to ensure while restoring it,
> it should be the original value and not the previous value.
>
> v3:
> - Refactored for readability and address logical comment.
>
> Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   lib/igt_sysfs.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index ceb776b8d..427aed4de 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -500,12 +500,14 @@ static void igt_drm_debug_mask_reset_exit_handler(int sig)
>   
>   /**
>    * igt_drm_debug_mask_update:
> - * @debug_mask: new debug mask to set
> + * @mask_to_set: new debug mask to set
>    *
>    * This modifies the current drm debug mask to the new value.
>    */
> -void igt_drm_debug_mask_update(unsigned int new_mask)
> +void igt_drm_debug_mask_update(unsigned int mask_to_set)
>   {
> +	unsigned int new_debug_mask;
> +	static bool debug_mask_read_once = true;
>   	char buf[20];
>   	int dir;
>   
> @@ -513,14 +515,19 @@ void igt_drm_debug_mask_update(unsigned int new_mask)
>   	if (dir < 0)
>   		return;
>   
> -	saved_drm_debug_mask = igt_drm_debug_mask_get(dir);
> -	if (saved_drm_debug_mask < 0) {
> -		close(dir);
> -		return;
> +	/* The below flag is used to read the original debug mask only once */
> +	if (debug_mask_read_once) {
> +		debug_mask_read_once = false;
> +		saved_drm_debug_mask = igt_drm_debug_mask_get(dir);
> +		if (saved_drm_debug_mask < 0) {
> +			close(dir);
> +			return;
> +		}
>   	}

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   
> -	igt_debug("Setting DRM debug mask to %d\n", new_mask);
> -	snprintf(buf, sizeof(buf), "%d", new_mask);
> +	new_debug_mask = mask_to_set;
> +	igt_debug("Setting DRM debug mask to %d\n", new_debug_mask);
> +	snprintf(buf, sizeof(buf), "%d", new_debug_mask);
>   	igt_assert(igt_sysfs_set(dir, "debug", buf));
>   
>   	close(dir);
--------------Cso6Ct0ojQbBpj5Z0iDHl9Eo
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/4/2025 11:00 AM, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250604053046.1702233-4-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">These below changes will update the required debug mask passed by the
user as per the requirement. Before setting the debug mask, it stores
the original mask which will be used to restore the debug mask post
test.

To handle nested updated, update flag is being used. Using this flag the
original debug mask will be read only once to ensure while restoring it,
it should be the original value and not the previous value.

v3:
- Refactored for readability and address logical comment.

Fixes: 56b91193b825 (&quot;lib/igt_sysfs: Implement dynamic adjustment of debug log level&quot;)
Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 lib/igt_sysfs.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index ceb776b8d..427aed4de 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -500,12 +500,14 @@ static void igt_drm_debug_mask_reset_exit_handler(int sig)
 
 /**
  * igt_drm_debug_mask_update:
- * @debug_mask: new debug mask to set
+ * @mask_to_set: new debug mask to set
  *
  * This modifies the current drm debug mask to the new value.
  */
-void igt_drm_debug_mask_update(unsigned int new_mask)
+void igt_drm_debug_mask_update(unsigned int mask_to_set)
 {
+	unsigned int new_debug_mask;
+	static bool debug_mask_read_once = true;
 	char buf[20];
 	int dir;
 
@@ -513,14 +515,19 @@ void igt_drm_debug_mask_update(unsigned int new_mask)
 	if (dir &lt; 0)
 		return;
 
-	saved_drm_debug_mask = igt_drm_debug_mask_get(dir);
-	if (saved_drm_debug_mask &lt; 0) {
-		close(dir);
-		return;
+	/* The below flag is used to read the original debug mask only once */
+	if (debug_mask_read_once) {
+		debug_mask_read_once = false;
+		saved_drm_debug_mask = igt_drm_debug_mask_get(dir);
+		if (saved_drm_debug_mask &lt; 0) {
+			close(dir);
+			return;
+		}
 	}</pre>
    </blockquote>
    <p>LGTM,</p>
    <p><span style="background:white">Reviewed-by:
        Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20250604053046.1702233-4-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
-	igt_debug(&quot;Setting DRM debug mask to %d\n&quot;, new_mask);
-	snprintf(buf, sizeof(buf), &quot;%d&quot;, new_mask);
+	new_debug_mask = mask_to_set;
+	igt_debug(&quot;Setting DRM debug mask to %d\n&quot;, new_debug_mask);
+	snprintf(buf, sizeof(buf), &quot;%d&quot;, new_debug_mask);
 	igt_assert(igt_sysfs_set(dir, &quot;debug&quot;, buf));
 
 	close(dir);
</pre>
    </blockquote>
  </body>
</html>

--------------Cso6Ct0ojQbBpj5Z0iDHl9Eo--
