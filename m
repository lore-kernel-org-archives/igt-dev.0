Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA00C61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 09:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE2110EC48;
	Tue,  1 Sep 2026 09:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyd+eN8n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B95910EC48
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 09:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788256304; x=1819792304;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DzaQfito0fClFmm2HzzHzAXZZmTEDoidXTQsyR2tsz4=;
 b=cyd+eN8nAVO74ybUVzYv91TLAzWyn62yUv2+0ulsV1H98vZu5LEjNeyq
 phLnqHv41SGfU63Y06FLWXh/GZvLh6m2ptJBflMTN6sat6/zIKKiiw+Eo
 aDt5mWo2au1MdRvw+TaemTcXeO++y2N+Lhhg8hX/LK/XVZc5ELCdjjPMa
 F0duzCGzpbyKoN1bsn5S/Rx6+GzvFuWcEepiBdqtZpxxqtf8hVyP88S0v
 OXTE7pkceVYBSMLyo2iR7zlgJzp/W/rXkqMLj7IzLuJzo0lb6oQ5oBTG5
 kOMD+7QMy7zFUE4V6vaPSVErOyx4D+1ts0uSfAMkKS7sYoTMdFjSTW1// Q==;
X-CSE-ConnectionGUID: KRhghiPpTKe4SraEvLRocA==
X-CSE-MsgGUID: atBh+ghHS2ONTfy+PevMaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111450209"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="111450209"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 02:51:43 -0700
X-CSE-ConnectionGUID: u7D1kU9PT522KKDSDfsAYA==
X-CSE-MsgGUID: qmyQgKzLSfCL9jXrullaHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="265331994"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 02:51:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 02:51:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 02:51:43 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 02:51:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEpuNLp0THDSRGk+GYXKwV8BUqmki/ZepDLuXD4wnbRUIE+xKFnpJPV/uHN5nsLYzB7mqibqF/KcM06lqGu2KkT0v0z3mZy79p61BpGpgkgpkTpNtsHtMo9evJ9Ahoh7A9mC4nyrvb4nLp4B21orYxgQuPFYHoenZRXnI1r+5LEGjcCZW2ADS9DPw4kvoI3MtFK72KcVTuihUP3IHbw8s4TzXSDYUWhIfT/ZFC7T1vy53DlVtHGSpMOTvkQ9vo2/dAAi8eCzyZEcm06Z5/K5n2l9IMCamYgZ66GHMh3bv3VDB7DjskvYoCVgocGvW7gpaPh7JU33htMqD68tsuEP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzaQfito0fClFmm2HzzHzAXZZmTEDoidXTQsyR2tsz4=;
 b=agO0sd6i8sg6foor8EpiLzxp9cn7hItTubUtFOn+u4HRbTBFWMl0NOJXVH6XGLs/s4EGxopta3P5T+cbwZvntTYDRs55s/ASC1L2gklkuu2TUOx8c5OYCodOWeZGSHqlUuvu8TVCLvIkeHwY6Hcd4b5qemuL+6BhGFXCmfldRqjsiTusgAlsgsBu3CNT8i3PgjBcdVMXAlEyWfFf7f1zJYwM1o7KHNZ74OXbZW27QwYv94sRekfiLGLIo7zndW2tyRRNMOKLH7v4x2171K0NaCEzHh6zQDH8Ez3FXYUrsCNCcBH/JSy2o4/YZ2DYPwKs1oArINZjGYkhutoS1XP8Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CH3PR11MB395573.namprd11.prod.outlook.com (2603:10b6:610:362::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 09:51:34 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 09:51:34 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "Grzelak, Michal" <michal.grzelak@intel.com>
Subject: RE: [PATCH i-g-t v5 5/7] tools/vbt_decode: parse & dump VS/PE-O
 tables for Snps
Thread-Topic: [PATCH i-g-t v5 5/7] tools/vbt_decode: parse & dump VS/PE-O
 tables for Snps
Thread-Index: AQHdClDXjEC9+h2rzEG1kiEQH7qOzra51yLQ
Date: Tue, 1 Sep 2026 09:51:34 +0000
Message-ID: <PH7PR11MB605316ED569717BF415F02C1E7A82@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260702182619.3973788-1-michal.grzelak@intel.com>
 <20260702182619.3973788-6-michal.grzelak@intel.com>
In-Reply-To: <20260702182619.3973788-6-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CH3PR11MB395573:EE_
x-ms-office365-filtering-correlation-id: fec6226d-0662-419d-65e8-08df080e9bd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|38070700021|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: 9n9dny+T0P+x/PlDwhThgrrXACEsaIqUXDHRtQiGNRWVtZn5oogLGB/77dzR6sNw84Wg8hOxuQQ3V4ya1K18bdgyvOZdKpgbkjC+2ELhboDCI/K8nPUf5c93e9HFMpUz7VReAumtu6AwVASvjtrVbfsBflf9ArqTrIH4Rchy7VULIMiFq4iMftFCc53VEgC3fDmZNftC6uckZu1x5dQOBqSO8QDzmyvpxrpKn/c+0vwdZEca+HOVSvbze0K9ln8wXQq2YSMndLNrPeSkkHhOCPytU8MDbzJ5nkhaRJfvBvx202MoWkB+SsuIykmbsT/gB86KUyyNRcPZAXaHnZy/ezd7MlxqgyRyTVetpkjvOxgEMwk3QFM5HBtUumuwPcv8CGIIjrKUHXPTz9eeUBq64jYIF8Z19peZlYGEwe/tvFkBUZQytACttkohRnKH+zWzmn39iqy9ezuVjw/IYRIjfIAhy1ailuwWKJ4reer4o8qkXXmqhqKUeGXhO1oLUfJLez0KlUkGEe9zrkrGsI7b8WXYQ8VsYkpT7xSE00A3ScHvFdhm/UK93hz0QVLVMxoNX+G/v98qQ/bUMRuHkvM9pitcjAzatczPk1pPX4R8k1UT3qj0Swb3gyHr7c1POVW18tRKzM2moL4Fhv/yT7p3d/D1WoBxrrOAqB+mbXJrbqSQ7mZHxIjKD0es4Fvlw2A8lYS7jvRDWcHDAcb0+pggJEZtYPH8hvDD1IBdUTeBBPk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkRnVkIyTXdQSmdSWm0vN3hCZmRyQk1aZHphZmI3eUVDZld1b3dEUWZIUzJM?=
 =?utf-8?B?aEtuamlQUnROTnhLUVFYanFFam1zcUpIcGRiUSsxWFhZMnhpeGtPeFdXNkc5?=
 =?utf-8?B?eFhua1c1WEQwTWZVakJIYjNjVW4rck94TXlDaU1yMjBNOU1Hc0NEQmVHY3cx?=
 =?utf-8?B?bXRmSWNVaWJjcFllaXQzVWxPYnRaa1IxMUIwTHF0RmVMTy9FUFU0T2p1WFFN?=
 =?utf-8?B?UDJQaDh2T1NqQkZqeTErM0svZzZJM2twRTlGcm9vY2d1b2EybXUwRGtkMFRw?=
 =?utf-8?B?bnRQTGR6enk3QmJZbkFTWjNsaXhNV0FMQkVMSlA4TE9lbS9pREwwWXYzN2lM?=
 =?utf-8?B?c1JOd0RXVUxmd0JkNlZtbXN0c2JodXQwL01OcUNhNTJhUExES3IrU25iOG0z?=
 =?utf-8?B?THUraTBlbE9QVU5KR3Jhb001eWQ0T0d4RFo4dlhTakU1WHVNVVdXU213U2Jn?=
 =?utf-8?B?UVhrdjJ4Y2JtbUF0RGRiaFlzUG1vMFh3QkZhQ1VWTUdSaXhmTG1vUWNmUjNa?=
 =?utf-8?B?dlFHaithbFVyUEk1L0hRSWZSU3ZDOU5mY1ZjZFdaVTM3WmJRbkRmaExSTkdr?=
 =?utf-8?B?bjFWWDZ6ekRLN1RFbGNMMTQ0eWxSeCtIeVVoUUhxMFNqM2NFWnN3WkMxS2V4?=
 =?utf-8?B?SFpjNStnSkY4VEhNY2dFeDNzQlZ5TG96VnFRT2MwL2FTUnpGK25aMlBLdnB3?=
 =?utf-8?B?SStMOUd3QkxFeFNCNTFtNkFyb21GQSsrd1hZOG53R3RLZlRVdisyY3MwYVBi?=
 =?utf-8?B?blpVQnB2Q21raW4zRlpOQjhKalZvbDhQbmtmVEhuWDBGTWpXQzlsUU5BQmd4?=
 =?utf-8?B?bjNrWEorSVlPeEFrK2VPQmpQQ1NZVTdhS2ZDbHU4eWs5VHg5aUZ2NldGM1l1?=
 =?utf-8?B?WUt2a0Y0R2haZ1cyWUhZRmVKaUZTQi85eHYwUURkUXBDUDBqb1JtQ3E4VVJD?=
 =?utf-8?B?M1JZdDR3T29WZFgyZzBSc2RZUUtzQXl4MmVDdC9TNzQ5NUo5NXJDV2YzQ1l6?=
 =?utf-8?B?TGRMdEJ5TzA2RTlEdGczckJZZmZPRGdRR2hOeEN0aUVXT2loNytMNnAwT2wy?=
 =?utf-8?B?YkZ4aC9MWnNDZjMxZ1ZoMitjZWUrZlh0ZXRuUkY0MVFIZU1TWFYzc0piODgx?=
 =?utf-8?B?RU9PV1VXakQ4dUkzWHZDamdJMkpSS1ZsSm5HRkY2TFQyOHNxSXRScmZOZVhR?=
 =?utf-8?B?dmVDbUcyMHpsdjZ0U3RXL0JJT0NReVBDZ0pFaS9uMXJEcjVoSFdaNVpSOWt1?=
 =?utf-8?B?K0JnRVZ1VlRVKzFOTWdiZVlHQ1hMcWJ2UllKY00rM1JNbzVyaGpZQ3JmOHFH?=
 =?utf-8?B?UkdaV3puMGpSbzByU3pBbkFnQWtoTzdhSW12bnl1aGxsZFNnbGNtelEvQXpW?=
 =?utf-8?B?cTBqV1lYbU9Jb1czZi95Q2pUb0pxNUN3d1NuMVpUV3NtQjFLMkNUYi9NZTc4?=
 =?utf-8?B?L0tQVG8wVzZ0TnNSZDYyQmJRQWdlU2NqdWRaR3Fad0FTdUFEcWtlZlJTYlhx?=
 =?utf-8?B?NFdRMkxTUXlrS3Z0K1RnMmw0WXdzcEhidVVLVWhKWE5CUTJRaUZxa0ZGWWRS?=
 =?utf-8?B?V0QyVHp3UnFFWHpvMEpSN2lZOUJpdDYwdXA2NVA0NU5iN01ISklSRkZINW5y?=
 =?utf-8?B?dmN3WkEwYzFaV3ZLSEJybzlzTTFzVFc1RVVGcWVtRnNUWmRVa2dpRkswSWdw?=
 =?utf-8?B?Q05CaVFCbnJmUHNMQW5kQ2pQcUgyV0l6RHNLWTQwbFd4bVZ1Vk1meW8vZnJa?=
 =?utf-8?B?cVozSlNkeUNqM2QzUGN0dDdyWjVReHRyRnV3c2F6S2h4Z1ZBQkQ2MnhzTHR5?=
 =?utf-8?B?V3p3eWgzT2NZbGxPL25lSzRSS3FVN3dQTmRUaXA1MXdkT1ozRC9wRklGZko3?=
 =?utf-8?B?d0tEdmxKV0ZjR0lGeml0OWtuYVhEQ3g1ck45TllrWXVjRUpveW5QNSsrVmJn?=
 =?utf-8?B?QnFEeEFmdEpWQ2hVZkx5WUlVejI0cVVFRUcrVG9ETWJBa2YzWkVsMC83MmFz?=
 =?utf-8?B?L3pGL0Nxd0VNbWlGM0xqaG5wK3hrNHdvekVPOGt4T2h1YmErZmFJZVFCajZw?=
 =?utf-8?B?VldzS3Z6bmJJRlF4c29rMDYvVG8rN0tsOGdxMitwMk1nK0FrQzNpeWVYMDdl?=
 =?utf-8?B?ZksrSjFrVWlnTHFyOUowNm16VW9ReGQvR0NTQnV2czZWMWxzZEgrS1I4VzFR?=
 =?utf-8?B?cXhRSm5mYlpNdEdjRU1sMnpTOCtvbzVnL3EyKzBPN25VYkhRYUFQQlhYZEtw?=
 =?utf-8?B?ZzBCcU5xa1ZLNVdXME9Oa05pc0tiTUpreHprSGt5Y2cyS2xCNVUyRTVVVHlG?=
 =?utf-8?B?TUJJQnFQWk1KNGJ4aktqcFhBOEZkNmhURUlqZ0xWYmRhY2xlRHBJdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GtQbRdLu+i0gz8fk6gju2k6Gz0gZ//KhhPiAqV0RpyhgIuN/BnG60RtCK/U6kaEfBwxQAE/tjMZv9+Xtajt8JHDBINlTzuIII5BuND80A2EZ0JHPCO2kPa0mBfI/ysLRoQLZdI1XBVcwEumrQ3IRURFkM2LtxQit4AZaDXnqwfgPnKMMYruYEubIQOdDiRscMh+dtZ9cWRG54jdvBYsvS55kwQ6XwOowC9SzQrRxOV474Z5Atl0EF4rxQGApTxeVpawYHZ+Iuak0UT8XOtnjwo5HmMdKXjEQVznO4QJz4mtlM4GSXH/DAzIRPBbRUhU4C0QPRGFUjGJGWqiYKW3N2A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec6226d-0662-419d-65e8-08df080e9bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 09:51:34.6147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBoPJuLd5ilXqLPAWJDYVA+SQenkOAJh3AGX6+gOqtH/F1+F7jVSuOsGdqHtrBUUiUbd4dP+qisVFE6QBvEKNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB395573
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

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGlndC1k
ZXYgPGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBN
aWNoYcWCDQo+IEdyemVsYWsNCj4gU2VudDogVGh1cnNkYXksIEp1bHkgMiwgMjAyNiAxMTo1NiBQ
TQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IE5pa3VsYSwgSmFu
aSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgS2FuZHBhbCwgU3VyYWoNCj4gPHN1cmFqLmthbmRw
YWxAaW50ZWwuY29tPjsgR3J6ZWxhaywgTWljaGFsIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2NSA1LzddIHRvb2xzL3ZidF9kZWNvZGU6IHBhcnNl
ICYgZHVtcCBWUy9QRS1PIHRhYmxlcw0KPiBmb3IgU25wcw0KPiANCj4gRHVtcCBWQlQgIzU3IHRh
YmxlcyBmb3IgU25wcy4gQWRkIGEgdGFibGUgb2Ygc3RyaW5ncyB0byBzdG9yZSBlYWNoIHRhYmxl
DQo+IHB1cnBvc2UuIFNob3cgdGhlIGFmZmVjdGVkIG1vZGVzIG9uIGR1bXBpbmcuDQo+IA0KPiB2
Mi0+djMNCj4gLSB1c2UgQ3gwIGZvciBTbnBzDQo+IA0KPiB2MS0+djINCj4gLSBjaGVjayBwbGF0
Zm9ybSBiYXNpbmcgb24gZGV2aWQgbm90IFZCVCBzaWduYXR1cmUgKEphbmkpDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBNaWNoYcWCIEdyemVsYWsgPG1pY2hhbC5ncnplbGFrQGludGVsLmNvbT4NCg0K
VGhpcyBsb29rcyByZWFzb25hYmxlIGZvciBhIEN4MC1zcGVjaWZpYyBkZWNvZGUsIGJ1dCBjYW4g
eW91IHBsZWFzZSBjb25maXJtIHRoZSByb3cgY291bnQgYW5kIA0KZmllbGQgbWFwcGluZyBhZ2Fp
bnN0IHRoZSBhY3R1YWwgQ3gwIFZCVCBsYXlvdXQgb3IgaGFyZHdhcmUgZG9jcz8NCg0KUmVnYXJk
cywNClByYW5heQ0KDQo+IC0tLQ0KPiAgdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jIHwgNDINCj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9pbnRlbF92YnRf
ZGVjb2RlLmMgYi90b29scy9pbnRlbF92YnRfZGVjb2RlLmMgaW5kZXgNCj4gMmYzZjcyMDU3My4u
OGQ1NGIxMTNhZCAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jDQo+ICsr
KyBiL3Rvb2xzL2ludGVsX3ZidF9kZWNvZGUuYw0KPiBAQCAtMzQ3NCw2ICszNDc0LDE1IEBAIHN0
YXRpYyBjb25zdCBjaGFyICogY29uc3QgdnNwZW9fbHRfdGFibGVzWzZdID0gew0KPiAgCSJEUCAy
LjEiLA0KPiAgfTsNCj4gDQo+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHZzcGVvX2N4MF90
YWJsZXNbNl0gPSB7DQo+ICsJIkMxMDogRFAgMS40IFJCUi9IQlI7IEMyMDogVU5VU0VEIiwNCj4g
KwkiQzEwOiBEUCAxLjQgSEJSMi9IQlIzOyBDMjA6IFVOVVNFRCIsDQo+ICsJIkMxMDogZURQIG5v
bi1IQlIzOyBDMjA6IFVOVVNFRCIsDQo+ICsJIkMxMDogZURQIEhCUjM7IEMyMDogVU5VU0VEIiwN
Cj4gKwkiQzEwOiBVTlVTRUQ7IEMyMDogRFAgMS40IiwNCj4gKwkiQzEwOiBVTlVTRUQ7IEMyMDog
RFAgMi5YIiwNCj4gK307DQo+ICsNCj4gIHN0YXRpYyB2b2lkIGR1bXBfbHRfdnNwZW8oY29uc3Qg
c3RydWN0IGJkYl92c3dpbmdfcHJlZW1waCAqdnNwZW8sDQo+ICAJCQkgIGludCBudW1fcm93cykN
Cj4gIHsNCj4gQEAgLTM1MDMsNiArMzUxMiwzNCBAQCBzdGF0aWMgdm9pZCBkdW1wX2x0X3ZzcGVv
KGNvbnN0IHN0cnVjdA0KPiBiZGJfdnN3aW5nX3ByZWVtcGggKnZzcGVvLA0KPiAgCX0NCj4gIH0N
Cj4gDQo+ICtzdGF0aWMgdm9pZCBkdW1wX2N4MF92c3Blbyhjb25zdCBzdHJ1Y3QgYmRiX3Zzd2lu
Z19wcmVlbXBoICp2c3BlbywNCj4gKwkJCSAgIGludCBudW1fcm93cykNCj4gK3sNCj4gKwljb25z
dCB1bnNpZ25lZCBpbnQgKnRhYmxlcyA9IHZzcGVvLT50YWJsZXM7DQo+ICsJc2l6ZV90IG9mZnNl
dCA9IDA7DQo+ICsNCj4gKwlwcmludGYoIlx0TnVtYmVyIG9mIHZzd2luZyB0YWJsZXM6ICVkXG4i
LCB2c3Blby0+bnVtX3RhYmxlcyk7DQo+ICsJcHJpbnRmKCJcdE51bWJlciBvZiBjb2x1bW5zOiAl
ZFxuIiwgdnNwZW8tPm51bV9jb2x1bW5zKTsNCj4gKwlwcmludGYoIlx0TnVtYmVyIG9mIHJvd3M6
ICVkXG4iLCBudW1fcm93cyk7DQo+ICsNCj4gKwlwcmludGYoIlx0UEhZIHR5cGU6IEN4MFxuIik7
DQo+ICsJZm9yIChpbnQgaWR4ID0gMDsgaWR4IDwgdnNwZW8tPm51bV90YWJsZXM7IGlkeCsrKSB7
DQo+ICsJCXByaW50ZigiXHRWc3dpbmcgVGFibGUgIyVkICglcyk6XG4iLCBpZHgrMSwNCj4gdnNw
ZW9fY3gwX3RhYmxlc1tpZHhdKTsNCj4gKwkJZm9yIChpbnQgcm93ID0gMDsgcm93IDwgbnVtX3Jv
d3M7IHJvdysrKSB7DQo+ICsJCQlpbnQgdnN3aW5nID0gdGFibGVzW29mZnNldF07DQo+ICsJCQlp
bnQgcHJlX2N1cnNvciA9IHRhYmxlc1tvZmZzZXQgKyAxXTsNCj4gKwkJCWludCBwb3N0X2N1cnNv
ciA9IHRhYmxlc1tvZmZzZXQgKyAyXTsNCj4gKw0KPiArCQkJcHJpbnRmKCJcdFx0UHJlc2V0ICMl
MDJkOiAiLCByb3crMSk7DQo+ICsJCQlwcmludGYoInZzd2luZzogMHglMDh4LCAiLCB2c3dpbmcp
Ow0KPiArCQkJcHJpbnRmKCJwcmUtY3Vyc29yOiAweCUwOHgsICIsIHByZV9jdXJzb3IpOw0KPiAr
CQkJcHJpbnRmKCJwb3N0LWN1cnNvcjogMHglMDh4XG4iLCBwb3N0X2N1cnNvcik7DQo+ICsNCj4g
KwkJCW9mZnNldCArPSB2c3Blby0+bnVtX2NvbHVtbnM7DQo+ICsJCX0NCj4gKwl9DQo+ICt9DQo+
ICsNCj4gIHN0YXRpYyBpbnQNCj4gIHZzd2luZ19wcmVlbXBoX251bV9yb3dzKGludCBkZXZpZCkN
Cj4gIHsNCj4gQEAgLTM1MjUsNiArMzU2MiwxMSBAQCBzdGF0aWMgdm9pZCBkdW1wX3Zzd2luZ19w
cmVlbXBoYXNpcyhzdHJ1Y3QNCj4gY29udGV4dCAqY29udGV4dCwNCj4gDQo+ICAJaWYgKElTX05P
VkFMQUtFX1AoZGV2aWQpIHx8IElTX05PVkFMQUtFX1MoZGV2aWQpKSB7DQo+ICAJCWR1bXBfbHRf
dnNwZW8odnNwZW8sIG51bV9yb3dzKTsNCj4gKwl9IGVsc2UgaWYgKElTX1BBTlRIRVJMQUtFKGRl
dmlkKSB8fA0KPiArCQkgICBJU19CQVRUTEVNQUdFKGRldmlkKSB8fA0KPiArCQkgICBJU19MVU5B
UkxBS0UoZGV2aWQpIHx8DQo+ICsJCSAgIElTX01FVEVPUkxBS0UoZGV2aWQpKSB7DQo+ICsJCWR1
bXBfY3gwX3ZzcGVvKHZzcGVvLCBudW1fcm93cyk7DQo+ICAJfSBlbHNlIHsNCj4gIAkJcHJpbnRm
KCJXYXJuaW5nOiBkZXBhcnNpbmcgVlMvUEUtTyBmcm9tIGRldmlkICV4IG5vdA0KPiBzdXBwb3J0
ZWRcbiIsIGRldmlkKTsNCj4gIAl9DQo+IC0tDQo+IDIuNDUuMg0KDQo=
