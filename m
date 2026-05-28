Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636B3CD5BD1
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 11:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DD210F052;
	Thu, 28 May 2026 11:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7uId6AQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE6E10F052
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 11:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779967955; x=1811503955;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2N63HzTD69CKBXMG2QvV+Wl5tOtdY6vgbQ1ZDQUJAdA=;
 b=l7uId6AQ+e6HxTFEmiUI9yur28NF76WsW/0S/+Y0l5t2m6HkM6zpIYZT
 t3J5aL6KT09n93y3WnD6VqoSQkderGtFnkkVMdygnHaki44xbPTHVMKZ2
 0fmToV0L1pnnszdepv9iiwzcy13fHxtohnQFEDWTPb4vtAztxlIttpS7u
 LYjxh5ns8aHszCfyvkpzFXTL3dbWeqnt6jsgIAE8FF8GYPm6ic63o1kYs
 q0mLby/CJXJe2rjD1cjvz/DUJb4hQI8R4w+DZM29PIAXd5wLwPkIaJhg6
 vGC91LJZGAjHqMkMywmQvJQwlJbFXYySYssfkNw+zoMshkbGiL+cTRMYv A==;
X-CSE-ConnectionGUID: vQ5zrA7ERBis60N6lRZEcQ==
X-CSE-MsgGUID: fsjVsICRSSyT8HFqk6NdJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84435299"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="84435299"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 04:32:34 -0700
X-CSE-ConnectionGUID: ZgYskcrfRMer19/TlVIYVQ==
X-CSE-MsgGUID: KRw9jUyRTZOonCaXsRiqyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="280636616"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 04:32:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 04:32:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 04:32:33 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 04:32:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtHSHfkZJ7QTLdUcphCP7xJyIg1zsUo9sPwrVeL5NHxKyvFjHdSUWY0eAPqfXQ85gh5wRPW3Xla08xCwqdzWiNtUlsdGFB/ondBVbQXL6SQlY7jcZX/+KyuE860KyfNMSehfj0mueeWxTZPbo4HGsPwK5M7q83yfggf64gIMd3N/VlR+C7zdN2WUEcDtxuLVz9Q3FIQmHJR5bUxCS5QWsfhEgnbZtw3pBvldvY9RLA4pr79QCG5/FWrM40I5nOJ+PZTimDHl4JP+HhMnjrSGynvSWpzjikTW0iAAHMRKf7eDSkIyPrg8bvWpTfgId4Bc7vQTpkSG2Iu0vYcImufqow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2N63HzTD69CKBXMG2QvV+Wl5tOtdY6vgbQ1ZDQUJAdA=;
 b=Y3U+1+SgV6PR4e9zMGg/pZiywDOLiFQuj822BHQ9YB2lQdH8WyAk/YbqwiKKur8gf9FgjhB2SHMGe/NjEsObSBqZg4Rj+PW7rQXi9Jb3Ku9Pxx1i0nbp3Sy4Iqzb8DL5UQO75qBXWov9hp9KjVv2xxuu6nZpxz5cbahhlfy1BSHK7iDerlaNEVvDVHT0Z3wL3YhaivsoE0hoq+C42Dwe35hGVhGXaXs0NXOfZFiUVGcYGy5F3hE+ec9XDmLY6j+iN6bpYCKNT7T+m+fn6X0xvZ1qov0QEFbApJW+QIAKHt9Y34mqZfZXigvzxsORuCGWFqN0Fl5XemH0IZZLElV6IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by MN0PR11MB6206.namprd11.prod.outlook.com
 (2603:10b6:208:3c6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 11:32:30 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::88d6:ba41:128b:4081]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::88d6:ba41:128b:4081%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 11:32:30 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 5/9] lib/intel_batchbuffer: move engine class
 selection to helper
Thread-Topic: [PATCH i-g-t 5/9] lib/intel_batchbuffer: move engine class
 selection to helper
Thread-Index: AQHc7SEJLIGB6C246k6qMP1IgJ8yvLYjUPiQ
Date: Thu, 28 May 2026 11:32:30 +0000
Message-ID: <DS4PPF69154114F3B63E67EB684EDCC5509EF092@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
 <20260526144343.2531299-6-juhapekka.heikkila@gmail.com>
In-Reply-To: <20260526144343.2531299-6-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|MN0PR11MB6206:EE_
x-ms-office365-filtering-correlation-id: 3d70d66e-8143-4a49-7f31-08debcaccd8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: JcP7e/qsNO0spW8QEbFE0950011+hwtFNK8qv7bfp8QYrGyACj4QQqUHirwvd29I5u53hQ78BHNH1TsO+JN6KSsKkeIpU639hpys8crQ2Z7DUkiPJMAxz/JDDsGdOlWMA08MOCdtc1nazSg4egItYVzOIWSWRyzTvxkcPzlJt9MWK5xcxdx5rlmQcJ8xwMeNEpExSv57TAMc7DkZbjNgx0Acwrlplray9nDpnu1iKJnr75372yRuKFcVR5NFm5O8GXhZ5uAgTjJQtkkRU2l+YE67+PUTrMelTrk9+JV7dcEfbrXjJNND1XsUurD7ZXS7WXpaP4/XOH6WAugeEHhH5lkBHFI2XKNv9z2xF86NwxxvDjdCn5zmdp0bu2d9MuDGWPTfrZlicWSG0IFSUQHoJEe3YtTV9Ve/LCVd6/Je6NPuQstqwsUBMaz5i+OucFfVjIT+v7haqMQoACk19Phh4j4LlyHlgjpcvjB6W1BsP9ixC8VHK2l+xIrsh+uIGJXRc8dUN3Dh0O++XhPGx1WX9Z+1lDxF8+J4Sb0r8lUGsT3HI1b3pLBNIpfYpVAEgmL7E/ruSWVlVzUKDmRoRcvtxKu1OviBeyclyB5c0KVRhWZ+MDposfr7bB47DAfmXvJgevWPoNk4xv3J6PCGsd8+SPO1c1Hgo5Fff55r9JLOdcO1AV3PZOz0HevKo5DFyAbQHJN+kqyAE624+91a1ToBKPqAr3gtnp67u0wi03iQeSbHLOymyjeQqeT3p5cvFLFx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WW1xdGpIdTZQNFNkOFJ3bCs1ZHg0cXlJSXFHdjdNb0wrK1pTNlJ4ZUt1dnlJ?=
 =?utf-8?B?UWRLbmxlN1dHb2dvdTBzUGpSenhpSEU3TEVPVWpFcHY1dHp4YWlJUFE3WCta?=
 =?utf-8?B?Sjk1TG1mTW84Rk04eUNoaWlWS3BsZnhpZklTRmtabVpMUXg2ZEtSZXpjRXVx?=
 =?utf-8?B?TEhpZGNBTGtqTjVHK24xVEJmaEFZZVFHUnZXMk95QjNuelJQUEVJRlJqSHlV?=
 =?utf-8?B?bWdDMVpRQVNFMVZxd0QvMTR4TWVYUm90a0R5WDh5SVZ5QkVZZFFqOFRqNXcz?=
 =?utf-8?B?NWxwNHhidmx1NjBvTDI1eFVOTHBNLytjUHFVdFpTazFRYklBSjNwb1RDTzBX?=
 =?utf-8?B?d3J4a0xDSUlZT1pJRGJsZWoySWhMR3N2UGRWMUNOQlVReW9saUIzS3h5VTFp?=
 =?utf-8?B?NnNJbUZJbEswemJBRTBzVGNFVW5STklhL0dUcFNjbmJTTFM5SXZKUmI4Y3Fw?=
 =?utf-8?B?N014TWE0RVpRVVhsaVdKaktnVHIyeStXbElhVlM0bUNjbTVIUFEyTWNrQzd6?=
 =?utf-8?B?d3BTU3NnQ3Fjc1ZSaUZoUWxoMXBBeElJVWd2YVZqem56bUw0NHJNN3ZMbXJZ?=
 =?utf-8?B?S0dTL3lncHJCQUFOTXd1MDZTdGVPaHdXWGF5NFM1ZlZ0d1lIQmhuMVdwdjZp?=
 =?utf-8?B?MDFRc2JKcmYyaGxDNy8xNzhmbCtTSDhCT2xmY1N5RmdVWldaVTl4cUJBT0k3?=
 =?utf-8?B?OHd6L3krU2RKZld6WFU2MDhCWEoyWjUxVFBYSG1xRUxpeks1MkVBbkpUUXZW?=
 =?utf-8?B?SFhNaklkdCtnMHNLZ1YwSTM2MnZpbzhYQWluem9kbi9veS9SUFNhMGtYWVJK?=
 =?utf-8?B?eWEyQkI1RWdnb2RUUUZTMkJLUXUwaHpsTTdsMDAwTDVEOU0zTUdnNlZOK1p0?=
 =?utf-8?B?emN3bkdyVG00TTVRRUhISTRZaXNHcE1FRVVyMlpnelNqNldkd1FMSjJEeitu?=
 =?utf-8?B?T28zU1dtbW1oeHdlZThFSXFFYXVpaGowVEhCVjRia0ZxRytkRUtPSWRTdXJ3?=
 =?utf-8?B?Nk43eUVMSThHSW56NGdXZFNTT3AxbFBBYUNySG1Sb3o0SzU1RWdrQ2tiWFll?=
 =?utf-8?B?N1gwb0RPOWJJNEtwNXB6STZ0alJaTTNIVlhLQ05wejM4eTZtZk1TajBIZmx3?=
 =?utf-8?B?TTBYc2JHMUJvbVNGRVpqWDNJRU5zY2R3cVZGek1EMklpMU9EQkczZEw4LzdN?=
 =?utf-8?B?NnRhMzJJb1REOVVXcXh0MVk2N1p5VEN6amZDeS91cUdpTmJhN202bDU2Kzls?=
 =?utf-8?B?SGR1S1JHaGlIRmxiWTB3NTNhbjRVd0hFZkFNWC9OQk9wdFVSdnFnTkVBZDIz?=
 =?utf-8?B?WmcvK2VlcXJEWmlDYjd1bVZJUHpEWkhGNnlmNVliaDJObnRCaW9DQ3djZm1M?=
 =?utf-8?B?bmZSeWdFcDdNdXJJSmN3Z3FVZDNFS0JabGNNNG12alpUNjdjMkw5R1BqRGxM?=
 =?utf-8?B?Q2o5NU80WXBsY2s3cEZLY0ZXUzhtTmpUZHdIYlM5SVhwbVZqeGU4MnBaRjVR?=
 =?utf-8?B?UW1mYkJEeEkrTTJSUDhDbksxRjcwUHZXSllrZkpTaHQ1bmNWWW1MaG1vbWNK?=
 =?utf-8?B?ak5XSlVRYkJXbkYvREhZU09aZjBVd05ubUljd0FHa1FkZ005c1VOTXVoOTNF?=
 =?utf-8?B?akRXQVJYQkpLVzI0UUQrUFV1MTJIOXpXdnd0MkJWUXZQdzViQjFPQ1IzVXFa?=
 =?utf-8?B?emxJL2grSTJYUUdPc1NtL1k4MzJwTGMwWmhzdWk3WVBkQ2lNQmdXeThMazFP?=
 =?utf-8?B?V2hqUUhEa0I3WDl0bkQ1RlJzVUk0RVFVQ1RSM09WcjVETm9XcWhRcnpVY0ho?=
 =?utf-8?B?SmFtRlJndTdKbDFJOSt2L2hQR0lqTnpCUWZiOXB5WVlWb2lzZGxPc3JSV2ZK?=
 =?utf-8?B?UFBBWWczMkpodDh0eTZGTHNsTlVkMG9yN21zeTMwdnE2UkFuWVZvUm5BWFY4?=
 =?utf-8?B?UERWZXFzN2RvSzQ5VEZtcWNVd1VTM093L3BkUURKaENIM1pzYjR0SFpVVUtI?=
 =?utf-8?B?L3BKQ09oSnZGb0RDVjZCODVRbG9UMjhXRDV0UWJaNE0zVksvVFM5SGIvOU9m?=
 =?utf-8?B?MUp3a29jRWsrUzEyeVI4aHc0NmZRZUR4N2p1OENLVnRaNVYvN0Q1aDhLRmtn?=
 =?utf-8?B?WWpLcytWaGVoWFFtODJDa0YyUlFGNjV5amV3ems0RGdUeHloaTU0K2t6aDRW?=
 =?utf-8?B?cmE5Q2lzbHd6QjR1NTYrekNDTVRYaFZzS081dmNGV2p4ZkRTL2s3RmRYUVNE?=
 =?utf-8?B?bTZFNjZlN09lK3gybWtSNVVRcEY4VkVRNDFJYlNkYWRBRmVuUStXTitZOHFa?=
 =?utf-8?B?YWFZWEV3M1NzMlUwc1BrK0htazhFUERGS3VkQlJ3bWc0b1JKZUFSUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HVGskei5ncrdeC41tRItb7hOG8jZ5oFkjwG8uB0rvo/Qh/QOLZ/I0AcSTvQn+HGIgKtecm2QkqpR2meCxMMGgmhHS+yREDOR2A+/TwmVO0fSXrnPZy0JbkwypqCu8KlW3s/hAgOYum2ZRs8N+ksxcOcflsplrn332SAUm4Nq6eTV2aCAigTJD17YU6nFqnoVM9D8mw8btFkqHFeKltOu8+w4WxoBO/qMzMle060VZ7ONBKow1pftn7gQLcqlMcKHjYK3nJPztEkXT4Uvku4Y+lGFUQu9lfhzLmvLzNbJWtJOn0+Hd941+RAJPdJwAMDmYPccqRd2ALSlxrZWb4EFiw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d70d66e-8143-4a49-7f31-08debcaccd8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 11:32:30.2124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WkW25k0G4oSMdwnwuf0lqcTECxCUOQGrBDryi58socNilKVixRMVr57PRa3wcCFUFsb7e2Byj5V4QcX5Igu2LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6206
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSnVoYS1QZWtrYSBIZWlr
a2lsYQ0KPiBTZW50OiBUdWVzZGF5LCAyNiBNYXkgMjAyNiAxNy40NA0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtr
YS5oZWlra2lsYUBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCA1LzldIGxpYi9p
bnRlbF9iYXRjaGJ1ZmZlcjogbW92ZSBlbmdpbmUgY2xhc3Mgc2VsZWN0aW9uIHRvIGhlbHBlcg0K
PiANCj4gTW92ZSBlbmdpbmUgY2xhc3Mgc2VsZWN0aW9uIHRvIGhlbHBlciB0byBhdm9pZCBkdXBs
aWNhdGUgY29kZQ0KPiANCg0KUmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBp
bnRlbC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBl
a2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBsaWIvaW50ZWxfYmF0Y2hidWZmZXIu
YyB8IDQyICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvbGliL2ludGVsX2JhdGNoYnVmZmVyLmMgYi9saWIvaW50ZWxfYmF0Y2hidWZmZXIu
YyBpbmRleCA5NGIwYTk5ZDcuLjc5YTRlMzU3YiAxMDA2NDQNCj4gLS0tIGEvbGliL2ludGVsX2Jh
dGNoYnVmZmVyLmMNCj4gKysrIGIvbGliL2ludGVsX2JhdGNoYnVmZmVyLmMNCj4gQEAgLTI0NzIs
NiArMjQ3MiwyNiBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfb2Zmc2V0cyhzdHJ1Y3QgaW50ZWxfYmIg
KmliYiwNCj4gIAl9DQo+ICB9DQo+IA0KPiArc3RhdGljIHVuc2lnbmVkIHNob3J0IGdldF9lbmdp
bmVfY2xhc3MoaW50IGZkLCB1aW50NjRfdCBmbGFncykgew0KPiArCXN3aXRjaCAoZmxhZ3MgJiBJ
OTE1X0VYRUNfUklOR19NQVNLKSB7DQo+ICsJY2FzZSBJOTE1X0VYRUNfREVGQVVMVDoNCj4gKwlj
YXNlIEk5MTVfRVhFQ19CTFQ6DQo+ICsJCXJldHVybiBEUk1fWEVfRU5HSU5FX0NMQVNTX0NPUFk7
DQo+ICsJY2FzZSBJOTE1X0VYRUNfQlNEOg0KPiArCQlyZXR1cm4gRFJNX1hFX0VOR0lORV9DTEFT
U19WSURFT19ERUNPREU7DQo+ICsJY2FzZSBJOTE1X0VYRUNfUkVOREVSOg0KPiArCQlpZiAoeGVf
aGFzX2VuZ2luZV9jbGFzcyhmZCwgRFJNX1hFX0VOR0lORV9DTEFTU19SRU5ERVIpKQ0KPiArCQkJ
cmV0dXJuIERSTV9YRV9FTkdJTkVfQ0xBU1NfUkVOREVSOw0KPiArCQllbHNlDQo+ICsJCQlyZXR1
cm4gRFJNX1hFX0VOR0lORV9DTEFTU19DT01QVVRFOw0KPiArCWNhc2UgSTkxNV9FWEVDX1ZFQk9Y
Og0KPiArCQlyZXR1cm4gRFJNX1hFX0VOR0lORV9DTEFTU19WSURFT19FTkhBTkNFOw0KPiArCWRl
ZmF1bHQ6DQo+ICsJCWlndF9hc3NlcnRfZihmYWxzZSwgIlVua25vd24gZW5naW5lOiAleCIsICh1
aW50MzJfdClmbGFncyk7DQo+ICsJfQ0KPiArfQ0KPiArDQo+ICAjZGVmaW5lIExJTkVMRU4gNzYN
Cj4gDQo+ICAvKg0KPiBAQCAtMjUxNCwyNiArMjUzNCw4IEBAIGludCBfX3hlX2JiX2V4ZWMoc3Ry
dWN0IGludGVsX2JiICppYmIsIHVpbnQ2NF90IGZsYWdzLCBib29sIHN5bmMpDQo+ICAJCWluc3Qu
ZW5naW5lX2luc3RhbmNlID0NCj4gIAkJCShmbGFncyAmIEk5MTVfRVhFQ19CU0RfTUFTSykgPj4g
STkxNV9FWEVDX0JTRF9TSElGVDsNCj4gDQo+IC0JCXN3aXRjaCAoZmxhZ3MgJiBJOTE1X0VYRUNf
UklOR19NQVNLKSB7DQo+IC0JCWNhc2UgSTkxNV9FWEVDX0RFRkFVTFQ6DQo+IC0JCWNhc2UgSTkx
NV9FWEVDX0JMVDoNCj4gLQkJCWluc3QuZW5naW5lX2NsYXNzID0gRFJNX1hFX0VOR0lORV9DTEFT
U19DT1BZOw0KPiAtCQkJYnJlYWs7DQo+IC0JCWNhc2UgSTkxNV9FWEVDX0JTRDoNCj4gLQkJCWlu
c3QuZW5naW5lX2NsYXNzID0gRFJNX1hFX0VOR0lORV9DTEFTU19WSURFT19ERUNPREU7DQo+IC0J
CQlicmVhazsNCj4gLQkJY2FzZSBJOTE1X0VYRUNfUkVOREVSOg0KPiAtCQkJaWYgKHhlX2hhc19l
bmdpbmVfY2xhc3MoaWJiLT5mZCwgRFJNX1hFX0VOR0lORV9DTEFTU19SRU5ERVIpKQ0KPiAtCQkJ
CWluc3QuZW5naW5lX2NsYXNzID0gRFJNX1hFX0VOR0lORV9DTEFTU19SRU5ERVI7DQo+IC0JCQll
bHNlDQo+IC0JCQkJaW5zdC5lbmdpbmVfY2xhc3MgPSBEUk1fWEVfRU5HSU5FX0NMQVNTX0NPTVBV
VEU7DQo+IC0JCQlicmVhazsNCj4gLQkJY2FzZSBJOTE1X0VYRUNfVkVCT1g6DQo+IC0JCQlpbnN0
LmVuZ2luZV9jbGFzcyA9IERSTV9YRV9FTkdJTkVfQ0xBU1NfVklERU9fRU5IQU5DRTsNCj4gLQkJ
CWJyZWFrOw0KPiAtCQlkZWZhdWx0Og0KPiAtCQkJaWd0X2Fzc2VydF9mKGZhbHNlLCAiVW5rbm93
biBlbmdpbmU6ICV4IiwgKHVpbnQzMl90KSBmbGFncyk7DQo+IC0JCX0NCj4gKwkJaW5zdC5lbmdp
bmVfY2xhc3MgPSBnZXRfZW5naW5lX2NsYXNzKGliYi0+ZmQsIGZsYWdzKTsNCj4gKw0KPiAgCQlp
Z3RfZGVidWcoIlJ1biBvbiAlc1xuIiwgeGVfZW5naW5lX2NsYXNzX3N0cmluZyhpbnN0LmVuZ2lu
ZV9jbGFzcykpOw0KPiANCj4gIAkJaWYgKGliYi0+ZW5naW5lX2lkKQ0KPiAtLQ0KPiAyLjQzLjAN
Cg0K
