Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDE6C61DD6
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 08:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9F010EBD1;
	Tue,  1 Sep 2026 08:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inTSZHL+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705BA10EBDB
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788250221; x=1819786221;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IBrEyXD+jSocsAjCbWv/ttK7Q+e3QKyy4yaI9Xy5rYo=;
 b=inTSZHL+/Nm+5cH0cwHPQPB6e0ixA54+/PuDwUq6pxC4Wj2NQKm+u9M+
 9bafqp4IHj/0uaejmTniaPunSJbaClno20gvQU1TL19mw1eRhqtKTq9S2
 rNKwTls5vGKaiWcugcF/i9IJmu72ptqE1GNQaw7MZSVuBdwaGKAAc03e5
 px6lnCdLx9TsqpC0SmBoGQUpK8X+R97Sdl5HRliMi8eNskL7UlPxegzE7
 gabkVguASjJG/bDY3CXoOR+ojLKk6otThKkXy6z4GNnMhVs2wIMPfcmoE
 vyqwxSzMNNTppntDNXqCk7YiHTBU/OwP6hzNvgF5VMrmMBGV0Kicgh+vV A==;
X-CSE-ConnectionGUID: aFWz7o9uSqGyXST1CzRKIg==
X-CSE-MsgGUID: eo2s9Ga5TmCRO82BcqMebA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="106192200"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="106192200"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:10:20 -0700
X-CSE-ConnectionGUID: /odx/IAHTWSqlRSEJfxI5A==
X-CSE-MsgGUID: 6fNDyCAGQ9SJUoMyeOWLrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="274294828"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:10:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 01:10:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 01:10:07 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 01:10:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6r9BpzroNaUMOq1n9kqB8fVwLP74z7TF5Q72b+CMd8uJfMRkK0n1OkKWNmSTxKdsACF8hSvYQXjtZ7nvW+tM5nktVp7A/pk+r+Bp+ZxGf885UmAlTQT4MaJFJ/lb4rzHSCerxlqceNME1FNzJxZ5HW0+n9A1AN9LLQYZqefynhyN8dRLcSfrRP4GVJp7MGtH9sBkpmRmgHLwx6SbzC3b26l5TH+VfY8rsgdNoJ8qKyvByqr862eN1LLmwuqcPESFDCuH6m9ti06pk19AbXOM/JL7D3XxjHAvSPwMrWix8kem0o59i8NVbU4bTJQh2YD7ARwtaYn6jqCDxO01+Gf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBrEyXD+jSocsAjCbWv/ttK7Q+e3QKyy4yaI9Xy5rYo=;
 b=E6ZTrGGonG/Co2V+gZeFk4iwwMN6/ekzPIoqRMwlsgs1khO7aAdnechV8Dyiiart3r6TuIKu5N4gLgP20F1uY9RrkTgaoch6v/6loAQr94SOmDIVBFgRVMPFXdi+poVvCjdJe4c+gLXHVWLhH7J98vV91JqmhCK5GTQCozp+s9vszV+naXe+lHYw5+djsO64vK8yhJxn1A2gI8HwxoOLtRTNXwFyW89oLz2QLG27vP73j9Y30rVjYL6Kt1xcok5uIcn4GLPvCyVkA9o1aNd4b1lJ2hoccfCpj7Bu+pSB0YfhvVPCqR8XE/BNVYL3RK8QaEDT9qTY7SB8MB8fChsZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SJ5PPF77D28E3C2.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::837) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 08:10:03 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 08:09:57 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "Grzelak, Michal" <michal.grzelak@intel.com>
Subject: RE: [PATCH i-g-t v5 2/7] tools/vbt_decode: rename VBT#57 related vars
Thread-Topic: [PATCH i-g-t v5 2/7] tools/vbt_decode: rename VBT#57 related vars
Thread-Index: AQHdClDDlVedw6VEO0igHEWIYFUhmra5u78Q
Date: Tue, 1 Sep 2026 08:09:57 +0000
Message-ID: <PH7PR11MB605346DA79030C636EA06106E7A82@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260702182619.3973788-1-michal.grzelak@intel.com>
 <20260702182619.3973788-3-michal.grzelak@intel.com>
In-Reply-To: <20260702182619.3973788-3-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SJ5PPF77D28E3C2:EE_
x-ms-office365-filtering-correlation-id: 8ccd4999-e640-48e9-c0d9-08df0800698b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|38070700021|11063799006|56012099006|3023799007|4143699003|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info: ksJqr7lkLNMZHTBmFtvMZWK8IxjhRYrue8ufQQaZoyM4/JXJfMm0EgWyTr3DAvkWv5sXzMZWGkjiIz24rNaXA2yUPTZJq0Faxa1oiUZb15K6cuEGfdK4QcBTfpsilZcPpUaFYz/W5w/ZxXcmPKJIOH7FxTmj8u3n95it424UovR0VneGFh0FZiAD3PrYB55Y6StEgzM4D8Hw32DHVQdVsTYljhuGU2VxZ03hzGXP2wgLN01xLLQfsioSm0y+YthqicqAGdFbAfC/7TE5WiNZyZAg9pHw6JC7NxqaKGZAemehSttV+RPdZePR4vBR3A30L34WbgsdyjTLqMPlv1Tjptkq3MLl2nYj6nveI4SK6x4HnyUUSKORgNoIF71LpbxmuEgv8kZCdqkJVHgJZNPdLjI/ylk3hlCwSYV8726ZEnqMv0jWfPoAIiArzSZPvXveMLRj0vRgmo11i3Y7sbdBSXJgsdXyv4BFExDCSJBhgsvrW0+ZHjg0pMhgDBF1RIm4T5hL5qthwUkAtMY2DuctH3UtGQkeU5+nfD9dXvDELQDnxHMg5s18RfFkV4j7RBtLrFF1lwZx2YVp0eeZ1l32vBteYPbxIrW3065Vvph5RlJqPQuUrSFPlyrK/DMM/cTgxYc3qTzunTSnux/RoTWKSTWB06yXChGz93twg6Qsax+MkJgN2LFnpuN2mQEwyWlwN7LADUdZ1IxsJ2v/mjnxWzY66BG1BzeRvZ/9cng2o4w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(38070700021)(11063799006)(56012099006)(3023799007)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmcvaS9ZYm54M3BLbHF3aXVZcEw1czQwK0d1NTIzQjVCYnBCM25aU1lwTkQ1?=
 =?utf-8?B?N2llSnNYOVVZTXZOUXpNTkNRdk5DVEdsYnJlb0dEbEtXK05PVVJuWGZKRnRK?=
 =?utf-8?B?Q0Z5bWtQRTZESExPQzVBM2YraitRVFFjWGozMm1oS2lad2tsQjNBamRMT1FR?=
 =?utf-8?B?MmxoQVZxNmdTYVI3Ti9TakFZTU1zbXdYMFF5dVJrYjBiVTNMdUovU0s2NmRj?=
 =?utf-8?B?aDFrQy9oQ3NTVzJWR0c5V2ZVOFl0SExJR1p4SDVHdFJZT1Vhc0piM09JcVE3?=
 =?utf-8?B?TkF1Y0hxRTJKTFp3TkVBRWZDd0hMN2xkUndkUG00cXgrdytpeXE0a2NIcFBm?=
 =?utf-8?B?TjhmRWtYZE9oVTU3R013WG5qZkZ4Y1hJMWMrWitPTUFOM3hwcHVCek55cVUx?=
 =?utf-8?B?emR6dXBGOXhvOEJtUWVJRmlVVFRpekJBcjErZjU2a010akpkMXBVOXdXSU5Z?=
 =?utf-8?B?ay8rR2xyNzJNbDlMZHVwdWlIekdmNWg1cW5jc3VIanpTcFpzbG42b3NxTjQw?=
 =?utf-8?B?UDBrSmp4TE5NeFJyNGwyalo0QWYyaU82R0VTaWJESWpidXFacnRuVlRLcEQx?=
 =?utf-8?B?VkhmWmh1Z24xRU1UTytZcHhyYjlGV1lGUnhsdm1SZDJpUWNUMGczQWtyeFBQ?=
 =?utf-8?B?cHVqS0ZuQ3BvYUN4SVdtTlA1OTAxcVdIenNmUDk4WjZhaHE2LzNSV05qZy94?=
 =?utf-8?B?VUlKeVJuNElFUUt6Z3NpWFpqelBCaGlsaEY0WnEzTHgrdzY3bmo3U2paZDJo?=
 =?utf-8?B?aFd5WmVJL1QxditwUDFKSWxjZUtrZ29TdFdTNWUySUcvMHRTMzdBai96dkdJ?=
 =?utf-8?B?TDU1U2dKVFdCSUxLN3R3bi9EVmF2R0dVaEcyMnVuem1qOGk1V3lkamJxcFBt?=
 =?utf-8?B?ZTI5N24vT2VEZm9jOVZTZEVvcWZiN09iV3VBbWFVdlBPUkRzRlI1bGMxY0hT?=
 =?utf-8?B?MWVwamdiVEw2RThYSmZkNkRYc2ZUS3lLNkd4N3ZyTnpsK1pXS093MlA3UUhn?=
 =?utf-8?B?MFNQRUhueE9TTGgyUzdMUHdFSUlBelJDN3l0UDQrdXVsQjIwUlQ3V1JET1d0?=
 =?utf-8?B?U2NxOHdnd0h5a0U4RzI5ZEZqQ1JvclVkUGFBRFVUcUxnZlZSTFhYRE5PdFN5?=
 =?utf-8?B?czNZTGJFbEJpN3Npdk5QN3RTMDhwZlJrbUlVc01VMVBraGtRZ0V0KysxbG0y?=
 =?utf-8?B?MkZ5SFlHK2tpT3orN01FWTY2Qm1aK1BZVE1WYzdmL2JwY01SRUNocjh1d1Ro?=
 =?utf-8?B?ZnZRU2JoRmV2V3R5V3V6UGVSR1FBTHNKQ2lyR0lOaFdCZnF3amErQ0hyc3Fj?=
 =?utf-8?B?VVF0RTN5TlhINVd5M1d2SVNRb1RiaGRmV2ppZGNkV3dFa3BaVXd5bEhmdXBD?=
 =?utf-8?B?YVJMdkE1LzdWczVOcTdiSzRPaGpPaCsyTEpMSGx1Q3I4am1UN2pVOWhyZkRL?=
 =?utf-8?B?SjY5UU9oRDN5YWhqWDhCTlJCcmF6RTZvVFVjUDdVZHJSNXlVZHk2MUFDZWEy?=
 =?utf-8?B?c3BTSkVIeTRSeU1jWkpIeUxGdlhINDRyMkNkam9JVG5leDN5VzlFVDVTS3JZ?=
 =?utf-8?B?VDdpTWZWMWNNc2F5eDlIRGl2Zk9YWHVlVDNlTFh6ZGNVRWU4N0RRRWwyaXY3?=
 =?utf-8?B?NU1raUpWUkNQVWRMZ0lDQjZZZ0Q4WWkvVHdHNFV5eUkzOUd5TXJ0TVo2OFk5?=
 =?utf-8?B?eVQwaUUwU2ZxdkllQnNlODlPeXVqcXhsbTZEdlE0dmdqaXRicDE0L3AyYTRT?=
 =?utf-8?B?TU01OHFDZ2ZyTUpuMlpxMC93YnphZDlrN1dDTjZQYkVTOHBWSDRrZVVVUmh4?=
 =?utf-8?B?ZlVaMFRjTVk2SjVWMTJjcENKNmsvTVVvajdZdVlLbEJ3eC9ZVWpoYW9nS3Q2?=
 =?utf-8?B?N2RDTUpWK3IxRy9oY1FTM3VGWExxYURjTlgwM3JjNEpMbWVEbnJDVFphSmhr?=
 =?utf-8?B?c1FHc1ZLcjFXK1RzOEpIZ1QxN09ORDdiVlI5U09sK0xMMmljVHBvdTVxSlN2?=
 =?utf-8?B?L0d4Y2RxWXBhUHQ1cHFVWi9WN04yRUMvcHE5UThITzVHdHRCS2k1UXJDZHpj?=
 =?utf-8?B?dk5kL2xPeEVSM1BrN0l3OUsxZ3ZuYUNienNpQ0NHZXlOOFdON3IxdlI4VTRB?=
 =?utf-8?B?bGVmYnNRb2c4akhWY2oyWGZtN0hQRnV3ZTVJbWhtMnNrMnYxOTZiQkNiODg0?=
 =?utf-8?B?VXdXR0RDNkpwOWdUNUhxZ3pKaWkwU3h1TlAzSGNLMkZBazB4U0FLZjRHelY2?=
 =?utf-8?B?c2VJWVl1RWY5TVdPM1lLdytnZTJtSjNlZjB0WWhudHJmVVhySTlQaHZjelBC?=
 =?utf-8?B?U0JtOEFVRHdSUzRKbmt0NnY2bHZ6VXdoRXpmQmxmYTExTi9SOHBCQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LVcIUWVsdBBk463cvTC4dKIPBvBc6O1vOvF6lO0Ty/5i/YUjgnG1Cm9rVe2uIKrwwKWiDZVyqcsT4rSrCx4QVXERNY+Gi1JDk8mfAs9Jxj1fpklIUGQGJUQ96dTgLNxP9wyPn6Nv5zbgPzUZRaYqzVGSAOpof6+59mm4hiF3q3N8ysmIXD8VfhBnOI84Bk6KLqdqrecAsfDy3EjioKhCncbW2Ki7PfIGyAayzcZjvR8pQpipgaT0bGoiSWNO0gC1T3wWuZLQlxjtbiT8SBWfni0CWoy78/nKpwfsKWYEyUWt3cEVt6+1kwooiu+KSGl7PT0Ol7MZ0RpN299eF8PMBQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccd4999-e640-48e9-c0d9-08df0800698b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 08:09:57.3575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UprOsLxN2ADdH1CjtTHtpMlCMKIQZP7a7ZvxS8W9AP78ZardpupKrE1dUPYSDMwdgyiuDNta/kqIEiJFeWV1oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF77D28E3C2
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

SGkgTWljaGFsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRl
diA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1p
Y2hhxYINCj4gR3J6ZWxhaw0KPiBTZW50OiBUaHVyc2RheSwgSnVseSAyLCAyMDI2IDExOjU2IFBN
DQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTmlrdWxhLCBKYW5p
IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+OyBLYW5kcGFsLCBTdXJhag0KPiA8c3VyYWoua2FuZHBh
bEBpbnRlbC5jb20+OyBHcnplbGFrLCBNaWNoYWwgPG1pY2hhbC5ncnplbGFrQGludGVsLmNvbT4N
Cj4gU3ViamVjdDogW1BBVENIIGktZy10IHY1IDIvN10gdG9vbHMvdmJ0X2RlY29kZTogcmVuYW1l
IFZCVCM1NyByZWxhdGVkIHZhcnMNCj4gDQo+IFJlbmFtZSBsb29wIGl0ZXJhdG9ycyBuLCBpLCBq
IGludG8gaWR4LCByb3cgYW5kIGNvbC4gUmVuYW1lIHZzd2luZ19wcmVlbXBoW10NCj4gaW50byB2
c3Blb19kcDE0X2xldmVsc1tdIHNpbmNlIHZzd2luZ19wcmVlbXBoIGlzIGFuIGFscmVhZHkgb3Zl
cmxvYWRlZA0KPiBuYW1lLiBSZW5hbWUgdnMgaW50byB2c3Blbywgd2hpY2ggc3RhbmRzIGZvciBW
Uy9QRS1PLCB3aGljaCBpbiB0dXJuDQo+IGV4cGFuZHMgdG8gVlN3aW5nIC8gUHJlLUVtcGhhc2lz
IE92ZXJyaWRlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBHcnplbGFrIDxtaWNoYWwu
Z3J6ZWxha0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jIHwg
MjAgKysrKysrKysrKy0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9pbnRlbF92YnRf
ZGVjb2RlLmMgYi90b29scy9pbnRlbF92YnRfZGVjb2RlLmMgaW5kZXgNCj4gMTZmMWM5NmZlZS4u
YTJlNTcyMDZkNiAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jDQo+ICsr
KyBiL3Rvb2xzL2ludGVsX3ZidF9kZWNvZGUuYw0KPiBAQCAtMzQ1Miw3ICszNDUyLDcgQEAgc3Rh
dGljIHZvaWQgZHVtcF9jb21wcmVzc2lvbl9wYXJhbWV0ZXJzKHN0cnVjdA0KPiBjb250ZXh0ICpj
b250ZXh0LA0KPiAgCX0NCj4gIH0NCj4gDQo+IC1zdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHZz
d2luZ19wcmVlbXBoWzEwXSA9IHsNCj4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3QgdnNwZW9f
ZHAxNF9sZXZlbHNbMTBdID0gew0KPiAgCSJWMC1QMCIsDQo+ICAJIlYwLVAxIiwNCj4gIAkiVjAt
UDIiLA0KPiBAQCAtMzQ2OCwxOSArMzQ2OCwxOSBAQCBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0
IHZzd2luZ19wcmVlbXBoWzEwXSA9DQo+IHsgIHN0YXRpYyB2b2lkIGR1bXBfdnN3aW5nX3ByZWVt
cGhhc2lzKHN0cnVjdCBjb250ZXh0ICpjb250ZXh0LA0KPiAgCQkJCSAgICBjb25zdCBzdHJ1Y3Qg
YmRiX2Jsb2NrICpibG9jaykNCj4gIHsNCj4gLQljb25zdCBzdHJ1Y3QgYmRiX3Zzd2luZ19wcmVl
bXBoICp2cyA9IGJsb2NrX2RhdGEoYmxvY2spOw0KPiArCWNvbnN0IHN0cnVjdCBiZGJfdnN3aW5n
X3ByZWVtcGggKnZzcGVvID0gYmxvY2tfZGF0YShibG9jayk7DQo+IA0KPiAtCXByaW50ZigiXHRO
dW1iZXIgb2YgdnN3aW5nIHRhYmxlczogJWRcbiIsIHZzLT5udW1fdGFibGVzKTsNCj4gLQlwcmlu
dGYoIlx0TnVtYmVyIG9mIGNvbHVtbnM6ICVkXG4iLCB2cy0+bnVtX2NvbHVtbnMpOw0KPiArCXBy
aW50ZigiXHROdW1iZXIgb2YgdnN3aW5nIHRhYmxlczogJWRcbiIsIHZzcGVvLT5udW1fdGFibGVz
KTsNCj4gKwlwcmludGYoIlx0TnVtYmVyIG9mIGNvbHVtbnM6ICVkXG4iLCB2c3Blby0+bnVtX2Nv
bHVtbnMpOw0KPiANCj4gLQlmb3IgKGludCBuID0gMDsgbiA8IHZzLT5udW1fdGFibGVzOyBuKysp
IHsNCj4gLQkJcHJpbnRmKCJcdFZzd2luZyBUYWJsZSAjJWQ6XG4iLCBuKzEpOw0KPiArCWZvciAo
aW50IGlkeCA9IDA7IGlkeCA8IHZzcGVvLT5udW1fdGFibGVzOyBpZHgrKykgew0KPiArCQlwcmlu
dGYoIlx0VnN3aW5nIFRhYmxlICMlZDpcbiIsIGlkeCsxKTsNCj4gDQo+IC0JCWZvciAoaW50IGkg
PSAwOyBpIDwgMTA7IGkrKykgew0KPiAtCQkJcHJpbnRmKCJcdFx0JXM6ICIsIHZzd2luZ19wcmVl
bXBoW2ldKTsNCj4gKwkJZm9yIChpbnQgcm93ID0gMDsgcm93IDwgMTA7IHJvdysrKSB7DQo+ICsJ
CQlwcmludGYoIlx0XHQlczogIiwgdnNwZW9fbGV2ZWxzW3Jvd10pOw0KDQpJIHRoaW5rIGl0IHNo
b3VsZCBiZSB2c3Blb19kcDE0X2xldmVsc1tyb3ddLg0KQXBhcnQgZnJvbSB0aGlzIGNoYW5nZXMg
TEdUTS4NCg0KUmVnYXJkcywNClByYW5heQ0KDQo+IA0KPiAtCQkJZm9yIChpbnQgaiA9IDA7IGog
PCB2cy0+bnVtX2NvbHVtbnM7IGorKykNCj4gLQkJCQlwcmludGYoIiAweCUwOHgiLCB2cy0+dGFi
bGVzW24gKiAxMCAqIHZzLQ0KPiA+bnVtX2NvbHVtbnMgKyBpICogal0pOw0KPiArCQkJZm9yIChp
bnQgY29sID0gMDsgY29sIDwgdnNwZW8tPm51bV9jb2x1bW5zOyBjb2wrKykNCj4gKwkJCQlwcmlu
dGYoIiAweCUwOHgiLCB2c3Blby0+dGFibGVzW2lkeCAqIDEwICoNCj4gdnNwZW8tPm51bV9jb2x1
bW5zICsgcm93DQo+ICsqIGNvbF0pOw0KPiAgCQkJcHJpbnRmKCJcbiIpOw0KPiAgCQl9DQo+ICAJ
fQ0KPiAtLQ0KPiAyLjQ1LjINCg0K
