Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6E9C28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 15:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD3010E64D;
	Thu, 20 Mar 2025 15:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffaJTdRc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7834810E64D
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742484055; x=1774020055;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NAh7pDvmYqmOEwpP5qbfUu2Znift3UVe1d7lmF4d4iw=;
 b=ffaJTdRc1/agsgodzcAHBa5+60sWG26Ltgs23Ef5nhtZWYi1+DpBgAdX
 ksqU7iV645/II5wSTXEiBeRjdZdT7HE1O5P8X6XuXwc7kQBI+45/bm/qN
 Ds3/DA7Lrfd6zgmD4QE8dyRAlsFP1sf3070u3ao7kZsUvDS2Yr3sgpNn7
 lDhlyFzx/hxu4lIcEL5emcaUQ8QUHE5URPmgnLy99y7CQPD7y2kQVcvVS
 X+aQo++tjcCbE3XE8p1aIxK8ekW1PTdWOQWKLVVHPxaU+ZfDyvG3sz3kc
 0oXWcvlJUDsH9NsSAsIL06Wj7TtIas379v13AX+Z5aoIUfzthjTbE7WHg g==;
X-CSE-ConnectionGUID: 5JyazuSIRomBbHuNw+Jt8Q==
X-CSE-MsgGUID: apsj/5AeQPCsAEg0TSCNww==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43854977"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43854977"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 08:20:54 -0700
X-CSE-ConnectionGUID: FbUAn0QnR9Gx6k7E+mGn4g==
X-CSE-MsgGUID: l0d98PNQQvufQS8IX8OFYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="127966224"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 08:20:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 08:20:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 08:20:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 08:20:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTETwvpV36cSf8/CHSvypDNSGHiQx815H5cDjORFr0h9hgneQXe6Qp66yVDgx5+hCcRsyBRcTEDxhNk3M/MZvcKU8+TY+w+3Aoizozc1dPYhOgD3vbJzo4kPokSUtIU2ehLEYYMVxJSjCMXze4hW6Cmwchxb9llm2yfFpuC0BZryor2sx0S5fFnJYia8+mIW0tfvZ91/bY55MBEDos2MCUAF3LoQHdjEX2IBwdFCJh4n2ZIfV8dNhX37Efmjmp4pQG1eSDMfgMt0a11CgWfrYPxK0xB973WNkvxBs6X/oa7iZ7WQtj/ayykdOexFTsJ4Oo56eE7tgxuawuwMvQ3emw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAh7pDvmYqmOEwpP5qbfUu2Znift3UVe1d7lmF4d4iw=;
 b=vmW1MXa99W0hHAZ/Ji0MtJEsNSh7Eoznx5TqoklFq74aGgnnwn2lBynF8ZHdNYvVPm/5hfNgTxrmoSLJmmC+qpwjg300Nj5SJ+15MMsB8GxW7haT93WZ5eHeTYy4vBMol1HWyrQxV7IAZR/InH3ky5QPUbM6MH5RLmmfCjuk/1pjkWiBw3t2Dldgo+/YZi7bs33AqTHobWVzXby2J+6rzyYEFJOgajda2M/kb1YKbBLRbbZLBsJHeVPIt9q3NjGvvkefm5jO/nwLkquPfHP63ltC6Ijn24nnVx6/Ovt/Hdvo907gBrWXm+7acsuNHptVbkikzEUOqvXeV7G796uNEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by DM4PR11MB5328.namprd11.prod.outlook.com (2603:10b6:5:393::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 15:20:37 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%3]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 15:20:36 +0000
Date: Thu, 20 Mar 2025 16:20:31 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v2] i915/gt/selftest_lrc: Disable timestamp test
Message-ID: <s2t5psjetynzwjlod6sbs6prbi2thzfvyvzzje66xjtjwneze7@5by2nqavznqq>
References: <n2dpynxo4qh2x6k4gum7ivl4ueb6dotssklafko7fktnebmjgv@eiqftxjmgkg2>
 <20250320132413.ita6yn25tzcydzjj@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250320132413.ita6yn25tzcydzjj@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: VI1PR10CA0090.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::19) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|DM4PR11MB5328:EE_
X-MS-Office365-Filtering-Correlation-Id: dc41d6c5-628d-4888-3a8c-08dd67c2c403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enhWZGdJdm8xK0NXYzJHZFNTWDNaZ1ZPQm5XSHJ5UHZmT0lxejc1dDVQZlpW?=
 =?utf-8?B?R0J1aEt2KzJjYmpsZkQzUGJNdi85M3cxa0l1M2djNDROZzdMWkpWbXVpMDJ6?=
 =?utf-8?B?UTFNTjlXNU4wZTZHekp4VDRCa2YxdmJZdzFCajB6ekZCQnBvT1FKL2svQWJq?=
 =?utf-8?B?UHEwb3N4K0hoZGJjWWlucDFJeTA3TWxHV1kwUzdUS2k3cmlXbWozOEMvS2dK?=
 =?utf-8?B?RERwQ3RIeS9SNXltZ3NVaVNhOFNzZGIwaXVOSkVuMmFqSitDRXVOSEtHOWc4?=
 =?utf-8?B?Umk3UUhoZFVkOTlFeng0U01QVEdZV1NYN2EwblpFNit6UmVuYjN2VTZWMEhC?=
 =?utf-8?B?cVhLNVUxcVYxZHJXNS94OUR6RnZac3l3Yk5DSXNmRDhlb000MHk1d2xOV0RY?=
 =?utf-8?B?WFBpeWZDNHk2bVlnMHMvdnU1Y2FjcDZ0SWJOOVJYQmR6RC90OEtQOTAzaUxr?=
 =?utf-8?B?bGVDNkJId2t4UDJYNlROVGRSOUdZM2YzNExJbXlhS3BkWExCMkhmckoxcmVy?=
 =?utf-8?B?MDAxR3R4VHUrbVZHNHVuRFlhSHcveDFKcTFhUU04TUU3UzVYeFhxd1Y4bERj?=
 =?utf-8?B?eHllM2M0cUJxNTdMYjFxcTRndTkwT1oza2tmdnBYbjkvcURpRFpuV05tY2N4?=
 =?utf-8?B?L2xCdmRLM3l1YldIR3QxTkg3UldxM2gxakc2cW1ZSDBjVXNHem5WZ3ZoYWpm?=
 =?utf-8?B?Tm9lNG8zMTMwTkR5ZlNUbkMyZHhqS1h4TUQwYS8zSC9YcllBNkUybUJHaytz?=
 =?utf-8?B?aEpwLzdPK01ZLy9PNlUvbVh5ckM3b2pyeG1NTVlhb2s5aGpiR1M1MGhwZ1Qr?=
 =?utf-8?B?WWRaYlY2eFcwRHovTFI3TEVnTjErRDZqYXkwV1d1d0w3Nm8rK25IUkhSTi9q?=
 =?utf-8?B?WlREeWNqUnRqalJCc2JhMWJGell0QmRMdDhCZ2FETytBYTdSeTBtc2E4aTky?=
 =?utf-8?B?Qzh2N3dhMDlpdUZWTUNXTGl5dXMyWHczRHlESW0wTUFYaWUxWnZOMldPaXUv?=
 =?utf-8?B?R1VXTWQ2QW5QdXBhRGxuTCtwMVFseE5VSDF2K3VxSU80TUZFanArZi9QZFRq?=
 =?utf-8?B?OXFGSnZpSWF0UE5DaXp2UFVxdUVESzlUeDhGQVYranNjdzA2SmYzTnFhcFhM?=
 =?utf-8?B?aEFaRHBhKzFEUUNib2R3NEw1ZE5Fb0NsbkV4QnZFS2F4d3NDNjdrWk53LzVG?=
 =?utf-8?B?eUh1dkl5N2NTdmFpb2VoVUtGc2p3QzZnZURVN2oyRTNlTStxRzBaSkxmZVVp?=
 =?utf-8?B?cVNsNkxHMXdyT0NnRVpDeFAxYkROQ2ZWalpuWFJXV2VSdHhHQytjeWlQRlJh?=
 =?utf-8?B?MzF6a1l2ZXU4Tnk0Mm9UWUZ2UDIrR3RpNzAyTjRtSk14emNmZGlpZkl2OStX?=
 =?utf-8?B?ejBIa3FEdUt0N1JBaUc5RHFhOWdTV0JGV2g0K0s3ZUFtaWJIaXByMFRMNUdi?=
 =?utf-8?B?RkwyQytmU0ZET2NYRW4vQXZRVE43MTRPeURydysyUjUrOCsrK0lFNHRMTk1n?=
 =?utf-8?B?aERaZXRLWmFSZEpLekc4dGtsbG1vUCt1WW0yMklhK0tYQlBBRUptcnVRWVFv?=
 =?utf-8?B?S21KaDdFWkRSTDRWb2ZhVkdEam14bjVGZ3Y4aHVtNGlpN2RaZDVBa3YxN1Z3?=
 =?utf-8?B?TlphYjlkOXlYUWdQYk9xVFloMXAxQ1dJZ0c2MDJoT2kyMGFLVTRra0RVK0h6?=
 =?utf-8?B?cmlNTkFpOXNqQThmVGJUWjNIdUFSRXpJVjEyMitpbHJFVTBxaS91dmQ1VnBW?=
 =?utf-8?B?L3EyeXluNlErTkw5Q3BiT2p3RitmaFBQTytZS0Q2cEFKL0gwY1JoNDdCS0VU?=
 =?utf-8?B?OVBvbTFXeitnbS9KV1VPUk1MbEx6Qi9iM2lkcC9KNDdBNEhXS2FrV1l5R3Uv?=
 =?utf-8?Q?e7c1LyViEB6H+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnYyeG9kVGFJc0Y1SU8zWFNUQ0dyREZHb3pwWWswYTc5VVVtNGtFZUFnNEFk?=
 =?utf-8?B?dksrcUtpVWd5dlVHMnRLTEk2VnhsNEV3Mi9CdHpQU3phdWNiRHRlZmlTbjhR?=
 =?utf-8?B?K1N4a005cGpzRGdkV1pHcWh2Z2JUZU1DT0I4Qm15WW5vb1h1MmlDL1JMVVlV?=
 =?utf-8?B?Q0FRL05qRXlWdEpLSFp6V3lMTFpFK3BIYTdwZ0dpYUh4eWM1akoybWlHenpw?=
 =?utf-8?B?T0dFQUZhWjBlUlpxNnlSOERqdENYTnFzQjVHWmlEb3o1SUdlQ1grMFpsUzJi?=
 =?utf-8?B?cFdiRXlGL1VFTkFIRC83TDFFb0NxVS92SkhWZ3UvRmt5Z2NIbmVZMEE4ei9N?=
 =?utf-8?B?ZHNUSElabFFuZDdDZStFaHhwenRSNkNSeS9oMy9zRGYyNXk5dWJzYzBCbzVy?=
 =?utf-8?B?YkdRaGxaNVY0T3NBTVhqVitKL0svMWhia3NueEpDMmhDcjh2VzVxd05QNTlI?=
 =?utf-8?B?U2RpUjh1elYwWUl1NWhyb2tXbjZBdExFS245SjBTcXZWbXFpZVd1aHZmZmwy?=
 =?utf-8?B?U0NmK2FvaW5MRkRyN0todHN4QzVEcnNEY3k5c0J6QzRub0N3U0V3R2VuaG56?=
 =?utf-8?B?Y1BTaXJLL3hRZmhXNGdJVjlmbFlQT3ZKTGc3MEx5Rk5JVHQzL2JIMVlDMkp0?=
 =?utf-8?B?T1owb2U2N1FlN1lwZzlwdUg5dmxTbUZYQU56N09MUDhRMGRQdlBWZDE2QXdG?=
 =?utf-8?B?MWJ5R0dKSFNzZ1hTckNIMm9oS2JlVFJHSlJSL3p0K25BMEtpY0E4Ulk1M1Bu?=
 =?utf-8?B?aVNuZjNHZ0wzYnRRV1dqazhxZGJzeXRGbm5VV3hmVDlKV29xSk83aXcza0E3?=
 =?utf-8?B?RUszS1JISzBSTzVpb3J5cmVDcEpwM05oUDhoWlluSTUyU1dycllabE5LSlVn?=
 =?utf-8?B?a2FSUFNEUGZQd3FUdUptc0lMQ3RlNEF1SWJFTDBmaTIzYURSLzVWb1RXYnhY?=
 =?utf-8?B?b1JDaW1SRTZ4cDQxcEpaRGhROXAwWlRxSTlORmFuNWlQZWlkL25icTdWT3RR?=
 =?utf-8?B?OFFnV0ZWWmJ4NnFtZGlFMFJDelUzQW55MWpsRGlzbVEwekUvdFZpd2J5TkpP?=
 =?utf-8?B?OVFhdWlzcE9GS2t0dXVpUG5rRG9udmlDMkN1NVQvLzBjcW9SR2UyUHZ1cnhV?=
 =?utf-8?B?WHpyMzN0VEpkOGRXd3o1dkhNcjRyOW4rRmIwTWVIU1NRYmRqbVJWMGZvRGNH?=
 =?utf-8?B?NGFzdzZXWllCKzU3QnRCTjNyUVpIUTNRZWQ3bnpQRHl1cUhvNU9PanpvSThU?=
 =?utf-8?B?cUVJTlNreS90VFVsTHVHamtac0dxMHN3YWVtSXpSdVhBa1BCRFZCZElwTHpH?=
 =?utf-8?B?VU05QklKQ1IycFIwYTJoUmd1aEdJUlh0MDZKdGNFQXRZWTd2MFlBRDFxdUls?=
 =?utf-8?B?YXRYbHcyQmxOR3BTMmYya1cyZjhmL2ZkSGhJQmc0K3kwSlA2Mk1YSDhCNTIz?=
 =?utf-8?B?cDVYbGE5OG10dy95Z0xFTlJSSFVUY1Z1eFo2NTMyVm9NK0VrQ2w0WjRxUS9r?=
 =?utf-8?B?a09GRldOSWxwcFk0SjJETFBlRFh1UXNNNCtsWTRQOVVpajE1SDJzeXhiWUxx?=
 =?utf-8?B?VGNBQUlMRnhYRVk3MncwZ0R3MmFlVEpOaEFqd2k5MHEzcnRzRGxaMElncWhB?=
 =?utf-8?B?alZ6M1pjeWRXN0IvQVdyS3RKUEw4a1N3SEhJMXNKWDBYMnpKS0VSdjFCZEhQ?=
 =?utf-8?B?YVJDMkQrTlVFK2g3dEw0aldFMFRCMkNVQWhlVy9JNnFMZVFyR1lrV2syUUp3?=
 =?utf-8?B?N09PZVB0RU5oQWRlODU2U0JONEZlU1VKNWVqdnZXNnN1eWtLa3BQWGI3aVdv?=
 =?utf-8?B?TDFPYlFPajEvU29YaStTUytRaTZTVm9oQTVFWTU5VDNoZ2I5VVhTUUtPTWcz?=
 =?utf-8?B?MkVqZ2ttUnIyQVBGbXZ5U3A0c1hNNkpwdFlYaE8zd3phRUJYaE0wSTRuamhE?=
 =?utf-8?B?WVlMRDBaZzJCT3FrSHArQ1BqRndrcnRxMVA5RHE3SjQ4eDltKytOWW1pTHgz?=
 =?utf-8?B?ODNnQ01hcmhncWVjYlp2cFo0dUNmbldwSy9UckFRcVpUL1pKSjFNQkNkMEto?=
 =?utf-8?B?VHlZc2Y0bjNLVnNwOWJlUDMyWWljdmF3ckE5bmVTSGNXdjBxNFFTTVp0cFFh?=
 =?utf-8?B?enlqVUoyT1p0V0JGTlNNZ2JzdTkwMHpNNTVVOVhKZnBjUW5RWWZNR3lqUjIv?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc41d6c5-628d-4888-3a8c-08dd67c2c403
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 15:20:36.7515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+dryPlWi+FUw8ujuwDAu+66lhqrOVBRmAzJ9LSZZIyXxPi3xuE6+bWWBamxrDxg/zsy5iBT4rL956pEdkzKJW2UR10hEBZitEvGP926WuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5328
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

Yeah, thanks for catching that and sorry for the spam.

Mikołaj
