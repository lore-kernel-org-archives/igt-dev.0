Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F04FCD343F
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 19:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEE010F206;
	Thu,  7 May 2026 19:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iiw0jSyo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DDA10F209
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 19:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778182649; x=1809718649;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=KmZPitCZxdOQvQ7igJaaE4p9jRwuSUzLQCyTrFNDnTQ=;
 b=Iiw0jSyo7Pth3hv95sAnV1s21/h0FHOPHq0uvk0tMPHbNc/b2K7VqwvF
 gIyotq1hny/Or0yks/qtMPK+1h/QWD4rqQYpB7f4ykBwUyjncCtOkWHpl
 a0vZh0MZxKWMy9dk18Hn/srP8APejWGY139Ye/ZcQR27r0x2QSQtUsasi
 fEFbvhfZ4lMjDEw3r0DpOvW42sgEV0k1wophqKsSFS7ewebsmemqibWiB
 F19raAivjTiTXSnEFmeECNtn033zEQG710k9jAhkcoOSekaXNziFaPaxU
 9cITJNuAfEPchuTEYKhdwtZuvKf0laUWT8DqUrm6TBbe8Ht92xAUBXqHZ w==;
X-CSE-ConnectionGUID: fv3V9ANpQJu2Q4PjcinMhg==
X-CSE-MsgGUID: wu6U4vTPQcOh0O3F+scupg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89842453"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="89842453"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 12:37:29 -0700
X-CSE-ConnectionGUID: K89Rb1RvQfuG4zfGHzZ5mw==
X-CSE-MsgGUID: UVjQSMkaR6u0KrD/iRkqOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="240545470"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 12:37:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 12:37:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 12:37:28 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 12:37:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELX5cAIWPy5X7PJ0xvLcLzOeA6QTxFD2FswaAT6DTupSjrA5+GlENhZme8+WRlG6VvylOxXz3cTm8F1JugPeSX/p4LfzJxPXGemNk3JgEKUV3dBZdHZcVj8eGgjSr7VmCgnfiAfHbo2BnVGYR7qV5JCrk5yL60w9BH5esAYDXvK5Ztm+rvJPf6eyphNu0ol4GSP+vA7CyzFvqFuT5FLdLQJXf21q9PcJueeKEdVnBLv56neKK1yATdsVB6HnYDRr+XOBFi+fBHYJxGFRCW9NWghSGuysk0Q2JtDBuO0xDjH/vSazZl0ExKilf1GwlJDOO7nyGpMMokUJK4/4zqf05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmZPitCZxdOQvQ7igJaaE4p9jRwuSUzLQCyTrFNDnTQ=;
 b=TOq+TUdWjp8MZ8jYvmKQc83PlOQjn0sVhs1Vwfhqp5bvSowBrdBCKrQorZ4JgnQagSTYIjic+oqGqf59VQNg1vvtqo+HNcb8CbMhyZfCuxh0I80HhHk1iBw/r55mzZZq0GRYWrh2ZqSw8rZJgWbJeCz1/i515+AsLBG2tG9McKqLnvKWGPjSPJKSSggPDy8tv4H+YJ0RrudBi1KMz4IGxFnu/HY7TTH8u8HqIDaBYsEaF5VVQKA4yHgNGQ7juA0EFU56xwcCbin3Mvjl1Qgx1eE8B8871vruZTEsFTNTaOkPGPiAZ8od1uJ3KG2lJKf9BEUI480pkQnwUkpw5ILnfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB7148.namprd11.prod.outlook.com (2603:10b6:510:1ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 19:37:24 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 19:37:23 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 3/3] tests/intel/xe_exec_reset: Add multi-queue long spin
 tests
Thread-Topic: [PATCH 3/3] tests/intel/xe_exec_reset: Add multi-queue long spin
 tests
Thread-Index: AQHc3Ya/8rGgCjBjf0yzr4R7fbzzE7YC9ssA
Date: Thu, 7 May 2026 19:37:23 +0000
Message-ID: <130b948c986be91a0bf7be181d213fcd74245a51.camel@intel.com>
References: <20260506183137.51479-5-niranjana.vishwanathapura@intel.com>
 <20260506183137.51479-8-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260506183137.51479-8-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB7148:EE_
x-ms-office365-filtering-correlation-id: 6a15bca7-f02f-4053-6e74-08deac700fce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 6ySLGYqaL1dS+E3aiEVkhjwl8+uLA0RbYGpvAXF7syBZRiCgLze/R9P7lDRdI2hM7IxFSPk9lHTQv1V4AKLxLD39H9JPCqwDxZS96EHzL/+UBjAyo4PTtvqvFjwa3wsNdhYpqnmVIvGNpRrESDierkzYgEti0cR1SFUxWS5FYREucgryG+I+CVQJ/RzeqSV8e0nJGrD+bTUD48vyCLPov4wHpUETgmril2kkhulgf9m4NFBzezxzf8w4qCLlvHEirQKozR74TmMxK3TghEmYMJUH51cWO2GKfD7Gq8tjRqWCY7E1TZkSd3k2smnEZ3+mD2gLEWT6cmb6ABhUbiCwJnjNMVvlnww4ciRTLw3MT3flMitKZxmiAFT/y9h6+PjRH9RkPKAT8NCmuV9TE7v16AxD4x4Zvfu1XhpsIfw2tG0T/U75WKJWMzU3/NBqv5G37ZOo8NlCwiDIcUuUuvEoflxT4/eP4gLSdN38zpE/wrwLHseyFh1xArPACU/OBoG3VgIruKG7pnjdihG4mr/cJHcbLl2DciSN6ZU0V80DbWBmssIFMY3/5ZAVRDHrgxebWwibOGeTmWKMsIzWpUu9RjXiMWU7lM/C0rsXLkgUj/FfPeHv17EI3bUB1tmqFgp8XC5Qpc/W5Q3JSFemUefYAXhW9j2nSq1oqWGpSQ1OOOvNFuEenj2xkoZG6qKutiTUqw2q0Ok7wtSR5LblO1hkWxx8/ezGmzCUZ4c6u4MAcEz7lrzO+irwz2lPWbISm0cG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzlnZ2lGeVRQK3dEVm5uVU1mWG83Z25BS0lwY2hrbmdaNDhFVWR6MWxpWWhW?=
 =?utf-8?B?T1dobFZ4c05mMFZYTVBubjJ2MFRoZDd6RlB0VHpjWVcraGZVV3pUY3hKUXIr?=
 =?utf-8?B?OFlYUVBCLzB6WUVBUmlMYUlZZGhidDl3bTNtUVBYbGNBRGYzRGpvaUpPcGNT?=
 =?utf-8?B?VTEzSGhHU1F4MDJTOFR3OVZLY1h1ellaVm9JbmZYYm1oemM2MmJtOUtoUThV?=
 =?utf-8?B?U01RekozTzNRK2FQa2s1amZaUGw2cUwzVjIwRVl2dWNUN0hqbWVyc1BNUWs4?=
 =?utf-8?B?SldDOEd3K1Zlc2Z6WlFoelhNL1E1aVd6VFloL2FqTlZhK2o4dVY2aDY0djRM?=
 =?utf-8?B?WE8rVUgrYlJOY3lScUNzbGlOQ3FqSFBXU1ZKelNjeWtVNHBWUHBodE5nekN0?=
 =?utf-8?B?cHdrcFBZSXp5Rm1aSFJUOGNDNFkvVkRXb2d6Y3dmQVBIOG5RcnhHNjdPTUc1?=
 =?utf-8?B?dlN6LytRM2VvUHNqNWYwRzljSnMyZ0drZ1F5NGJHQm9JZzFwL1Y0ZldzdTVS?=
 =?utf-8?B?OFV3UXhHeGxEeW9UcTJweXljU0pwVWNpZW9kQUtqY1c4Q1RZWnQzY3VwTEpY?=
 =?utf-8?B?R1pUYUNaYXdpR3hwSzVLbUVobU5pU1dBNld5R2xQNDhnUUJlU092VHNYcTJH?=
 =?utf-8?B?SkUvdy9PQXAwZHc4ZkNYSzN6OVRWL05UVTJMbHFMWGovN292UnJOSHd5VGF3?=
 =?utf-8?B?Rjc4VHQ3TU0vZU53dUdUQ3U5Q1hzbVFYQkxnc1ZaZWoxZ2VIbW9VMFQ2cFI3?=
 =?utf-8?B?ZW1BSVp6eCtseE0vSExhbDRtTXE0VGozQkVlQ1NHZmtrOTZNRndVUnF2azQv?=
 =?utf-8?B?aTFoNUhVRzluL1p5NW5rTmJVcnpHV2dlZEhUNDNPdy9YTlAzbEsyejRzQ0FZ?=
 =?utf-8?B?dHVGbTg4SW50Uzh2TGVBMFhEVFVHY0hFcTgvWk9xL3ljMmJlT3kxM1ViOXZZ?=
 =?utf-8?B?TjNkekZWL1d6aTlGWUFDVTZJQ3pTZmo0RmI5ZnV3Um85WDhCWDdPeVA2c0tK?=
 =?utf-8?B?aTZTYndJTHIxbHp1VzZ2ZnZBSnRqS3VLa2FHZlhuTy9EV0t5K2d5VFB6WTM2?=
 =?utf-8?B?eVNuaVRQa01uYmdVYmFQd1FhNFp4SnQ4MnJXSCtuRTF1d25uRXU0cWZPV2FT?=
 =?utf-8?B?OTJGb0o3b0d5UmFvQWEzbVM1QWJxeGk4V2laZlFocURrMmZIUmVIdFFFYk55?=
 =?utf-8?B?VjNLejdubHQ1dVFZd2ZhR0dKWGo1V1Joa2w1UkRzSzdkcmFyTFdCbzBTZ3VS?=
 =?utf-8?B?VFFobW9oL2VuVDZhdkQzWFBGaFRTQm1RRnJ5ZEgza0hvaFMwS2w1OFk4bTV4?=
 =?utf-8?B?bjVqclJkYngyZXRpUHl6RlFzNFlueHgzZEZIQlpleE95OVZUeU1URTBxbStz?=
 =?utf-8?B?Y05lRGYxcVVvSzVPTlJWY01GWjNBem5xZ3ZVbU1PaGI3N1JBSm1PdDhsYkxn?=
 =?utf-8?B?UVVQemZVRS9JaXNqNjdNZW0zd0JzQVEzNE5YeGhYeFRnNjkwOURGbGJ5cTI4?=
 =?utf-8?B?K3pDbTU1b0ppNVZNZlUwOWc5VDhHTFlJbnQ1aThQSHM3NmJMTG5xSlNLMUwv?=
 =?utf-8?B?b1RpTXNwQ010MTBDeDJCdm80SUl5QnVmbnZsLzV3dERBVUNWb3ViQ3Bha3Z2?=
 =?utf-8?B?VFRNSDRhaTdzQ0w0Vk1SdzZDVTJUajFsbG55bVFOS2NXdWE3K1FiTzJ0WW1M?=
 =?utf-8?B?SDY1aEdUejdKZ2RKdUcwRU9TRWllV0pUS25UeVdQWkxkZ2xDNWhOS3ovNEJS?=
 =?utf-8?B?QXpHNUNWYytyaGg0aEYyZVBBYnFIWFpuZ1U5VlI0eS9QYzltb3lINmlGTSs5?=
 =?utf-8?B?ZURXNUMvY2tlQkdhM0JnSHlCa2dzVlR6UUwyM1lQRFVFYXRaeE1mZDA0Z09S?=
 =?utf-8?B?RXdmUmdtV1hNN2czcXk1bUZHMlFQbEV5bUpKczlvekl0bWNaeHNYY0MxSDZa?=
 =?utf-8?B?dW1IaDVwc1lNZ1dQaXlnZEY4S0cyK3dVR25SRGVQak52YzJ2SlNvUUV1TmpK?=
 =?utf-8?B?andhQkRUZ2NLSkM2M1N4Wkp4U2pEaVJWSlhpdXpXSDBYOUtmRzd3bXlPT3lv?=
 =?utf-8?B?NWhNeDc1MU1CU3hoOFo3SlRLUHE0NnVoWjdrdlpYLzczYlBLamtaNTVudVZ6?=
 =?utf-8?B?NW1yNmlKekdKcEZwdG5IenpKQ3hzNWEzSEZScFdEVDdNNVdkZCtEQmREek5j?=
 =?utf-8?B?T09IQzJGVEd4MEUvS0JXa24ramNrNkg0UlBFbkhHSDdxUklYbm5HNG5hNldy?=
 =?utf-8?B?NG1hWXIydGlRNllPc1Avbms2WGlwV0NOMnFRaEFOM0V4cTd3TVlkbDNQNzgz?=
 =?utf-8?B?MzNlRGxVUGY3ZFZNdDU4QnE0TzdubDBPRzBNV1VYNEt3Zm9OajVrTkZvS1J6?=
 =?utf-8?Q?D8NNWQI5Jioe8dQI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F608426C1F5032448957B25018F4F943@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZmolpOLcmxhzu7Q/EcPCndsdQ4ooKKTnSquY1j9tnzzG26CgW7iRzyI4cSmk3M7aZhrrx291WdELijXAPC6QujwwU8/kPKXZx2hmKYqQpI0bWXD+ggfohGsaqu2F1XlIkmB5qU3FpiZnEt+UhwJ7vSN1He38i1/pPtUi0YMcyMRlcmRl/WaU6LKsqMCk43V/eTSqrI78+hTmYGtOfK8W239KhNDIXPFiOQvXJ6wY9BCvVyXhQGI86VK6oCqYBVPT+kYc9jjivRR+dglTyIqc3o9mCy7654biayO2HscgwMZHSnkS5Q+l13ZB9bx0w0sP9aLwq1Wu32o/3CV+0Q6fzg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a15bca7-f02f-4053-6e74-08deac700fce
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 19:37:23.4512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IlXBunczfv1LBE5NdvFIc5D88ISnDfPP/O9mFBLXygiM1g8XMsc52P4rCSS8SnD+P9JWn99FhW8APUmSk+0e6o2tL2LBYUZsO8o5rlNLosI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7148
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

T24gV2VkLCAyMDI2LTA1LTA2IGF0IDExOjMxIC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEZyb206IGd0YSA8Z3RhQERVVDQ2MzdOVkxQLmZtLmludGVsLmNvbT4KPiAK
PiBBZGQgdGhlIGZvbGxvd2luZyBtdWx0aS1xdWV1ZSB0ZXN0cyBhbmQgdXBkYXRlIHhlX2xlZ2Fj
eV90ZXN0X21vZGUoKQo+IGZ1bmN0aW9uIHRvIHVzZSBxdWV1ZV90aW1lc3RhbXAgYW5kIG11bHRp
X3F1ZXVlX3N3aXRjaCBzcGlubmVyCj4gb3B0aW9ucwo+IGZvciB0aGUgbXVsdGktcXVldWUgc2Nl
bmFyaW9zLgo+IAo+IG11bHRpLXF1ZXVlLWxvbmctc3Bpbi1tYW55LXByZWVtcHQKPiBtdWx0aS1x
dWV1ZS1sb25nLXNwaW4tcmV1c2UtbWFueS1wcmVlbXB0Cj4gCj4gU2lnbmVkLW9mZi1ieTogTmly
YW5qYW5hIFZpc2h3YW5hdGhhcHVyYQo+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVs
LmNvbT4KPiAtLS0KPiDCoGxpYi94ZS94ZV9sZWdhY3kuY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
MiArKwo+IMKgdGVzdHMvaW50ZWwveGVfZXhlY19yZXNldC5jIHwgMTcgKysrKysrKysrKysrKysr
KysKPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9saWIveGUveGVfbGVnYWN5LmMgYi9saWIveGUveGVfbGVnYWN5LmMKPiBpbmRleCBmOWJkNWJj
YjYxLi5iNzA1NDc1NmNkIDEwMDY0NAo+IC0tLSBhL2xpYi94ZS94ZV9sZWdhY3kuYwo+ICsrKyBi
L2xpYi94ZS94ZV9sZWdhY3kuYwo+IEBAIC02Nyw2ICs2Nyw4IEBAIHhlX2xlZ2FjeV90ZXN0X21v
ZGUoaW50IGZkLCBzdHJ1Y3QKPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksCj4g
wqDCoMKgwqDCoMKgwqDCoH0gKmRhdGE7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9zcGlu
X29wdHMgc3Bpbl9vcHRzID0gewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnBy
ZWVtcHQgPSBmbGFncyAmIFBSRUVNUFQsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oC5tdWx0aV9xdWV1ZV9zd2l0Y2ggPSBmbGFncyAmIE1VTFRJX1FVRVVFLAo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAudXNlX3F1ZXVlX3RpbWVzdGFtcCA9IGZsYWdzICYgTVVMVElf
UVVFVUUsCj4gwqAjZGVmaW5lIFRIUkVFX1NFQ8KgwqDCoMKgwqDCoCgzICogMTAwMDAwMDAwMHVs
bCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5jdHhfdGlja3MgPSBmbGFncyAm
IExPTkdfU1BJTiA/Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgeGVfc3Bpbl9uc2VjX3RvX3RpY2tzKGZkLCAwLCBUSFJFRV9TRUMpIDogMCwKPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19yZXNldC5jCj4gYi90ZXN0cy9pbnRlbC94ZV9l
eGVjX3Jlc2V0LmMKPiBpbmRleCBhM2NmMjkwYWJmLi5mN2FlOTRhNDI0IDEwMDY0NAo+IC0tLSBh
L3Rlc3RzL2ludGVsL3hlX2V4ZWNfcmVzZXQuYwo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNf
cmVzZXQuYwo+IEBAIC0xMTc5LDYgKzExNzksMjMgQEAgaW50IGlndF9tYWluKCkKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIE1VTFRJX1FVRVVFKTsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IMKg
Cj4gK8KgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3QoIm11bHRpLXF1ZXVlLWxvbmctc3Bpbi1tYW55
LXByZWVtcHQiKQoKVGhlc2UgbmVlZCB0byBiZSBkb2N1bWVudGVkIG5vdy4gVGhlIGV4aXN0aW5n
IG5vbi1tdWx0aSBxdWV1ZSB0ZXN0cwp0YWxrIGFib3V0IHByZWVtcHRpb24gYmVpbmcgdGhlIGRl
Y2lkaW5nIGZhY3RvciBpbiBlbnN1cmluZyB3ZSBhcmVuJ3QKZ2V0dGluZyBlbmdpbmUgcmVzZXRz
LiBTbyBoZXJlIHdvdWxkIGJlIG5pY2UgdG8gY2FsbCBvdXQgbGl0ZSByZXN0b3JlCmV4cGxpY2l0
bHkuCgpPdGhlciB0aGFuIGRvY3VtZW50YXRpb24gdGhlIGNoYW5nZXMgbG9vayBnb29kLgoKVGhh
bmtzLApTdHVhcnQKCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2Zvcl9lYWNo
X211bHRpX3F1ZXVlX2VuZ2luZShmZCwgaHdlKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9sZWdhY3lfdGVzdF9tb2RlKGZkLCBod2UsIDQsIDgs
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMT05HX1NQSU4gfCBNVUxUSV9RVUVVRSwK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIExFR0FDWV9NT0RFX0FERFIsIGZhbHNlKTsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGln
dF9zdWJ0ZXN0KCJtdWx0aS1xdWV1ZS1sb25nLXNwaW4tcmV1c2UtbWFueS1wcmVlbXB0IikKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZm9yX2VhY2hfbXVsdGlfcXVldWVfZW5n
aW5lKGZkLCBod2UpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHhlX2xlZ2FjeV90ZXN0X21vZGUoZmQsIGh3ZSwgNCwgOCwKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIExPTkdfU1BJTiB8IE1VTFRJX1FVRVVFIHwKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIExPTkdfU1BJTl9SRVVTRV9RVUVVRSwKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIExFR0FDWV9NT0RFX0FERFIsIGZhbHNlKTsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB9Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqBpZ3RfZml4dHVyZSgpCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fY2xvc2VfZHJpdmVyKGZkKTsKPiDCoH0K
Cg==
