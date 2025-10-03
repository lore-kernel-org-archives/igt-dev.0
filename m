Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3102ECAC5B0
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 09:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F3F10E0D2;
	Fri,  3 Oct 2025 09:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfoDDBNt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8B110E0D2
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 09:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759483262; x=1791019262;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=gsgleY4BXRLhdU5FcdSMN7zJX47x2bw69uG6aUj5X1E=;
 b=RfoDDBNtv+ATMs/TOryIlWUcllK8igUlQqCWVisVnN1jnwbpId81MHvY
 fblmg5IwanH+D7Zv4PS4csAgDtpsdJWyoYvC6Mh8vmyVWYHr2yhUr8nFV
 PQ5yMI6I4drvQGNsRkYGEjYCKtMcrpPSlW/IxFmrr/4y9ow4xHGhr1BJ8
 04FlbWDLnilHgX+C8TcWO9DGIZOSl7ofN0uKh0El223vGOqdkg9xV3lNg
 CidVZYZiGLaafBEzuYaC5V/a8EGt2KaFeH7e/BoJMIaH3qjC9AjnvHZhV
 3JmOPSfXqTKXbWo32PbcDcFHcYfmSRiV/pViPbRfyL/TZTJ/sSA4NX8t2 w==;
X-CSE-ConnectionGUID: H5ZAjxjWQMG1IA2BAzEF/Q==
X-CSE-MsgGUID: 6znvUT5YR+6D1jd1QAfkWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="73193826"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="73193826"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 02:21:01 -0700
X-CSE-ConnectionGUID: QX3gW2sPTzq+1JeVnivMHg==
X-CSE-MsgGUID: mc6iMqC6Qiqqqumv3aonEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="180044925"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 02:21:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 02:21:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 02:21:00 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 02:21:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVV9GpcCYvGUJx+h7AP41zlblmOknSkosNkqi/2EAkqWHJ26n2E/BU5m5n67Lnvu6FKfuNL44qeXby9QWxnyeSxaeJ/hsZGpKx0SF057jBCh3IxWcQE4MDwhemq2Krk5Z58PrIY7p43CyQL8NpPUyLDhC686AD9ZtLkIie8X/l3TltEDUy7lQPW20EbxfU1bFB+PWfncgjF50LxOm6jaCciM/27aAgbV4+OvSlNhlaVCH+YS3QM7T6BjqKPtQWlysLuUG8Ym9Q5UVll0VieNDcWGS4McM6vwSO29NnuyDO62L2y+r7KjURu8bG32+j0CBzKd9eTaLPL6oK5lP7lpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsgleY4BXRLhdU5FcdSMN7zJX47x2bw69uG6aUj5X1E=;
 b=sCLhbR96lh2gqeyAiLDyNYiAWUyZsu9/ejikgsQgZcc2G491k5uZuNCWiUbsBfce87bEiOijdodoVMK6gy9LCDgVJdPhr6bu+Ud/50nCkmhVMvQVGgsTQSxSkSgVc+0JL+i6axrKbGQsw9i96HMu2VvaIgU7TUnI9RBshWHY/+N2FJJyseH3RCxNq0MZCNX1EMEuQhkzfs2e4TzSjlhWtHrkUQWNAhvSI0t+Tlz4LxC9SauLz/hHVzOCtUI/nRu1cpO011aywD853EF6EuiU4evoeozkAvNwafSHuAm9gHdFMTgEmzdYWeFdX+PmJ25nii+S+odt36S8NhA7hH+mGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS7PR11MB8782.namprd11.prod.outlook.com (2603:10b6:8:253::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.18; Fri, 3 Oct 2025 09:20:54 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 09:20:54 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: Recall: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Skip CRC based FBC
 cursor check on simulation
Thread-Topic: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Skip CRC based FBC
 cursor check on simulation
Thread-Index: AQHcNEcEqAeol2roF0CZ0h6SwnLZFw==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Fri, 3 Oct 2025 09:20:54 +0000
Message-ID: <DM4PR11MB6312757BE12900255FA0935F90E4A@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS7PR11MB8782:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f4642d5-110c-4274-7a43-08de025e2753
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?JUTUBNLIPp9O8rkJ3EjAHJD0hX3YgtVGWAhtl8yjGro8cifWHp2RltuDEpVJ?=
 =?us-ascii?Q?E19oezd1F0PCHPg7kIQmlYL5/+nHWgKDjFj8K74SIUeOV3CSobHZj7GSQNbW?=
 =?us-ascii?Q?4Y8z3KxhG3PDTIvt4ektC57tbI/t/Sm2Z4UbKuNm+EZk6RKRpib0Y1DTl9w8?=
 =?us-ascii?Q?KDx/klncl/kW7Ds5HwAnknhEX0c75mqo+BiHntdN/fxiVJQbUD5f6+k3E1fe?=
 =?us-ascii?Q?+feUntFs0AVp+yX4Vxi0Ej1YXcd+4hT0g6KTGC4HmNL3zlOvxUdD1WZ/UHI+?=
 =?us-ascii?Q?GPyiaLo6dLSSvbTdIxwyTTbtjXjF3/F8T0yDJ5msQJZf8NeMddib+LvH+W9T?=
 =?us-ascii?Q?wor2ZeZsprQBw1XNYCKNWNZYBeB2haNgb7kwM5OFM8SEqJe5FOVJxW4eK1Om?=
 =?us-ascii?Q?cFv7bnwQ+5znr2akwpt+trB8DpoPL0uYQH51SZe1ifWrExNQLmNfZM58T+wz?=
 =?us-ascii?Q?0w/qR/Wa5kbfOCc5KRDgyWa93oKJi1MfL/KzahrtaMvu3goh9sLuZvx1ZOQz?=
 =?us-ascii?Q?GiyD8A28tjaQJTgfKCK0AizOxDSo1PC0yeYPddL/twiX4n1m1NxlWWjh6a56?=
 =?us-ascii?Q?6yPfujsfpw/qPAH88mA6i57tFRwfRB3P+M2zApRwCQMHNwHbWnmBMI5BaOVu?=
 =?us-ascii?Q?91AG1KxgTvbFx90FuUVfeTLBLa2CbpB2qlBhrBt08+IIjLDUWMWAoAsR1z32?=
 =?us-ascii?Q?+PUgfJfed7NbqlSbOPpTgtnw+gp6eG5IaUlKKA2g1hX5CnMzE7mvg3isv8W5?=
 =?us-ascii?Q?PBkw0HigUX20C49dIbvpjJ3B06cW5XgXtJP6FMKXGtFo3HzmfOT673/MUpac?=
 =?us-ascii?Q?1+RwB5PKcHtg+SZnVI6qloDvQAuzqscFF2J1gGZoWsBKG2gw+cnCQWcrrZqL?=
 =?us-ascii?Q?Yf1nxb1eAk66zdKd0sTBv1wwZvgllgY9fRsMIn9Xk59hA65n0WgHldAZW1oN?=
 =?us-ascii?Q?xjHb31NMmSZsqJqFTv9hYtfFeO4NU5nTeB2dztwP3ahhH2fPz3IqY3hiqTuo?=
 =?us-ascii?Q?2nyEVXND7P58/jlBbIxYBSH8HfmLTR9mftwv1nM4pMsQh3Uy5W7XvcroKQGn?=
 =?us-ascii?Q?Lm+RIZI9BY0izez2j6ry0Wks+rhoRUFqZaxU75cMWtxmQsmF2fuLOpzxWP29?=
 =?us-ascii?Q?Y+bLmm29lH18nbNctE6m3gKt+VNJrzGFyYskULN0d+KkVUwGoeAA6HHc3kE0?=
 =?us-ascii?Q?ze9PdwrttznbTpp+G1GdDJFtOnNnfwLYR1trlxJLjUdS2/zTW3F3OgwTQHKP?=
 =?us-ascii?Q?7QmeluLG7lcqOasd1MecDQSeAuEnhHlEScYjMbsAvs3PiWmD3JxhNSMm4c6h?=
 =?us-ascii?Q?fD4p/ez+yILsH0ZXns45vpAcVZLBoc7Ki9wXNe7AQzEJrUCr4rfNJtxi3a8a?=
 =?us-ascii?Q?+nfhsSoHXcuQzGohggXgEQEkKijJaBzzPBZDVuC05KgED+RHEvETyumaHI4G?=
 =?us-ascii?Q?RUf2zq6cRUgVVeiESM5wXXrpv+ErcTgIinghh81PtWrSxkSpQCBwwy8U24LM?=
 =?us-ascii?Q?8s1eIvW3o9pFyv0xFOA+DEQwkW4uLpV5xc/y?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KMmgUAIgCCjGZJHx1nm7w2pCpT7EUW1l8RXGPXEqydRbWY/NnxOqbh11eGqD?=
 =?us-ascii?Q?dnpCzqAasRlNTJ0aLaCa7+yLjH6DOylLkB/gWHl74exQc1o3J3FE3jezMXjz?=
 =?us-ascii?Q?/b9U5tAS9qcToipaBDl6oJtfuwwBtHKmoQrq6Swg8xxnHNEaVTWRbs+mJ1NL?=
 =?us-ascii?Q?y+nT20Kn9XyHc2qmLV0dU5NIQc1SpHVGqIziHkmp0xs5t/rImEd6tHU54ULM?=
 =?us-ascii?Q?+HSgNbmxClo+UKP1hGUgcDuklGYWc2cvMrHjfEEapIGuRvbyw2LfyIp7VjiR?=
 =?us-ascii?Q?4KAQDpm5NkBr3yEHQGVAC0Rx5m7qlbxHhXcdxffDUbzgFI1hFe914qiOyOqU?=
 =?us-ascii?Q?LPIWUiXa3ayk/6m4JtUkio/a1Dex6l9rzIH3EPUJwJ9FWasKE2qTmUjsOSzl?=
 =?us-ascii?Q?2VsVlILujv1X4r+hVLYpW+mmbog14fFuxCVpxbOfSrbhgA+pilcOXHYmNFqV?=
 =?us-ascii?Q?G9k0phSqLjXhQgI9h16GWXU3k1sCNaASwb1xK/9uD/5CBeaIsCdWL9c350AV?=
 =?us-ascii?Q?tzjCzre1jpX6sZvVfy1a5cQF4JK/1zmkby7/XLfHbEFgIWfdXzNpGtijbgzC?=
 =?us-ascii?Q?2ftk/0/Sx6pb1riKqyF3HQ3zISFe1CD5q0vCImjWTVxTlTg8U7Zzljp2RunD?=
 =?us-ascii?Q?yaYNMsYuVJufuJB9OKDdtnSEJ8Y1TVoTeBkEwyyqSdKKRw+ZfhpFiWtQhuik?=
 =?us-ascii?Q?Ff7D8vyEQIzez53fZH6Hcfc060AZIHHVtCv8AnKeca4IREmxiLLJDy2nGHQ7?=
 =?us-ascii?Q?JwStF4HjBFlEcZS7n5IpZqSfVTBY4JiCkUVq3qtpOVfUAkyOlALbFLdNxukl?=
 =?us-ascii?Q?vYCYgGs8xjYWfmVB5KozdkQ7/QbhROu05y0jG6iUcPXqKVG75lwHXLmPLvM0?=
 =?us-ascii?Q?+ueMNE7bEvWYrx52PnLTB+ccQDvG3bxBCkyHcJd6ptRlZJYCLJDxhcG3IoL1?=
 =?us-ascii?Q?qWKL9SETItq7FqRDeh5v2IqhB/+S8630YZF5Qhh6A+TZSvhDkKAKqjURzS1h?=
 =?us-ascii?Q?31j1N5aVuhXuUQ5OpxH0PhEIzM1dB8yVy82rMSjVB3jX0bVZKRWZNC6wZsOr?=
 =?us-ascii?Q?/yFvkjCELduxsGlwFibgn82S1JlNXYRJ5gP6wmGCeFRqbMXipcE2HEYNAVeH?=
 =?us-ascii?Q?Lbh/FDhg/4VeFKbff51fYQcn/e58BhBIWxuadm2hThkbFaJEZD/NgNYHEVF2?=
 =?us-ascii?Q?gb5sjpl7b3NPEW9wJ1EsNOVlVc3oQPiqFTEK4YvZGV2rBjkzHxJwr29TlwWg?=
 =?us-ascii?Q?iMVnrOAtXoBZqxgQ5Mbp/xndFSQIgWdBxU9qtFvzUiSzBQv5O0M6KDPkZB2B?=
 =?us-ascii?Q?vYDx/CGeXCdY3fkGZv6+SPyaOJU/53KPKadn4krT3TDKMCLkklWCekL0GbPd?=
 =?us-ascii?Q?95GfSa9HFrK5EosUNwwQ7PU6BbQ7SAFxMnxFkOz0hk8pf6gXHbQW1LfZ9OcA?=
 =?us-ascii?Q?3+CofEPL+NstqBSR6BTqLVzTku48cUDkEXUMhm/zQmKj2AGFINUmR3gjBZYA?=
 =?us-ascii?Q?K9HZsO1/QL8OIhM1DZblmehGcN1UkNW9vwnpojZBYw/E4uzZ6I4u4/kHUaZi?=
 =?us-ascii?Q?tb/OdY4Ijonf1mUxvcU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4642d5-110c-4274-7a43-08de025e2753
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 09:20:54.2772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y+rFi0E8IdGBP9wcqglkv77LFaCOnZr7c1a8v6ZpLp9aPxufdpfDA0f7GfbclQR+YeT86U3gUVHPdk8KU7rxJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8782
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

B, Jeevan would like to recall the message, "[PATCH i-g-t] tests/intel/kms_=
fbcon_fbt: Skip CRC based FBC cursor check on simulation".=
