Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDDDC71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 18:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4E110E066;
	Thu, 12 Jun 2025 18:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+gc7LNO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D8C10E166
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 18:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749753561; x=1781289561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X7OALzQqEE5xbKlGfnUWInBbNQrXdgjnAC4OosENu2Q=;
 b=N+gc7LNOIsBOhWx9a1MywWBK1+C9k00ioydylTj1YwIW/LJjaVKQniFv
 rlHSxJT9jrt39Ge5hLnhEwYbaycuuBJGh7RvRQCIa1cNP0Q5wuy3bhVHf
 1cK77vwZW4cgHZuZTCSXnNgFWW7JQwicSzMK5FDIGxd1WNkB2p6QfADd5
 e5EIlAvDtG1gmOXDoTBPAjs5l4m9QA4gJ++1wGFyPpuUTEB9gF8bbZraE
 WGwkoOfrAD6EVfdATwWs4LCaV1Zt1s/CThAJaaJRPFEhOE0SaxZk3+6C3
 cOjSAQMjKJyGdX96NyCv517jjYNg59iMkR1nFYRMOwDsD9UXoW8v9cxAa A==;
X-CSE-ConnectionGUID: kAwahFbiRkGt26ZqQNEEHQ==
X-CSE-MsgGUID: hSVNSXzdTKu8DnQjEUpeKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69392523"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="69392523"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:39:14 -0700
X-CSE-ConnectionGUID: kLIBrTpRTYi7R8l/A99J6A==
X-CSE-MsgGUID: jiod/v8WQs+ikWezUU7Yfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="148093233"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:39:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:39:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 11:39:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:39:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ye4slVRmvL8oSmL+ch27Yy5hJHyxqaVHbyC8H9aaIxfsSiQW0fdF0uilNbQc3b9llsamgqq+SHXjleawDSHb0shDgQNqmHH4IpFxCrA7V5/5GeG7Pf3msjFdybuHZytbK4qsjmlnENaM+bK22TKxKOeHrYmbWkh/oKLKPb/PogBjP4u2s2satS7DjPHkOqPPDeF2GCKKcwnxQ1grMf9a9ycJ/BzMhG+KI+JAw2lxxGkv0JuNdWm19ZVAMCnbU7BNWT8hQu3pytuN/4VYvXv4E47PK5TmzFcqWkBdzpiUoC/CsE2wVF5Dzr1uUGBjZPfiyW+VfEAehMUw9FMKxC/6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7OALzQqEE5xbKlGfnUWInBbNQrXdgjnAC4OosENu2Q=;
 b=nmVP86m+tKQIwiAfitwxNVGfNX8hZ+5ljFtnJcDmM2OWRMc/yZO8JEefwv7jo+kv6x4jU+5APKg7HbUzxGOBdvvXCUgUYdx+c6ZUsidofwLWspBewrSGpLzuKiKlU5iqnGm4XZ6e5P2lClVw4FxpzsCTbsFCeqSqnJGmLTFl+hxzxk4bnjrG3xVNQH3sk41s89rCZnjN9q7FRRFTTuWO6wZy4ROKzWU5oYoiDv/ZHTNXeviw/7Mf2EA3fdtW+Iaf46uKz/6gEiTAiAq9pTHooxvLMgJ0DQBFoW269KJl2gMMassl3EAkZMjST8X2SQBBBXaMd6rNro19KDerTRrl/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6268.namprd11.prod.outlook.com (2603:10b6:208:3e4::8)
 by PH7PR11MB6723.namprd11.prod.outlook.com (2603:10b6:510:1af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Thu, 12 Jun
 2025 18:39:07 +0000
Received: from IA1PR11MB6268.namprd11.prod.outlook.com
 ([fe80::7149:569a:183a:f3c9]) by IA1PR11MB6268.namprd11.prod.outlook.com
 ([fe80::7149:569a:183a:f3c9%3]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 18:39:07 +0000
From: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "markyacoub@google.com" <markyacoub@google.com>
Subject: Re: [PATCH i-g-t] include/android: Define gboolean as bool to resolve
 Android build error
Thread-Topic: [PATCH i-g-t] include/android: Define gboolean as bool to
 resolve Android build error
Thread-Index: AQHb26f/atxhZjKixUyuGRYzeBvvALP/0IAAgAAEN9A=
Date: Thu, 12 Jun 2025 18:39:07 +0000
Message-ID: <IA1PR11MB6268411F828096AA1142E1A5ED74A@IA1PR11MB6268.namprd11.prod.outlook.com>
References: <20250612143819.8547-1-jeevaka.badrappan@intel.com>
 <20250612180040.4cjxyeaoeue6xunn@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250612180040.4cjxyeaoeue6xunn@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6268:EE_|PH7PR11MB6723:EE_
x-ms-office365-filtering-correlation-id: 5233f994-aabc-4410-4354-08dda9e06a2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?IWZkbWAhliXkWUPJicdkWOAiDde446y0tZx19M9trbRJkbvRurHQNZVHdY?=
 =?iso-8859-1?Q?9YJoOhL6NnhCg606u6EOh6cG8AK9B8HdFZXWraXv0wy/af1OdGdnwIrxV6?=
 =?iso-8859-1?Q?8FSdGfFZFKRa+uqTNCzak6yOVc2/LjDG+ND6UDdsiIPMKG+ITIDxQ1D4QP?=
 =?iso-8859-1?Q?bLISI6fuTPQ834gEZ47JBwsqdZopBsmh9yxav/KDf8s//pRWcL9Qy5Q7aW?=
 =?iso-8859-1?Q?bn1NHX38IXwwUN/Y0AVG2wQ5c8UVhmML4dX0yc9BRLu5dFpXf1R6NBPcDr?=
 =?iso-8859-1?Q?Wxf6AjNAUlu+1z2kFAcle1M0aonAtWMPUzbXsJkHTJrtagwJmkIKSWWDK7?=
 =?iso-8859-1?Q?lMADxxxhaYym8+P4gBnVPlr+Lfh8Ao9p0NXJpy5+iB9JS0dEWoVG3naQ/y?=
 =?iso-8859-1?Q?1LJsmeIgBfx6N2Nn7sNzlyFEbYbUdOF1loHOw7rqKodWAg0BvfA17gBi4V?=
 =?iso-8859-1?Q?yfxODWOWqrWmf4AAXTChOySRkjIE99VmC23F5npxRKtrWFOdifzrh27i7X?=
 =?iso-8859-1?Q?Hnr4bUA2r6lrBvJhrIpHg/+FHbRq9dxrvCtd7LN2rb7owWNUxK+SNEUXOY?=
 =?iso-8859-1?Q?v9knm0D7AYjL9u9Ni2NznfsuMfRw+mcSozsr69aWvHaRib3hF9mky1f2+I?=
 =?iso-8859-1?Q?j77IBMZV6thqPYMlrRIl6mQlMlxvNvaCMDpL53rFQzIAGdRrTPC90gw3Ri?=
 =?iso-8859-1?Q?zLwsfjBtqQ94ztbnEoh8r3PZr7I16jz1AO4kIGb3p8955UsdDItzZk2kCt?=
 =?iso-8859-1?Q?7036VAMR3hDMPML128CisYYJ4TKxLZhzqqKJ8pANXTT7nyu8u5Ulk6eh/t?=
 =?iso-8859-1?Q?WalY0dchqEcqHYDBs+D0zLjyGG0nZ2TZrYCFR4ubxIGEAl9w8dhRFVrfwx?=
 =?iso-8859-1?Q?tXQGsH9E7o9H0zGmg5CfhvzaUCcV3C38J5/zdCKgbGyAniFEsLbQzsOskJ?=
 =?iso-8859-1?Q?Fh3SNZ6aYo4Yvayt9QWgOJRPgXbXBBxyuDltPREVX/2b+V+BCgK2bKJ3di?=
 =?iso-8859-1?Q?vxaDB8e+kh983YTcRKp+mD0YevQ4qztRJsIFuF4NMq+8mYqaVNGwIQgPYz?=
 =?iso-8859-1?Q?eJEJBjGOjn2VmyOeG70sovwH7yz7IUDAuX++OKBBRYbX0AhJQ6/CaGCfGQ?=
 =?iso-8859-1?Q?Wq3CbXW7j+C6Kf3BhkBhUcds+vDFeu1qyBeZpfTmCA+c9VifhCQa4/8LD+?=
 =?iso-8859-1?Q?Tsy+yghAZF1XPPEQ5CvCf+Fj8aaebfJ+na/lXIA5N/CTxcqkGeNc7/uRnb?=
 =?iso-8859-1?Q?rTHloLXHceJa+n7mVjM75IiVsrXLU7R7SRZdn6JUBZ5LvmpSz1ZsSIod2U?=
 =?iso-8859-1?Q?XOdB2ClXLrX/lLn5oiQf/uDMCzc6ZFvbaS6cjhRpWu33gL2TveWkPTUd6B?=
 =?iso-8859-1?Q?iCnN+qPw7ob38VYde2ivp3kmD+k8N0U9bNNYRE05RZjIoBJUib8xG5C3fN?=
 =?iso-8859-1?Q?9Yg+JCm2lkqW0ywLAPVBsTvjdKb4xN83gx9DffH6SNHXvj5caqxLAoNk49?=
 =?iso-8859-1?Q?VNpEL0PMULBiU1b+Iahv2mNUTPVqL3omM6jpXb5DFIWg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6268.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BbeS3gzNlEOREnFdqZl9BggcbDv53rKi5RAgwuPaw3CQ2LK4hIeTKy693Z?=
 =?iso-8859-1?Q?mL0NULtbdSI3O53UUvy76AYOrXFYXuK8pqEEmJiN/MlQj679oTOG92a/vP?=
 =?iso-8859-1?Q?JT3o6DB74vSd9w5EVCMKWaND+kbg68q/3qsiJZnoIaBq51Z6oh4Z7yPGZn?=
 =?iso-8859-1?Q?qQeLlP3lq5q4vYjhapG20ahZtfS5CndHm+Zq9Kcrt5uaTF+sbsZoOWjeQ+?=
 =?iso-8859-1?Q?Rrt3IQBd93PmN8NrPV/A2IKbmgl1ZGIlb0OtYdr6zf/rUTPNSFbN/QhUoE?=
 =?iso-8859-1?Q?QlFi9PdmCWK60dzn1MszsqT9qEGWTQqlOJXHDkaHjZ4S2/5BqtpN3bQGCM?=
 =?iso-8859-1?Q?sBNt9gPMiJ2C9IgojQPRiDIVDSYfOFJd2b7WU8uTtcc74T8E2R5N0koxCB?=
 =?iso-8859-1?Q?DLM8L+cGrGBM7rJ+B4vb6oYQHmWdS9ggu1MugsOlnW7XjspFJ/zzRKRbi0?=
 =?iso-8859-1?Q?dDbVu7VL1/2hm2oukYfPD2VTAXleI8baoa/xvIOlrwChbs1SlBd4Ka9ngt?=
 =?iso-8859-1?Q?wQr2yDu9x4Zi99gCOHycZcbGq+JQF66wTM+X1qKxhtCN9b/Lur5aIdyuDi?=
 =?iso-8859-1?Q?WRHEqsx0L/9Cy4lMf7+YZJja1wYw6QSD3DSXoXCbP7bF2cyZqwBH+SSjfC?=
 =?iso-8859-1?Q?UG81HQ+6mVBydLdFiZIG65fDq47cshARXwBDYfPo9h5EQx8t+z15A/xfcX?=
 =?iso-8859-1?Q?d7QY6cMnVFyvHgJswnxX/WEHJQxYhYUO3B5uGzwLVRyoiPb1NLKarorjsr?=
 =?iso-8859-1?Q?K2TGuVu6kzz+Fvfr4vGKOtHi+ovz42vnlkR4GBK45vV44AhSTwqKspLJFm?=
 =?iso-8859-1?Q?oea9IOjNuNyOa4OmM0lXOkgM/9nn3KGAk1EJU8WH1Uye99M449nCUQi4Xj?=
 =?iso-8859-1?Q?NMcNNb054AVXJDwNkXajZg4BhQZ47IXg1jdlgpunvTqXjGfVaIfXr4Kw0y?=
 =?iso-8859-1?Q?TDZcdaKKarsd4LmmRXWEbPP64j0Ayj0aETpDj8k+p3BdB0Sv3kMCdMsu5V?=
 =?iso-8859-1?Q?iiEr+voKzKv/8KloXwwpHu/cP9pyP9C8GBK8pGrWENvGDrydlONx3v7uDj?=
 =?iso-8859-1?Q?oMouFs3BgGCG+RchKkrf5WEeLBb7P825ZnFZ0ygsH8Vem9obAdfdhWGOWc?=
 =?iso-8859-1?Q?Zx0ijnfFEumZE+Dt7GhWWzee1Ed/fQviDry+lAVw9VEjwnGP6bCKhjbZQh?=
 =?iso-8859-1?Q?aoaRxUKpSu6N/gxx6KWIwRCLFM7tUGC7CGQmf299beLH9h9X7hWpuk+rqD?=
 =?iso-8859-1?Q?LsxYi4HkN+E07CTQ/e9T7M8T/XUnVeWimxRqek8lIOHyZyqt4pKPoOwcen?=
 =?iso-8859-1?Q?JbjwRvnt7aVwJwGmr8cRhXetBvploL4iQ8/38zSQ42OSirslZvHDBmfSxq?=
 =?iso-8859-1?Q?/+mKUOkZ5SOF7cTs1X34qkD2+CUJ84omys97WKLWIaxw6w+oJkQThuZqgd?=
 =?iso-8859-1?Q?NYTph21ZTtbWjKupcTyTE0hnBNX5ueMJTmoOm/mGQE9Zt/TmioQ04SaS0i?=
 =?iso-8859-1?Q?kborY+Knpd+AMV51tz4n0h82cpUczn7CAM0FWKFCfn2gi8FF/y6CGrXveo?=
 =?iso-8859-1?Q?gzkVnoUeXzSvelWfWIjt8pm9qDOeRwrKtWVIcFnrYW+/VpDkYp6NtyChj7?=
 =?iso-8859-1?Q?G0cRPo4A/gYLMqvg/5PS78rOhTO8q22atw?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6268.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5233f994-aabc-4410-4354-08dda9e06a2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 18:39:07.5060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iuFPoXR3UUc7Jh4BueW+i+YPjQzIvM8HmMIvpTF60e7eW108DItJ4pziwcJtqt54+Yn+zHR/nJpZsvxo/tivsCaze2YOkqPWsitWZFpnC6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6723
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

Hi Kamil,=0A=
=0A=
On 2025-06-12 at 14:38:19 +0000, Jeevaka Prabu Badrappan wrote:=0A=
=0A=
> The function g_regex_match returns a gboolean, which is not defined in=0A=
=0A=
> the Android environment, leading to build failure. This commit=0A=
=0A=
=0A=
=0A=
> imho first sentence is enough. You do not need to translate=0A=
=0A=
> C code into english.=0A=
=0A=
=0A=
=0A=
> addresses the issue by typedef-ing gboolean to bool in the=0A=
=0A=
> Android-specific GLib header file.=0A=
=0A=
>=0A=
=0A=
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>=0A=
=0A=
> ---=0A=
=0A=
>=A0 include/android/glib.h | 1 +=0A=
=0A=
>=A0 1 file changed, 1 insertion(+)=0A=
=0A=
>=0A=
=0A=
> diff --git a/include/android/glib.h b/include/android/glib.h=0A=
=0A=
> index 8540d3514..e12aaeebb 100644=0A=
=0A=
> --- a/include/android/glib.h=0A=
=0A=
> +++ b/include/android/glib.h=0A=
=0A=
> @@ -29,6 +29,7 @@ typedef char gchar;=0A=
=0A=
>=A0 typedef unsigned char guchar;=0A=
=0A=
>=A0 typedef void GRegex;=0A=
=0A=
>=A0 typedef int GRegexMatchFlags;=0A=
=0A=
> +typedef bool gboolean;=0A=
=0A=
=0A=
=0A=
> How did you missed it? Was it lost with too many errors/warnings?=0A=
=0A=
Apologies for the oversight. It appears that the changes were present in my=
 local build, but the patches were generated without including this specifi=
c change.=0A=
=0A=
I will work on a solution to ensure that builds are independent which shoul=
d help address these kinds of issues. =0A=
=0A=
Thanks,=0A=
Jeevaka=0A=
=0A=
