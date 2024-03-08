Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342C6C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 11:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B552D113882;
	Fri,  8 Mar 2024 11:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkqTLlK6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A886113882
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709898509; x=1741434509;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7OlsKI5hymhu5LRlIX4uGHvEM+Np1+cOk2ShKLMA2G8=;
 b=EkqTLlK6otv+dvvyFa/2N0jhC5EW932wX8RDhXNlWHm3Z/VGZmCPxfyO
 BS83VnOXuc2URT0d99klnAdE6GcVjsO7tgxbdiXovGhcy6jmr7tmpHxsM
 +e/k3gsHDWbfcGfrOfuD4bEOKzpkHnX8gnRZf40jcgDxNc63TGrjwzOH9
 vAlOKDzqztElqB0p65hx0tPkX4QgE1kRLzWd5GnGLYacXl6SUaYNpzoDA
 6TU18I19X5/OVFyqgsMbuonWPtOw3vnBJAdQURkt6fKp5GqACCKOicTK5
 Rpjf14ivpOI2RrDYZurzAVWOlwBv/KTHc0hvqQo7QV4Mlzx67bCWpDaSA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15335308"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15335308"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:48:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="14920411"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 03:48:20 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 03:48:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 03:48:20 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 03:48:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idSwbkz6PI2k+hcAgpQyjP2oWxqYidXDc/7PBBm5DUFsL7IK9thXlhgOs1320AiFpdBLxFY8fG1sdjNB2uVw7/qHsbHbDym0baBavNcCEDBroEC8Ouo1hc7QRNtIG0BbxRPOqzPP7ecD29zIDW4VW1+27nRhE3fGE6IWGzf9xwU4ndBJVmUlWPifE80ElhFtajA6j1x2lUyhO02Ms4fw7Zudaxzf6NyjVbZkui2tUMd3yhalXl/g8RRti8rvdo+yUlQVn1/nUHveX6HaiO49hXEZ22JpUB+qM6xNP61fyq9w1wM3ytSvahHy1phsH9qzbPRx//WqXgSCI2jeBz0NFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OlsKI5hymhu5LRlIX4uGHvEM+Np1+cOk2ShKLMA2G8=;
 b=XRAYYccQrMODUa9yaeIFu0oTThcNSMAssXVv2yEmcvy9oy+k0owOe41Xx+PjZS4MSUzAdzeuYUZRlAb3wX/gkHfn85MIJZtQBjNMV5POe+RoquscU+Up7V0ALHwpbL00sU9rc7Q2yKvzol/MMRzRlQd4b5BCbHJEGZrsHZLYAaxIL+F+yePp1+LP4Sr6hFjRKUs1+G5mox7LraHXhblQ+VHnMLXtx9GmEAqRgtiL0qbDZApfTnXN3UgmUTZf0Z9IN2xxxDQhyaUGFcAF/8sirlAF5hJAaUOLTP1WF9rZlJIDQAvzOP3Z20ZDsICXa3F+C6GQJQ2pTOP+cbLEd4LC4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by LV3PR11MB8728.namprd11.prod.outlook.com (2603:10b6:408:218::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.6; Fri, 8 Mar
 2024 11:48:18 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 11:48:18 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/3] scripts/xls_to_doc.py: remove some dead code
Thread-Topic: [PATCH i-g-t 2/3] scripts/xls_to_doc.py: remove some dead code
Thread-Index: AQHacUDFjo3GD00XMEeFUNoqWrvDqLEtumDA
Date: Fri, 8 Mar 2024 11:48:18 +0000
Message-ID: <IA1PR11MB60973F7C283FC04529715B3286272@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240308100933.912014-1-mauro.chehab@linux.intel.com>
 <20240308100933.912014-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20240308100933.912014-3-mauro.chehab@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|LV3PR11MB8728:EE_
x-ms-office365-filtering-correlation-id: 01a1e0e9-db08-4096-bee6-08dc3f65a5b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /TYSHeAjE3q7BeMtcUnTmjqi/yu/PMSgJsAMV7Bz92M6RBxYXWklyPUA6ng0wG33Ouh6/9UEkN5O2tjK/pQmIXAuKX3VdIfA17H/6zaY5VkjopwYjGfb8RbWgBBpO+R70hAfok9Tf916IhMvg/Cb+riD3k/U7W4Oew62iV9Eoz3rOGDM41Ic5qgooHYZrVas3L8A/GMXsxrUxM9uVYk6E+Vrj47ZK6cJ6FyFgDouSOHWF10eNKy/gHQesExlDgYGL/U0uP91ePXXwDzALHez8b5bMj77EC7bSl55yqUCefP2zE/KAZuYm3TI7BfuXbML366jusjVg0tTXjstFN0JzaJ4eRBUQ2k4aw2V834BoRhErX9itPzJJGKOFqmOjNyP92MUFUaydFGUcyuan9cFMYqEDSvpDmI1e5LisE7IXi2nwrBzGNoORg7OzsVpE8adeBdKuXiT1haqmknqF7S9yviMYV2g28YsTOQRJ8QSQpQ+VF5IJ1ASTasZED4Dz5z8jCJNQ5G8JQFUwpAJhPDOVPHVesSS/UEm2upvJzHHCSPkao0T7SZrWPk2GhOytJn/fMezlM08eh679tOzSwzn4PL3wHUf2PUgFoK9zR035Mzyv4sAJoYo2n1lUkUtplGgUbn95TKTXDoI/98hW0VMHZqaKovTkGisnPjdOy2/KOZrZnGel0oDlVthwaV/VoUEGWCwvLuzWrwBxqYIYih3xekAmux5QfpEdWtdUk5EDME=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmtKVmkzd0E3QzdvN2I5NDlaUDJUR3NwNGc3M2hOZ2ZIVGl4elJxUlVqMFdx?=
 =?utf-8?B?c1ZQTjJrVUk1bUVqcEgvdERUQWsxa0V5bFkwSzRuVGE0YW5PQ1lFZllCblZO?=
 =?utf-8?B?TlZDeENzOG9TakpoYS9JWTM2a01IOE5zQnJrL29oN0g5aWtnWUMxY3hsSFMy?=
 =?utf-8?B?eDI5MzVRTGpJZlpJUEQ1S2pXekwyNVZjWk55K3daeTNGMVVBLzFobjVjQVNz?=
 =?utf-8?B?ZEZzbmwxWW9kQWR5SGYxaFdFRCtXWTJrTWg1WDAwV0R0aHlKelU0N2hkZkhU?=
 =?utf-8?B?djlaTUdsR1ZSOE9yY1RxVGRpSjJCT01HZ2VMM1EvUFRPT3BlbHR5TXU3aFh1?=
 =?utf-8?B?N2Z4TXlpalZ1THhMVzgvbklCTUpjZnc1WVlZbHZzVitJNktPa0ZabDBoMkVi?=
 =?utf-8?B?ZURoeXdpdmxyNjRnbWQrWWVNanoyU0FZbVk5a0FlMzUwV0hqUWVBRUhraWhE?=
 =?utf-8?B?WlV1YlFWSXlWRUlMOUhtS1VNVy9uNDg1QjBIM2h3U1RQOFBrczd2eXZiWTVB?=
 =?utf-8?B?WHJpWUl5Q0RYejNVV2U2YmQ2c2xyUlNhRElmQ1VkRW5aalV3eXM1NUJ3cGN2?=
 =?utf-8?B?U0hFazl6bXUySXJOVHIxZld4cXVZOVBxRE5KdjE1OWFFTm9vd0R5QUdjQnB4?=
 =?utf-8?B?aFJXNE1LZnNwQ01Yem50ZVRnQmR1U1V4c1JWUVpwY3d5VWlZVlF1RGQvclk5?=
 =?utf-8?B?Q2lGMDB6cEEva0JwTEpBUFZXdzdQckxHcVhYMGxLQ2NteWRENGoxLzN3S1Js?=
 =?utf-8?B?djh0Kzc0QkdIa3hLcUo5ZnA4cUxIVExsMHhxdjVyY3JIYk0zMXY4dkQrZzlz?=
 =?utf-8?B?QWE1bmYrTlhyaFdxclo5QitsNXpSTUpVL0hzWEo5T2E2aXJ0bGJvaVgrWmtl?=
 =?utf-8?B?Ymd3M1h1bnlxYmYySXdrbmxTNktSSHRhcFpGdTAyUDBUWUxQVzhSdjNDdHJU?=
 =?utf-8?B?ZktBQzJKUmhaTEZNeXFmVGZyem5Rd2g3OHRsdDRoeXRWK2VsUzNDTUd4RmRJ?=
 =?utf-8?B?RjlLWXV0ZXQyMTV3aXM1bHJtSjQ1a0tpQk9LeUFZNDZkaE5vcFROUHZXZHNj?=
 =?utf-8?B?Zlk4TlU3R05sYVN0Q2UrUVEzWDJzbHNmYjIyekZtbFBuWElUZEhFN2hpN29H?=
 =?utf-8?B?a0hjemN0QXluNzNFaFNKVG1lRW1YT2s2WXdVa1lrQ0ZFZlJYdTFMdi9EUXZD?=
 =?utf-8?B?eWlVdjE1Qm5obXF2Zk4wZ3BFY1F0elIwcWt4YnJBSVNlQmVMN21DRlplL1lX?=
 =?utf-8?B?N29pOFB4bWxhcFRxZkp0QUcxM2E4T1M5RUpvT0xYcE9KakFxSWJ6dlJaTTY5?=
 =?utf-8?B?N0RrRWNOUGI5b2lhcHBIWHNVT3pBeEhyZ2ZmQ2dTYzVsRFNyVllhTkNtOHRI?=
 =?utf-8?B?aVozK1NKMjd4YTJFL0wyOUN5MlpYM0d4TGZqc3pra3NscUFBZjVWVXVWMjRk?=
 =?utf-8?B?TjIzY2NCWHpJNDZveCtMWkJtdVU3b3NCd0xWRkZmNzdBMHNFeDR0NkdBcnJa?=
 =?utf-8?B?a25wSXE5T1hkWVlJTERBSVVaZmNqamplZUVBT0dzQlRiQStzNmpRbjdKNnRp?=
 =?utf-8?B?RWRTSUZhMUtJOGlOVU9GVmVjVGxGRlRoSWFuTkR4VUI2cCtRZ0o1Q0w2Q05P?=
 =?utf-8?B?dVZCMTkzdEljUjQ5eWVwRGpHd2RFeEJoYmhTeTJicUI3Wk9lZFB5Q2VremNP?=
 =?utf-8?B?bG5CSlNVMFo0UFp5SXpFaFd4c0NTWGZRWm1wWWd3RFZpeUdtOHQyVjFUR0p4?=
 =?utf-8?B?bTE2UElqWmJRZDJKMWtEMHdqZ1pHaWVzaU9GbW96UTcvNml3RjRnMm9wUnh3?=
 =?utf-8?B?b05OUkdRK1JIdGkxb0N5ODl3dXR5SVJXaFpDblVTR2NmS2E0emozTDVDcERh?=
 =?utf-8?B?RW5tSVVNUlo1Nm81TWIrZXV5eEJNNTU5WkpCZG1GT0FRcTdNMjVSL09pUVI1?=
 =?utf-8?B?eVJXYXc4UVhCNFp3U09jT1JMUUVGZlNIL3c5R1NFNWhLcmVYMGVYUG56QzR5?=
 =?utf-8?B?SnlwamdqeThjWGdobzl6dUV1bTM3RmJIVUo0RnFQTkNiM1ZXUU9VVS9QTkE0?=
 =?utf-8?B?cTR2clp2MVRrTytjM3BHTjdEajZoNm1MbitLQmlXL0hxRjdiYXZyUC9DM0o0?=
 =?utf-8?B?cFJ1UnJvT09heC93Vk9QTFQ2V0c5ZCsrSTNJdHdoT1gyYitqd1AwR21nVGNu?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a1e0e9-db08-4096-bee6-08dc3f65a5b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 11:48:18.3723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Y24JpHw+VUlqMdl8OAplwRt6XYJGoiQCQTHdZd57EgSz7mgcaPtdZZEW2XC9YCNx23Sqw4zVIwq3Plc3m5vY3aDVzonv0vNEZ9NI6HKVbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8728
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

RnJvbTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+DQoNClRoZXJl
IGFyZSB0d28gZnVuY3Rpb25zIHRoZXJlIHRoYXQgYXJlbid0IHVudXNlZC4NCg0KRHJvcCB0aGUg
ZGVhZCBjb2RlLg0KDQpTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVo
YWJAa2VybmVsLm9yZz4NCltLYXRhcnp5bmFdIExHVE0g8J+Yig0KQWNrZWQtYnk6IEthdGFyenlu
YSBQaWVjaWVsc2thIDxrYXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+DQotLS0NCiBzY3Jp
cHRzL3hsc190b19kb2MucHkgfCA0MSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA0MSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L3NjcmlwdHMveGxzX3RvX2RvYy5weSBiL3NjcmlwdHMveGxzX3RvX2RvYy5weSBpbmRleCA2MGFk
ODIyNWQ3MWQuLjkxNDQwYWM2MjkxZiAxMDA3NTUNCi0tLSBhL3NjcmlwdHMveGxzX3RvX2RvYy5w
eQ0KKysrIGIvc2NyaXB0cy94bHNfdG9fZG9jLnB5DQpAQCAtNzAsNDcgKzcwLDYgQEAgY2xhc3Mg
RmlsbFRlc3RzKFRlc3RMaXN0KToNCiANCiAgICAgICAgIGRpY1tmaWVsZF0gPSB2YWx1ZQ0KIA0K
LSAgICBkZWYgcmVhZF90ZXN0bGlzdChzZWxmLCBmaWxlbmFtZSk6DQotICAgICAgICBpZiByZS5t
YXRjaCgiXnhlIiwgZmlsZW5hbWUpOg0KLSAgICAgICAgICAgIHJldHVybg0KLSAgICAgICAgbmFt
ZSA9IHJlLnN1YihyIiguKi8pPyguKilcLnRlc3RsaXN0JCIsIHIiXDIiLCBmaWxlbmFtZSkNCi0g
ICAgICAgIGlmIG5hbWUgPT0gImZhc3QtZmVlZGJhY2siOg0KLSAgICAgICAgICAgIG5hbWUgPSAi
QkFUIg0KLSAgICAgICAgZWxpZiBuYW1lID09ICJldS1kZWJ1Z2dlci1mYXN0LWZlZWRiYWNrIjoN
Ci0gICAgICAgICAgICBuYW1lID0gIkJBVCBldWRlYnVnZ2VyIg0KLSAgICAgICAgZWxpZiBuYW1l
ID09ICJmYXN0LWZlZWRiYWNrLWV4dHJhcy1mb3Itc2ltdWxhdG9yIjoNCi0gICAgICAgICAgICBu
YW1lID0gIkJBVCBzaW11bGF0b3IiDQotICAgICAgICBlbGlmIG5hbWUgPT0gImZhc3QtZmVlZGJh
Y2tfc3VzcGVuZCI6DQotICAgICAgICAgICAgbmFtZSA9ICJzdXNwZW5kIg0KLQ0KLSAgICAgICAg
bmFtZSA9IHJlLnN1YihyImV1LWRlYnVnZ2VyIiwgImV1ZGVidWdnZXIgIiwgbmFtZSkNCi0gICAg
ICAgIG5hbWUgPSByZS5zdWIociJcYmJhdFxiIiwgIkJBVCIsIG5hbWUpDQotICAgICAgICBuYW1l
ID0gcmUuc3ViKHIiWy5fXC1dIiwgIiAiLCBuYW1lKQ0KLQ0KLSAgICAgICAgd2l0aCBvcGVuKGZp
bGVuYW1lLCAncicsIG5ld2xpbmUgPSAnJywgZW5jb2RpbmcgPSAndXRmOCcpIGFzIGZwOg0KLSAg
ICAgICAgICAgIGZvciBsaW5lIGluIGZwOg0KLSAgICAgICAgICAgICAgICBtYXRjaCA9IHJlLm1h
dGNoKHIiXlxzKihpZ3RAW15cc1xAXSspKFxTKilcIz8iLCBsaW5lKQ0KLSAgICAgICAgICAgICAg
ICBpZiBtYXRjaDoNCi0gICAgICAgICAgICAgICAgICAgIHRlc3RuYW1lID0gbWF0Y2guZ3JvdXAo
MSkNCi0gICAgICAgICAgICAgICAgICAgIHN1YnRlc3QgPSBtYXRjaC5ncm91cCgyKQ0KLSAgICAg
ICAgICAgICAgICAgICAgaWYgdGVzdG5hbWUgbm90IGluIHNlbGYudGVzdHM6DQotICAgICAgICAg
ICAgICAgICAgICAgICAgc2VsZi50ZXN0c1t0ZXN0bmFtZV0gPSB7fQ0KLSAgICAgICAgICAgICAg
ICAgICAgICAgIHNlbGYudGVzdHNbdGVzdG5hbWVdWyJwcm9wZXJ0aWVzIl0gPXt9DQotICAgICAg
ICAgICAgICAgICAgICAgICAgc2VsZi50ZXN0c1t0ZXN0bmFtZV1bInN1YnRlc3RzIl0gPSB7fQ0K
LSAgICAgICAgICAgICAgICAgICAgaWYgc3VidGVzdCBub3QgaW4gc2VsZi50ZXN0c1t0ZXN0bmFt
ZV1bInN1YnRlc3RzIl06DQotICAgICAgICAgICAgICAgICAgICAgICAgc2VsZi50ZXN0c1t0ZXN0
bmFtZV1bInN1YnRlc3RzIl1bc3VidGVzdF0gPSB7fQ0KLSAgICAgICAgICAgICAgICAgICAgc2Vs
Zi5hZGRfZmllbGQoc2VsZi50ZXN0c1t0ZXN0bmFtZV1bInN1YnRlc3RzIl1bc3VidGVzdF0sICJS
dW4gdHlwZSIsIG5hbWUpDQotDQotICAgIGRlZiBnZXRfdGVzdGxpc3RzKHNlbGYsIHBhdGgpOg0K
LSAgICAgICAgIyBDcmVhdGUgYSBkaWN0aW9uYXJ5IHdpdGggZmlsZW5hbWVzDQotDQotICAgICAg
ICByZWdleCA9IHJlLmNvbXBpbGUociIuKlwudGVzdGxpc3QiKQ0KLQ0KLSAgICAgICAgZm9yIHJv
b3QsZF9uYW1lcyxmX25hbWVzIGluIG9zLndhbGsocGF0aCk6ICAgICAgICAgICMgcHlsaW50OiBk
aXNhYmxlPVcwNjEyDQotICAgICAgICAgICAgZm9yIGZpbGVuYW1lIGluIGZfbmFtZXM6DQotICAg
ICAgICAgICAgICAgIGlmIHJlZ2V4Lm1hdGNoKGZpbGVuYW1lKToNCi0gICAgICAgICAgICAgICAg
ICAgIHNlbGYucmVhZF90ZXN0bGlzdChvcy5wYXRoLmpvaW4ocm9vdCwgZmlsZW5hbWUpKQ0KLQ0K
ICAgICBkZWYgcHJvY2Vzc19zcHJlYWRzaGVldF9zaGVldChzZWxmLCBzaGVldCk6DQogDQogICAg
ICAgICBjb2x1bW5fbGlzdD1bXQ0KLS0NCjIuNDMuMg0KDQo=
