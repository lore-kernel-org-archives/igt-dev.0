Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE55CCFD2F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 05:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB7510E522;
	Tue,  2 Dec 2025 05:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kdkC84V/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A9E10E522
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 05:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764653533; x=1796189533;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iUGo9EUPU5RC7fkrAGkYnCgH491tP1v4o5W3rBtFmi4=;
 b=kdkC84V/xnpuFbsjZgSe0KxO34QlAIPk2C52uWAI7cD7RCleRzl4VEfJ
 iWrSJfpmmeTC42H2Cy595VNBqsENZ7ppL1XTi9e/G5ekEd+V3ZW9e7hI8
 LF6yNEv4SCKJxXFw/Fqnzv64UxaA6Zx/MfPucl2JLULK/xmPlL5ZLtSFP
 bINGJePZosYHlDTQp6SPDlsvyBMV4zZaixVHwlKZSMSC/J3jSV62s4yA4
 QD0+dF3W74WtOIus7vNWWX6/XahPJ3p2PzbQzdixNtXFb+oHkPVil0Jg8
 pMppB81WHZrbWMq9tdJakiBPtvxzcKu5brlGIgukQ0VGe5LQLaAjM+OIC Q==;
X-CSE-ConnectionGUID: s2nq0cKHR6a9HDcgMHHBNg==
X-CSE-MsgGUID: zHnPwLs/Szy0rE8VU1G1fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77959624"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="77959624"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 21:32:13 -0800
X-CSE-ConnectionGUID: 4Ca2YFSqTyCO2CK5XO8tKA==
X-CSE-MsgGUID: 6QEqhyIpQh6tXbl1tJ0qjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="225242236"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 21:32:13 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 21:32:10 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 21:32:10 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 21:32:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJjbklVn5yj4Gz6vI9aIT0w3vclBskdWhV86j6UJmMijXM5dPMNkJanq0cGY2Q1nKOj2jCLROwuweU0bAvT9Y+yEQVUzr67LAW/H/UBsR4qh518+PKg3q0B7G7LHXeLF9GiJcZ31HgsIWfkLe1QAAuoyqcryX5FYPvDvLaZltT/R81NwLzReGWuf7SETban5v5AvTtiPxbvbCeoVT7ZJ4/cJxpKorCjLJtb3XU0eiGzPjbNThM7Y5uLr9Ew2Qm0PEU0VxwQa+FHnStgY0R3VZ9/qupn7cgYMqOMnFQocmvj7aAxoMbDMOgIOJ3pTp1iSDUNeD60Us8KGRDjXtNghnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gd04HPofzYlfqlcC9FvXleDMXjM9TSVrGK3olKnHS3Q=;
 b=QpAyCLOI+1LbzwgbwwfaPs0kKWKdg4Q2CNoKSAPYibnbq7aUL/XGTtdYn7p2NCTU3Rayu/vzG0ksO6kKBEWSLuhTg2LpIci41MovlqhYbbtbPu8Um5wQxIN1ZXv+ktjzwz6py4emET0Tq0yTpM8B66+PScjHzsut07oErye9mjBhVMZM+SKkCyi6KOiVOvREe2ethLLwweC7YczfUKc+CU6kY3T90CToH9xRN0n0rKEGqiRsA4TiQUHwCa3w9qzNRCCt2wc0ti5lESWfTdLBmiqWRRpjSHrlZEWGorIfegjik8YcuwVKr5fTRpeSzh/tUHH1bAhtNoqC86E7FqEm+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 05:32:04 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 05:32:03 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH v2 07/19] tests/intel/xe_exec_multi_queue: Add multiple
 placement test
Thread-Topic: [PATCH v2 07/19] tests/intel/xe_exec_multi_queue: Add multiple
 placement test
Thread-Index: AQHcWpr4z20bs9NOek2IuhtH/jz9mrUN5KEQ
Date: Tue, 2 Dec 2025 05:32:03 +0000
Message-ID: <CH3PR11MB843410509DBD6D729D73D9518DD8A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-28-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-28-niranjana.vishwanathapura@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CO1PR11MB5139:EE_
x-ms-office365-filtering-correlation-id: e188f981-680e-4780-174e-08de3164201a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?SFHNmWz6n/9K3k9Pw8eGiLevk0o0yQyKtdsOgjCCvjqi0EcC4onZEINCVaWo?=
 =?us-ascii?Q?KXMF0QOJ1/6JkuN/0n+LA4KHb6VfhKLT7p4ElRjF11kRRlLk+tOZAD//cNz6?=
 =?us-ascii?Q?D5GvkeVGk0Meqq64sRGmN34CkYixt9gKjj2D42QsO0ZakzE448K2N5LAG3v0?=
 =?us-ascii?Q?woBmPkfL5rFVLLKCKJSH4mckFeH3WjwdurS4qA7f3KnmX0mliJuQ32MtHmNe?=
 =?us-ascii?Q?8ej6KlqiiFsI5aBtX+MW1j0w88Kxl8vtcCwQ0FDDeywC5GCT09i3GI7B4I7r?=
 =?us-ascii?Q?lzX4LDmxNnk3rqedpGZuiaSBvATKiLQj5shqU6toXcZbSKNmOAQfvsisnIaC?=
 =?us-ascii?Q?W1eH40nETjjXs8VD3a4OsrjmTOdmeExi549ReF3YtLt3opiBpGMbBUEUz+4o?=
 =?us-ascii?Q?stIgQCM030NGVafHlsIWkIVKtBvsbKJM7ojAJOhWiyYI09xt8nF2teKd4iGY?=
 =?us-ascii?Q?2jW5RrCtHiH0B6nXhkDDflWW3UGTqEmnmddWibwItF7LJwz/roqYDjti/eOl?=
 =?us-ascii?Q?Pzleu//lmd+2AuUKw87P/obYK26rw6oz2qLpWPjnMn7EQDoRzCIo5LasG8ka?=
 =?us-ascii?Q?aOlGRbu4dMBYjWCfb01bp4iOepLp909sbC/gdsUnI8bzaXiofNQbQC63ICP+?=
 =?us-ascii?Q?xV7K6/rY/Zauo6BrDOiZ0xE9ZHtYmvR7XXKzu3C4Efrk4M2yoBSABL/ZOZIL?=
 =?us-ascii?Q?6Y7E1OPo9RI6qoOVT9Ax+Nn8Jr/1L8HicG1KqL92a75CIbuVSP6jpnoeosXx?=
 =?us-ascii?Q?OmO0SYruOu31SQu3/EuNcBxavHn30utxOaRNY7FPhR/RLacVJmFcDxhxHWUy?=
 =?us-ascii?Q?Y01zhg1uZco83B59ygsWmLa1D3L/iZOnjj8K9ijGRLc7r4mEh+A4FWOl9t00?=
 =?us-ascii?Q?Lw0+ZArtDMP6ZkD6m99WqScjFFThkppAN921RsQd/aYO8NF5M/13kKFQKDmJ?=
 =?us-ascii?Q?pOZQBkvh/2UVlIDhSXEnPA3oclNHAwjyr33S2AfsDse4ghU+KUh0qpYUc09v?=
 =?us-ascii?Q?7Nm/MBc3MKr/QhJTxyC9Z45wVjtq4ELj2oIkWxKTTSW8HU8dKu9iN5AXEEGV?=
 =?us-ascii?Q?tQDv2clCVpwjGx6kYqI7uMBp77oWBJ4PD2tIty/ooXaKUHBvsW4llBQvd3S7?=
 =?us-ascii?Q?rJpaJ/N3rtFtn3AkWtKgSQX+eViSKXVPtWmJUFrhn+MK9nS+hjRxD2EjP39j?=
 =?us-ascii?Q?R2qytRR4pClTMQ9zKFWClJQqt80MH3cDvEkx1SVA4S4mo/lMqb+fi0YJ5qXu?=
 =?us-ascii?Q?SpZ13VLCUf9QPJF4bGILywHIspr2EPYqXJI7zOZKNFkZCyRmcSi+9fVkPTUc?=
 =?us-ascii?Q?Ay09xR7QJSQzU2a73K3DAvL0+2ueW81AJmnKoVwU/ZdAZ4Rh2Qnm3TWWc7UD?=
 =?us-ascii?Q?53kW+8ez+/srxT+1uB7li/LprJPO67jMLT4XWI4M32mfTJvjKtlTbrMWrdlo?=
 =?us-ascii?Q?K3lh6Lw9CcM9VEU23fsJFGE79Sk0Vu2Tq7gHRMDB9bE3b+KbMq9vhSmk7Y5R?=
 =?us-ascii?Q?2jNq5UUEbZpJ0+afkVSK83kVKFucZi1spKga?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zye/nfWE2oF+OgAJBDGDmVkhe9oFi9ws/TAglJoPIsMypJNhbS30XW/7mwI8?=
 =?us-ascii?Q?PYbCUmHAxNRd/htQSlluza81JiLGsVm9seTnSDm68Nlm+9wINVlAQ9tHaPYI?=
 =?us-ascii?Q?V1lIS9e4EaqjJTvqLvQqU2hXTnozfFJ3Z862F1X/Njcc6Dz3HqvoweDfrLP9?=
 =?us-ascii?Q?sBRF2rztIMH2ouaPTKUq1d0KS4+IKLULlk/laqtCXKSl2s/JHwwiphZnwtt1?=
 =?us-ascii?Q?OD38DeR8KhBJXxxNSfD/gsGDHKkEZUkPbawLPtbhfSqhvGIZyqgXhrc0AjRZ?=
 =?us-ascii?Q?lFX8ALTU4izDwxLbGmDxsZ+djdIo5u8ZDZRZ1gzHRpDMaX3721fpayu3waVU?=
 =?us-ascii?Q?BSZHBgO6BwXEZC2WjH35riRwGUelhmLxrEfvsAfW2pCWt8XOttKbO3C7gRNS?=
 =?us-ascii?Q?gzbWu5YCsw7heRmjcKz/gjeIZ57IqUlzlRIlZYQc8E7xqWwxA/GMtB2o0TvC?=
 =?us-ascii?Q?8pa8JZCdk1KEYOwh1GWUbqOWuEBcTcaSSXLMurBvxFxGdnJEYv7+NwRH7hGl?=
 =?us-ascii?Q?npj1KWuZTiEF08PCGLxGpQA0dP3DvOPchP+iSG9bBkx1dFEUttf4pgG4Elyz?=
 =?us-ascii?Q?FVLhiNdFZZBjR2fsNqNRisSyw4haDQHMiAXUFvay2QDpimjFPsyNZdOQs7W9?=
 =?us-ascii?Q?kFxDWmhRcYVEblfJ5aipv1CZwQzzaeM0HSJcg8e48h2ybIE8XyXYEP3AhIFh?=
 =?us-ascii?Q?NDnlqwlJRNxTXUHXDyiP2o7cSeYBPqQL/bS/5Fog6HyEcjns29eJDFcbI8wZ?=
 =?us-ascii?Q?k3VDl+t4UyYTQHNUksJivi5TJata7iTPV2i4GnQrNLQfFrKpmwairNWhnUVv?=
 =?us-ascii?Q?stP8/0HqkYI42J62XzDlidjl8M0uPJaT1EgbGFjk7MLlI16kdRcJdzRlBGdU?=
 =?us-ascii?Q?cYBYZLga9JByxEOSTzNqObt0oHg7pcYO0jALAJWTjNZ//OcGZtrhSUuPWVR8?=
 =?us-ascii?Q?0kLg0Ovz0xAq6zzTRLmbmnfS889W45X7NaVY3vzKkcGtu1n4blQbV4RCyzGd?=
 =?us-ascii?Q?XPHYA54Gv5O6bxBQUT/6K0xs1iHgiJl4rQpJfbGCtsjBLlbw/f+YKr6mdvML?=
 =?us-ascii?Q?71BXZ3U0rUBuJbovF/t1jMgGHmzq/pzE0FKdzHKnCjvLJF6UbW8ZuWMziyDh?=
 =?us-ascii?Q?zu8JgUNy3NZ3Ba71J/My8UZ9xFj6H0IERsda1Z02BctzZNn1tUWUmHdEFvBF?=
 =?us-ascii?Q?oc57LAFWTfOPQED1pG1R96X6K1cM/hUasEPwzyERMSkFvIleyIGuZxGFViFC?=
 =?us-ascii?Q?1ac1H25p1GRTpdVE8BedHMQUUrqI9VTsNxorUjXFnYodQF5olP8dzMuAZRGz?=
 =?us-ascii?Q?xQ9QckA2AFMCfeBR3icGtecnfDM/DQVjCiRoia6ffjVi3WvpG29lJTCj5HgO?=
 =?us-ascii?Q?3xmPZoeDaZHpRmLBQwHGC55MGSOfBq+Rmh16vCnHcGSQDS0dCLWz3rBAItTw?=
 =?us-ascii?Q?AHYNpK2X4O3uJvWmnPOxDhYC3iS8gNyokn3kDw60BtyxkCM7rwYoTp6Wsf33?=
 =?us-ascii?Q?rdy8gYCf/Cvxj/I6sqouqirFEenhPCbrhLDXAaYS/c446fd3V0viuyF+p3Sj?=
 =?us-ascii?Q?fxb7n7Fwq1xXQH1qqncmsn316h06ijS0YW7QGrsaA/ZfqHXdKDf25rrqhv6p?=
 =?us-ascii?Q?WY8ji8l6QkzdaQyf6GV5NvC6dF4/LHx9z0FluspJM9//NpF8Wd15nHYu5yQQ?=
 =?us-ascii?Q?Jh3L6w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e188f981-680e-4780-174e-08de3164201a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 05:32:03.7976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: APZik27PVvwzxHAkrSkant8tr3bYxBviZfhfDuPQfdn2VXg8iqiAk48Gfj1QsuCUqhStXbRiBHiQZriEarav2weq66ZYqaBC1Jv0W/fYe0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
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
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: 21 November 2025 09:27 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>; kamil.konieczny@linux.intel.com
> Subject: [PATCH v2 07/19] tests/intel/xe_exec_multi_queue: Add multiple
> placement test
>=20
> Validate using virtual exec queues with multiple placements.
>=20
> v2: Run test even with single engine instance
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  tests/intel/xe_exec_multi_queue.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_multi_queue.c
> b/tests/intel/xe_exec_multi_queue.c
> index df60835d6..fdaaf78c4 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -383,6 +383,29 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci, int num_placement,
>  	test_legacy_mode(fd, eci, num_placement, n_exec_queues, n_execs,
> flags);  }
>=20
> +/**
> + * SUBTEST: virtual
> + * Description: Validate virtual queues with multiple placements
> + * Test category: functionality test
> + */
> +static void
> +test_exec_virtual(int fd, int gt, int class) {
> +	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> +	struct drm_xe_engine_class_instance *hwe;
> +	int n =3D 0;
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class !=3D class || hwe->gt_id !=3D gt)
> +			continue;
> +
> +		eci[n++] =3D *hwe;
> +	}
> +	igt_assert(n);
> +
> +	test_exec(fd, eci, n, n, n, 0);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe; @@ -408,6 +431,11 @@
> igt_main
>  			xe_for_each_multi_queue_engine_class(class)
>  				test_sanity(fd, gt, class);
>=20
> +	igt_subtest_f("virtual")
> +		xe_for_each_gt(fd, gt)
> +			xe_for_each_multi_queue_engine_class(class)
> +				test_exec_virtual(fd, gt, class);
> +
>  	for (const struct section *s =3D sections; s->name; s++) {
>  		igt_subtest_f("one-queue-%s", s->name)
>  			xe_for_each_multi_queue_engine(fd, hwe)
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> --
> 2.43.0

