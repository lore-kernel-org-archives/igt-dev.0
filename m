Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5F4D2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 03:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E8A10E0A8;
	Tue, 20 Jan 2026 03:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbMB6tL7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C59F10E0A8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 03:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768879815; x=1800415815;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cuQjpZD1NY2feXkIsaYJcs8s2OgAOLO4XY5IThzxrWA=;
 b=gbMB6tL7pJ2667sS9BTU34djVAuq3r5EW+89WqFbk36dySpz/u0Qt/h0
 MW62pG9hKit9lF5YqC+r9RVAnoLvyHHVgJBdOnSaPwjyDebzrpTeLFwXj
 MCK+j4/s0YqzGn7PkjhghYj99j+GBWZAvyuIM63kY3vxFlViWUQShtsiz
 MCF+DmSJkQIWGvTIkuUfDpXr38MxTnVQbISbayaB239JXXbk4s+qNa8rY
 NjgbsAG0RmM/Ek+0PBuw95U1MG9oxywNp6KKwbVAicntxwHA+2el/A9KC
 fXMRJfIzDJMM838TeqPbIfKR0OgWvtnrJ/pml+6wXldLBSFpBdp1XEYfr g==;
X-CSE-ConnectionGUID: VBzCBOKpQyCHji4Nx8oUtA==
X-CSE-MsgGUID: fLmaEkHEQ7Cf1qsU1I1xHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69981036"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="69981036"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:30:14 -0800
X-CSE-ConnectionGUID: GucA0QyBQQOi8utT2IQ1tg==
X-CSE-MsgGUID: WEJKT75jQJiOR5mgfLFKLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="237268838"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:30:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:30:13 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 19:30:13 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:30:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCvj+xQ7t8Jj87EWhaDP6sOay0ak6o2R8b9j0uk1uahK/m5joOrXV1vR9MyuZ6SvQ7f4mGNjPx/UTTy88bbY0hA7+F+V6mTr6mdz3NhdOzXzCBrgE9nfpUv6GghwC7ts3VP3zMwZAp090/O9O2yw2dPAl8A5wYkc4HkxKtKo/4ZjMlLOgX0XS3abL75gEt/tcf57pMLzSWrooCg4mFiGdeYkraGgBHvbn/DvG2OPXhgUPoXnPCr/4TWKqttYJtMNg+o/3YhDJHCdyHY2n5g5BV8mtwfXebsFUEsywmZdKUL1bl1SQiH+7VgnAUVM2lAxv81SQlswluAgsImXuxgX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1ihGPLPN6RTaX63js75ROn02zzZgZhNSTlqQ/omho4=;
 b=yM5rPZw1sJt8Ucmrrg94SO2jNaLfk0GE0TQatWxhuNdSQ42AtMohlUdW2yb4lmv63MblRhE6YcMhOCOQEysuqSxNWh+0g15aYDlLfe+pu9iFwH61D7V02xhsPcHeOEe75bWB2K8b7HPxFAh5yoDDnvSYNw6ut0Ah4+mKpltb7hjmYm//n9vfNpqkY/tPGGZbNJcPYpmUYTyD4xHv2MFybQkZydE7kp41DDUaTF1aRy3UaXnmnGxI5DJvo2AAlkV4O/HXk4IdvxUoKfDuFjInul4+m++G3FN2wszqKxwFnSV9DRawBdaCRUNxFKO1wwUk+rBFY093BxMNTinZJt0RZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB8057.namprd11.prod.outlook.com
 (2603:10b6:510:24c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:30:11 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:30:11 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v6 06/10] tools/intel_hdcp: Display HDCP details for
 connectors.
Thread-Topic: [PATCH i-g-t v6 06/10] tools/intel_hdcp: Display HDCP details
 for connectors.
Thread-Index: AQHciUF+khV2FDZ0Z0i1HM9VxFj9zbVaZzzQ
Date: Tue, 20 Jan 2026 03:30:11 +0000
Message-ID: <DM3PPF208195D8D30FC5FF1355CECC1D0F9E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
 <20260119123142.504623-7-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260119123142.504623-7-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB8057:EE_
x-ms-office365-filtering-correlation-id: b8b3865b-88fa-4a4b-59e9-08de57d437a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ZxTlq+ncfvddeqsHuQnBXFOMo0cxaoHnMNvMKNSIrmBW/+vpgHslO/uymadx?=
 =?us-ascii?Q?Knq9i8lEkuHWnh6E3rA8B0lz6KAodfmgaJvcHZppaxFJL6oFlfyf+CU4/feL?=
 =?us-ascii?Q?9clHt2AeWIcBE739kewSC9WK16ZNFB6Ulqhd9xs5dwZy3hQwm78GkKgP6PTD?=
 =?us-ascii?Q?29CsM0RV6VWsO0BjRH67Q26H3/JK0rCd4HYe6dASRCK+fE14eVXFWx+63rkr?=
 =?us-ascii?Q?Iu6EcVjF2yrO1tSXCVuPzMwy82AwLZVHKcKhdBtNBnySM/lrszbNhV9hqKhF?=
 =?us-ascii?Q?UGqOhPs3pRDtFB+CI+9n28dm/MxijkSnr0SXdPEHcpXNDSx5MTs8qjWrg3zB?=
 =?us-ascii?Q?AJc8VxfXJxjbsM1pHBHgM76Oc1PARNa6xluSQ6SVu1LF1TRyq2Lo0S0AkAKc?=
 =?us-ascii?Q?9b7G1hQdtegzpeuwMwwFNpFZ8PFAFlYAzBk+EMq28zy1aCsadSPRrXeTgwMZ?=
 =?us-ascii?Q?rIDI6IMQTslecvOFk1JxFGgPsWjXjT1FyqPGoUkOqZH2wULzlGRigtuuzhT8?=
 =?us-ascii?Q?wiadie3QcPUzXcFjclXM8jMpn+bfuGZ0O66M3ZMHRXGbnuHD5kX4aMegAwtL?=
 =?us-ascii?Q?E6Y95Nbfa4FpTcFiFV3U4qi4ArbxMMfpPbOFgjRZJSxpS9Avn/GnKP3I3R1S?=
 =?us-ascii?Q?rabyZvYbO0d4Jr+v3vCS8DbcaD5natd6mOBtoiHXPsMKd1F1DHlWkWXCfOBK?=
 =?us-ascii?Q?pZgkRJO3oKh0DuZhIz+J+QDu77yARS4/ZENy3IqQgjwXdVRt40Duy6M5YMoV?=
 =?us-ascii?Q?wWnUOSrRbNQqyjQjXga0Q4z1aWE2xw9myx2BCyap0Vy4DE2c0LA3c7z9e4XM?=
 =?us-ascii?Q?NvfgOM7B3NKF3ipJ7Lz4bR4+qKr9dtMzZUC8gSBCYrumlWPwvP7LJIYSsrZn?=
 =?us-ascii?Q?Sh7nMqw4G9rrbu/mbbKc0IjkB8dV6jqb7ACChofU88iy07aQbJsz0EuB83tj?=
 =?us-ascii?Q?p3lHTm8Fg/i5Ezz6llEDdL+1XVCGN9O3fUT1Qu757SQP3PDlZRPDYyyVm5Xc?=
 =?us-ascii?Q?ausvWIAa32AcenYtXv9czHJYtyNnmhW+/4GPlFKZZ42+U2ghCc00O/QrV125?=
 =?us-ascii?Q?VdwV3l5Kcf75gDjohc8diphyXavY8z9q84HhEFc4/QvRe8P2je/mPabt0ML+?=
 =?us-ascii?Q?MZ906doQrKsrr6BhkdIlNyJM5jjwwkXcbFPrnyqHxsSHxzDi5oqhAjlxbwSF?=
 =?us-ascii?Q?FcGSYyU28pmFct8WjiM30+MP4+lSCKO27w2pyRSkn1ZtODJPir2cG6j7rFpe?=
 =?us-ascii?Q?j9fXQKnc8D5ysp+NTHfe5DhwLdkUtVGqa5WYC0bNisvOesTmOTgN6e9paVUC?=
 =?us-ascii?Q?NUSA3NRek6NCFLdlnYJ2w8Wqb8ARVSxsBXC+nt+DlmpJOWnzjnJ6Zt8hXJ/J?=
 =?us-ascii?Q?s8hoSP3RBRz+D7BvGZlaxm7vjydQ5ZvGTjuqmREOmL3RnlNfueHX82i9iw41?=
 =?us-ascii?Q?ESdxTIo4FIQZWR5sqT1JEi5kxGIHVJke2N4/iRdN348Y40X8vPtNNgT/0vOZ?=
 =?us-ascii?Q?TeHYwtUdzpUBKvuswkrLgvn8HiwItiyXj/UtmSYmKJ1apedJ4P/O1eNFs7tl?=
 =?us-ascii?Q?jVGZz9dCZzS3TVgAWlBZIthF9yuXlaZoCvu2IWbPvq9upc9SyWj82TtxNtBx?=
 =?us-ascii?Q?+SWTdLdV+ZoYDturFozrGe8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rCCAiLJmJyZ7yHSTecCNSGuRjEuERw6QmqXhJSmb47qBkf2ZqGGHnlZbDZNO?=
 =?us-ascii?Q?XwUoPdX+uVW3N1MgYIrXvlJ9CN0Y60Ol8GeHu1kSRgZeCSPXimtc1gSK2eFt?=
 =?us-ascii?Q?1Tvb6kjjjaj7JJMlU9XX9BlV3bQ4Ywo8glsURXDGMOTaTSf1ZD6F+euoSio3?=
 =?us-ascii?Q?xJfZTlro8aGwYv/HW94rQfzrvokerHikQs078W2rT8/8hI1BC1ArFBUbROxk?=
 =?us-ascii?Q?Li6NQUnyQZHgiX6a1AcPrLXv3emopqLpuKEQeNTZwqOTLS6kRLvw1nxlco+n?=
 =?us-ascii?Q?BAkX3VjCcApEvzvMvXV++s8saUQ/AuFG6usLAOywO+C+6pANeJvnyAvSiFra?=
 =?us-ascii?Q?A58+8usPEJ1x0hdTW5XXfHEXdH2GiggFepCeiMKj6Mn3NIx7ovXkKNbKibRT?=
 =?us-ascii?Q?Khso+WYJe+vIJj2jQ/xQDE5MDmGiY36kBZCtkgtNFxFSn+e2earhTrEg3aI8?=
 =?us-ascii?Q?dlvob1UPGBSVRlkkFwm9p6F3lIblELEh9kok4VnNpOFZQT2usUc/B5tMcYFa?=
 =?us-ascii?Q?st9TkNcwBpS759tvGI6q7qIMVBTyZ0BoDkbeRCPB6ciQq//juKcGXdDgXoC6?=
 =?us-ascii?Q?Qd3eatpyo4KysC7zmw8YaOhxmy+qHDQARgBPKoQgjMJYcbcRyjf+tRhYJnjY?=
 =?us-ascii?Q?45jyMO5dMi/wRfoz42/gpStzU9+AOt1d/S2jXJYcQuUEYI2FxYDvShVThRbt?=
 =?us-ascii?Q?ZId2tnFcfrlDffbUOB3pCXDw3tbTiYimJUGckBANOsxqAj5fkKJWON5xuioi?=
 =?us-ascii?Q?hcYmM4fNQFBdqI/Xnbz+hspWupClvQ5glDxIKAorY6/Y2t2r8jqc72JOaxOB?=
 =?us-ascii?Q?I7Nl9ujkPyFXAgZSlohnYsf5KHH8LBIYGnXPVC56ezMFs9oHwPPHzKGR9Nkf?=
 =?us-ascii?Q?JTNArpKIxkTxDEOOEY/resdt6L+iGyFjKO+e/NWb8avmMBjg4tKXj7WZ5wOb?=
 =?us-ascii?Q?sV5x/WkqCor5LOYuY2UVEcqxdKwIxd6dF7yn1x2QM1wj9a36nfe7WuqAXTFN?=
 =?us-ascii?Q?AIYTVeWzFUNuRXar4mRkQFISzkjbYtECiU/B5TQXdYEjf7ytYGjlzfa/2DGy?=
 =?us-ascii?Q?imtsk5MBh0imEFz+z2cK3W92OSowwfRobxYMF2kSEOF/Efr88bqkUIXHQNAm?=
 =?us-ascii?Q?6YwHkFXSQfAHQ5c6jPQo+fqjcW6K8jdumkaQLajT7CQ0GzUm/yF5x2J4x+CV?=
 =?us-ascii?Q?ybM0hXdkQV/ceq8wy3qo9l2JRm0D1UjezrCnlQumN56I/+i03zNZx3nd6qS0?=
 =?us-ascii?Q?HkrDiTQOjfKijVQ3N5RIR5qmfJgzvXm1ygHIyq4XTl0OvP/g4NhpJBe8zVPk?=
 =?us-ascii?Q?vL74hN5GY5rKDnLA9e7DLB1bGej/wQlws+S7mPVoOxE6TkFhjme4JAFxcNBS?=
 =?us-ascii?Q?tYQK9u/L+0kRdupPHr+R+afyfP176RdHxWPm2aRKmDoA/PJOJ8TFng24CCIc?=
 =?us-ascii?Q?MDurVbVFE3h4vfaes59vzBW2jXdwa8/Xm47mwhjN1D+IE4uAX6ITHyhHgiz3?=
 =?us-ascii?Q?FkIWjnjKQw+kDZP5hDLXUzdWGiu9e5IItgfZTPasRShcBfwhqSKQHorGSX5l?=
 =?us-ascii?Q?FxWxBePpIGk/UvSpzjXMcBatBZaL41LEMFm5l4tdzhfdnLYMwOO8IHxPqyfh?=
 =?us-ascii?Q?4dn+t7uikeIdzjWL77OsmoDRo2loqleO/+RlD4SzH+WbuAAPmbUDwxJvKR/1?=
 =?us-ascii?Q?0HUyaQ9Wj7fMCmpvPySRLw4K/RvyLMkD+CsMh0Kc12zltSjryrL0cGbeWC4Q?=
 =?us-ascii?Q?XgcPG0pkvw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b3865b-88fa-4a4b-59e9-08de57d437a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 03:30:11.1534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BhS1RccPgJ6sEx2C2qWxzxeY2iA2HEJyOasWWFjAkyLfhhbYQJSt2722e5B+To7iNzgPgPVtv+xLcJZiBFITAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8057
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Monday, January 19, 2026 6:02 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>=
;
> Konieczny, Kamil <kamil.konieczny@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v6 06/10] tools/intel_hdcp: Display HDCP details fo=
r
> connectors.
>=20
> Display detailed HDCP information for connectors
>=20
> Add support for displaying  HDCP information for all connectors in a form=
atted
> table:
>=20
> - Add get_hdcp_status() to read Content Protection property state
>   (Disabled/Desired/Enabled)
> - Add get_hdcp_content_type() to read HDCP Content Type property
>   (Type 0/Type 1)
> - Add get_hdcp_version() to read HDCP capabilities from debugfs
>   (HDCP1.4/HDCP2.2)
> - Display connector information in a formatted table with columns:
>   ID, Encoder, Status, Type, HDCP Support, HDCP Status, Content Type
> - Show 'N/A' for disconnected connectors or when properties are not
>   applicable
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> dbedc60c8..b96fc570f 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -191,7 +191,10 @@ static void get_hdcp_info(data_t *data)
>  	}
>=20
>  	fprintf(stderr, "Connectors:\n");
> -	fprintf(stderr, "id\tencoder\tstatus\t\ttype\tHDCP\n");
> +	fprintf(stderr, "%-4s %-8s %-12s %-8s %-20s %-12s %-12s\n",
> +		"ID", "Encoder", "Status", "Type", "HDCP Support", "HDCP
> Status", "Content Type");
> +	fprintf(stderr, "---- -------- ------------ --------
> +-------------------- ------------\n");
> +
>  	for (int i =3D 0; i < res->count_connectors; i++) {
>  		drmModeConnector *connector;
>=20
> @@ -204,14 +207,18 @@ static void get_hdcp_info(data_t *data)
>  			 kmstest_connector_type_str(connector-
> >connector_type),
>  			 connector->connector_type_id);
>=20
> -		fprintf(stderr, "%d\t%d\t%s\t%s\t%s\n",
> +		fprintf(stderr, "%-4d %-8d %-12s %-8s %-20s %-12s %-12s\n",
>  			connector->connector_id, connector->encoder_id,
>  			kmstest_connector_status_str(connector-
> >connection),
>  			kmstest_connector_type_str(connector-
> >connector_type),
> -			get_hdcp_version(data->fd, output_name));
> +			get_hdcp_version(data->fd, output_name),
> +			get_hdcp_status(data, connector->connector_id),
> +			get_hdcp_content_type(data, connector-
> >connector_id));

Hmm from the way you use it here I think keeping them separate is better lo=
oking but still I feel something there can be pulled out and reused
Anyways this patch LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> +		free(output_name);
>  		drmModeFreeConnector(connector);
>  	}
> +	fprintf(stderr, "---- -------- ------------ --------
> +-------------------- ------------\n");
>=20
>  	drmModeFreeResources(res);
>  }
> --
> 2.34.1

