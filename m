Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCF2D2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 03:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71ECF10E0A8;
	Tue, 20 Jan 2026 03:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtaT4u3O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE4510E0A8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 03:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768879131; x=1800415131;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AYeYPKYgTD+YtDY7VY5uALbMJM4aywIGTrY+rvoaz9I=;
 b=PtaT4u3Oojq+RRjScWRhF+wAYBwUR8KRZsMnSiFjm2we7kbVmoHKiMDg
 x0I7TujSokhWqNvVoXgAcdwFF8saUVL0hS7Ed9DMis6rH/WKuzD4q9l/q
 /RD0JMSncFyrSu4B4E/V53al3lZ5VVG8NJYE5iAQZdnlBGpyristjTKat
 KYrBnqNdwqtVc3+jlXzjedp2/Rl1HGWNwhVPfO1ZFlqb3wcgF3OQOVgtt
 aqfO15Cjn/Bx/EGkW/3vMNh6N1/GcpYUMJ3taHVmY4hYbbibHmWorae0B
 wNi9lLtBFi6Ose8Pr7RmHzT1v6ONCD+xYBfraqm3y/pDB85UbJ/u0YVFK A==;
X-CSE-ConnectionGUID: 9VR0TnNeSJSAixq+4iswkA==
X-CSE-MsgGUID: 1KCLnoiJQGCleLkg4EHu6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="57640198"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="57640198"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:18:49 -0800
X-CSE-ConnectionGUID: F1PZq7cQRr637qN7c6I3ZA==
X-CSE-MsgGUID: pDg633qGSTO8DeiGLUjcKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="206352293"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:18:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:18:49 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 19:18:49 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:18:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPLFQ3klvAXkETXFTpnwwS3U+ZQaF/hDGz1V+eozsngX5ldF3TfVn+fSjOXxX3i4AAJk3EaOfrWiuoLTVZhVSTmsREFv9q0wNOHP6a814/3/GdWJgt468rpvH/1srOaxsBn1MUKz+V7bA5QZ2vO8WnbLOIyitt5q+gZVeF8AKhzyUKMm1Qk5pe2Tcd+Hd5tO6lo26fJXJbRCUB8cflMWF/Sn6MpDYCvDKn51If0M0VB10YxjzJF8CvhUWFQlt2WTHBJPWElTQTRSsdLo658RnPCvbB7AMIumJY+UmcYo84P9lfhJYvQgv9aYBpoWyj9NBIKIoeaw0Svn8V1IzGEyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nu85MNUKBbbxbmh2qW4WFLfnj142dz0/CkOz9W6msb4=;
 b=bwlktChhG0gOP2tYavjnH24WlGJrupy1jdqwl6+eR/vvO6pGehv1JxxM79ZEdr5n/jxb9Vut79uHwcFLkmBA/6bPGClB7Tm4Pyr5PPU89HuK5GjvTJ1eL6CTRPZ0STeQAfQmbEV9FU3e3rwg/Zb1ZuaXAh4bxJALVbtG2sog/uEBIE0xPDYEPxmVcOKFZcdyPFI/EzAEQgVRONtr2ndlf0F19kz6BFeff4Ipc7bAqvI+P0f+pPBfp1KyQRzLT8Z+OGxFy7Q/UUHedRe8tnUYSFHU/CkqW00OFKMaFgkzDoAsIjkV/BeIftUn4qjM1K1EWkiQG4RgNhlaSyY1XYFlhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM6PR11MB4579.namprd11.prod.outlook.com
 (2603:10b6:5:2ab::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:18:46 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:18:46 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v6 04/10] tools/intel_hdcp: Add helper to get HDCP
 status
Thread-Topic: [PATCH i-g-t v6 04/10] tools/intel_hdcp: Add helper to get HDCP
 status
Thread-Index: AQHciUAdBe3Ol3XwEUKIe2G8ipWiubVaY1tw
Date: Tue, 20 Jan 2026 03:18:46 +0000
Message-ID: <DM3PPF208195D8DABEF51A62D99B1D15B99E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
 <20260119123142.504623-5-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260119123142.504623-5-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM6PR11MB4579:EE_
x-ms-office365-filtering-correlation-id: 34dc612f-1e7f-4bf7-5e18-08de57d29fc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?pfgeBRi+jcZqxT6PEQLRJP5dNnqHHkZp+KsVbXGv4atu5dXvx5mz/+6OqvAm?=
 =?us-ascii?Q?5Hx6+5tLswW4fu35jVHN07zDTlQGruY22368sdcNaA8PrXeu1wN+sREFQb/9?=
 =?us-ascii?Q?RgWu8PHBuLtPh2dlgGzrERnWALlLPjZbHHfqauby+thw7hCxa3jwetLkHBq+?=
 =?us-ascii?Q?2GeGTKx8/es/tot3x4ILwooQY3kSBbwy606huKIe7Zb3nrgFONQY/Snzteo1?=
 =?us-ascii?Q?wdFZK7U0D32p7yAIo+/iikYFHVqoh7ZSSk1Lw3ZBPN8SQsjUQhsAJDQb+ruw?=
 =?us-ascii?Q?uCXVKq18rK05tVZWR4+B1oRnwgSQ3P6j/3vIWBYvKfjvHM//44mttTgbvktc?=
 =?us-ascii?Q?m+3uo67LfPD5oV9/MS5RgOZMc3L2Nj+bk32ibxXzX6lRxEFZDHJaiWVP8OVe?=
 =?us-ascii?Q?3RPgSi6IpCMyAwXxp7zAfQDQesoaOcZqUh+E3Ouqd9mlYnj7A65oK0UioDpl?=
 =?us-ascii?Q?70cJJLP7LVc2qaFk4/hCmY/AZIptsfh+AFAVFZinldzI+vgXbgmuXPMfVRsD?=
 =?us-ascii?Q?GVb5moH2cCZ4TnnDcDALhN/GMY5TJk93FkWVRsHLtc218Ut+YnRNIG6MOWkB?=
 =?us-ascii?Q?aylM5ZSgyc/VNY4PoCoJ95RSNKsbSqHmDkFHS5Kd56ysT/xWUTSvbmxQkj7e?=
 =?us-ascii?Q?DHOzBPdWnQc9EDVVmkllmnLLhI4wtdyGDf+u4hngxco3B4BvkOCxzTV8cm7y?=
 =?us-ascii?Q?aatLeVv3DQvQxOPd56AGGaVlBxUsoReiHPLKEUcnEXoG0B7dYvFu0XncS+9t?=
 =?us-ascii?Q?8VnGulyr553C0+3eiT3CpAru/jndZWBAeqd7GTSplmyvO+/KP3Y7NFiv6rpq?=
 =?us-ascii?Q?WtMkzIeZ+W1S3agndKVZvFgMHO/zYnQwjciDdxd9r2ouJLpylHSpa8k/I1+W?=
 =?us-ascii?Q?Zrp/DIvtUNehmDGAz/klX9bxZc6iECvxeTNTtyzpRRSBgB+pmYdZ//W6LP4j?=
 =?us-ascii?Q?Q2imnWlGWztFFfhDyZuM9Z3ZIIqLnKNZvTCYtMsUMLyGXtvNGVXUYrXzBUdI?=
 =?us-ascii?Q?M+7ohAcII6ylKUjFz2swkCAWeZOXsbpMBnBP47usnTXfUuJeJyDdaFW7UQf0?=
 =?us-ascii?Q?OlBwVK94fA0h5Ss5p9rmyHeDwOwD1iSNTEnYw35JvLB6aAu8FYhw+t+h7YG5?=
 =?us-ascii?Q?rEobNyswLfy2SSCSlaS5zTAo6v7Sk6CCG6i6xRuIplt1S/x7CAtLNRyGDyTE?=
 =?us-ascii?Q?hQgKkuBiwe0NzVKvRgYUu/bjUeeEmY0xkLxucsOLuyJ8uQNtMfQRvz7jdxee?=
 =?us-ascii?Q?q4M9YZQFtpgBRQJpykuRRJSPLVkSshy/y6aFoczSwNPuZCQ8fKpYDeyXOec2?=
 =?us-ascii?Q?InOOAEnlBy/L5BbBROx9ZNLrg15JZ8A/iXDzRRarZbjf8cCZBfiD3SC2NE+M?=
 =?us-ascii?Q?7DiWJKioEyjk2K3ESZe4Tu7Pf+IhaFAcqX38KXpoHIPHT4nNw+br3y9heqN7?=
 =?us-ascii?Q?u5j8z2u6wz+EDH4bWd5WtEUoJ2GZIHul09FV9iA9cygbWcAlISojRLIbYJ/a?=
 =?us-ascii?Q?a5yH/J0i+Bbf6r3urVnSEGT+HWhSz9hrrjysMIGO2ylI0yLwHFxOqhjW1j6g?=
 =?us-ascii?Q?HqKb1S+NnK5rZKz3WQcGtV8nxjMEVopOhqqGf0ydBFX9/W+Y1O/HVsjs0LKu?=
 =?us-ascii?Q?lOVih0lQr5z9XmZQpLgnTDU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GafRfZEGuKjNIm6MzV0FHzdRmDPIYKHcffXNJcHg+yhkd5HXevkkeOlcJ2nK?=
 =?us-ascii?Q?ajQDHHDB8XX0vQ3A4MkGPvsiG9FDkSEqfgjYZHgNq0f7X6ZkOMH3Zlpg4iPh?=
 =?us-ascii?Q?SCS67O8XXfbYIiBiwtPxUUidCk+HpzF/HLG7EDlaDoNN14zw+9FmzpXCZi66?=
 =?us-ascii?Q?SI0pxL4KG8Mx6komvHS38tc2AM97rQImmoIZX2KXM20Bl2yzt7Y6iNVfbHax?=
 =?us-ascii?Q?vW1JWy1ecgLlRUZPnUYJkM8aEn60qIHM36ycKVsSbJz9oihcDEi8oKt6s4SU?=
 =?us-ascii?Q?ykARIajA05IDb1Q+CuTdczNwINjLmv9tTYMPE7Zu7oz+N/H5vuY9j8MF6uX2?=
 =?us-ascii?Q?F3Kz2cnqa8ETjoXe35d4mQt2muZEC6u7hsdCO4oojyjBChgtX7iKOg1FYy9t?=
 =?us-ascii?Q?iL2grZxhFNzMLR4Y2Zgo+XhKiPADgVwJxKxamNA01/aVyShiAwR3/kP5+EIn?=
 =?us-ascii?Q?6qud3fquGwg92FxEkCjl5I7+F6DxkDeRGAkD75LhOdoQvWplBfE0yi1pW2Cr?=
 =?us-ascii?Q?MNr/+FUdoP6stPc7YhSgkHHtSSxY9L4RdgMpMEnYpInUDAnJ15g0pAJ5bv59?=
 =?us-ascii?Q?LvMOvJN3Iaeu14yavPCEYtLS68uvyTLkxLdLHejSd7itkPweqGag3e4uxAne?=
 =?us-ascii?Q?Fz74r3lCaw+QawmAPI5fqNgJrWZ8WpnxNBNnzmc5XmqGU4qbsSkCFtHdbaYO?=
 =?us-ascii?Q?wsN58VWxKxF21YtGue73CY7ZU2nucCaMA1IJk+85//RttvLzCou8pm8Ws6WK?=
 =?us-ascii?Q?K3tZ2sEZa9oXShbFPZjPFE4n6So98AcRtDSA7g8cBhhgFpCHrBAEDjYuo2V5?=
 =?us-ascii?Q?5uMSdPgCMli6HiB17QShr4MnLvvDgJtlvjQ/ERI5Sq+DQAgviwdg0B816V/+?=
 =?us-ascii?Q?kRXzf4fRZ8wTZASqobnAKJiioKY/F+v+OMa+WtXHbVqN0jOPNM+eH+IbeQnX?=
 =?us-ascii?Q?vHoXcPBfvnPD7iWqZ1yG/HHLcq9DjAnhH7I9Y0TZFEqrbaEI+Ujbvkzet3eD?=
 =?us-ascii?Q?6dNuHi6utHaCZqKkCh7tG0hbnVGYcXJ1usbY0VTHqx7IFP0IhHfREQVoLXju?=
 =?us-ascii?Q?Jge0KVdeATagwqo0iTOU+m0hV7sUJbY2hzwHxjKZYHVjSoCCo4MUbn3scr/d?=
 =?us-ascii?Q?QSmuVe8FqMjqRbPkb2fFiSfX1rbz2VH3lH50thmc43qlXl1bg8YYaTy1O2Xa?=
 =?us-ascii?Q?UtEIoF33UbHAzBE0GleXvWbsPBQOddtXklSre3goiMNuvOxy9hgDJAxYfPII?=
 =?us-ascii?Q?4+XQJomkAsOCPS/9c857TLE4mxKS0bLCYQmAc/98T1MJKTDPn91G0+ckuwab?=
 =?us-ascii?Q?kdi++j6BIVz/3Du40Gs634jOlxKRnDOx/Vxx5eGdg1kIis0uqp4wuco/aTDz?=
 =?us-ascii?Q?+qClIZLuMY27WfDLsgYi2IAIwzfxj+fwQWmldTxziT+SnCD2BMfTCD/jtAtN?=
 =?us-ascii?Q?YNRq63tYi3g4Jmf4ot1GnH/M6ZMZVI1iu7MabiI3mveBm3ifrj638I8gWzW/?=
 =?us-ascii?Q?Zos8okTHgUOwxGcAATjk8ETLXX4jqzv8T6G+1bfERXMHNFx/KilQFfHDMHlv?=
 =?us-ascii?Q?xL1bA/BkfKxHI07KTjc+OXQVsJ93Mc7nlEs9FQ9dqQfb8/mHnkRyyPSLqrDu?=
 =?us-ascii?Q?IdGWR5+V0JwgZuA7OrQwgvpHU3NNhKkj7y1bhDXSnxpwJKf9frgE6caHPVv1?=
 =?us-ascii?Q?FB2AM9xB3LWZDFp2r3ebWuOPm6wT1QDKRblJXIKcwRDNyTiqKbwvuq7m5UJ8?=
 =?us-ascii?Q?hKK7/Bp7wA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34dc612f-1e7f-4bf7-5e18-08de57d29fc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 03:18:46.7914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tbjkcf40ecXDJ1DOJGNkxhpUfN2QkvfQErVlPrAtgHnu1783j8P/Pjw362PJyNQ2EPcpVbulKQChoFGPo1qsjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4579
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

> Subject: [PATCH i-g-t v6 04/10] tools/intel_hdcp: Add helper to get HDCP
> status
>=20
> Add get_hdcp_status() helper to retrieve the current HDCP status
> (Disabled/Desired/Enabled) for a given connector.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> 082dd98f6..fcb746b6e 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -79,6 +79,42 @@ static void set_hdcp_prop(data_t *data, int property,
> int type, int connector_id
>  	drmModeFreeConnector(drm_connector);
>  }
>=20
> +static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
> +{
> +	drmModeConnector *drm_connector =3D
> drmModeGetConnectorCurrent(data->fd, connector_id);

Same here rename to connector.


With that fixed LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>


> +	igt_output_t *output;
> +	uint64_t prop_value;
> +
> +	if (!drm_connector)
> +		return "N/A";
> +
> +	output =3D igt_output_from_connector(&data->display, drm_connector);
> +	if (!output) {
> +		drmModeFreeConnector(drm_connector);
> +		return "Unknown";
> +	}
> +
> +	/* Only treat disconnected connectors as N/A */
> +	if (drm_connector->connection !=3D DRM_MODE_CONNECTED ||
> drm_connector->encoder_id =3D=3D 0) {
> +		drmModeFreeConnector(drm_connector);
> +		return "N/A";
> +	}
> +
> +	drmModeFreeConnector(drm_connector);
> +
> +	prop_value =3D igt_output_get_prop(output,
> IGT_CONNECTOR_CONTENT_PROTECTION);
> +	switch (prop_value) {
> +	case CP_UNDESIRED:
> +		return "Disabled";
> +	case CP_DESIRED:
> +		return "Desired";
> +	case CP_ENABLED:
> +		return "Enabled";
> +	default:
> +		return "Unknown";
> +	}
> +}
> +
>  static const char *get_hdcp_version(int fd, char *connector_name)  {
>  	char buf[MAX_HDCP_BUF_LEN];
> --
> 2.34.1

