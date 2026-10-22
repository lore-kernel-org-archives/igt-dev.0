Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206E6606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 12:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R45TOx19
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52FE1125EA;
	Thu, 22 Oct 2026 12:39:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5F910E3C7
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 12:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792672704; x=1824208704;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bi/7v/PwkQGT+ulwZn+ffMEn0dFBKt+1DuSDqPWJB6o=;
 b=R45TOx19JBoIt0j/O0acw+1cXioXL6D9TORUT2VJWw2uc+2wJHzYQBZv
 lAxu8ibn1y3pIzz61yIKhgyXsqgU0NyXQSWvcixXy65I4tW0NCuOmTrhA
 MOMaO9CH7apfiowEdmOz7GJneplty5wij5w7kHKf1dv0ArSJcwbwMe8jc
 VmeV7J8XaJk9YxYsUtPTnlaxLQawa7IPutwwGTc0PKnvaW+1TBl4kETxV
 Yf/Uk8n4MbG0zGj2gkRJ5tsPQx+aocNlMRtYHAgKfO6Vexi4wIx1IWiy9
 AldVT1U0LJcGMaw9RdNNdzWQNbpb5XYiilwKyTRURKd8XqwzvtGd7bvtq g==;
X-CSE-ConnectionGUID: BWsfavzWSlqusrVJqZxXxA==
X-CSE-MsgGUID: rCRsAylqQ9S/vgHuL4jtbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1318190"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1318190"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:38:23 -0700
X-CSE-ConnectionGUID: SY1KWTyOTTibwa3BYParGw==
X-CSE-MsgGUID: YAjQsgVpRbuWI/MUQoEf4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3412904"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:38:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:38:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 05:38:22 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:38:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J540ngjbQoByUhMFQ4BPgQALML4i5M+dhR9l2RNL4qOMDkHGu/1LI7lxm99UKIw6GpbTv6mxHC5HfFLT3ATqnPYxxUVzpvFw8M5aLxZHQKWo5D02MFSWs4YhHK43nEaab9DrhzaZEEBWSODbaY6twVR8Ch3ANXNzAgCxNIvEg1cmTjGTQZS/zsMmc3tm4jLgiJ/ypf7IjyoLOJIyx8x/R5WY4bcSbui8MAN7YqvAbsjyoAN7bz8qzAQSxrglJo7d2+v2RcXHkoNY+eQm2ZONll3mZBEUm/t6c/BIXuj9HCTLQ4EneZTi30nhB1PpjV7g2vLVJlM4oT8TCHIMpgeURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bi/7v/PwkQGT+ulwZn+ffMEn0dFBKt+1DuSDqPWJB6o=;
 b=Fq27MtZ3IHpx7lbHnHOsFhOqqFokplXEUsVYoE9m45I0cbsFs9uOjQ0DMw3EByKUaoXY3SaY/rpWjmzR7BkO8fVVeTHJiX+UixVmFoW5Y5PG1AP32X2I7CnLjS9RlYZBt7i2HWtiX9Ew0FXswFu54q8+/Hex/cxME6l29YEBJT+hMzXJ6rLIE7IdkzWMjKifCb16Ffx8SEWuFL07an8k0pE7OMlt5oY0omxEdSPN/cSExuXu1G3gwisxyYmi1YofGUtKyYTNoJFkr5kAl0+Ndbvi1JYSknjvFKTnXi8tLMGilfbwJVAZ0pis3ZTd3IrLxYl33/gyvzFVuvhQ5m+ySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by SJ5PPF8DE294191.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::843) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 12:38:20 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 12:38:20 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>
Subject: RE: [PATCH i-g-t 0/2] Support PMT for BMG and CRI devices
Thread-Topic: [PATCH i-g-t 0/2] Support PMT for BMG and CRI devices
Thread-Index: AQHdW/Y5ZG/H8IdDXkmjG8pBHVlzKLcIhCfggAEGs4CAAABLYA==
Date: Thu, 22 Oct 2026 12:38:19 +0000
Message-ID: <CH3PR11MB0461498949A62A5DC75DCD1140C1652@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261014160516.3542311-4-michael.j.ruhl@intel.com>
 <CH3PR11MB04614921246BC82520BDD5AAD6C1662@CH3PR11MB046149.namprd11.prod.outlook.com>
 <atoCV6hhnFIB_fiq@intel.com>
In-Reply-To: <atoCV6hhnFIB_fiq@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|SJ5PPF8DE294191:EE_
x-ms-office365-filtering-correlation-id: 6ae394f7-efb2-4c18-26ab-08df30395a82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|261021121427099003|56012099006|10067099003|4143699003|11063799006|261009223027099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: pbwRP42y1r/r1UM5U0R/+aOGItmYI2HD93rugScqKD7nNKAe4fEjk3jfJV0U6+AGX7QbrRHhFcIBAu6IYXpjjNOyn8quaAe857ziEF3Jcg5WDCXWvhAEFmWUAVJs6YwkityeFjIHZ3wmUtK9tcx0wcMXxBU87rHeG26U0gQqNqFwH4nw6gMd1mK90I8G+X81Yea8LdLlq09+eFBDXUsa3SxY20a8vgDKYGk9kLd9RZwiI68YAt0bZgHEHm7/i3zTZyflBhxuB7vYLq2UgBbIDfXUZ8RkrOAyGRERogovXhir/0CV8B2FS5RJ3Jvpu0GnI/Jf3YjLgPnDHo4YbIyYBFdlHmK4uzomDGnfZcNaA81FXLKB0uhiaUNX4bIo73E7QfODKZ08bjJbf3TIGuPhQjYVVOjVRg8UylYL7y8vi5m8y28zKOuobWP2L1Wu8Aui/7RLXdoTFhlS3T53Z+W4OJjmXaJ84dgBQj11GLUwNdgsXNvTrZrXDI/LL2vQnPklOLGuG8KS4jP1MjZLqYXZhR+LtzNXRXnZGEAppWKqU9LY31Vpkt/40wFg+9xaeRijbnMLmObRyvcZTO+X62jlvUqYXTMUNnNm6OSECtJGGQvlFjxRkOp6CeINs0I9h5I/6E7mnynQegY7Pn6SQRhAW0N+R/SNWg3elg/mrhscfPI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB046149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(261021121427099003)(56012099006)(10067099003)(4143699003)(11063799006)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGJhb0lBcG5Wa1FYMGtzREE0bW5uQXBPNnVKZm5JK3c0QUhKZUI3OUI4MUFH?=
 =?utf-8?B?S0ZwR0pKZ01TSTdvL21pSkNoYjNlbGV0eXVQY0gwYkZ1WEhKZXR6WElPaTB6?=
 =?utf-8?B?QXFsZEFhcm94MWRRMTBlR3dkMkJLa0kwZzdqMTZBKzNjemM4RTJlK2hjM0M5?=
 =?utf-8?B?VkhHd3RYampPWmtLVFF0QkU5UGZZckkweDJpNkJ4cWVGWVZJNHp2Z3Azc201?=
 =?utf-8?B?QjBlU213YXIwYlNHSjIxcFR3VkVaTDJxSHd0V1YvRzhYMWFZTForTGtnU0do?=
 =?utf-8?B?U0NnNGpuV0c1cU1RWkJUWnVJb1Izb0hMYXp1Y2xDcWlFUlpTTzJ2YzdlN0pm?=
 =?utf-8?B?V0c3WmNoTndjeTB5NWpJQlZHRmw4K3Nmc1hxQ3J4MCswZDRHWTh5NkxPRXN4?=
 =?utf-8?B?VDRnbm5XS2ZER0NURVdxRStZNkcrYnQ3Um54Q2NCc3VDWE01YmNOZUw2Z3hT?=
 =?utf-8?B?UHNUUkVVNkRmVVg0cUNmQUYvZnRZY1NZbXNyYUtuYjhWVmUzOG52bHBNYmV3?=
 =?utf-8?B?QkR1dm1zZ1ZPb2p4WlN5MldOU3k4RTllZ3UwcHV6dGp6Z3FiSzhzQkE2ajh0?=
 =?utf-8?B?OVA3V01kRXZjRGtPNm1JbzJvRkpyNUloSUFyN0hGNnJZaWdGdXlJcUV2MUVH?=
 =?utf-8?B?MjFYWUtuRFpkM0tONkxHczlVaTkvM0Z3K3ZkQ3ZXdlEwUktONHJpVFgzTmM5?=
 =?utf-8?B?WXFPYS82eStIc3dYc0F0VkNSOVMyeVFTUG9ST08xYlMraEpXR0MzSlpkWG1n?=
 =?utf-8?B?OEZCQ3o1YUhMQ1FyRGQraGc3aGx0RTFuU3pUSnBiMlg4TTlKbWJWQXJHNnBY?=
 =?utf-8?B?M1Y1KzZ1RkJhdndyYmZsbFd1OWFkSmdjbklxWmkvbGpKT2ppWkMzbGhZMlZh?=
 =?utf-8?B?eWFvS2ZsTHdoZHF0Y3ZJVDR3TEM2aVJXMGhSU3R2aCtHTTV5d2F5TFFtR3Ur?=
 =?utf-8?B?bGRiVWNOcDdqaVhnemtEWGJWNzJiWkgzTG9oTUpBblZ6bU04a0xWc0pBOVZL?=
 =?utf-8?B?c1p4SkVDWTZaRDZnczlPcFp2ZWlwc0UwMHdlV3FnQ2NRZVVqc0c3QVllUGpR?=
 =?utf-8?B?Z3QvVlVLYlNYa1RScFZFVE5FRDhOZGszL0Z2YjdyV2UzYWhRaDg5S1FZcUVt?=
 =?utf-8?B?YTFZVXhSUEpzWExWQWRDbUFSSW1NL1ZWWXl5VnBpVmdjcjJSc09KeW1TMDVR?=
 =?utf-8?B?RHNMWk0xMG0vbG1CMnl6NXFuZmhEa1dPSGY5b3pyNlcvS0ZIUDVadWo4UWZL?=
 =?utf-8?B?cFRMSm81SU0yVnJlZU9id2VlR295NlZHNXRmZHk4YXlBZ3cyOXo4dXNyRkhm?=
 =?utf-8?B?ZE5ZdVdwa3VLSUhodk5oTm9NOVB3dFpaK0hWU3RqL20xSEdQWGdYdDNFNito?=
 =?utf-8?B?cUxZRERWYUs4cGtqMmY0Tnl1czl3Zk1iR1JaclBEM3A4TDViZm1oUkdpNGJ2?=
 =?utf-8?B?K2xJWGdMRlRqeUJHVkdmUEJ6WjFreXAzbHQ0YkdaUDNhak44ZGVVaFVJYlVi?=
 =?utf-8?B?QWZnZm95SEJrU0RzaFRlV0JVdmJIQy85enhkcFBCeERkR09yMUpPUjNoc1dQ?=
 =?utf-8?B?RlF2N2ZYbWxFMXJML3VpOU5YeVErSUxGazloZitNdFlraEVXMTVqVDcrR2ow?=
 =?utf-8?B?YUNreHErWEsyYVVSUTl5Y2s2VWh1UXJ6UUt1cU9zcmE0VmZqVlZoQnV2dzRZ?=
 =?utf-8?B?bjZVbVk1dGk5YWt4bXV4OFVoejBJSDVHQmtMM1dVOG0vTVJiQ25ncDFKUGV3?=
 =?utf-8?B?WnBnZmFXQkQyZlpJSDVOUVZmZm1ZN09kYWRLSU1QNXVhUVo0ZXhOd2RVWjVC?=
 =?utf-8?B?NFgwS3l0N2s5NHB4WVVTakd5ODUyalhJd0RjcjROMmlackR0K1JJcSsvL2dj?=
 =?utf-8?B?RWFtNCtQemVvS0luK2dMVUpxcU1ySVZBemNRSStQaWIzaGk4WW0zamV3NjhY?=
 =?utf-8?B?SHhBbk5udnpLR0RjcW1SUHJuUkk0QVNVQlpaZ1pBUndZYXdaWGRPcUdDbnB0?=
 =?utf-8?B?bW1sd3RVR0xja1UvbllCdjkwWitnNFNxMFhLbmVvdExFTi90MHh2U0R1Qkxi?=
 =?utf-8?B?VDVLZDlpaXU3cWxoNUlkSGMwaWVnQWFIcDZyL3ZhZUFOTDcyY3VKYThNcUxs?=
 =?utf-8?B?dVlNemt3UTkxM3FQY3luaWdCNEU1SzVua2JMMkxFYm40U2RlRmgvMnNHdndx?=
 =?utf-8?B?V0tlVlF5OFhsbFJxbTFVNGhBNWhTVDZxVEhYS2R4K3duYk1JdjJNK1BRSHhv?=
 =?utf-8?B?SlM1ODNnL3BnUHBWdnNOMXVuU2k4eGR1VkxiYitpR24rWVlYckJpOXU1VThn?=
 =?utf-8?B?NCtib3NGclVZYUppQThmSm9MNHpYTndWd3JkNjBvSzlVRzBaVU02QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zIrIORpfl5OhHb6hYG4P1+o0PNMwD+/TT4WK5Ijs7H3B7IZ63P89GgURL3XO3evtAX4JIynR3pE8p1SK1iBw2lhL0v+6VymmSuSE/WxZtfoWrPY1o8sxbM64Zbflx8ospqmGObWXngIjmyDVBb930J8XzlMfbfZOHrAP5YZPO8ldQQPzf5/TccsS0bodPbPCf2XgsVZEYZXXVRnUlYRvboL/ghRtZixU24jLvhtzHRFM+kGyFEebmK77UHzsMLlO+97wBzAuHv8ngQqje4sccm4oD9Rqn79GKz0SsWR8vWXwA2xufLOxpX2rnsk1I54EwdALhMnPXBMy9aeKwBAjzw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae394f7-efb2-4c18-26ab-08df30395a82
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 12:38:19.9487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8w63d/n8ytGu4QSIonrsrRaNKkh/YBvIGf3UAUs9CV/0/IM3WJznKoeNy5kby94a7NmQhJJAzrKpeONzFCt/5PSF6qgSqov51F3i5mE+VS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8DE294191
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogVml2aSwgUm9kcmlnbyA8cm9kcmln
by52aXZpQGludGVsLmNvbT4NCj5TZW50OiBUaHVyc2RheSwgT2N0b2JlciAyMiwgMjAyNiA4OjMy
IEFNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KPkNj
OiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgU2NhcmJyb3VnaCwgRnJhbmsNCj48ZnJh
bmsuc2NhcmJyb3VnaEBpbnRlbC5jb20+OyBkYXZpZC5lLmJveEBsaW51eC5pbnRlbC5jb20NCj5T
dWJqZWN0OiBSZTogW1BBVENIIGktZy10IDAvMl0gU3VwcG9ydCBQTVQgZm9yIEJNRyBhbmQgQ1JJ
IGRldmljZXMNCj4NCj5PbiBXZWQsIE9jdCAyMSwgMjAyNiBhdCAwODo1Mjo0NVBNICswMDAwLCBS
dWhsLCBNaWNoYWVsIEogd3JvdGU6DQo+PiBQaW5nPw0KPj4NCj4+IE5vdCBzdXJlIHdoYXQgdGhl
IHNlcXVlbmNpbmcgaXMgaGVyZS4uLg0KPj4NCj4+IElzIHRoaXMgSUdUIHJlYXNvbmFibGU/DQo+
DQo+d2UgZGVmaW5pdGVseSBuZWVkIHRvIGluY2x1ZGUgdGhlc2UgdGVzdHMuDQo+VGhlIGJpZ2dl
c3QgcHJvYmxlbSBJIHNlZSBpcyB0aGUgY3Jhc2hsb2cgb25lLiBCZWNhdXNlIGl0IHB1dHMgdXMg
aW4gYSB1bmRlZmluZWQNCj5zdGF0ZSB1bnRpbCB0aGUgY29sZCBib290IGFuZCB3ZSBkb24ndCBz
YXZlIHRoZSBwYXJ0LCB0aGF0IHdpbGwgbGlrZWx5IGltcGFjdA0KPnRoZSBmdWxsIENJLi4uIChp
ZiB3ZSBoYXZlIGJtZyBpbiBzaGFyZHMpDQo+DQo+T3Igd2UgZmluZCBhIHdheSB0byByZXN0b3Jl
IHRvIGEgY2xlYW4gc3RhdGUgYWZ0ZXJ3b3JkcyBvciB3ZSBmaW5kIGEgd2F5DQo+dG8gb25seSBy
dW4gdGhpcyBtYW51YWxseSBhbmQgbm90IG9uIHRoZSBwbXQtYm1nLWFsbC4uLg0KDQpIaSBSb2Ry
aWdvLA0KDQpDdXJyZW50bHkgSSBhbSBsaW1pdGluZyB0aGUgdGVzdCB0byB2ZXJpZnkgdGhhdCB0
aGUgZXhwZWN0ZWQgc3lzZnMgbm9kZXMgYXJlIHRoZXJlLCBhbmQgdGhlbg0KSSBhY2Nlc3MgbW9z
dCBvZiB0aGVtIHRvIHZlcmlmeSB0aGF0IHRoZXkgcmVzcG9uc2UgY29ycmVjdGx5Lg0KDQpUaGUg
cmVzZXQgaXNzdWUgKGFmdGVyIHRyaWdnZXJpbmcgYSBDcmFzaGxvZykgaXMgc3RpbGwgYmVpbmcg
dW5kZXJzdG9vZC4gIFVudGlsIHRoYXQgaXMgY29tcGxldGUsDQpJIGRvIG5vdCB0aGluayB0aGF0
IGVuYWJsaW5nIHRoZSB0cmlnZ2VyIHRlc3QgaXMgdXNlZnVsLg0KDQpJIGFsc28gdGhpbmsgdGhh
dCB0aGUgQk1HIHVzYWdlIGlzIGRpZmZlcmVudCBmcm9tIHRoZSBDUkksIHNvIHdlIG1heSwgZXZl
bnR1YWxseSwgZW5hYmxlIHRoZSBDUkkNCnVzYWdlLCBidXQgbm90IHRoZSBCTUcuLi4NCg0KT25l
IG90aGVyIG5vdGUsIGFjY2Vzc2luZyB0aGUgQ3Jhc2hsb2cgYmluYXJ5IGdpdmVzIHlvdSBhbiBv
b3BzLg0KDQpUaGlzIGlzIGZpeGVkIHdpdGggbXkgQ1JJIFBNVCBwYXRjaCBzZXQ6DQoNCmh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC83NTk5OTkvP3Nlcmllcz0xNjA3MTcm
cmV2PTE0DQoNClNvLCBJIHdpbGwgYmUgdmVyeSBoYXBweSB3aGVuIHRob3NlIHBhdGNoZXMgYXJl
IG1lcmdlZC4g8J+Yig0KDQpNDQoNCj4+DQo+PiBUaGFua3MsDQo+Pg0KPj4gTWlrZQ0KPj4NCj4+
DQo+PiA+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+ID5Gcm9tOiBpZ3QtZGV2IDxpZ3Qt
ZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj5NaWNoYWVs
IEouDQo+PiA+UnVobA0KPj4gPlNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAxNCwgMjAyNiAxMjow
NSBQTQ0KPj4gPlRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgU2NhcmJyb3VnaCwg
RnJhbmsNCj4+ID48ZnJhbmsuc2NhcmJyb3VnaEBpbnRlbC5jb20+OyBkYXZpZC5lLmJveEBsaW51
eC5pbnRlbC5jb20NCj4+ID5TdWJqZWN0OiBbUEFUQ0ggaS1nLXQgMC8yXSBTdXBwb3J0IFBNVCBm
b3IgQk1HIGFuZCBDUkkgZGV2aWNlcw0KPj4gPg0KPj4gPkJNRyBhbmQgQ1JJIGRldmljZXMgaGF2
ZSBQTVQgZnVuY3Rpb25hbGl0eS4NCj4+ID4NCj4+ID5Qcm92aWRlIHRlc3RzIHRvIGV4ZXJjaXNl
IHRoYXQgZnVuY3Rpb25hbGl0eS4NCj4+ID4NCj4+ID5NaWNoYWVsIEouIFJ1aGwgKDIpOg0KPj4g
PiAgdGVzdC9pbnRlbC94ZV9wbXQ6IEFkZCB0ZXN0aW5nIGZvciBCTUcgUE1UIGZlYXR1cmVzDQo+
PiA+ICB0ZXN0L2ludGVsL3hlX3BtdDogU3VwcG9ydCBDUkkgUE1UDQo+PiA+DQo+PiA+IHRlc3Rz
L2ludGVsL3hlX3BtdC5jIHwgNjQ1DQo+PiA+KysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPj4gPiB0ZXN0cy9tZXNvbi5idWlsZCAgICB8ICAgMSArDQo+PiA+IDIg
ZmlsZXMgY2hhbmdlZCwgNjQ2IGluc2VydGlvbnMoKykNCj4+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0
IHRlc3RzL2ludGVsL3hlX3BtdC5jDQo+PiA+DQo+PiA+LS0NCj4+ID4yLjQzLjANCj4+DQo=
