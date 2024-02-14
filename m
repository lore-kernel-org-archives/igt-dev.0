Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5949BC48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 19:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1558010E038;
	Wed, 14 Feb 2024 19:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWTCavAB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FA110E038
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 19:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707940514; x=1739476514;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8ebJWXLjLaH2mzZOvjp+/dVKZe6Wnkj/oCj1+sUblzQ=;
 b=WWTCavABxrtNtyVcamrmS3+NGn5Xw2D97TXZeX+g10t2NH0Ft5e9cjnm
 xOUq5Na74MsvlaYuv9Qd6hOoB70Xl73Xp69r7hV0ytmgMnCSXPWlvFCof
 jQCevWXlBsBqYRnI9qLCMxpbql9feFNc4RiQYbkDOU3PXiIjliMZebsT4
 LNWJTapD5xn7Wa5UI2diUAOWgJWhjFwJcJ9rl183BPdkJplisRw9qshNh
 +AkfuasAlpmf/hEDvL4ae8Dicp1V9/3bC9V8+dxasia3g4+eu2VycoYW5
 meMMaQjBsrKxIl3zgqROnr4B/422erJXzxjWhig1BZWRWNIK/qoKaVGrS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="13101125"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="13101125"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 11:55:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3657728"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 11:55:14 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 11:55:12 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 11:55:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 11:55:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lL+wEpn81guT+iSpSxyFzC5eBCIIPT/J6lfPYKd5deR+jNVdUwxJesF8qCGxASlDVGlUpvmXNGDd+FLqFJzKmDd25ZbnFgC/KSQLs3LOu6X5F5y+QRNZMAHgjhP/48S12qMKCJsHthg5OYTVY3rO94UV7mYP2MZDlUdJ1steW27F8FCvCri51BmBW2IJmp6kj/4tRLPrTu8BEmxb1VEVsbDrptaoGQyGKjF3ZLzqlKW56/VlZx6wtxtWfA6UM3UB1jAZ3HP8KlzoLTt8lqAF/ORzr3JxvCHdMmBiabnfvEsPmqrC4urxro2gQalGon36dLrTaIa6R0CIUAzbxQaEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ebJWXLjLaH2mzZOvjp+/dVKZe6Wnkj/oCj1+sUblzQ=;
 b=ImCgsulgTmeQqcLg51kfm8jkyqmMrVXvDFOKY5yESpIk/ngHfGii6fO0oF4M4Q3xTerrjK2iZSh5nV+x5z12XGI4QbD00CTLcribmtDEmfzyC7ya+agwoFXwGcUigBQRaBF7C1ucoUSkBEJ/c2nXkL1dd+ElpodAwiMPgXy0KPydNh7qpnp+YtEmbcUivLSlw4oJwcS72inikfdbi0Fk+sGAvbr/FYbZO58O9/auYs9zEx61Izfy5FBhTk7wPTtZXkBPW+XREAYP4jFuWjSBUneg5IVJLEg+UjqCaEOveR/hTGcRkCS9rNJWhfRS6QJNxpMKx21SaMW2jued/yF4JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BN9PR11MB5226.namprd11.prod.outlook.com (2603:10b6:408:133::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.27; Wed, 14 Feb
 2024 19:55:10 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::98f7:d64d:6aab:3a1]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::98f7:d64d:6aab:3a1%7]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 19:55:10 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: RE: [PATCH i-g-t v5 2/2] tests/i915_query: Add query-l3-bank-count
 subtest
Thread-Topic: [PATCH i-g-t v5 2/2] tests/i915_query: Add query-l3-bank-count
 subtest
Thread-Index: AQHaI6g0zwTJvk0HuUWV2t2DMuDnSbEKbQWAgABJWDA=
Date: Wed, 14 Feb 2024 19:55:10 +0000
Message-ID: <CH0PR11MB5444E6F2FBA492B959EC0797E54E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20231130160253.3787505-1-jonathan.cavitt@intel.com>
 <20231130160253.3787505-3-jonathan.cavitt@intel.com>
 <20240214152623.w2ifkkgh7hl4lb4e@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240214152623.w2ifkkgh7hl4lb4e@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BN9PR11MB5226:EE_
x-ms-office365-filtering-correlation-id: f398a93a-0bcc-40ab-cf2f-08dc2d96d9c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fO5C8di4VH1oSSRXkjadRHh4soryHxINU7qAZE7uI1ABe7RMDgcSLaeIGjgMul+Gq0vH7AoWb9rqiZKSIqK98zjNI+T9XXlK5nDowBpleLo/pCWnJfrWmkjPn+Xdewf4W9nL7Tys3LdQJQNjsHVGtXrKrWRZoFrINCYgQqz2Dq3cBvX/rD3NZLwHb2UWhRfzjL83r27dBjD+PqbzsGPXI/YizSDlnGc9htQ4nziCkR61wHtlrlVZhBSGpGeUOVBJENLmDa+UFb90+jP7ao45U7+jFLfRq/tWtqUjtuZJTCwcuxfu34NfxVs14dQEETEqhlQtK5hASZAYrkR7Ipf9q0FkQC17tCBB7LEA74d9EFc8SEomR84kW/eAzxEJnL2wd/VOVThQfNuARHGBs3QlbKYjQHQG+m9R+6m2h5J8op3A+mafhJwZm5n8AXKlQQz8hKoAQGHDcvHIf9ub29yJmKp9/G1PHlW2UEZAjKDT/BrzYuRlgj4LYDgTmze1M/aqtwsrnFqduE6ApS35FBdAf2smO/heUhsmehNzjqv7krnrm4cAcE/8aVKdip/QBoy0zJTM4QneZ6aL3EAHB0eBG6ekhjXjb1ICjkeNk9XxK1O7kZsn+CCuqwSSSIHiACL4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(33656002)(86362001)(83380400001)(122000001)(82960400001)(55016003)(38100700002)(2906002)(5660300002)(4001150100001)(15650500001)(38070700009)(66556008)(76116006)(66446008)(66476007)(52536014)(64756008)(66946007)(41300700001)(8936002)(4326008)(8676002)(71200400001)(54906003)(316002)(9686003)(7696005)(53546011)(6506007)(478600001)(26005)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVhodCtlWUsxNXNzUjlpK1lNT2haRXY1MkwrUjNVZmhiMmVYeHJFVTUvckJ4?=
 =?utf-8?B?aTBuNGtaVWJTL3dGUnA2V1lDcC9jNlJ1QUQwWHk0NmI4UnhFV29pRmJ4ZXpE?=
 =?utf-8?B?ZDNkN3J2MWRkejFJY1ZuRnFUeCtUUisrc1JValVRVUplYURYRGRDQ2NnTy9R?=
 =?utf-8?B?RHBKVkpPVWFGUmtHU0NUZndpR3o1RHgvNTBQT2xHU3JHVjZRSDJzQ0hDV3VS?=
 =?utf-8?B?ejdSMmMzZVNnYUpXL2JoZ1dNTlV3TVBiOTYwYzc4WkpmVXRoSkRmTVZ2K2Iw?=
 =?utf-8?B?WlVXK1ZsM0RwVHR4WEdVTVdKcG9DQjVyeDJ6Q0kyTnpIL25mMnNLbHhSWlpm?=
 =?utf-8?B?cGNSbFI2RklVY1RQc0Mya3o3RElyOGxxZHgxN05WNnNnL204WlJTK0dFMHBJ?=
 =?utf-8?B?UEtDaWlSc3BJb1U0SHArdi9INmtsK1dhSi9LYmc1TStvMkpPTm5Md2t3bFdU?=
 =?utf-8?B?QlZNQ1YrU3dRTDFSeWJEeGVjU1VpYTJvT0E1aUlDV1Q4S3ZVSGQxTTFxTXJR?=
 =?utf-8?B?Y2x2bVgwekpFM01pOSs5THc1VkpGcVduaHd6VEtDaGI4NjhncmdWL1k0OVd5?=
 =?utf-8?B?a2ViYTV1d29FckgycEdNRzlpWTlGUTR6ay9YY2h6K0lydUNkajRZb3Y1R0FU?=
 =?utf-8?B?OUwvTy9GZ3ZLVmt4YkRCR2dKdzNxYWY0VGJnWVR3MTlqc0RVTkhuY1RBY1RT?=
 =?utf-8?B?SW0wT2llY2krcFVRY3dDMHR0ZVlLcHlxRzN6N3AwbThiRlVuYmNLTklwWFRk?=
 =?utf-8?B?NnM1MnRWN25uYkJJb2JRR2ljc0RleUtzSERmc1ZTUmdKRW1YK3BJeU9Ra1RK?=
 =?utf-8?B?WFZZN240d3EwZXN0QzBnVXI3dmZNVGUrWTVJVTdYWWZuc0ZOa2N3MU9nelU4?=
 =?utf-8?B?SVA3TUpPOVdPaUxkTlJjc0x2Mm1WKzBtZDNTeVFIYmswdUdsZVBZSThKekxs?=
 =?utf-8?B?bDdFcHlaMVVTbDJ2d0pKVGMyWmJlV1pJYW1mRzJ5dFRmaUsyR0Qvajl4bWtr?=
 =?utf-8?B?RmRiRWZ3ZWlWQ2dGTVNKMyswc3dKRVZrTFlqZ0txdnNud0pBMHFGN1dMQXVm?=
 =?utf-8?B?bXowYUluTmdSOXNJQ0ViN2NjVWhjcC9yclFuMi9NYk9SUjNlWWczeExjdXRU?=
 =?utf-8?B?cVUvNERXNFZJdWo4QnlibHY3YjcwdTRGMVkyYzVmRjRUa3dGTnUrZ0tZZVpM?=
 =?utf-8?B?eWZPajh5d2owTHJKQUJTR3JDeVc5MFdiQWtlclM5Q01lTXhHSk5hb0hhSi9x?=
 =?utf-8?B?NVZxOTRrQ21KQkhNaGF6L3VONGlJV2ttUXd3RnF2dWFVbk9Mc2FzNWhPWGlo?=
 =?utf-8?B?L0hHWEpuR0JpL3RCVlBscmxHOVM3M05YT1hpZ1V6R0YzQmZrdWFRV3Q1WXJu?=
 =?utf-8?B?M1g3cGJWUk1wamxOUzAzMHdhM1NQSEVmUExlTkxSZ1FtMmEzOVMrSzNSQUIx?=
 =?utf-8?B?OTlrWk1UbTVpL0JrOEN3YVFnbFdXY3JESWlJY0ZJKzVaWlltS2h0Y05ySTJT?=
 =?utf-8?B?NHhLTVNONzlNY0pSbFIyTHRtOXlBem4vZUV0ZjB2QzlIWkdWZnZsUlQ5c2JL?=
 =?utf-8?B?SjRwZGVqMStiNzJpeDRRbXNIc3pIZ21xb1VsUUpOYzdQRWtvamxtMnFXNzRY?=
 =?utf-8?B?OTRHYzBsZGVET244YW9HS3o5dXN5MVN4T0xjbTcxd203ODBDRE12V2E5ZVdH?=
 =?utf-8?B?cUF2bHd5RCtta043N1VUcWdpb0dieFhXc1NDS0Z5blA3azlXaklKVFAxMDgy?=
 =?utf-8?B?NXg3LzVEcG0wUFhRbDR6ZFQvMllWbVdUaEkwbjBBYzVkb1VHTjZXSzR2djRt?=
 =?utf-8?B?NXk4YU5mL20vTG85RmU2cVlWaDhneUNVZzVHOGRIN0FvOGdsTWFmdE56VFly?=
 =?utf-8?B?VmUwZ1VzeUlXcEtXdUxYM1RnK0lxc0ZBZmNBTHI1WmpFdS9wTHkrMlo4Mkpx?=
 =?utf-8?B?UGpFVGZNU0xhcGxpeDNlcTFyM1UxYkN1eXFKWlpvS1lHb0VZTkdySFhOWDBs?=
 =?utf-8?B?eXlMU1JSUkZKekllMVRMNEhHM0c1YWFQYUFBNWxMWmdxaUVLek83VFdHdzBy?=
 =?utf-8?B?eDkvbUpZQTFpcjdBOHdGckxnZE1DUGJOUFJkVTdEa21OY0pmS3JRNitxL2Vr?=
 =?utf-8?Q?73u6WrgfCnWjV8fOIuL375egU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f398a93a-0bcc-40ab-cf2f-08dc2d96d9c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 19:55:10.1377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wIEFrjyGMxKVlK7LZsu2N0EBEO2REmqIUTmh1EHKCHl4V7jcVvD7oHuCSlommonq9FWAdH+ZyKAU48MakI/lO8ZOGSJk+imEUAz9CxAKTV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5226
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDE0
LCAyMDI0IDc6MjYgQU0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IENh
dml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBHdXB0YSwgc2F1cmFi
aGcgPHNhdXJhYmhnLmd1cHRhQGludGVsLmNvbT47IEt1bWFyLCBKYW5nYSBSYWh1bCA8amFuZ2Eu
cmFodWwua3VtYXJAaW50ZWwuY29tPjsgRGFuZGFtdWRpLCBQcml5YW5rYSA8cHJpeWFua2EuZGFu
ZGFtdWRpQGludGVsLmNvbT47IEhhcnJpc29uLCBKb2huIEMgPGpvaG4uYy5oYXJyaXNvbkBpbnRl
bC5jb20+OyBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPjsgRGl4
aXQsIEFzaHV0b3NoIDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BB
VENIIGktZy10IHY1IDIvMl0gdGVzdHMvaTkxNV9xdWVyeTogQWRkIHF1ZXJ5LWwzLWJhbmstY291
bnQgc3VidGVzdA0KPiANCj4gSGkgSm9uYXRoYW4sDQo+IE9uIDIwMjMtMTEtMzAgYXQgMDg6MDI6
NTMgLTA4MDAsIEpvbmF0aGFuIENhdml0dCB3cm90ZToNCj4gPiBGcm9tOiBKYW5nYSBSYWh1bCBL
dW1hciA8amFuZ2EucmFodWwua3VtYXJAaW50ZWwuY29tPg0KPiA+IA0KPiA+IEFkZCBhIHN1YnRl
c3QgdG8gcXVlcnkgTDMgQmFuayBjb3VudCBmb3IgZWFjaCBlbmdpbmUuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogSmFuZ2EgUmFodWwgS3VtYXIgPGphbmdhLnJhaHVsLmt1bWFyQGludGVsLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBp
bnRlbC5jb20+DQo+ID4gLS0tDQo+IA0KPiBSZXZpZXdlZC1ieTogS2FtaWwgS29uaWVjem55IDxr
YW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KDQoNClRoZSByZXZpZXcgaXMgZ3JlYXRs
eSBhcHByZWNpYXRlZCEgIEhvd2V2ZXIsIGl0IHdhcyByZXF1ZXN0ZWQgdGhhdCBhIG5ldyBVQVBJ
DQpiZSBjcmVhdGVkIHRvIHN1cHBvcnQgYWRkaXRpb25hbCBkYXRhIHJlcG9ydGluZyAob24gdG9w
IG9mIEwzIEJhbmsgY291bnQpLA0Kc28gaXQncyB1bmxpa2VseSB3ZSdsbCBiZSBtb3ZpbmcgZm9y
d2FyZCB3aXRoIHRoaXMgaW1wbGVtZW50YXRpb24gYXMgdGhlIG5ldyBVQVBJDQp3b3VsZCByZW5k
ZXIgdGhpcyBvbmUgb2Jzb2xldGUuDQoNCkknbGwgc3VibWl0IHRoZSBuZXcgVUFQSSBhbmQgdGVz
dCBvbmNlIHRoZXkndmUgYmVlbiBhcHByb3ZlZCBhbmQgcHJvY2Vzc2VkIGludGVybmFsbHkuDQoN
ClRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW5jZSENCi1Kb25hdGhhbiBDYXZpdHQNCg0KDQo+IA0K
PiA+ICB0ZXN0cy9pbnRlbC9pOTE1X3F1ZXJ5LmMgfCAxNDAgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNDAgaW5zZXJ0aW9ucygr
KQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9pOTE1X3F1ZXJ5LmMgYi90ZXN0
cy9pbnRlbC9pOTE1X3F1ZXJ5LmMNCj4gPiBpbmRleCBlOWNjNDk1OTczLi41ZDYxZTE1MDQxIDEw
MDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL2k5MTVfcXVlcnkuYw0KPiA+ICsrKyBiL3Rlc3Rz
L2ludGVsL2k5MTVfcXVlcnkuYw0KPiA+IEBAIC0yNSw2ICsyNSw3IEBADQo+ID4gICNpbmNsdWRl
ICJpbnRlbF9od2NvbmZpZ190eXBlcy5oIg0KPiA+ICAjaW5jbHVkZSAiaTkxNS9nZW0uaCINCj4g
PiAgI2luY2x1ZGUgImk5MTUvZ2VtX2NyZWF0ZS5oIg0KPiA+ICsjaW5jbHVkZSAiaWd0X3N5c2Zz
LmgiDQo+ID4gIA0KPiA+ICAjaW5jbHVkZSA8bGltaXRzLmg+DQo+ID4gIC8qKg0KPiA+IEBAIC0x
MjEsNiArMTIyLDE4IEBADQo+ID4gICAqIFNVQlRFU1Q6IHRlc3QtcXVlcnktZ2VvbWV0cnktc3Vi
c2xpY2VzDQo+ID4gICAqIERlc2NyaXB0aW9uOiBUZXN0IERSTV9JOTE1X1FVRVJZX0dFT01FVFJZ
X1NVQlNMSUNFUyBxdWVyeQ0KPiA+ICAgKiBGZWF0dXJlOiBnZW1fY29yZQ0KPiA+ICsgKg0KPiA+
ICsgKiBTVUJURVNUOiBxdWVyeS1sMy1iYW5rLWNvdW50DQo+ID4gKyAqIERlc2NyaXB0aW9uOiBU
ZXN0IERSTV9JOTE1X1FVRVJZX0wzQkFOS19DT1VOVCBxdWVyeQ0KPiA+ICsgKiBGZWF0dXJlOiBn
ZW1fY29yZQ0KPiA+ICsgKg0KPiA+ICsgKiBTVUJURVNUOiBxdWVyeS1sMy1iYW5rLWNvdW50LWlu
dmFsaWQNCj4gPiArICogRGVzY3JpcHRpb246IFRlc3QgRFJNX0k5MTVfUVVFUllfTDNCQU5LX0NP
VU5UIHF1ZXJ5IGZhaWxzIHdoZW4gYW4gaW52YWxpZCBlbmdpbmUgaXMgcGFzc2VkDQo+ID4gKyAq
IEZlYXR1cmU6IGdlbV9jb3JlDQo+ID4gKyAqDQo+ID4gKyAqIFNVQlRFU1Q6IHF1ZXJ5LWwzLWJh
bmstY291bnQtc3VwcG9ydA0KPiA+ICsgKiBEZXNjcmlwdGlvbjogVGVzdCBEUk1fSTkxNV9RVUVS
WV9MM0JBTktfQ09VTlQgcXVlcnkgZmFpbHMgd2hlbiBpdCBpcyBub3Qgc3VwcG9ydGVkDQo+ID4g
KyAqIEZlYXR1cmU6IGdlbV9jb3JlDQo+ID4gICAqLw0KPiA+ICANCj4gPiAgSUdUX1RFU1RfREVT
Q1JJUFRJT04oIlRlc3RpbmcgdGhlIGk5MTUgcXVlcnkgdUFQSS4iKTsNCj4gPiBAQCAtMTQ3Myw2
ICsxNDg2LDExMSBAQCBzdGF0aWMgdm9pZCBxdWVyeV9wYXJzZV9hbmRfdmFsaWRhdGVfaHdjb25m
aWdfdGFibGUoaW50IGk5MTUpDQo+ID4gIAlmcmVlKGRhdGEpOw0KPiA+ICB9DQo+ID4gIA0KPiA+
ICtzdGF0aWMgaW50IF9fZ2V0X2wzX2NvdW50KGludCBpOTE1LCBjb25zdCBzdHJ1Y3QgaTkxNV9l
bmdpbmVfY2xhc3NfaW5zdGFuY2UgZW5naW5lLCB1aW50NjRfdCAqb3V0KQ0KPiA+ICt7DQo+ID4g
KwlzdHJ1Y3QgZHJtX2k5MTVfcXVlcnlfaXRlbSBpdGVtOw0KPiA+ICsNCj4gPiArCW1lbXNldCgm
aXRlbSwgMCwgc2l6ZW9mKGl0ZW0pKTsNCj4gPiArCWl0ZW0ucXVlcnlfaWQgPSBEUk1fSTkxNV9R
VUVSWV9MM0JBTktfQ09VTlQ7DQo+ID4gKwlpdGVtLmZsYWdzID0gKChlbmdpbmUuZW5naW5lX2lu
c3RhbmNlIDw8IDgpIHwgZW5naW5lLmVuZ2luZV9jbGFzcyk7DQo+ID4gKwlpdGVtLmRhdGFfcHRy
ID0gdG9fdXNlcl9wb2ludGVyKG91dCk7DQo+ID4gKw0KPiA+ICsJaTkxNV9xdWVyeV9pdGVtcyhp
OTE1LCAmaXRlbSwgMSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIGl0ZW0ubGVuZ3RoIDwgMCA/IGl0
ZW0ubGVuZ3RoIDogMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGJvb2wgcXVlcnlfbDNf
Y291bnRfc3VwcG9ydGVkKGludCBpOTE1KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgaTkxNV9lbmdp
bmVfY2xhc3NfaW5zdGFuY2UgKmVuZ2luZXM7DQo+ID4gKwl1bnNpZ25lZCBpbnQgZW5naW5lc19j
b3VudDsNCj4gPiArCXVpbnQzMl90IGNsYXNzOw0KPiA+ICsJdWludDY0X3QgdmFsOw0KPiA+ICsJ
aW50IHJldDsNCj4gPiArDQo+ID4gKwljbGFzcyA9IDB4RkY7DQo+ID4gKwllbmdpbmVzID0gZ2Vt
X2xpc3RfZW5naW5lcyhpOTE1LCAxdSA8PCAwLCBjbGFzcywgJmVuZ2luZXNfY291bnQpOw0KPiA+
ICsJaWYgKCFlbmdpbmVzKSB7DQo+ID4gKwkJaWd0X3dhcm4oIkZhaWxlZCB0byBnZXQgdGhlIGVu
Z2luZXMgbGlzdCBwZXIgdGlsZVxuIik7DQo+ID4gKwkJcmV0dXJuIGZhbHNlOw0KPiA+ICsJfQ0K
PiA+ICsNCj4gPiArCXJldCA9IF9fZ2V0X2wzX2NvdW50KGk5MTUsIGVuZ2luZXNbMF0sICZ2YWwp
Ow0KPiA+ICsJZnJlZShlbmdpbmVzKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gcmV0ID09IDA7DQo+
ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIHRlc3RfbDNfY291bnRfc3VwcG9ydChpbnQg
aTkxNSkNCj4gPiArew0KPiA+ICsJaW50IGRldmlkID0gaW50ZWxfZ2V0X2RybV9kZXZpZChpOTE1
KTsNCj4gPiArCWJvb2wgc3VwcG9ydGVkID0gaW50ZWxfZ3JhcGhpY3NfdmVyKGRldmlkKSA+PSBJ
UF9WRVIoMTIsIDApOw0KPiA+ICsNCj4gPiArCWlndF9hc3NlcnQoc3VwcG9ydGVkID09IHF1ZXJ5
X2wzX2NvdW50X3N1cHBvcnRlZChpOTE1KSk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2
b2lkIHRlc3RfbDNfY291bnRfaW52YWxpZChpbnQgaTkxNSkNCj4gPiArew0KPiA+ICsJc3RydWN0
IGk5MTVfZW5naW5lX2NsYXNzX2luc3RhbmNlIGVuZ2luZSA9IHsNCj4gPiArCQkuZW5naW5lX2Ns
YXNzID0gMHhERUFELA0KPiA+ICsJCS5lbmdpbmVfaW5zdGFuY2UgPSAweEJFRUYNCj4gPiArCX07
DQo+ID4gKwl1aW50NjRfdCB2YWw7DQo+ID4gKw0KPiA+ICsJaWd0X2Fzc2VydF9lcShfX2dldF9s
M19jb3VudChpOTE1LCBlbmdpbmUsICZ2YWwpLCAtRUlOVkFMKTsNCj4gPiArfQ0KPiA+ICsNCj4g
PiArc3RhdGljIHZvaWQgdGVzdF9sM19jb3VudChpbnQgaTkxNSkNCj4gPiArew0KPiA+ICsJc3Ry
dWN0IGk5MTVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplbmdpbmVzOw0KPiA+ICsJdWludDMyX3Qg
Y2xhc3M7DQo+ID4gKwl1bnNpZ25lZCBpbnQgZW5naW5lc19jb3VudDsNCj4gPiArCXVpbnQ2NF90
IGV4cGVjdGVkX2JhbmtfY291bnQ7DQo+ID4gKwlpbnQgbnVtX2d0czsNCj4gPiArCWJvb2wgdW5j
aGVja2VkID0gZmFsc2U7DQo+ID4gKw0KPiA+ICsJY2xhc3MgPSAweEZGOyAvLyBjaGVja2luZyBm
b3IgYWxsIDggY2xhc3Nlcw0KPiA+ICsJZXhwZWN0ZWRfYmFua19jb3VudCA9IDA7DQo+ID4gKw0K
PiA+ICsJbnVtX2d0cyA9IGlndF9zeXNmc19nZXRfbnVtX2d0KGk5MTUpOw0KPiA+ICsNCj4gPiAr
CWZvciAoaW50IGd0ID0gMDsgZ3QgPCBudW1fZ3RzOyBndCsrKSB7DQo+ID4gKwkJZW5naW5lcyA9
IGdlbV9saXN0X2VuZ2luZXMoaTkxNSwgMXUgPDwgZ3QsIGNsYXNzLCAmZW5naW5lc19jb3VudCk7
DQo+ID4gKw0KPiA+ICsJCWlndF9mYWlsX29uX2YoIWVuZ2luZXMsICJGYWlsZWQgdG8gZ2V0IHRo
ZSBlbmdpbmVzIGxpc3QgcGVyIHRpbGUiKTsNCj4gPiArDQo+ID4gKwkJZm9yIChpbnQgaSA9IDAg
OyBpIDwgZW5naW5lc19jb3VudCA7IGkrKykgew0KPiA+ICsJCQl1aW50NjRfdCBsM19jb3VudDsN
Cj4gPiArDQo+ID4gKwkJCWlndF9hc3NlcnRfZXEoX19nZXRfbDNfY291bnQoaTkxNSwgZW5naW5l
c1tpXSwgJmwzX2NvdW50KSwgMCk7DQo+ID4gKwkJCWlndF9kZWJ1ZygiY2xhc3M9JXUgaW5zdGFu
Y2U9JXUgbDMgYmFuayBjb3VudD0lbHVcbiIsDQo+ID4gKwkJCQkJZW5naW5lc1tpXS5lbmdpbmVf
Y2xhc3MsDQo+ID4gKwkJCQkJZW5naW5lc1tpXS5lbmdpbmVfaW5zdGFuY2UsDQo+ID4gKwkJCQkJ
bDNfY291bnQpOw0KPiA+ICsNCj4gPiArCQkJaWYgKElTX01FVEVPUkxBS0UoaTkxNSkpIC8vIEFS
Uk9XTEFLRSAoQVJMKSB0byBiZSBhZGRlZA0KPiA+ICsJCQkJaWd0X2Fzc2VydCgobDNfY291bnQl
MikgPT0gMCk7DQo+ID4gKwkJCWVsc2UgaWYgKElTX1BPTlRFVkVDQ0hJTyhpOTE1KSkNCj4gPiAr
CQkJCWlndF9hc3NlcnQoKGwzX2NvdW50JTQpID09IDApOw0KPiA+ICsJCQllbHNlIGlmIChJU19E
RzIoaTkxNSkpDQo+ID4gKwkJCQlpZ3RfYXNzZXJ0KChsM19jb3VudCU4KSA9PSAwKTsNCj4gPiAr
CQkJZWxzZQ0KPiA+ICsJCQkJdW5jaGVja2VkID0gdHJ1ZTsNCj4gPiArDQo+ID4gKwkJCWlmIChp
ID09IDApIHsNCj4gPiArCQkJCWV4cGVjdGVkX2JhbmtfY291bnQgPSBsM19jb3VudDsNCj4gPiAr
CQkJCWNvbnRpbnVlOw0KPiA+ICsJCQl9DQo+ID4gKw0KPiA+ICsJCQlpZ3RfYXNzZXJ0X2VxKGwz
X2NvdW50LCBleHBlY3RlZF9iYW5rX2NvdW50KTsNCj4gPiArDQo+ID4gKwkJfQ0KPiA+ICsNCj4g
PiArCQlmcmVlKGVuZ2luZXMpOw0KPiA+ICsJfQ0KPiA+ICsJaWd0X3dhcm5fb24odW5jaGVja2Vk
KTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgaWd0X21haW4NCj4gPiAgew0KPiA+ICAJaW50IGZkID0g
LTE7DQo+ID4gQEAgLTE1NzAsNiArMTY4OCwyOCBAQCBpZ3RfbWFpbg0KPiA+ICAJaWd0X3N1YnRl
c3QoImh3Y29uZmlnX3RhYmxlIikNCj4gPiAgCQlxdWVyeV9wYXJzZV9hbmRfdmFsaWRhdGVfaHdj
b25maWdfdGFibGUoZmQpOw0KPiA+ICANCj4gPiArCWlndF9kZXNjcmliZSgiVGVzdCB0byBjaGVj
ayBEUk1fSTkxNV9RVUVSWV9MM0JBTktfQ09VTlQgc3VwcG9ydC4iKTsNCj4gPiArCWlndF9zdWJ0
ZXN0KCJxdWVyeS1sMy1iYW5rLWNvdW50LXN1cHBvcnQiKSB7DQo+ID4gKwkJLyoNCj4gPiArCQkg
KiBUaGlzIHRlc3QgY2FuIGJlIHJ1biBvbiBhbGwgcGxhdGZvcm1zIGFzIHRoaXMgdGVzdA0KPiA+
ICsJCSAqIHNpbXBseSB2ZXJpZmllcyBxdWVyeV9sM19jb3VudF9zdXBwb3J0ZWQgcmVwb3J0cw0K
PiA+ICsJCSAqIGNvcnJlY3RseSBvbiBhbGwgcGxhdGZvcm1zLg0KPiA+ICsJCSAqLw0KPiA+ICsJ
CXRlc3RfbDNfY291bnRfc3VwcG9ydChmZCk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWd0X2Rl
c2NyaWJlKCJCYXNpYyB0ZXN0IHRvIHF1ZXJ5IGwzIGJhbmsgY291bnQiKTsNCj4gPiArCWlndF9z
dWJ0ZXN0KCJxdWVyeS1sMy1iYW5rLWNvdW50Iikgew0KPiA+ICsJCWlndF9yZXF1aXJlKHF1ZXJ5
X2wzX2NvdW50X3N1cHBvcnRlZChmZCkpOw0KPiA+ICsJCXRlc3RfbDNfY291bnQoZmQpOw0KPiA+
ICsJfQ0KPiA+ICsNCj4gPiArCWlndF9kZXNjcmliZSgiTmVnYXRpdmUgdGVzdCBmb3IgRFJNX0k5
MTVfUVVFUllfTDNCQU5LX0NPVU5UIik7DQo+ID4gKwlpZ3Rfc3VidGVzdCgicXVlcnktbDMtYmFu
ay1jb3VudC1pbnZhbGlkIikgew0KPiA+ICsJCWlndF9yZXF1aXJlKHF1ZXJ5X2wzX2NvdW50X3N1
cHBvcnRlZChmZCkpOw0KPiA+ICsJCXRlc3RfbDNfY291bnRfaW52YWxpZChmZCk7DQo+ID4gKwl9
DQo+ID4gKw0KPiA+ICAJaWd0X2ZpeHR1cmUgew0KPiA+ICAJCWRybV9jbG9zZV9kcml2ZXIoZmQp
Ow0KPiA+ICAJfQ0KPiA+IC0tIA0KPiA+IDIuMjUuMQ0KPiA+IA0KPiANCg==
