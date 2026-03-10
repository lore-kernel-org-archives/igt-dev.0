Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A933DFCC9B8
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 04:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456E010E646;
	Tue, 10 Mar 2026 04:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOKtIUjx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF43310E646
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 04:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773117431; x=1804653431;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DhsNIqwO/PxF1bf6xlv36Qf2KZydCMjpssueeXBOeWo=;
 b=hOKtIUjxxmHZbCNzvaxhc+Rwda9FCYHUB77AacMM3zp5yg3MnIMLF88z
 F7Yc32Cbnc/8uPg2MXfTt/z//iMe6+LzM6fEejQWB+vGRe8KaYzc/2lvZ
 g6TLOONRPdLHcs7NO9blzAZ49V0qjvG0ykBEw+EE+cjo8P3c+TJfNUrwp
 b+/6iBTOAD+8i+gOccy04k/NqIJKYZsHlbwV352Rydio8BSVIBjqI7EoW
 iI2LOj3fZKNu11qrk7bDnxa3c+9736VXNqgxEjV1tGV61UUUcsTXAfCBP
 78YxyV5r3mlnYPGfQTEMzrFlSDuOJBQijL1145utQPE7oacxhgiLxveYh g==;
X-CSE-ConnectionGUID: 3h6pwqc6TMO2DNI2cErr5g==
X-CSE-MsgGUID: OsyYDelRQ1+iwFs0KmMQ1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74269588"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="74269588"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 21:37:10 -0700
X-CSE-ConnectionGUID: CEEcoiMCScmrdKlJ8z/ePg==
X-CSE-MsgGUID: wRVgovjlT/qUL4lSiu3pTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="219942068"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 21:37:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 21:37:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 21:37:09 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 21:37:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9mXAVGot1lCrRYiV7NW1iP3MfQMdUqNXwU0PcsjpF7kydxfsuBJMh+WfDlUDok+6XwnP1YFs8/PXykhjv4MCUsrshtspcK0U/83JFz8iMCAHVLEhBX6cVHwe322rzmnZpnmlDCx+wh3FyWFnCapUN5mknYqzpDyXkgPkUjNFWu8twHAPu9ngVW5Sh1kQSnPIa7Uxos8C46KBLE6N4J7jGO3XCTkubC86BKnTTSwZX9pqZeapPe11ZxychS3DPHQ76xxqwp7u+kLhSM4EDgG7evZ4EnEeMsh0yfNMed+PF8YsTyEmL3d18C2/nhafNtJS7dakUGdwibYxEwnx7CVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhsNIqwO/PxF1bf6xlv36Qf2KZydCMjpssueeXBOeWo=;
 b=pG6Hu+BNsBbQZEYKQprOTs77P1hrHUEixXko+V3mAYMG5qnAVgsE5EPs9kVJ+qIVUufmsqWMWCbbolgWqFep/1pssFxo98Gy9bfmIbeT3MzLWBgrOFiFiK42ajIjJknr9kwL95de79rwgybW212kUUHbTpVkxaPAb/EsxKzAQs8uPcY50DSBXhcQnmUSHG3lXqd9J9Sdb4WSDiLzvNc1dADZfrOGMtHVnlz0rvihpHEKazkxbIUil6OX5jU0fsryIQqbtMlSb7Jyr4ibHlkTfvH3BUz9WUdEJHV20XGJy5R8m01GzbyAoajgSZzerdWRspwMgV9Ii/3pADt6wxcpVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by SJ2PR11MB7645.namprd11.prod.outlook.com (2603:10b6:a03:4c6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 04:37:07 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 04:37:07 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>
Subject: RE: [PATCH] tests/intel/xe_configfs: Skip ctx-restore subtests on
 SR-IOV VF
Thread-Topic: [PATCH] tests/intel/xe_configfs: Skip ctx-restore subtests on
 SR-IOV VF
Thread-Index: AQHcpXr6Sa6T78AOYEqvN2DurBpNU7WR1aYAgA5XmICABxKfMA==
Date: Tue, 10 Mar 2026 04:37:06 +0000
Message-ID: <SA3PR11MB81189734B2EAC66EF2632888D046A@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260224112041.297334-2-nitin.r.gote@intel.com>
 <20260224132012.prlzw36las3j4uzk@kamilkon-DESK.igk.intel.com>
 <09f01ecd-46dd-4712-90e7-a51aea8cd219@linux.intel.com>
In-Reply-To: <09f01ecd-46dd-4712-90e7-a51aea8cd219@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|SJ2PR11MB7645:EE_
x-ms-office365-filtering-correlation-id: ca9f1074-15a5-4e80-7750-08de7e5eaf8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: m38Eod5yXRCm9tqacfwL7NfYzeJF9D5FFg97EGgzk//jpcop9IMASUHzzJi0X0MAazj/sYVW3QpWKZa+aLb7qhOV8VazAcu6Xiuhf5oRsjZkiEiQ985oI7bqn1kl0QULiNNQijrQc/yXc/r9BbZi6+IDtMiX0C2FcB9R2w1bSJWnBxFyvwrZuF4fDfsHiRm5Lz7YmFdNF+5l9sDvgyl2Omn7Sp/+8QNlNTaYxNZ6q5HnwRePJLG94AeRK0rUV0tsRoMtpMr7SQkwBWlZt/VG383oOhtwX0eGq/2JqCbXBhKpECnVuXmKyTdmzIuxiuxjR/x+LeUD+OO30t0W8fBX44iH2huivB/Q2C+YueWHqGHGL32fTszk0fLobUaBc+6rdMyp8RVKZ2oHobjrR8Es0ATj0DtYb1zpI+nfEQMiU7n1hjeOH/i4Z5GTPk9sSn7wDUGLsP953HHLvZf7X7c7eZJHBMFjb94UgdGZ4KCX628uKYlMrqs1zu5av0c8iKDav8MeKyluUBbUqHAj6ZFIRZhnuoq742i4TmdRh8yMntyKZogHrjttKCjReE8sPDPggxlS8qQLszKDuN8Ii3ygfDd09pGBaUQY3wYVDqck0KlKMO6O21PDp+C3LBKsQj9OfbSC16pGB8RJ9Q9gSAe6KP2plHvpdzg9Xi85GXTARr81ltWNT0jMbTA8f9YDqZrCs6PkuLmIoA3/+f3/pbfL+6LH7vglQdak5Wis9UdVM1IF/ZJwVEMhx4CJRljYchxxoCR6rpDO/ZxSp2LjaSHDIGC3Loo97ltMLWqhWfhdFtc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkU3S1ZsNDdIRm93SUpxSGk0SGVzd0lTeWhlbHhmcjYxQ2dGSUJGM1ZqOHFL?=
 =?utf-8?B?bkZOWHRtWTFyYVVyaUpTSCtJZFcvOVlNaVdsbFd2UjQ2c0NOaHZxcXRHQmds?=
 =?utf-8?B?eVBsV2cxclgxL2NLV1FSUHFNQ3huSk1XeUpEeDU5bjB2UXFTVXp4RkpEMUFV?=
 =?utf-8?B?RGZoS09nNnBWVTBpUXBJR3BuYXVMcG01WERrOTFVV2JNYlcrR21MYzZsMmI2?=
 =?utf-8?B?eUIxV0dWRFBRNFRPdUZHNUJKVytLeDd2aXh3b2U0dGN4eUhhNHZ5aTFzSTZB?=
 =?utf-8?B?eFVwS3NaZCtvTE4wOHhZd2IwNTJwK2xpVHJNaXJOcGtyYndsQTlTMnFmejdC?=
 =?utf-8?B?V3ZSeFFZclJmWEFiT0V2U3p4MGhnajBqcC9ZNENFVE84SVR4eTJ4MXBJK25T?=
 =?utf-8?B?bStuaHdSTDdPbmI0My90Q3htSHFXaDc4QXh6d3lNaFN4bVpRRzczMVNiZFJp?=
 =?utf-8?B?WnlCMytCM2h1ekFBN0FnQkx0c2xkSkl6emdSMTkvNWZvYmZicFZrclJMbEZD?=
 =?utf-8?B?T3gzenBLWjVHcDh6K21xZW5ONXdaUXVCOTZnbHkvTlgraERXYjdiOTI1Rkh5?=
 =?utf-8?B?ZFIzYnBscWprelFHQWpUckhuUmpNWW4wOXZ1dTBPL1o4aUYySS9XYVlyYUkw?=
 =?utf-8?B?TFFyS2xaZTlCbXBSN1p0T3pxYTd3ZlErSTFSWHZJajFTbFowRnZEK3dwbjBS?=
 =?utf-8?B?WVdFZWJFR2dqZnNkVmsxVnpDRFRTdlkvNkxpcmRTME5uY0dGSTF3RUg5MFp6?=
 =?utf-8?B?Q0JLVlpSUjF6U243WnJ3bGo1U2xOMlpnL3o3Vnh6S2lDQUNWR3ErOVRWd3lj?=
 =?utf-8?B?SW5lYmt3N2FyN084R2QyQ0sxUmNRWjhnWGtXTDhkRzRMWHROdHE3a28zL2pC?=
 =?utf-8?B?YnVBcXJnYjNVYXhjRTh6cjlrOHRLWFlRdjNsQ0dOd1dka2Z4NUJzU1lhUjA1?=
 =?utf-8?B?N0JjZGxlbWtnN1lNTXBXTHllUW50RlJuRmlIMG5pQ21nOEM5d3dqUERSTXRh?=
 =?utf-8?B?Y2k0dUtGVEg5cHJvcGxub3I1VURMdTZUWm1UOGU2TzZ1TGVlWHdhYmlJNjRU?=
 =?utf-8?B?U0JldkxWdzAvMzErMkVoSm44bHk2M0JFQUpFcXJYR0lScklKZXZSeXJreE1n?=
 =?utf-8?B?NmE4a0RiWmtWNFFFOC9XK3ltYXNMbzQ1WVJQVnAxZm5HVU1JbXBqbzJHejA2?=
 =?utf-8?B?bkFyY0Q3ZXlsOGcrZmJHbE9icWpFNjhLak1heDN3c2JVYWNPaEQ2ZG9PalR0?=
 =?utf-8?B?TlIxYk9pUVVrbm5XTm5RbllMZXI0dFpxc3IybWRabDZ6R3FJNzFjSXdJY3h0?=
 =?utf-8?B?MVpscVBpVTdOZmJRQjA2WlNzVDExM3ZvMWphcUdVcnRCakJHcVArV1hkaTls?=
 =?utf-8?B?bWpwL2Y2K0duZUw3Q2NTRm1YSjJadTNHVnp1dFEvWHE5S1doRUZvRUhkckJV?=
 =?utf-8?B?MlJGTWN4VG5STEpoc3c1YWlLWHpNR3ZMT3lNbEFxeXhYOW9qYXNQL1RSM1Ir?=
 =?utf-8?B?UTlWYWhsdnJpejF6dE5adEJUaCtSRGJacGNkZUNacVRyajArR3BFVGJuZ1Nr?=
 =?utf-8?B?b1hVY1hHdytkd1M3a0pvZ1hXSmZneW03YWZPQ0N6TFgwdXBXQVpNQ2tEMnk3?=
 =?utf-8?B?Mk1PZWZicElILy9VT0lNVVgyMUEyOUpuMmxDSGZpYmJ6U2hJbkNnU2JCaWVC?=
 =?utf-8?B?aTdyakRwc0dLaVlSWTF1cEZRbXozdkJnRnZEV085SmliRld4L3VVbDRSaWNG?=
 =?utf-8?B?SjlEMENwckFFRVFuaWNkV05KRXhVK0xudmhRME1lekNWdkY0UUxybnBURE84?=
 =?utf-8?B?V0RaVUlockpiRWorK0lWNUtNUUxlYVhPSG9SK0xlQlR2eDJLcXkwR3oxUUZ4?=
 =?utf-8?B?QkVpRWRnMTE0WHNNeEN4VGVrNFMyYVFHS1I3U1VxV0RYMmFha1ZwV0hOWDhh?=
 =?utf-8?B?bTFsaHdTZGJ5NFlkTWRaNEdpdUZ0dnJUNmx5V2NpeTNINllDWG1Tbys5aTFV?=
 =?utf-8?B?M2d5eUYzYWl2ZnEvdFg5VTRSdThPVzRkNWk5RFl5Q2RzSTB1aUlaR3dXcEVv?=
 =?utf-8?B?cVp6eFN4SUNXOGRsK1ZNcjNlRkFmd2hiTW9jc09lZERIMFNuSFh2WTEzTE9s?=
 =?utf-8?B?cG1tUDRXTWxsWGhpemQ5Y3U4djdiQ3pWaDJLT2dIS0FiWEJjbnozSng1Vkdi?=
 =?utf-8?B?OHR1cEVPMERWNjFjenh1Z2VaZWVaNGNEbUVYOEh5TGZUSDVHYjlOK0RWZHdU?=
 =?utf-8?B?eXBOUG9mbFJESktac09xcjU4bjZ3dlR2QWNqSWczV2YweE42QnFYMmxnUmZJ?=
 =?utf-8?B?bzNUdVpXUmFjaXlzaFkxZlJLeTlwdm5JZlA5bWNwUUpyMjNhMlc0Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: B+zkLd92+PJWT3AZ92O7cCp10JyOHmlRzXiiojHq+cdooK93PjTQ0vvZyRL+4HIzPeJH3+TzVZOMgLodNsgWIzWG5cfRf9TVDX02JpV4he1dmxISLi2EGjiVU+E3Wne/DMAL5FkOCWA/n7yBfMPujwuBnxjL1H7VWjr1+ZW3L1XCSQ96qh8qJpL1LZ55p5vB4ONJZZNo15me2Y9SQyn4YMefI/5aR/+JBfNBsBtCYNOk/1Cv04jib3sHYbbF+ZZ11ITdvX+J/qCa143DLwDgV6RhCumpbaaySn0PAlhm5Tkk/mboCibm0jaj6XRVVECRg1XRGhbC2WennG5JU8m4rQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9f1074-15a5-4e80-7750-08de7e5eaf8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 04:37:07.0105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rvEsFhkqBIWBr+OGOFdD/b5HE5oM0AY9gfZWJqnbLH0hnu85wjCLTYQVc2/JvysriBPq646TW4zNfXjvwh2niQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7645
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

SGkgTWFyY2luLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJlcm5h
dG93aWN6LCBNYXJjaW4gPG1hcmNpbi5iZXJuYXRvd2ljekBsaW51eC5pbnRlbC5jb20+DQo+IFNl
bnQ6IFRodXJzZGF5LCBNYXJjaCA1LCAyMDI2IDk6NTEgUE0NCj4gVG86IEthbWlsIEtvbmllY3pu
eSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT47IEdvdGUsIE5pdGluIFINCj4gPG5p
dGluLnIuZ290ZUBpbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgV2Fq
ZGVjemtvLCBNaWNoYWwNCj4gPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPjsgTGFndW5hLCBM
dWthc3ogPGx1a2Fzei5sYWd1bmFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB0
ZXN0cy9pbnRlbC94ZV9jb25maWdmczogU2tpcCBjdHgtcmVzdG9yZSBzdWJ0ZXN0cyBvbiBTUi1J
T1YNCj4gVkYNCj4gDQo+IA0KPiBPbiAyLzI0LzIwMjYgMjoyMCBQTSwgS2FtaWwgS29uaWVjem55
IHdyb3RlOg0KPiA+IEhpIE5pdGluLA0KPiA+IE9uIDIwMjYtMDItMjQgYXQgMTY6NTA6NDIgKzA1
MzAsIE5pdGluIEdvdGUgd3JvdGU6DQo+ID4+IFRoZSBjdHgtcmVzdG9yZSBzdWJ0ZXN0cyB1c2Ug
aW50ZWxfcmVnaXN0ZXJfcmVhZCgpIHZpYSBkaXJlY3QgTU1JTw0KPiA+PiAoUENJIEJBUikgYWNj
ZXNzIHRvIHZlcmlmeSB0aGF0IHRoZSBiYXRjaCBidWZmZXIgd3JvdGUgdGhlIGV4cGVjdGVkDQo+
ID4+IHJlZ2lzdGVyIHZhbHVlcy4gT24gU1ItSU9WIFZpcnR1YWwgRnVuY3Rpb25zIChWRiksIG9u
bHkgYSB2ZXJ5DQo+ID4+IGxpbWl0ZWQgc3Vic2V0IG9mIHJlZ2lzdGVycyBpcyBhY2Nlc3NpYmxl
LiBSZWdpc3RlcnMgbGlrZSAweDRGMTAwIGFyZQ0KPiA+PiBub3QgZXhwb3NlZCB0byBWRnMsIHNv
IHRoZSByZWFkIGFsd2F5cyByZXR1cm5zIDAsIGNhdXNpbmcgYSBmYWxzZQ0KPiA+PiB0ZXN0IGZh
aWx1cmUuDQo+ID4+DQo+ID4+IFNraXAgYWxsIGN0eC1yZXN0b3JlIHN1YnRlc3RzIChwb3N0LWJi
LCBtaWQtYmIsIGFuZCB0aGVpciBpbnZhbGlkDQo+ID4+IHZhcmlhbnRzKSB3aGVuIHRoZSBkZXZp
Y2UgaXMgcnVubmluZyBpbiBTUi1JT1YgVkYgbW9kZS4NCj4gRG9lcyBpdCBtZWFuIHRoZSBmZWF0
dXJlIGlzIG5vdCBhcHBsaWNhYmxlIHRvIFZGcyBvciBqdXN0IHRoZSB2ZXJpZmljYXRpb24gaXMg
YSBiaXQNCj4gaGFyZGVyID8NCg0KVGhlIGN0eC1yZXN0b3JlIGZlYXR1cmUgaXRzZWxmIHdvcmtz
IG9uIFZGcyAtLSB0aGUgR3VDIGhhbmRsZXMgY29udGV4dA0Kc2F2ZS9yZXN0b3JlIGZvciBWRnMg
anVzdCBsaWtlIHRoZSBQRi4gVGhlIGlzc3VlIGlzIHN0cmljdGx5IHdpdGggdGhlDQp0ZXN0J3Mg
dmVyaWZpY2F0aW9uIG1ldGhvZC4NCg0KVGhlIHRlc3QgdXNlcyBpbnRlbF9yZWdpc3Rlcl9yZWFk
KCkgdmlhIGRpcmVjdCBQQ0kgQkFSIE1NSU8gdG8gcmVhZA0KYmFjayByZWdpc3RlciAweDRGMTAw
LCB3aGljaCBpcyBibG9ja2VkIGJ5IHRoZSBIVyBNTUlPIGZpbHRlciBvbiBWRnMuDQpJIGxvb2tl
ZCBpbnRvIGFsdGVybmF0aXZlcyBidXQgY291bGRuJ3QgZmluZCBhIHN1aXRhYmxlIFZGLWFjY2Vz
c2libGUNCnJlZ2lzdGVyIC0tIHRoZSBWRiBNTUlPIGZpbHRlciBvbmx5IGV4cG9zZXMgSVJRIHJl
Z2lzdGVycw0KKDB4MTkwMDEwLTB4MTkwMGY0KSBhbmQgVkZfU1dfRkxBRyByZWdpc3RlcnMgKDB4
MTkwMjQwKSwgd2hpY2ggYXJlDQp1c2VkIGJ5IEd1QyBjb21tdW5pY2F0aW9uIGFuZCBub3Qgc3Vp
dGFibGUgYXMgdGVzdCBzY3JhdGNoLg0KDQpHaXZlbiB0aGVyZSdzIG5vIFZGLXNhZmUgcmVnaXN0
ZXIgYXZhaWxhYmxlLCBJIHRoaW5rIHRoZSBza2lwIHdpdGggYW4gDQphY2N1cmF0ZSBtZXNzYWdl
IHNlZW1zIGxpa2UgdGhlIGNvcnJlY3QgYXBwcm9hY2g6DQoNCmlndF9yZXF1aXJlX2YoIWlzX3Zm
X2RldmljZSwNCiJNTUlPIHJlZ2lzdGVyIHJlYWRiYWNrIG5vdCBwb3NzaWJsZSBvbiBWRlxuIik7
DQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UnZCBwcmVmZXIgYSBkaWZmZXJlbnQgYXBwcm9h
Y2guDQpUaGFuayB5b3UuDQoNCi0gTml0aW4NCg0KPiA+ICtjYyBMdWthc3ogYW5kIE1hcmNpbg0K
PiA+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IE5pdGluIEdvdGUgPG5pdGluLnIuZ290ZUBpbnRlbC5j
b20+DQo+ID4+IC0tLQ0KPiA+PiAgIHRlc3RzL2ludGVsL3hlX2NvbmZpZ2ZzLmMgfCA0ICsrKysN
Cj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+ID4+DQo=
