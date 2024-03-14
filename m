Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C94C5475B
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 06:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B2910F8E7;
	Thu, 14 Mar 2024 06:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="itQzfFfW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2365C10F8E7
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 06:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710397601; x=1741933601;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nkPdheTrcz4dus0x+TZLgWh9CR23xIGwIAmSaBOdlVs=;
 b=itQzfFfWiohXlBwwzL5Vumqdl9rynWmLyv4YzJKzSuinD/Bj9lnvuxFY
 xxM8lbklOGhi3MNs8DRW8P5T3pRYb88VlcOngb8E2TecxhgxBhjmO3cVQ
 2qTRh0lIKhBGRf8sg35UFx6cdrvBQz/CstTSgUttoMNj43iVU3WP1bRK/
 VzkR8s0mA7TllhWab652eVM5LLN60UKDVWOC5c+CNetk5WGnflRJBvZPN
 XQ7aGWDsvx5EkL5a9iM8cIcArIV1RNo7Qs8Vechtay5a3NdYqmEsfq89F
 h+zRmLAnQ2X4tE+ngjbDR6cwEW670R/AuDQWOvDOvwFW5VG7ThgXP5fmd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15840572"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="15840572"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 23:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="12111697"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 23:26:40 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 23:26:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 23:26:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 23:26:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Te2RZgvsknI5LihIkGWKGF7PQ/QrcGPKmcuIb97nD0/dQDcQ/qfjzagalQ8KTvGOEVENzsRv9QMQM7HIbNxx6Cf6jf41frbiA+rKoIn59mIDfTg9YPO732KDfw0cf7Y7teSEsEDrtvQX+NsrqAk5InmXE5hyGUIv2g3H+gqfWm6a5qzAicLKRZr8Fl52AqCpbB+fiqkc9qpVBuDjt8YIFVZCVDZeEFtyHP6gHAq/6kD19xsZpaUoHtpBGeVBNa/BaGwL2qNA2OzOcJ+LZ6F2EM2Of92JVUMmUGeGGf/5dR8P8fXU34ouxksR692Fx9s73CFUbfSc7FAqzutOLujuxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkPdheTrcz4dus0x+TZLgWh9CR23xIGwIAmSaBOdlVs=;
 b=mLJ3+Lp1SSZ4kXH7p1RgOw6k3aTG6XHAqZJqrqhWLclwW6mHAqFLK4ua+5WkX1OfMItKa8YZv0AzXUHqBmVqqNL8nZjhG2Wcl5plSDme8AktKnC+9PkDML3xm3uhrJZx6sMPEwZWv0dc9/NO+IdqOTEc4uqydZYzpl8PShDeI0CXzbjIWIt9wEcPlzhpAolrodLMEASfSCvsSz8ZFIObzmo4q42v59xP6LEpFXHNF6STOhLvKpt/mRkX6DUZw9ChEI8jdqAnLn5Boy0drg0/vk+Up/zDPSm4fZ8Y7Xjz+N7tUcm06ekAyHUZN7JTtvd7Zo78XoeCQXPeWS5m4mg0Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by DM4PR11MB6118.namprd11.prod.outlook.com (2603:10b6:8:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Thu, 14 Mar
 2024 06:26:37 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 06:26:37 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel-ci: Unblock core hotunplug test
Thread-Topic: [PATCH i-g-t] tests/intel-ci: Unblock core hotunplug test
Thread-Index: AQHadcqZj2G/rusWu0myLp6ZuvMxRLE2xXQw
Date: Thu, 14 Mar 2024 06:26:37 +0000
Message-ID: <IA1PR11MB6097D6B4BB8A2A7A35AA396C86292@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240314044630.9816-1-himanshu.girotra@intel.com>
In-Reply-To: <20240314044630.9816-1-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|DM4PR11MB6118:EE_
x-ms-office365-filtering-correlation-id: d980c78c-5591-4338-d027-08dc43efb40c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VxwEJjnqY4AKi+RfH+PZt5P1m8Eu13x1vK9ycyG79cAnMwxy4KIzpFMshuZdU7mW0IybxPj736Za2tRIvBey23x223S4XS5PlmXFCdhA/Y9bY4Ebxo8D6A6tOGp0Z8+eP1Jl3TevmrWLg1LU2ulOyhKSoP7ES4JdR9fhQ/WV9p4ZNDCCpQMSGPVHyUT0nY73rxGJA0VB4MxHDupxivtUwRiEI53PBROCQXdwPNyehuK8xL25tDEAatayoHu+gf8IkZXRnRBkzSnzJ7HGlnzNkoVZCQZi9MWc9oGE0JvFvHtFpZbN9LPcUnguqwxBbNUr2jBDjUEBbtb/aqWBNs8gICTqoJq7HUPT8OVqxmwYtiYLaPn3X6aTYMes6UcBTw9JoZjx3/DW8G/7ldm1c107tbtx+DCX/xnYF3+snM6ezZC54cu+HH5vRzWtfOjmrWr7xJj7NQ30Ba1EBWcKbVjKx08ev0yzJkxgiy9b5WP9S0SsOiFKLCCc+wE4OORJZD/62avj4jUVjhpRoiDUp03kxnr4Dy0upjIBQWHK/FLylefL8z1hjnECq17I2MyZADITHmS2YDt+UAgCz6KvwLyW/q2CcbUPsxQURbO5CAPPsAe9AM3J22ZpFn0ztpCFGzLD8+SrivrkDZc3oB1toTiZVe39jnBaWwKapmCZ/A1Q7CyRJ1hStxxKU6YFKePaDpmYxxb6xk/JkJxxtV7v9QL+TQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEkxcHhieXU4V2JVZGY1cjBWeEtxN01wbWUySUdGVGFLbHZFNHZySkxHTk11?=
 =?utf-8?B?emZxMm9DSTZSdE1GZUsralQyRHJzZFAzcWtJdnJqTEZycTEzV2ZZc1VoQk42?=
 =?utf-8?B?WGNPd3pxUUkzbXBYMUJ6ZlRKbEp1YzRDRjFnN2wwdVhqVDdLanRYcXg5K1JP?=
 =?utf-8?B?RFNZbTRvelFGYlByUWpzMCt0VXFLUUQwMDRlZ2dSK2ZmeXBHMVk4NFpzMTNp?=
 =?utf-8?B?cDZDZkVSenFmcHZhNk0xU29IY3RiWlhsWHdybkZGV2c3eUVEVDJweU04UlRJ?=
 =?utf-8?B?WDdRN0UvZjFsUVc0NERYMURMdXAvV2s0OEVYNW1aMTBhYU9NYmgva3VPT2NI?=
 =?utf-8?B?eFVIZVZiT29kQWlOa1pZUUlYcWFHNCtxbjlCT2hGTzR4Sm5CR1hMT3lIcjdC?=
 =?utf-8?B?ZUg5eTk4Tm9IRjFuQzU1MkdmcHlNRW41Szk3d1d0enJGMWpVRjN5UmZQbGxE?=
 =?utf-8?B?b0RDUEZVeENnYzJlazRhcGFsTU5PRUZuckprL1J2emo0K3YyTVdXdlhwdEs4?=
 =?utf-8?B?NUZEelVmNzJYVjNQY2ZkWkgyS0t6TEF6NzVpNHJlYVpDR1pvVk51djdlS3M4?=
 =?utf-8?B?WnUxL201SnJ6Sk5iZ0FmcFFVU1Z1YmZjQlc4a1BtZUUwdVdUamlHcnFCWUsx?=
 =?utf-8?B?eFFJbkFsTC9QbnBwdCtsOGVWMkp6cXc0K3ltbWoxM3ZQa1E4QWhVRkJLSEpX?=
 =?utf-8?B?MTNqWHhiaWRPYnJaOWJrYWZNSVNWR25PRjdjRlMxa0cvdDdFblZNditURDhS?=
 =?utf-8?B?aUdiOE9SamZaZ3ZOMzU0T2QzRXZDUTN3N0VJakwxeUcwdS9yVnZlUFJJWWM4?=
 =?utf-8?B?MW5KdzBZSWZrTDh3TlhNSGtSaFQxcmEzdkwvTWpHQ1JCaEdVLzFTb3pyVWdC?=
 =?utf-8?B?N1BpMDZtZTNlUWtvZ3l4UWNzYkJrbkVTSkUycFMxeTZZUnBUM29HdERaTFM1?=
 =?utf-8?B?Y3pyMFgwMUhSdDA2Z21BRzNzemQ3WXppZ2FpMS9BQ2dJNC83ZWNCb3BuWnZQ?=
 =?utf-8?B?dVRycVNKQUY3WG5rTW1uUVdHM09ZOHlmOGszZ2pWWWIvclJZbXZYMUJ0Zzdk?=
 =?utf-8?B?SkJOKzAyRG55YlZwcDJ0TEMvSWtTeE9SeHl1dDl4YkhjRmFtT1JEdUtsTnF0?=
 =?utf-8?B?d2hJMDJDMmM3YWczVHAzZzJYa3NwbGlYekRpUEFHZUtlTTBzRi84dm85bHZt?=
 =?utf-8?B?WWErMlkxUmsxbWh3MFVBbUJrWGFnNW1TYnNhQ09VZTFEelIwbmpIS09kTlZK?=
 =?utf-8?B?TTcvYjgwNlQ2cTZMajhHT01rYWtlU2NYMGJYZ3hnd0g0aGhDbmZsbndGRzhW?=
 =?utf-8?B?eVpjRm51NmE5UVVlM0xVbEtOMzNIdXV2ckFSN0NTeFVQZnB2TU5ZaGlndndp?=
 =?utf-8?B?MHZDTjJ4bThDTGVNWG5JVnlDc2NZdjVlMTBieTI2K0pBWlBna2NleXpBRklZ?=
 =?utf-8?B?dHFGN21RMXE5TUZyaENJOWhyTXBsMWxoeE1pcUFkT25wRlBTVlNIZUlUc3lp?=
 =?utf-8?B?UmdiNnFHY09leDU2cW9UZlVSdmE5Q0FCQTdvNkplb2laZWdsUDNtZCtkQ3hK?=
 =?utf-8?B?S3VXZ3pPRGwzbkpXcG12M2hRY1dQcHp1aFpVMFZWdG1LVnEwOU4rUFFGQ1JK?=
 =?utf-8?B?SjUzQVFiNHlXeHRMRVY4UHBjd3EvMlRjclJvT3ZtdHFlRFA5OTFPRjRMSHhz?=
 =?utf-8?B?T2lucng0OEJpRGpDeFh0YmtMeXZLZHdXVkgzdWZZa3ZQQ0RUVnhFb0NxbUZI?=
 =?utf-8?B?aW40WFpYUDZWS2lSWnpDT2dLY2RwRlh5aUNCUi9tdEx3dVdDbUNVNVZubVND?=
 =?utf-8?B?Y2ZDSUREaXIvbFlGalV6aWsrV0lhaHRXWS9vbFNNdGdwQWVOZkJINHFqb3hh?=
 =?utf-8?B?NDBkUnQ5STdvb01HR0wvcmdhcWt2NEh0emVtYjEwYlRrSk5USlZCdmU3N3d2?=
 =?utf-8?B?RmQ0cmFHTThhM0dSM2J1NGs0cTh2ZGFzKzNVNGl4TmVDdlRSc0sxMGMzZkhp?=
 =?utf-8?B?eDdEM0RocS9QNUZxWDY4UmVZZjdvOFY5MUFWMHVhYUpjMU04djJwNkROYmJY?=
 =?utf-8?B?SUhrMzAwblp5cVpkY0ZiRXdINUVyZEhpbGxkT0NlVFROa0VhTzllL0Zwanlt?=
 =?utf-8?B?OXZWY202cXdzNmszczRnRm1HKzF3TXIyKytFeTlkWEZUVkIzYTBBNllCMWYy?=
 =?utf-8?B?Y3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d980c78c-5591-4338-d027-08dc43efb40c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 06:26:37.6468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4iXPQFXANoNoIMInjeIA2o0RMsxe6jZIXwd/WICtY7UGqdhdp3Eh5E1ZXgOrv+Llv/8Ofd306GVHhiay+uTC7Yl/nsOgSIqYLkSBttGqvJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6118
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
LS0NCkZyb206IEdpcm90cmEsIEhpbWFuc2h1IDxoaW1hbnNodS5naXJvdHJhQGludGVsLmNvbT4g
DQpTZW50OiBUaHVyc2RheSwgTWFyY2ggMTQsIDIwMjQgNTo0NyBBTQ0KVG86IEdhbmRpLCBSYW1h
ZGV2aSA8cmFtYWRldmkuZ2FuZGlAaW50ZWwuY29tPjsgUGllY2llbHNrYSwgS2F0YXJ6eW5hIDxr
YXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KU3ViamVjdDogW1BBVENIIGktZy10XSB0ZXN0cy9pbnRlbC1jaTogVW5ibG9jayBjb3Jl
IGhvdHVucGx1ZyB0ZXN0DQoNCkZyb206IEhpbWFuc2h1IEdpcm90cmEgPGhpbWFuc2h1Lmdpcm90
cmFAaW50ZWwuY29tPg0KDQpVbmJsb2NrIGNvcmUgaG90dW5wbHVnIGZvciBYRSBhcyBpdCBpcyBv
bmUgb2YgdGhlIGNvcmUgZHJpdmVyIHRlc3QgYW5kIHNob3VsZCBub3QgY3JlYXRlIHByb2JsZW0g
YW55bW9yZSBzaW5jZSBYRSBubyBtb3JlIGluIGVuYWJsaW5nIHN0YWdlLg0KDQpTaWduZWQtb2Zm
LWJ5OiBIaW1hbnNodSBHaXJvdHJhIDxoaW1hbnNodS5naXJvdHJhQGludGVsLmNvbT4NCkNjOiBL
YXRhcnp5bmEgUGllY2llbHNrYSA8a2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50ZWwuY29tPg0KLS0t
DQogdGVzdHMvaW50ZWwtY2kveGUuYmxvY2tsaXN0LnR4dCB8IDEgLQ0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS94ZS5ibG9ja2xp
c3QudHh0IGIvdGVzdHMvaW50ZWwtY2kveGUuYmxvY2tsaXN0LnR4dCBpbmRleCBmNDE0MDE3ZWIu
LmZhOTYzZmFmOSAxMDA2NDQNCi0tLSBhL3Rlc3RzL2ludGVsLWNpL3hlLmJsb2NrbGlzdC50eHQN
CisrKyBiL3Rlc3RzL2ludGVsLWNpL3hlLmJsb2NrbGlzdC50eHQNCkBAIC0zMSw3ICszMSw2IEBA
IGlndEBrbXNfc2VsZnRlc3QuKg0KICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KICMgRXhjbHVkZSBhbGwgb3RoZXIgbm9u
LVhlIHRlc3RzDQogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjDQotaWd0QGNvcmVfKD8haG90dW5wbHVnQHVuYmluZC1yZWJp
bmQpLioNCiBpZ3RAZGVidWdmcy4qDQogaWd0QGRldmljZV9yZXNldA0KIGlndEBkcm1fZmRpbmZv
DQotLQ0KMi40MC4wDQoNCg==
