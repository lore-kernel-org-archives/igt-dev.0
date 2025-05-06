Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68388C3ABBC
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 17:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD9F10E6D9;
	Tue,  6 May 2025 17:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aIljEhuU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86ECF10E6D9
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 17:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746553078; x=1778089078;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j9pRgEaLsr6OtS2GEVmYDhAhsUoE7W4VnEWO6OqKdsk=;
 b=aIljEhuUKgTSmgqJSkHvQZ6FXkwFcFSvCsLsXuKzjFGMSxLjy+xWNVIs
 5njxpqZ3YvmXu1pG3coPL/6uxDMjBWFsfG6AwhCgAz8XiIU8hI109hPjY
 qLD+eNvG5r6UBEmrNjfaVlzcxvHBFaGQoprYbsYhkq/2xzj+wp+gsgaTJ
 rp9Ajm9Sz4PmR1qClMJeepRRmlSkvMU7JQJ7m0nW2qf3c5+zDwDlcD++q
 dQoRnMJlUP++1VS7Jti+ShIhQvXNWD0kJYSRyfTMTw6rGfT3v1IdRwwrf
 8TkP3bGpSYRZzuxjfaPt93sGE6SB+P2WfZSN1gFdmnyegSIbPos8oNbew w==;
X-CSE-ConnectionGUID: N8pZ3faCQA2Te5LVByokEw==
X-CSE-MsgGUID: DYIiFHISRY2GDGndPVAbNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48150217"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="48150217"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 10:37:58 -0700
X-CSE-ConnectionGUID: G4wt5rd/TdugDTdJYbHFHQ==
X-CSE-MsgGUID: KqKGS78DS/qPbITX1Agtkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="140875043"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 10:37:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 10:37:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 10:37:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 10:37:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2MmO+h/wOfT2jrHpufCDP20CWTJLx1Vau8VbXNHcgS+npZ5CnimDeQDYGAPUfHv1hSjY282P62Hmyf02OdPXdxLfSo6SJ9RjaAWp+d/s3HDN7iJIJZh176lklWl6uJReRVoSSl1Bebu8Cul5lU/sEqK0kJrh4i2x5AEeTtrhPG4mhT33nEGnuyOOlAFbvOCx731xQOtN2vbLNOf2XB7geCQWOrrOy0+UlNvHiJOI5HvjBo4jgPCZTkpyDHbjmPnDFCHskiwpChUC5O6AOy63M6mgU18erwMn7qfi1LAZznJufB7Q3CV2AmF9yl9zvGbvDS/MvG1OpGv6QQg+/PcAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuvzC/zt0IQPvo35YbZ/b1eIFQtpcZGaZ6jnlBA5ZIA=;
 b=DfD/sQkrUhJtteQEvMNzsSINaoG87USSIbrd99BUtL5+5Fp9C1mYhQk1vWlQsZt6Ng2joLpc0h9LJwhJmPGBDmh72uP3MgylYLWXHsZyWx9DyQoHbFI4plFcD37eO8DlA0ptWKU/acRK4LcADcrIRqBN5WYWtRLluThKcqp1qZEj8Izgh5uDRQmcQqh5EYy7Kz1+2Zts3CI4y8Klq+u1BLgfxq+Cy4xWhv1yG+LRS2URZtrazA+Jqx2vfvY+M7GJ66xrTbyTSKdn+s3ShzhIshC6CaCON3X+qq9tHjzyAbp1PLPHvJXOQJnXbI0iN2Kxg1LmK/+Sn3LJHI2JM3YLaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB7782.namprd11.prod.outlook.com (2603:10b6:8:e0::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.25; Tue, 6 May 2025 17:37:07 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Tue, 6 May 2025
 17:37:06 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v2 2/2] tests/intel/xe_fault_injection: Ignore
 faults for *guc*
Thread-Topic: [PATCH i-g-t v2 2/2] tests/intel/xe_fault_injection: Ignore
 faults for *guc*
Thread-Index: AQHbvo2ExpE8uV0iE0epeZ1k3/mdH7PF3ZGw
Date: Tue, 6 May 2025 17:37:06 +0000
Message-ID: <CH0PR11MB54441783A61AB603DB834663E589A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250506140351.29612-1-satyanarayana.k.v.p@intel.com>
 <20250506140351.29612-3-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250506140351.29612-3-satyanarayana.k.v.p@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB7782:EE_
x-ms-office365-filtering-correlation-id: 248f5e63-3ad2-40dd-6361-08dd8cc49f38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6gzLE2HnWtAXKvw8FcYsSLNYyXKAkhn5TqLZTr9hgncdBLj/v+wrhpmJ2OYN?=
 =?us-ascii?Q?LvCM5EkH6U2DY1UtagopyecXxubURR3rb8t3qbIvJ1YnGmMW9VPOcf1B2Kob?=
 =?us-ascii?Q?PfJgoKLjKYU6jL1E+Qn6gZ1naV2Ab9KthxgvSIuYn8bbCHSS4+aq8UAT058h?=
 =?us-ascii?Q?MSmnIX8LTBVFssIRH8ABAX0kFdz2dfIZPLaJhcwE3vSyerROHjT2+vPxLQEN?=
 =?us-ascii?Q?HdE4kpu2fy4mkBMmVNRlcNKJfufuWn53gvBAFrZy0S1aqGTIV7O/LFCUZBkj?=
 =?us-ascii?Q?mWJ2C4BiaMbPiaAGZbwhty4AIBbcJsIL0pCkrTuQYESTiJLYob7Y/QE6KTaX?=
 =?us-ascii?Q?L4le4nSvi3BWX13nvSQ9pyUi9iyWXqr+zY5YLGDQlE81vFqIyQcLVVQd10IL?=
 =?us-ascii?Q?YSLA5PLWASPFDfFqwVVHO7ZK2hK7cLiPCMqC19r9n3pkPtJEoYO+T6sG4eU2?=
 =?us-ascii?Q?YyD4aPZsDGNgqEDw9Z/G3bPyiL+Gpru0m4aBEtCiUUFxMtqypGwWQgXwz+Vh?=
 =?us-ascii?Q?HA9/m6iTth/5XtS2tw6ljY4F9wa6WkRm1B9gukBkBckBv7hoB8bUnl6QKGgT?=
 =?us-ascii?Q?z7eu6cLBavRmAEcBnvUsTbLv+55MG+A9nwIyOdQrELUZgHQ53aOsevlJjJq9?=
 =?us-ascii?Q?IEyxGNV1WEqxw2Oe5DW3LL3YTQqkwW2prmfSxdjl9Bguc6r7OVSHxt2kJs1l?=
 =?us-ascii?Q?wSt2WTf0+uzUEFdxIoE1yy1LxOkb8md3XPcgLaYWw8SrWOXvi/c+Vudz0C8c?=
 =?us-ascii?Q?6iw0lbNXfPgU2HudRC7RXakSF6zxk+7Yx7eCNZO0XucytnkgOI4xX6/ndqEy?=
 =?us-ascii?Q?Q500ReoWCv8HWX5BJVqkl0SMmk9xPDic3A6TyxqaKf5ArXmSsEt9UcEk0XIH?=
 =?us-ascii?Q?f3KxzMF9wbvOKrks8CrMVWFKS8zT0ZuBdq0auaHmfBPZ7Q+tZ8YbgniOf+4p?=
 =?us-ascii?Q?BtHe8acn0CGNtp7l/lprs1Fn3qVz+WruYa2bRCPFIXIn5i+dohuVdSY/vvgb?=
 =?us-ascii?Q?elIt9HV6yl2StrvfZiDQxN4cS0QIZAuY27L6GZ3UoLiNBP+WQNULbUi2OWdm?=
 =?us-ascii?Q?AcUsQY7ke1sJP/RJnbzsbtl/2N/1YxTqBioYSRvLdzkpl+eS5jpdYUUSz8LQ?=
 =?us-ascii?Q?A3Po/sk0LIJWVUkQyg9H7sV94zC/4PrhvZWxPScRUWOh9SAvveF136FeyClI?=
 =?us-ascii?Q?G7MBRhZeGkTxfMUaQ9Jyoh/Ek/EGaESfbik5OmgSC0FgelgtIUq5VmxIzu9R?=
 =?us-ascii?Q?Kx2HmtUfwiHginteo8MYAfjYCMdxi6meCvhYGe9uS1SNHLWiyXEt9u3y5Lkt?=
 =?us-ascii?Q?2W3dpyrzyFHS9NOr64F33g0bcwjX6iumQcvKyXM95hodCJGPCs/wsR2fYJhD?=
 =?us-ascii?Q?8Asme7YqsR90XXicujgODS2VYd5KP9cFSUgzAZSged2V0fMYQBFaLpxD/xoJ?=
 =?us-ascii?Q?WH9srVSMVsMnQnZZIbVTDFBRQ6x6yfRfdtMBhLxyNbatS+0Kmy2QumwDBPAX?=
 =?us-ascii?Q?vPCwYFt4Q6jp96c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lwowB6LZbezSb8589HD7xK5VR7h75qr0XhGhK51CjNu4LOodp5rxqBe3Zfdh?=
 =?us-ascii?Q?iTV8zCK9/UC5/OVXu12Sgz0Iu2dIV9RVT26kX60DVFlvkPQmS9PgGLl+HIWt?=
 =?us-ascii?Q?5pXbthcLf0FnUvwZUBGHOgkZoEeIpOhu//DW/MhrZjK8z/8sl4LQyR93jR7r?=
 =?us-ascii?Q?ntVSj6FFeVSLa4+I0TpmqoMA+cUSfDpXq+dySOZgyG2g7cHitd4cWz86RKxz?=
 =?us-ascii?Q?dXzzec3uG95wk2+fjSdXwicA8qrGaIdgj+ToTvqnS6W1OIDY6xTaSpJZ80Ru?=
 =?us-ascii?Q?2XSQBahLqbIS5wIV0LysmVbW2zEPs9DTCGYISr6LlfeTkZ39W3ytXwvyS3QK?=
 =?us-ascii?Q?qPVDOSVwMFigazNIQSksxJHcGGzxXRRCzl8qIynVw7ahKIwi2d4Iry/bWDiV?=
 =?us-ascii?Q?Oef0/Xsz/K61n5Kq1hZ8Gm/JtQrheUNDtFImYCglHhhr4maGkJKFDvsKhs4e?=
 =?us-ascii?Q?xZuivXmyvrf484i/9qQWtmS1CzT1EOej/uZUoXqdghGMTNLyknX5htRJjbdM?=
 =?us-ascii?Q?RInyri3NNegswFcvS/9ZejvLcs6AIyLef0AwQyCxHd0g1rO/kTWF3s1K3I9Z?=
 =?us-ascii?Q?UugaRZFmdvHQ7Eo+EVUsmQaqRcAbm8UjhKnh6wlyj8wE9L6CnT8AjA0zmBRV?=
 =?us-ascii?Q?tVc9gR7fOvxYtTC5NLtHAgvOQL3vQB5w78wXwJmBX0EWRkaoMUeK5kNUUXpT?=
 =?us-ascii?Q?o/u0MEY+abQXCUTxhJqC67gC1Ms8UL3U5u07eDvTwUDlIwK5V0Ww3pxXQq3o?=
 =?us-ascii?Q?DUviYewTeB8Nrnjq7PqwNpw/LQVIw/Up3KWa6uwlk2/Gy4KTipXUQiCq+pX5?=
 =?us-ascii?Q?TbYNbqw6uRWlj3xfu+WEUYjtEvIcxouJURNSBoSdFyCh4X84QdTSwY61UG41?=
 =?us-ascii?Q?dW1exAz2hrx9Et6r2YC+xtiI4BIwwR1gtFhrxGC6r1fHXUQyPclgxR45CI6O?=
 =?us-ascii?Q?t83O4EKFPbdvAiZnrUzi6b1us+mVvA+0b5Sv8SZ5+9kR/dZNgJQvFP9Uz469?=
 =?us-ascii?Q?bZMDVhiyXD90z2hd/HAe5tDl1wG89kxBPfUpcHUCWB6H237WQsbKZWecUiII?=
 =?us-ascii?Q?jb6bLaKsMuXylbvv4tI7lBDbfFKZDmSwf+oqoTkBVoinKXuL3H5rB7stlNRc?=
 =?us-ascii?Q?RZ1cUOotmPkXjdtFx6AUQGSGFPnW8yi2j9jQ8GpLOm9cz3ZEzTLVlFpL0bTN?=
 =?us-ascii?Q?7SFUGfBQM2YhbwhJoR3OleSyvabKxWGeo9FU9cjfH7hfsNwjKfheIGS+t/Vf?=
 =?us-ascii?Q?UF+f72YS5teiqXj4zyHkeATNW9OPoKh2HKiCkYKkTUxvlyTZk72XsRex10G8?=
 =?us-ascii?Q?FQE+o6k7u6JG/1t7klNx8T+pmK+TSxKVHzvn1M1puAS60GgHcOQ0EFvxp4TM?=
 =?us-ascii?Q?e9p8uXGNwfjbpA4pA3cmpdT3Y2+FX0Le/Irkwl/Q05IbXXHDyO7MppB1wWnl?=
 =?us-ascii?Q?jlBDFcXSeDXTPVnLP9g35btA/+r0O+D0jRnPWof7+CG9Yb/icS6+pRETArIS?=
 =?us-ascii?Q?oUn4SEuY+DEkKMkc8a63zyrUmDejXqSjlyOaDoI/dVVEu3DmJZ33e16fCiXs?=
 =?us-ascii?Q?wufhC0Xs4JoR3fOh8KFXIzu9O3U3BxgQnlEVdbHy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248f5e63-3ad2-40dd-6361-08dd8cc49f38
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 17:37:06.8719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8b9h2TZTx8e6DwOi12ZmgCdICgiTC/4570cXXKf1ISned0l5WBCKXAE3DeTufbH20JeXVHFRivh5LkNisJyPkjWgW+wkpqN29IN2cvmdI6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7782
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Satyanar=
ayana K V P
Sent: Tuesday, May 6, 2025 7:04 AM
To: igt-dev@lists.freedesktop.org
Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Ceraolo Spurio, D=
aniele <daniele.ceraolospurio@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_fault_injection: Ignore faults=
 for *guc*
>=20
> Add some more guc fault messages in the dmesg ignore list.
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index 82d730a7c..10374d23e 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -83,6 +83,8 @@ static void ignore_faults_in_dmesg(const char function_=
name[])
>  	if (function_is_part_of_guc(function_name)) {
>  		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
>  		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> +		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
> +		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOME=
M");
>  	}
> =20
>  	igt_emit_ignore_dmesg_regex(regex);
> --=20
> 2.43.0
>=20
>=20
