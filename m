Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B49CD13DA
	for <igt-dev@archiver.kernel.org>; Sun,  3 May 2026 00:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2715810E153;
	Sun,  3 May 2026 00:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrGWNeq7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740B010E153
 for <igt-dev@lists.freedesktop.org>; Sun,  3 May 2026 00:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777769190; x=1809305190;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=G0DofX+HRlSZII7AMcQRoxrI7WMYx/5N3oxCwuE4GdM=;
 b=XrGWNeq7jbaee0jHPF1kvi+gDVr5BxUxroQPPdl5NN3J8IBFSHBkT3lm
 fk85w4XTIg8PDHB4fgg9ok5z9pNqQKCKmHH2idm3X59lLZxgl/i5/EPEp
 h4aiYaQICvr1WYPob2XFDrY7Xirz0Tp+imlU4bM26eGw6p1q8RJgZm5o+
 aBcX/1XEUqsWaTRhobuTBzUMi65dqRZj149wIYficncUfDuGPlEvm4Elx
 Upc23PmL8KkPz+xml4t0iY7UpLCLuFOrssInBuR51ffmb3QR1XGRhSQnv
 5ufsTd/UsyLQx6kWvkrx4ulkx/SaF60mtnbPbGutveQEpHxNYIHaWK26t g==;
X-CSE-ConnectionGUID: hddsw40QQmCj06sK1H9CrA==
X-CSE-MsgGUID: A0nwTuCtQuqIhnPyi8NMCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78671694"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; d="scan'208";a="78671694"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2026 17:46:29 -0700
X-CSE-ConnectionGUID: H4p47hwkTd+ARsFm72Szsw==
X-CSE-MsgGUID: ySl3UQ4KRWOgF+EEup4/Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; d="scan'208";a="230821736"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2026 17:46:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 2 May 2026 17:46:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 2 May 2026 17:46:28 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 2 May 2026 17:46:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2MtoRWQ0GjT2eH3et2IQtHuL2dQELapOolpa3OxKL0q2TgkUqwTcYJ+aLKKBYAh/N57+sq/NmdD4PvJmXmBcb3ekIsTGB7Qze6VhkuCR4Z9dr9iEwgb89FLOx2Ua48RzpHoYKdzzHYKN/6tdlxG7qMLkxwTpH3Vpc/dfkWaKiaeMn6UM0b/eArd3rR/GMB6NBE3UW/UKNCEYpVxgUELVqpk6pRnP59cY+w5/GsoIu5UTBejJBZbCLbztnp8ZG5+gk/ftECLDEZkLKXumuPbuJTFSCyDtA14FKMIE+HOd5YPuqAC6qLrPecBjgj1FmYxaeNUhaIysb1hh/qncL5K5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0DofX+HRlSZII7AMcQRoxrI7WMYx/5N3oxCwuE4GdM=;
 b=m1mDgABDHyoVOLAswkKLKOUhuBmwzJ0l7pRipMI7N6v1HCOBWbjXRz7Sa54k5oJEnzxMkaV03qOiTNFA9h2hW5yzkFwwIniRpBTSRJvFSUYmcyYLxK9EODgnGIlLG+/wRG1AaiKxnlEq+0JFMJ8W1L2zL5Hgc2hG7dgrxmEY5htSNHBO0BDE9DY0x5CBsv7qgyKjSuetrt7e5XLq3jrivXL00OSA+mOTmbkSrqw2suYHdF0flNIVa5mL1pyBO+q/Oc0Xc1iEcl93tPU00vRyNpD/Ug/jWteQlM69AVM9FgifGDCaC2/JXfMK7AHzii/ST9x0kO8TNnU1WhtgwggkYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB6215.namprd11.prod.outlook.com (2603:10b6:8:a9::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.23; Sun, 3 May 2026 00:46:20 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9870.022; Sun, 3 May 2026
 00:46:20 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Wang, X" <x.wang@intel.com>
Subject: Re: [PATCH v2 1/2] tests/intel/xe_exec_multi_queue: use timestamp to
 check job start
Thread-Topic: [PATCH v2 1/2] tests/intel/xe_exec_multi_queue: use timestamp to
 check job start
Thread-Index: AQHc2FdiQc0xVmke00Ka5T/QNmO1YrX7e9IA
Date: Sun, 3 May 2026 00:46:20 +0000
Message-ID: <8f815c90d00b9c7f775725a911b78f088f4a24f1.camel@intel.com>
References: <20260430041055.1901126-4-niranjana.vishwanathapura@intel.com>
 <20260430041055.1901126-5-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260430041055.1901126-5-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB6215:EE_
x-ms-office365-filtering-correlation-id: e043bde5-4af4-44a9-65a8-08dea8ad648a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: jKzfA6dwxzHD7ZCsMbGg7WMxvWgZnYsOTjxyOdtFbtXyB41wPVp+D6LEEYIP8ejyd2Hz9TiHVYWH4DlwQxACSLEOC4QmyQMgkVxPjdAi1oXCOwhEMQrf4MjOzNWwQSizFo27vC2UxwxbF0sVY74i9ae/e/SCajV53g40IcYQUg4eraRSbhNXgvi/hRn7gQ7TD2X0wKeQuZNwKBFLY43xLF19jqvvoF1Hn+59mSbzEfV4uGUhZ0j0flcq2jZndZXMQuM+EMV7TU6Al0f1STnqmz7AVhrTR57V1GeK60mw+ZlhM++4HH72UnZt7FspWxpFShV/LRdp+X92OPzoHMJ+NNAcqD31zL0Catr+oGtjcp8z+bGFq/KprhL2Y2o/4GIcZQhIWjZKTvy11QOak7PgX63+ankjyGotVGqCvrrPZxLqUNrBTzLwr6quE4RqfqccbCCufY+IaDyixmzJ/3c86jo6est60y2QCp1N1PEo0IzlAax+1MOgN57giH6RlQznQz2UhkYWzSIyqnabbEmX/Mc9rMjS3DNR+n2Nt4shYWVkCWF2XBTDMea+4vZVEXkofw48dSIEqGdxgdP36Q7D+YFxKkhGQ6wxNqU7FkrxHH+yci1oG+CAQHvylvxevvB46c3dibzJOnSTDtCCZe3bc0CFEEPiV1PmnFBE/W9nfPrRhgcFQzifKDzq3euH1mDcZ8r7GSUGLarJdr5uUFsQ3/ptUFOaihA+DrW6Fxgrl223rf0ME6P+L9zCKhJtVoOR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFF0UlhhQnBGZU1zRm9CKzZWUHdkb2k1cnJyaUVOa21VV0QvM0xtZVd4M3FW?=
 =?utf-8?B?eWRmSUtwV2ROaDBMWlIzQzVNNmdDMWluSzFTNm9vVjVNak1DUUY2ZHFiazRj?=
 =?utf-8?B?cExRVkdPQlRJSkY3dm5SK3I3UUdTMEJJbWtudG9kSzg3VUl3UWNJRFlzMkJD?=
 =?utf-8?B?RUFyNVpMZkRUdDZqTFRLR20zZ1VlN1ZUNmxIbUhycnRFVzVYbGQ4RkJqVmdX?=
 =?utf-8?B?a3g2WnBidyt3bDF0UmxNeUFqZUkwS2pJaGNBM3pyV2dHekRqWmRyci9rcmdk?=
 =?utf-8?B?QzhtTU5QSjBYN3B3WGFkd25TTlAwZUxpbVdNWjJQTi9WdmVWdURpOXRLSWp5?=
 =?utf-8?B?TlRMQVVtUmpxWWdJOU5qL3ZhM012YXJvWjgxczQvSzEwZ2QyL2l4bitSK21L?=
 =?utf-8?B?Vmh0K2VrbzNkSXZrT2J4eDh5aExicmhIakZEbmtlTTJZNFhrOUsyWnNHY0JN?=
 =?utf-8?B?ak80azduclVWRDlseENBRlp0S0tocUgrNnkrMDVFc1k4a3dYYzVYRzFOaExs?=
 =?utf-8?B?akp3ZjdLN3lxc201a1hMOFliL2VBejJab3ljL2ZWUWtCcHRQcFV2aE5GQVh6?=
 =?utf-8?B?eXpBOTVQL1BpTHNyUGlIcjV2QlB3Tlc1S200em5Kb0dPRk5rcmozdk5MWWhv?=
 =?utf-8?B?TSttRlliV1N4RzRLR2xKNHQ1VmMzNnJFOU9KUlZhYnAvMURjTHoxNFBHT3pZ?=
 =?utf-8?B?bzdiS05ESVQ2R1RpUE9XaXdDK3JzVXg4WFViOGpEREx2MkhJUGNuN1ZVa1R0?=
 =?utf-8?B?V0paeE9qUy90cHdhSHRCS0R4RE1yZ0FFdHBHTlBlTWNZcWRxQ2dMU1NhK3ZZ?=
 =?utf-8?B?cUlNTVIxUmJ2am9qY2YwTVB0YWNTRXhWTzZDQ2doTjl2S1I5RWdRaGQvOUlQ?=
 =?utf-8?B?K05IWXhNSytJdWRxdGRUejVhZ29YdUVZTGdzTnNEZ2k4Y2UrZW81NXhWZkhU?=
 =?utf-8?B?cm9uQjZLQm5YR284KzQ0WEN1aGlBMEhZRlRMaUhjMUhyZ2lCUllQemhjN0Ro?=
 =?utf-8?B?ZWRnYnBlZFFPMCt0VE4xZnV6R2dWaFVSOWdqRXhiVlp2Y29rUGExdWtBbGxU?=
 =?utf-8?B?YnFQVElYSm1EM2h1SFFPSXRqTWpJQjhBbGdnUTRUWGIzNWEwT2tXRS84UVBV?=
 =?utf-8?B?ZWlCMEJHdmFrY1RJbUM3VllVYVhKUklZckg0MS9GWk5SbjRieTBrK1N4c1o3?=
 =?utf-8?B?QTJjaTIyMmpUdzBYNnYxbVl3ZVhwYUhmV1prT2RKQWxOeitsdWkra0sycUsy?=
 =?utf-8?B?RUNRb2RITFdXYlo0TnpYZno3eXV2dlh2RDc2THJnWlRWSFFvOXlxZjZTOWx3?=
 =?utf-8?B?TSt6RmtoV25mVFFSQ1RFUlZPZTVtTE9nSUpyeFIrWnpPTUhHT2J5bUlqL0R3?=
 =?utf-8?B?VFRkQXhNNTdMWlc5Z2FRcVFYQjJnUE5idmMyVW1zUytXZGhzRW1FTCszdWF4?=
 =?utf-8?B?MS9VSDd5T2JYNkhScElUbzFkbDNKNlZZbVpyN00rZ09lcm9tUEZ2VTRWdFlI?=
 =?utf-8?B?Z1lXREVMWmwyRk0vaWZqUXFwQVdEbkRjM3B5WHcxdTVSTkpIcEtFanU0aVVB?=
 =?utf-8?B?NDlEbzhUUy9UT1VWTVhaQ25jWmZZWHF4cHZQRzI3eEh5ZFlidDkvRDhwTmdi?=
 =?utf-8?B?Yk9ZbitLZXFzYkliWkp4L0NUcTQyOXRIVllUazBHU1RSTFdQemY3OVhJcjhw?=
 =?utf-8?B?dXM3amJZZEE5Y2Z2UXJuWDA5T0tSZmE1enY4cXFwUmVvdWo3Z0dWTWttcnhR?=
 =?utf-8?B?MStoUmRiYitKT3FIcmpxN2lxNWVkV3R4VUxOSEdLUGpUUFd3Mkc1dkxjU09o?=
 =?utf-8?B?T00wRGZrck01N1hkNGNIa2NZZ3FJSWxJeDZhblVFSEVuemdJakFubWlMUkFr?=
 =?utf-8?B?OHM0dmZ3UGd0SFBJcWtNRTdkWEFJbGZ1ajdPcGtvRnRaMjlsV1dYaVhycXhp?=
 =?utf-8?B?VTR2NmswaDdyTjRTZ0pWem0rRWRtWVdsODZnUFVPVlpZeUpPTVc1YlNaTWRZ?=
 =?utf-8?B?MC9kZ1VieWM2cUpzeFhaV08vcmZSdng4dmt1Wmc4ZllnWEJubUtCYzFlaEV5?=
 =?utf-8?B?TlJGTFpWL2IrSHdqNXEyMHpYQkZNWTBOYjJVWEhabjBvVm9IMmFZeU43d1g3?=
 =?utf-8?B?VEw3eE51Rm9Gd3JEbGJTMTBrTXVHM3ZaU0l2Y2UzamFNLzlEQ3FKaTkzT2ox?=
 =?utf-8?B?bkVyOStMVnpxdkhkcnRITnVDcGM4VDFJTGU4WG1sYXhmbVpYRjh0V2hKMzBz?=
 =?utf-8?B?bWIzZGJWWEl4aW1KNnZSWm1mVTN4S2lpRVBCVGkzdVBBZFllZzVqUnpxbEZX?=
 =?utf-8?B?THVONzQrTGY0VVJNZ2I3UjZtenVFem55VjhvdlNvMVBDVmVpd1AvWUxPWVlu?=
 =?utf-8?Q?uh8BVX+He7/uQDx8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BA53E3D30349A4C84CEB19722D8C4D0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RBBVnJRkKPUD37o2u+q771vhQbXOTAbGxUiBK2lIPwHpiNN/yvDDBl/nfK/tMnCFnXPDN9gBkoE/1GHSJlTIoetzr0Oskz6h+SoRwVktu+GioRiFJ/91+LMtYuYxiM5RJnq6/OHmFyUtHOQlvmOaLvznqO+OOpq8bvR37rEQd9G/NpqZTXJ4RfPO7FMfE5T9fhsa5VZ4kgMq1AByQeDUkP7FjrZQe/s6yHdXhr7ulmgttktYMK8srVOSgirULZ+o7tudaNuoiLuJfpUMbSPtWXREvkNVYS2GsBEdmFbMz649xWbWOL3rts4I4YDVN7vf2vlB6DWiCZxqpWC2cHXzXg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e043bde5-4af4-44a9-65a8-08dea8ad648a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2026 00:46:20.1622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qBA4qaWenodQDiF3gHDyVcOvkmTmrFYjo9VMx4wTCyH1vh+aUX02mLa+pUecZB9dTdwMwlvY8137fgA2RMXLEbxaQNZv2uYr6T6ncF8g+5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6215
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

T24gV2VkLCAyMDI2LTA0LTI5IGF0IDIxOjEwIC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEluIF9fdGVzdF9wcmlvcml0eSgpLCBlbmFibGUgd3JpdGVfdGltZXN0YW1w
IGluIHhlX3NwaW5faW5pdF9vcHRzKCkKPiBhbmQgdXNlIHRpbWVzdGFtcCB2YWx1ZSB0byBkZXRl
cm1pbmUgdGhlIHF1ZXVlIHN3aXRjaCBvcmRlci4gVGhpcwo+IHJlcGxhY2VzIHRoZSBpbmRldGVy
bWluYXRlIHNsZWVwKCkgd2l0aCBhIG1vcmUgZGV0ZXJtaW5pc3RpYyB3YWl0Cj4gYmFzZWQgb24g
dGhlIEdQVSB0aW1lc3RhbXAuCj4gCj4gUHJlLXNldCBhbGwgc3Bpbm5lcnMgdG8gcHJlZW1wdC13
YWl0IGJlZm9yZSBzdWJtaXNzaW9uIHNvIGVhY2gKPiBxdWV1ZSwgb25jZSBzY2hlZHVsZWQgYnkg
SFcsIGJsb2NrcyBhdCB0aGUgc2VtYXBob3JlLiBUaGlzIGVuc3VyZXMKPiBhbGwgcXVldWVzIGFy
ZSBydW5uaW5nIG9uIEhXIGJlZm9yZSB0ZXN0aW5nIHByaW9yaXR5LWJhc2VkCj4gc2NoZWR1bGlu
Zy4KPiAKPiB2MjogUmVhZCB0aW1lc3RhbXAgdG8gY2hlY2sgaWYgcXVldWUgaXMgc3RhcnRlZAo+
IMKgwqDCoCBVc2UgdXNsZWVwIHRvIGVuc3VyZSBhbGwgc2VtcGhvcmUgdXBkYXRlcyBhcmUgdmlz
aWJsZSB0byBHUFUKPiAKPiBBc3Npc3RlZC1ieTogR2l0SHViIENvcGlsb3Q6Y2xhdWRlLXNvbm5l
dC00LjYKPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhCj4gPG5pcmFu
amFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPgo+IC0tLQo+IMKgdGVzdHMvaW50ZWwveGVf
ZXhlY19tdWx0aV9xdWV1ZS5jIHwgNTcgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KPiAt
LQo+IMKgMSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBiL3Rl
c3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYwo+IGluZGV4IGNhOTYwOTlkMzYuLjBiMzFk
ZDdhM2YgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jCj4g
KysrIGIvdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jCj4gQEAgLTQ1NCwyNSArNDU0
LDI0IEBAIF9fdGVzdF9wcmlvcml0eShpbnQgZmQsIHN0cnVjdAo+IGRybV94ZV9lbmdpbmVfY2xh
c3NfaW5zdGFuY2UgKmVjaSwKPiDCoMKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IG51bV9x
dWV1ZXM7IGkrKykgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdWludDY0X3Qg
c3Bpbl9hZGRyID0gYWRkciArIGkgKiBzaXplb2Yoc3RydWN0Cj4geGVfc3Bpbik7Cj4gwqAKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfc3Bpbl9pbml0X29wdHMoc3BpbltpXSwg
LmFkZHIgPSBzcGluX2FkZHIsCj4gLm11bHRpX3F1ZXVlX3N3aXRjaCA9IHRydWUpOwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9zcGluX2luaXRfb3B0cyhzcGluW2ldLCAuYWRk
ciA9IHNwaW5fYWRkciwKPiAubXVsdGlfcXVldWVfc3dpdGNoID0gdHJ1ZSwKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAu
d3JpdGVfdGltZXN0YW1wID0gdHJ1ZSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oC8qCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFByZS1zZXQgYWxsIHNwaW5u
ZXJzIHRvIHByZWVtcHQtd2FpdCBzbyBlYWNoCj4gcXVldWUsIG9uY2UKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICogc2NoZWR1bGVkLCBpbW1lZGlhdGVseSBibG9ja3MgYXQgdGhl
Cj4gUVVFVUVfU1dJVENIX01PREUgc2VtYXBob3JlCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqIGFmdGVyIHdyaXRpbmcgaXRzIHRpbWVzdGFtcC4gVGhlIEhXIHN3aXRjaGVzCj4g
YmV0d2VlbiBxdWV1ZXMgYXQKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdGhp
cyBwb2ludCwgYWxsb3dpbmcgYWxsIG9mIHRoZW0gdG8gc2NoZWR1bGUKPiBkZXRlcm1pbmlzdGlj
YWxseS4KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHhlX3NwaW5fcHJlZW1wdF93YWl0KHNwaW5baV0pOwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3luYy5hZGRyID0gc3Bpbl9hZGRyICsgKGNoYXIg
Kikmc3BpbltpXS0+ZXhlY19zeW5jIC0KPiAoY2hhciAqKXNwaW5baV07Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBleGVjLmV4ZWNfcXVldWVfaWQgPSBleGVjX3F1ZXVlc1tpXTsK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGV4ZWMuYWRkcmVzcyA9IHNwaW5fYWRk
cjsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2V4ZWMoZmQsICZleGVjKTsK
PiAtCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIFdhaXQgZm9yIGpvYiBvbiBR
MCB0byBzdGFydCwgb3RoZXIgcXVldWVzIGJsb2NrCj4gYmVoaW5kIFEwICovCj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghaSkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3NwaW5fd2FpdF9zdGFydGVkKHNwaW5baV0pOwo+IMKg
wqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBzbGVlcChzbGVlcF9kdXJhdGlv
bik7Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoC8qCj4gLcKgwqDCoMKgwqDCoMKgICogRXhwZWN0IHRo
ZSBqb2Igb24gb3RoZXIgcXVldWUgdG8gbm90IGdldCBzY2hlZHVsZWQgd2hpbGUKPiB0aGUgc3Bp
bm5lcgo+IC3CoMKgwqDCoMKgwqDCoCAqIG9uIHEwIGlzIG5vdCB3YWl0aW5nIG9uIHByZWVtcHQg
Y29uZGl0aW9uLgo+IC3CoMKgwqDCoMKgwqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDCoGZvciAoaSA9
IDE7IGkgPCBudW1fcXVldWVzOyBpKyspCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGlndF9hc3NlcnQoIXhlX3NwaW5fc3RhcnRlZChzcGluW2ldKSk7Cj4gK8KgwqDCoMKgwqDCoMKg
LyogV2FpdCBmb3IgYWxsIHF1ZXVlcyB0byBzdGFydCBhbmQgd3JpdGUgdGltZXN0YW1wICovCj4g
K8KgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IG51bV9xdWV1ZXM7IGkrKykKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgd2hpbGUgKCFSRUFEX09OQ0Uoc3BpbltpXS0+dGltZXN0
YW1wKSk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGZsYWdzICYgRFlOX1BSSU9SSVRZKSB7
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBBc3NpZ24gaW5jcmVhc2luZyBv
cmRlciBvZiBwcmlvcml0eSBmb3Igc2Vjb25kYXJ5Cj4gcXVldWVzICovCj4gQEAgLTQ4NSw2ICs0
ODQsMzYgQEAgX190ZXN0X3ByaW9yaXR5KGludCBmZCwgc3RydWN0Cj4gZHJtX3hlX2VuZ2luZV9j
bGFzc19pbnN0YW5jZSAqZWNpLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2xl
ZXAoc2xlZXBfZHVyYXRpb24pOwo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiArwqDCoMKgwqDC
oMKgwqAvKgo+ICvCoMKgwqDCoMKgwqDCoCAqIENsZWFyIHRpbWVzdGFtcHMgYW5kIHJlbGVhc2Ug
YWxsIHF1ZXVlcyBmcm9tIHRoZSBzZW1hcGhvcmUKPiB3YWl0Lgo+ICvCoMKgwqDCoMKgwqDCoCAq
IFRoZSBvcmRlciBpbiB3aGljaCB0aGV5IG5leHQgd3JpdGUgYSB0aW1lc3RhbXAgcmV2ZWFscyB0
aGUKPiArwqDCoMKgwqDCoMKgwqAgKiBwcmlvcml0eS1iYXNlZCBzY2hlZHVsaW5nIG9yZGVyLgo+
ICvCoMKgwqDCoMKgwqDCoCAqLwo+ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBudW1f
cXVldWVzOyBpKyspIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgV1JJVEVfT05D
RShzcGluW2ldLT50aW1lc3RhbXAsIDApOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB4ZV9zcGluX3ByZWVtcHRfbm93YWl0KHNwaW5baV0pOwo+ICsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgLyoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogRm9y
IFEwLCB3YWl0IHVudGlsIGl0IGlzIHJ1bm5pbmcgYWdhaW4gdG8gZW5zdXJlCj4gaXQgaG9sZHMg
dGhlIGVuZ2luZQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB3aGVuIHByaW9y
aXR5IGFyYml0cmF0aW9uIGlzIHRyaWdnZXJlZC4KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghaSkKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHdoaWxlICghUkVBRF9P
TkNFKHNwaW5baV0tPnRpbWVzdGFtcCkpOwo+ICvCoMKgwqDCoMKgwqDCoH0KPiArCj4gK8KgwqDC
oMKgwqDCoMKgLyoKPiArwqDCoMKgwqDCoMKgwqAgKiBTbGVlcCB0byBhbGxvdyB4ZV9zcGluX3By
ZWVtcHRfbm93YWl0KCkgdG8gYmVjb21lIHZpc2libGUKPiB0byB0aGUgR1BVCj4gK8KgwqDCoMKg
wqDCoMKgICogZm9yIG90aGVyIHF1ZXVlcyBiZWZvcmUgY2hlY2tpbmcgaWYgdGhleSBoYXZlIGJl
ZW4KPiBzY2hlZHVsZWQuCj4gK8KgwqDCoMKgwqDCoMKgICovCj4gK8KgwqDCoMKgwqDCoMKgdXNs
ZWVwKDEwKTsKCk9rIEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIHNsZWVwLiBUaGUgZmFj
dCB0aGF0IHdlIGhpdCB0aGUKUkVBRF9PTkNFKHRpbWVzdGFtcCkgYWJvdmUgbWVhbnMgd2Ugc2hv
dWxkIGJlIGluIGEgd2FpdGluZyBzdGF0ZSwgc28KSSdkIGV4cGVjdCB0aGUgYXNzZXJ0cyBiZWxv
dyB0byBhbHdheXMgcGFzcy4gSWYgdGhleSBhcmVuJ3QgdGhhdCBzZWVtcwpsaWtlIGEgYnVnIHRv
IG1lLiBBbmQgaWYgdGhleSBhcmVuJ3QgcGFzc2luZyBiZWNhdXNlIHRoZSB0aW1lc3RhbXAKd3Jp
dGUgdG8gMCBpbiB0aGUgZm9yIGxvb3AgYWJvdmUgZGlkbid0IHRha2UgYmVmb3JlIHdlIGhpdCB0
aGUgbm93YWl0CmF0IGxlYXN0IG9uY2UsIHRoYXQgYWxzbyBzZWVtcyBsaWtlIGEgYnVnIHRvIG1l
LiBEbyB3ZSBuZWVkIHRvCnNvbWV0aGluZyBlbHNlIHRvIGZsdXNoIHRoZSB3cml0ZSBpbiB0aGF0
IGNhc2U/IE9yIHdoYXQgaXMgdGhlIHJlYWwKcHJvYmxlbSB0aGVyZT8gV2hhdCBpcyB0aGUgc2ln
bmF0dXJlIHlvdSBzZWUgaWYgeW91IHJlbW92ZSB0aGlzIG9uIGEKc3VmZmljaWVudGx5IHNsb3cg
cGxhdGZvcm0/CgpUaGFua3MsClN0dWFydAoKPiArCj4gK8KgwqDCoMKgwqDCoMKgLyoKPiArwqDC
oMKgwqDCoMKgwqAgKiBWZXJpZnkgdGhhdCBzZWNvbmRhcnkgcXVldWVzIGhhdmUgbm90IGJlZW4g
c2NoZWR1bGVkIHdoaWxlCj4gUTAKPiArwqDCoMKgwqDCoMKgwqAgKiBob2xkcyB0aGUgZW5naW5l
Lgo+ICvCoMKgwqDCoMKgwqDCoCAqLwo+ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDE7IGkgPCBu
dW1fcXVldWVzOyBpKyspCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9hc3Nl
cnQoIVJFQURfT05DRShzcGluW2ldLT50aW1lc3RhbXApKTsKPiArCj4gwqDCoMKgwqDCoMKgwqDC
oC8qCj4gwqDCoMKgwqDCoMKgwqDCoCAqIFRyaWdnZXIgYSBxdWV1ZSBzd2l0Y2ggYnkgbWFraW5n
IHRoZSBzcGlubmVyIG9uIHEwIHRvIHdhaXQKPiBvbiBwcmVlbXB0Cj4gwqDCoMKgwqDCoMKgwqDC
oCAqIGNvbmRpdGlvbiwgYWxsb3dpbmcgam9iIG9uIHExIHRvIGdldCBzY2hlZHVsZWQgYW5kIGZp
bmlzaC4KPiBXaGVuIHdlIGVuZAo+IEBAIC01MDEsNyArNTMwLDcgQEAgX190ZXN0X3ByaW9yaXR5
KGludCBmZCwgc3RydWN0Cj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLAo+IMKg
wqDCoMKgwqDCoMKgwqBpID0gMTsKPiDCoMKgwqDCoMKgwqDCoMKgd2hpbGUgKGkgPCBudW1fcXVl
dWVzKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmb3IgKGogPSAxOyBqIDwg
bnVtX3F1ZXVlczsgaisrKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAoeGVfc3Bpbl9zdGFydGVkKHNwaW5bal0pICYmCj4gKChhbHJlYWR5X2lu
X29yZGVyICYgKDEgPDwgaikpID09IDApKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoUkVBRF9PTkNFKHNwaW5bal0tPnRpbWVzdGFtcCkgJiYK
PiAoKGFscmVhZHlfaW5fb3JkZXIgJiAoMSA8PCBqKSkgPT0gMCkpIHsKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhcnRf
b3JkZXJbaV0gPSBqOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9zcGluX2VuZChzcGluW2pdKTsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVf
d2FpdF91ZmVuY2UoZmQsICZzcGluW2pdLQo+ID5leGVjX3N5bmMsIFVTRVJfRkVOQ0VfVkFMVUUs
Cgo=
