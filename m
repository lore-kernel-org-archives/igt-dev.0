Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98859CA6C92
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 08:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFE910E4DB;
	Tue, 27 Jan 2026 08:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqWi3hRL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B3510E4DB
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769502349; x=1801038349;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rvm6IljCdeA9SvbsIAdx+FodZjfLjrW4JIiNPu/rRnE=;
 b=mqWi3hRLJyek0nkm7iRPL4KOKo1cKlnvnkeBflvFw06DMp6TvxxnFvri
 /3km3RIOwr2E9925wjJEb2saU+H0+OnBJB55sYDGieGhDtAoaZXsHwOcB
 E909f+dSu/h2VcPAJgwtYFbO7t3FZq95DO0sUFJJw+W82Xst8r1vKWlVd
 bZIN4cfhAhs1PQsxjnznmSD4UAJ3LXf58SUSkjsi0jHnkO0P0yAGyDQrv
 C9VLKCU0fRFbFzl4dbKbQnvuAJRKAR3K3uLh0JTiCGWt0CUIMVyxe38iE
 KhYp67Jm0GfjDWPQmtFg+ESw9lfvJIy9Su/sH6VXepb3y9NWS+Pe1Oykx A==;
X-CSE-ConnectionGUID: tVMD2xj+Ssudun02RtvZFw==
X-CSE-MsgGUID: ZS9wrI7ZStG7+T7OrgoLmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70584366"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70584366"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 00:25:49 -0800
X-CSE-ConnectionGUID: XvuFEBBJRueJU1EaqoBNIg==
X-CSE-MsgGUID: SFiD27R2RoOeeJDPeI5jYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207717891"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 00:25:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 00:25:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 00:25:48 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 00:25:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xzw/xyP5p9z9W6hl5HEgiQKwb9o+5jjB1zdS8pnssGG96ZoiH3PJQWlEnN0sk9uQe7xe3HqBfnT4b/PZSIzs++Dfp3HTXo3yN0auphcTQKlmc1qmck0muuxmelXDTYHDK1ReGxuvyOiasgFRx+a55o4/pq1nKcMUUYreIldfQS7DyUC7jHKKZYS3/Wiego+mnbMsrrlybxanP80D0Ut8rOxyG3flK2cHNZKwLacr4YCDbjWgyy91zvDbGTfgrxGjkdXAohhay6+krkK6xx2P9hxqCmT/ZpwB06tpjCRah5HuNSreplMcHjB7uKTo6PKXUvuj3j57CEoTXGe75nV4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdHBlQo/ThR58OHpYkm19sSzC960u8WuZQsDPlzi8j8=;
 b=Vvxu+99vatra7KurivSE9Xs8tZWxr6bc5ky+fP1QDDOelcUj0jQ7dt4PfJoze9XzFf/31VJ4qkV826w+cN9rqDvsyWbtxWyZOc05krzfa9h0kYz9YFMhhVpIybHcGhXXWPHISKQi4m59KndM0It6J5Zb8Qx3DZZh442xhPjWepeM9Xxkine1XbGaKrcVbFI+PqLhruz2aSpS7xgo7Pxqfy4wwTeEzFd9nDp2Lb4lQXXan8TXib663Dl0QqHxeeRXWyWZeK9EQgXNGrpGsi1rXIEvrUUG6VpXMWsTQ44ifbYc3tjvIdkxPnf+Im1gtL8HxGvZRG6hFGxAFlpxEzjFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB6196.namprd11.prod.outlook.com
 (2603:10b6:208:3e8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 08:25:40 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 08:25:40 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
 invalid_fb parameter
Thread-Topic: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
 invalid_fb parameter
Thread-Index: AQHcj0MzLVgbULUVXkufqsvSmucSv7Vlri3Q
Date: Tue, 27 Jan 2026 08:25:40 +0000
Message-ID: <DM3PPF208195D8D473384C8865D18E79369E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
 <20260127043233.254107-8-sowmiya.s@intel.com>
In-Reply-To: <20260127043233.254107-8-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB6196:EE_
x-ms-office365-filtering-correlation-id: e3f460b3-22e9-4d8c-735c-08de5d7da7fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?40+O0MyS7vnhbWx/RlzT8ujx/93Nr++0gowfj8mEBZzmeWLR040ippJWF+vA?=
 =?us-ascii?Q?EDPt1n0Lol51ZLzPYWObY2tlYAZG+cKMUyeAoCvN9+7/1G0aO//9+2vqtC4d?=
 =?us-ascii?Q?T+MV5oFv6sw2+8CW8gn2CcKOB/PHHQKY3+z3aZ/8YyKLZ0o2/hpCrrTThkAo?=
 =?us-ascii?Q?ptNnBXgUH90+HLLFmqcuaGJVTjXqq9KpmgpGR8g777tu9zyyDajVU7jVf6Nv?=
 =?us-ascii?Q?yUJBtnkzh0x1AvuS42MFfsyvyhdMgrWRan2PIXNjlpDd48dzGuw+kth2qep1?=
 =?us-ascii?Q?QHyjD23p4vHCj4GMZZwZZ8IAKp8qUYIKOXL9F9XBRfYr5gUqBKHU29u8EHxT?=
 =?us-ascii?Q?+rauTBsDPN8nRjpXVtqzRx4Pm7bDMJdZFGLwwrN9WZQBqtUWRD3zIqPJ3AeU?=
 =?us-ascii?Q?zCGVbVgbdZiw5sWFFM6GvYmS6VVAfTi2p1Ko3vhYrpP5mbD4DzsmsM/RpjfY?=
 =?us-ascii?Q?sVMMoL4uLpUyQrpsel4ACRU1n2K77cF4bLQvo+yMiL8KE2lnXBkpJ1r+E/XM?=
 =?us-ascii?Q?K0CNy5a5Tuynlc96xkmRfwRb+Il2jW1Ff4Ahl1ea9tDaS8ufYf3fNliSGo4Z?=
 =?us-ascii?Q?3IMkC3hGCYEFbDe8NTCDRXuDh3LLLqvzAKFqZTPNXeK89ukEPyqVBJ8NWcKE?=
 =?us-ascii?Q?IU3WDI0+c6L/VJD4+9JI16ov0WD8Lou7+S5Dst39gfpW++B2ZOr4dwAG0WYv?=
 =?us-ascii?Q?TUQzYiUH7AJZXK7qaDuu9f/KzfuSj6AUIb8v8f+YqfFvOZbF1cE5GKKeeaym?=
 =?us-ascii?Q?/2bUjCUP3tSznFDWqHXX8DICUQ97vcPTH+fxcx70Q2Va/qVxpAx3rYxXJznE?=
 =?us-ascii?Q?YzYRXRZFGBQ4dqzphNcEqge3pZLpac5DVGul9H13+USw+2Jbu48p0LzUYJek?=
 =?us-ascii?Q?CFMXLc7FH89upHwegZS/TEy2KutRIwZBTHdnQrEoQOlP3VINnju2ejFQTnaA?=
 =?us-ascii?Q?vUdZfoADfGk9AUJ225t67Rdo+0Qbiq1W4isinHb0abMF0X9lebYvddilgs/N?=
 =?us-ascii?Q?quyq92ZaZ3w0om8K0GLvAsl2XOaAWYgZ1LKpOUnKWqxjPpUH5kakvVo5Plq5?=
 =?us-ascii?Q?1oXrmowyvZRB0U1sARBGX27vd3+I0d3EYKWUeT0J6oNi2cs7BDI51nhBhK/+?=
 =?us-ascii?Q?I1CHzKhFeKyIreFcNx2x8/vKktfuZTNQCEXN9iyD3hwYAzIYUk9uQBfvnRdw?=
 =?us-ascii?Q?+QStTuGGO6e+892DqGtwGz+z/Xjq6utfw64d7rLoO2oZXUMRBUPzIWhpf6vF?=
 =?us-ascii?Q?B9767677eX2e8KCcpF1JutEF6uaOKFUjiaP9VWIJN2PQXAC6xtnD8c22Oz1G?=
 =?us-ascii?Q?G4V2B2+dbVlFXxXODwv7DISZTbGYJthJZDm0+cFnvng7ARIVgT076NOftNEr?=
 =?us-ascii?Q?N2P16dSDATnqdxgwxfySbZZfnibvstQL1ZvKrMhkhUB6d9hlNo2mwkBk0Jjp?=
 =?us-ascii?Q?MzG3Yl5t00UoCdnEY+7Z3C2m5Uy17BY5OXKlcsGQFW+eM2sN5e2QbtbsuIaY?=
 =?us-ascii?Q?rwULZryg6ewPl9yfBSKY4MBOpBz4cldywxFurR8ug3gNKy/gFLk7UzduM8sU?=
 =?us-ascii?Q?PFsIrDDsHHuxKxyy1Qru2AfxNF2d2QW3UoINpelj+xGAvauSaODt2cRkI/g4?=
 =?us-ascii?Q?XWW6UvWsMrJzOVVT5+YS+qc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M4518hdMybbyhIIHFILgywir8Ds7l0/vWY+sefcRCciL9AIDvZ/LDyK485Nh?=
 =?us-ascii?Q?kWaNSwr3Z2fLZ6py/y2KDi9kfFLAa2bJcMsbMb6uNnDqVBs1f8X9llnSXy59?=
 =?us-ascii?Q?bC03ClkAUWNQlkEERi1MW9stVXPsi3FcsGvxlWOFxpzN4qUJwHXZCjtFBSPy?=
 =?us-ascii?Q?YBFVrw36QQ72qXc8lsyZsheTTAtuequS39xSWKTe0Smo9VdZhdeD8QvZ51mm?=
 =?us-ascii?Q?Xn3tzk+ZAcPbgO/KG3JUmto+TIYz2AT+qhPHT62T4SekFuKw/U+L2O+YQcSC?=
 =?us-ascii?Q?ygq8vStQhuqfSscORZcDD8LCt9PkZ71XdmJgAsWv0G4x91xjlexWATCYX+tU?=
 =?us-ascii?Q?t3vZGOBZHthb4+jHZf4ZjGfdMGZj8jwrohbLDLjOK6+ZKzENuNPtAaP+lgPN?=
 =?us-ascii?Q?mhQq9wcRNbTh0N0nYaT6VPIRVXiKUieUcpGqmqPip6ln5NaK8Zlhaut/HBQL?=
 =?us-ascii?Q?h8wvkrztii3FGtcH4d2rHuo5ReOq/EZ2lSuJp0ZugrrR3XeRGMWrB29h3l6k?=
 =?us-ascii?Q?UmyNuEZNmgNiTvZZRPABmHtnNSz/yIXaReW985Wa3dG3BFGG1500WLr1FICG?=
 =?us-ascii?Q?Vd4oARvzhgHXjc7c7TbL8c+15wLTjYDeSflUNM7GY2kR89gIsjsMJGjhVqSA?=
 =?us-ascii?Q?VzB2aMFXnHM5I28cDbpOarEro29ClGlQ7tMwH/VyLuT/Bo5WaAdAuX7IfZiE?=
 =?us-ascii?Q?hnCtTuvC/3xI4P8NCwsar/emxvpqkdonl2wy7Mla4w/IFRfyPux1HTKUatCH?=
 =?us-ascii?Q?bqzghsl9F2fVP60gS2fwTY6aCjANoiCk4Hz0WDg7m8nz+VLtuQPgFMXY0ZQf?=
 =?us-ascii?Q?Ha923WtVIIPQO7hmn+Oz1ae3v3HMmsO+KCFXBYqOQ4rD5X0Mp5ksv1af2Dhe?=
 =?us-ascii?Q?XiW/0Xd2Il4h0r8TQjks9NJX+LHW1W+LTC4kk7X4Ke8BuDznQxfQmSmeyxWx?=
 =?us-ascii?Q?3zhu5BB3fp1mpYzE8lKTvDCrEudk8KYkfVj/LPipGNLHD6eeyW0uSUAxezSi?=
 =?us-ascii?Q?j34fguKq8zqACMG3O4NKEMvBeNAMofBkpvrnSRoVy/3JiFWBqPkykU4+5hp3?=
 =?us-ascii?Q?eVaqyjPEOAU7fJqqZmSpHU8yjCQVrvOosArCC0EdxX2/8NPK5V/jfQ1jZD9o?=
 =?us-ascii?Q?AD6CMzhUbOV9t51Kp0lHAjed5dln98U03CZpJ3TlAso8FPQ2Fq9o6Yd5NzMi?=
 =?us-ascii?Q?dNvKbTHl3rjNZtmW0F36HqAFvh3FTRdeS7cLcDxn2lRlOln2Hwzxml93H5dC?=
 =?us-ascii?Q?EBYo9xNFDWpdkXfLZuLDL2kxWnXSYvMmNOxS5FswjI8UqK6u9UeTvX1L9uRC?=
 =?us-ascii?Q?b8E9hnalGKMrSJ+vpFEpRaZahQZN1NliTGmPkripAQ4Ju0GtU5Iwun1ighvO?=
 =?us-ascii?Q?9OemY1CSjwL1ptu6K1WwYCPr++5x/GXYRosv7+FbkirQfcoKlPpEYhbU0al9?=
 =?us-ascii?Q?qI/mBwiT5YW1hp5cG67XoFU5kg1sxLtCSxoh9WJdsBXJkHGU2rokg2t3cqze?=
 =?us-ascii?Q?NKc6U+Wwp/NS5q0e9I/JyIzmo5InWQY40x6WljK44cK7lH1+OFa3sjHenBSX?=
 =?us-ascii?Q?gFa6wRhaOqHUNEFHwOGSGrDpuNoU+8S9xUqDNBAccIyrMZcz2ACWAlqN+qzt?=
 =?us-ascii?Q?lWu6XzX2X/TH8Tqr8uvMDSpaIR5UJ/xZtV06tiayDoDizjFXOCnxck/QHU2F?=
 =?us-ascii?Q?EWDuS17f8/tzWBA/XEBPn/ba5mn4CmgcCuoAH7p1g6SKw5A3YNP+xJ8hEBu4?=
 =?us-ascii?Q?uUBwxSl9iQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f460b3-22e9-4d8c-735c-08de5d7da7fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 08:25:40.3470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XsTi7tJxqdN9QEgzRhQb7+nv1RIU8llamnSoXM+d4o7hAPj9vvz0NQl4ivfjeHbDlG+yJlieAOhR1KzDlOxUHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6196
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

> Subject: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused invalid_=
fb
> parameter
>=20
> Remove the invalid_fb/output_fb parameter since it is not used anywhere i=
n
> the test. Reuse the fixture's input_fb for both 8-bit and 10-bit formats =
to
> simplify the setup.
>=20
> v7: Remove invalid_fb in a separate patch as per review (Suraj)
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 58118b8da..8d5bf5294 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -297,7 +297,7 @@ static void test_invalid_parameters(igt_output_t
> *output, igt_fb_t *valid_fb, ig
>  	}
>  }
>=20
> -static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, ig=
t_fb_t
> *invalid_fb)
> +static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb)
>  {
>=20
>  	int ret;
> @@ -706,19 +706,11 @@ int igt_main_args("b:c:f:dl", long_options, help_st=
r,
> opt_handler, NULL)
>  			    (!strstr(igt_format_str(test_format), "BGR")))
>  				continue;
>  			igt_dynamic_f("writeback-fb-id-%s",
> igt_format_str(test_format)) {
> -				igt_fb_t output_fb;
> -
> -				fb_id =3D igt_create_fb(display.drm_fd,
> mode.hdisplay, mode.vdisplay,
> -
> get_default_fb_format(&display, bpc),
> -						      igt_fb_mod_to_tiling(0),
> -						      &output_fb);
> -

Why delete these lines this patch is simply supposed to remove the param in=
valid_fb since no one uses this=20
All these deletions go in the next patch

Regards,
Suraj Kandpal

>  				igt_skip_on(data.dump_check ||
> data.list_modes);
>  				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
>  					      "DRM_FORMAT_%s is not
> supported\n",
>  					      igt_format_str(test_format));
> -				writeback_fb_id(output, &input_fb,
> &output_fb);
> -				igt_remove_fb(display.drm_fd, &output_fb);
> +				writeback_fb_id(output, (bpc =3D=3D 8) ?
> &input_fb : &input_fb_10bit);
>  			}
>  		}
>  	}
> --
> 2.43.0

