Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B4CC77B7C
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 13:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B84810E144;
	Wed,  2 Jul 2025 13:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGf86JFM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEDB10E144
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751462453; x=1782998453;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h5HoVie11Jld9w5YppTA3iyt+txG7isLsswt/rg9tpA=;
 b=MGf86JFMCXYGNTmUgIlHJZtgFNw/pxPG1Bp08+v/9Muaw4VsxfPETz7f
 GnG/m/rjzGjVIAFFniUbT0VyaGmWg1QnU/yeDFeGPbmbOdCMvbDdZbz2Z
 48iuyX/oAJIjajfJXj8SwFCDsdlzRKLOXol3oGG5dYTsoFUFHCvDKslLS
 X3ssid1S7EmumsfFZCztPt1Z0GTjzIinJTvEkBbARZx5k4kZKaKn1wt0M
 W1wHGxAFB4X2uTb6ZBDPEFCFrQVXAjZ1hOPBRiDEIw92QnYHVenBJKujN
 fJBuJhORY0b09EH7qO7mTW6UJeJhuSmCXDGYqEwpb9xJVR8YMedC+GZGh Q==;
X-CSE-ConnectionGUID: e0LFAA0OSw6bAnSs8kFvrQ==
X-CSE-MsgGUID: 96kGti02RBqmw4AFJBOzhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41383608"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="41383608"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:20:53 -0700
X-CSE-ConnectionGUID: fRU+q0QARRu5P3oOA/DWzA==
X-CSE-MsgGUID: ebnE00w4RSumq9O6Mb+rmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158336636"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:20:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 06:20:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 06:20:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.86) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 06:20:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIMWdr7GvlSl78RA7NJj+Zqg140fNu7lOhMsP2MhXM1VOG7IVoDqpyQO9ZMT7jQojpCLjkYxuzN5CXu4yBo6hM4EeF0lyiFAHihE+NSAPc8mMPxoe8CpPQgLIKF27/pjG1PuZZvMw2LvEo5LM7nMloR8TvPeZBbCHcaWne1IP7I/SxMnvMyCGcBZGYkI51DJ37fOz0f2R9RYFAi2w0AZE6GI3TDTfjN/oU4gpCM/OgYv5IpHnUL0+YkGQdC7wxlUyhsCerW9+nAhTFfvqtbwDAx5JDXBWemtCFpB8sKz5/VUr92hldEKpm7j+t3wy7ackhpoUpkEJ/SoKNyxZ+B3og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUBKurpz7bjia+VO0Xl08J3XbnWgL8VevKbZGakobFc=;
 b=TIKGcPsnbTaT1hnjmhOa9iJYPi9/I6JvBMaZMHL0xG8nrSI3moqQdyApfkbqmp9cZQljgjB1E36ccJqxGrPDklSFihQVo44LV5dT4eYEFmeUNf8d+PIT0UD5drc+ZKQxaUkbntP5esGukadX6+Ya389+0t/7SIRJUDnktISe2Bwr1WJLnIj7r0N8gYK1ee31WPJMGc6xZ9+vy9ZQV9XYbQHD3cgzXIxpMpTYlY2xYZqzc71NF1NMwEPTFzydSlNyXZsrG4WLIcNINE67cCdbPLtiENkSfLBuNXf4hQLYuKaWbma7wStOkP0o8kGluAApsido1bvq/VA05iVK4sVl3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CO1PR11MB4961.namprd11.prod.outlook.com
 (2603:10b6:303:93::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 13:20:50 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8857.026; Wed, 2 Jul 2025
 13:20:50 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_content_protection: Add force HDCP 1.4
 subtest
Thread-Topic: [PATCH i-g-t] tests/kms_content_protection: Add force HDCP 1.4
 subtest
Thread-Index: AQHb3prGSn2hM//y3kKj80PljC3WS7Qe6aqA
Date: Wed, 2 Jul 2025 13:20:50 +0000
Message-ID: <DM3PPF208195D8DACF005E66468C801F7ABE340A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250423102036.2944399-1-santhosh.reddy.guddati@intel.com>
 <20250616084144.472146-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250616084144.472146-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CO1PR11MB4961:EE_
x-ms-office365-filtering-correlation-id: a323aaa8-e563-4bc9-3f6b-08ddb96b4396
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PfWE7ZOfPYQ76qxXLKTeDSydwfEB1VzM0BauyYryuKi6q7eW2uOgQZ+2TNGF?=
 =?us-ascii?Q?Zuix2wN8LMzH5VX7xVSZfCWUQMRF69m+HozFLPXNCcJY2MlmX+h7hsEvvaj3?=
 =?us-ascii?Q?hNU9x4oELTHxJVR08MnizH+LlafIo4fnx6c/IwGH6VxkrHBlzptCtMljEEco?=
 =?us-ascii?Q?Xr4O7EJ4VCz1vi1hCKTjhanLeWDR11FxvF+7X5xA524hCv/uIRCPIrUIWGU4?=
 =?us-ascii?Q?IHqYdCY6aMsYGRisI/XJUtEZV7VyS8YPJbG1cxrdDTMZGhqS+UVXb7DlZTXD?=
 =?us-ascii?Q?wapNWy0/wCAIc74wVq7X0qo5tjh8fBPaiU2gotFQTCMyTdx4WilVpNaTjQdo?=
 =?us-ascii?Q?XYcHGTwDveFf6tFcnv7a8WDQ8xRe1n6B2RNcOkNyogBOc18dFeHtH3cuTBfm?=
 =?us-ascii?Q?4UQ/UxVfEsg735dihRgiDEUBd7ZI1yTb/Bdmxikk9zXySDNpWmup1SCt1Gkm?=
 =?us-ascii?Q?n+CK+LW8Z8dhPp53/RRsL8kwBxX+ExSXvxP+C2TisvfClbr9+0w82UaHMUOc?=
 =?us-ascii?Q?69ZSE7ceIeZAdjbcNdmN/Lcw3BwJYBgZm108dr+b9Z1SwfWuXz96RcD+h7Ww?=
 =?us-ascii?Q?02FQhErt++XwGah60oFXw3K4iJOTTMyxC8aamlFVWN02U0BlByaqwEuo1M87?=
 =?us-ascii?Q?E95kW2F6JWrhSy2tMfpoEfQAq2qKJA6j82EWUI3qGDbuAsfbyYbVGZQhuNt+?=
 =?us-ascii?Q?Qs9xpkvcErT1i56Y10uNpWbaJXPYPrWuAaqx94VxUSjCke47/r7pr3fEXl/7?=
 =?us-ascii?Q?KplXOwn8iYCfaKXpt4K5mKYzTdjReL6VzfUZG0cOIASjnrKFTvrObv7bvqo3?=
 =?us-ascii?Q?iyqo5T4zj1C13CJJpE5+6k2wROuVVrf1vhhOlcvXCbVIe55vk44XcigHysan?=
 =?us-ascii?Q?RCIzj6Ut8uX3lPO/RGpeSPs5w2+tHOatneVQPMAubS2retzZrqW06UOwSEpV?=
 =?us-ascii?Q?szzxuP7NjCcSaa/XePsyjQSPRQojywhQMMtLV+VGVruci7Y+YioJzrtmeK+B?=
 =?us-ascii?Q?tYjxWmtU2XvINndnQ/jzZyi8+6hX7UjHqWh54GxJibtbe7VvWgpMptHKN73D?=
 =?us-ascii?Q?fOp8fBC0BtwbwRLzCnzqXTVQ30JoXf1AVpsNRBK7SPGz9Gh9KuXjuweBpiGe?=
 =?us-ascii?Q?H4vFvG8iL5p69bp3L6aFkeGVWxo+kR/L5uFCg83HaxN0/2UYaw2oAHpi33yw?=
 =?us-ascii?Q?/1GG6CSHSF+YTLMG0CtSWiaJxTusSqDuO6A9/oqWAfOSXJ5dE5B8F9ZlIElm?=
 =?us-ascii?Q?xXT+Q2XPqoscV4aT72Xt2/5KYb41mSqvfuHhU0UNRKnd6KeQivJ6B3wZrHou?=
 =?us-ascii?Q?cgLypJpr05raPf5cRbSLME0GZCcRCfiurlb6ZTBqsU2qyXC8p5IzfNKyl+7X?=
 =?us-ascii?Q?BriuoG0IVEvIpT14SyxTkAgFgnfrsp/lXG9ZU2iLreS4/0gQPcgvNKysfvwS?=
 =?us-ascii?Q?QyDhiHYm/Z97W8ywZ9v9slToN3ivvjsL7RpnY4W7PgvVAmBiKXrEkA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X6DjOze5xJuYSkXSSgf1oCOetAigvb6KzmVURz7QVoG93tgg4V4Tuzwm0EfA?=
 =?us-ascii?Q?D6kyjaCxEnDy1kRcdG5qFCuxIZK34X6Zv7NxHeJ9iTC0DOoHF3ATKUTYV55z?=
 =?us-ascii?Q?hg3cStjm107Z5G0w9lZhUKa8Md+6aGqkw/wCAO4GS+//4i0rQSJl7o+E8iEZ?=
 =?us-ascii?Q?PO7yvFrUZMUb1gDI17P9KlxjFmVuC219WK6ve9usLtaWcyhis2PnkwmY5N5x?=
 =?us-ascii?Q?A8JwfxE3asLmaAO91V3SeOzLCqIuJnev/neQKtqclml9WJgVvhOHK6CvDFRg?=
 =?us-ascii?Q?qe9EAr+1dV93LWOZ0gYcag6GEjQlIR6O4mxjPh7DPJqpbjEFCkqn9FPg3/s3?=
 =?us-ascii?Q?j6VdNRD4NFSmutfYNuARlz6IVRKylPKVAlzFGBAGqyVB18cDEu9cQkFn30KS?=
 =?us-ascii?Q?uc4toHm4zNbhy+qlOVlXZVeP8xFdwiR5XQWDhNn2t0D6rP5WTTBPrxV7GC+c?=
 =?us-ascii?Q?vxZvHj9N/91B43azuy546yJnD5UqjyVr9nnZHPJmkkrW4KcQ4EnfG23lf68g?=
 =?us-ascii?Q?JMXDZQskqKhmJUd6wHnyIgQ5ZV9vAAxFqmcLz1REc3cg3M2YCKwkakgvDtd+?=
 =?us-ascii?Q?XUfAicOAncmloo8aBQX4lPuFYQa146jwtVqv4rUAT1Hcpr3+3RwhdNmnM5bR?=
 =?us-ascii?Q?aQKbruhY+iE3CKyNsYV23Kp+hIBtHZ3Sm+PA3nseg60C4yBTF2AOGj8+PqE+?=
 =?us-ascii?Q?2y9U5R6Mpe8Oi2jcdFq5qPeqD370jdtXwxYGqoKM9oiDJPLY2N19BCqDS7P/?=
 =?us-ascii?Q?kFJmOAoBfs6qUw/XJNywNtrOl8a3SS9xah2f0ec/iuuMj33DPvsG7yjrzv2r?=
 =?us-ascii?Q?OlmsKNeNW/OMe5lYQWsxDvnhu7G4FfKAwp1b/Tx92k/8KggSvxMyQY+G+luF?=
 =?us-ascii?Q?tht2f9g0vkTu9ADacC94RNT4fvEP85EBgImpre2Po4yi0BQZ07Gxp2/nTOku?=
 =?us-ascii?Q?1Ev5X5tYKzIRjE548LWy4YyqQ0r343KIKxA7iOWm7Vlhbh6NYIjh4V9NabM4?=
 =?us-ascii?Q?k1i9rMZkXhguFhh44X0KCW0WnzUdwUTJBllMrnwOh6Dh59F7gfbdqazzFywm?=
 =?us-ascii?Q?OixR6v5TaqG3/9TcqrtFBS1cs2Uhs6xGpSSlRWfv1/74mWAcrZ0tQhqY4NZO?=
 =?us-ascii?Q?f9oQYDqJDPzb6q4+5RMFJyoLcHEpfy6ECdYyVwr6tVFpqqGJyiO1tJr93SUg?=
 =?us-ascii?Q?UubdRxLTbSullEu7D/6Wy4a/Kkv7ypo2y40ppsVBp2XA4nAZg4fRgA25Ac6q?=
 =?us-ascii?Q?DM2AdQAe0uZRTGlLxdAXGsDgxKAQyPTx0NEw4UOk86U4tAtn0MruvzS97gqe?=
 =?us-ascii?Q?N5uZMHC/UcY81Gi8WsB5wnTnZWOQUwH0KBe+nFOSoIBQkssNUrMzOt1KAnuI?=
 =?us-ascii?Q?/VMhuYKSWr8G4dVQGLgAEvsjEfyrt3XitiOShPWnEJzHJ653C1TcJB8KxMPc?=
 =?us-ascii?Q?fDntbnX0cVxWaHDwOKtqcGMlSiclgCwcaSlDv/h7w3I0V0/kAycWhMJPm68+?=
 =?us-ascii?Q?J4m0+LUc1fxiBp5G3cx+XF4fQZbw9UxvX43uUzPmW/geHWIX/98+mG7bo7Ul?=
 =?us-ascii?Q?d9tIOBjSoYNUHaUD4Sl4Y8sFotOJZxwhiA5BoCRl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a323aaa8-e563-4bc9-3f6b-08ddb96b4396
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 13:20:50.2621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: if4mweLCmwhxWxMbClb1vDjTWa90tYGIH/qi/pY5398lgMqdav/qbfftghhDwCK+K+Tv4RqltpNaDBcjxGlcFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
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
> Sent: Monday, June 16, 2025 2:12 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t] tests/kms_content_protection: Add force HDCP 1.4
> subtest
>=20
> If a Panel supports both HDCP1.4 and HDCP2.2 versions, the kernel will
> always choose the HDCP2.2 protection path and if this fails, then
> HDCP1.4 will be tried.
>=20
> The subtest uses debugfs support to force hdcp1.4 on the connector and
> verify content protection.

In general I see you have differentiated the tests as hdcp14 and hdcp22 I d=
o not think
Hdcp22 name is needed for the below reasons
-When using type 1 content hdcp22 is the only thing that can be used
-When using hdcp22 without type1 content for example for a test like atomic=
 hdcp22 may fall back to hdcp14
hence calling the test hdcp22 is misleading

Lets have only hdcp14 name added where we force hdcp14 else leave the name =
as is.
So the test like atomic will have=20
atomic which will automatically go through default path and atomic-hdcp14 w=
here we force it through hdcp14 path
tests like type1 will just remain type1 no change required there

Accommodate these changes in the patch below wherever it fits

Regards,
Suraj Kandpal

>=20
> V2: Use hdcp14 debugfs for all the supported subtests (Suraj).
>=20
> v3: Create new separate subtests for hdcp1.4 and hdcp2.2 for all the
> supported tests. (Suraj)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_content_protection.c | 247 ++++++++++++++++++++++++---------
>  1 file changed, 182 insertions(+), 65 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index b0d0b0234..a1f07497c 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -28,6 +28,61 @@
>   * Description: Test content protection (HDCP)
>   * Driver requirement: i915, xe
>   * Mega feature: HDCP
> + *
> + * SUBTEST: legacy-hdcp14
> + * Description: Test content protection with legacy style commit with
> HDCP1.4.
> + *
> + * SUBTEST: legacy-hdcp22
> + * Description: Test content protection with legacy style commit with
> HDCP2.2.
> + *
> + * SUBTEST: atomic-hdcp14
> + * Description: Test content protection with atomic modesetting with
> HDCP1.4.
> + *
> + * SUBTEST: atomic-hdcp22
> + * Description: Test content protection with atomic modesetting with
> HDCP2.2.
> + *
> + * SUBTEST: atomic-dpms-hdcp14
> + * Description: Test content protection with DPMS ON/OFF during atomic
> modesetting with HDCP1.4.
> + *
> + * SUBTEST: atomic-dpms-hdcp22
> + * Description: Test content protection with DPMS ON/OFF during atomic
> modesetting with HDCP2.2.
> + *
> + * SUBTEST: lic-type-0-hdcp14
> + * Description: Test for the integrity of link with type 0 content using
> HDCP1.4.
> + *
> + * SUBTEST: lic-type-1-hdcp22
> + * Description: Test for the integrity of link with type 1 content using
> HDCP2.2.
> + *
> + * SUBTEST: type1-hdcp22
> + * Description: Test content protection with content type 1 through HDCP=
2.2.
> + *
> + * SUBTEST: mei-interface
> + * Description: Test the teardown and rebuild of the interface between I=
ntel
> and mei hdcp.
> + *
> + * SUBTEST: content-type-change
> + * Description: Test the content type change when the content protection
> already enabled.
> + *
> + * SUBTEST: uevent-hdcp-14
> + * Description: Test to detect the HDCP status change when reading the
> uevent for HDCP1.4.
> + *
> + * SUBTEST: uevent-hdcp-22
> + * Description: Test to detect the HDCP status change when reading the
> uevent for HDCP2.2.
> + *
> + * SUBTEST: srm
> + * Description: This test writes the facsimile SRM into the
> + /lib/firmware/
> + * and checks kernel parsing by invoking hdcp authentication.
> + *
> + * SUBTEST: dp-mst-type-0-hdcp14
> + * Description: Test Content protection(Type 0) over DP MST with HDCP1.4=
.
> + *
> + * SUBTEST: dp-mst-type-1-hdcp22
> + * Description: Test Content protection(Type 1) over DP MST with HDCP2.2=
.
> + *
> + * SUBTEST: dp-mst-lic-type-0-hdcp14
> + * Description: Test Content protection(Type 0) over DP MST with LIC and
> HDCP1.4.
> + *
> + * SUBTEST: dp-mst-lic-type-1-hdcp22
> + * Description: Test Content protection(Type 1) over DP MST with LIC and
> HDCP2.2.
>   */
>=20
>  #include <poll.h>
> @@ -42,52 +97,6 @@
>  #include "igt_kmod.h"
>  #include "igt_panel.h"
>=20
> -/**
> - * SUBTEST: lic-type-0
> - * Description: Test for the integrity of link for type-0 content.
> - *
> - * SUBTEST: lic-type-1
> - * Description: Test for the integrity of link for type-1 content.
> - *
> - * SUBTEST: content-type-change
> - * Description: Test the content type change when the content protection
> already
> - *              enabled
> - *
> - * SUBTEST: mei-interface
> - * Description: Test the teardown and rebuild of the interface between I=
ntel
> - *              and mei hdcp.
> - *
> - * SUBTEST: srm
> - * Description: This test writes the facsimile SRM into the /lib/firmwar=
e/ and
> - *              check the kernel parsing of it by invoking the hdcp auth=
entication.
> - *
> - * SUBTEST: uevent
> - * Description: Test to detect the HDCP status change when we are readin=
g
> the
> - *              uevent sent with the corresponding connector id and prop=
erty id.
> - *
> - * SUBTEST: %s
> - * Description: Test content protection with %arg[1]
> - *
> - * arg[1]:
> - *
> - * @atomic:         atomic modesetting
> - * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
> - * @legacy:         legacy style commit
> - * @type1:          content type 1 that can be handled only through HDCP=
2.2.
> - */
> -
> -/**
> - * SUBTEST: dp-mst-%s
> - * Description: Test Content protection %arg[1] over DP MST.
> - *
> - * arg[1]:
> - *
> - * @lic-type-0:   Type 0 with LIC
> - * @lic-type-1:   Type 1 with LIC.
> - * @type-0:       Type 0
> - * @type-1:       Type 1
> - */
> -
>  IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
>=20
>  struct data {
> @@ -96,6 +105,7 @@ struct data {
>  	struct igt_fb red, green;
>  	unsigned int cp_tests;
>  	struct udev_monitor *uevent_monitor;
> +	bool is_force_hdcp14;
>  } data;
>=20
>  /* Test flags */
> @@ -581,6 +591,51 @@ static bool output_hdcp_capable(igt_output_t
> *output, int content_type)
>  		return true;
>  }
>=20
> +static void set_i915_force_hdcp14(igt_output_t *output) {
> +	int fd, ret;
> +	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
> +
> +	fd =3D igt_debugfs_connector_dir(data.drm_fd, output->name,
> O_RDONLY);
> +	igt_require_f(fd >=3D 0, "Cannot open %s debugfs\n", output->name);
> +
> +	ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> sizeof(buf));
> +	if (ret <=3D 0) {
> +		igt_info("i915_force_hdcp14 not supported\n");
> +		close(fd);
> +		return;
> +	}
> +
> +	ret =3D igt_sysfs_write(fd, "i915_force_hdcp14", "1", 2);
> +	igt_require_f(ret > 0, "i915_force_hdcp14 is not enabled\n");
> +
> +	ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> sizeof(buf));
> +	igt_assert_f(ret > 0 && strstr(buf, "yes"),
> +			 "i915_force_hdcp14 is not set to 'yes' on %s
> debugfs\n",
> +			 output->name);
> +
> +	close(fd);
> +}
> +
> +static void reset_i915_force_hdcp14(igt_output_t *output) {
> +	int fd, ret;
> +	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
> +
> +	fd =3D igt_debugfs_connector_dir(data.drm_fd, output->name,
> O_RDONLY);
> +	igt_require_f(fd >=3D 0, "Cannot open %s debugfs\n", output->name);
> +
> +	ret =3D igt_sysfs_write(fd, "i915_force_hdcp14", "0", 2);
> +	igt_require_f(ret > 0, "i915_force_hdcp14 is not disabled\n");
> +
> +	ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> sizeof(buf));
> +	igt_assert_f(ret > 0 && strstr(buf, "no"),
> +			 "i915_force_hdcp14 is not set to 'no' on %s
> debugfs\n",
> +			 "i915_force_hdcp14");
> +
> +	close(fd);
> +}
> +
>  static void
>  test_fini(igt_output_t *output, enum igt_commit_style commit_style)  { @=
@ -
> 652,9 +707,15 @@ test_content_protection(enum igt_commit_style
> commit_style, int content_type)
>  			if (!output_hdcp_capable(output, content_type))
>  				continue;
>=20
> +			if (data.is_force_hdcp14)
> +				set_i915_force_hdcp14(output);
> +
>  			igt_dynamic_f("pipe-%s-%s",
> kmstest_pipe_name(pipe), output->name)
>  				test_content_protection_on_output(output,
> pipe, commit_style, content_type);
>=20
> +			if (data.is_force_hdcp14)
> +				reset_i915_force_hdcp14(output);
> +
>  			test_fini(output, commit_style);
>  			/*
>  			 * Testing a output with a pipe is enough for HDCP
> @@ -716,6 +777,11 @@ test_mst_cp_enable_with_retry(igt_output_t
> *hdcp_mst_output[], int valid_outputs
>  	int retry_orig =3D retries, count, i;
>  	bool ret;
>=20
> +	if (data.is_force_hdcp14) {
> +		for (count =3D 0; count < valid_outputs; count++)
> +			set_i915_force_hdcp14(hdcp_mst_output[count]);
> +	}
> +
>  	do {
>  		if (retry_orig !=3D retries)
>  			test_mst_cp_disable(hdcp_mst_output,
> COMMIT_ATOMIC, valid_outputs); @@ -749,6 +815,11 @@
> test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int
> valid_outputs
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  	} while (retries && !ret);
>=20
> +	if (data.is_force_hdcp14) {
> +		for (count =3D 0; count < valid_outputs; count++)
> +			reset_i915_force_hdcp14(hdcp_mst_output[count]);
> +	}
> +
>  	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
> }
>=20
> @@ -875,43 +946,65 @@ static void create_fbs(void)
>  			    0.f, 1.f, 0.f, &data.green);
>  }
>=20
> +
> +
>  static const struct {
>  	const char *desc;
>  	const char *name;
>  	unsigned int cp_tests;
>  	bool content_type;
> +	bool is_force_hdcp14;
>  } subtests[] =3D {
> -	{ .desc =3D "Test content protection with atomic modesetting",
> -	  .name =3D "atomic",
> +	{ .desc =3D "Test content protection with atomic modesetting with
> HDCP1.4.",
> +	  .name =3D "atomic-hdcp14",
>  	  .cp_tests =3D 0,
> -	  .content_type =3D HDCP_CONTENT_TYPE_0
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
> +	},
> +	{ .desc =3D "Test content protection with atomic modesetting HDCP2.2
> with HDCP2.2.",
> +	  .name =3D "atomic-hdcp22",
> +	  .cp_tests =3D 0,
> +	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
> +	},
> +	{ .desc =3D "Test content protection with DPMS ON/OFF during "
> +		  "atomic modesetting with HDCP1.4.",
> +	  .name =3D "atomic-dpms-hdcp14",
> +	  .cp_tests =3D CP_DPMS,
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
>  	},
> -	{ .desc =3D "Test content protection with DPMS ON/OFF during atomic
> modesetting.",
> -	  .name =3D "atomic-dpms",
> +	{ .desc =3D "Test content protection with DPMS ON/OFF during atomic
> modesetting and HDCP2.2.",
> +	  .name =3D "atomic-dpms-hdcp22",
>  	  .cp_tests =3D CP_DPMS,
> -	  .content_type =3D HDCP_CONTENT_TYPE_0
> +	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test for the integrity of link with type 0 content.",
> -	  .name =3D "lic-type-0",
> +	  .name =3D "lic-type-0-hdcp14",
>  	  .cp_tests =3D CP_LIC,
>  	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
>  	},
>  	{ .desc =3D "Test for the integrity of link with type 1 content",
> -	  .name =3D "lic-type-1",
> +	  .name =3D "lic-type-1-hdcp22",
>  	  .cp_tests =3D CP_LIC,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test content protection with content type 1 "
>  		  "that can be handled only through HDCP2.2.",
> -	  .name =3D "type1",
> +	  .name =3D "type1-hdcp22",
>  	  .cp_tests =3D 0,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test the teardown and rebuild of the interface between "
>  		  "Intel and mei hdcp.",
>  	  .name =3D "mei-interface",
>  	  .cp_tests =3D CP_MEI_RELOAD,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test the content type change when the content protection
> already enabled",
>  	  .name =3D "content-type-change",
> @@ -920,9 +1013,17 @@ static const struct {
>  	},
>  	{ .desc =3D "Test to detect the HDCP status change when we are reading
> the uevent "
>  		  "sent with the corresponding connector id and property id.",
> -	  .name =3D "uevent",
> +	  .name =3D "uevent-hdcp-14",
>  	  .cp_tests =3D CP_UEVENT,
>  	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
> +	},
> +	{.desc =3D "Test to detect the HDCP status change when we are reading
> the uevent "
> +		  "sent with the corresponding connector id and property id.",
> +	  .name =3D "uevent-hdcp-22",
> +	  .cp_tests =3D CP_UEVENT,
> +	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	/*
>  	 *  Testing the revocation check through SRM needs a HDCP sink with
> @@ -937,6 +1038,7 @@ static const struct {
>  	  .name =3D "srm",
>  	  .cp_tests =3D 0,
>  	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
>  	},
>  };
>=20
> @@ -945,26 +1047,31 @@ static const struct {
>  	const char *name;
>  	unsigned int cp_tests;
>  	bool content_type;
> +	bool is_force_hdcp14;
>  } mst_subtests[] =3D {
> -	{ .desc =3D "Test Content protection(Type 0) over DP MST.",
> -	  .name =3D "dp-mst-type-0",
> +	{ .desc =3D "Test Content protection(Type 0) over DP MST with
> HDCP1.4.",
> +	  .name =3D "dp-mst-type-0-hdcp14",
>  	  .cp_tests =3D 0,
> -	  .content_type =3D HDCP_CONTENT_TYPE_0
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
>  	},
>  	{ .desc =3D "Test Content protection(Type 0) over DP MST with LIC.",
> -	  .name =3D "dp-mst-lic-type-0",
> +	  .name =3D "dp-mst-lic-type-0-hdcp14",
>  	  .cp_tests =3D CP_LIC,
> -	  .content_type =3D HDCP_CONTENT_TYPE_0
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
>  	},
>  	{ .desc =3D "Test Content protection(Type 1) over DP MST.",
> -	  .name =3D "dp-mst-type-1",
> +	  .name =3D "dp-mst-type-1-hdcp22",
>  	  .cp_tests =3D 0,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test Content protection(Type 1) over DP MST with LIC.",
> -	  .name =3D "dp-mst-lic-type-1",
> +	  .name =3D "dp-mst-lic-type-1-hdcp22",
>  	  .cp_tests =3D CP_LIC,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  };
>=20
> @@ -977,12 +1084,20 @@ igt_main
>  		create_fbs();
>  	}
>=20
> -	igt_describe("Test content protection with legacy style commit.");
> -	igt_subtest_with_dynamic("legacy") {
> +	igt_describe("Test content protection with legacy style commit with
> HDCP1.4");
> +	igt_subtest_with_dynamic("legacy-hdcp14") {
>  		data.cp_tests =3D 0;
> +		data.is_force_hdcp14 =3D true;
>  		test_content_protection(COMMIT_LEGACY,
> HDCP_CONTENT_TYPE_0);
>  	}
>=20
> +	igt_describe("Test content protection with legacy style commit with
> HDCP2.2");
> +	igt_subtest_with_dynamic("legacy-hdcp22") {
> +		data.cp_tests =3D 0;
> +		data.is_force_hdcp14 =3D false;
> +		test_content_protection(COMMIT_LEGACY,
> HDCP_CONTENT_TYPE_1);
> +	}
> +
>  	igt_subtest_group {
>  		igt_fixture
>  			igt_require(data.display.is_atomic);
> @@ -992,6 +1107,7 @@ igt_main
>=20
>  			igt_subtest_with_dynamic(subtests[i].name) {
>  				data.cp_tests =3D subtests[i].cp_tests;
> +				data.is_force_hdcp14 =3D
> subtests[i].is_force_hdcp14;
>=20
>  				if (!strcmp(subtests[i].name, "srm")) {
>  					bool ret;
> @@ -1015,6 +1131,7 @@ igt_main
>=20
>  			igt_subtest(mst_subtests[i].name) {
>  				data.cp_tests =3D mst_subtests[i].cp_tests;
> +				data.is_force_hdcp14 =3D
> mst_subtests[i].is_force_hdcp14;
>=20
> 	test_content_protection_mst(mst_subtests[i].content_type);
>  			}
>  		}
> --
> 2.34.1

