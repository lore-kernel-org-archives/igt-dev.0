Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC19CF2576
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 10:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444F510E138;
	Mon, 14 Oct 2024 10:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CL3QfKqV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3448610E138
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 10:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728902335; x=1760438335;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M24VX8fJ3b8x1BVwbGYzwQ7b200El/tnQSebndWpnfc=;
 b=CL3QfKqVZDp7AksV6HvvFkoQY/p/lB6zpp286DSpBOhhuOKOS3mytVsM
 +9R2j79TL/s/JgeJXrvNijLocCaywye1IXxy4moInZwTQGPRkcgAoWcMp
 0L7hw4HFkBh+A3NU6qU1FmbrlQlPk8OIW8E/KoLIZkSvEb8NDIy7wzhmA
 TMvdiDZ9FkYSpJeP3gnXVOJ0BW+CzesBPOV6ddFnzBs0hdv5nsINiwgsb
 XyPfGLKG1dqG7ZTszwQScpQYwcv/0JwGkbZVioyHHaxPSd5vQ3v5xCpk+
 VDpN7ZXIcUBwvLnYJBf/yss9Y7s0ISeijSFb9YNYLUqAr4rwjCzP+/yvH A==;
X-CSE-ConnectionGUID: Hur9tBZtSu+4vAiMQFYhKA==
X-CSE-MsgGUID: rrloGdAVQ2yvWxCCyNkfTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31939166"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31939166"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 03:38:52 -0700
X-CSE-ConnectionGUID: j8uUJR6wQg+mzKFfQ/BCzg==
X-CSE-MsgGUID: 87Hy6sXMSBifZoaGKzyT7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="82311495"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 03:38:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 03:38:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 03:38:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 03:38:50 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 03:38:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaqiU4klIeNUI87ut1LCGmmb8NEIrjbFd8t2d4jP3icAcZG7929LvpLBcGrl9iNVmoMqPtnBo2J3hVR1tAFD3TBkqh8NDFx8r8Rf/RpH8bQ254IkJ1fbbx03K5AQ+tAapAPQ0EN5HsK1A63G+/2loycEfTZw9uFkMErUYi9HobewXe27Dtj7aPBAhPRahJhYw0cy2h2on34P5RflWTwqHskHEgX3L+rw19XXnaxb8zGZpFAat9eLGH6AvWMRCl3STVUKz9lAp9JbnkOUeEkfhGSrYSE5eeIQEXY0MbUdzcUdgS72DHkgCMiBwztQwzcsHBUZRc6ZvA8w6SCR8kJwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKY56G+yJO7uYctXwT+XH6M+ZrO+Ei/amUUGGnqqGEg=;
 b=UOz67fCB3pXQoQhhO+EnL/hMzCA5C3PgJtHu9igQbh/t2qz465N5cXtvOl9fWFLPV04QrPDUGZzbBY7oUXpfU1ejIybZi8MMB5IcYUfXYWx8iykS9WIS0zv216CJHq8lPeyH3oK+IO7tT5oS3AL6GNSb4htSY5K6bnIIpyKKFw2uNhSRlMvUM60K20WbLIPfcBoShchped4F9E+LsZJNmhh6tbTs3Y5hSWAD7BZ4zee5+j02btT94ysSF2FftPCeoHAOZb+5E8tXIQ0ucCcRUjZD1T7VDEleej16EHFOzakmeWTJUgvHh/vYUzVVdSZXnhH6vFk4Wf9zmXp2gZVt2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DS0PR11MB8231.namprd11.prod.outlook.com (2603:10b6:8:15c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 10:38:46 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%5]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 10:38:46 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Poosa, Karthik" <karthik.poosa@intel.com>
Subject: RE: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an
 assertion on MI_STORE execution time"
Thread-Topic: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an
 assertion on MI_STORE execution time"
Thread-Index: AQHbGNsi1gRAhPQv1EqKYxWp4XzyK7J7i7qAgAqMHsA=
Date: Mon, 14 Oct 2024 10:38:46 +0000
Message-ID: <CY5PR11MB6211C6A7FE14B0F40413EC7C95442@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
 <BL1PR11MB5445C79B8D45726D24EB743EE57D2@BL1PR11MB5445.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5445C79B8D45726D24EB743EE57D2@BL1PR11MB5445.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: matthew.brost@intel.com,rodrigo.vivi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DS0PR11MB8231:EE_
x-ms-office365-filtering-correlation-id: 37928843-aae2-4275-795f-08dcec3c61ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?QKVzi5As8HcX/kwcXCfk35+D8NbNIZBSu3CHEd4cZdEp+KDMTRJm+BKVqOHx?=
 =?us-ascii?Q?Ozt8QrNRxajHdvvmORqCuidxHq5mvmlgU0XdE/dKFVkmBcEoLCv8aE3+X+0Q?=
 =?us-ascii?Q?tYVoSoh2BeP/u5fjOcOgTyMfB1IZ9fDPIfAW2ddgmw+b5ixZx57RcdKiyln2?=
 =?us-ascii?Q?oakY7MqAHFjPCZuOeKCjFuFJ3i7sDbosOHmwK6nXXLqFh0tNMmKkYZf58DaU?=
 =?us-ascii?Q?T6NUd7C4FoTQCcSis0k/FA5qGZMKSWTrxcXrS3aV9hNKWHOz7KGUqgneLcXL?=
 =?us-ascii?Q?WXXZetKRC7C2zV2hANQGYIDz7lTHFh1B395EdSqE98I4m/pUYqeQCs4DEB7S?=
 =?us-ascii?Q?pkOE4Y5bFO8ZkTvPnmHsjhaCnsf7/+WzQIYPxMuWTc9LT7vnwjxBe7BOPIQH?=
 =?us-ascii?Q?+5ZNCFGbw6M2gVfXSPNHWcaIFT8gL3bmgfBb/m0cn0QAdc9vZ0U7+TCUTTda?=
 =?us-ascii?Q?QOXwqYXzHDjJG+q8mO8gdYd+3qoOMSio/exiiIuxdc2InQUZ/Sp0O1WMqlPK?=
 =?us-ascii?Q?CSERXISAGmT0CJKzZSynLOAHhoq+GzbywJ7T612j04yS+XSIqOw5aqFr3Mit?=
 =?us-ascii?Q?Bg5K0jzXZD8Y1C0Ioo3CDfPDzyCTHkTFeQ0dm6h6QwfbCPwPQby/pjFPohjF?=
 =?us-ascii?Q?XnWawVmJGAHEPC022dIguyeQuFbr1L0pSZutmB2hFlv+tmCOEjjMvVMSDM5Z?=
 =?us-ascii?Q?a8Ao/SR5sGQoOfQvjsyvm4R6LkiwN6O3ah7KXsx1s0IGxDoJ6V7YkYquGWqI?=
 =?us-ascii?Q?Hkxl1CVXWCudV1oJvie4+DjSo2njkI2ZOYEcdh4ZeuWe/SuVGFERDQ4aKGcV?=
 =?us-ascii?Q?owDKJNAhh99tlzVpoqKi/2tIr0KzAkWXZGYDUtftviVSM8ql3eP3eeRCgQwx?=
 =?us-ascii?Q?8HyW57PFIHEgyJL1HBwGfv64QEV/cprE2dQPVMDE3hovIX6h5n1ELixtmx1f?=
 =?us-ascii?Q?VzKLoOjAM/3HuHbgCoEM6MeDHEIWY8ajV0fSW1ifp5/UySXK5dfYUibBOeHJ?=
 =?us-ascii?Q?LtcJW+MkYgs9Aey1lW8pomqGeVP3qxm88GRGaingVS9BbVwmSfmLxPNj5hBK?=
 =?us-ascii?Q?rQGGUJ5/WRyqJHuVop3sdtdoINnbGS5BsNYzfZz/0l9zfYarBnovEE544icl?=
 =?us-ascii?Q?ryawR2h/IsIvyI7sKCk9WT/P+R/uExmZZTk2NGrIQU+k8PlOeHwDR+ztcWkR?=
 =?us-ascii?Q?ehM5A8raYg6dzwhFVSYpvCWb/WJ+w5hLL7JLq963cjZEdOagc4rN0ysoeZDF?=
 =?us-ascii?Q?e8AkLVIijJ32y4qEY3N7qzg8wjELYCYFbOWoj5eUk7CKCLxzFeSNCCC9rT6z?=
 =?us-ascii?Q?bpGJyRqwZc9gTfA6oJV3EKuskgrUN36vODFWiIyfLrXUwg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/9+vspZSEI/WUZQl5smmmtSecr7vf4AAO2PfTf0nxh6TsC5mKLzjPcsytcU6?=
 =?us-ascii?Q?CO320n3WoiuG1aSmF2qCI7jOS7cUpZkKkv/B/yyFfZIcM8XjnXJWJ4s7nXLN?=
 =?us-ascii?Q?8J8HenDIsnIPLuPhb6TIhcNOaShwIbp5mUwcnkUIOiiGg5ieQIoUaFri4dIR?=
 =?us-ascii?Q?9KRdwb+cFpiNTD+y3+gHuLl/DruwIzpvSAI/jV2wrL3SFgRD+F0E7A0szNUd?=
 =?us-ascii?Q?nPyX/rZv3ZNHEpPVEcgfmxl3mAsk64f+6M1PPN6OL4LfjoP2X0Xrmdp4ZnOV?=
 =?us-ascii?Q?LsY0fPyE6SgOJ58ktC6GieBX43zHzY+IyKBwzTMW3kyzEqbLDjAUsqTwDBY5?=
 =?us-ascii?Q?DbgKAW6bit7lvTE14yFPhpPAy39CeKbXa797idnXM9hykZ4a8ksMKHEiLSz0?=
 =?us-ascii?Q?g39JG8E20wWJvLzrrjbu+4lTUzkBSASUDGyAqr+NuXpGMymCK23aTMv8nfAU?=
 =?us-ascii?Q?fXDrAQwAF5UltVUTvhNBnc1Fo0LgOAk2riMXEYxNfWmXCLi+PV/Qu07k6Eoa?=
 =?us-ascii?Q?mV8D6rt43fklBng6FUtkw212gPCFWcV6AxSjaiwIZQqLNr40vR0rIxGhX3N3?=
 =?us-ascii?Q?4wNi1qpULQklbuEjrk9dlL2ivricN0ciR5QYfUmv8hBbN+mZafPRX5EDZ/Lc?=
 =?us-ascii?Q?nKFYLv7WTIE/beEEazilTP2oohETnZBINGzRGrNOGGcs9vlxGkex6MKwTbyc?=
 =?us-ascii?Q?Gk3pMIdwgEC8tMqlGQA4a8ehv6ZAWxA8i52JTHC++/X6Psw/Y2m4M5WvsRfp?=
 =?us-ascii?Q?XssofaSz4KQupjrum6zCTyEORa62Or2KobjtzB6TZt6axOAF1/+zV34J5ldL?=
 =?us-ascii?Q?tjGNvWb03MsirpboGXyY563gkz55WGqmU1S3rM41w6iAoSwJdcI9bvP/eZz7?=
 =?us-ascii?Q?Xk5nadE6jbPjIXX4GidUvwHY8gW5QRUNqFcCwr+sBYcDWfmcEJkwpqmmVLoX?=
 =?us-ascii?Q?1iKG5epkP+UvslmfWQwWBqJCyXqUdr5GlzPabc1ha1H9kxXE/LTPZS9y5lPB?=
 =?us-ascii?Q?LyB6mEyhI7V4JYEwmzP1V9szjzYzrGG0K0CCA/mdzHQEzPs7Sd0rQWZzLFrq?=
 =?us-ascii?Q?umd/K+2JgfurOEzQAC3gx1u+1h2cd3kdA04Fgjqq8OXDWlw787PmA2KYIv26?=
 =?us-ascii?Q?2IQtJaZY5t2SsFKeG+De39bTUD8DEUOvnSNoIiJ9hTPNrVWC8x3IEkrlJ3MO?=
 =?us-ascii?Q?9j2xH3UkFEZy2/guWybS6ZM8XUPwkn+WqJsr34PcrYxId+uMq0daeYNV/Wx1?=
 =?us-ascii?Q?tRfCwxNeKYNyhAGTpLKNYKmXz+G8n1bjgbSVJc1C/UOdw0eReNTcJ/J443Z+?=
 =?us-ascii?Q?dHPI2CLyV5pkSnfyG2XKRRXepl+ZDCVNfrmOCx4nR3xZ5OLZWT7XXDZH5fwu?=
 =?us-ascii?Q?1IjnoLQ4Y/UrzCrIkNIl05fjh+CR3HeXVmKF2m4QE6d26xhJfPyQn8eNIk45?=
 =?us-ascii?Q?TGOK7v+nJsZvTxvrJWSqFQ3YLDDtFw/cuZdoS3yyY8dwpesh5M1wLp/gcGX2?=
 =?us-ascii?Q?HCyVn1PJBYEmyRVhDtyTU6+lHVntb8mkpaAoIrL3cXtxHqffvwE/xwfrA8Ka?=
 =?us-ascii?Q?aEAlpcvhi787a1qVR2BoXugw0wgFncuNvwtTnXlA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37928843-aae2-4275-795f-08dcec3c61ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 10:38:46.4744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uiKc/7MPideaRji0ipfZRTBoxcMEVNnvHXt8iPR9ZvdyvXDK2or68HbUDorFuCXEBoHKoPQSvwmD9BaW2QfnwfrVeWemLI6R/TcH2OFbVJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8231
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
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Monday, October 7, 2024 11:01 PM
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Gupta,
> Anshuman <anshuman.gupta@intel.com>; Poosa, Karthik
> <karthik.poosa@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Subject: RE: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add a=
n
> assertion on MI_STORE execution time"
>=20
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Himal
> Prasad Ghimiray
> Sent: Monday, October 7, 2024 10:24 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Gupta,
> Anshuman <anshuman.gupta@intel.com>; Poosa, Karthik
> <karthik.poosa@intel.com>
> Subject: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an as=
sertion
> on MI_STORE execution time"
> >
> > The reported time does not reflect the completion time of
> > MI_STORE_DWORD; instead, it accounts for the delay in the scheduler.
> > Therefore, it represents the time taken between xe_exec and
> > syncobj_wait.
But above doesn't justify removal of assertion.
We can increase the assertion time here but it is not advisable to remove t=
he assertion here.

CC: @Vivi, Rodrigo
CC: @Brost, Matthew

What you opinion here igt_assert on time taken by xe_exec and syncobj_wait =
?

Thanks,
Anshuman Gupta

> >
> > This reverts commit 92825ed72be61c5419d95db944fef1c9dda2215a.
> >
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Badal Nilawar <badal.nilawar@intel.com>
> > Cc: Riana Tauro <riana.tauro@intel.com>
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > Cc: Karthik Poosa <karthik.poosa@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>=20
> Seems good.
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> -Jonathan Cavitt
>=20
> > ---
> >  tests/intel/xe_pm_residency.c | 9 ---------
> >  1 file changed, 9 deletions(-)
> >
> > diff --git a/tests/intel/xe_pm_residency.c
> > b/tests/intel/xe_pm_residency.c index 772fe9b57..f4d05889c 100644
> > --- a/tests/intel/xe_pm_residency.c
> > +++ b/tests/intel/xe_pm_residency.c
> > @@ -144,15 +144,6 @@ static void exec_load(int fd, struct
> drm_xe_engine_class_instance *hwe, unsigned
> >  			  1e-3 * submit,
> >  			  1e-3 * (elapsed - submit));
> >
> > -		/*
> > -		 * MI_STORE_DWORD generally completes within couple of
> ms.
> > -		 * Assert if it takes more than 1.2 seconds, as it will cause
> > -		 * IGT test to timeout due to sleep of 120 seconds which is
> > -		 * the current per test timeout. Currently there is no way to
> > -		 * read this timeout from IGT test.
> > -		 */
> > -		igt_assert((uint64_t)elapsed < (uint64_t)(1.2 *
> NSEC_PER_SEC));
> > -
> >  		syncobj_reset(fd, &syncobj, 1);
> >
> >  		/*
> > --
> > 2.34.1
> >
> >
