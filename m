Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C85C7EE33
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 09:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF5510E990;
	Fri, 27 Jun 2025 09:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpGiHh3B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC9D10E990
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751016066; x=1782552066;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gn7ynIk4nH/ZA7sarpxJ3jUvE97DznYJHXmMMcdpRP8=;
 b=LpGiHh3Bd8VbT/IwLmTckM5iVp4bL7cG5lUNGBscVMxuWb9fjL4iwXGQ
 WNFK7QEI4c6kO7eCOABj825IvmdhiR8mJiZQi46FKO61AlP8g9o4tsSNq
 c7nK4iT2Rb1azutWyiZ8iwsQLc5ZfrP4G1yt6se3c3ZDJaNmSehFAkUvw
 5NCP9uR1ADPoskA0UZg1geHieahmUfKWPwgSAoEqrpFrX5+GNn+RMZjGO
 ONq2WK/MLpAAYphUDcVGSPMOBwlV4yNxGL32zhzJy6Qk5DrPtNb4O2vIU
 cctwFxmmbMGZXpqVu2rrjIRvauIKQpTWMags3cG//auVkfyKHC8N498mU g==;
X-CSE-ConnectionGUID: DFwe0yRDTYC9V3Z7oXfFbg==
X-CSE-MsgGUID: oYxZlqdJTsOusUQUa/xvgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53199430"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="53199430"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 02:21:05 -0700
X-CSE-ConnectionGUID: sTf4SlDcT8SX1awjF5dqfQ==
X-CSE-MsgGUID: dr36qB2eRRGlRWAk5ntd5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="156799120"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 02:21:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 02:21:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 02:21:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 02:21:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpuaDKzpLOVGrLLggm7vSnhJUaPo24fOauYeBbwCPQ/o8DdowO2l2V/ahYQIGQ+gI4WXW/EyRcXI9UG7ebTtF7Z19yOL6FAX3cC++roKxWyk4m9tLIkoSxS3hweH6hqnuh9LdZm6h3nAg6Bs4BP+2sUD0nbwz6/WrMNuR8W2dLyDBqDUcV4vQ2G4x1LgpP9eEdVZJi3CZD+gmN2rcyiDSeGwM+v+wNGA++j3ESO1TF7H0V1tdlSbJCBGaP2m6u8rMUQRc1DOJu3kTCJifvtLyBa1sKed4Emo0faWa1t5Tk7NwrCgeLwHHHUu0re+DM4aQYbO+GdrVGi16kRdtiUGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9n0fVrDntiUyhwSMqHacbJi5yNuyREY/fpXhWiXQSjQ=;
 b=PseQa34CZzHjdWTbQ/QMEOtQsh4L7z5yTb8x66ltBakuJoHn2efWk3Py9f3J9oEUWz42a1yY8RwGmRS9EmmU/MpkHyaC/ilJjEJQGML7E41g4jeyfMmGYPafyUbL5OcjwQr1478mwAZ+7EpOALPYSUR/Qk7zAgxTJgrOdnVbQIvKsGhAvYQ6Chbj7xAFLuK1mgj3TKsHpk5AW4GVvVPPy3NHFq7PwOC/QYVEpaci1l7S6D3WZ/8aY8yxopQkwl/32/ZE/Hm8iXgTrUruWHhFZOBwB6cd6XaMZkuQL3vXVvWH7SlaxdcVzSg1PXJnZEhH4no4+jSnWj+24zHAi4b/kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by SJ0PR11MB6574.namprd11.prod.outlook.com (2603:10b6:a03:44e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 09:21:02 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc%3]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 09:21:01 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v4 1/5] lib/igt_sysfs: Usage of Original debug mask
 to read/reset
Thread-Topic: [PATCH i-g-t v4 1/5] lib/igt_sysfs: Usage of Original debug mask
 to read/reset
Thread-Index: AQHb1RDl+ZxLuNdGNUqRuDT0RN822LQW3ZZw
Date: Fri, 27 Jun 2025 09:21:01 +0000
Message-ID: <IA4PR11MB92515D8F82B4AEF8C1EA603A9945A@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20250604053046.1702233-1-pranay.samala@intel.com>
 <20250604053046.1702233-2-pranay.samala@intel.com>
In-Reply-To: <20250604053046.1702233-2-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|SJ0PR11MB6574:EE_
x-ms-office365-filtering-correlation-id: fd17840a-0a12-44e3-3439-08ddb55bef65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ykLDTvxdYbWR8IXI0R5X1OLiLz5VCKDw9rhkTCvMPbZyazxF+jsTswXUyBqi?=
 =?us-ascii?Q?z9+MCxxSYQns0yN0mirbvLypKbzmHuZVwFCFx+gSWAHjEi3n+lRrJqBhwhcY?=
 =?us-ascii?Q?j002h8d7ZEwa1gxYEDv7YKggzN5/Bm/YmxR5WcV0/VVT6HscSrBMEwvt4JL1?=
 =?us-ascii?Q?cJ37x+ErgbAE8uhq8gkiiZmx8dImVQN8+iQV/sT7dnMfIbKCiClgbeD32No5?=
 =?us-ascii?Q?KAxI3uqte4/rOiM5SdWNFEOsISmop73c7CHmIUi8BHTjf5XWXpdE5phTub2T?=
 =?us-ascii?Q?wguCfDb+CWWhDODHS7UhSuorqO4/bTJNr84BQhrTKCWmM4op45uleSyuieaO?=
 =?us-ascii?Q?uWV8W0a4JF88mAg8hnmXCXlPysGBjDwJvH/6F42a8Tcci8W0gxv9HtyT4JE7?=
 =?us-ascii?Q?X/4enapcmTLvDXzkavgKtED3TPAAtirLXKSNyTtl6XR0739yHj5h8J01VhDV?=
 =?us-ascii?Q?Vr+KBwNhp3cZ6YiZr/czwZjsYorFRt/Wo51huhTIh7FfGuz7UaAe4nYYzkQf?=
 =?us-ascii?Q?HMkQO2f4OQOGOVA9V78sRjCKzutTz4JtU2bhgoM2vuegErRyEJXM/zbf6s39?=
 =?us-ascii?Q?I6q91OCTypZ4jINkzQoGTDzyQ74p6GytVqN9dSIy4vNDHnnM07H/KKtaPXyZ?=
 =?us-ascii?Q?pWs9Y7Mqer223p6p/RxXzgCP+prLEh0G+UF/RTxMPq1DExOuxNU7fYXaXt3J?=
 =?us-ascii?Q?9m6fLM/HE12CBzAXLeYfvRC5yS4FOyRCwJEF0nnM5J9yyHBRrk1nbi5S39v/?=
 =?us-ascii?Q?UcaEgOOC7HZ9JIISFt0RBEtlGyxtZlQxjpQvWqrG+SHcexmPRVGM9WNyoJEc?=
 =?us-ascii?Q?/Qap1vo+UQfP1ZG8hYJ5BWzK5RfkROcki9egi8f21hhHw/g+DJwtNH/roEhH?=
 =?us-ascii?Q?z2Q2NHgZ55exSN6fiHdaAvnwXvP5vGrQ4GJ3K0AF580JNGwUfAHh0yOT7ZoE?=
 =?us-ascii?Q?VCbLJFOczo6H3Yy8ecFLjhIN62+MpjHRdlDeW2XvedBHN0JsZ5rvet38St0h?=
 =?us-ascii?Q?DoaltC09ylZ3xv2PoQiAlmTMsT1skT79QY0b6Cq91nLuqeh8JpBvq9GF/W+z?=
 =?us-ascii?Q?O3+2PPCztMBBAgH+2/r1hjtvFC2VdybycQa511Md0X+/2b8i9AnyFLAAaH0U?=
 =?us-ascii?Q?c564vbBJsOV1D4dW+vljpUXYZR0R3RWYrrfyUJic8bebfckm8aoNver0Z9X6?=
 =?us-ascii?Q?6+9QEZWhWH/Xe4+atnZB5PKarxOoGwYwOZeySMoPGU3SaYp9KlIRObvsZgcU?=
 =?us-ascii?Q?0aYAiHGeV0eC5ogYdT2NguJ3D1+gKwkfNXiKBHU1/sMOa/N2E2wVRCrLUxC3?=
 =?us-ascii?Q?RmzIL7Rw3+Vw04RYrRCgtO80vTXcQL4GjdmXSWabWrbJ+8phRcuZp9sxDFk4?=
 =?us-ascii?Q?HRlXKCBLWIaWTomWPbSaPkm9pBejhGxlOc/2LpWmYpVJQVolobGwAzh92297?=
 =?us-ascii?Q?jwP0tVX77sOUqg1d1BxHlL5ZtcZrN3YzrReiWs16RrMLR4IH5eQzJgPySL1Q?=
 =?us-ascii?Q?LFdnvpwfpJ1wyHU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r65evGMuc6aco867LDb9N+CIgswv6dH+CreQGolvCFDXc84gfV4fcDqleD1d?=
 =?us-ascii?Q?XRTJeUW2uf5ju2U8B+ayslxDBpkmzzefkHUdYarx9ijL6yjlT6HVrxxNjrSY?=
 =?us-ascii?Q?Uyb3l1NqpPEJiFdjBUAzfq3bwoWrPZLrn0IOZkE+v3Z9X7rnPz+E9luJnxfp?=
 =?us-ascii?Q?6PxkDmscjvNs47IIEHTglson9oCLrTpFevUI4/jTPsS2qDz4O9cFj90N2CDK?=
 =?us-ascii?Q?Lq9f7b8oAuyT/Z97nGi0HBMzkvmEEYGGa4A7nJk4FbJjKRsM4/9zwluQK5pK?=
 =?us-ascii?Q?DVJPt5ca+rVA0YC7mUbggwxyv73ox9sY2WueLaTTktuUo13nrAw0+tkF60Nw?=
 =?us-ascii?Q?3b8TwKDPEaVhYFNJ6vpvLerEBLaOpWIPITXVanLcjyb03NyAVC3dtMBq/YK7?=
 =?us-ascii?Q?EOPPP7aImBOahpuDkZ+osR4qBC/u8QoQy7t35gBn+asLLTGRQ0N14pNhXie+?=
 =?us-ascii?Q?mEFPxi5xefoKkKQn/8FmYkx/P1g5XrrgHj2OMMmw0TFQAmBvU3hLZzoEoVTm?=
 =?us-ascii?Q?Bl+FgHOG7x/FnnMoPDG304XRpqQFSfzKE5vM3Eh/y/UmDquUUwoHiQyWsmdi?=
 =?us-ascii?Q?+lMDGErKeqlh84SmYu4sQRDxNUQHIcWAUeKXySc4xF21gRzJc/IpZWZa5Uk9?=
 =?us-ascii?Q?DZwlbSjXatLPCrsAzi/Iot874HGVw1UTOckh9SgJsLynqHYUEwYINVu+Qm9U?=
 =?us-ascii?Q?xMVRgLQ+Y47HkwiNcCqu2TnEc3T3ue3oT18PtXD7r9XZd8u+ZBdCsZi7Uctj?=
 =?us-ascii?Q?uiCWeNiVqOpH3FyqvX/TcSTjVYp5kggeI+qgx1e6xT5fjm/byTuPhO698kzo?=
 =?us-ascii?Q?e1LmdyHObh3QobPlcR9APS1HdLtuTvQTlPNTXVpFDUB1Tynybxp4xeR0o8CH?=
 =?us-ascii?Q?41onSlrnhkQmcNGY+xEj5pChcVNjMUjPMg1iRey8Z7la2VCuj+HTVdmH+qiy?=
 =?us-ascii?Q?obeHLW8vdWw3Udl1TjMPQXtPc/fjOyq7xhGI88f6riGDxRdLu2GFX+JVIXXU?=
 =?us-ascii?Q?7zXUaMCFZnDo5s5DxOFeAYUyzS3yOvDXUzZ562itF7NOxAay/Mh6fO/Btnqn?=
 =?us-ascii?Q?z/WOxGlV3DgQ2QktSsOYBKg3T+PofR2UdG8FrOzXrGAHzY4OEuxrIZCLvEtG?=
 =?us-ascii?Q?QmdXv41JboCKg6D+E+kSvqr3wEWB7tnGK1QaLCNkH1/TV2/rTbbOcaWQXGuA?=
 =?us-ascii?Q?08VcsyJPwJ6LZnUHWV0bthck2FZD+8mIAxBfDZX1EWEWAmgeqSCx2vp3m5Xe?=
 =?us-ascii?Q?p1vbCKk6/octpzmHQ4SetkHCQP8rciAx0wbcmsZoC4VONhMZCVDsdFhvNiXZ?=
 =?us-ascii?Q?LVIyvNXxs6ajDLNQcXAahPfPe6OZESOdGmt/GxOsKnmW7B9eKbV0SI4aPgWW?=
 =?us-ascii?Q?vguooUAOGlep/DcXbn5iYp/CM3e6CxwT/ZxAZdffBeX0EpM9oa0EPg0hcnWB?=
 =?us-ascii?Q?TZx264XuL52ceLFfZQ2G/tSbi8sGWYSUT/Hqs2n8UGjD6QoO5YjSPR5/n1q7?=
 =?us-ascii?Q?nHbjA42sJICrSN9gm9dPrq8sFqTfaV/9GDPGnwpx988gGbQF0mEj6MgauNxG?=
 =?us-ascii?Q?KXyqotb8WnO3LRA22nr9gjnXTr2lRNR59ZFnoFbY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd17840a-0a12-44e3-3439-08ddb55bef65
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 09:21:01.9136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: parbW/gCL01AP8lxetyzWftKYMiwofnW/1oie0q4VQdOu2LWQqZNT5nMVAeN7Ff8FDTUUDRGXAarnKY+j1OQVqQdnpFOG2NhTfX1+9xlj9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6574
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

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
> Samala
> Sent: Wednesday, June 4, 2025 7:31 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t v4 1/5] lib/igt_sysfs: Usage of Original debug mask=
 to
> read/reset
>=20
> Original debug mask holds the mask before the test and will be
> used to reset the debug mask post test.

Patch subject and description are in my opinion strangely worded,
especially as this patch doesn't change anything else.

I think it would be better to phrase it something like this:

"
lib/igt_sysfs: Rename log_level to saved_drm_debug_mask

Rename log_level variable to properly reflect what this
variable will be used for.
"

Other than that, lgtm for this and the rest in the series, just fix that.

Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>

>=20
> v3:
> - Refactored for readability and address logical comment.
>=20
> v4:
> - Improve variable name for debug mask saving (Kunal)
>=20
> Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of
> debug log level")
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/igt_sysfs.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 2ba96ca7f..b7ca1f2b6 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -443,7 +443,7 @@ int igt_sysfs_drm_module_params_open(void)
>  	return open(path, O_RDONLY);
>  }
>=20
> -static int log_level =3D -1;
> +static int saved_drm_debug_mask =3D -1;
>=20
>  /**
>   * igt_drm_debug_level_get:
> @@ -458,8 +458,8 @@ int igt_drm_debug_level_get(int dir)
>  {
>  	char buf[20];
>=20
> -	if (log_level >=3D 0)
> -		return log_level;
> +	if (saved_drm_debug_mask >=3D 0)
> +		return saved_drm_debug_mask;
>=20
>  	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf) - 1) < 0)
>  		return -1;
> @@ -479,15 +479,15 @@ void igt_drm_debug_level_reset(void)
>  	char buf[20];
>  	int dir;
>=20
> -	if (log_level < 0)
> +	if (saved_drm_debug_mask < 0)
>  		return;
>=20
>  	dir =3D igt_sysfs_drm_module_params_open();
>  	if (dir < 0)
>  		return;
>=20
> -	igt_debug("Resetting DRM debug level to %d\n", log_level);
> -	snprintf(buf, sizeof(buf), "%d", log_level);
> +	igt_debug("Resetting DRM debug level to %d\n",
> saved_drm_debug_mask);
> +	snprintf(buf, sizeof(buf), "%d", saved_drm_debug_mask);
>  	igt_assert(igt_sysfs_set(dir, "debug", buf));
>=20
>  	close(dir);
> @@ -513,8 +513,8 @@ void igt_drm_debug_level_update(unsigned int
> new_log_level)
>  	if (dir < 0)
>  		return;
>=20
> -	log_level =3D igt_drm_debug_level_get(dir);
> -	if (log_level < 0) {
> +	saved_drm_debug_mask =3D igt_drm_debug_level_get(dir);
> +	if (saved_drm_debug_mask < 0) {
>  		close(dir);
>  		return;
>  	}
> --
> 2.34.1

