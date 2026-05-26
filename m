Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2177DCD5BCF
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 07:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8A910E519;
	Tue, 26 May 2026 07:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6Cse7L9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C7910E519
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779781229; x=1811317229;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G4AhAf7RRadWJQ0ThaDl88Mpc8IhHV+82x5xklvUBy0=;
 b=W6Cse7L9OD6zE4evnHiBTo0GARcKlsnUJN9O+xruRTlkNxYsnDluyqAJ
 iP6FGEXowZQyR5L+zOTcaX5FeF9EUBLQGwS03lpsy5i1GLWE4LyHFZfC6
 JD4rn5y2XZL0om6hemaym/y8bpOm1qZzdN/OB2u/fuh8r2VR2C876Rp6v
 Re7WoqB8UnnzzRTQqs/cNqREBDiZiJzSFWxCZxOvUrtxMWm3dgTKQpWbN
 EkruK3MbIdQc8FQri2Mk99m/PT5ImYUdPmZixGIOeL2GOuPPtsdcJ9XxK
 XK+G75Zo8pda+mqMkLxU6Bcns5dq7Tu13+34XsO/npsYZiCbVJm2vReTM A==;
X-CSE-ConnectionGUID: mqOeCvtxRJ2KzZxw6R/i4A==
X-CSE-MsgGUID: 7CVQ/TfURX+7voNYFHnbqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91278083"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="91278083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 00:40:28 -0700
X-CSE-ConnectionGUID: xSSlPQPxTeuzjUkd2XaGwA==
X-CSE-MsgGUID: yQ1Ux7T+TAWJWBylPwsMHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="238824890"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 00:40:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 00:40:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 00:40:27 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 00:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCcYQxXRvuLaAd2t4Zybu5SgXAi7+xxv/SsK45HcLe2DlrPigzCmM4aFm8D0rsHaxCD7E4y5BHx6zP8tW/+586fATS8DldFfeNJDKp0LIjHpg0Ag1WI6bffpTPW1tKjEbX9Mm1F6d9IGrsJ2bSd6LxXk/yz/YV6Y0zteaMJW9xyXTXBPHjp+ujSUGRDJN0VQJKk2phhpA0JQgf9Q8AMHhMa+POvo3MDyYKxzE3n1Ne4jitiEKWCL4EUki+V5FjhpZ0rciwxzQSn4Uh0k40sn2ADGmHlb7T4M7ipyHgWLOftaI6s/mQ/5NFK1w+qt9dItMYUqQ5q2PjywTOazyxqT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4AhAf7RRadWJQ0ThaDl88Mpc8IhHV+82x5xklvUBy0=;
 b=WDSuF7ovnDYxj2Z7tsP5VHcd/uYQNV37000+vNngcP6AkfZZzIigqQQtEuIQD22wjqdMVbTCAeVS0bsLuMS/p+QIhN0j1yu4wyElOvBRoFIxHamliSmMMFgkLSFYteendcss2YBmS+Y3liiKeDIhmerGwj7LzTBMmA/kGxtnKrZiMEj//HKhxkdrIZLve46qW7wM76+CbJxT6ePCtB2S2Biem58p2zAXAYTu/2DZwWCi2kh8Kg5KwEjPz8996qaMI+vP6nReo9mPiZhVvgaaz/wUWDs7kY3MnUXgYRwkqNi3KFRDF6ZKghREIKw/8/540V9yjIL5Y6ryCJgmYRn4Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DM4PR11MB8227.namprd11.prod.outlook.com (2603:10b6:8:184::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.20; Tue, 26 May 2026 07:40:25 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0048.013; Tue, 26 May 2026
 07:40:25 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: Manuel Ebner <manuelebner@mailbox.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Manna, Animesh" <animesh.manna@intel.com>, Dibin Moolakadan Subrahmanian
 <dibin.moolakadan.subrahmanian@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v7 5/7] tests/intel/kms_pm_dc: Add new test for
 dc3co framedrop validation
Thread-Topic: [PATCH i-g-t v7 5/7] tests/intel/kms_pm_dc: Add new test for
 dc3co framedrop validation
Thread-Index: AQHc7NrnToe659PqY0epxJIdLplZqrYf5gCAgAAFl/A=
Date: Tue, 26 May 2026 07:40:25 +0000
Message-ID: <DM4PR11MB631253AADD38CDE65601A957900B2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260526064105.1818876-1-jeevan.b@intel.com>
 <20260526064105.1818876-6-jeevan.b@intel.com>
 <9af879858bda09b11af3a4f4cd216b5876be4068.camel@mailbox.org>
In-Reply-To: <9af879858bda09b11af3a4f4cd216b5876be4068.camel@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DM4PR11MB8227:EE_
x-ms-office365-filtering-correlation-id: 687bd365-1e47-4c60-3071-08debafa0d1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|22082099003|11063799006|18002099003|56012099003|3023799007|6133799003|4143699003;
x-microsoft-antispam-message-info: Osu89JKkjPPOtT6ly21muXtTC7fLqhzQKRFM8g+lV0t2iJLQxWDt+bw56lGN9JUZum6r9U9bASqMEL60kwTceEwGAJEmSFTVm/3niKibjjUcE5aQzcwgQfAJ9fGHIExzoLhPpHLBvhw2dgCkKKR3mywVQPfcTgj4JOzutNsI5Q4VcOmbyqdntLjd/6yt3O0UiF/iXNcwokFXPjooGQfwi1qay2lvXFKOM8RvQNyIdvsqjM3rNKqqhbPhC/FyXuKJVccVxCwGjxsCRVzYItbdoD/T6No6kb+tFz1C2xLiNQgcfBcVy4ZosFiqacPBpxTW9RHi28eqKTzYSIeFr+RSa8sbFi1jcBofHF6mcB6p7DK1ZqZSxP/qecP9nzUTDuIXR0xfjDSyg0+TlebYTjkRKuQeNH2CsixHz4uClZ20hPnSgYR8xTI0Wc8qdyZkdkQ+l7Lr80FAwZQ6/sNlYHYrPUexy54l10JL9xSv0dnDF2x7He1vsaU7UMgAt0sleL1IN4zs4+u4e9HA5Er9HyWMBA6hvowsgfX4ftZfcn9DoGc27MEVMpqJ96XfhJCHKkn9Jx6MwMcjQN/4Bw6k8fuu6JVcxGHWEVacWTTi7KayRgrXLBmYT7wMNW1HrH3wYGvBqqoO+ctBAMBYwPeAjO9UNZgaxR9hE8b74uTb54otOHMaecmLxF1FU+ejK/hitdk4Eiqtp8TfXCdRIGjYrNwYbyvS8l3h16BZFFh8sH0ijGckM1whMPQ+G1lgZ/SS7v+c
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(11063799006)(18002099003)(56012099003)(3023799007)(6133799003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVQzU0Nhd0psT3Y4cHJ1MDBVVDNpVXlWd0pYY1YrQ1Q0dEJxMy91QzdZTVRF?=
 =?utf-8?B?RWFhUWw4OVVWcWttZVRPMXlSRVY4a3RTeGV4cGJKNUprMWRxcHlJS05NYkFD?=
 =?utf-8?B?eEhXa0lFTmNpV1NpVFIxZ3l0SW1Xb0JnL3oxMGdUVk85d1N5SFk0elFtZ1Vp?=
 =?utf-8?B?aWpZMFQybnhuYjEvVkJSRE9jUEFia2hiSWVZMkZnYVhQdWFxaEc2RTNaNzY3?=
 =?utf-8?B?Wi9Ub1poRmFldkpJa0JSZ0RScFIwd1ljSUJ5aE56Yi9MY1h2QUVoenROSzB1?=
 =?utf-8?B?U284WkUwcVRVQzVVM3crSzVSV01JTCthL082cFBLRlV4ZEJJVXFHaTJ0bUpV?=
 =?utf-8?B?dHJyTzdzOVVLMS94eHdDTnR5a0lxNVNWbk1TanVjaDdUK1F3SVFObk5OTnNn?=
 =?utf-8?B?VDhpdS80V3lQQ1NtMDlUL2VxclhadDdzSU4weGJkTUZkTlFDbDBIUnY0UE1j?=
 =?utf-8?B?MFY0RkU1dUIxWHcwL2xqNXc2MlBpVS9iM3ZrWEJRbWdhMlpLQ2xTSUJ0OTBO?=
 =?utf-8?B?dmtaMzJsR3FwTEI0NkVqdlZEUnNEZmtCQ3lMQ25MRmtmRlNVbFdiSW5MVENT?=
 =?utf-8?B?M0s1YllTUVQyOXVwR3loSVM2UjB1RVdnNkRqMXBKc3lRZVNqRGtXYlQrYmtk?=
 =?utf-8?B?Rml6NDR3L01xWmlkV2s2ZGlPWW94ZnJKREpKOUxGd25aUkRSb0U1dS9hUzBJ?=
 =?utf-8?B?OU8ySXpkN2pHaFdtcGxCeFJhY0JpUVF4Q2RoTWF0Z09yaWprL1ZRQWpuVGsv?=
 =?utf-8?B?QUh6bTJsbkIvc2w0RVYxb2dFbnNXRjBMd1ppaDJwT21IdVQ5azNod3kzZW10?=
 =?utf-8?B?NEhDYTdQbVhBbzJ4c2VQUHJrTC81TTcvL2szWDBlMzNRTjFSZFZnQnoyajBn?=
 =?utf-8?B?cmloVjU1QllvSUVUNG5zdEhVZXZvd21yMTIvV3RDUGtIZXNZbnovY2RUWFdM?=
 =?utf-8?B?Q2E1U0RiTmhaNjYwb2pPV2FxUDFOVUh2UmJpQmVjbHNOK1Q0RVZVVTAybjlz?=
 =?utf-8?B?d3NtaHdWZmZrQUx4SDM0Tmhmem14enhWcGtpREFiaDZYbHdqZ2F3Mkd2Kzg1?=
 =?utf-8?B?SnFMRGU1SlA1SE02RC9XVE9SRHpzOFpGSDRqcjJRay9yaWc4aHo2cno4OEtJ?=
 =?utf-8?B?MFpDV2M1bnhoUEZKT2QzK0pLcWk1SGZXK01WNmFKOExTaldVSXFYYk9ucUVC?=
 =?utf-8?B?SmFrbzV5d1lYYXZFTVNNSm4xYURUMzFmMDZuVE0yS0hrRk1WZGFseWhUQnQy?=
 =?utf-8?B?YUNVRGt3MVpCVTFuSUxLeVlGVWhpK0VhSVdnemlZS3ZXbC8zaTRxMmxEam5s?=
 =?utf-8?B?ekl2cDRoaCtYUUtndzN6czZTU0tqOXNRbCtiRGlZdEk5d0o0RDIxMk84WXJt?=
 =?utf-8?B?NVJIb3pqMHdmeW1MT0JoT29ta3lOWStYZG5FbzFLRzltSkowKzFBNWh0MFNt?=
 =?utf-8?B?NGRPcFpkWU1MSGxzWmt5QlJ3b3ZrYWlUU3BpY2R4VFZBTzhhUjI5YXVtdndl?=
 =?utf-8?B?V01ZVTkrcloyUVloV282T2ZHdFJTTXZrd05VQ1RLeUVmeXVWTlI0cE5UazhP?=
 =?utf-8?B?dGhYSGJKMVo2SGU2VUlUSVdwNnVibE1xTDlMbHJqVUphbldvc0JEeUxNcGRj?=
 =?utf-8?B?ZTFTVGgyL2l4TWFiMHJ2OFFCMHlBNWZLeTI0QzFoa0VUc3Z6ZE5rZURRdmly?=
 =?utf-8?B?SFYyVmt5b0M1cUszQm5GRzVmK2krb3JQKzkyMHcvcnIvUEtIOFVJeXdCcUxm?=
 =?utf-8?B?MkxWeUIzd1o4SjhCNms1OWwzUk9QMVVCN0o2Z0pOV0h0c1pkYmJZOFVYeUxO?=
 =?utf-8?B?cGhkR1lNaHlWWWxvWit2Y0ZyWHlvcGdqd1lCbnhPQkl5WG9ZUHN0Q05SMyta?=
 =?utf-8?B?R1JGRWlSWkdkdDFxWHhNUlgwaENwWTdZdSsra1NMNlZmY1JCRmx5K0hKa2Fm?=
 =?utf-8?B?a3g3aUcydjUrMG5ZcHpSSWNkVEVOd05nelZXTmVEMzF5bk5UNTF3RG5JNE1U?=
 =?utf-8?B?N0FRTlBZSVVIMFVCQStYUzlxZ1RYeGl3cHFVaUJ6clVhUlpJQ2l6enlpMmZn?=
 =?utf-8?B?aGdDUTVvUHdCQmtKMzk0ZmsxRjNoaGtWQjdMOWxML2p6WGRLZXRrYzlnZDNW?=
 =?utf-8?B?dmprZ3g1ejNLVXN4VmdpU1dUSUZXc0FzSzFic21yVmFHeDlHNFdGcVVYSlRO?=
 =?utf-8?B?bUcrU2YrTDFNR2xsMmo0ZnlQeUtYTVdHRlhQczFvSFFtSit5WkdaSURpV2Z6?=
 =?utf-8?B?VmtMRkpIcHZTbkJDWG9wMFAzdjdzYVgweUJqeFkvY0FmU05tcm90a0NnK3l3?=
 =?utf-8?Q?fK/gUrqauTpVkVIXQX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fDDxIzpFoj1xFhqtTJTfx962ul70CLBUixOcHWlFcItL/msHJn00VwlqWrzkGa+iyBoSBrGbUsGuTsfo5TJuEYGS2uph20uQ+Wt9bDxOVtag6EfRUCa8PmBj/XyA+W3FPLhtPGa5t6GhbPozTHFr7hPLFUdWzG/faZifHnB7+iQJD7uEI7s9+vMas9BXDtVyNYAPM7BanUTEUFnf+496dWLGnuu1V9VKAamcy8j5jBvfWnjvfRNMzwGSb47PIqJpzqt3iMm7GT+dj3IXmhK5AtMo5qyMXLIGjR8RqDhN2heSE3895ZFAuV7ZQ9Y7WjabOFYuYSklrNOtyLuNApnIZQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 687bd365-1e47-4c60-3071-08debafa0d1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 07:40:25.7426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N3vywig7mnN3uqyTEryQbFN7vSw23asmK5DlhXZvcYeqoaVLn2hNKS6/U4GWLqyVaq7pSXQYkNxPlpP7wO2F5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8227
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYW51ZWwgRWJuZXIgPG1hbnVl
bGVibmVyQG1haWxib3gub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMjYsIDIwMjYgMTI6NDkg
UE0NCj4gVG86IEIsIEplZXZhbiA8amVldmFuLmJAaW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gQ2M6IE1hbm5hLCBBbmltZXNoIDxhbmltZXNoLm1hbm5hQGludGVs
LmNvbT47IERpYmluIE1vb2xha2FkYW4NCj4gU3VicmFobWFuaWFuIDxkaWJpbi5tb29sYWthZGFu
LnN1YnJhaG1hbmlhbkBpbnRlbC5jb20+OyBUaGFzbGVlbSwNCj4gTW9oYW1tZWQgPG1vaGFtbWVk
LnRoYXNsZWVtQGludGVsLmNvbT47IE5hbGFkYWxhLCBSYW1hbmFpZHUNCj4gPHJhbWFuYWlkdS5u
YWxhZGFsYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXQgdjcgNS83XSB0
ZXN0cy9pbnRlbC9rbXNfcG1fZGM6IEFkZCBuZXcgdGVzdCBmb3IgZGMzY28NCj4gZnJhbWVkcm9w
IHZhbGlkYXRpb24NCj4gDQo+IEhpIEplZXZhbiwNCj4gDQo+IEkgaGF2ZSBzY2FubmVkIHlvdXIg
c2VyaWVzIGFuZCBub3RpY2VzIGZvbGxvd2luZzoNCj4gDQo+IE9uIFR1ZSwgMjAyNi0wNS0yNiBh
dCAxMjoxMSArMDUzMCwgSmVldmFuIEIgd3JvdGU6DQo+ID4gQWRkIGEgbmV3IHN1YnRlc3QgdG8g
dmFsaWRhdGUgdGhhdCBubyBmcmFtZSBkcm9wcyBvY2N1ciBkdXJpbmcgREMzQ08NCj4gPiBlbnRy
eSwgZW5zdXJpbmcgdGhhdCBubyBmcmFtZSBkcm9wcyBhcmUgZGV0ZWN0ZWQgYW5kIERDM0NPIGlz
DQo+ID4gc3VjY2Vzc2Z1bGx5IHRyaWdnZXJlZCBkdXJpbmcgdGhlIHRlc3QuDQo+IA0KPiBUaGVy
ZSBpcyBzb21lIGtpbmQgb2YgcmVwZXRpdGlvbiBoZXJlLiBJdCdzIG5vdCB3cm9uZyBidXQgaXQg
c291bmQgd2VpcmQuDQpPaywgSSB3aWxsIGNoZWNrIGFuZCByZWZpbmUgdGhpcy4gDQo+IA0KPiAN
Cj4gPiB2MjogU2ltcGxpZnkgdmFsaWRhdGlvbiBieSBhbHRlcm5hdGluZyBjb21taXRzIGFuZCB3
YWl0aW5nIGZvcg0KPiA+IMKgwqDCoCBrZXJuZWwgdmJsYW5rIGFmdGVyIGVhY2ggY29tbWl0LiBW
ZXJpZnkgdmJsYW5rIHNlcXVlbmNlIGtlZXBzDQo+ID4gwqDCoMKgIGFkdmFuY2luZyBubyBkcm9w
cGVkL3N0YWxsZWQgdXBkYXRlcyBhbmQgY29uZmlybSBEQzNDTyBjb3VudGVyDQo+ID4gwqDCoMKg
IGluY3JlbWVudHMuDQo+IA0KPiBXaHkgZG8geW91IHB1dCB2MjogaW4gdGhlIGNoYW5nZWxvZyBp
bnN0ZWFkIG9mIHRoZSBjb3ZlciBsZXR0ZXI/IEkgaGF2ZW4ndCBzZWVuDQo+IHRoaXMgYmVmb3Jl
Lg0KVmFsaWRhdGlvbiBtZXRob2Qgd2hhdCB3YXMgaW4gcHJldmlvdXMgdmVyc2lvbiBpcyBjaGFu
Z2VkIHNvIEkgbWFkZSBpdCB2MiwgdGhpcyBhIG5ldyBhcHByb2FjaCBhbHRvZ2V0aGVyLCBzbyBB
ZGRlZCB0aGlzLg0KDQpUaGFua3MgDQpKZWV2YW4gQiANCj4gDQo+IFRoZSBkaWZmIGlzIGdvb2QN
Cj4gDQo+IGJlc3QgcmVnYXJkcw0KPiAgTWFudWVsDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogSmVldmFuIEIgPGplZXZhbi5iQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoHRlc3RzL2lu
dGVsL2ttc19wbV9kYy5jIHwgMTEwDQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDExMCBpbnNlcnRpb25zKCspDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX3BtX2RjLmMgYi90ZXN0cy9pbnRlbC9r
bXNfcG1fZGMuYyBpbmRleA0KPiA+IDU3ZGFkZTQ3ZC4uNjIwYmE5MzI5IDEwMDY0NA0KPiA+IC0t
LSBhL3Rlc3RzL2ludGVsL2ttc19wbV9kYy5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwva21zX3Bt
X2RjLmMNCj4gPiBAQCAtNTEsNiArNTEsMTAgQEANCj4gPiDCoCAqIERlc2NyaXB0aW9uOiBNYWtl
IHN1cmUgdGhhdCBzeXN0ZW0gZW50ZXJzIERDM0NPIHdoZW4gUFNSMiBvciBQUiBpcw0KPiA+IGFj
dGl2ZSBhbmQNCj4gPiDCoCAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3lzdGVtIGlzIGlu
IFNMRUVQIHN0YXRlDQo+ID4gwqAgKg0KPiA+ICsgKiBTVUJURVNUOiBkYzNjby1mcmFtZWRyb3At
Y2hlY2sNCj4gPiArICogRGVzY3JpcHRpb246IFZlcmlmeSB0aGF0IERDM0NPIGVudHJ5IGRvZXMg
bm90IGNhdXNlIGZyYW1lIGRyb3BzDQo+ID4gKyBhbmQgc3VjY2Vzc2Z1bGx5DQo+ID4gKyAqwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW50ZXJzIHRoZSBwb3dlciBzdGF0ZQ0KPiA+ICsgKg0K
PiA+IMKgICogU1VCVEVTVDogZGM1LWRwbXMNCj4gPiDCoCAqIERlc2NyaXB0aW9uOiBWYWxpZGF0
ZSBkaXNwbGF5IGVuZ2luZSBlbnRyeSB0byBEQzUgc3RhdGUgd2hpbGUgYWxsDQo+ID4gY29ubmVj
dG9ycydzDQo+ID4gwqAgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERQTVMgcHJvcGVydHkg
c2V0IHRvIE9GRiBAQCAtMzQyLDYgKzM0Niw4MiBAQCBzdGF0aWMNCj4gPiB2b2lkIHRlc3RfZGMz
Y29fdnBiX3NpbXVsYXRpb24oZGF0YV90ICpkYXRhKQ0KPiA+IMKgCWNsZWFudXBfZGMzY29fZmJz
KGRhdGEpOw0KPiA+IMKgfQ0KPiA+DQo+ID4gK3N0YXRpYyB1aW50MzJfdCB3YWl0X2Zvcl9uZXh0
X3ZibGFua19zZXEoZGF0YV90ICpkYXRhKSB7DQo+ID4gKwlkcm1WQmxhbmsgd2FpdCA9IHt9Ow0K
PiA+ICsJaWd0X2NydGNfdCAqY3J0YyA9IGRhdGEtPm91dHB1dC0+cGVuZGluZ19jcnRjOw0KPiA+
ICsNCj4gPiArCWlndF9hc3NlcnRfZihjcnRjLCAiTm8gQ1JUQyBib3VuZCB0byBvdXRwdXQgZm9y
IHZibGFuayB3YWl0XG4iKTsNCj4gPiArDQo+ID4gKwl3YWl0LnJlcXVlc3QudHlwZSA9IGttc3Rl
c3RfZ2V0X3ZibF9mbGFnKGNydGMtPmNydGNfaW5kZXgpIHwNCj4gPiArCQkJCQkJIERSTV9WQkxB
TktfUkVMQVRJVkUgfA0KPiA+ICsJCQkJCQkgRFJNX1ZCTEFOS19ORVhUT05NSVNTOw0KPiA+ICsJ
d2FpdC5yZXF1ZXN0LnNlcXVlbmNlID0gMTsNCj4gPiArCWlndF9hc3NlcnRfZXEoZHJtV2FpdFZC
bGFuayhkYXRhLT5kcm1fZmQsICZ3YWl0KSwgMCk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHdhaXQu
cmVwbHkuc2VxdWVuY2U7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIGRldGVjdF9k
YzNjb19mcmFtZWRyb3AoZGF0YV90ICpkYXRhKSB7DQo+ID4gKwlpZ3RfcGxhbmVfdCAqcHJpbWFy
eTsNCj4gPiArCXVpbnQzMl90IGRjM2NvX3ByZXZfY250Ow0KPiA+ICsJdWludDMyX3QgZGMzY29f
Y3VyX2NudDsNCj4gPiArCXVpbnQzMl90IHByZXZfdmJsYW5rX3NlcSA9IDA7DQo+ID4gKwl1aW50
MzJfdCB2Ymxhbmtfc2VxOw0KPiA+ICsJaW50IGRlbGF5Ow0KPiA+ICsJaW50IGRjM2NvX3Rhcmdl
dF9mbGlwcyA9IDIwMDsNCj4gPiArCWludCB2ZXJpZnlfY29tbWl0cyA9IDMwMDsNCj4gPiArCWlu
dCBjb21taXR0ZWQgPSAwOw0KPiA+ICsJYm9vbCBkYzNjb19hZnRlcl90YXJnZXQgPSBmYWxzZTsN
Cj4gPiArCWJvb2wgZnJvbnQgPSBmYWxzZTsNCj4gPiArDQo+ID4gKwlpZ3RfcmVxdWlyZV9mKGRh
dGEtPm1vZGUtPnZyZWZyZXNoICE9IDAsICJJbnZhbGlkIHZyZWZyZXNoIHJhdGUgb2YNCj4gPiAr
MFxuIik7DQo+ID4gKw0KPiA+ICsJcHJpbWFyeSA9IGlndF9vdXRwdXRfZ2V0X3BsYW5lX3R5cGUo
ZGF0YS0+b3V0cHV0LA0KPiBEUk1fUExBTkVfVFlQRV9QUklNQVJZKTsNCj4gPiArCWlndF9wbGFu
ZV9zZXRfZmIocHJpbWFyeSwgTlVMTCk7DQo+ID4gKwlpZ3RfZGlzcGxheV9jb21taXQoJmRhdGEt
PmRpc3BsYXkpOw0KPiA+ICsNCj4gPiArCWRjM2NvX3ByZXZfY250ID0gaWd0X3JlYWRfZGNfY291
bnRlcihkYXRhLT5kZWJ1Z2ZzX2ZkLA0KPiA+ICtJR1RfSU5URUxfQ0hFQ0tfREMzQ08pOw0KPiA+
ICsNCj4gPiArCWRlbGF5ID0gKGludCkoMS41ICogKDEwMDAwMDAgLyBkYXRhLT5tb2RlLT52cmVm
cmVzaCkpOw0KPiA+ICsNCj4gPiArCXdoaWxlIChjb21taXR0ZWQgPCB2ZXJpZnlfY29tbWl0cykg
ew0KPiA+ICsJCWZyb250ID0gIWZyb250Ow0KPiA+ICsJCWlndF9wbGFuZV9zZXRfZmIocHJpbWFy
eSwgZnJvbnQgPyAmZGF0YS0+ZmJfcmdyIDogJmRhdGEtDQo+ID5mYl9yZ2IpOw0KPiA+ICsJCWln
dF9kaXNwbGF5X2NvbW1pdCgmZGF0YS0+ZGlzcGxheSk7DQo+ID4gKw0KPiA+ICsJCXZibGFua19z
ZXEgPSB3YWl0X2Zvcl9uZXh0X3ZibGFua19zZXEoZGF0YSk7DQo+ID4gKwkJaWYgKHByZXZfdmJs
YW5rX3NlcSkNCj4gPiArCQkJaWd0X2Fzc2VydF9mKGlndF92YmxhbmtfYWZ0ZXIodmJsYW5rX3Nl
cSwNCj4gcHJldl92Ymxhbmtfc2VxKSwNCj4gPiArCQkJCcKgwqDCoMKgICJWYmxhbmsgc2VxdWVu
Y2UgZGlkIG5vdCBhZHZhbmNlIGFmdGVyDQo+IGNvbW1pdA0KPiA+ICVkXG4iLA0KPiA+ICsJCQkJ
wqDCoMKgwqAgY29tbWl0dGVkICsgMSk7DQo+ID4gKwkJcHJldl92Ymxhbmtfc2VxID0gdmJsYW5r
X3NlcTsNCj4gPiArCQljb21taXR0ZWQrKzsNCj4gPiArCQl1c2xlZXAoZGVsYXkpOw0KPiA+ICsN
Cj4gPiArCQlkYzNjb19jdXJfY250ID0gaWd0X3JlYWRfZGNfY291bnRlcihkYXRhLT5kZWJ1Z2Zz
X2ZkLA0KPiA+ICsJCQkJCQnCoMKgwqAgSUdUX0lOVEVMX0NIRUNLX0RDM0NPKTsNCj4gPiArCQlp
ZiAoY29tbWl0dGVkID49IGRjM2NvX3RhcmdldF9mbGlwcyAmJiBkYzNjb19jdXJfY250ID4NCj4g
ZGMzY29fcHJldl9jbnQpDQo+ID4gKwkJCWRjM2NvX2FmdGVyX3RhcmdldCA9IHRydWU7DQo+ID4g
Kwl9DQo+ID4gKw0KPiA+ICsJaWd0X2Fzc2VydF9lcShjb21taXR0ZWQsIHZlcmlmeV9jb21taXRz
KTsNCj4gPiArCWlndF9hc3NlcnRfZihkYzNjb19hZnRlcl90YXJnZXQsDQo+ID4gKwkJwqDCoMKg
wqAgIkRDM0NPIGRpZCBub3QgaW5jcmVtZW50IGFmdGVyICVkIGZsaXBzIHdoaWxlIHZhbGlkYXRp
bmcgJWQNCj4gPiBjb21taXRzXG4iLA0KPiA+ICsJCcKgwqDCoMKgIGRjM2NvX3RhcmdldF9mbGlw
cywgdmVyaWZ5X2NvbW1pdHMpOyB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCB0ZXN0X2RjM2Nv
X2ZyYW1lZHJvcChkYXRhX3QgKmRhdGEpIHsNCj4gPiArCWlndF9yZXF1aXJlX2RjX2NvdW50ZXIo
ZGF0YS0+ZGVidWdmc19mZCwgSUdUX0lOVEVMX0NIRUNLX0RDM0NPKTsNCj4gPiArCXNldHVwX291
dHB1dChkYXRhKTsNCj4gPiArCXNldHVwX2RjM2NvKGRhdGEpOw0KPiA+ICsJc2V0dXBfdmlkZW9w
bGF5YmFjayhkYXRhKTsNCj4gPiArCWRldGVjdF9kYzNjb19mcmFtZWRyb3AoZGF0YSk7DQo+ID4g
KwljbGVhbnVwX2RjM2NvX2ZicyhkYXRhKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiDCoHN0YXRpYyB2
b2lkIHRlc3RfZGM1X3JldGVudGlvbl9mbG9wcyhkYXRhX3QgKmRhdGEsIGludCBkY19mbGFnKQ0K
PiA+IMKgew0KPiA+IMKgCXVpbnQzMl90IGRjX2NvdW50ZXJfYmVmb3JlX3BzcjsNCj4gPiBAQCAt
NjkzLDYgKzc3MywzNiBAQCBpbnQgaWd0X21haW4oKQ0KPiA+IMKgCQl9DQo+ID4gwqAJfQ0KPiA+
DQo+ID4gKwlpZ3RfZGVzY3JpYmUoIlZhbGlkYXRlIHRoYXQgbm8gZnJhbWUgZHJvcHMgb2NjdXIg
ZHVyaW5nIERDM0NPIGVudHJ5ICINCj4gPiArCQkJwqDCoMKgwqAgIndoaWxlIGFsdGVybmF0aW5n
IGZyYW1lYnVmZmVycyB3aXRoIFBTUjIgb3IgUGFuZWwNCj4gUmVwbGF5DQo+ID4gYWN0aXZlIik7
DQo+ID4gKwlpZ3Rfc3VidGVzdF93aXRoX2R5bmFtaWMoImRjM2NvLWZyYW1lZHJvcC1jaGVjayIp
IHsNCj4gPiArCQlzdGF0aWMgY29uc3Qgc3RydWN0IGRjM2NvX3Rlc3RfbW9kZSBkYzNjb19tb2Rl
c1tdID0gew0KPiA+ICsJCQl7IFBTUl9NT0RFXzIsICJwc3IyIiB9LA0KPiA+ICsJCQl7IFBSX01P
REUswqDCoMKgICJwciLCoMKgIH0sDQo+ID4gKwkJfTsNCj4gPiArDQo+ID4gKwkJZm9yIChpbnQg
aSA9IDA7IGkgPCBBUlJBWV9TSVpFKGRjM2NvX21vZGVzKTsgaSsrKSB7DQo+ID4gKwkJCWNvbnN0
IGNoYXIgKm5hbWUgPSBkYzNjb19tb2Rlc1tpXS5uYW1lOw0KPiA+ICsJCQlkYXRhLm9wX3Bzcl9t
b2RlID0gZGMzY29fbW9kZXNbaV0ubW9kZTsNCj4gPiArDQo+ID4gKwkJCWlndF9keW5hbWljX2Yo
IiVzIiwgbmFtZSkgew0KPiA+ICsJCQkJaWd0X3JlcXVpcmUocHNyX3Npbmtfc3VwcG9ydChkYXRh
LmRybV9mZCwNCj4gPiArCQkJCQkJwqDCoMKgwqAgZGF0YS5kZWJ1Z2ZzX2ZkLA0KPiA+ICsJCQkJ
CQnCoMKgwqDCoCBkYXRhLm9wX3Bzcl9tb2RlLCBOVUxMKSk7DQo+ID4gKw0KPiA+ICsJCQkJaWYg
KGRhdGEub3BfcHNyX21vZGUgPT0gUFNSX01PREVfMikNCj4gPiArCQkJCQlpZ3RfcmVxdWlyZV9m
KElTX1RJR0VSTEFLRShkYXRhLmRldmlkKQ0KPiB8fA0KPiA+ICsNCj4gCcKgwqDCoMKgwqAgaW50
ZWxfZGlzcGxheV92ZXIoZGF0YS5kZXZpZCkgPj0NCj4gPiAzNSwNCj4gPiArCQkJCQkJwqDCoMKg
wqDCoCAiUGxhdGZvcm0gZG9lcyBub3Qgc3VwcG9ydA0KPiBEQzNDTw0KPiA+IHdpdGggUFNSMlxu
Iik7DQo+ID4gKwkJCQllbHNlDQo+ID4gKw0KPiAJaWd0X3JlcXVpcmVfZihpbnRlbF9kaXNwbGF5
X3ZlcihkYXRhLmRldmlkKSA+PQ0KPiA+IDM1LA0KPiA+ICsJCQkJCQnCoMKgwqDCoMKgICJQbGF0
Zm9ybSBkb2VzIG5vdCBzdXBwb3J0DQo+IERDM0NPDQo+ID4gd2l0aCBQYW5lbCBSZXBsYXlcbiIp
Ow0KPiA+ICsNCj4gPiArCQkJCXRlc3RfZGMzY29fZnJhbWVkcm9wKCZkYXRhKTsNCj4gPiArCQkJ
fQ0KPiA+ICsJCX0NCj4gPiArCX0NCj4gPiArDQo+ID4gwqAJaWd0X2Rlc2NyaWJlKCJUaGlzIHRl
c3QgdmFsaWRhdGVzIGRpc3BsYXkgZW5naW5lIGVudHJ5IHRvIERDNSBzdGF0ZSAiDQo+ID4gwqAJ
CcKgwqDCoMKgICJ3aGlsZSBQU1IgaXMgYWN0aXZlIik7DQo+ID4gwqAJaWd0X3N1YnRlc3QoImRj
NS1wc3IiKSB7DQo=
