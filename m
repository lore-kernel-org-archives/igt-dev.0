Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC3FC54E58
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F0910EDEA;
	Tue, 26 Mar 2024 09:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqZDzE9g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9C610EDEA
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711444327; x=1742980327;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RI1EdC64oXG1QxxuPgTN6D+vwOq3EQSYQEwdrd01oOc=;
 b=CqZDzE9gO8kXpki0opU2SPIxT5UnelNfAanZ7ymnckKv2e+ApYseLGuI
 h1Tb3KsTTEcy6niiLYw8o8imVu2mxyXlgqfjoL0xjr5jeX9ONV9yYRR2+
 n7+/Hf+4ed/zVxNcMH3YoGBOmBVXn+m3DqiwemTVGcdNf08IHwDVIMIYQ
 H5JmMvy/oFtrK4vmgdC1zzMtDSfY7/0ZJnwjLijmsULQyXWU17HWFw7wC
 iPt4+rA2gL7ypvPK7EtktnxV7CDyzEXz9K7n1+ZR3vls8Nv5IbbL2XAO4
 8CkDUU11J9xe7VucKUYVZBUmzyH0rrFXlcchxSdnm+LDlsQ6Tr5HWZkmJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6670639"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6670639"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:12:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="53360441"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 02:12:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 02:12:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 02:12:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 02:12:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdpvO2ebUoDGO2dRD6Fi6VX5EctQ+9NumNk93XLyrePkhSSVIdcpDSADsab3gbBYo4C0JTMwK7ef6lrLXP8OaXxC82L2fjzFNsGfYAD344JOx4KPgHHMyz+EP7lZPkywLeL0VJhTHhlTj+F9uvhEBdyVTWGKvglAzWyb6TxoiQWTpuFPjbfcnYcnAdjl/QoEOZz1HA85J36Y5WLirNmm26J4ayFA/H0GiJRD9cfLowCkIdPDXph24LVRTaVFYF2VGgNsZLN94Dmz1qA/OM2IKlpY68IrdJ3Hd0JgvqFWdH0OOeDfAwWQbTQIdpGupxhtk8ZxbsLFjJSY+64Ic8y8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RI1EdC64oXG1QxxuPgTN6D+vwOq3EQSYQEwdrd01oOc=;
 b=RA8NBA9coLzHSO2lbn3KjlJL7S6vMpQXZ31/3bo/cRmaV35Y0tH/Bfpaq9gSLHH/OU5adQ+aiYmgtJRvg5Os9E1o2ARK7zUuprxPAk8cLAB8Yga7ESQnHM33YfzT+pTXsVaQvBSc2Miy9UZTO0x5onXubFrcJJkCbk2fh3hB6ZcgaI8/HR8/bpKk/pEdtcT5R+CE4YR7XKpHy6Ohurn/BXf2H38yoJ1rw+niN08+wlwY2CA93Vcftz1Yqh7sYXxHMddcgEHmyBls5RL5oI4wtgORisnjiZt4/xDWOwrIYcGXrChPpb5nlQK/hF72rSL3h0o0ua3+22lhl6uTWAI/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by CO1PR11MB4788.namprd11.prod.outlook.com (2603:10b6:303:97::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 09:12:03 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 09:12:03 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, "Chauhan, Aditya"
 <aditya.chauhan@intel.com>, "Girotra, Himanshu" <himanshu.girotra@intel.com>
Subject: RE: [PATCH i-g-t 10/12] tests/intel: Move xe_waitfence test to
 Synchronization sub-category
Thread-Topic: [PATCH i-g-t 10/12] tests/intel: Move xe_waitfence test to
 Synchronization sub-category
Thread-Index: AQHafFaBbV/f5cKmz0+XCJxQirwNsrFIlauAgAEstLA=
Date: Tue, 26 Mar 2024 09:12:03 +0000
Message-ID: <IA1PR11MB609799084788ED56A962646086352@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
 <20240322124108.1825345-12-katarzyna.piecielska@intel.com>
 <20240325151447.kaelubzmgslzyolo@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240325151447.kaelubzmgslzyolo@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|CO1PR11MB4788:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fnK0My3QutO8NQcIpKRmy/rWHaKxEbuG4LR40FTd7AqGKck6Y0b30Ub2HF8NVbZDso7QOm7e6uylBygVF65g6U/SjNViQr9PqUwn60UOb/sSZa0qpZ6ObBnPwvwInTnhdK5b3J6ODxm3iaS835oQONaqAsrFhadtBkVCep7HlcuIb3poqCKG0xdfyo1AJoAHu2nVM35lZGaBErCbN7eMMcpAyIYEEXCJemaQR25LxRXfsnbABEmHhvnDP82y2yLt8RT5c8Tz2CiYMRAsMtyIRchU3kiy0K7mYkYTdesybdN+amUDOxDzateuuEnf5fz4OYk+FoZIYIrXSYrdnwAP7E72RA2SM2C12ghhx/1cSfl4SMIylBG5dCnPfnAdEktJOoXuwwLhu5YjZD46Pmbe5u+bBP1LF0+b2P8mDlX6jrCqdyYT12T8Wk40RgXZUs6X51F38oVOVi20T4W2sS5RBDztuWWuvpw3YhWcJOx8xx1oWOfsDxD2bczhACYOVa7Vr8xPfSWd575iP0vL5CLGT2pepEWZp9292S+FYLhHN50phRIrt5K6B0wT+3BheDVat7QSTgyA6SRF7NKKyZPtnfwW0p8yNCTB6sOW5Fp3f5ujV73ISfWAl867OBpB0W6pKypqEfJPvftQT7BMdlkmolfjhgAR1ymzvFXRmMBVk0o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sk5kV0RrdC93cE9mbjVBd3ZhM3kydU1PS1dKSVJvaG1qR3VsVkZLaEpOaWVL?=
 =?utf-8?B?ODZGcVZvdUd5R3JtOUhBU1dBdDVxTVc1aFlFaUpaNlJ0SmY4Sk1xMDIzVDZu?=
 =?utf-8?B?LzJaSFYrVHBlTlZBKzlZb1FPMXo1SUFiZ3lPcEUxa2NjZlpuUGZzbENBcVJv?=
 =?utf-8?B?RHJEWEROUGppZU1SUTR3dmhqN21MdHlLT1RsMS8wKzZHZTVvcE1BVTNGaG9X?=
 =?utf-8?B?V1JSekc2QmNxQXN1UUFYdDgwTm51dnJNOS9CTStXOWY4Mk9IZForZCt1U1BR?=
 =?utf-8?B?bzQ1U2R3d2YzSHpBaksxTDBQL0prekpMd3lzd0x4dks1alIrYTNNaXR1WWEz?=
 =?utf-8?B?blhkbndpcFpSbXAvMGZZb0l2Z3lBamIrTEh2MEhobWpSWHJtamlxOGJkc2hR?=
 =?utf-8?B?bFNqODE1RE85NVNyUzlNQWVDTm1BTXhmaTBmbkdmMmZ4N3pZTkl2R1daSlAx?=
 =?utf-8?B?N0YvVyt3eElIZFRNTE5EbHkrSWpxRDNvckQwb0Z1MW5yWWNBempJd29qYVZU?=
 =?utf-8?B?bzNvN0QzbGtMaTAzOTJZdnJiZElhL0RKNUcwZ0tBcmRvWVloNWNxOG85cmhq?=
 =?utf-8?B?VXYzZmdIQ3prMXlWVUh1L0dVZ1U5NzZkVTY4aXBXR2tvWTIzeUgvYTNLeEtN?=
 =?utf-8?B?dzd4bFdjV3c4MndJR0ZLWk5tRmlpZlJhL1BoU0oxRmtFZnJXd1ZicHg3blFE?=
 =?utf-8?B?TEl3T1ZqeFlyQXAvTSszdnlVbit6djZZTklyZlVDbHRPTTJIMHZDa2ZJanNX?=
 =?utf-8?B?YzMwV1BWOHl6aFBxOURPaHBVQmRQeFdySGJLYkpGY0p0SDJnWFJSdW9tTFk1?=
 =?utf-8?B?d01xeEVxNlVHNU1GTlhTbUpNL1UxZTR6ajdnR0NFaVhSdTdHTmIvU2drMzlG?=
 =?utf-8?B?MXp0QXlUZ3d5YUJhc1B4a2daWHpEVElJMnU5RTg2T2NVSWU0SGZJM0N2WmY2?=
 =?utf-8?B?SkkwNng3dzBMOUNCQlhzODdpZm50TCszMG03Z21iTVdFeFFvaDQ4ZlBHemcw?=
 =?utf-8?B?UXdJUklUQ1crditIMnRZTldoczV3OEFwejZSOWdNUWhjaVA5YlVzZ2pCRHQ1?=
 =?utf-8?B?U3A4ekNkNjMxbkc2Ulk4YmE4OVU1MGVZcTFMczljNXNzcCtWNmh5WUxqQWZ6?=
 =?utf-8?B?NlFUUmFyc2pLbWx0Z0UzWWo2WFptakx4NS81bzFwcmZNYWNqaXJDTzB2VEp6?=
 =?utf-8?B?ckRXNHA1c3NickdwK3RjM1E4eGlZbG1FRlpCL2pBbGw4L1ZMV2wva3Z5RTd1?=
 =?utf-8?B?MDViYlp1MkxRQ1A4c0lObmtFR1diekJlR3BLVU53Rm9PSHhRdERpZU5ZWG05?=
 =?utf-8?B?TGNrb3JUdjhXRlBndXR2TDgyd3JIbW1mbm1LNDVVWE8vUDVNTDVVWkdxOFdL?=
 =?utf-8?B?L3hwV1VHMVJ5Z1VHSjNSMll3ek5UdW5OOUVqOWVFWUVuc0lEeGZGVmUxblBP?=
 =?utf-8?B?ZWo3c3pSYkR4d0Y0aG9nb3d2am0vU1BwZnJ4YjVaQ3plUmYvYVVzUElaV0pZ?=
 =?utf-8?B?NWR1VUd5b2l6RUlHeExEdVlTYkZHWlRHbFBlUVBGZVpFUXdqT2JRUjY4c1cw?=
 =?utf-8?B?bGpxSkZtWFlvcmFXRUdYNzJ3VUtob2pxWjVPSzBWOGcxRDljTFJGZElCVnI4?=
 =?utf-8?B?R21IY3ExTy9XTFhMMm1aamJKV080bXI5SWdMVzRWS0dDcCtkQzJZMGl0cGpv?=
 =?utf-8?B?UU5OaThWOGhIdkhCaU8zcFlvem94L2pIV1JMd0hheXJ6cU1uZ1ZRL1lkYVAz?=
 =?utf-8?B?QXRseDh3N3BvSksrSEtLZStXbWp6TE1lVDBtMGovZlNEbnZlRWxNRzBTcERa?=
 =?utf-8?B?UXFhaWRldFgxS3ZEN1pKKzNwa0I2RmQwM2xGTW8wMWFsSENPa1hvOE9uSGU2?=
 =?utf-8?B?bDhHRnM2d1pLQU9RcTg0OWhFbnJnd3pqMUZuUkhmUTY1K21UTUZXekZyai9u?=
 =?utf-8?B?MXFzU1JFb0RSc2RFeUFsbnI4T0hMZU5HT1JFcGxBbXh2K1N2VGJjOTBZbjNa?=
 =?utf-8?B?Rlh4N2h2ZkxtWUlCYmI5NW9qcEtQUkc1dTNOT3A0L2l4d21SelpZTzVKV3NJ?=
 =?utf-8?B?QmV1Wll1VWkwaXNGTEZsL2tRQzFHdDlHOFdtbmp1R3BkdWJNYWZRUTgxb3d2?=
 =?utf-8?B?WWpVNlZUTlJPbTl5QkxCSUVwQUdEbnZqZG4wc0t4dmt2VFhHL0MrbUZlSDFU?=
 =?utf-8?B?Rnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd5708f-978e-4213-0e4c-08dc4d74cd25
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 09:12:03.2553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EazbMHgkOcUPJXMW2HUTvMOJB0RDLybQnoY/5cyQyYUd6tKANLzxBLNjMzd59v029RUhXMSLobb+uXyWjOtUSwdIVPFGEI9i90PQBxPGOrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4788
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

SGkgS2F0YXJ6eW5hLA0KT24gMjAyNC0wMy0yMiBhdCAxMjo0MTowNiArMDAwMCwgS2F0YXJ6eW5h
IFBpZWNpZWxza2Egd3JvdGU6DQo+IExldCdzIG1vdmUgeGVfd2FpdGZlbmNlIHRlc3QgdG8gU3lu
Y2hyb25pemF0aW9uIHN1Yi1jYXRlZ29yeSB0byBhbGlnbiANCj4gd2l0aCBpOTE1IHRlc3QgZG9j
dW1lbnRhdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEthdGFyenluYSBQaWVjaWVsc2thIDxr
YXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+DQo+IENjOiBLYW1pbCBLb25pZWN6bnkgPGth
bWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBNYXVybyBDYXJ2YWxobyBDaGVo
YWIgPG1hdXJvLmNoZWhhYkBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBBZGl0eWEgQ2hhdWhhbiA8
YWRpdHlhLmNoYXVoYW5AaW50ZWwuY29tPg0KPiBDYzogR2lyb3RyYSBIaW1hbnNodSA8aGltYW5z
aHUuZ2lyb3RyYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfd2FpdGZlbmNl
LmMgfCAzICstLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3dhaXRmZW5jZS5jIGIvdGVz
dHMvaW50ZWwveGVfd2FpdGZlbmNlLmMgDQo+IGluZGV4IDVhNjcxNDhlZC4uMDcxZTY3YmQ2IDEw
MDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV93YWl0ZmVuY2UuYw0KPiArKysgYi90ZXN0cy9p
bnRlbC94ZV93YWl0ZmVuY2UuYw0KPiBAQCAtMTYsNyArMTYsNyBAQA0KPiAgLyoqDQo+ICAgKiBU
RVNUOiBDaGVjayBpZiB3YWl0ZmVuY2VzIHdvcmsNCj4gICAqIENhdGVnb3J5OiBTb2Z0d2FyZSBi
dWlsZGluZyBibG9jaw0KPiAtICogU3ViLWNhdGVnb3J5OiB3YWl0ZmVuY2UNCj4gKyAqIFN1Yi1j
YXRlZ29yeTogU3luY2hyb25pemF0aW8NCg0KVGhlcmUgYXJlIGNvbmZsaWN0cyB3aXRoIEZ1bmN0
aW9uYWxpdHkgZmllbGRzIGhlcmU6DQoNCm4uRnVuY3Rpb25hbGl0eTouLi90ZXN0cy9pbnRlbC9n
ZW1fZmVuY2VkX2V4ZWNfdGhyYXNoLmM6ICogRnVuY3Rpb25hbGl0eTogc3luY2hyb25pemF0aW9u
DQpuLkZ1bmN0aW9uYWxpdHk6Li4vdGVzdHMvaW50ZWwvZ2VtX2ZlbmNlX3RocmFzaC5jOiAqIEZ1
bmN0aW9uYWxpdHk6IHN5bmNocm9uaXphdGlvbg0Kbi5GdW5jdGlvbmFsaXR5Oi4uL3Rlc3RzL2lu
dGVsL2dlbV9mZW5jZV91cGxvYWQuYzogKiBGdW5jdGlvbmFsaXR5OiBzeW5jaHJvbml6YXRpb24N
Cm4uRnVuY3Rpb25hbGl0eTouLi90ZXN0cy9pbnRlbC9rbXNfZmVuY2VfcGluX2xlYWsuYzogKiBG
dW5jdGlvbmFsaXR5OiBrbXNfY29yZSwgc3luY2hyb25pemF0aW9uDQoNCmJ1dCBtYXliZSB0aGlz
IHNob3VsZCBiZSBzb2x2ZWQgaW4gc2VwYXJhdGUgcGF0Y2guDQpBY2tlZC1ieTogS2FtaWwgS29u
aWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KDQpbS2F0YXJ6eW5hXSBU
aG9zZSB0ZXN0cyBiZWxvbmcgdG8gQ01EIHN1Ym1pc3Npb24gc3ViLWNhdGVnb3J5LCBzbyB0aGVy
ZSBzaG91bGQgYmUgbm8gY29uZmxpY3QuDQpLYXNpYQ0KPiAgICogRnVuY3Rpb25hbGl0eTogd2Fp
dGZlbmNlDQo+ICAgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCj4gICAqIERl
c2NyaXB0aW9uOiBUZXN0IHdhaXRmZW5jZXMgZnVuY3Rpb25hbGl0eSBAQCAtMTQwLDcgKzE0MCw2
IEBAIA0KPiB3YWl0ZmVuY2UoaW50IGZkLCBlbnVtIHdhaXR0eXBlIHd0KQ0KPiAgLyoqDQo+ICAg
KiBURVNUOiBOZWdhdGl2ZSB0ZXN0IGZvciB3YWl0IHVmZW5jZSBpb2N0bA0KPiAgICogQ2F0ZWdv
cnk6IFNvZnR3YXJlIGJ1aWxkaW5nIGJsb2NrDQo+IC0gKiBTdWItY2F0ZWdvcnk6IHdhaXRmZW5j
ZQ0KPiAgICogRnVuY3Rpb25hbGl0eTogd2FpdGZlbmNlDQo+ICAgKiBUZXN0IGNhdGVnb3J5OiBu
ZWdhdGl2ZSB0ZXN0DQo+ICAgKg0KPiAtLQ0KPiAyLjM0LjENCj4gDQo=
