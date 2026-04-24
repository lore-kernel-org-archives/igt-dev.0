Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775E4F589DF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 02:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF1C10E0AC;
	Fri, 24 Apr 2026 02:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fiG80INg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F54E10E0AC
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 02:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776999543; x=1808535543;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=Or/6xI5htoCs9+rbvU0ZIIX1gxh0UeNdJMPhrcqRUM0=;
 b=fiG80INgiJnRVGUzUKyjKRGAhlJi0LDDYjEjGIkPmwWAhsjbWO6DQq90
 1vQcnGWbUFSMau9eBrdnLiUi+RI5vi2VUbtvLw5fwW48v5GciSTTLhYCZ
 v2sVPEDll1dUnCoHAYbp76/rWGo4tl32cus6+0m6yE9ojwjUU8ISHWPOv
 v8cifxhJA2Rp+FqB+z9/qZ421sFc7KDrD3m2TIk+oE4Eb93D2rxdXbjZn
 fns/TMFSDHnavJGBx/iA9mjz7izVKkchIqa7KE51smdxmWYBO8686PQg/
 Cn87Gr69v2oIi0j0w/OQDeU+KhD0o1iNI4IfhfJ1tiXdZk/0BY9sNsQaA w==;
X-CSE-ConnectionGUID: 089W4EHPSvWdb0VXr/n1oA==
X-CSE-MsgGUID: eDwKoDCiTcu5fTsO8ZbN6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="95392959"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208,217";a="95392959"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 19:59:03 -0700
X-CSE-ConnectionGUID: KTCAt3zjRVq6jClbuv7anA==
X-CSE-MsgGUID: pPDy9wi+RT6Ce0XsJkge+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
 d="scan'208,217";a="231975793"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 19:59:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 19:59:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 19:59:01 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 19:59:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMh7jYd8RhuSew4AKXPoYSufzKBc+u77Dzk3uBBHIoCLxu3MFEQY/SpJ3La9EYHc72Vzn2bYvEDQ3haiWoMWdG6BManoo7Ob3KVFsohxCNP+JG0qxq1kBu6okz2lzVoTq6KZjKT03XbvsghSIN0OYnq7l+FqZLRUWN5EzBeJvjM/odygAIQvFrYn3k6GjQafp5uKFWmKaZnAGGUw2Ioww0uoU8xqtP5dJdyScJOC6JE4D5ttVFL4z0rA/w2ja1icyxTDpwiYqBHZhPgB9xLeUXUR8xFXJeppuVYNuAKNfEasW0WdNtUb9VgukgyBCegamWUGGh3NEzcwRZ9ZEpwPtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dvd0CNRNGgMuFv50cEQPLsEYNffKMpJoUl2oDWJbIVA=;
 b=cE3JfLjYJaln0gDRmvPw6DHYnLRmLX5l9ew4ylywzVdFN0q74siFv+BczHx1r7pzbC6xs7BErXBvqxH694yBCnke1fHDsnkxHV8giOw5sid1MAy6AL/hJINEa0n8pitklVfXOkOFlVIstDF96KjoGS6vHfG0zI1DZjMwp5kzfzzXBh/uf1zmnieXIJ/2KNp7E9LSIeuhmVBQoa70zk5gvBVcLTgc55mPKYkEpSKkaC48pdiqt//TcsCVVjDCmmZ00UU36VUVriUPMa6qjJZ72kBo9xqlTPAurdmkLK6d67dCo5dckf23au3klbNu5573jMB38RYJedSXyZiBa/lbSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by IA4PR11MB9107.namprd11.prod.outlook.com (2603:10b6:208:562::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 02:58:59 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%7]) with mapi id 15.20.9846.019; Fri, 24 Apr 2026
 02:58:59 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Santa,
 Carlos" <carlos.santa@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, 
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "Karas, Krzysztof" <krzysztof.karas@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/xe_exec: Add VM rebind stress test under
 workqueue cpumask cycling
Thread-Topic: [PATCH i-g-t v2] tests/xe_exec: Add VM rebind stress test under
 workqueue cpumask cycling
Thread-Index: AQHc0r5AO9P/bLADS0SKgTbCNn3jILXssgqAgADUW78=
Date: Fri, 24 Apr 2026 02:58:59 +0000
Message-ID: <CH0PR11MB5427479922763E5FF9D1D2EB982B2@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260423005118.2033963-1-s.sebinraj@intel.com>
 <20260423141623.rgyvhqey4yc75prj@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260423141623.rgyvhqey4yc75prj@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|IA4PR11MB9107:EE_
x-ms-office365-filtering-correlation-id: 901c974c-b387-4275-9a9e-08dea1ad6eca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|38070700021|56012099003|18002099003|22082099003|8096899003;
x-microsoft-antispam-message-info: /CMmRpjh+4nHos77mKQxYuJoV7kiTKdmzvS5MWLJGEacsEve6m7aNnX3wh5ZWizi3LKy+9yblHcIT89OI+ZLfMzNiLoOq6kcNaQvV9FEN4rGGqUZME/vtrSrsiWEo15jI+7xSNdMyU4ZWT4DYrY2ncaNyloaoWTHUDeipZ+2Na/lpP7Qcw7nOWZBA+LGkrmOtSeZ5jOgVptAsVu/O3pJo3uqwbEIL2utxYPgddoAykC/8HPHfyDt9NDAFegWJu+yrHfBFQwKqtBZ1Dydukc05zn1SBJ5agkW3H1Wx31ZWFkJ8CigbEs3wwYsY0ZlN3xJFCYadxbGXQoNKe9ovSyuVz9gmT3l8aPWR4d6lF7GbF7wsYLEZWB1WRab/Kg7/PBtntKbrtG+4e5MWXwkaijmrwfe8jLFHY24kPdjxE5tlxUEkWds0MW7USrUD1Ay+NOvK7nrYb+nHxLKiYk6BW31bWwfxtJTNIB6k0pvO1bo4I0z1rSrB+JMv27FFAHFWw7v+QsFI5Av97rdsD5mMjiOscg3h6qlkdnnqNJIIooiBV7n4wMYps4QuErSXBBCSPIdB915hNTZOr5D25QCNE+Z4zod44A9AP9O+zU9Ej8tz5R2WghYGnXN4gux3XMfuHX+HCKljlLgytNFEzOUQIbxdSR2Tl4eiPkORS4DSLsr8e7uP3VzhFoildq8exKjaFwUySWMBUR7i9aU1ktVxwoi1GZypKfwCehlH6SZFw3dmehtKST9ZB2pszmUgdoMa+nw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700021)(56012099003)(18002099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?Qd4emNNyER40+MoS0XwJINsJ8xr0MPoqjZ2b+OekJNJ4mcQFQTAIqdvd?=
 =?Windows-1252?Q?+T6nanZ5HuktYYXm5yMroE9qdWBj6d5wXv+/xnfY1i+jLkkUIPBatYjW?=
 =?Windows-1252?Q?CHChC2zpHpdi06bOSiidiBu43I8VQS6yHu04D6+b3Hwvuhj8UE3CPmPa?=
 =?Windows-1252?Q?rPpzAjPB8CjFVPjdJRTVrOP3FCjEIVfoZ4h4Y1aNzaqev30MiWpRz8tz?=
 =?Windows-1252?Q?omnoSZ/Ge/w7yTpd1A/1jJ7xwI8g+olGKkkBPibmT3EzpXk5Amu2+wbz?=
 =?Windows-1252?Q?397T8YXD/yu+FO/YtqziH/GkEXWwkKoTH7L7hqaPTdrrFWdSmdLJN97Y?=
 =?Windows-1252?Q?TeuE+6iJCzItjbEZxMmx401/oJziUHABGLC+bAcZIrzMmn/B0BsvoKag?=
 =?Windows-1252?Q?3anMXlrVxAC6C1PgStqzkxmbUJ3fqN4/aIYPsOt28+nyW7n9Frb5PZxV?=
 =?Windows-1252?Q?11DXfXngMm1OrVLeoeZJ2/cInHPPzLyOZ8r4H8ewFO9EgLAWwUD9IJAt?=
 =?Windows-1252?Q?HAxYjxWKw2o50ZP3VO9xZNdDtvGBYt01jBSREUlo7LTcW6WrxMJy3pfM?=
 =?Windows-1252?Q?C7UiljrZKr3yQn3foH3PC6RTMJIxZdcdzATatAN77YJswcJx4RpnBMb4?=
 =?Windows-1252?Q?VwbqD5Q2WkIi+G5pYopCxLFSlKaWpCAS2rG9+fgxvi5Oeo3QuufBC6ky?=
 =?Windows-1252?Q?v6HKw/XuhIsGA4iWSoShumqljg199E/iEId4KXxx210up01MsbpFVrU1?=
 =?Windows-1252?Q?26GQGsd+Ul5AowQcziaJcfJJx7Ac7LI+PReZ2tCAE/3bDo5GQjE1G+wd?=
 =?Windows-1252?Q?g0++gPUoDpOHLdBy241TEohcvRQG/5Dyt87maV5lbpUWFV2Usyeq3mIA?=
 =?Windows-1252?Q?ag0VMoaFTOH0KRvWgDYLw8NgqWlxN8eyaYXANFlcekUZ9ZhqGmZHnInm?=
 =?Windows-1252?Q?xL9J2onsln8in3G1O8LcrXzsLULnreHDe13Je9xmqJYrdx8xF4CjNaf7?=
 =?Windows-1252?Q?x90Z5ukHAodOi05qGSPOa3xuaq9zCrS3hNnSOriirCfTw2ur6eiUBBGY?=
 =?Windows-1252?Q?g7WAZ5rZ6gONl7zlMcabqrG2j7izKn2lFscAC4F0eip0uUwKfB4Stja+?=
 =?Windows-1252?Q?99UskpbpMUuYMnO5kF0giveM/N0J+dj3cyHfXG/bayRSn/UGxdQLPxVP?=
 =?Windows-1252?Q?U1I7KA/Vgmm0o11RDHv2gV/vmv5CX7VS1Dao/jPr3W4lWd5edjz43Ddj?=
 =?Windows-1252?Q?LgWpKm4Mawq4Vb7DJaNc+jNNl+qm45D3eD8vhWTyELSV2d2L2DY9Ez3A?=
 =?Windows-1252?Q?ms3c9xlwYf90VcrXImBTk/wksMFTkRU5TPzF3OegX94d13qwapRgUEJ3?=
 =?Windows-1252?Q?2/fY/5zvyPI7CB4ak9K79+ZIyK6x+HK3pCwVZlQW7wjy1lUDiSC9PMsU?=
 =?Windows-1252?Q?hZoekUB2/M0ojU5HcJ4yjpFi6IEKLhOoiCPidrC2r6nQsfrXe1Yu6Gcp?=
 =?Windows-1252?Q?pw85NRCBSm38MmF653szK4PRuujASgtubMnPbswSqAp1WqjIfBMRf5zQ?=
 =?Windows-1252?Q?Njf54YtRX4YFNQXCCn2estRcJ9mcmXr6P1pg/6VvNjAznIc2eniy/qj8?=
 =?Windows-1252?Q?+5Uu4Ar7Ohfl4wU1e2viNTH5Xi2xSex4XUYTzjMDzZVAKRxPE5ZzSmmW?=
 =?Windows-1252?Q?sdu3gljDbuqTa6FuV+NUuh1z96GkbSfijZrKdvTLfeBs2weNyLJgLAM2?=
 =?Windows-1252?Q?am0rwd/M1SrJWCgkZls/s6BLBykB69gXZGoGGKIsAPY6jds6dJnbDfmc?=
 =?Windows-1252?Q?ty3sd6chmP1AE+supNEaroZSDhelm0jwK6utCT1XjMwLllf+?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB5427479922763E5FF9D1D2EB982B2CH0PR11MB5427namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KvOCip6XqkMcJMEr0u1LS+8kwrk8TKeiCMTOlPfz0IdzLg4mo2IoawErDNafsIJIp+WasQPBkUEvUdCsk4tOveFRWzoBT4voP3GAIeo3tQ4PnZz8wEC8sYYOEDTErzXtSdlPwwDDqwITnk/qZyUB4z/8bLz3h9MvbJHTnayrwOqRdEDexSFvxnloYp/1BnY2oH5zukPTsH4Ahbon36+k+G5PO+x4q12rKJwKepFizSsOs5+MmJZJUwNilMVjPk55rkciRsTsUylhk5d1z/HX4m3Jggf7DUahsfXHtKFVqwkN1IGIjcUnilxc5mgVy2CPpvB079oqa6cY02cwDAMUHA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 901c974c-b387-4275-9a9e-08dea1ad6eca
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 02:58:59.3303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bLXyrSJ8zxrmGyINkbsXJO25hmPj4thJi3IKa+FiwQ2hc92+9dCrGyUrJqblvJS5QqNCp3mliRWSs3tRBEcAUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9107
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

--_000_CH0PR11MB5427479922763E5FF9D1D2EB982B2CH0PR11MB5427namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,
Kamil


________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Thursday, April 23, 2026 7:46 PM
To: Sebinraj, S <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Santa, C=
arlos <carlos.santa@intel.com>; Brost, Matthew <matthew.brost@intel.com>; B=
adrappan, Jeevaka <jeevaka.badrappan@intel.com>; B S, Karthik <karthik.b.s@=
intel.com>; Karas, Krzysztof <krzysztof.karas@intel.com>; Konieczny, Kamil =
<kamil.konieczny@intel.com>; Kempczynski, Zbigniew <zbigniew.kempczynski@in=
tel.com>
Subject: Re: [PATCH i-g-t v2] tests/xe_exec: Add VM rebind stress test unde=
r workqueue cpumask cycling

Hi,
On 2026-04-23 at 06:21:18 +0530, S Sebinraj wrote:

>I have few nits, first about subject, it is now:

>[PATCH i-g-t v2] tests/xe_exec: Add VM rebind stress test >under workqueue=
 cpumask cycling

>imho better:

>[PATCH i-g-t v2] tests/intel/xe_exec: Add VM rebind stress >test with cpum=
ask cycling

Okay got it, ill rename accordingly.

>More nits below.

> Add a new subtest threads-wq-stress-rebind-bindexecqueue that stresses
> the VM rebind path under workqueue CPU pool migration pressure.
>
> The test spawns per-engine threads that continuously perform VM unbind/
> rebind cycles using per-slot bind exec queues, while a helper child
> process rapidly cycles the global unbound workqueue cpumask through
> progressively wider CPU sets (f -> ff -> fff -> ffff) at 100ms intervals.
>
> A new WQ_STRESS flag enables timed fence waits in test_legacy_mode at
> three syncobj_wait() checkpoints (per-exec-queue, bind-chain, and unbind/
> TLB-invalidation fences) using a 5-second deadline. If any fence misses
> the deadline, a shared atomic is set and all threads bail out immediately
> rather than running for the full 30-second window.
>
> All GPU work runs in a forked child that writes its result via a pipe,
> the parent polls with a 60-second timeout and restores the original
> cpumask regardless of outcome.
>
> When a hang is detected the child drops the kernel page cache
> and issues xe_force_gt_reset_all() to unblock any DMA fences still
> pending from the stress run, then writes the hang result and calls
> _exit() immediately without closing the DRM fd. Closing the fd while GPU
> work is stuck would block indefinitely in dma_resv_wait_timeout(intr=3Dfa=
lse,
> TASK_UNINTERRUPTIBLE). For the same reason, GPU resource teardown
> (exec queues, BOs, VMs) is skipped in test_legacy_mode when a hang
> is detected.
>
> On the failure path the test is aborted, as the process (child) gets into
> a D+ state (hung) and may affect other tests if marked as fail alone. So
> aborting would mean forcing a reboot in testing environment.
>
> A bug of same signature regressed in Xe driver, where the whole system
> hung due to a fencing signal not completing, which was finaly
> traced to an issue in the kernel workqueue scheduling.
> Hard reboot was the only way to bring the system back to work.
> https://patchwork.freedesktop.org/patch/715805/
>
> v2:
> - Abort the hung test instead of marking as fail alone
> - Code Comment corrections
> - Fix type casting
> - Write check for cpumask
>
> Cc: Santa Carlos <carlos.santa@intel.com>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tests/intel/xe_exec_threads.c | 333 +++++++++++++++++++++++++++++++++-
>  1 file changed, 326 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.=
c
> index f082a0eda..abd57e94b 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -13,6 +13,11 @@
>   */
>
>  #include <fcntl.h>
> +#include <inttypes.h>
> +#include <poll.h>
> +#include <signal.h>
> +#include <stdatomic.h>
> +#include <sys/wait.h>
>
>  #include "igt.h"
>  #include "lib/igt_syncobj.h"
> @@ -23,6 +28,7 @@
>  #include "xe/xe_query.h"
>  #include "xe/xe_gt.h"
>  #include "xe/xe_spin.h"
> +#include "lib/igt_thread.h"

>Move it above, it should be after "lib/igt_syncobj.h"

Thanks for pointing out, ill correct the same.

>  #include <string.h>
>
>  #define MAX_N_EXEC_QUEUES    16
> @@ -42,9 +48,89 @@
>  #define BIND_EXEC_QUEUE      (0x1 << 13)
>  #define MANY_QUEUES  (0x1 << 14)
>  #define MULTI_QUEUE          (0x1 << 15)
> +#define WQ_STRESS            (0x1 << 16)
> +
> +/*
> + * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
> + * fence takes longer than this to signal, the workqueue is considered s=
tuck
> + * and the test fails =97 this is the direct symptom of the
> + * Xe hang caused by the kernel workqueue pool_workqueue pending_pwqs bu=
g.
> + */
> +#define WQ_FENCE_TIMEOUT_NS  (5LL * NSEC_PER_SEC)
> +
> +/*
> + * Maximum time the parent waits for the child to write its result byte.
> + * The child's stress loop runs for up to 30s (igt_until_timeout(30)), p=
lus
> + * cleanup overhead (GT reset, drop_caches, cpumask restore, sleep(1)).
> + * 60s gives ample headroom on a healthy kernel.
> + */
> +#define WQ_CHILD_TIMEOUT_MS  (60 * 1000)

>30 seconds is a lot, so this should not be in BAT testing.

This test is not being used in BAT.

>Regards,
>Kamil

> +
> +/* sysfs node that controls the unbound workqueue CPU affinity mask */
> +#define WQ_CPUMASK_PATH              "/sys/devices/virtual/workqueue/cpu=
mask"
> +
> +/* procfs node for dropping the kernel's page, dentry, and inode caches =
*/
> +#define DROP_CACHES_PATH     "/proc/sys/vm/drop_caches"
>
>  pthread_barrier_t barrier;
>
> +/*
> + * Set to true by the first thread that detects a fence stall under WQ_S=
TRESS.
> + * All other threads and the igt_until_timeout loop check this to bail o=
ut
> + * immediately rather than hammering a hung kernel for the full timeout.
> + */
> +static _Atomic bool wq_stress_hang_detected;
> +
[cut]


With Regards,
S Sebinraj

--_000_CH0PR11MB5427479922763E5FF9D1D2EB982B2CH0PR11MB5427namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Kamil&nbsp;</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<b=
r>
<b>Sent:</b>&nbsp;Thursday, April 23, 2026 7:46 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Santa, Carlos &lt;carlos.santa@intel.com&gt;; Brost, Matthew &lt;=
matthew.brost@intel.com&gt;; Badrappan, Jeevaka &lt;jeevaka.badrappan@intel=
.com&gt;; B S, Karthik &lt;karthik.b.s@intel.com&gt;; Karas, Krzysztof
 &lt;krzysztof.karas@intel.com&gt;; Konieczny, Kamil &lt;kamil.konieczny@in=
tel.com&gt;; Kempczynski, Zbigniew &lt;zbigniew.kempczynski@intel.com&gt;<b=
r>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v2] tests/xe_exec: Add VM rebind stre=
ss test under workqueue cpumask cycling
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Hi,<br>
On 2026-04-23 at 06:21:18 +0530, S Sebinraj wrote:<br>
<br>
&gt;I have few nits, first about subject, it is now:<br>
<br>
&gt;[PATCH i-g-t v2] tests/xe_exec: Add VM rebind stress test &gt;under wor=
kqueue cpumask cycling<br>
<br>
&gt;imho better:<br>
<br>
&gt;[PATCH i-g-t v2] tests/intel/xe_exec: Add VM rebind stress &gt;test wit=
h cpumask cycling<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Okay got it, ill rename accordingly.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
&gt;More nits below.<br>
<br>
&gt; Add a new subtest threads-wq-stress-rebind-bindexecqueue that stresses=
<br>
&gt; the VM rebind path under workqueue CPU pool migration pressure.<br>
&gt;<br>
&gt; The test spawns per-engine threads that continuously perform VM unbind=
/<br>
&gt; rebind cycles using per-slot bind exec queues, while a helper child<br=
>
&gt; process rapidly cycles the global unbound workqueue cpumask through<br=
>
&gt; progressively wider CPU sets (f -&gt; ff -&gt; fff -&gt; ffff) at 100m=
s intervals.<br>
&gt;<br>
&gt; A new WQ_STRESS flag enables timed fence waits in test_legacy_mode at<=
br>
&gt; three syncobj_wait() checkpoints (per-exec-queue, bind-chain, and unbi=
nd/<br>
&gt; TLB-invalidation fences) using a 5-second deadline. If any fence misse=
s<br>
&gt; the deadline, a shared atomic is set and all threads bail out immediat=
ely<br>
&gt; rather than running for the full 30-second window.<br>
&gt;<br>
&gt; All GPU work runs in a forked child that writes its result via a pipe,=
<br>
&gt; the parent polls with a 60-second timeout and restores the original<br=
>
&gt; cpumask regardless of outcome.<br>
&gt;<br>
&gt; When a hang is detected the child drops the kernel page cache<br>
&gt; and issues xe_force_gt_reset_all() to unblock any DMA fences still<br>
&gt; pending from the stress run, then writes the hang result and calls<br>
&gt; _exit() immediately without closing the DRM fd. Closing the fd while G=
PU<br>
&gt; work is stuck would block indefinitely in dma_resv_wait_timeout(intr=
=3Dfalse,<br>
&gt; TASK_UNINTERRUPTIBLE). For the same reason, GPU resource teardown<br>
&gt; (exec queues, BOs, VMs) is skipped in test_legacy_mode when a hang<br>
&gt; is detected.<br>
&gt;<br>
&gt; On the failure path the test is aborted, as the process (child) gets i=
nto<br>
&gt; a D+ state (hung) and may affect other tests if marked as fail alone. =
So<br>
&gt; aborting would mean forcing a reboot in testing environment.<br>
&gt;<br>
&gt; A bug of same signature regressed in Xe driver, where the whole system=
<br>
&gt; hung due to a fencing signal not completing, which was finaly<br>
&gt; traced to an issue in the kernel workqueue scheduling.<br>
&gt; Hard reboot was the only way to bring the system back to work.<br>
&gt; <a href=3D"https://patchwork.freedesktop.org/patch/715805/" id=3D"OWA3=
4715878-323f-eb7d-19cc-fd9831a790cf" class=3D"OWAAutoLink" data-auth=3D"Not=
Applicable">
https://patchwork.freedesktop.org/patch/715805/</a><br>
&gt;<br>
&gt; v2:<br>
&gt; - Abort the hung test instead of marking as fail alone<br>
&gt; - Code Comment corrections<br>
&gt; - Fix type casting<br>
&gt; - Write check for cpumask<br>
&gt;<br>
&gt; Cc: Santa Carlos &lt;carlos.santa@intel.com&gt;<br>
&gt; Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/intel/xe_exec_threads.c | 333 ++++++++++++++++++++++++++++=
+++++-<br>
&gt;&nbsp; 1 file changed, 326 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threa=
ds.c<br>
&gt; index f082a0eda..abd57e94b 100644<br>
&gt; --- a/tests/intel/xe_exec_threads.c<br>
&gt; +++ b/tests/intel/xe_exec_threads.c<br>
&gt; @@ -13,6 +13,11 @@<br>
&gt;&nbsp;&nbsp; */<br>
&gt;&nbsp;<br>
&gt;&nbsp; #include &lt;fcntl.h&gt;<br>
&gt; +#include &lt;inttypes.h&gt;<br>
&gt; +#include &lt;poll.h&gt;<br>
&gt; +#include &lt;signal.h&gt;<br>
&gt; +#include &lt;stdatomic.h&gt;<br>
&gt; +#include &lt;sys/wait.h&gt;<br>
&gt;&nbsp;<br>
&gt;&nbsp; #include &quot;igt.h&quot;<br>
&gt;&nbsp; #include &quot;lib/igt_syncobj.h&quot;<br>
&gt; @@ -23,6 +28,7 @@<br>
&gt;&nbsp; #include &quot;xe/xe_query.h&quot;<br>
&gt;&nbsp; #include &quot;xe/xe_gt.h&quot;<br>
&gt;&nbsp; #include &quot;xe/xe_spin.h&quot;<br>
&gt; +#include &quot;lib/igt_thread.h&quot;<br>
<br>
&gt;Move it above, it should be after &quot;lib/igt_syncobj.h&quot;</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Thanks for pointin=
g out, ill correct the same.<br>
<br>
&gt;&nbsp; #include &lt;string.h&gt;<br>
&gt;&nbsp;<br>
&gt;&nbsp; #define MAX_N_EXEC_QUEUES&nbsp;&nbsp;&nbsp; 16<br>
&gt; @@ -42,9 +48,89 @@<br>
&gt;&nbsp; #define BIND_EXEC_QUEUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (0x1 &lt;&=
lt; 13)<br>
&gt;&nbsp; #define MANY_QUEUES&nbsp; (0x1 &lt;&lt; 14)<br>
&gt;&nbsp; #define MULTI_QUEUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; (0x1 &lt;&lt; 15)<br>
&gt; +#define WQ_STRESS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; (0x1 &lt;&lt; 16)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Maximum fence wait time when WQ_STRESS is active. If any bind/unbi=
nd<br>
&gt; + * fence takes longer than this to signal, the workqueue is considere=
d stuck<br>
&gt; + * and the test fails =97 this is the direct symptom of the<br>
&gt; + * Xe hang caused by the kernel workqueue pool_workqueue pending_pwqs=
 bug.<br>
&gt; + */<br>
&gt; +#define WQ_FENCE_TIMEOUT_NS&nbsp; (5LL * NSEC_PER_SEC)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Maximum time the parent waits for the child to write its result by=
te.<br>
&gt; + * The child's stress loop runs for up to 30s (igt_until_timeout(30))=
, plus<br>
&gt; + * cleanup overhead (GT reset, drop_caches, cpumask restore, sleep(1)=
).<br>
&gt; + * 60s gives ample headroom on a healthy kernel.<br>
&gt; + */<br>
&gt; +#define WQ_CHILD_TIMEOUT_MS&nbsp; (60 * 1000)<br>
<br>
&gt;30 seconds is a lot, so this should not be in BAT testing.<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
This test is not being used in BAT.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
&gt;Regards,<br>
&gt;Kamil<br>
<br>
&gt; +<br>
&gt; +/* sysfs node that controls the unbound workqueue CPU affinity mask *=
/<br>
&gt; +#define WQ_CPUMASK_PATH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/devices/virtual/workqueue/cpuma=
sk&quot;<br>
&gt; +<br>
&gt; +/* procfs node for dropping the kernel's page, dentry, and inode cach=
es */<br>
&gt; +#define DROP_CACHES_PATH&nbsp;&nbsp;&nbsp;&nbsp; &quot;/proc/sys/vm/d=
rop_caches&quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; pthread_barrier_t barrier;<br>
&gt;&nbsp;<br>
&gt; +/*<br>
&gt; + * Set to true by the first thread that detects a fence stall under W=
Q_STRESS.<br>
&gt; + * All other threads and the igt_until_timeout loop check this to bai=
l out<br>
&gt; + * immediately rather than hammering a hung kernel for the full timeo=
ut.<br>
&gt; + */<br>
&gt; +static _Atomic bool wq_stress_hang_detected;<br>
&gt; +<br>
[cut]</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">With Regards,</div=
>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
S Sebinraj</div>
</body>
</html>

--_000_CH0PR11MB5427479922763E5FF9D1D2EB982B2CH0PR11MB5427namp_--
