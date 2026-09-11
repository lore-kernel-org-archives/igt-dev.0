Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68226C79FA1
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 06:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141D210F4E5;
	Fri, 11 Sep 2026 06:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NSMd9zpw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7240E10F4E7
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 06:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789108235; x=1820644235;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6tXpnKLLXUKO2Qd2XOpMNkREUQAuR4YoY1Wrkk6MaQE=;
 b=NSMd9zpwgt70Le9wmt8Q/zE/PnI8v0SLucfyIkO6XBxZRjROtntVLucz
 edVxqjwH7fO7kWABCVjOYdxKNwT3nBb+8HFQOp1Rah7Kf/3o5fRxVffCK
 b3lS3rabcS1nGtgAVPJk8bKBJZ4t/lYOqzw0pEr6xLeQlaXGmNWqBjK7w
 tYvL8Q5aBqhz1yw04edINjkSElBUvYVQqt0C7OtPsqFCnPJFZeenb2Dlv
 3hsquS0wpl/RFVEGDtR/+yGgWoNQh/CT51GlNMeL15XBm3og2uwIex0U7
 fDtTZFlPmViP0w0utdN4B11lbe9LswlRUr/JTLqpi9RbuKsmVE1XzFvZ9 g==;
X-CSE-ConnectionGUID: dzENSClGQeSOJb2iZTA27A==
X-CSE-MsgGUID: IAkzGVMkSCKdpg3NfrHWRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77128297"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="77128297"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 23:30:35 -0700
X-CSE-ConnectionGUID: aowvaTjOSGynljqMudWYwQ==
X-CSE-MsgGUID: rs0nbp5gQMqnHNGCqKkxYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="270464454"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 23:30:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 23:30:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 23:30:34 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 23:30:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3Hz2kQyniKRYV1QRMy/T2Ew7xCEh+qnQ2l4xYNkDxY6z88RAetKjE2QQ0ekfJOEhOr+iur/mG7RosStt/SVVnpEMrSHzEJlXrTuo6TF2cz4WVnMM4rCtcIIpL6oBCVgZYOdGX93MuQU7tmou8cgpU24CUXfdwjtaIaWGvfsp0vZOS/VOvHlzkOiYgDnQwqiWJjtubqvr8DbkbRxU0FzmTGCNFTzg7UZyzFh9fyEQwEFedKwl52v/dnzshCGEt9F0XMSgbibOULrKmEqO1kIn8lwhAKUjrK3sH7ktCNGuUamJGZ6tHlhdWNaaoF3GDb2HjTAdo3Ik1vcf0cBRz7NuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tXpnKLLXUKO2Qd2XOpMNkREUQAuR4YoY1Wrkk6MaQE=;
 b=xWwsveSKH4CU4Y/HE8sJxVFAfchFLVfLhkBUnOZTqAKVFs02AhVy7PO9sYy64SvPo9+KLj9LBF6uARHX40TQDtFKLFdCTbLV4qMaSfgEGTS6/4jmhesPyXCALN+d3ZBHVD2FxjIyaMpAVsYKl66pec4GzxRy1dnqQ1TpHmIrJNNZcT6hzq+57nMDGr1XKwqd+d+vvNwn9FM0bpr6XLSa0Vs/oVz9vcA4P4EYB3l3L6gMFosVxzF9HNKbiKazo2JDVbJ4HVOhEm+bEx7btWPbZhlTMw74nF2RF3whjVJU3ejLrkixe75lR+6BtzTFiY4rZiSMgUbJOReIGmPFDze/OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by CH8PR11MB9505.namprd11.prod.outlook.com (2603:10b6:610:2bb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 06:30:31 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 06:30:31 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2] lib/xe: Use proper GT lookup in
 xe_gt_get_tile_id()
Thread-Topic: [PATCH i-g-t v2] lib/xe: Use proper GT lookup in
 xe_gt_get_tile_id()
Thread-Index: AQHdQIRcEovrqiI5JkuZM02XqMJjsbbI6zXg
Date: Fri, 11 Sep 2026 06:30:31 +0000
Message-ID: <BL1PR11MB541326CD373EBD7184A07188E2BE2@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20260909-gtlookup_noncontig-v2-1-e25a659b43a1@intel.com>
In-Reply-To: <20260909-gtlookup_noncontig-v2-1-e25a659b43a1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|CH8PR11MB9505:EE_
x-ms-office365-filtering-correlation-id: 1bd798fe-991c-4079-06aa-08df0fce2d8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|56012099006|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: l/dv3qeC2EIBhsWcxFvl9LM5cZjoojDq+RQZgiP/alt6MgZmOo8P8vT9faDzpahq2LDtLfikn5KfX6J3WJA9xiaDDKzjja18Rky9pbndemCDmnvCqkMOGd4JVTb05wfp9FS+cdWy15Kd6BcMzWrmyxDgBVn/xF7V0t7OXfGVtOLasgX9RCiQOMwuXE7XaHSWx1WymhrA0BYgaBxFTkmf9lwWtT9DJVzmkr2CCkEhqQCOmP6LB06z09yntc6DDgSOXRZZ90npAYgymTtgfzfg9MbL8BeFafjC7DtM/JZjeZ/9wqJgM8cbtI2rozWUacSh5y3+AI4EniHxwd+oX7TBsOO5jYF5aYoOkyslh4qWBYpsDqAat338qHeMQAfxBZJf4+AjezkhaHS00WYRv8Cjy5wg/+Ct9OXPOS4DXpwDTUPN6ORiJEHCv3SGg5Een5jyViO2JyRwCoC3kUqS15j0GTRnq4RqEuaiIro2Ej/r1+S4abA6IH2BCWfXodamptzJ02Np1y7cHX+fWZ15xGVcvFgiQSkq2LI0CKeX7W/PqtB8aRahKcZrtnRgPM07bDLfxOSlv+ceykWMKdD0Gz8G1fcZ97Nra632Hu5YxIZ4NwhufPO/HIm/D3Oqo4WGlaOch+lQu35W/0JiSWGc1DyeOmLz5oBUAQDm+eJJGdptCKlxMGUljAYh+h+B+vG58EBfOCU6EhVIBdjFnzaaVYqnZrqtcqNMX5kAw09crzfHjVQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5413.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTNSbnNVSDYyS3g4c0ozNXUzZDhveHFwNXpRNVZHcXNYVGV1Z2pKelc3Tzc5?=
 =?utf-8?B?aGJiKzM5SUx0aFh4Yzh5aTN2b2N0SVFKSTJtTzNDZGQ0WDBuZzFVRXNFV2NB?=
 =?utf-8?B?QWFMVmVZM3VSbzR0YXZMaDBLdi9ZL1RhVk5LZG9KWkpkRlVSQmNxdExHZENy?=
 =?utf-8?B?Ykk2T2t1dy9KQllkRWcvVHNGc3JBQjdZWHZmTkZ2ajhXOGc2MFA5Njh1bjV1?=
 =?utf-8?B?N1VCbXEwZ2NnNVZpaDVtRVdnNzhIZ3lZc3MzK010ZHUvaEFJNUI5T0FIMmQx?=
 =?utf-8?B?ZE56UDdiWXpva0xRV1B3eFJ4V2pzWkxZS09wdUtnR2ptNzcrZmdmSWVsR3VZ?=
 =?utf-8?B?WTNUNlIxellJcUVBWnRKR2xzK2tSaENsRHZDdlFkTFZVVmJnSjRwUjNzcXdG?=
 =?utf-8?B?eXhwSmwyT2ZJQW8reGRoSkpNSkYxY0NTRlpDS05EWUFCVkJBbGhCY1BCK0Jq?=
 =?utf-8?B?cnhzcnlXSE00SGc2bW41bndiSkxJUm5vSHJHUi9nQTdKdTgzdzArQ0VSbDdt?=
 =?utf-8?B?YlRlWmF3WklhM2Z3bWJjYTFTenlRcHZyU05LTjdjVGh5TEdRbHI3b1c5S0k3?=
 =?utf-8?B?OFRBdDY1UXF6RXNYVVFJZDI2a3VCOXNlL1FuRGlIU3B0Q3Fta0wzU1E3a2hB?=
 =?utf-8?B?NGI5cnRsV1NTbUR4ei9oblFzM2FlNE4wWHdCNmJGZlNheVZhOCtjTWxHRmpl?=
 =?utf-8?B?NmxoaEM3N3hCZmFqdk5ZN05UWXk3d3BIMmZiRko0cHRhUGNVVkMzZk1wRC9O?=
 =?utf-8?B?WHA5WmFHbW5rZ1hmZ2loSjhsNXVjMHBSRXFLZnNSajBEUGQ4NWlSNlY1Qlpo?=
 =?utf-8?B?MjRxWVNXR2cxTVdpOEUwTmdDQnhPRWRWSW91c1VNQ2JlUlRub0ZlZnNMYWFN?=
 =?utf-8?B?Tkc1SGJjeUJFaml1SklkRjlpMzd2ZVdyNHZzMDMxc3VONHpFQW1ydkVIWXN5?=
 =?utf-8?B?TERqVG1tRnFvd2sxVENJYzYrcStnVnQrK2tiMi91SmY2bXVlbHQ1K09KUkV1?=
 =?utf-8?B?T1c5RkgzTTlXbmlaQnhRTllwc3VXdWxqekRSalpudytIRWV2eTlqeU9hOHdp?=
 =?utf-8?B?TlZNRnh0Y3h5VlljSkYvVGRpbDVaY0p4MlZING1rZE1mcjJWOUlUMXNBakhs?=
 =?utf-8?B?ZlZGTFROdGwzUVBkcnZNK215ejlwZ1g4ZlROYlArak1tVVA2Qm9BQWJ0RlRR?=
 =?utf-8?B?dWNvTFhNa2NlOGZYd1Jzdi9tRG53UHJ3cUNOV2daQUZNVmZQOUs0WG5YblZ2?=
 =?utf-8?B?MDA0aG51bXJSR1NRajJIVGZHWkV6WFNJWE9qK1BvU2JVMDBPaVc4Y0NYUFov?=
 =?utf-8?B?VTB0OFh5Zm9NdS80RGlXVWhkOExBQjVCWHNWTlllcTFwc3NoMFpJam10N1dO?=
 =?utf-8?B?dmxLVnoxL0oxUFRHbGFtZXluZTg4bGpMb3l0SFA2M05ZdzBkSGlmRjFRd1Ns?=
 =?utf-8?B?RmZENk12cWg3QnJidWllaWFaRDhpc20zYTZuQU1ZaWw5cEcrVU1ieE1yZCtr?=
 =?utf-8?B?WTFiZWYwNmR5SnJMUkZNMDNsS0prL01ldkVNcEprL0hrWnB5QkliYk9kcFV6?=
 =?utf-8?B?WXVTVHdBbUNtQW8yZEpqdWNRQTVYZk5Bakg4RjJMOFl5MlJnRnduOHJOem52?=
 =?utf-8?B?b1dGME9zYmhaS1h2ZGw4QmMwYm81L2ZyWS9yNmRCKy8xN1JFS2RhZmlPNU1O?=
 =?utf-8?B?Z2VvT0dOMkVEZUFJS0Y4R0d3V3E1cTBjRGtWQm81LzZyYllTYndJeGpKMWJ1?=
 =?utf-8?B?U2tTQlF2YWVLdXl3azhWVDZ0TjJRTGk0L0Q3YmtJWlFSbm9OZTUraTkySGlJ?=
 =?utf-8?B?WnJyRFMyTTZ3L1cra0lTN2RNUHJoVTlEeFZ1cWhzRytVd1NzQ0p0SHVKQ0U2?=
 =?utf-8?B?Vkl5SzNOcDNLOCs0Qnk5RHVJc0dqb3l2VUNOQVJrN3JOeGVQVDhNamRkRWNi?=
 =?utf-8?B?dGwrdHU3SlIyNUpITTRtQWkyb2pYcTY5TVI4R3gxbkRiUzlHNGlzNzNjbEYy?=
 =?utf-8?B?NFBVRmk5Y3VFYm9hZW1VR2gxeGdtSCsvWDJwYStFd3FuUWF6V2EvaHRRMXJJ?=
 =?utf-8?B?MnJJTGUwaXdNYkp2M2d0eXlGczJCWjBJOFJFSktxY0pabGluY2E1QlYvNllU?=
 =?utf-8?B?aldqTGZOSW9RMkhCKzJNcVR2cU5vRWJVcFBibXNMaG96cDFhU2ExU2pQSDU0?=
 =?utf-8?B?UEtUVjQ1M2ExYk9oK2lPdlkxMVZ5QWd0TytsTVpHMmNZRnMwRldDNUZEdDVO?=
 =?utf-8?B?aHhXM1JyWWkzWWNGQXd6em90SHN4MnBPd3YxMVB3d0ZnTXk4LzIwNlkyYlNa?=
 =?utf-8?B?T3NuSWRQa25qbFducEpIQ1RnbDZrT0UxUitqV3VldlFTVUYvd3lkSW5PcmVG?=
 =?utf-8?Q?NSvp6msD7z3qnzc0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: m8uDVAbYAXhW/ZPmQZXf2LDa9z62oL/H7BO3fYzL6BsiY8Wkvbb2f5waoTD7jedOmklT4VJpGh66veLY28mJzYG9xL6gAOs1jVr06x1Dp4ahxgHvR5qj3atmhlatPA4uMYDRuH1Az0yqfH+enIuVWemlwosHtBSChPkb9nWVg/3ll98pVWz51AwF64Zv6cc0mL6Fd4+GSALvK2DsZ4Gxt11FzITjqwIsZwAANMeQ8x2cSDDaxGzZOpYulTtKYwlvyDLbK1ZoF+U5diEupRaLQ6hMATlJlP+Ujyu66caRJF06AEt3XsZ5pV92Oh6rTioWMwsTlQUWjm9HwSj+v9c3Lg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd798fe-991c-4079-06aa-08df0fce2d8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 06:30:31.1491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VeOWW5btPTli9rOk8nfRv6Y8Ma+ZI2+Y7SF4jWeDZaCZ93D0Nmueuauu13i8DWR21eBsIzwfMj3/X8cOyyThUC9kXI00y9S4OB04DZS6VTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9505
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9wZXIsIE1hdHRoZXcg
RCA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1i
ZXIgOSwgMjAyNiAxMToyNCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IEJoYWRhbmUsIERueWFuZXNod2FyIDxkbnlhbmVzaHdhci5iaGFkYW5lQGludGVsLmNv
bT47IFJvcGVyLA0KPiBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IFN1
YmplY3Q6IFtQQVRDSCBpLWctdCB2Ml0gbGliL3hlOiBVc2UgcHJvcGVyIEdUIGxvb2t1cCBpbiB4
ZV9ndF9nZXRfdGlsZV9pZCgpDQo+IA0KPiB4ZV9ndF9nZXRfdGlsZV9pZCgpIHNob3VsZCBjYWxs
IHhlX2dldF90aWxlKCkgdG8gbG9va3VwIHRoZSB0aWxlIElEIGFzc29jaWF0ZWQgd2l0aCBhDQo+
IEdUIElEIHJhdGhlciB0aGFuIGRpcmVjdGx5IGluZGV4aW5nIGludG8gZ3RfbGlzdFtdLg0KPiBU
aGUgSUQgbWF5IG5vdCBhbHdheXMgbWF0Y2ggdGhlIGFycmF5IGluZGV4IG9uIGZ1dHVyZSBwbGF0
Zm9ybXMgaWYgd2UgZXZlciBoYXZlDQo+IGNhc2VzIHdoZXJlIEdUIElEcyBhcmUgbm9uLWNvbnRp
Z3VvdXMuDQo+IA0KPiB2MjoNCj4gIC0gVXNlIHhlX2dldF90aWxlKCkgdG8gcmVtb3ZlIG9uZSBl
eHRyYSBzdGVwLiAgKERueWFuZXNod2FyKQ0KPiANCj4gQ2M6IERueWFuZXNod2FyIEJoYWRhbmUg
PGRueWFuZXNod2FyLmJoYWRhbmVASW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJv
cGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MjoN
Cj4gLSBVc2UgeGVfZ2V0X3RpbGUoKSAgKERueWFuZXNod2FyKQ0KPiAtIExpbmsgdG8gdjE6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA4MzEtZ3Rsb29rdXBfbm9uY29udGlnLXYxLTEt
DQo+IDM3ZjIyYTBjYmI2YkBpbnRlbC5jb20NCj4gLS0tDQo+ICBsaWIveGUveGVfcXVlcnkuYyB8
IDYgKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9xdWVyeS5jIGIvbGliL3hlL3hlX3F1
ZXJ5LmMgaW5kZXggNjhlNjBkZGM3Li45MWZmYzM2ZTYNCj4gMTAwNjQ0DQo+IC0tLSBhL2xpYi94
ZS94ZV9xdWVyeS5jDQo+ICsrKyBiL2xpYi94ZS94ZV9xdWVyeS5jDQo+IEBAIC0xMDY2LDE4ICsx
MDY2LDE2IEBAIGJvb2wgeGVfaXNfbWFpbl9ndChpbnQgZmQsIGludCBndCkNCj4gICAqIEBmZDog
eGUgZGV2aWNlIGZkDQo+ICAgKiBAZ3Q6IGd0IGlkDQo+ICAgKg0KPiAtICogUmV0dXJucyB0aWxl
IGlkIGZvciBnaXZlbiBAZ3QuDQo+ICsgKiBSZXR1cm5zIHRpbGUgaWQgZm9yIGdpdmVuIEBndCwg
b3IgLUVOT0VOVCBpZiBHVCBJRCBjYW5ub3QgYmUgZm91bmQuDQo+ICAgKi8NCj4gIHVpbnQxNl90
IHhlX2d0X2dldF90aWxlX2lkKGludCBmZCwgaW50IGd0KSAgew0KPiAgCXN0cnVjdCB4ZV9kZXZp
Y2UgKnhlX2RldjsNCj4gDQo+ICAJeGVfZGV2ID0gZmluZF9pbl9jYWNoZShmZCk7DQo+IC0NCj4g
IAlpZ3RfYXNzZXJ0KHhlX2Rldik7DQo+IC0JaWd0X2Fzc2VydChndCA8IHhlX251bWJlcl9ndChm
ZCkpOw0KPiANCj4gLQlyZXR1cm4geGVfZGV2LT5ndF9saXN0LT5ndF9saXN0W2d0XS50aWxlX2lk
Ow0KPiArCXJldHVybiB4ZV9nZXRfdGlsZSh4ZV9kZXYsIGd0KTsNCg0KVGhpcyBMb29rcyBnb29k
IHRvIG1lLg0KDQpSZXZpZXdlZC1ieTogRG55YW5lc2h3YXIgQmhhZGFuZSA8ZG55YW5lc2h3YXIu
YmhhZGFuZUBpbnRlbC5jb20+DQo+ICB9DQo+IA0KPiAgLyoqDQo+IA0KPiAtLS0NCj4gYmFzZS1j
b21taXQ6IGQ4MjJjYWFjNmUzNTg5YzA1ZmZmYjYzZmJmYzg5MTM0YjBmN2NjYjMNCj4gY2hhbmdl
LWlkOiAyMDI2MDgzMS1ndGxvb2t1cF9ub25jb250aWctMTNlZjk2YTQ1YjRmDQo+IA0KPiBCZXN0
IHJlZ2FyZHMsDQo+IC0tDQo+IE1hdHQgUm9wZXINCj4gR3JhcGhpY3MgU29mdHdhcmUgRW5naW5l
ZXINCj4gTGludXggR1BVIFBsYXRmb3JtIEVuYWJsZW1lbnQNCj4gSW50ZWwgQ29ycG9yYXRpb24N
Cg0K
