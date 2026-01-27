Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33F4D2D8F9
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 11:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F28710E51A;
	Tue, 27 Jan 2026 11:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4ZxVxBf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35A110E51A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 11:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769511781; x=1801047781;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SgIztCxCm5Q0TgHgAEs1pDHNaIk09ATOP/ABqRN1dSQ=;
 b=X4ZxVxBfYS2cQC7ll2MrPJreFUW1HkZ/cJV9pbVlWy2mzpL4eaOq5Rd0
 tuCMlFqkGjfrTZzpVqE36JMhCCwSKuI0SVgKJTj97+WxQpwx/UbMyDcb+
 OTrBAb7gZFSwwIvysWZC3MZ2rAUbmJSTryamybpQj3y/JItXr9RvBvjJW
 mHtLckbUhf4KcnSlOi5BYITuhVAhYwveL/jMM8fScUScrGLy+I9oz1L/o
 8lf9LRtiTSdHQnrheeMtqEWXtimQ7OM/Yg0zex7AwL4jZ/RSazqv3miBZ
 ctb+PXWd1XRTjpZhxiO3tHNMfldMml3JtB8jYHOfXMKSsy0QAO4xphTXR g==;
X-CSE-ConnectionGUID: ABBlHH/RSIu636yfQcxpNA==
X-CSE-MsgGUID: Fsjsrw2CTjqofpdY1lWEyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74566670"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="74566670"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:03:00 -0800
X-CSE-ConnectionGUID: g8PDJ/AyRwCLtIEtlngnew==
X-CSE-MsgGUID: Simx1e7kQ7q7OV/s/SnqSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="239214516"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:03:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 03:02:59 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 03:02:59 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.27)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 03:02:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDId+9xErY1xujE4TLJ8eTynwoD69tSV6Bm1voM0lO3510Ytw4WipxL2NqUWzj/bpH57Y5xiPz6CRlTMsYeWzwbKO1r2k58ibaHPaiwY0z4fqYWXqZxzBgHpzYZEYwaUwn3s5Swd6ovKQGwoRgg5CyxjlvUXPJu+BLlxXXO353v5IRq3/+VUPmmFGNxfeCUmMYAYL3Shuyzn8mgKkF6dQUdnU/NCHT0U7bLLyUWn0IfC8/7jXwPtJ+ijSiE6250s7ckdjApHWEhftZ48cqpGQANG3hDfT79Vu9taMWvZgnFur2iDlowwDYaK5Km7l3/dCyluC+rQ5HeYtOpgrorLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCEhKwoRVg28YtkFqX0dAG3cx8mwKNcYgU4fBWfQr4U=;
 b=c2bieyaNFMobc8XgGiuaR1a8VLFjaZ76eTFaTUEMLNX7VU4Q8VDGqoxssyrI18KcFA+vPFAVJOmTlFLbiN/UpwbeYWMOZq9+bS93KwiM0lSqDJY4QJg6BHz5W0b4IsAAfzib6sO/6z1h28ekNgYBt/cEimPNWS5wdMABHvB7j5jspp6E5hQ93GhhhttX8FHc1R8hkbwDVG4JBBVV3kFFjIgvH9fZKsyqEO0/w+sHh7qgf8wM7TMzuvvMX0IpHyBO1Bz+V99Lo94sng3wBpDyB8+8TKDqmv8eRD4y/TD3Fg9T5GVRoeQPSLJRXF7wY+emS/20j99mpcNXpOmkhgaljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CY8PR11MB6963.namprd11.prod.outlook.com
 (2603:10b6:930:58::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 27 Jan
 2026 11:02:57 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 11:02:57 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v9 06/11] tools/intel_hdcp: Add helper to get HDCP
 content type
Thread-Topic: [PATCH i-g-t v9 06/11] tools/intel_hdcp: Add helper to get HDCP
 content type
Thread-Index: AQHcj3Hg2OgeqoKHmkmbJ588XFbY5rVl2eBA
Date: Tue, 27 Jan 2026 11:02:57 +0000
Message-ID: <DM3PPF208195D8D6D81D11D67257BC38941E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260127094257.572736-1-santhosh.reddy.guddati@intel.com>
 <20260127094257.572736-7-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260127094257.572736-7-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CY8PR11MB6963:EE_
x-ms-office365-filtering-correlation-id: 639bcc85-a986-4b35-303f-08de5d93a0d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?sPD1QRH6AePRoR29KAr0xBP/ydvnJUyAtfE8PtJGb8HlxThr3OTWBHEe6FwH?=
 =?us-ascii?Q?0PwE8BDrl2v+2vJe8Hi5GWRLOsFwxjcf8YeZvLmUFNt4AaTm0vKhidZ9U89H?=
 =?us-ascii?Q?VkhnO30gJZDRuQXCh92GiM2Cali9PebsFhN8EmyL6RdWX9FPNCddVhCygGrB?=
 =?us-ascii?Q?gr+c1Wt6cSCjJGXTOJC7TMOAvmiHbkNKiNhNuVrimvZY4Z0iwk2Ed3rbgD8M?=
 =?us-ascii?Q?TyTgmSHLRsfYiMrTTLaCED7DtTjTxBFygxxeQDkC8137uCWk/5APyuUiT7vx?=
 =?us-ascii?Q?s/RO7yjnydPAH7S0zeM5ouo4beDxSnFFhA5Guqa5ZsbSi/GAaI0mT4Tf0OmR?=
 =?us-ascii?Q?DUJwxM/pQWeQeCSI0cZBIePk+j2UkjVvOGMBb4ztyjFksdhvJ4YVf0OEL2yZ?=
 =?us-ascii?Q?bRiVWWzW6OhOx5nd0TDWPExXbro8FIRjZZoq46Pxl0v+OJ2qOwWga3stD1X3?=
 =?us-ascii?Q?Bghur35LrUk7fP/9ZRjRy/RjI6JmBV+Z2uezUfrOY/agA7r8yrxKp/3HpJzN?=
 =?us-ascii?Q?DoOSMRvX9ltO7GsT2I+fz2uGOZkdG6mu+g4Dt4SrrfM2CWD+jX1N+G4YflEW?=
 =?us-ascii?Q?NFpUB2FFU9BtKC+rcvpi2DvcaOnZyqjowDmYvksaxYeC5icVI89toYABrd0x?=
 =?us-ascii?Q?M8PIcnvaT5/+n75I/anlaqEc2K4pADLyrTsRXy+lkzPC+7Zt/ZfdhddJRoEa?=
 =?us-ascii?Q?YHRuTBDPkJvPbAuHmM6+ghCxA1qhk+rS7025D6pKtca9he34IvmHjQcKUJxL?=
 =?us-ascii?Q?nUIyCbN44d7L8D/Rm77z2XQ/i5XbE+ZDH45K+PEgnH0nN1tc5ZducjMqBldp?=
 =?us-ascii?Q?g9aoGbunm8ZqAnnyCiWnI5EbkFRIG+pV0OoQa9OsYYINTm8e/FtLZrGZYr8E?=
 =?us-ascii?Q?ERcokWPCQxqXyKpGTjO4+keoJJipgQa1iLATROD37Xh9LMr1xllBUiW0P9Y1?=
 =?us-ascii?Q?bEXj4nGfRgOp3FKfFlyUPIbQDweG+aCMFGBUqkCVHujPFyNKXukxhgzv3/lP?=
 =?us-ascii?Q?0BfQuNjD1+cGfregm/weDa7XlvWpB5Inm4xJ8wyD9O6kTpGNb+FMGoXqwezR?=
 =?us-ascii?Q?1tir2tNFqoxZ5M5ydtJPV0ijjU7cRi3hLJ5NYM8BFGp9oEpqxW04HlubrxrB?=
 =?us-ascii?Q?T6LUIMOMD+b/WPmWci5UGIeWEApoV5lYtlmTkW8DoHmHTvcu6CvWUvJ63nRO?=
 =?us-ascii?Q?rZbzIcGewB2sAglNXQ83WlzzN4GWcArz86gpXElwefDPSR8KxuaIhfocfLzR?=
 =?us-ascii?Q?wdBy6lvatXYpr0eUTJAqED3ZiyCF+H/NwGEntyBwufmXxMjdNUhlv6dpyVAs?=
 =?us-ascii?Q?xzASrKxF1kuWJMSsDUzEEWMiQDR7a/G2YceTjcAMHiSV14Zk/ogobU4ttwaF?=
 =?us-ascii?Q?9qtLSpuui8Z/XqQVGBKzWnP/fYPdZlUrOe5PpoE0n4idk13NjvGjNRSZty43?=
 =?us-ascii?Q?nBQXf+QVYb/mMd0SsFzcekzYcr7aXgD+1xKZL1nwpJVQdJtrV8OxM/WEq/xI?=
 =?us-ascii?Q?nWLK/+pRqjKQP0MZ9y+MBxtuIY7d1/shMjgjWmu/CMkQ6zZHNcipeUfvj0I4?=
 =?us-ascii?Q?HYGA9yQDjtgbX4AXwmsolQa35x00yeFQDG0dUuQzThoI+0xegSb8ZaEzSCGI?=
 =?us-ascii?Q?W1WPnH2c+rubP4Hu9hx/WJo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G2AuyEHGnfH5OdKBNyurzFVF88Bq8sxUb8y1d9RJE0em+D2kTaK/u313UDYt?=
 =?us-ascii?Q?jGP87KWjVF0UKEu2V8++jnvFVUlHbrW3tfglMF+LaTfzMvWkH0QU8iQxUpzv?=
 =?us-ascii?Q?kFS6zELSO/15z8R3fFyWHPBWcPIhAJ1CLEsC7tclOprsuAzGryjSTvywMWpV?=
 =?us-ascii?Q?74fgKN/K5GJD/QGAZPpA76u0qlYcohLHsb4+tf8UJ6X2zbea4MUWlff88694?=
 =?us-ascii?Q?sdt2QkxfAK96m+eeGaOb5E3pSLcD9RghUF3xxy2bM/228qTcZWMWVLjS8ro4?=
 =?us-ascii?Q?vCz1K4ALLpLk0MxSVbzCdPE2CvwNaL59k1AfVCVrzJLYhLP6l6x3Ro8h9K2+?=
 =?us-ascii?Q?oIswNSMwuWyD/eeaTeKoy+pCgqXiM4FOumBSb1GzZODRCz4okAnWIVJyAjaS?=
 =?us-ascii?Q?3DpDEOYS8xEB6Lyl6t/vTRPwivbWEe8dsuhvqhZDv5Fyaead41NR/Wl1lB/s?=
 =?us-ascii?Q?4Iwn/7xTgvB4PdmQJz+UQMcs0nwAU+HNx9P8gNjeBqZ9P5cJsoYQvurp/rB2?=
 =?us-ascii?Q?rl7HaSTQuLVKqMwyOfAtcQrnHKo0NuHF85uGVJE5b3Bke1Gf+Nkvpj8bMWeD?=
 =?us-ascii?Q?W701BXaIm2nz0jJrnH/ff198Ej3tK6E5UUbdqCrYnuemHexW5N6uRG4hEQNi?=
 =?us-ascii?Q?HVE7LOG960YL2KaXEH/yLbXJlY9sYD8/7aiow/86GHTNDUMq7cx+VALtu8SM?=
 =?us-ascii?Q?zJE7ca2u3vOM7/cHJ7dne7otI6sPmbNHGo+POepgK/RXhSZ/HSx06L5/Wy3k?=
 =?us-ascii?Q?8RIAPH+4UP3yGiLwwpb7VqRU21M6dor4A72yPKZglQk2xkPJ0wVHVZr10Ebx?=
 =?us-ascii?Q?Xf4m3MXPOU4YrBjB1eAMtvr/A4cXSGqMqnrzGZ6FdoyJ3IBqfA+2osHr2o//?=
 =?us-ascii?Q?UZRx/QozXWewA+xNpXJHyfaP6xHVhoCYkKwRPFJ95r1O4U3RTy4o8NOi7Eh5?=
 =?us-ascii?Q?83PgeWYsspzecCzDkFSdVVHtby7cypMjzCdbOOBT3kQ6Crz4wNI3ZXuwbFtX?=
 =?us-ascii?Q?Xsi/FpRvh9WLX1jZ8bMRvYigbqQ01kcbfq6gPLq8LpPa5oaO8iF2wxN6L8Vu?=
 =?us-ascii?Q?LZjCx9DxPvPUU80N6FPBA4TdEvd5Cs45FzUcYRUPQjirdEe7BFYHvHGX7FXh?=
 =?us-ascii?Q?Uj1Onqh5I3x3g1SIaKkgTtawUYFOfxsYzm4iepekCpWdKfFW0ZvKIP0A9dHV?=
 =?us-ascii?Q?Xyon3isO4q64/neqTmujXt7+8djgWr0ZjzBqHOL/nY9Nxct4LKABIszh/cTg?=
 =?us-ascii?Q?RDly9Lxuzta/YdWxVQ2BBoA6XxCTyhd2jD5qUrll9I+wZG7ffRnlk9+Do6Lx?=
 =?us-ascii?Q?g3GQGwi1s7YTEDh2wr26GRxUfIsCVhjsWZc7HlxpqWwnD35qW6uqSaEFguhZ?=
 =?us-ascii?Q?s1iFs+grXdmAI4xMilsjDbtDkK7viWM0jdHk10eLSyV5cDi2JinG1XuiBlBA?=
 =?us-ascii?Q?XLAL5CeARMaJXmeh3FavpyjqW/A4Ux03E51CONqajVzfFXJw0OpbVoE9KSvz?=
 =?us-ascii?Q?/p4u+h/k/hDtb58SUrthsSepm7dEjPVy6Cvjri9UM90qQsqs+1bje08HAYdB?=
 =?us-ascii?Q?SLMCLY+CiABNcj8jOlwaFNcNcQ9P/l0ISPflrJYOgZtmmNOHtz6vl94MFhRi?=
 =?us-ascii?Q?9Hp5Fo9mllqtnS2gA2qUc6VeahH03Q4BqZCQtoh1l5MAV+yU+/BHHOeSguHL?=
 =?us-ascii?Q?iY7JgVLzMhoCFEwJn8DenTVwfg83oQkfAPCTQywrM3vvKJRtn7cHBqezXCjE?=
 =?us-ascii?Q?/6pjAVNtYA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 639bcc85-a986-4b35-303f-08de5d93a0d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 11:02:57.2667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F2moifqG6AXD5eGyCvzJ80nofNJnR/+3PTmEZwMEiPidmroLRfO02qqez1l4wF0C8rfTRuMT67CovZ/iCZXuog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6963
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

> Subject: [PATCH i-g-t v9 06/11] tools/intel_hdcp: Add helper to get HDCP
> content type
>=20
> Add get_hdcp_content_type() to read current content type property This
> displays Type 0 or Type 1 or N/A status for connector.
>=20
> Refactor to use get_hdcp_output to avoid code duplication in getting HDCP
> capable output. (Suraj)

You forgot to add versioning here
Otherwise LGTM ,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index b69ce6c45..db9=
7ea0c5
> 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -95,6 +95,31 @@ static void set_hdcp_prop(data_t *data, int property, =
int
> type, int connector_id
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);  }
>=20
> +static const char *get_hdcp_content_type(data_t *data, uint32_t
> +connector_id) {
> +	igt_output_t *output;
> +	bool is_valid;
> +	uint64_t status, content_type;
> +
> +	output =3D get_hdcp_output(data, connector_id, &is_valid);
> +	if (!output || !is_valid)
> +		return "N/A";
> +
> +	status =3D igt_output_get_prop(output,
> IGT_CONNECTOR_CONTENT_PROTECTION);
> +	if (status !=3D CP_ENABLED)
> +		return "N/A";
> +
> +	content_type =3D igt_output_get_prop(output,
> IGT_CONNECTOR_HDCP_CONTENT_TYPE);
> +	switch (content_type) {
> +	case 0:
> +		return "Type 0";
> +	case 1:
> +		return "Type 1";
> +	default:
> +		return "Unknown";
> +	}
> +}
> +
>  static const char *get_hdcp_status(data_t *data, uint32_t connector_id) =
 {
>  	igt_output_t *output;
> --
> 2.34.1

