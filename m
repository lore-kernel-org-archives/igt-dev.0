Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0535C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 17:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7237B10E1AE;
	Wed, 22 Jan 2025 17:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URG34IsF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3B210E1AE
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 17:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737565796; x=1769101796;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N669OFC9At0qNS9QjsTNNsolQ3fuylZxUsQpQo3xdeo=;
 b=URG34IsFdBcQM3XWrdEz4fC9xUyMyzuHAZomlEfREh7v7Jo9a/CQGMz8
 3k7iY7LGBOM1xtMFV/lowpIF5hGvpKt7ut1J6yYJjVK+TSN69gbtQBrxM
 tM7eB6gYiAfUd1EOaUHcCDcqUq0PG9bf8x+DHh/AhtWaFdYoNlcGHhWgj
 jLgIRcE3pJIUOmZjCLto6rScRhXIlo6RleFaF/RTgwzRqZlG/gVf0Oxks
 cGEpcI/sNmdp1cpJ6KOOFKoni751GdA0Qfxc5Z8xAXdAMnyNpShVg1N8H
 irzrAEobw9RiwC+TlizrofRLk351FNF4XCofaJ4aNFU3ABx4cdXLgNs8g Q==;
X-CSE-ConnectionGUID: 1Z70U8G3RFW1Rcpw5AJ4kA==
X-CSE-MsgGUID: 8CjbUp9iThiHnWCwOUbAYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48530076"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="48530076"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 09:09:56 -0800
X-CSE-ConnectionGUID: 8Uk/qAruQRCpF7/c6rCFGQ==
X-CSE-MsgGUID: wunLuyiyQmK99qLKw4ES2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="138055109"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 09:09:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 09:09:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 09:09:55 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 09:09:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NP/Zs0y+GZwbqhLz/iqqAOp+sbx/6xpiy4R+qoKxwaEM9iUg7BUTQnW4NMteiX2g1Ui0SQEszb4sTYCC/FX0+s+i0Pftr8eUuRdLac2rUA6ZWMErQB3DL57RcrfiXB7OrMNFwqMvwGpTy9yGeqgGWLkRApkr3L+6kLK5fBzP2hP9RoxQeVXHW/HrnqJ0qdnoKld49CIJLbZ1MlfPZ6mzodVDEe7FeU1SOkxneA24mE5SYoH7uDZUEex+62sxM3d7jS+OQjdNVbshLTZ/1G2Ov3/Po7TBm+G0tTSYosCz2AjqoCGxxNManFZ+qjE7NvLEDUIWragmwxS38xthvRjwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IL83h9UyejjY594ggXmqh8S7Jhiy08d6vtM8ncVFaN0=;
 b=tbYSwqRp09trN32T5/ej3ndBQ7yNxs864IZH7xUs84qBICP93W9RAnyDuP6t5tVMA2c46a87VOu2nANkpmpbCecRHdMXiE+yA7iOfq1URq2O0peC+1JfkVJwVxV11Bgr9SFCwEq6MwQ1UIU+C4xDh7FQ1iIL2uYVkhPthVTAFtWyBs+0PyBckJT+vfoUj7mbCBI6ptw8akpaLcJVoFfxW27SZmHFhI6UdVXMcrThaPJ8Jk27Xm2f7OZxToKf/tKmoEbsPtpqfn4EGGXoxivzXCsFXXp1rJrGi3hRq386FBc71hRjNgck5w9Uh2kbZhAoZGPhD7CbK3f0nd0r7VF2zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB8202.namprd11.prod.outlook.com (2603:10b6:8:18b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Wed, 22 Jan
 2025 17:09:52 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 17:09:52 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "stylon.wang@amd.com" <stylon.wang@amd.com>, "Rodrigo.Siqueira@amd.com"
 <Rodrigo.Siqueira@amd.com>, "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "gregory.f.germano@intel.com"
 <gregory.f.germano@intel.com>, "Taylor, Clinton A"
 <clinton.a.taylor@intel.com>, "Yu, Jianshui" <jianshui.yu@intel.com>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
Thread-Index: AQHba/flKYRPA+IScEW6+oL/GckHJbMi7rcw
Date: Wed, 22 Jan 2025 17:09:51 +0000
Message-ID: <CH0PR11MB54448F91732885E4871ECEF2E5E12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
 <20250121112944.115491-2-peter.senna@linux.intel.com>
In-Reply-To: <20250121112944.115491-2-peter.senna@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB8202:EE_
x-ms-office365-filtering-correlation-id: b215e458-e2ef-4079-9b6f-08dd3b0795c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?EqgdPuX3EHKJKaUZ3lLELKjXGNaVwJFEzM+MXCTZR0zwlSg3CoWvWTdLVkXl?=
 =?us-ascii?Q?KfDovAGwQ8ak4RXmjrGT+vsLQUMCAYmZmHsc2QLcSvoULQFfKjQwro8l8EWO?=
 =?us-ascii?Q?rkADPv9br8DZ1xzjxMprAjqP7afXYfXMetvZ/d8t/ONAWT6TUoiMAHamm6OM?=
 =?us-ascii?Q?bJ4B5/RIUIH1CT6aHg98mI6+dCx9fXfXdTb4UOcCThXKCzaXyMHeEARGJV/T?=
 =?us-ascii?Q?DhrigEI4xkDivYmpgwTr5ImvVLFIIPDYQ/TzhWoKJsRWQXoTrzuFp/y0IZZ+?=
 =?us-ascii?Q?Fq+r0xvxLFwxERpN1F8T4w4PZR+oaD3VK55h+o9I3PzZ0+1o/lXQEP9NErxG?=
 =?us-ascii?Q?yxpeX0Eq++h7i/SaOGyWd4848XZ3RoCRVrOhEr3F0y9wde8cJnAoGQ/geu44?=
 =?us-ascii?Q?nsfY078wMlXa9MGgc2PWj5ae6Idnx3WcFmt+Q87O9P9NKNUS5wopX9m+tkxf?=
 =?us-ascii?Q?KYPtV83BdoUxrlbaLNcRopa5aBHbUmazUf2W3CruZN9/d41QOBh9mAS3CwR1?=
 =?us-ascii?Q?IikyxBSqnxgjF8YOlcDsOMrMC7HgFVL44HTZ1fL668we7C+0JJ49YJtevwdC?=
 =?us-ascii?Q?f2yz7gECsaSpAkKr0xnaDGZioDef5wsbH/esZVqOlDc6lUHeG+7Q2G2kOvUa?=
 =?us-ascii?Q?vvnDlvqfKBgThFtl5CrvmFYyL722jZqDSzcG1rDo7nyV6Awb2ZwSGOPDMgNG?=
 =?us-ascii?Q?kxD8+gnj792fB/9IIuxxHMukiF4zrXNstTggbkobxoaxY7BMKS2AKmPcl5Rt?=
 =?us-ascii?Q?ETU2HKkpas2CM5ZaoQ8YMatQQwFU4+rZHKoMrlSKogfQu7DuhxhpeE5v0qR8?=
 =?us-ascii?Q?rmdDgN5jCyRzX2oIVpb5pzwoupic7+karagVoq32+rRdi3Y4lCA76w5Oulab?=
 =?us-ascii?Q?MSAgrTUphkU6G1PpKDBjaAihgwtQs9uotEH++YxyF2eQDXFNEb4OVFJBteHI?=
 =?us-ascii?Q?FSRAg9D66FHJ7++eWcJ/ujH12DsaFN8t2ZBgXxyBF4CNktMt9gBbgOrm0CiN?=
 =?us-ascii?Q?rhOhrwJFdEOEzIFfNrrCxmRp2IS5hJisGqDZLVlR9ISmc7umul6yVTriTXxm?=
 =?us-ascii?Q?UPEa9SYghOx4MQ9uQUPxlZqSD5Fx5wfJab9sLI0ue5ZjvDIBwQQbcCkF7L3b?=
 =?us-ascii?Q?Lue3OXGaDlvS9QrqKE2qei0FtwOrbnoyUapQ2strEtB6yxpdS2foR9+HaZzg?=
 =?us-ascii?Q?/4C5dELCo2/I/c6zYz+jY1VTZ45BVCS3BWnSqhNLalHvHFDMmNc3JPSIS0dd?=
 =?us-ascii?Q?+O7bYN1kGcsl/SscU/av7X0Fn3jIn3NKm6WMxtcCn35N1Qnyal+P/3PmSbjq?=
 =?us-ascii?Q?Pr83zrvLb82UZ/R+128Zjdb6wCgM/P5aN93EdZj/paQ3UuNaQ35+08H5K+Ul?=
 =?us-ascii?Q?3SIOkv44vi5d/nJuAZJzAdFwKuJYoxx8HNAX2BpOVXq+c9Drz06SxL6vYe94?=
 =?us-ascii?Q?CxLuPKtUVc/aVz7oBWLrCoWf4KQ/1aQy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rIsIg3etRiIp8PuBEeEsosMYBS4OMGVvTPxxG8yxQBnQy1mKiNOpDOn1v0X+?=
 =?us-ascii?Q?/eBuxdYbtseIjzTjpcK1aIaF2aF40QhV4Pd1aaRO30I4nII/kp1fCBG9LT6p?=
 =?us-ascii?Q?sQQv+UG5mItczQyspRrGiUKZ/Kd7f8/8NP1zUg44uuLDUbJGdO/nNLZb6Nj4?=
 =?us-ascii?Q?yI/kLxHjYmROFUyDgvA6lad6kN5wC/aieOZAUFtqc/pHwseD08SZsSEPYB92?=
 =?us-ascii?Q?eimoHE0SMxyvt3zfvPGdtjcqTsDchGJkyHyVmgBVK7CWMkYyjsEZddo+M0+P?=
 =?us-ascii?Q?NR/uLXbdcoKW8XAoSS8CuIoTM3+JrJ+j84lYVHePyxbg/vQxFBCAHUkc+qww?=
 =?us-ascii?Q?5ampcZXBV4ap2qAovF+6gmVAUPWD0G6kucz7ODPP2tQWg77zyuBGJ8CxFAfl?=
 =?us-ascii?Q?Yp4pvn7YKXnv/Kne1z1YB9amxxyIeLwP3d4u1VdleM5FyOw3Z/zqK0FtMxMa?=
 =?us-ascii?Q?cngj7ha17q2a0QoJgUE2tMCNf3b7lDBubJopw1AH+gWyVJZz1FrNSrczbmUD?=
 =?us-ascii?Q?5/qV3/Q+JbrG/whxdC9jfrd4u1NEvX9LU+lyi3M8WMo+q6uNcQivDFofq73G?=
 =?us-ascii?Q?3C8O6GJ+CaDbCSZK1nA54qWEokZwC5eC63lw4jmA2RGC4NxoiJJBSSS3ycvv?=
 =?us-ascii?Q?T/HeDqByZpKyZW4tyKo00gvAOg3wBOBsWdlL/MoQm2/Bj+fsTvkhcv1YlIMl?=
 =?us-ascii?Q?P1nlGOJfrHy+gwT7TGd2piCJbTqWlqQEgTSgSsTO3doyqz0pZv3+bpSg1ibD?=
 =?us-ascii?Q?PUzrxIzkB6l/EtOZPwkGvmp22gFFsinjZwKtsVRoEWWcHknuJ1A52OThvrNz?=
 =?us-ascii?Q?hSx+gvkWQg8qUIM4I3eESvKI+jETxmoltZuB723OdVafcR537PClZgvxVHWm?=
 =?us-ascii?Q?guxgN6O/sP+xkcqoDgO4xHDQ0dRrX+p35+lDqA4L04ocdUJX2h9EQtgNjRfa?=
 =?us-ascii?Q?CVm+6fJ+ASZapwK6xKkMmbvsaRFRgQqyM0N4RIBfvm6WBsLfoufmGuj+ZJMw?=
 =?us-ascii?Q?ZmmkhrhmH3NitJ++X5CG3N78chEyTg4CwzDMzhsuWYi/d/YNUONXfN7WMuP9?=
 =?us-ascii?Q?5OxP7g0nte5hiu1n0dJEp0KxaYACjKwVxeedwe7pvVpTFomNCEnT8t/h2wv0?=
 =?us-ascii?Q?5aY9e8KFSNrUBhRP8I43PyRiqmAl37/rbSIb/p6EGo6m4bNBHuieCwNzM9VT?=
 =?us-ascii?Q?FqKzYDdvq3rnu2LIMczdTQhipmvvuDH8mVyGxwosE+ZW8xNMf1hQ5h3jvtmR?=
 =?us-ascii?Q?lfRo5+ZlYg/33S3rUDgQdCPmvBIpaja6ttuY4F7J1cZ4AVFrnAWGLgUMxBMl?=
 =?us-ascii?Q?vTcVa0f5hyvS9j2p54PUW8bnGjJ50CzGsOWBLzQIS1yVmIXYRqUIO9usFG2H?=
 =?us-ascii?Q?v2gcFsYPa4qhqsI9kxqZgRDio8EwcV6+STstux1MJADE1D2pdTRZQ/PcvcIE?=
 =?us-ascii?Q?9Ms8Wn4uV+34PHSz+koYF1A516JtHbsuPFH77yRkDx2jsuXg9WEbTlKFul/P?=
 =?us-ascii?Q?MWSxDRzGYegOXZ+jfkbzFvyEF6zAMMd+oya/XEAdhdJd+OS4zmI6EvUPO8UW?=
 =?us-ascii?Q?nrtCXwcqgZd4jZ7peyXPv9Zxbw3L9PRXwqPQAFIW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b215e458-e2ef-4079-9b6f-08dd3b0795c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 17:09:51.9338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HEPfklt2njdWsfSMdqaTsJVSk4UbyXLdvHUDULx8jrbbiMQBpqcIP5WzNYf4LHKCQe9xnz8QLKezxO25xWsDM2715mjOnJuFtXyT4XBuxz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8202
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

I left some notes below, though there are only two required changes:
1. Move fclose in igt_kmemleak_found_leaks to after the conditional lseek t=
o
    avoid undefined behavior.
2. Pass igt_kmemleak_sync as a function variable to igt_kmemleak instead
    of keeping it stored as a global variable initialized during igt_kmemel=
ak_init.
Once those are fixed:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

-----Original Message-----
From: Peter Senna Tschudin <peter.senna@linux.intel.com>=20
Sent: Tuesday, January 21, 2025 3:30 AM
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>; stylon.wang@amd.com=
; Rodrigo.Siqueira@amd.com; Gandi, Ramadevi <ramadevi.gandi@intel.com>; Kno=
p, Ryszard <ryszard.knop@intel.com>; Lattannavar, Sameer <sameer.lattannava=
r@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Saarinen, Jani <=
jani.saarinen@intel.com>; Piecielska, Katarzyna <katarzyna.piecielska@intel=
.com>; Roper, Matthew D <matthew.d.roper@intel.com>; gregory.f.germano@inte=
l.com; Taylor, Clinton A <clinton.a.taylor@intel.com>; Yu, Jianshui <jiansh=
ui.yu@intel.com>; Vivekanandan, Balasubramani <balasubramani.vivekanandan@i=
ntel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kmemleak: library to interact with kmeml=
eak
>=20
> Adds a simple library for interacting with kmemleak and add
> unit testing for the library. There are two modes intended to
> integrate with igt_runner:
> - once: collect kmemleaks after all test completed
> - each: collect kmemleaks after eachb test completes
>=20
> To use the library include "igt_kmemleak.h", call
> igt_kmemleak_init(NULL) to check if kmemleak is enabled and finally
> call igt_kmemleak() to collect kmemleaks. igt_kmemleak() expect the
> following arguments:
>   - const char *last_test: Name of the last lest or NULL
>   - int resdirfd: file descriptor of the results directory
>   - bool kmemleak_each: Are we scanning once or scanning after
>     each test?
>=20
> CC: stylon.wang@amd.com
> CC: Rodrigo.Siqueira@amd.com>
> CC: ramadevi.gandi@intel.com
> CC: ryszard.knop@intel.com
> CC: sameer.lattannavar@intel.com
> CC: lucas.demarchi@intel.com
> CC: jani.saarinen@intel.com
> CC: katarzyna.piecielska@intel.com
> CC: matthew.d.roper@intel.com
> CC: gregory.f.germano@intel.com
> CC: clinton.a.taylor@intel.com
> CC: jianshui.yu@intel.com
> CC: balasubramani.vivekanandan@intel.com
> CC: jonathan.cavitt@intel.com
>=20
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  lib/igt_kmemleak.c       | 268 +++++++++++++++++++++++++++++++++++++++
>  lib/igt_kmemleak.h       |  15 +++
>  lib/meson.build          |   1 +
>  lib/tests/igt_kmemleak.c | 259 +++++++++++++++++++++++++++++++++++++
>  lib/tests/meson.build    |   1 +
>  5 files changed, 544 insertions(+)
>  create mode 100644 lib/igt_kmemleak.c
>  create mode 100644 lib/igt_kmemleak.h
>  create mode 100644 lib/tests/igt_kmemleak.c
>=20
> diff --git a/lib/igt_kmemleak.c b/lib/igt_kmemleak.c
> new file mode 100644
> index 000000000..ff9543b58
> --- /dev/null
> +++ b/lib/igt_kmemleak.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (c) 2024 Intel Corporation
> + */
> +
> +#include <stdio.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <fcntl.h>
> +#include <errno.h>
> +
> +#include "igt_core.h"
> +#include "igt_kmemleak.h"
> +
> +/* We can change the path for unit testing, see igt_kmemleak_init() */
> +static char igt_kmemleak_file[256] =3D "/sys/kernel/debug/kmemleak";
> +static bool igt_kmemleak_sync;

This variable (igt_kmemleak_sync) seems to only be used in
igt_kmemleak_append_to.  Does it need to be a global variable?

I think we could pass the sync value to igt_kmemleak instead of
igt_kmemleak_init, and from there we'd pass the value directly to
igt_kmemleak_append_to.

> +
> +#define MAX_WRITE_RETRIES 5
> +/**
> + * igt_kmemleak_write - Writes the buffer to the file descriptor retryin=
g when
> + * possible.
> + * @fd: The file descriptor to write to.
> + * @buf: Pointer to the data to write.
> + * @count: Total number of bytes to write.
> + *
> + * Returns the total number of bytes written on success, or -1 on failur=
e.
> + */
> +static ssize_t igt_kmemleak_write(int fd, const void *buf, size_t count)
> +{
> +	const char *ptr =3D buf;
> +	size_t remaining =3D count;
> +	ssize_t written;
> +	int retries =3D 0;
> +
> +	while (remaining > 0) {
> +		written =3D write(fd, ptr, remaining);
> +		if (written > 0) {

NIT:
Debatably, this should be "if (written !=3D -1)", though adding and subtrac=
ting
zero from these pointers/values isn't the most helpful operation, so it's o=
kay
to skip the operation in that case.

I've also read that some older versions of IEEE standard use a return value=
 of
0 as their error value, though perhaps that's a bit out of scope here.

There's also an argument to be made that a return value of 0 should
increment the "retries" value.  However, I'll leave that up to your
discretion.

> +			ptr +=3D written;
> +			remaining -=3D written;
> +		} else if (written =3D=3D -1) {
> +			if (errno =3D=3D EINTR || errno =3D=3D EAGAIN) {
> +				/* Retry for recoverable errors */
> +				if (++retries > MAX_WRITE_RETRIES) {
> +					igt_warn("igt_write: Exceeded retry limit\n");
> +					return -1;
> +				}
> +				continue;
> +			} else {
> +				/* Log unrecoverable error */
> +				igt_warn("igt_write: unrecoverable write error");
> +				return -1;
> +			}
> +		}
> +	}
> +	return count;

NIT:
This function only has two return values: count and -1.
Maybe we could return a Boolean here instead?

> +}
> +
> +/**
> + * igt_kmemeak_cmd:
> + * @cmd: command to send to kmemleak
> + *
> + * Send a command to kmemleak.
> + *
> + * Returns: true if sending the command was successful, false otherwise.
> + */
> +static bool igt_kmemleak_cmd(const char *cmd)
> +{
> +	int fp;
> +	size_t wlen;
> +	int cmdlen =3D strlen(cmd);
> +
> +	fp =3D open(igt_kmemleak_file, O_RDWR);
> +	if (!fp)
> +		return false;
> +
> +	wlen =3D igt_kmemleak_write(fp, cmd, cmdlen);
> +	close(fp);
> +
> +	return wlen =3D=3D cmdlen;
> +}
> +
> +/**
> + * igt_kmemeak_clear:
> + *
> + * Trigger an immediate clear on kmemleak.
> + *
> + * Returns: true if sending the command to clear was successful, false
> + * otherwise.
> + */
> +static bool igt_kmemleak_clear(void)
> +{
> +	return igt_kmemleak_cmd("clear");
> +}
> +
> +/**
> + * igt_kmemeak_found_leaks:
> + *
> + * Check if kmemleak found any leaks by trying to read one byte from the
> + * kmemleak file.
> + *
> + * Returns: true if kmemleak found any leaks, false otherwise.
> + */
> +static bool igt_kmemleak_found_leaks(void)
> +{
> +	FILE *fp;
> +	char buf[1];
> +	size_t rlen;
> +
> +	fp =3D fopen(igt_kmemleak_file, "r");
> +	if (!fp)
> +		return false;
> +
> +	rlen =3D fread(buf, 1, 1, fp);
> +	fclose(fp);
> +
> +	if (rlen =3D=3D 1)
> +		lseek(fileno(fp), 0, SEEK_SET);

I don't think we should be calling fileno on a closed file stream, as I'm
fairly certain the behavior there is undefined.  Please perform the above
fclose after this 'if' block has been completed:
"""
	if (rlen =3D=3D 1)
		lseek(fileno(fp), 0, SEEK_SET);

	fclose(fp);
"""

> +
> +	return rlen =3D=3D 1;
> +}
> +
> +/**
> + * igt_kmemeak_scan:
> + *
> + * Trigger an immediate scan on kmemleak.
> + *
> + * Returns: true if leaks are found. False on failure and when no leaks =
are
> + * found.
> + */
> +static bool igt_kmemleak_scan(void)
> +{
> +	if (!igt_kmemleak_cmd("scan"))
> +		return false;
> +
> +	/* kmemleak documentation states that "the memory scanning is only
> +	 * performed when the /sys/kernel/debug/kmemleak file is read." Read
> +	 * a byte to trigger the scan now.
> +	 */
> +	return igt_kmemleak_found_leaks();
> +}
> +
> +/**
> + * igt_kmemleak_append_to:
> + * @last_test: last test name to append to the file
> + * @resdirfd: file descriptor of the results directory
> + * @kmemleak_each: Are we scanning once or scanning after each test?
> + *
> + * Append the kmemleak file to the result file adding a header indicatin=
g if
> + * the leaks are for all tests or for a single one.
> + *
> + * Returns: true if appending to the file was successful, false otherwis=
e.
> + */
> +static bool igt_kmemleak_append_to(const char *last_test, int resdirfd,
> +				   bool kmemleak_each)
> +{
> +	const char *before =3D "kmemleaks found before running any test\n\n";
> +	const char *once =3D "kmemleaks found after running all tests\n";
> +	int kmemleakfd, resfilefd;
> +	char buf[4096];
> +	size_t rlen;
> +
> +	kmemleakfd =3D open(igt_kmemleak_file, O_RDONLY);
> +	if (kmemleakfd < 0)
> +		return false;
> +
> +	/* Seek back to first byte */
> +	lseek(kmemleakfd, 0, SEEK_SET);
> +
> +	/* Open text file to append */
> +	resfilefd =3D openat(resdirfd, KMEMLEAKRESFILENAME,
> +			   O_RDWR | O_CREAT | O_APPEND, 0666);
> +	if (!resfilefd) {
> +		close(kmemleakfd);
> +		return false;
> +	}
> +
> +	/* This is the header added before the content of the kmemleak file */
> +	if (kmemleak_each)

NIT:
I think it would be better style to use brackets during this if statement.

> +		if (!last_test)
> +			igt_kmemleak_write(resfilefd, before, strlen(before));
> +		else {
> +			/* Write \n\n last_test \n to buf */
> +			snprintf(buf, sizeof(buf),
> +				 "\n\nkmemleaks found after running %s:\n",
> +				 last_test);
> +
> +			igt_kmemleak_write(resfilefd, buf, strlen(buf));
> +			memset(buf, 0, sizeof(buf));
> +		}
> +	else
> +		igt_kmemleak_write(resfilefd, once, strlen(once));
> +
> +	if (igt_kmemleak_sync)
> +		fsync(resfilefd);
> +
> +	while ((rlen =3D read(kmemleakfd, buf, sizeof(buf))) > 0) {
> +		if (igt_kmemleak_write(resfilefd, buf, rlen) !=3D rlen) {
> +			close(resfilefd);
> +			close(kmemleakfd);
> +			return false;
> +		}
> +		if (igt_kmemleak_sync)
> +			fsync(resfilefd);
> +	}
> +
> +	close(resfilefd);
> +	close(kmemleakfd);
> +
> +	return true;
> +}
> +
> +/**
> + * igt_kmemeak_init:
> + * @unit_test_kmemleak_file: path to kmemleak file for unit testing
> + * @sync: sync the kmemleak file often
> + *
> + * Check if kmemleak is enabled in the kernel, if debugfs is mounted and
> + * if kmemleak file is present and readable. Also sets the igt_kmemleak_=
sync.
> + *
> + * Returns: true if kmemleak is enabled, false otherwise.
> + */
> +bool igt_kmemleak_init(const char *unit_test_kmemleak_file, bool sync)
> +{
> +	FILE *fp;
> +
> +	igt_kmemleak_sync =3D sync;
> +
> +	if (unit_test_kmemleak_file)
> +		snprintf(igt_kmemleak_file,
> +			 sizeof(igt_kmemleak_file),
> +			 "%s",
> +			 unit_test_kmemleak_file);
> +
> +	fp =3D fopen(igt_kmemleak_file, "r");
> +	if (!fp)
> +		return false;
> +
> +	fclose(fp);
> +
> +	return true;
> +}
> +
> +/**
> + * igt_kmemleak:
> + * @last_test: last test name to append to the file
> + * @resdirfd: file descriptor of the results directory
> + * @kmemleak_each: Are we scanning once or scanning after each test?
> + *
> + * This is the main function that should be called when integrating igt_=
kmemleak
> + * into igt_runner or elsewhere. There are two flows:
> + *  - run once: runs only once after all tests are completed
> + *  - run for each test: runs after every test
> + *
> + * Returns: true on success, false otherwise.
> + */
> +bool igt_kmemleak(const char *last_test, int resdirfd, bool kmemleak_eac=
h)

NIT:
Ideally, we'd want to get rid of the global igt_kmemleak_sync variable and =
add
it as an option here.  This is partially what that would look like:

"""
static bool igt_kmemleak_append_to(const char *last_test, int resdirfd,
				   bool kmemleak_each, bool igt_kmemleak_sync)
...
bool igt_kmemleak(const char *last_test, int resdirfd,
		bool kmemleak_each, bool sync)
{
	/* Scan to collect results */
	if (igt_kmemleak_scan())
		if (!igt_kmemleak_append_to(last_test, resdirfd,
					kmemleak_each, sync))
			return false;

	if (kmemleak_each)
		igt_kmemleak_clear();

	return true;
}
"""

However, that could cause some clutter here in the
arguments list.  We might want to consider unifying kmemleak_each and
igt_kmemleak_sync under a series of flags.  Say:

"""
#define KMEMLEAK_EACH	(1 << 0)
#define KMEMLEAK_SYNC	(1 << 1)
...
static bool igt_kmemleak_append_to(const char *last_test, int resdirfd, int=
 flags)
{
...
	/* This is the header added before the content of the kmemleak file */
	if (flags & KMEMLEAK_EACH) {
		if (!last_test)
...
	}

	if (flags & KMEMLEAK_SYNC)
		fsync(resfilefd);
...
			return false;
		}
		if (flags & KMEMLEAK_SYNC)
			fsync(resfilefd);
...
bool igt_kmemleak(const char *last_test, int resdirfd, int flags)
{
	/* Scan to collect results */
	if (igt_kmemleak_scan())
		if (!igt_kmemleak_append_to(last_test, resdir, flags))
			return false;

	if (flags & KMEMLEAK_EACH)
		igt_kmemleak_clear();

	return true;
}
"""

Though honestly, I think just adding an extra argument wouldn't be
too bad.

> +{
> +	/* Scan to collect results */
> +	if (igt_kmemleak_scan())

NIT:
Should this function also fail if igt_kmemleak_scan fails?  AFAICT,
igt_kmemleak_scan fails in one of two cases:

1. Error when sending command.  This should probably result in a failure
because an error has occurred.
2. No leaks found.  Assuming we're expecting to find leaks, this should
probably also constitute a failure.

Though in the case where only one of the two above causes issues, maybe
we should add return values to igt_kmemleak_scan?  Perhaps 0 on success,
-EBUSY for a write failure, and -EIO if no leaks are found?  I'm just choos=
ing
some arbitrary error values here; these aren't set in stone.

> +		if (!igt_kmemleak_append_to(last_test, resdirfd, kmemleak_each))
> +			return false;
> +
> +	if (kmemleak_each)
> +		igt_kmemleak_clear();
> +
> +	return true;
> +}
> diff --git a/lib/igt_kmemleak.h b/lib/igt_kmemleak.h
> new file mode 100644
> index 000000000..a3c142827
> --- /dev/null
> +++ b/lib/igt_kmemleak.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright (c) 2024 Intel Corporation
> + */
> +
> +#ifndef IGT_KMEMLEAK_H
> +#define IGT_KMEMLEAK_H
> +
> +#include <stdbool.h>
> +
> +bool igt_kmemleak_init(const char *unit_test_kmemleak_file, bool sync);
> +bool igt_kmemleak(const char *last_test, int resdirfd, bool kmemleak_eac=
h);
> +
> +#define KMEMLEAKRESFILENAME "kmemleak.txt"
> +
> +#endif /* IGT_KMEMLEAK_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 9fffdd3c6..7959dcacb 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -97,6 +97,7 @@ lib_sources =3D [
>  	'igt_dummyload.c',
>  	'igt_store.c',
>  	'uwildmat/uwildmat.c',
> +	'igt_kmemleak.c',
>  	'igt_kmod.c',
>  	'igt_ktap.c',
>  	'igt_panfrost.c',
> diff --git a/lib/tests/igt_kmemleak.c b/lib/tests/igt_kmemleak.c
> new file mode 100644
> index 000000000..717ba2852
> --- /dev/null
> +++ b/lib/tests/igt_kmemleak.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (c) 2024 Intel Corporation
> + */
> +
> +#include <ctype.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <zlib.h>
> +
> +#include "igt.h"
> +#include "igt_kmemleak.h"
> +
> +const char *kmemleak_file_example =3D
> +"unreferenced object 0xffff888102a2e638 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   00 00 00 00 00 00 00 00 0d 01 a2 00 00 00 00 00  ................\n"
> +"   f0 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> +" backtrace (crc 2df71a7e):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2ed18 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   38 e6 a2 02 81 88 ff ff 0d 11 2d 00 00 00 00 00  8.........-.....\n"
> +"   f2 7c 03 00 00 c9 ff ff 58 ea a2 02 81 88 ff ff  .|......X.......\n"
> +" backtrace (crc ec2a8bdc):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2ea58 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   38 e6 a2 02 81 88 ff ff 0d 01 a0 00 00 00 00 00  8...............\n"
> +"   f6 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> +" backtrace (crc f911c0d1):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e428 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   58 ea a2 02 81 88 ff ff 0d 01 35 00 00 00 00 00  X.........5.....\n"
> +"   fc 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> +" backtrace (crc cb8aaffd):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e008 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   28 e4 a2 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  (.........-.....\n"
> +"   fc 7c 03 00 00 c9 ff ff c8 e2 a2 02 81 88 ff ff  .|..............\n"
> +" backtrace (crc 7f883e78):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2b9e5>] acpi_ps_get_next_namepath+0x1f5/0x390\n"
> +"   [<ffffffff81c2cc15>] acpi_ps_parse_loop+0x4a5/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e2c8 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   28 e4 a2 02 81 88 ff ff 0d 01 73 00 00 00 00 00  (.........s.....\n"
> +"   00 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> +" backtrace (crc 338c016):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e378 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   c8 e2 a2 02 81 88 ff ff 0d 01 0d 00 00 00 00 00  ................\n"
> +"   01 7d 03 00 00 c9 ff ff 98 e7 a2 02 81 88 ff ff  .}..............\n"
> +" backtrace (crc 665fb8a7):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e798 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   7c8 e2 a2 02 81 88 ff ff 0d 01 98 00 00 00 00 00  ................\n=
"
> +"   1b 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> +" backtrace (crc b7a23a1c):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e0b8 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   98 e7 a2 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  ..........-.....\n"
> +"   1c 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> +" backtrace (crc 14d67a9c):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170\n";
> +
> +static const char *igt_kmemleak_unit_testing_resdir =3D "/tmp";
> +
> +igt_main
> +{
> +	int resdirfd =3D 0;
> +
> +	igt_subtest_group {
> +		igt_subtest("test_igt_kmemleak_init") {
> +			char unit_testing_kmemleak_filepath[256] =3D "/tmp/igt_kmemleak_test_=
XXXXXX";
> +			int written_bytes;
> +			bool res;
> +			int fd;
> +
> +			fd =3D mkstemp(unit_testing_kmemleak_filepath);
> +			igt_assert(fd >=3D 0);
> +
> +			written_bytes =3D write(fd, kmemleak_file_example,
> +					strlen(kmemleak_file_example));
> +			igt_assert_eq(written_bytes, strlen(kmemleak_file_example));
> +
> +			close(fd);
> +
> +			res =3D igt_kmemleak_init(unit_testing_kmemleak_filepath, true);
> +			igt_assert(res);

NIT:
We can probably just do a direct assessment of the return value from
igt_kmemleak_init instead of storing the result in an intermediary:
"""
			igt_assert(igt_kmemleak_init(unit_testing_kmemleak_filepath, true));
"""

> +		}
> +		igt_fixture
> +			igt_assert(resdirfd =3D open(igt_kmemleak_unit_testing_resdir,
> +						   O_DIRECTORY | O_RDONLY));
> +
> +		igt_subtest("test_igt_kmemleak_once")
> +			igt_assert(igt_kmemleak(NULL, resdirfd, false));
> +
> +		igt_fixture {
> +			/* Delete the result file */
> +			unlinkat(resdirfd, KMEMLEAKRESFILENAME, 0);
> +		}
> +		igt_subtest("test_igt_kmemleak_each") {
> +			igt_assert(igt_kmemleak("test_name_1", resdirfd, true));
> +			igt_assert(igt_kmemleak("test_name_2", resdirfd, true));
> +			igt_assert(igt_kmemleak("test_name_3", resdirfd, true));

I'm suspecting the test_igt_kmemleak_once and test_igt_kmemleak_each
subtests are relying on igt_kmemleak_init having run prior, if only because
we set igt_kmemleak_sync during initialization.  So we either need to run
igt_kmemleak_init as a part of the fixture, or start passing the sync
parameter to igt_kmemleak instead.
-Jonathan Cavitt

> +		}
> +		igt_fixture {
> +			close(resdirfd);
> +		}
> +	}
> +}
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index 1ce19f63c..5c42408d5 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -16,6 +16,7 @@ lib_tests =3D [
>          'igt_ktap_parser',
>  	'igt_list_only',
>  	'igt_invalid_subtest_name',
> +	'igt_kmemleak',
>  	'igt_nesting',
>  	'igt_no_exit',
>  	'igt_runnercomms_packets',
> --=20
> 2.34.1
>=20
>=20
