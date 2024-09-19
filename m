Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD74CE8D7D
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 12:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4C210E6CE;
	Thu, 19 Sep 2024 12:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICRYkyMk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A97510E6BC;
 Thu, 19 Sep 2024 12:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726748196; x=1758284196;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=hgHcFRpozZ38jTzid3fX7vr2Ys7BH+AdoZjjTqOsG00=;
 b=ICRYkyMkmwLZ2EDG67INFrjEAGY1V7RDJMahLiwhOkFbGJac3SKH+kJt
 8I8JJfsBzfLnFWpUg015+Wvfj6eUt3KglJnDBieUTLtQAMje8G6cbs/ec
 mNCJERbxgttv23GJPTNdyXuKOfCsZZfcDS3y33nA1f1l9Zax01mBzkAQp
 xLtiWvp0zw8Q8+EaIdYoaRpiR8MQSa/MI8jtyjwb442ZjizwiFJ3Sjd4J
 e2PaI0oZKFvetqJFGt3xf6N3plts/ouIsH9SdtOEUxr6HJorfmTjjemtk
 LofTaZM/B+EN0RNgC1LYN9jFI2E76Uwtd2ORgYnT6gA113Lui0LSS8gjq w==;
X-CSE-ConnectionGUID: quhz+uRqRkG1rLAydTZjnw==
X-CSE-MsgGUID: KOhrjk4LT/WqlcGSC/BFzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36291791"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="36291791"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 05:16:36 -0700
X-CSE-ConnectionGUID: AnDanYceQgyW5+WkWvXcTQ==
X-CSE-MsgGUID: NKhIxFUdTFWuS/tmxFkufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="69940389"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 05:16:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 05:16:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 05:16:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 05:16:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mahiJ2L3va2DN8U/+dzC6HSHDBNX9LPb1DM8/QIyjIDfeggX81NIFwtCIWl5H35n0VOARjHQLUz5ya4U/S3I/0YUmNqdN5kWIjnlna7MrTRs06CkUfeYzA/b0IAw0w/dGmp1QB8AjQOxuvyCVADBmWE0jqZclhNcqGSyhC8s/E8Pv0v6HvusKRkSwSf+1P6D3VTpPJgEJdxmaZDULZdPkt0adJu7I/aY1uPoTqLrFWh6JN7eGPhKy/FTXoQhrTfsRf+hCw/LyF7s+To44KkuOsosPAgNk325sAF7aKSbNqm8FETgd9mLw8wYabUNOsKS8Y2QCWfETJkhK89IopP0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgHcFRpozZ38jTzid3fX7vr2Ys7BH+AdoZjjTqOsG00=;
 b=OJy1AAQgwgMnl5oyVN8aNLH2R7+86N4fXNylJ3H5xJ3wfObPcS5scWqz5nkRtsEEazOrlIdxa4gE6ulvPfWcVupNuZFObYf9tV0eMRPsU0x3KPJoiq1/Up1pM3riNW5Ar7+WklQHrmDc8bIviz4Lv9j4Z5dMkiodiW8FRFtjqY28TU69Qw+VWQomQivdrk21l/i6yzn+t1hK4xNy1vJOiwEsPeBDuCuyGyINqbneqI2KqBR/7CgkzW0USol6cN2HaHuNGPLJSVhouNR86CnpXQTQ5kVDccWAYnLakhd1oDtjF2kie8KcxZC6XL6VedZ3KIHw2gtEhkMBXabxcw4ydQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 by DM4PR11MB6144.namprd11.prod.outlook.com (2603:10b6:8:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Thu, 19 Sep
 2024 12:16:31 +0000
Received: from PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf]) by PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf%6]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 12:16:31 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Subject: LGCI Ubuntu 24.04 Upgrade Reminder (3 of 3)
Thread-Topic: LGCI Ubuntu 24.04 Upgrade Reminder (3 of 3)
Thread-Index: AQHbCo3CWWFOc3k+Pk2xnayiL++d5Q==
Date: Thu, 19 Sep 2024 12:16:31 +0000
Message-ID: <85d343a112b9fc07ed8939469b32625f34be6112.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5861:EE_|DM4PR11MB6144:EE_
x-ms-office365-filtering-correlation-id: 89f44bdd-b792-4bf0-176e-08dcd8a4e533
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MytYQ3N2c0htNmM3WTdCaWU0RUFuWFNZYWpPMVREQW9VTDgydFZDZ3U2R0Fs?=
 =?utf-8?B?bGxITlZIajdydUIzRXVsYklYUWJRa1BlL2xtNjh2WnRBNVh1aTIxaWJEODNI?=
 =?utf-8?B?NUhTYjFkOUtQcXFOTE9DUU0zNFE1dEN5d1NMNlZuS2wwY09DRzhKRDZnMDVu?=
 =?utf-8?B?QUlWSVZob2Q5Z0N6cTlGVFZQNEkrWHdoOHUzbDkwT3JpQTVoMER6ekJQZG1l?=
 =?utf-8?B?NndtTnFBcW4zdk56NnhndGpEQnpveTAwT3N1UXZqN1U1c3JMZUlCdkxZMDkx?=
 =?utf-8?B?SnRMZ2ZwODljeHdLMHBHcDkzQ1JLVzZpRXNUYkJ4SW1jeDJrUkgxRlZhTFFN?=
 =?utf-8?B?cHRUbE5sTWJoUnhTRjE5dW5lT0ZhZGJITVVML2VSWEpsM0RtNSs4N2xhT083?=
 =?utf-8?B?Z0taUWNRUHpVeGdCUHJDNEhQK3ZJdlkyTm82SmR5MGRVZnRhTEc2N3o3clhN?=
 =?utf-8?B?V2tPbmhOWTd6ZjByZHVINENvaTJJMk13WlNBNlY3RFFxQXBPaDVvQ2hjR0lX?=
 =?utf-8?B?dGw0bjBRYmdVWFN5WFVicEVMSDZwbU94ZW1wT1Y2RVNSVUFQY2xzMXlDS3lZ?=
 =?utf-8?B?RjVCRnYyWlFNYktrSmRkK0ZRNld5VlRUVEZYaFl6bDEyTzlGQWJwdjZKRGdj?=
 =?utf-8?B?WEZOdm5FUndLZnN4WjUzZU9EVE1ocGVmTnVrOHI0V3JCTHpjWHNTbjNGcllw?=
 =?utf-8?B?a0lnbHRwU0VQTU56V1FjMFFiMlBob2w0eDQ3M09RRGtXOURwejFZdEY2N25z?=
 =?utf-8?B?Ym11TC9WZ0Q1aUROWkY5SDFPeVhub2tRQU0rWk1kTW43UGFhaDNiQTZWUGpr?=
 =?utf-8?B?cDltdHJSajFjTU5QU3dKWkZPRXI2c2x3RUcvQUdlemRENGRqUkNleWd5VkRh?=
 =?utf-8?B?MFNMckg3V2ZXeVFYZmR0Z202WHpTRWJLVzJRaEQ3aUNyNExXS1lJRHQrVzFL?=
 =?utf-8?B?NXJXQzZubytEVFROeVFsVG0rSjAvenI1SVNqQ0lCa2dBdmJtT1RFTVFBSURK?=
 =?utf-8?B?WGpiWkdrMkluN3F2bGFKUXo2emlJQ09JcUM5MzNWMXF1Z1NoQXFTeFZaTjBZ?=
 =?utf-8?B?UUdXUUNNVEQ5Yk5oQTl4d1k3WkJtY05JUisyRGNhdTRETVREc3I5RHJNU2ZR?=
 =?utf-8?B?TmR4aGJYRWQ0STcwMEc0SE43Rkk4ZjdQa0lMSUxTZmQvRGgvTkNnQkkyOWNa?=
 =?utf-8?B?TFB2L1daWHRHUVh3Z2RMejVFSjNrWkxqQ0Z4THBSNm12MUdoSWhBRW9TTWt5?=
 =?utf-8?B?eE9vVWFkYnQ3cWt3ZUt0c1ZUZS9Eanp6WUQyVFZJSDhVWjRaU2NSTUNPSVo0?=
 =?utf-8?B?dWU0T3RBODk4c1lCd2hIU0h0TXllQVhTT09qcG5aTjJkL3hQTEtIdUxRZnR1?=
 =?utf-8?B?RjN1VnJodFY4MlJWU3EyN2VXTUE4R2ROV0FiM0IwSDdNdThiTnprTnJxdnph?=
 =?utf-8?B?dW10Tm5wUTdnVnd0dzQyaDg3YlVVNnp4UFdHQmR1eG1hblZidjNxVmxjN0lW?=
 =?utf-8?B?U1FVaktxWk8zZWxRMzQvTnVpYjdHSFp1M2lsaUhqalZOZGtJc3N2TFdkTFBI?=
 =?utf-8?B?NnNDVGFzclpxRVFjYk92Y0ltZ0RPODVlSlB0ZkZXWHZrNjcyRm5pb2YwNUZM?=
 =?utf-8?B?OEF1b0t6R2VzYnZtUTRlcU05QTRBc3V3T3BORW9kakdXS1NqdStJL3ZmK3Zu?=
 =?utf-8?B?ZHZ0R2JZcGJ2d2FoU2xKSWh5OXFSeGRYMjB5Wkw3VUZsbjhiZVZrMnhFTHVk?=
 =?utf-8?B?b3ZhL2xwZkliSlI5d0psV0xGSUl4VlRjdHdzd29hL0tKcWFWK2xqbFVhaDlC?=
 =?utf-8?B?VjgrUU1QcTlmcFAyZDR3L280cW9OaHZ3MzgyOUdGODBxNkF6Q0ZpYzByT2lw?=
 =?utf-8?B?dDlaNXIzeXZURkRVNmRacUc5WG9NVjZtZVVpZjlZTWFta1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGxDdzBHdEVSMHp6eVVSalZvNjhoZnhHL1ErbUNjY2J1bzlmTEgzVllkb3ll?=
 =?utf-8?B?S3BDREp1alhOZ0FQS21mZG5wdmE1a2FwN0V6MTRaTm5jeWpWa2dycmljdEV1?=
 =?utf-8?B?TVR4U0UyZDkzYXR5a2J4ckx3WXpzQlp5WkdTcVFLRW9SODFnM2xHeDhHcDNn?=
 =?utf-8?B?Z1BXeCtjL3FtZmRWZW1nSmdac0xJbjdkcU9uZ3FkWVlSTU1OZzIrWFBmUEtS?=
 =?utf-8?B?SWdzTmluSkR1M05UVzVJMDFGU04vYzFxM1IrQTJ0ckFaSHVoQjcrRWU4MmEw?=
 =?utf-8?B?ZzByZ0xFTTB4d3J6cTdQMng5SG1Ib2RySkY5NFZSeDNnYkdka1hhemFFbElk?=
 =?utf-8?B?Rk5DaG1tUFlEYThjNG1QbWNDNVVqdnQ5eTk2K21ySFFNTU5EcGdHZkdpTEpn?=
 =?utf-8?B?MThnSVhmcGNpa3NwWEZPNGtIT1FPcVcxRDRsRzhycGN3R3VNOGlTVzkvUURX?=
 =?utf-8?B?K2VERzZnU3hHcWlvVVovenNhSk5UZmsxcEpEMTNzN0NvT3BONis3cDFmU3BD?=
 =?utf-8?B?SDJ2bVdQbXRhdGxhU0dDSlNwWVhuRk0rcEhJWmszS3QzN09MVEZwQy9nZWdv?=
 =?utf-8?B?TW1NcGFqZTB3UnpWbWdLL1VXRFBnS3VvWm5KOHZmcWdSUjc2RGJyd3NtTzFo?=
 =?utf-8?B?QWFLQldPNktVMndjR0tPQXI0NTBzYlVNWEU3d0V1RlZRU0NmajRacXZxNTM5?=
 =?utf-8?B?UmJpUnVvbG5xWHcxZUdNVEZQam54QkhjMzk1SFJKZGVBSVUzajRzc09veDQ4?=
 =?utf-8?B?d0R1N1crbFFjTFQrbnJNMjdaa1ExWHIyNVdBWVM2RkJEeElxaE11bGxnYitE?=
 =?utf-8?B?YlJLSHFMV1JBckQ3S2U1SVVtRFRRcWQ4U0tFUHZLMUlMZkNKRDlzOUI5WkQ2?=
 =?utf-8?B?UFBoY3ZDeHRHanJPUGJhY21GeWM3dmpYTHlKTVc5TjhPY0MrRTRVU01qdHhH?=
 =?utf-8?B?MjFPQ2xzUzEzQklWYTVFMm41VC9XcUd3OHFTL0tsdHB2SjhDMHRQZytOOENr?=
 =?utf-8?B?akhNejNNcXNieXZtQ2JwampwV3pQTjJHbGNXZVBLWTRETTA3Y21xdjZTMGFh?=
 =?utf-8?B?dUEydzlaQklOblJXNkVSQ0d1SHV2bHBJaUYrQjFQd08zNDdsV0NxYlBkVTR3?=
 =?utf-8?B?OU9pQzhnU0QxSmszNVhPUGlwWndBSDVVTHJ1a0M2RzcxZjVVY210ajJCbnBC?=
 =?utf-8?B?dFVoQjlQMjI2aDFKRnBXRDZ3QkFwOTFSUVluM2orMU14Tjd2TFNLdVVWM3da?=
 =?utf-8?B?RGVDdktLanQ3Z0hTUTcyZ3ZHYWVLczdNWmJsWFhIRjNaQlhxc3BnNHFDWjBu?=
 =?utf-8?B?L0dteU51ZEwzZ2tVRURSeFpxcU8vblZLTDcvbEhpVlhUSnpuYUdRbnBKUUdE?=
 =?utf-8?B?b0F0b251QjhsZVQ3bVpiZy9VMitnLzNPcEJCb1U5QVdqb3cvOUJmbnJyaVMz?=
 =?utf-8?B?MTFkWEIrWWlLUVIvajBUUk1SMUc0aEZsYWdjVHprcFVlVXJ3ek4rT21SK3Zk?=
 =?utf-8?B?T2xiVUd2VW9yZGlJTzVEWmR6VzdPSnUvbnhoY3lhSzRHZWg1aG1GUFVDWGpZ?=
 =?utf-8?B?emhhNjQ1eTk2bEV1THhHdkc1NVA0OXNxa2xQeU5iZk82Z0xvZTR4ZDFYL0lO?=
 =?utf-8?B?NlpObmpKOVQ2ZyswWTFJNElMSUhYK1ROQklZKzJwdFhxWUxuVmtONjBCOHcz?=
 =?utf-8?B?bEsrN0dsSDdiSlFOMTZTUVRlcllPcWZ0ZEozYTFEL2NPTCs5OTZaR2c2bVZI?=
 =?utf-8?B?OURGUUlWbVFyYVU3U0ExdkhaaXdvTDJCWkNLMFZneUNCNVg3WkxFdlV6Ukxv?=
 =?utf-8?B?SmlDbG1HcGlUaFVxbzVmME52OVR2WlI3Qy85T2x1SjkxNTQzU1ZjOFpyR0RO?=
 =?utf-8?B?OS93ZGVDeFlMWFFneW83S2k4N1FFTk1WWkVWZnF4cno2OVhINXhpV1B3dkdT?=
 =?utf-8?B?aW1ZZzZweXU2aEpjbE1FRjNsTUttK1Axa0ZZd1VwOGwwMUZ3R2YrdmlBd2Vk?=
 =?utf-8?B?a2sxZG1OYlNwNHZLV1llR0F5TzBkV2ZldjYvOHUrWkVXbmZVUG5kcU5TSnJL?=
 =?utf-8?B?Z0luQTc4MW1KL0ovb3BoMUhZdFU1VzlUdlVHbi9FbzdtQXc3RW1GRnVydEcy?=
 =?utf-8?B?ZjdncTV3SFk2K3lXanozYnEwSkExMEQvZ0pmZHZ3aDA4SVpjNjZFWm5mUnVZ?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7954D44448F93045B676E5C3A5235D62@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f44bdd-b792-4bf0-176e-08dcd8a4e533
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 12:16:31.0907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /GBr0Chz0kFeR5vF496tPl2+QbNXSLysZgPHiH4siLCf5nel5n1Jq6TznKK2EmsZpEbziJ/LWgiLiEPRu5UvIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6144
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

SGV5IGV2ZXJ5b25lLA0KDQpUaGlzIGlzIHRoZSBmaW5hbCByZW1pbmRlciB0aGF0IHRoZSBMR0NJ
IHRlYW0gaXMgZ29pbmcgdG8gdXBncmFkZSBhbGwgRFVUcywNCnNlcnZpY2VzIGFuZCBzbyBvbiB0
byBVYnVudHUgMjQuMDQgTkVYVCBXRUVLLCBvbiAyMy4wOS4yMDI0Lg0KDQpXZSBhcmUgZ29pbmcg
dG8gc3RvcCBDSSBqb2IgYWNjZXB0YW5jZSBvbiB0aGUgcHJlY2VkaW5nIHdlZWtlbmQgdG8gbGV0
IHRoZQ0KcXVldWVzIGRyYWluIHF1aWV0bHkgLSBub3cgaXMgYSBnb29kIHRpbWUgdG8gc3VibWl0
IHlvdXIgZmluYWwgMjAuMDQgam9icy4NCk5ldyBjb21taXRzIHN1Ym1pdHRlZCBkdXJpbmcgdGhl
IHVwZ3JhZGUgcGVyaW9kIHdpbGwgbm90IGJlIHRlc3RlZCwgZXhjZXB0DQp0aGUgZmluYWwgb25l
IHRoYXQgdGhlIHN5c3RlbSB3aWxsIG5vdGljZSB3aGVuIGl0J3MgYmFjayBvbmxpbmUuDQoNCkV4
cGVjdCBDSSBpc3N1ZXMgYW5kIGhpY2N1cHMgb3ZlciB0aGUgbmV4dCB3ZWVrIG9yIHNvIGFmdGVy
IHRoZSB1cGdyYWRlLg0KDQpUaGFua3MgZm9yIGZseWluZyBBaXIgTEdDSSwgc2VlIHlvdSBuZXh0
IHdlZWssDQpSeXN6YXJkDQo=
