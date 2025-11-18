Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A24ECED62A
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 11:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EA210E48C;
	Tue, 18 Nov 2025 11:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MF5IMkmH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0155310E48E
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763466833; x=1795002833;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M4twobrgQsFhPjuwSDfgHBrLs2qVCtqCxmj5RIbuFbc=;
 b=MF5IMkmHLVB4rNIW8cgG6OdpVEkXiqeD79BU1A/W+4+alik4f4c48ed0
 mcsE4gbr/V3Ng/X9Ibp3JV42YN6CUG/JNy68NUx3U4HAPhavAeEXG6fZ4
 ACCo02Gsgz884RJG6kREzlzu8dtELncAGpP/tX5+cMvCkmgS1gL5sICaf
 MwU2u08L0gOe99R+lT7GSNnXOAw1XyzBQ3JM+0SCW52+xxfF49zatw3sF
 gJ1DtuqAo9SvzVtYnMYdscE5qdHCP7ZtoL53UuvT0s/K1awk29sUq5t60
 2wKIe/utSK2IiuKXn7U6TE7rKyiT1bTxGZwsjT+9pSSHmwMF4q4E1qqiz g==;
X-CSE-ConnectionGUID: 913kMI54Sm6Z/GRoNDoMUQ==
X-CSE-MsgGUID: 5caN1JygSyeVyEFMFiBG+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="64686528"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="64686528"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:53:52 -0800
X-CSE-ConnectionGUID: kGOshXwcSCqGffUph9CUuA==
X-CSE-MsgGUID: xWCJtYhuQeK+fsgntVm2HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191180773"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:53:52 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 03:53:52 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 03:53:52 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 03:53:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUOXUVAk1jd03jxi/Ztpejvdx6GtJ0rrKsHfdNrdI56bAaT12e8y0KB8AqmKpeEVCbhHtW8gl3mzMa2OtdFzOc8L2QO0wVqMVXwkmyO1QWqMXK/IBX7iIITjoqu1jEYP7cSJXFIjVKtTKEZY8Nm1whl4SpEi4yjDiRi32RjEu3g5nJv+xJ+T6iYOeS6TbWdWzQ3QVLFeoB0HnyRa/nJyK8NpwUQp2KIzqXmpHxeoy6NTUe8Gki2t/O/ge1tjMYQ+IxFyRhWl7kbRc4gm+wmy2Om9FWgXcy+dFNfxNlv8NGhf7I5b0UDCNRpBLVCnnwVZCJS5BCwsLIbCrLJMferBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4twobrgQsFhPjuwSDfgHBrLs2qVCtqCxmj5RIbuFbc=;
 b=Xjs7jiUUNg/jlPNTbTnM8QZ0c9rteDtv5TFQdU/rI8maah3X5Bxn1+cXacleIkgD0UQZByjqX6He7KdeK3eN5l/gwYjrQ5Ivgz157YsJPEO6n8AtGHaeve/xRD9zup0YzhMYW3r0BMBp+Csb+4Z6OoVZONjwzlA+RmTaKqQ6yUORAvpNhj3Q/JdyCrnO5ntWSoFtty4ZH8P7wlNnGDg7P+c2TN/xUN7FQLbt/hPezC62JssFxllu++T97uMAAkJn1QguTDZ4pIByIlE8gVlQ02siPTUeEQrsKn3qE4b+C+CRJLg0aJ5xtpw+yPv8DaKRILG1fVaSx8d9OEojGz/RPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by DS7PR11MB6063.namprd11.prod.outlook.com (2603:10b6:8:76::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 11:53:45 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc%7]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 11:53:45 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Vivekanandan,
 Balasubramani" <balasubramani.vivekanandan@intel.com>
Subject: RE: [PATCH i-g-t] lib/intel_blt: fix pointer arithmetic in
 ctrl-surf-copy and mem-copy
Thread-Topic: [PATCH i-g-t] lib/intel_blt: fix pointer arithmetic in
 ctrl-surf-copy and mem-copy
Thread-Index: AQHcWGtjmMQc/66F4E+oUMV0JEVlQbT4UwKg
Date: Tue, 18 Nov 2025 11:53:45 +0000
Message-ID: <IA4PR11MB92512770A93DAB4065781B6699D6A@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20251118091136.734019-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20251118091136.734019-2-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|DS7PR11MB6063:EE_
x-ms-office365-filtering-correlation-id: 881cb7e4-4ad7-4433-84ef-08de2699209d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?SVZUOWtjVzV0dzJVV2dHUWduSDlEdHFqUzM0YTZBOVdKZGRKYnhpWUFqcitI?=
 =?utf-8?B?a2RLbE45cW5VTzRPQzlyLzRVc0ExR3Byb0VWTThBMHJ6Z1pxVUhvclNTNHU1?=
 =?utf-8?B?bXVCWUpIaEEzOEhCOGtiNFo2WXB5aVQ5WEc0Mk8ya1NXa2RGaFRZL3VDUzZr?=
 =?utf-8?B?SktDUk5CTURrL0JxSldRd1lDUmZVR0Z2ZHRFS2ZUN2Q4eWtROExuMzRIOVBJ?=
 =?utf-8?B?dGlQN1FlNDkwUGVFZGRySS9mMW9YN2pZaEQ2aHJDZnhpRi9aK2RQYk9DSDcr?=
 =?utf-8?B?cmhyWnQ3ZDN0RUxHTWszK3h0dm8zNEs2c29xL2hTZ2p1bENNMmVxSnhCRFF2?=
 =?utf-8?B?MHJHZkhaQ1VZVUYvUFVON0JQZWVSdDl0V0N0SUp6TklySUR0Tkx2Q3V4VmhM?=
 =?utf-8?B?b3k2bFJuK1lsaXB0b2huaDh3SnJWWnE2RUpJNVdnWHA2K21TdEZEMmVycWZj?=
 =?utf-8?B?TU9GMmFXZHZHblk1dHZjOWNGNWJuRlFPUlhrQjV2bDEyZDBOcjJJTU8vcXBN?=
 =?utf-8?B?d3pvRkxEaW1rWFFWaFdlRzdhRDlnRlYyRmJJa3ZqaGUwQmhkVTArNUI4Tysv?=
 =?utf-8?B?MVB5VW9VY08yN1VkTWhmSSs2RlJ6SVRLd0t0SmxGbkZpRjk5QnYzcndDak1h?=
 =?utf-8?B?ZnZ0Mkk3bjVxWTJVVC9Md0lpelE0Zk1BMnAybitlVVV6bko3ckgwN2pnU0tL?=
 =?utf-8?B?RnJMM3l0WlloK2JjU25EaWdzWkgxak5ZLyttVmE4NDZXZ2xjZ3NLakJYOHdX?=
 =?utf-8?B?MzMzRlkyNTNkaE1idTJxSUVUTEZmSm8vTnRDdEFZZHVOd0RuWlB5eDc4ZzRl?=
 =?utf-8?B?TkoxUzMrWGwwYzk5R0E3bXZxcnlHbE5OSzA2VGIwYU5GSExmYmtyVDhjZzFJ?=
 =?utf-8?B?Unp4NFF6Q3Q2S1cxbFNSQU1sRU5RendmNEc3VXFFbW0rNkZvWjU4MzUzWkRQ?=
 =?utf-8?B?dHFRdmNIQnllbnlBVURYa1JiS0JEU2NjVzJubU55elMxZHR5Sm5NZDdFbS9J?=
 =?utf-8?B?b21QakFqZmFrR3MyTFA0N3cvQUNEWmxpaFdKMmNNN2JWVTloRjZuWVJ3YTlC?=
 =?utf-8?B?cFVPcm95akREaVc1SlIrZHdqcmlzVW8vd0pjMFVLZW9kVW9ORWE1Nzl4bFF4?=
 =?utf-8?B?ZW5WTkpJcmNVYi9CSTducVZLS3o5UWo4OXNSTytMQUhJNTVtMHBhb0ZQWGpO?=
 =?utf-8?B?cnFTc2EwOW5TQksveTI3MkFKd3BMa3FHQXFYZ29FL08wdkpXR1I4NjRkSkt6?=
 =?utf-8?B?T01UQXRzYU9UU1piMWJZV1h6R0VHanlkV2loUjZWbW1QRHAybFhtM0dZdkla?=
 =?utf-8?B?dWx5RSsvRkwwN0dJS2I5WWxqV2lLZldCdktHYXpoY0dtb0l0TDlRTGp2eUN1?=
 =?utf-8?B?RnBBNTArcDZJYlpXSjdZN0ZvaG96Q0xrdjFHM2ZOaFZ2SUxrTk11ZkZ4WlQw?=
 =?utf-8?B?bkErdVRpcVpXQ1JwdVRLdXMzVnBBSjROa0pRdVZFTmZqVlJ6TThIT3RiOW9n?=
 =?utf-8?B?TFdYNlMxWk5aYzFvd0xCWUF1TWRQVDIvakovRWttdk53N3dvdDRBckJ6R3hS?=
 =?utf-8?B?VjBodUxQblRBdnBkM0xqVnJyOTBSS1dhWWduU0lCdDl0b0RJTldMNEFhLzJ6?=
 =?utf-8?B?YWJGZHhOdUp2M1dwWEhXc1FJYjIwK3Uwc09pRFI0N215ZFJZbUV3c0R0VGRQ?=
 =?utf-8?B?RTg5a1o5VVZYa0VidkVFSEdpZmJNamFwVVJ2MGV5S1F4cnFWMXZqWUlMQ1lC?=
 =?utf-8?B?a21LVStieWlmbzNsR09tc0xHcE5zTVpkRUxnaWpyRGc1S1BCTGR2RHUwcGZ6?=
 =?utf-8?B?OTJNdkZXbEdGaVRGeXRSMEkvQ1kzc2xCdkZRckhZQlZMREc0OEJNM3lpWDdG?=
 =?utf-8?B?ck9WelN3VGwwNWtieHNWWjYvdVp1TjlYeG81RFFjWFZFdnRXQUplQUc2bDBF?=
 =?utf-8?B?UHZyTEtSdUFtT0VmVHBlNnk0WkhLUHJ2dGIyWkV0QjFWL29za0xOZWlOZzFt?=
 =?utf-8?B?bXVxY1RudjZmSEt6SUJZTEJ4ZVVtMjVPeEZtOXYzK0ZialNaMW9xSG5KUDB2?=
 =?utf-8?Q?u7j0zW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXNUcTl0R2luSHhiZWhNY01wcDJkS2ZXOUV2UlFBNExIOHpHejhNL0tKcXNR?=
 =?utf-8?B?dGpmNUJpL2tsdmVBazkwQ05uYjNnSU5ORUNHaWFGZU1aUUh6cnpFWVV2ckpi?=
 =?utf-8?B?cVNRT3hSTDFmWitPZEU0MXhxNTRRY2toM1pZT1J5T09VYmxoTkQwY3Ridm9z?=
 =?utf-8?B?UWpEbGR3OFl0YUJmbUM0VGN4M0pBMGtVSFpqNzkwaWxJeTg1djFXTWFmZEM5?=
 =?utf-8?B?Qk5PZ0cwRmJVVXZ6UFJqdjZwS3lCY3RMN3pwMS9KdkwxM0tXRXlRZ2tjQ2VI?=
 =?utf-8?B?K2dBc0ZHaEZBcGRxdFYzYVR4clVyMzlubVlMSFpwNDluVkoyU1NLck5uNVBW?=
 =?utf-8?B?TEhUMkk3ZTZNQ3FyNzl5azJlZHVIZ3FHbkNIS2htUU9BVG1uV3hQSG0yNEly?=
 =?utf-8?B?YXo4bFg1SDhtdW9selpQYVFuV0pHKzhTWUxHRW9qYXZFU2M1aWwwV3FSMCs4?=
 =?utf-8?B?VzdNd0tDMWgzbGxFVklwTVA2MDg4YjNoeE5MS2loMTh1UENqUUNtTnhLdGJE?=
 =?utf-8?B?OC9LWEVsWENQdUVHUDlNSW5KaDNDalU0bFJ2RWZEaFllYVp1YUN5U1IvUXFm?=
 =?utf-8?B?cFhmUmIyeG8zeXZRYlBBdEZUS0NHVzdLNDNFRUJlVGlFMy9lRlRDZ3BPMnM5?=
 =?utf-8?B?ZGhVYlBxZG8vQ0VCTFpkT0VrbnY3ZFQ2blY1UU1SRGJRRjZqTnJFVEl5eE44?=
 =?utf-8?B?NWFiRERqSXpTeG8xanI1d3hSSlpJTDJXUnJvWlROcnlQT3RtWEp0Q1VpcFlS?=
 =?utf-8?B?TlVkRWhCMlJnK2dUbGtiRkdaUEZOVlEydm02YWNLQkkxdW42SnFQeE9EWVhq?=
 =?utf-8?B?ZWhFOThtZXl3Vmg4WnpUaXFaNkhlMWwzcnZCSzZ3OXFSMTRXMm5BRzFpaCt6?=
 =?utf-8?B?L092RFV6RytvUTVJRlpGTWNMUHZlQU5Qc2F6QUd5R0ZFYmVTRm1wSk9Hd2Nm?=
 =?utf-8?B?R00veXdjczlSYUlJcHNzcXQzVzduYy9MbGJzNFZYRTFRZmVWeWVTSVJQNDBR?=
 =?utf-8?B?OUFtNjRKUExwU0NKbGJ4NkQ5QUJ1SGZmUC91Wm4xa25QMmM3bitnU25Ca2li?=
 =?utf-8?B?Ym9IVEg2bmRLT3U4Rkd2dWl5VXdHRldPUEhaMm0zWlVvc1dkSEdvcm9RZEJ2?=
 =?utf-8?B?R09kRHRSRS9hbnZpcHpUQ3ZRLzNlbVozR2V0S2dlTG1TK0hWUEhCcVJlSXdt?=
 =?utf-8?B?a2IxQXhkb0FSc3hUdU9DYlRBNHFVUGlZZGc4RVRGMlgzSld1R2YrU1hyVTVK?=
 =?utf-8?B?blRIT2Rjd2R0ZmlsQWk4VGRDMDEyaTZiL0x3SUxtOG1DZm1VUHhkcEw1UTVU?=
 =?utf-8?B?YmFCT2dmN015RVZpM3Bud2g1djVHajc1Y0ZJeXBPbE1Eem1FVlprQ0hWeXpX?=
 =?utf-8?B?MVc1ZVJKT2F3Rjg1Z3BMR3dpQWw2Y2hiaVhpM3ZZMkxiN1BVd2lxL3BDUDVt?=
 =?utf-8?B?V2s3eVRBVXlkV0ovcTlXK3RTbXl1bjAwY0E1Q0JiOE9BVlhJTUFHVWR4b3VL?=
 =?utf-8?B?Wi9MZWJqWDRsWWU1TFgxa0I1RlVhNVNVQWlaWUx6R3hEd2w0dDJ6MGczalBm?=
 =?utf-8?B?Ym5uM0dubEtsRTBya0Z1Z0ZnZmJJMHpFZEg2VWtUS3dGa2lyZEplbTlaSkxh?=
 =?utf-8?B?elY2cW1SNEt2UVhianppNDBKcGp1c1IwOEk5d2E1V1pMKytxZXgreTF4Vlhu?=
 =?utf-8?B?ZUJyNUJNdTBOZEVoWE1yTDcwa3h0VjltSDJnTnYvTTlJbFY2Q0MwbmtHeUFN?=
 =?utf-8?B?T3FUbFNwWGlYUXVVcWptcExGUmRacDNYRmxmZGJLMU54MGNtZjl0cUZvMlY5?=
 =?utf-8?B?M3lSQ0x4V0c0SldvalpEUWxGOFJxbmgzMUpMdmgycFMrMGVXNDJDTG1lL2Zk?=
 =?utf-8?B?ZDJQbmFiUnNnMThvUEFHUU1IMzVvVmEweHFpdFJpWkEyNnZtNjluS252aG9Q?=
 =?utf-8?B?eVBIMkFMYTJsVldyeHJNcGxNaHZpWS9saWNhOXVudU9MYjR1WkZUeDNZMTJp?=
 =?utf-8?B?UWhEVEY0WllhM0kyYzBQdDArT1orZHp6U3d0YkY4RzZWTXVFWUxhSTBDV2t4?=
 =?utf-8?B?T2NhU3h5OGF0emFMbWxianFNRFVQOTVwdktYWXlUWmkvYnBhZ09NNGlBTytW?=
 =?utf-8?Q?S7J+1omGo7raZ2/mu4AYVcgih?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 881cb7e4-4ad7-4433-84ef-08de2699209d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 11:53:45.2027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9UiJl0lgWInBHTYr+L4+bLgG6hLr1DlyUFGBPknoD+m0l4GwIZ6e/c338X4PAfKMN+k7ZqR5BoDQjbfdZIpW9zeF0/eDuNmXnRNXpTeqAxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6063
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IFpiaWduaWV3
IEtlbXBjennFhHNraQ0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAxOCwgMjAyNSAxMDoxMiBB
TQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEtlbXBjenluc2tp
LCBaYmlnbmlldyA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsNCj4gVml2ZWthbmFu
ZGFuLCBCYWxhc3VicmFtYW5pIDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdF0gbGliL2ludGVsX2JsdDogZml4IHBvaW50ZXIgYXJp
dGhtZXRpYyBpbiBjdHJsLXN1cmYtY29weSBhbmQNCj4gbWVtLWNvcHkNCj4gDQo+IFVzaW5nIHVp
bnQzMl90IHBvaW50ZXIgaW4gYmIgY2F1c2VzIGxlYXZpbmcgZ2FwcyBhbmQgaW5jb3JyZWN0DQo+
IHNpemUgY2hlY2tpbmcuIEZpeCB0aGlzIGJ5IGNoYW5naW5nIHRvIGJ5dGUgcG9pbnRlciB0eXBl
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5r
ZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IENjOiBCYWxhc3VicmFtYW5pIFZpdmVrYW5hbmRhbg0K
PiA8YmFsYXN1YnJhbWFuaS52aXZla2FuYW5kYW5AaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9p
bnRlbF9ibHQuYyB8IDEyICsrKysrKy0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIvaW50ZWxfYmx0
LmMgYi9saWIvaW50ZWxfYmx0LmMNCj4gaW5kZXggODJlNjE4NmJmNi4uMmI1OWNjN2U5MCAxMDA2
NDQNCj4gLS0tIGEvbGliL2ludGVsX2JsdC5jDQo+ICsrKyBiL2xpYi9pbnRlbF9ibHQuYw0KPiBA
QCAtMTI5MCw5ICsxMjkwLDkgQEAgdWludDY0X3QgZW1pdF9ibHRfY3RybF9zdXJmX2NvcHkoaW50
IGZkLA0KPiAgCXNpemVfdCBkYXRhX3N6Ow0KPiAgCXVpbnQ2NF90IGRzdF9vZmZzZXQsIHNyY19v
ZmZzZXQsIGJiX29mZnNldCwgYWxpZ25tZW50Ow0KPiAgCXVpbnQzMl90IGJiZSA9IE1JX0JBVENI
X0JVRkZFUl9FTkQ7DQo+IC0JdWludDMyX3QgKmJiOw0KPiAgCXVpbnQzMl90IGNjc19wZXJfcGFn
ZSwgbWF4X2Jsb2Nrcywgc3JjX3N0ZXAsIGRzdF9zdGVwOw0KPiAgCWludDMyX3QgbGVmdF9ibG9j
a3M7DQo+ICsJdWludDhfdCAqYmI7DQo+IA0KPiAgCWlndF9hc3NlcnRfZihhaG5kLCAiY3RybC1z
dXJmLWNvcHkgc3VwcG9ydHMgc29mdHBpbiBvbmx5XG4iKTsNCj4gIAlpZ3RfYXNzZXJ0X2Yoc3Vy
ZiwgImN0cmwtc3VyZi1jb3B5IHJlcXVpcmVzIGRhdGEgdG8gZG8gY3RybC1zdXJmLWNvcHkNCj4g
YmxpdFxuIik7DQo+IEBAIC0xNDA4LDkgKzE0MDgsOSBAQCB1aW50NjRfdCBlbWl0X2JsdF9jdHJs
X3N1cmZfY29weShpbnQgZmQsDQo+ICAJfQ0KPiANCj4gIAlpZiAoZW1pdF9iYmUpIHsNCj4gLQkJ
aWd0X2Fzc2VydChiYl9wb3MgKyBzaXplb2YodWludDMyX3QpIDwgc3VyZi0+YmIuc2l6ZSk7DQo+
ICsJCWlndF9hc3NlcnQoYmJfcG9zICsgc2l6ZW9mKGJiZSkgPCBzdXJmLT5iYi5zaXplKTsNCj4g
IAkJbWVtY3B5KGJiICsgYmJfcG9zLCAmYmJlLCBzaXplb2YoYmJlKSk7DQo+IC0JCWJiX3BvcyAr
PSBzaXplb2YodWludDMyX3QpOw0KPiArCQliYl9wb3MgKz0gc2l6ZW9mKGJiZSk7DQo+ICAJfQ0K
PiANCj4gIAltdW5tYXAoYmIsIHN1cmYtPmJiLnNpemUpOw0KPiBAQCAtMjAyNSw4ICsyMDI1LDgg
QEAgc3RhdGljIHVpbnQ2NF90IGVtaXRfYmx0X21lbV9jb3B5KGludCBmZCwgdWludDY0X3QNCj4g
YWhuZCwNCj4gIAl1aW50NjRfdCBkc3Rfb2Zmc2V0LCBzcmNfb2Zmc2V0LCBzaGlmdDsNCj4gIAl1
aW50MzJfdCB3aWR0aCwgaGVpZ2h0LCB3aWR0aF9tYXgsIGhlaWdodF9tYXgsIHJlbWFpbjsNCj4g
IAl1aW50MzJfdCBiYmUgPSBNSV9CQVRDSF9CVUZGRVJfRU5EOw0KPiAtCXVpbnQzMl90ICpiYjsN
Cj4gIAl1aW50MzJfdCBkZXZpZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZmQpOw0KPiArCXVpbnQ4
X3QgKmJiOw0KPiANCj4gIAlpZiAobWVtLT5tb2RlID09IE1PREVfQllURSkgew0KPiAgCQlkYXRh
LmR3MDEuYnl0ZV9jb3B5LndpZHRoID0gLTE7DQo+IEBAIC0yMTM3LDkgKzIxMzcsOSBAQCBzdGF0
aWMgdWludDY0X3QgZW1pdF9ibHRfbWVtX2NvcHkoaW50IGZkLCB1aW50NjRfdA0KPiBhaG5kLA0K
PiAgCX0NCj4gDQo+ICAJaWYgKGVtaXRfYmJlKSB7DQo+IC0JCWlndF9hc3NlcnQoYmJfcG9zICsg
c2l6ZW9mKHVpbnQzMl90KSA8IG1lbS0+YmIuc2l6ZSk7DQo+ICsJCWlndF9hc3NlcnQoYmJfcG9z
ICsgc2l6ZW9mKGJiZSkgPCBtZW0tPmJiLnNpemUpOw0KPiAgCQltZW1jcHkoYmIgKyBiYl9wb3Ms
ICZiYmUsIHNpemVvZihiYmUpKTsNCj4gLQkJYmJfcG9zICs9IHNpemVvZih1aW50MzJfdCk7DQo+
ICsJCWJiX3BvcyArPSBzaXplb2YoYmJlKTsNCj4gIAl9DQo+IA0KPiAgCW11bm1hcChiYiwgbWVt
LT5iYi5zaXplKTsNCj4gLS0NCj4gMi40My4wDQpMR1RNDQpSZXZpZXdlZC1ieTogSmFuIFNva29s
b3dza2kgPGphbi5zb2tvbG93c2tpQGludGVsLmNvbT4NCg0K
