Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037B3C7115B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 07:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9529D10E199;
	Mon, 23 Jun 2025 07:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJCb1aDo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7025210E199
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 07:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750663591; x=1782199591;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L+dlOvp5kw1SOFiEN/v5Ogbwbas8NcUTmc99Dl6gVSI=;
 b=UJCb1aDo+cENJ0mGsS6jpSMYRlq2pKA61ApUGK2XmtqCKNi6LHVpYm1/
 E6i7usfbfoIyKZNFR4C2aDzAQlV2bsDYW0bOpKCtVWJdYUCSO4HrycUUi
 ExnGFzu30niHieiiKdoc2KMlFyb5zTY9q0IcfNF6D4hrBvFgguQQPq7Yh
 jvy1V+Ga2zsL94qYvrT3a6exoH56o1ABdltF2QhPs8wtAX9alx/VMthUQ
 l5yfsp8Oz3N+V4Ne9RXRm0k8hsXkmH7rjuS12P33Iadt0MVjNlRd0ynqK
 S6yEfDxXcO0Pv/n206IJ3xOixix2WEk/ngWUGW+gkMe7bFoVbIhcvjrHV g==;
X-CSE-ConnectionGUID: mvEYnWq3QCKOBTsZnhYlaA==
X-CSE-MsgGUID: 3jV8y6FQRyagw0CQuSQf0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="70284272"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="70284272"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 00:26:29 -0700
X-CSE-ConnectionGUID: 8pgaRUINTn6djaGMEomfkg==
X-CSE-MsgGUID: Dyh7SEwdQoyxyR4kjpMMmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="152192123"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 00:26:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 00:26:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 00:26:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.75)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 00:26:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8a5Yt43J+nN741zmUcXRrbOdW+zLdOk3/Kyp3LJ2EhEJom3UzDWyjWXMBwGnkaDha3FnnKiLfZ6tWsLXUSIr4OSXwXeInUDlushdTBf3WNLBHTAC3uX978kSyKuWOreFOtWUXdevpXMvLSEl96GTN7QP9Qsjw2Rc9YEdjSW7dOuLuWNj8kOt1j+/OyRNY843se1VaHR2yRkfYix2HnzwbdW6cDRsiqDOHZbqAVqH8ve1DbU4e/v26/x8vSIgNBR5dH5KDtXcSc5zKSS9RAxAQhmISuhnkLMIQJr2f8dae+lOmEbM+VGw1kvvZbJR5gYFh7fi7h7IvWE9hPY9G4ltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxRSJA/ksYMiPc3LFKwSIE45k9lQjobQwzJQ/E/kjD0=;
 b=dBQjhujgB74sFxbU+XCD1X51JtK2P5X813LZNH340diDPSJKODm0axL7MgzlmvZwGjQEv17QoODW4FsubOBo8VaBJCB+bS6p/vfcZsKiX+RNBU8rWCu9RejytS8ML0j8tk36oBCrRQaXvJx0wm/4kVC+ftpLT9qEqdIt2KuDuM6phnGoqt/7Rz1iSGedamNHa4VcuhV/NuD5n7c72WF6NCKlNTyGcpLGreT5E3dbdpYj39ZQ82POc4aK5jos9ZP2UBIPb0Yz4X03Aw7SVhXOI1Akl31yheY+xbX8QiwMeR8YrqMZKmrd0X8m/agFC/YF37ORE2Mh4NNxyN06MSjM8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN6PR11MB8104.namprd11.prod.outlook.com (2603:10b6:208:46c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 07:26:09 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8857.020; Mon, 23 Jun 2025
 07:26:09 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v14 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
Thread-Topic: [PATCH i-g-t v14 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
Thread-Index: AQHb35RAO814OPjXXESZb2wUlbvWfrQQWzsw
Date: Mon, 23 Jun 2025 07:26:09 +0000
Message-ID: <SJ1PR11MB612984BBBEC9F5DAD579E12DB979A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250617142707.490235-1-santhosh.reddy.guddati@intel.com>
 <20250617142707.490235-6-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250617142707.490235-6-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|MN6PR11MB8104:EE_
x-ms-office365-filtering-correlation-id: caea81bd-98a8-4cdd-2e99-08ddb22739a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?JxMcai7H/xL+eTMXFGt4Z/cUm5m/jFwFAGV49f+sPrj4MTMgXLVhHP6Of+6q?=
 =?us-ascii?Q?1j4Nkzv0pT3HUNIMrVaU0QKIPWlMnfVM50Tq+n4HvXdJPIvJWqFkDwU8K39o?=
 =?us-ascii?Q?rsWb6ggkBgnPZXX/WnCOih16Q5jXXfyC7RURm2Yoe6V+DNomFIMZXZC6oQlA?=
 =?us-ascii?Q?TlDd+IKKXFlStoub7vGxxKrquUBCADZZ/DvsZICXmsol3Dy7zFLV9lR5/wA1?=
 =?us-ascii?Q?8erLTEzOxdMlRd7pE2vlwW2zdzQ26JuCKaKVK7dB9YGifIC6126v8IA0W8zP?=
 =?us-ascii?Q?TLtdNCbCfo+XVOPDdVUiFkhA4wRR/991ZU9g1mk9HWitKfwM8ZE0iJC1CL0/?=
 =?us-ascii?Q?m9k/HVesE9sVQzEgbRwY03/8xrcD0GqRdbEVAdIObpXmQmD+IZzpA3+iA2FI?=
 =?us-ascii?Q?Rhdp//iB+2cNSk4LEZ/Tg7L8EPqjprmk/92c3dZMXNNnn+V7yXhb8Fm9YZ4+?=
 =?us-ascii?Q?bOWWQsXeAMP9j13crACgMT1cA8e0qGSwWdsLULGUfnWx2dsaSTIG6juPEHaQ?=
 =?us-ascii?Q?OGIFCuccqHZ+YwL1P0GHoXj38U6ZqknNOw1WBExZK+ac4zoYH4UMr68dVCXP?=
 =?us-ascii?Q?rMpxFIjIkZmXM5ndPj7JnsSjX77Ts1PG9LGenPXmDApN+ELx0LIotbl+x5qZ?=
 =?us-ascii?Q?L0CkZ5g5yCYwpdKAa26e8EGtABtg431yEzpEiDlDwAeMXZ/R8oPjF77eoPkn?=
 =?us-ascii?Q?vJcEMI9VQf9zupDDLmLtUGNI0XXdkNfoBGPfoVAwh0f5PQbWlLWqnabgwpY1?=
 =?us-ascii?Q?ZHOr1tzayztyfk+JGEz5njhvcpIFI6Z1wqJ7vUwSl1GwV4kbLwF0mD7O4ZEw?=
 =?us-ascii?Q?EgPKyeB6w6x5TqYpBhHtS3u5LKj8U3H19zXsGI3U7aO/EEkcGwkq9rmL0D77?=
 =?us-ascii?Q?Pd7iHGk0bb6jlNAt4jjOGTomWCUoAeywqkfG6YeWHoPcvXajwaWN8t3/IPp2?=
 =?us-ascii?Q?b3UnHIDKDchKWwGNvZt96BMaa7rdPFTMzHluo9b5VLgJymiYaiIAzudwnplr?=
 =?us-ascii?Q?PCvh0p1jv1Z1TRWwuNo8oV4cabmoWSmS+PvbvvtrFu5usBNwlS8Ny89GnQCd?=
 =?us-ascii?Q?WeRi3c/ac3MutC5a96wtuMQW6d0mtTy6t7fM656Psn8AYrJl++EIAD+LPmXd?=
 =?us-ascii?Q?G4orI8P7+YAc9zfXmI4EoeeU998nfUXTbPm8oRXCXsYIvrl6qTx56RPYPaIS?=
 =?us-ascii?Q?3aqq/0s2XmQnNfhqRlYl/Exh6ZtNTlbri0deTxaCs7JzvXf2LFd4AKro1oQj?=
 =?us-ascii?Q?SjV0uLTJhYJ7uqeiKOaf75iF4bSQhNslk8y0f/62/gCEz/w8Jh6mnm1DwCgQ?=
 =?us-ascii?Q?cuqmgBV9c9i0g4rWfQjfQxIogI0KkvnROv58HVsDjuKH96I3uzKVLj3MFcUb?=
 =?us-ascii?Q?2A/AI1Il8Fojulnc1RIqw/DOAlyu00cFjBDycfHUQeK/Lo1kvdj+DlTgV3+O?=
 =?us-ascii?Q?1LvAjcVQU6eXxUYSgBzcTtCG5fCYLkTSg9A16fK+guz8ASugWGfKBxtPVhj6?=
 =?us-ascii?Q?nb7Zo1yIP6aAzpY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A6Lxp6Xv79ILbajsqkFWRleuI45kp+zc3be8XfrQoCurhrpFepajDMmhE1Ru?=
 =?us-ascii?Q?yq1WoKFIvbAiXEPICWgQ56d3OOff502b52aCkmSWckDbr9MSw+GfKtzrbPTr?=
 =?us-ascii?Q?AvhiCTNTEyaOh1zBhAVqdo5elu7/NjwK7whnFGeCqCP8ktrGsOsET4jHrumO?=
 =?us-ascii?Q?fSkSuM42Ir3CJD7sJJAE4z9U52ZidjnwnYmqsI/4BLPiRztYR/e72hERH3kj?=
 =?us-ascii?Q?0lZlSbuoSA7OjEYvoYAWdcR0H3sLidBCThusPu7720I40S6rkH52pGTKhTCv?=
 =?us-ascii?Q?H04NFIgchvct5csdkLB1Ao3fCUPIG6ciclynmjpd0gS+muY3nVZc0I9OT2dR?=
 =?us-ascii?Q?ivhAhc4bNlZn7rd816B8nmaAS4OFphcT32kopAMdgddSU79bC4ncHYiakeiZ?=
 =?us-ascii?Q?7WmI2Y0ZJvOq4UrlB2ddnUaaRHuP/F9S2ZbR1a9s9VdKqAdSK5yW8xo0MyYN?=
 =?us-ascii?Q?RbQYavvdHZWZh7FucDTv1/2hUVJ95nFrUlzlNaMQ98tEgmApczOM17h/HQMH?=
 =?us-ascii?Q?055caBjKnBVV9Xc1/Dbu1j7wwVxD92it678dE9/lRRvv3nOGZVJDPbeqmfPZ?=
 =?us-ascii?Q?54RqcKqSbb4yx3WxK55iLr3Dc/tD1N2Uj337OlubHVi0cgsnFwsfsxnDdsw7?=
 =?us-ascii?Q?JP8ZclX0Zlm18wScsW/+93whHy66RNY7x3wBSFiCOHOCo9WXfL5KaaBVqfYT?=
 =?us-ascii?Q?jNc9SRnLuo99/ZpEVJ5NNsgzW11/I+t4fvG/Hfvv1Mel78pOE7wKAS2o+XHK?=
 =?us-ascii?Q?m99+2ziLgBgZv/RRofv/Sw2GGPBCN7sqNs+18JaaN8lwwzH9WK50i5DEXzy+?=
 =?us-ascii?Q?pazprcXp5NiUmY0pPw3w9Htokk81hh92thPFxWvgNGZLP0qUKB6lS8VBY2b8?=
 =?us-ascii?Q?8IqsCRYK01wZ0kTAOfX3Z4rPrwZhHyE1jZZL4JS+hnwP8Tyira5D8jdSjDHK?=
 =?us-ascii?Q?2jWqg302EWQpnjBt+aeSzA0EdoopjQDHjGmnRhrCVDEoJN547/M+PWvoapW+?=
 =?us-ascii?Q?0HNeyEDaPIJgVy0w5P90Mr5hJ3nDKaeFMLKDHOvDyl6eZqceGHI6bU6SIUgP?=
 =?us-ascii?Q?LqTJoPZ1x+Ssk50FfzuxDufru5IegGLVvBjVOPGr/WOPulYVCIRydeJs4SEO?=
 =?us-ascii?Q?TZQG3t+Yvjw7v5V12pkdJuaax9SxZXwS840Y4OOmvCtXx/0frFCsNDhlUFFt?=
 =?us-ascii?Q?WLnCu1cYVmPAakJW3+rWap41RuhBzp/mmDxusPsgkQtE7Lo96gRoRUX5u0YO?=
 =?us-ascii?Q?4w5Bw7hRwVdN0r5z7QA7QsQZF4l1k+Wy0Th+WpWszuY1GHnP+yFt6KfbBhcJ?=
 =?us-ascii?Q?7NO0yCldBVCXkG6AV721Zi3dOrVoWIdKMPEMT1BNERIQkvAW1xzgxtxTGkXF?=
 =?us-ascii?Q?2KxcMroFl5dw/a7fuT/xVzq+ofzdyB7bThtEseUIA77hBZa1SVuWW3Wf9h3M?=
 =?us-ascii?Q?jmm9GlHwJk2gDV1l5FGyz+xs+koppBH9oaIF0VeUi8xsPac3buCTLa22XOsd?=
 =?us-ascii?Q?+/rPLTzZw+Wz/YxCuLqNqKQGzyZK2DeIL58QqS9BV5desDsvGpPVw1iJVY66?=
 =?us-ascii?Q?TSFe+3Zwm4J3DwnrP6nEIyWMB13FPwTBKg0OGDR8yRbWnOjMWWBo4F8kMmK9?=
 =?us-ascii?Q?Sg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caea81bd-98a8-4cdd-2e99-08ddb22739a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 07:26:09.6559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6/iyUZLncYP7Gs6qJVyPewkwEF89M+CrTI0ooSqG/sZOFcicaB5ruMtrfcQKUzmYt0BVWMP4qim9q2JUN0C3Hgbhr7E4iJLs5SjnHr/Vu1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8104
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
> Sent: Tuesday, June 17, 2025 7:57 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v14 5/5] tests/kms_async_flips: Skip Async Flips wi=
th
> Linear Modifier
>=20
> Skip the linear modifier subtest on unsupported platforms
>=20
> V2: Remove platform check and use in_formats_async (Chaitanya)
>     Update the commit message
>=20
> V3: Fix crash
>=20
> v4: Handle the case for linear modifiers on platforms where
> IN_FORMATS_ASYNC is not supported. (Chaitanya)
>=20
> v5: Move the linear modifier support checks to run_test (Chaitanya)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> e176b2a28..0c8f4afae 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -799,6 +799,35 @@ static void test_crc(data_t *data)
>  	igt_assert_lt(data->frame_count * 2, data->flip_count);  }
>=20
> +static void require_linear_modifier(data_t *data) {
> +	enum pipe pipe =3D PIPE_A;

This again the restrict the check only to PIPE A.

Regards

Chaitanya


> +
> +	data->output =3D igt_get_single_output_for_pipe(&data->display, pipe);
> +	igt_require_f(data->output, "No output found for pipe %s\n",
> +		      kmstest_pipe_name(pipe));
> +
> +	igt_output_set_pipe(data->output, pipe);
> +
> +	data->plane =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY);
> +	igt_require_f(data->plane, "No primary plane found for output %s\n",
> +		      data->output->name);
> +
> +	if(!igt_plane_has_prop(data->plane,
> IGT_PLANE_IN_FORMATS_ASYNC)) {
> +		data->modifier =3D DRM_FORMAT_MOD_LINEAR;
> +	} else {
> +		igt_assert_f(data->plane->async_format_mod_count > 0,
> +			     "No async format/modifier supported\n");
> +		for (int i =3D 0; i < data->plane->async_format_mod_count; i++) {
> +			if (data->plane->async_modifiers[i] =3D=3D
> DRM_FORMAT_MOD_LINEAR) {
> +				data->modifier =3D
> DRM_FORMAT_MOD_LINEAR;
> +				return;
> +			}
> +		}
> +		igt_skip("No linear modifier supported for async flips\n");
> +	}
> +}
> +
>  static void run_test(data_t *data, void (*test)(data_t *))  {
>  	igt_display_t *display =3D &data->display; @@ -806,6 +835,9 @@ static
> void run_test(data_t *data, void (*test)(data_t *))
>  	if (data->atomic_path)
>  		require_atomic_async_cap(data);
>=20
> +	if (data->linear_modifier)
> +		require_linear_modifier(data);
> +
>  	for_each_pipe_with_valid_output(display, data->pipe, data->output)
> {
>  		igt_display_reset(display);
>=20
> --
> 2.34.1

