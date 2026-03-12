Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E91FED2D7
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 06:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB5610E417;
	Thu, 12 Mar 2026 06:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HbhIaWy0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F0810E417
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 06:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773296036; x=1804832036;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=toF6P46zwBAYl1ibDohWVnIyXTDUh9JWbMbsWkg3Eag=;
 b=HbhIaWy0Hdb8mhQvELy7Q7/sh1Zte0v9FRCg7MoyU7bcGETfV3jdwE6R
 NYrf03cKQ1Ll7W2mfmmxP+VrDKQ6QX9yZLsDhzvNUwMeOVCq+yVeXSuaB
 sYdb8vhlWaKunpMPkTKqvo3XKL/x2ItvhQ/juSBqqWaZ2Z58gyGwvBg48
 nupOsGbrC8gtKDb+l78qemR4WsjRhH+85qUohKobDkOt4rr/xLPgjNw7d
 M7SppdrSNo9c6PFAI+bT6Rahy884IjNeQ+uXnHXKJ0UnK1MUu2yOuPzs5
 xfu5KNFr0eERDN+Gscg9ScJa8qSSTwzygFmvsx+YYcfw9dCOaH2ZpfJDh g==;
X-CSE-ConnectionGUID: pQhXUMd0TNmE1mbGUmgKnQ==
X-CSE-MsgGUID: +Z7y+o0kQcyEdo1s2ORBow==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85080223"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85080223"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 23:13:55 -0700
X-CSE-ConnectionGUID: RHW9xv3eS36ijLT6z94ROQ==
X-CSE-MsgGUID: H9hag5flRYi8zVVuJhH6sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="243736578"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 23:13:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 23:13:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 23:13:54 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 23:13:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBPG9Vjz4xU+K8Jl1xN5HlANe7xMhWC+wvQcJajOk8Xqy+SUaNc1SauC7QeemuU26cvxV/ekYlR+RKl7D1AhkOcpmsNF84W/2mkOM7Pdv+4i60UmPI7qZlEVOOA0ZuzK3GeP5EEwyX2041EWwoZXZ5XWyfqo7OPnq3FDdiHmP/9g4Od58Pw7fUmYNUF5+d1J/R4/C79LYWbIP6X7t1R06nRvvDj1dg1TquBm05kh1Cl4hjeJ6/OBM/v9ujVbYpa0G+SN2GU+gUk0HQ2ExzL/0PBXZm3uH4ykZvDX+Xrl6jSJk1rMHp/faalYb8aNVaPRiLpPMjgAzn9H/3PxTIsEYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toF6P46zwBAYl1ibDohWVnIyXTDUh9JWbMbsWkg3Eag=;
 b=To6FdsuBDGEgHHKyYeWsLrpgiROfvTzfst8UX+arj0nEpA7iYdeHnGGHHkHE3ZPLyqASIyuvB58BK9CKFzp3nWv6i/+zYsHpbcDc12hVixzyNDdkxReEsAe9pjlDzPWrkExev4+yHYbmd3scKyaMWI/vOFJav7a8DVF6dFkOZtmhpwFyGsM2chAi5sKy78f7cYG4W8uxkIv804c3Su3EKHITHMPnZzSumfDMA3RlRYwLsYKq/9YMKUvsIkhpvAa3XLrYzuljuBJVJ5ZVIzkoLyw0MnD454RssGOFd2KEcYjkrVzB+opxgqyHip5lPlPjsbAInsbq/Vlw8xTOq7do1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 by LV3PR11MB8506.namprd11.prod.outlook.com (2603:10b6:408:1bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 06:13:47 +0000
Received: from BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4]) by BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4%5]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 06:13:47 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_rotation_crc: Drain queued CRCs to
 avoid stale comparisons
Thread-Topic: [PATCH i-g-t v1] tests/kms_rotation_crc: Drain queued CRCs to
 avoid stale comparisons
Thread-Index: AQHcsdsZRXVPrV3QZUeRnElWdQn7GLWqaILg
Date: Thu, 12 Mar 2026 06:13:47 +0000
Message-ID: <BL1PR11MB6050B22FE76753CEBCF458F8E744A@BL1PR11MB6050.namprd11.prod.outlook.com>
References: <20260312050613.375306-1-sowmiya.s@intel.com>
In-Reply-To: <20260312050613.375306-1-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB6050:EE_|LV3PR11MB8506:EE_
x-ms-office365-filtering-correlation-id: 9c111af2-bfba-4d60-eaab-08de7ffe85b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: bH8NfWMZmPQTzEkZtYFeKGLr1MMNy/kooZlfXSoO/pwcbpzZDG5H79p8zKbSM2YSFJ5vijcT4mz2ylLkh+i26fFauq2razl3BI3BuNxwb2yBchrSE96kcwgaLEfpXOb0rAAsEDD/9+m63REptT0liCH7uhmBLs909OdbCppkyeJKF25ONHlfiNGk3huBvpStvb0nnPLLf3u2VK2H20WlTKxbOJa+jvkK1Lc4Sc3Yu/OpiTzh+Cct8OfgGw0LoN0oHqNC61b0ZlkJ3qO3L1/9pW5XQj6w1qwL4egkCbOaOeUXkkji3dKEp/dZQaTDMbiZ73revvHGVwPlbXWrp7zLYCTj8VS5Im/GNW+jX/n+CoDH1t59yWhjx0214jccta3KZ19eOwNqTxy1AUP/7TfDJAjaf4gXcfi/G+uoNaqZS2+Lg6CyiqQjQOUV+XT0GsBedbbjyjrZ808u00HGy7uVdgVQtermu/IcDx5YlgpZo2QMBERTEJLOYccTPLPWYTykAWVd40SEVxH3aD5MKiVl1GQ2JHN15HnS6TVUG3yf3VSmSEWqpEGPS/PwtAq9RTAVu9VcbJMbSAh70NGsZzJUmzQv5/7GWzTaPOfxFob+klmBfoenZtn0e1kj30XTuZQ4c6yYTPG4j8PU2zxAVvAGxLNXqQdhUszXgkFxTcpIlw2xLbMEoyyFWNt3cSoIyFLunEkWZyFo0M0btJNtOXTICA96yq3VFk0qc0eSdBy1xgbDv+v4b5DBjs9CgNINqLEwVWA5ClW1LrheFjTZJAb+aC0xsQLhi0rhY2HCQrwgdPs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB6050.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzBFQ3lsNTZHNjc1Uk92b2ZCZnV0eGVlMVNuYVVzNWQ4RTJPTGNJd1JKVUdC?=
 =?utf-8?B?RFZYVUFISzN6NWJJc0FXWTc0WFpLYTJSSGFFNTNCVDNKUzIrQ2p2cUNJd0Zv?=
 =?utf-8?B?MVBlcjJpRkZWSnZTU1grMElidlJyTEF3MFkyLzZRVGdWUkw3N2orU1FGSi9w?=
 =?utf-8?B?SkRJVnl6T0NYV2VVT2RvZXk2Rll4Y0p5SE9rbzJaZzRJL0treWp5aW1yRUw3?=
 =?utf-8?B?dm42Q3RwbWh1OTlyZjZQdzlxd0R5a1V6VVY4V3RMbWk3TTZjQUhQcWVVU3RE?=
 =?utf-8?B?bVB2ZjRFMGNwQjZOd2pqdnluakxHU0R0Z09mOGQrRGxWQVhVNVJxaU1HZ0lr?=
 =?utf-8?B?N3RIOHpZQThibnpTNXZibXZNNXBTem5DT0tqUUNXcUl5TWJVaUExemVZb291?=
 =?utf-8?B?ZkxtV3hRQ3hyRmFwL0MwcGlDS0d6T0M5UC9OYkNMS01LOFk4SU1xSHIrRTg0?=
 =?utf-8?B?V0h5MGllaTZ0VjZqUTVvdG1MYW54ell6eUh2bldnQThzU2U3U3FQTlFpMmlv?=
 =?utf-8?B?Nm1KV3BvY1dtUU5zUURVVEZzWnhMbHplQ01ZSjRmVDBrUVNraWVXOXV2Qnd6?=
 =?utf-8?B?WE9BajE1aWxkTWtKWkthU0JvODJXWVZCT2djSmp3bjdrTkJvSStCeUxsS3J6?=
 =?utf-8?B?aTVvOCtuTVIzMnlFU0pkTEhVRENlZlBIbEVWUWJWcjNUNitYUUhzRGkzOHha?=
 =?utf-8?B?aGNzV0Nza2VVd3J6YnpXVFdERGUyNFRQZnlWcGl0L0ltODd2Y2J5aFNrWm55?=
 =?utf-8?B?cVpZWm5zQS9EbUlvVE5SUXdrZlpGRVRsQU5YaXlPc0IycHBTSWRMOUNCMkFn?=
 =?utf-8?B?d2wvTUZQMzQyV2haZmtKdFgrSE1Sa1ZUMjR0Z0h3R2hwV1VxZUIrQ2RCTFQ1?=
 =?utf-8?B?cktvNTFFaHNQOEZDZTJrajJsSUVXeHZEVzIwdW9XcGdROEloSzJLaGdsanFS?=
 =?utf-8?B?eDdsblNsUHlVVUhvZ3Zkb0pZbEdoOXR4aVRiZ1pKMHdIMld4WHlTbGlXOFB3?=
 =?utf-8?B?cy9CamdPaXdpa2RGYnA4MGg4d1AxcUNBMmdoQjBkYVVocjNVcWhremhuOFo3?=
 =?utf-8?B?YjdJZFpZN0RLQW1jMGw5V2ZmN1BMNDdLb2pCUmpKZ05UZitBZnl3N2V3eTRa?=
 =?utf-8?B?VEtvMEp3dCtUOWVCbks4cTJSNjVpRWdrMUFNNmVnWm1vQURlVW1SdGxJNGdM?=
 =?utf-8?B?eURSQjJoRklGWU9VQkJPRm1GMVhpUTgvMzVxYW12aGVnMTdvNFN5WTVrdGJz?=
 =?utf-8?B?OXVhcGZ6L04vZG91cDdadE4zanc0azBtVWxoZGdGZnk4OW1nTFNzVDhra1hi?=
 =?utf-8?B?eVR0SGpHRFU4aDdjVlBkNURJc0pIcXFFQlZyZUFTNFJBSDc5ZlpNRm81ZUJn?=
 =?utf-8?B?OGhkSnZWbGk3K2JPbmllUytsS1gzazlOMXlCMUJzWTlyTU5lS0FHUkU1elN4?=
 =?utf-8?B?eW5XSDYzMkFWRjZSUlkvb3R1K252RTlTYWpLMVdlVUhYbk9LUXZRam5hRDJX?=
 =?utf-8?B?QTl5NjBsaVA0ZUJDQy9kWEFPbnROOW9ESWtwMEw4OHFITjBuRG8vaHZ3VkxH?=
 =?utf-8?B?QUt5NGRMVzdxNnlJMjJHMTZjcjZnQjBtU1ExTkYzeGlGNVRld1FnVFhDK1Bw?=
 =?utf-8?B?VHZ3ckpoa0p2M2ZBWGVYdnFBYXhHUG9qWkQydm5lVHF6NDJhZjd4Yk1CblV3?=
 =?utf-8?B?OWgzZUU3bDY4Tkc1czVSNUdOM3dzSVlxTXA2MldYNXNWUlhqVjBLbjRmSHhC?=
 =?utf-8?B?M0k2bnFYQU1lRVZ0WVMwMldHT3lkR3ozVUJ4a3FuT1g0VUdIemlsOWNLd3Fj?=
 =?utf-8?B?eFk1VHgvZm9iaUhhaXNKRS9zVXpVU1Q5bHRaSmlGYm1CVlFXekU3Yit4SWRO?=
 =?utf-8?B?ckdheElNd0VjN1ZCdEg5dXF5Yi95MkQxTmtWelR3ZUFzY1BjendDclI3enRx?=
 =?utf-8?B?dUVnclhsY3hJYkxVMVp4Y0libkJNTUJuZWdZQjVDaWZDREZxWkdiZmNQc0VY?=
 =?utf-8?B?VTMzZTdoMjVlZzU3Y3E1WVRkcUc1eE96WEpWYzNPazFVMzJYbUN0ODZhRHpl?=
 =?utf-8?B?R0RCcENKSTFUTkdBWktMUmxJZVFOaVdQTXRoZWtPS0NsdERVT2s5SkFNelJT?=
 =?utf-8?B?K0JUNlQzc0VwaG5WYzJSY0UxblF0VjkrNlE1R3J3cVNQUVFsVjJaRmdQUmJa?=
 =?utf-8?B?RWVBWENsQXlRb1J2QjkrZnplTXNiSVZjRGp0SjlKM0RHbENJNHY1VXdXTE40?=
 =?utf-8?B?RTBieU54QngxdHRjSTZ4a2h5aXVTNDZqQlFqSWFlb21zRnpBV0dMZi9wRkto?=
 =?utf-8?B?Z2hib05oU3pTY1c4L3ZOcDBrdXVMK1BHN0NodjVMUTkyeGVWa3pHZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kelLmFYl+G/rkzLQCvrm+hJajvnmKodAu1ReHzFgpzOH9NHjH9ZHbVNr4doa9GSMx5Ek36bhIVLEI8JYhnSnzBlHGprQBj4/RjdLdj2FK25qKYsiDS/FafNcHG2F0lB5ljpfXjp0OrlHFVYZycYfX6yQcHX2odkMiveZOJXWTGa1vW3FnBwiBieE3f9D1Cd4WGtYkMmrJ4z7YUtN1t7Tc8zbDBMbJ5L6l4JK4F1Ej0ovmEnRxtUrW8WQ+i/e0FbJVfcnThhbNbL1btOoX6IAHaF3mnIYqNjmywjDffEpXr0HIeML5KaxC0k8OS5L9TGo6XIfGS3pnRZau5mwcQmwTg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB6050.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c111af2-bfba-4d60-eaab-08de7ffe85b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 06:13:47.4066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VSnXEqZfFV93qK0QjJV4/25jVqlIUMxn6nt5S2KpDEyaDG9httXrL26ByL7OcsrSLiN16G2W+wn78MnTcDekhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8506
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

DQpIaSBTb3dtaXlhLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGln
dC1kZXYgPGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBP
Zg0KPiBTb3dtaXlhIFMNCj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDEyLCAyMDI2IDEwOjM2IEFN
DQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogU2hhcm1hLCBTd2F0
aTIgPHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPjsgTmFsYWRhbGEsIFJhbWFuYWlkdQ0KPiA8cmFt
YW5haWR1Lm5hbGFkYWxhQGludGVsLmNvbT47IFMsIFNvd21peWEgPHNvd21peWEuc0BpbnRlbC5j
b20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2MV0gdGVzdHMva21zX3JvdGF0aW9uX2NyYzog
RHJhaW4gcXVldWVkIENSQ3MgdG8gYXZvaWQNCj4gc3RhbGUgY29tcGFyaXNvbnMNCj4gDQo+IENs
ZWFyIGFueSBxdWV1ZWQgQ1JDcyBiZWZvcmUgY29tcHV0aW5nIHRoZSB0YXJnZXQgdmJsYW5rIGFu
ZCByZWFkaW5nIGENCj4gc2FtcGxlLg0KPiBUaGlzIGVuc3VyZXMgdGhlIG5leHQgQ1JDIGNvcnJl
c3BvbmRzIHRvIHRoZSBmaXJzdCBmcmFtZSBhZnRlciB0aGUgY2FsbGVy4oCZcw0KPiBjb21taXQs
IHJlZHVjaW5nIHJhcmUgc3RhbGUtQ1JDIG1pc21hdGNoZXMgc2VlbiBhcm91bmQNCj4gbW9kZXNl
dHMvUFNSL0RSUlMvRFNDIHRyYW5zaXRpb25zIGFuZCBEUCBsaW5rIHJldHJhaW5zLiBJbXByb3Zl
cw0KPiBkZXRlcm1pbmlzbSBvZiBDUkMtYmFzZWQgdGVzdHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBTb3dtaXlhIFMgPHNvd21peWEuc0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMva21zX3Jv
dGF0aW9uX2NyYy5jIHwgMiArKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19yb3RhdGlvbl9jcmMuYyBiL3Rlc3RzL2ttc19y
b3RhdGlvbl9jcmMuYyBpbmRleA0KPiA0NDIwMDUzZjEuLjlkMzA4ZjViNiAxMDA2NDQNCj4gLS0t
IGEvdGVzdHMva21zX3JvdGF0aW9uX2NyYy5jDQo+ICsrKyBiL3Rlc3RzL2ttc19yb3RhdGlvbl9j
cmMuYw0KPiBAQCAtMTAyMiw2ICsxMDIyLDcgQEAgc3RhdGljIHZvaWQgdGVzdF9tdWx0aV9wbGFu
ZV9yb3RhdGlvbihkYXRhX3QgKmRhdGEsDQo+IGlndF9jcnRjX3QgKmNydGMpDQo+ICAJCQkJCQkJ
CWNvbnRpbnVlOw0KPiANCj4gDQo+IAlpZ3RfZGlzcGxheV9jb21taXRfYXRvbWljKGRpc3BsYXks
DQo+IERSTV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VULCBOVUxMKTsNCj4gKw0KPiAJaWd0X3Bp
cGVfY3JjX2RyYWluKGRhdGEtPnBpcGVfY3JjKTsNCj4gIAkJCQkJCQlmbGlwc3cgPQ0KPiBpZ3Rf
Y3J0Y19nZXRfdmJsYW5rKGNydGMsDQo+IA0KPiAJICAgICAwKSArIDE7DQo+ICAJCQkJCQkJaGF2
ZV9jcmMgPSBmYWxzZTsNCj4gQEAgLTEwMzYsNiArMTAzNyw3IEBAIHN0YXRpYyB2b2lkIHRlc3Rf
bXVsdGlfcGxhbmVfcm90YXRpb24oZGF0YV90ICpkYXRhLA0KPiBpZ3RfY3J0Y190ICpjcnRjKQ0K
PiAgCQkJCQkJCWNvbnRpbnVlOw0KPiANCj4gDQo+IAlpZ3RfZGlzcGxheV9jb21taXRfYXRvbWlj
KGRpc3BsYXksDQo+IERSTV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VULCBOVUxMKTsNCj4gKwkJ
CQkJCWlndF9waXBlX2NyY19kcmFpbihkYXRhLQ0KPiA+cGlwZV9jcmMpOw0KDQpJIHRoaW5rIHRo
aXMgc2Vjb25kIGlndF9waXBlX2NyY19kcmFpbigpIHJ1bnMgYmVmb3JlIHJldGNyY19zdyBpcyBy
ZWFkLCBzbyB0aGlzIGNhbiBkaXNjYXJkIA0KdGhlIGZyYW1lIENSQyB0YXJnZXRlZCBieSBmbGlw
c3cuIFRoZW4gaWd0X3BpcGVfY3JjX2dldF9mb3JfZnJhbWUoLi4uLCBmbGlwc3csIC4uLikgbWF5
IA0KcmVhZCBhIGxhdGVyIGZyYW1lLg0KDQpJIGZlZWwgeW91IGNhbiBrZWVwIHRoZSBmaXJzdCBk
cmFpbiBhbmQgbW92ZSB0aGUgc2Vjb25kIG9uZSBhZnRlciBjb2xsZWN0aW5nIHJldGNyY19zdy4N
Cg0KUmVnYXJkcywNClByYW5heQ0KDQo+ICAJCQkJCQlmbGlwaHcgPQ0KPiBpZ3RfY3J0Y19nZXRf
dmJsYW5rKGNydGMsDQo+ICAJCQkJCQkJCQkgICAgIDApDQo+ICsgMTsNCj4gDQo+IC0tDQo+IDIu
NDMuMA0KDQo=
