Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0411DCA0FE7
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 13:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F5F10E655;
	Tue, 26 Aug 2025 13:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hLldrg60";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D88310E655
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 13:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756213678; x=1787749678;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=J0IsD9Wr9tB8luj61I8QcYaYqWZ1jKY/CLG0tbzSdKU=;
 b=hLldrg603cQKzQuQ49uzRss+DeuSt0eKcCGEhHBZubFOF2Qa8/sT1UcL
 x8/h+w/xpI8ee1rUeaUU/kRxwiBuEnZhrNxLXYG3B5Xc67X1ummGBZXiT
 jsvPIEcLiHLYpFfKxynffyMFNEvc89P1WZXkjeoeHecXbE2JTAvcJu0fY
 iq8kFIdOR+7Akoav+Lmh+Ds+QBYKg/ifCh5PojKCxENIFMGxwyFHqf7UP
 xU1dWer+GCNImscowMB6qGyTUICnIC3je6LogtvPq+gFfUj39Tbx3aeEy
 o5J45NNP470136A55xKFJ8ZD9/PfxAG7OJ3dM8BxTs+Vh/3JVUSs5+PiZ A==;
X-CSE-ConnectionGUID: nU2pv+P1TNWp2irOTSWEqw==
X-CSE-MsgGUID: 4Tc2CNxgQMqEsrFsa+EUlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62280593"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62280593"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 06:07:55 -0700
X-CSE-ConnectionGUID: kbJojtJmS6aMdslDo8z81Q==
X-CSE-MsgGUID: DAUdL7v+RR2fcFZwJrSFbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169475356"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 06:07:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 06:07:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 06:07:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.42)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 06:07:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSq64RODFlPGzjC8uiL8DSf7a7ZiL2a+MhP4SKqw5naVcUD7H3rRj5QwkoK7sdDL/cKfZIU2OvAKD/QDZUo0iCv7HS+Hmsm6uPhT+1uT5ri1G7XqdE5e1T/AfSkovf+VIMnJvnWSplRSSNjU+fUgzPaGfr3LCLGfmRp1Pd/ZP9tHD4MWpYjknk75ZbnBfMnc/v5s0xAt3TOyuqHDIwJHY9g7BZVT+9XCxKTQnn3LGlI3E9XDGVWDMJJhgT1sb7DGBAdUGl1mYgLbRk3aL755BBL0qQOz11fbQL0Lv9E4zS8ifKCrb/rs4F3ojoz1+wg/xxslKzN6Mnd29hWH7XgLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0IsD9Wr9tB8luj61I8QcYaYqWZ1jKY/CLG0tbzSdKU=;
 b=ciNSJeeaosyMThk1OlMdLh7oZWVvX6Su2qYLrAkXOhjKwnMUo90DFFperas5dX88k5Pvn6f5taPVYEipUXIf33TPr77r2Wd3O6UCbo86Nut9oZKYsU6PMaHSRvM43vzMJraQH2cmz6c1ZTRj1TCkXoA/0guc7MpmWEkxniHg/x5jkwTDY7imnDRDF5L+VL5o++JB06jUaG56EEhdLMbWckmhZQGGlLlqr/4yAZhG4Ub5qdUcit87K1lXKDbj/XPosB3PaJTFuXuXbJUJ64CY1IeMYKORhEXnyheq5ME7qVu0T6ffMkebvsJsRcHTeoX1gBaQJXVKCYEf1UFoE3Am2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 13:07:52 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 13:07:52 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Reddy
 Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v1] tests/intel/kms_fbc_dirty_rect: Limit to single
 pipe on simulation
Thread-Topic: [PATCH i-g-t v1] tests/intel/kms_fbc_dirty_rect: Limit to single
 pipe on simulation
Thread-Index: AQHcFliaGqwO/zFchkiseQxLW0TBC7R06CgA
Date: Tue, 26 Aug 2025 13:07:51 +0000
Message-ID: <bba9401b5382e1c52ce6f4bae77d0474d1191c7e.camel@intel.com>
References: <20250826070734.1117429-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250826070734.1117429-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|PH7PR11MB6932:EE_
x-ms-office365-filtering-correlation-id: 88abd2d0-e061-4968-2fb9-08dde4a1905f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eW9ZbzRlbjNIaEc1SGFVL0VUc1M3VzVmQkNzSzhTN051elJMTzBjN0kyYnVO?=
 =?utf-8?B?eDVMZkNDSHE2RDBDT2hUMzdMTTdiL0FpZjA4OXFJUXNpSUVEbkVBd2Z1TmVK?=
 =?utf-8?B?MWdiUjJYcVY0RWo2UmhYeXh5ZkFhMjNSOWQrTjFleVpKeUpmRi9pcDZQM0Va?=
 =?utf-8?B?RUtrdVR1dmRRZTMwMEd3Nlc4K2VLRWhIOERmY2dMeEswenVuWkp0RDQzMlVx?=
 =?utf-8?B?eTNCN3pCRCtVeFZ6M2FLUlZVMEVFSzB1L281M1BDbVp5RTd3VVdFNWVXUHd5?=
 =?utf-8?B?S3hzOWVjellEYXZMVXZoZlFQNk9sREhVRVk1ZWZEa1dUMUt1ajdadmtOT0M5?=
 =?utf-8?B?WkpNTUc0c1hmMzJ2OUkrSjlZdlBUNThjUmk2Z3pWc3RBb3R0RnY2d1hLWmtu?=
 =?utf-8?B?VFRWVjhTK3JBcC8xbk40VUM0b3psNXA1bHFqREx0MkozenU5WURjN3V1amUy?=
 =?utf-8?B?Q0t2UmQ1K3k4SG9LSUdpRzBLV1lETEFNTU1ORWFadlhRcmdvTnhFWUk4aEdp?=
 =?utf-8?B?dHVzNGpGUmJmZjBmc1lrbTREWlhrWWR4aHhzOTlZZkgyRzd6V2FNaldmaEwv?=
 =?utf-8?B?OUpyTUZJY0F3OFZub0FFNTRUdCs5cHRHODJhMTYvc2pSQnI5bkNLTlduekJ3?=
 =?utf-8?B?bWNWV3BHamN6UmxCTDhmWWR5UEwwTHp3WVBoazFKbHI5K1ZMUUxpSFlnV1BM?=
 =?utf-8?B?TjJMUWZEUTFQZWZ2OUZ6RzQvUzlVbzZia3M1VG1NZ2lLN1pyZnBRV1ZtMmhZ?=
 =?utf-8?B?YjVOTDhJRi9qVldpY25NemJHQlJtdHZiTzkzZUl0eXNtbDRvRldCSVk5SjNw?=
 =?utf-8?B?ZmJmd3ZKVWRsMGFxbnAzeXpVY1hwQ0hvc0d3SjZ1QlUvaFpiSGtEUFVVNFhj?=
 =?utf-8?B?OHVrcHpSYURzZTlnMEtxenkvRlN2RVRxa09wZE8yQ0tXTDBzUG5mcmJmeWNr?=
 =?utf-8?B?cmZYaGRtbkRnc1plQXN0aHhSMnFNenlON05tZDNlQjZPYnNBNXg0clBQSnVI?=
 =?utf-8?B?L0lPa2g1RGczSGtkTGhlWVkxRkp6MWpzUmVoVHpwNlJzNzVPRVIzMWdrVW53?=
 =?utf-8?B?YWdUekY0djhzU2IzYXMzUWE2V0lRWG4yT0pGa3R6Tjh1ajRIRUJOMk44OENn?=
 =?utf-8?B?VnpoYkJUOWtRRG1rSlFhNmtxOGxlZFFlSkR6VUV4S0p3Q09ud3BKQmV3TnpN?=
 =?utf-8?B?SkwrNGJSY0dGSWxKZ2c0VmIyekpjaENlNzdJVnBVb1hwUVJyc1BueDdaaUtS?=
 =?utf-8?B?THlwVm5sNUZzNkR4cVdQVHAwbkdLUmJTQnVaN0lDS0x3blAzYmlJc1J6d2ZG?=
 =?utf-8?B?ZE5vVGJUTmlkZExKTTRCbkpydTFBNFl1SGhsazhNY01DQ2Yzc2ZoQmFDZ3RT?=
 =?utf-8?B?bEtmUjJWbElrZGhkYnZMaEVOMGJSVVRQOC8rSXA1ZXJRc1d4KzY2dEt2QS9O?=
 =?utf-8?B?RE9VNjQ2V2J0LzZoaE1Od0tBbXhEOHpvZFd4UkFmRzdsQzVzbU9TaGVrZnov?=
 =?utf-8?B?YlcvT0VBdjNXQ2cxVXVQTENXZXJoUlhvK292VUR3OTkxaSt0c2Ezbjh4ZFha?=
 =?utf-8?B?WWQzc1JRY0NsM2pCRU5Kb21rL3ZidW5sT21LUm5GVFAxMEoxOVpMQXN1Zzhk?=
 =?utf-8?B?UG10cTZLT1ZBY1Z4S2h4Z0loR3k3SytUTzRoUjhyNnVOZHhyYzVTQ0twbmF0?=
 =?utf-8?B?N0NlVXBNMWJQeHpOQy93TDE5S0p2Zm9MUWdmS0dMQmMvb3daMnppTkVvK1FS?=
 =?utf-8?B?dHF6d1RBMGJ6S2VicTZtS1I2Y3VnNEd3bTJvNytySUFzdFA1eEUyRW43bHhP?=
 =?utf-8?B?M1RSRHd1a1k3TEp5UTdYZ3FiK0w1K2RJdWk2dndLMGprcEtUM2gyditZU0hM?=
 =?utf-8?B?N2UzU050N0M3UzRzSm5DMFV3bmxWdzNXakNKMXJRSUJ4N1h3TEwwL2k1WUtO?=
 =?utf-8?B?eFF3OGs3b2Q2bk5TU09iUzBWUFdtQnVXOXhSV2xUd3RsZmpmQW84SVl1SUxl?=
 =?utf-8?B?dnFsU1M5Ly9nPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGIrdXlNdWZDV01NSEl3U0N1M1NiRGIwQjVPMjZrMkhNUzNYZjVodEV0YmdR?=
 =?utf-8?B?bjhNK1puYStQakZxSzFHdWFXSDJBOGVQajZrQXh6VUxNRDhnc1ozcVVsbk0y?=
 =?utf-8?B?ZGZUREhFYmFXZVBqdi9Na21wcmVSbld1S05iVnNqMW11eXBSQ2RvdFhqbjJq?=
 =?utf-8?B?Z2tjWllKN1haM3BMT0txakpTMlRiaGNRd0VqblQ4MzY3OHZMaVpZWnhZWWdq?=
 =?utf-8?B?UHRGOEdtYTMwMDhqbkdHanZXbW9saHRPd0ZaVnlqcmlJNmxEMUwwZTZaR3Y5?=
 =?utf-8?B?N1dSUXM2MXJWK04zYUtBSU4xSkdxL0hsYkY4UWZMTWVTb3Urb2JWME0vb2FS?=
 =?utf-8?B?NytTeGVxeDhFOTV4MlFWTEdTeUt2Ynp1TTFDNnZlYWRWZzZJTWZ3OVJ0YmtD?=
 =?utf-8?B?Y3lic3ljbTJIc0cxcGo2ajRwdWc3NEdjY1dhOGRDbHlsa0Rob3crWHlzbTNR?=
 =?utf-8?B?c2Rkd01RNkdXTlJJTHg4UkJHNGNhYmJsMVdyL3dnYURnODN1cENSL1BCNEFm?=
 =?utf-8?B?UlBnWlpwQnFGNTgrZU1YNGlCSzM3dUIrQ2IweUppbUhtZlVOcFJBdHAwQWVT?=
 =?utf-8?B?c3JCYXdFNGdIMUQ3ckJnU2tTLzBCSVFmUVVCYkRMRzZPUU9kazlaZFlaRE1H?=
 =?utf-8?B?MEhNWHRQZzNZWDg2a3ZwM3pHZUV2bXJXenZLTFVmRVNpOFdkOFY5ZDV1Z0hZ?=
 =?utf-8?B?cmV6QjhWQjUzZE5RODA3eDZ6bHVnZFptaDB5OEx0RDdMak02NVdadXlvemdw?=
 =?utf-8?B?OGZaNmJEV040ZUd6d0cyek5FaVo0bWk1bHdJV2Z4eHNFYVVWT0o2UlZNUHds?=
 =?utf-8?B?Nkw1bDM5SzJsU0tmV2kzclQ3NW5EcTlqMVNWL1ZXSHhxTGpCMDNScThXa2tZ?=
 =?utf-8?B?dHdsV0lFQ3BaM1ZlQWl0UVYvOUUreTcyUXUzVTFQTUpOLzJSQlFLQXllTnJ4?=
 =?utf-8?B?a0xOWERWNHNXVit2VnpWSkNZaG1IVWZFelllOHA2akpaTE5keXZsamFKUWpQ?=
 =?utf-8?B?Q0ZCWlhPRkpBRGZCcTBSeG0xTjlhS0VucXlMR0hZcm5QdFZZSEFoaGxDN2R2?=
 =?utf-8?B?aGIweGFxMGRqdnlBbnRHNmR5QzNlQWFieEpKSmdQUWhHbVEySmNHY3pxRHJX?=
 =?utf-8?B?Y01Ec04wRDV1QmVlN0Y4aXZnSUh0d2NRYnpWVnQzSVVhaTI3ZlhSQkVYdEVl?=
 =?utf-8?B?UWJ0ZnQvcFByYWY2MUs0RDhPUHJwWE43S0lPTHg1eCtRVnIyZ0hMNlB0eGRa?=
 =?utf-8?B?R05sTmUwNFdpYUxLNHJEdU9xOEU4MWc2N2JBOEhoRkFVNXJ5djVKTHZzdjJY?=
 =?utf-8?B?VUdjYVBNVElFK0VDTE1Bd1Y1RkwyNmYvUE81Ri9Uc2c4aUZyMTFJeVZaOFBM?=
 =?utf-8?B?Y0J5UG4zNXlPZnVzdGIvM2xTaXJBZTdHN0xuS2xLUUtTYzgvT29OM2lKbE5W?=
 =?utf-8?B?U1pUQVFkbUNaaGtsOFhDRXdaWlVDeDFLYk5id21MeDRMVm5RaVozbTZuSHRl?=
 =?utf-8?B?UzdiQlJPWGRLNzdjaVMxNDFjOEZ6dHlsRS9WeVVMNFVOcEVvNktXdkl4MGRC?=
 =?utf-8?B?blhqTk5CWkhEM28zWjNPRkVaY2Q2RVd1RXo3emNzQTFWcmVxQVVKbnNZcVBk?=
 =?utf-8?B?TGlhZFFZVFNvU2dKa0hMWGhoaGRVTTZsRHUrQkFzd1Z0V0Ntb0d3T25POFJX?=
 =?utf-8?B?SEhqbjdjMUQzcThUV1hkSkxoWGt1Q2FFNnJCTXVvWFhBWVJEdEloeVBnemwy?=
 =?utf-8?B?czlZQnM1amlMelJidzQ3VkZvWFVmS09MMTJ4YUNTWGRXR2krWXAxN1VOcEVG?=
 =?utf-8?B?VEFlOWNmZSt0Y1RsaWZXVkRnaDkxUnc4TVRXUTJrUzNEdWJDeWpvMnBjS21m?=
 =?utf-8?B?QnliK0lDYldZTTFEeU14Y2gxSFg4aG00MHhWRDJGQWVwUDg3U3hLRldvVm5l?=
 =?utf-8?B?Y29WdEZTT2VFbW9vRkFlTHVSTG1lU0hEd0xyS2kwMDlOQks3MStZaVUwQ0RH?=
 =?utf-8?B?bHZsSUpTTlNZejJRTnpUU2RkcjJzWDVaRWlMekRYK3lJdjEwYWIzdk5ieVU2?=
 =?utf-8?B?Wk9OeVJQczJnMmRFL2Ywc054MWlScE9ZMVdzRU93YmlLUzRwRkpGTzBpNXhN?=
 =?utf-8?B?TUg0ZVdnSDNMcENwUGNuNFFiY0htYzgwMHNnelpOTHhQaXhzRVhNSjYya3Ew?=
 =?utf-8?Q?D6Jo97RKP5ofYPIGmq5I8Oo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA1D8192AC5DFC4B842DEA27ED426AAD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88abd2d0-e061-4968-2fb9-08dde4a1905f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 13:07:51.9178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ru2GKZqmimBoSGCLd5J9PZ0WivjO/9PT7hv+npI4rkJuTHm6+jCOGP2gDFv6BfAb/XXG2xMAQi3LMa25VoKkhrXhOEz7idr4/Ijmre4dB8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
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

T24gVHVlLCAyMDI1LTA4LTI2IGF0IDEyOjM3ICswNTMwLCBTYW50aG9zaCBSZWRkeSBHdWRkYXRp
IHdyb3RlOg0KPiBMaW1pdCB0aGUgc3VidGVzdHMgdG8gZXhlY3V0ZSBvbmx5IG9uIHRoZSBmaXJz
dCB2YWxpZCBwaXBlL291dHB1dA0KPiBhcyBleGVjdXRpb24gaXMgc2xvdyBvbiBzaW11bGF0aW9u
IGVudmlyb25tZW50cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNhbnRob3NoIFJlZGR5IEd1ZGRh
dGkgPHNhbnRob3NoLnJlZGR5Lmd1ZGRhdGlAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqB0ZXN0cy9p
bnRlbC9rbXNfZmJjX2RpcnR5X3JlY3QuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKystLQ0K
PiDCoDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19mYmNfZGlydHlfcmVjdC5jIGIvdGVzdHMv
aW50ZWwva21zX2ZiY19kaXJ0eV9yZWN0LmMNCj4gaW5kZXggMDdkNjE2ZDkwLi42MWMwNTU1YzYg
MTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19mYmNfZGlydHlfcmVjdC5jDQo+ICsrKyBi
L3Rlc3RzL2ludGVsL2ttc19mYmNfZGlydHlfcmVjdC5jDQo+IEBAIC03Myw2ICs3Myw3IEBAIHR5
cGVkZWYgc3RydWN0IHsNCj4gwqAJCUZFQVRVUkVfQ09VTlQgPSA4LA0KPiDCoAkJRkVBVFVSRV9E
RUZBVUxUID0gOCwNCj4gwqAJfSBmZWF0dXJlOw0KPiArCWJvb2wgaXNfc2ltdWxhdGlvbjsNCj4g
wqB9IGRhdGFfdDsNCj4gwqANCj4gwqBzdGF0aWMgdm9pZCBzZXRfZGFtYWdlX2NsaXBfdyhzdHJ1
Y3QgZHJtX21vZGVfcmVjdCAqZGFtYWdlLCBpbnQgeDEsIGludCB5MSwgaW50IHdpZHRoLCBpbnQN
Cj4gaGVpZ2h0KQ0KPiBAQCAtNDQ5LDEyICs0NTAsMTYgQEAgaWd0X21haW4NCj4gwqAJCWlndF9k
aXNwbGF5X3JlcXVpcmVfb3V0cHV0KCZkYXRhLmRpc3BsYXkpOw0KPiDCoAkJaWd0X3JlcXVpcmVf
ZihpbnRlbF9kaXNwbGF5X3ZlcihpbnRlbF9nZXRfZHJtX2RldmlkKGRhdGEuZHJtX2ZkKSkgPj0g
MzAsDQo+IMKgCQkJwqDCoMKgwqDCoCAiRkJDIHdpdGggZGlydHkgcmVnaW9uIGlzIG5vdCBzdXBw
b3J0ZWRcbiIpOw0KPiArCQlkYXRhLmlzX3NpbXVsYXRpb24gPSBpZ3RfcnVuX2luX3NpbXVsYXRp
b24oKTsNCj4gwqAJfQ0KPiDCoA0KPiDCoAlpZ3Rfc3VidGVzdF93aXRoX2R5bmFtaWMoImZiYy1k
aXJ0eS1yZWN0YW5nbGUtb3V0LXZpc2libGUtYXJlYSIpIHsNCj4gKwkJYm9vbCBzaW5nbGVfcGlw
ZSA9IGZhbHNlOw0KPiDCoAkJZGF0YS5mZWF0dXJlID0gRkVBVFVSRV9GQkM7DQo+IMKgDQo+IMKg
CQlmb3JfZWFjaF9waXBlKCZkYXRhLmRpc3BsYXksIGRhdGEucGlwZSkgew0KPiArCQkJaWYgKGRh
dGEuaXNfc2ltdWxhdGlvbiAmJiBzaW5nbGVfcGlwZSkNCj4gKwkJCQlicmVhazsNCj4gwqAJCQlm
b3JfZWFjaF92YWxpZF9vdXRwdXRfb25fcGlwZSgmZGF0YS5kaXNwbGF5LCBkYXRhLnBpcGUsIGRh
dGEub3V0cHV0KSB7DQo+IMKgCQkJCWRhdGEuZm9ybWF0ID0gRFJNX0ZPUk1BVF9YUkdCODg4ODsN
Cj4gwqANCj4gQEAgLTQ2NCwxNCArNDY5LDIwIEBAIGlndF9tYWluDQo+IMKgCQkJCQlmYmNfZGly
dHlfcmVjdGFuZ2xlX3Rlc3QoJmRhdGEsDQo+IMKgCQkJCQkJZmJjX2RpcnR5X3JlY3RhbmdsZV9v
dXRzaWRlX3Zpc2libGVfcmVnaW9uKTsNCj4gwqAJCQkJfQ0KPiArCQkJCXNpbmdsZV9waXBlID0g
dHJ1ZTsNCj4gKwkJCQlpZiAoZGF0YS5pc19zaW11bGF0aW9uKQ0KPiArCQkJCQlicmVhazsNCj4g
wqAJCQl9DQo+IMKgCQl9DQo+IMKgCX0NCj4gwqANCj4gwqAJaWd0X3N1YnRlc3Rfd2l0aF9keW5h
bWljKCJmYmMtZGlydHktcmVjdGFuZ2xlLWRpcnR5ZmItdGVzdHMiKSB7DQo+ICsJCWJvb2wgc2lu
Z2xlX3BpcGUgPSBmYWxzZTsNCj4gwqAJCWRhdGEuZmVhdHVyZSA9IEZFQVRVUkVfRkJDOw0KPiDC
oA0KPiDCoAkJZm9yX2VhY2hfcGlwZSgmZGF0YS5kaXNwbGF5LCBkYXRhLnBpcGUpIHsNCj4gKwkJ
CWlmIChkYXRhLmlzX3NpbXVsYXRpb24gJiYgc2luZ2xlX3BpcGUpDQo+ICsJCQkJYnJlYWs7DQo+
IMKgCQkJZm9yX2VhY2hfdmFsaWRfb3V0cHV0X29uX3BpcGUoJmRhdGEuZGlzcGxheSwgZGF0YS5w
aXBlLCBkYXRhLm91dHB1dCkgew0KPiDCoAkJCQlkYXRhLmZvcm1hdCA9IERSTV9GT1JNQVRfWFJH
Qjg4ODg7DQo+IMKgDQo+IEBAIC00ODEsNiArNDkyLDkgQEAgaWd0X21haW4NCj4gwqAJCQkJCWZi
Y19kaXJ0eV9yZWN0YW5nbGVfdGVzdCgmZGF0YSwNCj4gwqAJCQkJCQkJZmJjX2RpcnR5X3JlY3Rh
bmdsZV9kaXJ0eWZiKTsNCj4gwqAJCQkJfQ0KPiArCQkJCXNpbmdsZV9waXBlID0gdHJ1ZTsNCj4g
KwkJCQlpZiAoZGF0YS5pc19zaW11bGF0aW9uKQ0KPiArCQkJCQlicmVhazsNCj4gwqAJCQl9DQo+
IMKgCQl9DQo+IMKgCX0NCj4gQEAgLTQ4OCwxMyArNTAyLDE2IEBAIGlndF9tYWluDQo+IMKgCWln
dF9zdWJ0ZXN0X3dpdGhfZHluYW1pYygiZmJjLWRpcnR5LXJlY3RhbmdsZS1kaWZmZXJlbnQtZm9y
bWF0cyIpIHsNCj4gwqAJCXVpbnQzMl90IGZvcm1hdHNbXSA9IHtEUk1fRk9STUFUX1hSR0I4ODg4
LCBEUk1fRk9STUFUX0FSR0I4ODg4LA0KPiBEUk1fRk9STUFUX1JHQjU2NX07DQo+IMKgCQlpbnQg
bnVtX2Zvcm1hdHMgPSBBUlJBWV9TSVpFKGZvcm1hdHMpOw0KPiAtDQo+ICsJCWJvb2wgc2luZ2xl
X3BpcGUgPSBmYWxzZTsNCj4gwqAJCWRhdGEuZmVhdHVyZSA9IEZFQVRVUkVfRkJDOw0KPiDCoA0K
PiDCoAkJZm9yX2VhY2hfcGlwZSgmZGF0YS5kaXNwbGF5LCBkYXRhLnBpcGUpIHsNCj4gKwkJCWlm
IChkYXRhLmlzX3NpbXVsYXRpb24gJiYgc2luZ2xlX3BpcGUpDQo+ICsJCQkJYnJlYWs7DQo+IMKg
CQkJZm9yX2VhY2hfdmFsaWRfb3V0cHV0X29uX3BpcGUoJmRhdGEuZGlzcGxheSwgZGF0YS5waXBl
LCBkYXRhLm91dHB1dCkgew0KPiAtDQo+IMKgCQkJCWZvciAoaW50IGkgPSAwOyBpIDwgbnVtX2Zv
cm1hdHM7IGkrKykgew0KPiArCQkJCQlpZiAoZGF0YS5pc19zaW11bGF0aW9uICYmIGkgPiAwKQ0K
PiArCQkJCQkJYnJlYWs7DQpJIGd1ZXNzLCB5b3UgY2FuIGp1c3QgYnJlYWsgYXQgdGhlIGVuZCBv
ZiB0aGlzIGZvciBsb29wLiBubyBuZWVkIHRvIGNoZWNrIGlmIGkgPiAwDQoNCkJ1dCBpcyB0aGlz
IGFsc28gcmVxdWlyZWQ/IE9ubHkgb25lIGZvcm1hdD8gU2hvdWxkIHRoaXMgYmUgYSBzZXBhcmF0
ZSBwYXRjaCB0aGVuPw0KDQoNCj4gwqAJCQkJCWlndF9keW5hbWljX2YoInBpcGUtJXMtJXMtZm9y
bWF0LSVzIiwNCj4gwqAJCQkJCQnCoMKgwqDCoMKgwqAga21zdGVzdF9waXBlX25hbWUoZGF0YS5w
aXBlKSwNCj4gwqAJCQkJCQnCoMKgwqDCoMKgwqAgaWd0X291dHB1dF9uYW1lKGRhdGEub3V0cHV0
KSwNCj4gQEAgLTUwNCw2ICs1MjEsOSBAQCBpZ3RfbWFpbg0KPiDCoAkJCQkJCQlmYmNfZGlydHlf
cmVjdGFuZ2xlX2Jhc2ljKTsNCj4gwqAJCQkJCX0NCj4gwqAJCQkJfQ0KPiArCQkJCXNpbmdsZV9w
aXBlID0gdHJ1ZTsNCj4gKwkJCQlpZiAoZGF0YS5pc19zaW11bGF0aW9uKQ0KPiArCQkJCQlicmVh
azsNCg0KQW5kIGEgc3VnZ2VzdGlvbiB0aGF0IHRoZSBhYm92ZSB3b3VsZCBiZSBiaXQgbW9yZSBs
b2dpY2FsIGlmIHdlIGhhdmUsDQoNCgkJCSAgICAgc2luZ2xlXyBwaXBlID0gZGF0YS5pc19zaW11
bGF0aW9uDQoJCQkgICAgIGlmIChzaW5nbGVfcGlwZSkNCgkJCSAgICAgCWJyZWFrOyANCj4gwqAJ
CQl9DQoJCQlpZiAoc2luZ2xlX3BpcGUpDQoJCQkJYnJlYWs7IA0KDQpCUg0KVmlub2QNCg0KPiDC
oAkJfQ0KPiDCoAl9DQoNCg==
