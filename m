Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A4DC3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 06:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C1110E126;
	Mon,  5 Aug 2024 06:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTcnak7x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C086E10E126
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 06:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722839267; x=1754375267;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2aBXwDFMXDkUotB8tYgn9G0bCSrBDGSYRNox4wff1Ik=;
 b=dTcnak7xu9z8AS85DCPJiKp9vQrh11/C8Vm3U5a6jZw5gNA+yju/H0qY
 IfZ25PAaoN2vomdG7Tkw/LaYpL4OtRldpVYZLpX2d1jqBMMsvL5o/X3H3
 DUwmGKTAK0HsauNgW7NUGwhpoXvLaLpicYbJfz8fXrdmURQhKPGPVqF09
 M5zmWgbkNycd/6TT9dAjGlJEFUs5aI7nyIpJtH3MzZ7zJLUJBSf1oRXUK
 TxaR5cF5o9UGC/9DWLVnPGgo4TbpKANd1APwyvlbkS7mdasDoN6PSI8g+
 H+g0Ng1PV0dA+wp7k5ID2mmcaafwnwA7tfdwTzIEmetRxpHi70aoz3/S+ A==;
X-CSE-ConnectionGUID: /25Iizu2SIKadaduVw5YVw==
X-CSE-MsgGUID: DlSUfBGNQbCNEz97Vnylgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20948919"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="20948919"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 23:27:46 -0700
X-CSE-ConnectionGUID: MB+Fxx6SR4S1qOSuGj8dTg==
X-CSE-MsgGUID: IObxvKUnQtux1Q7By5O8cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="55934195"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Aug 2024 23:27:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 23:27:45 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 23:27:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 4 Aug 2024 23:27:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 4 Aug 2024 23:27:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQqlho8fyY6VwjuWjYYpd9UPOC7YC4XFcXcj55WcJtdrFTVHQ92UMG2YkUVTa+jxcHW6L1lARp+5h3xrIf2HkdlQgpspYPOIh1kSsETHqTjEy5D38O2+OREtAjUQlFF4X8F1KP3iU4+8a7aS5f+JB6trejyo4TeupdX+doU4mtPH+zxGJ5bUaM2Oj7zMIS+uiQr5QNrfL8K5MQ9HennVr0iOd1ZK7H4BPv243FTIZxBAqO9fkpZbfENowqCPNgDEmdtoCbd2feI3wK+OyngQ0Xt0ggn5SMBfRMa8m2aQ7QukeKVQhclMpAdwTplY+jvwOE4h7FhC/kb29n/Ig+TPXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADWNP/SJuvBM3O1e+88ZZWAqf+PxwLYuRBGt8x2aVr4=;
 b=I2lVhSrHjRNnEWP8/eohGm4vvK8f6ZsDkmfz5UiawSagfV5QcdXXrbUS9O5Q0ucgqrfLbOh204r/RwX1N1nNdDdJZQxez6YNhPqzmDxjyt9v6QryWwr0uW4/TRn5lNKMsZX/SzMibCUauyggxULvLycwxdX/aLUQeeATbyuuaUTQKq19GaCvcu5PhOytK+NV1EgsVHNtFulSiX9jORh355uXhmALXxWz4k2mGaL1yJimpe6TueqCrTeida8HWEV6knsnc1iQMxqSFW4otpqKwmKU0m9RhDDLY7hWTUlz574jeuH9rIefle7K4UKQ1A7rf6koKMPnUZBTBCpmX1fyhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DS7PR11MB5965.namprd11.prod.outlook.com (2603:10b6:8:70::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Mon, 5 Aug 2024 06:27:41 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 06:27:41 +0000
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
Subject: RE: [PATCH i-g-t v2 53/66] tests/xe_eudebug_online: Set dynamic
 breakpoint on interrupt-all
Thread-Topic: [PATCH i-g-t v2 53/66] tests/xe_eudebug_online: Set dynamic
 breakpoint on interrupt-all
Thread-Index: AQHa4naK2+Y+2y7weEOi2BFheyQSjLIYOHSw
Date: Mon, 5 Aug 2024 06:27:41 +0000
Message-ID: <DS0PR11MB726496A3242188EEA0458046D9BE2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-54-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-54-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DS7PR11MB5965:EE_
x-ms-office365-filtering-correlation-id: c7754b58-32f5-4cba-a467-08dcb517b595
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?hu3DBDqb6XRrE6AKtKu3bngtw2WbkYIc6Dr3VaPWVFhoTyIZnR1ahqXWhS?=
 =?iso-8859-2?Q?NeM+KX+BxlQUzEF0/Mb69CwBk53nuWQ98WTgA8Eq0Xd6QoQsFqVnXIHLk5?=
 =?iso-8859-2?Q?bEO9X9rz0b7iBykDNXdssXpByRuvqcyaNhzVjYmjXlNR6rcveQInola/7w?=
 =?iso-8859-2?Q?4IEdAFPZ2ahjLlXh9HHa3yZ6SF6cWJhXThAIKl3MmMt1b4QULrqPZBplLn?=
 =?iso-8859-2?Q?FM7MeSc+uygqKqIAZ5nlNGxBTBMUYcPHCfcVf4sal/T5Wt6oevvUXIp5pS?=
 =?iso-8859-2?Q?Wy3pl8vMTml4Cqhu+ADSltviX9eGM/xmEPcI+CbMDjWJK47f/su34iETw3?=
 =?iso-8859-2?Q?zlU1ZziWz4gOlYL8B9AZuB1RWfQ6mp6DKlGh9kQLUZeaTouP+v8m+vW0US?=
 =?iso-8859-2?Q?m49GaSaQuMiOpo38RYOpPljgVUW1f3jEwyGaqSpgxhehKvGLWhw4SGlivZ?=
 =?iso-8859-2?Q?TmzllnGTV2IfzMPFGl1H5dwwn+cKMx6DaLWDk0EpHbS29Z1EI4dGSAqdRo?=
 =?iso-8859-2?Q?WNnUCWXTEIfnUp9y5HF5fWogiYbKDUdRkO6w9hpPlKWuXK4KVDN7AU7B9o?=
 =?iso-8859-2?Q?6Am7I6+BaL3d9kqdz18mdmDYpvx1BVUVADE9b1YK7H3a7wmquOnbUU19Ai?=
 =?iso-8859-2?Q?eoqnug+jVxiqVBVHHd/cZ9pso1814mhgCSCQTu6XTCzgOlCiTaWbrnsJ6Y?=
 =?iso-8859-2?Q?JaP5tFAIaRzLcZCyIe5oF4UDP3Rq+Z6tGkO4NofWOu6a3JcDK5kB7uaYLs?=
 =?iso-8859-2?Q?I/fK3zYOhbhCHkXI621imnfacXbO7IPodF6kH/tU9JkuUYRovhtZjlsjkb?=
 =?iso-8859-2?Q?zJ8yCsKq2uwT8xQ7LtUelghJcuIsLSZX2rLn9X6luKjUSoKqCWC2orlt8s?=
 =?iso-8859-2?Q?k4+d8SbRX0Cs5e8Oi5U+QqQGhYrx4vTYapEqxw5RvbBi6XjOkc/6aa7E8W?=
 =?iso-8859-2?Q?Du/rbiGfzvvzcOvth27xlL3EadABuBDwQcc6TeBN1Px1RYxPLk3PWRG8cJ?=
 =?iso-8859-2?Q?bYCFKaK57yNvuCNQRQc0CeSuE9lKgJBki0QqgBVeehl4g2DbCfX1OePC57?=
 =?iso-8859-2?Q?vpGRIuNQB9PVWU44+ZoJUasCJ1haOUtitKZh4lLG3mywba6YWJaz0jwuBw?=
 =?iso-8859-2?Q?RDg4rbIJJsJnJ1JeglLyT1ij8k850jvt5wLJqaxunM2Se2JvI8v51zCiwG?=
 =?iso-8859-2?Q?eTlPtJA8Btwb7ZS3Bw0IGH32ubCubbuEcO61sqt8ESjEo+sNgbXA2N8wqm?=
 =?iso-8859-2?Q?tLAuZqGiuUYzJsjvhO6tf2txHuF7EPgpw04v6nB79N/A3cDXHWmSohnxyt?=
 =?iso-8859-2?Q?gqR9G0NrCkfpoddZbktyyy8Ads+wCZbSXutvMFUrO2bptPUEn30Q+Eu44j?=
 =?iso-8859-2?Q?cL/gYdlJrAUzzTzc1SYClm3VU0AzwJlzKIj8eD+u/UB9p7Wy+J8CbfIgwi?=
 =?iso-8859-2?Q?RNF++xdyJ5GOnjUqy8a3DaLZUucqrbvPN48HGw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?YrDZdcMz9IalO1osUBrVxiaefFf++nV6CQzHzz5M6k9h26ELvOlSsXWFpr?=
 =?iso-8859-2?Q?SaAjwiwuqDehmDMbJEUedGRRpd+66xUGpq8uE2j5IsIlZ87GhYgFEyB4j+?=
 =?iso-8859-2?Q?S2Isse9hEyak/c5XdV4mAcjH+66OOZM6ZW6PDvjN0N8jOQTeumMspYnQYm?=
 =?iso-8859-2?Q?61u/8bvqWRhpKiR+R8QnXKvoYv+nIuuDcvjFWuQgKFEVx3hV/mkNWYIg9J?=
 =?iso-8859-2?Q?VuGjLJC8op0Tn3uUWmbDY+/d9ZgWaMNHxfMQvd4Wa6r4uf1ttGlpiT7AuC?=
 =?iso-8859-2?Q?v/aTgl3SdgUnLokO4B/k4A7J/YFfPwqaUiGdusfI4LTXd+K72cRhlTancK?=
 =?iso-8859-2?Q?qogysdgFEmFV20w2Lg68IVZ6GK6xIxgfobX4DcyDdfiG2ZUF2dUhqC6MsL?=
 =?iso-8859-2?Q?FSiriplHeKnwAGepxKc0rq6M0VlTDUE8Wmy/VgN/j5k9ueYvRzF8DHNWMZ?=
 =?iso-8859-2?Q?NevZJ9+8yTnURlKhhvH0ZHF17VopLDXudnc8shQDKMXOMiw+knBomRcT7M?=
 =?iso-8859-2?Q?/SgA2+t31SJVMsR/q4gAk4VSTKIDc+boY2GEjWAjRVCH1bGGpyg+5VVCKH?=
 =?iso-8859-2?Q?FFTJrwYpyOhPSe+21MKkpLyNDIx29EfSJGg8NZ9tjCmqsoJziypFBf8LWv?=
 =?iso-8859-2?Q?TEyIbLAMZYu/BpcUWeErr+5E817YX5KUGUOG0kRb4Ng65w3UdSB97OM8oO?=
 =?iso-8859-2?Q?BlbpG2u8hirRRRU42UDKj1D/kL31X3T9NSzMv+5F5HOjG6myPxqGoA35Cq?=
 =?iso-8859-2?Q?o+y6+CJiPLLKzxmcavKZkmVA/4+ACY1iFxiJjxNeXgTMtvyG/ZueiOKtZi?=
 =?iso-8859-2?Q?XNESVEDZIc2zXc5VzkFDu3srPI5IdQEKUrQvugdRDqFjbemVFvp/fzAZXu?=
 =?iso-8859-2?Q?8m8hr2BWwwzk1WLfnZReEYMjEaf6CTtUwqIQF06ZpDU5bTGEogAONWRZ0L?=
 =?iso-8859-2?Q?eTvJiwvmLVzHVzcg85bvyOJsPL+npj7v8CcVTzexq8Fd5UgVunDV7o3bvE?=
 =?iso-8859-2?Q?UKmwnbP+OJMTnOyLeaZ1OHFRH5ffa8ZEecJp9gdnje/KH1ctWNmpiSSIxL?=
 =?iso-8859-2?Q?YHhQTF+xOQNQI4GVFuk1Eg/owhN8WE3cTCr9K7AXpIlFxLV1bYP5aiLi+6?=
 =?iso-8859-2?Q?WNLbaA7MFw+xkslXLWC/4s/s98PWaxpFQZBcTJJL2boDpPvG8I87gk4RRU?=
 =?iso-8859-2?Q?IBf94VW82ovUDX/CCFyYcL9JnNCnLAkIMwhZNL+ORYxH9Q/dljoqyUtWJb?=
 =?iso-8859-2?Q?BZLaEE81Lu8OBx3qGond88PugdX0diGNUi9GOxOy4GGzz1d/ez+S67yObY?=
 =?iso-8859-2?Q?dromBgBZ6PFoP5dlaWoItlb6nYCbqwbe7/f2EG6RNLxxKD+ZfbYfhV01gK?=
 =?iso-8859-2?Q?91QxT5ORgoDhlXQn5YUyFQt3eFqXo8++nloRtN5kE0uJ4g1M0s246Ms87T?=
 =?iso-8859-2?Q?oK8rH6ySKRHUjTv4lZGFy7pHLWCgFgB1J2Itb24igGUYBRg57bbEsRWQ9e?=
 =?iso-8859-2?Q?tDb4EAGHdJhb7VeaN+xT7YoD3TkT25lwoDP8Cy1tggJVnOitkCkg8qA2XS?=
 =?iso-8859-2?Q?dplErfAYvpne7b7+p/k9cgN4DmsarHTtYtf1owacU6o6roZTNhHoEoKzwI?=
 =?iso-8859-2?Q?z3k6ArhSIYC8Fgnyt1wnD6blZvf/x36WEdTocwRKqvYQ0+MddlFPlJMA?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7754b58-32f5-4cba-a467-08dcb517b595
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 06:27:41.5097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 94upmyZMyhilQF+5z1Uus7XTR1Bkkim44++/iv0GH7HVjV/9ql/wNRXaef7hRiENWJd9jllIy0biQA/x7EHLeF6Sw0PLgPD3JPXDxnn0k1Pj3dG8YuAxmmQMVEl0eR+M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5965
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

With typo fixed:
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
> Subject: [PATCH i-g-t v2 53/66] tests/xe_eudebug_online: Set dynamic
> breakpoint on interrupt-all
>=20
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>=20
> Implement interrupt-all-set-breakpoint, which interrupts all threads, and=
 once
> spots attention it sets a breakpoint on the next instruction.
>=20
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 81
> ++++++++++++++++++++++++++++++++-
>  1 file changed, 80 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_onl=
ine.c
> index 8791b29fa..5bb165fef 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -22,6 +22,7 @@
>=20
>  #define SHADER_BREAKPOINT	(1 << 0)
>  #define SHADER_LOOP		(1 << 1)
> +#define TRIGGER_RESUME_SET_BP	(1 << 28)
>  #define TRIGGER_RESUME_DELAYED	(1 << 29)
>  #define TRIGGER_RESUME_DSS	(1 << 30)
>  #define TRIGGER_RESUME_ONE	(1 << 31)
> @@ -276,6 +277,7 @@ struct online_debug_data {
>  	uint64_t bb_offset;
>  	size_t bb_size;
>  	int vm_fd;
> +	uint32_t first_aip;
>  	struct timespec exception_arrived;
>  	int last_eu_control_seqno;
>  };
> @@ -342,6 +344,71 @@ static void copy_first_bit(uint8_t *dst, uint8_t *sr=
c,
> int size)
>  	}
>  }
>=20
> +/*
> + * Searches for the first instruction. It stands on assumption,
> + * that shader kernel is placed before sip within the bb.
> + */
> +static uint32_t find_kernel_in_bb(struct gpgpu_shader *kernel,
> +				  struct online_debug_data *data)
> +{
> +	uint32_t *p =3D kernel->code;
> +	size_t sz =3D 4 * sizeof(uint32_t);
> +	uint32_t buf[4];
> +	int i;
> +
> +	for (i =3D 0; i < data->bb_size; i +=3D sz) {
> +		igt_assert_eq(pread(data->vm_fd, &buf, sz, data->bb_offset +
> i), sz);
> +
> +
> +		if (memcmp(p, buf, sz) =3D=3D 0)
> +			break;
> +	}
> +
> +	igt_assert(i < data->bb_size);
> +
> +	return i;
> +}
> +
> +static void set_breakpoint_once(struct xe_eudebug_debugger *d,
> +				struct online_debug_data *data)
> +{
> +	const uint32_t breakpoint_bit =3D 1 << 30;
> +	size_t sz =3D sizeof(uint32_t);
> +	struct gpgpu_shader *kernel;
> +	uint32_t aip;
> +
> +	kernel =3D get_shader(d->master_fd, d->flags);
> +
> +	if (data->first_aip) {
> +		uint32_t expected =3D find_kernel_in_bb(kernel, data) + kernel-
> >size *
> +4 - 0x10;
> +
> +		igt_assert_eq(pread(data->vm_fd, &aip, sz, data-
> >target_offset), sz);
> +		igt_assert_eq_u32(aip, expected);
> +	} else {
> +		uint32_t instr_usdw;
> +
> +		igt_assert(data->vm_fd !=3D -1);
> +		igt_assert(data->target_size !=3D 0);
> +		igt_assert(data->bb_size !=3D 0);
> +
> +		igt_assert_eq(pread(data->vm_fd, &aip, sz, data-
> >target_offset), sz);
> +		data->first_aip =3D aip;
> +
> +		aip =3D find_kernel_in_bb(kernel, data);
> +
> +		/* set breakpoint on last instruction */
> +		aip +=3D kernel->size * 4 - 0x10;
> +		igt_assert_eq(pread(data->vm_fd, &instr_usdw, sz,
> +				    data->bb_offset + aip), sz);
> +		instr_usdw |=3D breakpoint_bit;
> +		igt_assert_eq(pwrite(data->vm_fd, &instr_usdw, sz,
> +				     data->bb_offset + aip), sz);
> +
> +	}
> +
> +	gpgpu_shader_destroy(kernel);
> +}
> +
>  #define MAX_PREEMPT_TIMEOUT 10ull
>  static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
>  					struct drm_xe_eudebug_event *e)
> @@ -382,6 +449,8 @@ static void eu_attention_resume_trigger(struct
> xe_eudebug_debugger *d,
>  			resume[i] =3D event[i];
>  			break;
>  		}
> +	} else if (d->flags & TRIGGER_RESUME_SET_BP) {
> +		set_breakpoint_once(d, data);
>  	}
>=20
>  	if (d->flags & SHADER_LOOP) {
> @@ -602,7 +671,7 @@ static void run_online_client(struct
> xe_eudebug_client *c)
>  	data->threads_count =3D count_canaries_neq(ptr, w_dim, 0);
>  	igt_assert_f(data->threads_count, "No canaries found, nothing
> executed?\n");
>=20
> -	if (c->flags & SHADER_BREAKPOINT) {
> +	if (c->flags & SHADER_BREAKPOINT || c->flags &
> TRIGGER_RESUME_SET_BP)
> +{
>  		uint32_t aip =3D ptr[0];
>=20
>  		igt_assert_f(aip !=3D SHADER_CANARY, "Workload executed but
> breakpoint not hit!\n"); @@ -860,6 +929,13 @@ static void
> test_basic_online(int fd, struct drm_xe_engine_class_instance *hwe,
>   *	Schedules EU workload which should last about a few seconds, then
>   *	interrupts all threads, checks whether attention event came, and
>   *	resumes stopped threads back.
> + *
> + * SUBTEST: interrupt-all-set-breakpoint
> + * Description:
> + *	Schedules EU workload which should last about a few seconds, then
> + *	interrupts all threads, once attention event come it sets breakpoint =
on
> + *	the very next instruction and resumes stopped thereads back. It

Typo: threads

> expects
> + *	that every thread hits the breakpoint.
>   */
>  static void test_interrupt_all(int fd, struct drm_xe_engine_class_instan=
ce
> *hwe, int flags)  { @@ -970,6 +1046,9 @@ igt_main
>  	test_gt_render_or_compute("interrupt-all", fd, hwe)
>  		test_interrupt_all(fd, hwe, SHADER_LOOP);
>=20
> +	test_gt_render_or_compute("interrupt-all-set-breakpoint", fd, hwe)
> +		test_interrupt_all(fd, hwe, SHADER_LOOP |
> TRIGGER_RESUME_SET_BP);
> +
>  	igt_fixture {
>  		intel_allocator_multiprocess_stop();
>  		drm_close_driver(fd);
> --
> 2.34.1

