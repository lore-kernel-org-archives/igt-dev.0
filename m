Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CD0CCA470
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 16:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6E310E242;
	Tue,  7 Oct 2025 16:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7pSvEdW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365AA10E242
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Oct 2025 16:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759855331; x=1791391331;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TcsTgG9hAoArJNS+PUqVI3svtNqFrqo63Jpz1KVZrnE=;
 b=a7pSvEdWBCP9X8kBe7FrgPAicPgP8EpqdvcrFnLeb4MJ/IZku7DEJlHp
 fF3W0LZJdUaGZJQWahFzLCEniJwkMYUCLJ1jqtS3QYWu1lfnfuBHW0em4
 GUVySYCCQ3g0OHroM8Ja0DddEnMWtU+ubqBhrsVlF/ONmSm88SwZuVBW6
 sR95uSfKZWlVgj3W8WJV53C45faCMuozBJepOMXbedG5nCwDMhUzjV4tL
 ZdZ32kcdD4k8V4QdlVFwG7Z0CIPjQ1maNI9nRmyLSLS1euWdLBsNt1vg6
 NrHQnIGWYvtpX9OrpEonCDz0v7Ytclvi1NBcWAxDTthVi4KzINVspxBxv g==;
X-CSE-ConnectionGUID: ZWE89QzVRJysRotCJzk+QQ==
X-CSE-MsgGUID: u5J1PYKBTGuMGBCcPdLDuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="72720920"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="72720920"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 09:42:11 -0700
X-CSE-ConnectionGUID: RjeM18gzTfCnfvm4Vk0IDA==
X-CSE-MsgGUID: +j1E+RAbT7W3J5S5CYFbdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="179328428"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 09:42:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 09:42:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 09:42:09 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 09:42:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaz5aufdZw2hwyi8tu/HGoHb9CHc45cDsUd+IQxpK4i2CNxfKHcN7aoLXBP12v5oraXXzUk6TbfsxZXDXUD/eV5udEbxeI55ioWKUhUWlsOeu0L3W98Av2R8mB3azbZmAGee3EjZUE9mLKNqt3yiVZG1rM0SDh75o1Dm0+MlGI7tWMO7kU3pSzcXIzh/bmmwatEfl2SwZpdixjfvU+riTvMcB1FH+9Klqawn6+rNxPS40QibWp1EV4HRa+IJSp+cv4HWqESQQUlcsVgVZojzk88EcEjHPlszsbBonK4kPflFMs5Y/Ld3MFy9N5pNgeetulZxJusJhajz3bTAeeqrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdLyWcLGNMIvj1bPBWIkaXCvZ9K0PC4Pk5t29NGeGZE=;
 b=me3jUel91UBBJQHDSiAOniIj8UKkl/fhGVhJJifzXLBGBOx4ExHkB8aepIjvwuuOqHck7gDyIfnQOyPS6cqiD/gEdLH0wI+kNxeeLufiW98MNMOD85U43Rn6mPvFi2T6Pf/hyUD1Nqw9hRg1qYJMXo1KWjmwgBtaiJJAmIJzNJFxbFsTDgokk9Fg6wsCfaOetw8PYRr8Vey2sTxC9U7ph/TLVW4l4Ogs4P+9R2m2mYcY8Bi5Wau83ioqQwBzjPRRimy/LSqAGM+FVHESvWzvnK/qVdoEo37XZaIORqONOoSZusUQT7lJhtgOp4XEPZJRrZN1BNiZUEOKg+1wqPZuiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ2PR11MB7476.namprd11.prod.outlook.com (2603:10b6:a03:4c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Tue, 7 Oct
 2025 16:42:01 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 16:42:01 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Wang, X" <x.wang@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>, "Goyal,
 Nakshtra" <nakshtra.goyal@intel.com>, "Bhadane, Dnyaneshwar"
 <dnyaneshwar.bhadane@intel.com>, "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "B S, Karthik" <karthik.b.s@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH] lib/intel_device_info: get the xe .graphics_rel from
 GMD_ID
Thread-Topic: [PATCH] lib/intel_device_info: get the xe .graphics_rel from
 GMD_ID
Thread-Index: AQHcN0ge+1QPbK9s9ki76iG99Fhj0rS24mgg
Date: Tue, 7 Oct 2025 16:42:01 +0000
Message-ID: <DM4PR11MB54561BE61C21E3D82EC3252CEAE0A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251007050554.340485-1-x.wang@intel.com>
In-Reply-To: <20251007050554.340485-1-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ2PR11MB7476:EE_
x-ms-office365-filtering-correlation-id: 29b80263-6769-4675-5824-08de05c070a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?4WU8Yd7XepZv49Rv56MxdAmKDTpVFO9C6V1R2Mktpbpfbq1zPrLvz/OMv31R?=
 =?us-ascii?Q?JFoY5dFp0apDHqBZ5HfDSThLwABPgsPqX6fhjkK44CktFoDzKB0uy8dqRK0P?=
 =?us-ascii?Q?sRif6KrD+qtFmqSqMCIhMv0cBTZ8EG9hP/aT76+WPffXvYxA5c9JBrc0wgGO?=
 =?us-ascii?Q?UehPlP1OCJPyJ/svdImec6tkHp26FuBDyMGuD7QN4uFIYGbDiZUPIjoAnF8C?=
 =?us-ascii?Q?3KtG9TkdKrsyKsx6+Cx/dgmW18fggU+m8sTJUCui30HwIPUb6uxmUvJZaqvy?=
 =?us-ascii?Q?ioMLCDIm+6VMTj+ubsJyfW/uOajCUSE40JE+a1zIYbrbX+47UXBJErp3qWll?=
 =?us-ascii?Q?7u2wEJJWkQ1RQ9FkTPBxA33+MPuZOjI3fwss2Vjonif20GYzQB5MpYJHTG49?=
 =?us-ascii?Q?8BAmI1fZT8/Bl2oAl6HyGU60GfeJN1nuri5uTk9d5faorLZB8YVjgkDzyvrS?=
 =?us-ascii?Q?CRL6I9et6EWUtKbWKSlZNZLt1T6DD4DxrdSqhaj4oI+uqsaFXnqRDRv3AvWm?=
 =?us-ascii?Q?OZgL35QnJUC+OIJMpb269zKh7irI4+glkMX7DhEOo+WOy9Q4ozP/0GJi11Ze?=
 =?us-ascii?Q?qRXW6aSRFGTc97WBpdZwfjfB3AQgjkGvC/UFZACY05i6vzo7Tmh1rzfZSdhZ?=
 =?us-ascii?Q?PuIeLLpIoL0Y+GlmUhsPdwxldB+YygzE7XOqqqvNkiaatxpDFyn3GveHfQm3?=
 =?us-ascii?Q?ZPIJBpEwDQdOfmUrSYJMpLC2OYp3342sQMbWnbKoMiQhXMpnVKHn/ctqGGUs?=
 =?us-ascii?Q?GFjujt2alck3HDV/xBiHaieGJJaBMC09u3Sp9cqIDfsfvc7qIGHwo13GWoFD?=
 =?us-ascii?Q?Qf003JYM8A1LDTuO5s8+lI72eL6VwCwwp9dUwHLab1Dw4KgRXJZI2jOqe3cs?=
 =?us-ascii?Q?PT7JQUv0O9qxxRPWHmwB3L1M5TaXSho4m01GhGeoT7QFW3aMO0DrXBcdQ/Ho?=
 =?us-ascii?Q?d8nE/IiExwnpY9rzZuCqrJdnIJBYa4eUuZThZK1tVkh2TjsGH/fR57lwzbgB?=
 =?us-ascii?Q?LZxzK1CTw2os6o/isJujdFBAXTK1S0w91B7RdYFB/SxptuIMixmWtVYYUu8A?=
 =?us-ascii?Q?JTOPoiSNcpBhUQitFCQcWvN2S3wqPNTdKbNj4LC5VsMQEqsZVuHlgdTB33U5?=
 =?us-ascii?Q?sg5plyOZ5G2dbSTbtGCqS9UvBpiu/dp6rv1f22SnOCx5+mQ7B/qRzRr+/1Ig?=
 =?us-ascii?Q?B2CYxosc7zgFFOi2oOb3bHpUwSAVo89zZ1gVxch0CgL77O1Y6GNOKEqe7lZJ?=
 =?us-ascii?Q?YBmLe6tlMfS8BA3dw6MO6vMXFtKqVX1LCHsSUVwWD2MEYx2AtDZtoL4hm0hZ?=
 =?us-ascii?Q?K0aXE55TJw18GLE96EbYJzkrq3nYZsZIrLUl90xQPwTLp1SoX9owmMLQaH4k?=
 =?us-ascii?Q?DM+1KLvSSTvtQEhk+eenN2q0S5ROArmH8gdGl+ty+pZW9IIc8rEt1/FWsH3o?=
 =?us-ascii?Q?UkMq/rU3u2/y1866jqefwvbp0oCv5gY3SkgLK1CKdLuqWHpv0AyzVJwT23D9?=
 =?us-ascii?Q?ElwNYeAhBveqKQFhrxiL/pv96C6RJC7eIog/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WJqMt19POG1fahOUc2XZejPXhto0unKKiAQRRr4s1tmrxXSw6x5+W/nsE4O5?=
 =?us-ascii?Q?hUQJJWbD+58h8PhKT2J13fpC9NOrHNoUCYeH4vZAcuTlO3r57C+1rb5iS0cg?=
 =?us-ascii?Q?1cV/CrGYXpeThfLs+xnHu1flOU65RTwzDT485R1CRFQ6H7fIljMbadh91c9J?=
 =?us-ascii?Q?En3jg6FQ4fxoysF2dxgM3l84+nNrEdT87b+Tdk/5L9c16NtDhJ4VXWFts8eK?=
 =?us-ascii?Q?JKAwb3qY54cENFCFd2jnp1rw3eKJ/bFSvS2a45PFX2x1fSQT2xsOKjwx21xZ?=
 =?us-ascii?Q?3mgQGCy+McUfNqvp+de0KErEh1Waf6mUaiE5LUfpQcTP4/QCfvkDXPjEL9nZ?=
 =?us-ascii?Q?9ZMYtBFU6o9916VQ8+95FzxUmff0D/qGMOAsNRUprfKRftRmt2uBgNUy79Sm?=
 =?us-ascii?Q?BZF5FqetIQKXUdjv6u6GIX/jQ5h/Nlzufqkwq0J/jwgPzQZdyvLOZya6j+Nr?=
 =?us-ascii?Q?1RbyKGPT0jZmHHxEfwSsyh4Y8BWPSm9EhQcqSTt7pDt1TPZaw88CQ2HnvpZX?=
 =?us-ascii?Q?wYnQ+Zidw8InbOqnRCPaQk0QJPTlqDE+coszdd05u+2/zyKkX8rrYFoSOHt3?=
 =?us-ascii?Q?8GuLudeFtfZYlJK4WFRN8rrRwe5NNTo9U7nAFyaQfoRnIhx+AAb62mBJyaVr?=
 =?us-ascii?Q?2ov5iwBEtS/mBsG1UWUTMI2ILWvSak4yCxcHbjmh3csuluFa1l43sKP3Q59o?=
 =?us-ascii?Q?yotX/evqZ7pIe6KfzJOh308Q06MLkWGjBex1ld1iOGtlH0FWXto3g9w12T0P?=
 =?us-ascii?Q?ah6qnU42VkpNuOVLFc5th2bHCDfTrF7CCUE6TU4a37oEMeS5iqXvYqGVLjGQ?=
 =?us-ascii?Q?hE/cmWBPwAWq7+XscW+73vTOVnvS1M285kSyIhahBAcbtN6WZ9sp/BSWslEd?=
 =?us-ascii?Q?3K+NvMO1l7xrlnk5obplzZn6ln28OlQA4uODjeOMbYGeBjsQ3OjLtN6qnJop?=
 =?us-ascii?Q?F3LEq5p335/O+xESmKvSIFZ3yfnaJrt05O660hgDOkBjawIIMJ3ssqgDkk8w?=
 =?us-ascii?Q?uqB5H54sc6lCyT+N9MRwdyncRd8ZIyJw4LRI3WwUE/H4HgMQaRJtEf4gsJit?=
 =?us-ascii?Q?xb5gXUbSm70dFtKmlCteFyqGJylZ33nFa5FunThJCJV7CyEPSnQe/ffTxXdL?=
 =?us-ascii?Q?Ep7KPrUNHR4AIPDSqCCQfQ1kvXU7EOSDV0saTgdiU3NlPNnoevzieznsgSlp?=
 =?us-ascii?Q?StfX1pJtDRab2c+OzlCoAFgebw7CU2Rm86GPnXAPPEBDZ1TIWnsaIFspTIyb?=
 =?us-ascii?Q?zxJ/T6RwWjLGpJ3UdLqXNDXg9FWWuqgDSEbjkWk4oJL8jhqePaJBfYDtzLUg?=
 =?us-ascii?Q?NbxUQgi93d+c+/z0kYntWNX4kVBoKIyq6ZDWH0UHh1mOciBsaYVdgc/P4KuR?=
 =?us-ascii?Q?2m6kAULd1wtPRnDyjNb7Dbclwsxe93d6G3kc+tmj5ydUzuISuw7d7Co+zmKd?=
 =?us-ascii?Q?dDGKix+2Ybw5BaLKFgjpLA0UhPEjMeVzpidVtalqPjfiVbY8jY+MPjNi/AGx?=
 =?us-ascii?Q?tq/mOugHHjkd0CrK6J9P8dd6LZLO3U0cuRiFzI167C5OJUk/VoUlAn/xWLmI?=
 =?us-ascii?Q?mD4HEFieVPL0YF1/DXPPhaCnUGin8JiB0d3uyaRH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b80263-6769-4675-5824-08de05c070a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 16:42:01.4653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OrMhvpDWXsBoaFQJ2bf0Ew5pynF8Df/nFMWuX8SBtMBiLuc0upsfYDKcTonpMdY+Cjz6hIUh54tG917eFUKp/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7476
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

On Mon, Oct 6, 2025 10:06 PM Xin Wang wrote:
> Created 3 new APIs:
> intel_query_gen(int fd)
> intel_query_graphics_ver(int fd)
> intel_query_device_info(int fd)

It is not easy to review such a big patch.
Could you please split it into series?
At least 4 I think, maybe more is preferred.
1 for the 3 new APIs
1 for lib folder change.
1 for test folder change.
1 for tools folder change.
Thanks.

Shuicheng

>=20
> On xe devices, the graphics versions both major and minor can be
> accurately determined by retrieving the GMD_ID via IOCTL, rather
> than relying on the static intel_device_match table. The same type
> device may have different graphics minor version(.graphics_rel) value.
>=20
> Although we can retrieve both the major and minor IP versions from
> GMD_ID, we still retain the major version (.graphics_ver) in the
> intel_device_match table. The benefit of this approach is that
> .graphics_ver generally does not change with devid, allowing us to
> avoid modifying the function call which don't provide fd parameter
> and thereby reducing unnecessary file changes.
>=20
> However, we still provide the intel_query_gen(fd) function, because
> version queries within the same file should come from a consistent
> source.
>=20
> Replaced the lib/*.c tests/intel/*.c tools/*.c releated to xe devices
> with the new APIs.
>=20
> This change can avoid the trouble caused by different graphics_rel
> when adding new devid to the same device in the future.
>=20
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  lib/gpgpu_shader.c                     |  2 +-
>  lib/gpu_cmds.c                         | 22 +++++-----
>  lib/igt_draw.c                         |  6 +--
>  lib/igt_gt.c                           | 10 ++---
>  lib/igt_store.c                        |  2 +-
>  lib/intel_blt.c                        | 21 +++++-----
>  lib/intel_blt.h                        |  2 +-
>  lib/intel_bufops.c                     | 13 +++---
>  lib/intel_chipset.c                    | 56 ++++++++++++++++++++++++++
>  lib/intel_chipset.h                    |  3 ++
>  lib/intel_common.c                     |  8 ++--
>  lib/intel_compute.c                    |  7 ++--
>  lib/intel_device_info.c                |  3 --
>  lib/intel_mocs.c                       | 15 ++++---
>  lib/intel_pat.c                        | 17 ++++----
>  lib/ioctl_wrappers.c                   |  2 +-
>  lib/rendercopy_gen9.c                  | 22 +++++-----
>  lib/xe/xe_legacy.c                     |  2 +-
>  lib/xe/xe_oa.c                         |  4 +-
>  lib/xe/xe_query.c                      | 10 ++++-
>  lib/xe/xe_query.h                      |  3 ++
>  lib/xe/xe_sriov_provisioning.c         |  4 +-
>  tests/intel/api_intel_allocator.c      |  2 +-
>  tests/intel/kms_ccs.c                  | 13 ++----
>  tests/intel/kms_draw_crc.c             |  2 +-
>  tests/intel/kms_fbcon_fbt.c            |  2 +-
>  tests/intel/kms_frontbuffer_tracking.c | 12 +++---
>  tests/intel/kms_pipe_stress.c          |  4 +-
>  tests/intel/xe_ccs.c                   | 24 +++++------
>  tests/intel/xe_copy_basic.c            |  6 +--
>  tests/intel/xe_debugfs.c               |  3 +-
>  tests/intel/xe_eudebug_online.c        |  8 +---
>  tests/intel/xe_exec_store.c            |  6 +--
>  tests/intel/xe_fault_injection.c       |  2 +-
>  tests/intel/xe_oa.c                    | 38 +++++++++--------
>  tests/intel/xe_pat.c                   | 26 +++++-------
>  tools/intel_tiling_detect.c            |  3 +-
>  tools/xe-perf/meson.build              |  2 +-
>  tools/xe-perf/xe_perf_configs.c        |  2 +-
>  tools/xe-perf/xe_perf_recorder.c       |  2 +-
>  40 files changed, 216 insertions(+), 175 deletions(-)
>=20

