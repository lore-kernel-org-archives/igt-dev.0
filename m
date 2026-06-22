Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C541ECDB46B
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 05:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBC710E4A2;
	Mon, 22 Jun 2026 05:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MoRe7zGe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D155E10E4A2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 05:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782105897; x=1813641897;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8TsGYKtE8H7LL15hq/g4khrLR6C2h+pUNc5IMoENG2Q=;
 b=MoRe7zGeDE07dvVFh3AoRXDSuFYYMUfsZb7lkla5q7n2YgH/rTV5lTH4
 EH7Fpl5bU8qOQ5tUmmqvoO29ar2w0vAv2OVWzC2rVY+BAdXd4I6iOAyNS
 qs7scinTWAJ3QkE58VwuuHyJaLmGQaviA4CuVDrE/Zqom7YASGDdRjzoq
 eP7L6hB+5ITZmXl3fTBE6NerfV0O2ejrqMM2DKF/tk2KXa3k2HA5RrYq5
 DADtogxAu37rEzs169OyGeE3XHgdbAvyoIV7Fq1Hn8R8Md/zaf+XDeRyr
 D3bcQOxwhsTPDqVf2CoPilEQOtloHUa+MA6cP5eQa8DdLc1ecCrGoPelg w==;
X-CSE-ConnectionGUID: 1dRRQ6opRY+AdJf1yIqvGQ==
X-CSE-MsgGUID: 1clZOoZmQpu3pu8apevsRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82871076"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82871076"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 22:24:56 -0700
X-CSE-ConnectionGUID: OQeQA4UPQGuQDoHBfVR5hw==
X-CSE-MsgGUID: bS3zaf4ATpaqgAqLU5Wn7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="253027725"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 22:24:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 21 Jun 2026 22:24:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 21 Jun 2026 22:24:55 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 21 Jun 2026 22:24:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuLxBGHpPd+kcIcyb3W0iCiEaQm8WoL3EH3eFYKZ+voI9esKwvPA7353RFyrGWj0vCfiRV20PLlskGa4HGWZAVZ/E3/2nUELcdbXx+WNm7i83ADeHpR/LO+LTsEVDdWs7Kk3xYNGpJ1Ahlw77X5/JdZIJPNOlaPpKE3ssm8cvXiMzYHMJ2lbM5jBU9QkwhAh+iEMGPpUXZ4jqNrXBV2gGHWSjbxkxh7WDVpi6/UPNyz0wkrMSEw7otr4KA++a4XX4qw3MDVEFdsBByL+DppiDNfhZiHZ83bybsnQSRrnsL4SfTBij92RuAlRU0v1W3BKgg74yqV35dapuvY/Cs3VQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TsGYKtE8H7LL15hq/g4khrLR6C2h+pUNc5IMoENG2Q=;
 b=nuQLvCtOkRJnTF7CkeyVwHlSe9MlzvcnjSC3AcoWKtK1GEYlllJl+h50I2v5gLhSQoRwmyklXjl2jXX4kUQoYSM8adYKAX9Z7ua2OQ4VW6KRnzW/hMjwGK6tOhLADR9GE1n9AW9GkOLw47nBX8nqTl9WDe/d5cIpC30XpvEm6gOgif0aC6kvLpeppWLkbQeyNx2r1yqBJc0Jcndv0ldtsvbPryHspuuPeHS/xNv0i+9Zalk4eA9E7Q1AKYUGMu6KeMWKQ9tBqDwiHtb4exye1IOflQH9nlVZJfq8a1NB9Wez5FOLWbPTS02K0R8yek2nea1OjZ3lJrNx469Z5SIFkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5863.namprd11.prod.outlook.com (2603:10b6:510:135::11)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 22 Jun
 2026 05:24:45 +0000
Received: from PH7PR11MB5863.namprd11.prod.outlook.com
 ([fe80::de6b:62df:5aca:9225]) by PH7PR11MB5863.namprd11.prod.outlook.com
 ([fe80::de6b:62df:5aca:9225%6]) with mapi id 15.21.0113.020; Mon, 22 Jun 2026
 05:24:44 +0000
From: "Balasubramanyam, Smitha" <smitha.balasubramanyam@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH v2 1/3] tests/intel/xe_ccs : Add helpers and Negative test
 for VM_Bind Decomp
Thread-Topic: [PATCH v2 1/3] tests/intel/xe_ccs : Add helpers and Negative
 test for VM_Bind Decomp
Thread-Index: AQHc/MIkua4c60eyiUmZSGfG9iiJg7Y/1+WAgAABUICACjrCoA==
Date: Mon, 22 Jun 2026 05:24:44 +0000
Message-ID: <PH7PR11MB58630EAE29905C52CC33E31085EF2@PH7PR11MB5863.namprd11.prod.outlook.com>
References: <20260527054210.2147520-1-smitha.balasubramanyam@intel.com>
 <20260615123109.2286386-1-smitha.balasubramanyam@intel.com>
 <20260615123109.2286386-2-smitha.balasubramanyam@intel.com>
 <33f7ab9b-7d81-403f-b506-5f56edaa1aef@intel.com>
 <a476ed75-f3ce-4859-846b-f5d5f0968be8@intel.com>
In-Reply-To: <a476ed75-f3ce-4859-846b-f5d5f0968be8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5863:EE_|SJ2PR11MB7620:EE_
x-ms-office365-filtering-correlation-id: d5cc879d-457f-4461-6206-08ded01e91e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|4143699003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: /yETuF/AUHTCC+eDvkSTr7BRP1/OjTHJAG3lDtmqdsSElIY/Vyb3No32vlxPzXjXkk1sO1XQ/X/50nk2WIDh9sLoRniRHNjVQJryfeNx3lwi114A2WtYnsYXmDoS/vjdgZrTEWZCR1xIbj1eUCvvQtijAE/mrO3yFTD9btFDVG+QxcPDceuhP2DM4ai6m85dfVvGfx2LNzuoWcBAXu3NqtHGyXRuy4ad4hpR9syCZrLnswedSR/w4lPUOY1gSFoaN2Jwr3rWSHREqXO10X7WUlew/HwfzHrp3qGpibpwP81KHK7IbgB/WJVFkqYmAY9mAVSDyg6fxbwwXu/XHmEV4L2j/o1YfV5zzjcrtPzKXHengCDQBtvsXeUuuZMPvg1JQUtmZLKG1RKGFifwTzHOKYefZGmC4ncOsjTnfc1jWT7pyp9jr6lxdmb9M51r60CNsmtAw7vbE/XdhBJagVsj4IDdJGms6Bd5HTUfND0JYhxogbosZ4Az7ZAgWTecwYbYsTJo/8CZjJxLTZjJ+Y4+LGOjAlDJRSxlEBtGXooX0tHlWSklPObp2/O5JaL1HbJF5wfzGr5n9OFCkJZW41+cuZSVEGaluqWJbiq+stnsOQsqgXMaNaXtdGetXtPGutkWRIr06Gk+yN3qG5eXgZD0upd7y2hqZbbKFV0VQMTFi6JLKMlwPpULEPcVGtNJh/H0m89n0ePbT+jXJdP818dQweY7INBt6RXqmKwLy3/2QFo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5863.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VllVaFVSNVVwdXhPbHJzclRseDExd1dRa2UrSVVnV1Ixd3VSYjNyVy9CQW1J?=
 =?utf-8?B?UXRYQmM2bE1lS2lRZFNURTQ3UERLS2JRUzNxek1jT0lkVGJtNmZGL0R3ZU5k?=
 =?utf-8?B?ckNJSlZKeUt4TTdMK0JOMzFhV1k1RmNXYUJabUZaL2pMZklMcVczR2ZZZzNX?=
 =?utf-8?B?bkNnd0YxOFUyL0l3Y3AzRHMrMWgxcit0YUdQZ1IzRXhlWmNyY3VhNmZmaW9R?=
 =?utf-8?B?cVlJMWVHZXVMOFVxSi85SGpDNUlHNUVXKzF1MUs0WFVtUmwvQkU4VE1vUjNv?=
 =?utf-8?B?RUZWbitVTVJCOExxUVl2c2JwaGRLT1NFaGJ2VmpabzRMMzZkOW54Q0d6YWor?=
 =?utf-8?B?UlVCcVZkVktoa0RwUC9KSWVLWUVYMWdBYm1hL1JrT2x2SGJ1azZ6TTdBcExL?=
 =?utf-8?B?d1o0Q3Zwd0xYYmJkeGthQVZ2NUczWXZ4TE01OUlFU3Y5NnZwQjZ4L2ZURjhY?=
 =?utf-8?B?QnZtMjNmeVlkQzg4aTU2MEQvUXpKbnNLYXcrckVHQkc1T3BhUTAxRXcwbGZl?=
 =?utf-8?B?cGVUSCtiNHRiVEZ3RTZ2ZHZleVpvbUtGUmdKeHRlWWU5dWJPL3l1eHQzTkV2?=
 =?utf-8?B?QmtzRGlOaXhEMUdCNEQ2TFJEVTVUTjRRMzBhNStXOC9GRElIRlI5WXp0RzBX?=
 =?utf-8?B?dEFpUVU4MkJxMytnZGVVRzh2NHhzSHJGeHBFYU9EVVhZN3hwYmNEcDNGbnFE?=
 =?utf-8?B?VjlhWmdiSitFRUZORlB2YXJpUGtyajl3ME9UcnF6emlyL2VDUnVQcDRFa3lB?=
 =?utf-8?B?SjJPVUVrblRRYVZHMUcrSFVvbml1WGkvcmNJaUduMEVkeWtYTGt4V3MwU1Vz?=
 =?utf-8?B?dG1rNTU4N3BISk9RU1JpbTRTbGRPTzdtSXk5bitacTNER0VDcU95NmQ2TDdU?=
 =?utf-8?B?NFdOQ1VVK1F2NHVadVdPd0JUUUZLNUEwSHJZbmdUS0Npb05TbFBaN05Sd3ZV?=
 =?utf-8?B?Vy9vVC9vZFZqZHRaU3NsVGlvVGJIa1U3K2NLYnNnNitjRHNqR0k2aGEwYXRZ?=
 =?utf-8?B?ejdleVd4dnVsQnRTMkNMSzlDQXZwempjaXBYaUFWeVQ2WWF3eEFVMHNrZnV6?=
 =?utf-8?B?ZFVVUnU1eGp4VmtZQWZ5Q1RrYVhmTlI0WTFCVmQxR1ZNNHBaQXZsNDJKVEh3?=
 =?utf-8?B?cDNmRE9YTjNHVE9IalgzMUdPMjR0c1MvdlF0TGVWQXdGRFJEdzNTdGtaM1Fr?=
 =?utf-8?B?WUZhMFYvays3OGJjTXNCa2l3cE45RWk2TFhndmUrZW9GMnlYQWhKT3IrWjV0?=
 =?utf-8?B?d25FQUVFamdBeDEvU0JWaUIwYjBHdVJtRXA5QnU1aGVmbWNxTGxiV3lyVEJT?=
 =?utf-8?B?MEI5WmRodFVNNjU3LytVdlVYeVdkYmFIUmhLK09WYk1mWEtNQTZ0S3FrR2hX?=
 =?utf-8?B?eTdPZGVDZFoxY2wyalR1cWxxT2gyR3FNclRnUzNLc1Irc0xWNVo3N0x1eVI3?=
 =?utf-8?B?K0dsbmwxWnRSTVlvcS9YRHZrUDhsa2REdCtlb0JvRFhWNlZ0aG8vS050OU10?=
 =?utf-8?B?RFpZR2xNdjJCMjljdUprK3hUblkyVmRIUENiVm81Z01lelR6b0NEOU9jZXZY?=
 =?utf-8?B?U2ROQzY4ekdIN2FVQzZoTjBkaGFNb2lHN1p6bFN1d0hIcjliMHZBbWZTWDdW?=
 =?utf-8?B?SHpPQzcxdnpGM0xVeDc1OG8zOWx6QVN2Qk5oUjZkeERudHVXWnRFTDA4NXA2?=
 =?utf-8?B?TUlzQjdJaXl3Qjd0bzlndTRZMUlzT0hkTFR1OFdYNk8yM29kMFJrcVZNTmk2?=
 =?utf-8?B?elpUQlZLRHhzOCsyOGMzdHZQak9WSWVPYnV2SVVhSnVjc2RsZ0dLWjQxRitm?=
 =?utf-8?B?R2g0bkhxRWRXM2Fpc21XTlk1WDR6WEk1TnFOQ0IvZmJDeVpJWmo1NXZFcEkv?=
 =?utf-8?B?NDUxUTA5YXpNNGtHaTFmZzJRN0ttVXJtWi9XcncvV2xXT256eVNMZEJNM0RX?=
 =?utf-8?B?NmQ5N0R0SUExN0tqUUlMRVpQQ1ZhV1JjZldvNlovS2wrN1RQZkZYa1IxZkpF?=
 =?utf-8?B?bHpUVDRVRVJzcytFVFA5Zkt0VnRjcVdrQk5VNFlwUzgyUlcrRHZveWxtTWZ3?=
 =?utf-8?B?c1lOS1BGaUlVY1FkQjBUQ053eW1TSTlxdzgwaXN6di9BZC9zOElhL1o1OEdH?=
 =?utf-8?B?bUlZSlRCOC9WVjRDVGEvMFBQSkFqRS9CQldPRW4zTTRRSWFaUXVwWkRpTm1u?=
 =?utf-8?B?bXdNeFdWeVNTbUFJWUJxUTFwckJXWnlWbVJONVorTUhoT0tXa1ExTk1xVjRT?=
 =?utf-8?B?YkdZQ0xwYXczTlBwZHZZNURaL25MZmloZkY5RGZEYUxQSmI0b1FFaGVwNmM2?=
 =?utf-8?B?R2ZjeTNZYm55SXduVEpxdmV1TFBHTDB6NEc2TnplKzNCb3pGamZsNkVoMnU5?=
 =?utf-8?Q?SDuSZK537DN+mkEI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UDe9Zx6g5tjgloLgPjFaXBI9ScR4iqY5DRCbvW0KwnWsYCFXSjoFcOQzvUvDzIm4S83mieaiget8rW2fLqbS7lWT/kGHsHcrpzwsgV4w6zUGcKVjomZhNGV9u4joD87RbUT77KxzH/viLXlTIsmr5CDkD53Si/bE8CWNxCpWLZUyqpGnp4IB+Nf+q+wiIxmlJ+DZAUvhoaDWy/luoKvOhZ5tcYQHIjE6bzXG8bBXQP66MCvzmOP5duV8A7zi+1arPJuMHya/m2Dz8yh3cN+rSYLf+N9GNgUP7o2l00RUeYIwsLOJIMQZrzqwhIuzqoX9fMQRD68GYUUBACwmEJV0qA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5863.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5cc879d-457f-4461-6206-08ded01e91e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 05:24:44.7964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XZtzA6aWizp5frWKSKXOR7hTz9L/VnaV/hcwq0wnmGw1gV6O619alYjFV4Qf15I+znLFUnj7teaV67fFj3/bipt0cpdSrMqCpjAs1t4XXejwvMBa6UT4Z/xjX+GoorPM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
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

DQpPbiAxNS8wNi8yMDI2IDE4OjAyLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+IE9uIDE1LzA2LzIw
MjYgMTM6MzEsIFNtaXRoYSBCYWxhc3VicmFtYW55YW0gd3JvdGU6DQo+PiBJbnRyb2R1Y2UgZGF0
YSBzdHJ1Y3R1cmVzIGFuZCBoZWxwZXIgdXRpbGl0aWVzIHVzZWQgYnkgdGhlIFZNIA0KPj4gbmVn
YXRpdmUgdGVzdHMgdG8gdmFsaWRhdGUgdGhlIFZNX0JpbmQgRGVjb21wIGZlYXR1cmUNCj4+DQo+
PiBUaGVzZSBoZWxwZXJzIHByb3ZpZGUgcmVzb3VyY2UgbWFuYWdlbWVudCBhbmQgc2V0dXAvY2xl
YW51cCBsb2dpYyANCj4+IHRoYXQgc2ltcGxpZmllcyB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhl
IHRlc3QgY2FzZXMgaW50cm9kdWNlZCBpbiANCj4+IHN1YnNlcXVlbnQgcGF0Y2hlcy4NCj4+DQo+
PiBPbmUgZnVuY3Rpb25hbCBzdWJ0ZXN0IGlzIGludHJvZHVjZWQgaW4gdGhpcyBwYXRjaC4NCj4+
IFRoaXMgdGVzdCB2ZXJpZmllcyBoYW5kbGluZyBvZiBpbnZhbGlkIFVBUEkgUGFyYW1zIGluIE5v
bi1mYXVsdCBNb2RlLg0KPiANCj4gV2h5IGlzIHRoZXJlIHNvIG11Y2ggY29kZSBiZWluZyBhZGRl
ZCBpbiB0aGlzIHNlcmllcz8gVGhlIG5lZ2F0aXZlIA0KPiB0ZXN0cyBzaG91bGQganVzdCBiZSBj
aGVja2luZyB0aGF0IGFuIGlvY3RsIGdldHMgcmVqZWN0ZWQsIHdoZW4gZG9pbmcgDQo+IHZhcmlv
dXMgYm9ndXMgdGhpbmdzPyBTZXJpZXMgaXMgYWRkaW5nIGxpa2UgKzEwMDAgbGluZXMgb2YgY29k
ZT8gV2hhdCBhbSBJIG1pc3Npbmc/DQoNCj5BbHNvLCBpZiB3ZSBkbyBuZWVkIGFsbCBvZiB0aGlz
LCBjYW4gd2Ugbm90IGV4dGVuZCB0aGUgZXhpc3RpbmcgY29kZSBpbiBzb21lIHdheSB0byBoYW5k
bGUgdGhlIG5lZ2F0aXZlIHRlc3RzPw0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4gDQoNClRo
ZSBtYWpvciBibG9hdCBpbiBwYXRjaCAxIGlzIGNvbWluZyBmcm9tIHRoZSB0d28gcG9zaXRpdmUg
Y2FzZXMgSSBpbmNsdWRlZCBpbiB0aGUgYmFkLXBhcmFtcyB0ZXN0IChkZWNvbXByZXNzLWRlZmF1
bHQtcGF0IGFuZCBkZWNvbXByZXNzLWdwdS13Yi1wYXQpLiANCkZvciB0aG9zZSBjYXNlcywgSSB3
YXMgbm90IGp1c3QgY2hlY2tpbmcgaW9jdGwgb3V0Y29tZSwgYnV0IGFsc28gZG9pbmcgZnVsbCBt
bWFwICsgcGF0dGVybiB2ZXJpZmljYXRpb24gKyBtZW1jbXAsIHdoaWNoIGlzIHJlYWxseSBwb3Np
dGl2ZS10ZXN0IGNvdmVyYWdlLg0KSSBwbGFuIHRvIG1vdmUgdGhvc2Ugb3V0IGludG8gYSBzZXBh
cmF0ZSBmb2xsb3ctdXAgcGF0Y2guDQoNCkZvciB0aGUgZmF1bHQtbW9kZSBiYWQtcGFyYW1zIGNh
c2UsIHRoZSBpbnZhbGlkIHBhcmFtZXRlciBjb21iaW5hdGlvbnMgdGhlbXNlbHZlcyBhcmUgdGhl
IHNhbWUgYXMgdGhlIG5vbi1mYXVsdC1tb2RlIGNhc2UuIA0KSSBzcGxpdCB0aGVtIGluIHYxIG1h
aW5seSBiZWNhdXNlIHRoYXQgZm9sbG93cyB0aGUgY3VycmVudCBwYXR0ZXJuIGFscmVhZHkgcHJl
c2VudCBpbiB4ZV9jY3MuYywgd2hlcmUgZmF1bHQgYW5kIG5vbi1mYXVsdCBwb3NpdGl2ZSBwYXRo
cyBhcmUgc2VwYXJhdGUuDQpUbyByZWR1Y2UgZHVwbGljYXRpb24sIEkgcGxhbiB0byBmb2xkIHRo
ZSBmYXVsdC1tb2RlIGFuZCBub24tZmF1bHQtbW9kZSBiYWQtcGFyYW1zIGNvdmVyYWdlIGludG8g
YSBzaW5nbGUgaW1wbGVtZW50YXRpb24gZHJpdmVuIGJ5IGEgY29uZmlnIGZsYWcsDQp3aXRoIHNl
cGFyYXRlIHN1YnRlc3QgZW50cnkgcG9pbnRzLiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhpcyBp
cyBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uLiANCg0KSSBpbml0aWFsbHkgd2FudGVkIHRvIGtlZXAg
dGhlIG5lZ2F0aXZlIHRlc3Qgc2VsZi1jb250YWluZWQsIGJ1dCBJIGFsc28gc2VlIHRoYXQgdGhl
IHNldHVwIGlzIGFsbW9zdCBjb21tb24gYmV0d2VlbiB0aGUgcG9zaXRpdmUgYW5kIG5lZ2F0aXZl
IHBhdGhzLg0KU28sIHRvIGNvbnRhaW4gdGhlIGNvZGUgYmxvYXQsIEkgcGxhbiB0byByZWZhY3Rv
ciB0aGUgZXhpc3RpbmcgcG9zaXRpdmUgbm9uLWZhdWx0IGNhc2UgZmlyc3QgYW5kIHRoZW4gcmV1
c2UgdGhlIGNvbW1vbiBzZXR1cCBwaWVjZXMgZnJvbSB0aGVyZS4gDQpQbGVhc2UgbGV0IG1lIGtu
b3cgaWYgdGhpcyBpcyBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uLg0KDQoNCg0K
