Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC11FF885E
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 09:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46B710E07D;
	Mon, 27 Apr 2026 09:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJIVS25/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E6E10E07D
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 09:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777280862; x=1808816862;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BZTJFSkn5+tnf0zv1lR5+GpOAGxmloQwu2AuI3D3Ms4=;
 b=WJIVS25/IjL+7cOCFY/n8GW44USejylamJlMBm0r8/h4jjGzp1grmiyx
 hQv+9W1OIQ+YoJifN6sWYquHchkfJkEhOUH9qIesfRuJtNe/n2UyK7G7T
 uFhnWUkmUrhzmcowuyEnwtA+ZDkHoHbfjULIu3aJ2cEXarKddGqB3M2j0
 qz0/uU6QNbgcWjPlp8fSfICmruCZGXAXcSNUh84KPtzJbou8M6yJaZ8LF
 8xNTWLenLc1M0YM2XnGTtXWOT4GByiGu71xSg3jXDd+ul8mKlLbcWctwb
 EddFvXNLJK172qejXfEqt5w/gG0PIqVP5Y4vL8/a2eW3daNLhP2hjHvmj w==;
X-CSE-ConnectionGUID: IjKnfNmhT8OOOd2o4LZw2Q==
X-CSE-MsgGUID: wMtNVZkQRIenPk0rGHha1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78223087"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="78223087"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 02:07:42 -0700
X-CSE-ConnectionGUID: NBGf6sYdRuunZpQQj8JP/Q==
X-CSE-MsgGUID: ylbZk16NSH2K3otxcnlqHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="238625322"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 02:07:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 02:07:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 02:07:41 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 02:07:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgkhBiqtoDeKAnt+NLzEiP2lqaUEICYqRHL+YqWFZofxyCUUwodBC9JCxPPSeMLoug2h6FRgOSNmRZcEwkaP6L4ABmaWTGQQ09xw5qww2Le0KGbEqVd/tVrL/wqjYekgTXvVF5yEhF7JjyArnRlzbcFeFAJ8bzpG+k+4Bl4LvubrS0pCQwZcsh/tTW8jB+hufayNczFkER2ozBySb9THwF7Qcc7FKQdyb7LtL1KEMwbaJ01HQ99ApE5SSPco1i2TKgsMMYR/vbD09gHqH4e39PDtP/9qLPiNmW4KIOQbNKNpPVWlueUd4PEjDwUCfPt+wCILxN+mduhoK1Hl3+PTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZTJFSkn5+tnf0zv1lR5+GpOAGxmloQwu2AuI3D3Ms4=;
 b=HQ8MMF+085fiUowhVrHOhbnj1dFlDKt1hGQbW1ks6B26T+574wCU7JOPQUKy9pdANLWeF3n4vwMwMboudswLNOq8YfCZBmnO8oOky1BWu/4U2P9lQhOcblfZqe++Jqrh+L5pmI+VyYd+ERwD5LcMaItRznBd0QKDTtLGYsyXVJDq6a5Zd+8Edo13xFGNXlsTThZdy9t7eRYAYa4RhYG7vZE/P7I4j774g1+h2eI2bLwNMpUsTX5ycfd8LiQ5W928J5pvLBce2HnGdfqfHClx5cw6LdUA4Ztoul87OSh+jUscGyz5v4sWX2NMmomd1OkzD4R+JDoguIxCKnlGJmc/Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 CY5PR11MB6341.namprd11.prod.outlook.com (2603:10b6:930:3e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.15; Mon, 27 Apr 2026 09:07:37 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 09:07:37 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Thomas, 
 Sobin" <sobin.thomas@intel.com>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v5] test/intel/xe_vm:Add oversubscribe concurrent
 bind stress subtest
Thread-Topic: [PATCH i-g-t v5] test/intel/xe_vm:Add oversubscribe concurrent
 bind stress subtest
Thread-Index: AQHc1e83PlG1SxNLaUKYwIQlZMrTw7XynrUA
Date: Mon, 27 Apr 2026 09:07:37 +0000
Message-ID: <931c9a225b944d772bf1e752ad0c5744265037a6.camel@intel.com>
References: <20260427024004.662789-1-sobin.thomas@intel.com>
In-Reply-To: <20260427024004.662789-1-sobin.thomas@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|CY5PR11MB6341:EE_
x-ms-office365-filtering-correlation-id: c0e5574b-032e-4c1b-9733-08dea43c6d63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: NAbKssisHCY3NsJiRYSjo9XKvuuSDR+83f0FtOZcA99cIv6yVxpTe4vibOPulPSo45/g7UyXSA9IuFNwsAeJCOs4pBO5m/OYZWsl3nDeeX8OXSHjDYSQK4+CDMu0uxi+Y1yNkYtQM7f34/TJzIzaaQBNIJY2xT83bRRgdNW1kMDK0tj29qhalCHgBRSEv2oIuiv/M3LnpIPoP5yZ+omNNxFXayZKrAbjhCmnqasKzWjuICU0dQBQVpkNrDPofd/c6y/lQ68LKG2PILqZsYXT28berfLgfEkHB01Bv/90aJGYiLHrYA0zYrQGj0Xo8nUECQunIz4VE9nXnpL1ACjqesQ7V3vPCIngBjV6oZq61tA8T9XWRKWcDmadb5xY6UlSDl507I55LILBT6JukGfSlK/bYYaayIjfR4ZhrrGPPGDIhvHGGuAXTDZBLfjkbRY+c/xQ8qsQ5WqLPCVdEzxAsglS/jYB2vhNksys8e/V43s4kf4vNeYm06CxqDoB4s9Z95aZjPcL4qrKEYS3lGdVq1anO20N2ajydg+CN5p+xE/cCKy2IotxTu6++M6GPtuLmGg9HLZay6OsmFxXM7gCGyZaWGqACzSvw0xJtROeNrn3ruqsQVqwQIqZWeo6SlHCcbExy02iDtzMRFaVXCgp5oj7trTz/esh1V4i9oS5EfTntWQbs1vOFQoL5HYT7dC/N4m3+ILMG7AKtY6IzSaIqqNJQHV87rs+wpDAh4cWc37nrXOuG/VKN5TJ5G03WXyRsWqy6kcuK59oQ+2Q44ixNwvp/aAjPZkh9jdGU+Olt2s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlFWL3FCMHZ5SEQ5SndwWmM0OEFjYktLTU8rZHhyM2U4MDRaLzJJYjYremE1?=
 =?utf-8?B?MHJmVFJZY2R2ajA3aU1BTUQ2V3ZLRnh2S2hBS0NidkwzZnFucjE5eDhmOHJu?=
 =?utf-8?B?MmszdmhFcjI2WkVQd3EwRjVWb3R2NkpGL2VoS0YvWWhwYzl3Nk5tOW5zZUJV?=
 =?utf-8?B?Q0RYcWNFak0ra3ltdGlQczNveGxTSEc1OG5Qbkt3ZXlNaUVEWGZsY29CNXBp?=
 =?utf-8?B?YmQ1SHMxYzRpTW1NL0RDM09TZjdxZ3M0VGtPaWpMMU1sdDJvcmxFY3Erdnhx?=
 =?utf-8?B?QWhzNzc4ait6RUpLMk9hc3EwYkZmTWVuVnpIWFgyTjJoVUFTdndsTlJFV2Jq?=
 =?utf-8?B?ZkY3T2FSR3dIMk9MUkN2UFd2ejM3eDJtM1ZMSEtSU25iTklUT0crMlBuK1Iv?=
 =?utf-8?B?ZUkyN0RibkZFMzNUTXJVMGVSOVZpd29BMFAyVjFRK0ttcnUvdzlzREhLZ1pS?=
 =?utf-8?B?eGNxZzl6WTJPbEtxOGtvRG1lZC81MTB5MCszK0hJWEZ6SnNDVGlsZ0E0Wi9U?=
 =?utf-8?B?bmRnL2puUUphVEVLblhzMHZVOWRaM1l0a1JvUTIycTNOUTNDWHhhNmVQNXlJ?=
 =?utf-8?B?VVlCaUk2cm1yRlpsUTFNeno5aEpKYUtXUTdBWEJlVzJjMkVkUnZseVBETklO?=
 =?utf-8?B?MVROU0h1U3F4dzBqOTBvRUlFcE5OeEZQdVVZNm5XaUU4aVZNYkZValppU1VQ?=
 =?utf-8?B?ZWtjNWQ5ZHdPSHlyUmJ0S0RsYmo2Nk5uc2xBY0Erd2xic3o2OGxURThaWDk5?=
 =?utf-8?B?bHV4azd0VUVQalloRGg5N3NGcWNuanM3eldLRFo2M2RHTXdGeVVUb2tQSTVq?=
 =?utf-8?B?WGJQa1BRMDhWTWszbS9wVUQzVXRCZUdsY2FLaVhaamZkZS8wZ0FneWpaUnRD?=
 =?utf-8?B?MmJQS3l2T2RtNW9YOFpCWklrTml2aE90ajYza2hlRFJWYmYvbUZTS2VCbGtL?=
 =?utf-8?B?R2haaUVibUVPMDhUNC9Ud1h1RHZSYVhKaVJWcHN6Y1p4K3A4NUU5M1crbDZT?=
 =?utf-8?B?djQxYjF0TFkzSVpCV3NDTlFqWGpOTjhhNEdCK3FNU000RUN0MmM0aUEzSmw2?=
 =?utf-8?B?b0hyS2RydUNkQlRvRGlkMTV3aGxwcGlvbW5GbjVpM0krbDFvYXhHM3JhR3lU?=
 =?utf-8?B?bXhFTkpmcGdUWkhqK3RaNUZKMjBEWGRrVEZEZk12NERLVi9mYVdwSGVQSzN0?=
 =?utf-8?B?Q0phSEJ4VnBHWlhrUmI2dmFqTHJqd1MzQUhlWXM1SFFsVVREQ2J0dzZreVVM?=
 =?utf-8?B?Y1hZY1VNQkdKRCtWK0huUDBmV3VoRlY5cktwRWs5ZUtpcE1iNWhtamc0T25K?=
 =?utf-8?B?b2R1UFIrbDBYMS8yQ0dOSVJrNGxJMXFScTBSOFM5NVhmaUk2VUFPc1h3a2hU?=
 =?utf-8?B?Y0c3T3NCNXl1aDZxRGw5R1dYaWF6dXJ0WVNNdTM5cVZYL2svUkRWbmk0WGp3?=
 =?utf-8?B?cWFzRVlGY0YySGlZMUh5NnBuR3ZtS1RESHdrK0plSktNQytPVFFjamZYaGRT?=
 =?utf-8?B?dmVlZ0tIOEptNjByc3NHZUxPRG9MaUlYY0JiUHIyUHhMVjRiZnE2dTg4MUZF?=
 =?utf-8?B?MTVQRW5rTGhpTGlqM1dqcXExMDN5R2NZVjB3cWl5Zk94ZUQrSWVUcCtWNlVO?=
 =?utf-8?B?WTlWcW51eU5paU9NM2hBWDhqZml6TWNQczF6UzlidEREYms3b2dHMjI4THFY?=
 =?utf-8?B?M2krLzUzdnpkQnhDMDh3Tmp3MkoxSVN1QmdSclA4ekFWZFV5V3VlUnR5aWFq?=
 =?utf-8?B?T1BrUmNxYlZnbmozWGJjY05vZ1VxTWNMeFdkSnVIWSsxcDZ4KzVERkNGUmcx?=
 =?utf-8?B?YXRQcTNybGdLRjJyRTZ6MkxmTG1DTCs2NStmM0tHdFlPdXlmQVR5YUJjelZv?=
 =?utf-8?B?c0ErWGw1c09FOEQrejQraTZobCtYenJ3aEVOajQ1ZEtxZ1dpdXFpRE1xVVpy?=
 =?utf-8?B?SUpoc2RoQnNvMGNRNEhLSzNQbC81ZlJ3Wm1KVURWcWs4Vk9EZGtFZHMyS3Fz?=
 =?utf-8?B?SHZrRXZQQnVsRnA5M1E5OTF3cjg0anM3MWJuNzB4czdhUWU4NUhtZDFrTm5s?=
 =?utf-8?B?MkZCY1J1RGQ3NllPVTRnL2VEWGNDeksxS3BPK1pGWEoyemM5SklvSmJWdGpF?=
 =?utf-8?B?QzI0OXN2bkR1OTdKZk54Z3gwd3MzVURxVE5WQk9MTWJkNmFvbUx1am5yYTVm?=
 =?utf-8?B?RzNLbzRhZkgrdDBMdXJQaUpFQlRxbWhUL0x0NVNXd0wyZEJya1EwYUJGb1dH?=
 =?utf-8?B?ejBOSTl0MVJTY09oWmQwRWp3ZlQzWklSMVZsV0FTWXpDN2ppTklFZU5FZmg4?=
 =?utf-8?B?UUtHc0RGMy85VW1tUHZrbk5ZWFhoMXFocVE1aXF3SEs2Qm1FODh5TWQ4cTVE?=
 =?utf-8?Q?QazN6dHWnt5Rg2QDk9+aLN195ma9D3iwJjF1KNML19vEV?=
x-ms-exchange-antispam-messagedata-1: 3q+ikdUy8OQ9PQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D09CDBF5E64EE44BC78381F5EC6D5DD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HGf1AXlB32TRBpXBvVHTRewM2elT9fZw/09X4Yh5UDB4TB+RV0mZfEkqJKyVEYhgoxa0Mlgwt28sQhGYrp25Q/+cDjDvNYZS61eokPYrYOZo4YEL9fa0dbgF5IflLsK1bspixfYcQDp2ofxJ2FTvuJB/RqHBHv7Kmew89g3MWoSF7KMQ2GJ0Mpo+/wCPTXtLEtG6MNf69DMNGprhhzpYK1HKikAnOyBP7GoJwoFbLaHoLEiw6TntvKyGNyIaC37zxdw8qcMnyNDxCP1f7IH6k/qX3Qj9083Kr/rETFvOI9u4LUhV/gmnnUxkXutq1TgIRZ5wAo33w5DeDXA13nHYHQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e5574b-032e-4c1b-9733-08dea43c6d63
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 09:07:37.3354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3xBwIz8wA79cnk3B3TnhU3cunB5695bgZmsVurB0rgR1K25FZXqeuJdelI9Ay22Kk/y2LoRJEsSpTA6uAiYQ2dr1DP5aw4sQp2X8y2EDgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6341
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

SGksDQoNCkF0dGFjaGluZyBhbiByZXZpZXcgZnJvbSBDbGF1ZGUgd2l0aCByZXZpZXctcHJvbXB0
czoNCg0KVGhhbmtzLA0KVGhvbWFzDQoNCg0KDQpjb21taXQgZTQzYjFiYmUyMjliMjY4YmM1ZTVm
M2UxMjEzZTA2N2Q0YWM4YzRiMg0KQXV0aG9yOiBTb2JpbiBUaG9tYXMgPHNvYmluLnRob21hc0Bp
bnRlbC5jb20+DQoNCnRlc3QvaW50ZWwveGVfdm06QWRkIG92ZXJzdWJzY3JpYmUgY29uY3VycmVu
dCBiaW5kIHN0cmVzcyBzdWJ0ZXN0DQoNCkFkZHMgYSBtdWx0aS1wcm9jZXNzIHN0cmVzcyBzdWJ0
ZXN0IHRoYXQgb3ZlcnN1YnNjcmliZXMgVlJBTSwgYmluZHMNCmxhcmdlIEJPcyBmcm9tIGVhY2gg
Y2hpbGQgcHJvY2VzcyBzaW11bHRhbmVvdXNseSwgYW5kIHZlcmlmaWVzIEdQVQ0Kd29ya2xvYWRz
IGNvbXBsZXRlIGNvcnJlY3RseSB1bmRlciBldmljdGlvbiBwcmVzc3VyZS4NCg0KPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaW50ZWwveGVfdm0uYyBiL3Rlc3RzL2ludGVsL3hlX3ZtLmMNCj4gaW5kZXgg
ZDc1YjA3MzBkLi41MjQ2YTg1NGEgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3ZtLmMN
Cj4gKysrIGIvdGVzdHMvaW50ZWwveGVfdm0uYw0KDQpbIC4uLiBdDQoNCj4gK3N0YXRpYyB1aW50
NjRfdCAqDQo+ICt2bV9iaW5kX2JvX2JhdGNoKGludCBmZCwgc3RydWN0IHhlX3Rlc3RfY3R4ICpj
dHgsIHN0cnVjdCBnZW1fYm8NCipib3MsIGludCBzaXplKQ0KPiArew0KPiArCXVpbnQ2NF90ICp1
ZmVuY2U7DQo+ICsJc3RydWN0IGRybV94ZV9zeW5jIGJpbmRfc3luYzsNCj4gKwlzdHJ1Y3QgZHJt
X3hlX3ZtX2JpbmRfb3AgYmluZHNbc2l6ZV07DQo+ICsJaW50IGk7DQo+ICsNCj4gKwl1ZmVuY2Ug
PSBjYWxsb2MoMSwgc2l6ZW9mKHVpbnQ2NF90KSk7DQo+ICsJKnVmZW5jZSA9IDA7DQo+ICsJaWd0
X2Fzc2VydCh1ZmVuY2UgIT0gTUFQX0ZBSUxFRCk7DQoNCkRvZXMgdGhpcyBkZXJlZmVyZW5jZSB1
ZmVuY2UgYmVmb3JlIGNoZWNraW5nIGl0PyAgY2FsbG9jKCkgcmV0dXJucyBOVUxMDQpvbiBmYWls
dXJlLCBub3QgTUFQX0ZBSUxFRC4gIFRoZSBkZXJlZmVyZW5jZSAoKnVmZW5jZSA9IDApIGhhcHBl
bnMNCmJlZm9yZSB0aGUgYXNzZXJ0LCBhbmQgdGhlIGFzc2VydCBjaGVja3MgZm9yIHRoZSB3cm9u
ZyBzZW50aW5lbCB2YWx1ZS4NCg0KSWYgY2FsbG9jKCkgZmFpbHMsICp1ZmVuY2UgPSAwIGNyYXNo
ZXMgYmVmb3JlIHRoZSBhc3NlcnQgaXMgcmVhY2hlZC4NCkFuZCBldmVuIGlmIHRoZSBvcmRlciB3
ZXJlIHN3YXBwZWQsIE5VTEwgIT0gTUFQX0ZBSUxFRCB3b3VsZCBjYXVzZSB0aGUNCmFzc2VydCB0
byBwYXNzIHdpdGggYSBOVUxMIHBvaW50ZXIuDQoNClNob3VsZCB0aGlzIGJlIGlndF9hc3NlcnQo
dWZlbmNlKSBwbGFjZWQgYmVmb3JlIHRoZSBmaXJzdCBkZXJlZmVyZW5jZT8NCg0KPiArCSp1ZmVu
Y2UgPSAwOw0KDQpbIC4uLiBdDQoNCj4gK3N0YXRpYyB2b2lkIGNyZWF0ZV90ZXN0X2JvcyhpbnQg
ZmQsIHN0cnVjdCB4ZV90ZXN0X2N0eCAqY3R4LA0KPiArCQkJICAgIHN0cnVjdCBtZW1fYmluZF9z
eW5jICpiaW5kLA0KPiArCQkJICAgIHVpbnQzMl90IHBsYWNlbWVudCwgdWludDY0X3QgKmFkZHIp
DQo+ICt7DQo+ICsJCXJldCA9IF9feGVfYm9fY3JlYXRlX2NhY2hpbmcoZmQsIGN0eC0+dm1faWQs
IGJvLT5zaXplLA0KPiArCQkJCQkgICAgIHBsYWNlbWVudCwgMCwNCj4gKwkJCQkJICAgIA0KRFJN
X1hFX0dFTV9DUFVfQ0FDSElOR19XQywNCj4gKwkJCQkJICAgICAmYm8tPmhhbmRsZSk7DQo+ICsJ
CWlmIChyZXQgPT0gLUVOT01FTSB8fCByZXQgPT0gLUVOT1NQQykgew0KPiArCQkJYmluZC0+bl9i
dWZzID0gaTsvKiBzdG9wIGNyZWF0aW5nIG1vcmUgKi8NCg0KQ2FuIHRoaXMgT09NIHBhdGggZXZl
ciBiZSByZWFjaGVkPw0KDQpfX3hlX2JvX2NyZWF0ZV9jYWNoaW5nKCkgY2FsbHMgX19feGVfYm9f
Y3JlYXRlKCkgd2hpY2ggcmV0dXJucyB0aGUgcmF3DQpyZXN1bHQgb2YgaWd0X2lvY3RsKCk6DQoN
CgllcnIgPSBpZ3RfaW9jdGwoZmQsIERSTV9JT0NUTF9YRV9HRU1fQ1JFQVRFLCAmY3JlYXRlKTsN
CglpZiAoZXJyKQ0KCQlyZXR1cm4gZXJyOw0KDQppZ3RfaW9jdGwoKSBpcyBkcm1Jb2N0bCgpLCB3
aGljaCByZXR1cm5zIC0xIG9uIGlvY3RsIGZhaWx1cmUsIG5vdA0KLWVycm5vLiAgU28gcmV0IHdp
bGwgYmUgLTEgb24gYW55IGFsbG9jYXRpb24gZmFpbHVyZSwgbmV2ZXIgLUVOT01FTQ0KKC0xMikg
b3IgLUVOT1NQQyAoLTI4KS4NCg0KQ29tcGFyZSB3aXRoIF9fX3hlX3ZtX2JpbmQoKSB3aGljaCBk
b2VzIHRoaXMgY29ycmVjdGx5Og0KDQoJaWYgKGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX1hFX1ZN
X0JJTkQsICZiaW5kKSkNCgkJcmV0dXJuIC1lcnJubzsNCg0KV2l0aCBfX194ZV9ib19jcmVhdGUo
KSBtaXNzaW5nIHRoZSAtZXJybm8gY29udmVyc2lvbiwgdGhlIEVOT01FTS9FTk9TUEMNCmNoZWNr
IGhlcmUgaXMgZGVhZCBjb2RlLiAgQW55IEJPIGFsbG9jYXRpb24gZmFpbHVyZSBzaWxlbnRseSBj
b250aW51ZXMNCnRoZSBsb29wIHdpdGggYm8tPmhhbmRsZSBsZWZ0IGF0IDAgKGZyb20gY2FsbG9j
IHplcm8tZmlsbCksIGFuZA0KYmluZC0+bl9idWZzIGlzIG5ldmVyIHJlZHVjZWQgdG8gcmVmbGVj
dCB0aGUgYWN0dWFsIG51bWJlciBvZg0Kc3VjY2Vzc2Z1bGx5IGNyZWF0ZWQgQk9zLg0KDQpbIC4u
LiBdDQoNCj4gKwkJaWYgKG5fdnJhbV9idWZzKQ0KPiArCQkJdnJhbV9iaW5kLmJpbmRzX3VmZW5j
ZSA9IHZtX2JpbmRfYm9fYmF0Y2goZmQsDQomY3R4LCB2cmFtX2J1ZnMsDQo+ICsJCQkJCQkJCSAN
Cm5fdnJhbV9idWZzKTsNCj4gKw0KPiArCQlpZiAobl9zcmFtX2J1ZnMpDQo+ICsJCQlzcmFtX2Jp
bmQuYmluZHNfdWZlbmNlID0gdm1fYmluZF9ib19iYXRjaChmZCwNCiZjdHgsIHNyYW1fYnVmcywN
Cj4gKwkJCQkJCQkJIA0Kbl9zcmFtX2J1ZnMpOw0KDQpPbmNlIHRoZSBPT00gZGV0ZWN0aW9uIGlu
IGNyZWF0ZV90ZXN0X2JvcygpIGlzIGZpeGVkLCB0aGlzIGJlY29tZXMgYQ0KcHJvYmxlbS4gIGNy
ZWF0ZV90ZXN0X2JvcygpIG1heSByZWR1Y2UgdnJhbV9iaW5kLm5fYnVmcyB3aGVuIGFsbG9jYXRp
b24NCmZhaWxzIHBhcnR3YXkgdGhyb3VnaCwgYnV0IHZtX2JpbmRfYm9fYmF0Y2goKSBpcyBjYWxs
ZWQgd2l0aCB0aGUNCm9yaWdpbmFsIG5fdnJhbV9idWZzIGNvdW50Lg0KDQp2bV9iaW5kX2JvX2Jh
dGNoKCkgdGhlbiBidWlsZHMgYmluZCBvcHMgZm9yIEJPcyB0aGF0IHdlcmUgbmV2ZXINCmNyZWF0
ZWQsIHdpdGggaGFuZGxlPTAuICB4ZV92bV9iaW5kX2FycmF5KCkgYXNzZXJ0cyB0aGF0IHRoZSBp
b2N0bA0Kc3VjY2VlZHMsIHNvIGEgYmluZCB3aXRoIGFuIGludmFsaWQgaGFuZGxlIGFib3J0cyB0
aGUgY2hpbGQgcHJvY2Vzcw0KcmF0aGVyIHRoYW4gYmVpbmcgaGFuZGxlZCBncmFjZWZ1bGx5Lg0K
DQpTaG91bGQgdGhlIGNvdW50IGFyZ3VtZW50IHVzZSB2cmFtX2JpbmQubl9idWZzIGFuZCBzcmFt
X2JpbmQubl9idWZzDQphZnRlciBjcmVhdGVfdGVzdF9ib3MoKSB1cGRhdGVzIHRoZW0/DQoNCg==
