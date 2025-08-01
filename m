Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF02C87FD2
	for <igt-dev@archiver.kernel.org>; Fri,  1 Aug 2025 07:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DB410E304;
	Fri,  1 Aug 2025 07:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lruxy0yY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F11E10E304
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Aug 2025 07:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754034958; x=1785570958;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y9P2DfIsgGrn0e8ZRb8LQpdoiizutwjgeIM0/gqTN24=;
 b=Lruxy0yYfXq0wCXEF2k0XSL0cUXjwd7KfKiEth1VmWFA33C5VVuCv8E9
 HeePFlmEMVemCIz/edKnbe9cvTbbYnfpQ/czMSQ4h4SWkbSjCoSe1bsy2
 FSTcoa19PNJJclfXXADvQ8JS69zGX34dMjxe7IQEAGk7pOVEwfQnPvTpw
 tpAq0UrZuzMIl+QH105yLOKClrb6RU/XZ5FOuNLK/bWIvMFE97lQE9wRh
 4OKGFrTsTn2UxfMPSBGlWjwe0B549mObep06o9GHIH+9DWeQ0Ld3MSUiy
 LAo+rsV6/HYRN19fTA8LvLwJiPYkbPQZTt08//wNe3fNIA0Ikjns8BxgK g==;
X-CSE-ConnectionGUID: blDlXaEVRMeX/BinlGTjMg==
X-CSE-MsgGUID: FCh36eFSQ/Ku5rFrxBXwaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60018978"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="60018978"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 00:55:58 -0700
X-CSE-ConnectionGUID: wF5HH/N2S5GQv/kBrB0zLw==
X-CSE-MsgGUID: ZkUxCEvvRS+/0z18rLXmfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163942857"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 00:55:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 00:55:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 00:55:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.72) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 1 Aug 2025 00:55:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtsgkmKgpJ383fU0mu/kvGrkzlqw3UEp4fUoCncbYbYO/CFXqS0KPCtBQkk7DWTTcmY6fEJDL+GonPk3y7xs4/QrRBM7bVtZRJ0YXNd7Q4muFNrbvMf6rv8es5u0saX9jeYureeWo7QvY1s5n1buedU+9NNnMbURrqz2yVpUyJ+BPaidfDs7wNWEgcC852GdytF35xrFAoD3FFYQFVL8+fanal23lR9eYNEeh3SNUiwJSCIN2EjhiZrrYELINCL4tGNg9nlzrCajHshdejeKpl86D/X5CR3XoSnz1PHmJhryQO7+1rZNnF1e/leB4qpdF1VX5uV7CSzySVLDEL9L7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsSs8h7QIhlp13O/GEdKGYZvFFtx42O3vyxnuFydhQM=;
 b=eTar5kJFNgzhivjp0qWbK6ZRnMn8zzMQDnJKT6ecaZExUrlOnlGnLqNSqt0fLCzGIdoA3p31t23BhWwxzUoHhigsr+x52cxaEC16pbmEFv2NM9AELb7hL0VtWGrpxBl1cqZqUr7jCSSZABIly5UltaqxuUPhgtcdO3VqHx8HtpKMrgxfElsW9Nh6H5ARFHNwCUafxNcCsD6GrFuUfc7MEfBdzE1vLJXtgio82JsH0ITc+ze/7543+JfZz+UNkNOSCKjysy3vFff7zJu9qTPNL8NWFnPMXAiSqtjiz1fWqf125YpBn0h9uFFlpqjOatqVXbKxGoagvkSDSLR0B7yjkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by MN0PR11MB6012.namprd11.prod.outlook.com (2603:10b6:208:373::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 07:55:55 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52%6]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 07:55:55 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] tests/kms_vrr: Improve VRR test robustness
 with cleanup before assertions
Thread-Topic: [PATCH i-g-t v1 1/2] tests/kms_vrr: Improve VRR test robustness
 with cleanup before assertions
Thread-Index: AQHb8FRa68pi+rnk1U+SYYG+V5fF7LRNkGZw
Date: Fri, 1 Aug 2025 07:55:55 +0000
Message-ID: <IA1PR11MB6348CC2DDDF8157E06628A4FB226A@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20250708220502.803610-1-ramanaidu.naladala@intel.com>
 <20250708220502.803610-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20250708220502.803610-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|MN0PR11MB6012:EE_
x-ms-office365-filtering-correlation-id: e2af7262-71b7-47a3-f5dc-08ddd0d0d7ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?D4cradiGgKNjaQBtHPq1d3QFiAJV2XxYw/PHtERBoRvR2BuwOkT8wLleF83A?=
 =?us-ascii?Q?/q0mJWBD9pcLnWg1Iqogar4p6GNwMAdPC0+9E//tqNraBW6RtUQBs7DQDPuL?=
 =?us-ascii?Q?ovwlPpXxTXHonHRPoCg2RKBlw2S75PoxU2a79IfgpBMD/G4SVa545MNzH+YL?=
 =?us-ascii?Q?w13YtDVUCcSN1N7Z7iMTq30wcyHCkMcivEMHN96ZmmyxHYakmz/paIdHhH8e?=
 =?us-ascii?Q?L9ed5ita24/BR5jE1vHQYmghRNPbRejWMebEvwC9sXaITc8zTVjFLwMr5vbP?=
 =?us-ascii?Q?6VhnnweapPn51F+fg8USkEK0+vMzFLTpalWbiOeGzNU3oua7y3vS4CSfd+yX?=
 =?us-ascii?Q?GtAEoKehyXC2hepH/NhCGhtO6pi9sAS+XOvOPMt5E0LukpOkavjNp/Ys4MGc?=
 =?us-ascii?Q?Mu3QHWn76poucdONKj4XXNrJFHRvzx5MyDXFxfzt6XkmK6NehGfzn3NwRHli?=
 =?us-ascii?Q?n8Qn7eynwOcnWHK21GmYUmU9CafTe4huCDf4T14ph8Nq24ev7uv4qDDDSPoW?=
 =?us-ascii?Q?Unbns6tmTM+goe1x7XP4MTzmrPvm+NsDlenNzbchz6uq8Z8p47Z2om+EsbzS?=
 =?us-ascii?Q?vwj2GhvpShtZyWerGtK/qqptYjjECTsrqlxQD5VCbKaHFJZh8GhFF6wS1ye5?=
 =?us-ascii?Q?qwdnqMDYmjLMFbuvYkPIkX7UvFRotztdupHSKgO67GKW1So3ek8aoAdrQhgV?=
 =?us-ascii?Q?oQgOBSeeZvmYFU3LHc2NyaxujscaHAeBaFOJXMBtIKnzpY444X0l0YWQUdQ0?=
 =?us-ascii?Q?yrisqscLU3+d4MapYfiv/PlLjWEWkn09AN4rcFbci+Tllw3xDHIbZeQS12aE?=
 =?us-ascii?Q?SJD3GaJRTyk1yYJ5ZyKf71kT+n6UQk9iypuUavWf+w/nQfH2tesQNSnLzU5l?=
 =?us-ascii?Q?3+ZeRcxCXL8eaGUFm35U6d3f5Q/npyn2dmMBzoAzQteUANnlXhCgt8KBViIa?=
 =?us-ascii?Q?ggLd2zlmXhBmvEmOr8akVqPGRxGN3e0uyaDtF1yoGRkt19TqmC4BD48FLGhA?=
 =?us-ascii?Q?ljy8O2guQo/nCCELszgRcDQJmXYxkDpjTMtPQ+m8dddGcXnFvQk6aWjCJPP+?=
 =?us-ascii?Q?PdrKCzt6SdMfTqt65591XWIH/bRruk3SYxStJzggrVWE7YCx9WjOUbbTPIoA?=
 =?us-ascii?Q?MTeeok9WPC3QkSI3w6rKu/bVm6qstbrtS1yiKM/5BkLtyboPNebvXJW/AxEP?=
 =?us-ascii?Q?1gArOLdIlIOJwwxRBz5bIR4PPKXFmWmifIWRJ4GVojR4MgkQE1xMNbpGkg7h?=
 =?us-ascii?Q?RvcSvraYWHdGqK5cfTEwek3nRb9vQ8kFgnz5aSPP4OckLWgkKCXEnDC+0AT0?=
 =?us-ascii?Q?divcTeoeegcutYGdcQNL6N9LU6dAyrznF17pG3tWR4oe1+60UR2lOPZX3Y9k?=
 =?us-ascii?Q?2bmPONUnlXh8AFW8m4RIFiXoC8MoNco8K8GBmvcV28dUH758ZIdVdrqs6OHN?=
 =?us-ascii?Q?6z1tEyG18mZXEgSaCF8jgbbvjwcVrg1WslJNd8GVtRljdmdqEX2Zig=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gDshyXfJXRqeVXT3rxvWuh5OISEclkmT/q4sWbZV7UCgfv9JvVo4JWjhhnxN?=
 =?us-ascii?Q?2cam+J8kl+Ot7jLCKkO4M5fA5TRkYs8HI/QSQYDQAanBfVNiUexGwHimvaq8?=
 =?us-ascii?Q?O0x7TVxkkieZzt4TH2orjtPgb5T6gtufz04FOOax9boVIK86LYDL0BFKPIIQ?=
 =?us-ascii?Q?UfkM84ayMr/83PLtGtZguq8iCaw2FYBgTJ2VE3oppgK3sE/62rXcZ//7dsWa?=
 =?us-ascii?Q?WwZRg/5nCmSZg5ZsWwp6ga/jtNS6I+vkZ+1FhQ8rOPk5fPAXHInd7yju82GR?=
 =?us-ascii?Q?1/iS1lxlMAMOsbQD7GGVtJo/ETHtaSoJ/CnlGrHWs5gy2BNZ22Dkba943hvd?=
 =?us-ascii?Q?WX0j9oVppnjbsGj6+zqOnRErHWBCHH6SJ66HzBJ9KtSe5XQeTc5LHiWTElXR?=
 =?us-ascii?Q?6qsGqRcpCfFkrEdQtqTsubY0+lnh3GzNxWcsZYXEvvBsoM6xercwRfjXZEpe?=
 =?us-ascii?Q?MwZfFIl9wsElHC/tr4t6N/s9PZpcMUUnsV7N1utrdZx2SPlHmSQmLFuzzc3p?=
 =?us-ascii?Q?/a9fY6iVYZwHhdhLqTIwSxAIIFPF64lmCst/Yg7G57oZ697CUuxMpXXslD63?=
 =?us-ascii?Q?AjYGJNkkpuidzePCs7MOY1pqn4USexD71ZZop6ydF7Miem2ZNMI2McBf6h4z?=
 =?us-ascii?Q?6FIkJY/M5XWT1pbIwM99cC27GgFEjbr7hmaHf7DhGtD6oHnxh31mqIAhBZuv?=
 =?us-ascii?Q?X7i4eFFUA7uxxJm0j1V8vThgG3E84l1fDW6nnVsBu69upM4jRmEqewPhDJTz?=
 =?us-ascii?Q?encvaDSkyOEXXkE4uSiCmimk3CLTicikJ5DiRLQs3fIj9MmNLNmX80z6QvId?=
 =?us-ascii?Q?+bL7mzs9/QvXjYkiDezcBeJJUvKsxt1Nsbh9cLOneXiLwF/HRESi79FeZ+Yq?=
 =?us-ascii?Q?bYwPG7f8R2a57mtolbDJB8PddLma+K4T74BriXrTlq9g+xjLWRkSfpM6WhhI?=
 =?us-ascii?Q?CBFtVG+tlUIc4pjkuXy/LfoC68/anic7VjrG6RVx8AUbgNHV2IZLqocBudLp?=
 =?us-ascii?Q?ih6PPWl3hNOj0t5eieDF3xYjNeCryPbjFgjE6U3uETFczq7WDiiRNqFezbsB?=
 =?us-ascii?Q?UkoCmjczHhwL78tQbTsAUctowosqqcwL2i60XlfN/rYrs9OBGVXr8ycK/PPR?=
 =?us-ascii?Q?nwOi84Lfzzal3IehlxTCNE8ewH9XGQBRtYsoxeLUz1GUCqxJdYiHSInbSHSc?=
 =?us-ascii?Q?3O55FSc4Bh8+n+hc/kf2X6V8PbuTXzUUMBQ3KTfurDyut1EWcFs3eBNC4zcp?=
 =?us-ascii?Q?vv5fx5p/4xW6crydruBzGqqdX2gvHDLzItXjBmR/fvBeFLgi48EPxyqT83fA?=
 =?us-ascii?Q?E1LX9Oxb3ydE9Wr/NfCF1gyrB2L7flkHz4wU0chCoz2PjlR0+JS40CSm394l?=
 =?us-ascii?Q?5FeR87v/8RVGLm0XwlJxCxWcnVg8ttrEMk3qDYd/+owTm0vNZmpLcYYTqlfI?=
 =?us-ascii?Q?zmpdvhGnV5ZztGJBsGoAtXo30Ov3mcj0QVObiDHd92nHWb7xz5g5q3VRP9Hd?=
 =?us-ascii?Q?HzJVCd4Q+pnONF10yrpOHzf6oAMsBB2VQjwekpPTNpshp8daeKGA10Smme1h?=
 =?us-ascii?Q?0n/qbqky51VEhDP+avNMekdi+Q0JCZci1Z5MMgRdo+1mw1WQu2JXTlL1ZhT5?=
 =?us-ascii?Q?rdb92SYSn5V6J5YPxiZoAdo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2af7262-71b7-47a3-f5dc-08ddd0d0d7ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 07:55:55.1043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0UXTYXxQwKOniacSxTKzevhjQqrGkD/ftiTt4VjOs4YPFxdGP+/elTp8ug7y20XK+NuYkoEXdDuGdirJu8A9hdzpd0tZLK4F93NPA0Nr+0GnGQnT069x+wCFNaFrcipU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6012
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: 09 July 2025 03:35
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Golani, Mitulkumar
> Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1 1/2] tests/kms_vrr: Improve VRR test robustness =
with
> cleanup before assertions
>=20
> The robustness and maintainability of the VRR (Variable Refresh Rate) by
> ensuring proper cleanup is performed before any assertion failure is trig=
gered.
>=20
> Previously, when a test failed due to not meeting the expected VRR thresh=
old,
> the test environment was not always cleaned up properly.
> This could lead to resource leaks or inconsistent states that might affec=
t
> subsequent tests, making debugging more difficult.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 161 +++++++++++++++++++++++++++++++-----------------
>  1 file changed, 105 insertions(+), 56 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 9c2c4ac92..a24f413de
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -241,6 +241,18 @@ low_rr_mode_with_same_res(igt_output_t *output,
> unsigned int vrr_min)
>  	return mode;
>  }
>=20
> +static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t
> +*output) {
> +	igt_pipe_set_prop_value(&data->display, pipe,
> IGT_CRTC_VRR_ENABLED,
> +false);
> +
> +	igt_plane_set_fb(data->primary, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_override_mode(output, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_remove_fb(data->drm_fd, &data->fb[1]);
> +	igt_remove_fb(data->drm_fd, &data->fb[0]); }
> +
>  static void
>  virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float
> virtual_refresh_rate)  { @@ -701,25 +713,34 @@ test_basic(data_t *data,
> enum pipe pipe, igt_output_t *output, uint32_t flags)
>  	if (flags & TEST_FLIPLINE) {
>  		rate[0] =3D igt_kms_frame_time_from_vrefresh(range.max + 5);
>  		result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n",
> -			     (range.max + 5), rate[0], result);
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target

Still you are in middle of test, you still want to reset VRR property and t=
hen do a null modeset while test completion. Previous flow was validating n=
egative test case as well and enable + disable vrr sequence for vrr support=
ed panels.

> VRR on threshold not reached, result was %u%%\n",
> +				     (range.max + 5), rate[0], result);
> +		}
>  	}
>=20
>  	if (flags & ~(TEST_NEGATIVE | TEST_MAXMIN)) {
>  		rate[0] =3D vtest_ns.rate_ns;
>  		result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n",
> -			     ((range.max + range.min) / 2), rate[0], result);
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target
> VRR on threshold not reached, result was %u%%\n",
> +				     ((range.max + range.min) / 2), rate[0],
> result);
> +		}
>  	}
>=20
>  	if (flags & TEST_FLIPLINE) {
>  		rate[0] =3D igt_kms_frame_time_from_vrefresh(range.min - 10);
>  		result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -		igt_assert_f(result < 50,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold exceeded, result was %u%%\n",
> -			     (range.min - 10), rate[0], result);
> +		if (result > 50) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result < 50,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target
> VRR on threshold exceeded, result was %u%%\n",
> +				     (range.min - 10), rate[0], result);
> +		}
>  	}
>=20
>  	if (flags & TEST_MAXMIN) {
> @@ -732,10 +753,12 @@ test_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
>  		};
>=20
>  		result =3D flip_and_measure(data, output, pipe, maxmin_rates,
> 2, data->duration_ns);
> -		igt_assert_f(result > 75,
> -			     "Refresh rates (%u/%u Hz)
> %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold not reached, result was
> %u%%\n",
> -			     range.max, range_min, maxmin_rates[0],
> maxmin_rates[1], result);
> -		return;
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rates (%u/%u Hz)
> %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold not reached, result was
> %u%%\n",
> +				     range.max, range_min, maxmin_rates[0],
> maxmin_rates[1], result);
> +		}
>  	}
>=20
>  	/*
> @@ -746,9 +769,12 @@ test_basic(data_t *data, enum pipe pipe, igt_output_=
t
> *output, uint32_t flags)
>  	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), (flags &
> TEST_NEGATIVE) ? true : false);
>  	rate[0] =3D vtest_ns.rate_ns;
>  	result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -	igt_assert_f(result < 10,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold
> exceeded, result was %u%%\n",
> -		     ((range.max + range.min) / 2), rate[0], (flags &
> TEST_NEGATIVE)? "on" : "off", result);
> +	if (result > 10) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(result < 10,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold exceeded, result was %u%%\n",
> +			     ((range.max + range.min) / 2), rate[0], (flags &
> TEST_NEGATIVE) ? "on" : "off", result);
> +	}
>  }
>=20
>  static void
> @@ -758,6 +784,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint3
>  	vtest_ns_t vtest_ns;
>  	uint64_t rate[] =3D {0};
>  	bool vrr =3D !!(flags & TEST_SEAMLESS_VRR);
> +	uint32_t ret;
>=20
>  	igt_info("Use HIGH_RR Mode as default (VRR: %s): ", vrr ? "ON" :
> "OFF");
>  	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> @@ -773,14 +800,21 @@ test_seamless_rr_basic(data_t *data, enum pipe
> pipe, igt_output_t *output, uint3
>  		 * so switch to High clock mode as test preparation
>  		 */
>  		igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
> -		igt_assert(igt_display_try_commit_atomic(&data->display,
> DRM_MODE_PAGE_FLIP_EVENT, NULL) =3D=3D 0);
> +		ret =3D igt_display_try_commit_atomic(&data->display,
> DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +		if (ret !=3D 0) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert(!ret);
> +		}
>  	}
>=20
>  	rate[0] =3D vtest_ns.max;
>  	result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -	igt_assert_f(result > 75,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold
> not reached, result was %u%%\n",
> -		     data->range.max, rate[0], vrr ? "on" : "off", result);
> +	if (result < 75) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold not reached, result was %u%%\n",
> +			     data->range.max, rate[0], vrr ? "on" : "off", result);
> +	}
>=20
>  	/* Switch to low rr mode without modeset. */
>  	igt_info("Switch to LOW_RR Mode (VRR: %s): ", vrr ? "ON" : "OFF");
> @@ -790,22 +824,32 @@ test_seamless_rr_basic(data_t *data, enum pipe
> pipe, igt_output_t *output, uint3
>=20
>  	rate[0] =3D vtest_ns.min;
>  	result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -	igt_assert_f(result > 75,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold
> not reached, result was %u%%\n",
> -		     data->range.min, rate[0], vrr ? "on" : "off", result);
> +	if (result < 75) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold not reached, result was %u%%\n",
> +			     data->range.min, rate[0], vrr ? "on" : "off", result);
> +	}
>=20
>  	/* Switch back to high rr mode without modeset. */
>  	igt_info("Switch back to HIGH_RR Mode (VRR: %s): ", vrr ? "ON" :
> "OFF");
>  	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
> -	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) =3D=
=3D
> 0);
> +	ret =3D igt_display_try_commit_atomic(&data->display, 0, NULL);
> +	if (ret !=3D 0) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert(!ret);
> +	}
>=20
>  	rate[0] =3D vtest_ns.rate_ns;
>  	result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -	igt_assert_f(vrr ? (result > 75) : (result < 10),
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold
> %s, result was %u%%\n",
> -		     ((data->range.max + data->range.min) / 2), rate[0],
> -		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
> +	if (vrr ? (result < 75) : (result > 10)) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(vrr ? (result > 75) : (result < 10),
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold %s, result was %u%%\n",
> +			     ((data->range.max + data->range.min) / 2), rate[0],
> +			     vrr ? "on" : "off", vrr ? "not reached" : "exceeded",
> result);
> +	}
>  }
>=20
>  static void
> @@ -815,6 +859,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum
> pipe pipe, igt_output_t *outpu
>  	unsigned int vrefresh;
>  	uint64_t rate[] =3D {0};
>  	uint32_t step_size;
> +	uint32_t ret;
>  	drmModeModeInfo virtual_mode;
>=20
>  	igt_info("Use HIGH_RR Mode as default\n"); @@ -828,12 +873,19 @@
> test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t
> *outpu
>  	 * switch to highest refresh rate mode.
>  	 */
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
> -	igt_assert(igt_display_try_commit_atomic(&data->display,
> DRM_MODE_PAGE_FLIP_EVENT, NULL) =3D=3D 0);
> +	ret =3D igt_display_try_commit_atomic(&data->display,
> DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +	if (ret !=3D 0) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert(!ret);
> +	}
>=20
>  	result =3D flip_and_measure(data, output, pipe, rate, 1,
> TEST_DURATION_NS);
> -	igt_assert_f(result > 75,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not
> reached, result was %u%%\n",
> -		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0],
> result);
> +	if (result < 75) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold
> not reached, result was %u%%\n",
> +			     data->switch_modes[HIGH_RR_MODE].vrefresh,
> rate[0], result);
> +	}
>=20
>  	/*
>  	 * Calculate step size by considering the no. of steps required to @@ -
> 851,13 +903,21 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe
> pipe, igt_output_t *outpu
>  		kmstest_dump_mode(&virtual_mode);
>=20
>  		igt_output_override_mode(output, &virtual_mode);
> -		igt_assert(igt_display_try_commit_atomic(&data->display, 0,
> NULL) =3D=3D 0);
> +
> +		ret =3D igt_display_try_commit_atomic(&data->display, 0, NULL);
> +		if (ret !=3D 0) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert(!ret);
> +		}
>=20
>  		rate[0] =3D igt_kms_frame_time_from_vrefresh(vrefresh);
>  		result =3D flip_and_measure(data, output, pipe, rate, 1,
> TEST_DURATION_NS);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold
> not reached, result was %u%%\n",
> -			     vrefresh, rate[0], result);
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target
> threshold not reached, result was %u%%\n",
> +				     vrefresh, rate[0], result);
> +		}
>  	}
>  }
>=20
> @@ -924,26 +984,16 @@ test_cmrr(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
>  	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
>  		prepare_test(data, output, pipe);
>  		result =3D flip_and_measure_cmrr(data, output, pipe,
> TEST_DURATION_NS * 2);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on
> threshold not reached, result was %u%%\n",
> -			     mode.vrefresh,
> igt_kms_frame_time_from_vrefresh(mode.vrefresh),
> -			     result);
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target
> CMRR on threshold not reached, result was %u%%\n",
> +				     mode.vrefresh,
> igt_kms_frame_time_from_vrefresh(mode.vrefresh),
> +				     result);
> +		}
>  	}
>  }
>=20
> -static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *out=
put) -
> {
> -	igt_pipe_set_prop_value(&data->display, pipe,
> IGT_CRTC_VRR_ENABLED, false);
> -
> -	igt_plane_set_fb(data->primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_output_override_mode(output, NULL);
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -
> -	igt_remove_fb(data->drm_fd, &data->fb[1]);
> -	igt_remove_fb(data->drm_fd, &data->fb[0]);
> -}
> -
>  static bool output_constraint(data_t *data, igt_output_t *output, uint32=
_t
> flags)  {
>  	data->debugfs_fd =3D igt_debugfs_dir(data->drm_fd); @@ -1060,10
> +1110,9 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
>  				      kmstest_pipe_name(pipe), output->name)
>  				test(data, pipe, output, flags);
>=20
> -			test_cleanup(data, pipe, output);
> -
> -			break;
>  		}
> +		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_override_mode(output, NULL);
>  	}
>  }
>=20
> --
> 2.43.0

