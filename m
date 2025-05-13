Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40CBC3ABC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 22:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF9C10E5FC;
	Tue, 13 May 2025 22:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzKfB1/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE42F10E5FA
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 22:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747176322; x=1778712322;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u1KdSs48l+59VD5yANJXS5Pi1cRV60ltnoxY6VU24+I=;
 b=gzKfB1/goN/RVNM3Y2Pw8sI4q1sxY2rSYO3KQQhUnbXRDXFq4o8jzTAr
 fFH7WSDlhWLZOh3+crgqmadZRrqBXziLVfNxhBqV1+2obV74w+P0pzm4A
 ZA+aJ6EOSiirCcVCgdlhfMbde9M8a5Ei/rrB2Tf3bLn95d83CKwFg7Q+S
 G4S9xZvm5uZujrhF5Jcg0ZJAmbqiDXx1H/3YW8hoAD6oMByCDegLQn9+K
 CZ3s7lNcDgeFDqKIBbuFWBSDkcbOv26sh/Y8v679wxhUvJKNI/c27CDTN
 iy4uvYHdAuzu+HI08lTy3Ij2pryKo+WHFg+hjBWgWKSBjlxK2Zvo3FoB2 Q==;
X-CSE-ConnectionGUID: Ya4gpRnyQFypOTuoT3YbCg==
X-CSE-MsgGUID: QokCgUFgQUCfJXNiu5aSSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52860014"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="52860014"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 15:45:20 -0700
X-CSE-ConnectionGUID: 2m+Mr5deRGW5toj4IM6ypA==
X-CSE-MsgGUID: 0+QNUZsRRr2BQt7bjABwFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="138771494"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 15:45:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 15:45:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 15:45:20 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 15:45:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8GCgCXBzDIO0Jo+tAAAcmZMlA+tzizbwyGRgOkSQu3mET8EbsJWQSfB4V8HYPcT1+PhreJ+hscshmZIhR4e+Mp44DZCZ8uy0PqvzJF+AqLMof0zPXMBnmT+tg8kmrjm9sh2oUbJqi39REMrtf8kmTU5rw3k5AfGuhDUNjl4CQQDpRTv2TjOnVQJAeRnsShfnGOH8AgAv+bbrBM/qUQvGt4n13BtYTjD3C589rjfpWeVzwgQCcBDUwZlyr2wemocWP87SSCqlDzwr6yLidi0LPn8o4rsNpiFxlmMG0DbRCz8WgdCeyloHPjvUfM63aZ+uqAZ0N4WelOAVYrSQ5CiXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SF2SUtxh9XIAU+z6pX3eXPW7fTaVQFmbWGjlweSP3U8=;
 b=UUY96RG1m0aCL9+somaaSNapc9OPkOHWwa1HAh5WBzNWYbzaq5qlhK0YHG4uB5cnPUk5DojIOOl8zZE757G51o+Q9dNea9AXZVZdL9ESRk7+GGUsMbaKdSHMEQ3vjKhFfbCkP70OM0m7YTG+7Nb6BhwfTyk73eFz0yW4HAHM64OvSl88kxgPUoJkjaG/9UerEeAPmd2G4/MdopFHsDmwEu9ld0aX9xp1b6/EZj368YKt0CwmXfZgiO2C78eRGoJShXD9HmZLgNBayL3+FaLv1/06rp0usAkPMSdRARUfy4OmjCAwRgIjSHgKJeboqKkd8VlsP8FvVUzmqdR6ektLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB7951.namprd11.prod.outlook.com (2603:10b6:8:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 22:44:45 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 22:44:45 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate
 preftch of svm with single and multi ranges
Thread-Topic: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate
 preftch of svm with single and multi ranges
Thread-Index: AQHbxCmME8NucmN9QUe7VHszvrdL1rPRHUhw
Date: Tue, 13 May 2025 22:44:44 +0000
Message-ID: <CH0PR11MB5444F3A4DA3A27D0AEDAA331E596A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
 <20250513170711.14518-3-sai.gowtham.ch@intel.com>
In-Reply-To: <20250513170711.14518-3-sai.gowtham.ch@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB7951:EE_
x-ms-office365-filtering-correlation-id: df087b3a-ae19-4102-55b0-08dd926fc1f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DE64P1Z0bp5ikwKBMOpPmiKD0l1E+ScIikgmvVILT70JtuJ2SCSDUewXFe6D?=
 =?us-ascii?Q?mx4OvIk3WNjSeMgyKHWa/J/9OgoFBkLi/H7CMd0UOtucP1kXyDxittHUF624?=
 =?us-ascii?Q?y6CuJ4AVx9lhrFh6Ktcr8vN8m8lOWtY1bu+VKp8t4XBaKTTymCnvfXIXmEku?=
 =?us-ascii?Q?O1ouJM2npyNpwueOVjEdHD0+e0Mnv+NM6jpeWH3fZ+5/RQ0KAOKBBn4HxaXZ?=
 =?us-ascii?Q?4BscVEw+SR4HssuodiqWKSncC3jSZOkUFecsKm0aO1ufp8FnOB026Vxdzacv?=
 =?us-ascii?Q?/xnU61kTS/UJcnnZzcCLT6Pdcj3YuykmFpzrQdvgPLgOWhpPuCEG/PCpCyXp?=
 =?us-ascii?Q?B0jjUHOugWomJJxH2wVoFwwmBs8DUYgQRtRsnLBIOanNpnYPaT+Dp55eQ9fa?=
 =?us-ascii?Q?x8FN2pxZaD97xODFSfzNFBu6hokdU/zTtxIRFWsM+rQx+bzmEcaTKpIcEq+f?=
 =?us-ascii?Q?QAuFOhcWE2EFCz1Gd5XKbOuKGkPl3m9WvMJQzSWNzI1Cu0vdpOKLbfHKKpFU?=
 =?us-ascii?Q?zEafPMrmRiENCygvmx78iAM7+dsxOsLn9Pu/IdUd72e4dJCyh/kiFGStbog1?=
 =?us-ascii?Q?aDVSzc5SgwJhv080iTdH7dYD7XsoHhDMDWe6PEvV0SGBtfE9/KywPsClDtp9?=
 =?us-ascii?Q?YBNSunjem1MA+6nxZlfQXTuFQ+tmgXNHA498BHySnAA0xY7FJWp+VUP2osWJ?=
 =?us-ascii?Q?riolXH1vM87tyLBakia1OZY7PogTFmbZWCmL/+HuP2c24GvPB0vquH7+/doy?=
 =?us-ascii?Q?nXfz1HefMzD6/04O0W4GVW8a/1FPmHv74yJDw3plTE0vfqTcyC4rrCXDwdtM?=
 =?us-ascii?Q?LDziuZZha1H1y+kyVnpGnMVq7PIBltmnOqFgah/+JfLMjP2/LeLCmvMbpo09?=
 =?us-ascii?Q?eld2f8SosqbPk1jqG3+uRdi0fYDwEgNGe7XsBhRr5xxA7hpBu5IiG6qzcB+V?=
 =?us-ascii?Q?0CYjzURpDmn+wXKemGEZeYN5Hh54usv+rjJtLV7JGPCl0hfxk2zhQXND6og7?=
 =?us-ascii?Q?ekRq81QIdREpOb/yVBK+w7yzvnc7dII0rDbU9MtHtnABIC1CJ2fmlgMiOVYe?=
 =?us-ascii?Q?DE7a/dBelVO6a0cHCZ9TgFkv8QGvAuQVWWAfdR4JnMYSOPSSw8pjvDsDp9dU?=
 =?us-ascii?Q?nPTtLS9xsV1SJQJkVmxlY+mUiZ3COpGhWtTrTElW3PfjGol1dVtd5AzX8QS+?=
 =?us-ascii?Q?hfbgGkA6Ym08hsNZgzj4Ehhz3jPq2aqtMZoytvvHHIXHpFeikoBQ8FK8YL1m?=
 =?us-ascii?Q?zarA80Oq/b33z3X8DjKwu+QGqFuTpnqiwGW11UeZOUZrl6sxuCU+qCZcJQJK?=
 =?us-ascii?Q?SBcRb6TRSDMt694dqoBklXguCsxNFVdeRHmHH2zhMCVkkL9VvE5jAY2Y0P5x?=
 =?us-ascii?Q?SODdBqcSPaPGgBDwsRO4WtjaxCYlOrhebBvCMtfY9bmbZBBwwQX1Ln/JYYD7?=
 =?us-ascii?Q?JCnE+8DGJDnSdApSzhnN6sTotfzCb0USjjV1HMc2/Wu1fwlrBrU0nOW33KRW?=
 =?us-ascii?Q?Rd1ERn/TPbEcjjg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sKikMZOkpq72Ysjk2svju1vMZsd4/TaEQZlfHIyOdi0xNVjuWrb3UEhqOw0h?=
 =?us-ascii?Q?gE+4H2gfVOhMthlezLlEHku4JJPAGwXaBvmPk385YXzZOBoRBhMSnNHb/v7e?=
 =?us-ascii?Q?QKFCQ2QiBPjvDz4rV4EVQqCG3D0In6VB9UIWXxDjtQxU6wN8N9+hvE5Lpe2M?=
 =?us-ascii?Q?E6BLLDXRkgs+SekY5Q4y8PfHjoKZosWCwSScwUat7cMnq/yOBE8hmq8c9Cnk?=
 =?us-ascii?Q?2+aMPJbrxOJJOQI+CMMl/fwUxDzjV5x+rvpGCnffYjN4mAE8ZHzcGFGTLd1f?=
 =?us-ascii?Q?xolMzEGIH8V+3VpwrZ+nq44O+ERkqqRCIVeAaoKSBUozj8j/Qn+aRiklqT6c?=
 =?us-ascii?Q?i59eylnxzrHgF8ZCQweR1jphCsweesPJF/ej/XxlpOYpL/5WUx9CHLCUrnsB?=
 =?us-ascii?Q?ej/kBKCVfckdvCsT9qikrmyRSGkQCG/U/d7oiIp62hRUh4MLXIcvpl4YTSrs?=
 =?us-ascii?Q?eQJ5QLKymDKZQKQ7Za78yPcdTs4HXc30wrQMfulVCtarU/hISkMegQbhQM5R?=
 =?us-ascii?Q?varX06mwuKiVywAQO40Crui1NzQ+sKF8m6N8oG03m5LXh/m7pMs0fgoQYcFC?=
 =?us-ascii?Q?mvKQmQNie95j6byp/5+XxiJ02IZ233MGezYSwKyFZ0E281yxHqhzxYuIKwlu?=
 =?us-ascii?Q?lEUEA82RPz4M6ApIKD9jQSA5SDsHDY/ysNFp5uqwgDOPKsKYuaFb8GC/9Es4?=
 =?us-ascii?Q?ZiYAetRSf+FU6etfWWl8CfaVWcHttYU8Ghu7GZ7ZsR7SoBQuIMq+Ic8Ozcvr?=
 =?us-ascii?Q?Mn43eQXy4DSuI7oLVV56BNQODjdFz+nC1X6KqLbPb+4Y5tjXttsuTIFPmBGT?=
 =?us-ascii?Q?lFQkwtRXELnu73yFkHQzviidp+EmE7mEMheIx6z5LV/ZQN8+mV6yFV9xWut4?=
 =?us-ascii?Q?1kMM/3QKIPnh4uwrPqJsOcR6kluHkFpqX+tNQbKW/EBpAoMOkfNA1e17JSEZ?=
 =?us-ascii?Q?8sbJkLaH0bckT08awo/01K8xuU/eqLHi7ykA17nQISCjjBMTs2aKQEoq8i/t?=
 =?us-ascii?Q?H4b7FIrFg59wqthTW/KZCTB36IYRv8V0s8mJ1mzYT3XtBq6mIN7gGkfct7fD?=
 =?us-ascii?Q?NeQhyfnBi5s5LC+LU7zyXhcVvBUwgMGomDYomHwopho09XPJ7uiTUWmQRXek?=
 =?us-ascii?Q?OLaoqxLkFelAFWJ1Re3uD8UzC196bPjBzKhcSXmxEBXr68aJg+Kl0u0saJ1B?=
 =?us-ascii?Q?oWy8cdr7BDiiHAFPia6ELc9PHtAkdwJlwXOFNN2mvC2oOTuVA9TJ25P28Wmv?=
 =?us-ascii?Q?fWaHn3j8QkIAmO0eos/DLbFtESfwYSYdLX27UrjyOBYOR4CPbGHdJGYZpX4m?=
 =?us-ascii?Q?mJX01hIL/PpJoZ25FV3Ht4S4cdP8GqfYZli6u38w3r2Xp/GFPmm7GEOOYn9R?=
 =?us-ascii?Q?w2MIFUeQoDHyfvOdBRF/tQ3y+XCJIh7zQk4CdLIeedmvQfwqbaJApYyOd2+I?=
 =?us-ascii?Q?P6jW04FWORALq8djGaBIf37Z8dW1aUjToo/kCN9oJgw8tGXM8FTeA2odFmPX?=
 =?us-ascii?Q?v6kksQuukIpRNpelZXDunecDoXHB+VtAriRP7b+9vj/xP6kt02DjlOf8V8v5?=
 =?us-ascii?Q?oQHkmgwWO08jR1Wv0/lglIGggSjdx6I0Q+Ykp1Er?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df087b3a-ae19-4102-55b0-08dd926fc1f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 22:44:44.9570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 654c8vM5pL6fe3FwdKrUccTG41BYPgEcrOlfQqg/lGXA7sHWSi4Q6OUiP7YE2sSku4MJIIWvE7vLkCGKbkgO3zTWvT8jKTxwB56nmY6wCf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7951
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of sai.gowt=
ham.ch@intel.com
Sent: Tuesday, May 13, 2025 10:07 AM
To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham <sai.gowtham.ch@intel.co=
m>; Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthe=
w <matthew.brost@intel.com>
Subject: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate preftch=
 of svm with single and multi ranges
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Tests validates Prefetch of SVM with single range and multiple ranges, wi=
th different
> range of sizes. checks if not svm pagefaults are seen while prefetching t=
he ranges of
> svm.
>=20
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 126 +++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec=
_system_allocator.c
> index ba11ed834..c3f0e61f3 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -20,6 +20,7 @@
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
> +#include "xe/xe_gt.c"
> =20
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -139,6 +140,7 @@ static void signal_pdata(struct process_data *pdata)
>  #define CPU_FAULT_THREADS	(0x1 << 2)
>  #define CPU_FAULT_PROCESS	(0x1 << 3)
>  #define CPU_FAULT_SAME_PAGE	(0x1 << 4)
> +#define VRAM            	(0x1 << 5)
> =20
>  static void process_check(void *ptr, uint64_t alloc_size, uint64_t strid=
e,
>  			  unsigned int flags)
> @@ -464,6 +466,106 @@ static void test_basic(int fd, struct drm_xe_engine=
_class_instance *eci,
>  	xe_exec_queue_destroy(fd, exec_queues);
>  	xe_vm_destroy(fd, vm);
>  }
> +
> +/**
> + * SUBTEST: prefetch-smem-%s
> + * Description: Test to validate functionality of Prefetch using SVM of =
size arg[1] at smem region
> + * Test category: functionality test
> + *
> + * SUBTEST: prefetch-vram-%s
> + * Description: Test to validate functionality of Prefetch using SVM of =
size arg[1] at vram region
> + * Test category: functionality test
> + *
> + * SUBTEST: multi-range-smem-%s
> + * Description: Prefetch of mutliple ranges within arg[1] size to valida=
te multiple ranges are created
> + * Test category: functionality test
> + *
> + * SUBTEST: multi-range-vram-%s
> + * Description: Prefetch of mutliple ranges within arg[1] size and check=
 if multiple ranges are created
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @SZ_4K: SZ_4K
> + * @SZ_64K: SZ_64K
> + * @SZ_2M: SZ_2M
> + */
> +#define MAX_BATCH_DWORDS 16
> +static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
> +		     size_t bo_size, unsigned int flags, int num_dwords)
> +{
> +	struct batch_data *data;
> +	uint64_t target_addr;
> +	uint64_t addr;
> +	u64 *exec_ufence =3D NULL;
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D DRM_XE_SYNC_FLAG_S=
IGNAL,
> +		  .timeline_value =3D USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(sync),
> +	};
> +	size_t slice_size =3D bo_size;
> +	uint64_t batch_addr;
> +	uint32_t exec_queues, expected, vm, *result_ptr, *batch;
> +	size_t aligned_size =3D bo_size ?: xe_get_default_alignment(fd);
> +	const char *stat =3D "svm_pagefault_count";
> +	int b, svm_pf_count_pre, svm_pf_count_pos;
> +
> +	bo_size =3D bo_size * num_dwords;
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREAT=
E_FLAG_FAULT_MODE, 0);
> +	data =3D aligned_alloc(aligned_size, bo_size);
> +	memset(data, 0, bo_size);
> +	addr =3D to_user_pointer(data);
> +
> +	exec_queues =3D xe_exec_queue_create(fd, vm, eci, 0);
> +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> +	bind_system_allocator(sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC)=
;
> +	data[0].vm_sync =3D 0;
> +	exec_ufence =3D mmap(NULL, SZ_4K, PROT_READ |
> +				 PROT_WRITE, MAP_SHARED |
> +				 MAP_ANONYMOUS, -1, 0);
> +	igt_assert(exec_ufence !=3D MAP_FAILED);
> +	memset(exec_ufence, 0, SZ_4K);
> +
> +	for (int i =3D 0; i < num_dwords; i++) {
> +		batch =3D (uint32_t *)((uint8_t *)data + i * slice_size);
> +		target_addr =3D addr + i * slice_size + 0x100;
> +		b =3D 0;
> +
> +		igt_assert(b + 5 <=3D MAX_BATCH_DWORDS);
> +		write_dword(batch, target_addr, 0xDEADBEEF + i, &b);
> +	}
> +	sync[0].addr =3D to_user_pointer(exec_ufence);
> +	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM=
 ? 1 : 0);
> +	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +	exec.exec_queue_id =3D exec_queues;
> +
> +	for (int i =3D 0; i < num_dwords; i++) {
> +		result_ptr =3D (uint32_t *)((uint8_t *)data + i * slice_size + 0x100);
> +		expected =3D 0xDEADBEEF + i;
> +
> +		svm_pf_count_pre =3D xe_gt_stats_get_count(fd, eci->gt_id, stat);
> +		batch_addr =3D addr + i * slice_size;
> +		exec.address =3D batch_addr;
> +		exec_ufence[0] =3D 0;
> +		sync[0].addr =3D to_user_pointer(exec_ufence);
> +		xe_exec(fd, &exec);
> +		svm_pf_count_pos =3D xe_gt_stats_get_count(fd, eci->gt_id, stat);
> +		igt_assert(svm_pf_count_pre =3D=3D svm_pf_count_pos);
> +		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, exec_queues, NSEC_PE=
R_SEC);
> +		exec_ufence[0] =3D 0;
> +		igt_assert_eq(*result_ptr, expected);
> +	}
> +	xe_exec_queue_destroy(fd, exec_queues);
> +	unbind_system_allocator();
> +	munmap(data, bo_size);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: unaligned-alloc
>   * Description: allocate unaligned sizes of memory
> @@ -1658,6 +1760,16 @@ igt_main
>  {
>  	struct drm_xe_engine *engine;
>  	struct drm_xe_engine_class_instance *hwe;
> +	const struct mode {
> +		const char *name;
> +		size_t size;
> +	} mode[] =3D {
> +		{ "SZ_4K", SZ_4K},
> +		{ "SZ_64K", SZ_64K},
> +		{ "SZ_2M", SZ_2M},

You should also save the smem/vram flags up here as well.  Something like:

"""
	const struct mode {
		const char *name;
		unsigned int flags;
		size_t size;
	} mode[] =3D {
		{"smem-SZ_4K", 0, SZ_4K},
		{"smem-SZ_64K", 0, SZ_64K},
		{"smem-SZ_2M", 0, SZ_2M},
		{"vram-SZ_4K", VRAM, SZ_4K},
		{"vram-SZ_64K", VRAM, SZ_64K},
		{"vram-SZ_2M", VRAM, SZ_2M},
		{ NULL },
	};
"""

Then, below, you'd only need:

"""
	for (m =3D mode; m->name; m++) {
		igt_subtest_f("prefetch-%s", m->name)
			prefetch(fd, &engine->instance, m->size, m->flags, 1);

		igt_subtest_f("multi-range-%s", m->name)
			prefetch(fd, &engine->instance, m->size, m->flags, 10);
	}
"""
Of course, you'd also have to fix the kernel docs above if you took this ro=
ute.

You could also maybe consider saving the num_dwords value as well, but that=
's probably
overkill.
-Jonathan Cavitt
	=09
> +		{},
> +	}, *m;
> +
>  	const struct section sections[] =3D {
>  		{ "malloc", 0 },
>  		{ "malloc-multi-fault", MULTI_FAULT },
> @@ -1931,6 +2043,20 @@ igt_main
>  			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
>  	}
> =20
> +	for (m =3D mode; m->name; m++) {
> +                igt_subtest_f("prefetch-smem-%s", m->name)
> +                        prefetch(fd, &engine->instance, m->size, 0, 1);
> +
> +                igt_subtest_f("prefetch-vram-%s", m->name)
> +                        prefetch(fd, &engine->instance, m->size, VRAM, 1=
);
> +
> +                igt_subtest_f("multi-range-smem-%s", m->name)
> +                        prefetch(fd, &engine->instance, m->size, 0, 10);
> +
> +                igt_subtest_f("multi-range-vram-%s", m->name)
> +                        prefetch(fd, &engine->instance, m->size, VRAM, 1=
0);
> +        }
> +
>  	igt_fixture {
>  		xe_device_put(fd);
>  		drm_close_driver(fd);
> --=20
> 2.34.1
>=20
>=20
