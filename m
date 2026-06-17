Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E9DCD98F2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 16:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00C310EA77;
	Wed, 17 Jun 2026 16:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U72SW/gS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E230E10EA74
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 16:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781713097; x=1813249097;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FFROkehzKrTu2LpNDaCnodiWyfDqBeJ2UzdzfNwdFxg=;
 b=U72SW/gSAdGde0ihgbZAVpcVfecl7ovswyskZ9vC3Pfmu+ySLJcU3p7n
 UBhV1qwYUxUF+8gbuAjHQGFpn+41Eg+/kmOGD6+OWd4u2ZBP0QRute5LH
 PZTSOUv8jEM08kRaO9pN5EzzH/T4Vyq86DHJDQCZ0v2hC5PBrUjf9dPXw
 wKwE91YQxXNDtBTU4E0c8KrKvBcVfGD+iVRFV74an+guqvgTBlFnglBvC
 uFY8yRdZwcxDTl2qrYO3AgO1+TS5jwwWwKhl86snFwcUiuc9LBIzzjGEp
 0SjoNneO1HkIfUEvUOrDt/ENqdSI21PwRZmm4BMQmJ1JNSsRzwSmjWzic w==;
X-CSE-ConnectionGUID: 73h9WmRJQLm1rGHNJL+DXA==
X-CSE-MsgGUID: QAMSBe11TVmk+xxmAC23yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="93095380"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="93095380"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 09:18:15 -0700
X-CSE-ConnectionGUID: meBcqXtMQACM9RgoJjZJfg==
X-CSE-MsgGUID: M30LE4o0S6qmRPfkJ/NC+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="247980474"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 09:18:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 09:18:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 09:18:10 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 09:18:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsMQPalddG1RRVn/xc6PTkORDSp7evx+7Zhsg8b0VuE3dTagOYvZVbfNClvxyk+YuYRDrk79fHAwrRJDNjS/UJB+kxe3JP/gIbUQSWMRPdbzpZ5eZY8oIGZg/wKMrTsZttUxg2eEC3PlhECNG5nZZegJYXRwcqvQ02oi3hqrf0PZ17YWDEomE3i769qjRaB4CO0ps2QJX5194eH8tvsIuuZx976oHvrqVAvvqi727dtx+yhLaerIf9/CtYCVHaaKvwknKx3mW31A5fo+5BsR129aHXHxpGz9J9aSH2DScrbL9q24r5C2O1dLvxirGCz7IvsbM/ZmHFCIiqdoMNHVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFROkehzKrTu2LpNDaCnodiWyfDqBeJ2UzdzfNwdFxg=;
 b=bTFIyCC+QhHHnRTCU0RryAt/pJz4LDe9enbUdk/gbooXcIicy/1kuiOwmUWhN6PjoVPpHv1XL3tsFRbWNZ3MpqHjLV2Le8uOxo6U0kgkh9itvcUBe6nW9Mg5T23Gk2F03Ylkzt1z+h3xeKbPQyfgWTxSer0AT4YQiS6sAdXNQBZTnCYosNDY/Od5vmZOvb+LTQvckmEjCnWkPwfhxqilt17DWIzDBamtlaOTbFx1IzfT4lzHkWZb/0LhPoPUeyx7+uU/Wb71+Jd3ee9roIqBDcl+DgBaYk0+6ILWb8SP/nkY9T5ZNEyB4pwe9dvecy8BueF9ZcaUDtu92SHJMsXuKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DM4PR11MB6551.namprd11.prod.outlook.com (2603:10b6:8:b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 16:18:05 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 16:18:05 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Muppidi,
 Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dugast, 
 Francois" <francois.dugast@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: RE: [PATCH i-g-t v6] intel-ci: Add SVM,multi_queue tests to Xe
 fastfeedback
Thread-Topic: [PATCH i-g-t v6] intel-ci: Add SVM,multi_queue tests to Xe
 fastfeedback
Thread-Index: AQHc/j1+7FvKbhAN5U693nPX7zHnTrZChKiAgABoSOA=
Date: Wed, 17 Jun 2026 16:18:05 +0000
Message-ID: <CH3PR11MB8434263E27A8D977840FAC9F8DE42@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260617094235.3017-1-venkateswara.rao.muppidi@intel.com>
 <cirge2ijncdh6ieeqpzazb5zr6ljx7btkzux2qdbc6at5efr5l@2znsrse5ztxl>
In-Reply-To: <cirge2ijncdh6ieeqpzazb5zr6ljx7btkzux2qdbc6at5efr5l@2znsrse5ztxl>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DM4PR11MB6551:EE_
x-ms-office365-filtering-correlation-id: d7dd5339-587d-4534-64fa-08decc8c033f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|23010399003|366016|376014|4143699003|11063799006|38070700021|6133799003|56012099006|3023799007|18002099003|22082099003;
x-microsoft-antispam-message-info: Sdh2GQSm1BZKPucAs6xGCVYcyHnK6UI4MvqC4ul43lCZuPxWZRrXTzYM0tttLDRWigSYFL8fVs7XkYXOvaO+pifIihhkWEGgLONFyMPXCuT9XNir5IzNuv0j24mm64JsUTeMZn5vWXQu2nrfLyeLCMVFR4Z+0ixPbfyCciiSVlBy30NLT+pYazgHCehY7mUZcfdXlSROPqvQXk4756fFf5i5ZyrK1odx5jHrxOmqaE85vKJW4kOPOudFAwNpq1GU5JSXT/cZxHzPb860dMnCHhn5yYsvLaY8UZnInq+dweTueamA2E4GGkhNi9WF8gTedcRgeZHSu0QMNb8e2cBjBqgxSKsWHnQncor34BYC6rmvPvACgvbtWd3+66T7AqyeWp0AKTmAY/H3RZewoTkGV4osBHWsCugMiPklhprasYqqYn77P4MKOaxcPaRUjIldk/rd0TACdzlkxoLU/qcaZ9Jps3KgUAadsArvp7mh2RnhIRVeS3Udio0jcHGT+MNu1dOPw0Womjp1BrQoxFYAF0/9Ky1mROkpjw9KAIew3Bze50WuSAM4BTg0y1Yp0Ic4RbT+z7hdlKpzBql5ywRhcQkflt2C0iSRFnZspflwmoQ1RFlbtdn3zckKxwhpBZzGV6NJvMcHVTQogSZLkEGaZsxdBdURSmrOCS35hfBfvtLt6wTw2IO8wihVZRVYYZ/PphWn+mt75xqjvuBRlOkiYuuoTronzBIZqy4b4OV1steImZedZr0OQwhjfL/c/whN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(23010399003)(366016)(376014)(4143699003)(11063799006)(38070700021)(6133799003)(56012099006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OS9iSzE0TVc3aTdRTWhZbHlOalUrY2ZCTzVVWFB4dS9MZjVCSlc0L1Z5YWlS?=
 =?utf-8?B?czBxWEhNUUJSc3RES0hyQjh2SC84QTlkN3hGT0UvdlUrK3Y1OEJuRXY4dHRP?=
 =?utf-8?B?eVRSWDVHZEZXc3k0QjVlLzI3YmhkeEo2QVlaS0VIci9ra201dEY0emJ4MmR0?=
 =?utf-8?B?NXhIMlhIRFkwTUx6aU10N1BuSXkvZHFiRWVFN0JLYUdSVDRXZW9UYndmVTJl?=
 =?utf-8?B?enNOczdLODR2YjE1aC9ZWUVFVFZ4YXdmYnNYVVJRSFk2SE11SG1ZQVp2VldK?=
 =?utf-8?B?QlBEcjRIVlE5bTNleHY2YmkvUkxQR3Z6MHM2bTYzeEwvclU1Yk5tL1F2TW93?=
 =?utf-8?B?YXFNU1c3dFgvRmthNWJXdmlkOXhmSHJUVU4zUThNbVRoR2U2cURwU0tYR3lq?=
 =?utf-8?B?UDBNZzdWaFFEd3c4VTEvZUJJME9oRFYvblg1NlJyT2ltZ1Azbk4wSEtlQjMv?=
 =?utf-8?B?MW5qRnh0R2JOR3FraWh5bmxzckJhQ1RXVVhuWnRIeU9GbVZCSDVHV3FJaGs4?=
 =?utf-8?B?bm9vYkRRUU9RaGFhclM2c0tBdFhFcHlORndhRHBWZ1NreVRZYzVTU1dXeUZj?=
 =?utf-8?B?ZEo2U3Q4RmJvRmRDdVd3N2wyai9PVXZyckFhT0c4cDZLZG1PMHdqNm5wTDRO?=
 =?utf-8?B?YmtNaTUzWUVMd2pkdlFuZHlhamlEdFZ1bHFWekdURTdlYm1NMXZoVGFhQjRn?=
 =?utf-8?B?VE5xUDd4NUh1eVJreFlZOEo2eEdibm5PK0tuQ0RPdUFHL0RBTVdGMXRKV0NU?=
 =?utf-8?B?ZEczV0hxa1VxcFVyL0JxaDEwL29oeGVIRTIzOWJ1ckIxQkFxanE4Vkh6QnVQ?=
 =?utf-8?B?UkJyenpyNnh6RFdidnUzdHZQNE9oN0hQTXFmVWVBK09qWXhadXdRQndtMWV2?=
 =?utf-8?B?aExxOEl0S0J0K2xaZGN5b3JjdWxVVXB6bitrTWFaOStGanVjUmoydWNYcHJ1?=
 =?utf-8?B?TkdQenpmbWpOVWtoZlNzUnBrcGNmbkNjN0hFMGxyUlA5L1E0dG8wcjNuTUhL?=
 =?utf-8?B?dTNGMTF1UFBmcFNqU21oTGcrbjFvQVBPenN5SHhQZHphMnJQclYwT1BEc3lU?=
 =?utf-8?B?cHZyZnlPbVc5WGpJdU9LZXdteVk0R1NPeVo4ZWdQeFI4Z0RhUGpoRVF0UU5N?=
 =?utf-8?B?N3ZWUklqZ3lBVHc2cW1ac2kyb2N2WVdZRzk3ZHVvaFRGdGl5SVNhenN5c00z?=
 =?utf-8?B?Z3dJTy9ieTNsVW9nWGJuTWd3bWFOZ1VrSGpSeWR1Y1JFUGo1L2dyckh0YkQz?=
 =?utf-8?B?VzJpK1pLQWdNSjljQmRtUjBObnZuZDBmWkRjWStLZWV4WUt4dHNSZ2tJOHY0?=
 =?utf-8?B?VWhKc3dtN1N1WHB3dHZiSERhS095MHpkSkhVN0NiaG9JcllqZTVGNmdORFAx?=
 =?utf-8?B?UUZXN2ZLa1N5UlZqbU9FcE54NG1ZZFVZRldOT1E3UE0yenFWTFp2QS9YSnBh?=
 =?utf-8?B?UWsycVoxbXZnTitoZkhYRTlTWHkvam5JWXhmUG9QczJYMzdtWHpvemsyMy80?=
 =?utf-8?B?azlsblFGSTdXTmdPdkM0d0JoMjEwWis4bVp3OGJsZFNNOGFmOC9BcWtQMDVh?=
 =?utf-8?B?bkJrZHE3MVJER2JheHRCWTcwWmJSLzdEK2gyVkNxOG5DU3RlU2hzSFNvbXg3?=
 =?utf-8?B?ak1zRFpDVmh6OHZkcDVXalZMOE5BTVZtaHZ2eWoxSkdDN2RsTjFuM3BNYnFW?=
 =?utf-8?B?RUtYT3prNjVEK0d4Z2lVdXp3UnV2WlRWQWNVUkIyT0dYb2ZJUm9ZWlp4TGtu?=
 =?utf-8?B?azhqSGE5WERFbmlBaUxZZERuZGNtcFUyN0tUQ0VHdTNCZEZqaDk4UmMvbmNW?=
 =?utf-8?B?Z1htTUw2VURxV0p6WFVMWWFRY3VsN1ZTcEQ0cFMxbWY3TEpNYzNvSTJUcm94?=
 =?utf-8?B?UWkrNnJ2QzljdmFGeVdwMlpJeUtaeG5PUnRzcnlCMTVXUTA0bUZOV1JIYlht?=
 =?utf-8?B?OFMyUWk4d05tQ1RBZTB5L3AzeXFuZlQzM0NVQWRJZUcyL280UjQzU0cxZ0VJ?=
 =?utf-8?B?eVJEUWoyRFRNbEZCaFVCRWh5WFdTR0gxUFU1ZnhkQTZMLzFpSGIzRG9odm81?=
 =?utf-8?B?RzJVTjdBYmRzRHZNWUorSGRKWE5iNWRvMllPbmlDMWlpMVhVK3Bjd3lyd055?=
 =?utf-8?B?YzVFVUp5cGM4VlVNekRldUpScGc0dWphMU9TeW90QzgrMk1jQzhPN25rMkJR?=
 =?utf-8?B?UmF5RDBlWjBicStvclRaWVBjYXRwUlZpV0pMaGkwSGh6Tk16enBoY3ljSHBQ?=
 =?utf-8?B?TnV4ZU1rd2l1OWcwWm9ZWnBzVFBSSUpaOXVHMmZXMDBBeGtXS3Mrdm9oK1Er?=
 =?utf-8?B?YkY5M2o5YnhuQmdXck5yZ0dySzlLME9GTTdkNUloQ3YxS2x0NHFqMEl4ZTVD?=
 =?utf-8?Q?5mAim/6LdYwEpNR/PBlMNQ5h13hGH7y5fVOmOBGqsEM71?=
x-ms-exchange-antispam-messagedata-1: /svk2bOM0U3xIQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: h9ALKJFQreYI99DTJ4rHIw89V0QUBPJqXh1SWCr+wRBdH1H6YliBf1fgyYb96aLJ8Ay0o5dFEEA5mu+CT0F2M13r8IS0fPfjErH49r0zUJ8QflqAwA7Ui/S/DNWazuX/H5efw6EW3e4ZU92AhItj1OMRy7A1+jN8+IBSR56hFM+yNVzDUcNfAWqk0tVTeIbINScTldnhNviWY1S4WtiThoAbAYTwWE6Xchm2rR5uJmNR92l4RndzI9wXJFsGte4dFXivsChUzP/NpdniAhQTem56o5fyu1HNz7D73kM5sbbrbDJRs3v7CLxNedri4W1NfMNOVk8ZJd3PQZoaSPIVmA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7dd5339-587d-4534-64fa-08decc8c033f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 16:18:05.4288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FZazOC1yMJ+Vskd5W4yIglhNhAse9ZGsXCsWhfK6TrdsJWt4+ZM6UC5mbmm+Sa9ZecTae5G+gwA6ZSWiyA5Q/2daOcW2xES30UGJstQ8qFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6551
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2VtcGN6eW5za2ksIFpi
aWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IFNlbnQ6IDE3IEp1bmUg
MjAyNiAwMzozNCBQTQ0KPiBUbzogTXVwcGlkaSwgVmVua2F0ZXN3YXJhIFJhbyA8dmVua2F0ZXN3
YXJhLnJhby5tdXBwaWRpQGludGVsLmNvbT4NCj4gQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBEdWdhc3QsIEZyYW5jb2lzDQo+IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPjsg
RGFuZGFtdWRpLCBQcml5YW5rYQ0KPiA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT47IFZp
c2h3YW5hdGhhcHVyYSwgTmlyYW5qYW5hDQo+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGlu
dGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2Nl0gaW50ZWwtY2k6IEFkZCBT
Vk0sbXVsdGlfcXVldWUgdGVzdHMgdG8gWGUNCj4gZmFzdGZlZWRiYWNrDQo+IA0KPiBPbiBXZWQs
IEp1biAxNywgMjAyNiBhdCAwMzoxMjozNVBNICswNTMwLCBWZW5rYXRlc3dhcmEgUmFvIE11cHBp
ZGkNCj4gd3JvdGU6DQo+ID4gQWRkICBTVk0sIHJlbmRlcg0KPiBjb3B5LGNjcyxjb21wdXRlX3By
ZWVtcHQsZXhlcmNpc2VfYmx0LGV4ZWNfbWl4X21vZGVzLA0KPiA+IGFjY2Vzc19jb3VudGVyLCBm
YXVsdF9tb2RlLG11bHRpX3F1ZXVlIHRlc3RzIHRvIGZhc3RmZWVkYmFjayBsaXN0DQo+ID4NCj4g
PiB2MjogYWRkIGV1LWZhdWx0LTJtLXJhbmdlLWRldmljZS1ob3N0IHRlc3QgKEZyYW5jb2lzKQ0K
PiA+IHYzOiBjb3JyZWN0ZWQgcy1vLWIgYW5kIEZyb20NCj4gPiB2NDogUmVmaW5lIFNWTSB0ZXN0
cyBieSByZW1vdmluZyB0aGUgcmFjZSB0ZXN0LCBhZGRpbmcgcmVtYWluaW5nIFNWTQ0KPiA+IHRl
c3RzLCBhbmQgb3JnYW5pemluZyBhbGwgZW50cmllcyBpbiBhbHBoYWJldGljYWwgb3JkZXIuDQo+
ID4gdjY6IFJlbW92ZSB0d2ljZS4qIHRlc3RzIGFuZCBhZGQgYSBuZXcgc2V0IG9mIFNWTSB0ZXN0
cyAoRnJhbmNvaXMpDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBWZW5rYXRlc3dhcmEgUmFvIE11
cHBpZGkNCj4gPiA8dmVua2F0ZXN3YXJhLnJhby5tdXBwaWRpQGludGVsLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgdGVzdHMvaW50ZWwtY2kveGUuZmFzdC1mZWVkYmFjay50ZXN0bGlzdCB8IDM4DQo+ID4g
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRp
b25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwtY2kveGUuZmFzdC1mZWVk
YmFjay50ZXN0bGlzdA0KPiA+IGIvdGVzdHMvaW50ZWwtY2kveGUuZmFzdC1mZWVkYmFjay50ZXN0
bGlzdA0KPiA+IGluZGV4IGFjZmYwMjVmYS4uYzNhNDAwYmY4IDEwMDY0NA0KPiA+IC0tLSBhL3Rl
c3RzL2ludGVsLWNpL3hlLmZhc3QtZmVlZGJhY2sudGVzdGxpc3QNCj4gPiArKysgYi90ZXN0cy9p
bnRlbC1jaS94ZS5mYXN0LWZlZWRiYWNrLnRlc3RsaXN0DQo+ID4gQEAgLTY5LDcgKzY5LDExIEBA
IGlndEBrbXNfcHNyQHBzci1jdXJzb3ItcGxhbmUtbW92ZQ0KPiA+IGlndEBrbXNfcHNyQHBzci1z
cHJpdGUtcGxhbmUtb25vZmYNCj4gPiAgaWd0QHNyaW92X2Jhc2ljQGVuYWJsZS12ZnMtYXV0b3By
b2JlLW9mZkBudW12ZnMtYWxsDQo+ID4gIGlndEBzcmlvdl9iYXNpY0BlbmFibGUtdmZzLWF1dG9w
cm9iZS1vbkBudW12ZnMtMQ0KPiA+ICtpZ3RAeGVfY2NzQGJsb2NrLWNvcHktY29tcHJlc3NlZA0K
PiA+ICtpZ3RAeGVfY2NzQGN0cmwtc3VyZi1jb3B5DQo+ID4gIGlndEB4ZV9jb21wdXRlQGNvbXB1
dGUtc3F1YXJlDQo+ID4gK2lndEB4ZV9jb21wdXRlX3ByZWVtcHRAY29tcHV0ZS1wcmVlbXB0DQo+
ID4gK2lndEB4ZV9jb21wdXRlX3ByZWVtcHRAY29tcHV0ZS10aHJlYWRncm91cC1wcmVlbXB0DQo+
IA0KPiBBYm92ZSA0IGFyZSBmaW5lLg0KPiANCj4gPiAgaWd0QHhlX2NyZWF0ZUBjcmVhdGUtZXhl
Y3F1ZXVlcy1ub2xlYWsNCj4gPiAgaWd0QHhlX2NyZWF0ZUBjcmVhdGUtZXhlY3F1ZXVlcy1sZWFr
DQo+ID4gIGlndEB4ZV9jcmVhdGVAY3JlYXRlLWludmFsaWQtbWJ6DQo+ID4gQEAgLTEyOSwxMSAr
MTMzLDQzIEBADQo+ID4gaWd0QHhlX2V4ZWNfY29tcHV0ZV9tb2RlQHR3aWNlLWJpbmRleGVjcXVl
dWUtdXNlcnB0cg0KPiA+ICBpZ3RAeGVfZXhlY19jb21wdXRlX21vZGVAdHdpY2UtYmluZGV4ZWNx
dWV1ZS1yZWJpbmQNCj4gPiAgaWd0QHhlX2V4ZWNfY29tcHV0ZV9tb2RlQHR3aWNlLWJpbmRleGVj
cXVldWUtdXNlcnB0ci1yZWJpbmQNCj4gPiAgaWd0QHhlX2V4ZWNfY29tcHV0ZV9tb2RlQHR3aWNl
LWJpbmRleGVjcXVldWUtdXNlcnB0ci1pbnZhbGlkYXRlDQo+ID4gK2lndEB4ZV9leGVjX2ZhdWx0
X21vZGVAaW52YWxpZC12YQ0KaWd0QHhlX2V4ZWNfZmF1bHRfbW9kZUBpbnZhbGlkLXZhIHRlc3Qg
c2VlbXMgZmluZS4NCkxHVE0sDQpSZXZpZXdlZC1ieTogUHJpeWFua2EgRGFuZGFtdWRpIDxwcml5
YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiA+ICtpZ3RAeGVfZXhlY19taXhfbW9kZXNAZXhl
Yy1zaW1wbGUtYmF0Y2gtc3RvcmUtZG1hLWZlbmNlDQo+ID4gK2lndEB4ZV9leGVjX21peF9tb2Rl
c0BleGVjLXNpbXBsZS1iYXRjaC1zdG9yZS1scg0KPiA+ICtpZ3RAeGVfZXhlY19taXhfbW9kZXNA
ZXhlYy1zcGlubmVyLWludGVycnVwdGVkLWRtYS1mZW5jZQ0KPiA+ICtpZ3RAeGVfZXhlY19taXhf
bW9kZXNAZXhlYy1zcGlubmVyLWludGVycnVwdGVkLWxyDQo+ID4gK2lndEB4ZV9leGVjX211bHRp
X3F1ZXVlQHNhbml0eQ0KPiA+ICtpZ3RAeGVfZXhlY19tdWx0aV9xdWV1ZUBleGVjLXNhbml0eQ0K
PiA+ICtpZ3RAeGVfZXhlY19tdWx0aV9xdWV1ZUBmZXctZXhlY3MtZHluLXByaW9yaXR5DQo+ID4g
K2lndEB4ZV9leGVjX211bHRpX3F1ZXVlQG1hbnktcXVldWVzLWJhc2ljDQo+ID4gK2lndEB4ZV9l
eGVjX211bHRpX3F1ZXVlQG1hbnktcXVldWVzLWJhc2ljLXNtZW0NCj4gPiAraWd0QHhlX2V4ZWNf
bXVsdGlfcXVldWVAbWFueS1xdWV1ZXMtdXNlcnB0cg0KPiA+ICtpZ3RAeGVfZXhlY19tdWx0aV9x
dWV1ZUBtYW55LXF1ZXVlcy11c2VycHRyLWludmFsaWRhdGUNCj4gPiAraWd0QHhlX2V4ZWNfbXVs
dGlfcXVldWVAbWFueS1xdWV1ZXMtcHJpb3JpdHkNCj4gPiAraWd0QHhlX2V4ZWNfbXVsdGlfcXVl
dWVAbWFueS1xdWV1ZXMtY2xvc2UtZmQNCj4gPiAraWd0QHhlX2V4ZWNfbXVsdGlfcXVldWVAbWFu
eS1xdWV1ZXMtcHJlZW1wdC1tb2RlLWJhc2ljDQo+ID4gK2lndEB4ZV9leGVjX211bHRpX3F1ZXVl
QG1hbnktcXVldWVzLXByZWVtcHQtbW9kZS11c2VycHRyDQo+ID4gK2lndEB4ZV9leGVjX211bHRp
X3F1ZXVlQG1hbnktcXVldWVzLXByZWVtcHQtbW9kZS1jbG9zZS1mZA0KPiA+ICtpZ3RAeGVfZXhl
Y19tdWx0aV9xdWV1ZUBtYW55LXF1ZXVlcy1wcmVlbXB0LW1vZGUtZmF1bHQtYmFzaWMNCj4gPiAr
aWd0QHhlX2V4ZWNfbXVsdGlfcXVldWVAbWFueS1xdWV1ZXMtcHJlZW1wdC1tb2RlLWZhdWx0LXVz
ZXJwdHItDQo+IGludmFsaQ0KPiA+ICtkYXRlDQo+ID4gIGlndEB4ZV9leGVjX3F1ZXVlX3Byb3Bl
cnR5QGludmFsaWQtcHJvcGVydHkNCj4gPiAgaWd0QHhlX2V4ZWNfcmVzZXRAY2xvc2UtZmQtbm8t
ZXhlYw0KPiA+ICBpZ3RAeGVfZXhlY19yZXNldEBjbS1jbG9zZS1mZC1uby1leGVjDQo+ID4gIGln
dEB4ZV9leGVjX3Jlc2V0QHZpcnR1YWwtY2xvc2UtZmQtbm8tZXhlYw0KPiA+ICBpZ3RAeGVfZXhl
Y19zdG9yZUBiYXNpYy1zdG9yZQ0KPiA+ICtpZ3RAeGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yQGV1
LWZhdWx0LTJtLXJhbmdlLWRldmljZS1ob3N0DQo+ID4gK2lndEB4ZV9leGVjX3N5c3RlbV9hbGxv
Y2F0b3JAZmF1bHQNCj4gPiAraWd0QHhlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvckBtYWR2aXNlLWF0
b21pYy1pbmMNCj4gPiAraWd0QHhlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvckBtYW55LWV4ZWNxdWV1
ZXMtZnJlZQ0KPiA+ICtpZ3RAeGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yQG1hbnktZXhlY3F1ZXVl
cy1tYWxsb2MNCj4gPiAraWd0QHhlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvckBvbmNlLW1hbGxvYw0K
PiA+ICtpZ3RAeGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yQG9uY2UtbW1hcA0KPiA+ICtpZ3RAeGVf
ZXhlY19zeXN0ZW1fYWxsb2NhdG9yQHBhcnRpYWwtbXVubWFwLWNwdS1mYXVsdA0KPiA+ICtpZ3RA
eGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yQHByb2Nlc3MtbWFueS1tYWxsb2MNCj4gPiAraWd0QHhl
X2V4ZWNfc3lzdGVtX2FsbG9jYXRvckB0aHJlYWRzLW1hbnktbWFsbG9jDQo+ID4gK2lndEB4ZV9l
eGVjX3N5c3RlbV9hbGxvY2F0b3JAdGhyZWFkcy1zaGFyZWQtdm0tbWFueS1tYWxsb2MNCj4gPiAr
aWd0QHhlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvckB0d2ljZS1mcmVlDQo+ID4gK2lndEB4ZV9leGVy
Y2lzZV9ibHRAZmFzdC1jb3B5DQo+ID4gIGlndEB4ZV9ncGdwdV9maWxsQGJhc2ljDQo+ID4gIGln
dEB4ZV9ndF9mcmVxQGZyZXFfYmFzaWNfYXBpDQo+ID4gIGlndEB4ZV9ndF9mcmVxQGZyZXFfZml4
ZWRfaWRsZQ0KPiA+IEBAIC0xNzYsNiArMjEyLDcgQEAgaWd0QHhlX3F1ZXJ5QHF1ZXJ5LXRvcG9s
b2d5DQo+ID4gaWd0QHhlX3F1ZXJ5QHF1ZXJ5LWludmFsaWQtZXh0ZW5zaW9uDQo+ID4gIGlndEB4
ZV9xdWVyeUBxdWVyeS1pbnZhbGlkLXF1ZXJ5DQo+ID4gIGlndEB4ZV9xdWVyeUBxdWVyeS1pbnZh
bGlkLXNpemUNCj4gPiAraWd0QHhlX3JlbmRlcl9jb3B5QHJlbmRlci1zcXVhcmUNCj4gDQo+IEFu
ZCBhYm92ZSAyICh4ZV9leGVyY2lzZV9ibHQgKyB4ZV9yZW5kZXJfY29weSkgYXJlIGZpbmUuDQo+
IA0KPiBDb2xsZWN0IG1vcmUgdGhhbiBteSByLWIgZnJvbSBpbnRlcmVzdGVkIHBhcnRpZXMuDQo+
IA0KPiBCdXQgZm9yIHRoZXNlIDYgdGVzdHM6DQo+IA0KPiBSZXZpZXdlZC1ieTogWmJpZ25pZXcg
S2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IA0KPiAtLQ0K
PiBaYmlnbmlldw0KPiANCj4gPiAgaWd0QHhlX3NwaW5fYmF0Y2hAc3Bpbi1iYXNpYw0KPiA+ICBp
Z3RAeGVfc3Bpbl9iYXRjaEBzcGluLWJhdGNoDQo+ID4gIGlndEB4ZV9zcmlvdl9mbHJAZmxyLXZm
MS1jbGVhcg0KPiA+IEBAIC0yMTUsNiArMjUyLDcgQEAgaWd0QHhlX3dhaXRmZW5jZUBhYnN0aW1l
DQo+IGlndEB4ZV93YWl0ZmVuY2VAZW5naW5lDQo+ID4gaWd0QHhlX3dhaXRmZW5jZUByZWx0aW1l
DQo+ID4NCj4gPiArDQo+ID4gICMgQWxsIHRlc3RzIHRoYXQgZG8gbW9kdWxlIHVubG9hZGluZyBh
bmQgcmVsb2FkaW5nIGFyZSBleGVjdXRlZCBsYXN0Lg0KPiA+ICAjIFRoZXkgd2lsbCBzb21ldGlt
ZXMgcmV2ZWFsIGlzc3VlcyBvZiBlYXJsaWVyIHRlc3RzIGxlYXZpbmcgdGhlICAjDQo+ID4gZHJp
dmVyIGluIGEgYnJva2VuIHN0YXRlIHRoYXQgaXMgbm90IG90aGVyd2lzZSBub3RpY2VkIGluIHRo
YXQgdGVzdC4NCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo=
