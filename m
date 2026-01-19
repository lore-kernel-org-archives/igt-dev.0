Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6409AD4A5EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 04:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7F810E261;
	Mon, 19 Jan 2026 04:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gseKyheX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695D510E261
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 04:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768798654; x=1800334654;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fse7TKmrxW7Vtet0IjvncsDSvoDL18ll1x8l1KR7weA=;
 b=gseKyheXwZR89MFhYjCGKtkFBvnE26VwxumouHu1FcJH7SkEIoeSMSqy
 kgNavhN1v/gGvMww0LRjseS1mxhvsxAsfIGwc+KhSmChvV+iwYrkM62fC
 qCBJwtJdyMe9WZBYDB8+4sF0paToNRq5RW0Dt11tNnWwIYNZs0/Rtyoix
 oVTMFoyTARiP5f17PW61y+nBhov0RSnFHNXYVkfBoHExe6aGtSUJQM4qu
 u4P3wxYo2tRtl1r2MgnyOiO8b9bP0kgccOP+ZaGLzEDZLhqOfsISlFFQO
 GXgiKn+nH1CjzHPPRT9jSdP/IiTupux8nUnu+o/ZmNO+OdJE0fqgts57q g==;
X-CSE-ConnectionGUID: 96WZinlISDCOme0rnLXGMA==
X-CSE-MsgGUID: S2jz8H9WR2CY312AHOTvnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81377401"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="81377401"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:57:34 -0800
X-CSE-ConnectionGUID: L3Aw9FTkTi6aJruO0xH+eg==
X-CSE-MsgGUID: 2tJky0J6R/qPbx01hFmPBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="205805037"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:57:33 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 20:57:32 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 20:57:32 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 20:57:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A27mqjRAvE1oDnoozcYvmVOBP+1H0M/aeBliku8leR+/pRtNiPlaKD9e/98/weISXfO1QFCFXfstSQfx8MJC2DqJgF6yWlHJ9XDmefA3I4ovxm1RrPDFYwz7u7PiMjAbufRbsMu/Hxi2QtVtlpBxXwL2r95Ajkl8YHq0zD6Rp/RiP8x9oldQJqnVPdqDgf40ILt2LxxeOCAqjwssCypqYtQViaaCBCDdLWchhyfAWIGVbcPcqCMPtFEZApqhsmAGFDJ1PlIGO3XElqekIt4WAf6KptkgeFuv0ZLm3fa2WIwprUgwSSofUvxZ/80FNv8A5pYQCQSaQ6HtblOpwofaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xh6XNutjzD+NfTmm8Bs+hY5AzGdleaSjQVAGPsL1M+4=;
 b=VSCOzRiXF4dm8hL2U2B1PcC1PuXN4HGrF15w1LaIQLzw/NatpsJNkv9rw/nGWmHgBNYxwiYz6OOOO2/ZY4xTWNC0w2TNRXnkQa1BLF3uo6EjDD46y3VJwtCvWc1oYd5QK/rCrTXQHK/v8OjzovEaErP2lSJKMbCO8UqYX49WCp70HiAETwzviZn54qxEJe3uOgZshVBRj0pJ4m5g3BuZkGFHx+ksgOPM/r9Q9eGubPsb6kUyKcWx6ndzK9BA8yFimGo7NyPFWMVYjaXWji0HSHD0wOhazrtb5JaJVgIWnxE+Ce/HPOGJ0kdg9MHNSM+O3X6Eodjf7AWhGouALjSUWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MN2PR11MB4566.namprd11.prod.outlook.com
 (2603:10b6:208:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 04:57:30 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 04:57:30 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHciP7XkgC+KpYm20eTttXamoODnrVY7eyA
Date: Mon, 19 Jan 2026 04:57:30 +0000
Message-ID: <DM3PPF208195D8DB744E4298B2AFECE6145E388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
 <20260119050732.110985-7-sowmiya.s@intel.com>
In-Reply-To: <20260119050732.110985-7-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MN2PR11MB4566:EE_
x-ms-office365-filtering-correlation-id: 22c1c849-1ac0-46f1-1301-08de5717403b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?YBm7wDxpzrl07eKIaqjldv7vM/PiF4uNgPNQc8PnamkKlhGD4wKen5PAnoRC?=
 =?us-ascii?Q?2Co8ZmCs2Cy9ffrF4pg/ZveJ+zM615yac3QmXYM5CF0zZUethDb3jzkzhP+W?=
 =?us-ascii?Q?2W9W4jwBapg3IDW37uWQ1mIp45dLuI9Fh6D3Q5f2bqlfX9T44EE0smpmP+g+?=
 =?us-ascii?Q?y8zCk8udWhj23DHItifhuB7yNkMQqHSwKFGcWs/4+it3Crx1cBk8qbVuq+7p?=
 =?us-ascii?Q?bbTmvo9uaNw5c0W+/5tX18yJ82eAO/S3EJRuL3xJMAx+vqaWQacAPVhBT6a1?=
 =?us-ascii?Q?jC80ZulVCWX7NSOIzHErA0EfWlmWESFXK/MkZJ/ubGSo0EyYMfxdXx7yS7/7?=
 =?us-ascii?Q?dJpk5mgqjfT8/BQ34xNVD6ZYrIMFByWyRvdH3DYA+yZxYCxSebKgGYJArHwj?=
 =?us-ascii?Q?3vpb/R1HkessX5BwpLibHdOvtH0S7pGm6a4dvVCc64YNKARs1NHyfA/F2Cls?=
 =?us-ascii?Q?lPCmOf2+M0z23RJNjlqEc8HJV7ArTMAvCeZrxwjf/euYpM3j61RfV1PSaG7H?=
 =?us-ascii?Q?GGfc3nekssoWuCAjLLmeiJtH/rkkvwQb+DwdLDlc+RwXIm5KOHSR/rcw6Tkw?=
 =?us-ascii?Q?ojooBqymRW5aEuQmPKeRgaDdXkbm1boJkrsRADEm/h98nkDBP74ht3EUdTZl?=
 =?us-ascii?Q?VwFB+ynHz1JBp1jXbgRpM4QEfN+W1scmHjsNu+CJSfX6jE1DH03hFmtn63ni?=
 =?us-ascii?Q?Am/StcAjzW1t2GaXuz/n13CEIxIA4szq/rv8Ato9+IcpCr4sepb3H2AALKy/?=
 =?us-ascii?Q?RmG/YGbXisERCGKQGf8Kzr1Wu+FS9XcLmK5f0ALR+iUop4lnScBrygq6S7M6?=
 =?us-ascii?Q?MICdexLHZ0QKDOMHeCtlbC250U7kwWGstPxebR5l5NpCIfWuYTJ+ERnF7VcF?=
 =?us-ascii?Q?wWvJ9XUkVFa8dGQ6y8ymUudpQhkewfFrllUh2FVdHdR+6MWZ1OXr2ymLYxeO?=
 =?us-ascii?Q?OplCsKJ0aUMSQkKoMzcNLd7xdtjeYZSynW3tkLKeEYET2K/DcLagaR5wZOz+?=
 =?us-ascii?Q?qOpHEME6RJWWBX3uO/UN8rZNeIQrqW8+N+3iM+6eiuSztkrrenukeF+n1+Rb?=
 =?us-ascii?Q?lS/nijXDHO1jgCZDEIYU4Pov+57e6/ci3hshqEEAy5IEYViQJV7DnEs2Gn6y?=
 =?us-ascii?Q?WOpZOsBetwhYzJyx9CW9fh7865dPKyj0mla6OVfVYWlvO6SRbIl7SyLo6TBA?=
 =?us-ascii?Q?DExS1zUqqGSUBpFdLRBlXWnB6QpZvPWePLeiLo4pRxlbhFxaqEIgNGpys67M?=
 =?us-ascii?Q?YzNBYuq9+oJxdedOM1+yQRcuwoFfyyQHG3gxTBk2pn4JqBc1pm/2OJOt2YoQ?=
 =?us-ascii?Q?r6veUFZk4C/yGxzpaO7DmYfsLz7oLFltp3Ed6ciw2AdKMXYXNiR8uEJi22s8?=
 =?us-ascii?Q?O2Sd8kVFXzY2GC177z+BEePaZddoIR1M5xYxF/fsdWwQR8yMl548If/1/Pc4?=
 =?us-ascii?Q?Gx7W7vWldTcEB66YXEjpBZzAebJxdW8wmJDjgMWNjsx2Zw+7MPGrxV7ZXqCg?=
 =?us-ascii?Q?SwA5OmradLoHGVsTSdA3N9Vxh5LDA7x5IzNynNc52XN8cphsq4Q/YmTHWOGH?=
 =?us-ascii?Q?okCrlW7xJGYmTC11okftYSyS3k6v4WgKmExUmvwWpTjy2rEtm/nVf5xMM4lp?=
 =?us-ascii?Q?7fGBzwwc6/GrvIVAjLAQIPY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rV3uN+IAnrwmHqCIB7M267L6SX0/DdGqWpqB0R3G0er2TM4r7KrrmQHk7c9/?=
 =?us-ascii?Q?/jDHVFK3Ka6lfIkBDgvE17X+kCJG940AhMYJqqW6dhVBt0BIW/2ooXvsdc4z?=
 =?us-ascii?Q?Ng9h97woI0R/9B5yfIjWy+FT8IyoRkH4WquCwiomTmMrwxwoXh89qNRl7q2E?=
 =?us-ascii?Q?2u55olhe4WIlAz7RbhqqJRxAY6XwC4ccmpLS9j8M9Qeqjvp9H6VqpfYLVG6w?=
 =?us-ascii?Q?qNs0B46fGASw4zG8rFdYOBt/+Gl7AJBeOtn5dBUuzWq2VaIg1YGOaevlt8ge?=
 =?us-ascii?Q?crh80Oeklc+vR6YecxxhTCaBmy+mfQLL7SXCSVWNZ9qc3jeBpZ0aaLJyAQuR?=
 =?us-ascii?Q?rNlF/vfCMs8VEftTGkJZUMaYCtVQ3eZwTVodoev4nglZT+MVn/ITUipocmJ+?=
 =?us-ascii?Q?nlKnoBSWfhMAQw3nqUzJjx4wkOrxRZ5MNB+dZ93X8r35/Etm1tdEY3719GqW?=
 =?us-ascii?Q?4kOcaYYlNuv3cMwrNbXYUiREbkC6GlpiweAXhmzNwHyt2mzNEhPgQYEfLHub?=
 =?us-ascii?Q?wdeEoYPAxZBLkT8O7lcxwvPlJaUi6v7Nfv/4+Guk6Aal5Nkt013/LcWbv4yf?=
 =?us-ascii?Q?jpwTqebbYEz+rBD9xyqtGR+she/+fFuD8mEIzqUs5vyAjM/jZzIKV6jZPY1b?=
 =?us-ascii?Q?225ZwZGCxyRshWLz1dMSq/Do4QoJI/R9lRDOmHBY/tOlRK3RKhXGgghsyIqo?=
 =?us-ascii?Q?cSoMqBsEwrBtM5wNlrwwlmUiKpOLvrcf7oVoqFH8BU/ztaRfzGCEo2nB03Y5?=
 =?us-ascii?Q?QxkzYuRybZIlMyk4gJwqBk4Er9A+LTA9T3vAt20zlSWrtN77vx5g4FjVOQUG?=
 =?us-ascii?Q?CdZmgZI1zQTT3hAKcxKNArIKaeED2SZuUu3igoRKxyA+QQeKs4HETvrPB4K6?=
 =?us-ascii?Q?AaW9PwjQDtfCyrnXuKV23Ktdl8iWy/Vrgev85he6Dvnj6thFn51ZIJ1cQtkL?=
 =?us-ascii?Q?TR6di8N2JrHzqdPTFMRBboUJ/7h7z50I9bHfJKqgR3goPN8lSjXalzhgDryh?=
 =?us-ascii?Q?ZQCeaY3yA/EXmCZ+7kitM1kWdAWHSTHAzXPKmasPPwKFq8f9fyX58tcTPag6?=
 =?us-ascii?Q?WI2oGY9qE7xjngsSFhSzpP9mTg66bNjawjWUQIQDOuvFrsi55c/C6cW10QCT?=
 =?us-ascii?Q?bzHw3p2wpDlbDM959pf05tiCIJv+GrSfEk/yBnmVpxgzFrWNiHNj9cQKHx4l?=
 =?us-ascii?Q?7/vFYY5gOoiWfp5gI86Z8lEjkaa8A3Ys2ZbriQs/d/woPyNUcxplgIAUHRNa?=
 =?us-ascii?Q?KLtbTiXVPLmXBWI1qVkciPbZyX2Lr1z459iicX481sTuu5HnZLrNa/AUYC+y?=
 =?us-ascii?Q?jMfehwr4REsBty8SxEYXebs1rSEInxYBXxqq3mXosN4F5lLwJoIOUEyUMaQk?=
 =?us-ascii?Q?EqSKjv4V7Bd9+uE29W6+F8rOipjKZCKHnSnZmvOx/xfM5YO07eGDZuNxpIUJ?=
 =?us-ascii?Q?3VN3owftg7ZT+fI+aAnw+4k1aTljtX0vQ9t2aho0G9qeH5FJ1/ndBiccQC4e?=
 =?us-ascii?Q?HqGS55+bjmFsZL2gPhCv9h5hWtCnNpSKEqsxBXmN6wOqUqMhhpGFEUxmVApJ?=
 =?us-ascii?Q?CtMw645zxnuOBeoJpcXbOZBPlAr0oPuRDWwrdlxoFfNz8Q06s4ulvNbwf4L+?=
 =?us-ascii?Q?qVgCxYK1X21LBuhDQhFBaNloAa3Mg8MDXq/ITXxVkVS5ZtgpZmb/effUBgL8?=
 =?us-ascii?Q?idqDy0sLJUGwv1OXDvVKUJPyV/RQOwmJurnNC4pCbhv51/14e5WKi4hT2lOJ?=
 =?us-ascii?Q?UGj0ka4nww=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c1c849-1ac0-46f1-1301-08de5717403b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 04:57:30.6243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gTSHItpZssymhVx6wYeOXS2Nz0uMKoQykQoyWgoPHDNl6H3xIJ8XUpMNl2sA57B05meyGvobE52YkweBgdmaeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4566
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

> Subject: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor writeback-fb-=
id
> subtest
>=20
> Remove individual tests for each format for the test writeback-fb-id and
> introduce dynamic subtest generation based on the formats supported.
> Framebuffer creation was now part of the subtest level based on format.
>=20
> v4: squashed the FB creation function with this commit (Suraj)
> v5: -Update dynamic subtest documentation (Suraj)
>     -Rename input_fb to in_fb
>     -Set plane to in_fb and remove unused input_fb as an arg to
>      writeback-fb-id function.
> v6: -Remove in_fb inside subtest and reuse input_fb from
>      fixture (Suraj)
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 60 ++++++++++++++++++-------------------------
>  1 file changed, 25 insertions(+), 35 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 63917bf4f..0ed86c865 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -51,9 +51,6 @@
>   * SUBTEST: writeback-check-output
>   * Description: Check writeback output with CRC validation
>   *
> - * SUBTEST: writeback-fb-id-XRGB2101010
> - * Description: Validate WRITEBACK_FB_ID with valid and invalid options
> - *
>   * SUBTEST: writeback-fb-id


This is the an example of the documentation that needs to be done for dynam=
ic tests
* SUBTEST: %s
 * Description: Test content protection with %arg[1]
 *
 * arg[1]:
 *
 * @atomic:         atomic modesetting
 * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
 * @legacy:         legacy style commit
 * @type1:          content type 1 that can be handled only through HDCP2.2=
.
 * @suspend-resume: Suspend and resume the system
 * @legacy-hdcp14:  Test HDCP1.4 content protection with legacy style commi=
t.
 * @atomic-hdcp14:  Test HDCP1.4 content protection with atomic modesetting=
.
 * @atomic-dpms-hdcp14: Test HDCP1.4 content protection with atomic modeset=
ting and DPMS.

Regards,
Suraj Kandpal

>   * Description: Validate WRITEBACK_FB_ID with valid and invalid options
>   *
> @@ -300,7 +297,7 @@ static void test_invalid_parameters(igt_output_t
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
> @@ -700,37 +697,30 @@ int igt_main_args("b:c:f:dl", long_options, help_st=
r,
> opt_handler, NULL)
>  	}
>=20
>  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> options");
> -	igt_subtest("writeback-fb-id") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> -	}
> -
> -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid
> and invalid options");
> -	igt_subtest("writeback-fb-id-XRGB2101010") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> +			uint32_t test_format =3D fourcc[i];
> +			int bpc =3D igt_drm_format_get_bpc(test_format);
> +
> +			if (is_intel_device(display.drm_fd))
> +				if (!strstr(igt_format_str(test_format), "BGR"))
> +					continue;
> +			igt_dynamic_f("writeback-fb-id-%s",
> igt_format_str(test_format)) {
> +				igt_fb_t output_fb;
> +
> +				fb_id =3D igt_create_fb(display.drm_fd,
> mode.hdisplay, mode.vdisplay,
> +
> get_default_fb_format(&display, bpc),
> +						      igt_fb_mod_to_tiling(0),
> +						      &output_fb);
> +
> +				igt_skip_on(data.dump_check ||
> data.list_modes);
> +				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> +					      "DRM_FORMAT_%s is not
> supported\n",
> +					      igt_format_str(test_format));
> +				writeback_fb_id(output, &output_fb);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +			}
> +		}
>  	}
>=20
>  	igt_describe("Check writeback output with CRC validation");
> --
> 2.43.0

