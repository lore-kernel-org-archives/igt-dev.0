Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D78C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 12:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2F910E92C;
	Thu,  1 Aug 2024 12:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWPAExTH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CCA10E92C
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 12:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722513882; x=1754049882;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=td8Q91Mb9Cv5XjLkb5a5t81awnGejycJ59xVFmvYZVk=;
 b=iWPAExTHgWAkRbX2DMddgadFb8/NLdKzCLL7Kd1GN0elwcbVvmGttiBg
 7U8C//XnpyL8oqFcvRGc2gilxrtt7dkPdHJMZFDWmDjWm949RL8JI4U3u
 3B7gvKN+FxWU6yMk6bVs/YcGUtnYduv/WRpL5yjqPRyUcjOiaeTxygHQM
 rGronArBg0sauM2lbaFDZz/UbyjtV+3CGHR64Xkg7V951b8A8BoyaCg9N
 K1ULmaDdCbl49GD/SGrbMai88Ro2BgmRdwggek42c/J9gsnRF0oAMttFn
 vIT+shEcgEJJIYnJxM/eaamPNjjcDLxpbcuCgHteKaxM63hf59JeHWcCT A==;
X-CSE-ConnectionGUID: HyC7+VPyRtGHdXLJMPWnMQ==
X-CSE-MsgGUID: luMBY/W0Q6ShxVoO3hD8aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20278139"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20278139"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:04:42 -0700
X-CSE-ConnectionGUID: La+wUFAvRBaeHTxBmZx0kA==
X-CSE-MsgGUID: e4wbfsVLRt2rDrHYi9gaCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55097463"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 05:04:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:04:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 05:04:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 05:04:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZ53C/tFSgwveL81hnwzqXZlQ+FDRPRlwE/jvLb83l2RTses6pAxlTIxtuoVJo0KPeKRP8fJV8dBMKwuWWx/3wqHejPoz44mBEx6a/LENmPUyztagY/1G8evdY8uG7GKcQJR5JIFGWi3sueOKkPuYnSiittraqeZgd0LUgIj9Q4IvYCZUXlYYcnFt50UMocfrUJ3FVQw8t76KwtToIGrXPsAeVbOOZqnjc0uXkSE1JQ08N6kg3t7fC1Y1bYYyllCxjzq5IgPzdu1iONij1OsGVOYzOh+hLgfp20qejw697og2mp7sPSgZwXRa1orvGRa+CRtsuPXvPaZMTXZuSrzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mclft1Mof5QLWhOAUzXzGV8rI3N9THzk3zztJ3GE+XY=;
 b=oMgokSGHBIFMbgPd2JyN1wu/ffRRxpzw6fKRGGFEZ+wkPSK/6iyANGhDNuonYvyZj6ENFYp6ETYOhbbAIG5rwOndhpS7a6NXG9Z9gslMX3RDAKZ6G04dfVaJNTDXOPx7ZQ5KnHOw5WIXtmzpaVkeLmFZhnmZUMF+/XwJ1Jx+gpnaEtsKA5zc4P89pYtpzgVtLrzOIr9fNWMC6G4mywQmNuQ9We0F/ctJ6RISobV5b7M9qFJqfpJ24B46l0xxpxcA/uGsUgpDrZc6ZcmdLwwTxg23elQyKHwtQV5BBdaP0xfjF4XYd1LsBge0vg9nwPnj+9Ud4U9M+apg3hqLkg2pAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SN7PR11MB6922.namprd11.prod.outlook.com (2603:10b6:806:2a9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.23; Thu, 1 Aug 2024 12:04:37 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 12:04:37 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 14/66] tests/xe_eudebug: Add vm events sanity
 check
Thread-Topic: [PATCH i-g-t v2 14/66] tests/xe_eudebug: Add vm events sanity
 check
Thread-Index: AQHa4nZECyoeI1F85km29z6v4eEIabISUOvw
Date: Thu, 1 Aug 2024 12:04:37 +0000
Message-ID: <DS0PR11MB7264DD03A51B44EAAED69753D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-15-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-15-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SN7PR11MB6922:EE_
x-ms-office365-filtering-correlation-id: f35cade6-896a-47ec-72c1-08dcb2221da7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?eVWT3URBfHLgebOTtZnAQCGALRp0dU4AIfyXF60w1+oWtTbaOExglRxlI0?=
 =?iso-8859-2?Q?6PreqC9RQOE2Vo/9/LgKnMgYLYaxmak9sJvhs7UmqAPfGRjWb0tOZrlLum?=
 =?iso-8859-2?Q?nXabRcOMoyoMCFhyf9FExU9VbnvgA3PlpZCG8ii2ltjgM5MKqcZ37ii88d?=
 =?iso-8859-2?Q?LoEj6xEME4npiEX+8kHea7ZN2WHQvvSuzHjxzuEiNBp2aWIo/2JLG3DdPS?=
 =?iso-8859-2?Q?AYgzoLdI0xn0q9Cl75Hu9Jq5oxzEAwiEnneoJvPei47jqBW2HZCx0Q4gol?=
 =?iso-8859-2?Q?bAJ9OKJLTA8ieC2TrJWyV4ce4yeOmc3Ri+zdSGzqqK/r0o5q04HU+l7Vsb?=
 =?iso-8859-2?Q?6HdAOdDiVpnOGZMYfsTv5gDzVnwg7mVQTG0Ju1aknrJifAI4RHwQagTM4O?=
 =?iso-8859-2?Q?N9Mp0d3U39BMJyWRmljp3FUpiRAn3g3LllZfbp8XUfpTPjRIyio/BGBoke?=
 =?iso-8859-2?Q?C8fxt+kzbWVgwubhDevVQL3uc3dMpVZt5Ob2LVnYDeJA/9LcfB2PDc9e4q?=
 =?iso-8859-2?Q?eHvqrc6v/mivA/lfSiG9Osil4BE96tTLDY+jMUMb2pFZEsQ0hOA3x8gzaW?=
 =?iso-8859-2?Q?43ZSnUaxkCxFqvm7FqKjzXWVVtApBNAC3YHT28pawM57StZLWaVgsnqN3m?=
 =?iso-8859-2?Q?x8qYbAajeMnc5I7147n/I/Ros5fhdlxml/n3lscG3++8ts/vbpSBg5E6w9?=
 =?iso-8859-2?Q?Bb2qmK7nUkZlG4uSvgmwugrSfw7r11rpKpz7du0DDUDr6DNC4geq97Wmt3?=
 =?iso-8859-2?Q?ipC9NSaBI8sYCqc+gQRZfX+zAKn5KS0Q4HNxHFP1nWD88jbdSrGc6H2ltO?=
 =?iso-8859-2?Q?IfaOKvTC4YrfN7a2cXsytRrswMStCFJ/8p0sOqC76Fr+AmFs8CJletkRYw?=
 =?iso-8859-2?Q?/ixYC8S2wPpF1gDl7o7oU33n19s7LwR16O6dmLw3UwmA/sKuns/i/KkCb2?=
 =?iso-8859-2?Q?RUtxUEYnfjG97RA6BpuEzHeKCS9GMASMkGQLEuFLtXePZiTI1cm84sgPBa?=
 =?iso-8859-2?Q?ekERPFD9jZUtqcumO324myF7VxmGhL3LGFNygC0GDZ+Y/IrMWrHsrKZPlG?=
 =?iso-8859-2?Q?nJIpmFq6AYh9dOu0WTOYwIphgOytj3LFwWzYCwB5mTXAxIhh5kmGLU0R36?=
 =?iso-8859-2?Q?sOWQ9xtE0sVIdFvrWJ/ROvhRcLezPJy19qoop6kNmXOcHwbEE3yOmbNi7j?=
 =?iso-8859-2?Q?GfeU7XqkMHF6P1NGKw5wwB7WYmRUF0KwYikHUhITDD/hbIPoqzC70q7bTg?=
 =?iso-8859-2?Q?QOO8Zi+eWyQi83Q5OgbwOnDBMpQkA9zr5SJ9vojv7N7vioePr9PbnMUWaB?=
 =?iso-8859-2?Q?7dA0xpl2Ve2K/4mt3YjIRuiVcogk7P9oE+u0wPa2+s1F6KwSWKU81VzvPd?=
 =?iso-8859-2?Q?1IR/ydwxy2Isq5tr5d5umluZxbRw+TIF1E86CsolzabjMWPy87x0QudrNf?=
 =?iso-8859-2?Q?lNJtJwe6jyKwcni1ceV6+LNyjMCqM9GyKyhsiA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?GiIsZLzJP+kw7cA7X1fqstDzPV+fwEPUHYNJHdliMaqeV5OvyLPVsYHL3h?=
 =?iso-8859-2?Q?uuLj1o1U3G0S6TZWuA0W8WeasyekvX4OMo73D6RTxqsQsbFfkTDMtGhkCj?=
 =?iso-8859-2?Q?sB6qsIunj/HlNPg2ow7+x2NkIcG7ZiLN/O4Xa4KxYKBSoqswuhzvvhY7eh?=
 =?iso-8859-2?Q?IdncpEBU03bM8yniCJnfip8I2fTy/3Vus6vg2C9WB84LpeHIr/59tOHjic?=
 =?iso-8859-2?Q?qLCKqt0RXulncRHkpTrvKLZj53AIa6+sgYMbvJAnOS0PsnfULln2bwruS0?=
 =?iso-8859-2?Q?M3dnO1VIfd0v5bK+EKANcFD+dyUc1vxyEg0GZE4JXyMjzrJTqCWyK54E2F?=
 =?iso-8859-2?Q?OQBvnqDAM5hLgim4xikI1/SI++bJzcu/BQNLynlvPQ0UThhDhsye6BY14W?=
 =?iso-8859-2?Q?E0eNeHUcNKXIoxI+FKrLQjcfLCCLsMNDXlVqHz21KtWAUvjSj5wBVU4jOC?=
 =?iso-8859-2?Q?O2wfy7q0L66Q8A/XSIg944wiIeSDkglSk5l9k4Cv1QntUE0CxzZgtfHTU6?=
 =?iso-8859-2?Q?PM9UHKWnU3kzhI+mPt1xQJMMQvlL8GuFVBWYrubo0DHtIcF3acA0OYvV53?=
 =?iso-8859-2?Q?7zoSfWuRp0+yzlBh8W/zBygg8PKeaMiQCYW2svu+oqeMGlBNpBtT5RvbP0?=
 =?iso-8859-2?Q?eLo2KxusuQ9zbepjNiC0ekAEOGQ6IBkp672h7ADJ9w7GeC9qelsn3+vNHN?=
 =?iso-8859-2?Q?iBNeVzyNA6LW9V0/jmrIG6XhbtMuqbYjjd9MSD8oJ/Xj0BGxyLtI1rjhz3?=
 =?iso-8859-2?Q?uMvz6ZJgEA2fj9wsIcmGaGrPFkrCr9t9WPW5kKFDmEig28VyuFOzV5qG03?=
 =?iso-8859-2?Q?+8Y8d6RJa190ghQp8WI3sDZ+qRO/mJXWq74UELxOHuHsEpyn+ukmotcEU8?=
 =?iso-8859-2?Q?KlXAOwwfsqKuHrNFlXUswuDzsenjw2cDMjLr1ePk2ANfXODkHJrje0OeXP?=
 =?iso-8859-2?Q?EH73+2IcAPRV0PHnojsdxeBEDkD6zg22681NNZ/1ydWgu7lAaVvEiBUuAW?=
 =?iso-8859-2?Q?Mp8Kexi9WOc8M7olgTEUQQdL4j8Sbx96Yt0P/jLr39AXv4dIlPRUiE1hm8?=
 =?iso-8859-2?Q?G/8Rhl8sXexIL6glJWO9ToYvM7jumCLXlOLvtEaSzMqnmdWUof2vCIJt9I?=
 =?iso-8859-2?Q?uiM1j+NxOPGqoKhnZ3nH8tru9dxKqDtiW5sdjLUPmeCSJ6aorN0KZq1rKc?=
 =?iso-8859-2?Q?x4k5Z3YKF5Se/2Gu/zzBvj2jbjblfyZ7d6pL6x3tT10fNfQqfafWs1gZkX?=
 =?iso-8859-2?Q?+f8MENmdcwmiW4yaVgwV326O1XogY+fjbtFVf58EiCHxZDZsFF/KIlzNEZ?=
 =?iso-8859-2?Q?YwS+Sx/hjTRdo+ZEUutxXkbGjovEl8r/7IzsYX+ad1PxQIW1I0gLds2m0Z?=
 =?iso-8859-2?Q?uG/pYHfNTrS6McFdfGzTTU1A1sG7KdvNL+2FniUp3fn7q/MXwnkFcJCJoZ?=
 =?iso-8859-2?Q?VIEh/qkfdIbsrkTPk6vtnQ+Tox886dQAMytkfoG8HUNBA03lQ7noX1hHnI?=
 =?iso-8859-2?Q?lU7OR8Oss2+u4oyNlas2BoCDHDwR+uDo8AW8Dir91RduJOj1pJpCZefAc1?=
 =?iso-8859-2?Q?ixy1nEUrEsYyrLnE5oFyLPhIkS17Jbyu+SxgwC85gvflxSfeOnSMXDECUM?=
 =?iso-8859-2?Q?HwvBLbRD50ZKrvuEKo5ngfqFp7YcwRz8k031m64BYpboEaYafYeYhOVxTP?=
 =?iso-8859-2?Q?MURFEBuEObpO7KTmW0U=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35cade6-896a-47ec-72c1-08dcb2221da7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 12:04:37.5588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WBwCdfPTi2kfYT2UwsiLk6t2Bj+qwFltChXqS0q5+htghOOnLxFEXZLz09S3HYCMVMKMhpwgweBD9ZMK2395wI68iai/8ozQI66NQlvCG0Oa6ATCftmPyYI/y9PlFp8j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6922
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 14/66] tests/xe_eudebug: Add vm events sanity
> check
>=20
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>=20
> Add basic test validating eudebug vm events.
>=20
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index
> 0cef652e2..7c1c21a33 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -18,11 +18,27 @@
>  #include "igt.h"
>  #include "xe/xe_eudebug.h"
>=20
> +#define CREATE_VMS	(1 << 0)
>  static void run_basic_client(struct xe_eudebug_client *c)  {
> -	int fd;
> +	int fd, i;
>=20
>  	fd =3D xe_eudebug_client_open_driver(c);
> +
> +	if (c->flags & CREATE_VMS) {
> +		const uint32_t flags[] =3D {
> +			DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE,
> +			DRM_XE_VM_CREATE_FLAG_LR_MODE,
> +		};
> +		uint32_t vms[ARRAY_SIZE(flags)];
> +
> +		for (i =3D 0; i < ARRAY_SIZE(flags); i++)
> +			vms[i] =3D xe_eudebug_client_vm_create(c, fd, flags[i],
> 0);
> +
> +		for (i--; i >=3D 0; i--)
> +			xe_eudebug_client_vm_destroy(c, fd, vms[i]);
> +	}
> +
>  	xe_eudebug_client_close_driver(c, fd);  }
>=20
> @@ -238,7 +254,12 @@ static void test_read_event(int fd)
>   * Description:
>   *	Simultaneously attach many debuggers to many processes.
>   *	Each process opens and closes xe drm client.
> + *
> + * SUBTEST: basic-vms
> + * Description:
> + *	Attach the debugger to process which creates and destroys a few vms.
>   */
> +
>  static void test_basic_sessions(int fd, unsigned int flags, int count)  =
{
>  	struct xe_eudebug_session **s;
> @@ -282,7 +303,10 @@ igt_main
>  		test_basic_sessions(fd, 0, 1);
>=20
>  	igt_subtest("multiple-sessions")
> -		test_basic_sessions(fd, 0, 4);
> +		test_basic_sessions(fd, CREATE_VMS, 4);
> +
> +	igt_subtest("basic-vms")
> +		test_basic_sessions(fd, CREATE_VMS, 1);
>=20
>  	igt_fixture
>  		drm_close_driver(fd);
> --
> 2.34.1

