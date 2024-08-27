Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C695BC52D6F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 08:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865C189C0A;
	Tue, 27 Aug 2024 08:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="InI80XSy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E665389C0A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 08:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724746253; x=1756282253;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wqqy3akA1Di8r7v62kZUf4EadwDHEsPTIlHuPY/LxlY=;
 b=InI80XSyNS4G0LcPY3odHStsJsr5Ds57S7VHUcnTX2t8C1wwK5XNwnOp
 3mJOspAfzp6u+hygp9MTKZ/PN3KfqoK34WD0eFK4PtPh2scIHG9TtJZ5L
 3qRRR6EZiHGuucTiAlkSb/+dNG+YRVW5VQawuhGbNfvKrS1qqKfQ//xEd
 51laQTOaYvGNWapc8RWyPpdj6C7/77iewkRvs6wmly6T+5vLdGfvdDzyF
 18j9dHiYaxVVf1NgfHePIAIq173AJyJRhieUmtjm3ZbsOT+L72c3owcFJ
 hpGk1Mx4FKyHQuA2KRw2S+IQ+d1f8b7OHEBdgHGIxkl9MTJH1/QTrcojR A==;
X-CSE-ConnectionGUID: Gt68B8iDTHOnvbq2Y2/EHw==
X-CSE-MsgGUID: 2MKB+la5TTK5EbIcYqd4FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="34360224"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="34360224"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 01:10:52 -0700
X-CSE-ConnectionGUID: L8fM910GTLqWJzOLshXorw==
X-CSE-MsgGUID: GvUCyc4NSpGU7VnYaz0JDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62753060"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 01:10:53 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 01:10:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 01:10:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 01:10:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMYzsgFlWPNPlideKycwu5kPQejXtemhU6xEOerBsmFrnde2eEyCSWmPmc5uwjpDzg/STP9/FKOeUXOH1RTqxI+mmd78YWv1PkLK2QG1jgUorirGnTmkHrankLtpcDqOWVmBhivUYwhslUmrw4f0Pnjoc8qJQSPSELjvuzmsMqzfRD4ZfKVqp1ljYlQ/4zWvzXzn3KQ9XQXNoBwtEXDGg5N6luYpnR4uQkWWPsiGd1qn6xhvMty5p+/dVoka9/8xX1oNnKkWUnMKwo/RHcPeoMUFRwIK4cfhesD1DApiHExBT39A90whI198rmIVNICurvMpxDZnBgCZPwT/J3p1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvbAtenWvHLyQLi7Pl6C3XIvI2KnjmaoFniqKHh24Rg=;
 b=Oa4YHiheWzVwgjuL8puYeyWtZIN/AkKcdHl5UCIdVnQdwbHm4GnoflKe14dfgQ6mwpkEB45h7s7nVfUYrExzjTI087hBulywNkLqwRrp4KquKpx0FY+0n0UigY//6L/QVJAOIR76nbrKpRS1ab0y43XPHXya/Zybpdo4qsazrKVb1RPuW6fdHlgRjk6XFfNNt2eUy/yU6j9ZxjktFac8uhd5QAzj04eQ8cjqNcMhtUoq5VSaEfBqqyyNs1aObdjMqH2r0h8VIxeE4TGazDJRwhI56g4DppU4fx6Utke4xmMJ+N3ry/bap810xDn81tEsyHiHePVX0c5Q1fDU2jy2zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH0PR11MB4983.namprd11.prod.outlook.com (2603:10b6:510:40::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.25; Tue, 27 Aug 2024 08:10:49 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 08:10:49 +0000
Message-ID: <039e1cf2-4b52-4fef-886b-297c0b148ad4@intel.com>
Date: Tue, 27 Aug 2024 13:40:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for suspend
 without display
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <katarzyna.piecielska@intel.com>
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
 <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
 <172434871596.2055.1015145340873010177@gjsousa-mobl2>
 <4e6gyyd3qf7bfyrtwbun4w42clu55v7r5glgrfikstw5hs5xyn@wdfocxn3uqsg>
 <d5cd630c-314c-4dde-9f4b-6a3e213f4587@intel.com>
 <cbce7zwah7pkzabb4npk52b3vxhdzot2kq2ivvrj6bzvcz2zut@5xqpkltx22no>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <cbce7zwah7pkzabb4npk52b3vxhdzot2kq2ivvrj6bzvcz2zut@5xqpkltx22no>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::12) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH0PR11MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a3258c-6844-4d10-e569-08dcc66fc0d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWdXV2hOdndNajloRTA2bEpaY3hjdHpJclZJc3RQaW5VQzF2aDUrcnVlODFJ?=
 =?utf-8?B?WjZ2Y2dGa3FGR0owVVBad0diRHpXWVFSdE5TVE1mc1ovZENpYWdoVlRHcVlp?=
 =?utf-8?B?NS90Y3pvS09RVkdnOWthV1BsU0xSMmFwL3BXN1NBSHBOUXZrTk9wN2NlM2NQ?=
 =?utf-8?B?NXFYVUc3WVk4UUdTRzc1YTJxRjVLTVdEQnhMQ2Q5VHBkY2hoR0NJNFRMaSt1?=
 =?utf-8?B?SFdKUVlNVkNvSGNVZzZ2ckVrbDlyWk1WSmhQN04zWnNkZWcrQ1J1QXJPTFl3?=
 =?utf-8?B?Q3NISHhHeXJCdkRKbmRtRUFpNVQ4Yk4vMU9wbFJFUjVQcEUvaUlCSFVOM1pW?=
 =?utf-8?B?SHlJV0ZzRklpSXBXQnYzcUVBWG5BaDJyQS9jSmlxRUVkT0lUbllFOC90aGZH?=
 =?utf-8?B?VXM5clQ5Q2wxaGpVdUtGVUVLbWxwUnVjMWhRdFh6ZytadlpUNzdxWDVZQTVp?=
 =?utf-8?B?ejlnbWYvdlZHWEQvaDdFaWVuWk9DVWxxOWY2L01YYkZJMEQ5TUllcnVDeDBy?=
 =?utf-8?B?YXJNWWYycnZSQnlxQVFVTlZ6YVZPZi9yZlFLM0wyTlErQ2t6Z0lWOE5PSzN5?=
 =?utf-8?B?dURYUjRQNUJXL0FEeU4rT3ROTWFvV1h2NStHa3FUTmZqL2x2UzJlYXhtUWxN?=
 =?utf-8?B?dGZ4RDlYYjFKdmgyWDlnUFZwcmxiNzg2dXNOQ2RxVUYyMDlDUm15cFgxNFRn?=
 =?utf-8?B?ZEtBNHQwKytZdjdNZEI1VkdYa3I2dnNaam1iK2x5WW12ajlOQnBzN3p5TmRl?=
 =?utf-8?B?YVZkcmp0NVpLVUJtRmxGRnBkSXJ5RElCOHVhVEFZNlRmazlKUGNsZXRSZTdX?=
 =?utf-8?B?MkJqbGh5SDR6N01YYjVEcG1jTHV6NmgwcWFJQjNjRXJXV05LcU9uV2NaSXAy?=
 =?utf-8?B?SEdTWTNnd005ekhzb2pmVlBxVCtNNEpDSnJrQ3luUGp2WDFtWFYrYjI3cDFN?=
 =?utf-8?B?SU4rV2ZzeXUzVFhZVVplMEs5NHBlalFiZG5ERWFhVHNFTFJEVUdRV1EvQXQ5?=
 =?utf-8?B?Ykt4TzZYUGVncDJuZW5OMGFWQ01YOHB1Ujc3UnlicDFqRWZyNHZ0QzBiaStC?=
 =?utf-8?B?Z2VwUlBvbTZMcFV2WVJLZlJXcmRlT2hxV3RQbzE5MzhaMUgxRG84Ti9GL25u?=
 =?utf-8?B?dkdQR3RHcGhaSXpxT3RCWUJobmNnTGg4VHFFaU9hK1ZYMC9CSjVEWWxWS21T?=
 =?utf-8?B?R0x5dVBrdzkxblFWSGwxUGpxNTdMWHVlamY1TjdTSTlodUVYSGtUU1dYNkVQ?=
 =?utf-8?B?bjBUdUxYUnIzcUVFNS9UQlpPOThnNHJYcEtYUXo2b05xTjZ5ZjB0c1ZnOHBX?=
 =?utf-8?B?MGNvQmJ4QTRuNndPV1RFVElTaXB0cXpRb2FEZkUvdXdaa3pQQVFLSDlibUt6?=
 =?utf-8?B?UzVCeFRCOEFuNTJpdkdvVG9BN0U2QktEME1NMGRlSGh5UDVwTEFHak9ZQnc4?=
 =?utf-8?B?cTRIYmdOVUIzMmRWWm5VV0g2Wkx3Q0d4clY4N2RuMGRuc3M4dDk0T1lWSDhO?=
 =?utf-8?B?NjhTbzI4b3VqcjhaMDJoZE9oSjk1YnMwQWtpQ001eTRlVXZLVUNKT093ZVdL?=
 =?utf-8?B?Vk1ibFp1WGN6NlcwNkJQcGZyUlUvdjM4TVVzZEtjQnU4cXdjQW5HbzloTWl1?=
 =?utf-8?B?eXNtdk5udWtyais3ZFBHWnJYcGEwMFZEZk9uZzZPR3dXank0TTU3dTc0V0FC?=
 =?utf-8?B?cktEVDZTcjRtQ3VMcEJER25scXRqM09Md2RrZFNZWGw2TkpUK05ReHpJVDk3?=
 =?utf-8?Q?Dh0TOp/9l8ccdcAS6w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHJhaWJnamhBckNvSFBHd2JMZkZNd1l1dWVsZVA2OTdMckl4aDQ1c0wzVE1y?=
 =?utf-8?B?b1lDRUJoRG1NZWlwRXFSVGFtUDc0ZE1DdkFtdk52NVJGeHovWTRDSHorZk44?=
 =?utf-8?B?UlN5RXF4ejBwTVZaVnNzaW1acUU4TW4rTng0YnFGSjYzc0hyaEY3Ny9sN2hG?=
 =?utf-8?B?ZDhUbzViYU5wS1llbnBVRFp0TGJQNUZBVi9wbFlvTW4zVEFXYWRXdHh3NHpr?=
 =?utf-8?B?eGNSM0I0Z2JKYlZ5OThrMk04Tk5EQTAzMkJza3hkY1pmeG9kcHhmajgyeG5y?=
 =?utf-8?B?NHAyRm9xdFR1U0c5WElWYmluYytJb1BIZEplT1BVZGlGSkRxazJTclM5VWx4?=
 =?utf-8?B?SWJjMXBreVFUdFhReGdoeDR4ekIrNitScVJxVjFlaTMzUVYrK2dkZjUrRFor?=
 =?utf-8?B?U2FzUXkyWS9VVUdOMHJLbWZTSzFqTU5nVGRFZHVPTVVSZXE0c2YrRzJ0RFpI?=
 =?utf-8?B?Y0tDM2V5RFVsd3pIcUJZdS9xUXh2VVFleE1iQWUybkpQeUxpU2lRK1ZzOTMv?=
 =?utf-8?B?THhmdFFkSkxNT25aeFpvNUhIS3VVeHlvamlsaVp2bUtuaHBiczM4eHJVeEUz?=
 =?utf-8?B?UUNHT2EySUsvRUZkVkJRcmhZOFQ5R0R4ZWR1QTZIcUxRbTZ1QnNSVjYrRHRy?=
 =?utf-8?B?Qi80bXliYlo3eFYxTkxhU0JuM053dFRtMzFlTFdabU5nbDNWV1VXREFxOWxt?=
 =?utf-8?B?UzlMR01XWW94dFgrU3EwQXlmUDJxdldGTTd0cVFKOFI5YkhhV2dyWVUrb2xw?=
 =?utf-8?B?L2xScjdIdGNMc0xuMjRNM2o1a1ZNTjdOTGE4a01xUEFsZGpxNHFlSlh0eTQ4?=
 =?utf-8?B?RS9uc0NhYzFtSVNPVXRBUm1jWTZDKzdXczJRSWp0ajAzcHl0bWJOUmcva3Nw?=
 =?utf-8?B?N0NFelZ2MXRBdDRmeEhPUXUvYzIrWXRlSFpLdFpSUkFSclk2aS9jZGRpODE2?=
 =?utf-8?B?OURHcGhnMEx2dHUwOEIyWUNCK1UzTEFFSkNHQVlPWVAvVUJiZHdFdzMzbWVt?=
 =?utf-8?B?OGxUMUJSN1RtSnBrOU12VXVOZlRXakVjenNwVWlSclJVTzFQeWlPUkQ4cUVY?=
 =?utf-8?B?Rm1HS2c3UTM5MXo1S2JQVFN3N0w0VFNWWG4vMTZ4TUw5SWhSMHZVYW9hVzl0?=
 =?utf-8?B?Z1g1c2trNEhkZ3dGU2VsbTlVdFlWWlBlaFZrdWdsbW1DcDltVzBoKzlmNkln?=
 =?utf-8?B?WEhHZ1dyNDV3M2JrU0UwcWZNR09EN0lpWkFkeElQdzlveDBrcytiMGRxY2U2?=
 =?utf-8?B?ZVNENHRFNGVBZVdybzFPZkJhOXAxOFdBSHptc0FKMGk0bnpseDZMT3BEbkla?=
 =?utf-8?B?RHdxY0dXcG5ZRXlneFN0N3Rpam9tLzV6ZHpML3FDdEFVWWk0U1JSdDhEeHky?=
 =?utf-8?B?QmVzby93NDUwUkd0dnBLaHBvQjMreEg5ZlRCR3ozMzJ1OC9mSGl4QmYwOFVH?=
 =?utf-8?B?V2tuWGxoeU1GRVBsR2ErZWZ5QktzUUQ0eEl0azZ1RVppdjVkR3lidGw4aU83?=
 =?utf-8?B?MGxxSFJEVkpEL3NGRHlSNjNtREVyN2htMnZEQ1VEVkZ1bFlMdUc5Q1kxNGMy?=
 =?utf-8?B?NjM5U2c3MFhQVGtodU5TZVJLeVZjQk10d2J4OTFXTFJFR0dXcFdEUFhYZUpF?=
 =?utf-8?B?UlV1dUQxQ1RubzN0OXdqUExzc3BDNUdMRnFidWt1My9WSTRWa0xsanRNQmxG?=
 =?utf-8?B?UnBFcWNKZE52NlN1K202UzNyR2d5Q3Fld3h2MUZ2Z3lRcEs2UVJybXY4bUV6?=
 =?utf-8?B?NEpVdyt6YjNuQlJVUjQ2WXIyU0xQaG84TTY2SHJzNWhBQzFhNGxYTi9BbXJ1?=
 =?utf-8?B?YnJSTUdvcWthQStOd0s1ak5VVHZtLzNVSzhVWS8zMmZoUHU5dmtjY1l4Q0Zs?=
 =?utf-8?B?MFNNQ0hPT2E4QXZ0ZlhzclpFcWUrUTFISitSSjExUFowK1krVE5uTXlza3Zz?=
 =?utf-8?B?UUY5c1k4NW15VnB4VTVZWkEzaFhXWVB6c0tQTmMxUjJmbFI3bWU1RHNyVlNO?=
 =?utf-8?B?dmlzQmNmNk9sNVlrSTFmWXlsUSttSFF3OTdkZFVBbUY5K29WR0lJdHdzalQr?=
 =?utf-8?B?RkxyYmowNTZkcFdDWDJsZ1lXTXlRKzNuQnZwaU1UZ3lQYTdTemZ3NEg4OWxv?=
 =?utf-8?B?dnlwazIwRVlIZGJUQTlMMXpIam9JcHI1T3VLUmNzRUJma1BCTDVibTZPejNw?=
 =?utf-8?Q?L+mGZSlzMPG5/jR9SffPQZk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a3258c-6844-4d10-e569-08dcc66fc0d3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 08:10:49.1415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8lAHZoToXaUeo/2iyP3FcBA1V5e7/mnGuP5cOBd7uqsSiDcLql3W/IKsp2GPkWEKoBfy8wArzGpoaZkVfkYUoLgSG90y1eeXgnGxhtwTkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
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


On 8/26/2024 7:27 PM, Lucas De Marchi wrote:
> On Mon, Aug 26, 2024 at 04:42:06PM GMT, Sujaritha Sundaresan wrote:
>>
>> On 8/23/2024 2:31 AM, Lucas De Marchi wrote:
>>> On Thu, Aug 22, 2024 at 02:45:15PM GMT, Gustavo Sousa wrote:
>>>> Quoting Kamil Konieczny (2024-08-22 13:52:43-03:00)
>>>>> Hi Sujaritha,
>>>>> On 2024-08-22 at 14:50:58 +0530, Sujaritha Sundaresan wrote:
>>>>>> Add tests to validate basic execution suspend/resume cycle
>>>>>> without display module to rule out display related issues
>>>>>> from the suspend/resume stack.
>>>>>>
>>>>>> v2: Add normal reload cycle after running test (Anshuman)
>>>>>>
>>>>>> v3: Rebase
>>>>>>
>>>>>> v4: Change commit name/header (Kamil)
>>>>>>
>>>>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>>>> Acked-by: Katarzyna Piecielska 
>>>>>> Katarzyna.piecielska@intel.com<Katarzyna.piecielska@intel.com>
>>>>>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>>>>> ---
>>>>>>  tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 34 insertions(+)
>>>>>>
>>>>>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>>>>>> index eee89428c..1623a56c7 100644
>>>>>> --- a/tests/intel/xe_pm.c
>>>>>> +++ b/tests/intel/xe_pm.c
>>>>>> @@ -17,6 +17,7 @@
>>>>>>
>>>>>>  #include "igt.h"
>>>>>>  #include "lib/igt_device.h"
>>>>>> +#include "lib/igt_kmod.h"
>>>>>>  #include "lib/igt_pm.h"
>>>>>>  #include "lib/igt_sysfs.h"
>>>>>>  #include "lib/igt_syncobj.h"
>>>>>> @@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
>>>>>>   * Description: suspend/autoresume on %arg[1] state and exec 
>>>>>> after RPM
>>>>>>   * Functionality: pm - %arg[1]
>>>>>>   *
>>>>>> + * SUBTEST: %s-without-display
>>>>>> + * Description: suspend/autoresume on %arg[1] state without display
>>>>>> + * Functionality: pm - %arg[1]
>>>>>> + *
>>>>>>   * arg[1]:
>>>>>>   *
>>>>>>   * @s2idle:        s2idle
>>>>>> @@ -681,6 +686,7 @@ igt_main
>>>>>>          struct drm_xe_engine_class_instance *hwe;
>>>>>>          device_t device;
>>>>>>          uint32_t d3cold_allowed;
>>>>>> +        const char *opts;
>>>>>>          int sysfs_fd;
>>>>>>
>>>>>>          const struct s_state {
>>>>>> @@ -757,6 +763,34 @@ igt_main
>>>>>>                                            NO_RPM, 0);
>>>>>>                  }
>>>>>>
>>>>>> +                igt_subtest_f("%s-without-display", s->name) {
>>>>>> +
>>>>>> +                        if (!drmModeGetResources(device.fd_xe))
>>>>>> +                                return;
>>>>>
>>>>> This should be skip or save it (as global?) and run test on headless.
>>>>>
>>>>>> +
>>>>>> + xe_for_each_engine(device.fd_xe, hwe) {
>>>>>> +
>>>>>> +                                igt_debug("Reload w/o display\n");
>>>>>> +
>>>>>> +                                igt_kmsg(KMSG_INFO "Unloading 
>>>>>> Xe\n");
>>>>>> + igt_assert_eq(igt_xe_driver_unload(), 0);
>>>>>> +
>>>>>> +                                igt_kmsg(KMSG_INFO "Re-loading 
>>>>>> Xe without display\n");
>>>>>> + igt_assert_eq(igt_xe_driver_load("enable_display=0"), 0);
>>>>>
>>>>> This param was renamed to probe_display, see
>>>>> https://patchwork.freedesktop.org/series/137096/
>>>>> tests/intel/xe_module_load: Rename enable_display module param
>>>>> Submitted by Lucas De Marchi on Aug. 9, 2024, 5:30 p.m.
>>>>>
>>>>> +Cc Lucas
>>>>
>>>> And disable_display=1 might be more appropriate, because probe_display
>>>> would simply skip the probe for display?
>>>
>>> Good point. For platforms with display, is it expected that suspend 
>>> works
>>> if DMC is not loaded? Otherwise we will actually have to touch display
>>> to disable it to be allowed to suspend.
>>>
>>> Lucas De Marchi
>>
>> Hi all,
>>
>> Thanks for all of the comments. The need for this test mostly stemmed 
>> from
>>
>> ruling out display as being the reason for a lot of the random 
>> suspend/resume bugs we see.
>>
>> So what do you think should be the approach for this?
>
> what are the suspend/resume bugs we are talking about? Without analyzing
> them, it's hard to answer if they are caused by display or if
> probe_display/disable_display will help at all.
>
> Lucas De Marchi

I will try to find a specific example but it's most the suspend/resume 
incomplete

bugs we see regularly across most platforms. The aim with this was just 
for the debugging process

for those to instantly rule out display as a reason early on.

Thanks,

Suja

