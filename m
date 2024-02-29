Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD20C54798
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 11:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC8110E457;
	Thu, 29 Feb 2024 11:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nY7mhBjo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0587810E458
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 11:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709204806; x=1740740806;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SxlGiEMEfCTLxwry3i7yPCNqH0Bo1w4e0Rmq4S6Hb5M=;
 b=nY7mhBjolN7GBE5e+rookrKUnwGyD4jgG9EX58Rs45AU4/5U2qNJuJgh
 PwBDzzNox0yJpSHK0tWB3BYs1IOLVhEKlX6nekiggf0idTw1xCcG2xndb
 d1dXFaeKOpqosOaIRvu7gLXemQaStQMvexUlwjyMg3SFe2ZhzBBoNTnT3
 c5SKQqjWCUMNnMPpZ3Imf5Iz850dUCqjL6ksDVJFQWcpuzqPKF1LRsnkX
 EIVROpfbidnHNMPfZ0G2zHa0NoC0X+XHVkJ1NNPw24ceekv2UEim7mRot
 rQaZz7isyIZ0TtCYHh1INpelkQ1wvjH2RzS7raNmxu+rtRZM0aLnD52Xw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14302743"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14302743"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 03:06:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12442468"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 03:06:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 03:06:44 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 03:06:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 03:06:44 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 03:06:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l76yVuRUnZvqfPGwclUgDFelROfFpVJ7hwsHirVYby0d5X9yi56faiWgTgASzjAIHIWQoO10LEpK9hu/Z+4ClUZPCUOxkGnQZ/kmVjpwyo9N7dlcfCsATuNCS5nCSCr74kxgaUg5XYtEdT/Jf62bE/ElLU4Aqa0cG60toYtRnI+meqLfpcUoX/eRwe9jBQjbBe4llxsu5KLEAhEuwJYlPDIyJt5it4S5TaJ+Tvmj5BSlWrQFd8uR2LwijoFbsO5DI8riLmDC8dsY//5tzsqWiUoIyQ90KmKu/nK0lIutIPoTiAI+aoVGfVBg0HrAHo8OiZZb4TJWKP7XLUXhmKEptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxlGiEMEfCTLxwry3i7yPCNqH0Bo1w4e0Rmq4S6Hb5M=;
 b=JdEud5LXJD8Vlos5a7xaqH1ZZslL3+TqvP4hJp0X6OGqdt8Px6T2W9NM9mGMkaAi45B8FD5YznENWvNPqKPoXXnl7GG2tUET6rJChYbcp9dOH5a3UU+U/0CTFcRi1XPUlnZBmUHi5zp0BtU0qIyeThcv913FCPOZeGYgRQQZfyduSbgAIQldigudPVEjLnS/MKAiH2TbHBAGvT4GHM9cE5e2pPsaHhDOtHkE0YpLgkzuwPbFsHvzWVCWLcZmfnfZuZR9grSCQ7enj4WOd0c/32k3WMBIUxCiS8LlQVvXoNldzsDAXF7TX4i4D9u/TShvJWNS+uL4iM+2fi3qDetjGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Thu, 29 Feb
 2024 11:06:39 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7339.023; Thu, 29 Feb 2024
 11:06:39 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 4/4] tests/intel/xe_evict_ccs: use a different name
 for evict on Flat-CCS
Thread-Topic: [PATCH i-g-t 4/4] tests/intel/xe_evict_ccs: use a different name
 for evict on Flat-CCS
Thread-Index: AQHaatztFvYzVwKSi0SfnQek0tpeALEhKP5Q
Date: Thu, 29 Feb 2024 11:06:38 +0000
Message-ID: <IA1PR11MB60971B44090FC12F7109F5E6865F2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
 <20240229065953.538861-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20240229065953.538861-5-mauro.chehab@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|DS7PR11MB7783:EE_
x-ms-office365-filtering-correlation-id: d2a76945-1809-4b28-69a8-08dc391680a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nLdTOun57niw6ehZ+FRwfeYy8GTTwMecfxEtHLH0lGVzQgMVdOguIYyRL6YtsCeUOjVA0Lhp1kmExU20ZAluL8JZhSID2wF3JmmWnWtiPcSzEwCxvDNMx09HM7mSTR+xrUbjgxJ/4eZ7zjp4KT2Q4sozQXazUPcRG0TzhnsxCrx2u1eqr2tMmXVDAphZEpqqh3ZYe74MFMe8k8U2mYsIS2c5/hpAUCfy/IS7xEEt4LX5i+Nw03XOJEtGOqXFx7XKqWWbcCkXDsR229wYmxm0NAer1uY/yCu5PC4EPyZM1KJBAnU60EV8ff0jW8t5ymRZqQVl6zxEOY2lOMvwICV+9LTMNjZGxgBupX8oLxx7+cVvxiv4gu9aG598Lf0YowopCqi+ErXAXmFEOeaVSz6TXkJmvGHPvpQ2mvzFDN12Y0zxqmifdVdynBL1LfhKzfET9sQNZnbWet0oVrPz3Iln5qZg/MjBmA2TWJgdM9H9mJqto7Lf3kh+TkvKQCF4bYFadNTCt5VgtfdctuKHzaQINodkWUxsloxPgtbpEa2DQT/+7Cjw/t66o+6nTedIEwyQDfEphMvcMBv10pYt/viSXDB3sa4NZro8tdS0VKdv/4g7q6qW9URqVc5eE2J0DeBFgYwY2zpmwHaup8nY8wW+j3/Y3lxdFj7LC1KrWOKENS+EQSBknhi+KGchcwwqHS+HfKxCuE4Mqb12Yw8OXZMJ3pwmt+irft5vM9E7E5kB6jI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjIyVFBha3lwVVBzckhTT0gyRGFOZkxIYVVpakdnTnBENHM2S1NjY051RVZa?=
 =?utf-8?B?NjhxRWlOWEpBMDRxRHdvY2xHQVVkaVhPNHVSL0VZRWhjQlNYTjllNmIvR2Jq?=
 =?utf-8?B?SGRRZnl0NmoweEV1WDJHRWFMTUFpbWpUWXh4WmtiS2VKT1hvKzFaWHdqZUtx?=
 =?utf-8?B?dWx5ZS9UUVNIenI2dVRwOVVsUkpFd1M0Ulg4R0xnMmtqalNEUDU4VkpRdzN5?=
 =?utf-8?B?Rnk0QTc1Y2UxWGQ0ZjltRG1jQ3RMVTBSTVVYcVNPVjBtMzcvVkZMR1hSVTNm?=
 =?utf-8?B?SjdkMFBnL1NaTjV2UVZhQWNZUzU5SEFOR3A2YlFYMDBMUk11YzVtNGJmamFP?=
 =?utf-8?B?RzZ3NWJjeGx0b2pIMEFTMzZTMDVEK0E4UEo3N0R2VUJSdVMrVklTWlU0MjZu?=
 =?utf-8?B?cS9NZk5QRWR6ekhTWGxPY2ZzK0hMNE1VdmhQNnkxMHZ1Rk1oOE9jQlpDZzZl?=
 =?utf-8?B?T25WV2hNcWNpbnN1MXZqQ241czlaaTJEMGRodDBneTczU3dMc0drK25JMUNz?=
 =?utf-8?B?bnc0TGNOQ0cyNEhLaFU2dzhESlNnQklvRm54LzZmTlRNVjZISklkZFdaT3o2?=
 =?utf-8?B?SlNlRTFsMEs5N0ZRUjUvc3ZyYWFVdWxteFpVNXBHbFkvQkE3eW5kbG1GUE5L?=
 =?utf-8?B?V2laR0NRRFV2VFZOSjZ5T0hpcXAxRjU0dlBQOFJuTzlOZ08yTDFxNEtybnp4?=
 =?utf-8?B?ZGllMzcvT240d3F6WXd1cTV2aUprYmpaek1ZcmcwQUk0a25ydWU3OVFWV0lX?=
 =?utf-8?B?MUdML3dQS3hxSDZQcEY0L3c4c0lVbG1wY1BXejJpUDRFTlo2bGRvOW1qZzBw?=
 =?utf-8?B?ZVY2S0NUZmdGRjVhaVhOVEJlSzdxd1JTRHB1a0R3QStnNXRDUlEzd1ZGSENs?=
 =?utf-8?B?SlI1bUZnQ0RWd01UY2dVbUhSUTYvS24rZWE4V2VSSkVjTlkwVGhRVnNWeU5L?=
 =?utf-8?B?NS9CK2luQXhZN2ZZWUxHd1Z5RGY2ckdDcUxsMlI2Qmw3dFMyU2FOdWh0eWcz?=
 =?utf-8?B?SWVlRzUvdkF1aGM4Y0xBVm5rcG5FYjJjV2R6dG5iNVZTTi93OThxT1pPYW5t?=
 =?utf-8?B?NkVzb09sclEvelBaand0ZitSVVVxQTFiYVpvSmhDNGFFR2xrdE9mUzJ3SDdZ?=
 =?utf-8?B?czA3NzhXN0EyWnRiMmpHQWtTQnZPQ1FTWEpPVHNHaEZYUWJzakxxQ0M0ZUZT?=
 =?utf-8?B?c1RrbEtiYnA2MzYzUHlpeXVmVStvSElBdHJKMzZxQ1loc1RnR0NsamhrekZE?=
 =?utf-8?B?RlFWaWI2T3JHZWlQRWluQUZ0eXJMQUxIbklZeFpIYzBsNFVDbVQ3cFlOL0t0?=
 =?utf-8?B?V2ZIR2FDOC9XSElzdkpjNE02MlJySWhTT2lEMTJHOENkdmtoejJFOW5EeG9C?=
 =?utf-8?B?aVYxTmpxRHV2NWpNRWZ3K2h5bVlTai94a3IrMjNqRG9ib2ZuNXdjRXJoM1B4?=
 =?utf-8?B?YnJFWWZDclNudlVNTEhESWlxNTg2RXFEMzJYQ1NnZ2FBMm5GZ25NQWpLWGNO?=
 =?utf-8?B?OXhaNVYxRE45c0wwRm00TXNvZW01OGxNL1ZWcGhOL204NGlnNUpyUUdJTzBk?=
 =?utf-8?B?bW9OWm1rUVNaTlZuNnJlNGFoNlo3bktSS21NN0N1VTZBQkFKamlnL1JmMUlN?=
 =?utf-8?B?M3pISzA4d1AzSTlVaWdMeGlsTVRyTzRCcVl5N3hXazJZSjdER1NPc1F0YXJy?=
 =?utf-8?B?MDJMVUYzL0E4Zi8vSG9BeHN4dVpoQXE4SkU5ZDAzbVB5UzZ1YnB1OWdYa0Zm?=
 =?utf-8?B?S1kza2RUaHdFQkR1TzhGaFFPTUZPNWhNeC9xSEJqclFmUHcwWG9HN3ZNSWpq?=
 =?utf-8?B?a0JXTmNWc2xJTnlnNGg0SnRJdU1DR240NUJQV0RmUmhkQWR1b1JsNW5HZk5F?=
 =?utf-8?B?M0hoRmJLSURrR1lnYSt1Sll1UVMvaVMrY25KSi9XYWlJUGIvOUFEd01SU3VV?=
 =?utf-8?B?WHkyeGVGMlhnSDUxREhHNFpMSWJUelliaUExbFlPaXZEZG9USzMwT3kzVThu?=
 =?utf-8?B?d0FVYlk4eEVJY1dwYUlhamlSWkNPTDV2RElxZ1JqVzdkVm1zWENHTTdMc1cy?=
 =?utf-8?B?YlZuT0ZPa1FoaG1vZUpxdkFwUmJ4ZFhhem84WjE5aE9iRG5qd3lPTGlPc0dP?=
 =?utf-8?B?a2x4b0l5T3N2aHFqcHBXUjhGV3F2bENEem9wVk90SDJLNzRCTmtDclZsWWxC?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a76945-1809-4b28-69a8-08dc391680a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 11:06:38.9866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XLXM/g9ucIdp+mpTAjsnCE1PZ8cnvRqFN6XQJZlgauLgkg+iPFoVikRTkFPoOoVXggn4cR/9xA0GKwRGUz8PI9rsnwjafHxAXIvQPfUJ+eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7783
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

TEdUTSDwn5iKDQpSZXZpZXdlZC1ieTogS2F0YXJ6eW5hIFBpZWNpZWxza2EgPGthdGFyenluYS5w
aWVjaWVsc2thQGludGVsLmNvbT4NCg0KS2FzaWENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWF1cm8uY2hlaGFiQGxpbnV4LmludGVs
LmNvbT4gDQpTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMjksIDIwMjQgNzo1NiBBTQ0KVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogUGllY2llbHNrYSwgS2F0YXJ6eW5hIDxr
YXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgNC80
XSB0ZXN0cy9pbnRlbC94ZV9ldmljdF9jY3M6IHVzZSBhIGRpZmZlcmVudCBuYW1lIGZvciBldmlj
dCBvbiBGbGF0LUNDUw0KDQpGcm9tOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2Vy
bmVsLm9yZz4NCg0KZXZpY3Qgc3ViLWNhdGVnb3J5IHdhcyBhbHJlYWR5IHVzZWQgZm9yIFZNQS4g
RG9uJ3QgdXNlIHRoZSBzYW1lIG5hbWUgZm9yIGNjcy1yZWxhdGVkIGV2aWN0IHN1Yi1jYXRlZ29y
eSwgYXMgd2UgbmVlZCBhbiB1bmlxdWUgbmFtZXNwYWNlLg0KDQpTaWduZWQtb2ZmLWJ5OiBNYXVy
byBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz4NCi0tLQ0KIHRlc3RzL2ludGVs
L3hlX2V2aWN0X2Njcy5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXZpY3RfY2NzLmMg
Yi90ZXN0cy9pbnRlbC94ZV9ldmljdF9jY3MuYyBpbmRleCA1ZDZjNDRhNmIzYWIuLjM1YWU4MTUx
YWE4MCAxMDA2NDQNCi0tLSBhL3Rlc3RzL2ludGVsL3hlX2V2aWN0X2Njcy5jDQorKysgYi90ZXN0
cy9pbnRlbC94ZV9ldmljdF9jY3MuYw0KQEAgLTcsNyArNyw3IEBADQogICogVEVTVDogQ2hlY2sg
ZmxhdC1jY3MgZXZpY3Rpb24NCiAgKiBDYXRlZ29yeTogU29mdHdhcmUgYnVpbGRpbmcgYmxvY2sN
CiAgKiBTdWItY2F0ZWdvcnk6IEZsYXQtQ0NTDQotICogRnVuY3Rpb25hbGl0eTogZXZpY3QNCisg
KiBGdW5jdGlvbmFsaXR5OiBjY3MtZXZpY3QNCiAgKiBHUFUgcmVxdWlyZW1lbnRzOiBHUFUgbmVl
ZHMgdG8gaGF2ZSBkZWRpY2F0ZWQgVlJBTQ0KICAqLw0KIA0KLS0NCjIuNDMuMg0KDQo=
