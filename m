Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1533DD4A5EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 05:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953E010E357;
	Mon, 19 Jan 2026 05:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQT+GRVK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C70A10E357
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 05:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768799701; x=1800335701;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gLeJqXyBGVR1t5A/SKTeAOAIIklU+/KcGLJlV9QzRDY=;
 b=ZQT+GRVKIrotzguXY4PIx6qPeEG23rX1UY1ye4ZgqeHASAf9b9/I15yY
 3s6HMTKFgVVTzxp8KuNkUbqzj3Y2f2Sf2OiMneKMKsl5XgA+8rxULsAoB
 AO0H/K0YByLJvGOvlglCQ/jwU8SeW3dCj35TFIrs38ie4jkQ9qBQdQB+o
 Gx1+tIpylYxq4Z/GY7Hn1dpTHdwun+6CdOu7FzjWjjRd2esS/MEiCwnWy
 26Hzss3mqTr6cQOtAM5VVqLsZB5+v+FU/x+F/fThitIzxNY5DY2ihCVrf
 1jJaUzbkqOka08qW/q5y7otx4ZMqTfYCAFhMZ11eqRfGqmNRhbQigDv9F g==;
X-CSE-ConnectionGUID: Dpj5kCmRSGamxfoyZhVmfA==
X-CSE-MsgGUID: 7MZzMID5Rx+rU7oQ/DH29w==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80643100"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="80643100"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:15:00 -0800
X-CSE-ConnectionGUID: V++cTIb6TAu8i74mcbwJrQ==
X-CSE-MsgGUID: B2B4hRfeRvyYZOR6p/Bi0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="237053469"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:15:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 21:14:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 21:14:59 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:14:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6gnWDzhbtXqY+TqKxOH7qE/gM3aGq8Ppxz+xbZ3hhIicJdEjWQBhcSr97SyLqjdfaS59u7ams0FmvOlsl29Nfin6U6ioMqpQ2BCcCjap06aCsXZUn/x8CDG99IVudBOdFtAbjhf+nY/MtaCwKTlIfJYVZK+0yHtd1Zl2QuEOinfFafNDkA+bqQ+XN+CVedTovUPrZmHnN+yCb0bsFBZx9cka+dY1bJwSNT0qkhGYqHJPyHiFzMmUS7xlEUeb/j8wIBei51MMAA4fOoZqUpaM7M1icKmKk9+ceDhQOGocqu9iq721y+Eqeg0fyaib4tciPAQnpZLBAgjN/u/OrcAoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+wI9qVXeDQOO7dYgbXjcLO184Zpn1Z0qsLHCGTuVF0=;
 b=gi0r2A3THPNswzApiDDk+M2gSYfrsnalQNRd/W0eiqP8g0DXON1RN9chDq5cMHDnAtfGvGoBuHElVPWrQzQRpsh7oGmVvmZbLCSafCaBnJNW8MbULL1KNws9mENqBGQPyDl2q0Xm5CaJer+ZkW1lAwk4UfhTHKm/8hivpDvSsgyCL2s7t2VEHJUfE+JxCepOY5FbEvie7C4vN6Vk78cxVQc0PeXFUnCyG2YRwxVFw/kVuWfL7vFPeaVfmSJRaHsrOUkE3Zev6t3csAzCtZIUie6kP9WlKFKPY4otNJD2wSM/lpqhg+zzQrVFrJmkm8UhbR1PqnCAJuZueVYHqic+VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MN0PR11MB5961.namprd11.prod.outlook.com
 (2603:10b6:208:381::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 05:14:52 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 05:14:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v6 7/8] tests/kms_writeback: Refactor
 writeback-check-output subtest
Thread-Topic: [PATCH i-g-t v6 7/8] tests/kms_writeback: Refactor
 writeback-check-output subtest
Thread-Index: AQHciP7aPq2b8lYRKUatVJFoUbiGq7VY8m1Q
Date: Mon, 19 Jan 2026 05:14:52 +0000
Message-ID: <DM3PPF208195D8DAD4CFC7201483D8E1AABE388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
 <20260119050732.110985-8-sowmiya.s@intel.com>
In-Reply-To: <20260119050732.110985-8-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MN0PR11MB5961:EE_
x-ms-office365-filtering-correlation-id: d3756614-8d17-413a-a20e-08de5719ad18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?LGroCNk9BDAZgy9wSrB3jSj6HkjpC4KyiEy6tm+Rcw1K3UBnA2RXSnJKMhOf?=
 =?us-ascii?Q?9YWeeRXstleCx4E9pQh157DHipFuA0O1nUXdqQkRLTHimJbjto6A6L2oVGUH?=
 =?us-ascii?Q?kM+yO8n+l0MgfHnYzZU8syFmrbSJEYRBHdk+WJQ5CKLryfDbijuXoiJvRfF1?=
 =?us-ascii?Q?Kelnn2P+lbkrluCahxjOp0k4up1Ow7or2NXo3kZuiDJlbn8TY2cQ236w43wg?=
 =?us-ascii?Q?I+lijD6x2J1NczeGAN/2dUPOb3qc1EDncslsnTKKmyam8ClF0+xrw6p4ZHcl?=
 =?us-ascii?Q?2ttxXZiC9Yd2YTyFw0bBpqjDRzWDGp3SsLHO4387LWd5cpy2GQZZyEFCuQYh?=
 =?us-ascii?Q?ahPZYzyKQHznEqtSphPczuC74J9wwEIrJgN0CeDcOk1k8p5r6/8XS4StbvUI?=
 =?us-ascii?Q?BC1wLE+e7U5lFmb3aFnhhshT/ur+HACZl4VIOKL2IyoBTqM6D1kRvS/DbqSB?=
 =?us-ascii?Q?oeFnAAkvCfjmNRzzfq5ZN6ECTmKb2xPzvWlHsyr0vo4cE9y8xjeWPXUVTENh?=
 =?us-ascii?Q?XSfZAquiU9V8AoSzxlVUEBt1ZIxAFmpkrAj8hboGSnjIY57tx/CBxm/VP+JT?=
 =?us-ascii?Q?UOVHB9Sa+m0pQ6pKS0WHmLvsjkqTksDowUYl/fh4XMPQYT5cCSVcCq3xPmWm?=
 =?us-ascii?Q?Yoe+7YGYIdUoqbhQVlpa4IvMEeEQqd1l47WtS1SdoqetT4Akp96ln/OgyUrP?=
 =?us-ascii?Q?8K9P3SDSRpu34utH1KEodwT8sL5KJT8CuE37SemulMf73/qKJ9ReQcNPlnln?=
 =?us-ascii?Q?t3oslVveJrsp404yw/AKrEF54u9Ed1zp8llyAYGI/yixc/46rHaqvKAkxdmx?=
 =?us-ascii?Q?ZgppKJHicYCeM7BUrFYiVHzVNoKQvHwgQ122MP4XVZW7zPVzxuRAnMQOZknR?=
 =?us-ascii?Q?C5/F2cRCg+tlM40igXUwO+irKd2ecbKo0sfs6Orxw09ZJ2jjraxxMSIcfgZ0?=
 =?us-ascii?Q?OK9tU60rPWtSIOiUuRXF1bVkdt/L0fTA+Wp/Qz12hvDZkQD6Xo7MRto3zxO4?=
 =?us-ascii?Q?B7OTpXPlzl2d4MdYG6/ms6NZKMTfbvXmpqcQdrw9B7lnqDJvTz/Ka7+xsdpQ?=
 =?us-ascii?Q?3WIha5tBJzu2quNcDOs+VHx8VSB/b2ui/M6fvbKLXTkWZn0PoKJ7y1+B4oeY?=
 =?us-ascii?Q?Ab5WSXfFEG4Mxz1mYcKgYVHtXzh2H604zQbxnzX45wDMrPCvAlEo1ilJEyW8?=
 =?us-ascii?Q?ac0nMZcG9KdJdm5uyGHh22ygP0qsZhdIHEFYWPTARF5rNIwtjCfjgNnE20cW?=
 =?us-ascii?Q?cyyle+3dFSfODFJMi53cZgYuiWbwY21swB3WktF5SkMd3gD0wqHpMuZLtOA9?=
 =?us-ascii?Q?iMQpFKtiRMpBLD8JMXin7/bW0Sh5Sozli0ezW8XMd6YlQOlhHdVvSwKeAqca?=
 =?us-ascii?Q?6ar5Cx9w+roCULX+Wy9dEFuQ0OICIq167babGmmb0dD+7WWS2T6X51Aba6U7?=
 =?us-ascii?Q?PvOWahdEG7EvrtmSruXWxiYm2DcQtsIci8DbO/Usv6YovRxeVwDEaOFrqsmi?=
 =?us-ascii?Q?W6zyIjic0gmPg0lS+8DrcULvVilS5Y0Jo3fkh2i+Zcwx9CF8NlQXooDS4UKf?=
 =?us-ascii?Q?QRCAzw2AVm2BLQC03Yk5eH5MLPFPv9LjoicN0dRYm2O2IazVjY8Knxl5rkhq?=
 =?us-ascii?Q?mCk2YPHH3RHG7EwRDutI2UI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UNA31ARHV2VxXzCYS5KeRIPWaRWVZv9DepXJDj1AGeSE+wdL5Wqr90O6njT9?=
 =?us-ascii?Q?cvik/gPKkmUWKWilVLS3MUOFoY7k94kDtbU5ybrU2I6ems+PNDqbMZYTNyBP?=
 =?us-ascii?Q?CiA9EMtzxHsyCjgoucDactZgIStRouu63OE96+wpkuzQuPwM3HPuxMb2gwGu?=
 =?us-ascii?Q?9Zo8IloNtmPxgOyc7FI9INKwcHa8/yTdYRDsVeBeKae8vFjaftbBSluJOwjc?=
 =?us-ascii?Q?nGrw0d9N9EQor0Y7cuvAXMHoEyN8ZcjM6u0hUEWIE3pK7K2RDV7lCTTT4rt0?=
 =?us-ascii?Q?R4GafH9m38mNf8nkkIE3jXdRcZE2/nfRgDdX8PTAMIE1a1abhi10ZtieyXZj?=
 =?us-ascii?Q?s0TqfnHrRkO3Nnu5zLS41KKHsOJbJ7/vxl/2Eac1CnBKAUU1IrCaYIra0G0h?=
 =?us-ascii?Q?MhFldWZyITbKIX1fGYuvzMu5kGdGCXdNf2tsxc3Qvaw18yWHq3+Bbf4IBBgj?=
 =?us-ascii?Q?Cker4f/ns3EyPvF4IQ+ECc5J+GL5CHW34eC9qfaYnxsMqZEqGzFEyUCwqi9X?=
 =?us-ascii?Q?bMWK1UN/fAgPdf56UjJjYgnHRAmHUYnIB37dJLyzMIyivkgK64HRcUnkey1Y?=
 =?us-ascii?Q?5thgduVLlFbRY/sg3i/dSen/1AHFdCFU9f2Wbr1WGkjddaVRc0JzTssM+WU9?=
 =?us-ascii?Q?Xo3DpMeZvXhcRlXB7BaQrTMP49dpoho12HCHjct7xbhLeh9PFDqAjWJFuU7E?=
 =?us-ascii?Q?oyCt04BtmbixpeDXGnEjY1uvwDz2pZK2gG9wiM6u09wiS5LdMW+HI1si3Xw5?=
 =?us-ascii?Q?s26E/Y1FXN/D4CcbdyqX6MgSW7WQFLduFlVgXv4q9lTkIdsGkal0R9920AfA?=
 =?us-ascii?Q?fNu1akGPhNAcqyEScBulNdme6lJxEBSWUyFttlMPD7Dgakh955AM7H74LVtL?=
 =?us-ascii?Q?dn9DmxGnHWk75Ul+Bnq4x6j/s+gJWXPKAL8q7mtY67+ZhDuREWG49kp/tY4h?=
 =?us-ascii?Q?egcPW1WFb1Df9mdSWo/JcWWf9jznHHT0rZkroLZIcDUTo6iZhglCyJJKSFyA?=
 =?us-ascii?Q?7GJG4EZ2Upjl/SB07umwF6OmzidBNpX1yHbamAPfm3nLsXCpptL5TMUtOFYd?=
 =?us-ascii?Q?vSpkV0bty60PRlu8SRUSOfnR2n1nJ4QfD/CoB9H0Mts0RFqB59rCaQhq3SdY?=
 =?us-ascii?Q?TxdML4W9NOh53O/ydkArLlkrWAHjwZrTBAgpgWsRtAHV+HyzcRJBJG6Ku4yL?=
 =?us-ascii?Q?JFnFrjCBruvEwGipqeyCHSR534XfH5XT2wqoMcBBr1lB07V268WF/+kon2nJ?=
 =?us-ascii?Q?i0yARveAvgg4qUWTJ2N4HhFplMTxPMMFaUhSQgKcjkxbtRh5kEhwxYX/rbQR?=
 =?us-ascii?Q?toGjWLezH//qkBYXvbWQIui5eXNN7sTY6bjVD6yeJM5jgDozf4xhbHmUB6Lj?=
 =?us-ascii?Q?lMxCcjOAjm+deWsHfeTJ/gCuctiMyGHNFOm7Awrj/XPJCavfCm1/h3j3bhyt?=
 =?us-ascii?Q?HiQ92XbBdn/muzim66ExV5Mb5ISZRX/e8IgS90IA8XMIo3jNvnJ64LYnAM2P?=
 =?us-ascii?Q?lXEx+0tgBbjxgjIWuXumpgjopwIU599va3OuMlVT53HLVczjTMdwBCVe0eGh?=
 =?us-ascii?Q?Yp5VMVKoG++TffCss8mZW/RcLwDVc6SU6GUsnhN9qqy588uGDEmjRTQLtE+T?=
 =?us-ascii?Q?izCv469BCVMtQqgedqUenuUa3sjY7xbXaJx37L2WcR+zW6vXaJ1qvWb1k4cZ?=
 =?us-ascii?Q?+/uBihfgEM8yiegXz71bV3F0zQvbDoCzHw2uOhG5J8eO/wSmsIy+8kBuq5lD?=
 =?us-ascii?Q?pyQMhuicJQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3756614-8d17-413a-a20e-08de5719ad18
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 05:14:52.2634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XMAj0Ybetg48KqugKur4GLEXq1aYccHkQCsxPs+lcXLb3PoOfCnD6GVJAv+k8le8Xm+1++GJRx/pa/dmr6qpig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
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


> Subject: [PATCH i-g-t v6 7/8] tests/kms_writeback: Refactor writeback-che=
ck-
> output subtest
>=20
> Remove individual tests for each format for the test writeback-check-outp=
ut
> and introduce dynamic subtest generation based on the formats
> supported.Framebuffer creation was now part of the subtest level based on
> the format and removed from fixture.
>=20
> v4: -create testcase for BGR8888 format only for intel
>     platforms.(Suraj)
> v5: -update the documentation for dynamic subtest
>     -update version info (Suraj)
> v6: -Remove in_fb inside subtest and reuse input_fb from
>      fixture (Suraj)
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 57 +++++++++++++++++++------------------------
>  1 file changed, 25 insertions(+), 32 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 0ed86c865..66da5603a 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -45,11 +45,10 @@
>  #include "sw_sync.h"
>=20
>  /**
> - * SUBTEST: writeback-check-output-XRGB2101010
> - * Description: Check XRGB2101010 writeback output with CRC validation
> - *
>   * SUBTEST: writeback-check-output
> - * Description: Check writeback output with CRC validation
> + * Description: Check writeback output with CRC validation.This test
> ++ *             dynamically generates subtests for each supported pixel
> ++ *             format (e.g., XBGR8888) and configuration.
>   *

Same as last fix documentation

>   * SUBTEST: writeback-fb-id
>   * Description: Validate WRITEBACK_FB_ID with valid and invalid options =
@@
> -712,7 +711,6 @@ int igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>=20
> get_default_fb_format(&display, bpc),
>  						      igt_fb_mod_to_tiling(0),
>  						      &output_fb);
> -
>  				igt_skip_on(data.dump_check ||
> data.list_modes);
>  				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
>  					      "DRM_FORMAT_%s is not
> supported\n", @@ -724,38 +722,33 @@ int igt_main_args("b:c:f:dl",
> long_options, help_str, opt_handler, NULL)
>  	}
>=20
>  	igt_describe("Check writeback output with CRC validation");
> -	igt_subtest("writeback-check-output") {
> -		igt_fb_t output_fb;
> +	igt_subtest_with_dynamic("writeback-check-output") {
> +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> +			uint32_t test_format =3D fourcc[i];
>=20
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      igt_fb_mod_to_tiling(0),
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> +			if (is_intel_device(display.drm_fd))
> +				if (!strstr(igt_format_str(test_format),
> "BGR8888"))

Join conditions with && instead of nesting

Regards,
Suraj Kandpal

> +					continue;
> +			igt_dynamic_f("writeback-check-output-%s",
> igt_format_str(test_format)) {
> +				igt_fb_t output_fb;
> +				int bpc =3D
> igt_drm_format_get_bpc(test_format);
>=20
> -		writeback_check_output(output, plane, &input_fb,
> &output_fb, DRM_FORMAT_XRGB8888);
> +				fb_id =3D igt_create_fb(display.drm_fd,
> mode.hdisplay, mode.vdisplay,
> +
> get_default_fb_format(&display, bpc),
> +						      igt_fb_mod_to_tiling(0),
> +						      &output_fb);
>=20
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +				igt_skip_on(data.dump_check ||
> data.list_modes);
> +				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> +					      "DRM_FORMAT_%s is not
> supported\n",
> +					      igt_format_str(test_format));
> +				writeback_check_output(output, plane, (bpc
> =3D=3D 8) ? &input_fb :
> +						       &input_fb_10bit,
> &output_fb, test_format);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +			}
> +		}
>  	}
>=20
> -	igt_describe("Check XRGB2101010 writeback output with CRC
> validation");
> -	igt_subtest("writeback-check-output-XRGB2101010") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      igt_fb_mod_to_tiling(0),
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_check_output(output, plane, &input_fb_10bit,
> &output_fb, DRM_FORMAT_XRGB2101010);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> -	}
>=20
>  	igt_fixture() {
>  		cleanup_writeback(&display, output);
> --
> 2.43.0

