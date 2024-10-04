Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD92CFA749
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 05:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952C710E0DD;
	Fri,  4 Oct 2024 05:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlxuU5cE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7B010E0DD
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 05:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728019963; x=1759555963;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=2NxpO8/Mpoew0gg9sgpnYAiC4Pc/g07dPI50SpOX3qw=;
 b=YlxuU5cE8tgIEBfTsLA4dYYPh+MkFTgY2JGdjDB1TTKHEY6+2Epbkvht
 +g79pAUXyfU6u092uxSe9VKzpzy0Gb99q4tur05onVG+W42qniwpjaEgM
 zegeU023HbhidFtu0Hx2vXvD5Y+vaXDa00vXhZFFSgp4eh1I1A0lW3qW5
 32XacKwqVFRs4jA1kWzvcl/SM1cEKHkCcOsY1QwH/wfPV40cCYfqXMjiS
 KaYp23rlQACNGPDJQEyv0Xzp0TKuhAt7wyLfIMEBS95qC0cWRjGR4lxq1
 uQfPj4QlDgQG27gWR2Qqr5vU13aIYYaKbxWKBEICgs+cCCsRNoF3Vjh6f g==;
X-CSE-ConnectionGUID: 58hYE6+USxmwfwMMO8096g==
X-CSE-MsgGUID: foEGePocRba92JXd2rnDPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27404475"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208,217";a="27404475"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 22:32:43 -0700
X-CSE-ConnectionGUID: 0zXd/nqFRCafK34l9xqBPg==
X-CSE-MsgGUID: i5VVX8i7QEmCZ9ZWmgqtUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208,217";a="79566651"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 22:32:43 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 22:32:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 22:32:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 22:32:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 22:32:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaiQPeUwVHFEi5WBzRole8k4Z+ZQuWg8XwTnx1PZ51a5xELhytYiWhmpVKMIXa/JkgDql0M8UmPWuUZQuUt6I5C2GukItyHxlsOsLH6177EPcQ68PYweZL4gQH1kQpwStp+JLONgocldzArqqkYOjqlibRvNE0BI9R6cGIpI+qqpws4EcGi9nGMbGvuNhQTdcXBVF9NfaMLnw/UJmdvjwbbp55QB5MZm5dE6z893hVoAEVqURdp3aVHtquJSCcj8d+bz/QE352dwSmnwCjiT8VgRIKMLejuqY4xqRe/l7oci2fqo/Ngj/XjYaWZli6VmE7HlwLG+rI0q683Spglsag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBoIp7YvyL3I1wqNW+scSG2ivGYLKC8rWX1qTHdY3kw=;
 b=AXqg5rA5zgN6JY3VLD+3N3hTnn7hJykTP1kEh8z9/5Na3+ysBTZmKRceqi2HDa51pKzgnPMl5PsZ4gWoNWW6leS5/eFgqc+6KcIWBNsWaF5cQ8veF3uMiD0axuw9Z0NxnUGzJiaJqa6vinVSGi7ncvHN12j/jLwXhe1R4FPUM05cQENE/C0zIs/mcq31uy4415gjPTcZht4nHDJ+5RZFFLs0YonP1OOX/gxU+AKqRTk0SjEBZYqwtWa2WM9P8T6T3o2TWDlgao2mHNhIyd8DNHMzh0bNZJRXHcvO1pnl0wKHy9/PvehBTbS35TI8BG3hxZexnr0CgTFnRJFIZddFpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by PH8PR11MB6926.namprd11.prod.outlook.com (2603:10b6:510:226::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 05:32:39 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.8026.016; Fri, 4 Oct 2024
 05:32:39 +0000
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Topic: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Index: AQHbFNtFBHnfhdT5iEKkTUs9/AugurJ2EFIAgAAALRA=
Date: Fri, 4 Oct 2024 05:32:39 +0000
Message-ID: <SN6PR11MB27045F424115435C60CC64D9DB722@SN6PR11MB2704.namprd11.prod.outlook.com>
References: <20241002145503.910536-1-santhosh.reddy.guddati@intel.com>
 <20241002145503.910536-2-santhosh.reddy.guddati@intel.com>
 <SN7PR11MB675059F459088B309491341EE3722@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB675059F459088B309491341EE3722@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2704:EE_|PH8PR11MB6926:EE_
x-ms-office365-filtering-correlation-id: 88f86d5d-8b0d-46ef-f520-08dce435f642
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?JQLKUAYkhaUnx8YP+ZM6guvcfc8FcVx5wjweLj+8U2wKRkX0ziyQjSGEcUig?=
 =?us-ascii?Q?XPBgu92ObEc4vq5xS9wBDY33XY8loE8N9RrO0UtPVMWP2oAiJSTcNRrjvL+f?=
 =?us-ascii?Q?4knies5ZszuRWNeAEkWgLVcCZ2EtTK3DscUtX0aR085AXRZSd9cpAB6hDDqH?=
 =?us-ascii?Q?IpOPjrOsZ+J7S0cG05b4AEBRl+V+LLCesQL4nVgLKtpVStzw+hJK7MFBakvS?=
 =?us-ascii?Q?MHCyE5sCXgU7tNqPQrg+DeBbB84bAlyI+UGlGRnYp7mL55ryhyU1UYojUX4Z?=
 =?us-ascii?Q?kmJQUO7rqn33Ass8DK8hXZHAZ/iacBsVOiXNRFW5vrw4Bsv3pGcdTtIF5h3G?=
 =?us-ascii?Q?/8H3hGTelMFrkTQASjTo/CZ8s+ZKzMKqPzQf+Zdi9HmAwmVh1t21VBHqwIHy?=
 =?us-ascii?Q?9yRguGN4ZZ43Sc7q/ezcOMVtSz/YJ+ZBuN3u62TNZhe9xS25/LNW9bO+Q8oR?=
 =?us-ascii?Q?DylqBcFT76DoI2nJy9Px4QS1Qyv2UAuVzJYWyVcc21sw0Ow5f7qF+zQz/iJH?=
 =?us-ascii?Q?tjHmXuzHZO+vbpfQxV80Ql5mlWS+inOWUlCLoRf3YkcQlURGV1jlDOkeiWS4?=
 =?us-ascii?Q?AUpjxOr92HV/isQtIuppjFJK+yzhK6xvyhY0qosOi/uCvuq39wO41FrcJRvu?=
 =?us-ascii?Q?VRBcJszfKqu/PyKGpSQztCU33gru+Bri0Q1K29wgIAIAzUjHW0eO+IDsElfE?=
 =?us-ascii?Q?JPIpTAWj+zlvTTeaNTlLMva9fynx5utqg0LtExPBDyIVB1R0X0ZLGAT5hF0G?=
 =?us-ascii?Q?YxolyrCzxjvgSugPu3MsnnRd5qiSEV4jmQZaG07nQYd3XFAUhMnjOg/kDRbA?=
 =?us-ascii?Q?ZnAG16PglMVfc6iOhiS+TgWCwRYva/Shkw4d0yrtQXCslx6EQfzqt6IqSfLe?=
 =?us-ascii?Q?HN/kZz1EvxFD90CaQNgZlPoHwFldOCcJwLVZRAWeZ5hT6eDN9NQ2yVjCaJxJ?=
 =?us-ascii?Q?meWWtzygHo3Bv93pmKlZxh3HQbD0ApnsUdFWUvj3eJ0emdzw/hBJQkaAG7EM?=
 =?us-ascii?Q?D2CK7DWWfC8Dz0xHRCmkXg73VcDZkkuchSYxBcCoKH+qzh9fIgsQHK2QIl8k?=
 =?us-ascii?Q?UUGMdeTxp6OHlYVF7FNtwGPfOovTl2qnsWc+yiuZZtZrB/PVNl56WdSF05M+?=
 =?us-ascii?Q?wlzeCe9ltzv4rrtUlPl0JsABdCITUvQW4bovw1XvxUvkC5qHepVHXRl85axx?=
 =?us-ascii?Q?2po5ISEp/6QnyAc5mKHwESLKfPa7G0qUKmXdTUKSLoTeX4eaZ3SNp6sYVtQE?=
 =?us-ascii?Q?wSSZkzqaTKANqx7uXKIvbgJztbReJ+mqZWbfgdk2I7INNnv0y9Y6B1MFfk/8?=
 =?us-ascii?Q?rxaQIBD0ksd217BX7EkTfCBL159UAk/30CweNhnuOlL1Ig=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NQEqPPMiN7lAUrCx8XOuMl0JK38Z/nGWLElDxnFAs/JIsbEqzdcvhf2OrF/k?=
 =?us-ascii?Q?7lSmB+3VA4YRD2GQRBQHra6mfqS+c5vO7hMQhepLAIMvO1xrFNtenRbwB7dI?=
 =?us-ascii?Q?+7/8/ltqdszrV0RizwjfhT5kZ51opI5SSaxi5STcXtFXpdyE2bEGlFtkJiQP?=
 =?us-ascii?Q?rFkYLr+UQIxyP4rpbTebZGPJlLK92pWM8W4VWtxwnc1wbtuaClhX09OpRn8X?=
 =?us-ascii?Q?sEWAxTmxwWRU2ROo0HeiHJ9dhUnJNQr4K305eAo1ifEF72uQnQjvZwm1y83F?=
 =?us-ascii?Q?KH4RwsBZ8SulElICpZiwlU7SELoPGektEKSGe7zIIJOa3T0WvPgw4fLrqJJO?=
 =?us-ascii?Q?gfeESRTgJFlaF+7unrAk/TSa0tOqrX1jdanWFBQfGecBCIhfcly/9lEMTaCj?=
 =?us-ascii?Q?GwRI0+0x/8UQKl27XNXS9LlGe/+zwSltjOjrT3CW1YJFFGm8X9AO1zN0AG+L?=
 =?us-ascii?Q?o1fOZl9sU+3iAwsBCDdyVkUnE4Jju+V+wN2etlxP81FDf3tTWnDIqrmLcqbF?=
 =?us-ascii?Q?Q5UPCQ/355i+COztzHRQ8aq5PYyaW3bU3a9RInAa5xRz801iRxIsY8P2iEQt?=
 =?us-ascii?Q?6DY69dge55CRthTTtl42EjR32ZoyOmyUCKXsNSFo5CMieeHNajBDrBAw/hzc?=
 =?us-ascii?Q?Vvaf/y+OmfNV7azqbfd0pfCKnYkK4RWb725lA+YGO/ZtxwOAH331P+Rq+Jxh?=
 =?us-ascii?Q?fh90mIE8vVt6nRjNDDpr4XYt7UKI8zaZ2oiBh8Z4dDSYu0AK2C7ju8dpnmrr?=
 =?us-ascii?Q?HMK8wa3QN9QTE8eJl5BJwPoCpyZQxU2m97mZEQeDUbdUYJpcnKaty857vJoT?=
 =?us-ascii?Q?MHeFGxU8sSZhHvQtizfdr5VSbzAQ6IpiQiz4oRfnhhs9wAlCkumnIYWc4rkM?=
 =?us-ascii?Q?d9vGV9394XqqpB3ruPLORTuMx+VOjp0TwwPcyajgu5ST4LGzctaMrvls4qgm?=
 =?us-ascii?Q?U8fhddbIOtrL8cY8K+/ZyBB1tM63FoqYe8ToxhruU8Yd5KnLgEhDvknnqpsp?=
 =?us-ascii?Q?+jpwcFGGZK1xBwiJQLXwjy70gADFGG/EHvEoVBxXtIUq4YDLE1D07XN0hz6s?=
 =?us-ascii?Q?6Atinm+oO3gcG5V7aEL84E3hAeGJhCQhtPxsutOz4WOESd+Z7JbiRvBxZxuz?=
 =?us-ascii?Q?i4TQgV5ENl9ISGcr6J1kWJkYKx0e0UxyKJamEb7yyuvA0j3Q23wasCeK2BhB?=
 =?us-ascii?Q?sbRpd095P4JuV5nEdGZofKiiWfMIEHUSn0MOgwh6XAKf3wjVKXKZoQIyrLW5?=
 =?us-ascii?Q?jdqmxpywYPTym/CjzChck4g+slXFYkCMM2M89Sc2OwhpTZ3KH3c48TQW1y7U?=
 =?us-ascii?Q?ezDbZ6kFUmpHrObyV4cHYBLWYCVC2LJkW5/JeEy7PfoxhjV1LXLbzsSTV8Hm?=
 =?us-ascii?Q?HxoGoUOVAYT5zfDYCyKNpaH3NGmCPCmYr4z3q2aG9RUjLIYuNSrKqcKytu6F?=
 =?us-ascii?Q?MRFLbDorPGauZ09PRzjP4gCQsuc47i+tKjjOq5Blawn2KsrBzTKnOx2eNflJ?=
 =?us-ascii?Q?gLYPXnyBaoiD46VDq0nsx3fKd1DvBNyH7VQHdvtUbeUxMrw21pkk0XF4mLX1?=
 =?us-ascii?Q?atbbjMm/YN3ioua3gnz36eDCAAWwjYJ8TSK6k3aIHOoMScnzU8bPT1+tRp1p?=
 =?us-ascii?Q?rQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR11MB27045F424115435C60CC64D9DB722SN6PR11MB2704namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f86d5d-8b0d-46ef-f520-08dce435f642
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 05:32:39.5537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JzirUGa5pUysPPfQLNugVlOqjsa7nb6lh4Rtv6Q6fzPyVEThIjrD8zFkbEUFBJqW6DQpsoH15NpwZJ9KdxwURGjzFm/DFeUK0+AAdsltsYQFzkD6/T7eizlNBpST0odg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6926
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

--_000_SN6PR11MB27045F424115435C60CC64D9DB722SN6PR11MB2704namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Suraj,

Agreed, we do have similar functionality in kms_brightness, but it requires=
 some adjustments .
I plan to move these functions "backlight_read" , "backlight_write" to lib/=
igt_sysfs and make the necessary modifications at a later stage.

Please provide your thoughts on this approach.

Regards,
Santhosh

From: Kandpal, Suraj <suraj.kandpal@intel.com>
Sent: Friday, October 4, 2024 10:50 AM
To: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; igt-dev@lis=
ts.freedesktop.org
Cc: Samala, Pranay <pranay.samala@intel.com>; Reddy Guddati, Santhosh <sant=
hosh.reddy.guddati@intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulati=
on in HDR mode

From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com<mailto:sant=
hosh.reddy.guddati@intel.com>>
Sent: Wednesday, October 2, 2024 8:26:33 pm
To: igt-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org> <ig=
t-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org>>
Cc: Samala, Pranay <pranay.samala@intel.com<mailto:pranay.samala@intel.com>=
>; Kandpal, Suraj <suraj.kandpal@intel.com<mailto:suraj.kandpal@intel.com>>=
; Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com<mailto:santhosh=
.reddy.guddati@intel.com>>
Subject: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation i=
n HDR mode


Add subtest for backlight control on hdr enabled edp panels
by changing brightness via sysfs.

v2: adjust brightness range, refactor and restore brightness (Pranay)

v3: reuse functions, add flags to avoid duplicate code (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com<mai=
lto:santhosh.reddy.guddati@intel.com>>
---
 tests/kms_hdr.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f123c6b36..0f07e770b 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -64,6 +64,10 @@
  * Description: Tests static toggle with suspend
  * Functionality: colorspace, static_hdr, suspend
  *
+ * SUBTEST: brightness-with-hdr
+ * Description: Tests brightness with HDR
+ * Functionality: colorspace, static_hdr
+ *
  * SUBTEST: static-%s
  * Description: Tests %arg[1].
  * Functionality: colorspace, static_hdr
@@ -81,6 +85,8 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bp=
c switch");
 #define HDR_STATIC_METADATA_BLOCK       0x06
 #define USE_EXTENDED_TAG                0x07

+#define INTEL_BACKLIGHT_PATH "/sys/class/backlight/intel_backlight"
+
 /* DRM HDR definitions. Not in the UAPI header, unfortunately. */
 enum hdmi_metadata_type {
         HDMI_STATIC_METADATA_TYPE1 =3D 0,
@@ -100,6 +106,7 @@ enum {
         TEST_SWAP =3D 1 << 3,
         TEST_INVALID_METADATA_SIZES =3D 1 << 4,
         TEST_INVALID_HDR =3D 1 << 5,
+       TEST_BRIGHTNESS =3D 1 << 6,
 };

 /* BPC connector state. */
@@ -448,6 +455,72 @@ static void fill_hdr_output_metadata_st2048(struct hdr=
_output_metadata *meta)
         meta->hdmi_metadata_type1.max_cll =3D 500;   /* 500 nits */
 }

+/* TODO: Move adjust_brightness to lib/igt_sysfs to reuse in other tests. =
*/
+static void adjust_brightness(data_t *data, uint32_t flags)

-----------------
 Do we not have a function in kms_brightness to manipulate brightness let's=
 reuse that rather than writing the whole function here

Regards,
Suraj Kandpal

----------------------
+{
+       char brightness_path[1024];
+       int brightness_fd;
+       char brightness_value[64];
+       int current_brightness;
+       int max_brightness;
+       int read_brightness;
+       int fd, i;
+
+       /* Get max brightness */
+       snprintf(brightness_path, sizeof(brightness_path),
+                "%s/%s", INTEL_BACKLIGHT_PATH, "max_brightness");
+       fd =3D open(brightness_path, O_RDONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0=
);
+
+       max_brightness =3D atoi(brightness_value);
+
+       close(fd);
+
+       /* Get current brightness */
+       snprintf(brightness_path, sizeof(brightness_path),
+                "%s/%s", INTEL_BACKLIGHT_PATH, "brightness");
+       fd =3D open(brightness_path, O_RDONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0=
);
+
+       current_brightness =3D atoi(brightness_value);
+
+       close(fd);
+
+       for (i =3D 0; i <=3D max_brightness; i +=3D 50) {
+               fd =3D open(brightness_path, O_WRONLY);
+               igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_p=
ath);
+
+               snprintf(brightness_value, sizeof(brightness_value), "%d", =
i);
+               igt_assert(write(fd, brightness_value, strlen(brightness_va=
lue)) > 0);
+
+               close(fd);
+
+               /* Verify brightness adjustment */
+               fd =3D open(brightness_path, O_RDONLY);
+               igt_assert(fd >=3D 0);
+
+               igt_assert(read(fd, brightness_value, sizeof(brightness_val=
ue)) > 0);
+
+               read_brightness =3D atoi(brightness_value);
+
+               igt_assert_eq(read_brightness, i);
+
+               close(fd);
+       }
+
+       fd =3D open(brightness_path, O_WRONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       snprintf(brightness_value, sizeof(brightness_value), "%d", current_=
brightness);
+       igt_assert(write(brightness_fd, brightness_value, strlen(brightness=
_value)) > 0);
+
+       close(fd);
+}
+
 static void test_static_toggle(data_t *data, enum pipe pipe,
                                igt_output_t *output,
                                uint32_t flags)
@@ -483,6 +556,9 @@ static void test_static_toggle(data_t *data, enum pipe =
pipe,
                 igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown=
 EOTF [0-9]+\""), 0);
                 goto cleanup;
         }
+       if (flags & TEST_BRIGHTNESS)
+               adjust_brightness(data, flags);
+
         igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);

         /* Verify that the CRC are equal after DPMS or suspend. */
@@ -685,7 +761,8 @@ static void test_hdr(data_t *data, uint32_t flags)

                         igt_dynamic_f("pipe-%s-%s",
                                       kmstest_pipe_name(pipe), output->nam=
e) {
-                               if (flags & (TEST_NONE | TEST_DPMS | TEST_S=
USPEND | TEST_INVALID_HDR))
+                               if (flags & (TEST_NONE | TEST_DPMS | TEST_S=
USPEND |
+                                            TEST_INVALID_HDR | TEST_BRIGHT=
NESS))
                                         test_static_toggle(data, pipe, out=
put, flags);
                                 if (flags & TEST_SWAP)
                                         test_static_swap(data, pipe, outpu=
t);
@@ -734,6 +811,10 @@ igt_main
         igt_subtest_with_dynamic("static-toggle-suspend")
                 test_hdr(&data, TEST_SUSPEND);

+       igt_describe("Tests brightness while entering and exiting HDR mode"=
);
+       igt_subtest_with_dynamic("brightness-with-hdr")
+               test_hdr(&data, TEST_BRIGHTNESS);
+
         igt_describe("Tests swapping static HDR metadata");
         igt_subtest_with_dynamic("static-swap")
                 test_hdr(&data, TEST_SWAP);
--
2.34.1


--_000_SN6PR11MB27045F424115435C60CC64D9DB722SN6PR11MB2704namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Hi Suraj,=
<br>
<br>
Agreed, we do have similar functionality in kms_brightness, but it requires=
 some adjustments .<br>
I plan to move these functions &#8220;backlight_read&#8221; , &#8220;backli=
ght_write&#8221; to lib/igt_sysfs and make the necessary modifications at a=
 later stage.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Please pr=
ovide your thoughts on this approach.<br>
<br>
Regards,<br>
Santhosh<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Kandpal, Suraj &lt;suraj.kandpal@intel.com&gt;
<br>
<b>Sent:</b> Friday, October 4, 2024 10:50 AM<br>
<b>To:</b> Reddy Guddati, Santhosh &lt;santhosh.reddy.guddati@intel.com&gt;=
; igt-dev@lists.freedesktop.org<br>
<b>Cc:</b> Samala, Pranay &lt;pranay.samala@intel.com&gt;; Reddy Guddati, S=
anthosh &lt;santhosh.reddy.guddati@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness man=
ipulation in HDR mode<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><strong><span style=3D"font-size:11.0pt;font-family:=
&quot;Aptos&quot;,sans-serif">From:</span></strong><span style=3D"font-size=
:11.0pt"> Reddy Guddati, Santhosh &lt;<a href=3D"mailto:santhosh.reddy.gudd=
ati@intel.com">santhosh.reddy.guddati@intel.com</a>&gt;</span><o:p></o:p></=
p>
</div>
<div id=3D"mail-editor-reference-message-container">
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><strong><span style=3D"font-size:11.0pt;font-family:=
&quot;Aptos&quot;,sans-serif">Sent:</span></strong><span style=3D"font-size=
:11.0pt"> Wednesday, October 2, 2024 8:26:33 pm<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">To:</span>=
</strong> <a href=3D"mailto:igt-dev@lists.freedesktop.org">
igt-dev@lists.freedesktop.org</a> &lt;<a href=3D"mailto:igt-dev@lists.freed=
esktop.org">igt-dev@lists.freedesktop.org</a>&gt;<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">Cc:</span>=
</strong> Samala, Pranay &lt;<a href=3D"mailto:pranay.samala@intel.com">pra=
nay.samala@intel.com</a>&gt;; Kandpal, Suraj &lt;<a href=3D"mailto:suraj.ka=
ndpal@intel.com">suraj.kandpal@intel.com</a>&gt;; Reddy Guddati,
 Santhosh &lt;<a href=3D"mailto:santhosh.reddy.guddati@intel.com">santhosh.=
reddy.guddati@intel.com</a>&gt;<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">Subject:</=
span></strong> [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipula=
tion in HDR mode<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><br>
<br>
<span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Add subtest for bac=
klight control on hdr enabled edp panels<br>
by changing brightness via sysfs.<br>
<br>
v2: adjust brightness range, refactor and restore brightness (Pranay)<br>
<br>
v3: reuse functions, add flags to avoid duplicate code (Suraj)<br>
<br>
Signed-off-by: Santhosh Reddy Guddati &lt;<a href=3D"mailto:santhosh.reddy.=
guddati@intel.com">santhosh.reddy.guddati@intel.com</a>&gt;<br>
---<br>
&nbsp;tests/kms_hdr.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++=
-<br>
&nbsp;1 file changed, 82 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c<br>
index f123c6b36..0f07e770b 100644<br>
--- a/tests/kms_hdr.c<br>
+++ b/tests/kms_hdr.c<br>
@@ -64,6 +64,10 @@<br>
&nbsp; * Description: Tests static toggle with suspend<br>
&nbsp; * Functionality: colorspace, static_hdr, suspend<br>
&nbsp; *<br>
+ * SUBTEST: brightness-with-hdr<br>
+ * Description: Tests brightness with HDR<br>
+ * Functionality: colorspace, static_hdr<br>
+ *<br>
&nbsp; * SUBTEST: static-%s<br>
&nbsp; * Description: Tests %arg[1].<br>
&nbsp; * Functionality: colorspace, static_hdr<br>
@@ -81,6 +85,8 @@ IGT_TEST_DESCRIPTION(&quot;Test HDR metadata interfaces a=
nd bpc switch&quot;);<br>
&nbsp;#define HDR_STATIC_METADATA_BLOCK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0x06<br>
&nbsp;#define USE_EXTENDED_TAG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x07<br>
&nbsp;<br>
+#define INTEL_BACKLIGHT_PATH &quot;/sys/class/backlight/intel_backlight&qu=
ot;<br>
+<br>
&nbsp;/* DRM HDR definitions. Not in the UAPI header, unfortunately. */<br>
&nbsp;enum hdmi_metadata_type {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HDMI_STATIC_METADATA_TYPE1=
 =3D 0,<br>
@@ -100,6 +106,7 @@ enum {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_SWAP =3D 1 &lt;&lt; 3=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_METADATA_SIZE=
S =3D 1 &lt;&lt; 4,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_HDR =3D 1 &lt=
;&lt; 5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_BRIGHTNESS =3D 1 &lt;&lt; 6,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;/* BPC connector state. */<br>
@@ -448,6 +455,72 @@ static void fill_hdr_output_metadata_st2048(struct hdr=
_output_metadata *meta)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-&gt;hdmi_metadata_typ=
e1.max_cll =3D 500;&nbsp;&nbsp; /* 500 nits */<br>
&nbsp;}<br>
&nbsp;<br>
+/* TODO: Move adjust_brightness to lib/igt_sysfs to reuse in other tests. =
*/<br>
+static void adjust_brightness(data_t *data, uint32_t flags)<o:p></o:p></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-----------------<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;Do we not hav=
e a function in kms_brightness to manipulate brightness let's reuse that ra=
ther than writing the whole function here<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Regards,<o:p></o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Suraj Kandpal<o:p><=
/o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">----------------------<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char brightness_path[1024];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int brightness_fd;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char brightness_value[64];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int current_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int max_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int read_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd, i;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get max brightness */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_path, sizeof(brig=
htness_path),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;%s/%s&quot;, INTEL_BACKLIGHT_PATH, &quot;max_brightn=
ess&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_RDONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(read(fd, brightness_value,=
 sizeof(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_brightness =3D atoi(brightness_va=
lue);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get current brightness */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_path, sizeof(brig=
htness_path),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;%s/%s&quot;, INTEL_BACKLIGHT_PATH, &quot;brightness&=
quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_RDONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(read(fd, brightness_value,=
 sizeof(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_brightness =3D atoi(brightnes=
s_value);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt;=3D max_brightnes=
s; i +=3D 50) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fd =3D open(brightness_path, O_WRONLY);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Failed to open %s\n&quot;, brig=
htness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(brightness_value, sizeof(brightness_value), &quot;%d&qu=
ot;, i);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(write(fd, brightness_value, strlen(brightness_value))=
 &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Verify brightness adjustment */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fd =3D open(brightness_path, O_RDONLY);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(fd &gt;=3D 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(read(fd, brightness_value, sizeof(brightness_value)) =
&gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; read_brightness =3D atoi(brightness_value);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert_eq(read_brightness, i);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; close(fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_WRONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_value, sizeof(bri=
ghtness_value), &quot;%d&quot;, current_brightness);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(write(brightness_fd, brigh=
tness_value, strlen(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+}<br>
+<br>
&nbsp;static void test_static_toggle(data_t *data, enum pipe pipe,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t flags)<br>
@@ -483,6 +556,9 @@ static void test_static_toggle(data_t *data, enum pipe =
pipe,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert_eq(system(&quot;dmesg|tail -n 1000|grep -E=
 \&quot;Unknown EOTF [0-9]+\&quot;&quot;), 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto cleanup;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; TEST_BRIGHTNESS)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adjust_brightness(data, flags);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_output_bpc_equa=
l(data-&gt;fd, pipe, output-&gt;name, 10);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Verify that the CRC are=
 equal after DPMS or suspend. */<br>
@@ -685,7 +761,8 @@ static void test_hdr(data_t *data, uint32_t flags)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_d=
ynamic_f(&quot;pipe-%s-%s&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kmstest_pipe_name(pipe), output-&gt;name) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; (TEST_NONE | TEST_DPMS | TE=
ST_SUSPEND | TEST_INVALID_HDR))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; (TEST_NONE | TEST_DPMS | TE=
ST_SUSPEND |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_HDR | TEST_BRIGHTNESS))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; test_static_toggle(data, pipe, output, flags);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; TEST_SWAP)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; test_static_swap(data, pipe, output);<br>
@@ -734,6 +811,10 @@ igt_main<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&=
quot;static-toggle-suspend&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_hdr(&amp;data, TEST_SUSPEND);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests brightness w=
hile entering and exiting HDR mode&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;bright=
ness-with-hdr&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; test_hdr(&amp;data, TEST_BRIGHTNESS);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests s=
wapping static HDR metadata&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&=
quot;static-swap&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_hdr(&amp;data, TEST_SWAP);<br>
-- <br>
2.34.1<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_SN6PR11MB27045F424115435C60CC64D9DB722SN6PR11MB2704namp_--
