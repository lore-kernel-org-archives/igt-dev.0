Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63F5C83F26
	for <igt-dev@archiver.kernel.org>; Thu, 24 Jul 2025 21:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E42010E0D5;
	Thu, 24 Jul 2025 21:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eruD/exs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E23A10E0D5
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jul 2025 21:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753392152; x=1784928152;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oV0dvKp4PazWRPHUytrtmWEenoK8ZY6SfxAfhtXdzJA=;
 b=eruD/exsslexINugKeXqzsquW706VrQQoQAIkujF8FmFVjtxmdWfPi2e
 Tn0mlYfZDGyj49zuzBV4hyoLoA7ulEppreIjUvvnBWW0sTrk3uZVqmm8t
 H9JUIW3CPGAWlA6i9E0eFF/+/SQ22XbhcajAWi/Y8/+JPukgFy/aY8/Zw
 IdDbP0Y7WdnHwsCXCWjH1hv1oDwp27WPK5UGffvwBSTSLu5LlRNnpIFt0
 9SE2jfVgCtQi7VzT1CklhYIvV7yScUCfR0xYBHEZHHqkWzJAZMjOecrC9
 e87c+CGpm5Ub0qTu2zmFbm2rpO1nAs+t0AS6IZmzFC5x3bMFLo2SFdNZE Q==;
X-CSE-ConnectionGUID: Xbvs6+4HRRWJ4yRxfpVZUA==
X-CSE-MsgGUID: fFfXi7umRqm8x+FJGl4fBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="67162049"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="67162049"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 14:22:28 -0700
X-CSE-ConnectionGUID: SifgLcZ1SlquM0L270DhCg==
X-CSE-MsgGUID: w+V4o5NaS5WTAQ3ZtYGM/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="164500931"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 14:22:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 14:22:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 14:22:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 14:22:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQyRcbQRXwIwceagNIe/Hp/Yi8Y6f73M/xwHdigXE77ZPRVNRsFP2Wn0NiYofdtphLYz6mf0SPA1LVkvyBJ7nXZU6uziOcXd6efaepxY6MOYD2FbVGV0Z17fdIcfcr8R8D9aQRgDT2d5NCaGS36rsQ3XG3snMXqEPbYaceay0VSRF1z0Sl+MtmKJf9j+HrMlX14onvSuMzgvOtk76UaqIqsIUzX9d9gGHSsn/l5CmO3EXGpd560EHYSLGV8FkgdgJAS4P0fe8vVRZ/toIm1SMuPcRszb12e8CR5h5j3YpohneG+SI9uR5xDK1BDe0pkh47ZBfah3Zpl/AU3XKsHNjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BY/2V62gPEHLLu2OiIDvSCOHhnXJ2qfhObVQWuUf2Yw=;
 b=Zah9gF1QmeVB/RGAiBmdxIm/0pboZdE6i3eGMIiJlS1UK0phms/gAi+vu6rqBqt3XY/GRcIBpIUlRR9JzYUED0K0QYftl2Nw+BbpkdNXdAPvx9dQUr79+r0P7AEPhzNWGej4xgYrRZV+YrdM9e3q/mzdgJOH0t1sPWTwH9EIJQt2eJmWG3WdiIs+MvlN0vubADTnwyNYOooi5askAqKeleshU5jmMRwNFhjJhl80wColRJ3x26Ni81gcb2MTvKy7XqO/7Pcq+JC4UmOwnyP34ULy6ra7axZIZxrf/OTMK+eq4mhwkzTjUuGXt3U6OJRJ/qJZigDHlm35m0rYwE+ZPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by SJ2PR11MB7599.namprd11.prod.outlook.com (2603:10b6:a03:4c6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 21:21:35 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%5]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 21:21:35 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>
CC: "Purkait, Soham" <soham.purkait@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tools/gputop/xe_gputop: Keep engine activity
 percentage between 0 and 100
Thread-Topic: [PATCH i-g-t] tools/gputop/xe_gputop: Keep engine activity
 percentage between 0 and 100
Thread-Index: AQHb/MzVMB4g6c3CrU+pxTHX0PfDDbRBwjkw
Date: Thu, 24 Jul 2025 21:21:35 +0000
Message-ID: <BL1PR11MB544584E2D9C75D9DC47B627DE55EA@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20250724185040.3163412-1-soham.purkait@intel.com>
In-Reply-To: <20250724185040.3163412-1-soham.purkait@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|SJ2PR11MB7599:EE_
x-ms-office365-filtering-correlation-id: 4fbceaef-9b54-48b0-a236-08ddcaf811d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?L/TOlUhFkV6gD6c8XyLAzlux+JRTmq5SuG5JzYUAof+Y8ZmMiHn4q8gAmrwt?=
 =?us-ascii?Q?h12ewpgB3Mcfm4OAza7YhTrR/bRk8Xyix6m/qwxauVemidp2Y+0dL5yJI/W9?=
 =?us-ascii?Q?tPPlLnBx1+6KjeWr6QpEX2r9us9LpqS5LLeXtWGnVbFyW04FYMhI5WNwbOU4?=
 =?us-ascii?Q?xRI3QtoY4TS1GjnQ65ejTw007EQ9R97D7ZziJ5Y1E6KndhJDx11VcsjTNL28?=
 =?us-ascii?Q?3DwHcLGTrH2IMp2D0tMJmOtB/N8mpkPT0Nm0Ci4vop9AyakIprfj4ureg1GC?=
 =?us-ascii?Q?ebOuGRrsKkn1LfFQbwDtkUJLlXzov/DA/9Zwi/whK/lz3UWN/Es8wsV0KBH/?=
 =?us-ascii?Q?kfN978aRicz9I2AOnssoK4QLQsJxAhB2b1VoYF22hXFNyYztXbbM0mrEYgTh?=
 =?us-ascii?Q?PV3DugWHUc5iG9YMFjcjlaIWgfcx7EtNDz1rsrK2e6hk7znveRED1GgQAX/r?=
 =?us-ascii?Q?C2ohLNeTr2vFZQ/ogumcX9HD3mFoRV6iBg/UkIDf7kFBz/fGuWbmRpSUPMFa?=
 =?us-ascii?Q?o0iXVzAAJfG9ZWfwrf/NSM0+yEepsVtcB5Rb/Si3dzepmgaPJ8Gx/tvC6xkg?=
 =?us-ascii?Q?hDbsptDmtdNJV73VROXkiQGiqBJFNHmAPm3HTwAnwn/6lXIk7O1V+zYqWmt0?=
 =?us-ascii?Q?2D2szWAVrJOc8HWeB5c6eVriWZTA5g2rsnOnuLdMcaotDJoDDT6xMo9Itr5w?=
 =?us-ascii?Q?noAcDzeDkkFSxiM/2CluWQQVoGdtonDQW5PDeIQ+uUYZzqInp6hpngwXZyw1?=
 =?us-ascii?Q?qKVjH8S4A0dvP+xmtS0ZregIi6JpNX9zqvLT2rn080mRQGVDcI2IyJKcMlxv?=
 =?us-ascii?Q?9bU5gXsbDh7doCE1gM/mbv89ZbrCHU17i+5RBS2jK7kefMHaZaFDx5dzoa6k?=
 =?us-ascii?Q?W1AF5EbmLDMGAXtZZmpjeOyDzvC2Td+fvTZNCEX50eO8clyJDjeT1jSSICBL?=
 =?us-ascii?Q?9H1hQmj/F6/aXYTZWqbYpvIUUDLH3jn14rivSUVdcn72kVurIfDNNTnL5B1w?=
 =?us-ascii?Q?aABo0jMb41Wpxour22mNRvmjDuFlmqLY/dfGEVxaAOADi9VNl7vWMOD5bCXD?=
 =?us-ascii?Q?eLa06u4R/1X3wg4KfuFbl3ELrAT1GlrZpegUHq6IolkF2lHxNGNQOa/nSVPW?=
 =?us-ascii?Q?51uBSdh41gICiX4DBJNl9iFrBETj3ztiHtT5BTH6wOjMwwwPvTT2X+j2vtvU?=
 =?us-ascii?Q?KLstaM+V4TAlJNBuNHcrRIwjdOUnMJMdmDcxmxGe8cPwi46lBhoc2oa9ppiS?=
 =?us-ascii?Q?+8jsNHPRIZxLGMYM4t8J6Chk5UGLwF/IyoE4KAp8M7qvsEvbEYUQy+RZMHsA?=
 =?us-ascii?Q?s4lHGS43aW3pPIG3VJMxU+PIXzyXynmb5G86xPVIwC6fkRVYqaPOXKC6UPud?=
 =?us-ascii?Q?hbJqNN1rmN5xMo2JPWiSKkbfTwYi2WGo+i+DXxATU4kHQbQspu9zOXFBdQ8s?=
 =?us-ascii?Q?k+GMhTCdUsglWiamhrNlY3rplMwW4JWKnzh46XR/WQChm/CphCJVFw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HSKxNsqAR76rM3xTZ79XwjV6hMdkrw85iQYj4+f1caQXQ1sW1Y55dm/aOTnc?=
 =?us-ascii?Q?SfVmZyX3wr6aboFpWuUIdcVbYVnoaj/JZHKJEu3ZSmuglmB8SWyPhrTrvIMO?=
 =?us-ascii?Q?YvGM5hcChXEdyIhdqbRLaKqmzJbNk9LJOBzIaqSBUdXyzY+gBMgKr6lxxGfQ?=
 =?us-ascii?Q?OZMZbQNj7Zt7BfFN1+dg5pDNhhXbrOrbbb+NDUt2wcZuBvHCzawepeIL3xsT?=
 =?us-ascii?Q?OT3RrQHxMrXIKY1jA+ruPKAe4VRaNfCyOCDMXkmjR2EpsO0wIAM72+W8OF19?=
 =?us-ascii?Q?ude5rT9D480L/l+5oFs+MbeosXUxBOqd5TXQtVKJWoUx4To21yP7hThNkOQ/?=
 =?us-ascii?Q?qlZJbXdF+CXRn9g+9prdpLjCa4t2ATWA7ifefc3mfQYWxXK2ptno0G+VT6nx?=
 =?us-ascii?Q?pd6FM5hGCJ5c1XLKTdn9vGjiRpIrFaM3s1C+cwiTmwjrL+vA1j+MTerRfvJ/?=
 =?us-ascii?Q?ebizQbh8NCqvdljr1qP9tUUWp48Bqlb9m16yCW8ZEdUe0Gg6W7VtGTSvaoHQ?=
 =?us-ascii?Q?ByGcbKwn4dz3Wy3y9Y+zsjx8jfBEVGnncTSyVaYlZCeRr7LB2qGq/HsUDUZD?=
 =?us-ascii?Q?t2UllB95gbwIQrCy89v7TRs1xT527K9J7Gd9rX02M00joCbragJLIRvH6C+N?=
 =?us-ascii?Q?tqXdg1/Ld+mS3Ev7Zc91R3qt+QntrC77u2lsq6uhPbSJR0CjcQxI0vbJGSkZ?=
 =?us-ascii?Q?FBXGpjEyP61nITnBJ3FdwU3GOVV1T6hIEfKYxcDk9rfZvoTQgo6dqH9BqRNt?=
 =?us-ascii?Q?P34ROd/905FAkDohGCOBIlZdmJo2ZVnuS46DkGYAL8mQwec74lV8dYjqfaJ+?=
 =?us-ascii?Q?jiEPtUm7qKqNQn78BsV9HcL1LvVeTiPAXgoCV/2BL661SS61NSQZNvlLiDi0?=
 =?us-ascii?Q?Js3mTFkpop6q8a7qydayWV6vm3CoogcqAQbVwQ7IeS3tVwhO3nR1Z0bwxDwT?=
 =?us-ascii?Q?MkilANHSUj/eD7QpgaDw1OwySslNgEYQDGMyQoqTaxs2jRUB2Am+S9clZFO2?=
 =?us-ascii?Q?J36T7S+zD3umCJUafkauFOSpeZWJhcyRBA0YQ2dYNWQdV4wZIr12qZQOyr3H?=
 =?us-ascii?Q?jdtfrd3W2OTW2xWVRTdNHjrZxvNJd6OFtKrIT4rVCMVIpy/A+TObWG1IxTbA?=
 =?us-ascii?Q?cWZ9ERdGVeVMFVA0a0yQUOYu6s3Ew9VVe7lXX6cJ37YQGKCyr0F9LfhPSjY3?=
 =?us-ascii?Q?GSvTF4YmxLrXRJvTn3JdTI5QifZcKjJn8jwoA8UcN/toC3QaLDFPgVI1c34A?=
 =?us-ascii?Q?JJ7RuoRkuHG+O5dkNBitI276GfEV9DTGCB/tsVAyvMXnCK7USn0BMQijBoD6?=
 =?us-ascii?Q?Qv09VE+LjtA7R5nreLdrmnyX8zW3Ts/VGGfsv6JUtrkPKOVxjfbHzNjr61CK?=
 =?us-ascii?Q?VTajz8QU2reIfeHtD8ytEmv2U4COOquHNO7/u7n6/FAcve2I1M/JpwQDTTpH?=
 =?us-ascii?Q?4EdEl1ZqOU4FAx/VaWVg9zCTpcCSWaTnO1Yi5i/NLem2Z9daOXm8Gv7DNOXk?=
 =?us-ascii?Q?xJA1+58MQ7phpyraZxuWATZxCajr3gHjlRt1Xe6rWDVrGTag3Z5alMcywLql?=
 =?us-ascii?Q?PSUnyG9b73ZhPZJBI7P8i/78UulTSijEtkpgubKT6rDdV1w6RYvolrW66qdi?=
 =?us-ascii?Q?NFNdBEgVc7pXCRUtQfoW9xzwlYRkz0DFbCfLeLiueVJn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbceaef-9b54-48b0-a236-08ddcaf811d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 21:21:35.6041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A9g3FoAdDXkFlWX7AdjzYGMDGEe0m/eHXPqvSC90d50eKH4IhHvj36d+81bwENsLbHW31by8xS4sISORTeZgXEEEJ71cwMFTovcBlXR0pL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7599
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Soham Pu=
rkait
Sent: Thursday, July 24, 2025 11:51 AM
To: igt-dev@lists.freedesktop.org; Gupta, Anshuman <anshuman.gupta@intel.co=
m>
Cc: Purkait, Soham <soham.purkait@intel.com>; Tauro, Riana <riana.tauro@int=
el.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tools/gputop/xe_gputop: Keep engine activity percent=
age between 0 and 100
>=20
> Engine activity percentage within the valid range of 0 to 100 prevents


s/Engine activity percentage/Clamping engine activity percentage to

There's also a nit below, but it's non-blocking, so:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>


> out-of-bound values that could lead to undefined behavior during runtime.
>=20
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  tools/gputop/xe_gputop.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> index 9757369a8..ced427c0c 100644
> --- a/tools/gputop/xe_gputop.c
> +++ b/tools/gputop/xe_gputop.c
> @@ -281,6 +281,12 @@ static double pmu_active_percentage(struct xe_engine=
 *engine)
>  	double percentage;
> =20
>  	percentage =3D (pmu_active_ticks * 100) / pmu_total_ticks;
> +
> +	if (percentage > 100)
> +		percentage =3D 100;
> +	else if (percentage < 0)
> +		percentage =3D 0;
> +

NIT:
This clamping operation can be compressed using the fmin and fmax functions=
:

"""
	return fmax(0, fmin(percentage, 100));
"""

However, it's not particularly important that this be compressed, and doing=
 so might
obfuscate what the code does (on top of possibly being slower due to the fu=
nction
calls), so I'm fine with either way of performing the clamp.

I should also note that we normally shouldn't clamp the percentage like thi=
s generally,
but since this is just a helper function used to pass a value into a pretty=
-print operation
for data visualization purposes, I suppose it's okay.  On the other hand, m=
aybe we should
be printing the true, raw value separately?  Maybe as an extension of
print_percentage_bar?

(Though, I guess at that point, we'd want to do the clamping there, rather =
than in
pmu_active_percentage...).

Sorry.  I'm just thinking aloud.  You can take this advice or leave it.

-Jonathan Cavitt

>  	return percentage;
>  }
> =20
> --=20
> 2.43.0
>=20
>=20
