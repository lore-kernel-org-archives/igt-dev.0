Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966D4C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 08:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288E910F9F0;
	Tue, 23 Apr 2024 08:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLZP6ml4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A4410F9F0
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 08:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713861029; x=1745397029;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=IwoNT26NgdbVBfJNO9AteGZePVIAmEkDWCdwRONA/MY=;
 b=NLZP6ml4f2Oei6b/bbBqgFXcXyGFKpQ1mERplnbiF+HJbxpQPn6Xn/Hv
 EWilkNaCoGhQSqSkXR4URbpT9GYWO030MRgbVjzm9jQzfBz05qnFffr4i
 ZmhNCe9D4RcbrFQSbV3ulmlZKu7quAz7+KCVin9aGE9pHqwRUhiEjTra/
 o7uANLd/3CY343tuCykMMLBjDfC440mo2nR5ylv8ty/RZZJhw3AwQx5lz
 xd6Ly80zWkNIprojoxKV26FGyOIiS+Nf66bfd4JBCKW42P+kk2hxyFd7p
 VetwBJ5V2huWGZxollcHtR80AHussL3NQhklrLhzlPFkzRt/joFdFq4z+ w==;
X-CSE-ConnectionGUID: cvuES/TJRtGqHg56iO25CA==
X-CSE-MsgGUID: Ch1V6bX1SbOLI6WYcHBNJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9599587"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9599587"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:30:29 -0700
X-CSE-ConnectionGUID: Pbot2QKMTnyT69AsHlYKzQ==
X-CSE-MsgGUID: YO7+/jTqQaacxO50390Tyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24306808"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 01:30:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 01:30:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 01:30:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 01:30:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 01:30:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocYVTI3FNLYIPetF32CIb29wnMrQ67CR3UGeMLGML7PAi72uqQqSA1Ivg2dKQjuvkvKlj/iheHyrPRnWlJonHtCDygH7uZtZ8WhMyv5bAlEw5hH7W6CjY55+M8Tv/rMdoR3GgApfl8adp8NUY2nXRPw/r3aKhb6wUSR28gKSJj5L8nIR86VlmJU570hjMw6kiWAS2GotrmCuidw08YSUwuciZ0urIhrJ0A0oXbr89VWZpSz9K/rgVpaCGxl3ea3/ljVnocFy0TSPFH99goBtCVT192VUeLiAcjMLZ1KxxLjpYK1kUGAG2SKeXrl/TBfnnQjvWbd/j7XSK/FM03jhQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwoNT26NgdbVBfJNO9AteGZePVIAmEkDWCdwRONA/MY=;
 b=NlmlHnIfERVlbbAX3BVRpRu8/KUQAiRUP6aqaC8K/14RchKH2za+tdi8CiImuh1KeyS5quHIVFIKGPh1sczYT7PwmklN0kfC79PI4yyyPHVTmNwg5Fp5sFfKXw/lhzAVTxpeVuCEtjdupFhoItm5SEHIZteQss+1i7gX4Pg93B7bilHZBeRXiN0a2T44fDvgHVg7kVQ0SGj3Ef1iimVLOrskXR8EvoVOCuYpjkZMGRka1PR1eMfxyrL2YeAB7CxzCpmb7ZkBzyDArcO2RZMju/BkA5rsblnfqACNmR+hK0q3Msx4+GcKkcLstUK05wUIxsvsNpb7+4WogvttSl9brQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SA1PR11MB6663.namprd11.prod.outlook.com (2603:10b6:806:257::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 08:30:25 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::1124:dd10:9706:3784]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::1124:dd10:9706:3784%4]) with mapi id 15.20.7519.020; Tue, 23 Apr 2024
 08:30:25 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] lib/intel_batchbuffer: Be ready to use xe2
 render-copy on newer hardware
Thread-Topic: [PATCH i-g-t 2/2] lib/intel_batchbuffer: Be ready to use xe2
 render-copy on newer hardware
Thread-Index: AQHalUyeY2mmIPkwO0eFgF24uZLWLbF1hl8A
Date: Tue, 23 Apr 2024 08:30:25 +0000
Message-ID: <a0a7117ef110b1b0d6cb63f24d6aef1e9702a77e.camel@intel.com>
References: <20240423070449.150518-1-zbigniew.kempczynski@intel.com>
 <20240423070449.150518-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240423070449.150518-3-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SA1PR11MB6663:EE_
x-ms-office365-filtering-correlation-id: be37825c-e560-4dae-45c9-08dc636fa000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?aFRoWDZrdC9PdkxONC9oMjZ6MTFVWURvNUczOUlIZ1FQZUs2cmxEMjlrcmhh?=
 =?utf-8?B?VWVYMWgybE1DQmZNQ3ZjWGVIYTMzTHFaZW5wVEJPTDRCTDgyUGd1Y0xPWkox?=
 =?utf-8?B?bVdOMWFiZGhDUzF5STRMVHYrL0hsSk5yeHd1U3VkNzNZRXY0YTg0ckJKNlll?=
 =?utf-8?B?eG4yY2VoN1NuZHdDS0V3ajJTY3doMmllMDl4Wi9EeHlvWDJmRXFkS0g4YUxw?=
 =?utf-8?B?V2pBNm90MWJ5K1dsUjZINENoRzRoSzROUjdQOWk3Tjl0emdzMjdhZW9Nc2Jx?=
 =?utf-8?B?VnZRZTRTcFVtVVhFUzBZMW1zVUdqMldKbi9rbEwrRk9GaUJEV2V3S2JKRk91?=
 =?utf-8?B?aVIralNtbTJRZTVFU2RnQjFmcjZTL1FBd1FmS3NUZXdDemxGbUYzU3N0cW4z?=
 =?utf-8?B?akRHeGhYLzJBeVZzQ3Bkczc2d3JQWk1ZbkZuQzg0Q1NmUFRodDZ0TFM4RHBJ?=
 =?utf-8?B?K21KUEpsNUVQWlN3andta0ZLK0RRU3JYSmlCRk1ScDhqR3hxOXNzbHMyRE1z?=
 =?utf-8?B?MnhxTUFNekhxWHdscWpnTDRwVmQ0UFRocTdpUFl3VHEvTEY3Q2VIU1ZWVnlZ?=
 =?utf-8?B?cTR0Q21USUZhcUlNbGxTcmpieENSZFVzbHJYN2pWSzFKdE9MN3E5NHQvdmRw?=
 =?utf-8?B?eWMwSVB5YTFkQjd0NVBIcXptVC85NHFIbzRrKytZaVFvdWU3RGJwK0NLQnFu?=
 =?utf-8?B?b1FTTklSKzdHTTk4bWdwekRzQVlpU24zKzE0U3B4bjZRbGF1SlBkUzJDTjJL?=
 =?utf-8?B?M0pzVS80T3o3cmZSbXlUQjdwbEdSZTZYSlE4cEplY3lLUTJ0RitrSmZQV0VC?=
 =?utf-8?B?YkVGYUhzUWhLcGZSSXAyTWkySklUK1RObThRZDhKeXRyMWRvM1BJZ3Ezam9E?=
 =?utf-8?B?ejJWaXlucFplbm40VW1MOTNyRmlQeFAza2xSeWdreG9JYWZFd3dZRlhBZEF4?=
 =?utf-8?B?MnhBbmxmeElpWGY4R3h6YlB5RWZISXJpMkVyQzV2NUxsVUlwb1dadml4ekdh?=
 =?utf-8?B?a0RLTmtENEp2ZklONUFTNnU4WEZQNFI5Uko0b2pTZ25jVGt3K2wwU29TU09H?=
 =?utf-8?B?bERaWVBUeFM4WkNsWncxMkdYMmV1K09aKzV5ZU5RazNHeWxUTXArTkJMWjUz?=
 =?utf-8?B?K1FiWXUzakV6dW9heXlMR2ZIRHlBTlRGaU5qdnkwdERWWEI0MnVTeHJlSE1Y?=
 =?utf-8?B?ZjJiMjZwMHN3WmpRZmREYmJQTzVSbUM2elhHYVF2eTlaQUZLbUU1MjdKaWYv?=
 =?utf-8?B?OXlUSGQ3U3dkeEdaN2FGQ0RwenRTRVRBSUJYM1JKWDZncWN4ejNSODlkcnpK?=
 =?utf-8?B?V3M2VUFrN2ZUQmdqREFJYW1yNitkUzVQbkd4L1JpWWx4TzNJQTA4TUpMN0xm?=
 =?utf-8?B?bzdMV3hHZzRTS25HVTZTUmhwN2NOdXlZekNYRktUZ0thcUMzRmdEU3h4R1V0?=
 =?utf-8?B?TnduYmdUZEtwNGpYZnRkRGFxaWxXMCsyTXNBbFozS0lzQTVnUm5ZMUloOVVa?=
 =?utf-8?B?RmpSOHRiSmZoL01TT05CNWxxcm1BVzN5UDVmSEhnZEViYXVudHJ3VVZJV1gw?=
 =?utf-8?B?OUI0cE1wZ1cxWmpPZlNXN2k1c29wUVpjUTIzYVBxVHBMbUphZDVrZXBHeDNn?=
 =?utf-8?B?dDNxZlZPeGYraTcvL3IzNEdGY2todWt4aUhNMXp2QTNMMENxVjBkM0JvNk1H?=
 =?utf-8?B?QnZvMi9vRVpmWFBuR0RsVlMreHlIL1FUMGwxdjI1OHZlV09CK0RrdHA0U3hD?=
 =?utf-8?B?enBFbWYxK3Y3UGhOaDZvaVVzWGhEMHR0b1E5cmRzeUJ4bTN3aThlNVJ0YzZ0?=
 =?utf-8?B?Rys0QkVCRlVnUFlNaEZQdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UURFVllpanZOR1hsSmZqUEpnN3l3bzM5eGU5L3U3T0hySTIwOXY1NUMwVlBk?=
 =?utf-8?B?NGJvZ1c2dTZHU0kybHp0RnhHdm9JUitrRi9WVC92N1JFVnhGaTFsSWFmcElt?=
 =?utf-8?B?bGdiNG5QWHBsMDdUN0pRTEZLVStHVGRLdnNtS25oanVjZGhNeHhwTUpNeVBS?=
 =?utf-8?B?OGRRd3lqcU5SeWlyZmY0SXN0dHdXY3BRZXJ0ekJDR0IrQ2ZWQ1UxVXhJQ3Mz?=
 =?utf-8?B?bTBJTGNicFVxMXc4a2xicU16UVNlRzBtQ1RHbUh5U1hFVnVlL3Y0QUV0dVRh?=
 =?utf-8?B?dlIrZk5qSExSRHNUaTJhR1RJNDRld2pLV3BHYXpUZEo3elM4WkhOenA1bW5C?=
 =?utf-8?B?VXc2TzAvMkRLKzlKdmw2Zm5GS1lGWk1wQTNqUmI1c3Q3M01TZ1dva0ZVNGpw?=
 =?utf-8?B?akw1dEh0bnNPYWpjZzhVQ2x1YU9EckpILzNHekppcHB1czM4ck1TQmk2WkZs?=
 =?utf-8?B?TFcxS01RdW9rNmx1aVROa2lQM3ZIdFpHOVQyR1NDSkJQeUFFbkFjM1cxUFhZ?=
 =?utf-8?B?aG1NMVZBMVYxZm9PNnJuTHBYbjRwR1FYZmlKMGJSSEQwVUp0UkM3WWUyN1Vx?=
 =?utf-8?B?VkVzQk9PcDc1UytUcmFDNnhVNUlHSHQwdW5ZQzFmdUpOa2JLK2Vpb1ZRNE10?=
 =?utf-8?B?UDlwMlgwM1JZVHlWY2JOeE42VlhOa1gzWWtid1E4Um1qVWdaZkp1MzVmeGNz?=
 =?utf-8?B?WTMxN1RZemFOY3VIVmk3WDRiNXF1QzN5QndJVzBsTy90dlJodnZXL2FlUGFp?=
 =?utf-8?B?eEloWXhDeEVLZHl4bFpReERwRzlGU2ZjcXdiVHd2Z1ZLK1E0SE1LRzk0NDRw?=
 =?utf-8?B?V1RMcWpZZU50T1poeTJtcTdyMEkzVDUwMDNuaUpTNXBMdk05Rkg3bXNvN2kr?=
 =?utf-8?B?dy8weXR3T1YyQXRTU0YxUWJGY3R0K0JkMDgvTCtENEpCZHRhNVBOMC9ocW9U?=
 =?utf-8?B?ckZNU2hEMWU1eE9FTXZaL3YyWGtpT21NNzBWSHhhTm9oSExZL3Q2SzBqZlRQ?=
 =?utf-8?B?SXo2aUpBVkRKMFlrcm1NQmd2Tmh2S2dHNVYrTEtUaHZ3L3M1ZXRQYng1NnZW?=
 =?utf-8?B?NXpTSytFWEVlVlhWR3dwRTdXcDBQczFWV2lScjFOTnRuckxFYWhia0NCbkhJ?=
 =?utf-8?B?Yks2dStXQ0tWWWc3V0NaM0JmUFkxR1lIbmFYTG5Mdnpwb2FWbXE1U0dWSU94?=
 =?utf-8?B?cDRES2UyUWNWaFo4cFVTK3U3RlAyZnIvNlpUTDhCc0MwSzhaZ3pIdUV1aStL?=
 =?utf-8?B?S0pLREk3USsyZGIxME00WFdXdm5yRW41Y3ZMNGxQYlhML21DZjJudnl3OU9r?=
 =?utf-8?B?clk1bmFFZ3ZkUXhKU05Hb3cvcGE0VW5hdVlvNk50S2FtNkFPdWlRUnlHQWtS?=
 =?utf-8?B?Q0NqNTRFd1RTWng5cC9kWVRMZXhyTzFQMWs4aEFwTU5OcFZ4ak9MdTlDVmh1?=
 =?utf-8?B?dzJ0eldFOE9BT3NpSU1Nd3dXT0NBL2hCR2NZcmxlVGVlczE4UzUxY3NyU2Y3?=
 =?utf-8?B?L3I0Rk81cjNHOTk0cnBCYmI2NitybGZZZnJmU1hRK05YdTM0UWRkMTNCTmtj?=
 =?utf-8?B?VTFpTk14UmdYM2NuTUsvU2ttNEtxV2NLd0d6NVpiZUZ0QjdSS3hvTExZSFdM?=
 =?utf-8?B?M2kvZUVNNUt4bStBRExMLzRkbEdDb2E4YzFKdmFlUWx0a1JzZ29SYTZMMm5s?=
 =?utf-8?B?cWJuQ0M5N1BhTDdNZU5EQTg2L0xweTVqNjBBYTVnTkNnNUx4SEw3V2gzbTdy?=
 =?utf-8?B?TDdINHpzNHNuMitPSDZZTk52dHRqTVBNVWF5aHh1RDZsa01rQitoY1JRSVRs?=
 =?utf-8?B?YytTVDgySTgxejdEV1JoSWNqMHlpTWFyUDcwQlQ2MTNRbzBXRkc3SXdGdEg3?=
 =?utf-8?B?S0dsNzk2RFdYMnptZSs5V0U3VTU4ZnlIK0RYaDVwcjdNVThBbGk3bWVpZksv?=
 =?utf-8?B?YmFBUXJXbmpnREVHYy80RGg4ZUpBczZ2N0szb1B2TEZDb1RTRmF5SkNmKzJs?=
 =?utf-8?B?SmlSZTJvWXF0R3BLdFNZTUlBYXZ1bG1UalNwSDJZSU53d3p3QUVSaEZESTV6?=
 =?utf-8?B?NHFvUmhHUGRGSXltSktpL2RNcy94NGs1N28yWGtFbnp6cWdJQlpkSUlzTzVm?=
 =?utf-8?B?K2p4MDZqU1kzUXp1U0luVXZHNkFFUFMxRGRDMXpVRnhrcm5Ba01ad2RtQkMr?=
 =?utf-8?Q?vt+do2VPxrFn463jxfekwPI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C6FDDA7CB89514A99E109A9FC737654@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be37825c-e560-4dae-45c9-08dc636fa000
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 08:30:25.6339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +0Tdqi3wVI55zrZKDrIg5JTaVBObze9I++QdK0WKWV643WtteWlcXFCvOKZjcVAc6PlFfEzltMAaECvRRyEBerujTEBzkEXlS9Z0sV5f8Hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6663
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

UmV2aWV3ZWQtYnk6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVs
LmNvbT4NCg0KT24gVHVlLCAyMDI0LTA0LTIzIGF0IDA5OjA0ICswMjAwLCBaYmlnbmlldyBLZW1w
Y3p5xYRza2kgd3JvdGU6DQo+IE5ld2VyIGhhcmR3YXJlIHNlZW1zIHRvIGhhdmUgc2FtZSAzRCBm
dW5jdGlvbmFsaXR5IHNvIGxldHMgcHJlcGFyZQ0KPiBiYXRjaGJ1ZmZlciB0byByZXVzZSBYZTIg
cGlwZWxpbmUgYW5kIHNoYWRlciBmb3IgcmVuZGVyLWNvcHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4N
Cj4gQ2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNvbT4N
Cj4gLS0tDQo+ICBsaWIvaW50ZWxfYmF0Y2hidWZmZXIuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xp
Yi9pbnRlbF9iYXRjaGJ1ZmZlci5jIGIvbGliL2ludGVsX2JhdGNoYnVmZmVyLmMNCj4gaW5kZXgg
YzhjNmU5YTE5My4uODI0ZTkyODMxOSAxMDA2NDQNCj4gLS0tIGEvbGliL2ludGVsX2JhdGNoYnVm
ZmVyLmMNCj4gKysrIGIvbGliL2ludGVsX2JhdGNoYnVmZmVyLmMNCj4gQEAgLTY2MCw3ICs2NjAs
NyBAQCBpZ3RfcmVuZGVyX2NvcHlmdW5jX3QgaWd0X2dldF9yZW5kZXJfY29weWZ1bmMoaW50IGRl
dmlkKQ0KPiAgCQljb3B5ID0gbXRsX3JlbmRlcl9jb3B5ZnVuYzsNCj4gIAllbHNlIGlmIChJU19E
RzIoZGV2aWQpKQ0KPiAgCQljb3B5ID0gZ2VuMTJwNzFfcmVuZGVyX2NvcHlmdW5jOw0KPiAtCWVs
c2UgaWYgKElTX0dFTihkZXZpZCwgMjApKQ0KPiArCWVsc2UgaWYgKEFUX0xFQVNUX0dFTihkZXZp
ZCwgMjApKQ0KPiAgCQljb3B5ID0geGUyX3JlbmRlcl9jb3B5ZnVuYzsNCj4gIAllbHNlIGlmIChJ
U19HRU4xMihkZXZpZCkpDQo+ICAJCWNvcHkgPSBnZW4xMl9yZW5kZXJfY29weWZ1bmM7DQoNCg==
