Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA8FC5AD49
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 14:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF11A10E6B2;
	Wed, 28 May 2025 14:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zfc+TpFZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D9F10E6B2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 14:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748441973; x=1779977973;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EDp/vEDe1pCMkau6iICBWDJ8IXPNlCbncJxdhOQaEQo=;
 b=Zfc+TpFZCj4TArRGE8iAXbbaQ3rQAWD7YXShXy2M2TE6Hj+ioiHpLIfe
 TlXy2sTqPkHpdXZKBRG4ZFs57KUtdK0sBkHxxdEVG4Tcdb7yVSHUDO4vQ
 DQam7AWjT6lpmNwSM+QJRlsnhWZbAEtjnoEzO399SJ+YEVzZNihKwQx3J
 uX78Ep/cCA+FwZ2pJvkMihfAuGjof3122EMjPBsfNTUY+rbu/3qVKUjZC
 jaUzYyg9HbPvdb8QhA/Vccxd2tLOdjL6b4B5wPr1U07u2CjCAVvk11DKz
 OSTRU9hvta8hEYBhzIp6W0l2UU9QLnuCt74hbaIDZ++eGRcgm3QlLQnjE g==;
X-CSE-ConnectionGUID: nYiMkwMNQXSK88cAJ95ZIA==
X-CSE-MsgGUID: U4P926LfRum3ML4o5895xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50525530"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="50525530"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 07:19:33 -0700
X-CSE-ConnectionGUID: QdqZWshOQF2HKAZNdf23WA==
X-CSE-MsgGUID: wmiA2w6wSvWU4H1XPCQrjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="143241016"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 07:19:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 07:19:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 07:19:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.62) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 07:19:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anIehMcBsbXTk8InCugA56l36455GaQ9ze//dXj8LBb0/jqk02zqh2wblivIE5lu6JIDY3sXc1338g5MedmngsToYJL+vjEWr8wTBCqenDFr/+sNlsiNSw6RnPB4k+iYVFVQ58hOreecYfxuqr1kQK/M6WGzmCzcpcb3rxZtf3yInUykyCQ6CdlQjDKi9SHQowmcuyB2cqNFQW0GhkATzGSgB6JolnyezJSC0fInP+dJetvdsB4ghXLMYwU6Rabt7CuU2ytfW7HgcdzRjSZRdKA/cwPmtW9NLOMjwSOcs08qCTvAbzjOkGHqo4WNprCpIgn2lCYZinTjF+UsgaAwGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+ZlO1rso1x+Y8+JmxwmH2beXzcPkTojAurlBPCtW7k=;
 b=rhrUpkw4coUIda7um23Y0/W6aBPd5PRNOwMMpacG6w1MiOJVumAgEe1QxGhau9Wd6Pamhg/+Rd/tTa7Nu8skyBjIoB/DZsGk2ZMaZRb7XUv78gMwMgE7FblcLxKdAQUdz1XiR07Zbh1kzUQgf0xn4V3xh6GxQuQsXCRWb7lCXZxN+lssnvhRd27uVsVKphOK+yctPZtlNOIcY8YaNvOuih5a01rat/I1IlJjO/b0xaGiAUydPCEuuy10pS9hclQO+DpmTvF4ecllHxHxqbBtNgTVzVKGtcS1oYEmIsQwf4ELAvaVy+vEZfPOdhPtISSx/bT6JidtmkQwDk1174PPGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB8860.namprd11.prod.outlook.com (2603:10b6:806:468::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.23; Wed, 28 May
 2025 14:19:30 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 14:19:29 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore enable
 activity stats error
Thread-Topic: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore enable
 activity stats error
Thread-Index: AQHbz9J3J5RieLbmwEyA5/q1tbMsIbPoFERg
Date: Wed, 28 May 2025 14:19:29 +0000
Message-ID: <CH0PR11MB5444CE95C432900CEF9921A6E567A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250528133049.8975-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250528133049.8975-1-satyanarayana.k.v.p@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB8860:EE_
x-ms-office365-filtering-correlation-id: a2709b9c-1859-472e-5b2e-08dd9df2a8be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Vwgmxh6nPSfClfP7rzuINGOx5/ayAA7WzBuQ8kqCDKK8iGcNoDgZPntYVj8y?=
 =?us-ascii?Q?Gs8tDSpKtikO/EUKIWBhW4Qnhh7bMdM7zESEDpkjQCQmy7sGCaSms/zZAXNl?=
 =?us-ascii?Q?xPDGqcadQDAcxKYl7P7lV9hXIqVP9HXBRHinavrRMG48Hb23QkApQFa8Jb6f?=
 =?us-ascii?Q?KQiAxLIQ2fSj8Af4VDHd55BEr2hksDRfVQNJ0mXM4HOuRczOrMiXX3iQwppu?=
 =?us-ascii?Q?ROQvpVbkIOt9qFsmGhZ4zytqNleLAqyibifBBT/0PWSZRK5TPIhVHyB3H2i9?=
 =?us-ascii?Q?FL536HRscnWUrmz8Cx79R7rzKSsC4BRzr9UdIAdFksnvcyzCszaO/n2vWaAT?=
 =?us-ascii?Q?sOp+a6tnkE39/j42DSLplNNvxB4EiyNv3HMU1V3usFCnhqls0K2xxaNpaTZX?=
 =?us-ascii?Q?tvjAaq0brWSHbWvMCCv53whHDZPUnqevsdw0aZAQhpDY/rIEDeITEnqgXAL7?=
 =?us-ascii?Q?15jZ0jd4Va+rtyXBJeCcuETtl5D8uwZ2hYBvtU9uAwIgScjisfeEDqTdYdBU?=
 =?us-ascii?Q?6+ir7uB4QduXaW1b9QPR7OEs+TQSjmjEgTjITQoax25u+PMjZuzWN5CUNN1n?=
 =?us-ascii?Q?OrfIDDD+Wz+laW2TXFBSPIdSdsj8RRgW37lXajPL9+IN12NzkcKLi/hT1DrX?=
 =?us-ascii?Q?XasuyJeikwnLjesmKKC20ZQxGauFCT2LAmrrVs7u8UlXR+94R1BEk6HTux5W?=
 =?us-ascii?Q?6tgojEZ4AT0pqeZqnl0cIyperLhuoxniYLa6AvxQb0KSI9SPPT5Agc+cpaBD?=
 =?us-ascii?Q?BYJGw+kVz5pAB5giLBqL2qBqvpxNijqnqHRJuxs2uB1gHbf2XD3QDczHor59?=
 =?us-ascii?Q?yh7uw+H9QvP5o/OlcHaDMkD94K4lSQu/4MoFt4gEqr7YcCgpHy3BoPGXOVkE?=
 =?us-ascii?Q?bsDwesDa7NSLUQrDX12tUwlbxAK9kFrK7p+13AmLXGdWmzgb+IGXQTWYoNjv?=
 =?us-ascii?Q?UeP4vZxnII7fQJ068KJXbRsdTnBv5Tu7Ft+iwXjmKvH4Xrqky0gmLPg0kCZI?=
 =?us-ascii?Q?dFp2h8M9RHyH8pMidKDbgWsYGp0dE0egeykTrjUTpJKMTloWq2wWld/RUPri?=
 =?us-ascii?Q?0PyvxWVleMBz5x1nf9q344cLGc5VdidlaopZbXLN34X62pS9TISaDo42yP7l?=
 =?us-ascii?Q?7RDQStq/mrRSHJQzPZJKWEENAgPABoyCuV50742bTDuVISufT04zfDmuSG+G?=
 =?us-ascii?Q?A+ZSOgi2hJICT3QgF5R2FtDuJbgp4E26EmVRTz0tKAS0j06SoHj6mf29Fyy0?=
 =?us-ascii?Q?qiq6bQtbfxNrn6XNXo28Z2fRtCyse5fyRSRQsZoAwuSM6mE229pFK0sdDE0o?=
 =?us-ascii?Q?rT1TQCi/KWIABd1hHwO4XZ8tL+OVNDcb2pPM9CS8XW0K/1nEOWFY4KmFEGxZ?=
 =?us-ascii?Q?4kYRKsf5XIhtT7wM7c+qJIalmE4Mo34iXBa90hiwfsJK4pGs+unCp542LBfz?=
 =?us-ascii?Q?DP1cdWZATWvPpd0s4qAb4+qEGVoOJ5j0qAY38/h4weqy6oEKmOBeO/fusiz2?=
 =?us-ascii?Q?55aJh1EJMLXmONo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ubpHnBSpnmRCA70lmgxEeG77u1AM/cRmL/rEtl6D/s5E9ryZetFtqDY0jzva?=
 =?us-ascii?Q?aISlROIL0pmtnNdgm2C0+WWgYwVIV+9AMAuaZh6E1pYXIiEsY7qdVQzaL05T?=
 =?us-ascii?Q?vUVfWS8mcb+aNOL5rh3mxE+yfFR23/PrvwEZJo9W3begPIaVmGTi4JSlD6Sh?=
 =?us-ascii?Q?BAeHmwo/dRhG0hR2K0ucweNb7XPJJkOFCKJnn/KgVQWDAiO4VjsOOn5ECIfn?=
 =?us-ascii?Q?f83MRbujpnPKkDr6TKFFnKdl1cHzyqDgbRUEBjnOPrApW27c1zaVlVMsnPFK?=
 =?us-ascii?Q?gkC1xngcbRCLYU93NN88v6SrGFj9HNAZ6cqDbdRQCBkNiDVKcvT9Nq2Jy3bh?=
 =?us-ascii?Q?Q+lgS7/NIjtptjPxTSJmWukBO670Ub/j9U0dTXFeeKg81x5Ulxq6B4l+Clyt?=
 =?us-ascii?Q?yQ4OcgYTlmgTOXA/qh0smGhkunaJRNzObVDH9W2QB8j0SrSu4ib8x5NAJKoK?=
 =?us-ascii?Q?3mjeBaKHnzE4kq/rcLRVGqaSO65Hy7VflNltjMkhhMNFgdbwuZ0l+u0f9Jyu?=
 =?us-ascii?Q?7xBVYphRR7cpPOMi+S0Y+AunmS55EERcdrpZol2wxn7bfrjQolA+BVAxeuyh?=
 =?us-ascii?Q?inOiwKvav0ZPc8LHVjdDmNYgBoDmT1b9nrjcDqMCfGuIf8Shl+xIxv3Zaw5X?=
 =?us-ascii?Q?uvAobLEFVoPl20ULA+NDgEaO8NTxlbQq5HfQ6nTnFr6R1qMvza3uZ6tfyMy2?=
 =?us-ascii?Q?LRrmibJx2MpkMZEcqHEiCe8ooBIEZb6QqSgEMqd0Pkv1iqtGD81CQUsAQFif?=
 =?us-ascii?Q?5+UPyjPFKG7f8Cf7EctUTCN+DUktCmhWeGMyQWKc1Vu0EDWN3eV0K5LjTQpr?=
 =?us-ascii?Q?7SbybNHLHtQEnfiTeV/087TdfnYS3a5HXqft01ce8Js/+iSzApsVSTX2s45x?=
 =?us-ascii?Q?lIFOv9eLHXFnZ0/cAvIlzV9IqWjjb4+s1RwIjYzmoPObH38+DnVFkbO46t/j?=
 =?us-ascii?Q?UEMny9uKd/JcNXAfT12sJBhsp/obYiEGoV5JR6ZaMPFNrHN+i+cf4eHcezVG?=
 =?us-ascii?Q?mZwLMHfQrnv2FzkKZgrvFgOlNdvGOGyjtTw3JVpI5ngCDnKhHNWjeE/3S17N?=
 =?us-ascii?Q?UA0u6r9D+R7KBuNmXyYxwKUxJL1fx2HVWNhh+ij/1qKgM/1ZflKWkV8o7+l9?=
 =?us-ascii?Q?0VJPTxcpWn5rN33xN8kYYbSvcoWwCCh89wRuqgpYbaQ3Z9SwFqqz8PfiGofM?=
 =?us-ascii?Q?oYOYlHqFq8S/t0oxlX80nOSYj7IuqpCbYgI48orbe3PAmJDc9xA3vFcDUrrA?=
 =?us-ascii?Q?MOCCnucNnPjuyG0tHpUhmt6IbRCXBd2U5MKphlXwLF8UkFLedzrYOMXIqmP3?=
 =?us-ascii?Q?z6U78EOUv70WeI33sDwUTRq7xLN9E8r9IQ0zJurNK0KRoGXmMso25DF0p29R?=
 =?us-ascii?Q?f3Adkc3MflQvnYjxHyN11/a1PL8EOVbpledOROCYiJdKKCBIwodiI8DTLPTP?=
 =?us-ascii?Q?6axRxlq6WHw77tQKL4gQeovd2gsuVHlfaM9NnJoI27tgRPyT1v8wUEkO0rVO?=
 =?us-ascii?Q?uCNRXIAexN7JJSCDBInqeWxVPNKVTgAuT56hKirbJw6c4EjkeqIbMdMuxwOm?=
 =?us-ascii?Q?8PAXzvwFKSPOmHhu/MNTPnZNHztJVmPgBz1ONGv0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2709b9c-1859-472e-5b2e-08dd9df2a8be
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 14:19:29.4876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6AwRfGrn/Rerzn50BKnmH9gRSc1ov2PSEimSFNdCaVm91+Vx67NXQVHny6u4PeH4tWHrLtAAawoVyUY9arZBSMgiWoIeWsKQnBm/vgBuToE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8860
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
From: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>=20
Sent: Wednesday, May 28, 2025 6:31 AM
To: igt-dev@lists.freedesktop.org
Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Cavitt, Jonathan =
<jonathan.cavitt@intel.com>; Harrison, John C <john.c.harrison@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore enable activi=
ty stats error
>=20
> Add some more GuC fault messages in the dmesg ignore list.

I think it would be prudent to explain why we're adding this message to the
dmesg ignore list.  Perhaps:

"""
Enable activity stats errors are expected to occur during GuC fault injecti=
on
tests, so add them to the dmesg ignore list.
"""

I won't block on changing it, though, so:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index f9bd5c761..4ca8a34bf 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -85,6 +85,7 @@ static void ignore_faults_in_dmesg(const char function_=
name[])
>  		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
>  		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
>  		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOME=
M");
> +		strcat(regex, "|GT[0-9a-fA-F]*: failed to enable activity stats-[0-9]*=
");
>  	}
> =20
>  	igt_emit_ignore_dmesg_regex(regex);
> --=20
> 2.43.0
>=20
>=20
