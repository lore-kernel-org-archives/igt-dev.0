Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE242E7E0BB
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 10:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA3810E3BB;
	Mon,  9 Feb 2026 10:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YGcWCjwg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6606710E3BB
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 10:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770632218; x=1802168218;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0kVYeRpEzPbpQ6wc9Jh7KZL1bs/j6XXeUPecA65Fc94=;
 b=YGcWCjwgV8ofMVoqCRLSd0HSoNWFtDOxSuraiqcq2wjDaGnC9x4gfk9V
 YvbCCourm0E7+eaSVB+n+J//iZsdqo1xPNBd/0rVQVnjHWUA7aRkAJ8js
 MqgcCDpMb9spjz5S+DG3CLbLYN4uzWSMfVZTM1AUDoeyt/vrcQP5JvHiT
 Jirz6pTSofci7Z6Qo6x5+3gftOlwTIDeKcC+/xtgaTwUxAaedJDIVyF4a
 /+Mvr/MOZoh5moGs+/pyIvb5GYDb5PizpN0q1BnNJo37Jo9US0iNhOOR1
 He375UdxMsOGuZ+T9Rc7IGdboI0ZogJZol1SMxRJpVirkwqtkp9twDsDn w==;
X-CSE-ConnectionGUID: 66DyQo0tTE2Hb8ZGK2zhEw==
X-CSE-MsgGUID: zt2V5dq9RmaDW218REKrgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="59306603"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="59306603"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:16:57 -0800
X-CSE-ConnectionGUID: nMmI3/DPQq6COvdsfooWaw==
X-CSE-MsgGUID: OUAnEvj8TueHD3lR/bT+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="211270827"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:16:57 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:16:56 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 02:16:56 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:16:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yq9xbt4tEP2/Vr0mBctuh47piFh7HG3rtfGyNuPOsKkjAvtmIR306am6FMZSYUxcVoxgaNL3nN16Cx/+MTEjN32ytCSSPCah01ph/zhR5bij5znPqQgP2P3oub7phHyXPAp0x2oiUIa2khAuVKm8mrWRnmPEihBKMGD8iQvWszDvwZwGx32CeMjaWDyTs0S7foSZjT36Dgf/FUO+6ff0S7kGwaEb/s265WTDt5PN5bIHY+3gifhcvWKMo4Vp1GB3r1qBpIZ7Nqt2lKD/mdqa5h0uinBiTJR3u8LAvUZoQ/RSGdzrCUw73c+ncQqgHPzRQ9btnFON6kUyc64+MBoS7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Boh2wg6gn6GHlNDFZe8I0pXQyup6PknpF4Cwk0DfX9w=;
 b=hAk9IZY34DCKv18KWMgxQCKBhCgd5l4qjHXSTQ9lMG0u9h0NObclmwl3vDge2i4InETenuMB2MyyZXh3ww2VEI9l/eGrC0dpP1Xl0IRS/arPTKAhkMv2VJv40nlB7D89UYaKj+6s7h7bRaPX0D47rtWgH/f/3feRd48yClo/GbxDbJhL6uxgqGOnyxFPgY5E4DtVEMgdOmkl/kwUOVcVFr7jK/ZNfE/d62cdtO9dUTrxKFkOn88IkqL1MDCSFCFdXtuvW1jUrShi1DeEJAtAUUTu9DrXYK3b3HfeMlRLpNywmS3jxPcqNMHoQtf8gII4N1vngyXVWNs6/KowyQ8RVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS0PR11MB6421.namprd11.prod.outlook.com (2603:10b6:8:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 10:16:54 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9587.013; Mon, 9 Feb 2026
 10:16:54 +0000
Message-ID: <2ebfcc0d-49ca-4fde-a48f-27a014b5f729@intel.com>
Date: Mon, 9 Feb 2026 11:16:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 2/7] lib/igt_pci: Add generic PCI driver override
 and bind/unbind helpers
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
 <20260204163217.121305-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260204163217.121305-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0033.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::13) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS0PR11MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb965ad-35dc-4909-af0f-08de67c458fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUJhS2tqcVVWQnlzbDQ4UW1iRS8zbEhoV0M4QlJybEZqQVBUN1ZuditjS2lw?=
 =?utf-8?B?bUhLYkdRV29iYndWL1VUSU5UYkRxSmJubFZacVpOVGQ2RFBFUndOcVdXRllp?=
 =?utf-8?B?UEQ4anBieW1DREsrK0dMNFZOa2NkT3lGSWg4SXZ5N091SFFNZDRrY1FJR1FU?=
 =?utf-8?B?MUxzMnJWYXhicDFrbVFWSVIwQTRPLzErdlRUK3VxdHBySEFWZDlIM3ZVT1Bz?=
 =?utf-8?B?bW9tSEF2NnVURW9iMHdrSjFKdThMRHRWOENOcUVZNGxJK0RYMUxkelZlWm54?=
 =?utf-8?B?bGc4eElKdGxabDFpVFNsTXlZNCtmV1N2S2dkemZYUFh6YThJS0hSWEVkcEh4?=
 =?utf-8?B?Qm8vODNtWGRSOUdNR3R4VlRYZmxrQ2ZaVkRxT3ZMV3I0d1ZBWldqZjc3UW5I?=
 =?utf-8?B?b2ZSZytyNDVDdHk2dDRRL1FsUUNhTnBmSUdDTDhndjNqMFZoRjU0TUxsZHpm?=
 =?utf-8?B?dWhQdXNkcHczcHhoYithdHl6ZWg2dlljYmEycm5BN2hFeldBZ2srTmxyVXZ2?=
 =?utf-8?B?OHRyRWhLZzRwZkF1cTRaTE81a3V2QXBIUk11SXcxWm5KWUo3WU5yeFZQVkdZ?=
 =?utf-8?B?VEtXZU4zQ0VmcXpFZnRmMVh6eWRpbFU0d2k3a20zNmlMQ1JYSTdyTForWWsr?=
 =?utf-8?B?N1E2Zm1XdWNRdjNlT1lncTBSaHdJMUNja1V0WVUrWmJMN0hNS3FFcFJDeVU0?=
 =?utf-8?B?MU9EZG1TYmplTlJxcWE4R3BzcXZvSERDc2lsMUlDMkZ2YWxTWlc4RVJuc1Uw?=
 =?utf-8?B?OFJTZ1g0dnFDNzdhUC9kei96NC9kUjZEcjRlWk16VzVUY1lwaTJ5WWN4Z0pn?=
 =?utf-8?B?UmgzTU5KNnI4aGRjRXpYSnowK28xdTJmVDY2M0kzb1VqOUdyZlV3Vzl6cVlB?=
 =?utf-8?B?NVlMTjZ2dnpleGk4Z3dtMVg5eERVN3NXQTV0cXEzK3BjNjU4QVpTenM2eUhs?=
 =?utf-8?B?c24rTXRPMTlBUVR3THo3eFZjTHlGbHYyZ09YTzhYNWpROC9Tc3k2VHB5Nk1L?=
 =?utf-8?B?Vi9Wa0YxcURYUWdZVFJFODVkWWowdHdoQ1p1M1ZyOERodS9Idjl4MXNNcERy?=
 =?utf-8?B?Zm5UVGJNbXhsanhjZlFsVHliK0k2SFdBQ1c2M3pxOFhEQ1RvUHRadCtFMDEz?=
 =?utf-8?B?K0Y3Zkl1NUtrQ1M1YjFxaVF3d1ozSnZzYnhseWVMbVVNbVBNQXhwOXYxYzZ1?=
 =?utf-8?B?VGJlbDJpRGxJcUpMTjRwM1owM21wNFpoR1N3QVphdjJUMnlwSjMyMU8raFN6?=
 =?utf-8?B?WmpoMlM4bGNkSGF1cW9rVy9Vb3JuTFlRYU5PYUw4NE5iZ1hDOE1MQSt6eUdj?=
 =?utf-8?B?b1Z6UUZsWGhpRS81TmtKeWVHTXZqdW8wOVdBZWwwbkI4Uk1tcm5salJocEMy?=
 =?utf-8?B?ZmFQQkFOVlV0RXk2dzVlVTdCNFVIZ3RjVFVyOWxoR3ZvdEt3Z2QxbHBzRmNn?=
 =?utf-8?B?ZS9BVGxac2x0Skx0UFNTaytoam40dDNxOFZKWlpQTXZuSkkyanpWUzY2dEtk?=
 =?utf-8?B?MkFqNFdrN3NXalhZc05nY0IzZHNTMHhWMzJ6WVZrWENleFdXS0pIZHN2VW5V?=
 =?utf-8?B?UWZxV0RKc0JQV1FrRWgrWVFteWNGUHk3dXJ5dXpOeXJLUkM4c1MwTjNaekRv?=
 =?utf-8?B?OWVZZ1NnMzViUmlnM1dZMEFlVHMrbnhDYS91Y3lzczhLd2d2ZjVNdTFNVVN5?=
 =?utf-8?B?MitsdUc5RXpudU94SkZkdkJMeDRLdGEwL2ZEdjdwTVNvQ2FKaU9GKzh4L1NX?=
 =?utf-8?B?M0JLdTNKU2pwbGR4K21xRmdPNVdKWGtrVWdPUUVqRFJCOThLeHFoV1RRQW44?=
 =?utf-8?B?aHpKRlZLWlNLdjNqaHI3cURVeHU2M05SWUhBWTdzaDQxOWZBb01wRnRySzZ5?=
 =?utf-8?B?WVpVL0ZFUTlMaXczM2wzWFdyZmIvRkhScTRWYnRuNVZVVkUzYVFRVXJ3RlYw?=
 =?utf-8?B?ckRhOWhyWnZYVFdIZ2pweHRPVkRZaW1zNFowYXdCTUJHM2YrZnlCSElmS0ND?=
 =?utf-8?B?bXVSVUlHaFhxZktWU2xMOGFyRjZWdHdyNUdJMWZTRitGZmFlekFlVXp0RGZS?=
 =?utf-8?B?ODNIWDV2a1E0LzZYMW82dmFDQnQrQ044YXFqQUNkL21iT1RTRDdXNE14T0ly?=
 =?utf-8?Q?o3mU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEpERzNQY3NwWDdUSjdEYTRjenRWZkhIYTc1Y3ZmQjNTNGVXUXdKMVl2MGVU?=
 =?utf-8?B?TlVZS0pwMW8xUzMvTWQrckM3RWt3aytKWTIzcjY4UldSSFdJaWhYK3pGSEd2?=
 =?utf-8?B?TzNxN1JWVkhBVjNHUWdIODBUVUtSNHNFTEpZNDZOTS9uR3BjTU9sbDlzelpN?=
 =?utf-8?B?OVFVVG9wOTFLNmltTnZwNlpXeStVMEU4MTR3YXBOOUxEYTBRQmFTTSt2K3oz?=
 =?utf-8?B?dTFzZ1pYclBXMi96a3dXZE9kN1dhVHpSMWhEY0pESWpLTVJFbVNJb2I4dmR1?=
 =?utf-8?B?cVk2dzdCcFFMUEV0UmFZTzZvZVpDSWRrc0c0SFRkWTVUc1dNWWcvRm9jRVFn?=
 =?utf-8?B?cUUrL1RqRFpvVGszZzcydnNSSzRCVEhKemZWeWJuNGpoYXVGYmJNTU1BNjFj?=
 =?utf-8?B?cURDY1ZUNmpBTHg3SzNORHcrUkdVeVlKRHJVSUd0eXk3aTBRWjJGZmlvUU9D?=
 =?utf-8?B?N29LelVzY1JNNXhZU3RHTzRKNGkycUpTQ0lrQ3hkdnRCdm9DWHUrdGV5bmxD?=
 =?utf-8?B?dVBUMHFnTit6cUlkcmhiK3B0T0lKTVUrR1NkOFdrK0hvT0JsQ1N4ZGR0WGlm?=
 =?utf-8?B?U0RhWnYvS1VzcFBvUjV1d2pIMjVWZ1dHRE5NcnNDVE9PbUpycHNaYVZxcGJz?=
 =?utf-8?B?Q0c3V2VTSFprMVZBZHNvT01RaHBGNEltcVZacGxLbnVBT3g5NEVZbUdqTmow?=
 =?utf-8?B?TVIzNytqY3FSek5xQ250S0pQL2UzcDFIMWVVdGh1aUUvWkp0YnBaUTlNY2Vv?=
 =?utf-8?B?SEtQZUpWUWRpa3NVTnNoZTYyVkUyQ0ZLN3ZwZ2xDejJvb1QrdVdWY2QxVEw1?=
 =?utf-8?B?dEovRDB2NjA2anVVa1k1dVphRVNscXQyUnFlaVAwZUUzYjArdXVaVi9TeEVQ?=
 =?utf-8?B?N3JycXUrSkkybng1c295aHNoVzdjbk1DV2pCRFZ3OHNvbmVVZ21FRXRaejZF?=
 =?utf-8?B?OVowRWEyN0hjVDR3WlhmdEJPUHdzblExd1NRdlJhcVp2QkpxNHI0WDNtZG82?=
 =?utf-8?B?MDZqOHNVMlh6SzRZdEFwSEVDR1MrdWM4b2lydk9xVXk3SDYweDQxeTB2V2tl?=
 =?utf-8?B?NTdNZVVES2c3bFpZT1FtZkxpbXZ3S3FuSHF3R2MycEtIcFRacnN5dXRRVTc1?=
 =?utf-8?B?TXJXYXYxUmJGY280VXErUTdqZGMrWC9wdHZQcFZ1d0NieGpPN1BmUENyVkZ5?=
 =?utf-8?B?TXlVWFRQVjNxczc0S1hXQXVvSUh3ZE1nenQ4d3M2dEJQcWFEcXRkYnVuMktR?=
 =?utf-8?B?TTJ4K3UvWTYweWd6emRkd3o4c3gwT2lFZG1FalRla1Q5b3MwL1BGS0xQWWxZ?=
 =?utf-8?B?L1VaMUllZm5zRlFIaEw2ZUd3c2d2clUwUWhIblk3em84SHJDZlN5T1crWmxx?=
 =?utf-8?B?bTRHcFJnZ1hURWZ4NTJQL0M0U1hjQUhSeGRMYWtvMVUyZzg1RDZ6bGV2OUtP?=
 =?utf-8?B?cTdBK0thc1ZEZDhKbUhiWHZKL2l5MDV1SnUyeFBUWmt2SDhOMnk4eWV5K2hl?=
 =?utf-8?B?eDhUaTgyQm4vaEttWGlNbzJ2dHNBQXdhQ0dDRUlWNENYK3B4SVhaQjZDVGRY?=
 =?utf-8?B?WWkwa3IyNTFWVm1ZRnhqcldlbUNnSHhLZVQ3WFo2L1IrVTh1VUlCYXlYTGZY?=
 =?utf-8?B?NW1zeWcxUmhHaU9JOXNwRERDemhzMkk0U0doN09VUUZ2WFdBNjFXOGpVdnFp?=
 =?utf-8?B?WVBWQWd0c0JWOFdna0k3SU43cllhU2g5MVdOaUk5UVB2dWF3U1d0L2cxeTV5?=
 =?utf-8?B?QVZ1azhjZUVtdlUwWlE1WFAvaE4xamZ1ZzBINVp4c0pGNTFFSDlrWFhMSTBx?=
 =?utf-8?B?SlYvTFpIRCs4SlJtMUlMRWV6V2EwM2N3Sll6Vnh1THY4RjNOYm0yNE1HMFRJ?=
 =?utf-8?B?M1IxQWc3SFVaUEJnV2gwbnlQVWZGZ0dSeWJVV3ZkWUR5Qkl6b3dtQVE2ci9I?=
 =?utf-8?B?WjNHZ3Z2bitGaTJLVzVBU1hLa09ZQVN3UERmcHN4eGNONFlqYnc1Um1sTW5z?=
 =?utf-8?B?OWhZTDlIamhZWUtCVVE0eHdvRjNlT1JkOGpYT3oxWEU5QldyMmhrVWphNVlX?=
 =?utf-8?B?azgxemNoUGh1d01qUlBpYWZYMWhUMjQvdWx5MjJML1VNbXA5UEg0Z1Flajl6?=
 =?utf-8?B?RjNtOG9UUGdXaytpNlZWQSs2aUtBOGRsNmlGUWRWTjU0eTF4RmQ1OUJPQTMw?=
 =?utf-8?B?WXQzNkVjRlNwYlEwWnVGUnJUcEg1QmIwZC8vamYwTEZ6dDdJRVZpZXpIOHJt?=
 =?utf-8?B?anZrNWdCZklEYVZIRndJazFuTXpuR3o1WXplaC9WbEFYRnJ6N3hPaEFZRDBi?=
 =?utf-8?B?ZlV6cVpoTXpRdVMyUXp6NHA5dkZsUm51NllsN3BWd0xvS3VMczZrQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb965ad-35dc-4909-af0f-08de67c458fc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:16:54.0441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kg7lBGzWeU3YnaJSxGiKhMhmeHmhJ9fcgwJAUT0RcIazAlV6bDdK7S1JJvQd1JmRARhfHRsEMUSkt+OmqIA0AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6421
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


On 2/4/2026 17:32, Marcin Bernatowicz wrote:
> Add generic helpers for controlling PCI driver binding via sysfs.
>
> The new APIs provide driver- and device-centric primitives for:
>    - setting and clearing driver_override
>    - triggering PCI driver reprobe
>    - binding and unbinding devices to a specific PCI driver
>    - query the currently bound PCI driver
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>
> ---
> v2:
> - Add igt_pci_get_bound_driver_name() to query the currently bound PCI
>    driver via the /sys/bus/pci/devices/<BDF>/driver symlink.
> - Extend igt_pci_bind_driver_override() and igt_pci_unbind_driver_override()
>    with a timeout_ms parameter so callers can wait for bind/unbind to
>    actually complete, instead of relying on drivers_probe write success.
>
> ---
>   lib/igt_pci.c | 351 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_pci.h |  13 +-
>   2 files changed, 363 insertions(+), 1 deletion(-)
>
> diff --git a/lib/igt_pci.c b/lib/igt_pci.c
> index 61aaf939d..80aaf07c5 100644
> --- a/lib/igt_pci.c
> +++ b/lib/igt_pci.c
> @@ -3,9 +3,18 @@
>    * Copyright © 2022 Intel Corporation
>    */
>   
> +#include <ctype.h>
> +#include <dirent.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <string.h>
> +#include <unistd.h>
>   #include <pciaccess.h>
> +#include "igt_aux.h"
>   #include "igt_core.h"
>   #include "igt_pci.h"
> +#include "igt_sysfs.h"
>   
>   static int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
>   				  int start_offset)
> @@ -51,3 +60,345 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
>   {
>   	return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
>   }
> +
> +static int open_pci_driver_dir(const char *driver)
> +{
> +	char path[PATH_MAX];
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/drivers/%s", driver);
> +	return open(path, O_RDONLY | O_CLOEXEC);
> +}
> +
> +/**
> + * igt_pci_device_unbind:
> + * @pci_slot: BDF like "0000:01:00.0"
> + *
> + * Unbind @pci_slot from its currently bound driver, if any.
> + * Returns 0 on success, or a negative errno-like value.
> + */
> +int igt_pci_device_unbind(const char *pci_slot)
> +{
> +	char path[PATH_MAX];
> +	int dirfd;
> +	int ret;
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/driver", pci_slot);
> +	dirfd = open(path, O_RDONLY | O_CLOEXEC);
> +	if (dirfd < 0)
> +		return 0; /* already unbound */
> +
> +	ret = igt_sysfs_set(dirfd, "unbind", pci_slot) ? 0 : -errno;
> +	close(dirfd);
> +
> +	return ret;
> +}
> +
> +/**
> + * igt_pci_driver_bind:
> + * @driver: PCI driver name under /sys/bus/pci/drivers/<driver>
> + * @pci_slot: device to bind
> + *
> + * Bind @pci_slot to @driver. Driver must be present/loaded.
> + * Returns 0 on success, or a negative errno-like value.
> + */
> +int igt_pci_driver_bind(const char *driver, const char *pci_slot)
> +{
> +	int dirfd, ret;
> +
> +	dirfd = open_pci_driver_dir(driver);
> +	if (dirfd < 0)
> +		return -errno;
> +
> +	ret = igt_sysfs_set(dirfd, "bind", pci_slot) ? 0 : -errno;
> +	close(dirfd);
> +
> +	return ret;
> +}
> +
> +/**
> + * igt_pci_driver_unbind:
> + * @driver: PCI driver name
> + * @pci_slot: device to unbind
> + *
> + * Unbind @pci_slot from @driver.
> + * Returns 0 on success, or a negative errno-like value.
> + */
> +int igt_pci_driver_unbind(const char *driver, const char *pci_slot)
> +{
> +	int dirfd, ret;
> +
> +	dirfd = open_pci_driver_dir(driver);
> +	if (dirfd < 0)
> +		return -errno;
> +
> +	ret = igt_sysfs_set(dirfd, "unbind", pci_slot) ? 0 : -errno;
> +	close(dirfd);
> +
> +	return ret;
> +}
> +
> +/**
> + * igt_pci_driver_unbind_all:
> + * @driver: PCI driver name
> + *
> + * Unbind all devices currently bound to @driver.
> + * Returns 0 on success, or a negative errno-like value.
> + */
> +int igt_pci_driver_unbind_all(const char *driver)
> +{
> +	char path[PATH_MAX];
> +	DIR *dir;
> +	struct dirent *de;
> +	int driver_fd;
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/drivers/%s", driver);
> +	dir = opendir(path);
> +	if (!dir)
> +		return -errno;
> +
> +	driver_fd = dirfd(dir);
> +
> +	while ((de = readdir(dir))) {
> +		bool ok;
> +
> +		/* BDF symlinks are like "0000:01:00.0" and start with digit */
> +		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
> +			continue;
> +
> +		ok = igt_sysfs_set(driver_fd, "unbind", de->d_name);
> +		if (!ok) {
> +			int err = -errno;
> +
> +			closedir(dir);
> +			return err;
> +		}
> +	}
> +
> +	closedir(dir);
> +	return 0;
> +}
> +
> +/**
> + * igt_pci_set_driver_override:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + * @driver: PCI driver name to force-bind (e.g. "xe-vfio-pci"), or
> + *          NULL / empty string to clear an existing override
> + *
> + * Set or clear the PCI driver_override for @pci_slot via sysfs.
> + *
> + * This does not trigger driver reprobe by itself. Call
> + * igt_pci_probe_drivers() afterwards to apply the override.
> + *
> + * Returns: 0 on success, negative errno on failure.
> + */
> +int igt_pci_set_driver_override(const char *pci_slot, const char *driver)
> +{
> +	char devpath[PATH_MAX];
> +	int dev;
> +	bool ok;
> +
> +	snprintf(devpath, sizeof(devpath), "/sys/bus/pci/devices/%s", pci_slot);
> +	dev = open(devpath, O_DIRECTORY | O_RDONLY);
> +	if (dev < 0)
> +		return -errno;
> +
> +	ok = igt_sysfs_set(dev, "driver_override", driver ? driver : "");
> +	close(dev);
> +
> +	return ok ? 0 : -errno;
> +}
> +
> +/**
> + * igt_pci_probe_drivers:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + *
> + * Trigger PCI driver reprobe for @pci_slot by writing to
> + * /sys/bus/pci/drivers_probe.
> + *
> + * This causes the kernel to attempt binding the device, honoring any
> + * driver_override previously set.
> + *
> + * Note: a successful write only means the reprobe request was accepted.
> + * It does not guarantee that a driver actually bound to the device.
> + *
> + * Returns: 0 on success, negative errno on failure.
> + */
> +int igt_pci_probe_drivers(const char *pci_slot)
> +{
> +	int pci;
> +	bool ok;
> +
> +	pci = open("/sys/bus/pci", O_DIRECTORY | O_RDONLY);
> +	if (pci < 0)
> +		return -errno;
> +
> +	ok = igt_sysfs_set(pci, "drivers_probe", pci_slot);
> +	close(pci);
> +
> +	return ok ? 0 : -errno;
> +}
> +
> +/**
> + * igt_pci_get_bound_driver_name:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + * @driver: destination buffer for the bound driver name
> + * @driver_len: size of @driver in bytes
> + *
> + * Read the currently bound PCI driver name for @pci_slot by inspecting the
> + * /sys/bus/pci/devices/<BDF>/driver symlink.
> + *
> + * Return values:
> + *  1: device is bound and @driver contains the driver name
> + *  0: device is unbound (no driver symlink)
> + * <0: negative errno-like value on error
> + */
> +int igt_pci_get_bound_driver_name(const char *pci_slot, char *driver, size_t driver_len)
> +{
> +	char path[PATH_MAX];
> +	char link[PATH_MAX];
> +	const char *base;
> +	ssize_t len;
> +
> +	if (driver && driver_len)
> +		driver[0] = '\0';
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/driver", pci_slot);
> +	len = readlink(path, link, sizeof(link) - 1);
> +	if (len < 0) {
> +		if (errno == ENOENT)
> +			return 0; /* unbound */
> +
> +		return -errno;
> +	}
> +
> +	link[len] = '\0';
> +	base = strrchr(link, '/');
> +	base = base ? base + 1 : link;
> +
> +	if (driver && driver_len)

You can check the input params at the beginning of the function and 
return error if they are invalid.

> +		snprintf(driver, driver_len, "%s", base);
> +
> +	return 1;
> +}
> +
> +/**
> + * igt_pci_bind_driver_override:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + * @driver: PCI driver name to bind (must not be NULL or empty)
> + * @timeout_ms: how long to wait for the device to become bound.
> + *              If 0, don't wait (best-effort immediate check only).
> + *
> + * Bind @pci_slot to @driver using the driver_override mechanism.
> + *
> + * This helper sets driver_override and immediately triggers driver
> + * reprobe so that the device is bound to the requested driver.
> + *
> + * Returns: 0 on success, negative errno-like value on failure.
> + * A reprobe request can be accepted by sysfs while the driver probe
> + * fails later; this helper verifies the device ended up bound.
> + *
> + * On bind failure, returns a negative error and the failure reason may
> + * also be logged to dmesg by the kernel driver.
> + */
> +int igt_pci_bind_driver_override(const char *pci_slot, const char *driver,
> +				 unsigned int timeout_ms)
> +{
> +	int ret;
> +	char bound[64];
> +	int bound_ret;
> +	bool bound_ok;
> +
> +	if (!driver || !driver[0])
> +		return -EINVAL;
> +
> +	ret = igt_pci_set_driver_override(pci_slot, driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = igt_pci_probe_drivers(pci_slot);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Writing to drivers_probe only tells us the kernel accepted the request.
> +	 * The actual driver probe may still fail (and only be reported via dmesg).
> +	 * Verify that the device ended up bound to the requested driver.
> +	 */
> +	bound_ret = igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound));
> +	if (bound_ret < 0)
> +		return bound_ret;
> +
> +	if (timeout_ms == 0) {
> +		/*
> +		 * No waiting requested. If the device is already bound, validate
> +		 * it is bound to the expected driver; otherwise treat as
> +		 * best-effort request-only success.
> +		 */
> +		if (bound_ret > 0 && strcmp(bound, driver))
> +			return -EBUSY;
> +
> +		return 0;
> +	}
> +
> +	bound_ok = igt_wait((bound_ret =
> +			     igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound))) != 0,
> +			    timeout_ms, 1);
> +	if (!bound_ok)
> +		return -EIO;
> +
> +	if (bound_ret < 0)
> +		return bound_ret;
> +
> +	if (strcmp(bound, driver))
> +		return -EBUSY;
> +
> +	return 0;
> +}
> +
> +/**
> + * igt_pci_unbind_driver_override:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + * @timeout_ms: how long to wait for the device to become unbound.
> + *              If 0, don't wait (best-effort immediate check only).
> + *
> + * Unbind @pci_slot from its currently bound driver (if any) and clear
> + * any driver_override setting.
> + *
> + * This is the inverse operation of igt_pci_bind_driver_override().
> + *
> + * Returns: 0 on success, negative errno on failure.
> + */
> +int igt_pci_unbind_driver_override(const char *pci_slot, unsigned int timeout_ms)
> +{
> +	int ret;
> +	int bound_ret;
> +	char bound[64];
> +	bool unbound_ok;
> +
> +	ret = igt_pci_device_unbind(pci_slot);
> +	if (ret)
> +		return ret;
> +
> +	ret = igt_pci_set_driver_override(pci_slot, "");
> +	if (ret)
> +		return ret;
> +
> +	bound_ret = igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound));
> +	if (bound_ret < 0)
> +		return bound_ret;
> +
> +	if (timeout_ms == 0)
> +		return 0;
> +
> +	/* Verify the device actually ends up unbound (driver symlink removed). */
> +	unbound_ok = igt_wait((bound_ret =
> +			       igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound))) == 0,
> +			      timeout_ms, 1);
> +	if (!unbound_ok)
> +		return -EBUSY;
> +
> +	if (bound_ret < 0)
> +		return bound_ret;
> +
> +	return 0;
> +}
> diff --git a/lib/igt_pci.h b/lib/igt_pci.h
> index 92b9cc392..a66eeebf2 100644
> --- a/lib/igt_pci.h
> +++ b/lib/igt_pci.h
> @@ -6,8 +6,9 @@
>   #ifndef __IGT_PCI_H__
>   #define __IGT_PCI_H__
>   
> -#include <stdint.h>
>   #include <endian.h>
> +#include <stddef.h>
> +#include <stdint.h>
>   
>   /* forward declaration */
>   struct pci_device;
> @@ -24,5 +25,15 @@ enum pci_cap_id {
>   #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
>   
>   int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
> +int igt_pci_device_unbind(const char *pci_slot);
> +int igt_pci_driver_bind(const char *driver, const char *pci_slot);
> +int igt_pci_driver_unbind(const char *driver, const char *pci_slot);
> +int igt_pci_driver_unbind_all(const char *driver);
> +int igt_pci_set_driver_override(const char *pci_slot, const char *driver);
> +int igt_pci_probe_drivers(const char *pci_slot);
> +int igt_pci_get_bound_driver_name(const char *pci_slot, char *driver, size_t driver_len);
> +int igt_pci_bind_driver_override(const char *pci_slot, const char *driver,
> +				 unsigned int timeout_ms);
> +int igt_pci_unbind_driver_override(const char *pci_slot, unsigned int timeout_ms);
>   
>   #endif
