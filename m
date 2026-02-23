Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960D1EC1112
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 17:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E21B10E085;
	Mon, 23 Feb 2026 17:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1anaHGN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515EA10E085
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 17:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771867490; x=1803403490;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4889Yofw28sdUqNTLI+xW4MTPuO2rhhQjlftoPpOaGo=;
 b=T1anaHGNa4/QWYaU1hSZkpJDwRrDXai0WKdFxYVKcM9/LGvKfHNnOxIi
 aaVVNgsV/MRsKyZhS8J5j5FYu9kH9mzvbXzZGsVoHFzNzqQkxlGIZOBI9
 5oHf/hZ3thsqsdnfoR1dOLOQH6F4YSPF1oew1YTG48ATm95ERP2Gc45vR
 e57VQCLmpgTzdQn2hrNQQpG5I3pcjH+phCOcLhbwI7bRH/XaPG03T0ute
 aBN8IqB7n9e6AafAO4G7hffxLPop/gNSv+2j8qkDuJU/AdqUc0qsiHJca
 XPGLq5DswSgxscFVIJ4Y4oqKayWRzpiu7jma4PgyllMnVCKOswafXQO/M g==;
X-CSE-ConnectionGUID: Q/a/bimTQRu7WztupewAqw==
X-CSE-MsgGUID: 6KyCJaj/TfCwjbzfArFiSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73048393"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="73048393"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:24:49 -0800
X-CSE-ConnectionGUID: bPdUs2nJSderLt/R6MeOFw==
X-CSE-MsgGUID: oTyNP7nUQ9qYomJH0mLgIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="253357636"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:24:50 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 09:24:49 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 09:24:49 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 09:24:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJ1M6si/M/vvTr1pw+36hqpSgY1aI2rkRjlEKefrSC+cC6bXep9V28gpfPGIdoe9Bv5ouT9NloLsId5XvTKBCltY9f7zuit7RR0VpQMpz32QiPj+MvU1otfHs4edAmRTX3BJ1KRUIKfDBOr4t22LXyuXffpqA+hchWiGFRZx6wQZHcpqWaRObhLTZADQxJHvKBrzbt2+Vs8WNDQwNd3C0OcuAYGpuR/q/6SFAyDJFcDO5sNfWXTJW8/GglOiuvvUY4cDr/RR9kIWcNPK2o8ofQEQ24i9HY9lZscSqg6P1HCeojNOnz43Zaup/TVUfJ4BvWdmEzyzCU/gDaz33u/n7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqbTSvZrHGAMplL89EWYwT+uELY9dmW6a7j79YcFCv4=;
 b=qN1cXtFaQgoQdY8T1T5389N1tba8vmBnOInnjF7MksDD450DufEQpQL88ViOf/hnMQWyasweFbI5LX3KaZKI7Qn+TdtWd64ujinSjfD46SSYoQWq+86aA2MvN9A84Lateg8HY7HXPZiNai5azyRuNYFkJJKQMHxcEV9MxZ6/DFHCoFPvqre0yyDArmTuujvV36GGIuc16h9XtTn2ohRC4cHoS0SIKORG+ibDW9QCrZRaxEnftIB8li+zRNX68+aDJQ/WGIRyfQ5IUjl/ZZgXgblg9O0WKEXjJS2qdPCkX9BD+WmvXyuC5HFSgtCQXWAQGgnDfKXp4UTtFB6B/lWFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 17:24:44 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 17:24:44 +0000
Message-ID: <8e845be6-52dc-4dab-876b-f5a444636726@intel.com>
Date: Mon, 23 Feb 2026 22:54:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 4/4] tests/kms_flip: limit number of outputs wrt
 suspend
Content-Language: en-GB
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260213084930.252273-1-michal.grzelak@intel.com>
 <20260213084930.252273-5-michal.grzelak@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260213084930.252273-5-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::16) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|DS0PR11MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf7b299-f3ba-43cf-62f6-08de73006fa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UER0NGRNeUYxRVhUcmlhZW1UdTVuTzQ0SVU3YWtQczI1SkpsRlBIRFRrT2JJ?=
 =?utf-8?B?VGxvcUkyTU9nT0NoTlB2Y3kvSjlPS21TdlY2ckg1T0RLcEZhM2hCazBmZkV1?=
 =?utf-8?B?Sm1NallwaUNjMlEzZEMyNTNyMU9RMWk0dlB0VWZTcS9XYXNOTDlrMSs4dlJP?=
 =?utf-8?B?Rll1cTBzd0dwN1lESlZCTVVHQWZMWTdYdzV6MENPN2lyNUV0Zk80RTBoQnNi?=
 =?utf-8?B?NUQreGRpcmJzakhMb0V4WFlmWUcyck8wajhXbVl3RjZIbWZid3d5U0NFcmQ4?=
 =?utf-8?B?b3c4ZTlLRzVDQnNTaHhRZnNiRWlIT0d5b0YzWkZJL1BNd2R3RFFoL1RTM1Jh?=
 =?utf-8?B?WTZOcXFlaHpmbDcrOFBsR3ZDRlY4VGF1WHVxU3I3OGtneFlWbW1tMU5TbHdo?=
 =?utf-8?B?bzFHMG5VZEltbjZmbURzNUROOE52TWJPYW9HRFFudDhwMWpMWXM5eDRxYkRZ?=
 =?utf-8?B?ZVoxck5JTi9UN2FmcGcxc2hEYW1iUksrbHhlczdmMFBJbC9OTXNTRURFTDBz?=
 =?utf-8?B?WnBmQ3ZNbjVmcWZac0t6VWY2K1Z1a3dLQ013UU96M0Q4dlpEUGphZzZKZ0w4?=
 =?utf-8?B?MDlVM0FKVGJCQmdqbUVpdnlYTU95bFBLM3JGVUZjOTZMWkJQbVJhVnpJb3l1?=
 =?utf-8?B?UkFOQWZnMStHRlRRYzRyNEd2M1NhZzkrQnZPN0FtS1RwY05HWFJsbWRxZWtD?=
 =?utf-8?B?elcvUzZzSTRSYWNKcGZBSENzWnpOMjR4MEZ4bk0zbHpyWG9jSVRlUnFTU2d5?=
 =?utf-8?B?c1FERy9DM2RWQ2hEM3g0REMvWkFOS0pPNU9DeWV6VGJ5am5KZ1E2SWEzU3hw?=
 =?utf-8?B?djRYMW1lSDNWMXhpY0czbFpoNndJK29sUys1Y3MrQUJWbHNIYTNhNEFLSWdH?=
 =?utf-8?B?SWxENldidWVtbU9SQnVzQnBpUmQ4eGhzVTlwUm5KWXorMk5tWW9kL3IzQzNL?=
 =?utf-8?B?STM2V2JLcUZDM1F2RHhOT2tydlRnMVczbUQ1S083WEVXZkR1TVY0ajVhL0Zx?=
 =?utf-8?B?NUM1d1FjRTZ0dEh5WTlIU1Z3T1Z6Y1U5emdXK3M1SG9LMzdtdXlDbFJNVWox?=
 =?utf-8?B?MjdsdFkrRUhzN3VtT2twUnFZbkE1OHpZa0V6dmxJdlZ1WVVXdEFZdUF6NnNO?=
 =?utf-8?B?dkx3UE1KdW5laXpzNHJqS3lsbjZoL2VIS3NncUptdUlkdnptNzB5L0ZxL1R5?=
 =?utf-8?B?S3VYdFNSdDJlZG9pU2lSbHdReXg3T0hORGY0RytPcGtOUUVVdDNWZlpwVTRj?=
 =?utf-8?B?ZmgzV3Jsbm1wVXNFSW5Uby9kYXRwT21jWXhpdTQ1eE5iTG9vV0ZlWVJHMXM2?=
 =?utf-8?B?YklaTy8yQnlwWU5jMlpxUEpoQlV1M3g5b1dYVzdmOTRlOGpGaXVtZ0ZtNGNi?=
 =?utf-8?B?SFFWNGpRWENwSDlYV0hmeHJoSEFpdlQrWG9EQ2F4UTFCb25WdC9IOHA2RTlZ?=
 =?utf-8?B?clRDWXlWZHJoMElhMjlQZHp0TXhaTVkwYlRQUDNFQldaQVo2aGRVVHRZU3Uy?=
 =?utf-8?B?Wmw4ek84RkQzNDA4Ym1GNTFCVEVGR25MRWc1cHBkaWxEL3gzTlF2R0NCQXRx?=
 =?utf-8?B?bHExaHNVdTBHZ3VicmhtM2J3bjI1UFlOdWZ4OGF3bCttRGd0RkN5TzZ5VU9p?=
 =?utf-8?B?NDBwbS83MnhTWGlIcVlsT09zNVE0ZmhDa0Y0YXlNenZlUDg1aUowZXhsTjVo?=
 =?utf-8?B?WmNSL3JzUUVIYWFNcGZES3ZHdTZVU0RvT1JDMzJVWTFsaTNXdXhIZ0l3clV6?=
 =?utf-8?B?aW9tR0hmem85cDAvTEJpNzRiT2s4YXZyR01vYmsrMnNiUURKM3M3emZ4bEll?=
 =?utf-8?B?bmtRSG5uVVFFT05WeitGb2JCMzZLNlJoQlUyUHNmSGNocEVkVzk1d0hZWWFP?=
 =?utf-8?B?N1Bxc1pUMlBlc3hGcUY4U2ttMGdYcUliMmtLdXlDN0V3a0ZQVThoZ3hIbm5r?=
 =?utf-8?B?dUl0Sm9pZVpiam94dlJ1Y1lrc1dYOUQ2YzhRT3ZhbEpxTkNRWi9FeldjYW10?=
 =?utf-8?B?NTBBWFVZdUIzbFJrbTNGeFRteTRaUVVTVXZySDkxaEVXWlpLdWFVMllzSDFW?=
 =?utf-8?B?MDNsVndDWTVJVk5pNFplZkNROUczTXFSYU8vdTBOVjc5S3Z5SlpMNkZHeVR6?=
 =?utf-8?Q?RKZ8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTA0Y1V1bGh5Sm5WTlJ5UnY1RVVMSlJnY1IxaEpKSmJtbWRnL1FKNTFQZW01?=
 =?utf-8?B?WTFuMjl5KzFEUlphTUIyZnpDeXZjQ0ZNK1RZeVZjZWNtVTMvamNEc0xJTlNM?=
 =?utf-8?B?RGhoYTIvVXN2K3MySmNTM0xnMVV2Q0ZNMFRCSGNESWJYQkljRkVrbjJkZHZD?=
 =?utf-8?B?MHY3S2tTcmtCSWd1NEdISFYxcVVFTmhWUGwzTFBFQmtRU0NRMXpXOWlUK2Nw?=
 =?utf-8?B?YXVsMVdnMmFobE8rdW1WSXBFRmtIMXFKRmdYTnFRemtrWHJ3MGJCTVdXY1dN?=
 =?utf-8?B?ZDZ1bEFYalUzMXY2VWR0RlQ2U2ExQlF2U1Z4Y204Z1VBZmR2eUt5TUZwdkpj?=
 =?utf-8?B?TUhrMEgyT2FRa2psblJDdEF3TDJ2dU1MTGN0QTB4T0FBV1VSQWFPN1A4dFZL?=
 =?utf-8?B?NXZ3b3ZBQzcrWFRLNnNFUi9nVlIvN0ZQZHIxUHVNYzlML2hZaEkza2hBd3Js?=
 =?utf-8?B?K0YvQ1p0TkoxRFdVNUk2bFcrdTVuMDdjcEw1RkNYamZMUktFZWhKZENDN2VP?=
 =?utf-8?B?Q0lYVmVDVWU3amhzL3o2bThYRDBDRHZ1amFtMjNnMnhRbmR6RU9sbm04V3or?=
 =?utf-8?B?MGVqTzZBQ1pVKzArZ3J0cGV4TW1OMXEvdzhEUGFlTFUrWmc0UDNpOXZVZ1ZK?=
 =?utf-8?B?TERSQlBIb01tUC9pVDZmUmxkY2U3U0oxejJ4Z3NaL25UMVZ2QzNjc3ZuelNV?=
 =?utf-8?B?SDJGOWpkU3NadGNsbGpPbmtRZ0dFUjc5V0FWdWJwN0FNLzVJSnprNXowNVZv?=
 =?utf-8?B?elE4YndvMXpRZmI5dWF5OTk3TldnQ0lXY2hRK3ZHRFNhSktQcmNsR2YzWnBx?=
 =?utf-8?B?a25SQ3BiUTNlcTgwbDJJclhrVVF4LzNERlR4S1MyL0tiUUM4dEFzbkNmWjNw?=
 =?utf-8?B?a1EyOEpsejBjMnlUSWlTaDZvTlNEUk1VMFJoWUpqZ2J2V0FqMjcvVzh3YlJY?=
 =?utf-8?B?cDN0YktYeTBJeUdIbHZlTDY5WEkwUTFKVkxJU1NoWFlGc0FKbjJTSXpsUXNJ?=
 =?utf-8?B?MXN2NW9ja05RMHNkUE45OVlkdlA0NCtFZGxDV1NHY2hNWEJiT1Q0UDl1QnhO?=
 =?utf-8?B?czYwSUlTRk5HenpFUnp0SjV3cktVb0hNcVhJd0Rlb3hZMm1KWERKbFdOTmFo?=
 =?utf-8?B?SnoraS9WZ3l2OG5HcVpGQ3lSRlRYWXpzMnZzemxlSWFUL29CeHZtdmFqZktS?=
 =?utf-8?B?VlRZb2ZWYlh3RGxIUFd5Q2s5S0hoUlpCTktnV3lSSXcvam9SS3J4RXY2VnhE?=
 =?utf-8?B?czVSK1ZpTE1XejVKK0t3VTdUbjdqR2FzdmpEUEdjdStIM0xHU0JXeGMyc3Rr?=
 =?utf-8?B?dmM2ODREYzF4OS9DSFUwcldGWHphRDhpalM4aFIwbndwVHk0SjNEdW5LV1B4?=
 =?utf-8?B?TGR4Rm5nYzA5YWVJc0RwVHRCS3AyenBkWmRPR0taQ0JWV21OM3FyQ0t3WlRX?=
 =?utf-8?B?RXAxcEh1LzBVQ0JVcnFmNllPdHlqbTVnRFVxaGZqSEVIMGtoRTNYSUdua3NE?=
 =?utf-8?B?c1UyME1Hek4rVThhQWZ6RCtTTzFHRjI2bTZ2U3FZOWFEcjgyU3k0Q285QUdr?=
 =?utf-8?B?d0hBdFNsbGQ0Ym05R2ZpNFZEbTZCNXBSbElzNVFFb3JwQzVYeDh6M3FrbVhQ?=
 =?utf-8?B?N2hRWE9oMThhZnlXeUJUeERTN0JUaDloblNZaGZuTFUvUnNESVZyUjlDK0FM?=
 =?utf-8?B?V2tPK2gyWlVPcXo2RUQrNlBsNUtVa3B0d3ZmV2RGTjFiR1VUTW9naHU3QWpr?=
 =?utf-8?B?ZkphdGcxQ2FLellhd0JQK0JETE01WkNlbXpQM3A4T0haRGFDa2dBRGYyWGg5?=
 =?utf-8?B?TlhkRVd3MW1ncHo5VXBVcnA2WFhVR21adVdLcFZ6dWQzclB3WnRXV3dSK0Ix?=
 =?utf-8?B?TlRkWWtIaWcvbEhTc0daS1lnQjB2aGl2dUZ0WDlQdHkzRVVvbklRYzJ6Zlky?=
 =?utf-8?B?K1ZUWTZXUXhETGZBVnNnUlpEU0dwVG9FSHJHVUd4T2RWLzIrcE5kL3B1MW85?=
 =?utf-8?B?T2ZQb29yNWtDbWt2LzJaUEEzUjhsTFBHQytTckZOd3pMalZJOUJsdWRqL1Fj?=
 =?utf-8?B?a1JTaGpURU1Jck4wZG1CRlJuRnlUcWhpQVdqK2RxanJ0dDNFL1J4dVlaWktm?=
 =?utf-8?B?NlY2Wlh5cm5OaEdKUi9sM25WSWNOZlc2RWsvdVJnWnRpa3YrNm5MNDZyOEM5?=
 =?utf-8?B?NjBrWXkvQy9VcUNaMmY0UzluVVllRXFXY0JGVWJ2dG9Kblo4d1l4YjJ4a3U3?=
 =?utf-8?B?N25Qb1VNUnQzVUJqeEdLblZLbXAwQ0E3VjlJbVFheUZMVVQ3cDhNcGFpL2xn?=
 =?utf-8?B?cEZralZSZjJrWCt0TndGZGVWd3VkUUh6czJUTFZzRDl4dEh5NHZNb0NlRGc4?=
 =?utf-8?Q?bfh5qDgLtA+xDuZc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf7b299-f3ba-43cf-62f6-08de73006fa8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 17:24:44.5897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xGnFkoAOgRTTyHxkA9Hwv0KRL9u4l5freZNk6aUvHg3bRNVCQeN6qw4jkBkkHeYI3CYWnSJmg4kiPF/naQtK2h4tmu+XFTdea+mBNoXH+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7997
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


On 13-02-2026 02:19 pm, Michał Grzelak wrote:
> When running suspend subtests on single output, we can still hit the
> timeout by testing too much outputs. Default to testing 3 outputs. Add
> commandline parameter to run on all outputs.
-->Small wording nit: “commandline” -->  “command-line”
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>   tests/kms_flip.c | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 1c8495ef1..80e42cabb 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -264,12 +264,14 @@
>   #define RUN_PAIR		2
>   
>   #define PAIR_LIMIT 		3
> +#define CONN_LIMIT 		3
>   
>   #ifndef DRM_CAP_TIMESTAMP_MONOTONIC
>   #define DRM_CAP_TIMESTAMP_MONOTONIC 6
>   #endif
>   
>   static bool all_crtcs = false;
> +static bool all_conns = false;
>   static bool all_pairs = false;
>   
>   drmModeRes *resources;
> @@ -1822,6 +1824,7 @@ static void run_test(int duration, int flags)
>   {
>   	struct test_output o;
>   	int i, n, modes = 0;
> +	int conn_count = 0;
>   
>   	/* No tiling support in XE. */
>   	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
> @@ -1887,6 +1890,10 @@ static void run_test(int duration, int flags)
>   			if ((flags & TEST_SUSPEND) && !all_crtcs && n != 0)
>   				continue;
>   
> +			/* Limit number of displays run */
> +			if ((flags & TEST_SUSPEND) && !all_conns && conn_count >= CONN_LIMIT)
> +				continue;
-->  here can't we stop testing once we reach limit by return instead 
continue?
> +
>   			memset(&o, 0, sizeof(o));
>   			o.count = 1;
>   			o._connector[0] = resources->connectors[i];
> @@ -1895,8 +1902,15 @@ static void run_test(int duration, int flags)
>   			o.depth = 24;
>   
>   			crtc_idx = n;
> -			run_test_on_crtc_set(&o, &crtc_idx, RUN_TEST,
> -					     resources->count_crtcs, duration);
> +
> +			connector_find_preferred_mode(o._connector[0], n, &o);
> +			if (o.mode_valid) {
> +				run_test_on_crtc_set(&o, &crtc_idx, RUN_TEST,
> +						     resources->count_crtcs, duration);
> +				conn_count++;
> +			} else {
> +				free_test_output(&o);
> +			}
>   		}
>   	}
>   
> @@ -2070,10 +2084,11 @@ static int opt_handler(int opt, int opt_index, void *data)
>   }
>   
>   const char *help_str =
> +	"  -c \tRun on all connectors. (By default suspend subtests will run on 3 connectors)\n"
>   	"  -e \tRun on all CRTCs. (By default subtests will run on two CRTCs)\n"
>   	"  -p \tRun on all output pairs. (By default 2x-* suspend subtests will run on 3 pairs)\n";
>   
> -int igt_main_args("ep", NULL, help_str, opt_handler, NULL)
> +int igt_main_args("cep", NULL, help_str, opt_handler, NULL)
>   {
>   	struct {
>   		int duration;
