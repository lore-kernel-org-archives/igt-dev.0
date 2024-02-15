Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89351C48BEB
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 07:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2927710E251;
	Thu, 15 Feb 2024 07:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BtG75Br6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BD210E251;
 Thu, 15 Feb 2024 07:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707980681; x=1739516681;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fN+x+NdmPzcVeNlGunhOpzhAThl/JxXe8yfO3maNTg0=;
 b=BtG75Br6zMYxHismfQPKFQIOyIRCRxdbCwnWAcHRe89kpohC+2PYniXr
 b2LXU74aQ+xaehsGl4BsKMLVTIPx8fQ6XTZGHAE7w9FIy2UNIyMEg8Bvj
 CytAuAZ16/SQ94hkwgZURuymecZ+74mV+81ltpqyiHnhW0JcZ+Sn3ETBw
 6U3/gWYt6o10cnJIQVLegM/ftSOvXgYsv8ipPAeA1Ia9vZm0sD6N9dkv/
 uPBA6FzISG6WT2o4EqZAeqEKJ98kxktxDVTtq399siW4LbV15GG9Wmd10
 ZHQ+abhSwf8rrgFpd+35yPqEWkcwpRIrkplPRAKe+MzEZLfnAgALj3HhK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5020886"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5020886"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 23:04:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="935619963"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="935619963"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 23:04:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 23:04:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 23:04:37 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 23:04:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muTvYwfm4sqJkKk+AwBv0dyJcrB+u1RsZuWQ43SnOMkDMU6Bj9p1XSoJtAytpY+3u941yS2L/09FnlMHalUcocOY/UQy0HeLMeHwvkCNyIq2DXMgHgc8CCktMffF2PEmdEu+Z5ppNGmKe6Z8K0qYYNK8Hd5nrbRMz2sly0W+9DpcZdK6bpxNqXcituN38Cqtd9mv9tnZTzGlgm1090Jemu4RjByl52Mgev4Gt5uKme/V8K2H1FTjTVpO6+Nv7E6BiRqmFrUIML9AvXewaRT9N1v9JabW+2RCtN+AGAgLaZjTaDHLrzsbXWlwY0NZm5X3hcDIzxXunziJnnqlQhjosg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fN+x+NdmPzcVeNlGunhOpzhAThl/JxXe8yfO3maNTg0=;
 b=LjqgZfa+742JLO0AuT3bdv2uRhzM7NOtHUH1PDU5S5dJQXT1Xpl6+yOJLNLDelUPTg7Hm56PmQ+9Z7R25UDEJcAYPNYYC4KCUhp8XLzHTOBx1Xb8UD5hK+uq9oMOgjc0MjG96DfCC9m7e/CbaO2hyN/O6yPuKD2Y1fqZ3lhL+kEKCM0nA92W6MGRUPeXO2i9GbymlI1QHLghdqzyFUVI0Yfk7fv6oSrULuPz2ecQBEspF2Pq4EbOpX+p8LIbtcARY6J7/0ruF0K3/SFewjHJusQjzKY2mLsLuClLmKAdCCcXL+1y9qYBgIqILdPLWq6RyF33GntRcsf29ss8TFMMhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by CYXPR11MB8661.namprd11.prod.outlook.com (2603:10b6:930:e4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40; Thu, 15 Feb
 2024 07:04:30 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae%4]) with mapi id 15.20.7292.027; Thu, 15 Feb 2024
 07:04:30 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Bernd Kuhls <bernd@kuhls.net>, "I915-ci-infra@lists.freedesktop.org"
 <I915-ci-infra@lists.freedesktop.org>, LGCI Bug Filing
 <lgci.bug.filing@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIHNlcmllcyBzdGFydGlu?=
 =?utf-8?B?ZyB3aXRoIFt2MywxLzddIGJ1aWxkOiBjaGVjayB0aGF0IG91dGIgaXMgcHJl?=
 =?utf-8?Q?sent_in_io.h_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVzIHN0YXJ0aW5nIHdp?=
 =?utf-8?B?dGggW3YzLDEvN10gYnVpbGQ6IGNoZWNrIHRoYXQgb3V0YiBpcyBwcmVzZW50?=
 =?utf-8?Q?_in_io.h_(rev2)?=
Thread-Index: AQHaXsKUwb0QPfRVfU+RTZQmNFA+jLEJ22YAgAEhXbA=
Date: Thu, 15 Feb 2024 07:04:30 +0000
Message-ID: <PH8PR11MB6753F5FD770E4A3575418DA2F24D2@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20231030195809.3527410-1-bernd@kuhls.net>
 <170785922380.1218995.12022790308398747921@5338d5abeb45>
 <20240214134816.jrqis4nn3gddg54n@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240214134816.jrqis4nn3gddg54n@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|CYXPR11MB8661:EE_
x-ms-office365-filtering-correlation-id: b620a6cc-6dd4-456a-d650-08dc2df45b4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qa1QcbdvJ/sIuRxyqhUT1hG20nrbAE1xj+npvlKfPG9HYTNcbaKI10MX9ilWY/KN8CqFpB85x8Ho0foAghlIkvntazMLshsr3GyysHhDHZRQ4999B/SOaT7fMmKFrDchxgLUdPqovF6ZXcLf32VmcyPLferexA8MhQhG/L6BzVvLRRgIf4oqaAZ/4CQfE76aIntjwnRq8EbUpFql9M0ErgWLXZXcIxcp9yyAsk+KRVS6LNKmZf95USyPjaJm2a12yVykJQRhwEyzv/rnsE6ZlnPTbOcf9TKpBoU7B8lNBFSlH1QwKkO7uKWf1h0GBHTsz5Pk3Q7CMrO/ee7GoSVINx5KZdjAsD4gti+7FWpPogRSYI1yk3qLv2yN2GaOhNJPt0h3hHeHyXZuEeQMiO+yAuFTDVinFakBsAsSwXNCRsyN00tObKVKGaedSUWHUS2BCqrcSplu2m382WvruIj7bJUsg2yeoWf0T2Eg37o0+cetOl6EOKB5KH8uyfLPKybZk920pfHsuGBHOl9lyvgMosoFotbTmaI+oyYEUYdKeEpIZH3+NKpEmbtmU940YCeDh8hGf1LU8Ub3l3BKUroWQMGWO84lWTh6oZvljZPHdDqNsYEUC71yu9hX7L9jKZ2I
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(366004)(39860400002)(136003)(230922051799003)(230273577357003)(64100799003)(451199024)(1800799012)(186009)(55016003)(2906002)(64756008)(83380400001)(66946007)(41300700001)(966005)(7696005)(66446008)(71200400001)(8936002)(66476007)(4326008)(26005)(53546011)(66556008)(76116006)(5660300002)(33656002)(9686003)(52536014)(38070700009)(86362001)(478600001)(122000001)(6506007)(110136005)(54906003)(316002)(38100700002)(82960400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1hZUWl3eG14aXRKYmEyS0tuc0s4MU9VUXdSOExqUzh5cnM4eDBPby9ndHNt?=
 =?utf-8?B?RUM3NlE5ZWVTN1BRY1ZSb3llS3czOEMzUTBiMXo5VTlCZWtIK3hXSTBTQllD?=
 =?utf-8?B?NzRPUUZ1YTRQY1hCT240Z0R6WWE2YnJwemdsR3kxWUJmOWs2Uzk3aFZacEt3?=
 =?utf-8?B?c1pXRlJucFBqWkJ4d1pKbk10ZzRST0hJcUxLVzZ0K2RjN2ZZQVU4dG1rWTNu?=
 =?utf-8?B?d0oyc1NxWTZmVFUvb2lvR3RJSDlRN0ZSVElPaUppM0tVZmE4UzVtUFpUWEE5?=
 =?utf-8?B?T0hZMCswL1NxUEMrdUN0ekdObEVHbTFJSXI4WVFEVy9BbzMzNHhJQmZqK0NB?=
 =?utf-8?B?UDhZMVpQNk0rK1B5ampMZ1ZTNWtuNFBnKzA3RExteGdOeXJLazE1bFhoNkNV?=
 =?utf-8?B?K1ZLNHlvNzJRa0pLb014cGYrMVJwUmpyNmhQTUpBUlhvTUdvUmVPYk9zTlJZ?=
 =?utf-8?B?S3dzbVg5Nk12T25FSnF6RVV0eGV4bWlycnpFSnhtZVV3NGF3Q1RZT3lPalky?=
 =?utf-8?B?aG05ODVwRVN6TVZXMHg5VU05TVRJcCtSbHFYdVZXT29XbWlSa3ZRYytkazFX?=
 =?utf-8?B?cWRPb2ZZdEpWRStZWmh3U0w3SkFvMDBwV0o0eldPWllvMDhFWVFiOEJnNDRU?=
 =?utf-8?B?QmJBa3pWMDJpMzhGZVNBMElsM2tWMXkyNDZSb1RBMWtiVkFNTmdLQk85dTdy?=
 =?utf-8?B?QkJhclRIYzFjRjBDMlpHMUdESXlVZ0RxR0dVdlZTdUlFaE9OTDJSa3Q0Y2JY?=
 =?utf-8?B?Z0gxRUpyVmh1ZGdIOFZHNjc3WVQ1aDdKYVYva2xKNVo0OUIrcTd5a2JRVGlJ?=
 =?utf-8?B?M0p5RW1vLzVmOUxBbkl3bDVrOTNqSTgySjZzbDZwUnlpcWtPemtqSnp5cjF5?=
 =?utf-8?B?QUdFQVdPeWdyNTM3YTlMcE8vNnRQU2doTzZkUjhVMXdVWmVKVVlMZEFORFRH?=
 =?utf-8?B?WTcvZ3kyUjhGQkNEem9FenlvMG9IVWhUakFaMkdmczJqdWR1K1RWUXhNc3hZ?=
 =?utf-8?B?SWl4dkhpUG1Ea04yNnRtQVg0eUcvbWhibnR2cnRSVDV0M3l3Q2xQNzB1MXZ4?=
 =?utf-8?B?ZXI0WXk3bkszcnlPMzhBM202dHhaeDZWUkdpN25mdllRSjJJYmlGd3kyWnJr?=
 =?utf-8?B?NjJncWd4OVVPTUpDU1dJSHhNWGNncC8xc3hkZE9RZnFlc25ORE04OFNTWGd4?=
 =?utf-8?B?UDBWSnZmSWJieXYzcEc2M0o0OUc4L2RlZldhb0xxamRNSXA4eWdueGpsWFgx?=
 =?utf-8?B?UUp5TEdlVDVKOUNrdldVZHVoMDVYd3RadWd5T2MrbVJuTG1hNmlqSjBUZ3JW?=
 =?utf-8?B?RjVWVmkzN2hDOUlDTlBTN1Z5SUJvVzJackI1dHU0WmxjVCs3dGFqS2x0SklK?=
 =?utf-8?B?YjBuQVNrQXk0S1h0eVFGcElGVzN2a1plUEpjRitIMTVXbjRFNVVBSS8vdG50?=
 =?utf-8?B?SmVzWFROaVloNkRBWjQxRG1xcGNqSGloUUJNQWZRanZFT0dkYjhDTTJvNzZ5?=
 =?utf-8?B?a3FocFgwci82YklENW5JRkJTZ1lRdUNCOW4rbU5sRTg1QmRMcVBIK1VQTmVT?=
 =?utf-8?B?N1p5MTZmT3B0OGpuQmpFaDdzMkZWaVVqem1ER1pvNXdYem1hamlTNEtQWnRG?=
 =?utf-8?B?UVltaWsvRktLVldFNlh1MmhrRFJmdHh5T1NCWWlVMXRoQmlsWDZIbzhoVTBn?=
 =?utf-8?B?Qkh5bnliOTVWb2F2bEVkQWllaENla0ZMSmV5bnRDa3hQOTNtbEMrQmR2dnFT?=
 =?utf-8?B?WjFURU83S1NKcWtlbnJCMGxkRHZLYTZScy9QeE5yaytTbk84eDNvV2cwdVZv?=
 =?utf-8?B?dzN6cnNhcnRvRUU4SFNWVS9pT1RVYmFZMFUxTGFpRncrbjl4TEJYQnZiNTNn?=
 =?utf-8?B?OWFVdW44SEJ6aFFTMW1lZnVFVUxHWTZkdWtiYTViV2pGaWprRW1HWmpUaUxp?=
 =?utf-8?B?QjgzbVo3dTBNYlIrZFhpaVhYcnhsQUM4SnpCQkVxYVo3eHFDWmxMOHgrbFk4?=
 =?utf-8?B?UWk5TGdoajBTRDIyRE5ZQm9zUFd2NS9hN0F4eTNCeU1PY3IzL0FtakIrZTQ5?=
 =?utf-8?B?MVJKd3JyYmlIMVQwY253bVJmVXZHWGE5b1JEVkFFelRnRHlQSHJEdUxHTUw0?=
 =?utf-8?B?bWw4ZmdmeThyaWFPSHhwc3lyeVg0QjA5alVJNlZ1SDdFOUhnREpxWFgwR29i?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b620a6cc-6dd4-456a-d650-08dc2df45b4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2024 07:04:30.6237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DBOBhSCMDqjNSFS+vFbL7F792DAKJ0UuEW9s5aBxG8iiIHv0kLVFTIJ+aFfVwKgmVZ1lXGgsrp6bCh0Y2z6KKXfFGQO5AuoixsUuCAfx8Zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8661
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI1Nzc2LyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpUZWphc3JlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50
ZWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMTQsIDIwMjQgNzoxOCBQTQ0KVG86
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogQmVybmQgS3VobHMgPGJlcm5kQGt1
aGxzLm5ldD47IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBMR0NJIEJ1ZyBG
aWxpbmcgPGxnY2kuYnVnLmZpbGluZ0BpbnRlbC5jb20+OyBJbGxpcGlsbGksIFRlamFzcmVlWCA8
dGVqYXNyZWV4LmlsbGlwaWxsaUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTog4pyXIEZpLkNJLklH
VDogZmFpbHVyZSBmb3Igc2VyaWVzIHN0YXJ0aW5nIHdpdGggW3YzLDEvN10gYnVpbGQ6IGNoZWNr
IHRoYXQgb3V0YiBpcyBwcmVzZW50IGluIGlvLmggKHJldjIpDQoNCkhpIGlndC1kZXYsDQpPbiAy
MDI0LTAyLTEzIGF0IDIxOjIwOjIzIC0wMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNlcmll
cyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IHNlcmllcyBzdGFydGluZyB3aXRoIFt2MywxLzdd
IGJ1aWxkOiBjaGVjayB0aGF0IG91dGIgaXMgcHJlc2VudCBpbiBpby5oIChyZXYyKQ0KPiBVUkwg
ICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI1Nzc2Lw0KPiBT
dGF0ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBj
aGFuZ2VzIGZyb20gQ0lfRFJNXzE0MjY0X2Z1bGwgLT4gSUdUUFdfMTA2NjZfZnVsbCANCj4gPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4g
U3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMg
dW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzEwNjY2X2Z1bGwgYWJzb2x1dGVseSBu
ZWVkIHRvIGJlDQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5r
IHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2Vz
DQo+ICAgaW50cm9kdWNlZCBpbiBJR1RQV18xMDY2Nl9mdWxsLCBwbGVhc2Ugbm90aWZ5IHlvdXIg
YnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0
aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJl
ZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4dGVybmFsIFVSTDogDQo+IGh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA2NjYvaW5kZXgu
aHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoOCAtPiA4KQ0KPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgTm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhv
c3RzDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4g
DQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50
cm9kdWNlZCBpbiBJR1RQV18xMDY2Nl9mdWxsOg0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0K
PiANCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGttc19w
bV9ycG1AaTJjOg0KPiAgICAgLSBzaGFyZC1nbGs6ICAgICAgICAgIE5PVFJVTiAtPiBbRkFJTF1b
MV0NCj4gICAgWzFdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRp
cC9JR1RQV18xMDY2Ni9zaGFyZC1nbGs0L2lndEBrbQ0KPiBzX3BtX3JwbUBpMmMuaHRtbA0KPiAN
Cj4gICANCj4gIyMjIyBXYXJuaW5ncyAjIyMjDQo+IA0KPiAgICogaWd0QGttc19oZHJAaW52YWxp
ZC1oZHI6DQo+ICAgICAtIHNoYXJkLWdsazogICAgICAgICAgW1NLSVBdWzJdIChbZmRvIzEwOTI3
MV0pIC0+IFtJTkNPTVBMRVRFXVszXQ0KPiAgICBbMl06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzE0MjY0L3NoYXJkLWdsazMvaWd0QGttc19oZHJAaW52
YWxpZC1oZHIuaHRtbA0KPiAgICBbM106IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tdGlwL0lHVFBXXzEwNjY2L3NoYXJkLWdsazYvaWd0QGttDQo+IHNfaGRyQGludmFs
aWQtaGRyLmh0bWwNCj4gDQoNClRoZXNlIGFyZSB1bnJlbGF0ZWQsDQoNClJlZ2FyZHMsDQpLYW1p
bA0KDQo+ICAgDQo+IEtub3duIGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBh
cmUgdGhlIGNoYW5nZXMgZm91bmQgaW4gSUdUUFdfMTA2NjZfZnVsbCB0aGF0IGNvbWUgZnJvbSBr
bm93biBpc3N1ZXM6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIElzc3Vl
cyBoaXQgIyMjIw0KPiANCj4gICAqIGlndEBhcGlfaW50ZWxfYmJAYmxpdC1yZWxvYy1wdXJnZS1j
YWNoZToNCj4gICAgIC0gc2hhcmQtZGcxOiAgICAgICAgICBOT1RSVU4gLT4gW1NLSVBdWzRdIChb
aTkxNSM4NDExXSkNCj4gICAgWzRdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9JR1RQV18xMDY2Ni9zaGFyZC1kZzEtMTcvaWd0QA0KPiBhcGlfaW50ZWxfYmJA
YmxpdC1yZWxvYy1wdXJnZS1jYWNoZS5odG1sDQo+IA0KDQouLi5jdXQuLi4NCg0KPiANCj4gQnVp
bGQgY2hhbmdlcw0KPiAtLS0tLS0tLS0tLS0tDQo+IA0KPiAgICogQ0k6IENJLTIwMTkwNTI5IC0+
IE5vbmUNCj4gICAqIElHVDogSUdUXzc3MTEgLT4gSUdUUFdfMTA2NjYNCj4gICAqIFBpZ2xpdDog
cGlnbGl0XzQ1MDkgLT4gTm9uZQ0KPiANCj4gICBDSS0yMDE5MDUyOTogMjAxOTA1MjkNCj4gICBD
SV9EUk1fMTQyNjQ6IDY1YTYyMWQ0NGJlYzVhMWVlN2FmMjA0MjcyMTUxMDVlNGMxN2U2N2YgQCBn
aXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9nZngtY2kvbGludXgNCj4gICBJR1RQV18xMDY2
NjogMTA2NjYNCj4gICBJR1RfNzcxMTogNzcxMQ0KPiAgIHBpZ2xpdF80NTA5OiBmZGM1YTRjYTEx
MTI0YWI4NDEzYzc5ODg4OTZlZWM0Yzk3MzM2Njk0IEAgDQo+IGdpdDovL2Fub25naXQuZnJlZWRl
c2t0b3Aub3JnL3BpZ2xpdA0KPiANCj4gPT0gTG9ncyA9PQ0KPiANCj4gRm9yIG1vcmUgZGV0YWls
cyBzZWU6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBX
XzEwNjY2L2luZGV4Lmh0bWwNCg==
