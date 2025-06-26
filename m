Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EB9C7EE33
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 09:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEEC10E842;
	Thu, 26 Jun 2025 09:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6fZyeda";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37D510E842
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750930356; x=1782466356;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3iPgyI42StECy15lH4lu70zBYUyuYzvOv4NlYsFIxmE=;
 b=S6fZyedaulBXcQEQ3qIuMQhdwlj0qUDNQ4dJ0g59kGf4c6wXDJbT93ID
 yYiWY5QAtWyv5EXwwOiiaVYMNFjIVa6YhVBKgp/s+45+O0GR4uZhLtNlS
 rdcD8M7uWO0pahjD4NpDiLr2ueM+pVOPETf+ayxI3rz5gQ1W50yZFqwo9
 g2fzQBN9vRxwHVYY1Ts6qPrkPBpfzvbspldTf1QdGJacGiIpVQv9CufNQ
 aPzQYHMVZHnLGwAM2xdcTqNsEK8XDmVntpKnInZpsyrVxi0rumzKkdj0b
 Slc7nRp77OW8qWH6JO9VzJZJlYYkwoPcVwV3+bPTgfgx6w/MOzUuClhIl A==;
X-CSE-ConnectionGUID: wS1JK+GYTmmL6cky+g2VkQ==
X-CSE-MsgGUID: OWqX0VowRG27R2oznLIGSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53184776"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="53184776"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 02:32:36 -0700
X-CSE-ConnectionGUID: 7LrcX6r0RDmQcXorILRLxA==
X-CSE-MsgGUID: QQbzH2SITCm3ztNrn0ciEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="152971186"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 02:32:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 02:32:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 02:32:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 02:32:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/8JMslSaNWGQXSFDG38pKMmiKVfaJzJgR5xXOoP5XGvPU6GP/rHtE2zsNkDlRha1uA9m1qSwqoOAYXLd5j+YQmHX8C8VAonLZkium2kAYhF1g+Xr6vriBnD6W5u87rmRO6lgWmACEN6ADYydDL/2YeNcr9rWH/oglzzk6ZO1UJUKtA7yJRLxmRSG/Q60s693LDPGUD2roUPu0ztdtB7o5vixW5uF9Djdqkqr527D3zxEpSjIVxQfsK3iPrvTYTeYu8khtV6ua2nHshjxdgcKCNUkkzwYbIP9C76V0ZfspFNKZvhFDgqa8xCBelIT52J393hXmXdBQ9iZcSB3qRf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMSPnYByAReuNntVJFY6EAH7dg6uBuCeMfzOQCkCD10=;
 b=g0iDyGZ6EbL4vvyD2zsE3I6v5TCG87dAEtTNvVyPl1Y+Fm+QKmF3tLsAQsTMaeOBdxBQ9/QPrT2Qjzb8m7BHVpR5pjc2xAVkoCWW86tIahgM0eLlplBc7Lw6zhtLaN3yZ5vOdwkV6QRnm1WbGTA6DetFV2uubn1xeoh8FNrHMChTaEfQVXuCMj41ijm0DQeX0JHJPzblK1kKxhsSZSg38heDqjxvRA0nGwrLogDWsLGM4DfZHBWAwjB2aph/J3ciQJ+Dck/2JtizjA6TDIQP9C6xPLvZdbiUpnfUOJvXF8HZuAoP8D37VBdKZi0IDzAAf/fTV3aYTTXGpdc8HPYYlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.25; Thu, 26 Jun 2025 09:32:32 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 09:32:32 +0000
Message-ID: <b989f9c8-9d3b-4baa-ab8d-5f915e33ed4c@intel.com>
Date: Thu, 26 Jun 2025 15:02:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 3/5] tools/gputop/utils: Add gputop utility functions
 common to all drivers
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <krzysztof.karas@intel.com>, <zbigniew.kempczynski@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>,
 <umesh.nerlige.ramappa@intel.com>
References: <20250626091626.3760324-1-soham.purkait@intel.com>
 <20250626091626.3760324-4-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250626091626.3760324-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB4855:EE_
X-MS-Office365-Filtering-Correlation-Id: ff4ff893-c3dc-4d59-4dd9-08ddb4946025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Znp5M24vQ1lDSnR1eXRkMStWOXFNWHhFWU9RV0lWNVBJK3ZFMGo1ak00SmtF?=
 =?utf-8?B?QWszbDQ0WHNrWlplM1F0OXh5aVozQTF4ejJiU3UwaWh3K1M4WlhsVitmczl2?=
 =?utf-8?B?bHRieWNuU3NIQkNYb3Q3VC9Ud0VObEZYbXUrSXliM2tiL3ZCYW9ra2xmVzkx?=
 =?utf-8?B?M0plWXUreGhrWmdYM01WMDYwSzZraGc1K0FIbVIvdjhMWVJqc3cxTit5eUNu?=
 =?utf-8?B?OEZBN0dNYVJ6RDF1eUFab2dLT0tpUllxT01UWHV4ZXluOFo5cVRCbDZQTzla?=
 =?utf-8?B?Z3hmb05WWDhnUXZjR2x0UWFGVnJyZk5xb0pZUjAwenQ1dDVUSWxSdG1ob3A3?=
 =?utf-8?B?ZGgxMWJFYVhJd01HRElrMDFSRkM0Q1VRb1VrYkx2U1p6MitEd2RJdkE5ZEV6?=
 =?utf-8?B?VHhpNDBydi9JZjlmd1hnZGsvVFFBUGREQlZEK2c2OWJWME1BMFIreFBXU2Ro?=
 =?utf-8?B?Wjd2MDNOdjd4aTQyN0pxenNsQmc0aEF0TC80TGdjWUxnbVZkRGdnQm1QQTJw?=
 =?utf-8?B?WVgvWklJaXc4eVBja0dXemQ1amNLZGY4NUVYRTROZFdpOHRzTFBvVG1Ndzdl?=
 =?utf-8?B?ZDBiZktEYnpJTU1Zb0FpckNqYytEc3ZRV0taWkE5cXV4WEJjZFg2a3prVEhF?=
 =?utf-8?B?bzlxNWl5RFphUTRDRVZFS0xGTUJqOGtQZG45TTdOMDF1YStiQ1kxZXRUL0Y4?=
 =?utf-8?B?T1JOMGJRL3lSVjdEOFA2dXkwS3BoTkZITmMySDNsUXhrQ015WExpUjIrQm1M?=
 =?utf-8?B?WWY5eTJuVUFlOEZ5Y2pITGVHVlkyVEtSc3p4aTVxQTZDSkZDV3hmU1BUZUVS?=
 =?utf-8?B?MVBUWG53dEsraE8zZ2dydWxjbngrL0NoQkd2QmJsUzhFVUlBQjBPcEJIUVV1?=
 =?utf-8?B?ZVpKbEh1TWVMS3pzUExoSTdnZ3REV3FFTlRhMUt4NTdvd3BIT1I5ZUVOMFlP?=
 =?utf-8?B?Z0pNdXI4aFJCOFdEK25vVlE5UjBncnFob3JvVHB6Y2dOQ3lUaWdJa0NxUTh3?=
 =?utf-8?B?Z2FHWnZXdlRnWlBNdmc0UWExVDBYNFhHT0N6WHN6dDY5Vm1MYkhLcXdrVlJB?=
 =?utf-8?B?dExEd1FYajdPc0xjL1hWT0IxRkhzdnBSS1Y5MW5hWU5LdnJGbWFEa0ZBS0FG?=
 =?utf-8?B?S09sY3F4Z0ZVSVFxUWNoWXp5MWUrVWo3dThpdmVtZllxVWFmNERFRkZvR21k?=
 =?utf-8?B?Q0xUZS8wT1Y1M1A2cDF3dHdrYnRLeEhDYUdMbnlGdlRnZDc3a2V0dlF2cjYv?=
 =?utf-8?B?UEdiNEVXQTkySVBwZVhJS1FpQ1ZWNTBxaUJoc1ExdWtyWTl6cGNFbVlCSUFr?=
 =?utf-8?B?a3g3NjFNWi9jYXoyeVRqZ2lhWDNoQU1mbHdxVTN5UjVLUjk5a1N4UHg3VW1j?=
 =?utf-8?B?VHJQeG5VZUZEVXAxcGszUG1wZVVMQ0xXNjFqRzZpSmJPV0NwY2p5TFNyVkVZ?=
 =?utf-8?B?NGpNSHhsNURTMUt2U1dCY1lKV3dHRVlTa05nNFBuVUJxVE1nR0M0Y3lqRzM3?=
 =?utf-8?B?VDJXWC96SXVRNmh1SyswcEhibE4wVm1ObC9DWTVYQ2pxVjJ5eEtkY2ZuRHNo?=
 =?utf-8?B?d0p0WERhTUtWK3NVK25pWWhVUVF1aEQvMTd0MVdkQ1N2a2RReG9mMlhhYktK?=
 =?utf-8?B?OG01TTNINHVuU0MxSExSUXZraHFHWWtUaStlbktrOENmVmxDbklVUFpZT0RW?=
 =?utf-8?B?Wkd6b1F6bU1lWnpkY0E5UFlNd1Z4YSsvVHE0V1BKSi9qNGhCNG5HYXJYL05r?=
 =?utf-8?B?WXJSQVp3MHR0R09Vamc1WXB6RHlMNDF5VUtpSWNCVHhuVDR0OVNXTERrZzIw?=
 =?utf-8?B?YzNYUEZmTDVUc0h2bjlzYzZnZk1teUFHcjMrTzdvWHFBTXJreVlpb1R3M0NV?=
 =?utf-8?B?NGFJV3I5d3Q5VEg0Q245Q3d5RUpETll4QVlzSVRQczlRRTRnQjlkN0RqVm8x?=
 =?utf-8?Q?NDCN0diWNA8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW52ZHhNUDl2SHVPSDdFMTNHYXRISmM0TzZqekx2eEh6VUw2TG14bFBWMEx2?=
 =?utf-8?B?UDFBOHVoUTc2RUNTRUw4L3ZEM2ZXN3dqSHZxL0RiSXJFeUVITmJUTit1OTk3?=
 =?utf-8?B?OTIwODlzY3JiM3pFb2tyNkVQeFBNWVRmS3hOd2lnNFV0ZkVkdzJYOXJpaVp6?=
 =?utf-8?B?cEloczVNcHJSWG5EejFMTDVpTXJWRGlQbFJOZmhXa0IwcWZyUmdRVTlmVDVw?=
 =?utf-8?B?cWdvM2VPTm5MeGZVemZqS0l6YjI3Rnd3Q3VpdHRrRVpQZ1E4dTFnL2kwTmpQ?=
 =?utf-8?B?WG4ra2ROMUNCNGpSZGNYc0pGRmw1ZmovN0lMV212dyttSDJyQ3F5S2F4MTE4?=
 =?utf-8?B?bktKbnRyNGdVTHc1dlZ5R2pJak5KQ1VINTJNakZHM1ZDYkxVMG1KbXpxVFRZ?=
 =?utf-8?B?emswbnFxLzNQSjBLOHQxWWZaK2p0YUtLUXErOHBiNXRDVG5NSTk5bzFyaTdm?=
 =?utf-8?B?ZmNpUTE4K2pKaHgySTZQVU5iek1VNjA3YXZIektPWTlDV1gzK0pWcnZpM3Na?=
 =?utf-8?B?SFV4ay9Ha1ZCYVBFcGFEMVBGZGV6U3ljUDFFWUF1T0dFQkV6VFhLc0dHU2xx?=
 =?utf-8?B?eHN1V3p6MnQ2L0hwckdKWWw5ZXM1MWl1MGhSeEg0UnE5RXBTckFiUzJna1Nl?=
 =?utf-8?B?bVdJTFV3SThYbWRYcUwwc2g2aFlRbTdKQnl0S1hFYXU1SlBWS2I4QWh6dW8x?=
 =?utf-8?B?VmpkOXJlWFovUWVjcmJpL0lqNG5DVjkraDFpRzlvbnd4TmFwYlFaY2xkdmNY?=
 =?utf-8?B?eFFDM0dQNmlUWDBoMXBMMEFZQXNrK0Y0Q0d6c3d1R2VUc0tUbGE0OGFHeWpW?=
 =?utf-8?B?UWtLMUZZNjdmSk5kOHBLWWFDaTc4eWpyZGZyVHdUMm5BbnorYi9pakhMTVQ5?=
 =?utf-8?B?RHFSb0lDbTJIakFwemlwZWI2ZCtvLzhCSCtnZ2lxL2ozUll4SHowNUZWODhE?=
 =?utf-8?B?NDF3TnNERUQxWnJkTmxGTlZQeWRDb2xhakZIczN5Y2xyLzhUeFVRTkFsVktr?=
 =?utf-8?B?ekRaaVBjWWNHUnZUeTlBYUFoajE3Vml3dkRqTUduWXBFQXM1R1Z6R0pKVHJO?=
 =?utf-8?B?NmIzUjVnZUpzRDd6a01xaXFoc0c3R082RWp5WXJTVVN5eGlad2h3dUhhSGhh?=
 =?utf-8?B?TjBFQVNBemlmTkhxNE1UeUtmckhoVUlES0RTQndKVUJ3bmtuTXNjUUdId1V3?=
 =?utf-8?B?OFVQelY3VTRmeDdJK1ZrSWMxa1dKVVZObUIra3NpcWN2WnorK0UwM1pIeWRI?=
 =?utf-8?B?LzdwdWtjUXI4ejlZNjc5Z1JkM3FMQU9wZEFzWnpiK3hBS2ZjNVhpcGowV2J1?=
 =?utf-8?B?Y2hrK2hHRWMxU1FTWFIzMHF5b3NhZnJLaWNnTFRHb0pKRFlEenJ5U20xM3Ro?=
 =?utf-8?B?NjE1Umx4ZVA2U2duWXA3UGNnL1lWRy81ZEtRcFc3dE5yNDhpcy9iZFdHbSsz?=
 =?utf-8?B?VFlHUnpDSjZ6a2IyTnRaMER3WWhSMjBHZkNtVUdYZTVQNFBMclZrd0xLaHpE?=
 =?utf-8?B?bFJDdHZZZXlDVmVTN2llempOTEVXbGMzb2QvcmprZ2FhMVNnME41R1NpNVQr?=
 =?utf-8?B?aXhaK1hTaGhsUDBiaDc4NXBsNTA3bDVSZXZiekVGUk40aWU3NGpuTkZLcy9D?=
 =?utf-8?B?cTJHZEV0L0VEUUtDbzltZ3pkUjZxT0JEQWtGZ1pLUGpKODJSaWJLSmhMMHZL?=
 =?utf-8?B?aFRCQ0RrcnNsRExCWkRKaWxhbWczWkNwdDg4UnhrOVg3Q01WcWlaU0RYNG9S?=
 =?utf-8?B?T1doODZaeFhTTDRDNHBDdk5DUi9qYnR1TEFtcTBXcnpkMzdzc1Z4bi9ZVVN1?=
 =?utf-8?B?dG1tVmVYanZ4YThEQk1EZ0ZTcUFUVUFuK083SWFOdk1DbUhXZFdIb0xUUlB5?=
 =?utf-8?B?bnN1amN3ZXIxSWZIa1piK3o0cm5ERHQ4UHZGaHF3OGdJdktCa3dDWXBJL0p3?=
 =?utf-8?B?UUd0Q1VPSXdwUU40Q093K2RNMWVpRUVMY1RBRkhhTnByRFB2aTAzV0xFME8x?=
 =?utf-8?B?aUUyUXVQSkpoSWZXMFV1b1Uwd3Q1cnYzYlJycWt5bUtXOFFFVkZkUEVVK05z?=
 =?utf-8?B?aW4zUEdSYVpDakp1elM4V2FZT2J3c0FiQ216Q080YlpjcCs0emYzc21CZXF3?=
 =?utf-8?Q?b/TUA+idpkfEy07ysuWUj7vMr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4ff893-c3dc-4d59-4dd9-08ddb4946025
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 09:32:31.9109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaU3za9b0PKqv0+ZAecCagHK7msWl77u5V5EBVp6Ao8BJMFp5fQMFR1V/WGg6m1sPvoYRxTm3vOUoSbAEWbLrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
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



On 6/26/2025 2:46 PM, Soham Purkait wrote:
> Implement utility functions in gputop for common operations and data
> handling across different drivers.
> 
> v1:
>   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
> v2:
>   - Remove magic number. (Krzysztof)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
>   tools/gputop/utils.c | 51 +++++++++++++++++++++++++++++++++++
>   tools/gputop/utils.h | 63 ++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 114 insertions(+)
>   create mode 100644 tools/gputop/utils.c
>   create mode 100644 tools/gputop/utils.h
> 
> diff --git a/tools/gputop/utils.c b/tools/gputop/utils.c
> new file mode 100644
> index 000000000..7f260dc05
> --- /dev/null
> +++ b/tools/gputop/utils.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include <assert.h>
> +
> +#include "utils.h"
> +
> +static const char * const bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> +
> +void n_spaces(const unsigned int n)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < n; i++)
> +		putchar(' ');
> +}
> +
> +void print_percentage_bar(double percent, int max_len)
> +{
> +	int bar_len, i, len = max_len - 1;
> +	const int w = PERCLIENT_ENGINE_WIDTH;
> +
> +	len -= printf("|%5.1f%% ", percent);
> +
> +	/* no space left for bars, do what we can */
> +	if (len < 0)
> +		len = 0;
> +
> +	bar_len = ceil(w * percent * len / 100.0);
> +	if (bar_len > w * len)
> +		bar_len = w * len;
> +
> +	for (i = bar_len; i >= w; i -= w)
> +		printf("%s", bars[w]);
> +	if (i)
> +		printf("%s", bars[i]);
> +
> +	len -= (bar_len + (w - 1)) / w;
> +	n_spaces(len);
> +
> +	putchar('|');
> +}
> +
> +int print_engines_footer(int lines, int con_w, int con_h)
> +{
> +	if (lines++ < con_h)
> +		printf("\n");
> +
> +	return lines;
> +}
> diff --git a/tools/gputop/utils.h b/tools/gputop/utils.h
> new file mode 100644
> index 000000000..00befed56
> --- /dev/null
> +++ b/tools/gputop/utils.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef COMMON_GPUTOP_H
> +#define COMMON_GPUTOP_H
> +
> +#include <glib.h>
> +#include <math.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +
> +#include "igt_device_scan.h"
> +
> +#define ANSI_HEADER "\033[7m"
> +#define ANSI_RESET "\033[0m"
> +
> +#define PERCLIENT_ENGINE_WIDTH 8
> +
> +/**
> + * struct gputop_driver
> + *
> + * @device_present: It is set if at least a single device of the
> + * respective driver is found.
> + * @len: Number of total device discovered of the respective
> + * driver.
> + * @instances: pointer to the array of discovered instances
> + * of the devices of the same driver.
> + */
> +struct gputop_driver {
> +	bool device_present;
> +	int len;
> +	void *instances;
> +};
> +
> +/**
> + * struct device_operations - Structure to hold function
> + * pointers for device specific operations for each individual driver.
> + * @gputop_init: Function to initialize GPUTOP object
> + * @init_engines: Function to initialize engines for the respective driver.
> + * @pmu_init: Function to initialize the PMU (Performance Monitoring Unit).
> + * @pmu_sample: Function to sample PMU data.
> + * @print_engines: Function to print engine business.
> + * @clean_up: Function to release resources.
> + */
> +struct device_operations {
> +	void (*gputop_init)(void *ptr, int index,
> +			    struct igt_device_card *card);
> +	void *(*init_engines)(const void *obj, int index);
> +	int (*pmu_init)(const void *obj, int index);
> +	void (*pmu_sample)(const void *obj, int index);
> +	int (*print_engines)(const void *obj, int index, int lines,
> +			     int w, int h);
> +	void (*clean_up)(void *obj, int len);
> +};
> +
> +void print_percentage_bar(double percent, int max_len);
> +int print_engines_footer(int lines, int con_w, int con_h);
> +void n_spaces(const unsigned int n);
> +
> +#endif  /* COMMON_GPUTOP_H */

