Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE746606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 04:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NwfI/KtU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D5A10E196;
	Tue,  3 Nov 2026 04:17:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536E910E1A1
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 04:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793679361; x=1825215361;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gQ/XVBeZ8nT4Ba8oo2EZGXDScU+4ikyIR/1bn/3yuKY=;
 b=NwfI/KtUhs7PEUST+1E7iaCCDhXC4FjFAJIJh+X1hh58vTx+DpnjojC/
 1DsheVL2wpK3bty6Kbj7yzOsRvdeh+H3QoJc8Y/+HyO4V9tFCkDsGF3gL
 ha70Qwm/O3p1jsitS68M6QY98acyeDkCoQkwdbK4AYXDYvJ54yGfT3SYh
 Dnj+0vljWbLXBw+0z0oUPiv3oaBGY2hMmYtFWgOZm9xe0eosEkG5pC2bB
 lVAnuR63PhgEBCjCezPwLo1Z7jiLjy3bzGEz3QIsFSDdhJu9Peg3l+qGY
 A9cnnTKjsvkTA8aPX+oAc2lOKPp03UKaLPxgQ85WEIe2XVr2Tg7eNyJRu A==;
X-CSE-ConnectionGUID: TjXiiBltT3eGr5eXETPD2Q==
X-CSE-MsgGUID: 3ny7Q4RfR6uHHdZHgGEsMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2294741"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2294741"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 20:16:01 -0800
X-CSE-ConnectionGUID: fyU8ff3bTnOUi7YJSq/YtA==
X-CSE-MsgGUID: 7DVxEO5OQ1exI/oUUfveQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6641967"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 20:16:00 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 20:15:59 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 20:15:59 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 20:15:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTGFGvFGGh1njfh0kfoMwB/4OU06tXdCgpqBTNQh1nZSRk6QncWn0X5sK6t0Pd05LXyAApfQvAm9uZHE4ZQvJw1iv5wo7frY3lRlPxTKCxs7lAZbqD9D3mq1UsFZzQla05JcCKLJw/fi+AdB3sJgWO158Gp6DIxW3jxw9QfmQuBlDNm3Fr2SKnS4gXUv34TH/Z/ucev8C5dPJsYuzlJy99q9W0Ryb94AcHOs37kBoYUwDywQ9Oa4JSlK+jHd1okMN+DRLfe6FQvtqPkV+RrgWWUMo8/mdbIZCmxV/DPK5E6k+C9NHjtsg0w297qCnybBSbdFRm+ZV/4fOulG6HL0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQ/XVBeZ8nT4Ba8oo2EZGXDScU+4ikyIR/1bn/3yuKY=;
 b=hHHlSfNKC63VpiT+EuQjMe/kn/KMa66NbvBR8JVfHbleJgpzYYMhE8UoCSg0Vz2eaNQB/AE/EieCyAHwv86aCxtEYzDcVAFVybFHRRYMxlorUNEqSJh54T1u8XykDXuY4rm/FqkHPKeLP2eMmBKy/P15aAdC8l8pfFVYnr+0nXoRDmACIyNuCCSOYmW2GEIIiWSoNbW6nJCcE4+MYt8a9hqm+gt6o2GpC6U6k3T7ucQJ+tXAOD0xo7wywxTAO4dR2W+MN1SQyoIyMfZC0HZ2bFiJQrIqvi4FJ8KNL5874NwcGNZjp72IYXgE3aZpdsVV1qfxjpph1H3TEXcc1YYGkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CH3PR11MB8211.namprd11.prod.outlook.com (2603:10b6:610:15f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 04:15:57 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 04:15:57 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/3] tests/intel/xe: fix missing thread cleanups in
 several tests
Thread-Topic: [PATCH i-g-t 1/3] tests/intel/xe: fix missing thread cleanups in
 several tests
Thread-Index: AQHdaoqeCBfhaXLbukCpuR1Hxoo3+7cang+AgAEg1QA=
Date: Tue, 3 Nov 2026 04:15:57 +0000
Message-ID: <CH3PR11MB8434438AC328761785B24E588D692@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20261102052534.3358553-5-priyanka.dandamudi@intel.com>
 <20261102052534.3358553-6-priyanka.dandamudi@intel.com>
 <20261102110155.iesv4svzfn37ogrp@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20261102110155.iesv4svzfn37ogrp@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CH3PR11MB8211:EE_
x-ms-office365-filtering-correlation-id: 8ac2c192-1b62-454f-cf6d-08df396128f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|10070799003|366016|1800799024|6133799003|10067099003|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003|261022105027099003|261022075727099003|261028144727099003|261102123227099003|261021121427099003|261026140227099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003;
x-microsoft-antispam-message-info: +Sj27ayQHKLfGWTG9zwK6gFmK59kto/Zf0hyplyzmysAEjAGPgW+QTnuzStcQ0Dw232cbLmnUjLXR4B2eAcx21MZ1OG8qsewLt4rFbQvLsBQ3STQnpHxmkO3IBRpCCE9JnHmiDvxE/b13/ydH7ON6+VdgTk7rg8fGCvzkOZesd3w6faFyGQd9+F8APz4F8eJn9HDytEZwMP+QGfUc56bx3TMBYtAM1EvvWme1zFO08icAk4U+TNHGcLGJB9A/JX9qmeqjWvqCK5Dvy2wQo2BpD0ZeBFw13KIUV0ywChJeVIIYDFFLH8Xmdkan5u9it2ltUuynE8kC87mVGa+X1yUskLYNMrZyRi8QFBFvjWglF7Dk+uPpOUuvrABGzHZmhOZoC5fQ4sdqT5k3ACA7RUfaK6G7DqAbv99Vh5XGqdxaqrSmz2/PvAvNBLt6To7dgQvZFolKc9Q//hyvvJK1E1LhxM0KUScmrPgN3OeEkJjuKOvoKVDhxIkSPTkyeeyMCDAFKhaitjH91jCSqfV4a4Xt6ZGQjM5eUR+zzBTaIUukeTjfhKCY3g327mLZGZez+0XiDQL+2RU06CaWCu/puPlK3osFbHOULMGu1SxN+3BnxI+iTD6KYrX3+9qcH/XvBxHrQIb7wGH+oyPA+LUfCBO4kAz/wj4PTgk4f0vAs2rYLvjyt4ZGQXyWPPnA2h+GYFfMrvRq+qjNAnIXIM8UM1VnlqAJGmk8VXuHJ8XFFn13p4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(10070799003)(366016)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003)(261022105027099003)(261022075727099003)(261028144727099003)(261102123227099003)(261021121427099003)(261026140227099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVFiTk5rMDBUWkRTZWc3QXdWSWpMUnAwZHlwQ0NoeHlURm5mbEU0eDVGdXZE?=
 =?utf-8?B?ajJBakliYzZ5aGRTZGo2S0FWQlNmcGdUSk02KzRHK1RDQk1Ud2g3MjIvK3BE?=
 =?utf-8?B?QmlwTExrTk5iMEE4QkFUdzdGK2VXWXhTR1N3dXpTM003R1owbHhwUStDQ0gy?=
 =?utf-8?B?VnZKT21KRmdkb0J1Q09OaU1XaWlWSHFYanBjUloxWUJjaUgrVUg5cDcxNCtH?=
 =?utf-8?B?WlJpNmpzTkxzU2h1cWN5T3FKNGM1eURMMHFzQUQ4bnVMeERqa2lENXZBR0dZ?=
 =?utf-8?B?UENlVGpYMXZSZHdVa1dlZzc1T0dCVVNmaHBZbWhXODdCbDA1aEtwVTNtMU1J?=
 =?utf-8?B?cVY1a1FzS1djT09XYkU0eUVKSkliZWV1YW5Pc3dKZEpzVXR3M2YrZFhTRExx?=
 =?utf-8?B?VXVrWW9DK01wUmZxRlhaaFhuWm1UUmFlUUZLWGJTS3FPNWl2cFRmaHBYVjBX?=
 =?utf-8?B?TGZhMnZLcnlnYzNIVTNPYlFjNlZEdEJlVVY4MjJBNHJBcjZ1eGhjaE9obEp2?=
 =?utf-8?B?eGVocnNCYkhpL1Y0RGEwa1JmQm9KVFFwemVaV3RBcitmcytyVnEwT3VqL084?=
 =?utf-8?B?Z2pmS1EzMlZSZ205MDBVbTBIWS9HK2VLTURUTEwybjBab3hId1hJMHoxdXhH?=
 =?utf-8?B?RzRzU0ZYSjVGdXlHMzZtOU9CRGJiSlk0TVloQVhJcXBiK2dlVFpvdjBpdGps?=
 =?utf-8?B?ZFZIVVhlbURDTTV0cy9PeG5lczRVV2JDYzJaUklqSlpwTnBERlJQVCtCSTVC?=
 =?utf-8?B?TTBDTTFpTEFTU3FXWkFlb0FKS3pBeE41TmlwaU13MU9OYjNwcEQ1SnNrTEsz?=
 =?utf-8?B?amZReHNXbkw3S2MxUUFvMHJ5VW1pQzlURndGcU5lZ0FVam1xUk54Y3c2TE8z?=
 =?utf-8?B?M3FITW9WOWk3OUNoRXRKUXR5THdzbS9FT1JoTUUyN1UvR2luOGtaSWdBT3hU?=
 =?utf-8?B?RlozenVncTFlOWthMnZDOTQrNVUvSTdQWlRxSWcxeTdWN05CK1VYNUw5aGth?=
 =?utf-8?B?VHFOdzJnRTFnRi9xSVFzSmFabEZHRWpJOUpXaVRGbnZRNEprTEoxSDJ6RWN3?=
 =?utf-8?B?TEJrNEJ3ZCt6U1B6YUZINzQvcDNneXlpUWJjY0pCSVViaSs4R3lxMU9TWU5T?=
 =?utf-8?B?SnJnSXpxOUFhcEF2a2ZmRUFRWDdqSjdudjFaYmh3RXhqUHVpRlZ3bEI0RmZs?=
 =?utf-8?B?ekQ5SHVidmtEUmFnanRDb1ZMYlh4RnhXQkRxbkUvYXVSVXNNbFg0OENuNnd0?=
 =?utf-8?B?ejJoc2NvekgwYk1zdS9ESHFxcnFLVnJUY0pRYUZpanlzWW03YVEwcGgxbjVZ?=
 =?utf-8?B?WS9BRkJjVFFuZ2pzQ1huTngyTHc1emdrV0JJTHZoL2JEZjBsMzc2RGZ6RHRH?=
 =?utf-8?B?bXkvTmdBY3AzVkRkNkFFeGFURTZHM2YvY1JIZkVDV3FLcnRjYWIwNlZTc1dG?=
 =?utf-8?B?OUZZYThTbkR3SnZvcjh6YktLM3Iwc3Q0cVNxTHNPWkkvWkUzazJ4R1JDbGFl?=
 =?utf-8?B?aTJiWEdOL2ZOcWJQZ1pRTG02OWQ5cTdtemFUTnl5TWppVzI4bEFOYVpsZFl2?=
 =?utf-8?B?aXBNajI1WW1Wam5EWjY3eStaVEpHYy8vTkdWUVpZZjlxVlJEbngvZjhnZkVY?=
 =?utf-8?B?UVB5TCtPZEhRZjNTRkEzQUhMbkw4NXgyNXJPNnhFekFmaDVnQUpodWdLVnZ6?=
 =?utf-8?B?d1k4ckQ3Y3BaeDlxMlVtemFIdXczbXJKU3JrYVNsRnR2cElVbEdoQm45U0h5?=
 =?utf-8?B?UCttcXZBcElPYk5KdlpHY3hWQk5sdUhid2ZjOENXdGo0MkpHUjZFNk5IeE1u?=
 =?utf-8?B?Skk4Uk8vdGZKamgvNUNMaXBlUTA5eVZ1L1lXR1RhVVBHb01XQytIVXFVZWlB?=
 =?utf-8?B?aU0xUnZYOVkwcGxFTllhRUF4WXpGSUxraFMrVW51TXRTVTBEdDdNekxsVjIy?=
 =?utf-8?B?ZlV6eVBmZkVCNVhsNlg1RFJ3SjFvcHMxVlptdVpieVR3M1F2RkR0c3c4aUVF?=
 =?utf-8?B?V2haQnNUazkrSlU0bGFHRUV2ODRmdUdTWjNRcytMRUsvRmRLOUVVNXF4VzRr?=
 =?utf-8?B?N0J6RmtoNm9DeHZLZFRycHlsa1ZSQ3JaT25aaDlIZitQY2Y5dHBIZXVXYTg1?=
 =?utf-8?B?MXdPemw5alpveVFHeTQ0cjlWcEZZTllNZWFzazMxdHVlVWRMVWczTlprVDQr?=
 =?utf-8?B?S3hYMGVGcnJMWktUSVJpaWxiazhtZWV4ZzdUdWdnUTkyR1E4WUZHMWNmbWxQ?=
 =?utf-8?B?YWhmNC9CRDNuSFhLQVppUHlNbVRPdTlVNkJQZm55K3RCdXJqVXVoS1IrSkxj?=
 =?utf-8?B?aUwxaDVUTFlLL2lGY24ra0xvdVA5RGw0MHNMVDROaGxSTFowVjdXL2lvVUVZ?=
 =?utf-8?Q?Dv39UEBFSPGVPvT26Y7ThDSRcqv+XOIJVboNVLdM3JON/?=
x-ms-exchange-antispam-messagedata-1: U0/UePcXrvx+3rS6VckWyHUafGjLQn9Vwhg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: u2hN5fPU+CijS9patHPA6Ne+5N78Rs/twK4yMy9JCPPpECSrtFFrkv9jxxm1IiH3IEHvF8UfQW4Y7J5S6zJxiDAdlXoaPHOTkToNNqU1xcIlXQcL8ycMBdnYwqMGRIItKlPQHzE+doFfGrOvM/YX0oDrzUynHtCqOZILoCdO3vBVV6RKA7HJLlNtQu7nn1MHjjdBPT9+ma4PgyrJbhbD7tWr+i+x4PlxGBKCqHSrICVj9nMBziyctTJvepvMxmzDnqAJ5cTO6qyv6QprovTiNNvPjpdwvEzOm7bH2fMruiRQIv30/XG1wVsYq1vrd3JT4LJrJXFfuZH0qOI0UFc3yw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac2c192-1b62-454f-cf6d-08df396128f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 04:15:57.1590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zLpKI1xs5Kgdyi4aOsvsifBR5H4ay21MXd2TSggeYxTkRiyXUbsXBj5SQbg/M3gCo/996/Oii+/hC9J8uhGlK53hzlmshuKpnczfzlpbW7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8211
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAwMiBOb3ZlbWJlciAy
MDI2IDE2OjMyDQo+IFRvOiBEYW5kYW11ZGksIFByaXlhbmthIDxwcml5YW5rYS5kYW5kYW11ZGlA
aW50ZWwuY29tPg0KPiBDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCBpLWctdCAxLzNdIHRlc3RzL2ludGVsL3hlOiBmaXggbWlzc2luZyB0aHJl
YWQgY2xlYW51cHMgaW4gc2V2ZXJhbA0KPiB0ZXN0cw0KPiANCj4gSGkgcHJpeWFua2EuZGFuZGFt
dWRpLA0KPiBPbiAyMDI2LTExLTAyIGF0IDEwOjU1OjM2ICswNTMwLCBwcml5YW5rYS5kYW5kYW11
ZGlAaW50ZWwuY29tIHdyb3RlOg0KPiA+IEZyb206IFByaXlhbmthIERhbmRhbXVkaSA8cHJpeWFu
a2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCj4gPg0KPiA+IFNldmVyYWwgWGUgdGVzdCBmdW5jdGlv
bnMgY3JlYXRlZCBwdGhyZWFkIG11dGV4ZXMvY29uZHMvYmFycmllcnMsIGENCj4gPiB0aHJlYWQg
YXJyYXksIHdpdGhvdXQgcmVsZWFzaW5nIHRoZW0uDQo+ID4gQWRkIHRoZSBtaXNzaW5nIHB0aHJl
YWRfbXV0ZXhfZGVzdHJveSgpL3B0aHJlYWRfY29uZF9kZXN0cm95KCksIGZyZWUoKQ0KPiA+IGNh
bGxzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUHJpeWFua2EgRGFuZGFtdWRpIDxwcml5YW5r
YS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICB0ZXN0cy9pbnRlbC94ZV9jb21w
dXRlLmMgICAgICAgICAgICAgICB8IDIgKysNCj4gPiAgdGVzdHMvaW50ZWwveGVfZXZpY3QuYyAg
ICAgICAgICAgICAgICAgfCA1ICsrKysrDQo+ID4gIHRlc3RzL2ludGVsL3hlX2V4ZWNfcmVzZXQu
YyAgICAgICAgICAgIHwgNCArKysrDQo+ID4gIHRlc3RzL2ludGVsL3hlX2V4ZWNfc3lzdGVtX2Fs
bG9jYXRvci5jIHwgNiArKysrKysNCj4gPiAgdGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRzLmMg
ICAgICAgICAgfCAyICsrDQo+ID4gIHRlc3RzL2ludGVsL3hlX3ByaW1lX3NlbGZfaW1wb3J0LmMg
ICAgIHwgMSArDQo+ID4gIHRlc3RzL2ludGVsL3hlX3JlbmRlcl9jb3B5LmMgICAgICAgICAgIHwg
MiArKw0KPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9jb21wdXRlLmMgYi90ZXN0cy9pbnRlbC94ZV9jb21w
dXRlLmMgaW5kZXgNCj4gPiAyZjcwZjIyOTEwLi5lNzM4YzlkYWJkIDEwMDY0NA0KPiA+IC0tLSBh
L3Rlc3RzL2ludGVsL3hlX2NvbXB1dGUuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2NvbXB1
dGUuYw0KPiA+IEBAIC00ODksNiArNDg5LDggQEAgdGVzdF9ldV9idXN5KHVpbnQ2NF90IGR1cmF0
aW9uX3NlYykNCj4gPiAgCQlwdGhyZWFkX2pvaW4odGhyZWFkc19kYXRhW25dLnRocmVhZCwgTlVM
TCk7DQo+ID4NCj4gPiAgCWZyZWUodGhyZWFkc19kYXRhKTsNCj4gPiArCXB0aHJlYWRfbXV0ZXhf
ZGVzdHJveSgmbXV0ZXgpOw0KPiA+ICsJcHRocmVhZF9jb25kX2Rlc3Ryb3koJmNvbmQpOw0KPiA+
DQo+ID4gIAlkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4gPiAgfQ0KPiA+IGRpZmYgLS1naXQgYS90
ZXN0cy9pbnRlbC94ZV9ldmljdC5jIGIvdGVzdHMvaW50ZWwveGVfZXZpY3QuYyBpbmRleA0KPiA+
IDIzMDM1NzQxOTAuLjE1NTNlYmZlMzAgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVf
ZXZpY3QuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V2aWN0LmMNCj4gPiBAQCAtNDk0LDYg
KzQ5NCwxMSBAQCB0aHJlYWRzKGludCBmZCwgc3RydWN0DQo+ID4gZHJtX3hlX2VuZ2luZV9jbGFz
c19pbnN0YW5jZSAqZWNpLA0KPiA+DQo+ID4gIAlmb3IgKGkgPSAwOyBpIDwgbl90aHJlYWRzOyAr
K2kpDQo+ID4gIAkJcHRocmVhZF9qb2luKHRocmVhZHNfZGF0YVtpXS50aHJlYWQsIE5VTEwpOw0K
PiA+ICsNCj4gPiArCWZyZWUodGhyZWFkc19kYXRhKTsNCj4gPiArCXB0aHJlYWRfYmFycmllcl9k
ZXN0cm95KCZiYXJyaWVyKTsNCj4gPiArCXB0aHJlYWRfbXV0ZXhfZGVzdHJveSgmbXV0ZXgpOw0K
PiA+ICsJcHRocmVhZF9jb25kX2Rlc3Ryb3koJmNvbmQpOw0KPiA+ICB9DQo+ID4NCj4gPiAgc3Rh
dGljIHVpbnQ2NF90IGNhbGNfYm9fc2l6ZSh1aW50NjRfdCB2cmFtX3NpemUsIGludCBtdWwsIGlu
dCBkaXYpDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfcmVzZXQuYyBiL3Rl
c3RzL2ludGVsL3hlX2V4ZWNfcmVzZXQuYw0KPiA+IGluZGV4IDNlOGNhNzk0YjEuLjJkZGE0YTkw
NzEgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXhlY19yZXNldC5jDQo+ID4gKysr
IGIvdGVzdHMvaW50ZWwveGVfZXhlY19yZXNldC5jDQo+ID4gQEAgLTEwNDAsNiArMTA0MCw4IEBA
IGd0X3Jlc2V0KGludCBmZCwgaW50IGd0LCBpbnQgbl90aHJlYWRzLCBpbnQgbl9zZWMsDQo+IHVu
c2lnbmVkIGludCBmbGFncykNCj4gPiAgCWlndF9hc3NlcnRfbmVxKG51bV9yZXNldCwgMCk7DQo+
ID4gIAlpZ3RfYXNzZXJ0X25lcShudW1fc3VibWl0LCAwKTsNCj4gPiAgCWZyZWUodGhyZWFkcyk7
DQo+ID4gKwlwdGhyZWFkX211dGV4X2Rlc3Ryb3koJm11dGV4KTsNCj4gPiArCXB0aHJlYWRfY29u
ZF9kZXN0cm95KCZjb25kKTsNCj4gPiAgfQ0KPiA+DQo+ID4gIC8qKg0KPiA+IEBAIC0xMTkyLDYg
KzExOTQsOCBAQCBzdGF0aWMgdm9pZCB0aHJlYWRzKGludCBmZCwgaW50IG5fZXhlY19xdWV1ZXMs
IGludA0KPiBuX2V4ZWNzLCB1bnNpZ25lZCBpbnQgZmxhZ3MpDQo+ID4gIAkJcHRocmVhZF9qb2lu
KHRocmVhZHNfZGF0YVtpXS50aHJlYWQsIE5VTEwpOw0KPiA+DQo+ID4gIAlmcmVlKHRocmVhZHNf
ZGF0YSk7DQo+ID4gKwlwdGhyZWFkX211dGV4X2Rlc3Ryb3koJm11dGV4KTsNCj4gPiArCXB0aHJl
YWRfY29uZF9kZXN0cm95KCZjb25kKTsNCj4gPiAgfQ0KPiA+DQo+ID4gIGludCBpZ3RfbWFpbigp
DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvci5j
DQo+ID4gYi90ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3IuYw0KPiA+IGluZGV4
IDQ1ZWM2MjgxMzUuLjBkMzc2N2MxNGUgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVf
ZXhlY19zeXN0ZW1fYWxsb2NhdG9yLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX3N5
c3RlbV9hbGxvY2F0b3IuYw0KPiA+IEBAIC0zMTIsNiArMzEyLDkgQEAgY2hlY2tfYWxsX3BhZ2Vz
X3RocmVhZHModm9pZCAqcHRyLCB1aW50NjRfdCBhbGxvY19zaXplLA0KPiB1aW50NjRfdCBzdHJp
ZGUsDQo+ID4gIAlmb3IgKGkgPSAwOyBpIDwgbl90aHJlYWRzOyArK2kpDQo+ID4gIAkJcHRocmVh
ZF9qb2luKHRocmVhZHNfY2hlY2tfZGF0YVtpXS50aHJlYWQsIE5VTEwpOw0KPiA+ICAJZnJlZSh0
aHJlYWRzX2NoZWNrX2RhdGEpOw0KPiA+ICsJcHRocmVhZF9iYXJyaWVyX2Rlc3Ryb3koJmJhcnJp
ZXIpOw0KPiA+ICsJcHRocmVhZF9tdXRleF9kZXN0cm95KCZtdXRleCk7DQo+ID4gKwlwdGhyZWFk
X2NvbmRfZGVzdHJveSgmY29uZCk7DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCB0b3Vj
aF9hbGxfcGFnZXMoaW50IGZkLCB1aW50MzJfdCBleGVjX3F1ZXVlLCB2b2lkICpwdHIsDQo+ID4g
QEAgLTIyMTUsNiArMjIxOCw5IEBAIHRocmVhZHMoaW50IGZkLCBpbnQgbl9leGVjX3F1ZXVlcywg
aW50IG5fZXhlY3MsIHNpemVfdA0KPiBib19zaXplLA0KPiA+ICAJCQlmcmVlKGFsbG9jKTsNCj4g
PiAgCX0NCj4gPiAgCWZyZWUodGhyZWFkc19kYXRhKTsNCj4gPiArCXB0aHJlYWRfYmFycmllcl9k
ZXN0cm95KCZiYXJyaWVyKTsNCj4gPiArCXB0aHJlYWRfbXV0ZXhfZGVzdHJveSgmbXV0ZXgpOw0K
PiA+ICsJcHRocmVhZF9jb25kX2Rlc3Ryb3koJmNvbmQpOw0KPiA+DQo+ID4gIAlpZiAoaXNfaHVn
ZXBnX2VuYWJsZSkNCj4gPiAgCQlyZXNldF9ucl9odWdlcGFnZXMoKTsNCj4gPiBkaWZmIC0tZ2l0
IGEvdGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRzLmMNCj4gPiBiL3Rlc3RzL2ludGVsL3hlX2V4
ZWNfdGhyZWFkcy5jIGluZGV4IDI5NzRmYzMxMmQuLjdjNmQxNDU4OTEgMTAwNjQ0DQo+ID4gLS0t
IGEvdGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRzLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94
ZV9leGVjX3RocmVhZHMuYw0KPiA+IEBAIC0xNDY2LDYgKzE0NjYsOCBAQCBzdGF0aWMgdm9pZCB0
aHJlYWRzKGludCBmZCwgaW50IGZsYWdzKQ0KPiA+ICAJCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtX2Nv
bXB1dGVfbW9kZSk7DQo+ID4gIAlmcmVlKHRocmVhZHNfZGF0YSk7DQo+ID4gIAlwdGhyZWFkX2Jh
cnJpZXJfZGVzdHJveSgmYmFycmllcik7DQo+ID4gKwlwdGhyZWFkX211dGV4X2Rlc3Ryb3koJm11
dGV4KTsNCj4gPiArCXB0aHJlYWRfY29uZF9kZXN0cm95KCZjb25kKTsNCj4gPiAgfQ0KPiA+DQo+
ID4gIC8qDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3ByaW1lX3NlbGZfaW1wb3J0
LmMNCj4gPiBiL3Rlc3RzL2ludGVsL3hlX3ByaW1lX3NlbGZfaW1wb3J0LmMNCj4gPiBpbmRleCBi
NDMyNjlkNGYxLi41NjQ5MzA0ODY3IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3By
aW1lX3NlbGZfaW1wb3J0LmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9wcmltZV9zZWxmX2lt
cG9ydC5jDQo+ID4gQEAgLTMzOSw2ICszMzksNyBAQCBzdGF0aWMgdm9pZCAqdGhyZWFkX2ZuX3Jl
aW1wb3J0X3ZzX2Nsb3NlKHZvaWQgKnApDQo+ID4gIAl9DQo+ID4NCj4gPiAgCXB0aHJlYWRfYmFy
cmllcl9kZXN0cm95KCZnX2JhcnJpZXIpOw0KPiA+ICsJZnJlZSh0aHJlYWRzKTsNCj4gPiAgCWRy
bV9jbG9zZV9kcml2ZXIoZmRzWzBdKTsNCj4gPiAgCWNsb3NlKGZkc1sxXSk7DQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfcmVuZGVyX2NvcHkuYw0KPiA+IGIvdGVzdHMvaW50
ZWwveGVfcmVuZGVyX2NvcHkuYyBpbmRleCBlMmU3NTJlMjhiLi40MjkxZGIxY2NjIDEwMDY0NA0K
PiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3JlbmRlcl9jb3B5LmMNCj4gPiArKysgYi90ZXN0cy9p
bnRlbC94ZV9yZW5kZXJfY29weS5jDQo+ID4gQEAgLTYzNCw2ICs2MzQsOCBAQCBzdGF0aWMgdm9p
ZCByZW5kZXJfc3RyZXNzX2NvcHkoaW50IGZkLCBzdHJ1Y3QNCj4gaWd0X2NvbGxlY3Rpb24gKnNl
dCwNCj4gPiAgCQkgcmVuZGVyX2R1cmF0aW9uX3RvdGFsIC8gcmVuZGVyX2NvdW50LA0KPiA+ICAJ
CSByZW5kZXJfZHVyYXRpb25fbWluLCByZW5kZXJfZHVyYXRpb25fbWF4KTsNCj4gPg0KPiA+ICsJ
YnVmX29wc19kZXN0cm95KGJvcHMpOw0KPiANCj4gVGhpcyBzaG91bGQgYmUgaW4gMm5kIHBhdGNo
Lg0KPiANClNvcnJ5LCBtYWRlIGl0IHJldmVyc2UsIHdpbGwgY29ycmVjdCBpdC4NCj4gDQo+IA0K
PiBSZWdhcmRzLA0KPiBLYW1pbA0KPiANCj4gPiArDQo+ID4gIAkvKiBFbmQgYWxsIG1lbSBjb3B5
IHRocmVhZHMgKi8NCj4gPiAgCWZvciAoaW50IGkgPSAwOyBpIDwgdGhyZWFkX2NvcHlfY291bnQ7
IGkrKykNCj4gPiAgCQl4ZV9zcGluX2VuZChkYXRhX21lbV9jb3B5W2ldLnNwaW4pOw0KPiA+IC0t
DQo+ID4gMi40My4wDQo+ID4NCg==
