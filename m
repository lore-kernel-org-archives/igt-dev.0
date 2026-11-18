Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10194606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mxv4MUVi;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=lc6H3rhi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A8510E7C8;
	Wed, 18 Nov 2026 09:34:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6363B10E7C8
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 09:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794994429; x=1826530429;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hULxPT80j53zOdVZVxtPuLpvTXHmCw0g7NNoa0Y0JSA=;
 b=Mxv4MUVi1uUS+jtOkq5/71k9LT28DnJmDH6VfhGQXvlRj4pImev8AIDq
 A2IRx78QNRZGapBD4+Jnb/CPBQXLv07QvJrsW5Kc2yadBZoMTVVLvJc5W
 NqkNZ+7u6IjIeu8jfXazQVkGRjjdndh/VKrorLpN6Dp5oXN0SIbdyJ/Qw
 Gy+V5AO7FanJKH1UPKQU8UvIGefcsNgB8W9V0E0j360t8xb4QguI23fpu
 2Me82X3c4+Pgp9kiKK5lr6eSvC2tL0AIEw74+zlWEtgphEwEkguqF8um0
 V11B2wRnKEeSs58v6OYx1y+H0wf3+n5Zm1XePkHdyilblFVIWzEvyehAq Q==;
X-CSE-ConnectionGUID: EauSmBfAQ+6y9dMWOjtePw==
X-CSE-MsgGUID: zcw44AlkSCmpEYkexp3FEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3797161"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3797161"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 01:33:20 -0800
X-CSE-ConnectionGUID: Xvwt5ezqQRKaLLcjCXAY+Q==
X-CSE-MsgGUID: 1K0x7YfFTmmIfBfnE1WHGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10459777"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 01:33:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 01:33:18 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 01:33:18 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 01:33:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/wIc4CJzg8Qjyud8w6vE1q6b+Qo9doz6sxigKD/G65XU2MpK6ng/569NCw5zIZ2twfeoS5jogMqKCQQ2MAJOxW+JPOZ7ICtCWEzT9DRYPuuLLZxAZIcgyP4W5rcGKL8BTU6Hb7bE6yMes80DKKLFQMfB9jVeVkNPR7PiUrWVED42beDq/745aa4SFQ218TzW+zLGEz2AQwIMMscSekH4kzZg3CM7rXPUwjTpQZEt20EX8mysjuNpotBe8Vt1rvMxlQd4QIeMDD2wxtWmX19EUIfkhJyR5g8iyFZNFxfYJwZEfKMVv1yfG+txS5/FkGJ3OV+yiMTl+JGgKC1xhijZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HJbhhHWdVX4N+g8ID7xHzaI/N+hnSlmOWskY2e+C9U=;
 b=KCFLMSOyW41xxy+kDF+h8EWGNBmuQln62P8B8gOZK15OKD+E5Cxun3vJXE19H7W7JFQ1r5zR0ukof3nWI4dtn3Z8XPguIp6PcR6KmDNd1f5ByCtf4UY0+lFpAl1Gz4/8etuTIu8ylQxTbr7YfgV5CwHj2V1SaMdtMiPOVRj8SiFw6s9mJbrJ+a3vTp08dVHdj73k4q9ISK6Kd/roNmp8sUkwwHvIRG0vFRj0sPMP07ptMTuy9j0+eHMnynHvz3uCWFg6A9eR9M0OiJ/Km7Rz6AVgr+RmHt5y167/T1sRRpiPx/oEuuVhhYNXdxLXqtxS5kG/IS0AQDuB5oAyVcIevw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HJbhhHWdVX4N+g8ID7xHzaI/N+hnSlmOWskY2e+C9U=;
 b=lc6H3rhiy3bnF4fTVNJ7E6tvWNCatVOZt1dlOGxYNWsKLU5XE2M7A3H3Etum18FRn9v9mxEM47KjesHWxvb8vmZlRAEwWbN1WPSbJkNm+cTQwbjFVlkiBu+RQcjnGDo1JZ4JKuSXB/B5GBPlw+1r70Qw0scLBL00sp6SImcFyCg=
Received: from IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9)
 by SN7PR11MB7538.namprd11.prod.outlook.com (2603:10b6:806:32b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 09:33:15 +0000
Received: from IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82]) by IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 09:33:15 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Girotra, Himanshu" <himanshu.girotra@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Update CRI and NVL core blocklists
Thread-Topic: [PATCH i-g-t] intel-ci: Update CRI and NVL core blocklists
Thread-Index: AQHddz6Y5TN4IKx1f0SIvcxdHm+Cj7czkSVA
Date: Wed, 18 Nov 2026 09:33:15 +0000
Message-ID: <IA3PR11MB9013B012425B04FF4CD5DA25857A2@IA3PR11MB9013.namprd11.prod.outlook.com>
References: <20261118092718.503212-1-venkateswara.rao.muppidi@intel.com>
In-Reply-To: <20261118092718.503212-1-venkateswara.rao.muppidi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9013:EE_|SN7PR11MB7538:EE_
x-ms-office365-filtering-correlation-id: 51356fa9-55fc-47d1-0517-08df4556f8e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info: p1Ox0Hmt+Zaj9Z4IxekYzMmtkk5+gUWyu4uqYfkI7S68iSeX5g9/DHqd7xA1pE7rlE3IPqxTIXg7ouBgusXGfoHwePDee2K1l/v0j81dmhbqAb/j+X+H44rZtNi2E8ertBmaUaU9XF0/ZIqD3s6TZQGjD+TpIT9jynVKZr/qCJMtewPuxMQeNApIFdX9vu/+mM0+EZtCRCBAD1oJo9q86Apft6qZEWSFZX708GQobZM7fZ0md5vYePvcyh3tkhkTZppXPF5Yid8Df7tY/+PY1KumIPhIA34Zk71GgmasPFYg9rAEJo0nZXls8bmoj8S6b9pysyEJp2tXSNjXPdfa90+kX4n2v0RSacLwWFSB4nBdM8Ya0IEuU+iABV8CbYielsCwa7F6bAVVkpmZ4gUljoXPC7UJyypx0VHtVUdoPXyLwUIaAmHPtXyvGNhZX42r0YZ2pl+j2I9EHgx/kFEhY/Bh/3SoBcqWNMyNEwA58FU3RpUEm+qL6kZfdY7pyZbpuO0ADQ1DEmNZ5Fbv287PpDbo/Katl3Af1kID3oKAy2jDFOmG3AUqpbKirJnohhnZKufkkzv2+mDNzTgN0ptS6j+F5EYMS2uNt5VpSAZ4B46ypFLBXOgKX2axELqKy5Iewv9VhofFEekrlN2UJmDB3mSEx3+xshJ/h65yp1juunl9kJaNmsFEyXh9fdwW9Py1I6vTlc27N+aJ+X2U+slnL1WXNwKOtwslx+YbloFAXAA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9013.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4VI1AehV3hnaE36PYKtr0JgGLL7CxN7dGHOwe3b9N9sdoOIE826SKRlDSWRT?=
 =?us-ascii?Q?zjF2g9k91cMYZrCBp/B+w6VP10u0ljuaqDhGbOxcIU/wTC7pmpeK6+dMD8vo?=
 =?us-ascii?Q?fSNbYMSvNHubZQk0CAuZX5WpyNIiOtfueWtoiZY7tYXkqYIC81o71VPpJ12l?=
 =?us-ascii?Q?GSWBRMzft2CwF5/LuyFHfrJHjsdlUUpdQJdJWVvksrkMc5QWdUXZp8P+V8dd?=
 =?us-ascii?Q?GgXaf4nqeQ/xXEwmHm5JYUtDWqsrjFaq4t9Fji/dzhZSQR35jyMX+S2U6dDa?=
 =?us-ascii?Q?s6Px2N5RbJ6FOezcXTKvuS304GVJfJkUhRXXjyUymJ9YwFmnLn1/3UcixpWD?=
 =?us-ascii?Q?527MLRtcNDUjZfJXaVpbVrGE/fzjrDViM+n8T/chCprbDICGYDpxzBrtbE/l?=
 =?us-ascii?Q?jlCCBbVFnqBPhjCYe74lXxo0TLC1Oi7Y7Yvwsda0wOrogEJ+f3aaYISdus+x?=
 =?us-ascii?Q?yW/68HO4BaPTLd+x8efWfljO9lVz/jxxzrOZdrVrG7vbtywpkzND+A3onXWG?=
 =?us-ascii?Q?4PfYFMjNsfqMRnOWwdf24aZGsCoc0AveMBHdru8BhQEU6zaurzORSDUolL8V?=
 =?us-ascii?Q?2LO7sW3txKOq7Kv+AXIgnDj/ssFZFtstGJ01NOf+SZeSztzC7wK72gGEEyyI?=
 =?us-ascii?Q?ywk2i1/StU2y7VZEms8dI2IMDUpXoT6CvSjWHowoxk9qCbvkGub7uDxPy81J?=
 =?us-ascii?Q?U/J2dFtNsLw+1nZC0agwquGEHiXgyhCFRVNBXCwBzYDw6bmT5dVhHJSu9mqI?=
 =?us-ascii?Q?bzlHYyZGJZ7wHIjTldVQ2TCfwN/6Oj1WefOMBew1FD+MZKW0tljVyOHzEwvc?=
 =?us-ascii?Q?MCP9FN6XwnIEvBfsBMkcpqH4IdXPIPTPcRUkSth8f8al6ubQIyXdoMa78ikq?=
 =?us-ascii?Q?GxeJUKuAql/SBAai900g41o9Q9hs7xoixPamYLe8orNrRaHT+ntQcGk0Jewq?=
 =?us-ascii?Q?yUHAOuHeDJWVYc6R2tJR4g1TQHDZhQL/djQ3coc6xcm0sy95Jyt0e61qFNoS?=
 =?us-ascii?Q?mou6ONY4IDpn0k7ryLKI64T5Ctfa/rvRIB9k3u2mejTlmF/7+9Ddh2uqAcY2?=
 =?us-ascii?Q?RFbykMzEnpDpx+MXIUXgBurPvl8sM9zy5vA2CuV5b5UePTF9hvHUQ6V2J1L7?=
 =?us-ascii?Q?Lah4wAg19LuSj29KFIWyQkhfN/Xb6tyGf68QamO50QHQNqwFOoUjX4I9PVeo?=
 =?us-ascii?Q?chtrl082iObXUdIiEcUA+Z5AG3/NWwxm21UpaIWazjuoMAeb65OwPod3iqQQ?=
 =?us-ascii?Q?yFVSjHPOF95LgD+KA79w55m92I99/uml+TQmXMj2RytsiAz6xTYGCkNh7fDX?=
 =?us-ascii?Q?cGlkNs4+fmcE3glwvZ2N7HztLD8r9qpC0tki6LES4qjSK/cHkJBK8qudhSGR?=
 =?us-ascii?Q?0TvDI6un2apxGHj1y4PEycvrBcZkpSGTKwYVbNLJnRf+/t9u18gkGBhJr9te?=
 =?us-ascii?Q?Zp+Il4Lw8JONgMvFQ4pFCZ3O6BW1tXkdmqubdgQzEwHLaDlwRmjBN5KY5gmO?=
 =?us-ascii?Q?RWuWlzQFVqgP3mxMOzQwhgyK0QcV0Ex+DBG2Jl1qwzhWWp03P2iZDNEhFL93?=
 =?us-ascii?Q?EChzT12YH15fom6pSy5khMJTfJa/O8+GX+fLYIHOPyLGBss2og2dnFecs3Ps?=
 =?us-ascii?Q?9ahA78mGGFAtXJ5nlMdzGqE/SzZC6lUXBH0KUlW/dXlHTT+VKyKzgVhYHfiB?=
 =?us-ascii?Q?rgB/TqulUXWExGlAq+n6YPq34Qv4Om8+dbtwLofpI8TTpBAUPpmA1Q7kI7Od?=
 =?us-ascii?Q?1wnG0rVtzg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dQy4X8I/Hbuf2WdiWaz1/PFplU2k/pUQespIkg8VGcqjels/08p0wlRkTuBVcorEa1C6iNKxUgJIhW5yEjnwAPYZ0f0/aP0S4UP+QvTcE2WNsTbE9zQZSq+v0z/xbFg2LRkgltJKQ4A2APKIObXlAJwAkAGxJN2RZNjHAKncxLdmVw1U6SzFAfznoQFziWonGOSMhMWsNxU1Sl7r2Krjj77KxzNYeh1q9zSGQh1F745K+8910jjlMjPkECP9G2UnV4uMd182DaqfuDrPew1NO7issOGjA8cTrz5PkajM3oWcKfLKpBVP+HygmIRPyoAnpZij24qPOqPsCvUz5O+5nA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9013.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51356fa9-55fc-47d1-0517-08df4556f8e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 09:33:15.4520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eYfQzDE2iCXya4PAuOe4MibIQK0meZHIjfkIiUr4KPN60jMKqTEEu8SRqO+GW/N9NTczw5C/dv7u7XQayNgH74O0M4B3xjrQU0WEhJR68PE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7538
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LGTM.
Reviewed-by: Gandi Ramadevi <ramadevi.gandi@intel.com>

> -----Original Message-----
> From: Muppidi, Venkateswara Rao <venkateswara.rao.muppidi@intel.com>
> Sent: Wednesday, November 18, 2026 2:57 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Girotra, Himanshu
> <himanshu.girotra@intel.com>; Muppidi, Venkateswara Rao
> <venkateswara.rao.muppidi@intel.com>
> Subject: [PATCH i-g-t] intel-ci: Update CRI and NVL core blocklists
>=20
> Add below entries to the CRI/NVL core blocklist for tests that are not
> applicable on this platform:
>=20
> CRI:
> - xe_vm@overcommit.*: the overcommit subtests create an eviction
>   footprint larger than 50% of system RAM, which is not valid on
>   current CRI system.
> - xe_mmap@small-bar: the subtest requires the CPU-visible VRAM size
>   to be smaller than the total VRAM. On current CRI
>   systems vram_bar_size =3D total VRAM by default, so the precondition
>   is never met and the subtest always skips.
> - xe_vm@single-op-map-mirror-over-bound: SCRATCH_PAGE combined with
>   FAULT_MODE is not supported on Xe3+ and is rejected by the KMD.
>=20
> NVL:
> - xe_vm@single-op-map-mirror-over-bound: same SCRATCH_PAGE +
> FAULT_MODE
>   restriction as above.
>=20
> Signed-off-by: Venkateswara Rao Muppidi
> <venkateswara.rao.muppidi@intel.com>
> ---
>  tests/intel-ci/xe.cri.core.blocklist.txt | 14 ++++++++++++++  tests/inte=
l-
> ci/xe.nvl.core.blocklist.txt |  5 +++++
>  2 files changed, 19 insertions(+)
>=20
> diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-
> ci/xe.cri.core.blocklist.txt
> index 41328186c..6b77523d6 100644
> --- a/tests/intel-ci/xe.cri.core.blocklist.txt
> +++ b/tests/intel-ci/xe.cri.core.blocklist.txt
> @@ -62,3 +62,17 @@ igt@xe_page_reclaim@.*  igt@xe_pat@l2-flush-opt-
> svm-pat-restrict
>  igt@xe_pat@xa-app-transient-media-(off|on)
>  ##################################################################
> +# Valid skip: when eviction footprtint > 50 % of RAM
> +##################################################################
> +igt@xe_vm@overcommit.*
> +##################################################################
> +# Valid skip: Current CRI systems CPU-visible (vram_bar_size) # is set
> +to total vram as default
> +#################################################################
> +igt@xe_mmap@small-bar
> +##################################################################
> +# Valid Skip: SCRATCH_PAGE + FAULT_MODE not supported on Xe3+ # and
> +rejected by KMD
> +##################################################################
> +igt@xe_vm@single-op-map-mirror-over-bound
> +##################################################################
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-
> ci/xe.nvl.core.blocklist.txt
> index 91f9b1a47..8ce0b09b5 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -111,3 +111,8 @@ igt@xe_wedged@cold-reset-wedged
> ##################################################################
>  igt@xe_err_injection@.*
>  ##################################################################
> +# Valid Skip: SCRATCH_PAGE + FAULT_MODE not supported on Xe3+ # and
> +rejected by KMD
> +##################################################################
> +igt@xe_vm@single-op-map-mirror-over-bound
> +##################################################################
> --
> 2.43.0

