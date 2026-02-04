Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8277E95375
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 10:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB2E10E5BE;
	Wed,  4 Feb 2026 10:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbmXO2fR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E2010E5BE
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 10:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770201626; x=1801737626;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=72x6p1sJnSOfLUTIE051GQcj0rtut2/pS8Y1CIdDOzw=;
 b=SbmXO2fRuqT3Mj0IjKI1U3J99emr5kZk4wiJX2waBhsmKwN/v7SQA/Xt
 2aIcuXsAGnT9pGiYr/FSR77HlwG7ERj/OmGOaeVepxFcOnT8x2jHTne+5
 OjaJlns8DHB1BSB3Irr0TQ+xL5ZMhuTMcyIm8T/O17ShVVz6J71p96sIB
 5gs5TmtqySUMou9jSV/bYf9pABuPI6jKUgp31M7hE7sjTVqbzTju3v7MQ
 UbCmoJybwpMjukwWOZ5TGljTQ4mCxgI5ItPki9hA6zc7re4Ib+bg0p3Vl
 cZsUEzZDiNc0iCj/6OHOEkoyWx1dAzM2mAZrrrdeKJNeiW0SaEiulSaNh w==;
X-CSE-ConnectionGUID: QTYlRtC/RtOkr5iX35o5Tw==
X-CSE-MsgGUID: OAyR61WyQVelQZZIZzXLgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70582874"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="70582874"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:40:26 -0800
X-CSE-ConnectionGUID: pfLeTIS3TxmdnuJUmkUE7g==
X-CSE-MsgGUID: IPyTkWZyRLafF7xjAU9j0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="233054237"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:40:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 02:40:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 02:40:25 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 02:40:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIJ0GXL1fBP9m0AxhzbZvfamO802ZHxALrsMI9Ns4ohdjCiYR3L9BhuSENFfY0Nrk8rvIsWq1TXamd5tqE3fUbNevOy9kVSzg16/UHI26P9gookake4uvr/y27NecF8Qe/VxxbF1s0zc3L+SbZLeZj9RzgVDk+P/bxxA9fKgdx+3Rx2eoiL2QVKaxIrMzp2tjXMdkla4k2frzxpFNfbQa95xavqOZejy07WUZlWji1xk2WPL410vh8FPs3bygscP1zlUOlDbpjl6JbQqlcts5ZYmxSOu831nuVrZqjkSv+ilY+5FK1Q+Yo9+UZ9GRGdSQHC4a2nnyCfB4Jgg4QLEsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSJ6ogjEEdTOsukCmUt0fzu53uruKlxgDZ+jXUbCr7E=;
 b=p44sFy4Qw7gVjrbXWE5aZNjJZX/txbSk4Vo9x2uztHuVxytfTYPLINMcNoyCi+9jhD8cVQrhfgOyeGwmJU/UyxN09RQY3Ap1IydC5Kk9yNVfTvedGoddGg8GxhSb8eACYRxFpbLQ4h6py6iQeLNAv/KJoAhHmCHYh+Bcus4UEoK3IZ1QiKJV1b8u8RKI0xwS1/38DDlcVsndfSHo8525fswvXLd4z4xmOauu7N+LeP6QZ0WSwlEiwPVFghiESGehmlW61QtX9PAhM7R7YyWx3lq4X8lkKgF4KKSlM6Yg6hCvbLlsEu68dUvmmdzPkQb49xQnU1acuw1boLMZ/r7REA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by DS7PR11MB9497.namprd11.prod.outlook.com (2603:10b6:8:263::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 4 Feb
 2026 10:40:16 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 10:40:16 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 6/6] tests/kms_pipe_crc_basic: Add MST
 suspend-resume test
Thread-Topic: [PATCH i-g-t 6/6] tests/kms_pipe_crc_basic: Add MST
 suspend-resume test
Thread-Index: AQHclB1to3uQ0mVz6EyU4Fq8UoN7YLVyXADQ
Date: Wed, 4 Feb 2026 10:40:16 +0000
Message-ID: <MN0PR11MB60341D53B38DAC2E4DF5A1F38198A@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260202084539.2524306-1-kunal1.joshi@intel.com>
 <20260202084539.2524306-7-kunal1.joshi@intel.com>
In-Reply-To: <20260202084539.2524306-7-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|DS7PR11MB9497:EE_
x-ms-office365-filtering-correlation-id: 800ce50f-f499-4a3a-dcd3-08de63d9c935
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6oCaIYGeXEB+ye/uEBYK+YkRz6wSUoF1f1Pn0lJTkSLXqLcJDbhDSnouPhNw?=
 =?us-ascii?Q?MykK4NRkWQhEbG7jplUuB8E90eKOPODuLZvw/7/sEsZ51BOXz88rSHLMpRil?=
 =?us-ascii?Q?G+PoWa9TVCpHlJfLUqEUsw7juz+MLcLJF0aZyxrnDKOO7hZCcShntPzdSLSB?=
 =?us-ascii?Q?Om5QRc6ejL2jZMGeQT2u6YpoB6yKdMFynZY/fAk5U+wulGhXksoTMfyAp9eJ?=
 =?us-ascii?Q?SQ0XbkmtXURERm9YzukCblZa7vp4r9Vg3Bi8rf+e7IxSLq5qQCR/9RTj1BpQ?=
 =?us-ascii?Q?dzbgYOtmxrXOqtfy1yxvflaogzJBORFtgShnkG0ZjjaXqlaPbOuT1p1rE674?=
 =?us-ascii?Q?U+u4DK+CpsAm7zqzZU30VpFWT5DAzSnNWvSUXz+zdKkQ+vwOXAipGTslIn9E?=
 =?us-ascii?Q?TMyjwl8NChNChimFyd2eRgHXfUd6zX735XVKAxTUH2ozkRzQTwPrIIrxfCEY?=
 =?us-ascii?Q?8ut5s1IHpuWsxCiZyYa+t3Bkeguzq0KSZlyhgCTbIqNP0gcAq04E/0CRMcrs?=
 =?us-ascii?Q?vtyyK8LqxV6B2MJVSMikk1BxKw6UqH4yiJetkHfbhIKUJZsE/dVadfxk6F9O?=
 =?us-ascii?Q?ce7ciGMBpDr48UUbUgz7IN0hDp73br49uDCl4XP6O+fNT5c/fHkqyl+0hY4t?=
 =?us-ascii?Q?kHs3H2+nZiTrEWmaTjrjmDIC/r6WfpfZUHboHx4/43IgqRJ8rF+F8QTR/oan?=
 =?us-ascii?Q?cG7kuolyM6b2oQf5e2P3+mYvpOO3iwOE74saD/1qwgrUuJDnRwFZ+XqC97Vt?=
 =?us-ascii?Q?5c8RvcIAxrUEfEN4UYZ/pesH3ykWAwmvRmIMi8KhPJL1447mZ25uhzzpLOjV?=
 =?us-ascii?Q?RTLojyOc+NCXk0omYo5/b4Go6RiMNQ7WeUG4WyJlLXuqrBZY7/hKp6o+JYww?=
 =?us-ascii?Q?dMKBs0N19tXNXqE1ZwPpBAmBKk32GhUPk0mBmISaef6kLcJnGxKc4hJOkuIe?=
 =?us-ascii?Q?0ccDtN+GfOiSz1zKHDKGXjqiWPB4Uog4CT8lAqI4i8/GNHQiC9Kg0hHB+4EB?=
 =?us-ascii?Q?b7aGDAUGU0Y2GCTIXzYc9hdPt964BEz35jQG8qr6wsf6QznyVYzByheibX0H?=
 =?us-ascii?Q?/eLNMsfncgozDchIFUxmtvMIJxahr/ij/PSxDpCs9amujxBsQlgAEg21xs9t?=
 =?us-ascii?Q?S8r4KnxsCEi4hl75rjoJ736DTwPJrTo5j7FGWxAbz7uQ3E2oDeJF6QzbAhb6?=
 =?us-ascii?Q?0pLx8KSe5+rg18ireJTcGYVyixZwakldlYqktFxnihf0hwTVJpD04Ul/X9uH?=
 =?us-ascii?Q?Pa590ymDJ0UTf2WG7Y9k61ndJniD6Kz8l7TFE/Ma/V8d7PrK7x5E35DTv3Az?=
 =?us-ascii?Q?I8kgBiJ0LXhCYO5aenR6a9OZYoC8DWWzuOhmCC4uL5EFOJdy9+FEdAde00H9?=
 =?us-ascii?Q?2SWxoZeHd8FddsztTAbcilMIxwFaIJxwPh8tVT8Tva0ZpknO5csxPflzDZ3U?=
 =?us-ascii?Q?DI3OOBPGiPfipjRNf/sWxB5/ojg73F+bOEQbeN4gYghqO6a08YIijShTZQoH?=
 =?us-ascii?Q?IpJAqUo8q8CjZVA49qAUMOu8OlcT/myr1K3P4hmVkKmBgQizNf5x0HiF+jNe?=
 =?us-ascii?Q?TuOG0q7a6RHEyo8hLkgwVF6LpLNomCke6A8qliDA7nbLoZio/RprAJDmYU9G?=
 =?us-ascii?Q?Gx6oMILJikfFEVcHBmufSbQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q3al2ffmXdh4Qai6m0UXM+2NWGOWUrt4jutXVkZA++MP4f7YSv8h9gA8dO4G?=
 =?us-ascii?Q?KcCRjfwjPQg3wJxzbGeTZ309oGfmeSd+4LvKYYqWs1DZR+xn2nvZOVGMb+C0?=
 =?us-ascii?Q?fwAgRlAywJqq+aILT+WMfhYXZQ2KTKm/CilQWvWHAYnl+m7tuMf1bhPnwvNS?=
 =?us-ascii?Q?2sm77fZtJouD4LI9EkVhAgvyhUHP0JMHPvRTcWkfjUtoMpNT6eJDKswgJTtq?=
 =?us-ascii?Q?pR/AgSs/YPlQVLJd2qyaShIKmLPkl9aUTg+znGMEqlVT+J1tHrBt7RIUV1jn?=
 =?us-ascii?Q?CBJ1JvZmoXZj+mggb2lHUm+5xHeddlRzOGUM6GMU3WL8DYJVy7g9sNRMCc50?=
 =?us-ascii?Q?rIXpkLmUQdl1x+RPfX75PsQXMh/rYhCvU1MsB8jsmV93L92JSw7d5sWKj9Gu?=
 =?us-ascii?Q?nJHn161OeCcpJs4JCTX1OC14NpVw7Ejrf25jCA8nvE59+L2yfqm5roVylqry?=
 =?us-ascii?Q?jqbwITr/fZxlv3BGXtQXHb468bWNXeDilPK09oCdStU6hngummpNSj5zCmQy?=
 =?us-ascii?Q?vfAHE2IgRppnxN8O0moJJWUmKSTp6WCEvIF7pmZ+Ofmqpj7Eof+m6laL1cOe?=
 =?us-ascii?Q?sfYEqWBi/SzlI4nAffY9CxZBW0D3PGIqEBi9Ib8Tm26w46RjwXiBWXgeH9JK?=
 =?us-ascii?Q?WU2Dsi8KDm0GbHLlnB/FaouyWSIK7uODpKlA6gof8MD12bY2viCJxu7VlN9f?=
 =?us-ascii?Q?ugZxil+gPUs5y9KSHWgwEJZkFz1ufI2APcDAriL2K/Ick9RQ7EjT29V8htqO?=
 =?us-ascii?Q?VGmZPIEuhfibYpl8l/MCrLx6AZvSNvqBjavJT9ERVJkMvch0wSOoWDo/0AEC?=
 =?us-ascii?Q?rog0hecghzjrtxnFXEmrCWhc28LQxkC11cL9HY7l/hmnTk2uNI1w0dfR2X6R?=
 =?us-ascii?Q?ExlqTxj8HYQ8miwukGljkBfp49MyC3sAimQiFi2qEjZYuyYqVjCYKAvh+O8r?=
 =?us-ascii?Q?UaOXLBNzsBvdR4brGGy8DJ/XEyvN3dweq9GdzbYM4HTGQqAHgUeB98O5PkzS?=
 =?us-ascii?Q?fQXy55DhtTi55XezZl/g+f2Kkvsft3eRgIAioH40/sQD4lqzA7zgSbfP7Sz8?=
 =?us-ascii?Q?6mkh8vqyizhBQftx+vZ1gNUeWD084qn6kmupgH9R5Fg5QmXQGj8sOd82/VuI?=
 =?us-ascii?Q?6JvPdE9Uw4XvA9NpcDK/eXbm4BiOIyGVU1khXQMvCuuaLQeXXXICOV147GVb?=
 =?us-ascii?Q?vvXZIHYMDjsTMDe3N+37BFHFp9jf/k5Gbc5pABJNoj4nqdtDYKxFG5ncH1hB?=
 =?us-ascii?Q?ee+qJjGJ7BRN/1ttorxGN+ykY8yEUGak+A1W6k2Ll1oWBN3CXGUsYaBBNRu+?=
 =?us-ascii?Q?CQLreksrvoTGU3IjaprhSnflvIcLdRSyr19TpTQv228wWc62zg9tmqKPczwQ?=
 =?us-ascii?Q?8JxxHFuiX2nFyS18esxTB5BwWvrvzkN6J4w6ss+M4nALsAz/NFzZpkhwgXsw?=
 =?us-ascii?Q?I0HS3/8LNDdNRh2oerrrJ+H4xAlY+u5d3ZzMqpiXbIJ6cKXmq5kZaQi6MMou?=
 =?us-ascii?Q?LenrUWHYuh4+njigbs0rxE+l57f409l1zsEM4+c/VAywUXjo89dLksGy64U8?=
 =?us-ascii?Q?pH5+hyZgdHnCWBOgvq/cqYaB0V4kcP0dsffMwi2v9uJnGwfkxexs3+dZmlvY?=
 =?us-ascii?Q?lyW3CGz+jTtQWQ/+FDxM+Ni6rYEDOO9ledHaKhbJeMxKHgtyCNh7vVf3thnT?=
 =?us-ascii?Q?W3V7/Vjd/Lj/qTqOGEsWefpIOEMO1QI7JghMK8PzU3+SRAlw7DotHR7Wwvh4?=
 =?us-ascii?Q?xwwgkZBW2g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 800ce50f-f499-4a3a-dcd3-08de63d9c935
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 10:40:16.7720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 07n2WPYvwSD1FiMk2yhjHwvZ2GHeltIlss6WOwclBuwzHuv9t4DQI0WqLs8Lu2ARGE9O0+3qKcp8cXdoEeB2ahCZjkAcEJLn6vB+aSLJ+Js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9497
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

Hi Kunal ,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: 02 February 2026 14:16
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 6/6] tests/kms_pipe_crc_basic: Add MST suspend-resu=
me
> test
>=20
> Add mst-suspend-read-crc subtest that:
> - Validates CRCs across MST topology outputs
> - Tests CRC consistency before and after system suspend
> - Iterates through MST output subsets for comprehensive testing
>=20
> v2:
> - Add error handling for igt_pipe_crc_new (Thasleem)
> - Improve log format with index for clarity (Thasleem)
> - Order declarations in decreasing line length (Thasleem)
> - Add print message when no MST found (Thasleem)
> - Add bounds check for idx in subset loop (Thasleem)
> - Use igt_crtc_crc_new() instead of igt_pipe_crc_new() (Ville)
>=20
> v3:
> - framebuffers missing in commit (Bilal)
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_pipe_crc_basic.c | 246 +++++++++++++++++++++++++++++++++++++
>  tests/meson.build          |   3 +
>  2 files changed, 249 insertions(+)
>=20
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c inde=
x
> f1deaf081..005960dfd 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -33,6 +33,8 @@
>  #include "igt.h"
>  #include "igt_sysfs.h"
>  #include "igt_cleanup.h"
> +#include "intel/kms_mst_helper.h"
> +#include "intel/kms_joiner_helper.h"
>  #include <errno.h>
>  #include <stdbool.h>
>  #include <stdio.h>
> @@ -78,6 +80,11 @@
>   *              CRTC does not cause issues.
>   */
>=20
> +/**
> + * SUBTEST: mst-suspend-read-crc
> + * Description: MST suspend test for pipe CRC reads.
> + */
> +
>  static bool extended;
>  static enum pipe active_pipes[IGT_MAX_PIPES];  static uint32_t last_pipe=
; @@ -
> 97,6 +104,239 @@ static struct {
>  	{ .r =3D 0.0, .g =3D 1.0, .b =3D 1.0 },
>  };
>=20
> +#define MAX_MST_OUTPUT 3
> +
> +static void collect_single_crc(igt_crtc_t *crtc, igt_crc_t *crc) {
> +	igt_pipe_crc_t *pipe_crc;
> +
> +	pipe_crc =3D igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
> +	igt_assert(pipe_crc);
> +	igt_pipe_crc_collect_crc(pipe_crc, crc);
> +	igt_pipe_crc_free(pipe_crc);
> +}
> +
> +static void collect_crc_for_active_outputs(igt_display_t *display,
> +					   igt_output_t **outputs,
> +					   int num_outputs,
> +					   igt_crc_t *crcs)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < num_outputs; i++) {
> +		igt_output_t *output =3D outputs[i];
> +		igt_crtc_t *crtc =3D igt_output_get_driving_crtc(output);
> +
> +		igt_assert(crtc !=3D NULL);
> +		collect_single_crc(crtc, &crcs[i]);
> +	}
> +}
> +
> +static void wait_for_vblanks(igt_output_t **outputs, int num_outputs) {
> +	int i;
> +
> +	for (i =3D 0; i < num_outputs; i++) {
> +		igt_crtc_t *crtc =3D igt_output_get_driving_crtc(outputs[i]);
> +		igt_wait_for_vblank(crtc);
> +	}
> +}
> +
> +static void log_crc_for_outputs(igt_output_t **outputs, int num_outputs,
> +				igt_crc_t *crcs, const char *stage) {
> +	int i;
> +
> +	for (i =3D 0; i < num_outputs; i++) {
> +		igt_output_t *o =3D outputs[i];
> +		drmModeModeInfo *m =3D igt_output_get_mode(o);
> +		char *s =3D igt_crc_to_string(&crcs[i]);
> +		igt_crtc_t *crtc =3D igt_output_get_driving_crtc(o);
> +
> +		igt_info("[%d] %s: output %s -> crtc %s, CRC %s, mode
> %dx%d@%d\n",
> +			 i, stage, o->name,
> +			 igt_crtc_name(crtc),
> +			 s,
> +			 m ? m->hdisplay : -1,
> +			 m ? m->vdisplay : -1,
> +			 m ? m->vrefresh : 0);
> +		free(s);
> +	}
> +}
> +
> +static void create_fbs_for_outputs(int drm_fd, igt_output_t **outputs,
> +				   int num_outputs, struct igt_fb *fbs) {
> +	int i;
> +
> +	for (i =3D 0; i < num_outputs; i++) {
> +		igt_output_t *output =3D outputs[i];
> +		drmModeModeInfo *mode =3D igt_output_get_mode(output);
> +		igt_plane_t *primary =3D igt_output_get_plane_type(output,
> +
> DRM_PLANE_TYPE_PRIMARY);
> +
> +		igt_create_color_fb(drm_fd,
> +				    mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR,
> +				    0.0, 1.0, 0.0,  /* Green color */
> +				    &fbs[i]);
> +		igt_cleanup_register_fb(drm_fd, &fbs[i]);
> +		igt_plane_set_fb(primary, &fbs[i]);
> +	}
> +}
> +
> +/*FIXME: crc for joiners*/
> +static void run_mst_subset_and_verify(igt_display_t *display,
> +				      igt_output_t **active_outputs,
> +				      int num_active,
> +				      int n_crtcs,
> +				      uint32_t master_pipes_mask,
> +				      uint32_t valid_pipes_mask)
> +{

Fb's created in this function are local stack=20
variables but they're being registered in the global cleanup registry. This=
=20
creates dangling pointers when the function returns .

Regards,
Mohammed Bilal=20

> +	igt_crc_t pre_crcs[IGT_MAX_PIPES];
> +	igt_crc_t post_crcs[IGT_MAX_PIPES];
> +	struct igt_fb fbs[MAX_MST_OUTPUT];
> +	uint32_t used_pipes_mask =3D 0;
> +	enum igt_suspend_test stest =3D SUSPEND_TEST_NONE;
> +	int drm_fd =3D display->drm_fd;
> +	int a;
> +
> +	igt_require_f(num_active <=3D n_crtcs,
> +		      "Not enough crtcs for MST subset\n");
> +
> +	igt_require(igt_assign_pipes_for_outputs(drm_fd,
> +						 active_outputs,
> +						 num_active,
> +						 n_crtcs,
> +						 &used_pipes_mask,
> +						 master_pipes_mask,
> +						 valid_pipes_mask));
> +
> +	igt_require_f(igt_fit_modes_in_bw(display),
> +		      "Unable to fit modes in bw\n");
> +
> +	create_fbs_for_outputs(drm_fd, active_outputs, num_active, fbs);
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	/* rtcwake cmd is not supported on MTK devices */
> +	if (is_mtk_device(drm_fd))
> +		stest =3D SUSPEND_TEST_DEVICES;
> +
> +	igt_info("MST subset: %d outputs, n_crtcs=3D%d\n",
> +		 num_active, n_crtcs);
> +
> +	wait_for_vblanks(active_outputs, num_active);
> +
> +	collect_crc_for_active_outputs(display,
> +				       active_outputs,
> +				       num_active,
> +				       pre_crcs);
> +
> +	log_crc_for_outputs(active_outputs, num_active, pre_crcs,
> +"PRE-SUSPEND");
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, stest);
> +
> +	wait_for_vblanks(active_outputs, num_active);
> +
> +	collect_crc_for_active_outputs(display,
> +				       active_outputs,
> +				       num_active,
> +				       post_crcs);
> +
> +	log_crc_for_outputs(active_outputs, num_active, post_crcs,
> +"POST-SUSPEND");
> +
> +	for (a =3D 0; a < num_active; a++)
> +		igt_assert_crc_equal(&pre_crcs[a], &post_crcs[a]); }
> +
> +static void mst_suspend_read_crc(igt_display_t *display) {
> +	int n_crtcs =3D igt_display_n_crtcs(display);
> +	igt_output_t *active_outputs[MAX_MST_OUTPUT];
> +	igt_output_t *mst_outputs[MAX_MST_OUTPUT];
> +	int traversed_roots[IGT_MAX_PIPES];
> +	int drm_fd =3D display->drm_fd;
> +	uint32_t valid_pipes_mask =3D 0;
> +	int num_mst, i, num_active;
> +	uint32_t master_pipes_mask;
> +	igt_output_t *output;
> +	int num_roots =3D 0;
> +
> +	for (i =3D 0; i < IGT_MAX_PIPES; i++) {
> +		if (display->crtcs[i].valid)
> +			valid_pipes_mask |=3D BIT(i);
> +	}
> +
> +	igt_set_all_master_pipes_for_platform(display, &master_pipes_mask);
> +
> +	for_each_connected_output(display, output) {
> +		int root_id;
> +		bool root_seen =3D false;
> +
> +		root_id =3D igt_get_dp_mst_connector_id(output);
> +		if (root_id < 0) {
> +			igt_info("Skipping non-mst output %s\n", output-
> >name);
> +			continue;
> +		}
> +
> +		for (i =3D 0; i < num_roots; i++)
> +			if (traversed_roots[i] =3D=3D root_id)
> +				root_seen =3D true;
> +
> +		if (root_seen)
> +			continue;
> +
> +		num_mst =3D 0;
> +		igt_require(igt_find_all_mst_output_in_topology(drm_fd, display,
> +								output,
> mst_outputs,
> +								&num_mst) =3D=3D
> 0);
> +		if (num_mst =3D=3D 0) {
> +			igt_info("No MST outputs found in topology for output
> %s\n",
> +				 output->name);
> +			igt_skip("No MST outputs found in topology\n");
> +		}
> +
> +		if (num_roots < IGT_MAX_PIPES)
> +			traversed_roots[num_roots++] =3D root_id;
> +
> +		if (num_mst > MAX_MST_OUTPUT)
> +			num_mst =3D MAX_MST_OUTPUT;
> +
> +		/* In future if we can print name of MST hub will be great */
> +		igt_dynamic_f("mst-topo-%d", num_roots) {
> +			int mask;
> +
> +			for (mask =3D 1; mask < (1 << num_mst); mask++) {
> +				int bit, idx =3D 0;
> +
> +				/* build subset for this bitmask */
> +				for (bit =3D 0; bit < num_mst; bit++) {
> +					if (!(mask & (1 << bit)))
> +						continue;
> +
> +					if (idx >=3D MAX_MST_OUTPUT)
> +						break;
> +
> +					active_outputs[idx++] =3D
> mst_outputs[bit];
> +				}
> +
> +				num_active =3D idx;
> +				if (!num_active)
> +					continue;
> +
> +				igt_display_reset(display);
> +
> +				run_mst_subset_and_verify(display,
> active_outputs,
> +							  num_active, n_crtcs,
> +							  master_pipes_mask,
> +							  valid_pipes_mask);
> +			}
> +		}
> +	}
> +}
> +
>  static bool simulation_constraint(enum pipe pipe)  {
>  	if (igt_run_in_simulation() && !extended && @@ -502,6 +742,12 @@ int
> igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		}
>  	}
>=20
> +	igt_describe("MST suspend test for pipe CRC reads.");
> +	igt_subtest_with_dynamic("mst-suspend-read-crc") {
> +		igt_require(igt_display_has_mst_output(&data.display));
> +		mst_suspend_read_crc(&data.display);
> +	}
> +
>  	igt_fixture() {
>  		igt_display_fini(&data.display);
>  	}
> diff --git a/tests/meson.build b/tests/meson.build index ef4edaa0d..ab709=
48bc
> 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -398,6 +398,9 @@ extra_sources =3D {
>             join_paths ('intel', 'kms_joiner_helper.c') ],
>  	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>  	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
> +	'kms_pipe_crc_basic': [
> +           join_paths ('intel', 'kms_mst_helper.c'),
> +           join_paths ('intel', 'kms_joiner_helper.c') ],
>  	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],  }
>=20
> --
> 2.43.0

