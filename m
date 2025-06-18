Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB3CC71157
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 11:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783CE10E80D;
	Wed, 18 Jun 2025 11:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhQv+t5K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA3010E80B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 11:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750246795; x=1781782795;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7gtK+a3A6oOMPE5rPX0ArVGF0KrPPVNQDhn0SwoM91Q=;
 b=FhQv+t5KVdZ/Yg4eUJMJzoVZk/rFYZ/hzV9GqxWxuF+4ufWOz8AtX0Fn
 tDP7g8wdmHJtlaq7gZ2Si9TzTkVJihSjuHk4msFc+SgsY+HPpF4CYAJ7j
 2ctGWvzPnsdGO7pgMIm4AGNxvx85H2W33avV5669abeyu8B61fBXvb45h
 xEnfBpVSTHunEBJE1715g4G4tpYNyiD+awt4a8KhehtHeg3T1HtpUVrOc
 y8zNxU6Grg356WQSms6HWd8bhotkqE2zjkL8FOxlpbYIhqsSqtsYBXbjs
 r0V8lK/igR41HyELJdPjOrRmbfE+kXIvmTWfQ8dIdP3ANZSZKxdPf2r6/ A==;
X-CSE-ConnectionGUID: Y0pQ5aWiReK+bzqkkJ7Gnw==
X-CSE-MsgGUID: pvUSEFA1Sr6+hyR9DAExmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="55076368"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="55076368"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 04:39:53 -0700
X-CSE-ConnectionGUID: zaAp/JJWTkKq2ItUNBfSpQ==
X-CSE-MsgGUID: R9MMihnqTletnItc1cHrpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="154286547"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 04:39:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 04:39:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 04:39:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 04:39:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWKtwmOo87flmCtspMlbFt0v9/bYSArz2E+EGhbPLce3FOdcvOcTDfMyUPaBGNNVWIm1wLWDqDR317Dp2R4edCS5NmVGZbDtQd4gu0/c4/MMT/KdLReHW4HTAH8JS0zlTUhu/URoDsydnoTGAaw9wSDYO1rDNBb8MOnDnxAcUBhZq3B590WKMHR27FAddyB3seFcL5DphFDPGGxHMy04KzrH8j3hw95q82yyPMXurx7GqtP8vyIK8+w+9VXS+UisUjo82Inrky/FWQYru/MERZFvOSNDvtxQ3GIgTHVsziRZ5FzIa4vTxaD2eOssPyrEVWlfy97jdJkGnSH3aJj39Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrR9T9FeYNnK0edikowJjAJR+04Cbt0p3KgvpcePUbw=;
 b=wqfO2ClmJDOwG0ftN2wTiVmDg3lRT3ry96EeR4zHRkAayiKwG7G0BD7btJlfEkTYgzyhY282DX4ePLH2wis0angx4KI+XaJ3Q6ZT8tzCseZZzLP87S6tL7eemIYxpnpCaSM1y4MICcZ7K7QWbx1NaoOtIA5bI8xRzrixQZEfrWCJ006D+3Kr2xGEL+O5ttc/+kX05iCmtVTwTefqGfba2HhWE438uJpwjoEa1sZlHcxuoqXcpSLzk3q1igcblyWq/fHvMZIve3dmH8dWFmghHa41R+zI/FEosctUrRX7jOJ8UX3zkRHViR2WWBxd594/tLlPiTttWdBacp/AlY/aOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ2PR11MB8449.namprd11.prod.outlook.com (2603:10b6:a03:56f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 11:39:49 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%4]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 11:39:49 +0000
Date: Wed, 18 Jun 2025 11:39:40 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <andi.shyti@linux.intel.com>, <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t] lib/i915: Avoid non-canonical address dereference
 in gem_has_relocations()
Message-ID: <pljh6w3ikkehzyhdwvey4277vklqffg5dfledtm3hcuoer6hzt@atyhhoyamrjm>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <j6ll6li2qmkk3gwamz36s4saf3ehp6qutkxl3cc2sbm2i2ujsq@5xel3p4b5cw6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <j6ll6li2qmkk3gwamz36s4saf3ehp6qutkxl3cc2sbm2i2ujsq@5xel3p4b5cw6>
X-ClientProxiedBy: VI1P189CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::20) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ2PR11MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c486f6-f20b-49f1-131d-08ddae5cd518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTg3T0xNRyt3Y3J2dHN0dEQrZ2pnSFNjZVdjM3F0VDBVOHJlM0ZKSG9iTW4x?=
 =?utf-8?B?a1lLdGZxWG5rMGhNNTVmbTA5TG1idW5JaVJLdDBrdTRUMDQ1RnRyaTlpZ1cv?=
 =?utf-8?B?blAvWGVmNGhTRkE3SHZlRGNWblFWSzZWT3dYNUJQMVFCT0w1eGZlWlZITnFJ?=
 =?utf-8?B?K1dTR0RUdzJYcWpmVjVoMGxBZHVuNHNIQy9ROStQeSt1Y3N2U1FtSnhuclpK?=
 =?utf-8?B?NWxZU28wN0JCT3Z0QnYwTlV3Wm1iWTBqQ1l6Tmg0MDhBa2dzd1JDOCtkcCtw?=
 =?utf-8?B?SkpWYVhWQTNobEliMktCN2dSY3hqdmtwRm82N1ROTG5GMGZZT1BOeDRvekd5?=
 =?utf-8?B?aXRSd3BNdVFoa1VKMm5Qb1RzSHZhSGdtcUVLZkg4dEpBZjZqdTFNMHk3RGNq?=
 =?utf-8?B?dVVwTVR5RURBZm9FNVhSVjN1RzZpbmN4ZzY1YTdoK1g4RlpLMllIeDJUYTQv?=
 =?utf-8?B?TFBxL09abFhVbGZlbGpxZm42VnRKWVZZS05aK09iN3RRRlVzU21EOUhTQ3FG?=
 =?utf-8?B?eG90Sld4V3lGRHZEdzB5cmxiOHdZN2c1aXozRWlBN0JRSFFPT0NrRE1SMHM3?=
 =?utf-8?B?WGRJRjdPZGx2SlpOeWFwdVF6UHV0QkVXU3U0NTVvdVlrc1A1cXcwcTYzQUhr?=
 =?utf-8?B?YmVacXhEcHFtSFVZNmlEeUFDVVlraFVRQ2VGQTJnV2J5ZFRVR2hhRHVkaHp6?=
 =?utf-8?B?WjlsTUF6dEJlV09qWThucDdVeVo4ZWY5NCt1K3hENWx1MlBTN2hHdXEwb2NM?=
 =?utf-8?B?THpuc2duZ0EwamRVOU0wSE8rcmN0VldnOWp4dytYV3plZjJHNWZwMzAxY2hu?=
 =?utf-8?B?czIyeHJYYW9xUjhoaUtKRDZiNlBGSlNDalVNQ25iR2RwT1VTbTBzNEFaOGlW?=
 =?utf-8?B?b2VzWTlHbUZ5N29GRFIrdDREZUxmN2JLOFFtenJLU0JOV0RDUDIrbXdRamk5?=
 =?utf-8?B?OFdtUjBTbXFJcXZKK1d2SXd0c2c3YmhMWU4wOFhUWm0xWHhVbUV1L2s4ZmxG?=
 =?utf-8?B?ZUVYTkc5c3IvUmFWM21TWVFEQ0V3MmlHNzIyUTZzVmFnb3NTVTgrSXI5YlMr?=
 =?utf-8?B?ZDFwMWViRjJlTGxWd3RnYW5LY1FFc2tPT1lNOEFOSTd1OWpuKy95Z0haZkc1?=
 =?utf-8?B?WnNwWDhZMjJsYVZGM1ptSEo4WSt1OS9yNE9QZndMKzI4ZVVGS3U0eUVnMHJN?=
 =?utf-8?B?bS82MXMveTVGUEJtY2JxRk1jNm9BV1RocFRFazlEN28weVVLdnZ6L2ZtbUdU?=
 =?utf-8?B?dWdTUkRreTh6YjY1dHFxTUszRVdhWlViWnRyOGh1citDWDRTT0hLV1dJRHJZ?=
 =?utf-8?B?VnRObzltQ1hoeVNkVTVBM0Yxek54TXcxNWlLcDVoQkYzaCswMWh1OFNJanZh?=
 =?utf-8?B?YktIZlhwVFczTGExZGQ1bE1wUGZpeHo2VTdwYnF6OVliL0V0eVNaVU1MdnJO?=
 =?utf-8?B?UWtLZ0hyeTFVREY4MVd5QjhHakZIeEEwVFo1cWNlM0RkeFlGYnp5Rm56VnJ1?=
 =?utf-8?B?L1EwRE02b2hjOWNPTVE4NzlGL2h0aDc0M2VQSjh6OUUyOHZvMnlRd0VnVHo2?=
 =?utf-8?B?NCtTc2h3V3lGVDY3cnQrZWF3N25TQjVQeVRDaHRDSlUvN2s3R2g0bTdiT01q?=
 =?utf-8?B?Wjg3VkM3dWR4eFhjbTFRbm85TFljWmNpeHNhUXV1c01MOUxHaFArZXcydVRP?=
 =?utf-8?B?eVhGdHJiZ1hGNTB3c2NmdFFnSWw2RzcxUXJYWDRzQ3FJVE84UFI0NGFMUTR4?=
 =?utf-8?B?WWJ4b3B6MlBoNlRDY214aW9GblRCT2pkSmZTeStVeTNUZjhzanlmNFdqRnRJ?=
 =?utf-8?B?YmVPQkF4MUxOUTNSOWdySlVXQTRVME5tdmVCaHhrSSsyOGV4VlgvNWRYbElT?=
 =?utf-8?B?R1NQVWdSNDB1Znpra3BYSXNDLzY2OE5zZ2Ryb3g5a1gySXo2T1RqYTJnL25o?=
 =?utf-8?Q?3gZOVBDRhTQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWJUaXZIRnd5WDhLcEo2VUhyaSsvaVRjeE1TVTdsMkJXQWx0VWhCUlhHVFBH?=
 =?utf-8?B?TmFaR3c0dllKR1ZDSnBjd2J1bG9hdjIzZjkyT1N2d3VwcWpXMHpzeXBKWmZE?=
 =?utf-8?B?aEZUZkY3NkFuclA2VDl3TmlVY1VVQ0tKQVJpNmhHdDhwQVdjOTVJK3N1MnNv?=
 =?utf-8?B?SWRTMmtZQ05EMjc4Q0tITzhLWWhyZXRiOWg4UGR6cE9MUVB6WEZUSUZBa253?=
 =?utf-8?B?SEh3UitQSlB6bXlpbzBCdVllZmV4bWJhdUdNd1hib0NvUE8yZmRGaEc1OVZ1?=
 =?utf-8?B?SUU4SE9DSHdDcmpFRnN5blBxTnZ6Z2hwakJlWjF0TVF3Z0duV2t1aFBESEtV?=
 =?utf-8?B?VFNscFVZQmpQQUhnRWg2eU1RVDRjVFBjR055REtGSE5JVSticEFwUE9CZ0o4?=
 =?utf-8?B?STV6Mk8ydExtS1NlTmw2d2xYbnhKV0YvUXNLb2EyaWVEOEplUGRsMHRwTVRl?=
 =?utf-8?B?Zjc4Zmt6TC9kYjI1MU43eEQ4TTNIOCtNUFNGNzBuemR0L3VJOTJncEErc2Q0?=
 =?utf-8?B?RUNlRlBzZ2VPUkFyQ2FueTN3RVNsUWxNdkJoRzZGUWp5UU41NFRhS3VmWnRM?=
 =?utf-8?B?dlNRazRqRmVYMmVjcEZQekRiS0xzRXVsdCtZMEs0eEk2MjRpYXlDOWxjUmdi?=
 =?utf-8?B?eWk0bHVrdVBsYnVIUC9lWFRGQWpjYVhhRm5TK2FOeXFRWlFoMUNlazl6S3E3?=
 =?utf-8?B?RzRXN0dSclc2NithN3gyazhRTTlGSmJQcmJrRk1YTzAxTWhyeXhTSUowbTlN?=
 =?utf-8?B?bXRyUldRdFdmZHNVNTlCTytoZGNqYWpDalg3cGNla1dTeGNONzk2YVFzVjMw?=
 =?utf-8?B?cTErb0RTVXFqbXF0QjRQK1NSM0hjRVRwbkZMa0lkT2pWeXFJQTRLaU5vd3Ew?=
 =?utf-8?B?OGV6Tjlra1pRVnZ5M2Q2aWVFSENXRU9OUDlwaTdXRHJTTVdkUXNxU3FTekx5?=
 =?utf-8?B?bDA5RGRWTTNSZGVwMDRqM3dJV2Zjd21tN3pabTlZVE9mak40UkxReUxEaGNa?=
 =?utf-8?B?SXEzd1o4Yk0vV05LWUQwRnBnTzFhaXlTK1ZPTjQ5eVQ1MWNPemhFWVEvcWZU?=
 =?utf-8?B?cXVlSjYyS3ZiYmhJc2Z3MnkweXZmYzJRR1g0Qi9EWVd4SEovVW1nUk1UU0RI?=
 =?utf-8?B?bWtKZkpIa2lwVVhjTjNCOTVxRjB3WFFqOFFhRHZQWlA4WUJNL1BuTUVhbTl0?=
 =?utf-8?B?UFpWaUo0c0RNOGI5NHhqSTRQWjY2VWx0YUs3WS9IQU0wcHpkRlM4eWhzbzZz?=
 =?utf-8?B?VHNYUUg3SVAwNVJObm43ZDZpWkJGMDVrK2dHSGsxRTRkampzMjZUOGNEa0Q0?=
 =?utf-8?B?aVlEdmphY0Vmc3BKcVBzdjd4d0RqK0ZpOGhKS1lXa0N4T3pHYkRzbjR2MFZl?=
 =?utf-8?B?anZYZW5hY2p4T3BNcjJCZVBTMk0vazdRQ3ByaS8zZVlBOXVwYkJBbHUvM25D?=
 =?utf-8?B?RnZlaU1NbXA1dlpyQ1IvTjdTTUt5VHdaamFNUUg0bWlWK2Rvbm5rWjhvcjhP?=
 =?utf-8?B?L3RhVThUWVNIamVITWhzelEzLzFGY2swclU2S1ZnaDZDek80V0RrYkxTWERm?=
 =?utf-8?B?c2N3MkVsQnFrTTR1RC9GcFVjeXR1ck5xRURmc0hSaTJJL0NuU3BMVVN4NjFT?=
 =?utf-8?B?U2ExdjBZQzlUdm9sRnU5UFh6MEV3RUQ5U2JNU28vckkwYUJRQkdwQlJYZlNZ?=
 =?utf-8?B?ZUYrN000WjVLQXFReEU2RWlBMEp5RFdMMitmTEJHbHNzQXM2dHkvNis3eFRx?=
 =?utf-8?B?eHlXNzZ6REhMTjhmRzBoNjdCOUx1RTQ5QnZTZ0lmTktNcThJRGtwcDFOay95?=
 =?utf-8?B?VjZtZlloeDRkMlNUYXN0aDh0L21tY2p0UHY2QTdHZHprOTFUQ2s3dThOZFcv?=
 =?utf-8?B?RXpxNzNzMXErZjRFNlhULy9vSjRCRWVCaWxaMmZ3cnN3QXZoWTJKc3pPdVdH?=
 =?utf-8?B?SVNBTUZEaCsvWGxLdnBrekRnbXptNVgyZDVZM2lQSzl3OHY5ekEvRVBGeTNU?=
 =?utf-8?B?S01hOWNtUk10dWNsbVBZT3FnTzd5VXphR0FjeStmOFRIL2o0T2dYc09mYnZS?=
 =?utf-8?B?SndnZkluWW1SUHRLaGxNSWNESTN1cWtCNm5qNWdmRFlaVFYzcjZBYnZiVnZW?=
 =?utf-8?B?Mm1GYU8wMHp1RkpjRVlGdThMT1duL3Y1SjJFTEY4blBhdUd1SUYyOWVoQlNI?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c486f6-f20b-49f1-131d-08ddae5cd518
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 11:39:49.5073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0XmoBd6MD4Xzoc0vjX6vUXYEN2LcgjO6cnoNld14skQdYpb/Lot/xN0/PLZaXkXjQhPj1/pJs2wj60KvPIcWSRaiHk6iSjHPQwC17E0Oyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8449
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

Hi Sebastian,

> Fix a general protection fault in igt@gem_exec_big@single caused by
> passing a non-canonical address via relocs_ptr. The test previously
> used a stack-allocated relocation entry, which resulted in an invalid
> pointer being passed to the kernel, triggering a crash.
Did this happen as a result using freed heap allocated data?

> 
> This patch replaces the stack-allocated `reloc` with a NULL pointer,
> ensuring the kernel correctly interprets the absence of relocations and
> avoids undefined behavior.
> 
> A corresponding kernel patch to sanitize user input for relocs_ptr has
> been submitted to the i915 mailing list to further harden the interface.
I noticed that the mentioned patch has been met with some
pushback from the community. If you believe it is required on
the i915 side and worth mentioning here, then please move this
note into the section below "---". Otherwise, please remove
that part.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  lib/i915/gem_submission.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
> index 7d1c3970f..a03b2e369 100644
> --- a/lib/i915/gem_submission.c
> +++ b/lib/i915/gem_submission.c
> @@ -421,10 +421,10 @@ unsigned int gem_submission_measure(int i915, const intel_ctx_cfg_t *cfg,
>  
>  bool gem_has_relocations(int i915)
>  {
> -	struct drm_i915_gem_relocation_entry reloc = {};
> +	struct drm_i915_gem_relocation_entry *reloc = NULL;
>  	struct drm_i915_gem_exec_object2 obj = {
>  		.handle = gem_create(i915, 4096),
> -		.relocs_ptr = to_user_pointer(&reloc),
> +		.relocs_ptr = to_user_pointer(reloc),
>  		.relocation_count = 1,
>  	};
>  	struct drm_i915_gem_execbuffer2 execbuf = {
> -- 
> 2.34.1
> 

After addressing the comment above:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
Best Regards,
Krzysztof

