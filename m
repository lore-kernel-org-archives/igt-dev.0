Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E58DC4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 07:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E900810E21A;
	Thu, 15 Feb 2024 07:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffAi93KQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1252610E254;
 Thu, 15 Feb 2024 07:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707980875; x=1739516875;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6B0sICM2NMpvX355V2Hsc0k1Kka/9jfX1cWLpuHENHE=;
 b=ffAi93KQrGF1UwtWNTyLpVsUbeJb1ELvp/FedVrKdkatWYIjM5DivaBY
 oPlQyjQucaNxCEyh0bVP1hyj9zUDYVFEoxuKNJoDIZ9BaDFwcMaCgndte
 XHQ0wqxsKKXzEK+iBOg7f7Q4cATyqbln3Dm6hrxxdTF/yEtvA97wV0//9
 XCW4RH74ySM5JK8mOAb9kGPQEBnGvtn9+frMttnnevtUtro6FKPoDtthc
 PxubcSH5YNrHeqXXJwP8dn2mZzKZzg2VsZwrcNavavs3PLn56xc49AEef
 KsPHVMHbaznBPi+ovj5Gi2yC8T7+aaR3gcYb2SM1kXVt8/85Z060LHlc4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5021361"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5021361"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 23:07:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="8175790"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 23:07:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 23:07:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 23:07:51 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 23:07:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONz2lSnjvVHEf6Z2g1l5oIYoKrs250FGMcTGyeBzuv8jODmCTWVbgMIrLEv/O5mg1cLIJ8ux/isJjjPz1pcnYiKBjdEdHeEZ9hAjrjSRD+s+G0G99gXz4w/nU2dlQIC2EVE+pNNPOQY0EwgGwpuGVweSGl/JZua/PNAY+J9yqWspG9SFut769HkBF9sA8+6e+P0o+EGxxhDiqD13tQ6kGzuGpLU0/q2UAWOBAaQzZ1ig+SHSPQFT4vRrqx3ChhVjj6ITyZNpzvcmELMA3TmPvh5qUzpHrejNbVOR1cPqnNrXw+RiXY3dJoBIWtD+3+3mZ7G4wiSqCIe7LdLW38FeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6B0sICM2NMpvX355V2Hsc0k1Kka/9jfX1cWLpuHENHE=;
 b=I3m3a6zaYxpie+O+Q64THFVWGRMov/RC/PUM9AnOmxLCpCmn1y5iRHzDfU5Wp8SELuTDnHegAIGT28qBBx41fhoU6fOz06shJx61cTmC6gtrF7iTzTGkXMLDZh0ciJtocr81pAOsdzDEnKQAZe1JccXQ9VuENW5koJZeaxgNwLR2rdxyMnmXQzgMz6ckTa5ewSHxm/97ILYrnWST3RcIUQ+LbiHGX0LPhrBKY1+p7XUKuR1ajQv/QjfWp/bVbu1ZGeJiWZNSYrackfnd9+BQiaV8S7YppYdYjZRIyOpvwMBzS+Ol9MYhj+lK39Cbs1IVZ23SeHl/ct1U8k4735fXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by CH3PR11MB7203.namprd11.prod.outlook.com (2603:10b6:610:148::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Thu, 15 Feb
 2024 07:07:49 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae%4]) with mapi id 15.20.7292.027; Thu, 15 Feb 2024
 07:07:48 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>,
 LGCI Bug Filing <lgci.bug.filing@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIGJlbmNobWFya3Mva21z?=
 =?utf-8?Q?=5Fvblank:_Add_XE_support?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgYmVuY2htYXJrcy9rbXNfdmJs?=
 =?utf-8?Q?ank:_Add_XE_support?=
Thread-Index: AQHaXesBJEfQ2aufXUGl0h7VU+gEObEJ9BWAgAELUbA=
Date: Thu, 15 Feb 2024 07:07:48 +0000
Message-ID: <PH8PR11MB675397B5A41A375523E60153F24D2@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240212150113.736295-1-bhanuprakash.modem@intel.com>
 <170776664734.1182955.973861211145205994@5338d5abeb45>
 <20240214151035.r62m7rtva7t47nzo@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240214151035.r62m7rtva7t47nzo@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|CH3PR11MB7203:EE_
x-ms-office365-filtering-correlation-id: 9a882aef-9705-4b92-cdd8-08dc2df4d17a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1n9bK6J7sKBmSmrRNsIABwFLiz9YbXCtvM30QioYCDvddXK3erafXSj/kG4VE0ymglP51+K0AD78cxkTi2DsdP8VG9gLD7JHmnu1Dhi/mNiAT0f/++P5ouABpR2S0p6cx2Fzj+de/Av62mjqHvc3KJHLLhTearpuuz9cCFjfX1YsnaP63Qb/fNPbrGV4Uqa23QAhUFDhRezhCt2Sp7HDhpSlqe7flfOkUE7YrPIHJyJ31O2jMFrGiRKU4bfQsXF/tR/asIytbiCeM3CTLZL3KwPNdiZIuXyDZp50PMu1PoLOF18ssrRaXHqAT8nvxf628AFek1vQhbWOlcv/+YnXumo+sWOch+0T8uFw8G1R95dFwLRHaMqZv2tuXigqGfGnMnACUiRz1bcpfmlTWpGBXz+Z03O1ch36TYujUlNuYp6pStQthQ5mmF7g2F7F4U+5e2D1lxS/5OJlymZXMZlTNHnUYZQeX3kz6tGxI+Jt6eZw2Npomw4GsW9jWsHpSTkEyUzlRU6KarbxgDg/b4iQb4hH6uMea5AGDIQ3xhdsHYGt0TYsF9yaayO3HD7bDj9cEnsq5LiSgbIYMHF2rFnjocwtXXy0bCwNG9MeEkgy9uyK6V2wLbrLEmvFg6+RmD3Y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(136003)(396003)(39860400002)(230273577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(5660300002)(66556008)(76116006)(64756008)(8936002)(66446008)(66476007)(4326008)(2906002)(83380400001)(122000001)(26005)(82960400001)(38070700009)(54906003)(71200400001)(33656002)(316002)(110136005)(86362001)(38100700002)(966005)(52536014)(41300700001)(7696005)(6506007)(53546011)(9686003)(66946007)(55016003)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHo3UWhqK3FTbVZGS2VGZzF4YWVSeXljQWl5RVRhQ3Q1bCs2cXcrR0NsTmhv?=
 =?utf-8?B?c0YwS1lKbk5OclhieE9iRGdBYjVjYmNkWlRuZVNYcWg1UzJrOTVTMWhkUGN0?=
 =?utf-8?B?blRpVHluTmd6enFERXZ2QytXdnFwTkhWbUtLQmthNjBaQzZaYjdlbmRKTmxQ?=
 =?utf-8?B?N3ZpdmM0OTBNbnFJektyVjZ2UTNsUEpMMVZkbUJjNkVocUJFWnAyK3NIQU5j?=
 =?utf-8?B?L0ZoZXdVa0l0SXcvL20rSnlNcEl1eTB5eTdkczEvOENBM21FMHRueGZMaFA5?=
 =?utf-8?B?S29aR0pxWlRrY1VVeXpjRzdORnVSbjVCOFp6UFJ2WGt3c2paVmlKdnJQeldL?=
 =?utf-8?B?Z0puVmlZWXVoVlowRWtmZDJKSTRVMUZCQWppemRxRHFiR21tSjNHcXZpTnFi?=
 =?utf-8?B?L3U3R0JLVlhNZHV0T200a3lOSU9MaisvZDZvQVY0QTV5THRIZEhPQVNZOUo2?=
 =?utf-8?B?T2JqR2pmQ3JLM29NemhTTnVlYU9vRXMwKzFoNXdTMGhIbTR1eU1HQkx5dk92?=
 =?utf-8?B?NnVseTlLaEJOMEsvVXZncVgzaGVKZ1ZvUVQ0V090dVJEV3RtY1B5ZFQvRVln?=
 =?utf-8?B?VUppVnVPZkVYQUZTcmhwN1ZueDhPMk8rcCtFby9CQjJyYTdOUFU3R1owRXVC?=
 =?utf-8?B?aytMZG5kY3pHYmRYU2hlSHpmanFMNTMwMTdQRW12NUNSNVo3dFRKbkRFNVow?=
 =?utf-8?B?ZDYvTE52MUFwbkxpczZIcDRBb2RkcXJOcldEeG9qUThZcTE0RDByd2NIcHBU?=
 =?utf-8?B?b2FybDRZZm1icXZIdEU1cTVpaStIaSt1UzJRRGY0WHpqVlV3QVNyc3ZzQkRH?=
 =?utf-8?B?bUVxOGFLZ3JBVUhHLytCRHBSVzJxNXdrK2RTcHY0MzZicysxTG9XZXdNeU1m?=
 =?utf-8?B?Y2lTSU1oZ1Nkd2tpYTZnR2V0ZlJjYW00VnpFQ0xVVlRSRGR5YktFZ2FoTC81?=
 =?utf-8?B?OUJYZmNvQ2sxTGZKanZHa3RMNkJ2bWtpZWFLeFZzMzZkeVY1VThiTXZzNExU?=
 =?utf-8?B?bzcvSWhCZDRDUGVYTzRuU3FTZitKSTArYmRwRnRXRzd4YkltREVNWGNSLzRu?=
 =?utf-8?B?NW1kWWJNZFNTVXFPMis2MjhUNCtxQnFYTHd5SWhaSFZubEFBYjM4aW5oTUlr?=
 =?utf-8?B?OTE2TUgzNDhDQ0Yyand4UkIzVDk3cysxZHFrS2RBOW1VVDRJVzlQTVhOVHhq?=
 =?utf-8?B?TXlDaEw0U01WRjJtTHVwYTJ4ZjRQZnptNXVpNkhZSlhhdXNZbzRCV0p3dUNB?=
 =?utf-8?B?Uk9TUkhkR2JCL1B1TWtWdmVWOXFzNDNrdXpzeis3RVo0SDFFVlJoUCtLTGZY?=
 =?utf-8?B?ZDRKMUhzVnJhQm9jcG9odVV5NmVWbEpsM1VsUFNaRkt1by8yR3Z1a21ZK2x4?=
 =?utf-8?B?a1ZGZTNNL0FFRWZiQ1dzaUhsUEg2aHZKOWIyZnNPVHludmxUVyswWGgzT1Nj?=
 =?utf-8?B?ZFNVa3V3OUVoZkcxVHFIdmREZTFXbnZkM0U1bk5zVE4wbTZnSEptOW5vS2pt?=
 =?utf-8?B?NkdZclBLSEVjQmV1WlpQR3RSQ3pRS2I4UFByaG9pYy9IZzZ3dmoxQStndFdB?=
 =?utf-8?B?OFRGbVpVV3krT0c1MW9UWWNBdVRSMC9UNTE4ZUtKN3BDV0szMHpYbVRESHox?=
 =?utf-8?B?T1N1UUtGZzVrWkNSZUF5cjVMOE1zUEpWLzZlTjdFR3pzZE82ZEZZZTFLdmhv?=
 =?utf-8?B?c3NWcjhxeVNNMVlTdFV1d1VZWk9WUGFESWpOK2Fhbit4SkcxWmIyNDRPMlN0?=
 =?utf-8?B?QzdLaHFvcWVwL251WVR4MzIvWUw0aTNHZUFiNENYZkdlSk5zUG1NZzBncy82?=
 =?utf-8?B?Z1FpUzMxNTdaYTU5T043Um1Jd0J6Wi9tWkw1cUR6L0RMQVUzNEQ0S2ZhVzNo?=
 =?utf-8?B?K1lqRDV5MzVrczRHQ3VYdzN0aVZKTUJTU1lRbTY2UjVSRTlhUHpWdjdsekYx?=
 =?utf-8?B?MTk3Si9KckZ5d2xNNitnNk9WSzEyQUxRazRINW9ZYTdlK3p6eVVJMExLNEpF?=
 =?utf-8?B?R1BaZDhtSEZZenE5eC9mb2NQenovSWZZWGJsZ3hJL0NSOHpINnpFWmV5aGtp?=
 =?utf-8?B?bkh0T1BRaWNxa3JCanBPVWlwOHFqTmw4T1AvUms3Y2g3N0xjZHhlWEFrK0Iz?=
 =?utf-8?B?YzkwdjFNWS9mbU1aTkZFQlRBUVVTcXhybWFZeURnOW1zbmZKaFBycGY1TnBz?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a882aef-9705-4b92-cdd8-08dc2df4d17a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2024 07:07:48.9192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z5YIfBlDhmj6vjeKokE3PYXb64D1PfNiRd5pfSp/hJK/Xjtvk5fMr6tmDiyXHpCk8KSKczykCKkpO+ubtOhkHQdjIF1SkiJ92SRcXt0AhtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI5Nzc5LyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpUZWphc3JlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50
ZWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMTQsIDIwMjQgODo0MSBQTQ0KVG86
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogTW9kZW0sIEJoYW51cHJha2FzaCA8
YmhhbnVwcmFrYXNoLm1vZGVtQGludGVsLmNvbT47IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBMR0NJIEJ1ZyBGaWxpbmcgPGxnY2kuYnVnLmZpbGluZ0BpbnRlbC5jb20+OyBJ
bGxpcGlsbGksIFRlamFzcmVlWCA8dGVqYXNyZWV4LmlsbGlwaWxsaUBpbnRlbC5jb20+DQpTdWJq
ZWN0OiBSZTog4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgYmVuY2htYXJrcy9rbXNfdmJsYW5r
OiBBZGQgWEUgc3VwcG9ydA0KDQpIaSBpZ3QtZGV2LA0KT24gMjAyNC0wMi0xMiBhdCAxOTozNzoy
NyAtMDAwMCwgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4g
U2VyaWVzOiBiZW5jaG1hcmtzL2ttc192Ymxhbms6IEFkZCBYRSBzdXBwb3J0DQo+IFVSTCAgIDog
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjk3NzkvDQo+IFN0YXRl
IDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5n
ZXMgZnJvbSBDSV9EUk1fMTQyNTVfZnVsbCAtPiBJR1RQV18xMDY2Ml9mdWxsIA0KPiA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBTdW1t
YXJ5DQo+IC0tLS0tLS0NCj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAgU2VyaW91cyB1bmtu
b3duIGNoYW5nZXMgY29taW5nIHdpdGggSUdUUFdfMTA2NjJfZnVsbCBhYnNvbHV0ZWx5IG5lZWQg
dG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICANCj4gICBJZiB5b3UgdGhpbmsgdGhl
IHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4g
ICBpbnRyb2R1Y2VkIGluIElHVFBXXzEwNjYyX2Z1bGwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcg
dGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0N
Cj4gICB0byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNl
IGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6
Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDY2Mi9pbmRleC5odG1s
DQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhvc3RzICg4IC0+IDkpDQo+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiANCj4gICBBZGRpdGlvbmFsICgxKTogc2hhcmQtc25iLTANCj4gDQo+
IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJl
IGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGlu
IElHVFBXXzEwNjYyX2Z1bGw6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMj
IFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4gDQo+ICAgKiBpZ3RAa21zX2Zyb250YnVmZmVy
X3RyYWNraW5nQGZiYy1zdXNwZW5kOg0KPiAgICAgLSBzaGFyZC1kZzI6ICAgICAgICAgIFtQQVNT
XVsxXSAtPiBbQUJPUlRdWzJdDQo+ICAgIFsxXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9DSV9EUk1fMTQyNTUvc2hhcmQtZGcyLTYvaWd0QGttc19mcm9udGJ1ZmZl
cl90cmFja2luZ0BmYmMtc3VzcGVuZC5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA2NjIvc2hhcmQtZGcyLTEvaWd0QGsN
Cj4gbXNfZnJvbnRidWZmZXJfdHJhY2tpbmdAZmJjLXN1c3BlbmQuaHRtbA0KPiANCj4gICANCj4g
IyMjIyBTdXBwcmVzc2VkICMjIyMNCj4gDQo+ICAgVGhlIGZvbGxvd2luZyByZXN1bHRzIGNvbWUg
ZnJvbSB1bnRydXN0ZWQgbWFjaGluZXMsIHRlc3RzLCBvciBzdGF0dXNlcy4NCj4gICBUaGV5IGRv
IG5vdCBhZmZlY3QgdGhlIG92ZXJhbGwgcmVzdWx0Lg0KPiANCj4gICAqIHtpZ3RAa21zX3BzckBw
c3IyLXNwcml0ZS1wbGFuZS1vbm9mZkBlZHAtMX06DQo+ICAgICAtIHNoYXJkLW10bHA6ICAgICAg
ICAgW1BBU1NdWzNdIC0+IFtGQUlMXVs0XQ0KPiAgICBbM106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzE0MjU1L3NoYXJkLW10bHAtNy9pZ3RAa21zX3Bz
ckBwc3IyLXNwcml0ZS1wbGFuZS1vbm9mZkBlZHAtMS5odG1sDQo+ICAgIFs0XTogDQo+IGh0dHBz
Oi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA2NjIvc2hhcmQtbXRs
cC02L2lndEANCj4ga21zX3BzckBwc3IyLXNwcml0ZS1wbGFuZS1vbm9mZkBlZHAtMS5odG1sDQo+
IA0KDQpVbnJlbGF0ZWQgdG8gY2hhbmdlIGluIGJlbmNobWFyaywgbm8gbmVlZCBmb3IgcmVzcGlu
Lg0KDQpSZWdhcmRzLA0KS2FtaWwNCg0KPiAgIA0KPiBOZXcgdGVzdHMNCj4gLS0tLS0tLS0tDQo+
IA0KPiAgIE5ldyB0ZXN0cyBoYXZlIGJlZW4gaW50cm9kdWNlZCBiZXR3ZWVuIENJX0RSTV8xNDI1
NV9mdWxsIGFuZCBJR1RQV18xMDY2Ml9mdWxsOg0KPiANCj4gIyMjIE5ldyBJR1QgdGVzdHMgKDQp
ICMjIw0KDQouLi5jdXQuLi4NCg0KPiAtLS0tLS0tLS0tLS0tDQo+IA0KPiAgICogQ0k6IENJLTIw
MTkwNTI5IC0+IE5vbmUNCj4gICAqIElHVDogSUdUXzc3MTAgLT4gSUdUUFdfMTA2NjINCj4gDQo+
ICAgQ0ktMjAxOTA1Mjk6IDIwMTkwNTI5DQo+ICAgQ0lfRFJNXzE0MjU1OiA0NmNmMWE3ZGE1N2Zj
NGZkMjMwNmQ1MmFlYTU4YTAyYzdlYjA2Y2NlIEAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5v
cmcvZ2Z4LWNpL2xpbnV4DQo+ICAgSUdUUFdfMTA2NjI6IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA2NjIvaW5kZXguaHRtbA0KPiAgIElHVF83NzEwOiBk
ODdhNWQ4NWE2MGZiYTEyODM4MjFkNTIxMmMzYWVjZTY0Y2IzNmJhIEAgDQo+IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gDQo+ID09IExvZ3Mg
PT0NCj4gDQo+IEZvciBtb3JlIGRldGFpbHMgc2VlOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2ku
MDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDY2Mi9pbmRleC5odG1sDQo=
