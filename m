Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FEAC3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 06:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CFF10E302;
	Mon, 29 Jul 2024 06:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNr/H7Ep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF2910E302
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 06:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722235232; x=1753771232;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EU4+ssRoOCPKQL/aKIFwN+H07dswHCoM8KXuWzanb/g=;
 b=WNr/H7EpaaIluOAO4tHca9QiwmM6+TmJtS0kIIH4NPuXwPHehWyauFDd
 S+DqvasuA8qmx5mb/0CIvH4Q+lMy9NIna30dyqBfns7/BHMsRhft+t09z
 TVqXd+tYJX3I9eQAjeoGueq1Wm/pErbpFquuGPplJUdNBd4XeZrkLePH4
 nSWtnYw7xYxTk4cTnBY+5+biRri6ca4MimoJSslODAaU9Yj1IiWuG3ZiO
 Uirr4kKUksdqAPs6ZTxW9DVC3iFjrV26K9+QdN0AQqeLdN9G7lmk3322t
 6pdco5lLvr4TsjkNtuuGVPqOWqBHDSIyHa7tbiTbT9E6AKO/+kS09roAb A==;
X-CSE-ConnectionGUID: xi0JFyd1R+e4eIw+eRn5sg==
X-CSE-MsgGUID: JUEPcskuTd+eNsRCMARaIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="31377138"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="31377138"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2024 23:40:27 -0700
X-CSE-ConnectionGUID: 86n8BU9CSqi0RQsAf0/BBg==
X-CSE-MsgGUID: 2Qz0TxEzSQSWBHCukDCUGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="53559109"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jul 2024 23:40:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 28 Jul 2024 23:40:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 28 Jul 2024 23:40:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 28 Jul 2024 23:40:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 28 Jul 2024 23:40:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1D4gF9+vTNtpLF6BTuQy8zaolWL6i+czJasha2Jt/zXrcI59yAB16HunjrXqEgMWGM6/ii+8R9zBqU/bULdF8CH3tbS9GmJ9MjoRcFcn9tRZ82Fwp0n49ONrMu17kClSHkgQx4H/L4TOP3Run8T6DC3VHuxPEsc9S3nFHFA/hySrNFfYaFo1wUAWt+08Gu8KGvQf/Nx7dTvbYAKGuJmI9U6/UEBmiLWLuQaQO51vzQWl/ch3m9wMoN7Bu/hBEJBWTuJYOOg6X7FkvmmQh/ob75ob1kkigx/gpOqS+FGuFSnap5tZGv6bWYz9UPvOz8yMraNyuj7LsKrMQaw+/2YaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1di8Si65Ka+w5Akj7IaWbp9rdmx0O33lS/XX+HLvXg=;
 b=Hvp1NulwTLUnIZnb5PtUsuAU/DrPouTsryzIRPD3zIRPnaWqLie4YqLrKTkV224tsxF8DMSMvUw7yH8ZT1UpBNuHLwQIvvkW1kDVJN6UwcPoqWUWrneyrr4UkCnfhLY3TnIu7O2O7Rhmyv4XC7NFYR4yTxOJ/1bt8DjMEYt8zPVcbIQ+JZa6czilXl0G2ChbFdh4l7c4gcyyijuVmPVNYUGlgUbochurrgYzLc6QEXqoGx5k4w4ttt+JnDL7Rs9HyhRlxHeCn6iVPyKBQLyt25xdOmR0W1mBmw+vy9WD01yeIkDlD9qpoS2FVA7t/2KPv0a9zFm7lOC3FGewefUoJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CYXPR11MB8753.namprd11.prod.outlook.com (2603:10b6:930:d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 06:40:18 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.7784.029; Mon, 29 Jul 2024
 06:40:18 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v3 1/4] tests/intel/kms_pm_dc: Update
 test_deep_pkgc_state function
Thread-Topic: [PATCH i-g-t v3 1/4] tests/intel/kms_pm_dc: Update
 test_deep_pkgc_state function
Thread-Index: AQHa30Mmh2gLAspGOEaxcG8bi4KaMbINQ/uQ
Date: Mon, 29 Jul 2024 06:40:17 +0000
Message-ID: <SN7PR11MB6750F6E19D016E994489A4CFE3B72@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240726100751.918038-1-ramanaidu.naladala@intel.com>
 <20240726100751.918038-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20240726100751.918038-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CYXPR11MB8753:EE_
x-ms-office365-filtering-correlation-id: 9741c87f-12db-45e5-f674-08dcaf994f96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?wSyRVeQI3afKe/YA/NONBplDcDEKpZaMi+IolDYGUa2fLSu/SFXmZENx9hwj?=
 =?us-ascii?Q?yHea4wKkY7NVgt2qL4xvgWFinou+Uw5gMx5RpcZnXu8xcW6wg2oorvvvxce+?=
 =?us-ascii?Q?6D2WgiYAmbSap9kO2a8Ek6JPwMC9XDbrxkZjoK7Zbb6cHkT1v60G4hfzeH/n?=
 =?us-ascii?Q?Mei+hnQIbfFX4ydtA/V6qloGWeqohJVIhLVz956B26eUwRu8XOiAoxDD0LPY?=
 =?us-ascii?Q?KKK3FjIv1yyMwgXGqyXKzTn/wKM3ar3d+HQmnWq3NxBiWn/9JZcobNDIBDnb?=
 =?us-ascii?Q?pBQep6OS254QrroqZ2Z9a16LitpPJjlsDBqNWG3gvyU7YVrdk+XQTi9MVXSB?=
 =?us-ascii?Q?iBqoyEpPOnxKsmNeMAVbkZSKCbRTm3AeKlDDPY6cWcwy07WEmj4czoOniBUU?=
 =?us-ascii?Q?CxNF9+hNPKvN73ThEwgfBZ2NYW4ERXstIPeuzgfNOjtYLNLxywgCntTRsrZ+?=
 =?us-ascii?Q?kHyXdWjgmkyCjJSfx6oKOyZIOuGlz7pz1tYvrrTctSWtzBZISeSqo+K9kDQs?=
 =?us-ascii?Q?ytjK1Ei7HRYZ6CyXU57cJt2WAHG+YSILjldyvQJzfE+BfqxPeIlU/O/y0P8j?=
 =?us-ascii?Q?rioThzCDWrgY14TW0TuaPCDeldvwp/uZheOT/4iABMudZdOuMz/DzPDeiIgr?=
 =?us-ascii?Q?SFouxpESxpt2czaaKicqDINCwG4scETpiDvlHyy1UWiI9lYARH3wgMsMeGFC?=
 =?us-ascii?Q?Prq1f6nHtZfgebaQhSjWQlnVZGKY1KPANd6SGo/1GJ9sqbdJ3c10VATFSsqK?=
 =?us-ascii?Q?PleDS45wTrqFer+JqC8fIGdYbDrQZybPDAWf6WNJhlbpag2RJzFoX4bibQe5?=
 =?us-ascii?Q?MWULd43tQocUx6YeeKwso9An0+sIfTWMTEg9NeGc6Uv8MfhpoC501j5cjabB?=
 =?us-ascii?Q?axG5+L0e8qLwfg+fjipEnyInrmZU+iAwA9fT03OlRBr89jYm0kgnRpSHsUyv?=
 =?us-ascii?Q?7zqCwsu2Lt/h7pSEh4dMNxC+585a5u12Bw2SKiZZ8untUGm/KEzFl0pf8uSt?=
 =?us-ascii?Q?RJiT1yS6zUta6RoF7VWnjVqI5rsoHzSvoUSNjZ6KusehsndAjqwTq2RuB0LW?=
 =?us-ascii?Q?EFUId7oJNjVItbyW5S/GEk+xKE8YEBUGW4ja2/uJ5gM5cUaiUOlYMvzEUC93?=
 =?us-ascii?Q?EfF4r89unOPXWU7FgXTrD4YdBX3ZBgIGqG1hphsj4W++a5rMOcsioaFA0e5k?=
 =?us-ascii?Q?dJrtWdhB2hU0Nal2TTBsL4D/Sw4tK5GVEnjNm/BBih2R+07DI4UXFnkF1FYV?=
 =?us-ascii?Q?YcBg71P5Jy50nwtRyAB3xq1krEMLa2npAP8sdQoQKFkKqITC38tigQZ5DTZZ?=
 =?us-ascii?Q?EwpA91AYqOryPsSwwvMIVJtN4QrdnBITE90YtnTwFXOgapGhUknCQYkqLm5b?=
 =?us-ascii?Q?gaWTT1/eiuPhHKZEloJ2Htia/Nh7WHyxPcnNnilCF3Kj05vsGA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pSZKavo87oT+0F3eGeLCmXLeC/Opg7D1VbO4qrg0fzIkpAzArUn/9JrLCX8K?=
 =?us-ascii?Q?SnALshpUTBOCKXCwtvK7CeVFEicGeL2AjqZNOTeEjuxAHLW0BCPUS2nNoxR2?=
 =?us-ascii?Q?eRsemLQuwETNP1Jeec6/YjvycnIpO6X5GggN2q1cfFRvWUORk0a9TwUnDtJM?=
 =?us-ascii?Q?0UeuQjQE179DORb6HeFaMnQbF55QYrL/Ce0fqCPTTARyX5wWzYYa4UUgoiw1?=
 =?us-ascii?Q?LSDfqNLtpvyalidBrWzxDsC/uR8q+c3VKCWfc547eKrtm1j7kRpgUiKSK+ZO?=
 =?us-ascii?Q?6KWZ5Dpx2mVjvm2KaEb60Xa5kUlGo8LRQrZWav1ipe7l9m4fy0+23hxf3p/9?=
 =?us-ascii?Q?FcpIWeOT1dxPayhjUp2ADOtjgvl9YMH4akT1/eoZa6mhp8jlzZ17B/BkeCbm?=
 =?us-ascii?Q?/q/lDhINZwgRWpmmbFfw5qWnQP72LYYPle72ESdd6jEi2oVybaCGP9Pf0xez?=
 =?us-ascii?Q?bjn2dzHYrBhQHFwdgMRfV99idtFoMTRdQrkXZJ8zXITuCntf0oNOjKzrJgVQ?=
 =?us-ascii?Q?tTE6to3vcYy5Q79PO9d+9xe/ZFMqbk1LYDJ7BHgHZARrFY79TJZYazzuodC0?=
 =?us-ascii?Q?gdWFefQXbdsq/7cFEgwGjbMdzjY3nXdky6nXDOqiHK70Tu08yTAFzVAdLYoN?=
 =?us-ascii?Q?tgHiZTvW7gEMoQJXQKiw2WAR+ICU/CDSyFjlF2OSDGhVspe7K3lTdyhfHkMh?=
 =?us-ascii?Q?ESIQjxWTjSS/ha5wbZ+uqaWCdPfoc9q4ocVHxwJPIup+GP+lqwthqN6hUGHy?=
 =?us-ascii?Q?EEyM0brq45r/5hofXH0mp2P2/vGRmb+KiJkulTSExy668Xc1DYmsjNWYsN4c?=
 =?us-ascii?Q?s33pUmEHfdAxVgmQr23q5Kfr11mN94n226+5PPZK1qJd2HLrthpoPJFz2fh5?=
 =?us-ascii?Q?xdiAWy1n8Iz4a4MGPSOzZWmoZ4ANOEIfMqKyG13KJuxh78zAPXRgiB995XXq?=
 =?us-ascii?Q?we+tzcGQTsX+/hsn6QTvOQ+IPbvJ2cOwc9I/fMAFoI6plFGpNt4dhjXdupXy?=
 =?us-ascii?Q?8U3cGhyjC9bbXe97PZJ88WIoLhrc91Su+w2OUf5Pn1MBWupw8XtN6WdFtA98?=
 =?us-ascii?Q?i0HRjxaorAhNEwCIDddJpDNjO16rHqyNqM46hLNbrRDTTcC/KQ68v3mFGtxj?=
 =?us-ascii?Q?CrUQdqUb91iXnyFDqqrCt4YTfKHtVRcUl2bNPwtVF0SWh/gnA5tzirVcONlC?=
 =?us-ascii?Q?WAB9PcuwtiqOcJy8Qw0adBEAt7mwEhJv2DNNmWUg1yPCOt76cYsIDm4gQosX?=
 =?us-ascii?Q?xNrnTwKKMphFinnsxgvbH7Er5CWomGqGja70wYYQpJfNVF5R9rp81NYbQNln?=
 =?us-ascii?Q?NtsDSNuw8bzwKII8R++CmQqRVbCAmwT2fXCc1LAIvKfRW9gpbaQS6N9VvHca?=
 =?us-ascii?Q?hwCSSq2l4yKu5PhXVahQm/CBoQGhgR64QjG9Kzwo9h8VTYLI1fMwBi4XnBXS?=
 =?us-ascii?Q?AuRVURDXQgpx1DSka411bAPt3Dt0E8T6wxSR0XJ7ok24IqsCGID+V5xd5EJM?=
 =?us-ascii?Q?YFqaaVp76nbG5TaPrwVEoktyzoRVpJVXqJc6wecz4bJocpOa9Co5DqiL+fdC?=
 =?us-ascii?Q?FC2g7dL/HqNWCiorxPH5gBN9GxoTvqR+KAYy0/ZP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9741c87f-12db-45e5-f674-08dcaf994f96
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 06:40:17.9430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eU8ZF//o0KOVtHHCkdvIlUz9aE0FkczS/8gVDFJ15AvXtpDP8Rp9pUl63f58Oa7WZ0HInk8V43qgsmpDM7ZY0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8753
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
> Sent: Friday, July 26, 2024 3:38 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Konieczny, Kamil <kamil.konieczny@intel.com>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v3 1/4] tests/intel/kms_pm_dc: Update
> test_deep_pkgc_state function
>=20
> Enhanced the test_deep_pkgc_state function to includes the following
Should be
*function to include the following
> changes:
> - Removed the unused variable `vrr_supported` to clean up the code.
> - Added a check for the eDP connector to ensure proper connector
> handling.
> - Implemented a check to ensure frame time is not less than 5ms.
> - Added logic to disable VRR if VRR is enabled.

The logic should be that if vrr is enabled check if vmin =3D vmax =3D flipl=
ine if it is
No need to disable VRR if the above condition fails disable VRR
>=20

Please use imperatives to write the commit message and comments
For example instead of=20
Enhanced the test_deep_pkgc_state function to includes the following
It should be
Enhance the test_deep_pkgc_state function to include the following

Similarly change it for all commit messages and some comments that you have=
 added in=20
code.
> v2: Correct indentation and update comments. (Suraj, Jeevan)
> v3: Update Commit subject/message. (Kamil)
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> e1318bfa6..3d37d4a25 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -595,31 +595,43 @@ static void test_deep_pkgc_state(data_t *data)
>  	time_t start =3D time(NULL), duration =3D 2, delay;
>  	enum pipe pipe;
>  	bool pkgc_flag =3D false;
> -	bool vrr_supported =3D false, flip =3D true;
> +	bool flip =3D true;
>=20
>  	igt_display_t *display =3D &data->display;
>  	igt_plane_t *primary;
>  	igt_output_t *output =3D NULL;
>=20
>  	for_each_pipe_with_valid_output(display, pipe, output) {
> +		if (output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
> +			igt_skip("No eDP output found, skipping the
> test.\n");
> +
>  		/* Check VRR capabilities before setting up */
>  		if (igt_output_has_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE) &&
>  		    igt_output_get_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE)) {
> -			vrr_supported =3D true;
> +			igt_pipe_set_prop_value(display, pipe,
> +						IGT_CRTC_VRR_ENABLED,
> false);
> +			igt_assert(igt_display_try_commit_atomic(display,
> +
> DRM_MODE_ATOMIC_ALLOW_MODESET,
> +								 NULL) =3D=3D 0);
>  			break;
>  		}
>  	}
>=20
> -	/* Skip the test if no VRR capable output is found */
> -	if (!vrr_supported)
> -		igt_skip("No VRR capable output found, skipping the
> test.\n");
> -
>  	igt_display_reset(display);
> -
>  	igt_output_set_pipe(output, pipe);
>=20
> +	for_each_connector_mode(output) {
> +		data->mode =3D &output->config.connector->modes[j__];
> +		delay =3D 1 * (MSECS / (data->mode->vrefresh));
> +		/*
> +		 * At least 5ms vblank time required to program higher
=20
Should be *vblank time is required

Regards,
Suraj Kandpal
> +		 * watermark levels
> +		 */
> +		if (delay >=3D (5 * MSECS))
> +			break;
> +	}
> +
>  	data->output =3D output;
> -	data->mode =3D igt_output_get_mode(output);
>  	setup_videoplayback(data);
>=20
>  	primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY);
> --
> 2.43.0

